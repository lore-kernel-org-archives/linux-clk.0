Return-Path: <SRS0=aw6K=MH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C56C43382
	for <linux-clk@archiver.kernel.org>; Tue, 25 Sep 2018 07:52:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1B7A92087A
	for <linux-clk@archiver.kernel.org>; Tue, 25 Sep 2018 07:52:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="kElvlnlr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B7A92087A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=verge.net.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726125AbeIYN6V (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Sep 2018 09:58:21 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:36123 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726030AbeIYN6U (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Sep 2018 09:58:20 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 33B3625B749;
        Tue, 25 Sep 2018 17:52:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1537861921; bh=kTG1huzQ8ygkQe14kkdN8Mxmu9vgRaql0FrEHE3DWNk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kElvlnlrQxkv2MICIeBriJVpMFVfzUSvrEyxkQm++sqIbglA+atDIv1/zrWFBT5Tl
         l7K7PbU+Tqn0qDatBh0u9px0Zl+lekeUOUtLtpz39iU98+kNx+84UnN9L924MBmfqH
         DkomUyFBwPNxPymfuPfZjZogdHMNYM7SN/inwog4=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 2DA96940453; Tue, 25 Sep 2018 09:51:59 +0200 (CEST)
Date:   Tue, 25 Sep 2018 09:51:59 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: Convert to SPDX identifiers
Message-ID: <20180925075158.ydd5v4qj5me3tkk4@verge.net.au>
References: <20180925073405.26491-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180925073405.26491-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180925075159.VPoH2tcqhDdOFa1ilrBsFsJ_gAThEVAqT_WrMGxCtGk@z>

On Tue, Sep 25, 2018 at 09:34:05AM +0200, Geert Uytterhoeven wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch updates license to use SPDX-License-Identifier
> instead of verbose license text.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> [rebased against clk-spdx]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

