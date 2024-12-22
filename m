Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A469718F2FB;
	Sun, 22 Dec 2024 14:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734879146; cv=none; b=GmOMmzS0lapGpRLYJLLI1BaWoXOjTdHPTp0uZyUdkaHTBkuU5OBXmStK7L+7g6HtvqAmkAGD7Asv5gAJ0zyS97SZpkgAO7HjvDdjakxn6ZYWDAzLjX8GIkGsR07tEgnRNNVHET2boaURcYAOJ8+9bBlCTgGbbEp15cYy4lHk1Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734879146; c=relaxed/simple;
	bh=1qs5ohTuPnKA1L9/JYtkkCFMLAgz1ArxNv+IC5GImAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mn/+5iePBnaMrhLpFVFGabgiARM4Oz9WQtkrykD2O83RYFk6ByH4k37ZsiehESVdOMrqkoRCCSVi4gBMM6AtZvZf2ZhLu0drVpuKJgbJJEdaQOFs71bshONKYmyHCHSAaYvdgjT1fSXh0eTf/8LFcrkXxgc1fHsOx6XxY0gsxYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PsPCDuwf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PsPCDuwf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0606C4CECD;
	Sun, 22 Dec 2024 14:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734879146;
	bh=1qs5ohTuPnKA1L9/JYtkkCFMLAgz1ArxNv+IC5GImAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PsPCDuwfl+IX6ydypwbUMUMg9bv6rGb7scmuthhHCM4uiyFa9L6pbUSCUvIs2BMen
	 FPQ0G+34SBTJauOHnmFqB2Y7517N9bp313jqwo2BkQ5Xhbc78mBPWSXwbtZMm07tia
	 K4DXIK0CVXAzGaz3J4NBbM5AvHPbTA22lMsEgUdOVPMzHsmpcJp9N3SDy+o0N+YU1c
	 aV/TUR78bZp4UcoKhyxc+u6FykF3OECjPn2apie4exRWA7Qj7E81rCSQv/MlxO4Osi
	 T/P59IvV9Q75xbE55R6RvRUwoyiLN+/eWxQ9fGDhNc39naWL5KGOf8FEowZsC/MWGQ
	 nKYO1uZiSJ68A==
Date: Sun, 22 Dec 2024 14:52:21 +0000
From: Conor Dooley <conor@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Liang Chen <cl@rock-chips.com>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH 02/38] clk: rockchip: add dt-binding header for rk3562
Message-ID: <20241222-plaster-tidings-d0078a7a007e@spud>
References: <20241220103825.3509421-1-kever.yang@rock-chips.com>
 <20241220103825.3509421-3-kever.yang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sFzoiXaeTkH6r4ws"
Content-Disposition: inline
In-Reply-To: <20241220103825.3509421-3-kever.yang@rock-chips.com>


--sFzoiXaeTkH6r4ws
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 20, 2024 at 06:37:48PM +0800, Kever Yang wrote:
> +#define CLK_NR_CLKS			(CLK_PKA_CRYPTO_S + 1)

The number of clocks should not be defined in the binding.


--sFzoiXaeTkH6r4ws
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2gnpQAKCRB4tDGHoIJi
0k7CAP9UU021ZHo5su6kFO8Lh4rZvIM2qOTHtVt5NZYDX8s6HwD/clPFaPQbjYKh
Isf6ybumVFu0AyKL/5mSiCQmXWv5DgA=
=5x3J
-----END PGP SIGNATURE-----

--sFzoiXaeTkH6r4ws--
