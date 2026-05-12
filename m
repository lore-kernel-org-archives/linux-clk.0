Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770333E0724;
	Tue, 12 May 2026 17:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778607621; cv=none; b=ONcnoJA+nG6yoXUR0ruqRfRFjgRvtuWDebTBGOzjIoH+jHUp19OuwS6wimyPpBpm+Z2YLf2skz1w0crrTQr1F0b2fHvKUtaK5jfrseMvw+XETpNZyH2v3Gs93qIFs33YNBp1FUzeCijlTCsPR/TT2IPy6Zn7uRlI7osxrZ/FHow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778607621; c=relaxed/simple;
	bh=npkKRkbCHuMxxTkGtz0jU2eTI/JHbbUGkLRNiKOOGlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g+v0cfOtPpfkX+Le4vYSzVgqP6GHbU35YPIa1RVjJcTNzJYgIW0EimTV6d3F0Bk/+80c/IEoWE85lRIbhr6FI8kerXvEaN84NVqSynMeGBAXe4zwJYQtioJJgevRtjzfUQb9+D9y2PCeQocIgXIZjlPYg7GewsmTm5SjTqqWcBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mI23ETla; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mI23ETla"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31351C2BCB0;
	Tue, 12 May 2026 17:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778607621;
	bh=npkKRkbCHuMxxTkGtz0jU2eTI/JHbbUGkLRNiKOOGlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mI23ETlazG0WQcd23pxLGOtXql7Un4dbtL/1JY3eBHUa+zSuVqPEXXNHU21LD/ehq
	 addy2DWxreyPVa/vxFEuS3BknSl5rBkQa4pKUHA4Itt/oJhfo5RuC5O5zM55Z0H64s
	 izM/pt6gJZNVtYT2mq+F3PQI5s42jjwtoCMhyzoBj/DQ12QAnrBtNmsnGCs7FO5vI/
	 lD/eJgvZiD1mbxQLEhk/xSLdDGwr/pela+zSyh9KjysZZKWFElXjmViBkwqc7ciW3P
	 eXJN6zr/6zQnuSJxLya8k4k5U+f9xJms7tiKsO6tomHTPH6yr4goRCIcq14xm3jrZk
	 Fq5gG5cRwLthw==
Date: Tue, 12 May 2026 18:40:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Keguang Zhang <keguang.zhang@gmail.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 00/12] Add StarFive JHB100 syscon modules
Message-ID: <20260512-sponsor-glider-1c2d81fb6eae@spud>
References: <20260512083521.3448-1-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qFOL+G6TXxlTic1U"
Content-Disposition: inline
In-Reply-To: <20260512083521.3448-1-changhuang.liang@starfivetech.com>


--qFOL+G6TXxlTic1U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 12, 2026 at 01:35:09AM -0700, Changhuang Liang wrote:

> Changhuang Liang (12):
>   dt-bindings: clock: Add system-0 domain PLL clock
>   dt-bindings: clock: Add peripheral-0 domain PLL clock
>   dt-bindings: clock: Add peripheral-1 domain PLL clock
>   dt-bindings: reset: Add StarFive JHB100 reset generator

For these 4,
Acked-by: Conor Dooley <conor.dooley@microchip.com>


--qFOL+G6TXxlTic1U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagNl/wAKCRB4tDGHoIJi
0s+AAQDMLz+eCs+7dNGUIwrc/NShFxM3bCgz4vWoNxbGIAzhswEAvzdtnz4lornN
+iG7zRMlLHmKjxY2P9FbjCCEf5SeSgc=
=pohG
-----END PGP SIGNATURE-----

--qFOL+G6TXxlTic1U--
