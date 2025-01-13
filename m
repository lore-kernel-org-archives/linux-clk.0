Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5301B87C6;
	Mon, 13 Jan 2025 18:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736793971; cv=none; b=OGET2JT6/MZcjRpOSrWKh97H7n9R3jsODWKPdSuoiGDO36TVahP0hJg0n3XSsv1eRsCKiwj+dJcY7NNYDNdnKgGeNsqkMmUUt2tAHfOaQrfTKhVNkVCxPkoeFRK3F2oTd9yK/XZu7AZmqt1STFH/y2Nd66LlgqF0tQk/ECkBFs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736793971; c=relaxed/simple;
	bh=BwQVGqVogjfAZiqdAXI325GZJjdhV19DLDNfba8RADk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=acQ/CkMNzyhhQpn8gAikAHLH8JHH9kwOob32xqChyr+du3u/RZMo72+YgoaK/bgkVyeYFqTzWpZ5lwFzZbAD9NkzoFwVnoyVu8FU/aAqt4BxWA2o+4islZxRdMAqgrm43QrY4jvgYyqP673+LEbkxDZPNXnGp+HmtaB/l2g7BbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h3H4Qjag; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h3H4Qjag"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A13A6C4CED6;
	Mon, 13 Jan 2025 18:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736793971;
	bh=BwQVGqVogjfAZiqdAXI325GZJjdhV19DLDNfba8RADk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h3H4Qjagl7HEbtovfuNDa/Kb3n/x+d+iVwg41WQACsAP3uSUi/R9sKqFOecyFxr3d
	 LxEsXsUL7Ysvv2B9s7+gTzUI5GHA4ODYDw/wXzd3koDGUIbbbdGVlgWjBdYMVQrlqZ
	 xZncj8hlJgX4/PmTfMKCR+5g83ejDyu4WJIDg6RDp5mUcfOMAss0tzZryM/R1jKOPS
	 vAxsAI/f3KgsLAdM3KIj1DyMRZHDtcDiAKZX9k4DopfzCG3+ah8VpPIaCY7E5ePyAA
	 g3IAYm8XtwT7w0rH77+GhrYH1FJV0HLT9nnPJoWv9XaI7DWdcL/1w7n/EEsY0/sN/8
	 ANh1BnjNOwZPQ==
Date: Mon, 13 Jan 2025 18:46:07 +0000
From: Conor Dooley <conor@kernel.org>
To: Paul Handrigan <paulha@opensource.cirrus.com>
Cc: linux-clk@vger.kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
	devicetree@vger.kernel.org, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v5 1/2] dt-bindings: clock: cs2600: Add support for the
 CS2600
Message-ID: <20250113-periscope-dig-232ad4af47fd@spud>
References: <20241231201742.3955733-1-paulha@opensource.cirrus.com>
 <20241231201742.3955733-2-paulha@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7gTCqxLCKyT5lVrF"
Content-Disposition: inline
In-Reply-To: <20241231201742.3955733-2-paulha@opensource.cirrus.com>


--7gTCqxLCKyT5lVrF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 31, 2024 at 02:17:41PM -0600, Paul Handrigan wrote:

> +  cirrus,aux-output-source:
> +    description:
> +      Specifies the function of the auxiliary output pin with "phase_unlock"
> +      to indicate the input and output clocks are not in phase, "freq_unlock"
> +      to indicate the PLL is unlocked, and "no_clkin" to indicate the clock on
> +      the clk_in pin is not present.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum:
> +      - phase_unock
> +      - freq_unlock
> +      - no_clkin
> +
> +  cirrus,clock-mode:
> +    description:
> +      Sets the device into smart mode whith "smart_mode" and sets the device
> +      into smart mode that only outputs a clock when clk_in starts with
> +      "smart_clkin_only_mode".
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum:
> +      - smart_mode
> +      - smart_clkin_only_mode

Both of these vendor properties are not required, so they need to have a
default added to the binding.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'


--7gTCqxLCKyT5lVrF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ4VfbwAKCRB4tDGHoIJi
0g26AQCGkWuuHO0+CqJndoE9cc1yi0dxP9LeyodyM81H2Z10XgEA4hOtOk7pJ4EG
i6K8YTpdQsZkXxfcCyCV5rRez6HewAc=
=U+xz
-----END PGP SIGNATURE-----

--7gTCqxLCKyT5lVrF--
