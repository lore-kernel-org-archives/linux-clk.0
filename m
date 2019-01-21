Return-Path: <SRS0=Ex8p=P5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82D58C2F3B5
	for <linux-clk@archiver.kernel.org>; Mon, 21 Jan 2019 13:15:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4DDD520870
	for <linux-clk@archiver.kernel.org>; Mon, 21 Jan 2019 13:15:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728689AbfAUNPU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Jan 2019 08:15:20 -0500
Received: from mail-ua1-f65.google.com ([209.85.222.65]:39171 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727833AbfAUNPU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Jan 2019 08:15:20 -0500
Received: by mail-ua1-f65.google.com with SMTP id c12so6882635uas.6;
        Mon, 21 Jan 2019 05:15:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RhR19G3vcn9fK+CgneQ5I7mlqJhPv4y7myscEmtEM/k=;
        b=h0gT6KneVfIDVNYx377Wus4p/SNknmrhOsjeE6adED9SS1PIQsTMNIe9ll1dTfJt7p
         l8mnCaFZiWR72eEK6PqlzSc/JXZRQsYx8JXTVo5U5A+LzZ7PjX4Zv3tFzrL5NAtHCgku
         ZYr9mG38pODrH7YOinQ02wSlx5qwMtmmsISaDfH3dNEVZRE54iEnXJBzalAOMq5a3tBq
         QETZJRhmIO90XbuM3qDaJmhSr5YtOvjZeCkE4EdML3jkt6dyrGoOym5/yQFbrt0/O7cb
         DeMAw10Ec6kJpqnSvDh1WYLhoNYshzmZnwN/cGpTZk59iJQWYqgxTc09+AKqyfMloOOx
         sQ/w==
X-Gm-Message-State: AJcUukfUfO/OSkS5j3RK5lREGCHbrbf/LTdishPfdneM/Toii0BBA3T/
        otrYM+PCMIENk95qsyeAZV2WeS7sLXcdCgp4uGk=
X-Google-Smtp-Source: ALg8bN6JfFFjxrR3JtHgfzRe32ZBLj2sQNSsyZqmdhzkU6n+OhRi6C1rTnupGDwmF4nj8LHGwky+LG9rNHx/xWCqdxQ=
X-Received: by 2002:a9f:364a:: with SMTP id s10mr11257542uad.78.1548076519425;
 Mon, 21 Jan 2019 05:15:19 -0800 (PST)
MIME-Version: 1.0
References: <20190121131410.21137-1-geert+renesas@glider.be>
In-Reply-To: <20190121131410.21137-1-geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 21 Jan 2019 14:15:07 +0100
Message-ID: <CAMuHMdVt6kT30K2GTNU__B7px1O_N-oT-S_rLXi9MfngsrPHgg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a774c0: Correct parent clock of DU
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Jan 21, 2019 at 2:14 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> According to the RZ/G Series, 2nd Generation Hardware Manual Rev 0.61,
> the parent clock of the DU module clocks on RZ/G2 is S1D1.

Oops, "RZ/G2E".

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
