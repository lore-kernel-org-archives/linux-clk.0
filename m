Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.74]:54846 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755517AbcAIU53 (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Sat, 9 Jan 2016 15:57:29 -0500
From: Arnd Bergmann <arnd@arndb.de>
To: kernel@martin.sperl.org
Cc: Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>,
	Eric Anholt <eric@anholt.net>,
	Russell King <linux@arm.linux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Remi Pommarel <repk@triplefau.lt>, devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Reichl <hias@horus.com>,
	lFlorian Meier <florian.meier@koalo.de>
Subject: Re: [PATCH 2/5] clk: bcm2835: enable management of PCM clock
Date: Sat, 09 Jan 2016 21:56:39 +0100
Message-ID: <4332640.jBKM55TPAo@wuerfel>
In-Reply-To: <1452331558-2520-3-git-send-email-kernel@martin.sperl.org>
References: <1452331558-2520-1-git-send-email-kernel@martin.sperl.org> <1452331558-2520-3-git-send-email-kernel@martin.sperl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Saturday 09 January 2016 09:25:54 kernel@martin.sperl.org wrote:
> --- a/include/dt-bindings/clock/bcm2835.h
> +++ b/include/dt-bindings/clock/bcm2835.h
> @@ -44,5 +44,6 @@
>  #define BCM2835_CLOCK_EMMC             28
>  #define BCM2835_CLOCK_PERI_IMAGE       29
>  #define BCM2835_CLOCK_PWM              30
> +#define BCM2835_CLOCK_PCM              31
>  
> -#define BCM2835_CLOCK_COUNT            31
> +#define BCM2835_CLOCK_COUNT            32

The last line contains an incompatible change, please don't do that.
If you have to add another clock, do that after the BCM2835_CLOCK_COUNT
definition to avoid changing dts files that use that number.

	Arnd
