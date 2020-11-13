Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1707C388F7
	for <linux-clk@archiver.kernel.org>; Fri, 13 Nov 2020 07:53:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D706217A0
	for <linux-clk@archiver.kernel.org>; Fri, 13 Nov 2020 07:53:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="0AwJizWZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbgKMHxJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 Nov 2020 02:53:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:49102 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725866AbgKMHxJ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 13 Nov 2020 02:53:09 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 551BB208D5;
        Fri, 13 Nov 2020 07:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605253988;
        bh=qA8YURu9OEeXzoU7ofhA5m7bLtH8fT8x4bawGyc1VkY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=0AwJizWZJl7oqWEB6iqVKXClGvFyUUEOQaujmPrm5kZMmtPr5sM9WukgkQUW91hTZ
         5AN3/WzKdcllb/8VBX0PcDh0D2rj8LY2900+ydpe7TnC9DnChdxT0vuyA0MqsC09gM
         FpEuPmqMphdXNwPaK5n0xejOq9aVVmxX+Zs4Hmrk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <BL0PR04MB6514621FDC804DAD854AFA06E7E60@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com> <20201107081420.60325-9-damien.lemoal@wdc.com> <160525270249.60232.12874105352298232293@swboyd.mtv.corp.google.com> <BL0PR04MB6514621FDC804DAD854AFA06E7E60@BL0PR04MB6514.namprd04.prod.outlook.com>
Subject: Re: [PATCH 08/32] riscv: Fix kernel time_init()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Sean Anderson <seanga2@gmail.com>
To:     Damien Le Moal <Damien.LeMoal@wdc.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Rob Herring <robh+dt@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-riscv@lists.infradead.org
Date:   Thu, 12 Nov 2020 23:53:06 -0800
Message-ID: <160525398691.60232.17463845218341195554@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Damien Le Moal (2020-11-12 23:40:17)
> On 2020/11/13 16:31, Stephen Boyd wrote:
> > Quoting Damien Le Moal (2020-11-07 00:13:56)
> >> If of_clk_init() is not called in time_init(), clock providers defined
> >> in the system device tree are not initialized, resulting in failures f=
or
> >> other devices to initialize due to missing clocks.
> >> Similarly to other architectures and to the default kernel time_init()
> >> implementation, call of_clk_init() before executing timer_probe() in
> >> time_init().
> >=20
> > Do you have timers that need clks to be running or queryable this early?
> > This of_clk_init() call is made here when architectures need to call
> > things like clk_get_rate() to figure out some clk frequency for their
> > clockevent or clocksource. It is OK to have this call here, I'm just
> > curious if this is actually necessary vs. delaying it to later.
> >=20
>=20
> I think the clocks could be initialized later, but at least the CLINT will
> depend on one of the clocks, same for the CPU frequency information. So n=
eed
> checking.
>=20
> What this patch fixes is not the need for a super early initialization th=
ough,
> it is that _nothing_ was being initialized without it: the clock driver p=
robe
> function was never called with the current riscv time_init() as is. I loo=
ked at
> other architectures and at the default kernel time_init(), and mimicked w=
hat was
> done, that is, added of_clk_init(). Is there any other way to make sure t=
hat the
> needed clock drivers are initialized ?
>=20

Yes it's fine. Just the commit text reads as "If of_clk_init() is not
called in time_init() then nothing works" which is true but made me
wonder if it was because it needed to be super early or not. The commit
text could be a little clearer here.

We don't have any good solution for a fallback to call of_clk_init()
somewhere later. I do wonder if we should generalize this though and
call of_clk_init() from start_kernel() directly via some Kconfig that
architectures select if they need it for their timer and then move it to
an initcall if architectures don't select the config. Or throw it into
the of_platform_default_populate_init() hook if the architecture doesn't
need to call it early.
