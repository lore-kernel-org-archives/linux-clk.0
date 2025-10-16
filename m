Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74FD7263B
	for <linux-clk@vger.kernel.org>; Thu, 16 Oct 2025 11:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760613834; cv=none; b=fV1dBeWMfZYxgSXF7R1Yx5a/tedGEfJcafKniKFVfOBOPI8PO0OPDD/718dP3tIghZawcsv9yWFUjqCocmJ7kvFT3R560fC6AHHB8hEoXjPZSeyJAjesU2IlthloYAtPb5dKHnqsFWDI5kmSypKr9PjKj4AHrQ23Qze9tqSRqAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760613834; c=relaxed/simple;
	bh=I31Uk3YWJwyrgQXxbhKQwPqLbs2QoJCuIf4PyZoBnbY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=QMhSIdrk0eGtb4PFnKEl0EBvr80WsIgxmOs43EhV1MvM4kxaVwAy+vITxs7GqkGQ5HaNluKZUEFTnPshebDaf0ZCuVfcjGo72u4gs4RIzsGtQSkCbQNSlOM1uGXMCE03YcGZZNK9cxjSmHq+YrJtI5LvcdQ7MZtwxxnGfrZk7q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sQCnSNh6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sQCnSNh6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8E89C4CEF1;
	Thu, 16 Oct 2025 11:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760613834;
	bh=I31Uk3YWJwyrgQXxbhKQwPqLbs2QoJCuIf4PyZoBnbY=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=sQCnSNh6rhYku5EQvxFFEnicBup3dou2cVJJtlg6BTvyfwGs3U0ytXDFcmBEemVOd
	 3zTsRt91nraUBEUzsF2Rh0DKsdHJCViFS3qhlqoEOFU1NeTUTZ40aV1Qp14JMFfsgT
	 1C+3InGl0DwtE4fqenC6VR5cfsehtkd688I/N1JBPFdgHvCyxsPRSf2SX5UoN3gptc
	 u27OepqpwEM5ifQ0//KrXncqxw5KeSHe088zaIswIQ8vs59ew1YxSaWkWfkdWtKsuV
	 UacZ4l+k8dCCb9KRhp6zKlNKGmUSYUucCCMuUHjeeWuZrcUukqGXvSxYEnMBWXeifU
	 pbCDTyNmvQcmA==
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=5d365f8004443b969733adad42e553ed3a27fb4f50366628902a0127d1d9;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Thu, 16 Oct 2025 13:23:49 +0200
Message-Id: <DDJPIJGC8W1L.1BCHJEG3FO574@kernel.org>
Subject: Re: [PATCH] clk: do not trust cached rates for disabled clocks
Cc: <linux-clk@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: <rs@ti.com>, <mturquette@baylibre.com>, <sboyd@kernel.org>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.0
References: <20251003222917.706646-2-rs@ti.com>
In-Reply-To: <20251003222917.706646-2-rs@ti.com>

--5d365f8004443b969733adad42e553ed3a27fb4f50366628902a0127d1d9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Sat Oct 4, 2025 at 12:29 AM CEST, rs wrote:
> From: Randolph Sapp <rs@ti.com>
>
> Recalculate the clock rate for unprepared clocks. This cached value can
> vary depending on the clocking architecture. On platforms with clocks
> that have shared management it's possible that:
>
>  - Previously disabled clocks have been enabled by other entities
>  - Rates calculated during clock tree initialization could have changed
>
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>
> I'm hoping this will start a bit of a discussion. I'm still curious why p=
eople
> would want to read the rate of an unprepared clock, but there were so man=
y
> logged operations on my test platforms that I assumed it must have some p=
urpose.

> Either way, I don't believe cached values should ever be trusted in this
> scenario.
>
>  drivers/clk/clk.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 85d2f2481acf..9c8b9036b6f6 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1971,8 +1971,16 @@ static void __clk_recalc_rates(struct clk_core *co=
re, bool update_req,
> =20
>  static unsigned long clk_core_get_rate_recalc(struct clk_core *core)
>  {
> -	if (core && (core->flags & CLK_GET_RATE_NOCACHE))
> -		__clk_recalc_rates(core, false, 0);
> +	if (core) {
> +		bool prepared =3D clk_core_is_prepared(core);
> +
> +		if (core->flags & CLK_GET_RATE_NOCACHE || !prepared) {
> +			if (!prepared)
> +				pr_debug("%s: rate requested for unprepared clock %s\n",
> +					 __func__, core->name);
> +			__clk_recalc_rates(core, false, 0);
> +		}
> +	}

I'm not sure this patch is correct. In case the clock is not
prepared, the rate is still cached in __clk_recalc_rates(). Thus,
I'd expect the following sequence to return a wrong rate:

  # assuming clock is unprepared and will return 0
  clk_get_rate()       // this will fetch the (wrong) rate and cache it
  clk_prepare_enable()
  clk_get_rate()       // this will then return the cached rate

Or do I miss something here?

-michael

> =20
>  	return clk_core_get_rate_nolock(core);
>  }


--5d365f8004443b969733adad42e553ed3a27fb4f50366628902a0127d1d9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaPDVxhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gVMgGAmPxKXbmMB8iQ7fv7RVC6aU1um/P88QT/
z73j48nLVomzZlUtBHJt5liYpVs8GLMfAX9fCcPCeUxJhTXcz9RqZXNnZRfEQ+gh
KHfjRE0xGYGdhWW9NkmwE8pMeLapWwWHg8M=
=4ML6
-----END PGP SIGNATURE-----

--5d365f8004443b969733adad42e553ed3a27fb4f50366628902a0127d1d9--
