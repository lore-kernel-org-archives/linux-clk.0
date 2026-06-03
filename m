Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAF633DEC2;
	Wed,  3 Jun 2026 15:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780500796; cv=none; b=hID0Ito2UDdOfKqv1gg3YODEjeLMIIw6bzKkAjct/qGBWuzlIdU8uR9f6WVYBQPpUc7TaXwZQK5oVczttH8fPEv1GMg9rtfGQbSx4i33gmNIXWI7Qka87aGTOr8Z1mI6WEbCcLTZTf1upaAmqHay/wV5uHaFrnen8/Egr6Ax/IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780500796; c=relaxed/simple;
	bh=YEBOwQI85zdxA5wFUjsqBcbBH92DqQhFC+iGQVQdHI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cGDGlGpIxPQukPsMz+TtT9HXf4J4v+bDVKteqw0UMotw20LctoJNndzcOa8cWgM3nye0oCZQ6GyO4/XSNFDd3GIxBOgiKlsjltBCeTmlDjFFAQxXIbEs0g6jcTkNdIQU0zFCCub+kVMR7rEsu9f/stOu9sT1EclzUbirEQFsEX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FrBbmMly; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FrBbmMly"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 284131F00893;
	Wed,  3 Jun 2026 15:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780500795;
	bh=NUAME6IAfjTZppzEkfuF9bDnThDJytcbxsI66lnZVgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FrBbmMly2qmUNYwQaXnWwMekhHGiGm+/YLuCNAHB0aigBfeZhau2RAwiaOjfdfhvr
	 MG6dknwBYaWJySl55WgiKuSoHsdl4hmAE9suPcn5Ep4isUSwU+g+HHKhMeGQ4b6kY9
	 wCs1w0gv7yd0SosN8lbkUcNLRYz2cSOZYuw9bllzUhMPpc19JVs2sVzFYfDbLFolYQ
	 uSMEJYK74y+t+icvg/4R3heWLEqQggjO0gKEKrZoZetybxsAzaxa0jNIhzkDAOAJgg
	 b5bpd47K+oo+EZ65YcMPviIg+jVzKV3N5w/M1xkVRUiTahM78kwuUSsOf10R0RqfTg
	 nv3SY3IMsM1jg==
Date: Wed, 3 Jun 2026 16:33:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v3 2/5] dt-bindings: clock: versal-clk: Fix mio_clk index
 range in clock-names pattern
Message-ID: <20260603-catlike-uncrushed-b98b66dc92c1@spud>
References: <cover.1780499520.git.michal.simek@amd.com>
 <5662c24a9e65310fc6520afc95f1a639fe6d221e.1780499520.git.michal.simek@amd.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xfm9JNkfptRGE7ME"
Content-Disposition: inline
In-Reply-To: <5662c24a9e65310fc6520afc95f1a639fe6d221e.1780499520.git.michal.simek@amd.com>


--xfm9JNkfptRGE7ME
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 03, 2026 at 05:12:07PM +0200, Michal Simek wrote:
> The clock-names pattern "^mio_clk[00-77]+.*$" was intended to constrain
> the MIO index to the valid range 00..77 (ZynqMP has 78 MIO pins),
> but a regex character class cannot express a multi-digit decimal range.
> Replace the bogus character class with an explicit alternation that
> enumerates the two-digit decimal values 00..77.
>=20
> Fixes: 03d4a1004053 ("dt-bindings: clock: versal: Convert the xlnx,zynqmp=
-clk.txt to yaml")
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> ---
>=20
> Changes in v3:
> - New patch in series
>=20
>  Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml=
 b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> index bef109d163a8..d843d95801b5 100644
> --- a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> +++ b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> @@ -116,7 +116,7 @@ allOf:
>              - const: pss_alt_ref_clk
>              - const: aux_ref_clk
>              - const: gt_crx_ref_clk
> -            - pattern: "^mio_clk[00-77]+.*$"
> +            - pattern: "^mio_clk(0[0-9]|[1-6][0-9]|7[0-7])+.*$"

What am I missing that prevents 0[0-9] and [1-6][0-9] being merged?

>              - pattern: "gem[0-3]+_emio_clk.*$"
>              - pattern: "swdt[0-1]+_ext_clk.*$"
> =20
> --=20
> 2.43.0
>=20

--xfm9JNkfptRGE7ME
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiBJNwAKCRB4tDGHoIJi
0n1TAP9Bza0amWPa/YKSAQUP12mtkvmA8oEzPDRTECVH6irhWQD/fP2kn8CeJhPT
1G6sYQQl+2HZ9s5N21MvgZbhL4XMhAQ=
=bYsR
-----END PGP SIGNATURE-----

--xfm9JNkfptRGE7ME--
