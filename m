Return-Path: <SRS0=4/Ea=P7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BEE9C282C0
	for <linux-clk@archiver.kernel.org>; Wed, 23 Jan 2019 09:56:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 39AF420861
	for <linux-clk@archiver.kernel.org>; Wed, 23 Jan 2019 09:56:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="PcXucjwg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727486AbfAWJ4j (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Jan 2019 04:56:39 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:50880 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727438AbfAWJ4W (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Jan 2019 04:56:22 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id EAB1925BE34;
        Wed, 23 Jan 2019 20:56:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548237380; bh=cLK9HBm/A+HoM2Oo/n20OntBmqwDQc2AoTGcbfVHtps=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PcXucjwgNuAloivWc+gDiiaNs6G3P7lP9MKdx+1sbpHhKe/VALM34EH3XagSiOHCm
         N0iwUA0aem4Hogf3biREDuE+pxsKfKyA1qxsWMEUynhMUiCtEv6D7VPhu6mEKujw3U
         27GkwaAJFMIgVrG2rAqf8RV7N/llxQUA54IK1XiM=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 20406940471; Wed, 23 Jan 2019 10:56:18 +0100 (CET)
Date:   Wed, 23 Jan 2019 10:56:18 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH] clk: renesas: r8a774c0: Correct parent clock of DU
Message-ID: <20190123095617.vxbw3qnup4evjkj6@verge.net.au>
References: <20190121131410.21137-1-geert+renesas@glider.be>
 <CAMuHMdVt6kT30K2GTNU__B7px1O_N-oT-S_rLXi9MfngsrPHgg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVt6kT30K2GTNU__B7px1O_N-oT-S_rLXi9MfngsrPHgg@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Jan 21, 2019 at 02:15:07PM +0100, Geert Uytterhoeven wrote:
> On Mon, Jan 21, 2019 at 2:14 PM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > According to the RZ/G Series, 2nd Generation Hardware Manual Rev 0.61,
> > the parent clock of the DU module clocks on RZ/G2 is S1D1.
> 
> Oops, "RZ/G2E".

That aside,

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
