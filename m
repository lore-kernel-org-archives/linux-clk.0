Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2058DC2D0E4
	for <linux-clk@archiver.kernel.org>; Wed, 25 Nov 2020 02:17:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC3C020BED
	for <linux-clk@archiver.kernel.org>; Wed, 25 Nov 2020 02:17:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="xrWmL/rN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbgKYCRH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 24 Nov 2020 21:17:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:38490 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725792AbgKYCRG (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 24 Nov 2020 21:17:06 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 63E79206FB;
        Wed, 25 Nov 2020 02:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606270626;
        bh=tGU/wT5iJJXeOlK1y2/fj98GoCCTid9H7r1dMuS5neA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=xrWmL/rNmiOQV7Gy/XkRJ6Fyhs1tuOdT76acQy2APHM2dersfKs1DTxBRC/yPY3fG
         vqhJKYnqIeiHNA+l0ZE4dpUnmcxbWnVQflJHR0ngQ95Rlnm36gitaBkW/BqSEeuJLG
         2QeGaHbzmjuI3VNRWIjCFJW4uLzdQUf/RinHjX2w=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201113145310.8274-1-a.fatoum@pengutronix.de>
References: <20201113145310.8274-1-a.fatoum@pengutronix.de>
Subject: Re: [PATCH] clk: imx6q: demote warning about pre-boot ldb_di_clk reparenting
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>
Date:   Tue, 24 Nov 2020 18:17:05 -0800
Message-ID: <160627062508.2717324.2756565276373452151@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Ahmad Fatoum (2020-11-13 06:53:09)
> diff --git a/drivers/clk/imx/clk-imx6q.c b/drivers/clk/imx/clk-imx6q.c
> index ba33c79158de..b2e4b6234ac0 100644
> --- a/drivers/clk/imx/clk-imx6q.c
> +++ b/drivers/clk/imx/clk-imx6q.c
> @@ -337,10 +337,10 @@ static void init_ldb_clks(struct device_node *np, v=
oid __iomem *ccm_base)
>         of_assigned_ldb_sels(np, &sel[0][3], &sel[1][3]);
> =20
>         for (i =3D 0; i < 2; i++) {
> -               /* Warn if a glitch might have been introduced already */
> +               /* Print a notice if a glitch might have been introduced =
already */
>                 if (sel[i][0] !=3D 3) {
> -                       pr_warn("ccm: ldb_di%d_sel already changed from r=
eset value: %d\n",
> -                               i, sel[i][0]);
> +                       pr_notice("ccm: ldb_di%d_sel already changed from=
 reset value: %d\n",

Maybe the print should also say "Possible glitch"?
