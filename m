Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A0AEC433EF
	for <linux-clk@archiver.kernel.org>; Wed, 27 Oct 2021 01:26:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 04DC561040
	for <linux-clk@archiver.kernel.org>; Wed, 27 Oct 2021 01:26:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237367AbhJ0B2w (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 Oct 2021 21:28:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:34018 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237366AbhJ0B2v (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 26 Oct 2021 21:28:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CF48161002;
        Wed, 27 Oct 2021 01:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635297986;
        bh=TuGdbnAbvUEI1s7BLENrMJlSUvq4SAmzkgZbbkpsks0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=DKK89v2X2TAZ7OWXzzK1x1aCGJVcTo93M6Sgc6WPmvT3KC2r5Smp3rvCM4C8RXYaX
         n7ffYBos7ySRyewHnmsPg5ulcPPyUfZBmg4YcX+xzTfDcvyAaYHX4TVF8IDtvhM8Af
         +F5ZGs96tZ2QQME9ICkkc+/1lQG2HJXdkCBATH+H/sDP6ip1Uc0CEDauukyZ+3AiXi
         eABs9qw/EtpFQnO3kZUU8UfYszhfdLQsvDkQJTosJALn7DTQ8bJrbMPmUa/tk660YW
         VccGcF5qkFhLipQuc4pGltwQ3EhsgJkdgBTfp8zjJx7IWlr2aWoAFg/EVEMLkgxjdg
         pmiX4h/iG65SQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211011112719.3951784-16-claudiu.beznea@microchip.com>
References: <20211011112719.3951784-1-claudiu.beznea@microchip.com> <20211011112719.3951784-16-claudiu.beznea@microchip.com>
Subject: Re: [PATCH v5 15/15] clk: use clk_core_get_rate_recalc() in clk_rate_get()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Claudiu Beznea <claudiu.beznea@microchip.com>
To:     Claudiu Beznea <claudiu.beznea@microchip.com>,
        alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
        mturquette@baylibre.com, nicolas.ferre@microchip.com
Date:   Tue, 26 Oct 2021 18:26:25 -0700
Message-ID: <163529798547.15791.16388896984607981120@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Claudiu Beznea (2021-10-11 04:27:19)
> In case clock flags contains CLK_GET_RATE_NOCACHE the clk_rate_get()
> will return the cached rate. Thus, use clk_core_get_rate_recalc() which
> takes proper action when clock flags contains CLK_GET_RATE_NOCACHE.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  drivers/clk/clk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 65508eb89ec9..64838754cdef 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -3108,7 +3108,7 @@ static int clk_rate_get(void *data, u64 *val)
>  {
>         struct clk_core *core =3D data;
> =20
> -       *val =3D core->rate;
> +       *val =3D clk_core_get_rate_recalc(core);

We need to grab the prepare lock now. I'll fix it when applying.
