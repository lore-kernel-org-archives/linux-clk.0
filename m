Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E8E3D45FE;
	Wed,  3 Jun 2026 15:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780501919; cv=none; b=leyGj++IDKo4Z2Hxruukq9gJOrTWrLqV3d0srAPFk9MQ7sEp/UxkOsXTR3FlG4rl9fdZD75VDrQMOGlb99a5pIUxmUJiRuvgsXE5IWw142honPhTaurpoa8Dy12EmLXHqFueZkD/URaSAPwT5t5wvImxM5dRPv678rQ/wUS2AQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780501919; c=relaxed/simple;
	bh=UYQCy62/XeJkjWEE4NKpocL+cxTPaphso0jv+Gl4KNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KciveDmusPXU3bqeZyGQFjv9+QCTK5yTdjTr/gQFaBSJ8UyyJJQCRUcmeL8LMxmIG1dEFkUysaT+4apjp6Ras11NtteYVhtZ+2GYTz4wrEedlJvBFnNDM+SLqptucy25iNjlcAfoPt5Q7K2XrxyBQFahV1z5yEergpuJp6y/DHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aO2DyS6q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aO2DyS6q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8D931F00893;
	Wed,  3 Jun 2026 15:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780501918;
	bh=UYQCy62/XeJkjWEE4NKpocL+cxTPaphso0jv+Gl4KNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aO2DyS6qeNl6/06jRhz8Wq2s1LSS+9qyKwJqenZxXwgnc4l3YA+XYr33pEd7YyPcS
	 BjbHLYhf2TuAmNdeVWob7jx+YDinP1ZYZhHupOM+sqvN8r9ogtoBkY11hKkvQ19la0
	 Fh0icfuoU+c2H507oQt91EYpQIq1nmRsAk+dVu+bDTHNrAWVYFdx3zlEqj0rWH30nF
	 i4aKIXRaUa92Y83AVJOrWlG8I0cTSHCnaOFAB/LKoPtUwwl/8IahxXT+ZvIr2iIRKi
	 49Q20KJikmvmNzvzL7ffj8YdFXVc+qB9zqthuESLYkm9L/8GaLSNwj93y9biUmqnBI
	 xaxP2CfWWYggA==
Date: Wed, 3 Jun 2026 16:51:53 +0100
From: Conor Dooley <conor@kernel.org>
To: jian.hu@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: Add Amlogic A9 AO clock
 controller
Message-ID: <20260603-battle-cofounder-e61dbe47d738@spud>
References: <20260603-a9_aoclk-v2-0-f47ea616ee78@amlogic.com>
 <20260603-a9_aoclk-v2-1-f47ea616ee78@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KH2UgLPfdPMIqcoS"
Content-Disposition: inline
In-Reply-To: <20260603-a9_aoclk-v2-1-f47ea616ee78@amlogic.com>


--KH2UgLPfdPMIqcoS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--KH2UgLPfdPMIqcoS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiBNmQAKCRB4tDGHoIJi
0rzTAP96xbvAsmSRrQkjabFTx14yBLGyTdPq6O1/rx3e3lLp2QD+Ju+r2qcHP4mh
0EqjKT+MOMru1z0FBEQj1fzd8pDrIAs=
=ozLc
-----END PGP SIGNATURE-----

--KH2UgLPfdPMIqcoS--
