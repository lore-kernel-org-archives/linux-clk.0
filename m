Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5915EC47080
	for <linux-clk@archiver.kernel.org>; Tue,  1 Jun 2021 09:52:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 406DA610FC
	for <linux-clk@archiver.kernel.org>; Tue,  1 Jun 2021 09:52:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231726AbhFAJxk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 1 Jun 2021 05:53:40 -0400
Received: from elvis.franken.de ([193.175.24.41]:60004 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231228AbhFAJxj (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 1 Jun 2021 05:53:39 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lo13y-0001KW-05; Tue, 01 Jun 2021 11:51:54 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id F00E8C1B8C; Tue,  1 Jun 2021 11:51:29 +0200 (CEST)
Date:   Tue, 1 Jun 2021 11:51:29 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Dmitry Osipenko <digetx@gmail.com>,
        Florian Fainelli <florian@openwrt.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        John Crispin <john@phrozen.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH 0/7] clk: clean up legacy clock interfaces
Message-ID: <20210601095129.GF6961@alpha.franken.de>
References: <20210531184749.2475868-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210531184749.2475868-1-arnd@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, May 31, 2021 at 08:47:42PM +0200, Arnd Bergmann wrote:
> As I noticed that the ar7 clock implementation and the ralink version
> are rather trivial, I ended up converting those to use the common-clk
> interfaces as well, though this is unrelated to the other changes.

excellent, how is your plan for merging the series ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
