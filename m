Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF601C3F39;
	Mon, 13 Jan 2025 19:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736794801; cv=none; b=IjzH847VUS5El5h4XKcF5rPnyXvPbnFrIurtLsGsDIV9+CG8ChXDZryxeczzeVVliKVyp69d9BUyjgFZ1V+9aLJ2qZc5zZ8ub3RHd/ZJ0yrnHAIUfNK5m8TZ7Oa+ukHDSQ9U3/pnp3ZrK3Z03ao+eQseY4ZCjAWiPk+4hClHZiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736794801; c=relaxed/simple;
	bh=eOiMvmfxdFa1swvNRvZ6Br8LIBtMTwQKMjwv+dENlJI=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=EQeEmoBzPZN0Imj4b4h8sBhLeOq87HxDYvSA9F2rrsCp0/4D3hO+lFjfPvf87SjAvBZBKEKGbUmt9rRWS9u1QDgutufQSdvMsdYTjgYCmcBN/u+BFGl9lfj1aZbrmxUWf3z3eROoKQ5oAIx/8DB6R4p7re0tzk7UdqLx+9QbMis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XvGeNAcg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XvGeNAcg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E2ECC4CED6;
	Mon, 13 Jan 2025 19:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736794800;
	bh=eOiMvmfxdFa1swvNRvZ6Br8LIBtMTwQKMjwv+dENlJI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=XvGeNAcgH7np8/z5yTrHK8BBnJJGoPogFQCVRRj9Whr3quitSmhOFlSkR+qBqXTV0
	 QSHS7yafeXhNoY3yeL0iBUHgkKE1Zwf553TodFMqjHIJehC8u4glNlJh2Kx1O04bv+
	 /1sDlADXXsl+GFVyLvR/Xmi27JlENJNolfsHhQoCEqk0wZmuceJIjpIDI+LeGw4xDp
	 v9BFlRHS5GbfQPS7kJdOO8cPHP1A2xfaD1kFq8H3KRmxTuPs9Nuh3gLP1NH5in6LZZ
	 A+R3w2qs0S0jR4uSVtvIGpCupKoICvj6AlytC5iZQsuDaIW9vA2xsjtLjHDWo/ozce
	 7KwevoQDRf1uA==
Message-ID: <ff960baf02e6aa6fb93fe9a4584689ad.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241025105620.1891596-1-andre.przywara@arm.com>
References: <20241025105620.1891596-1-andre.przywara@arm.com>
Subject: Re: [RFC PATCH] clk: sunxi-ng: h616: Reparent CPU clock during frequency changes
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Philippe Simons <simons.philippe@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Samuel Holland <samuel@sholland.org>
Date: Mon, 13 Jan 2025 10:59:58 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Andre Przywara (2024-10-25 03:56:20)
> The H616 user manual recommends to re-parent the CPU clock during
> frequency changes of the PLL, and recommends PLL_PERI0(1X), which runs
> at 600 MHz. Also it asks to disable and then re-enable the PLL lock bit,
> after the factor changes have been applied.
>=20
> Add clock notifiers for the PLL and the CPU mux clock, using the existing
> notifier callbacks, and tell them to use mux 4 (the PLL_PERI0(1X) source),
> and bit 29 (the LOCK_ENABLE) bit. The existing code already follows the
> correct algorithms.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---

Applied to clk-next
