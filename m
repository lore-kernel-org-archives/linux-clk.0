Return-Path: <sriramx.periyasamy@intel.com>
From: Sriram Periyasamy <sriramx.periyasamy@intel.com>
To: ALSA ML <alsa-devel@alsa-project.org>,
	Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Vinod Koul <vinod.koul@intel.com>,
	Patches Audio <patches.audio@intel.com>,
	mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-clk@vger.kernel.org,
	Sriram Periyasamy <sriramx.periyasamy@intel.com>
Subject: [alsa-devel] [PATCH v8 0/3] ASoC: Intel: Skylake: Add a clk driver to enable ssp clks early 
Date: Mon, 29 Jan 2018 21:45:57 +0530
Message-Id: <1517242560-22157-1-git-send-email-sriramx.periyasamy@intel.com>
List-ID: <linux-clk.vger.kernel.org>

Clock driver patches have been applied. These remaining patches are rebased
on "topic/intel". The first patch enables the mclk and ssp sclk early for
eve machine driver and the remaining two patches are effort to add more
meaning to the DSP replies for easy debugging.

Naveen M (1):
  ASoC: Intel: eve: Enable mclk and ssp sclk early

Subhransu S. Prusty (2):
  ASoC: Intel: Skylake: Make DSP replies more human readable
  ASoC: Intel: Skylake: Add FW reply for MCLK/SCLK IPC

 sound/soc/intel/boards/Kconfig                     |  1 +
 .../soc/intel/boards/kbl_rt5663_rt5514_max98927.c  | 94 ++++++++++++++++++++++
 sound/soc/intel/skylake/skl-sst-ipc.c              | 50 +++++++++---
 3 files changed, 134 insertions(+), 11 deletions(-)

-- 
2.7.4
