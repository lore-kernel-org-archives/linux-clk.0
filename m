Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7EB4C433DB
	for <linux-clk@archiver.kernel.org>; Sat, 13 Mar 2021 21:11:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A05964EC9
	for <linux-clk@archiver.kernel.org>; Sat, 13 Mar 2021 21:11:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234593AbhCMVKv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 13 Mar 2021 16:10:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:43610 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234806AbhCMVKm (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 13 Mar 2021 16:10:42 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id CA08064EC9;
        Sat, 13 Mar 2021 21:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615669841;
        bh=hl68pVNU/U66bkT8vIOkXoVrb98xd7FMxIn6tWimdq8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=BwlCubBucKTHAICQ0XE9XQWGA+d0xKdeOWkzEx153Y7W5vEzPXwngn85fM4sxJcDp
         zwJgRS9CMFzbNfXj7QaJPVQzI0EuhlWfOEzP5QF5QDv9Mqddt1RpLmKzwuhu7tfO+H
         6NXqiq5uo5idHOk37/m2ybb+qW8ROhktZwDU/4KRZ9O2UWC7X+fFk3bAURT+NSb2ka
         5AZ0Nm2dTiBOfAWREVD1tobeIHufR45wgWbtr2cAxNDmidhRW3yZ+AQM4Od/oP81w3
         rmtRRNr6q0UWc5PfeE61RKLZXi5WSNja/u6GGE2uRBxkaIVggB9s3nzGnXWKNbXjXC
         pbkrGIga4Wb6Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210311144833.1313387-1-krzysztof.kozlowski@canonical.com>
References: <20210311144833.1313387-1-krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH] clk: socfpga: fix iomem pointer cast on 64-bit
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Dinh Nguyen <dinguyen@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Sat, 13 Mar 2021 13:10:40 -0800
Message-ID: <161566984049.1478170.1891806275092209249@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Krzysztof Kozlowski (2021-03-11 06:48:33)
> Pointers should be cast to unsigned long instead of integer.  This fixes
> warning when compile testing on ARM64:
>=20
>   drivers/clk/socfpga/clk-gate.c: In function =E2=80=98socfpga_clk_recalc=
_rate=E2=80=99:
>   drivers/clk/socfpga/clk-gate.c:102:7: warning: cast from pointer to int=
eger of different size [-Wpointer-to-int-cast]
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Any Fixes tag?

> ---
>  drivers/clk/socfpga/clk-gate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/socfpga/clk-gate.c b/drivers/clk/socfpga/clk-gat=
e.c
> index 43ecd507bf83..c876523d5d51 100644
> --- a/drivers/clk/socfpga/clk-gate.c
> +++ b/drivers/clk/socfpga/clk-gate.c
> @@ -99,7 +99,7 @@ static unsigned long socfpga_clk_recalc_rate(struct clk=
_hw *hwclk,
>                 val =3D readl(socfpgaclk->div_reg) >> socfpgaclk->shift;
>                 val &=3D GENMASK(socfpgaclk->width - 1, 0);
>                 /* Check for GPIO_DB_CLK by its offset */
> -               if ((int) socfpgaclk->div_reg & SOCFPGA_GPIO_DB_CLK_OFFSE=
T)
> +               if ((unsigned long) socfpgaclk->div_reg & SOCFPGA_GPIO_DB=
_CLK_OFFSET)

Should it be uintptr_t casted instead? This isn't a very great code
pattern given the way we store information in the iomem pointer about
which clk type it is and then have to cast the pointer and assume
alignment. Would be nice to get rid of it but I understand.

>                         div =3D val + 1;
>                 else
>                         div =3D (1 << val);
