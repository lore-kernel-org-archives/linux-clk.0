Return-Path: <SRS0=wHDT=W5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C20DC3A59B
	for <linux-clk@archiver.kernel.org>; Mon,  2 Sep 2019 08:29:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5F0C522CF7
	for <linux-clk@archiver.kernel.org>; Mon,  2 Sep 2019 08:29:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730133AbfIBI3b (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 2 Sep 2019 04:29:31 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:33528 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726609AbfIBI3a (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 2 Sep 2019 04:29:30 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 7E9B625B75F;
        Mon,  2 Sep 2019 18:29:28 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 1378E9401E6; Mon,  2 Sep 2019 10:29:26 +0200 (CEST)
Date:   Mon, 2 Sep 2019 10:29:26 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: Remove R-Car Gen2 legacy DT clock support
Message-ID: <20190902082922.tdo5edgz4orxhx2r@verge.net.au>
References: <20190830133615.11274-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190830133615.11274-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Aug 30, 2019 at 03:36:15PM +0200, Geert Uytterhoeven wrote:
> As of commit 362b334b17943d84 ("ARM: dts: r8a7791: Convert to new
> CPG/MSSR bindings"), all upstream R-Car Gen2 device tree source files
> use the unified "Renesas Clock Pulse Generator / Module Standby and
> Software Reset" DT bindings.
> 
> Hence remove backward compatibility with old R-Car Gen2 device trees
> describing a hierarchical representation of the various CPG and MSTP
> clocks.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in clk-renesas-for-v5.5.
> 
> The abovementioned commit was part of the v4.15 release.
> The conversion was backported to v4.14.75-ltsi, and included in any
> R-Car BSP based on v4.14 (rcar-3.6.0 and later).

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

