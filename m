Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFA17C433E0
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 02:26:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E82B64E30
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 02:26:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229454AbhBKC0O (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 Feb 2021 21:26:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:52348 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229451AbhBKC0N (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 10 Feb 2021 21:26:13 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0657564EBC;
        Thu, 11 Feb 2021 02:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613010333;
        bh=IZyz9+FLGaTVi2EESsaEByYRv3Y9MlCzzfaQ7h46/lg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=oVKjUTUYhZPrlNogGR2iTgVLwqq/ritGy2WVX9eoG4KI+iPqbycmrYiJObB1ccXrH
         kv2vH0uH1IBL0b2P8uawLa3MkrvD8HcYx+6MEeN0cpTDUx31lAXHFIMT8tvT8qNwKd
         QHw1peP05/zHXPUwkbm7BRVLfVn9jnhjFi5cCiPP7IYLR0dpJ4K3v+BL202H5hZ52b
         9G+7WFNVqZEYqLy0loAXvu8vfm/+2k10wMV99KyngV7sFXNZKMWNatRLXjxhX9i4Gs
         CN6FqyyeucSTaDvgbAAswyEg8BuoEel/KnZlgaHILjesyeXxZ8VOXDJmlhVK/xOF49
         kMO2wkZwEOgkg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YCO9IZ4IHI2gruds@smile.fi.intel.com>
References: <20210209170952.49794-1-andriy.shevchenko@linux.intel.com> <161291514590.418021.17536537656317500613@swboyd.mtv.corp.google.com> <YCO9IZ4IHI2gruds@smile.fi.intel.com>
Subject: Re: [PATCH v1] clk: Move struct clk_core to use struct fwnode_handle
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date:   Wed, 10 Feb 2021 18:25:31 -0800
Message-ID: <161301033161.1254594.5999850767233898633@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Andy Shevchenko (2021-02-10 03:01:53)
> On Tue, Feb 09, 2021 at 03:59:05PM -0800, Stephen Boyd wrote:
> > Quoting Andy Shevchenko (2021-02-09 09:09:52)
> > > fwnode is an abstraction on the different types of firmware nodes.
> > > In order to allow clocks to be linked with any type of such node,
> > > start a conversion to the struct fwnode_handle instead of being
> > > stuck with struct device_node.
> >=20
> > Is ACPI going to support clk hardware? We're "stuck" with device nodes
> > mostly because there isn't a clk framework for ACPI.
>=20
> Here I'm not talking about ACPI vs. DT vs. anything, the pure motivation =
is to
> make less divergence of standalone OF vs. fwnode (see IRQ domain APIs, for
> example, which allows to use them in regmap IRQ APIs).
>=20

I thought the fwnode changes in IRQ domain APIs was to work across both
ACPI and DT. Please tell me more!
