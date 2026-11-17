Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911867;
	b=JqQ//z3mTpIzIqL9PHCL4Sx+TLI3CZ5X/WrX4tfwYYMd+BH77vj7hbgewNCyBqf38otm
	 /tpLvQ/nv7pGJ1Vt40DPkpNw8i0KUpRJyzzKt/lmbtPvTO2Xg/yQi/qjPLWiNvPQdXKBK
	 jo6ZmkvBOR1U1Sto7mtp7nHehcfaioBi3kifQpL2hZ7yL67Lj/CuV2lIrd1xtSUx6GuvA
	 iMN31XrrsoVFGd5jVqWFkNT6Ndy8nT+NybTrv7SISPL/MLJwyI5iLfApCi6FXd3LO+F1D
	 Pj4Z39altTLkLi7RwxnJvHH78GaUUeTVlz82/HapUldd4sMUdEhbCbEBmrHfAhSvRug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911867;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=QoNY41bbnzpn0ZzzcjjJENFeSjOUK9Myq2AtLJ6qHJY=;
	b=s5x62RqbJJvnoMWBjl9MSUIZ8dPEnRJi7IL+IDeWWRla/wn9O8BhxSFMOxjRl3EgOf3Y
	 6Z5es5x/L+WGHgcvAXw6nZ/lKJVqBbajl6fpH6H9qkgzlJMawBNO0ZblfmtEwWC9uBrjh
	 6kOSv1odugwg5AK6NUhHsncfw/edeF/VAcGqjeJy2lird286cFtYlxVFQlOLqpj9sFmLu
	 sq8zVe+51kuZzwtgKIVhvS5OkjX+5p3KTUkSdQtwwsqBptsJemWFqBkuU9eFQGLOeIJPP
	 pnI51OLJBnGFgpvxoc/zDtpWh3zjIeqayoDDlWSSjdbVF2tWixYkcHH12RX86nKlYwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=HmF2mHi7;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A3E606A8A5;
	Tue, 17 Nov 2026 10:37:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9A3E606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=HmF2mHi7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794911864;
	bh=zjAl5O9mbx/ZXUiLWzwrqKnIBURPVqzRQZrm4sbAV8s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HmF2mHi7l0rRTsjxgk+X59KO7U/H0Cc6yprm0z2W3EwtxW5evwKVMndPQY+WQuXG/
	 rbrmx8TlQ5u8Sv7sareD7mgvDIdadtqDavWYpYkVEtcf+zFQ1bfNyoYJzRPDpjDVe2
	 3BBKcK5mmngHeosuE1EAbsR/ccq/A8Ien7gTfxEwnSi0SlkDVBwPO1kz1rtBZZ4jBx
	 JuUcO4dGKrpCvEjgYdvBlwbv/MBRBiQ+pO02bA8J8jNZlMtTKz47hj4IyR5Wr5C7Ch
	 EFpDyU0jNzOfWkR8P1XCqBtH5jykszAklLTYhGfuyV9+57hDbfgECiQ7ebWz1Y/RmW
	 8ZFS9LJnryZAg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8985E17E0BCC;
	Tue, 17 Nov 2026 11:37:43 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	zoan37 <agentzoan@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Irving-CH Lin <irving-ch.lin@mediatek.com>,
	kernel@collabora.com,
	linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Brian Masney <bmasney@redhat.com>
Subject: Re: [PATCH v6 00/27] MT8189: Add support for system and base clock controllers
Date: Tue, 17 Nov 2026 11:37:31 +0100
Message-ID: <179491184090.148303.2331159339305939434.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904-mt8189-clocks-system-base-v6-0-5df247f56938@collabora.com>
References: <20260904-mt8189-clocks-system-base-v6-0-5df247f56938@collabora.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 04 Sep 2026 17:58:11 +0200, Louis-Alexis Eyraud wrote:
> This series is a continuation by AngeloGioacchino Del Regno and I of a
> previous series ([1]), that adds the clock controller support for
> the Mediatek MT8189 SoC and its variants (MT8371, MT8391).
> 
> The first major changes is the split of the series in two:
> - one for all basic clock controllers including system ones (this
> series)
> - one for the multimedia and graphics related clock controllers (to be
> send in the future)
> 
> [...]

Applied to v7.4-next/clk, thanks!

[01/27] dt-bindings: clock: mediatek: Make '#clock-cells' required for MT8186
        commit: 51928be3081a25842d66501b085dd6ee00d2fe0d
[02/27] dt-bindings: clock: mediatek: Make '#clock-cells' required for MT8192
        commit: 1a2b86804febe4870956297188e8ccfa079f4d22
[03/27] dt-bindings: clock: mediatek: Make '#clock-cells' required for MT8195
        commit: cb47a7976bb5e5e4a7df1df71d221b932af7b2b8
[04/27] dt-bindings: clock: mediatek: reorder MT8186 compatibles
        commit: 3b372542144aa2e6cb6925e6d8039abfbd9682a7
[05/27] dt-bindings: clock: mediatek: regroup MT8188 dt-bindings into MT8186
        commit: 09b156611b0a8fc480dc894f04a475c0c4313a98
[06/27] dt-bindings: clock: mediatek: regroup MT8192 dt-bindings into MT8186
        commit: 833dc5fe7832ff0d8e8935cafd09d530055d8126
[07/27] dt-bindings: clock: mediatek: regroup MT8195 dt-bindings into MT8186
        commit: dc3a6ae2eeab954820701713dc7d4b1556df7dc4
[08/27] dt-bindings: clock: mediatek: Add MT8189 system/base clocks and resets
        commit: 294637d60bc0dff970b51f32cf0a5d46bede0652
[09/27] clk: mediatek: Harmonize mtk_pll_fenc related symbol names
        commit: e998b6e82a481b204c097a6f24bf4d0523041ab1
[10/27] clk: mediatek: pll: Add BAR reset register offsets
        commit: 696eb5f8af066bd43dc2cea7c1557c39a9346f44
[11/27] clk: mediatek: pll: Factorise pll power on/off sequences
        commit: efa27fb6334209382fba265d1a0874fd35a5f7d6
[12/27] clk: mediatek: pll: Add PLL stabilization delay definition
        commit: b7285135ac89017d442941145f020eaa4664afef
[13/27] clk: mediatek: pll: Add ops for PLLs using set/clr regs
        commit: 7cbf375f78def36afc6a737c987e900c0b59a0ed
[14/27] clk: mediatek: pllfh: Add configurable clock ops to mtk_pllfh_data
        commit: 4587b6170ea5f091a456ac7613a26df798722b09
[15/27] clk: mediatek: pllfh: Add ops for PLLs using set/clr regs
        commit: 2def5260f4be10f60510a6a133368d52f2eb9ba8
[16/27] clk: mediatek: Move fhctl_parse_dt call into mtk_clk_register_pllfhs
        commit: a3ef44f33667dcef6a4487ed74fbafe2dd65cf37
[17/27] clk: mediatek: pllfh: clear state data in mtk_clk_cleanup_pllfhs
        commit: 6fe7aa32b1063c2c7c61261cdd5f378facae2e89
[18/27] clk: mediatek: Add MT8189 apmixedsys clock support
        commit: 874ab1eba81e795b8ae8bf26a5410cf80f3eab83
[19/27] clk: mediatek: Add MT8189 topckgen clock support
        commit: ad50e6912ab54da07142cb805283803f94f03be0
[20/27] clk: mediatek: Add MT8189 vlpckgen clock support
        commit: 9f5133b5d9f4fd18ec7d623b45614549f3dbae41
[21/27] clk: mediatek: Add MT8189 vlpcfg clock support
        commit: 67ef8994e541421b38d848cf3da88b75f241a7d6
[22/27] clk: mediatek: Add MT8189 bus clock support
        commit: ef1c46bbb81c4bcee613f9ca4ee8e4fcf4483e04
[23/27] clk: mediatek: Add MT8189 dbgao clock support
        commit: 4d2ff5667bf25203d8e898ff7931e7aaa1653ee5
[24/27] clk: mediatek: Add MT8189 dvfsrc clock support
        commit: 8051bf8c06a1b8224345637fe8656dc2abf97e94
[25/27] clk: mediatek: Add MT8189 i2c clock support
        commit: ab4fef2b58b3db345b9aadf6c806ae32ba15d2cf
[26/27] clk: mediatek: Add MT8189 scp clock support
        commit: e87051328cf23217e04236ceb6ee2ae72f6ddc45
[27/27] clk: mediatek: Add MT8189 ufs clock support
        commit: 633757ec0147497a11309e0bd877396cac5e64e1

Cheers,
Angelo

