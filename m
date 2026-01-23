Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B7B37BE94;
	Fri, 23 Jan 2026 01:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769132710; cv=none; b=fyFgqYB8kAz6wkYby9IA6n1v4obOKJPOz46xFR9MBWgCrTBuV9Li7C3X3fnoj922Q7d1rzdU6grmy/v9tD6PxQZKrbx1edXargREQ62f9y8CHd4IzOv5NctqLVfvTwIzXyxCoEXT6plDpkAsADAD9MchdLWGMFJgypxvBmPIztg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769132710; c=relaxed/simple;
	bh=kJpuTBCMY5uDHfr6gvM7scy0Tk2x9TA88Qz/tAbzNCk=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=FzRCIuV8wtwuihrdT9TcvRJjhAXwD6efwI/DQE9UtWNPlNVaOeYQ792RnVzA/6f4lhuy94WMuI/TFY36rQpPPMBi0xtsvsRe081+an6qgsU6s2c4UBP2UHbnwZK1Bg01NZWEHZGq8kff1S4udgebsyt7jnD5z2Qcek0Gn026CgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fyk/ZZZW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fyk/ZZZW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02BE2C116C6;
	Fri, 23 Jan 2026 01:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769132707;
	bh=kJpuTBCMY5uDHfr6gvM7scy0Tk2x9TA88Qz/tAbzNCk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Fyk/ZZZWIwUIDcTd3ClMks6Axr5hpQsNq9suw+391dlR/NAgAHG1HRIukWEpNt1YP
	 Pc9WvEQI/DP1Sb1oUYoW40/Fdv+ogmd/+9VlAkgqpzXN9Zn3LlbrhdQof1/DUT8h54
	 XO48fRmwhjeqG8GQ+ZaidxDSuNF0sIoNwYWDQ+qclfGqi2e7PuG2bG/XUW/musCtvt
	 krpSGG/1TgLD/UbNuXbaOqvpHQZeW5ndPzryplofZPzOPjbgTNJC3UUMjn4DWO3Urr
	 MVxscEhC4ePHQURdUZpVF8Nm488k1vzc5urro3khPGhpD/qcH8UcZz0TuItNh3qzLY
	 Q35UPRe9qgTqg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251215-mtk-pll-rpm-v3-5-5afb3191e869@collabora.com>
References: <20251215-mtk-pll-rpm-v3-0-5afb3191e869@collabora.com> <20251215-mtk-pll-rpm-v3-5-5afb3191e869@collabora.com>
Subject: Re: [PATCH RESEND v3 5/5] clk: mediatek: Add mfg_eb as parent to mt8196 mfgpll clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>, Laura Nao <laura.nao@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, =?utf-8?q?N=C3=ADcolas?= F. R. A. Prado <nfraprado@collabora.com>, Yassine Oudjana <y.oudjana@protonmail.com>
Date: Thu, 22 Jan 2026 18:45:05 -0700
Message-ID: <176913270525.4027.13703640991573141787@lazor>
User-Agent: alot/0.11

Quoting Nicolas Frattaroli (2025-12-15 03:24:02)
> All the MFGPLL require MFG_EB to be on for any operation on them, and
> they only tick when MFG_EB is on as well, therefore making this a
> parent-child relationship.
>=20
> This dependency wasn't clear during the initial upstreaming of these
> clock controllers, as it only made itself known when I could observe
> the effects of the clock by bringing up a different piece of hardware.
>=20
> Add a new PLL_PARENT_EN flag to mediatek's clk-pll.h, and check for it
> when initialising the pll to then translate it into the actual
> CLK_OPS_PARENT_ENABLE flag.
>=20
> Then add the mfg_eb parent to the mfgpll clocks, and set the new
> PLL_PARENT_EN flag.
>=20
> Fixes: 03dc02f8c7dc ("clk: mediatek: Add MT8196 mfg clock support")
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---

Applied to clk-next
