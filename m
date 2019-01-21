Return-Path: <SRS0=Ex8p=P5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70E7EC2F3C0
	for <linux-clk@archiver.kernel.org>; Mon, 21 Jan 2019 13:40:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3E78720870
	for <linux-clk@archiver.kernel.org>; Mon, 21 Jan 2019 13:40:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728939AbfAUNkq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Jan 2019 08:40:46 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:44496 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728817AbfAUNkq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Jan 2019 08:40:46 -0500
Received: by mail-vs1-f68.google.com with SMTP id u11so12590295vsp.11;
        Mon, 21 Jan 2019 05:40:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DwusGuaOMVedpCqH4E0PvkfFeqVZecU+rsxHCfv9Ba4=;
        b=FQJMpuikcHLJxI38vPrJ3LjSSlYADj63pdmV6mnXSlCn+r0TqEQ+75VgySMj3rXE41
         GhK2Sxfp1qiXlZMDOV+wbzaHoIbIOrqczLe4xsLSDGsIqxfQY5o56kGSFI0ij+/a5UZP
         i2Qv+cUwOXGGA+9lQ+eYzGCo7QJe3HKbHLIXdnXGYt0Gng2eGnQFFKuEtMw0yckySPaf
         b46ydSLe87OEKa/LVlwHKlSmmZJuLOIIMRGS3y3+CdBkcPXrPodCuyMmOBlIcKlkCr5k
         1ZzxoqdPhjwFFmRW7/UQSLZinxVxOn2WH4wRmitLFMjbBEMCtxALWzGcvjyy+l/IIf/o
         JiGw==
X-Gm-Message-State: AJcUukcR6OiAg/TJ4l58V4QYSSmgWzPOErFbLs4gP07vyNYGJ42+uEyH
        g701PfQ9WMKR7CPwlxGj0olLZ20is9+6yZorJn8=
X-Google-Smtp-Source: ALg8bN4OxrZL4SEWGvZSqxKS5uIi+LdMSC8z9TCVODSN738vClPQa2SPE7WnAdYrKb4pNdJUmfKy8H8VltssnHXRE2s=
X-Received: by 2002:a67:d119:: with SMTP id u25mr11265699vsi.63.1548078045541;
 Mon, 21 Jan 2019 05:40:45 -0800 (PST)
MIME-Version: 1.0
References: <cfd91d1f-3b1e-c6c4-0975-7aac09383fdf@cogentembedded.com>
 <eef5ee23-311a-4367-43b5-b793357f06ef@cogentembedded.com> <20181214153332.47ukfkkgdrnsysmb@verge.net.au>
In-Reply-To: <20181214153332.47ukfkkgdrnsysmb@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 21 Jan 2019 14:40:33 +0100
Message-ID: <CAMuHMdXdFw2s0-kVZYJkiJ8TSYZJ3G774oNFXob9U=MkaU3=qA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] clk: renesas: rcar-gen3-cpg: add spinlock
To:     Simon Horman <horms@verge.net.au>
Cc:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Simon,

On Fri, Dec 14, 2018 at 4:33 PM Simon Horman <horms@verge.net.au> wrote:
> On Tue, Dec 04, 2018 at 10:49:44PM +0300, Sergei Shtylyov wrote:
> > Protect the CPG register read-modify-write sequence with a spinlock.
>
> Spinlocks are expensive, I think an explanation of why this is
> necessary would be worthwhile.

Some clock registers contain bits for multiple clocks.
Hence read-modify-write cycles on these registers should be protected
against concurrent accesses for multiple clocks.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
