Return-Path: <SRS0=hvdj=P2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C581C43387
	for <linux-clk@archiver.kernel.org>; Fri, 18 Jan 2019 12:14:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D5CD920652
	for <linux-clk@archiver.kernel.org>; Fri, 18 Jan 2019 12:14:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="njGmT7+A"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727444AbfARMOG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 18 Jan 2019 07:14:06 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:57858 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727382AbfARMOG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 18 Jan 2019 07:14:06 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 307D425BE87;
        Fri, 18 Jan 2019 23:14:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1547813643; bh=rbqvCCfksYDgUJKPEy9z0qJO7FdqDrw41tj1axDXbHI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=njGmT7+AdNJ8bWKIsoql0Jo3x2wFR9lH8vjPZOiXfU4EmhBkFmFD+FHUXg+boyTq/
         6ojRLbP+6BgLii9w51Qh9BiAXUs9vHl4H7+cSPMz4SmL5/mEIjyeOfhuKd/T/picnG
         ZD0WXXdUViKHavMIpjnYObUq4Y7AXATVtH58RTPk=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id A32F9940356; Fri, 18 Jan 2019 13:14:01 +0100 (CET)
Date:   Fri, 18 Jan 2019 13:14:01 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>, linux-can@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/3] clk: renesas: r8a774a1: Add missing CANFD clock
Message-ID: <20190118121401.w36igfibeyfm26wv@verge.net.au>
References: <1547736856-16539-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1547736856-16539-2-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1547736856-16539-2-git-send-email-fabrizio.castro@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jan 17, 2019 at 02:54:14PM +0000, Fabrizio Castro wrote:
> This patch adds the missing CANFD clock to the r8a774a1 specific
> clock driver.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

