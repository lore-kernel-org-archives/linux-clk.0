Return-Path: <SRS0=vPCn=US=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E27CC46477
	for <linux-clk@archiver.kernel.org>; Wed, 19 Jun 2019 14:09:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1220A21670
	for <linux-clk@archiver.kernel.org>; Wed, 19 Jun 2019 14:09:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727076AbfFSOJN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 Jun 2019 10:09:13 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:36708 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726839AbfFSOJN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Jun 2019 10:09:13 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 6F36B25AF1B;
        Thu, 20 Jun 2019 00:09:11 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 793DA9409FF; Wed, 19 Jun 2019 16:09:09 +0200 (CEST)
Date:   Wed, 19 Jun 2019 16:09:09 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Use [] to denote a flexible
 array member
Message-ID: <20190619140909.mctqj6ayadjrqrv7@verge.net.au>
References: <20190619124401.12478-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190619124401.12478-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Jun 19, 2019 at 02:44:01PM +0200, Geert Uytterhoeven wrote:
> Flexible array members should be denoted using [] instead of [0], else
> gcc will not warn when they are no longer at the end of the structure.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

