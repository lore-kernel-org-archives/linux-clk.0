Return-Path: <SRS0=on/j=3T=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 452C3C2D0DB
	for <linux-clk@archiver.kernel.org>; Thu, 30 Jan 2020 17:42:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1B6652083E
	for <linux-clk@archiver.kernel.org>; Thu, 30 Jan 2020 17:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1580406130;
	bh=iylYJCQlli4M7Fmtr9gfq5RSFTD1CKi2eHDl0ImzPr8=;
	h=In-Reply-To:References:Subject:To:From:Cc:Date:List-ID:From;
	b=GUwYTJ2IUXLEqmHRGyILWw3mr4DcFla8lhbSsaJsz6Do2QYbDTny/1MeaGj6Jn7V8
	 /3BgQ4MOUWWAK9wS477B03v3YogHHINuMhyXhYxmPhjy/98xtsa9DzUrckxTboYU6R
	 0iXxOERnuJuZiftIUIjrM2WgI296NUrcyxIZfeyM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727263AbgA3RmJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 Jan 2020 12:42:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:60452 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727158AbgA3RmJ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 30 Jan 2020 12:42:09 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B1D5620661;
        Thu, 30 Jan 2020 17:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580406128;
        bh=iylYJCQlli4M7Fmtr9gfq5RSFTD1CKi2eHDl0ImzPr8=;
        h=In-Reply-To:References:Subject:To:From:Cc:Date:From;
        b=qIki7rDktDLpciAgwxatXi3SNExDjE8bKxSbUgpK14Ib8qJnQiYukCYtK4D/V8cvS
         xmF73jnWeEizgXM6Yojq39qkyaLfUZcJ+SuSReCwCZ9WuNBHTET6GPcm/rR41gT3u3
         K6sQBenHOSluVyTXn00dR0H2eWf7KL/07HUM4zBQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200115212639.4998-2-jae.hyun.yoo@linux.intel.com>
References: <20200115212639.4998-1-jae.hyun.yoo@linux.intel.com> <20200115212639.4998-2-jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH 1/2] clk: aspeed: add critical clock setting logic
To:     Andrew Jeffery <andrew@aj.id.au>,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Joel Stanley <joel@jms.id.au>,
        Michael Turquette <mturquette@baylibre.com>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        openbmc@lists.ozlabs.org,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
User-Agent: alot/0.8.1
Date:   Thu, 30 Jan 2020 09:42:07 -0800
Message-Id: <20200130174208.B1D5620661@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jae Hyun Yoo (2020-01-15 13:26:38)
> This commit adds critical clock setting logic that applies
> CLK_IS_CRITICAL flag if it detects 'clock-critical' property in
> device tree.

Yes that is what the patch does. The commit text is supposed to explain
_why_ the patch is important. Please read "The canonical patch format"
from Documentation/process/submitting-patches.rst to understand what is
expected.

>=20
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>  drivers/clk/clk-aspeed.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
> index 411ff5fb2c07..d22eeb574ede 100644
> --- a/drivers/clk/clk-aspeed.c
> +++ b/drivers/clk/clk-aspeed.c
> @@ -541,8 +541,11 @@ static int aspeed_clk_probe(struct platform_device *=
pdev)
> =20
>         for (i =3D 0; i < ARRAY_SIZE(aspeed_gates); i++) {
>                 const struct aspeed_gate_data *gd =3D &aspeed_gates[i];
> +               unsigned long flags =3D gd->flags;
>                 u32 gate_flags;
> =20
> +               of_clk_detect_critical(pdev->dev.of_node, i, &flags);
> +

Do you need clks to be critical, but only sometimes? What clks need to
be critical? Why aren't there drivers for those clks that turn them on
as necessary?

There was a lengthy discussion years ago on the list about this function
and how it's not supposed to be used in newer code. Maybe we need to
revisit that discussion and conclude that sometimes we actually do need
clks to be turned on and kept on because we'll never have a driver for
them in the kernel. Similar to how pinctrl has pin hogs.

