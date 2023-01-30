Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19195C54EAA
	for <linux-clk@archiver.kernel.org>; Mon, 30 Jan 2023 19:36:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238103AbjA3TgR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 30 Jan 2023 14:36:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238075AbjA3TgQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 30 Jan 2023 14:36:16 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D96EE45202;
        Mon, 30 Jan 2023 11:36:13 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8F6C5B81687;
        Mon, 30 Jan 2023 19:36:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CAF4C433D2;
        Mon, 30 Jan 2023 19:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675107371;
        bh=sxcQJN3nO52mu5E7zYArOshdkoV/Yy47NYqmC/yXgMc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=iGEDjJbTIJCG6wk51YNxxblRvJKJ5aHae5BywXrzG+wPODAcqzkjYRoAKOlsZq/CH
         TpYHquNsbvp5Web5wTPWvy5qXRQUAGfMXtdPa88sIcwyCvOjykciy+2nJzLsJNoZJf
         3RPKjEF+VYa8qJHt5dXN5XAh3lP0khElNyFfwZO3kJJ/YHuLUFy4oN5N63tyOxDQLR
         MVF6PKK3z1y3abGE0WzIKlFhXJPMNULyqQ4579gfAwpXvIMZ5rSBEHPqX3r0IJZUzT
         /PiW6Kf21xoWdIeRgo5tzc5/EampojjPZigKJwtsRGib8W1HuPQ7iuuQMNZq9hyPWv
         b47D52LTmG1cw==
Message-ID: <fe49e8b642c4c33fee37e97d957c37a3.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230118031509.29834-4-moudy.ho@mediatek.com>
References: <20230118031509.29834-1-moudy.ho@mediatek.com> <20230118031509.29834-4-moudy.ho@mediatek.com>
Subject: Re: [PATCH v6 3/4] clk: mediatek: remove MT8195 vppsys/0/1 simple_probe
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        Moudy Ho <moudy.ho@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Moudy Ho <moudy.ho@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Mon, 30 Jan 2023 11:36:09 -0800
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Moudy Ho (2023-01-17 19:15:08)
> diff --git a/drivers/clk/mediatek/clk-mt8195-vpp0.c b/drivers/clk/mediate=
k/clk-mt8195-vpp0.c
> index bf2939c3a023..6d5800f69f6c 100644
> --- a/drivers/clk/mediatek/clk-mt8195-vpp0.c
> +++ b/drivers/clk/mediatek/clk-mt8195-vpp0.c
> @@ -86,26 +86,54 @@ static const struct mtk_gate vpp0_clks[] =3D {
>         GATE_VPP0_2(CLK_VPP0_WARP1_MDP_DL_ASYNC, "vpp0_warp1_mdp_dl_async=
", "top_wpe_vpp", 3),
>  };
> =20
> -static const struct mtk_clk_desc vpp0_desc =3D {
> -       .clks =3D vpp0_clks,
> -       .num_clks =3D ARRAY_SIZE(vpp0_clks),
> -};
> +static int clk_mt8195_vpp0_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct device_node *node =3D dev->parent->of_node;
> +       struct clk_onecell_data *clk_data;
> +       int r;
> =20
> -static const struct of_device_id of_match_clk_mt8195_vpp0[] =3D {
> -       {
> -               .compatible =3D "mediatek,mt8195-vppsys0",
> -               .data =3D &vpp0_desc,
> -       }, {
> -               /* sentinel */
> -       }
> -};
> +       clk_data =3D mtk_alloc_clk_data(CLK_VPP0_NR_CLK);
> +       if (!clk_data)
> +               return -ENOMEM;
> +
> +       r =3D mtk_clk_register_gates(node, vpp0_clks, ARRAY_SIZE(vpp0_clk=
s), clk_data);

This API is wrecked by a patch from AngeloGioacchino. Can you resend, or
tell me which device should be used here?
