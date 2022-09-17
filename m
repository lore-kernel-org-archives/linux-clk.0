Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAFDEECAAD3
	for <linux-clk@archiver.kernel.org>; Sat, 17 Sep 2022 11:58:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229479AbiIQL67 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 17 Sep 2022 07:58:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbiIQL65 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 17 Sep 2022 07:58:57 -0400
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCA5739B9F
        for <linux-clk@vger.kernel.org>; Sat, 17 Sep 2022 04:58:55 -0700 (PDT)
Received: by mail-io1-xd2b.google.com with SMTP id e205so15442216iof.1
        for <linux-clk@vger.kernel.org>; Sat, 17 Sep 2022 04:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edgeble-ai.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=XZ1Uh1+5dTaLUb0vMwEMEszjMWYRNaJYiRkr2CgeSSA=;
        b=V3+LYjFN77EFt5eECaZ95tU8gQSMYKzwNHiMq/3i/3hbynjfzMUe3cEMHKA96CWTKP
         FouV6l78t0MrZk/BWOeOSYi67SfCo2Qq7sLQv5BD4+yJAVJFLNiVCGt8TJn3mq/jBWjn
         Z2pgO43IpqNBzVDXD/yCFcRBxHqQ2/xKtp2oh7axzkHSm9h1zz+q9qXk3O/LFwTZtden
         GA/TZxhB62mN86mFvXJ9uH0tsWxi2OBQ1CDKp94x36ZzMcRjTQKGv4gXmwTsmiu/mlDQ
         1K3BSc7GqAc3dk2xGgT4AtkXuiPTFMQBm/LAgbVeyl5jW+etU2P4oTkJ8pSgv9lVjbIk
         ORFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=XZ1Uh1+5dTaLUb0vMwEMEszjMWYRNaJYiRkr2CgeSSA=;
        b=BTPR9NhUF1palFdhVmWXzh/H+sV2btIQxx8fNiebiO6KigbH6Q3VRflDBoHxWRe6tl
         QYKS6OGsk+tg4ke/81p/ClassFMWxHaBtq4vRMMAhCb+MnHjZaqE260PnA28l3HUQ9eH
         67nqVuXetDUXNkLsu23DunZPbTG2rTToztw9YNA0CA9Ixi3f8EEN0nlXoo3vxsW9Vpj1
         nSUx6+g1c8wthmjJvxZsVXmkAxYUAmNmcJ4S4HlJjOd+LmtRdrkkQ34qbKMQpRjWbow8
         mcONtCnBCyp4C+RtBNAdE/HDdXAj4544S7US5wcd3V1gGVa6eL8PEReRCEIVLOaVnZpK
         DFzg==
X-Gm-Message-State: ACrzQf1e2ZQeOGDaNHrF/5ngUgx5MGG5BiYfTBg3AA8YVNLA8Yv9JlsW
        nErd0Zt0TQcN3D9ptAZQ/gxl8Si6t2e6fxYFWTMm8Pql2Hgirp2av9A=
X-Google-Smtp-Source: AMsMyM5KUKpYHWJDJD9OvDgdx2SuCgV5lD4PYjboe3umSXshDobbChgVmv5S4e6ctrLJzIER5UVKwHAx2uqJXhXYQ2k=
X-Received: by 2002:a05:6638:3d09:b0:357:34bc:7ec8 with SMTP id
 cl9-20020a0566383d0900b0035734bc7ec8mr4422053jab.238.1663415934842; Sat, 17
 Sep 2022 04:58:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220915163947.1922183-1-jagan@edgeble.ai> <20220915163947.1922183-5-jagan@edgeble.ai>
 <2597191.BddDVKsqQX@phil>
In-Reply-To: <2597191.BddDVKsqQX@phil>
From:   Jagan Teki <jagan@edgeble.ai>
Date:   Sat, 17 Sep 2022 17:28:43 +0530
Message-ID: <CA+VMnFxy5QsoQ=0=qDxhPE=9KxDr_OKSWi9_7tONk0EA12NLFQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] clk: rockchip: Add clock controller support for
 RV1126 SoC.
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kever Yang <kever.yang@rock-chips.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Finley Xiao <finley.xiao@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, 17 Sept 2022 at 12:25, Heiko Stuebner <heiko@sntech.de> wrote:
>
> Am Donnerstag, 15. September 2022, 18:39:45 CEST schrieb Jagan Teki:
> > Clock & Reset Unit (CRU) in RV1126 support clocks for CRU
> > and CRU_PMU blocks.
> >
> > This patch is trying to add minimal Clock-Architecture Diagram's
> > inferred from [1] authored by Finley Xiao.
> >
> > [1] https://github.com/rockchip-linux/kernel/blob/develop-4.19/drivers/clk/rockchip/clk-rv1126.c
> >
> > Cc: linux-clk@vger.kernel.org
> > Cc: Michael Turquette <mturquette@baylibre.com>
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> > Signed-off-by: Jagan Teki <jagan@edgeble.ai>
> > ---
> > Changes for v5:
> > - add platform-drivers
>
> [...]
>
> > +static void __init rv1126_pmu_clk_init(struct device_node *np)
> > +{
> > +     struct rockchip_clk_provider *ctx;
> > +     void __iomem *reg_base;
> > +
> > +     reg_base = of_iomap(np, 0);
> > +     if (!reg_base) {
> > +             pr_err("%s: could not map cru pmu region\n", __func__);
> > +             return;
> > +     }
> > +
> > +     ctx = rockchip_clk_init(np, reg_base, CLKPMU_NR_CLKS);
> > +     if (IS_ERR(ctx)) {
> > +             pr_err("%s: rockchip pmu clk init failed\n", __func__);
> > +             return;
> > +     }
> > +
> > +     rockchip_clk_register_plls(ctx, rv1126_pmu_pll_clks,
> > +                                ARRAY_SIZE(rv1126_pmu_pll_clks),
> > +                                RV1126_GRF_SOC_STATUS0);
> > +
> > +     rockchip_clk_register_branches(ctx, rv1126_clk_pmu_branches,
> > +                                    ARRAY_SIZE(rv1126_clk_pmu_branches));
> > +
> > +     rockchip_register_softrst(np, 2, reg_base + RV1126_PMU_SOFTRST_CON(0),
> > +                               ROCKCHIP_SOFTRST_HIWORD_MASK);
> > +
> > +     rockchip_clk_of_add_provider(np, ctx);
> > +}
> > +
> > +CLK_OF_DECLARE(rv1126_cru_pmu, "rockchip,rv1126-pmucru", rv1126_pmu_clk_init);
>
> this one and the one below should go away I think.
>
> Can you check if that is the case, then I can just drop the two
> CLK_OF_DECLARE lines.

I think these are unneeded, it worked w/o these when I built a static.
but others are still included.
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/clk/rockchip/clk-rk3568.c#n1636
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/clk/rockchip/clk-rk3568.c#n1679

Jagan.
