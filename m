Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:40122 "EHLO
	pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752441AbcHMHiV (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Sat, 13 Aug 2016 03:38:21 -0400
Date: Sat, 13 Aug 2016 08:38:10 +0100
From: Russell King - ARM Linux <linux@armlinux.org.uk>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: prevent __of_clk_get_hw_from_provider() from
 returning NULL
Message-ID: <20160813073809.GA32102@n2100.armlinux.org.uk>
References: <1468919039-23004-1-git-send-email-yamada.masahiro@socionext.com>
 <20160804205734.GA15690@codeaurora.org>
 <CAK7LNAQL2u1YTxr_SWR6S_2aFPfXAPcaFfkWKSV_D-RU2vq7BQ@mail.gmail.com>
 <20160810232307.GK2996@codeaurora.org>
 <CAK7LNASGVAy1Ff8Hp_s+icDEtYHMmxfJv7La=mFF0haJ0hWrUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAK7LNASGVAy1Ff8Hp_s+icDEtYHMmxfJv7La=mFF0haJ0hWrUw@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, Aug 12, 2016 at 03:59:51PM +0900, Masahiro Yamada wrote:
> But, actually, clk_get returns ERR_PTR(-ENOENT) if "clocks" property
> is missing.

Probably because we don't know if that's a case of a partially
converted platform (which doesn't yet have its clk stuff in DT),
so we need to fall back to the table-driven code, or if it really
has no clocks.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
