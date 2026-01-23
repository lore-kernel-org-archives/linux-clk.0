Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEDA2D3A89;
	Fri, 23 Jan 2026 01:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769132718; cv=none; b=ccBkUIvUHFNqnBS8pJoqGdFzydblDsijvvk4o5IZr4d0PrWf481p83QkZedEn0OYQbJT74GHtY1zUnFbdJDoethHrRNtVZUNjqTDXJbDjg19/CNstu1ZiT3TpZ8DmcgddFZolvGbDTERXGWqJJstFUbI1Nx5uJHEnl26ykpsaMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769132718; c=relaxed/simple;
	bh=S3zi7Cs5yb+b4cX4asMUomLRUx2T6EiDtE7IRZ9uGbE=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=PwPnbxd6u4ICTgACwHqzd2fQERKZg2exp8hKdsGb9lvpe1lwZjfoGzwDpR7pEw8LNF41N1MGQZNdD6qstAShORoYVlpdUoCm7vce3rrDYExEeUhhf01VZoDMk1Q2JEN+4lm1jcp2x3LbBGgK73lJ4ZGzjAoqYeODxYg4o/NAejo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ts0x65zA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ts0x65zA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED26CC19422;
	Fri, 23 Jan 2026 01:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769132716;
	bh=S3zi7Cs5yb+b4cX4asMUomLRUx2T6EiDtE7IRZ9uGbE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ts0x65zAxMz2H0YAVA/kGOCLaWdLxg4aEU9swNSUPcJU1K3nQcxIWLGmOCB4Zlqy1
	 JgD/iB6NT7JFx2hlayM5FcT3lOrZRA4tAREStVwtAqVAvF++8csySgPGxpFKRXHe8o
	 +WfMLeRHA9wb8a1YltdRp23bP1GQEP2oEDdRgalI6BFyjPs0bjEKy9lv3BR1JSclZQ
	 QXQ3QGOzEwXsYZBP1AYWNR9CdcuwUO4S9oDhGIj3jnhR9cvtTGPERkr00pIXw1Y6Ia
	 Pv1deqrxH7225uqxDHAEwIw9k71EfLBMY3lm+H6lr9CfZJEn1jhwv0VeQDmswG6KbX
	 q+KPjL1ue1T0Q==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251215-mtk-pll-rpm-v3-3-5afb3191e869@collabora.com>
References: <20251215-mtk-pll-rpm-v3-0-5afb3191e869@collabora.com> <20251215-mtk-pll-rpm-v3-3-5afb3191e869@collabora.com>
Subject: Re: [PATCH RESEND v3 3/5] clk: mediatek: Pass device to clk_hw_register for PLLs
From: Stephen Boyd <sboyd@kernel.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>, Laura Nao <laura.nao@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, =?utf-8?q?N=C3=ADcolas?= F. R. A. Prado <nfraprado@collabora.com>, Yassine Oudjana <y.oudjana@protonmail.com>
Date: Thu, 22 Jan 2026 18:45:14 -0700
Message-ID: <176913271422.4027.11922127679844362573@lazor>
User-Agent: alot/0.11

Quoting Nicolas Frattaroli (2025-12-15 03:24:00)
> Passing the struct device pointer to clk_hw_register allows for runtime
> power management to work for the registered clock controllers. However,
> the mediatek PLL clocks do not do this.
>=20
> Change this by adding a struct device pointer argument to
> mtk_clk_register_pll, and fix up the only other user of it. Also add a
> new member to the struct mtk_clk_pll for the struct device pointer,
> which is set by mtk_clk_register_pll and is used by
> mtk_clk_register_pll_ops.
>=20
> If mtk_clk_register_pll is called with a NULL struct device pointer,
> then everything still works as expected; the clock core will simply
> treat them as previously, i.e. without runtime power management.
>=20
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---

Applied to clk-next
