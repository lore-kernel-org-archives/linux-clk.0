Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034313CF683;
	Tue,  7 Apr 2026 15:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775576831; cv=none; b=ds9bpCX53L5gS1QYLFNwh+EsFGI3FUXf+vZM8Fv70r28JVBkQ8NUigmhRHaEDEDuzu56T73mAjfGiuSH3hk7XF6py2JyEOKThIwLCNzGuiRA9YQ3x3k4wYIedZpa9SMe1JV/c3gqwtzD5lMaLS1xfnwKpcu5ptALgxNmAK/Jc4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775576831; c=relaxed/simple;
	bh=7ZkhLjkG4Tgldo1Tqz/ygd9bzoyC6ImiCL5OXqWPe9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O8krB6+4TUR5mDt+5Oq48uWwxMVUFGXhQ4wIeWC0TardrofdyQrgGf+lkjHgVUGjf74FlQGFY3vgeeQE6ElizkjhKrSTZkOl1Qdqk5iaZA1pBQUPzaqRkV52ekWWbbdJKMHLQQxgCC01GOZfuc4EluCVU+AygNtouWogWegwaN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZLTYUOhZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZLTYUOhZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAD31C2BCAF;
	Tue,  7 Apr 2026 15:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775576828;
	bh=7ZkhLjkG4Tgldo1Tqz/ygd9bzoyC6ImiCL5OXqWPe9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZLTYUOhZLV0JcJ7WhfezFr34+clUqw4nRZW4ypzETr81SO/fn7kPCECkX61XWeq1Z
	 p4ogSkbLp1HmjxNX1AbklH1QaKzum2RfgNcIwOzWt6Hd7k3kQBYlwtg3OVRk4Mma48
	 oeFDuKAupsRkEqd+nq5vhZ+5DQ05dUr6gjEmBwVIc6scYnz/xydqh6PL8olpAHwhFW
	 LRlOfh46Df1Ad/S5VU+1r0i9TaiR7OHWQack1OPJ1mLL4s0Yyd4lPnCTS7rreoGy8j
	 wGTWZAWpWft/ObACVtqOaic43cUStkIMLpa9ThbX9xe3cLOogZ3wDzdbYkve7wONn7
	 3rA7jA+xrFSmw==
Date: Tue, 7 Apr 2026 16:47:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Keguang Zhang <keguang.zhang@gmail.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>
Subject: Re: [PATCH v1 12/13] soc: starfive: Add socinfo driver for JHB100 SoC
Message-ID: <20260407-captivity-psychic-d2ee5c9109d1@spud>
References: <20260403054945.467700-1-changhuang.liang@starfivetech.com>
 <20260403054945.467700-13-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0RgIb1E/R/WiM3PU"
Content-Disposition: inline
In-Reply-To: <20260403054945.467700-13-changhuang.liang@starfivetech.com>


--0RgIb1E/R/WiM3PU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 02, 2026 at 10:49:44PM -0700, Changhuang Liang wrote:
> Add socinfo driver for JHB100 SoC. Currently available for distinguishing
> between the two reversions, A0 and A1.

Maybe a silly question, but do we need this? Are both revisions
available outside of Starfive?


--0RgIb1E/R/WiM3PU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCadUm9gAKCRB4tDGHoIJi
0mx3AQDDIeNtlngb0YbX9JeCQZq8JKeN1yutHGXtTooj6sgkCQD+IYw4zBK5Q4FY
f7FsBY9dSZxILE70UqmD4xWC9lrDjQ4=
=yPUH
-----END PGP SIGNATURE-----

--0RgIb1E/R/WiM3PU--
