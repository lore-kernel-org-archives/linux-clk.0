Return-Path: <SRS0=Ii/d=UG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CA00C2BCA1
	for <linux-clk@archiver.kernel.org>; Fri,  7 Jun 2019 18:17:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 67CC5208E3
	for <linux-clk@archiver.kernel.org>; Fri,  7 Jun 2019 18:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559931446;
	bh=avBGzeDVPLC9Ku4xRFNfHkrWVnK+12j3mF281rswmfs=;
	h=In-Reply-To:References:To:From:Subject:Cc:Date:List-ID:From;
	b=z2VwWR6dZ175mlQPnOdekLQ9lBF1T8EwpHdNLhna1qiRlrVZ6JS+KgrrIyJSzmiQ4
	 hu5JCbTO9QBes3+z1pdnUDJ/iCetJMuKg2mZ2vQ0VXf6m5nxUbKm1Vbjfc/9Gs3IJ4
	 pQzRGX5FmFYyWoN5UctoRHe7kl6By9l9IW1ZNjFo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730026AbfFGSR0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 Jun 2019 14:17:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:42470 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729817AbfFGSR0 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 7 Jun 2019 14:17:26 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0086E20868;
        Fri,  7 Jun 2019 18:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559931445;
        bh=avBGzeDVPLC9Ku4xRFNfHkrWVnK+12j3mF281rswmfs=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=Ds6bRfWQvpaGWItGBIQ2L+kHDmodlH1EYVF3q7lMDBTgqnuENK9g2pHSlExCOXG5X
         a+pte8EbrOWyuTxeCw/a2lS6/ldaHVZ6kPB+YPcyl5Ama5fQXvJZs/RBhbqOgQL93m
         i15dWegbnRDru6/8ThZdIe2Z8XTWmBKRA8rQLErs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190520080421.12575-3-wens@kernel.org>
References: <20190520080421.12575-1-wens@kernel.org> <20190520080421.12575-3-wens@kernel.org>
To:     Chen-Yu Tsai <wens@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Michael Turquette <mturquette@baylibre.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 02/25] clk: Add CLK_HW_INIT_* macros using .parent_hws
Cc:     Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
User-Agent: alot/0.8.1
Date:   Fri, 07 Jun 2019 11:17:24 -0700
Message-Id: <20190607181725.0086E20868@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Chen-Yu Tsai (2019-05-20 01:03:58)
> A special CLK_HW_INIT_HWS macro is included, which takes an array of
> struct clk_hw *, but sets .num_parents to 1. This variant is to allow
> the reuse of the array, instead of having a compound literal allocated
> for each clk sharing the same parent.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
[...]
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index bb6118f79784..0c241b43a802 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -904,6 +904,24 @@ extern struct of_device_id __clk_of_table;
>                 .ops            =3D _ops,                         \
>         })
> =20
> +#define CLK_HW_INIT_HW(_name, _parent, _ops, _flags)                   \
> +       (&(struct clk_init_data) {                                      \
> +               .flags          =3D _flags,                              =
 \
> +               .name           =3D _name,                               =
 \
> +               .parent_hws     =3D (const struct clk_hw*[]) { _parent },=
 \
> +               .num_parents    =3D 1,                                   =
 \
> +               .ops            =3D _ops,                                =
 \
> +       })
> +
> +#define CLK_HW_INIT_HWS(_name, _parent, _ops, _flags)                  \

Minor nitpick, please add a comment here to indicate that this is here
to share the same compound literal between multiple clks using the same
parent.

> +       (&(struct clk_init_data) {                                      \
> +               .flags          =3D _flags,                              =
 \
> +               .name           =3D _name,                               =
 \
> +               .parent_hws     =3D _parent,                             =
 \
> +               .num_parents    =3D 1,                                   =
 \
> +               .ops            =3D _ops,                                =
 \
> +       })
