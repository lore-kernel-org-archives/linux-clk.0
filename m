Return-Path: <SRS0=qLgl=77=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E01C1C433DF
	for <linux-clk@archiver.kernel.org>; Thu, 18 Jun 2020 11:49:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C6A6E20890
	for <linux-clk@archiver.kernel.org>; Thu, 18 Jun 2020 11:49:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727788AbgFRLts (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Jun 2020 07:49:48 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:37599 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727081AbgFRLtr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 Jun 2020 07:49:47 -0400
Received: by mail-ot1-f66.google.com with SMTP id v13so4279658otp.4;
        Thu, 18 Jun 2020 04:49:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nz3DP0kIuKaqIce7U50AwSyDG8O6ikDysLwGRYoKy20=;
        b=CTacjTPmhROIHwsIvzf1Pm7U8rPUwt8G/fWcpiBWpEWq1TUSa3uhfsIqOpd+9rkfI6
         bzE+VvpW02I1U1Tl2s2HxAsVWE4toVY8bKMIJMgPkCCdHKS+fO5GrEriJBrnLV/4lLN9
         N2a3YxVlc40MA8IbF1nIQh38EMT3pQuLk824Y2FOqzuZsQZ9YvNDVGNblP9SU1FstEWJ
         4V7ezVa38OJC2ce2Km4szWd2QDMZASQqrfHLpGYk8ONAADUmXHeMB1kIMnOH3FvEPmBr
         Rb1f/6qq/ms920pgC+TBCpYbz+ZXm1bV/rueulwHBXpBv2S77o1SOPCk9QGDVBDvgfwU
         902Q==
X-Gm-Message-State: AOAM53197XnLfVa2nlDvdsqEkPyVmvohxY4ayvCTo6PluGcc8PbM8KKI
        pyjzNCF4AIvdNr3uaCt3gki0UPgV0raNwfbMs6w=
X-Google-Smtp-Source: ABdhPJzq1keajHjhqtJRP7uxEqr5waylgrQW7FbLL7H2zOU4npAu8KmKwZX/14aevAf4v3CKrRde/QplOjnQx7tJHcc=
X-Received: by 2002:a05:6830:141a:: with SMTP id v26mr3082718otp.250.1592480987379;
 Thu, 18 Jun 2020 04:49:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200616162626.27944-1-uli+renesas@fpond.eu> <20200616162626.27944-3-uli+renesas@fpond.eu>
In-Reply-To: <20200616162626.27944-3-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Jun 2020 13:49:36 +0200
Message-ID: <CAMuHMdV0OdubU1KPT+XBFj2153AH-hvzdVHpY_2n8+uC02L8aA@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] clk: renesas: rcar-gen3: mark RWDT clocks as critical
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Uli,

On Tue, Jun 16, 2020 at 6:26 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> Ensures RWDT remains alert throughout the boot process if enabled.
>
> This patch applies the change to the following SoCs: r8a7795,
> r8a7796, r8a77965, r8a77970, r8a77980, r8a77990 and r8a77995.

As "r8a7795" and "r8a7796" are a bit vague, I hope you don't mind if I
expand them to "r8a77950, r8a77951" resp. "r8a77960, r8a77961" while
applying.

> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v5.9.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
