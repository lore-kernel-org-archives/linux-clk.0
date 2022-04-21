Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DF90C433F5
	for <linux-clk@archiver.kernel.org>; Thu, 21 Apr 2022 19:58:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345242AbiDUUAy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Apr 2022 16:00:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1392141AbiDUUAx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Apr 2022 16:00:53 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FA654D9F9
        for <linux-clk@vger.kernel.org>; Thu, 21 Apr 2022 12:58:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C439461CC8
        for <linux-clk@vger.kernel.org>; Thu, 21 Apr 2022 19:58:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2127DC385A1;
        Thu, 21 Apr 2022 19:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650571082;
        bh=B0JWcJfG0YCIygbKxygn9MaBZrNGL78/DsZ8Gnu9ukI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=slqZFZsIvHC92/Yo3Mvtnfmdely6GimtmUfRab45f6OU57Zw2piJX0dMWABsTRswX
         5x/eq6Kwyr7QMXYYwB2gDaFt8YOC2u9u8FKQjQO6bpz3QQzNKPz5mx+mDojP6KfQHy
         W1GJoLtqGH/gkbhJ0FtPwEdrPJZnq/6lficETUymnD3uSixocBkHTr4I9NGBHGDUkR
         Ob/K1kyEwY84pUw8KXqh3fAJXZJoEkC+BWogC86AlchKVWdYflbs67tihh7aKFxnSk
         9GFdWGvjkFNu31hcIxJzfhcuPWUSIyUBuB8EnLommcnz28lzpXbCBocIk8sSyRnrH8
         KGCYGZ1iV9UFg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220407133036.213217-2-nuno.sa@analog.com>
References: <20220407133036.213217-1-nuno.sa@analog.com> <20220407133036.213217-2-nuno.sa@analog.com>
Subject: Re: [RFC PATCH 1/4] clk: clk-conf: properly release of nodes
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>
To:     Nuno =?utf-8?q?S=C3=A1?= <nuno.sa@analog.com>,
        linux-clk@vger.kernel.org
Date:   Thu, 21 Apr 2022 12:58:00 -0700
User-Agent: alot/0.10
Message-Id: <20220421195802.2127DC385A1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Nuno S=C3=A1 (2022-04-07 06:30:33)
> We need to call 'of_node_put()' when we are done with the node or on
> error paths. Otherwise this can leak memory in DYNAMIC_OF setups.
>=20
> Fixes: 86be408bfbd8 ("clk: Support for clock parents and rates assigned f=
rom device tree")
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
> (cherry picked from commit 69eb47a26e7f728a5c052687380993cd9a0dd643)

This line should be removed.

> ---
>  drivers/clk/clk-conf.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/clk/clk-conf.c b/drivers/clk/clk-conf.c
> index 2ef819606c41..d6065cdf1540 100644
> --- a/drivers/clk/clk-conf.c
> +++ b/drivers/clk/clk-conf.c
> @@ -33,9 +33,12 @@ static int __set_clk_parents(struct device_node *node,=
 bool clk_supplier)
>                         else
>                                 return rc;
>                 }
> -               if (clkspec.np =3D=3D node && !clk_supplier)
> +               if (clkspec.np =3D=3D node && !clk_supplier) {
> +                       of_node_put(clkspec.np);
>                         return 0;
> +               }
>                 pclk =3D of_clk_get_from_provider(&clkspec);
> +               of_node_put(clkspec.np);
>                 if (IS_ERR(pclk)) {
>                         if (PTR_ERR(pclk) !=3D -EPROBE_DEFER)
>                                 pr_warn("clk: couldn't get parent clock %=
d for %pOF\n",

I suspect it would be easier to follow and fix if the code was
reorganized to have most of the contents inside this function as a
sub-routine that is called for each index. Then all the node putting and
clk putting can be in one place in that other function and this is a
simple loop around that stops on the first error.

> @@ -49,7 +52,7 @@ static int __set_clk_parents(struct device_node *node, =
bool clk_supplier)
>                         goto err;
>                 if (clkspec.np =3D=3D node && !clk_supplier) {
>                         rc =3D 0;
> -                       goto err;
> +                       goto err_of_put;
>                 }
>                 clk =3D of_clk_get_from_provider(&clkspec);
>                 if (IS_ERR(clk)) {
