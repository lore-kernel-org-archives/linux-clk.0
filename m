Return-Path: <SRS0=SiOT=OX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84F48C43387
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 21:09:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AB880208C3
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 21:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544821749;
	bh=Hb/Nas4lFxcyVpYP1kZK/OzQS/Kcj67G/WkepeQJ+KU=;
	h=In-Reply-To:Subject:To:References:From:Cc:Date:List-ID:From;
	b=V31st9ZHRUgYDO9Xhpgq3oZI7ZfZeUnnjfAE136gzZZmCsCUD2th9z1GFJAjHwA5A
	 RF/mUO1Al5ZjhV0Ey5DxHhNRrD1jATYjSJblNqRKHLj2cD4jsmq4G2sk/erehe7byP
	 56AlUNXY9OyqbLwvZhi6NrW2wmfVK5VvrMVJ398w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731083AbeLNVJJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 14 Dec 2018 16:09:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:56936 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730734AbeLNVJI (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 14 Dec 2018 16:09:08 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B05F5208C4;
        Fri, 14 Dec 2018 21:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544821748;
        bh=Hb/Nas4lFxcyVpYP1kZK/OzQS/Kcj67G/WkepeQJ+KU=;
        h=In-Reply-To:Subject:To:References:From:Cc:Date:From;
        b=Zc2uotgIwZfavrA0AQIe7aXHNlywvgVGwtD3e6RK2Tpky2SiyQIfQIYQypGrbO6Hk
         MIEwPASyppUWoGcnYIS5gXEGjsW08mDcnFoGMnfrhtsifQqdY9WInVht4GrLKWhmWy
         Frc+DHS4FEIhve0tG0Ci4kRxrF78ZOKnmyGmmvYg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1544715442-8902-6-git-send-email-aisheng.dong@nxp.com>
Subject: Re: [PATCH V12 5/5] clk: imx: add imx8qxp lpcg driver
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>
References: <1544715442-8902-1-git-send-email-aisheng.dong@nxp.com> <1544715442-8902-6-git-send-email-aisheng.dong@nxp.com>
Message-ID: <154482174763.19322.12593859451035066121@swboyd.mtv.corp.google.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Aisheng Dong <aisheng.dong@nxp.com>
Date:   Fri, 14 Dec 2018 13:09:07 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Aisheng Dong (2018-12-13 07:43:05)
> Add imx8qxp lpcg driver support
>=20
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---

Applied to clk-next

