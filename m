Return-Path: <SRS0=xZCl=DP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15A8AC4363D
	for <linux-clk@archiver.kernel.org>; Thu,  8 Oct 2020 02:08:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AFCC320B1F
	for <linux-clk@archiver.kernel.org>; Thu,  8 Oct 2020 02:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602122888;
	bh=bM/qlb3uYgNDk3J61YKtn4KH5ZoVzgjrgOIM5Xb3kgw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=eoBVXIXm9WaErgjhP3R1AM8Ea2CO+fsbwoYEctU92cbvkZ/U1PeRVK31xstZjgGUw
	 yIG8rOJtSO8dLgnP/m7Nblv5aW0uCaZOIHbvFAYjDSIgMAqXthRxRiWX4YkaQf6Eb0
	 Ybi8DXM2PQsqB5Lg47WCbEKs3Kqoe/LHI0lEBsLU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727663AbgJHCII (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Oct 2020 22:08:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:55788 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727655AbgJHCII (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 7 Oct 2020 22:08:08 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 70556207C3;
        Thu,  8 Oct 2020 02:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602122887;
        bh=bM/qlb3uYgNDk3J61YKtn4KH5ZoVzgjrgOIM5Xb3kgw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=DpbYu6m7EYc0feGNIXTSSYnjnXj7GUer9J/vHbkWfrbYoWHeMu7+JLmkTNd5uk5M3
         q4aNr2BSy5EzmJOktsZ0/irKuvu7S/Qti8eVYpc4Icd3jXZ7fOw34MaYYowQkKp+4a
         bVCSEpyq0GL6wN4hyw3sd8UWPxCXpRuI5pNPebhw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200924071706.GB2480300@ulmo>
References: <20200918094642.108070-1-zhangqilong3@huawei.com> <160080466654.310579.9823605565645488149@swboyd.mtv.corp.google.com> <20200923081654.GC1110498@ulmo> <160090396030.310579.9633354457476529250@swboyd.mtv.corp.google.com> <20200924071706.GB2480300@ulmo>
Subject: Re: [PATCH -next] clk: tegra: clk-dfll: indicate correct error reason in tegra_dfll_register
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Qilong Zhang <zhangqilong3@huawei.com>, mturquette@baylibre.com,
        pdeschrijver@nvidia.com, pgaikwad@nvidia.com, jonathanh@nvidia.com,
        linux-clk@vger.kernel.org
To:     Thierry Reding <thierry.reding@gmail.com>
Date:   Wed, 07 Oct 2020 19:08:06 -0700
Message-ID: <160212288610.310579.9078602236923833984@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Thierry Reding (2020-09-24 00:17:06)
> On Wed, Sep 23, 2020 at 04:32:40PM -0700, Stephen Boyd wrote:
> > Quoting Thierry Reding (2020-09-23 01:16:54)
> > > On Tue, Sep 22, 2020 at 12:57:46PM -0700, Stephen Boyd wrote:
> > > > Quoting Qilong Zhang (2020-09-18 02:46:42)
> > > > >         td->base =3D devm_ioremap(td->dev, mem->start, resource_s=
ize(mem));
> > > > >         if (!td->base) {
> > > > >                 dev_err(td->dev, "couldn't ioremap DFLL control r=
egisters\n");
> > > > > -               return -ENODEV;
> > > > > +               return -ENOMEM;
> > > >=20
> > > > Can you remove the dev_err() lines too? They're pretty much useless.
> > >=20
> > > I find them somewhat useful because they indicate which particular
> > > resource wasn't properly mapped. If we get an -ENOMEM without the err=
or
> > > message, we'll have to go and guess which one it is.
> > >=20
> >=20
> > Doesn't that print the stacktrace when we run out of memory?
>=20
> slab allocator functions like kmalloc() and friends do, but I'm not
> aware of ioremap() doing so. Perhaps if it runs out of virtual memory
> for the mapping it would, but there are other reasons why this can fail.
>=20

Ok, but the other failure modes are going to happen outside of
developing the driver? What failure of ioremap() are you trying to
catch?

And even if knowing which resource didn't map properly, wouldn't we be
better off moving the error message closer to the actual problem in
ioremap() so it can tell us the problem that was seen? Otherwise I fear
the driver is going to tell the user that some error happened but we
won't be able to really figure out what the error is.
