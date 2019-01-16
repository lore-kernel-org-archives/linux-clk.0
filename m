Return-Path: <SRS0=O/eU=PY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE545C43387
	for <linux-clk@archiver.kernel.org>; Wed, 16 Jan 2019 19:05:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 995E020873
	for <linux-clk@archiver.kernel.org>; Wed, 16 Jan 2019 19:05:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730065AbfAPTFp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Jan 2019 14:05:45 -0500
Received: from mail-vs1-f67.google.com ([209.85.217.67]:39625 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729330AbfAPTFp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Jan 2019 14:05:45 -0500
Received: by mail-vs1-f67.google.com with SMTP id h78so4622503vsi.6;
        Wed, 16 Jan 2019 11:05:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gn+8EZZ9IbKBp0X4TUExkWaiWtFX771zKrRZWV77xME=;
        b=oloPAjQgzfsmDzaPtcDO00NkYvXAa71LS1FsekEQHO0diFxEtN/2diNiDOJ5f8BSsq
         36R4XBn1ipXbGVCMztYwivyXItGplAgWRCc2mOFEoYIK3p5jvSycO6C8+aCjN26bUtPe
         Hl7S+/ZeU5cgeyPmXjen7xGp+Wt7MENxG0kOCl8e2S5Plb/2O0fIo/MsPZojuQU/7HxR
         cNmHHVWipdt2Zs/CIuAq0t6kiX0qs1KSwwpIAUjmkzqSb7HrIIOxK7987ujLpkXhU9hZ
         mnX1Q9fjbCBfP29AluMnS5MqvpD0hhC6Pjr4vLY0Wxcn4kYNoxl4nkDUEJsGT/xUakkx
         sC5Q==
X-Gm-Message-State: AJcUukf1cW7dJ3bXe2eojW7zP86HvRiSqsGznKgMfKoDVu7KzzrxJ0z7
        fr9etzwrSyeZ2CaMIpkrVXqMiSXRbp696vtL5dk=
X-Google-Smtp-Source: ALg8bN4HedqnYzW++lxzdliMwCGhoA2Wk+v284Iat19JqdoxIFt+ofhbS1UaaBLONabxNoI50lgfsQGgm6cAaI6er2w=
X-Received: by 2002:a67:b60d:: with SMTP id d13mr4520605vsm.152.1547665543138;
 Wed, 16 Jan 2019 11:05:43 -0800 (PST)
MIME-Version: 1.0
References: <1547663874-29411-1-git-send-email-fabrizio.castro@bp.renesas.com> <1547663874-29411-9-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1547663874-29411-9-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 16 Jan 2019 20:05:31 +0100
Message-ID: <CAMuHMdWG6m11eAjvPeFXjsu3jhYnfsxN-EUXw5_SQZ6qMrebYw@mail.gmail.com>
Subject: Re: [PATCH 08/11] clk: renesas: r8a774c0: Add missing CANFD clock
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thierry Reding <treding@nvidia.com>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Johan Hovold <johan@kernel.org>,
        Lukasz Majewski <lukma@denx.de>,
        Michal Simek <monstr@monstr.eu>,
        =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Ben Whitten <ben.whitten@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-can@vger.kernel.org,
        netdev <netdev@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Biju Das <biju.das@bp.renesas.com>, ebiharaml@si-linux.co.jp
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Fabrizio,

Thanks for your patch!

On Wed, Jan 16, 2019 at 7:39 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> This patch adds the missing CANFD clock to the r8a774c0 specific
> clock driver.

Are you sure the CANFD clock exists on RZ/G2E?

> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

> --- a/drivers/clk/renesas/r8a774c0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a774c0-cpg-mssr.c

> --- a/include/dt-bindings/clock/r8a774c0-cpg-mssr.h
> +++ b/include/dt-bindings/clock/r8a774c0-cpg-mssr.h
> @@ -48,13 +48,14 @@
>  #define R8A774C0_CLK_ZA2               37
>  #define R8A774C0_CLK_ZA8               38
>  #define R8A774C0_CLK_Z2D               39
> -#define R8A774C0_CLK_MSO               40
> -#define R8A774C0_CLK_R                 41
> -#define R8A774C0_CLK_OSC               42
> -#define R8A774C0_CLK_LV0               43
> -#define R8A774C0_CLK_LV1               44
> -#define R8A774C0_CLK_CSI0              45
> -#define R8A774C0_CLK_CP                        46
> -#define R8A774C0_CLK_CPEX              47
> +#define R8A774C0_CLK_CANFD             40
> +#define R8A774C0_CLK_MSO               41
> +#define R8A774C0_CLK_R                 42
> +#define R8A774C0_CLK_OSC               43
> +#define R8A774C0_CLK_LV0               44
> +#define R8A774C0_CLK_LV1               45
> +#define R8A774C0_CLK_CSI0              46
> +#define R8A774C0_CLK_CP                        47
> +#define R8A774C0_CLK_CPEX              48

This file is part of the DT ABI, hence list of definitions is append-only.

Please add R8A774C0_CLK_CANFD at the end, i.e.

    #define R8A774C0_CLK_CANFD              48

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
