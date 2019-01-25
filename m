Return-Path: <SRS0=Vu82=QB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35D8DC282C6
	for <linux-clk@archiver.kernel.org>; Fri, 25 Jan 2019 10:26:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 06935218B0
	for <linux-clk@archiver.kernel.org>; Fri, 25 Jan 2019 10:26:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726317AbfAYK0D (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Jan 2019 05:26:03 -0500
Received: from mail-vs1-f67.google.com ([209.85.217.67]:41611 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726111AbfAYK0D (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Jan 2019 05:26:03 -0500
Received: by mail-vs1-f67.google.com with SMTP id t17so5369026vsc.8;
        Fri, 25 Jan 2019 02:26:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cWiLb0a0b96kmCXfoz/173y0DNK+lBjqDGVE9QIY6z4=;
        b=ZLIU3uYtvhAJo3AT2g/gv29zjQ1k0O0+lihG4OADGhGdVi5PiA1kyqnW0DEdw4uaIC
         e3FRRRIK5mBwpLTba3aXr3LxjgcBH9nlsBECQHLX+XcYp1E0ZEcCzBEROl62R4uEkdSX
         CI83jMl1DN0Bv6F90963zEwXVY8XQeg/Tv4qxy69BqOlU8Dh2Ch55+P2OZWJXv6tvclB
         PSyByOte75OXxjyvggpyR+nlW76kXLWdHgPJo4M3JD1uo+CwwjkpYGMFjcH72tnVe8GP
         9DvKxfx/xw9Rhdq7QYWzagIREjTErMQjpZVb0TWkrnAPCOMbcYQABN12jlm0ne+O/LEy
         KB5Q==
X-Gm-Message-State: AJcUukcQo5Yay4/Mz/MYtUq848yRrTuio8x3fShMFDOVJCLirGrMyL/i
        atF3HwFroGeL4aFmwSN12E5fS8cu5kCuXxafw6I=
X-Google-Smtp-Source: ALg8bN7dzz1La7mMrYHpzrJWhWazzt6eyiJy9L0IM+dz/88RDd1/wv0KsaW0vPed0uPRVkyMqAxz4sAMjwj3oSPwZjc=
X-Received: by 2002:a67:b60d:: with SMTP id d13mr4380695vsm.152.1548411962423;
 Fri, 25 Jan 2019 02:26:02 -0800 (PST)
MIME-Version: 1.0
References: <f1c53dd5-2dc5-9f11-44e3-8e222ed21903@cogentembedded.com>
In-Reply-To: <f1c53dd5-2dc5-9f11-44e3-8e222ed21903@cogentembedded.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 25 Jan 2019 11:25:50 +0100
Message-ID: <CAMuHMdUMW9gyVsfgwNZm0npZOXi95DB5-fAkqAt0ZXDGUUF4YQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Renesas R8A77980 CPG/MSSR RPC clock support
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Sergei,

On Tue, Jan 22, 2019 at 8:55 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Here's the set of 4 patches against the 'clk-renesas' branch of Geert Uytterhoeven's
> 'renesas-drivers.git' repo. We're adding support for the R8A77980 CPG/MSSR RPC clocks...
>
> [1/4] clk: renesas: rcar-gen3-cpg: factor out cpg_reg_modify()
> [2/4] clk: renesas: rcar-gen3-cpg: add spinlock
> [3/4] clk: renesas: rcar-gen3-cpg: add RPC clocks
> [4/4] clk: renesas: r8a77980-cpg-mssr: add RPC clocks

Thank you, queuing in clk-renesas-for-v5.1...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
