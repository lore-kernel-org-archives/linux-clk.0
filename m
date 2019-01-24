Return-Path: <SRS0=VLoV=QA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF0CC282C6
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jan 2019 19:53:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 03D7921726
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jan 2019 19:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1548359634;
	bh=NvJxEb0uwFbkNik/mB17l9fI/755tZ+BKXKMx+ZcRng=;
	h=Subject:References:Cc:From:In-Reply-To:To:Date:List-ID:From;
	b=aweieXKAMwvzczADUsCs4fR9owNdIm69jZllmKD32mrNCQTv6jPWTkgQBvfJymkC8
	 KpHHDpVa9DjSrmVEoI8BX7CQyRpg9GyoOcfTPy/fzmJcq8QcaFuVkM7LE/R46OsSVI
	 uMUJGc2zeFmqPcJg2NMe0SfirLMY+dRwuw3Xfxv0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732740AbfAXTh6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Jan 2019 14:37:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:38056 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732735AbfAXTh6 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 24 Jan 2019 14:37:58 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9D638218FC;
        Thu, 24 Jan 2019 19:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1548358677;
        bh=NvJxEb0uwFbkNik/mB17l9fI/755tZ+BKXKMx+ZcRng=;
        h=Subject:References:Cc:From:In-Reply-To:To:Date:From;
        b=Gn8fRI9xvZFzw9ZPvcClUC4WnZMrxT2LEAImQZgLeik1ED5CVZIcmmoWgB7I8AwL6
         8o2OIhGqdS3yDKCHaBcsuEqjIOuQ4Yu/Ot5ccGmQeXQLKAAn0nXXuKxgGf0HWPllws
         fozHVK4Mtkp1i5uqF19lzPR6ToulPn0fwfK7lO9U=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] clk: imx: imx7ulp: use struct_size() in kzalloc()
References: <20181224064025.GA9588@embeddedor.com>
User-Agent: alot/0.8
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20181224064025.GA9588@embeddedor.com>
Message-ID: <154835867687.136743.9650857344780789822@swboyd.mtv.corp.google.com>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>
Date:   Thu, 24 Jan 2019 11:37:56 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Gustavo A. R. Silva (2018-12-23 22:40:25)
> One of the more common cases of allocation size calculations is finding
> the size of a structure that has a zero-sized array at the end, along
> with memory for some number of elements for that array. For example:
>=20
> struct foo {
>     int stuff;
>     void *entry[];
> };
>=20
> instance =3D kzalloc(sizeof(struct foo) + sizeof(void *) * count, GFP_KER=
NEL);
>=20
> Instead of leaving these open-coded and prone to type mistakes, we can
> now use the new struct_size() helper:
>=20
> instance =3D kzalloc(struct_size(instance, entry, count), GFP_KERNEL);
>=20
> This issue was detected with the help of Coccinelle.
>=20
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---

Applied to clk-next

