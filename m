Return-Path: <SRS0=JsB9=QM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9EDCC282CB
	for <linux-clk@archiver.kernel.org>; Tue,  5 Feb 2019 22:33:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A6E7620811
	for <linux-clk@archiver.kernel.org>; Tue,  5 Feb 2019 22:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1549406033;
	bh=qzergC6+hYLWgiaoMk/LQ3M8CDrLgHgExkuBh5fxX2k=;
	h=Subject:From:Cc:References:To:In-Reply-To:Date:List-ID:From;
	b=VK834tyF8bpQeybT7cOfDhJTh5eo2qYl/bqvBXO6ddkWf9vSeGUfvlA0VUrDDFltO
	 3IBzH6xVW4oBLRGFvX4inKt1q2yCb3WUPPfblfw4K1iwz35VdBLzmJMovVmXFs+ieh
	 bSXkTlPzfYkUlX7dioIYqV2dVI4wzU/s8nxltHDw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727685AbfBEWdx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 Feb 2019 17:33:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:40022 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726606AbfBEWdx (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 5 Feb 2019 17:33:53 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9C6742077B;
        Tue,  5 Feb 2019 22:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1549406032;
        bh=qzergC6+hYLWgiaoMk/LQ3M8CDrLgHgExkuBh5fxX2k=;
        h=Subject:From:Cc:References:To:In-Reply-To:Date:From;
        b=QDWQic2bHPzIQIfMXTxmBFWKTewTDVwzKAEUgt8KTyYNc74j2bGxn/E6YW1rG/o6g
         svCJXmbqij3i4bSqA33tMBAuHdpUxv4boJUw+BVBZrwAN/Dyp/uGhEZd6msTTCFm+E
         V6jXNnxCIyFV73/F9njAQCAnc4XivJFxqXnx6L14=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] clk: imx8mq: Add missing M4 clocks
From:   Stephen Boyd <sboyd@kernel.org>
Message-ID: <154940603191.169292.5891261705001667667@swboyd.mtv.corp.google.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Lucas Stach <l.stach@pengutronix.de>
References: <20190130201725.18961-1-ccaione@baylibre.com> <CAOMZO5AU8y1mf1DCMcJ6Y_AN_rP47jx1uVhj9pLRtgL6P70ksw@mail.gmail.com> <0590fb7b-4934-9ef8-dce1-6fd251864522@baylibre.com>
User-Agent: alot/0.8
To:     Carlo Caione <ccaione@baylibre.com>,
        Fabio Estevam <festevam@gmail.com>
In-Reply-To: <0590fb7b-4934-9ef8-dce1-6fd251864522@baylibre.com>
Date:   Tue, 05 Feb 2019 14:33:51 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Carlo Caione (2019-01-31 01:09:52)
> On 30/01/2019 22:46, Fabio Estevam wrote:
> > On Wed, Jan 30, 2019 at 6:17 PM Carlo Caione <ccaione@baylibre.com> wro=
te:
> >>
> >> The clocks list is missing the clocks for the the M4 core.
> >=20
> > There is a repeated "the" in this phrase.
>=20
> Ouch! Can I count on the maintainer to fix this while merging? ;)
>=20

If I remember....
