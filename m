Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFEF30AAB8;
	Tue, 20 Jan 2026 19:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768938690; cv=none; b=EL3Od/q5HlbDS0RIMfvu/0PmYNTxTGT0AbvF1UT3jYLOaQ0V6gEYQWGDYUxoIFo5y2yOAF/G36c0EHavm7JXwkzX93C5Bf3gNYD330kNEe7ZwyHjEv1ctUTpwHYGSeHM8g6i2+WjixZ0WWTfKwle1Qoe/Ne4Mfccxs2pGw+DKgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768938690; c=relaxed/simple;
	bh=Ti2aBMrKy+BgGSQR23NoCVlFFEY5P+wrVPR2gAYdzCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KOHXGjfhGNXp1mrGP9UGOvhiMYsLRhVss7tr5xNedQrIAGKtBxZgVGnJLejGJMC1Wan8soI4EJu+fGY4HM+TeMNHpLwICPxLbXcJIK9cJ0EEDb1F6QYExY8/yKB+6CS9fGCP0+vx1PKVfUeGH33wnkufpnRAQO4Tm29CSG4R1mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WM2xjPzJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WM2xjPzJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54480C16AAE;
	Tue, 20 Jan 2026 19:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768938690;
	bh=Ti2aBMrKy+BgGSQR23NoCVlFFEY5P+wrVPR2gAYdzCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WM2xjPzJosA0slhwPDPz3IzuqjjN1aEEOrdsZwRQ1Hr6TsXK2Uh5KU+hD3vaZ44bq
	 8wHIBD/TgTWosSaKGuWCi4+tB2PsHJ9yoz1u3wzyWIlnihLPX7OuSqJfXseVTYzWpR
	 9jU84zQTCoN4uqIK1nWmcvhAzuwVxVWFIvCo0NTrxTekoUMwpYcsQ2NLGIYcZTj4nX
	 Dx+5DcaIII/mmkcE5gvMkgAr9te4baIjQ43h0/I6uDc62Pywvt+yFaH1WbCjDsHDOl
	 9SUjjin27mdeAv0YTOGQULwmuTF1f+YpFw/i9eSkn8hh55dW8YGJt7mvn6m1fHKPCU
	 GvSHxwGytAtKg==
Date: Tue, 20 Jan 2026 19:51:25 +0000
From: Conor Dooley <conor@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 07/12] dt-bindings: clock: Document RZ/G3L SoC
Message-ID: <20260120-chlorine-sandblast-dc63c2ac54a6@spud>
References: <20260120125232.349708-1-biju.das.jz@bp.renesas.com>
 <20260120125232.349708-8-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IRplfoTPUo+piMtU"
Content-Disposition: inline
In-Reply-To: <20260120125232.349708-8-biju.das.jz@bp.renesas.com>


--IRplfoTPUo+piMtU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--IRplfoTPUo+piMtU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaW/cvQAKCRB4tDGHoIJi
0oQ9AQDSdls9n2y6PjggyKr5OYW4flztkBL3To/1/bGB5NeuSgEAq594y4gP8tOs
V7b1BhnH5tIq516yqIixQ3zA5KD5cQE=
=wjyh
-----END PGP SIGNATURE-----

--IRplfoTPUo+piMtU--
