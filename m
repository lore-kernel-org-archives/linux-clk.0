Return-Path: <SRS0=rfa6=QI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15FC3C282D8
	for <linux-clk@archiver.kernel.org>; Fri,  1 Feb 2019 06:22:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D1CC320B1F
	for <linux-clk@archiver.kernel.org>; Fri,  1 Feb 2019 06:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1549002137;
	bh=Fkeqe8V3E77vCEd2u+gpGbpZSRJbnGX/VPWAN9lsehw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=vMDpMz8xC+nREOzMMt9bBrwCAj8m26lb7pk9Q3GSZGxHdwqoaeQrMI06vXXvjGZwf
	 2mPnZiqcznK1iyZbAogG+PT1SGmYxNgGJKn2rKDdwPomCZu9Q+3fOiHdOb4BqbH7aO
	 f0JC54knCh19k3NcsORaMjhp92mU3EXTtNR4B9h8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726187AbfBAGWR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 1 Feb 2019 01:22:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:37126 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725763AbfBAGWR (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 1 Feb 2019 01:22:17 -0500
Received: from dragon (61-216-91-114.HINET-IP.hinet.net [61.216.91.114])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2780820869;
        Fri,  1 Feb 2019 06:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1549002136;
        bh=Fkeqe8V3E77vCEd2u+gpGbpZSRJbnGX/VPWAN9lsehw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fXaeep5gqe2a+SI9+Eut7PhNSftfEd/YlicwSpoUFb9MtbQa1erJARa+XXSpvn+MF
         J9ro9axQzn9cqMkLwjoh2s3AN7ZLqwEqSG0+noMcIBmJXaQiz1E4t00n67H3BrTao9
         nmB4rIyWDl4/CDIf26xEeGlr54RyO2LWBZfA5fPw=
Date:   Fri, 1 Feb 2019 14:22:04 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Aisheng Dong <aisheng.dong@nxp.com>
Cc:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH V3 2/5] dt-bindings: fsl: scu: add imx8qm scu clock
 support
Message-ID: <20190201062203.GK19882@dragon>
References: <1548335800-6438-1-git-send-email-aisheng.dong@nxp.com>
 <1548335800-6438-3-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1548335800-6438-3-git-send-email-aisheng.dong@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jan 24, 2019 at 01:22:36PM +0000, Aisheng Dong wrote:
> Add imx8qm scu clock support
> 
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

Applied, thanks.
