Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66E17C27C76
	for <linux-clk@archiver.kernel.org>; Thu, 26 Jan 2023 03:22:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236208AbjAZDWO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 Jan 2023 22:22:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235766AbjAZDWO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Jan 2023 22:22:14 -0500
Received: from fudo.makrotopia.org (fudo.makrotopia.org [IPv6:2a07:2ec0:3002::71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E99E66037;
        Wed, 25 Jan 2023 19:21:40 -0800 (PST)
Received: from local
        by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
         (Exim 4.96)
        (envelope-from <daniel@makrotopia.org>)
        id 1pKspJ-00049s-1B;
        Thu, 26 Jan 2023 04:21:25 +0100
Date:   Thu, 26 Jan 2023 03:21:21 +0000
From:   Daniel Golle <daniel@makrotopia.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        Chen-Yu Tsai <wenst@chromium.org>,
        Miles Chen <miles.chen@mediatek.com>,
        Edward-JW Yang <edward-jw.yang@mediatek.com>,
        Johnson Wang <johnson.wang@mediatek.com>,
        Fabien Parent <fparent@baylibre.com>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Sam Shih <sam.shih@mediatek.com>,
        Jianhui Zhao <zhaojh329@gmail.com>
Subject: Re: [PATCH v4 3/3] clk: mediatek: add MT7981 clock support
Message-ID: <Y9HxsXOtqBg5JWpI@makrotopia.org>
References: <cover.1674401764.git.daniel@makrotopia.org>
 <367cf74b038281d235681f6e7fd6f3f7046c962b.1674401764.git.daniel@makrotopia.org>
 <b204674234451a9ab81e834b90244d82.sboyd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b204674234451a9ab81e834b90244d82.sboyd@kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Jan 25, 2023 at 06:23:16PM -0800, Stephen Boyd wrote:
> Quoting Daniel Golle (2023-01-22 07:44:00)
> > +       GATE_SGMII1(CLK_SGM1_CK1_EN, "sgm1_ck1_en", "usb_ln0", 4),
> > +       GATE_SGMII1(CLK_SGM1_CDR_CK1_EN, "sgm1_cdr_ck1_en", "usb_cdr", 5),
> > +};
> > +
> > +static const struct mtk_gate_regs eth_cg_regs = {
> > +       .set_ofs = 0x30,
> > +       .clr_ofs = 0x30,
> > +       .sta_ofs = 0x30,
> > +};
> > +
> > +#define GATE_ETH(_id, _name, _parent, _shift) {        \
> > +               .id = _id,                              \
> > +               .name = _name,                          \
> > +               .parent_name = _parent,                 \
> > +               .regs = &eth_cg_regs,                   \
> > +               .shift = _shift,                        \
> > +               .ops = &mtk_clk_gate_ops_no_setclr_inv, \
> > +       }
> > +
> > +static const struct mtk_gate eth_clks[] __initconst = {
> > +       GATE_ETH(CLK_ETH_FE_EN, "eth_fe_en", "netsys_2x", 6),
> > +       GATE_ETH(CLK_ETH_GP2_EN, "eth_gp2_en", "sgm_325m", 7),
> > +       GATE_ETH(CLK_ETH_GP1_EN, "eth_gp1_en", "sgm_325m", 8),
> > +       GATE_ETH(CLK_ETH_WOCPU0_EN, "eth_wocpu0_en", "netsys_wed_mcu", 15),
> > +};
> > +
> > +static const struct mtk_clk_desc eth_desc = {
> > +       .clks = eth_clks,
> > +       .num_clks = ARRAY_SIZE(eth_clks),
> > +};
> > +
> > +static const struct mtk_clk_desc sgmii0_desc = {
> > +       .clks = sgmii0_clks,
> > +       .num_clks = ARRAY_SIZE(sgmii0_clks),
> > +};
> > +
> > +static const struct mtk_clk_desc sgmii1_desc = {
> > +       .clks = sgmii1_clks,
> > +       .num_clks = ARRAY_SIZE(sgmii1_clks),
> > +};
> > +
> > +static const struct of_device_id of_match_clk_mt7981_eth[] = {
> > +       { .compatible = "mediatek,mt7981-ethsys", .data = &eth_desc },
> > +       { .compatible = "mediatek,mt7981-sgmiisys_0", .data = &sgmii0_desc },
> > +       { .compatible = "mediatek,mt7981-sgmiisys_1", .data = &sgmii1_desc },
> > +       { /* sentinel */ }
> > +};
> 
> Actually not applied
> 
> WARNING: DT compatible string "mediatek,mt7981-ethsys" appears un-documented -- check ./Documentation/devicetree/bindings/
> #291: FILE: drivers/clk/mediatek/clk-mt7981-eth.c:103:
> +       { .compatible = "mediatek,mt7981-ethsys", .data = &eth_desc },
> 
> WARNING: DT compatible string "mediatek,mt7981-sgmiisys_0" appears un-documented -- check ./Documentation/devicetree/bindings/
> #292: FILE: drivers/clk/mediatek/clk-mt7981-eth.c:104:
> +       { .compatible = "mediatek,mt7981-sgmiisys_0", .data = &sgmii0_desc },
> 
> WARNING: DT compatible string "mediatek,mt7981-sgmiisys_1" appears un-documented -- check ./Documentation/devicetree/bindings/
> #293: FILE: drivers/clk/mediatek/clk-mt7981-eth.c:105:
> +       { .compatible = "mediatek,mt7981-sgmiisys_1", .data = &sgmii1_desc },
> 
> WARNING: DT compatible string "mediatek,mt7981-infracfg" appears un-documented -- check ./Documentation/devicetree/bindings/
> #506: FILE: drivers/clk/mediatek/clk-mt7981-infracfg.c:195:
> +       { .compatible = "mediatek,mt7981-infracfg", .data = &infracfg_desc },
> 
> Is there a binding update missing?

Right, I forgot to git add the changes in
Documentation/devicetree/bindings/arm/mediatek/, not very smart. I'll
resend with those included in a moment from now.
