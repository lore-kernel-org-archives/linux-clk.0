Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B333612E2;
	Fri, 23 Jan 2026 01:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769132736; cv=none; b=RsTGqAg0FTAYo3JCQV57o+/hy1XFOv+aptAQRyYWTMT5iIFaoK6ktsGh5/RKBjjzzPXn+YBbCA+CFrrOkeIXSHXaHP00eWE/GKOKwIxMRsXlRX2lgKyDoAOHqKhed++NdqUQH1Y1bD4nmYMa3nU/uNwoWkGbiaS1z+Xi/8Q2u14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769132736; c=relaxed/simple;
	bh=Wzhmw8rKUN4fg6RiWqwWz6GO1fLdpfM7fAdDGueR1fU=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=fPd1QvKQOIEgwRJj48AZENIigJ+WwAUl17rtyCIiGLx/9qlmFAocZrkYkxmhx7c6PaV3T/E43zX62NNFGtWRoDHeHRpcBRsXjfySmtYXrcILPz+ZQZqfR2owlyK3INP1RATyqZF8nb8jRh/9RgksPvYLtICGeGm/Wd3tZyaRbwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cdEfcKVM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cdEfcKVM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 840F1C116C6;
	Fri, 23 Jan 2026 01:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769132735;
	bh=Wzhmw8rKUN4fg6RiWqwWz6GO1fLdpfM7fAdDGueR1fU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=cdEfcKVM1I8wLG60KGaFaldGgftXWk01K0nVz7kpbnTmDczvycPtG9lznvHm58pky
	 14NVBUq5pEh3ZxqmUJl2lXegtJbZN6mLYmAx5SgXbxiUvZArxtPgyz59odQXJJU2Io
	 jIYCqE938MPSLGFW9egs3I5FFodVtH5oEhdlBfPZ/LGvdWmQbX50pcTT3H5i8K277Y
	 lu37an7syPBnrmBlGM3tUHBK4D0X+qVyFuf31m13GjYX4rVZN3qoSswBgNW/ztQ2eR
	 6zd4nhD8zQTnO2gOMO/SRRSUfV0CYzFj0yxxtrFIhYDDmboBxBRDL81bzfLidUujnm
	 xiZbOVv/8PHTQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251215-mtk-pll-rpm-v3-1-5afb3191e869@collabora.com>
References: <20251215-mtk-pll-rpm-v3-0-5afb3191e869@collabora.com> <20251215-mtk-pll-rpm-v3-1-5afb3191e869@collabora.com>
Subject: Re: [PATCH RESEND v3 1/5] clk: Respect CLK_OPS_PARENT_ENABLE during recalc
From: Stephen Boyd <sboyd@kernel.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>, Laura Nao <laura.nao@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, =?utf-8?q?N=C3=ADcolas?= F. R. A. Prado <nfraprado@collabora.com>, Yassine Oudjana <y.oudjana@protonmail.com>
Date: Thu, 22 Jan 2026 18:45:33 -0700
Message-ID: <176913273374.4027.10690199843699119944@lazor>
User-Agent: alot/0.11

Quoting Nicolas Frattaroli (2025-12-15 03:23:58)
> When CLK_OPS_PARENT_ENABLE was introduced, it guarded various clock
> operations, such as setting the rate or switching parents. However,
> another operation that can and often does touch actual hardware state is
> recalc_rate, which may also be affected by such a dependency.
>=20
> Add parent enables/disables where the recalc_rate op is called directly.
>=20
> Fixes: fc8726a2c021 ("clk: core: support clocks which requires parents en=
able (part 2)")
> Fixes: a4b3518d146f ("clk: core: support clocks which requires parents en=
able (part 1)")
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---

Applied to clk-next
