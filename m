Return-Path: <SRS0=1K30=OJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD9DBC04EB8
	for <linux-clk@archiver.kernel.org>; Fri, 30 Nov 2018 07:08:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 81D192146D
	for <linux-clk@archiver.kernel.org>; Fri, 30 Nov 2018 07:08:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="wnsW9ckb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81D192146D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726582AbeK3SQf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Nov 2018 13:16:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:50764 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726456AbeK3SQf (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 30 Nov 2018 13:16:35 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4D5A52082F;
        Fri, 30 Nov 2018 07:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1543561696;
        bh=bu5PB9PpWCju5oGQOgbCZt7eB0punmXW/d8XBgYQU3M=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=wnsW9ckbl657cvMdkr92NNE8oFbWV7fl0NPcze1fwZjLmsYjbcdwJWLCXOwwuhTG/
         lzEBsxXcE+++3dbzLp4TNfLLXEXUYjbqFvI2jSDiSQnBGeK4L8miOoe41FbZAJB11v
         z+ACg23CsPNjkLhZSVxCwqWsYtaxPenHP6ClC+Kg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Michael Turquette <mturquette@baylibre.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20181130053328.24183-1-wens@csie.org>
Cc:     Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
References: <20181130053328.24183-1-wens@csie.org>
Message-ID: <154356169535.88331.6559008649310425840@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH] clk: sunxi-ng: h3/h5: Fix CSI_MCLK parent
Date:   Thu, 29 Nov 2018 23:08:15 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Chen-Yu Tsai (2018-11-29 21:33:28)
> The third parent of CSI_MCLK is PLL_PERIPH1, not PLL_PERIPH0.
> Fix it.
> =

> Fixes: 0577e4853bfb ("clk: sunxi-ng: Add H3 clocks")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

