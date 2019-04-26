Return-Path: <SRS0=YBHQ=S4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF4B7C43219
	for <linux-clk@archiver.kernel.org>; Fri, 26 Apr 2019 03:10:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ACD7520685
	for <linux-clk@archiver.kernel.org>; Fri, 26 Apr 2019 03:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556248223;
	bh=l8cqH1j1OfeoDDJJ7ipZt9g8TuLCGDXIg9TCZ4tENaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ZgvHbKVnlgMFYmYb6nFwe7/9wEQiX4YsxA0H1f0lXPo1dC2BVezfDyBroTstAw3Ar
	 ZO74ct4laKuieJ6WDtfwAEqnHHVt8e0djDh79UEHuhqTlrlgEVQRQGyRmIEX5uViuF
	 8W9jlsvAuVcYI5PDXsxJknSgHgKtjQV+OsZqgb6s=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726088AbfDZDKX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Apr 2019 23:10:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:34170 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726065AbfDZDKX (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 25 Apr 2019 23:10:23 -0400
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3AD762063F;
        Fri, 26 Apr 2019 03:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556248222;
        bh=l8cqH1j1OfeoDDJJ7ipZt9g8TuLCGDXIg9TCZ4tENaQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BZ4l5ltISYeJnjuF4PLbdsXIWNu9wT4zyDVqnw1KtYQZIc5ZsUHVTZnFl2k1HXv75
         +mFotGJsJ2im7QJrk1E8hrxm+Nki4bvh1bGvaYOQZO5i21cJJyBhSXc/Vs3v1O7+BY
         YxWz8RmjCucjHo9YQ8GIDoqW/RQp0eRkgjbvJmjE=
Date:   Fri, 26 Apr 2019 11:09:55 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     "festevam@gmail.com" <festevam@gmail.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        Jacky Bai <ping.bai@nxp.com>, dl-linux-imx <linux-imx@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH] clk: imx: keep uart clock on during system boot
Message-ID: <20190426030953.GB7980@dragon>
References: <20190425081454.3210-1-ping.bai@nxp.com>
 <155623659850.15276.16522575330550453078@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <155623659850.15276.16522575330550453078@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Apr 25, 2019 at 04:56:38PM -0700, Stephen Boyd wrote:
> Quoting Jacky Bai (2019-04-25 01:10:08)
> > Keep uart clocks enabled when earlyprintk or
> > earlycon is active.
> > 
> > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> > ---
> 
> Looks OK to me. Shawn, will you pick it up? Or should I apply directly?

Stephen, please apply directly.

Shawn
