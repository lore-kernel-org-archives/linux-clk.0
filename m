Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 944BBC47083
	for <linux-clk@archiver.kernel.org>; Wed,  2 Jun 2021 08:18:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 78494613C1
	for <linux-clk@archiver.kernel.org>; Wed,  2 Jun 2021 08:18:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232443AbhFBIU2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Jun 2021 04:20:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:37078 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232437AbhFBIU2 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 2 Jun 2021 04:20:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 85A016100A;
        Wed,  2 Jun 2021 08:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622621925;
        bh=xEDqrLXeDqjFw9bTsbFpSHECzMDTrZ/GON+d4W0pqCs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=EgCBMhMwVfJFODSt/HMPw+CKJ6rfgQZ0GsFOwOj22FpfJvLlln1yon3eP0PNfKTMF
         8BzIio1MIlXPnbQfK+ibAoxklCgBLicFdFBzpPLAZzGxBsdC36l+7MKFrO1lyEd8hU
         EvJwwpDmrRpERqdtbsEXh9UtRbnE7u7oD2vedbbZRL4AI5WpRos94durRuD3CKrbU3
         qZkwMvqHuFH0OgovpudQ9tqFN/zZ0ThXVTdfe/oKWm1vos8fYtAulRyQHB11jnp9pG
         Zd8LKPiifxG8l4pdyjApAoDrQy7rUijcesMPDdbIaGoAf8WMcp+ycN9XP+oOyeZAsE
         tiLQdTaVLHFKg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210528113403.5374-1-peng.fan@oss.nxp.com>
References: <20210528113403.5374-1-peng.fan@oss.nxp.com>
Subject: Re: [PATCH 0/3] clk: support regmap
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
        Peng Fan <peng.fan@nxp.com>,
        Jerome Brunet <jbrunet@baylibre.com>
To:     Peng Fan (OSS) <peng.fan@oss.nxp.com>, mturquette@baylibre.com
Date:   Wed, 02 Jun 2021 01:18:44 -0700
Message-ID: <162262192433.4130789.1017942859005253343@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Peng Fan (OSS) (2021-05-28 04:34:00)
> From: Peng Fan <peng.fan@nxp.com>
>=20
> To i.MX8ULP, a PCC register provides clk(mux, gate, divider) and peripher=
al
> reset functionality, so we need make sure the access to the PCC register
> be protected to avoid concurrent access from clk and reset subsystem.
>=20
> So let's use regmap here.
>=20
> The i.MX specific code will be posted if this patchset is ok for you.

We have a couple regmap clk drivers in the tree. Either combine the
different regmap clk drivers or duplicate it into the imx directory. I'd
prefer we combine them but last time I couldn't agree on the approach
when Jerome wanted to do it. Maybe now is the time to combine them all
into one common piece of code.

>=20
> Peng Fan (3):
>   clk: mux: support regmap
>   clk: fractional-divider: support regmap
>   clk: gate: support regmap
