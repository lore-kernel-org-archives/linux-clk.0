Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D43B8C001B0
	for <linux-clk@archiver.kernel.org>; Sun,  6 Aug 2023 13:56:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229662AbjHFN4J (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 6 Aug 2023 09:56:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjHFN4H (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 6 Aug 2023 09:56:07 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D54E102
        for <linux-clk@vger.kernel.org>; Sun,  6 Aug 2023 06:56:06 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-26928c430b2so1016519a91.0
        for <linux-clk@vger.kernel.org>; Sun, 06 Aug 2023 06:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691330165; x=1691934965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ea+g2e9gvw+PPJc+mSzJv9/cTWg8eVLiw5YSaIQrGzU=;
        b=cBZnINrGMOk7Q2BkLklZRC65ZiJFeMiddxV3sERDeLjepiCWCdKV2d3QrSENkVQL9m
         YIoaUsHccL6DArXTKZdmKPxIg6co+eMUqn/SWbplt9aW6ahc58aaOcoahMcdlM3S+uPs
         FRD0sKXB/a9XZwPHI4qF/pSE1Gu8uIP3Wq4w5R3qQ37p7HSf+wEsuLV89KGC3pgYqWe/
         BJ0VPUjUbUCuHEUFFf3FSRLhJoWjUv/FbJM8vP0kIs0oOzJidS314IJQq2gnCXZzRZ2E
         AuFnHtcLuD98rJf6PgBEItIZSOCj+gCNeggW3aUttrxyoQA81GiFW2lM3jrb9OnPeaSj
         SnLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691330166; x=1691934966;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ea+g2e9gvw+PPJc+mSzJv9/cTWg8eVLiw5YSaIQrGzU=;
        b=c/81xdJp4wF4kfKO+Zm3W0Pvksj+gHLwZ0Xu7ZDe2zXugBfrfHiIuMWqIz1MO7h7xs
         1dfKlEVUlfjOHo3MOz2d4rZBSY+DIo+9ji8D9k+BZy8Fr7hKysmiDhido59/8B6JFXii
         R0BEtkLWIuF+wpFD7tCvVZbEzk4R8naXyvDLkPJ9zWufZxcwTJiqOTzNiYZb7aEFvaRE
         M+eBZXQK11IoArMKpVgpWBI3O6tJJrMHcpPMtHCmy8LvDrT1raFJQhHJXxsP5+m3CjaL
         El2ahestZdcj8IgAeY6GSaKo2UbHSdV2//xQETSEgXbajZYMCn+tQ6dag+C66+XdoF4h
         LjXA==
X-Gm-Message-State: AOJu0YwdiqRBNRns1WnUwI2n7j9VMZi36g9YRUDOF66xr56EGj0jf1JZ
        7JvyuH14z4CTfu4BenZQp6N6kI5q4LC8M73tZVk=
X-Google-Smtp-Source: AGHT+IHqII7Ad6PXqmnEOHzr0aPOzNPMvg9hPpd9uyvuV4aVvm+KnTGynFyY+qFFn3yQeQ6EGZ30Fbpitcfxu7HQyhE=
X-Received: by 2002:a17:90a:5385:b0:263:fbe5:2125 with SMTP id
 y5-20020a17090a538500b00263fbe52125mr5288586pjh.15.1691330165521; Sun, 06 Aug
 2023 06:56:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7x+fs7k0y8Sps+0N7NUPVto8UhZD9E8DbVEuDRPv6bdDMg@mail.gmail.com>
 <20230714134938.2124861-1-m.felsch@pengutronix.de>
In-Reply-To: <20230714134938.2124861-1-m.felsch@pengutronix.de>
From:   Adam Ford <aford173@gmail.com>
Date:   Sun, 6 Aug 2023 08:55:54 -0500
Message-ID: <CAHCN7xKmGxtvE83nhZGVtqFaQNT+G4JGPOoiBSzqDVu1kBK5Rg@mail.gmail.com>
Subject: Re: [PATCH] clk: imx: pll14xx: align pdiv with reference manual
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     adrian.alonso@nxp.com, rasmus.villemoes@prevas.dk,
        bli@bang-olufsen.dk, linux-imx@nxp.com, linux-clk@vger.kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, abelvesa@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Jul 14, 2023 at 8:49=E2=80=AFAM Marco Felsch <m.felsch@pengutronix.=
de> wrote:
>
> The PLL14xx hardware can be found on i.MX8M{M,N,P} SoCs and always come
> with a 6-bit pre-divider. Neither the reference manuals nor the
> datasheets of these SoCs do mention any restrictions. Furthermore the
> current code doesn't respect the restrictions from the comment too.
>
> Therefore drop the restriction and align the max pre-divider (pdiv)
> value to 63 to get more accurate frequencies.
>

Should this get a fixes tag since it appears to fix a bug?


> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> Hi Adam,
>
> here is the patch I made for setting the exact video-pll settings.
>
> Regards,
>   Marco
>
>
>  drivers/clk/imx/clk-pll14xx.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.=
c
> index 7150c59bbfc95..dc6bc21dff41f 100644
> --- a/drivers/clk/imx/clk-pll14xx.c
> +++ b/drivers/clk/imx/clk-pll14xx.c
> @@ -139,11 +139,10 @@ static void imx_pll14xx_calc_settings(struct clk_pl=
l14xx *pll, unsigned long rat
>         /*
>          * Fractional PLL constrains:
>          *
> -        * a) 6MHz <=3D prate <=3D 25MHz
> -        * b) 1 <=3D p <=3D 63 (1 <=3D p <=3D 4 prate =3D 24MHz)
> -        * c) 64 <=3D m <=3D 1023
> -        * d) 0 <=3D s <=3D 6
> -        * e) -32768 <=3D k <=3D 32767
> +        * a) 1 <=3D p <=3D 63
> +        * b) 64 <=3D m <=3D 1023
> +        * c) 0 <=3D s <=3D 6
> +        * d) -32768 <=3D k <=3D 32767
>          *
>          * fvco =3D (m * 65536 + k) * prate / (p * 65536)
>          */
> @@ -186,7 +185,7 @@ static void imx_pll14xx_calc_settings(struct clk_pll1=
4xx *pll, unsigned long rat
>         }
>
>         /* Finally calculate best values */
> -       for (pdiv =3D 1; pdiv <=3D 7; pdiv++) {
> +       for (pdiv =3D 1; pdiv <=3D 63; pdiv++) {
>                 for (sdiv =3D 0; sdiv <=3D 6; sdiv++) {
>                         /* calc mdiv =3D round(rate * pdiv * 2^sdiv) / pr=
ate) */
>                         mdiv =3D DIV_ROUND_CLOSEST(rate * (pdiv << sdiv),=
 prate);
> --
> 2.39.2
>
