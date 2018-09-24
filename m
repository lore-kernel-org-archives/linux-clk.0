Return-Path: <SRS0=Dsg5=MG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A421C433F4
	for <linux-clk@archiver.kernel.org>; Mon, 24 Sep 2018 08:04:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 09A2D20C0A
	for <linux-clk@archiver.kernel.org>; Mon, 24 Sep 2018 08:04:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09A2D20C0A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727335AbeIXOFr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Sep 2018 10:05:47 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:33114 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbeIXOFr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Sep 2018 10:05:47 -0400
Received: by mail-ua1-f68.google.com with SMTP id i4-v6so7947313uak.0;
        Mon, 24 Sep 2018 01:04:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wVYYDI8d34KV6qgp5nkLD+SQVaAPrc1x0QC+9WB2O/Q=;
        b=KgAtSf4XZjNdqTB1Kx89489WHnakOpcxYmIHINHkfU6qncQDj3SFAjYkPAhcUjHkkD
         QgOqd8n8DBxjRRUJO/3Ydx6LElYcBnqGaC6lBtRVDe8Uxjac5LvbuAtvQIs6+AY+7Zz1
         LSjGre1KZp26azZyI95LoR5HE9WZaU4wdG0Pt631O2oRLoKFuJzAIjq0ui4AlvRUMqtZ
         J6pL4dh3GPwWfWUe4915vDVWtKefxvkxH2/mq2mv4+NUlUhNZi+B9Izf7fIGuF5rb4GW
         fZ6+g2v+4/YC6Ef/5WLxaRZWKmAGkYs6B4iInGeftFdxFZCX/f18vQLRaj2LEYKsZXdO
         awRQ==
X-Gm-Message-State: ABuFfohDyPk6nHOWlJZ+0zHt86Q6i+45D0irCU3KmZdmZIwqZFQIJqk3
        E+wywnbcGHL+FpYmvfC5+86V2jYWRdOrZV4iAuCmjifi
X-Google-Smtp-Source: ACcGV61rRXp76LYUcMLjUR/9PH3A6xIxzH3hpEPViXjndtLvJUmTBSpQW7q7Rr5KCDjk7KOTLC4V7h0P7tT2pMwaGOg=
X-Received: by 2002:a9f:35f1:: with SMTP id u46-v6mr946987uad.20.1537776296303;
 Mon, 24 Sep 2018 01:04:56 -0700 (PDT)
MIME-Version: 1.0
References: <5b7895ac-11c1-ac2d-837b-56726bc6226a@cogentembedded.com> <53539d21-bb00-eb11-bfde-206f3b7e3fe0@cogentembedded.com>
In-Reply-To: <53539d21-bb00-eb11-bfde-206f3b7e3fe0@cogentembedded.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 24 Sep 2018 10:04:44 +0200
Message-ID:
 <CAMuHMdVCa6SgOJnQKXq9xGkhvBeXfj7eo3+F4JaNtDY2QEF8Xg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a77970: add TPU clock
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180924080444.m9fZ7I248WPlkvXTo_HY9YYI-7hB9qLNCEZMGDd7se8@z>

On Wed, Sep 19, 2018 at 8:10 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> The TPU0 clock wasn't present in the original R8A77970 patch by Daisuke
> Matsushita, it was added in a later BSP version...
>
> Based on the original (and large) patch by Vladimir Barinov.
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v4.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
