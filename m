Return-Path: <SRS0=NuDk=PZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3438BC43387
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jan 2019 11:06:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0C07220657
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jan 2019 11:06:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728949AbfAQLGx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Jan 2019 06:06:53 -0500
Received: from mail-ua1-f65.google.com ([209.85.222.65]:42598 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728485AbfAQLGw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Jan 2019 06:06:52 -0500
Received: by mail-ua1-f65.google.com with SMTP id d21so3301950uap.9;
        Thu, 17 Jan 2019 03:06:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ofo0k4jl6T9JJNmeL8fLqkxcZ4m0vWXmTtIEIgp8ymo=;
        b=DnjFNwP0ddZHuJU3Oh39iMATgHcLE8P3r6oaVrRJVH7eFcyUiO4r6McfoKiblMPG4x
         eKoL1mgTAQ10bmyIhaNi49g5aYMSAO6pVsZcNO2PXdlyWVI1VaO5C0jAuMbZS41nnxaB
         e+pmM7xMJ5zGVrhkr1ETRAXVysEF5QK2XY04l4ZvNx8mbwL+X9S5edjLYmx1TpClP2X/
         L/otNdMJ9OvNPSl/y0ZAKN3yYlq7XVWfYzJCWTfkW5VXFClS3JQQh5vmqqlTVo8+42NT
         oMFjonYytC5kxfnKfDUK/6O2cprrVBhOUgotLHx23ag15ltPDsGbgOyNyUi359iKAWvm
         VF4w==
X-Gm-Message-State: AJcUukero9/jnZgFgZ0MP8q9oEbApt1EQia5MTJ0y1UNqJTVbU3yGqCF
        5zRbLXOWmf5249JJNKpBHn75eU4dd6XTznuuyJ4=
X-Google-Smtp-Source: ALg8bN6cZI2NU+K7xwNRPpz2GubG/Eb870pEuxclrZx2AbTkCTeMmmmuEWtgdOvoZMUYJb1VIdzaPIKhgAAAuIPaYBM=
X-Received: by 2002:ab0:210e:: with SMTP id d14mr5458588ual.20.1547723211086;
 Thu, 17 Jan 2019 03:06:51 -0800 (PST)
MIME-Version: 1.0
References: <1547663874-29411-1-git-send-email-fabrizio.castro@bp.renesas.com> <1547663874-29411-6-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1547663874-29411-6-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Jan 2019 12:06:39 +0100
Message-ID: <CAMuHMdUiiVJgMHmZ5UKLXNXd7D=U8Dyc0ZYgvVTVEgspFLaPYg@mail.gmail.com>
Subject: Re: [PATCH 05/11] arm64: dts: renesas: r8a774c0-cat874: Add
 pincontrol support to scif2
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
> This patch adds pincontrol support to scif2.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
