Return-Path: <SRS0=pin/=Q4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E15CC43381
	for <linux-clk@archiver.kernel.org>; Thu, 21 Feb 2019 20:44:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3ED2A206C0
	for <linux-clk@archiver.kernel.org>; Thu, 21 Feb 2019 20:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1550781857;
	bh=KhOaWx318OfE8q2FQ644eXjnJcAMKRcT4dsfXiXqevc=;
	h=Subject:References:From:In-Reply-To:To:Cc:Date:List-ID:From;
	b=EbfJI3cI+PH4vLYKb/uCjTACQJmwcC0lqWy9uMMymIHr0bYRtR+AIkJ7157IL+YUy
	 wtodBu2M3FpMcGVv3j7Gmr122B7aceqY3JHB8pWyl/J/uymShcFvqlKUuDIawbN0nS
	 vpzVrVlTNwKW1PCi13hVY7iYSecpa+0ppTfq1/OI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbfBUUoN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Feb 2019 15:44:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:45248 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725866AbfBUUoM (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 21 Feb 2019 15:44:12 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 49E50206C0;
        Thu, 21 Feb 2019 20:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1550781852;
        bh=KhOaWx318OfE8q2FQ644eXjnJcAMKRcT4dsfXiXqevc=;
        h=Subject:References:From:In-Reply-To:To:Cc:Date:From;
        b=HMNzyl+Wojb9NPSeV3lc3+/wtd7jFHIi3jrRoAZdEtzeGaVrwYxV/VNL3D6grzxew
         2QchTdvKCyixI7XOjbnS08fIeWpdzqqp2T9m46+qOxFEgSXvIp5lR2NcLpLAIvmhBz
         5VPjFfn9x9HKWPQEH201uwdhO4Cf714Un3Yl3/SA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 3/3] clk: imx8mq: Add the missing ARM clock
Message-ID: <155078185159.77512.4878033490950072107@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
References: <1550252913-24532-1-git-send-email-abel.vesa@nxp.com> <1550252913-24532-4-git-send-email-abel.vesa@nxp.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1550252913-24532-4-git-send-email-abel.vesa@nxp.com>
To:     Abel Vesa <abel.vesa@nxp.com>,
        Angus Ainslie <angus.ainslie@puri.sm>,
        Lucas Stach <l.stach@pengutronix.de>,
        Mike Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>
Cc:     Anson Huang <anson.huang@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Abel Vesa <abel.vesa@nxp.com>
Date:   Thu, 21 Feb 2019 12:44:11 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Abel Vesa (2019-02-15 09:48:46)
> Add the ARM clock as imx_clk_cpu type.
> Will be used by cpufreq.
>=20
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
> ---

Applied to clk-next

