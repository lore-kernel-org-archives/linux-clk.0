Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 269EDC05027
	for <linux-clk@archiver.kernel.org>; Fri, 17 Feb 2023 22:11:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbjBQWL0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Feb 2023 17:11:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjBQWLZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Feb 2023 17:11:25 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CD9A63BE0;
        Fri, 17 Feb 2023 14:11:24 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BB90862072;
        Fri, 17 Feb 2023 22:11:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E7CFC433EF;
        Fri, 17 Feb 2023 22:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676671883;
        bh=+QcKL3+xQilDMC4OrD4cJ9owC31OgFTJ0bEwOKyJCIo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=VMYRmmjH8IJJTo8tTxuuCf+ucYEjE0gEsaaXSzLbvdi7o7J1r9oLsRi+24TJXWavF
         UfPXB+nrIbeJX1mEF+nwQmVlxukiaQ0K4aXKIIohoSMZkYm//hbHXQtNjkvDjyKEJk
         NiJGAUhLbizzBsSsdWHZ8M1azccGQxYP4ZVKAUzOkmQGZAqgymrZk5E9EDKB4UD6d5
         yHFqz9GZO57iDtOFWvJfKBrfEp/7CkXoointN5pCtTJ8NU9pboch7d4BMlNXbjxa9g
         mw0B0xWv1sUvLeoOHLp2XkUytnmauqSfmgeZUKTlUKKPOWV7nc9BvPH7SnWcMM905Q
         plr2NmYTHc3ZA==
Message-ID: <6dcb55104d5065d30a9dab4bca878922.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230215232712.17072-1-ansuelsmth@gmail.com>
References: <20230215232712.17072-1-ansuelsmth@gmail.com>
Subject: Re: [PATCH] clk: Fix wrong clock returned in parent_data with .name and no .index
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Christian Marangi <ansuelsmth@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Chen-Yu Tsai <wens@csie.org>
To:     Christian Marangi <ansuelsmth@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Fri, 17 Feb 2023 14:11:20 -0800
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Christian Marangi (2023-02-15 15:27:12)
> Commit 601b6e93304a ("clk: Allow parents to be specified via clkspec inde=
x")
> introduced a regression due to a "fragile" implementation present in some=
 very
> corner case.
>=20
> Such commit introduced the support for parents to be specified using
> clkspec index. The index is an int and should be -1 if the feature
> should not be used. This is the case with parent_hws or legacy
> parent_names used and the index value is set to -1 by default.
> With parent_data the situation is different, since it's a struct that
> can have multiple value (.index, .name, .fw_name), it's init to all 0 by
> default. This cause the index value to be set to 0 everytime even if not

It's only initialized to all 0 because that's what you've decided to do.
It could be on the stack and have random stack junk values.

> intended to be defined and used.
>=20
> This simple "fragile" implementation cause side-effect and unintended
> behaviour.
>=20
> Assuming the following scenario (to repro the corner case and doesn't
> reflect real code):
>=20
> In dt we have a node like this:
>                 acc1: clock-controller@2098000 {
>                         compatible =3D "qcom,kpss-acc-v1";
>                         reg =3D <0x02098000 0x1000>, <0x02008000 0x1000>;
>                         clock-output-names =3D "acpu1_aux";
>                         clocks =3D <&pxo_board>;
>                         clock-names =3D "pxo";
>                         #clock-cells =3D <0>;
>                 };
>=20
> And on the relevant driver we have the parent data defined as such:
>                 static const struct clk_parent_data aux_parents[] =3D {
>                         { .name =3D "pll8_vote" },
>                         { .fw_name =3D "pxo", .name =3D "pxo_board" },
>                 };
>=20
> Someone would expect the first parent to be globally searched and set to
> point to the clock named "pll8_vote".
> But this is not the case and instead under the hood, the parent point to
> the pxo clock. This happen without any warning and was discovered on
> another platform while the gcc driver was converted to parent_data and
> only .name was defined.

You didn't set .index explicitly to zero, but it is zero because of the
use of static struct initializers here. If the struct was on the stack
nobody knows what the value would be. Set -1 if you don't want to use
the index lookup path.
