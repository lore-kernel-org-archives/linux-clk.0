Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66895C07E9D
	for <linux-clk@archiver.kernel.org>; Mon, 26 Sep 2022 03:27:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233095AbiIZD1t (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 25 Sep 2022 23:27:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230060AbiIZD1r (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 25 Sep 2022 23:27:47 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63A2A24BE7
        for <linux-clk@vger.kernel.org>; Sun, 25 Sep 2022 20:27:46 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id m3so7208150eda.12
        for <linux-clk@vger.kernel.org>; Sun, 25 Sep 2022 20:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=1z+K3iZ5edH9Wvs3sWpMytE5kCGm2zb+7oEAH+Nf3iQ=;
        b=eJhq7Fc27wKeinfDqhvMNOiJ/Gb1/og0KmVp3G+UnwXEDuClmgZJTTtEdniYEEOZTu
         PkHeKnkfj5Nz22Ox5Hm6qKfgc47pn/rMMFS/mdiS+DoqM4BTAKvibBmdiJ5XQLJZrvMQ
         qyrnEu2NdvfYAGMs7Cl67PsiuzyzFdl8K592U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=1z+K3iZ5edH9Wvs3sWpMytE5kCGm2zb+7oEAH+Nf3iQ=;
        b=AsmrxTAZpq3PGdxT3SEEY23xkmAmCbpDSUKYLXq74aZVuu6It2Ros5E68y+ysp9D8z
         yMog+8FvNDtrFFxjWLIvmtJHEoIHrGU/keJVtJMSY45d+6t1YTlfMIpS/n42/H1mrXIJ
         NYrZZVBsIbEiykuhPsbQkno04R4uwJ7rJJ/UZq61l0MiMTmzULW3DCo5MiPZtqYja3Zx
         c9K63VtlZQFgnD4A18R56rWOCTHneTpQ0EA6nWWO6J0zB0FbxRAtulpg1DwIHzPfI12O
         Vor8h0V07w3YDPUVbnFSv328Ojc4WPe0jfuwgQFs+JwSQ9my8tdp1NTXGbwFSIYdrAXF
         sjcg==
X-Gm-Message-State: ACrzQf1uaXAnT6MrLPkmXKYkEu2GiLn/IqpIImcTD3SyMBUm7ow11JKq
        2xulEo8JE6xZFHM1MgdEJH4A4IgPoK22Qv82gHO9ag==
X-Google-Smtp-Source: AMsMyM5D3keac5HMYAnwObUUepcFX4Nc0uJR6fxSr+8PfMtKkHus/shERelQElMbLNntt0PEAz4+xxwiFElIWC2rDqQ=
X-Received: by 2002:a05:6402:3549:b0:454:414e:a7fd with SMTP id
 f9-20020a056402354900b00454414ea7fdmr21116157edd.69.1664162864997; Sun, 25
 Sep 2022 20:27:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220915072458.18232-1-angelogioacchino.delregno@collabora.com> <20220915072458.18232-6-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220915072458.18232-6-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 26 Sep 2022 11:27:33 +0800
Message-ID: <CAGXv+5HxEWPmLLi0zRrJ+T7bVcpoQoFt81+_ciXNDXRrGmfU6w@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] clk: mediatek: clk-mt8195-mfg: Reparent mfg_bg3d
 and propagate rate changes
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     matthias.bgg@gmail.com, mturquette@baylibre.com, sboyd@kernel.org,
        miles.chen@mediatek.com, rex-bc.chen@mediatek.com,
        nfraprado@collabora.com, chun-jie.chen@mediatek.com,
        jose.exposito89@gmail.com, drinkcat@chromium.org,
        weiyi.lu@mediatek.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Sep 15, 2022 at 3:25 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The MFG_BG3D is a gate to enable/disable clock output to the GPU,
> but the actual output is decided by multiple muxes; in particular:
> mfg_ck_fast_ref muxes between "slow" (top_mfg_core_tmp) and
> "fast" (MFGPLL) clock, while top_mfg_core_tmp muxes between the
> 26MHz clock and various system PLLs.
>
> This also implies that "top_mfg_core_tmp" is a parent of the
> "mfg_ck_fast_ref" mux (and not vice-versa), so reparent the

I don't see where this was the case though? I think what you meant
was that the direct parent for "mfg_bg3d" is "mfg_ck_fast_ref, not
"top_mfg_core_tmp"?

> MFG_BG3D gate to the latter and add the CLK_SET_RATE_PARENT
> flag to it: this way we ensure propagating rate changes that
> are requested on MFG_BG3D along its entire clock tree.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>


> ---
>  drivers/clk/mediatek/clk-mt8195-mfg.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-mt8195-mfg.c b/drivers/clk/mediatek/clk-mt8195-mfg.c
> index 9411c556a5a9..c94cb71bd9b9 100644
> --- a/drivers/clk/mediatek/clk-mt8195-mfg.c
> +++ b/drivers/clk/mediatek/clk-mt8195-mfg.c
> @@ -17,10 +17,12 @@ static const struct mtk_gate_regs mfg_cg_regs = {
>  };
>
>  #define GATE_MFG(_id, _name, _parent, _shift)                  \
> -       GATE_MTK(_id, _name, _parent, &mfg_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
> +       GATE_MTK_FLAGS(_id, _name, _parent, &mfg_cg_regs,       \
> +                      _shift, &mtk_clk_gate_ops_setclr,        \
> +                      CLK_SET_RATE_PARENT)
>
>  static const struct mtk_gate mfg_clks[] = {
> -       GATE_MFG(CLK_MFG_BG3D, "mfg_bg3d", "top_mfg_core_tmp", 0),
> +       GATE_MFG(CLK_MFG_BG3D, "mfg_bg3d", "mfg_ck_fast_ref", 0),
>  };
>
>  static const struct mtk_clk_desc mfg_desc = {
> --
> 2.37.2
>
