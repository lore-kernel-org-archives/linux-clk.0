Return-Path: <SRS0=KU3F=V7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7D0AC31E40
	for <linux-clk@archiver.kernel.org>; Sat,  3 Aug 2019 08:00:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7AD882173E
	for <linux-clk@archiver.kernel.org>; Sat,  3 Aug 2019 08:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1564819248;
	bh=0D9LEf7wHMiPCCMe2BEWfRqCtH8Tiw3F45yuca8eAxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ytUKu8OZDo0zbzAjZry+J/YQAIUD9qALqbiMpYvcA3xtnR7zgZfolRYNpZt73XHK0
	 S2iKiOWi78wIylDjWcRP8WB7TduluApkZOecQ1We9TD4pZv5KqQUndq4K0We73OPQm
	 BUiPBHVApKk+4lCyns4wVJreWI5hCya7OoJRVtfU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387499AbfHCIAr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 3 Aug 2019 04:00:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:53250 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387429AbfHCIAr (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 3 Aug 2019 04:00:47 -0400
Received: from X250.getinternet.no (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3E22820665;
        Sat,  3 Aug 2019 08:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564819247;
        bh=0D9LEf7wHMiPCCMe2BEWfRqCtH8Tiw3F45yuca8eAxw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1CO1UKEx8X4QQjbU9R0btlfxlNvFUwPCoCtfAPl4OauxWJa800ETYFVp6P5uVUNOJ
         gvdYvZNGC5AXKICU7dv+KdaZ7eFC03WB3cYI4bm0nULOl3/C4F5apTWTE5o8zTQNB4
         iLpHYLnmOZx5FnU5tnzk8gUY2utQdmJv9QYAjyz8=
Date:   Sat, 3 Aug 2019 10:00:40 +0200
From:   Shawn Guo <shawnguo@kernel.org>
To:     Daniel Baluta <daniel.baluta@gmail.com>
Cc:     Abel Vesa <abel.vesa@nxp.com>, Anson Huang <anson.huang@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] clk: imx8mq: Mark AHB clock as critical
Message-ID: <20190803080038.GA8870@X250.getinternet.no>
References: <1561453316-11481-1-git-send-email-abel.vesa@nxp.com>
 <20190625223223.3B8EC2053B@mail.kernel.org>
 <20190705085218.lvvqnqx6nfph2era@fsr-ub1664-175>
 <20190722212537.41C9121900@mail.kernel.org>
 <CAEnQRZAFdvSzh-pDJ-rsyaEJw83ymSVW0CC2+QZyWwAPeTOyBw@mail.gmail.com>
 <20190803072723.GB7597@X250>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190803072723.GB7597@X250>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, Aug 03, 2019 at 09:27:25AM +0200, Shawn Guo wrote:
> > Also, without this patch linux-next hangs on imx8mq.
> 
> How does that happen?  Mainline is fine there?

Okay, understood it by reading more threads.

Shawn
