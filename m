Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F137236A62;
	Thu, 16 Jan 2025 21:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737062950; cv=none; b=NTA3Mi4cEcZfhN/Bho93RIfpqOeKn0e9JROoaOgD1iJ8m+L+FcyRhDyElsqi7g826sy4i2Rc2pWF0qazGIwMTfyFBEcIhBIy1Ydey9HRB1PPEONCF7jEMYFXkUHPX6JMBRaHgi7G+SnNA0QwDEI5h58SHfhlCMeuvo58CSpxPcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737062950; c=relaxed/simple;
	bh=QtGvbgnCKNG71J9xjIw+TIhRwbYo7xbgUBkwySBKGgw=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=I/P0mPok1Ei8WGiDXkfge9TScZr0z4VtsCUg9+BDqJZhNMDi8BekItrInqsoCwiSsxxP/abnU6yCk5WBNSB27j1FHCoCdI0L/HuYs23uiNAqTcKnCFE9JvTMSq3j3pnBaUbcCUAxI4rA+OKFhSj7ebedBHmCAoOAbts2wHocEzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dxoKZU8o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dxoKZU8o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 161E1C4CED6;
	Thu, 16 Jan 2025 21:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737062950;
	bh=QtGvbgnCKNG71J9xjIw+TIhRwbYo7xbgUBkwySBKGgw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=dxoKZU8o+ue9MobT0WFUn9f8V85Kos4J1PxS3O0RHuFx+fmz4jPQ5MCcC8l6wCfDz
	 dKdrGC3f72nD2Oqo0oebXfyKWDjG28/LsGeqvldIZvqsHycT+zAzbjd1sUf00T0LUv
	 mtPgIuJwzBZCL3ToyBPKR6jXnoKgZy3yVO9BPzLdFEeWfI6NNh2ki8A4IYsnpwtWcy
	 DEMKADlOJyNpjAlGSaDejlgaibc8vwO3OnQ9OcZVIHTIcOr1ywEZhnZgbb2i1D+4zD
	 Jcb9gHhksq+a4kDkatrpYqgaivQ6WczF9yIZwyYf1/6oUH/TGo4Qi2LHPqAvrBOt/7
	 KN17axRg9JRxQ==
Message-ID: <6b4b68ae02b64840db8c481e8adb3205.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250116-bcm2712-clk-updates-v1-4-10bc92ffbf41@raspberrypi.com>
References: <20250116-bcm2712-clk-updates-v1-0-10bc92ffbf41@raspberrypi.com> <20250116-bcm2712-clk-updates-v1-4-10bc92ffbf41@raspberrypi.com>
Subject: Re: [PATCH 4/5] clk: bcm: rpi: Create helper to retrieve private data
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>, Maxime Ripard <mripard@kernel.org>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Michael Turquette <mturquette@baylibre.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Date: Thu, 16 Jan 2025 13:29:08 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Dave Stevenson (2025-01-16 08:24:11)
> From: Maxime Ripard <mripard@kernel.org>
>=20
> The RaspberryPi firmware clocks driver uses in several instances a
> container_of to retrieve the struct raspberrypi_clk_data from a pointer
> to struct clk_hw. Let's create a small function to avoid duplicating it
> all over the place.
>=20
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---

Applied to clk-next
