Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F1F22B8AB;
	Thu, 24 Jul 2025 22:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753395336; cv=none; b=W78hUY7KbhgTpw/hwbYW5LlyNU0BK1rjsfVlFtju6JWt9IgzDaoSpDQ5wqZFWQcSSz1oY3GH59+b0ckpAywPlV9Av+lN0AABdz66dV9JStbrJ6wcaFznTRaOXX5Au98NZSTZydeVfZ0f2iVCnL6An/oF3fDx2oDiqMazang1OQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753395336; c=relaxed/simple;
	bh=1K/eRSbOff0T8+rVekcManbjFwPLp/evZt/FzKJpE8U=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=M0q34NuU3/lBq+iebAUTPvhlSquwg1GnwXyycfEBwMk4FrsAHu6qrJmg1HWHmj9mHlK1t+l11rcz0LNUZL56emZGXExt7GinaaXT2gaZZHpWlLP7sMjl9kMU69FwYe4C2n0LIALRAk+X16OSLSLCUQtN5bD1/qETJBGCuQZsF08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jEHGIVcQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jEHGIVcQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCA6DC4CEED;
	Thu, 24 Jul 2025 22:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753395335;
	bh=1K/eRSbOff0T8+rVekcManbjFwPLp/evZt/FzKJpE8U=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=jEHGIVcQq62aGxLF8GiPjy3xIA6ROk23PQ5672ROgz94Jm2D2sSAGvCwB8kYRrRuX
	 WsBQLqbOxtpSIX3ti8ZZB0WOnxJ/fnA0x8HsAA769QPoo5t8PYnDqhpiWWpwsOeU40
	 Tbxm1jHj0QQKYfMPLrWNUYwpyM8lcVk8Dbls1LDIOYL3DhhlfzKjXC2kssTgFiX6r6
	 ee64fYBArRkbs7EwbcS8aQrxouW+A9xNUNIo56LkbB/dn2ikyccH74FfDZGVRyed6q
	 E50qtSIvTYuDVeV0Q9Y6ZMa2eipJlJ0sjP/+D1VCb8iGhGPeB1SDDp8FACj6YZYGYH
	 s73+NAOiIy1zA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250710-clk-imx-round-rate-v1-11-5726f98e6d8d@redhat.com>
References: <20250710-clk-imx-round-rate-v1-0-5726f98e6d8d@redhat.com> <20250710-clk-imx-round-rate-v1-11-5726f98e6d8d@redhat.com>
Subject: Re: [PATCH 11/13] clk: imx: pllv3: convert from round_rate() to determine_rate()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
To: Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney@redhat.com>, Fabio Estevam <festevam@gmail.com>, Maxime Ripard <mripard@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Date: Thu, 24 Jul 2025 15:15:34 -0700
Message-ID: <175339533490.3513.1645095871041504041@lazor>
User-Agent: alot/0.11

Quoting Brian Masney (2025-07-10 14:10:43)
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Applied to clk-next
