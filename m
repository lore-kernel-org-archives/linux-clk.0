Return-Path: <sboyd@codeaurora.org>
Date: Tue, 5 Dec 2017 15:33:26 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Sriram Periyasamy <sriramx.periyasamy@intel.com>
Cc: ALSA ML <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.de>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Vinod Koul <vinod.koul@intel.com>,
	Patches Audio <patches.audio@intel.com>, mturquette@baylibre.com,
	linux-clk@vger.kernel.org, Harsha Priya <harshapriya.n@intel.com>
Subject: Re: [alsa-devel] [PATCH v4 4/7] ASoC: Intel: kbl: Enable mclk and
 ssp sclk early
Message-ID: <20171205233326.GD4283@codeaurora.org>
References: <1511352592-4006-1-git-send-email-sriramx.periyasamy@intel.com>
 <1511352592-4006-5-git-send-email-sriramx.periyasamy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1511352592-4006-5-git-send-email-sriramx.periyasamy@intel.com>
List-ID: <linux-clk.vger.kernel.org>

On 11/22, Sriram Periyasamy wrote:
> From: Harsha Priya <harshapriya.n@intel.com>
> 
> rt5663 needs mclk/sclk early to synchronize its internal clocks. Enable
> these clocks early.
> 
> Signed-off-by: Harsha Priya <harshapriya.n@intel.com>
> Signed-off-by: Subhransu S. Prusty <subhransu.s.prusty@intel.com>
> Signed-off-by: Sriram Periyasamy <sriramx.periyasamy@intel.com>
> ---
>  sound/soc/intel/boards/Kconfig               |   1 +
>  sound/soc/intel/boards/kbl_rt5663_max98927.c | 101 ++++++++++++++++++++++++++-
>  2 files changed, 101 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
> index 449bc8b..f62f2ab 100644
> --- a/sound/soc/intel/boards/Kconfig
> +++ b/sound/soc/intel/boards/Kconfig
> @@ -262,6 +262,7 @@ config SND_SOC_INTEL_KBL_RT5663_MAX98927_MACH
>  	select SND_SOC_MAX98927
>  	select SND_SOC_DMIC
>  	select SND_SOC_HDAC_HDMI
> +	select SND_SOC_INTEL_SKYLAKE_SSP_CLK
>  	help
>  	  This adds support for ASoC Onboard Codec I2S machine driver. This will
>  	  create an alsa sound card for RT5663 + MAX98927.
> diff --git a/sound/soc/intel/boards/kbl_rt5663_max98927.c b/sound/soc/intel/boards/kbl_rt5663_max98927.c
> index 6f9a8bc..409c321 100644
> --- a/sound/soc/intel/boards/kbl_rt5663_max98927.c
> +++ b/sound/soc/intel/boards/kbl_rt5663_max98927.c
> @@ -28,6 +28,9 @@
>  #include "../../codecs/rt5663.h"
>  #include "../../codecs/hdac_hdmi.h"
>  #include "../skylake/skl.h"
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/clkdev.h>
>  
>  #define KBL_REALTEK_CODEC_DAI "rt5663-aif"
>  #define KBL_MAXIM_CODEC_DAI "max98927-aif1"
> @@ -48,6 +51,8 @@ struct kbl_hdmi_pcm {
>  struct kbl_rt5663_private {
>  	struct snd_soc_jack kabylake_headset;
>  	struct list_head hdmi_pcm_list;
> +	struct clk *mclk;
> +	struct clk *sclk;
>  };
>  
>  enum {
> @@ -69,6 +74,67 @@ static const struct snd_kcontrol_new kabylake_controls[] = {
>  	SOC_DAPM_PIN_SWITCH("Right Spk"),
>  };
>  
> +static int platform_clock_control(struct snd_soc_dapm_widget *w,
> +			struct snd_kcontrol *k, int  event)
> +{
> +	struct snd_soc_dapm_context *dapm = w->dapm;
> +	struct snd_soc_card *card = dapm->card;
> +	struct kbl_rt5663_private *priv = snd_soc_card_get_drvdata(card);
> +	int ret = 0;
> +
> +	/*
> +	 * MCLK/SCLK need to be ON early for a successful synchronization of
> +	 * codec internal clock. And the clocks are turned off during
> +	 * POST_PMD after the stream is stopped.
> +	 */
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		if (__clk_is_enabled(priv->mclk))

Why do you need to use this in your consumer driver? Do you not
know if the clk is on at boot time and then you need to make sure
you don't call clk_set_rate() on an already enabled clk? If so,
why can't the provider driver for mclk take care of that and do
nothing if the clk is enabled already and clk_set_rate() is
called with the same rate as what's in the hardware?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
