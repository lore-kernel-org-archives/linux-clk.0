Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79DAFC48BD1
	for <linux-clk@archiver.kernel.org>; Thu, 10 Jun 2021 13:04:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 60CDB613C9
	for <linux-clk@archiver.kernel.org>; Thu, 10 Jun 2021 13:04:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230488AbhFJNGu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 10 Jun 2021 09:06:50 -0400
Received: from mail-vs1-f50.google.com ([209.85.217.50]:40896 "EHLO
        mail-vs1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230317AbhFJNGu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 10 Jun 2021 09:06:50 -0400
Received: by mail-vs1-f50.google.com with SMTP id b1so1802561vsh.7;
        Thu, 10 Jun 2021 06:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dtTnjbShfsHfwnFII8h2MIwIChoALSHoXSdICCW25tI=;
        b=sPpuKvC4am4ycPFH+CGb0nnLeawkisGDRTc4XD4Gu63ZeO1UPa/Eo65vSQPFEOBN+C
         wHKbVHSWs1uwhqZWilKOwJpwGav0ZT0BuKflxZljGeshAq85zHHwB8UINvPR7rnEKimW
         yfzKuOSxSEaxubu3HeVhgbKp2jEXu5Aso9GN2aKBh6SoB+vD16pXtNmc2BrKbNrxt1zo
         yPbBJIpjwGomZN+Lq0lG+Hl2df+6fHBVQQOEL8WCgUgUoOFG1h8hesMgN/MaTWbKEBvY
         1pdIJUIK3ZIGbLSh+Nk7N7uNtPUCwCWoE2Cc8tINWeD363Wnz2BPc7TI9KFk1yBmhaCv
         Jcvg==
X-Gm-Message-State: AOAM532sk2EjZRHB+/bVBkkS76vMhkGAfOIrPwN0RAaQ8bbXgpgaZpvW
        QY2/nXQiccRkiQVQo8+IosPj4M9tNqaNlNlBrTU=
X-Google-Smtp-Source: ABdhPJwHRRMMdepvDucLXToAJNJ68PXSF84KowPsfoH9qmacKhu2d7fsNOT5aYSfVWcERx3KIEWynNVqM8wFK6LpH+g=
X-Received: by 2002:a67:efd6:: with SMTP id s22mr4552947vsp.3.1623330277115;
 Thu, 10 Jun 2021 06:04:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210609153230.6967-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210609153230.6967-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210609153230.6967-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Jun 2021 15:04:26 +0200
Message-ID: <CAMuHMdWHa0dgKCuxpZFMYBz7FeOHDXDLXrN0i3c=Aw-6BaB+5g@mail.gmail.com>
Subject: Re: [PATCH v3 09/11] clk: renesas: Add support for R9A07G044 SoC
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Jun 9, 2021 at 5:33 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Define the clock outputs supported by RZ/G2L (R9A07G044) SoC
> and bind it with RZ/G2L CPG core.
>
> Based on a patch in the BSP by Binh Nguyen
> <binh.nguyen.jz@renesas.com>.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
