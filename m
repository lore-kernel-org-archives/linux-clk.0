Return-Path: <SRS0=E5Sm=NP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ACE0C0044C
	for <linux-clk@archiver.kernel.org>; Sun,  4 Nov 2018 02:57:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 483AB20847
	for <linux-clk@archiver.kernel.org>; Sun,  4 Nov 2018 02:57:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="UXwj6WU5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 483AB20847
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728915AbeKDMKX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 4 Nov 2018 07:10:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:38472 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728909AbeKDMKX (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 4 Nov 2018 07:10:23 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A2DC42082E;
        Sun,  4 Nov 2018 02:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1541300226;
        bh=k06zYY21PgHzPh7dxquOGqh68uBBR2dSSplS016UenU=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=UXwj6WU5lIbStcfpBgGztTQdKdzy/0pb3t7ssHOY9rvA8fOoy5b7N12TxRhRHoQnC
         zO9UwNEKrqdNI5hIif2CsGsYSySq3qrsRFa8MOniOUOndrzoAZVyhqCLV0UAYCh0Iu
         KEE592jN312GNhEyO0DNMVcn/xuSmlMyIIYnajp4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Ivan Babrou <ivan@cloudflare.com>, linux-clk@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <CABWYdi1Bad325ZEUZUuPcQoGJtxzTWtkxuZYH8eCeKK1uMbn9A@mail.gmail.com>
Cc:     trivial@kernel.org, mike.looijmans@topic.nl, mturquette@linaro.org
References: <CABWYdi1Bad325ZEUZUuPcQoGJtxzTWtkxuZYH8eCeKK1uMbn9A@mail.gmail.com>
Message-ID: <154130022584.88331.11328574821722290484@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH] clk: cleanup Kconfig to remove duplicate help tags
Date:   Sat, 03 Nov 2018 19:57:05 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Ivan Babrou (2018-10-24 15:27:16)
> Before:
> =

> =E2=94=8C=E2=94=80=E2=94=80 Clock driver for SiLabs 544 devices =E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
> =E2=94=82                                                                =
=E2=94=82
> =E2=94=82 CONFIG_COMMON_CLK_SI544:                                       =
=E2=94=82
> =E2=94=82                                                                =
=E2=94=82
> =E2=94=82 ---help---                                                     =
=E2=94=82
> =E2=94=82   This driver supports the Silicon Labs 544 programmable clock =
=E2=94=82
> =E2=94=82   generator.                                                   =
=E2=94=82
> =

> After:
> =

> =E2=94=8C=E2=94=80=E2=94=80 Clock driver for SiLabs 544 devices =E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
> =E2=94=82                                                              =
=E2=94=82
> =E2=94=82 CONFIG_COMMON_CLK_SI544:                                     =
=E2=94=82
> =E2=94=82                                                              =
=E2=94=82
> =E2=94=82 This driver supports the Silicon Labs 544 programmable clock =
=E2=94=82
> =E2=94=82 generator.                                                   =
=E2=94=82

Ah ok. I was thrown off by the first hunk that didn't need to be
changed.

> =

> Signed-off-by: Ivan Babrou <ivan@cloudflare.com>
> ---
>  drivers/clk/Kconfig | 13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)
> =

> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 292056bbb30e..8b5993ae30d8 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -48,7 +48,7 @@ config COMMON_CLK_MAX77686
>  config COMMON_CLK_MAX9485
>   tristate "Maxim 9485 Programmable Clock Generator"
>   depends on I2C
> - help
> + ---help---

So this one is not needed?

>     This driver supports Maxim 9485 Programmable Audio Clock Generator
> =

>  config COMMON_CLK_RK808
> @@ -157,7 +153,7 @@ config COMMON_CLK_CDCE925
>  config COMMON_CLK_CS2000_CP
>   tristate "Clock driver for CS2000 Fractional-N Clock Synthesizer &
> Clock Multiplier"
>   depends on I2C
> - help
> + ---help---

Same for this one.

>     If you say yes here you get support for the CS2000 clock multiplier.
> =

>  config COMMON_CLK_GEMINI
