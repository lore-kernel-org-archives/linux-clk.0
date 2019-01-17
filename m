Return-Path: <SRS0=NuDk=PZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27575C43387
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jan 2019 12:29:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 00E9920657
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jan 2019 12:29:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727425AbfAQM30 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Jan 2019 07:29:26 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:35224 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725928AbfAQM30 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Jan 2019 07:29:26 -0500
Received: by mail-vs1-f68.google.com with SMTP id e7so6111550vsc.2;
        Thu, 17 Jan 2019 04:29:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ekyQ2UWrARd/eP6G81EosKjpyECLJF9qOyF/vIEaB9U=;
        b=Vvp3RI1hyOl46fzgE8r2IujLSLkqM68rH7HJ9OuUeQGf2G2Y5I2iG1czwp4tTC7f44
         aQxf/dLwaWJU2zXQ2fr9+l9FDwrwD+AkFKt5csqsw0yJSMePaMtcnu9tXQ9K+qJ9w79r
         ZJeVkWqLipQ1M++iIVllYji3yofhVFO8urQYt7gK9mKY0ViQW/m42Ad1J829SU4AiRzT
         EhZs07fmwgmhikJzhMlXqsa2plZDEF5PA1Uvv/k2rv+/HHw55h1MI9yNhc5LNpjZjr1u
         VmcWiKf+gTs9bOS2CCiwCGxnIhBpctOt7mUyYD42bsTWzEUW7MlCnWz+FK48MxMLuc26
         O0IQ==
X-Gm-Message-State: AJcUukflxwmNYLYQVLAonrVfHhWHp0QY6ZPoEBnIYGDfRuytXc4D6zG5
        icWCLmK/YjMVFcnfeEgo8M/4rgWznl7EiUj2hVM=
X-Google-Smtp-Source: ALg8bN4IDC0etZwDa5vwFLabL4XusjYyBqWJd55PQHUuciUd7TrZYkEnwso9YOsgh24dNZa3xxWRsmRkITcb5kyV8cw=
X-Received: by 2002:a67:3885:: with SMTP id n5mr5065206vsi.96.1547728165223;
 Thu, 17 Jan 2019 04:29:25 -0800 (PST)
MIME-Version: 1.0
References: <1547667945-5588-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1547667945-5588-1-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Jan 2019 13:29:12 +0100
Message-ID: <CAMuHMdV=47sdu53EXViCBL5OKGxKHQmxg34dNr_cvdeZVNkKVQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/11] clk: renesas: r8a774c0: Add missing CANFD clock
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

On Wed, Jan 16, 2019 at 8:45 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> This patch adds the missing CANFD clock to the r8a774c0 specific
> clock driver.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
>
> ---
> The relevant documentation should appear in the next version
> of the HW User's manual
>
> v1->v2:
> * appended R8A774C0_CLK_CANFD as per Geert's comment

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v5.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
