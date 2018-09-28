Return-Path: <SRS0=udJu=MK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0046AC43382
	for <linux-clk@archiver.kernel.org>; Fri, 28 Sep 2018 07:53:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DACDC21748
	for <linux-clk@archiver.kernel.org>; Fri, 28 Sep 2018 07:53:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="k3kGTpYR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DACDC21748
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=verge.net.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728811AbeI1OPz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 Sep 2018 10:15:55 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:55815 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728883AbeI1OPz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 28 Sep 2018 10:15:55 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id E0BC625BDDD;
        Fri, 28 Sep 2018 17:53:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1538121205; bh=SJO0Z1Sq5fED8eDOjByIO+tuW9UqZsBLgc3a2PjESyY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k3kGTpYRCkxarJefX9sIbWb5f+9AErrkOj4bop1Jn7+s9zHsG4bikBEpm464/9uOC
         RPHzgdP/NWpTfEebFJq5A2Hh3u8MyCkt/27EzkF07qIzObiETUtSbA0v0R1SNDX3f+
         jCdZYLX8MEKwjEnpKivbwAmJEckWioh3UDsuEknk=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id CACAE9402F6; Fri, 28 Sep 2018 09:53:22 +0200 (CEST)
Date:   Fri, 28 Sep 2018 09:53:22 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: r7s9210: Add SPI clocks
Message-ID: <20180928075321.ehchahoewo6ekkys@verge.net.au>
References: <20180926133956.79788-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180926133956.79788-1-chris.brandt@renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Sep 26, 2018 at 08:39:56AM -0500, Chris Brandt wrote:
> Add RSPI clocks for RZ/A2.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

