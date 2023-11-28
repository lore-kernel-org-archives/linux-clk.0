Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC8E58AD1;
	Tue, 28 Nov 2023 16:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UGyAPa7g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9112C433C8;
	Tue, 28 Nov 2023 16:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701189847;
	bh=cymJ0povmoKk825EI0vLlxPskqCRrkS5XWf1ypZrI2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UGyAPa7glstIZYYySCDVseD0Uj6qTqFsZlIOzo4Fmre4ihwHZQoCl+nCxf9JeAW3N
	 SpEaJSgjTXw6yH8ZtmRePxzM1UrUOygwIQaKqudcBkW5Nbm2KRJ7PM17ogpAwDbYr4
	 AucbQ6BIOpAkNMpmQhvgHk7E7h7H8hw39OGpW9ON8aO0fnBD1jDV9sGDgVngmTT+Yx
	 pYLdHKOVWM4iNQidfl1i4CdhS6GsZhnyBP/ApUlzhzD3nI+vYDONlvLx19mgGk/e6T
	 RCh86JdQJRClUOElz6n4MHFKWWzBTL05M/sOdJBJbofZ16nymqCgh2gHOGwXGRYsrP
	 g9ioI7flL/9yw==
Date: Tue, 28 Nov 2023 16:44:03 +0000
From: Conor Dooley <conor@kernel.org>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, git@amd.com,
	mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	michal.simek@amd.com
Subject: Re: [PATCH v3] dt-bindings: Remove alt_ref from versal
Message-ID: <20231128-acclimate-judo-db3241fddf10@spud>
References: <20231128104348.16372-1-shubhrajyoti.datta@amd.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Oc7AGkuNu5RF4DXh"
Content-Disposition: inline
In-Reply-To: <20231128104348.16372-1-shubhrajyoti.datta@amd.com>


--Oc7AGkuNu5RF4DXh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 04:13:48PM +0530, Shubhrajyoti Datta wrote:
> The alt_ref is present only in Versal-net devices.
> Other versal devices do not have it. So remove alt_ref
> for versal.
>=20
> Fixes: 352546805a44 ("dt-bindings: clock: Add bindings for versal clock d=
river")
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--Oc7AGkuNu5RF4DXh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWYY0wAKCRB4tDGHoIJi
0mF9AQCAKhP9dX//lABQ5J75k0RaEJajukplOeuKnFjxHFXyKAD+KTg6uCdfihG3
txXaWNl5DTuEHd8h2Y7aluiyP9G6EwA=
=FhgU
-----END PGP SIGNATURE-----

--Oc7AGkuNu5RF4DXh--
