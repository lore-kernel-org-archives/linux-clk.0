Return-Path: <SRS0=s3ie=T5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0090C46460
	for <linux-clk@archiver.kernel.org>; Wed, 29 May 2019 13:42:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A3F11229F7
	for <linux-clk@archiver.kernel.org>; Wed, 29 May 2019 13:42:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727364AbfE2Nmq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 29 May 2019 09:42:46 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:56992 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726612AbfE2Nmq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 May 2019 09:42:46 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id DF30525AEEC;
        Wed, 29 May 2019 23:42:43 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id E5083940361; Wed, 29 May 2019 15:42:41 +0200 (CEST)
Date:   Wed, 29 May 2019 15:42:41 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Remove error messages on
 out-of-memory conditions
Message-ID: <20190529134241.7h76ogo24kam67qx@verge.net.au>
References: <20190527123420.7057-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190527123420.7057-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, May 27, 2019 at 02:34:20PM +0200, Geert Uytterhoeven wrote:
> pm_clk_create() and pm_clk_add_clk() can fail only when running out of
> memory.  Hence there is no need to print error messages on failure, as
> the memory allocation core already takes care of that.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

