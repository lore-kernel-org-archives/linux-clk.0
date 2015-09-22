Return-Path: <linux-kernel-owner@vger.kernel.org>
Subject: Re: [PATCH 3/3] ARM: bcm2835: Add the auxiliary clocks to the device
 tree.
To: Eric Anholt <eric@anholt.net>
References: <1441923750-19404-1-git-send-email-eric@anholt.net>
 <1441923750-19404-4-git-send-email-eric@anholt.net>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Mike Turquette <mturquette@baylibre.com>,
	devicetree@vger.kernel.org
From: Stephen Warren <swarren@wwwdotorg.org>
Message-ID: <5600BAC3.70506@wwwdotorg.org>
Date: Mon, 21 Sep 2015 19:19:47 -0700
MIME-Version: 1.0
In-Reply-To: <1441923750-19404-4-git-send-email-eric@anholt.net>
Content-Type: text/plain; charset=windows-1252
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 09/10/2015 03:22 PM, Eric Anholt wrote:
> These will be used for enabling UART1, SPI1, and SPI2.

> diff --git a/arch/arm/boot/dts/bcm2835.dtsi b/arch/arm/boot/dts/bcm2835.dtsi

> +		aux_clocks: aux-clocks@0x7e215004 {
> +			compatible = "brcm,bcm2835-aux-clock";
> +			#clock-cells = <1>;
> +			reg = <0x7e215004 0x4>;

Actually, I take back the ack on this patch. This HW module has two
registers. The reg property should include both of those registers so
that if SW needs to start using the other register at some time in the
future, the entire set of registers is already represented in DT.
