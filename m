Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05D4AC32771
	for <linux-clk@archiver.kernel.org>; Fri, 19 Aug 2022 21:48:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231658AbiHSVse (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 Aug 2022 17:48:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230359AbiHSVs2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 Aug 2022 17:48:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91A3124F09
        for <linux-clk@vger.kernel.org>; Fri, 19 Aug 2022 14:48:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2D950617A5
        for <linux-clk@vger.kernel.org>; Fri, 19 Aug 2022 21:48:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8862FC4347C;
        Fri, 19 Aug 2022 21:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660945706;
        bh=BfM7ObP6+H3vSdpACkX4npBTejklHyk+1NdM+/Bbjng=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=IlxHjgF5d/C7u5Wg+6jJFd38uxuQqU4eckg7ZsJUAJ38oGBaweUeLfN+U3wOCVd88
         pc604oNyoYZsPRAUCrLEI0uDPWd2waL+Wo8PfEil1elndhTKeSGK7PiDRVHpvyeEUn
         maiYYbDftASyhkox45r8uJ5MQ3ukWIlmgR8eGqAIG0WuNC8btVDlZ1i6CCp1jOD69g
         JhVDixo70rz2zGuqYaz+Rih+OjXZPTsOWjhFBvKJoYNS5V4ejTeThGIZn0yFelR74J
         a507t82/Y5jJJEhTPrFac32WmY41YyMNV+jesEcHeZg2zqvfRdXTM1e+OXBkmDQN23
         qXKEHqUCPAQdg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220704004729.272481-1-windhl@126.com>
References: <20220704004729.272481-1-windhl@126.com>
Subject: Re: [PATCH v5] clk: sprd: Hold reference returned by of_get_parent()
From:   Stephen Boyd <sboyd@kernel.org>
To:     baolin.wang7@gmail.com, linux-clk@vger.kernel.org,
        mturquette@baylibre.com, orsonzhai@gmail.com, windhl@126.com,
        zhang.lyra@gmail.com
Date:   Fri, 19 Aug 2022 14:48:24 -0700
User-Agent: alot/0.10
Message-Id: <20220819214826.8862FC4347C@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Liang He (2022-07-03 17:47:29)
> We should hold the reference returned by of_get_parent() and use it
> to call of_node_put() for refcount balance.
>=20
> Fixes: f95e8c7923d1 ("clk: sprd: support to get regmap from parent node")
> Signed-off-by: Liang He <windhl@126.com>
> ---
>  changelog:
>=20
>  v5: fix bug reported by Chunyan and confirmed by Orson
>  v4: fix another bug in the same place, missing in v3
>  v3: (1) keep original 'if-else if-else' coding style adviesd by Orson
>      (2) fix typo in commit-log: of_node_out --> of_node_put
>  v2: minimize the effective range of of_get_parent() advised by Orson
>  v1: hold reference returned by of_get_parent()
>=20
>=20
>  drivers/clk/sprd/common.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/clk/sprd/common.c b/drivers/clk/sprd/common.c
> index d620bbbcdfc8..24db1df09075 100644
> --- a/drivers/clk/sprd/common.c
> +++ b/drivers/clk/sprd/common.c
> @@ -41,7 +41,7 @@ int sprd_clk_regmap_init(struct platform_device *pdev,
>  {
>         void __iomem *base;
>         struct device *dev =3D &pdev->dev;
> -       struct device_node *node =3D dev->of_node;
> +       struct device_node *node =3D dev->of_node, *np;
>         struct regmap *regmap;
> =20
>         if (of_find_property(node, "sprd,syscon", NULL)) {
> @@ -50,9 +50,10 @@ int sprd_clk_regmap_init(struct platform_device *pdev,
>                         pr_err("%s: failed to get syscon regmap\n", __fun=
c__);
>                         return PTR_ERR(regmap);
>                 }
> -       } else if (of_device_is_compatible(of_get_parent(dev->of_node),
> -                          "syscon")) {
> -               regmap =3D device_node_to_regmap(of_get_parent(dev->of_no=
de));
> +       } else if (of_device_is_compatible(np =3D of_get_parent(node), "s=
yscon")
> +               || (of_node_put(np), 0)) {

This is gross.
