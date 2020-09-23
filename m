Return-Path: <SRS0=lMr4=DA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12AD9C2D0A8
	for <linux-clk@archiver.kernel.org>; Wed, 23 Sep 2020 23:32:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C22E220C56
	for <linux-clk@archiver.kernel.org>; Wed, 23 Sep 2020 23:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600903970;
	bh=Yg/Me69uBYD13Mn8efledK3VngdYrBerIus1mk2+1QE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=ZWXgkXY2ncH9KTqksQp0RqiQ6iONL7PMoWDf9OoZZl9IjsBjtEtkjJOQf9gEQzpnD
	 WjNC08SfAe3FLeL8TA2elGSsioC7IrjDgpQbSmQonlIba/bab+EHrwNzkCEaycUQ/F
	 P2BUYIC385LJCCjhQHFsnNnHvZ+FIOjXgLsJOc+I=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726727AbgIWXcq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Sep 2020 19:32:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:36626 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726721AbgIWXcm (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 23 Sep 2020 19:32:42 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8417020888;
        Wed, 23 Sep 2020 23:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600903961;
        bh=Yg/Me69uBYD13Mn8efledK3VngdYrBerIus1mk2+1QE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=oUfByonS470Iaxt4tw5Whk/Lgkn68mnnQ50tDW/oB3+b6c8EFj5BBoyd2MqEKQ7Mf
         JwVpJ52+yH0lRxWFy0LB3LQ9m5PaLvRrcn0XDHCgI7J5HmYT0c8isasMlE9hrR3m25
         XroRCggbxRkXY2WgOZWOLaDHXR8IW0YHkq3NrdCI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200923081654.GC1110498@ulmo>
References: <20200918094642.108070-1-zhangqilong3@huawei.com> <160080466654.310579.9823605565645488149@swboyd.mtv.corp.google.com> <20200923081654.GC1110498@ulmo>
Subject: Re: [PATCH -next] clk: tegra: clk-dfll: indicate correct error reason in tegra_dfll_register
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Qilong Zhang <zhangqilong3@huawei.com>, mturquette@baylibre.com,
        pdeschrijver@nvidia.com, pgaikwad@nvidia.com, jonathanh@nvidia.com,
        linux-clk@vger.kernel.org
To:     Thierry Reding <thierry.reding@gmail.com>
Date:   Wed, 23 Sep 2020 16:32:40 -0700
Message-ID: <160090396030.310579.9633354457476529250@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Thierry Reding (2020-09-23 01:16:54)
> On Tue, Sep 22, 2020 at 12:57:46PM -0700, Stephen Boyd wrote:
> > Quoting Qilong Zhang (2020-09-18 02:46:42)
> > > From: Zhang Qilong <zhangqilong3@huawei.com>
> > >=20
> > > Calling devm_ioremap means getting devices resource have been
> > > successful. When remap operation failed, we should return '-ENOMEM'
> > > instead of '-ENODEV' to differentiate between getting resource and
> > > mapping memory for reminding callers. Moreover, it is not consistent
> > > with devm_kzalloc operation.
> > >=20
> > > Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> > > ---
> > >  drivers/clk/tegra/clk-dfll.c | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > >=20
> > > diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfl=
l.c
> > > index cfbaa90c7adb..6637b73be9f1 100644
> > > --- a/drivers/clk/tegra/clk-dfll.c
> > > +++ b/drivers/clk/tegra/clk-dfll.c
> > > @@ -1993,7 +1993,7 @@ int tegra_dfll_register(struct platform_device =
*pdev,
> > >         td->base =3D devm_ioremap(td->dev, mem->start, resource_size(=
mem));
> > >         if (!td->base) {
> > >                 dev_err(td->dev, "couldn't ioremap DFLL control regis=
ters\n");
> > > -               return -ENODEV;
> > > +               return -ENOMEM;
> >=20
> > Can you remove the dev_err() lines too? They're pretty much useless.
>=20
> I find them somewhat useful because they indicate which particular
> resource wasn't properly mapped. If we get an -ENOMEM without the error
> message, we'll have to go and guess which one it is.
>=20

Doesn't that print the stacktrace when we run out of memory?
