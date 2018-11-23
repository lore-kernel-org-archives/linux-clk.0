Return-Path: <SRS0=uK82=OC=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6F31C43441
	for <linux-clk@archiver.kernel.org>; Fri, 23 Nov 2018 09:44:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 784EC20685
	for <linux-clk@archiver.kernel.org>; Fri, 23 Nov 2018 09:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 784EC20685
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405450AbeKWU2W (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Nov 2018 15:28:22 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:41178 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394486AbeKWU2W (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 23 Nov 2018 15:28:22 -0500
Received: by mail-vs1-f68.google.com with SMTP id t17so6813826vsc.8;
        Fri, 23 Nov 2018 01:44:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/1igu8cONBppNQIgmCuVbiiPMT/8WUlLMuY6NIbZGGo=;
        b=HyGMpPSXQWr1ErBwzsR/7Ta+Q/XXStduRVItnwbGGoGpZ2UAOXKTrS23ONkavIN+0z
         o0uPpSAwEx26pdIGVmq+tvPDCNY6Xtioq/uJbOmQ4YogTXwSe8N3kZSIjOMvB4bVqiEr
         WU+2kpx13sR2kZhJk4KIXlmdroIqBY5MQTrJ+ZgTGpolNx1GsS2D2VET6KMfocXSGv/7
         tWAIux4wZN6H0gMT8LpSKaCR5No3QPSX+6a8lmW0ibswcFzkDRWMQKgZXWqzmjBydXQw
         CuSWVQzE1qdgnJ4r/t1MnTB9eqZRl3eI12q8oE0sufWbX1T1XYkNgf0gcVxNF2CnGTHP
         J64w==
X-Gm-Message-State: AGRZ1gKsPHQ8VxM/EHxs1qxXnUwzJ/dChlDIN1Vi6W8GQ0EuQA6f9HV6
        Gq4tA5zA3yKU1M4cg8Z1rYlMu4ihWQSPwBLZtbk=
X-Google-Smtp-Source: AJdET5e9HiFIbyUQbZzrPGp+7GJNjv8XzrzO1pTR68CM29FXh41rN+g78SMY6G8z6SZdclA9rKwJmYLesKOJ8FypBBY=
X-Received: by 2002:a67:f43:: with SMTP id 64mr6288732vsp.166.1542966290183;
 Fri, 23 Nov 2018 01:44:50 -0800 (PST)
MIME-Version: 1.0
References: <c79d3733-437a-55dc-d946-99521b79ec20@cogentembedded.com> <8cca22f7-dbd7-2da0-2f58-e490982d2f6c@cogentembedded.com>
In-Reply-To: <8cca22f7-dbd7-2da0-2f58-e490982d2f6c@cogentembedded.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 23 Nov 2018 10:44:37 +0100
Message-ID: <CAMuHMdXd0MXVYOPtxh0BVueDm7sU4P=YtKQogmeY4t=b-zwTQw@mail.gmail.com>
Subject: Re: [PATCH 1/4] clk: renesas: rcar-gen3-cpg: factor out cpg_reg_modify()
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

On Thu, Nov 22, 2018 at 7:39 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> There's quite often repeated sequence of a CPG register read-modify-write,
> so it seems worth factoring it out into a function -- this saves 68 bytes
> of the object code already (AArch64 gcc 4.8.5) and will save more with the
> next patches...
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
