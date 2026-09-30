Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C253D47D9
	for <linux-clk@vger.kernel.org>; Wed, 30 Sep 2026 19:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790795854; cv=none; b=OfykAjdtuQdNvvmsBIjTwS5jg0z9UubbWenf7UzL5Y4Sq9fKC0O+vlxt6HtvOy0Trjt3EqSCcIl/cl9hHbvxW8a7dTjJLfGY1mVMZf0whg+7Mu/60fipCr9hpfsZ4IrTsbfoAYgH7dalD9Sird2FI/WNqBVorn8Hr2QHdvjXvIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790795854; c=relaxed/simple;
	bh=QQ+ay67o+CvvRwajhNCzWeWI1MCKttjKqRvDMnsQGaQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f58ukjdArWPFTuD/KwOTLkB9wWk2R7hphWuDzH5vXhwCZU9+n92jMH6t2d0jKm0Wf3gwKAoJAGa6v2Gcg/HmU3pFwdL0uSuP6sj1pSBYy0VZBYJHUznep4WbyMAz2HU2RSIIFkHi/tA0xJw3wNToWm28jVx501ja8Ebf/Jizd5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GCUufYqp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GCUufYqp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10A901F00898;
	Wed, 30 Sep 2026 19:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790795853;
	bh=g6jVCGaEBA9WNZG4MkXq3h1L+NDkTZ+rlglqp7qzXs8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GCUufYqpPgLQiNL44/Ky7MGW2hOzZdazaJp1ckA1gDsaQBYTrBenJ0XvSfGrdHA1k
	 q627m/oiyyz+oaDzFyLwdbiCFLsugOkT+2TA1z1mGRi94iUTlKPtGuK4ZMA8rHz1tn
	 Ex/bwYfeWwniefcpqpvEC3vcJ3erPNRJZLjidUlgZ7sRbve8Y1kzWSSfMMMksU9VjA
	 Q+KQBaa+dzBZIGYohXo1fBonQx2QTvH7S7uwtBLovU7hbU5fZRZQph2UKNgtt9nhcc
	 AWSXfPvdp7fXTAdcQ/xyiv1ZMPZXMVTSMYMycEBH1RRNQCySwR+amasCkat3gp5AS1
	 9QQBVmIQoN5gQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] clk: keystone: sci-clk: Handle missing get_num_parents
 operation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Beleswar Padhi" <b-padhi@ti.com>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20260930190348.11720-1-b-padhi@ti.com>
References: <20260930190348.11720-1-b-padhi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 19:17:31 +0000
Message-Id: <20260930191733.10A901F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] clk: keystone: dead code due to invalid get_num_parents capabili=
ty check
--

commit 261ca89db50e7bf2199864fc566650d47bb2b916
Author: Beleswar Padhi <b-padhi@ti.com>

clk: keystone: sci-clk: Handle missing get_num_parents operation

This commit updates the sci-clk driver to handle missing get_num_parents
operations, specifically for system controllers like PDM on TDA54 that
manage clock parents internally. It avoids invoking the parent operations by
checking for the get_num_parents capability during DT and firmware scans.

> diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-cl=
k.c
> index 9d2094bd48e3b..5bf615893a8c0 100644
> --- a/drivers/clk/keystone/sci-clk.c
> +++ b/drivers/clk/keystone/sci-clk.c
> @@ -468,6 +468,13 @@ static int ti_sci_scan_clocks_from_fw(struct sci_clk=
_provider *provider)
>  	int gap_size =3D 0;
>  	struct device *dev =3D provider->dev;
> =20
> +	/*
> +	 * Clocks are discovered by probing the firmware with get_num_parents,
> +	 * which is not available with every system firmware (e.g. ABI5.0 PDM).
> +	 */
> +	if (!provider->ops->get_num_parents)
> +		return -EOPNOTSUPP;
> +

[Severity: Medium]
Is this capability check effective? The TI SCI framework unconditionally
populates the get_num_parents pointer during ti_sci_setup_ops(), so it seems
this would never be NULL.

Does this mean this early return is dead code, and the driver will instead
silently scan and register an empty clock provider when probed on a platform
with firmware lacking this support (like TDA54)? Should this instead verify
the capability by checking the return value of get_num_parents() for an err=
or
code (e.g., -ENODEV) instead of checking the pointer?

>  	while (1) {
>  		ret =3D provider->ops->get_num_parents(provider->sci, dev_id,

[ ... ]

> @@ -589,10 +596,18 @@ static int ti_sci_scan_clocks_from_dt(struct sci_cl=
k_provider *provider)
>  				sci_clk->dev_id =3D args.args[0];
>  				sci_clk->clk_id =3D args.args[1];
>  				sci_clk->provider =3D provider;
> -				provider->ops->get_num_parents(provider->sci,
> -							       sci_clk->dev_id,
> -							       sci_clk->clk_id,
> -							       (void *)&sci_clk->num_parents);
> +				/*
> +				 * Firmware without get_num_parents (e.g. ABI5.0
> +				 * PDM) manages clock parents internally, so
> +				 * treat the clock as having a single parent.
> +				 */
> +				if (provider->ops->get_num_parents)
> +					provider->ops->get_num_parents(provider->sci,
> +								       sci_clk->dev_id,
> +								       sci_clk->clk_id,
> +								       &sci_clk->num_parents);
> +				else
> +					sci_clk->num_parents =3D 1;

[Severity: Medium]
Since the function pointer is unconditionally assigned, is this else branch
dead code? Should the capability be verified dynamically by evaluating the
error code returned from the API call rather than checking the pointer?

>  				list_add_tail(&sci_clk->node, &clks);
> =20
>  				num_clks++;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930190348.1172=
0-1-b-padhi@ti.com?part=3D1
