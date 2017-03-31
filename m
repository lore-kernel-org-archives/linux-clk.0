Return-Path: <huziji@marvell.com>
Subject: Re: [PATCH v7 00/13] mmc: Add support to Marvell Xenon SD Host
 Controller
To: Russell King - ARM Linux <linux@armlinux.org.uk>,
        Gregory CLEMENT
	<gregory.clement@free-electrons.com>
References: <cover.51071caa64e5df81264a91b9a81ed1e94f47d2c4.1490886907.git-series.gregory.clement@free-electrons.com>
 <20170330185639.GI7909@n2100.armlinux.org.uk>
CC: Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter
	<adrian.hunter@intel.com>, <linux-mmc@vger.kernel.org>,
        Jimmy Xu
	<zmxu@marvell.com>, Andrew Lunn <andrew@lunn.ch>,
        Mike Turquette
	<mturquette@baylibre.com>,
        Nadav Haklai <nadavh@marvell.com>, Victor Gu
	<xigu@marvell.com>,
        Doug Jones <dougj@marvell.com>, <linux-clk@vger.kernel.org>,
        Jisheng Zhang <jszhang@marvell.com>,
        Yehuda
 Yitschak <yehuday@marvell.com>,
        Marcin Wojtas <mw@semihalf.com>,
        Kostya
 Porotchkin <kostap@marvell.com>,
        Hanna Hawa <hannah@marvell.com>,
        Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>,
        <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>, Ryan
 Gao <ygao@marvell.com>,
        "Wei(SOCP) Liu" <liuw@marvell.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Thomas Petazzoni
	<thomas.petazzoni@free-electrons.com>,
        Stephen Boyd <sboyd@codeaurora.org>, <linux-kernel@vger.kernel.org>,
        Wilson Ding <dingwei@marvell.com>
From: Hu Ziji <huziji@marvell.com>
Message-ID: <8ebf11c8-f8e0-e4bb-ed70-f8c2e68aa787@marvell.com>
Date: Fri, 31 Mar 2017 10:09:58 +0800
MIME-Version: 1.0
In-Reply-To: <20170330185639.GI7909@n2100.armlinux.org.uk>
Content-Type: text/plain; charset="windows-1252"
List-ID: <linux-clk.vger.kernel.org>

Hi Russell,

On 2017/3/31 2:56, Russell King - ARM Linux wrote:
> ----------------------------------------------------------------------
> On Thu, Mar 30, 2017 at 05:22:52PM +0200, Gregory CLEMENT wrote:
>> - Remove parse of child node mmc-card. Wait for a better solution.
> 
> So for mcbin, I have:
> 
> &ap_sdhci0 {
>         bus-width = <8>;
>         marvell,xenon-emmc;
>         marvell,xenon-phy-type = "emmc 5.1 phy";
>         /*
>          * Not stable in HS modes - phy needs "more calibration", so add
>          * the "slow-mode" and disable SDR104, SDR50 and DDR50 modes.
>          */
>         marvell,xenon-phy-slow-mode;
>         no-1-8-v;
>         non-removable;
>         status = "okay";
>         vqmmc-supply = <&v_vddo_h>;
> 
>         #address-cells = <1>;
>         #size-cells = <0>;
>         mmccard: mmccard@0 {
>                 compatible = "mmc-card";
>                 reg = <0>;
>         };
> };
> 
> Does this mean the "mmccard" bit is no longer required - or is it required
> for the eMMC to be detected but is no longer supported by the driver?
> 

	Based on the implementation in this release, "mmccard" is no longer required.

	More details:
	eMMC Vqmmc in Xenon is fixed without a regulator. Thus 1.8V Signaling Enable bit
	in SDHC doesn't work.
	As a result, Xenon driver has to skip sdhci_start_signal_voltage_switch() to avoid
	checking 1.8V signaling enable bit when setting signaling voltage.

	Previously, we use "mmccard" to inform Xenon driver that it is an eMMC card
	and therefore sdhci_start_signal_voltage_switch() is skipped.

	Currently, Xenon driver directly checks if Vqmmc regulator is provided.
	Skip sdhci_start_signal_voltage_switch() if Vqmmc is fixed.
	In my own opinion, it is more direct and clear, than checking eMMC card type. 

	Thank you.

Best regards,
Hu Ziji

> Thanks.
> 
