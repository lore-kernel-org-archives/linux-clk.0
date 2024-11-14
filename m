Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA6C189F39;
	Thu, 14 Nov 2024 21:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731618124; cv=none; b=jFyM4wGFlr9bTfiv6yKY9jTGGvFuepZCWncnP5wJmMueTo/OZv5/UMa6LplSewP2zn79fhXLvwiwfuH6+3lA7jUfeXss5WiopBml8y2aM40W8jBbr07cbyu0EmVs9pR22O39VTjhiyjMyO5hXq93SQgWiJRz9frG2cv4uLVo650=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731618124; c=relaxed/simple;
	bh=k3FWdQJwu4zdHtPrtn6tNTnB6ew7R6w22+4oq9gH0Ls=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=DaUwrV6IqkHPBRZQLIslDP2bycIrpB+U8E7vLrs45wFoZSOxsvv/Wlk8o/luJfR/CLevWlbtAUArweYLZ4QGTrQGe5AnCPu6e+O3Ma+qWC0bYF1C73dS/28aET3t+q7Hba2Ryw6z3A4R3/TnVi95TibZJh6H1MjQ7PbRPgh6rzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qM1t+/kQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qM1t+/kQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7951C4CECD;
	Thu, 14 Nov 2024 21:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731618124;
	bh=k3FWdQJwu4zdHtPrtn6tNTnB6ew7R6w22+4oq9gH0Ls=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=qM1t+/kQDM/JLjFDjgwDLHUczANYwvHt2V40F+xyeaL0No874ZudGZrXKwkfjH0r9
	 yD6ue9/dO1NykNpljYtxBvvoCnIcfN8zRltCLSpJqoKqSrho6od3r6HIM3O22eh9ba
	 Pw4/RHkd358EAkjOEkndP4yb3UgW8iEfRc3MI9+YGU4EZy7N7wDCjHTijZEVSzsO80
	 3WXVjwuUeQTi42dg6Vx/zjDCHKwM4OU2NLOfkwfSv2zaLQIGfCQOCQbQWxm+2rcv77
	 lW1i1Egp1pncN5tK+GjW7vkodKBNKggOn0gP9Em3BsAE43Br7uP7uYU6K5T9tYrAsD
	 bfFyd/trhqoyw==
Message-ID: <8d1d2ae09f0ffd8a8f930c60e84d9257.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241112-clk-en7581-syscon-v2-5-8ada5e394ae4@kernel.org>
References: <20241112-clk-en7581-syscon-v2-0-8ada5e394ae4@kernel.org> <20241112-clk-en7581-syscon-v2-5-8ada5e394ae4@kernel.org>
Subject: Re: [PATCH RESEND v2 5/7] clk: en7523: fix estimation of fixed rate for EN7581
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, upstream@airoha.com, angelogioacchino.delregno@collabora.com, linux-arm-kernel@lists.infradead.org, lorenzo.bianconi83@gmail.com, ansuelsmth@gmail.com, Lorenzo Bianconi <lorenzo@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>
Date: Thu, 14 Nov 2024 13:02:02 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Lorenzo Bianconi (2024-11-11 16:08:52)
> Introduce en7581_base_clks array in order to define per-SoC fixed-rate
> clock parameters and fix wrong parameters for emi, npu and crypto EN7581
> clocks
>=20
> Fixes: 66bc47326ce2 ("clk: en7523: Add EN7581 support")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---

Applied to clk-next
