Return-Path: <SRS0=rfa6=QI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6603C282DB
	for <linux-clk@archiver.kernel.org>; Fri,  1 Feb 2019 13:53:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B1BB0218A6
	for <linux-clk@archiver.kernel.org>; Fri,  1 Feb 2019 13:53:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730373AbfBANxF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 1 Feb 2019 08:53:05 -0500
Received: from mail-vk1-f196.google.com ([209.85.221.196]:39807 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730265AbfBANxF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Feb 2019 08:53:05 -0500
Received: by mail-vk1-f196.google.com with SMTP id s184so1581454vkd.6;
        Fri, 01 Feb 2019 05:53:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pbU/FSsluEJQGcSQuzHk+TqFXjwsvQnHHFyrOGVMMnE=;
        b=IOdl94Qa8yoG7EVi0NmDVtIVaNaPpgKtQBmhtMXy+i7MzRtNr7uuFrtz7Nu4bgaMFA
         SmWdzz4ppPLktIoQFrCpPSV50U1L6EGNF9snnq8/uyASY31p/dm9LbAYWG1o8u0j2uLb
         IHw/jiY8RR9tdTeScM6Z+VAUJMBCKDRJFxRPY5b9p5qlzSreMi3LANfKRfY7OPDE3JfH
         YSiNBaBHPaZp67SkQF5laj6Z2PdDoqUWVKYPVlkak2D/oGRAog0QyKm8R54+qF1Yox54
         14qw4E2ZU71JUG2H9TdbTnAJ4cpTvMqBmtxVYE1QftaoLseEsOmwxel5lA38U6ohgfBw
         VV3g==
X-Gm-Message-State: AJcUukebI6Uihnzve1Y1LOgdodSkyWiG11D9jEqdTAesyS+eu1ik3bCx
        7OsXB3BOoPYBvnRIeuxxV3sCnEzIvVXxb3ofFiQ=
X-Google-Smtp-Source: ALg8bN7GL8JqRaGTNmayw9u82eOCJNnl7aEqRaGlj4GnlPhlejm5r3AenZz7FkM6LQlxHGJYbEcgIG3Q1/Ch6fLFpx0=
X-Received: by 2002:a1f:2ed7:: with SMTP id u206mr16134417vku.72.1549029183866;
 Fri, 01 Feb 2019 05:53:03 -0800 (PST)
MIME-Version: 1.0
References: <1549015841-33536-1-git-send-email-biju.das@bp.renesas.com> <1549015841-33536-4-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1549015841-33536-4-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 1 Feb 2019 14:52:52 +0100
Message-ID: <CAMuHMdXDuTTy5Ko2bgSBceN1QZ+uhVTFWFJksyWX4GpMomny8w@mail.gmail.com>
Subject: Re: [PATCH 3/5] clk: renesas: r8a774c0: Add TMU clock
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Biju,

On Fri, Feb 1, 2019 at 11:16 AM Biju Das <biju.das@bp.renesas.com> wrote:
> This patch adds TMU clock to the R8A774C0 SoC.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r8a774c0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
> @@ -119,6 +119,11 @@ static const struct cpg_core_clk r8a774c0_core_clks[] __initconst = {
>  };
>
>  static const struct mssr_mod_clk r8a774c0_mod_clks[] __initconst = {
> +       DEF_MOD("tmu4",                  121,   R8A774C0_CLK_S0D6),

RZ/G2 Hardware User's Manual rev. 0.61 says S0D6C?

> +       DEF_MOD("tmu3",                  122,   R8A774C0_CLK_S3D2),
> +       DEF_MOD("tmu2",                  123,   R8A774C0_CLK_S3D2),
> +       DEF_MOD("tmu1",                  124,   R8A774C0_CLK_S3D2),

S3D2C? (all three)

Since these are timers, it should be easy to verify the actual parent
clock rates.

> +       DEF_MOD("tmu0",                  125,   R8A774C0_CLK_CP),
>         DEF_MOD("scif5",                 202,   R8A774C0_CLK_S3D4C),
>         DEF_MOD("scif4",                 203,   R8A774C0_CLK_S3D4C),
>         DEF_MOD("scif3",                 204,   R8A774C0_CLK_S3D4C),

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
