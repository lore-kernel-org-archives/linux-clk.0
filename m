Return-Path: <SRS0=SiOT=OX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2F11C43444
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 15:32:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0A6DE20643
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 15:32:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="BSgNTRec"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729148AbeLNPcW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 14 Dec 2018 10:32:22 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:35556 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726520AbeLNPcW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 14 Dec 2018 10:32:22 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id A116025B770;
        Sat, 15 Dec 2018 02:32:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1544801540; bh=l5CFOtXPUNegNCzXn3tPynUyP9n9L43okD5YvAaNOhs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BSgNTRecNRn2cWw2AfPCPCDaDf4WmfT7dcsxHnLp7/kcT7itQILS8RSVUJj8earGf
         0BpZRqFTM28+HS4QGX5w3FRx+jImrv8zL20MHiWLmW9xh63MUBxkh7Ykde1tHDM7MA
         4wdWCpLvNjMwIt06bjm2TRAMWWI6bYj8ZuC7n8uc=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id A821C9403C3; Fri, 14 Dec 2018 16:32:18 +0100 (CET)
Date:   Fri, 14 Dec 2018 16:32:18 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 1/4] clk: renesas: rcar-gen3-cpg: factor out
 cpg_reg_modify()
Message-ID: <20181214153218.3b3fv5mcj4kl2l3a@verge.net.au>
References: <cfd91d1f-3b1e-c6c4-0975-7aac09383fdf@cogentembedded.com>
 <8d3bd6b4-61eb-ceef-dc99-eb26c83f9e03@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d3bd6b4-61eb-ceef-dc99-eb26c83f9e03@cogentembedded.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Dec 04, 2018 at 10:48:21PM +0300, Sergei Shtylyov wrote:
> There's quite often repeated sequence of a CPG register read-modify-write,
> so it seems worth factoring it out into a function -- this saves 68 bytes
> of the object code (AArch64 gcc 4.8.5) and simplifies protecting all such
> sequences with a spinlock in the next patch...
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
