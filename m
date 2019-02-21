Return-Path: <SRS0=pin/=Q4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE97DC4151A
	for <linux-clk@archiver.kernel.org>; Thu, 21 Feb 2019 18:33:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8F63120818
	for <linux-clk@archiver.kernel.org>; Thu, 21 Feb 2019 18:33:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727160AbfBUSdz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Feb 2019 13:33:55 -0500
Received: from mail-vk1-f196.google.com ([209.85.221.196]:46900 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727126AbfBUSdz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Feb 2019 13:33:55 -0500
Received: by mail-vk1-f196.google.com with SMTP id j68so7107153vke.13;
        Thu, 21 Feb 2019 10:33:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M+WOkWRBssrtpVfH1qKg/+BBfeLuK8WLv6dFxZ5Q2WU=;
        b=elKMSPLpmuCAlNoY9DWL3jm7wvLhjF4FDpwkj+zCR2WJQmq16kwTJCAuS/MZagFhrP
         Mz5stnGIoHf0AzBfl1+oCbGzv4vPRgQXqn2a902ckXscLzJtdpi7sbrQ6HLhhWUtjhD1
         mVLzzf2pFzRK0RsfCQpvlqmCzOEOEkqy/6OXGRPdHmQ4ZKpZZlKwfmlsG8iD3vHLJYJS
         XPfB8Ok73Drjrr5wbNlYqUIgOfhxOxS68/1TmW4VyQMk8FA6WtvKkMYXQipcxRD+Z4Yp
         O1jQpf0qybsODABihvTTmbEHDbPXlU4A2zhluDHimVuNk3tXTdUTcZ+5TcQQPl9/QpyR
         oezQ==
X-Gm-Message-State: AHQUAubGEfdDblaMGR0C5NNsghHONfyKMpsJQ9oLoyiK98+xOuyIl7Ln
        2z6VevlY68n2J/nwZ23PeSnnrD3wmGhSPVnsSpa1Dq1Z
X-Google-Smtp-Source: AHgI3Iale/6oc0Gtee5i6oMuxDhDTYH3loN3ZwTtpwuKVoiEFCLJY2LGbeVSI17Lw50WTsqie6U7JgDbelslq69XfK8=
X-Received: by 2002:a1f:a5d3:: with SMTP id o202mr14985576vke.40.1550774034566;
 Thu, 21 Feb 2019 10:33:54 -0800 (PST)
MIME-Version: 1.0
References: <1550678960-1264-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1550678960-1264-1-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 21 Feb 2019 19:33:42 +0100
Message-ID: <CAMuHMdU=qGGi0jgaN=uvsPPK1XkJChLAdwKZJ+cf4_rJt+gNYQ@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a774c0: Fix LAST_DT_CORE_CLK
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Feb 20, 2019 at 5:09 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> Enum LAST_DT_CORE_CLK needs updating as R8A774C0_CLK_CANFD
> was recently added and it's the core clock with the highest
> index.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Nice catch!
You only notice this kind of bug when you start referencing the clock
from DT, right? At registration time, the clock number space is shared with
internal core clocks, so no error is detected.
Can we improve that?

Fixes: 2a6efbc6da5d248c ("clk: renesas: r8a774c0: Add missing CANFD clock")
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Mike/Stephen: can you please take this one directly, as it is a fix for
clk-next?

Fabrizio: Looks like R8A774A1 has the same bug. Care to fix that as well?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
