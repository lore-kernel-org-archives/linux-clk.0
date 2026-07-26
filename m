Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE6C481DD;
	Sun, 26 Jul 2026 00:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785024878; cv=none; b=hQH7/fSGJN2wd9+Cs8L+N4pLjbJ1nBO4Iyrwc+aL+cK0phPks9c5N3wxej9nzxsxwBadsU6SzX0zpM0uFPFYs6pMswxc68gMJ6yLstPFanHXkEvrVhj/ze0kyOgRlo8+Jp6nHVXtRlAD4xhSI/hw0ge67ggAsWhS75B+NZVqJIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785024878; c=relaxed/simple;
	bh=R18svsllCAmqAy+rjjLf2xynz3PfEtneGvgR171754Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B7lQooz/csx6rHq3a9iz07Ri0fYYyLDiga2uFhOH5DYKzwlgnmDkkhVIrXnIIw1Ud66RpXGJG5KmrtO5KxFtU2p+lVl8DTFyo2v1YZjrJgPcYmal5exhegCCEqEqnbIHpYGlmHPA7cox9g97pUh3gRhFxjI6YDgOcB5dS60LcLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TnycoZG+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TnycoZG+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C18F1F000E9;
	Sun, 26 Jul 2026 00:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785024876;
	bh=vF+enmCQDt9FTlWnhxyPijqOPxOx/bcKcdvXQMBFQeQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TnycoZG+w0l61r5i2hKpuz/9AHUOv/doGkz5HqnlrMiZBV4AMqOLYlM45UV1UZGiT
	 OX5pL9WVdwaQuWXjXvyqwXMWC4+93LZMurzGVQ/r+dPygEAeaC4Y2EaalCxEXgWWA3
	 xAmAxLhEOK7aUZDN8l8jrPrsbVuKlkF2Z+AEWYHIG4xgiTElZyhzBwSqFuVK+/tRzH
	 dSDzfgnmbqP5vZ3xIXF6nYydHxddtH8sJj9r3LNr5LVXiOpiW9dk2m4YjKrAijGpOb
	 6GZHL8p1OUfL3889DQEFvjQhm/PZ0ih5/WdWYTv39BUYCgU4Tp6/fBs9ir/WvqDL9I
	 cXW0PFgfk2B3Q==
Received: by venus (Postfix, from userid 1000)
	id AC3CE1802A1; Sun, 26 Jul 2026 02:14:34 +0200 (CEST)
Date: Sun, 26 Jul 2026 02:14:34 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: bjorn.andersson@oss.qualcomm.com, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, konrad.dybcio@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	chandana.chiluveru@oss.qualcomm.com
Subject: Re: [PATCH v2] opp: Use clk_get_optional() to avoid leaving
 opp_table->clk as an error pointer
Message-ID: <amVRObsTiN2_CZv9@venus>
References: <20260725-fix_ptr_check_on_clk-v2-1-7f269f7d33f3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4qqb6rf3ru3z77wm"
Content-Disposition: inline
In-Reply-To: <20260725-fix_ptr_check_on_clk-v2-1-7f269f7d33f3@oss.qualcomm.com>


--4qqb6rf3ru3z77wm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] opp: Use clk_get_optional() to avoid leaving
 opp_table->clk as an error pointer
MIME-Version: 1.0

Hi,

On Sat, Jul 25, 2026 at 11:58:22PM +0530, Praveen Talari wrote:
> _update_opp_table_clk() uses clk_get(dev, NULL) to acquire the
> device's clock. On platforms where the perf domain device has no
> Linux clock and is instead managed entirely by firmware via
> devm_pm_opp_of_add_table() (through
> of_genpd_add_provider_simple()/onecell()), clk_get() returns
> -ENOENT. That case is treated as valid (the OPP table can still
> have entries sourced from firmware), but opp_table->clk is left
> holding ERR_PTR(-ENOENT) rather than being reset to NULL:
>=20
> 	opp_table->clk =3D clk_get(dev, NULL);
> 	ret =3D PTR_ERR_OR_ZERO(opp_table->clk);
> 	...
> 	if (ret =3D=3D -ENOENT) {
> 		opp_table->clk_count =3D 1;
> 		return opp_table;   /* opp_table->clk is still ERR_PTR(-ENOENT) */
> 	}
>=20
> Consumers that only check IS_ERR(opp_table->clk) treat this as a
> valid clk and pass it straight into the clk consumer API. In
> particular, dev_pm_opp_set_rate() calls
> clk_round_rate(opp_table->clk, target_freq), and clk_round_rate()
> only guards against a NULL clk, so it dereferences the error pointer
> to read clk->exclusive_count and crashes:
>=20
>   Unable to handle kernel NULL pointer dereference at virtual
>   address 000000000000002e
>   ...
>   pc : clk_round_rate+0x3c/0x188
>   ...
>   Call trace:
>    clk_round_rate+0x3c/0x188 (P)
>    dev_pm_opp_set_rate+0x114/0x33c
>=20
> Rather than teaching every clk consumer API to special-case
> ERR_PTR(-ENOENT), fix it at the source: use clk_get_optional()
> instead of clk_get() in _update_opp_table_clk(), which already
> translates -ENOENT into a NULL clk. This documents that the clock is
> genuinely optional for such devices, and keeps opp_table->clk holding
> either a valid clk or NULL, never a lingering -ENOENT error pointer.
> _opp_config_clk_single() is only wired up via opp_table->config_clks
> when a clk was actually found, and every other opp_table->clk
> consumer already tolerates NULL through the standard clk API (which
> treats a NULL clk as a no-op), so no other call site needs to change.
>=20
> Suggested-by: Sebastian Reichel <sre@kernel.org>
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>

Reviewed-by: Sebastian Reichel <sre@kernel.org>

Greetings,

-- Sebastian

> ---
> Changes in v2:
> - Switched from guarding clk_round_rate() against error pointers to
>   fixing the root cause in OPP core: use clk_get_optional() instead
>   of clk_get() in _update_opp_table_clk(), so opp_table->clk is left
>   as NULL (not ERR_PTR(-ENOENT)) when a device has no Linux clock,
>   per Sebastian Reichel's review suggestion.
> - Dropped the drivers/clk/clk.c change entirely.
> - Link to v1: https://patch.msgid.link/20260723-fix_ptr_check_on_clk-v1-1=
-568a7ed87746@oss.qualcomm.com
> ---
>  drivers/opp/core.c | 51 ++++++++++++++++++++++++------------------------=
---
>  1 file changed, 24 insertions(+), 27 deletions(-)
>=20
> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> index b6966e509f7d..80da241d40f5 100644
> --- a/drivers/opp/core.c
> +++ b/drivers/opp/core.c
> @@ -1591,39 +1591,36 @@ static struct opp_table *_update_opp_table_clk(st=
ruct device *dev,
>  	    opp_table->clks)
>  		return opp_table;
> =20
> -	/* Find clk for the device */
> -	opp_table->clk =3D clk_get(dev, NULL);
> +	/*
> +	 * There are few platforms which don't want the OPP core to manage
> +	 * device's clock settings. In such cases neither the platform
> +	 * provides the clks explicitly to us, nor the DT contains a valid
> +	 * clk entry. The OPP nodes in DT may still contain "opp-hz" property
> +	 * though, which we need to parse and allow the platform to find an
> +	 * OPP based on freq later on.
> +	 *
> +	 * This is a simple solution to take care of such corner cases, i.e.
> +	 * make the clk_count 1, which lets us allocate space for frequency
> +	 * in opp->rates and also parse the entries in DT. Use
> +	 * clk_get_optional() instead of clk_get() so opp_table->clk stays
> +	 * NULL for such devices, instead of holding an ERR_PTR(-ENOENT) that
> +	 * consumers must remember to special-case.
> +	 */
> +	opp_table->clk =3D clk_get_optional(dev, NULL);
> =20
>  	ret =3D PTR_ERR_OR_ZERO(opp_table->clk);
> -	if (!ret) {
> -		opp_table->config_clks =3D _opp_config_clk_single;
> -		opp_table->clk_count =3D 1;
> -		return opp_table;
> +	if (ret) {
> +		dev_pm_opp_put_opp_table(opp_table);
> +		dev_err_probe(dev, ret, "Couldn't find clock\n");
> +		return ERR_PTR(ret);
>  	}
> =20
> -	if (ret =3D=3D -ENOENT) {
> -		/*
> -		 * There are few platforms which don't want the OPP core to
> -		 * manage device's clock settings. In such cases neither the
> -		 * platform provides the clks explicitly to us, nor the DT
> -		 * contains a valid clk entry. The OPP nodes in DT may still
> -		 * contain "opp-hz" property though, which we need to parse and
> -		 * allow the platform to find an OPP based on freq later on.
> -		 *
> -		 * This is a simple solution to take care of such corner cases,
> -		 * i.e. make the clk_count 1, which lets us allocate space for
> -		 * frequency in opp->rates and also parse the entries in DT.
> -		 */
> -		opp_table->clk_count =3D 1;
> -
> -		dev_dbg(dev, "%s: Couldn't find clock: %d\n", __func__, ret);
> -		return opp_table;
> -	}
> +	if (opp_table->clk)
> +		opp_table->config_clks =3D _opp_config_clk_single;
> =20
> -	dev_pm_opp_put_opp_table(opp_table);
> -	dev_err_probe(dev, ret, "Couldn't find clock\n");
> +	opp_table->clk_count =3D 1;
> =20
> -	return ERR_PTR(ret);
> +	return opp_table;
>  }
> =20
>  /*
>=20
> ---
> base-commit: b4515cf4156356e8f4fe6e0fdc17f59adab9772f
> change-id: 20260723-fix_ptr_check_on_clk-603605c3e350
>=20
> Best regards,
> -- =20
> Praveen Talari <praveen.talari@oss.qualcomm.com>
>=20

--4qqb6rf3ru3z77wm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmplUWoACgkQ2O7X88g7
+poSMQ/+P84a3vmtbJ1Fx2uOyDqx+UleoO0LTtUQDfoixcu7RnOnYKM9GQuwWV2U
Vmrizo+vrhXScadKgraluvQ04colmXb9gRcaIWr3W4IzKrPVK7jNTIeCynKexwdY
dhBjPmmf47nxzhp2pe0gfX9VAqRhddoGX1NW3yqC/EjT2KNCphqu5i9UiNHHiTUD
C5e71+KfU/UbRawG6ACf8AK+UxEZ/PV5/qQ/kjrOvKbE693Y+WyBP/6LXT4ajKvQ
yqNdpLd87k5EQ+he1fiv8nVOZ/FclOOmhBhFZVqKpiYQzK1phAELfmcUPrlEopyq
xEKyJMYv9hGWJ0EiT8PIR3PlhfAO0nAIZUsFcgttrJmDu5zDKSN7COnGRwvpuwMw
yjNesxMwcIqKbzPTe36vUWlJP5H6krM4808F7sfrXgc1B+FcqjLhT/H9YXQOGTXR
EPjkBMZIaJs4UPiHCzCACi+J3wIja9x3oDvAMFAnfG5SHGfqlPrfJJ+QlU4peVoi
B9zyfCV+GOVCxVs0pn0ceij5J1cR1SUQGdu6ZvZr7jkB2xvisl5vjMB3/9OrPELo
v7Dt9eg0KKyBNRNMJmyyPvKtFxSMzM1/NWTkBvUgRRklFO15ZnAO1w+RrIREoxC8
aS2ETdRpG15VdYX2jniVRFVGzY8mEMCeua+1auqC5guPGBMA2Sw=
=WAGQ
-----END PGP SIGNATURE-----

--4qqb6rf3ru3z77wm--
