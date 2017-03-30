Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:38368 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934128AbdC3S5D (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Mar 2017 14:57:03 -0400
Date: Thu, 30 Mar 2017 19:56:39 +0100
From: Russell King - ARM Linux <linux@armlinux.org.uk>
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        linux-mmc@vger.kernel.org, Jimmy Xu <zmxu@marvell.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Mike Turquette <mturquette@baylibre.com>,
        Nadav Haklai <nadavh@marvell.com>,
        Ziji Hu <huziji@marvell.com>, Victor Gu <xigu@marvell.com>,
        Doug Jones <dougj@marvell.com>, linux-clk@vger.kernel.org,
        Jisheng Zhang <jszhang@marvell.com>,
        Yehuda Yitschak <yehuday@marvell.com>,
        Marcin Wojtas <mw@semihalf.com>,
        Kostya Porotchkin <kostap@marvell.com>,
        Hanna Hawa <hannah@marvell.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>, Ryan Gao <ygao@marvell.com>,
        "Wei(SOCP) Liu" <liuw@marvell.com>,
        linux-arm-kernel@lists.infradead.org,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-kernel@vger.kernel.org, Wilson Ding <dingwei@marvell.com>
Subject: Re: [PATCH v7 00/13] mmc: Add support to Marvell Xenon SD Host
 Controller
Message-ID: <20170330185639.GI7909@n2100.armlinux.org.uk>
References: <cover.51071caa64e5df81264a91b9a81ed1e94f47d2c4.1490886907.git-series.gregory.clement@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <cover.51071caa64e5df81264a91b9a81ed1e94f47d2c4.1490886907.git-series.gregory.clement@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, Mar 30, 2017 at 05:22:52PM +0200, Gregory CLEMENT wrote:
> - Remove parse of child node mmc-card. Wait for a better solution.

So for mcbin, I have:

&ap_sdhci0 {
        bus-width = <8>;
        marvell,xenon-emmc;
        marvell,xenon-phy-type = "emmc 5.1 phy";
        /*
         * Not stable in HS modes - phy needs "more calibration", so add
         * the "slow-mode" and disable SDR104, SDR50 and DDR50 modes.
         */
        marvell,xenon-phy-slow-mode;
        no-1-8-v;
        non-removable;
        status = "okay";
        vqmmc-supply = <&v_vddo_h>;

        #address-cells = <1>;
        #size-cells = <0>;
        mmccard: mmccard@0 {
                compatible = "mmc-card";
                reg = <0>;
        };
};

Does this mean the "mmccard" bit is no longer required - or is it required
for the eMMC to be detected but is no longer supported by the driver?

Thanks.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
