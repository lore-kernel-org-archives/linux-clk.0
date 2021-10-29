Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A329BC433F5
	for <linux-clk@archiver.kernel.org>; Fri, 29 Oct 2021 12:37:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79EC56113E
	for <linux-clk@archiver.kernel.org>; Fri, 29 Oct 2021 12:37:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231519AbhJ2Mjn convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 Oct 2021 08:39:43 -0400
Received: from gloria.sntech.de ([185.11.138.130]:54300 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231409AbhJ2Mjm (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 29 Oct 2021 08:39:42 -0400
Received: from ip5f5a6e92.dynamic.kabel-deutschland.de ([95.90.110.146] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1mgR87-00013w-6j; Fri, 29 Oct 2021 14:37:07 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     linux-rockchip@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>
Cc:     kernel@esmil.dk, linux-clk@vger.kernel.org, mturquette@baylibre.com
Subject: Re: [PATCH 0/2] clk: rockchip: cleanup errors in (module-)driver handling
Date:   Fri, 29 Oct 2021 14:37:06 +0200
Message-ID: <2912588.a5UK1EFgBA@diego>
In-Reply-To: <163548978553.15791.2075313346592720953@swboyd.mtv.corp.google.com>
References: <20211027132616.1039814-1-heiko@sntech.de> <5381956.U9aoDET0nm@diego> <163548978553.15791.2075313346592720953@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Am Freitag, 29. Oktober 2021, 08:43:05 CEST schrieb Stephen Boyd:
> Quoting Heiko Stübner (2021-10-27 16:20:17)
> > Am Mittwoch, 27. Oktober 2021, 22:27:46 CEST schrieb Stephen Boyd:
> > > Quoting Heiko Stuebner (2021-10-27 06:26:14)
> > > > Recent conversions or inclusions of rk3399 and rk3568 as platform-drivers
> > > > and subsequently allowing them to be built as modules introduced some
> > > > problems.
> > > > 
> > > > These two patches try to correct them.
> > > 
> > > By removing modular support? Ok.
> > 
> > It looked like the easiest way to go for now.
> > 
> > With all the clock-definitions as init-data still in both drivers, I don't think
> > anybody ever tested running this as a real module.
> > 
> > We could of course also remove all the __init + __initdata attributes, but
> > still wouldn't know if it actually runs as a module, without someone
> > building a real test environment for it.
> > 
> > 
> 
> Sure. Do I need to pick these up directly?

I don't have anything more for 5.16 and the 5.15 release should happen
on sunday, so yeah just pick them if you like - no need for doing a separate
pull request.

Thanks
Heiko


