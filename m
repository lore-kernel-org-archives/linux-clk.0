Return-Path: <SRS0=SEET=6G=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F96DC5518A
	for <linux-clk@archiver.kernel.org>; Wed, 22 Apr 2020 10:59:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C38B2076E
	for <linux-clk@archiver.kernel.org>; Wed, 22 Apr 2020 10:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587553171;
	bh=LnZRo6Hxvi5TmQdejLBPUBQPhDfSwxKOii0Tkhdj/mo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=gTchfdcs1hzy8z2lg4cTzfpB0+5JVQI8hn7i4lAiqG2vadTeP+EbSvZbtfPepw1Or
	 KSb2V9bPtPKjxu9tgw+0Gnuo6samKSBq4/e6tlIJKc6Y/x0xcCgwbdF0OfXsuTtf88
	 CxR87HXmGhRIqhPRhDiW8eJv4EDrBkhMiurGYGaM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbgDVKCz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 22 Apr 2020 06:02:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:52214 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727062AbgDVKCw (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 22 Apr 2020 06:02:52 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AF30820B1F;
        Wed, 22 Apr 2020 10:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587549771;
        bh=LnZRo6Hxvi5TmQdejLBPUBQPhDfSwxKOii0Tkhdj/mo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=RhEM734AtFLN0QmsgyCYHpRa2d3P36Y5dDqv4X/v0tc4zUAwCqMRcIomtWMgOnMpy
         lhHMk02wk/CZHA53+iTcVPv7v0MhOAZXhWH6KQSyG1mPBc+AzaeRxRhGmDHdgAi8M/
         bSqWZSIdFMK6JyOqsH9raIVAmao3dCMzvN/js/3c=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200416081348.326833-1-linus.walleij@linaro.org>
References: <20200416081348.326833-1-linus.walleij@linaro.org>
Subject: Re: [PATCH] clk: impd1: Look up clock-output-names
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 22 Apr 2020 03:02:50 -0700
Message-ID: <158754977096.132238.12292029969034991900@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Linus Walleij (2020-04-16 01:13:48)
> The IM-PD1 still need to pass the clock output names.
>=20
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Is this a

Fixes: 84655b762a27 ("clk: versatile: Add device tree probing for IM-PD1 cl=
ocks")

change?
