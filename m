Return-Path: <SRS0=Ex8p=P5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72D61C2F3A0
	for <linux-clk@archiver.kernel.org>; Mon, 21 Jan 2019 13:01:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3B5C42087F
	for <linux-clk@archiver.kernel.org>; Mon, 21 Jan 2019 13:01:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728501AbfAUNBC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Jan 2019 08:01:02 -0500
Received: from mail-vk1-f194.google.com ([209.85.221.194]:35206 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726885AbfAUNBC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Jan 2019 08:01:02 -0500
Received: by mail-vk1-f194.google.com with SMTP id b18so4571886vke.2;
        Mon, 21 Jan 2019 05:01:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sUbShfmDKmMA5atKxszRotJWgTwajcG6Mj31KVUuZTA=;
        b=dJVf1VNDWqdVN2C4vv2mTPi4nfvJPGtWyX31dYtukCYfgX2IQvwMpnR7yRElNPAWux
         IGkSFG48dHSIDjAIPlgf3oHQfK/XP+05dzrBop2I4ORjfEX75IJNTcXMIZqJVlM8Tnu0
         etGPyL0Iz+b5YCxi0WNMz8pDSXgKk/Fza6567/jOKQYUKuIN11mjV6K73teP3IdznCe7
         G9mkfclmVhC7hhQDGIDTVrRghWfKdUDoUxbrnZIaa9uiXRL4QwRuXEqpq+nBIKFJ4wwM
         CxE45QJ3e2Z4np5OCSLNpNNMPPGw7CB/SmTcXwhQYfL+hrMZV2P6JsdaXZl6QYdTS0+E
         OdCA==
X-Gm-Message-State: AJcUukfgZuPqmEEg8TQEQbu3ZsyCtnvZCCGj5w76+DhKoGf0qKwD1LY+
        g+u6kAhjHTlc1y4j3TTpDC3Trd5xvlUQtLqoEvA=
X-Google-Smtp-Source: ALg8bN55EUSLaNF6tj+EMWQ3CT2WE67wNzY9BaGQ77wZ7ldhFdyTb/zGWAT4lCcHI2mkzcf3z8H4htNeRVwvFMQJfk8=
X-Received: by 2002:a1f:298e:: with SMTP id p136mr11713619vkp.40.1548075660909;
 Mon, 21 Jan 2019 05:01:00 -0800 (PST)
MIME-Version: 1.0
References: <1547736856-16539-1-git-send-email-fabrizio.castro@bp.renesas.com> <1547736856-16539-2-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1547736856-16539-2-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 21 Jan 2019 14:00:49 +0100
Message-ID: <CAMuHMdW0aSmcGRHi3n__dZ9SEAh40EuUrbqLNt9kq8QoLmr1mg@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: renesas: r8a774a1: Add missing CANFD clock
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>, linux-can@vger.kernel.org,
        netdev <netdev@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jan 17, 2019 at 3:54 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> This patch adds the missing CANFD clock to the r8a774a1 specific
> clock driver.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v5.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
