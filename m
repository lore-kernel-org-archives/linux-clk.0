Return-Path: <SRS0=qH24=R5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D468DC43381
	for <linux-clk@archiver.kernel.org>; Tue, 26 Mar 2019 10:40:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A43172084B
	for <linux-clk@archiver.kernel.org>; Tue, 26 Mar 2019 10:40:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726111AbfCZKkW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 Mar 2019 06:40:22 -0400
Received: from mail-ua1-f65.google.com ([209.85.222.65]:38868 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbfCZKkV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 26 Mar 2019 06:40:21 -0400
Received: by mail-ua1-f65.google.com with SMTP id d4so4097168uap.5;
        Tue, 26 Mar 2019 03:40:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5iP+STlFhD4RoMcmQRk2ZVjiGsDY7ZJsOQDtg+IgTNc=;
        b=Hwp/A7y9HV7W5CyjEFrD3S0OkVNZaVps4liOwmyd5QZAF/aB4UMtasTNPVq4eXjTtG
         dBmNJU8TOosK68Hta7UFrdxlDhtb9B8Ra7TLa4uFN3y8QSpNWRrtnrDfBoCgimHV9O8t
         ahOqJgsAaDr5VqtYEoudWlaDT3uZb4K6HzBY9T+MJvHP96fKPWzFaEANa92Akz4i76Ps
         DxI/VPTh0f/pk9yNcZDKZDN5cGsEHYhb9j4gj7B7H1g6OcrfqI4M0o+dEzYJKKErBphA
         3km934QgGgZRGpp/8GLYOFRoRUSq66ygbV9EKKlyTQfhCmlFs3rzfRPNjA3mHg+7m8sK
         aqpw==
X-Gm-Message-State: APjAAAVCOYw++fZq8D2cHd0GTBuP6QcmXvvacXEyVrzostpq2ufZw203
        UL+0ZN+2CEYqHVZd1XfRnXRcaJPzRjTgfdkOR20=
X-Google-Smtp-Source: APXvYqxBBCfPQH1WC+kbWcjLQQRr8XVeEh+MBUlQ9dZxi2POkkoOBqk/9dr3G1Ubi8FNtZeBUidjVxT6/SXT94N/+cA=
X-Received: by 2002:ab0:7797:: with SMTP id x23mr5831012uar.28.1553596820862;
 Tue, 26 Mar 2019 03:40:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190325163556.22025-1-horms+renesas@verge.net.au>
In-Reply-To: <20190325163556.22025-1-horms+renesas@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 26 Mar 2019 11:40:08 +0100
Message-ID: <CAMuHMdV9gnJP8meHb=qKcyLCz0HWwt7EZ78zHGuZWReuPbnYcA@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] clk: renesas: r8a77990, r8a774c0: Add Z2 clock
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Simon,

On Mon, Mar 25, 2019 at 5:36 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> this series adds the Z2 clock as a clock with both a fixed and variable
> divisor with a parent of PLL0 to the CPG-MSSR drivers for the R-Car E3
> (r8a77990) and RZ/G2E (r8a774c0) SoCs.

Thanks, queued in clk-renesas-for-v5.2, after dropping the extra semicolon
in patch 1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
