Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86EA3D6CC6;
	Wed,  3 Jun 2026 15:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780502018; cv=none; b=E+QMOagNP63XW1U7EANZUCWMBSl+PlvaMhWWtQv1Fas75h63BELiaqSyUFlnrmx33bTJfdI7KNgbRfUrVsnqjbHaLcDdgKSYfumYfeWKahduY4VrPMRoi2Rk/zjcbInPsLaWMf6OfvDPE2T7PZT7x8GYUARBj/t0AOy8ESd91xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780502018; c=relaxed/simple;
	bh=3D5YuCmfIzt66hkhte7QnobAOdmxK0Tezbo3Dt9hR/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MjpqQyXp1DPxevUJp0iogQYWPrmOQJcUy1ALrdQiKBCmfdLoEPqv1Y7GXcpDhvjulZKUgAgzfKosmjtqVjWQE5TmHGR/izR3n0g0zamFJRVHDBW8n7uAj5nWnh+J5Vh+fqOarmAAzx4vMw7b9Jeu0XDP8trMVx/EXUeqeJrvqSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iBh7fzJq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iBh7fzJq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C21C51F00893;
	Wed,  3 Jun 2026 15:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780502017;
	bh=3D5YuCmfIzt66hkhte7QnobAOdmxK0Tezbo3Dt9hR/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iBh7fzJqQLBbgk8W20hs7PwORg5RiJdM8Lpfnr9BLKThU8gmT+PYj0PhOOzafGIlk
	 EOiNr1wY3hwsjhbi/2C7xX1l37CCwcLT7xy9rdbF7IKKklLsyv7aYhhNgjuRMxKmep
	 Zjjn5YXu3MlQyrhoF+t2LZQcbgUj4FWg4FBhlizUJptqw3oX5uonMn53JLd2wJqZRZ
	 ZskJySSyb2Rj4A0717+C0YRSgihh2nkteEezKQOLkroIzYl+XiJBQLTCNyrk6bOB/d
	 kYFQFiJMIEY/fB1lcvdJlwwseHi5rJ1pJyt6BUVzECtOQLQQ0ilTHA5J8vezm4FrEC
	 j0l9WJG5mkT5Q==
Date: Wed, 3 Jun 2026 16:53:33 +0100
From: Conor Dooley <conor@kernel.org>
To: jian.hu@amlogic.com
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: clock: Add Amlogic A9 SCMI clock
 controller
Message-ID: <20260603-backwash-dispose-c00bacf418ad@spud>
References: <20260603-a9_scmi-v2-1-350aec9ab10a@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ez0A8WG0Ym1sKQjD"
Content-Disposition: inline
In-Reply-To: <20260603-a9_scmi-v2-1-350aec9ab10a@amlogic.com>


--Ez0A8WG0Ym1sKQjD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--Ez0A8WG0Ym1sKQjD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiBN/QAKCRB4tDGHoIJi
0uQPAQDSI9lb443r986rF/5NSmGS4GHVEh33eEaVMCRd4R4VDQEA6BiXzQzF5aaK
p+RuR2WA5XqFz01HOXtu6cmcJLizWAw=
=nybO
-----END PGP SIGNATURE-----

--Ez0A8WG0Ym1sKQjD--
