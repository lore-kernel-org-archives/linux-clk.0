Return-Path: <SRS0=vytI=PR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8A86C43387
	for <linux-clk@archiver.kernel.org>; Wed,  9 Jan 2019 18:35:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 65890214C6
	for <linux-clk@archiver.kernel.org>; Wed,  9 Jan 2019 18:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1547058906;
	bh=ppVBAV8fnW4EUBCCsd0w3TiaZrNbEUJaTYiL8rKVyX4=;
	h=Subject:Cc:To:In-Reply-To:From:References:Date:List-ID:From;
	b=RxS60a4An7643rCxbTmCXtmw6JFio29YRYWuhI5oH8ZKYx9oSElWxiYEUEUOWXqyG
	 iMazYdsbVh3qlOJ0TpneflXZ1EqSJevK0tNwQSjYWNhpHVn8gooDP3uqZtP0QQ3RDA
	 DYQIHi8XNQl8Qiowiz+o+vHPSFQlcrz8KT7agbI4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727438AbfAISfE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Jan 2019 13:35:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:39842 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727226AbfAISfE (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 9 Jan 2019 13:35:04 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C3A672064C;
        Wed,  9 Jan 2019 18:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1547058903;
        bh=ppVBAV8fnW4EUBCCsd0w3TiaZrNbEUJaTYiL8rKVyX4=;
        h=Subject:Cc:To:In-Reply-To:From:References:Date:From;
        b=J+VNWU8cDb5GmFx8xIhFIvpnNQT7YrwRt6DGH4PFwVDnHZpOwDV/8FuoPgpK7Av0T
         JEMrBjG6jfqgfkEQy35WvrtSECUvr1HzIpp518EkLpqxBEQeQJmDM5lkYEbmanDYw1
         RGdzFD5KIcLZqYMpPHgmYq8SGRHTArIyvA6+uc0U=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH -next] clk: imx: fix potential NULL dereference in imx8qxp_lpcg_clk_probe()
Cc:     Wei Yongjun <weiyongjun1@huawei.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        kernel-janitors@vger.kernel.org
To:     Aisheng Dong <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Wei Yongjun <weiyongjun1@huawei.com>
In-Reply-To: <1545115389-173136-1-git-send-email-weiyongjun1@huawei.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
References: <1545115389-173136-1-git-send-email-weiyongjun1@huawei.com>
Message-ID: <154705890283.15366.13108584006669963345@swboyd.mtv.corp.google.com>
Date:   Wed, 09 Jan 2019 10:35:02 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Wei Yongjun (2018-12-17 22:43:09)
> platform_get_resource() may fail and return NULL, so we should
> better check it's return value to avoid a NULL pointer dereference
> a bit later in the code.
>=20
> This is detected by Coccinelle semantic patch.
>=20
> @@
> expression pdev, res, n, t, e, e1, e2;
> @@
>=20
> res =3D platform_get_resource(pdev, t, n);
> + if (!res)
> +   return -EINVAL;
> ... when !=3D res =3D=3D NULL
> e =3D devm_ioremap(e1, res->start, e2);
>=20
> Fixes: 1e3121bfe51a ("clk: imx: add imx8qxp lpcg driver")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---

Applied to clk-fixes

