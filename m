Return-Path: <SRS0=Lp8A=MI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A962C43382
	for <linux-clk@archiver.kernel.org>; Wed, 26 Sep 2018 13:48:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1D6CD208E4
	for <linux-clk@archiver.kernel.org>; Wed, 26 Sep 2018 13:48:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D6CD208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727043AbeIZUBM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 26 Sep 2018 16:01:12 -0400
Received: from mail-ua1-f65.google.com ([209.85.222.65]:39667 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726841AbeIZUBL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 Sep 2018 16:01:11 -0400
Received: by mail-ua1-f65.google.com with SMTP id g18-v6so10853810uam.6;
        Wed, 26 Sep 2018 06:48:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gudCIdLPfF4zNuZPwye0bj7xxyAzCFY4IYg190bK32I=;
        b=hbsXuPtCjQkN8ElMA3Z+4qMzZh9cBZ0cv5YQA8iCdGSbg/uxYxm794FCi1Q3btTyMx
         xjyZQveLpgvUcasYNkZ4gjR2a0877NmdiOzuKcqBTJ3AXsnmCoPjMXS15Rh6WB1/vf7c
         UeIFsRHQE0UvH4MbccTIsRZYYpsQdhbxNCW505OndaGztYLA1vox37tWghJccXFWLuwm
         eI3UFogILmECSRg0Aua9OEIgD4k2rIdK+Thosptc/NDFEJbESgm8b/ybfUtvF/dLEcUP
         mscDlxVBQr2qDBTOuy+Bah+FtgPPowfqqNHRmtDGOoLSxrguAOqrocdeEBDPF+O+2nMR
         HGbg==
X-Gm-Message-State: ABuFfoiVxhBRxzgzPaWARKWUNhE6+0UzGVxhNxMAjuX8tli+14OiFKO4
        kdG58DdwUZrvpm4zTGZgbljf3UGP1WYQ0OEdKgI=
X-Google-Smtp-Source: ACcGV62hNCYsoblURZYGEF/HJ3bZopg/dwiuDlYTXLXh8cbWQEOLG7leQ0nJlXdfrlcxn+qG3ydV8I+hWW8+jHTfvh0=
X-Received: by 2002:ab0:5101:: with SMTP id e1-v6mr2004876uaa.0.1537969688370;
 Wed, 26 Sep 2018 06:48:08 -0700 (PDT)
MIME-Version: 1.0
References: <20180926133956.79788-1-chris.brandt@renesas.com>
In-Reply-To: <20180926133956.79788-1-chris.brandt@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 26 Sep 2018 15:47:56 +0200
Message-ID:
 <CAMuHMdUiwwroXOS=b0uUEQ8dAPvMYc=xq+V7wu3TL2A7EcQKUA@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r7s9210: Add SPI clocks
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180926134756.TPhiRY4K8yV6uiScFp2NKyKk8jD6pOD_CojNsrNzHrI@z>

On Wed, Sep 26, 2018 at 3:40 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Add RSPI clocks for RZ/A2.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v4.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
