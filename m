Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520BE3246ED;
	Wed,  3 Dec 2025 19:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764789554; cv=none; b=MCx92a0U0cEoyvi5PMadJnYdRIX30w3rTPQaGU1CrIsopp6BGCxkN+x+SvIBYX+PiEdEGdbb+5Ovi2uZoARfw1Kh1vsMfB2JyF6w1wEXJsgKOSVB/TcF/hcnt+MB2X4D/hZZZ+3ldvgKoqIl8xvli8tsO5EnknxRLD7GYq+cQxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764789554; c=relaxed/simple;
	bh=vFM3w2yLtl5GVKHMsd9vJwJW8+VNEFJ4+z8SjfPAN+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zv6CeUCV4YNlPRpSbg+6lXIndHupQ2mSzkog/BySdTkVpFtxZMp4Z4HTtaZHoTSLX9URyyr1zeEyE2GKF5xof1N99/B0sFNIPyi8JQlfNXGBHsxXzQHr1lOVuWTEBKhJLeuI+MUgJNMkDZJfYXjHAvivVCYN27NQLz6tBHbDsBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=er73hZI3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="er73hZI3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 765C2C4CEF5;
	Wed,  3 Dec 2025 19:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764789552;
	bh=vFM3w2yLtl5GVKHMsd9vJwJW8+VNEFJ4+z8SjfPAN+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=er73hZI346dGlIMEBSCQOsZLU63MFjbOqwmnPKFZI2aNPAYQtaVAMzdcOL1X8ds+R
	 adn+ruXYPIxGPGEmNSjIKU23vBlGDAMXdN+9VmJOQyFvBgQg/8YHJIpNlOnDUfDfeL
	 TPzcDi08pWR+BIerYrxwO9zow1VMBWN4V79DGGoMBXd3YQImi82aPLm0c1LaMhR46E
	 3aCVdDBL6daNjCUN6DO+L/p/BnF3FSwUA/lzsgky8a3PehnlnVdbhcA0hyTdRYf0NT
	 po+i4NEnSwNisVR6AKCBPqu9g3/pKMHreIHh+KnAxPUiJP5kbuyd7e6Oz/C6CCDmVo
	 9CNPWhhpE0++w==
Date: Wed, 3 Dec 2025 19:19:07 +0000
From: Conor Dooley <conor@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	gregkh@linuxfoundation.org, nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev, mturquette@baylibre.com, sboyd@kernel.org,
	richardcochran@gmail.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
	luka.perkov@sartura.hr
Subject: Re: [PATCH 2/4] dt-bindings: arm: Document Microchip LAN969x
Message-ID: <20251203-duly-leotard-86b83bd840c6@spud>
References: <20251203122313.1287950-1-robert.marko@sartura.hr>
 <20251203122313.1287950-2-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3qRCBVzV3AumVzVM"
Content-Disposition: inline
In-Reply-To: <20251203122313.1287950-2-robert.marko@sartura.hr>


--3qRCBVzV3AumVzVM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 03, 2025 at 01:21:30PM +0100, Robert Marko wrote:
> Microchip LAN969x is a series of multi-port, multi-gigabit switches based
> on ARMv8 Cortex-A53 CPU.
>=20
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
>  .../bindings/arm/microchip,lan969x.yaml       | 32 +++++++++++++++++++

This should not be in a unique file, put it in with the other microchip
arm devices please. Also, the wildcard in the compatible is not
permitted, only way it'd make sense is if these are different binnings
of the same silicon. If that's the case, you need to explain why,
because compatibles are meant to be soc-specific.

pw-bot: changes-requested

>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/microchip,lan96=
9x.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/arm/microchip,lan969x.yaml=
 b/Documentation/devicetree/bindings/arm/microchip,lan969x.yaml
> new file mode 100644
> index 000000000000..3fa1d4ed40d1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/microchip,lan969x.yaml
> @@ -0,0 +1,32 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/microchip,lan969x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip LAN969x Boards
> +
> +maintainers:
> +  - Robert Marko <robert.marko@sartura.hr>
> +
> +description: |+
> +   The Microchip LAN969x SoC is a ARMv8-based used in a family of
> +   multi-port, multi-gigabit switches.
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +      - description: The LAN969x EVB (EV23X71A) is a 24x 1G + 4x 10G
> +          Ethernet development system board.
> +        items:
> +          - const: microchip,ev23x71a
> +          - const: microchip,lan969x
> +
> +required:
> +  - compatible
> +
> +additionalProperties: true
> +
> +...
> --=20
> 2.52.0
>=20

--3qRCBVzV3AumVzVM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaTCNKwAKCRB4tDGHoIJi
0mNZAQCUBNCCVw7r/xA3bjuMlC4qnBeAmf5jcXKgK8z1u7VtZAEAv0YbqEiYoqFY
5dlcFCLb83/ffevtEfqopUWVk3lTwgU=
=bT7v
-----END PGP SIGNATURE-----

--3qRCBVzV3AumVzVM--
