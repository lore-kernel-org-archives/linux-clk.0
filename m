Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A7A8C4361B
	for <linux-clk@archiver.kernel.org>; Sun, 20 Dec 2020 16:22:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1887523602
	for <linux-clk@archiver.kernel.org>; Sun, 20 Dec 2020 16:22:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727396AbgLTQWS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 20 Dec 2020 11:22:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:50422 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726772AbgLTQWS (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 20 Dec 2020 11:22:18 -0500
Date:   Sun, 20 Dec 2020 17:21:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608481297;
        bh=nTD1H+SG3XEKFMx5RD66ucs1UuPn0oFn/eNKNkyotjo=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=RjKaS/EwabSnF+suE6ABylso8DGGmPUhzrnjppWZ48AORRj8AcDRU31eZSA9fjEQT
         5pHkLYuPboCfa1qEySEl1Bl1z9G9AnLJzH6AsvK+1tt/pIXV6vqcVnJItambNNRq2g
         OmHo0rBVKFSiXQJCnaEaxT5lzCxeg8OCR3Ii/qANBdZCiu48jX1YGYfLC9FnOeCw+F
         hH2izGJ1qoCCGpSk/kHmUMbtZo3Fo1gXnjktMHv/ENcm78iWRWxkkmRzt3/Jv4u+tj
         A0NW6Rq5P5Utp1g42isAh5/c4j0DFTIMxbG2Au8aIqhfwb2/72ZQTY1LpHINGR0DNW
         eHFu1WlNBwTkg==
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Gregory CLEMENT <gregory.clement@bootlin.com>,
        Marek Behun <marek.behun@nic.cz>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Terry Zhou <bjzhou@marvell.com>,
        Konstantin Porotchkin <kostap@marvell.com>
Subject: Re: [PATCH] clk: mvebu: a3700: fix the XTAL MODE pin to MPP1_9
Message-ID: <20201220162135.yyijnczu6dxgnpda@pali>
References: <20201106100039.11385-1-pali@kernel.org>
 <160842189035.1580929.16863503861561557281@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <160842189035.1580929.16863503861561557281@swboyd.mtv.corp.google.com>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Saturday 19 December 2020 15:51:30 Stephen Boyd wrote:
> Quoting Pali Rohár (2020-11-06 02:00:39)
> > From: Terry Zhou <bjzhou@marvell.com>
> > 
> > There is an error in the current code that the XTAL MODE
> > pin was set to NB MPP1_31 which should be NB MPP1_9.
> > The latch register of NB MPP1_9 has different offset of 0x8.
> > 
> > Signed-off-by: Terry Zhou <bjzhou@marvell.com>
> > [pali: Fix pin name in commit message]
> > Signed-off-by: Pali Rohár <pali@kernel.org>
> > Fixes: 7ea8250406a6 ("clk: mvebu: Add the xtal clock for Armada 3700 SoC")
> > Cc: stable@vger.kernel.org
> > 
> > ---
> 
> Applied to clk-next

Hello Stephen! As this is fix also for stable releases, could you please
queue this patch for 5.11 release?
