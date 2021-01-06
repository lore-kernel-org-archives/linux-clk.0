Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5120EC433DB
	for <linux-clk@archiver.kernel.org>; Wed,  6 Jan 2021 10:39:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0CBB723102
	for <linux-clk@archiver.kernel.org>; Wed,  6 Jan 2021 10:39:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725925AbhAFKiv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Jan 2021 05:38:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725896AbhAFKiu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Jan 2021 05:38:50 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 773D8C06134C
        for <linux-clk@vger.kernel.org>; Wed,  6 Jan 2021 02:38:10 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id x12so1334199plr.10
        for <linux-clk@vger.kernel.org>; Wed, 06 Jan 2021 02:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1ykF1Rb3QiEQMUMU6PE5g0toJSaxdQKEkjuP56ge2Po=;
        b=BKCkklBaIPc8Lsq0qg//XXFPAcTBHLOMOq5fFdPi6701/UvxlXpzzg5360reHNpmsb
         WnYtluMJQYiVkLoyzpN8CdR+K8VPmDiPBoCCIQL5iTvg404KKXqetpnIhpQg1uiGMmni
         aEtifk6yMcrayomUtYiuPH0RQduWPK+XRxghg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1ykF1Rb3QiEQMUMU6PE5g0toJSaxdQKEkjuP56ge2Po=;
        b=WOFTv01CSR/4403f7gDZZEgOANyQoz7evfl8PCWERGDvT3qxcX5E7l3VoLQT750BLI
         f0iHUpzbR4IWTddPOjB7IL5XyoD4uIMoBaHerKCW9TKOTkrhLB0avPqU8mgNP/4vxtHu
         LlG5ksSw9uXU1IplnEcQ02FTak4sVGPzcdCwWuqMalkkn/BYuQnfOWMwLKrYE8pxJTu/
         fmkevpzOTP/hHORBCF9y+Wi7FBVoClfwPZTXdHI8q4PppW+4CKYIWmuLHu20fHAZa0kW
         1f5qxZbNHM24CteIJV2dJ2l/1TpjhWwJEEP1qmtNK5Kd9Q/r5aJx57E8hIit7CQdTJM6
         ggTQ==
X-Gm-Message-State: AOAM532mqmBrtpMAJxJOrgvli/9DVx4rKOxKT5bbocoeaBLMCjIxxlJn
        QlpBigBgMutzir6gYZTfUxL53V6gsxZlonmIYMgAsA==
X-Google-Smtp-Source: ABdhPJybAwz8Y0ZUFyv2j/otm9dwuw+OQd5TePRL99+ggjPgKnM/2LxZPzg3tJMbkaOANmzDOWF7PLPWmi6k0KNWVtE=
X-Received: by 2002:a17:90a:902:: with SMTP id n2mr3678005pjn.126.1609929489894;
 Wed, 06 Jan 2021 02:38:09 -0800 (PST)
MIME-Version: 1.0
References: <1608642587-15634-1-git-send-email-weiyi.lu@mediatek.com> <1608642587-15634-9-git-send-email-weiyi.lu@mediatek.com>
In-Reply-To: <1608642587-15634-9-git-send-email-weiyi.lu@mediatek.com>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Wed, 6 Jan 2021 18:37:59 +0800
Message-ID: <CAATdQgBvd_izVUZ7NiDeHzZsQ4rL0=3LZ04diO7HQXop5rxYsw@mail.gmail.com>
Subject: Re: [PATCH v6 08/22] clk: mediatek: Add configurable enable control
 to mtk_pll_data
To:     Weiyi Lu <weiyi.lu@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        open list <linux-kernel@vger.kernel.org>,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, linux-clk@vger.kernel.org,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Dec 22, 2020 at 9:11 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
>
> In all MediaTek PLL design, bit0 of CON0 register is always
> the enable bit.
> However, there's a special case of usbpll on MT8192.
> The enable bit of usbpll is moved to bit2 of other register.
> Add configurable en_reg and pll_en_bit for enable control or
> default 0 where pll data are static variables.
> Hence, CON0_BASE_EN could also be removed.
> And there might have another special case on other chips,
> the enable bit is still on CON0 register but not at bit0.
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>

Reviewed-by: Ikjoon Jang <ikjn@chromium.org>

> ---
>  drivers/clk/mediatek/clk-mtk.h |  2 ++
>  drivers/clk/mediatek/clk-pll.c | 15 ++++++++++-----
>  2 files changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
> index c3d6756..c580663 100644
> --- a/drivers/clk/mediatek/clk-mtk.h
> +++ b/drivers/clk/mediatek/clk-mtk.h
> @@ -233,6 +233,8 @@ struct mtk_pll_data {
>         uint32_t pcw_chg_reg;
>         const struct mtk_pll_div_table *div_table;
>         const char *parent_name;
> +       uint32_t en_reg;
> +       uint8_t pll_en_bit; /* Assume 0, indicates BIT(0) by default */
>  };
>
>  void mtk_clk_register_plls(struct device_node *node,
> diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
> index 11ed5d1..7fb001a 100644
> --- a/drivers/clk/mediatek/clk-pll.c
> +++ b/drivers/clk/mediatek/clk-pll.c
> @@ -44,6 +44,7 @@ struct mtk_clk_pll {
>         void __iomem    *tuner_en_addr;
>         void __iomem    *pcw_addr;
>         void __iomem    *pcw_chg_addr;
> +       void __iomem    *en_addr;
>         const struct mtk_pll_data *data;
>  };
>
> @@ -56,7 +57,7 @@ static int mtk_pll_is_prepared(struct clk_hw *hw)
>  {
>         struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
>
> -       return (readl(pll->base_addr + REG_CON0) & CON0_BASE_EN) != 0;
> +       return (readl(pll->en_addr) & BIT(pll->data->pll_en_bit)) != 0;
>  }
>
>  static unsigned long __mtk_pll_recalc_rate(struct mtk_clk_pll *pll, u32 fin,
> @@ -248,8 +249,8 @@ static int mtk_pll_prepare(struct clk_hw *hw)
>         writel(r, pll->pwr_addr);
>         udelay(1);
>
> -       r = readl(pll->base_addr + REG_CON0) | CON0_BASE_EN;
> -       writel(r, pll->base_addr + REG_CON0);
> +       r = readl(pll->en_addr) | BIT(pll->data->pll_en_bit);
> +       writel(r, pll->en_addr);
>
>         div_en_mask = pll->data->en_mask & ~CON0_BASE_EN;
>         if (div_en_mask) {
> @@ -290,8 +291,8 @@ static void mtk_pll_unprepare(struct clk_hw *hw)
>                 writel(r, pll->base_addr + REG_CON0);
>         }
>
> -       r = readl(pll->base_addr + REG_CON0) & ~CON0_BASE_EN;
> -       writel(r, pll->base_addr + REG_CON0);
> +       r = readl(pll->en_addr) & ~BIT(pll->data->pll_en_bit);
> +       writel(r, pll->en_addr);
>
>         r = readl(pll->pwr_addr) | CON0_ISO_EN;
>         writel(r, pll->pwr_addr);
> @@ -333,6 +334,10 @@ static struct clk *mtk_clk_register_pll(const struct mtk_pll_data *data,
>                 pll->tuner_addr = base + data->tuner_reg;
>         if (data->tuner_en_reg)
>                 pll->tuner_en_addr = base + data->tuner_en_reg;
> +       if (data->en_reg)
> +               pll->en_addr = base + data->en_reg;
> +       else
> +               pll->en_addr = pll->base_addr + REG_CON0;
>         pll->hw.init = &init;
>         pll->data = data;
>
> --
> 1.8.1.1.dirty
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
