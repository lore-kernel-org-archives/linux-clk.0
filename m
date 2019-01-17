Return-Path: <SRS0=NuDk=PZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2437C43387
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jan 2019 11:06:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8E90F20657
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jan 2019 11:06:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728706AbfAQLGM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Jan 2019 06:06:12 -0500
Received: from mail-vs1-f67.google.com ([209.85.217.67]:43039 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728485AbfAQLGM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Jan 2019 06:06:12 -0500
Received: by mail-vs1-f67.google.com with SMTP id x1so5940890vsc.10;
        Thu, 17 Jan 2019 03:06:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vAZzhJPKeJn7CJqKcjB2cAodWyvcBj4T33BcqKeF/mI=;
        b=FfJWVg6dk3y1rv9uONNrfqQ3UsuBI3ysI6+x1x5ekj9TRbs1wzPQrwkdnP9NKoPo/g
         uZuttgv2nc+4IAF5534+TloXL+Y86feBs5h8vtcOJ7KmI5Qj+g/ETG4AbQ3yWsQcVn2V
         zzvlmlmQSBSsy215HJ0z0/TounY+BJfHeadYXasYFcCCRCT9OEKJWS8wkxfRvwNX5qOp
         bGUYp+/lXp4gZw7wfUQoFNX9yioK2N9aoj7jf71jKzFbqU8YTWCsTSJRGTd+C+o47JF6
         QQdRZu8nzO2UHrMW5SfjTRctFwVA0vCarDNufbvtepZWIkPVA6gJkRDLZSz7Jccd+mWk
         gAoA==
X-Gm-Message-State: AJcUukcFlyidb6n6XvADVA2D7On8PA9u5EHI6VPHYztOLKk35/snoGnS
        nL/bQSLzIugxhsuOeXlOXVDFR5YgaAV1bYNHNZM=
X-Google-Smtp-Source: ALg8bN6yG/M2XWEx0egyMlm7r7KANA4vPga21ApKZsYILuSd3EDncHjogaC6uNruvN8rteEVvAtsmJhZaM6DnxxGX6g=
X-Received: by 2002:a67:c202:: with SMTP id i2mr5590290vsj.11.1547723171140;
 Thu, 17 Jan 2019 03:06:11 -0800 (PST)
MIME-Version: 1.0
References: <1547663874-29411-1-git-send-email-fabrizio.castro@bp.renesas.com> <1547663874-29411-5-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1547663874-29411-5-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Jan 2019 12:05:59 +0100
Message-ID: <CAMuHMdVvMZWNrPfWrOmyFoK+oBu69N_G8s1U4mdAQdt_uj+N2g@mail.gmail.com>
Subject: Re: [PATCH 04/11] arm64: dts: renesas: Add Si-Linux EK874 board support
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Biju Das <biju.das@bp.renesas.com>,
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
        linux-clk <linux-clk@vger.kernel.org>, ebiharaml@si-linux.co.jp
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Jan 16, 2019 at 7:38 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> From: Biju Das <biju.das@bp.renesas.com>
>
> The EK874 development kit from Silicon Linux is made of CAT874 (the main
> board) and CAT875 (the sub board that goes on top of CAT874).
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

Pending acceptance of the DT bindings
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
