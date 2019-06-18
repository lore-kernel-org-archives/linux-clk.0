Return-Path: <SRS0=tHi7=UR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FC7AC31E5E
	for <linux-clk@archiver.kernel.org>; Tue, 18 Jun 2019 11:02:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E5F1921670
	for <linux-clk@archiver.kernel.org>; Tue, 18 Jun 2019 11:02:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725934AbfFRLCr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Jun 2019 07:02:47 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:53130 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729652AbfFRLCq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Jun 2019 07:02:46 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 9024125B786;
        Tue, 18 Jun 2019 21:02:44 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 95DCF9408C4; Tue, 18 Jun 2019 13:02:42 +0200 (CEST)
Date:   Tue, 18 Jun 2019 13:02:42 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/3] clk: renesas: mstp: Combine group-private and clock
 array allocation
Message-ID: <20190618110242.lst7riik7k2s3mgz@verge.net.au>
References: <20190617123943.12990-1-geert+renesas@glider.be>
 <20190617123943.12990-4-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190617123943.12990-4-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Jun 17, 2019 at 02:39:43PM +0200, Geert Uytterhoeven wrote:
> Make mstp_clock_group.clks[] a flexible array member, and use the new
> struct_size() helper, to combine the allocation of the group-private
> structure and array of module clocks.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

