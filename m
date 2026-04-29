Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183CE38F923;
	Wed, 29 Apr 2026 03:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777434421; cv=none; b=EAj/j3iFhFpkWbb0yk7txZyXguDj4vXgDXwkm2fy3plhNlZ0bZGORX29p6yl8FDUXPI/QNmnqsCeJ744DImJgPTodJceOQGjx+Uz4EjDLamH0nUvkBkYXiR+hrSvLpp9j254ucMLLmx884fSy72exLdxBK/8YDHznVfZJQrOLtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777434421; c=relaxed/simple;
	bh=AO19yXsn37qBgG5Tsrn/S/WN0SBnx/bhiec2Iy+vZTg=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:To:
	 Date:Message-ID; b=e5hdNPUKXnD00ycvsNgEjkLmumBRIG3dnuNXA8bDzWGg/5RjduLF8FHtqq/TmV+Tr0fTZT1yGxKHlZfnAqPZZHiVOf9kgRPZpxGchPuwrSwjyNBy1y4Ecz3qf2w415z0erJAYENtLjGo0D6pXKyTYluBXyBHJnQqLPVMpl0WoZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fwx5xoFb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fwx5xoFb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF12EC19425;
	Wed, 29 Apr 2026 03:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777434420;
	bh=AO19yXsn37qBgG5Tsrn/S/WN0SBnx/bhiec2Iy+vZTg=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=Fwx5xoFb8vRtgQI1/v3ubSpVpkUkR6bcJVqa/IB1Nnwht+zlh6Vk4Y1hJFXvND/wv
	 V0C+wy7l7YBAZzh8lZrPwvd/LpbECP8hMffMBSOLc6IlXrQ/Y9Rl/69UxGo+FRIFHU
	 zCOopn80cBuV5FfPQhZlVNToahcyy7SffVhaDbIYfn49HxT0spn/P/VtYsNw9kNg9a
	 Akl4tbOCe/GHmIH4M8dTj7OXWOtMd5LV60vrW61k2vJLegWu31C8+G9MJY2EJLU0IH
	 CnlyVD6urCfP/HqBTVj5J7mWuQjCcdst2ICCf+Em88H09Txs4qCYv91Conh0hCwA4P
	 0lIQ/MAwdGG+g==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <d1a9b393d9929dc670dc6d5bfcc5cd43561d0be4.1774499536.git.daniel@makrotopia.org>
References: <cover.1774499536.git.daniel@makrotopia.org> <d1a9b393d9929dc670dc6d5bfcc5cd43561d0be4.1774499536.git.daniel@makrotopia.org>
Subject: Re: [PATCH v2 3/3] clk: mediatek: mt7988: use MUX_CLR_SET for gate-less muxes
From: Stephen Boyd <sboyd@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, Chun-Jie Chen <chun-jie.chen@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, Ikjoon Jang <ikjn@chromium.org>, Laura Nao <laura.nao@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, =?utf-8?q?N=C3=ADcolas?= F. R. A. Prado <nfraprado@collabora.com>, Sam Shih <sam.shih@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Date: Tue, 28 Apr 2026 19:06:09 -0700
Message-ID: <177742836924.5403.8826035930365293683@localhost.localdomain>
User-Agent: alot/0.12

Quoting Daniel Golle (2026-03-25 22:11:12)
> All 19 muxes in the infra_muxes[] array are pure mux selectors without
> a clock gate or update register, yet they were defined using
> MUX_GATE_CLR_SET_UPD with gate_shift =3D -1.
>=20
> This macro assigns mtk_mux_gate_clr_set_upd_ops, whose
> enable/disable/is_enabled callbacks perform BIT(gate_shift). Since
> gate_shift is stored as u8, the -1 truncates to 255, causing a
> shift-out-of-bounds at runtime:
>=20
> UBSAN: shift-out-of-bounds in drivers/clk/mediatek/clk-mux.c:76:8
> shift exponent 255 is too large for 64-bit type 'long unsigned int'
>=20
> UBSAN: shift-out-of-bounds in drivers/clk/mediatek/clk-mux.c:102:4
> shift exponent 255 is too large for 64-bit type 'long unsigned int'
>=20
> UBSAN: shift-out-of-bounds in drivers/clk/mediatek/clk-mux.c:122:16
> shift exponent 255 is too large for 64-bit type 'long unsigned int'
>=20
> Switch these definitions to MUX_CLR_SET, which uses
> mtk_mux_clr_set_upd_ops (no gate callbacks) and does not require
> callers to pass sentinel values for unused update register fields.
> The actual clock gating for these peripherals is handled by the
> separate GATE_INFRA* definitions further down.
>=20
> Fixes: 4b4719437d85f ("clk: mediatek: add drivers for MT7988 SoC")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---

Applied to clk-next
