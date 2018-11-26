Return-Path: <SRS0=+J6A=OF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01735C43441
	for <linux-clk@archiver.kernel.org>; Mon, 26 Nov 2018 08:22:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BDD3720672
	for <linux-clk@archiver.kernel.org>; Mon, 26 Nov 2018 08:22:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="Xyx/X8SD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDD3720672
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=verge.net.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726209AbeKZTPc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Nov 2018 14:15:32 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:59144 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726191AbeKZTPb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Nov 2018 14:15:31 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id D0E3B25B79B;
        Mon, 26 Nov 2018 19:22:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1543220529; bh=Vjy3SwBXHqkWP10P+tmtjRnjS5CdIgyAwnWXboTOEPM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Xyx/X8SDJoYqPVirXl/OikK7xDo3zUjnnX/vJ0ZAHzXlN118vswruafKMNM3Rnyh3
         VwBnUQJ0TN5Y31+IIIWlHmyI61OER5SokMxqjA8n/iIENdDZej2t3Tg740CNC4CZ9c
         G55BNWsn1sZDvqmk0apIvcdpcC4GOQwrub+LpBQU=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id E7465940461; Mon, 26 Nov 2018 09:22:06 +0100 (CET)
Date:   Mon, 26 Nov 2018 09:22:06 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/4] clk: renesas: rcar-gen3-cpg: factor out
 cpg_reg_modify()
Message-ID: <20181126082206.tnbbvknhcc7n4kjg@verge.net.au>
References: <c79d3733-437a-55dc-d946-99521b79ec20@cogentembedded.com>
 <8cca22f7-dbd7-2da0-2f58-e490982d2f6c@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8cca22f7-dbd7-2da0-2f58-e490982d2f6c@cogentembedded.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Nov 22, 2018 at 09:39:42PM +0300, Sergei Shtylyov wrote:
> There's quite often repeated sequence of a CPG register read-modify-write,
> so it seems worth factoring it out into a function -- this saves 68 bytes
> of the object code already (AArch64 gcc 4.8.5) and will save more with the
> next patches...
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
