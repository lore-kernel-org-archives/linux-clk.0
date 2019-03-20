Return-Path: <SRS0=YCcY=RX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8FE7C43381
	for <linux-clk@archiver.kernel.org>; Wed, 20 Mar 2019 16:14:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 976502184D
	for <linux-clk@archiver.kernel.org>; Wed, 20 Mar 2019 16:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1553098490;
	bh=xWb6a3OT5EbC7LPFjRw6+Jt9LU1t6SR/toxDvr/mVL4=;
	h=In-Reply-To:References:From:Subject:Cc:To:Date:List-ID:From;
	b=t8QAjTIEyyGC/ypr7v/KjJgBDSWtGWvJI81iu/2G046kbozAZNsfTaPgDtJHMdcC1
	 YPRBmcYs7h3aWByiBlLeqYTtYXFtF4GFw6rLn6hFR5iCldJU3Tgy87j+bUtp4BxonL
	 wGIgXPh6xZQG+tB5iDju3xI2xG/bPXt7Uh/i4Iuk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726782AbfCTQOu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 20 Mar 2019 12:14:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:50138 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726692AbfCTQOu (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 20 Mar 2019 12:14:50 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 632582183E;
        Wed, 20 Mar 2019 16:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1553098489;
        bh=xWb6a3OT5EbC7LPFjRw6+Jt9LU1t6SR/toxDvr/mVL4=;
        h=In-Reply-To:References:From:Subject:Cc:To:Date:From;
        b=OIUUjc6i1G/OY61i5Dlx1VJINOZJTDO5SlVRZ/bMqAdB6B6K7ZF3t/iDcbKBIs0k+
         t/OG8KZt2ouNKmEYCg4BG97jQFc3fjNEJVZ+8JrDHUBIikW/pDpA8PfQM5gG221xCy
         +PMjl67o8yjHS0a7efmNkTVY+QUEDsil2TRCnTTY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1aff3a5c-75d3-5fd3-1aed-88eab2add828@baylibre.com>
References: <1aff3a5c-75d3-5fd3-1aed-88eab2add828@baylibre.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [GIT PULL] clk: meson: fixes for v5.1
Cc:     Kevin Hilman <khilman@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        Jerome Brunet <jbrunet@baylibre.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <155309848856.20095.17946675922821809396@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Wed, 20 Mar 2019 09:14:48 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Neil Armstrong (2019-03-19 13:03:34)
> Dear clock maintainers,
>=20
> Below is a request to pull amlogic clock fixes for v5.1
> These changes fixes a couple of simple mistakes I did while adding video
> clocks to G12A, and a fix from Maxime fixing the Video Decoder clocks
> rate rounding.
>=20

Thanks. Pulled into clk-fixes.
