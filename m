Return-Path: <SRS0=NuDk=PZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11DF1C43387
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jan 2019 11:05:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D05DB20657
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jan 2019 11:05:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728514AbfAQLFE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Jan 2019 06:05:04 -0500
Received: from mail-vk1-f193.google.com ([209.85.221.193]:43596 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728460AbfAQLFE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Jan 2019 06:05:04 -0500
Received: by mail-vk1-f193.google.com with SMTP id o130so2161747vke.10;
        Thu, 17 Jan 2019 03:05:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mR/av/JkzpPz2SVXWsu5C670v1+MQqVMmUFu/t2SzGU=;
        b=qn/59wvFZ3vAXzZaA90U88sXPdwSpJKxEBzp5CjsU+b/jWbAsrYcpjxraPu7u9v7o2
         7poaU7DJ975iqhcIqZkCmuVunxL82uufjFByeeaOswbKbVwhlBlJPSrnxX+a6YpbAnol
         1dUDZh8hqPaIF1H3ICRkJgX+HyASqbx0m79CqgaqwNDbV3ymU/XkFgcdebmo7/NQ42/L
         2IpRG3nq23kNjuZO2S9/nC8DZUq65kiLYXJ1dOGe046UaPicvhq3i6l+62gA8Oopo8+g
         NifTvC97QlFge6Epk2qFJ8kib4A/M1aJfY3kww+I83OTirUh2epC5IcNxfOElAf4zhfI
         BzDA==
X-Gm-Message-State: AJcUukfYH6QLUAjKOeMABPEOU8q/bhsMdyWuRBrDaPEjlr8lwWcF3WrD
        opHixCAqjZ3T+cBmttKqxJtgmq+F/a6+czS9tew=
X-Google-Smtp-Source: ALg8bN5Q+DaRiRYnYGTwerhRnCCs8KP2WCQQRFmET19FFDNPYow9vPq80MmhZrNn0MvgAsYFuEmzqAFCTFaoitGL6fA=
X-Received: by 2002:a1f:2145:: with SMTP id h66mr5576990vkh.65.1547723102462;
 Thu, 17 Jan 2019 03:05:02 -0800 (PST)
MIME-Version: 1.0
References: <1547663874-29411-1-git-send-email-fabrizio.castro@bp.renesas.com> <1547663874-29411-4-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1547663874-29411-4-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Jan 2019 12:04:51 +0100
Message-ID: <CAMuHMdWhcH2=FS62jawZrMeSc_qKBS_SpDTMoVvhP2o736wtgg@mail.gmail.com>
Subject: Re: [PATCH 03/11] arm64: dts: renesas: Add Si-Linux CAT874 board support
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
> Basic support for the Si-Linux board based on RZ/G2E:
>   - Memory,
>   - Main crystal,
>   - Serial console
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

Pending acceptance of the DT bindings
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts

> +       chosen {
> +               bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";

FWIW, the root and ip parameters won't do anything, until you add network
support.

> +               stdout-path = "serial0:115200n8";
> +       };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
