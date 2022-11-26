{ config, pkgs, lib, ... }:

let
  json = pkgs.formats.json { };
  pw_rnnoise_config = {
    "context.modules" = [{
      "name" = "libpipewire-module-filter-chain";
      "args" = {
        "node.description" = "Noise Canceling Source";
        "media.name" = "Noise Canceling Source";
        "filter.graph" = {
          "nodes" = [{
            "type" = "ladspa";
            "name" = "rnnoise";
            "plugin" = "${pkgs.rnnoise-plugin}/lib/ladspa/librnnoise_ladspa.so";
            "label" = "noise_suppressor_mono";
            "control" = { "VAD Threshold (%)" = 50; };
          }];
        };
        "capture.props" = {
          "node.name" = "capture.rnnoise_source";
          "node.passive" = true;
          audio.rate = 48000;
        };
        "playback.props" = {
          "node.name" = "rnnoise_source";
          "media.class" = "Audio/Source";
          audio.rate = 48000;
        };
      };
    }];
  };
in

{
  home.file.".config/pipewire/pipewire.conf.d/source-rnnoise.conf" = {
#    source = json.generate "source-rnnoise.conf" pw_rnnoise_config;
    target = ".config/pipewire/pipewire.conf.d/source-rnnoise.conf";

	source = ./rnnoise.conf;



  };

}
