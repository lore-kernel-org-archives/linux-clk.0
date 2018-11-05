Return-Path: <SRS0=vj01=NQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEF5AC46475
	for <linux-clk@archiver.kernel.org>; Mon,  5 Nov 2018 13:20:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AF35F2081D
	for <linux-clk@archiver.kernel.org>; Mon,  5 Nov 2018 13:20:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF35F2081D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729764AbeKEWkL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Nov 2018 17:40:11 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:43249 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728966AbeKEWkL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Nov 2018 17:40:11 -0500
Received: by mail-vs1-f65.google.com with SMTP id k14so5040662vsm.10;
        Mon, 05 Nov 2018 05:20:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sgLdTGQbm/YzKoI1UNTd6GdIDdfrItjDa8sRBx6iGBM=;
        b=amoo6T3WOJydns4auCq2o9zFKiFeVmw/NXoVXiVhKFUwfyFO7iumI+lfO6EP6aBMde
         LzRA1sF3JTZ3SEsI/WO8jAN07qUDWKfceOtKIf3nt1i/kyA0YPv0WTACnXlD3jHbsgKu
         VNpdWnrfU87vbecilbbfWren6CG7RmB7ENzl3Lfm4SXOW+JGkY29PeauFtZ+jTLj6Jp9
         SxowDrV2D9M0aam5W41SWwTIci+Dv/cxJOGA7LGJuiRCflwS8B0X2iMyPC7T2xBRRNaR
         TJa4CZa8bEY9ZdHxGXRefQcGD2hAdyalatHh7FVmY7C3mi3+lxBJo8yWaMYqMbHuqiYa
         QKsQ==
X-Gm-Message-State: AGRZ1gLDyQ00PwWq46V87eUQQ27NUdlEcH212dEzVc5Zb5bH/RSLqPKT
        unO6MBqD6v9d0tvJhbsh1lb42Rbk7t3GxLzrSkU=
X-Google-Smtp-Source: AJdET5e/Shn/XaZTP1Rxdh2gvbnFt/5NtI7ZM9SBP8xKt+Tt/GDCTisRRJbzZFrfluOTj81A0A/QgP5L9PUSZ/mTx8o=
X-Received: by 2002:a67:b404:: with SMTP id x4mr9407122vsl.152.1541424026575;
 Mon, 05 Nov 2018 05:20:26 -0800 (PST)
MIME-Version: 1.0
References: <5b7895ac-11c1-ac2d-837b-56726bc6226a@cogentembedded.com> <5a5c65f1-d446-9445-4e2a-579f57f00abf@cogentembedded.com>
In-Reply-To: <5a5c65f1-d446-9445-4e2a-579f57f00abf@cogentembedded.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 5 Nov 2018 14:20:14 +0100
Message-ID: <CAMuHMdWbbLrAqTb2OyzA3hgFRaRCPqs76OokwY9uRw3U-OYnjw@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a77970: add RPC clock
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

On Fri, Nov 2, 2018 at 8:25 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On R-Car V3M (R8A77970), the RPC/RPCD2 clocks are output by the common
> divider. Describe them, as well as the RPC-IF module clock.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v4.21, with s/add/Add/ and s/clock/clocks/.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
