Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35BB6C433E0
	for <linux-clk@archiver.kernel.org>; Fri,  5 Feb 2021 03:23:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC00764FBD
	for <linux-clk@archiver.kernel.org>; Fri,  5 Feb 2021 03:23:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230153AbhBEDX0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Feb 2021 22:23:26 -0500
Received: from mail-lj1-f181.google.com ([209.85.208.181]:39405 "EHLO
        mail-lj1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbhBEDXZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 Feb 2021 22:23:25 -0500
Received: by mail-lj1-f181.google.com with SMTP id u4so6062763ljh.6;
        Thu, 04 Feb 2021 19:23:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rja3IW88jr9tIZdmCSJYYXsY9wEVmDBMuxnwOuDy0Lw=;
        b=SiGA965sSZRWkxqZikup+6gkTxyrjHOTO0Kl+p/PQ9RJpPRkUSGqfIhV2cAZgcWGWA
         m5a+AWT/+BExM4EV/CXtAd//YICV+ZFnGCTQKVXj+tmVpE7beQBPy6+NGAII2LF3Droj
         aM7EJ+DBkIntIskNR29Gk1wVzCl/Ml8PMFn5jsVQ0flhGE1rlQHMaYXboN3viJ8e//In
         V4FVhJOHEb1JJPFKcxcYfBITRa0iJHPvJlHkHqmcinnSZTRDvDFT2j0QMSvgicjbeSkT
         hfjZ7OKM5ffG+ZhVi/cAIrzhAEWIKmRaGPDm+cLus0ypqXtCSyToV5RPTlojpBbnYC+u
         8YJw==
X-Gm-Message-State: AOAM533oVrASwGS8OxxmTZtRUhDR3pSSUv0RAQKZ8jeWfGnZLjFw2OrG
        Xxgr7ufo/KZb+sEoa9JgE6mjKE2r8JjFNQ==
X-Google-Smtp-Source: ABdhPJy9CvY6pY4zNGadUz9e1rpBfweTCGZ+Uvv22kcvRrVuPDqox8BXsrEa9b6FsLNwex9uqMS0Gg==
X-Received: by 2002:a2e:95ce:: with SMTP id y14mr1439233ljh.287.1612495362688;
        Thu, 04 Feb 2021 19:22:42 -0800 (PST)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id z5sm828236lft.51.2021.02.04.19.22.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Feb 2021 19:22:42 -0800 (PST)
Received: by mail-lf1-f53.google.com with SMTP id h7so7841952lfc.6;
        Thu, 04 Feb 2021 19:22:41 -0800 (PST)
X-Received: by 2002:ac2:561b:: with SMTP id v27mr1399561lfd.233.1612495361845;
 Thu, 04 Feb 2021 19:22:41 -0800 (PST)
MIME-Version: 1.0
References: <20210204184710.1880895-1-jernej.skrabec@siol.net> <20210204184710.1880895-2-jernej.skrabec@siol.net>
In-Reply-To: <20210204184710.1880895-2-jernej.skrabec@siol.net>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Fri, 5 Feb 2021 11:22:31 +0800
X-Gmail-Original-Message-ID: <CAGb2v652cCbwvdvb8RA4zH41cnOKcqbVNosiU1eCGPjGpWUGcg@mail.gmail.com>
Message-ID: <CAGb2v652cCbwvdvb8RA4zH41cnOKcqbVNosiU1eCGPjGpWUGcg@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH 1/5] clk: sunxi-ng: mp: fix parent rate
 change flag check
To:     Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     Maxime Ripard <mripard@kernel.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        Andre Heider <a.heider@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Feb 5, 2021 at 2:48 AM Jernej Skrabec <jernej.skrabec@siol.net> wrote:
>
> CLK_SET_RATE_PARENT flag is checked on parent clock instead of current
> one. Fix that.
>
> Fixes: 3f790433c3cb ("clk: sunxi-ng: Adjust MP clock parent rate when allowed")
> Tested-by: Andre Heider <a.heider@gmail.com>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
