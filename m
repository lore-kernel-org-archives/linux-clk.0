Return-Path: <SRS0=Ex8p=P5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97834C2F3A0
	for <linux-clk@archiver.kernel.org>; Mon, 21 Jan 2019 13:25:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 682FB2085A
	for <linux-clk@archiver.kernel.org>; Mon, 21 Jan 2019 13:25:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728986AbfAUNZ5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Jan 2019 08:25:57 -0500
Received: from mail-ua1-f68.google.com ([209.85.222.68]:33687 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728570AbfAUNZ4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Jan 2019 08:25:56 -0500
Received: by mail-ua1-f68.google.com with SMTP id t8so6915320uap.0;
        Mon, 21 Jan 2019 05:25:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rP5xCzbbSaR6Hox2/H6phC2fM/sL7Svt1wCbNfOMRC8=;
        b=dQWvV9GaxRy105ZfJMSIXyhUzDrmyWcdqyLbXC9LWWHk4XZFm4G3b3OzhcMRlNv8hX
         YEmgfUy4UZ/8zOioiIKmVxK5PtrEvDdcMP9kVzd1SSAzwY0lzHlw+1L9R8yRGFRls7V0
         X/JQHgXQFwkbqM1ADkcu9njt+DpeFsJxvixTCTlco678dkKM0zhCDmo/jDhrzojisxAa
         sPbbDyKsmJZCRzlDfX+WlNoc+QyQBW0vrVTJvyx302MjamZlH2+XpUZfEod5b0UhL4ba
         1MuctxZjV4+aQ+30XuWHktMZ/vJLxTGlxnj2vf0NZAOv/EfL+a9e3IkLHdpxZGQa1Yvv
         1YbA==
X-Gm-Message-State: AJcUukcqN60IGXl4JX5TLq9e/oljiIU1ZsDtvMleptzst9iHpOljXlyy
        2IlBlH2OVsuBlONgJYSlBnVgOGlOMnzyRGRRmuc=
X-Google-Smtp-Source: ALg8bN5xYX+6xp0H3N90J8Wna2rpSXf1xncOf3cQuU5h3ogyv07DKa1N8edHibgFzS91JrYgNvOVsRwiLAw63s9Ff8I=
X-Received: by 2002:a9f:364a:: with SMTP id s10mr11273771uad.78.1548077155329;
 Mon, 21 Jan 2019 05:25:55 -0800 (PST)
MIME-Version: 1.0
References: <cfd91d1f-3b1e-c6c4-0975-7aac09383fdf@cogentembedded.com> <8d3bd6b4-61eb-ceef-dc99-eb26c83f9e03@cogentembedded.com>
In-Reply-To: <8d3bd6b4-61eb-ceef-dc99-eb26c83f9e03@cogentembedded.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 21 Jan 2019 14:25:42 +0100
Message-ID: <CAMuHMdWUGYdPth+07PuLapHMuk7=WCgoO9uNMs1-7NyHU23ppw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] clk: renesas: rcar-gen3-cpg: factor out cpg_reg_modify()
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

On Tue, Dec 4, 2018 at 8:48 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> There's quite often repeated sequence of a CPG register read-modify-write,
> so it seems worth factoring it out into a function -- this saves 68 bytes
> of the object code (AArch64 gcc 4.8.5) and simplifies protecting all such
> sequences with a spinlock in the next patch...
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

I believe my
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
for v1 is still valid.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
