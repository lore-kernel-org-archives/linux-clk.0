Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8084AC433EF
	for <linux-clk@archiver.kernel.org>; Wed, 27 Oct 2021 23:20:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 55E48610CF
	for <linux-clk@archiver.kernel.org>; Wed, 27 Oct 2021 23:20:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbhJ0XWs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 27 Oct 2021 19:22:48 -0400
Received: from gloria.sntech.de ([185.11.138.130]:40322 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229836AbhJ0XWs (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 27 Oct 2021 19:22:48 -0400
Received: from ip5f5a6e92.dynamic.kabel-deutschland.de ([95.90.110.146] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1mfsDR-0000HR-UR; Thu, 28 Oct 2021 01:20:17 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     linux-rockchip@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>
Cc:     kernel@esmil.dk, linux-clk@vger.kernel.org, mturquette@baylibre.com
Subject: Re: [PATCH 0/2] clk: rockchip: cleanup errors in (module-)driver handling
Date:   Thu, 28 Oct 2021 01:20:17 +0200
Message-ID: <5381956.U9aoDET0nm@diego>
In-Reply-To: <163536646616.15791.10163287623335903483@swboyd.mtv.corp.google.com>
References: <20211027132616.1039814-1-heiko@sntech.de> <163536646616.15791.10163287623335903483@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Am Mittwoch, 27. Oktober 2021, 22:27:46 CEST schrieb Stephen Boyd:
> Quoting Heiko Stuebner (2021-10-27 06:26:14)
> > Recent conversions or inclusions of rk3399 and rk3568 as platform-drivers
> > and subsequently allowing them to be built as modules introduced some
> > problems.
> > 
> > These two patches try to correct them.
> 
> By removing modular support? Ok.

It looked like the easiest way to go for now.

With all the clock-definitions as init-data still in both drivers, I don't think
anybody ever tested running this as a real module.

We could of course also remove all the __init + __initdata attributes, but
still wouldn't know if it actually runs as a module, without someone
building a real test environment for it.


Heiko


