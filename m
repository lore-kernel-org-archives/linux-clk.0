Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82DCDC433EF
	for <linux-clk@archiver.kernel.org>; Fri, 14 Jan 2022 13:47:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241398AbiANNr4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 14 Jan 2022 08:47:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236966AbiANNrz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 14 Jan 2022 08:47:55 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C358CC061574
        for <linux-clk@vger.kernel.org>; Fri, 14 Jan 2022 05:47:55 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: alyssa)
        with ESMTPSA id 870631F469D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1642168074;
        bh=mPZukNT2prSJfKzrqXnhU1Wq/pLiKiBo5wzaQ4Cxjrs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Jw1sK7HFZJ3M7Q21H7avJs9Bw2IwAY3ZxCrpoXlhn4iB6+daUb0UauvXwDDQmyqh9
         5jaTw34G3FoOAwtb9eYmS/u9CcKxznoTEmeWdCXmuANwlgs5NueCWCU7s40RRKjklR
         CSPY09G7TP2W15Uo/L6qvMjSkyAvr29k3Xl2GzW/yCmWL+6TipNSxLC1BG7xMjWoFP
         FCKTGkLkVt0w92yHmKEDEVI4mhQfyGUp7ardEB4PqD3dbQ7XuKR50/pYv6RWM2odXs
         oPa4fxj5mDqEvyRirVigsyYCLAnS8GROYQgzJGNegYuLJ6SjnLGvPxOCFFNrlPJbYw
         uDEQ5xDbkcLrw==
Date:   Fri, 14 Jan 2022 08:47:45 -0500
From:   Alyssa Rosenzweig <alyssa@collabora.com>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        linux-mediatek@lists.infradead.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Ikjoon Jang <ikjn@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Weiyi Lu <weiyi.lu@mediatek.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Nick Fan <Nick.Fan@mediatek.com>,
        Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH] clk: mediatek: Disable ACP to fix 3D on MT8192
Message-ID: <YeF/AYZ0DuKGwLLk@maud>
References: <20220110181330.3224-1-alyssa.rosenzweig@collabora.com>
 <eb6d11af-ff48-a366-d428-77bcaa250a8a@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb6d11af-ff48-a366-d428-77bcaa250a8a@arm.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

> > That links to an internal Google issue tracker which I assume has more
> > information on the bug. I would appreciate if someone from Google or
> > MediaTek could explain what this change actually does and why it's
> > necessary on MT8192.
> > 
> > At any rate, this register logically belongs to the MT8192 "infra" clock
> > device, so it makes sense to set it there too. This avoids adding any
> > platform-specific hacks to the 3D driver, either mainline (Panfrost) or
> > legacy (kbase).
> 
> Does this really have anything to do with clocks?

I have no idea. MediaTek, Google, please explain.

> In particular, "ACP" usually refers to the Accelerator Coherency Port
> of a CPU cluster or DSU, and given the stated symptom of the issue
> affected by it, my first guess would be that this bit might indeed
> control routing of GPU traffic either to the ACP or the (presumably
> non-coherent) main interconnect.

I'd easily believe that.

> If that is the case, I think this would logically belong as a SoC-specific
> quirk in panfrost, where we'd need to retrieve the syscon regmap for
> ourselves (see around line 800 of drivers/iommu/mtk_iommu.c for a similar
> example).

Alright. Doing this in panfrost seems ugly but if that's the right place
for it, that's the right place for it.
