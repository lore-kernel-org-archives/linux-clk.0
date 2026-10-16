Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C5A4DC551;
	Fri, 16 Oct 2026 16:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166563; cv=none; b=VhTyLl1c4PmK1epmxRfBkqmX7pXLSbGR+OSPB9ijhbeJBgKoxByu3cpgQvAT0JPUmQpOOpWLcKp9wJHkSfgm0+U5+cJhIO3Y/G2YX16qDNXojObac0DUR1vnd/+ssCERf2t6fl2Dvzcdx87elAIeqFyCL1y3ticazjITeOXueBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166563; c=relaxed/simple;
	bh=wZ/Mw37DBktyrDuunhGMF1wbbcuWpaZoNYsHXxz1nes=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=JRiZBg4OVs+T56NZpUcH8zljNa8fgv5kT23nibcGft7MPjO8R9ERF1gILqtqveQBnxz2z8VMuLtJGbbqe6+85gEOjmR/ftOk+n1p/BCnAoKE9ttdcZMr02T2Pi+FZtI+WtI0rSJ8PfIppZP2iCK9rEJm12B0GNc6Hp+pX5T+Zas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VuHVRNGD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VuHVRNGD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09E981F000C5;
	Fri, 16 Oct 2026 16:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792166562;
	bh=vLsFS7+FVKd8K1MAbLflQbl7IvuvXawg0UFAquvnStU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VuHVRNGD35A+Z+HUqb9hWLz6hL2wlE0CIMAAEpp3fKvxZYX0nrwAjgu4d4LEXRKXP
	 YVsCbBlKrFNeJQb/5gVLPPzBgzfbIcV+Zoqm60WQT14aoyz7tEfSJwed/aaCr5vJd9
	 GR1yZCad/LTuPbvj/FOo3sM2Db2qcLfTbDPwyp4ehqgQDMYyJikIMIBzMwQFkTw2/L
	 UD8QQzDghDvMV7TrxKsMo+PG1Usc1s3InGByt/dMhe1Z+00vJmBQfhDzUZUKg1v2Q2
	 X2+ZAkm2UoXh6PL9/pXsvvxEA1hVpiwKy1Q75o+V/dECHVxbJ7U9rnb7xusvw8y7FY
	 srtOoGqo0PHUQ==
Message-ID: <sashiko-outbox-174595@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/8] reset: Add
 reset_control_get_from_provider_exclusive()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <b9e68c8df1e545191e0359dba23fe53de31a4ce5.1792163045.git.geert+renesas@glider.be>
References: <cover.1792163045.git.geert+renesas@glider.be>
 <b9e68c8df1e545191e0359dba23fe53de31a4ce5.1792163045.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 16:02:41 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] of: memory leak of device node reference on error path
--

commit 6e1c5e27c808997c3ce5fe5fc257fedbfabb6954
Author: Geert Uytterhoeven <geert+renesas@glider.be>

reset: Add reset_control_get_from_provider_exclusive()

This patch introduces reset_control_get_from_provider_exclusive() to allow
looking up and obtaining an exclusive reference to a reset controller from
a provider. It modifies the existing __reset_control_get_from_provider()
helper to support this lookup.

> diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> index 0e11f4c81c10d..421bcc4c89cc2 100644
> --- a/drivers/reset/core.c
> +++ b/drivers/reset/core.c
> @@ -1153,18 +1154,30 @@ __reset_control_get_from_provider(const struct fw=
node_reference_args *args,
>  	if (WARN_ON(args->nargs !=3D rcdev->fwnode_reset_n_cells))
>  		return ERR_PTR(-EINVAL);
> =20
> -	if (rcdev->of_xlate && is_of_node(consumer)) {
> -		struct device_node *np =3D to_of_node(consumer);
> +	if (rcdev->of_xlate && is_of_node(fwnode)) {
> +		struct device_node *np =3D to_of_node(fwnode);
>  		struct of_phandle_args of_args;
>  		int ret;
> =20
> -		ret =3D of_parse_phandle_with_args(np,
> +		if (consumer) {
> +			ret =3D of_parse_phandle_with_args(np,
>  					 gpio_fallback ? "reset-gpios" : "resets",
>  					 gpio_fallback ? "#gpio-cells" : "#reset-cells",
>  					 gpio_fallback ? 0 : index,
>  					 &of_args);
> -		if (ret)
> -			return ERR_PTR(ret);
> +			if (ret)
> +				return ERR_PTR(ret);
> +		} else {
> +			of_args.np =3D of_node_get(np);
> +			of_args.args_count =3D args->nargs;
> +
> +			for (unsigned int i =3D 0; i < args->nargs; i++) {
> +				if (args->args[i] > U32_MAX)
> +					return ERR_PTR(-EINVAL);

[Severity: Medium]
Will this leak the device node reference acquired above?

When consumer is NULL in __reset_control_get_from_provider(), the code
acquires a device node reference via of_args.np =3D of_node_get(np).

If an argument exceeds U32_MAX, the function immediately returns
ERR_PTR(-EINVAL). This early return skips the of_node_put(of_args.np) call
at the end of the block, permanently leaking the OF node reference count.

> +
> +				of_args.args[i] =3D args->args[i];
> +			}
> +		}
> =20
>  		rstc_id =3D rcdev->of_xlate(rcdev, &of_args);
>  		of_node_put(of_args.np);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1792163045.gi=
t.geert+renesas@glider.be?part=3D4
