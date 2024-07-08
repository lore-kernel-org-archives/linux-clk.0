Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5002614EC61
	for <linux-clk@vger.kernel.org>; Mon,  8 Jul 2024 21:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720475015; cv=none; b=otj9prVjIny5hu8HB3MI68HM6NlzRdEa9WqyBVgV/NTdB8Atvkh48XKMz64YnVX7I2ucQm0tmIrBQ5Nl33OqH0N1tjGxgqKIClOtxmx1HjNlFvlAbwRrXsLb+TeLNPdtiC3rhsF3E77K1GfQGULujuXPgLLUbx6E7CWm06LM2K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720475015; c=relaxed/simple;
	bh=OKOMrRX8lEkX8tOP8acsg+59i2/BtwUafoJAS6aCxv0=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=IKmvmdsWqzYxWxZXVy/6RVplrfkXXCYyKWobJ/gO8WDE04MNzz26x+HVuIBuP0tNzHHDTvosIg6Jst7Ikda3vvYlNDbvMEXq5o3nsh5TmBZFR7zonTp2i5WsIMqQbEqgeot5eMs1qO63iUquTVA87JHiPa4Rww4tzX/HLi5DgOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m95TX3d+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m95TX3d+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C897BC116B1;
	Mon,  8 Jul 2024 21:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720475014;
	bh=OKOMrRX8lEkX8tOP8acsg+59i2/BtwUafoJAS6aCxv0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=m95TX3d+uFnOG3iL5l3dlve+aas0bqszJ/j/Ik3ZzFxxlcmXLOev4zTbVbo8lTv13
	 6XyAm12UDqtPYY3M4QxrEqopuBimzxVd2RLwSczoxWjhrgbjo/2aV/rH6iu1UKGrpV
	 GkX6g3fTKj/aXt8C3uuqz2iisjM63xp8vjJChJRq0nPJMyFym85WJ2ZI1UDMr3/OXE
	 Q+l3mU6b62gg6knXvhAcOaVP0B82qfAUu18UJHDNY3S9C3WZUXzZkvH+HmyerG1anR
	 ToLZgJ+jEOlRBPrZOsO+s6f1Pu5ALWEgXsnEv7PMBW4a1hLZn87v6OluMt08HacsZr
	 PNASVIbpQ7grA==
Message-ID: <629a59c29c5230a0a3875373d80556d2.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <c491bdea05d847f1f1294b94f14725d292eb95d0.1718615934.git.lorenzo@kernel.org>
References: <c491bdea05d847f1f1294b94f14725d292eb95d0.1718615934.git.lorenzo@kernel.org>
Subject: Re: [PATCH] clk: en7523: fix rate divider for slic and spi clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: p.zabel@pengutronix.de, mturquette@baylibre.com, lorenzo.bianconi83@gmail.com, linux-arm-kernel@lists.infradead.org, nbd@nbd.name, john@phrozen.org, upstream@airoha.com, angelogioacchino.delregno@collabora.com
To: Lorenzo Bianconi <lorenzo@kernel.org>, linux-clk@vger.kernel.org
Date: Mon, 08 Jul 2024 14:43:32 -0700
User-Agent: alot/0.10

Quoting Lorenzo Bianconi (2024-06-17 02:25:49)
> Introduce div_offset field in en_clk_desc struct in order to fix rate
> divider estimation in en7523_get_div routine for slic and spi fixed
> rate clocks.
> Moreover, fix base_shift for crypto clock.
>=20
> Fixes: 1e6273179190 ("clk: en7523: Add clock driver for Airoha EN7523 SoC=
")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---

Applied to clk-next
