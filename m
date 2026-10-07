Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EFB46AA8F;
	Wed,  7 Oct 2026 10:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791368916; cv=none; b=SV+NRcPXjHvUZLMZRcxwSlfQB0S9nJe1QJwuLs/JeU8geXz5UBubJMO7QIQqLDj/sj+BF3XzBlNmPWz6qZjcn9QQqIj8mlc+gz6hm+jHkw8cD5autEIwOsCer+/cO3qsv7dOfABuB1dtPxqiQpoLCBC3nahqEm4kmFgAf6u9JOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791368916; c=relaxed/simple;
	bh=yxR4u3LmizRH+n6pg7Z9UvRu8UZ5dvIZANjV4xozrHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nem+Lj99ZUQGSA9Z7XdRLHG29fZX755Cn+JklznxzG/2zqzA2TF93CmV5MfbqpxCF+J3u6sDcB1PBxSbAX+CMieg29hX4zdtjETSL6HDqOpIz+qcw7N7pK/gypCwibuIT9DQaxDvvw1F+8DCBZg3Bj8UzG8WQJhC1Cr2ERP0ojc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SOXb73hC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SOXb73hC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABCB41F0089B;
	Wed,  7 Oct 2026 10:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791368906;
	bh=lTL0TETi6wov8+6DSxxvFjg0nJ80CdLa2nOZg+tVLAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SOXb73hCTRuSHIAJ72hkQiFKZEpX+WBJt7tordjKDFEXlItLFDM4M39jauirdGgBu
	 5Ig8ZZ7tFAthJBWZgfBcTe4mO4+T/m+Df5Wyl5a3SxRK58gwOzOuSqYhbZMYqE89Nm
	 UbgdMw8kHZjwD4b/tj8nw/N+crp5BaBAhwKKcDCsQZthV3ZCbTco0g0IgH+LErURS7
	 9nUTFrwhkwQWgp7zY+AxXzvnuUQOi1GjUu3ZB51tmoSzaeETfVjN9PRXxOCpBg6Q7i
	 JXE1ts/2tcByzlEjeWpziuxtrW9P4IEkRNdY3he1nBpoivM1YnQiCdEOXZLM6V8MOt
	 3xwH30eb5F45Q==
Date: Wed, 7 Oct 2026 11:28:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Chuanhong Guo <gch981213@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: mediatek: mt7629: add RTC clock
 IDs
Message-ID: <20261007-fd52cb4e1451642185a6589f@squawk>
References: <20261006-b4-mt7629-rtc-v1-0-e556386df816@gmail.com>
 <20261006-b4-mt7629-rtc-v1-1-e556386df816@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s4wIikCK1FzuJJqu"
Content-Disposition: inline
In-Reply-To: <20261006-b4-mt7629-rtc-v1-1-e556386df816@gmail.com>

--s4wIikCK1FzuJJqu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 06, 2026 at 02:42:23PM +0800, Chuanhong Guo wrote:
> Expose the 40 MHz / 1221 RTC source and the RTC clock mux. Keep the
> existing CLK_TOP_RTC ID for the 40 MHz / 1024 source.
>=20
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> ---
>  include/dt-bindings/clock/mt7629-clk.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/dt-bindings/clock/mt7629-clk.h b/include/dt-bindings=
/clock/mt7629-clk.h
> index ad8e6d7f0154..aa94a398ae05 100644
> --- a/include/dt-bindings/clock/mt7629-clk.h
> +++ b/include/dt-bindings/clock/mt7629-clk.h
> @@ -115,7 +115,9 @@
>  #define CLK_TOP_CRYPTO_SEL		105
>  #define CLK_TOP_SGMII_REF_1_SEL		106
>  #define CLK_TOP_10M_SEL			107
> -#define CLK_TOP_NR_CLK			108
> +#define CLK_TOP_RTC_32K			108
> +#define CLK_TOP_RTC_SEL			109
> +#define CLK_TOP_NR_CLK			110

Since you can change NR_CLK, its not a binding.
Please remove it, and put it in a driver or w/e uses it.

pw-bot: changes-requested

Thanks,
Conor.

> =20
>  /* INFRACFG */
>  #define CLK_INFRA_MUX1_SEL		0
>=20
> --=20
> 2.55.0
>=20

--s4wIikCK1FzuJJqu
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasYexQAKCRB4tDGHoIJi
0gzPAQDCkxgZs1Pry9OFkFX1+k2jkE9trqoJYE7GdRSabNdexwD/dtbqGFDDuYqS
8F5IjTUa7gRFcntcEi5/OLTRiGCg4Qo=
=bYV2
-----END PGP SIGNATURE-----

--s4wIikCK1FzuJJqu--
