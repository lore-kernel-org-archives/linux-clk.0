Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EA7178CCA;
	Mon,  2 Sep 2024 08:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725265315; cv=none; b=Q6bZeDQp4Y1d0sHlHq3G5jTqyScJ8/Ll3Cezyf2AByXIPQeqIHGFH405h941AsWt7FakpIVZ+ac9yKZ5lGtHTUh2FxrGfnfhLbLbiG0uqIjltJ/cwCisUTiC7oYcGPxOWH+H5Yb73RLigtuK8cG3rhAe7Z7bCkWZZshbHYVpvm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725265315; c=relaxed/simple;
	bh=++5XtJRI2OBJUvQdMFetMDyyN7OMyy6hLZbmVLQvQXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rVK+3k8hnFaU1lDKe1x1cR/7lw9UI1WMYelbiCkesuxaPnyDOhIIZgHNOv9Cmz7NwQSN6Kj8hcanHGUFCQXGccodCjKZgAEwqWxklY2QIQuG6F6XypIdiA4Dzyg9RW9L+0PUZfBrCSjhkgXLVVu/ep5ddV+llLFc0PX8bTEoYiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QSPUrVU2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QSPUrVU2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CC6BC4CEC2;
	Mon,  2 Sep 2024 08:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725265314;
	bh=++5XtJRI2OBJUvQdMFetMDyyN7OMyy6hLZbmVLQvQXQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QSPUrVU2xVTD4zOBz8F2VQRka5PQ1VvhtZOLislKOyTX5SPvegkd2XF4NF11KXBBt
	 wYZV3VpG8wd61wIGMejFZcYBRsR1xXFktpvJsGRtKIzxftd9Ry4CUyG/gloLH5blJp
	 jPvAttUdE+jIz2XSVGINX4orc0+6dm2G2nl54heEwUZM5aT2hq4WwMCz0/JPcb1kud
	 n5AMDEWePKuUG1k0QvQS+i9UfLncOnJhLALNmyt50aN9Uv6UsLMB4fFIPWDkIagsUi
	 K+jpZ1pUOJXIUcMxcasaRx/465C/KTTy1lpxg1t+5vp5e/aGtfY+HqFUD+IntxKjq+
	 WaclWgSnTgULw==
Date: Mon, 2 Sep 2024 09:21:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, upstream@airoha.com,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org, lorenzo.bianconi83@gmail.com,
	ansuelsmth@gmail.com
Subject: Re: [PATCH 2/7] clk: en7523: set REG_PCIE*_{MEM,MEM_MASK} via syscon
Message-ID: <20240902-supplier-identify-b11b89a9a4da@squawk>
References: <20240831-clk-en7581-syscon-v1-0-5c2683541068@kernel.org>
 <20240831-clk-en7581-syscon-v1-2-5c2683541068@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EkCa+oSc3SPhYi+3"
Content-Disposition: inline
In-Reply-To: <20240831-clk-en7581-syscon-v1-2-5c2683541068@kernel.org>


--EkCa+oSc3SPhYi+3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 31, 2024 at 09:18:44AM +0200, Lorenzo Bianconi wrote:
> +	map = syscon_regmap_lookup_by_compatible("airoha,en7581-pbus-csr");

Is this compatible documented? (On a laptop in an airport with no recent
kernel tree, so I had to resort to searching on github which turned up
nothing).

--EkCa+oSc3SPhYi+3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZtV1ngAKCRB4tDGHoIJi
0tEhAQDsJOwSu8mmVezVIH29HYn/G+74lmAtAsjHJNQq/QUI5AEA+1HvMJTxZnd5
gvGPFjRPIADgYa5cdEh1m87PwUnEYQc=
=9vTr
-----END PGP SIGNATURE-----

--EkCa+oSc3SPhYi+3--
