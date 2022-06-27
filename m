Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4C01C43334
	for <linux-clk@archiver.kernel.org>; Mon, 27 Jun 2022 06:15:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232225AbiF0GPQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Jun 2022 02:15:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbiF0GPQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Jun 2022 02:15:16 -0400
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAB902AC2;
        Sun, 26 Jun 2022 23:15:12 -0700 (PDT)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <heiko@sntech.de>)
        id 1o5i1U-0002j6-S6; Mon, 27 Jun 2022 08:15:00 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Elaine Zhang <zhangqing@rock-chips.com>, kernel@collabora.com
Subject: Re: [PATCH 1/5] dt-binding: clock: Document rockchip,rk3588-cru bindings
Date:   Mon, 27 Jun 2022 08:14:56 +0200
Message-ID: <8081469.T7Z3S40VBb@diego>
In-Reply-To: <0841741a-22f6-40f6-c745-6065dfdbcb1d@linaro.org>
References: <20220623160329.239501-1-sebastian.reichel@collabora.com> <20220623160329.239501-2-sebastian.reichel@collabora.com> <0841741a-22f6-40f6-c745-6065dfdbcb1d@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Krzysztof,

Am Sonntag, 26. Juni 2022, 22:27:41 CEST schrieb Krzysztof Kozlowski:
> > +#define PLL_V0PLL			4
> > +#define PLL_AUPLL			5
> > +#define PLL_CPLL			6
> > +#define PLL_GPLL			7
> > +#define PLL_NPLL			8
> > +#define PLL_PPLL			9
> > +#define ARMCLK_L			10
> > +#define ARMCLK_B01			11
> > +#define ARMCLK_B23			12
> > +
> > +/* cru clocks */
> > +#define PCLK_BIGCORE0_ROOT		20
> 
> These are abstract IDs, not register offsets, so no holes, incremented
> by one.

I do believe Rockchip nowadays creates these automatically from soc design-
documents. I've looked up the thread in [0] as this seems to have started
with the rk3568.

So these are in fact not created as abstract IDs, but are part of the SoCs
manual.

[0] https://lore.kernel.org/all/b663994d-853b-4474-bd77-a444317bfffb@rock-chips.com/


> > +#define PCLK_BIGCORE0_PVTM		21
> > +#define PCLK_BIGCORE1_ROOT		22
> > +#define PCLK_BIGCORE1_PVTM		23

[...]

> > +
> > +#define CLK_NR_CLKS			(HCLK_SDIO_PRE + 1)
> > +
> > +/********Name=SOFTRST_CON01,Offset=0xA04********/
> > +#define SRST_A_TOP_BIU			19
> 
> What are all these? Bindings should not store register values or offsets.
> 
> Also, resets go to separate header.

I think the comments are misleading, these are not register offsets.

Which in turn is a set of registers SOFTRST_CON0, etc containing the
bits which to toggle to soft-reset individual blocks of the SoC.

The CRU (clock-and-reset-unit) always also contains the softreset block,
so they have always been part of the cru dt binding as well.


> > +#define SRST_P_TOP_BIU			20
> > +#define SRST_P_CSIPHY0			22
> > +#define SRST_CSIPHY0			23
> > +#define SRST_P_CSIPHY1			24
> > +#define SRST_CSIPHY1			25
> > +#define SRST_A_TOP_M500_BIU		31
> 
> No holes, but abstract IDs incremented from 0 or 1.

The IDs are not abstract but instead do describe the location of
the reset bit inside the soft-reset register block.

For reference see drivers/clk/rockchip/softrst.c and its

	int bank = id / softrst->num_per_reg;
	int offset = id % softrst->num_per_reg;

And as we're doing this since 2013 this way, including these bindings,
I guess it can't be too wrong :-)

And they're probably also done via tooling.



> > +/********Name=PHPTOPSOFTRST_CON0,Offset=0x8A00********/
> > +#define SRST_P_PHPTOP_CRU		131073
> > +#define SRST_P_PCIE2_GRF0		131074
> > +#define SRST_P_PCIE2_GRF1		131075
> > +#define SRST_P_PCIE2_GRF2		131076
> > +#define SRST_P_PCIE2_PHY0		131077
> > +#define SRST_P_PCIE2_PHY1		131078
> > +#define SRST_P_PCIE2_PHY2		131079
> > +#define SRST_P_PCIE3_PHY		131080
> > +#define SRST_P_APB2ASB_SLV_CHIP_TOP	131081
> > +#define SRST_PCIE30_PHY			131082
> > +
> > +/********Name=PMU1SOFTRST_CON00,Offset=0x30A00********/
> > +#define SRST_H_PMU1_BIU			786442
> > +#define SRST_P_PMU1_BIU			786443
> 
> 
> The numbering is getting quite unusual... As the value is not used by
> the driver, it suggests it is some register offset or value, which are
> not suitable for the bindings.

see above, it is used by the driver. Though it's still very much unusual.

Looking at the register offsets mentioned in the comments, the
main block handling softreset-ids starts at 0xA04 in the clock controller.

And historically the soft-reset block has been a compact set of registers
inside the device, though this time it seems someone tacked some more
registers into the CRU far behind everything else (0x8A00 and 0x30a00).

So the IDs are in-line with the how we handle reset-ids currently, but
I'm somewhat undecided if this counts as more of a hack.


Heiko


