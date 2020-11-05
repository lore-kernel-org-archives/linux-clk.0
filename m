Return-Path: <SRS0=dIxE=EL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47CB3C2D0A3
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 01:09:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E41A920BED
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 01:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604538582;
	bh=X15HpKE6KaTHf/EyAWblPZ3s+9tEv1xJ4jxspPkc658=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=1WtyfRowTL2ttlVEKi8mIzHRIYxVqXej0XX9COvvm93IgHiur/tdXSEXVg424jp70
	 rbTf+WdBCxfld3KVuXYC6tg+0xrqn67NZip4NBjFpMEY81NX46/+6rPX9egueERNT7
	 ++fZSY64nx80sgfXqnUl73cTFhgtrmBVx2lBQrnw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730533AbgKEBJl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Nov 2020 20:09:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:56382 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726018AbgKEBJl (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 4 Nov 2020 20:09:41 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D7D8120867;
        Thu,  5 Nov 2020 01:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604538581;
        bh=X15HpKE6KaTHf/EyAWblPZ3s+9tEv1xJ4jxspPkc658=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=uBiW5cqH9aIOUJkhJYb6nEympqzj4n5GwABfnpowbUtClw7r5nBRdEnJy1o55LlEz
         mhKuVBvMVNK12ZjiT+GFYVtGGAn1Q/kstFB8qXWg6IMnmEUJ91pftMCtc7LhOzRusF
         WWUqxlAyUtz2IfsZuCi84pQwjQg5EVEfpRBo8/zo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1604402306-5348-12-git-send-email-abel.vesa@nxp.com>
References: <1604402306-5348-1-git-send-email-abel.vesa@nxp.com> <1604402306-5348-12-git-send-email-abel.vesa@nxp.com>
Subject: Re: [PATCH v5 11/14] clk: imx: Add blk-ctl driver for i.MX8MP
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@nxp.com>
To:     Abel Vesa <abel.vesa@nxp.com>, Adam Ford <aford173@gmail.com>,
        Anson Huang <anson.huang@nxp.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Marek Vasut <marek.vasut@gmail.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Peng Fan <peng.fan@nxp.com>, Rob Herring <robh@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>
Date:   Wed, 04 Nov 2020 17:09:39 -0800
Message-ID: <160453857946.3965362.2066334905806962105@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Abel Vesa (2020-11-03 03:18:23)
> This driver is intended to work with the following BLK_CTL IPs found in
> i.MX8MP:
>  - Audio
>  - Media
>  - HDMI
>=20
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
