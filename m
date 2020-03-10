Return-Path: <SRS0=pXcS=43=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C64C10F25
	for <linux-clk@archiver.kernel.org>; Tue, 10 Mar 2020 01:48:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9019F24654
	for <linux-clk@archiver.kernel.org>; Tue, 10 Mar 2020 01:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583804929;
	bh=drHpy1pqYfi4hPr9uXRRYm/+jUunsqoLZnhNmY4i2rg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=ikbk4RvmMRMZk9vreS5Bpp77KnuZ0yIFHCd1uyStDADY9pNVvLBPm84+iVdWRT4xg
	 WWsgcIXppuwRy/OOeiSDplx+t/LzFnB1bnUTNc/gSK+qcfMpttariFh6DW9Q3b1kwA
	 jeP5iDcIdHyFqbqTIOfckDLXsMRMrNvhoo3f/890=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726284AbgCJBst (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Mar 2020 21:48:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:60168 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726134AbgCJBst (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 9 Mar 2020 21:48:49 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 350B720637;
        Tue, 10 Mar 2020 01:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583804928;
        bh=drHpy1pqYfi4hPr9uXRRYm/+jUunsqoLZnhNmY4i2rg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=zeC8hffNgJu5SZJpCiGaeFBN3FH07+3wxNsCbO1atR3zflU2WLj+6bmfuG35TiyIZ
         gQoXl+6H/jPkr8CMc0Kky9utnq6xZi2TLW0NZoWk9xZe9m2kdq9wxj1PurSmw95mSC
         7SLXgtsq9NcvCxa5S4a3Djzjo+izQ/k32ubrDipU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200305175138.92075-1-thierry.reding@gmail.com>
References: <20200305175138.92075-1-thierry.reding@gmail.com>
Subject: Re: [PATCH] clk: Do not recalc rate for reparented clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
To:     Michael Turquette <mturquette@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>
Date:   Mon, 09 Mar 2020 18:48:47 -0700
Message-ID: <158380492739.149997.15800995149056434664@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Thierry Reding (2020-03-05 09:51:38)
> From: Thierry Reding <treding@nvidia.com>
>=20
> As part of the clock frequency change sequence, a driver may need to
> reparent a clock. In that case, the rate will already have been updated
> and the cached parent rate will no longer be valid, so just skip the
> recalculation.

Can you describe more about what's going on and why this needs to
change? For example, we have 'set_rate_and_parent' for cases where a
driver reparents a clk during a rate change. Is that not sufficient
here?

>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/clk/clk.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index ebfc1e2103cb..49d92f4785a2 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2079,7 +2079,14 @@ static void clk_change_rate(struct clk_core *core)
> =20
>         trace_clk_set_rate_complete(core, core->new_rate);
> =20
> -       core->rate =3D clk_recalc(core, best_parent_rate);
> +       /*
> +        * Some drivers need to change the parent of a clock as part of t=
he
> +        * rate change sequence. In that case, best_parent_rate is no lon=
ger
> +        * valid. However, reparenting already recalculates the rate for =
the
> +        * entire clock subtree, so we can safely skip this here.
> +        */
> +       if (core->parent =3D=3D parent)
> +               core->rate =3D clk_recalc(core, best_parent_rate);
> =20

I wonder if we can undo the recursion and figure out a way to make this
only happen once, when we want it to happen.
