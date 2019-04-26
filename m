Return-Path: <SRS0=YBHQ=S4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BB90C43219
	for <linux-clk@archiver.kernel.org>; Fri, 26 Apr 2019 20:11:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3A08D206A3
	for <linux-clk@archiver.kernel.org>; Fri, 26 Apr 2019 20:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556309473;
	bh=RkbULoiZSLqR6xCaOWrI+uG6A7jeCbGF+yfNEVWGrD8=;
	h=In-Reply-To:References:Cc:From:Subject:To:Date:List-ID:From;
	b=brytDFO38YOkSIsrkHgDbHvBRVukQzOu27VbdAfnWpJU8tSqfAI7OPXXr5eSt3OaR
	 fNQlrNciVftaf/TzcqrF2x4fSYX6wdUNZImnkYE1nHBED0417DyhNmxFvUB4XArwZs
	 SReNZeTKsBvAxBhLOLkBJ9HOGir/6hhSLQBYglIk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726866AbfDZULM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 Apr 2019 16:11:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:53378 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726083AbfDZULM (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 26 Apr 2019 16:11:12 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0F2FD20693;
        Fri, 26 Apr 2019 20:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556309472;
        bh=RkbULoiZSLqR6xCaOWrI+uG6A7jeCbGF+yfNEVWGrD8=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=YhqQNjZFeIFmFDmu83CDgtskZX1s2BX8H+REwMwR6Mpvu6k+Iix3gC1HxCTo54g+5
         8mnOFOjRpc1+/Xm+2OfBT235mrKYsNnqrdhWGq7CZwt83tnUhpSHnDw6GGJ50Oux4b
         K1ik5tmfxIY/qF4/fJ/1+1y8wM24islDVQdwZo1U=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190425081454.3210-1-ping.bai@nxp.com>
References: <20190425081454.3210-1-ping.bai@nxp.com>
Cc:     dl-linux-imx <linux-imx@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: imx: keep uart clock on during system boot
To:     "festevam@gmail.com" <festevam@gmail.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Jacky Bai <ping.bai@nxp.com>
Message-ID: <155630947117.15276.2826970890432610316@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Fri, 26 Apr 2019 13:11:11 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jacky Bai (2019-04-25 01:10:08)
> Keep uart clocks enabled when earlyprintk or
> earlycon is active.
>=20
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---

Applied to clk-next

