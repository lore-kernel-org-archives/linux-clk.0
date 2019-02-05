Return-Path: <SRS0=JsB9=QM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E2D7C282CB
	for <linux-clk@archiver.kernel.org>; Tue,  5 Feb 2019 09:27:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EF65F2080F
	for <linux-clk@archiver.kernel.org>; Tue,  5 Feb 2019 09:27:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727248AbfBEJ10 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 Feb 2019 04:27:26 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:41183 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725898AbfBEJ10 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 5 Feb 2019 04:27:26 -0500
Received: by mail-vs1-f66.google.com with SMTP id t17so1717728vsc.8;
        Tue, 05 Feb 2019 01:27:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SFBrO/g436PyuazNFlVh9SjsTUxYLhiNA4degGEg0Pc=;
        b=jb3QhsbdPBmsdRNOb4ve8ANMK2GLDvDHzU/joGRZKxwWIYeKOpYG27ZXIPF5aVVaiE
         38u0psOTzEXK7FBJi90Fdp7a9rWAmDRzg8jm1VCshQkrZgj3+JVze4BQY4bY6E/sLSJ4
         aqmtbDtS8/d+bjTidjufAH8OKbrlvsNhzLFNDJ7HZu4614ftZpjGNletOTz3iA3tGWAK
         rqC8V+Kx+Jg3Kte1vnstLKGHce7D4cXVs6V70dT8RbxjoPiIWJRtIxiCQOL2uBd67TVP
         5IlVdLei39DEvh8w0zul3kGFCd404X6uvyAqX0fmsRbmMb/jwetaIOaG+q2O8siiiEGg
         8IHA==
X-Gm-Message-State: AHQUAuahF6sk+c8tvleWX7nT5jZZzhIGH5oZvzxQp+5AL4RRcDM7yHNg
        LQkAnAPoncTyHQiBAiIM8Ma02e1hgf9WaYUotESiOQc+
X-Google-Smtp-Source: AHgI3IaYI1fsoTJTR8/SSBBgNjsJ7KGOJPaDSOa7mVnZ3KrhnAgMz5dGoVTJTMrs4Pnx5ulymTcekJxKrUn1oMqP1yE=
X-Received: by 2002:a67:b60d:: with SMTP id d13mr1644431vsm.152.1549358845557;
 Tue, 05 Feb 2019 01:27:25 -0800 (PST)
MIME-Version: 1.0
References: <20190131094021.3092-1-horms+renesas@verge.net.au> <20190131094021.3092-5-horms+renesas@verge.net.au>
In-Reply-To: <20190131094021.3092-5-horms+renesas@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Feb 2019 10:27:14 +0100
Message-ID: <CAMuHMdXTcywH8UjnJcZr-Pff4eSkQG8KrHqyYtXCyVKoJp=nHQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] clk: renesas: r8a77990: Add Z2 clock
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jan 31, 2019 at 10:40 AM Simon Horman
<horms+renesas@verge.net.au> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> Adds support for R-Car E3 (r8a77990) Z2 clock.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> [simon: reworked changelog; rebased]
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
