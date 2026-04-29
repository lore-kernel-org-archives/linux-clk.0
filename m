Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9E5390986;
	Wed, 29 Apr 2026 03:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777434423; cv=none; b=ayuHX+bO0Rneoq+UVmpZmjVkxLoBJz/x9GfeVsWdMbB/4JEEHiTVGAmevhU+f8JLzWZp5+to3RgQ27pJbiGOREdlKDL4RMJN+vBUxX2ID0y1JZoGyGIPLKAGW5akcXFc3HoV5qGTISROOITBqqGypUFmucaootb5WMzX3jdYEUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777434423; c=relaxed/simple;
	bh=2UxmJs9YUkaY+OCHXGGOYjeYOBIbUD4lZnOC2jEWgzw=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:To:
	 Date:Message-ID; b=OzHJY8Z9oKVpjiPCt4J2rW0PBFNEy7cWvEnZR3NRrTgC5hHzyQys6I8OSYBi71WQsOd8ZCVwa2bVl4eMX2UopMOrSTZz9BaXWy0cUlYVSugsPeVR2opfaQlGT7b/LXR97c0MbpE/uBq+VVVP8kc/K2BFrKFxMgIlvrQMhafTuMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dPBeAraa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dPBeAraa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA830C19425;
	Wed, 29 Apr 2026 03:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777434422;
	bh=2UxmJs9YUkaY+OCHXGGOYjeYOBIbUD4lZnOC2jEWgzw=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=dPBeAraaZcakNTGhkd9j17NvkoydxTRevkgR7lGClIzQstr/y3wDVZCX/CYTDfsoC
	 B2t5WZ94k9dX7dawUpyU69VX5yIMELMuyhQSRaPSvna4T9cYmaLFEKk9tCgi/LaMpH
	 J8nQnslyrntITtCFJ7swqh5Y5ZtaI22BdZoS03hy2OTDMfGomM2Z3t5E8+2CMq6cF0
	 nULCYD2j+0/F3kTuMN3PvRCRodVUlnD7p+mjkkhi/H6RFOUxauZe7CUxBPB59ONDj0
	 NF9UeYhJAcqOpj4vWIS/1IJWj7yb36mexSxUPUjHByXZUHW6JNx/VNhEUC+gfos9H1
	 iasd+bvm9BQLA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <9667e8a7a0757f7fb9d6bb3fca105df97afd007b.1774499536.git.daniel@makrotopia.org>
References: <cover.1774499536.git.daniel@makrotopia.org> <9667e8a7a0757f7fb9d6bb3fca105df97afd007b.1774499536.git.daniel@makrotopia.org>
Subject: Re: [PATCH v2 2/3] clk: mediatek: mt8192: use MUX_CLR_SET
From: Stephen Boyd <sboyd@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, Chun-Jie Chen <chun-jie.chen@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, Ikjoon Jang <ikjn@chromium.org>, Laura Nao <laura.nao@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, =?utf-8?q?N=C3=ADcolas?= F. R. A. Prado <nfraprado@collabora.com>, Sam Shih <sam.shih@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Date: Tue, 28 Apr 2026 19:06:11 -0700
Message-ID: <177742837171.5403.15766311984942947032@localhost.localdomain>
User-Agent: alot/0.12

Quoting Daniel Golle (2026-03-25 22:10:47)
> The mfg_pll_sel mux has neither a clock gate nor an update register,
> and upd_ofs is stored as u32, so the -1 truncates to 0xFFFFFFFF.
>=20
> While upd_shift being -1 (as s8) prevents the update path from
> executing at runtime, the bogus upd_ofs value is still stored in the
> struct.
>=20
> Use MUX_CLR_SET to avoid passing sentinel values to wrongly-typed
> fields.
>=20
> Fixes: 710573dee31b4 ("clk: mediatek: Add MT8192 basic clocks support")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---

Applied to clk-next
