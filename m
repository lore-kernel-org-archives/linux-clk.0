Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D9C824BD;
	Fri, 21 Nov 2025 18:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763749934; cv=none; b=jL1BFbDp2NKrzJngB/Lr3oYj+iJ622MatvNks+XPudnXxCaY7SAtEcovLfGAW80VmoLLszIFkZDGXr0NMt2Gb7vvJnayFrBq3Df4qrPZ+KXx8BuRS025TXPsqFFToMYJo5+kzIx75Peej+wo1Chb5CmSDwzuo9pTMO9zBW6dsVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763749934; c=relaxed/simple;
	bh=FYYPervbEOjVJJBzptFxIG8219f/76+NO4AhnB1hXNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i65O8jIPkyjgdTALEz50MLiQqMGw3WaHWbVj6nwk+Xdaq54SELpksqyt9OM8OGZ6ZAyJCzLCi0s+WCAVz4Yazeir7mpPLfR3zpheoX/Cqh11u8bTEeTz2D8XJC79RfxMDNe+cLuI40KaiiC3mWPbuGgYIUq439Na4WMUwc1fNA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y/yYFmzq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y/yYFmzq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB8A6C116D0;
	Fri, 21 Nov 2025 18:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763749933;
	bh=FYYPervbEOjVJJBzptFxIG8219f/76+NO4AhnB1hXNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y/yYFmzqxyIdBmUAV3gvjPj/hP22PY1qOyfhcIG1rM8hK2Vzo88PaB+kyb7aHOQ7F
	 thaWNLoxl+yG+fzCBrfnlX9Vy9goHiqa3eQnFfrBgCwdnk3BYwBaQkG5Q4cJJRB6kp
	 p3uVQk32svVFtHsiAfNRJRJ80Uoep2McqKajzidFe8fiHzqlktKSnaE3UVlE5MbacI
	 tv7WuIP6qWHO1k4N0h4/oV7A97d8B5p4HeHCFb+Pq76JfsijWXJjBatDCApieSaK8O
	 kqd/Z47QdEupQOoV+00I7E4wq8s5hPwkaKmW4EwUKyACipEEQ4CuEycFSzB1Tj2qJ2
	 wgKZ9tvnGqb1g==
Date: Fri, 21 Nov 2025 18:32:08 +0000
From: Conor Dooley <conor@kernel.org>
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, heiko@sntech.de,
	robh@kernel.org, p.zabel@pengutronix.de, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	finley.xiao@rock-chips.com
Subject: Re: [PATCH v9 1/2] dt-bindings: clock: rockchip: Add RK3506 clock
 and reset unit
Message-ID: <20251121-pardon-employee-9dec9bc4f722@spud>
References: <20251121075350.2564860-1-zhangqing@rock-chips.com>
 <20251121075350.2564860-2-zhangqing@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OODCh6Xp3HC9Xyhv"
Content-Disposition: inline
In-Reply-To: <20251121075350.2564860-2-zhangqing@rock-chips.com>


--OODCh6Xp3HC9Xyhv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 03:53:49PM +0800, Elaine Zhang wrote:
> From: Finley Xiao <finley.xiao@rock-chips.com>
>=20
> Add device tree bindings for clock and reset unit on RK3506 SoC.
> Add clock and reset IDs for RK3506 SoC.
>=20
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--OODCh6Xp3HC9Xyhv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaSCwKAAKCRB4tDGHoIJi
0tYmAP0XdiQ7FjAMJRMNG+AfR5MdexmkPh6Y1Wk7sVStJYlgngD9FvuK+OKz/JB9
1pNXBM31iSC3eLIx+nz+r2s7DT8gNw0=
=hCqX
-----END PGP SIGNATURE-----

--OODCh6Xp3HC9Xyhv--
