Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04E22C43381
	for <linux-clk@archiver.kernel.org>; Mon,  8 Feb 2021 11:23:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C032664EAC
	for <linux-clk@archiver.kernel.org>; Mon,  8 Feb 2021 11:23:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232214AbhBHLX2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Feb 2021 06:23:28 -0500
Received: from mailoutvs33.siol.net ([185.57.226.224]:56659 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S232854AbhBHLUL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 Feb 2021 06:20:11 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id AFB935220A4;
        Mon,  8 Feb 2021 12:19:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id cBk2nonlnVtu; Mon,  8 Feb 2021 12:19:00 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 63D4F522137;
        Mon,  8 Feb 2021 12:19:00 +0100 (CET)
Received: from kista.localnet (cpe-86-58-58-53.static.triera.net [86.58.58.53])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Postfix) with ESMTPA id BAF935220A4;
        Mon,  8 Feb 2021 12:18:58 +0100 (CET)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     linux-sunxi@googlegroups.com
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
        Andre Heider <a.heider@gmail.com>, wens@kernel.org
Subject: Re: Re: [linux-sunxi] [PATCH 4/5] drm/sun4i: Fix H6 HDMI PHY configuration
Date:   Mon, 08 Feb 2021 12:18:58 +0100
Message-ID: <2739213.CQdApTN3EZ@kista>
In-Reply-To: <CAGb2v64BpizczmSJdompGosFwWWayNscWvW-7oARLgwNNo=teQ@mail.gmail.com>
References: <20210204184710.1880895-1-jernej.skrabec@siol.net> <20210204184710.1880895-5-jernej.skrabec@siol.net> <CAGb2v64BpizczmSJdompGosFwWWayNscWvW-7oARLgwNNo=teQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Dne petek, 05. februar 2021 ob 04:22:56 CET je Chen-Yu Tsai napisal(a):
> On Fri, Feb 5, 2021 at 2:48 AM Jernej Skrabec <jernej.skrabec@siol.net> 
wrote:
> >
> > cpce value for 594 MHz is set differently in BSP driver. Fix that.
> >
> > Fixes: c71c9b2fee17 ("drm/sun4i: Add support for Synopsys HDMI PHY")
> > Tested-by: Andre Heider <a.heider@gmail.com>
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> 
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>

Thanks, but I figured that this change is not the proper one. It still gives me 
issues with my TV. Proper change is to fix current and voltage settings below. 
I'll replace this patch in v2.

Best regards,
Jernej

> 
> -- 
> You received this message because you are subscribed to the Google Groups 
"linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an 
email to linux-sunxi+unsubscribe@googlegroups.com.
> To view this discussion on the web, visit https://groups.google.com/d/msgid/
linux-sunxi/
CAGb2v64BpizczmSJdompGosFwWWayNscWvW-7oARLgwNNo%3DteQ%40mail.gmail.com.
> 


