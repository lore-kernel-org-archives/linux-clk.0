Return-Path: <SRS0=3Y/e=ON=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F92DC04EB8
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 20:54:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0030520834
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 20:54:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="GqQqRW0T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0030520834
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725867AbeLDUyg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Dec 2018 15:54:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:42814 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726263AbeLDUyg (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 4 Dec 2018 15:54:36 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2BA0E2081B;
        Tue,  4 Dec 2018 20:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1543956875;
        bh=SrFbdyxYsYVyjA57irTwtVbQ8ELhrcpR5swTOS87yXQ=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=GqQqRW0TR/RZUMEKXPH8zmW5M46WjiCKCLAO/3fn66SG9MyNMhXV/QlFlKH0YCTkn
         VDzL0X4u4165uqj5ZHjxShYJUtU1ssdpeOc6c0ppg6OgVYLYHKOMo318OkYqF7MrL9
         qCK19HYYZEdHUaHJsKRBGtPKMurzJ70PTGbYUpqw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Joel Stanley <joel@jms.id.au>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <CACPK8XcwMMoxG6vhDhUU8RYGABx7rtBoxJvp2yDhHeD-PemdqA@mail.gmail.com>
Cc:     Andrew Jeffery <andrew@aj.id.au>,
        Michael Turquette <mturquette@baylibre.com>,
        vijaykhemka@fb.com, chyishian.jiang@gmail.com,
        linux-clk@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed@lists.ozlabs.org,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        "# 3.4.x" <stable@vger.kernel.org>
References: <20181204185054.24053-1-jae.hyun.yoo@linux.intel.com>
 <CACPK8XcwMMoxG6vhDhUU8RYGABx7rtBoxJvp2yDhHeD-PemdqA@mail.gmail.com>
Message-ID: <154395687459.88331.13570416457347078441@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH v2] clk: aspeed: Mark lclk (LPC) and espiclk (eSPI) as critical
Date:   Tue, 04 Dec 2018 12:54:34 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Joel Stanley (2018-12-04 12:51:43)
> Hi Jae,
> =

> On Wed, 5 Dec 2018 at 05:20, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> =
wrote:
> >
> > These interfaces are used by host to talk to BMC, and the clock
> > source is from the host, usually from PCH. So this commit marks
> > the lclk as critical to make it able to be enabled. Also, it marks
> > espiclk too because eSPI is sharing the same interface with LPC.
> =

> While this is true on the platform you have in mind, on other
> platforms this is not the case. They do not use eSPI, and LCLK is
> enabled by the driver that is used to configure LPC
> (drivers/misc/aspeed-lpc-ctrl.c):
> =

>  lpc_ctrl: lpc-ctrl@0 {
>      compatible =3D "aspeed,ast2400-lpc-ctrl";
>      reg =3D <0x0 0x80>;
>      clocks =3D <&syscon ASPEED_CLK_GATE_LCLK>;
>  }
> =

> I wonder if we need a device tree binding to describe which clocks are cr=
itical.

A binding to describe critical clks has been rejected in the past. I
don't think we need to have it here either? More information on why
things are being marked critical will be helpful to see if we need to
re-open that discussion again.

> =

> Stephen, please don't merge this patch yet.
> =


Sure.

