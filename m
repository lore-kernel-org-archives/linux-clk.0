Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:58084 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750707AbbHOENd (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Sat, 15 Aug 2015 00:13:33 -0400
Message-ID: <55CEBC6B.9070001@wwwdotorg.org>
Date: Fri, 14 Aug 2015 22:13:31 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
To: Eric Anholt <eric@anholt.net>
CC: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Mike Turquette <mturquette@linaro.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 3/3] ARM: bcm2835: Add DT for the firmware clocks driver.
References: <1439507142-2965-1-git-send-email-eric@anholt.net> <1439507142-2965-4-git-send-email-eric@anholt.net>
In-Reply-To: <1439507142-2965-4-git-send-email-eric@anholt.net>
Content-Type: text/plain; charset=windows-1252
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 08/13/2015 05:05 PM, Eric Anholt wrote:
> Signed-off-by: Eric Anholt <eric@anholt.net>
> Acked-by: Lee Jones <lee@kernel.org>

A patch description might be nice, although admittedly the subject seems
clear enough.

> diff --git a/arch/arm/boot/dts/bcm2835-rpi.dtsi b/arch/arm/boot/dts/bcm2835-rpi.dtsi

> +		firmware_clocks: firmware-clocks {
> +			compatible = "raspberrypi,bcm2835-firmware-clocks";
> +			#clock-cells = <1>;
> +			raspberrypi,firmware = <&firmware>;
> +		};

No need to resend for this, but just a background note: DT node names
usually contain a device type not a device identity, so "clocks" not
"firmware-clocks" would be typical.

This patch,
Acked-by: Stephen Warren <swarren@wwwdotorg.org>
