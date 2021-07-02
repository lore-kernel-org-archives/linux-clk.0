Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BE66C11F68
	for <linux-clk@archiver.kernel.org>; Fri,  2 Jul 2021 07:17:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7AF18613F3
	for <linux-clk@archiver.kernel.org>; Fri,  2 Jul 2021 07:17:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230040AbhGBHTp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Jul 2021 03:19:45 -0400
Received: from mail-vs1-f47.google.com ([209.85.217.47]:45797 "EHLO
        mail-vs1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230026AbhGBHTp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Jul 2021 03:19:45 -0400
Received: by mail-vs1-f47.google.com with SMTP id h5so3532270vsg.12
        for <linux-clk@vger.kernel.org>; Fri, 02 Jul 2021 00:17:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VdXEDVebU/GgQ0WAaFLvez5LUZE6mRsWB7BEASruOTk=;
        b=QzRARBZL0q3zWhUGDMIvTP89u8iLmUaku0ctNJ0177BKrBPqqn3p2pVR8ZD8wDvT3w
         rA2QALlTgM2DlBOfwE0gumS/Bg0BcgEPjzCmhqUq4HVvxeuys7wisPlnK0R29gEWJMYm
         od4YJ2t2FbIGcPjpM6QLINXv5UPf6YI7NEbdMjYYVO34HunLtKpABoM/Y2gCAwwZcS1p
         78lvJmOfDUQKMXg1BL3teRvlK/sRrMDlMS/0LJw2PSZrFbhC4HrAIyYzWUrix8Rywc1+
         /bWEOsFhvWLFvCNzN/R7H932obieDyRCMP/syXUQ2QQRyF6tXjzCSnBA+YOMFB4/T7ui
         HuLw==
X-Gm-Message-State: AOAM532prUJRCgO5qyNdh2n/2WYcTLOPHAGdQuVckyjznci61BXlptKd
        lOPEBSwILyFNHIPqqkK109yafdzj9WTF8AjKfWQ=
X-Google-Smtp-Source: ABdhPJyP+QXZPkF6YUlSUvB2wFAWVBaDmmhmqpGztncwlpTXjsIvCLGQHuoHeQxJ1XWBnK4UtAXi8tX4EkeoAuXQ09A=
X-Received: by 2002:a67:f7c2:: with SMTP id a2mr4941272vsp.3.1625210233261;
 Fri, 02 Jul 2021 00:17:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210701182012.3421679-1-sean.anderson@seco.com> <20210701182012.3421679-2-sean.anderson@seco.com>
In-Reply-To: <20210701182012.3421679-2-sean.anderson@seco.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 2 Jul 2021 09:17:02 +0200
Message-ID: <CAMuHMdWbF23p_hU4Dudd025=xEm5S6N6Q1y3Mi5Mw8sMRVBSCw@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] clk: vc5: Use dev_err_probe
To:     Sean Anderson <sean.anderson@seco.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Adam Ford <aford173@gmail.com>, Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jul 1, 2021 at 8:20 PM Sean Anderson <sean.anderson@seco.com> wrote:
> Convert uses of dev_err + return to dev_err_probe.
>
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
