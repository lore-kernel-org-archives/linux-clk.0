Return-Path: <SRS0=Ati7=SZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 160D5C10F11
	for <linux-clk@archiver.kernel.org>; Tue, 23 Apr 2019 01:06:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CEF8020874
	for <linux-clk@archiver.kernel.org>; Tue, 23 Apr 2019 01:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555981601;
	bh=4XIl9c68z55v60nFntFl8ggNOHnaIkdvgGfAWOYpQLA=;
	h=In-Reply-To:References:Cc:From:Subject:To:Date:List-ID:From;
	b=w8X1N7hVrx3kZLVJQ3uekd5GYi90BY9AO0Zu4tUHapJCSPsY9mj3kEWtrcggHt+R2
	 SZSiA9eklYLTA9wYgyoAAr9zJohnl+KcJNWzYDRO3VessETmvzRPvsF1siFoQC6Ui6
	 UWRWJq3dSysT190mv9vkWCbSWlsIXzS8QNuXikoc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728796AbfDWBGl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 22 Apr 2019 21:06:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:57764 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728615AbfDWBGl (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 22 Apr 2019 21:06:41 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BE80820811;
        Tue, 23 Apr 2019 01:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555981599;
        bh=4XIl9c68z55v60nFntFl8ggNOHnaIkdvgGfAWOYpQLA=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=B1VSvggqsZOFAlatTEPnGrp5nbjBVq/qQo1SddRFxp+U8HgHcUmAoMstxQyRfkOXA
         RPNDH69H1XbBLTxJj0HlIuSpLXz4P+d8GeSsk2Lo5C6vFuUPXiJvc1Xy/0XgWNsvDc
         ZPl8GX/PvFfFKwy/FWDi8BLBNU9E6th1vxSsPPt8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5cbe596c.1c69fb81.e252.b9d0@mx.google.com>
References: <5cbe596c.1c69fb81.e252.b9d0@mx.google.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: clk/clk-next boot bisection: v5.1-rc1-142-ga55b079c961b on panda
To:     "kernelci.org bot" <bot@kernelci.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>, broonie@kernel.org,
        enric.balletbo@collabora.com, guillaume.tucker@collabora.com,
        khilman@baylibre.com, matthew.hart@linaro.org,
        mgalka@collabora.com, tomeu.vizoso@collabora.com
Message-ID: <155598159898.15276.8408514960097680895@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Mon, 22 Apr 2019 18:06:38 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting kernelci.org bot (2019-04-22 17:16:44)
> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> * This automated bisection report was sent to you on the basis  *
> * that you may be involved with the breaking commit it has      *
> * found.  No manual investigation has been done to verify it,   *
> * and the root cause of the problem may be somewhere else.      *
> * Hope this helps!                                              *
> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
>=20
> clk/clk-next boot bisection: v5.1-rc1-142-ga55b079c961b on panda
>=20
> Summary:
>   Start:      a55b079c961b Merge branch 'clk-hisi' into clk-next
>   Details:    https://kernelci.org/boot/id/5cbe3cdb59b514fd22fe6025
>   Plain log:  https://storage.kernelci.org//clk/clk-next/v5.1-rc1-142-ga5=
5b079c961b/arm/omap2plus_defconfig/gcc-7/lab-baylibre/boot-omap4-panda.txt
>   HTML log:   https://storage.kernelci.org//clk/clk-next/v5.1-rc1-142-ga5=
5b079c961b/arm/omap2plus_defconfig/gcc-7/lab-baylibre/boot-omap4-panda.html
>   Result:     ecbf3f1795fd clk: fixed-factor: Let clk framework find pare=
nt
>=20
> Checks:
>   revert:     PASS
>   verify:     PASS
>=20
> Parameters:
>   Tree:       clk
>   URL:        https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.g=
it
>   Branch:     clk-next
>   Target:     panda
>   CPU arch:   arm
>   Lab:        lab-baylibre
>   Compiler:   gcc-7
>   Config:     omap2plus_defconfig
>   Test suite: boot
>=20
> Breaking commit found:

Awesome! I LOVE IT!!!

>=20
> diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-facto=
r.c
> index 241b3f8c61a9..5b09f2cdb7de 100644
> --- a/drivers/clk/clk-fixed-factor.c
> +++ b/drivers/clk/clk-fixed-factor.c
> @@ -64,12 +64,14 @@ const struct clk_ops clk_fixed_factor_ops =3D {
>  };
>  EXPORT_SYMBOL_GPL(clk_fixed_factor_ops);
> =20
> -struct clk_hw *clk_hw_register_fixed_factor(struct device *dev,
> -               const char *name, const char *parent_name, unsigned long =
flags,
> -               unsigned int mult, unsigned int div)
> +static struct clk_hw *
> +__clk_hw_register_fixed_factor(struct device *dev, struct device_node *n=
p,
> +               const char *name, const char *parent_name, int index,
> +               unsigned long flags, unsigned int mult, unsigned int div)
>  {
>         struct clk_fixed_factor *fix;
>         struct clk_init_data init;
> +       struct clk_parent_data pdata =3D { .index =3D index };
>         struct clk_hw *hw;
>         int ret;
> =20
> @@ -85,11 +87,17 @@ struct clk_hw *clk_hw_register_fixed_factor(struct de=
vice *dev,
>         init.name =3D name;
>         init.ops =3D &clk_fixed_factor_ops;
>         init.flags =3D flags | CLK_IS_BASIC;
> -       init.parent_names =3D &parent_name;
> +       if (parent_name)
> +               init.parent_names =3D &parent_name;
> +       else
> +               init.parent_data =3D &pdata;

Ick. I realized that 'init.parent_names' here can be full of junk! Let's
initialize it properly. Maybe that makes this all better?

----8<----
diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.c
index 5b09f2cdb7de..2d988a7585d5 100644
--- a/drivers/clk/clk-fixed-factor.c
+++ b/drivers/clk/clk-fixed-factor.c
@@ -70,7 +70,7 @@ __clk_hw_register_fixed_factor(struct device *dev, struct=
 device_node *np,
 		unsigned long flags, unsigned int mult, unsigned int div)
 {
 	struct clk_fixed_factor *fix;
-	struct clk_init_data init;
+	struct clk_init_data init =3D { };
 	struct clk_parent_data pdata =3D { .index =3D index };
 	struct clk_hw *hw;
 	int ret;
