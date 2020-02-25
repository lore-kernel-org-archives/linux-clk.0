Return-Path: <SRS0=Mizi=4N=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1FF6C35E04
	for <linux-clk@archiver.kernel.org>; Tue, 25 Feb 2020 16:56:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8CD722084E
	for <linux-clk@archiver.kernel.org>; Tue, 25 Feb 2020 16:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582649787;
	bh=kr46fM62uwDgTRg+ITz39l0wc/O/tNI+PobITxBYru0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=Iu3H9+eVs6YVmmhn22MUKBvBwwFTOLV6UeRY3CZ5yHIbBgJ3zC+6ac1nziRG1p+NB
	 Pv8VNOzcA8o6/W0fP6D12OEtbO2BgEHOKZe3uLsznWufoMDq+jUSIjWSHWjypHf0Xz
	 KN10IJda/H+7oE+ldmUVhZ18Sl7q/NAnWppjG/xE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730214AbgBYQ41 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Feb 2020 11:56:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:55226 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727983AbgBYQ41 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 25 Feb 2020 11:56:27 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 797922082F;
        Tue, 25 Feb 2020 16:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582649786;
        bh=kr46fM62uwDgTRg+ITz39l0wc/O/tNI+PobITxBYru0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ZtTpJXXDuvbXDqMzngYx32szcrlZRyW/yk+d/xotuZ9nnY/ThnCvgEErCYZzEy3Xm
         vGRFYHHJgZHCWsKCyYMAHSaBYtrrCQcHDOzYGYR5iRFwICHTaMfocj7UTTqXGWVBvj
         3QPjQw/XwyoqoPErod8rZl/OPL6P0c1Dnnf72tvo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200225134248.919889-1-maxime@cerno.tech>
References: <20200225134248.919889-1-maxime@cerno.tech>
Subject: Re: [PATCH] clk: Fix phase init check
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>
To:     Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Date:   Tue, 25 Feb 2020 08:56:25 -0800
Message-ID: <158264978566.177367.14509533520128016437@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2020-02-25 05:42:48)
> Commit 2760878662a2 ("clk: Bail out when calculating phase fails during c=
lk
> registration") introduced a check on error values at the time the clock is
> registered to bail out when such an error occurs.
>=20
> However, it doesn't check whether the returned value is positive which wi=
ll
> happen if the driver returns a non-zero phase, and ends up returning that
> to the caller on success, breaking the API that implies that the driver
> should return 0 on success.

I had to read this a few times to understand. I'll reword it to indicate
that __clk_core_init() should return 0 on success and not the phase
which is typically a positive value.

>=20
> Fixes: 2760878662a2 ("clk: Bail out when calculating phase fails during c=
lk registration")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Thanks. I think we need a=20

Reported-by: "kernelci.org bot" <bot@kernelci.org>

tag added as well.

> ---
>  drivers/clk/clk.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index ebfc1e2103cb..f122e9911b57 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -3344,6 +3344,7 @@ static int __clk_core_init(struct clk_core *core)
>         int ret;
>         struct clk_core *parent;
>         unsigned long rate;
> +       int phase;
> =20
>         if (!core)
>                 return -EINVAL;
> @@ -3457,8 +3458,9 @@ static int __clk_core_init(struct clk_core *core)
>          * Since a phase is by definition relative to its parent, just
>          * query the current clock phase, or just assume it's in phase.
>          */
> -       ret =3D clk_core_get_phase(core);
> -       if (ret < 0) {
> +       phase =3D clk_core_get_phase(core);
> +       if (phase < 0) {
> +               ret =3D phase;
>                 pr_warn("%s: Failed to get phase for clk '%s'\n", __func_=
_,
>                         core->name);
>                 goto out;
