Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:36199 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752528AbbGXPWx (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Fri, 24 Jul 2015 11:22:53 -0400
Date: Fri, 24 Jul 2015 16:22:47 +0100
From: Lee Jones <lee@kernel.org>
To: Eric Anholt <eric@anholt.net>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Stephen Warren <swarren@wwwdotorg.org>,
	linux-clk@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>,
	Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v4 4/8] ARM: bcm2835: Drop never-used clock-frequency
 property of uart0.
Message-ID: <20150724152247.GN3436@x1>
References: <1437420787-32137-1-git-send-email-eric@anholt.net>
 <1437420787-32137-5-git-send-email-eric@anholt.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1437420787-32137-5-git-send-email-eric@anholt.net>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Mon, 20 Jul 2015, Eric Anholt wrote:

> This appears to have been copy-and-paste from another serial driver's
> DT.  The driver has never used this value -- instead, the pl011 driver
> is getting the fixed 20201000.uart clock from clk-bcm2835.c.
> 
> Signed-off-by: Eric Anholt <eric@anholt.net>
> Acked-by: Stephen Warren <swarren@wwwdotorg.org>
> ---
>  arch/arm/boot/dts/bcm2835.dtsi | 1 -
>  1 file changed, 1 deletion(-)

For my own reference:
 Acked-by: Lee Jones <lee@kernel.org>

> diff --git a/arch/arm/boot/dts/bcm2835.dtsi b/arch/arm/boot/dts/bcm2835.dtsi
> index 301c73f..32f5830 100644
> --- a/arch/arm/boot/dts/bcm2835.dtsi
> +++ b/arch/arm/boot/dts/bcm2835.dtsi
> @@ -96,7 +96,6 @@
>  			compatible = "brcm,bcm2835-pl011", "arm,pl011", "arm,primecell";
>  			reg = <0x7e201000 0x1000>;
>  			interrupts = <2 25>;
> -			clock-frequency = <3000000>;
>  			arm,primecell-periphid = <0x00241011>;
>  		};
>  
