Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55956C433DB
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 19:15:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2ACC764DCE
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 19:15:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229700AbhBKTKd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Feb 2021 14:10:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:36436 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229617AbhBKTKd (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 11 Feb 2021 14:10:33 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9DB3564DE3;
        Thu, 11 Feb 2021 19:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613070592;
        bh=cePJ2alhUwsen+CxYJcc2peFQ9GXfSY/m0PECxkNV3U=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=laFgWuEZL1mjeRR3ieFUD8/ONseSp31a/OXuaqC/f/NhBu3Q/kiXllf4GV3a/1YF1
         ERmZETBOKwm1v3gjnFg7GOmAWxXr7lOAWDbdtvdsyIIhvpS+wWjn3kY5p/zMog6RRZ
         ZU4xmhlNN9nZagvFjvUZyricBcw2Q8U4vPhtd+nWqkpzMhkmKDvgOe4bc3byWs4FVS
         UrRQaj8mKRh3GHwaS/YgH/6W1Vg196dOc4z6aA6iAEBYcJJuvwJYgoYm0Rvx/3n0oY
         nuBGKFtXpVOFdvq6H3inhurbVm5TyfdbeOaj2QDXsqzM0fVzZkTQGeUpm+Gt0QKIuz
         AoXV7j3YlpB+A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YCUJAGKKkP0AI5fX@smile.fi.intel.com>
References: <20210209170952.49794-1-andriy.shevchenko@linux.intel.com> <161291514590.418021.17536537656317500613@swboyd.mtv.corp.google.com> <YCO9IZ4IHI2gruds@smile.fi.intel.com> <161301033161.1254594.5999850767233898633@swboyd.mtv.corp.google.com> <YCUJAGKKkP0AI5fX@smile.fi.intel.com>
Subject: Re: [PATCH v1] clk: Move struct clk_core to use struct fwnode_handle
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date:   Thu, 11 Feb 2021 11:09:51 -0800
Message-ID: <161307059118.1254594.7158693162962637883@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Andy Shevchenko (2021-02-11 02:37:52)
> On Wed, Feb 10, 2021 at 06:25:31PM -0800, Stephen Boyd wrote:
> > Quoting Andy Shevchenko (2021-02-10 03:01:53)
> > > On Tue, Feb 09, 2021 at 03:59:05PM -0800, Stephen Boyd wrote:
> > > > Quoting Andy Shevchenko (2021-02-09 09:09:52)
> > > > > fwnode is an abstraction on the different types of firmware nodes.
> > > > > In order to allow clocks to be linked with any type of such node,
> > > > > start a conversion to the struct fwnode_handle instead of being
> > > > > stuck with struct device_node.
> > > >=20
> > > > Is ACPI going to support clk hardware? We're "stuck" with device no=
des
> > > > mostly because there isn't a clk framework for ACPI.
> > >=20
> > > Here I'm not talking about ACPI vs. DT vs. anything, the pure motivat=
ion is to
> > > make less divergence of standalone OF vs. fwnode (see IRQ domain APIs=
, for
> > > example, which allows to use them in regmap IRQ APIs).
> > >=20
> >=20
> > I thought the fwnode changes in IRQ domain APIs was to work across both
> > ACPI and DT. Please tell me more!
>=20
> I wish I could dig this out from the commit
> f110711a6053 ("irqdomain: Convert irqdomain-%3Eof_node to fwnode")
> but it kept silent what the motivation of doing that.
>=20
> For me the fwnode API brings an agnostic interface which is good thing to=
 have
> and makes it easier to be used by other providers (you know that we have =
swnode
> besides ACPI and DT, right?).
>=20
> I would like to re-use clk-gpio in ACPI based environment and I found it =
quite
> difficult without changing a lot of things in clk framework which is tigh=
ten to
> OF by nails. This is not good from design perspective and makes my journey
> miserable. Of course if clk is against this, I would live with copy'n'pas=
te
> approach =E2=80=94 no hard feelings. Just let me know.
>=20

Please add this motivation to the commit text. In particular how it will
help the clk-gpio code be used on an ACPI environment. Or maybe even
send it along with the clk-gpio changes that you've made.
