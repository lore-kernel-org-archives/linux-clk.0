Return-Path: <SRS0=JsB9=QM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA98FC4151A
	for <linux-clk@archiver.kernel.org>; Tue,  5 Feb 2019 09:30:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7C2822175B
	for <linux-clk@archiver.kernel.org>; Tue,  5 Feb 2019 09:30:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727573AbfBEJaZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 Feb 2019 04:30:25 -0500
Received: from mail-ua1-f65.google.com ([209.85.222.65]:46387 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726731AbfBEJaZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 5 Feb 2019 04:30:25 -0500
Received: by mail-ua1-f65.google.com with SMTP id v24so884337uap.13;
        Tue, 05 Feb 2019 01:30:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8oORcRbFauZKF4z73t6MSzllV6Ekq2Xjm3pH+EVV3C0=;
        b=TnzX/E3/ZedMdIjv7ns1TqJTpqC2a27frSN6vcOGn4d5oJ0Maubc2auxrQMYn+CqIi
         olHPryJzl0WlD5gVGnqri6KZNnu7eAKl6HnuA1DtZSD5/Gm5Yp7I5WxG3uu3voDIxCdc
         sK76jn2bpyfOYkzAeXHsa4gYmeSe9mzJma6r5CI95HYoxHbZIvtT3SLeGCJVBhMFsqie
         kHpcAWcqhkkEcHh1GGtFflN//DRXuqpK004dQR0p91CVKeyXImfhRayc+hb8I9VzPUk5
         GDb8U9kPi6DHEgiZEwlgE2wMDCSi+FyPprT4m6r2kPQiC9GXhnPRmE29/sQmdGqHZ6ma
         /FLw==
X-Gm-Message-State: AHQUAub5xXQM8H2WfSZd1EUH6ocmMaO7f971g7smOGYwGLOKNxksCZ1Q
        adSahnXLTPBbhJtvKPwiRql2Vp9NWJBH10yRNs8=
X-Google-Smtp-Source: AHgI3IbiOtAAEc4YuP0ZMtxrpbdfXXQxd4zSfFHYgzBZYzfPYGHCdkr9ov+TJnDjpXWH6ElOybJrgQkGmwHC3cj71oI=
X-Received: by 2002:ab0:210e:: with SMTP id d14mr1467578ual.20.1549359024530;
 Tue, 05 Feb 2019 01:30:24 -0800 (PST)
MIME-Version: 1.0
References: <20190131094021.3092-1-horms+renesas@verge.net.au>
In-Reply-To: <20190131094021.3092-1-horms+renesas@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Feb 2019 10:30:13 +0100
Message-ID: <CAMuHMdW+hTQKQvnLfsoNQRM5g=NbZaSGzvr3xczQjd58TVBuDQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] clk: renesas: r8a77990: Add Z2 clock
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Simon,

On Thu, Jan 31, 2019 at 10:40 AM Simon Horman
<horms+renesas@verge.net.au> wrote:
> this series adds the R-Car E3 (r8a77990) Z2 clock as a clock
> with both a fixed and variable divisor with a parent of PLL0.
>
> In order to do so this series:
>
> 1. Parameterise Z and Z2 clock fixed divisor in shared Gen-3 CPG
>    driver code to allow fixed divisors other than 2 - the E3 Z2
>    clock has a fixed divisor of 4
>
> 2. Parameterise offset of Z and Z2 clock controll bits -
>    the offsets on E3 differ to other R-Car Gen 3 SoCs
>
> 3. Support Z and Z2 clocks with high frequency parents.
>    The parent of the E3 Z2 clock, PLL0, is 4.8GHz and thus
>    when expressed in HZ must be treated as a 64bit value.
>
> 4. Actually add the E3 Z2 clock
>
> As a follow-up, as per reading the documentation, the RZ/G2E (r8a774c0)
> Z2 clock is added.

Thanks, this looks good to me.
Before queuing in clk-renesas-v5.1, to allow more testing, I'm importing
this into a topic branch, to be included in today's renesas-drivers release.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
