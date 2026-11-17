Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911865;
	b=LGw+p6GJGv8g2pDdVyLZjT0Lh6rh3bSVcThuQkNDdBGdZqEaYfqVN/5NEV7klqzc2j5o
	 y4WzEiYuYlOXBXk0AY7wKW5YIhAK7uT+beQi+Qlndo6fpCrygBe5xfWeUEOuKPaB8OMUs
	 bPSdR4Qac6HYlWILp4TZaih8irWnmpVvvpwYC1HTnWDutajBsVShsvRq9nZlBlU7kDcgP
	 4+pWx/DaJgdCHZmoSKcos1wTIwIyrHcywDhqjZBQbb8VDTVzdpFr0ZjjfSXLDXY03Mh1N
	 FvZAJu53cVGuu5ymy4RGaREKwg2oQYeXHDvczC6LDVSOv/CuRNPm0R8/thFB6g4Asgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911865;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=jVcJXSf2MKjI+XvP6Hn1S2+V8POAcXEPdAsir9JtGzU=;
	b=Dw760HQd0LgsOMqYNDcJFpLtrZ135Q9OdsdB2bOzRfso+sKn2jFZcX2GULK54Ogi7YxQ
	 Pr3N1tn4G/4M3JJmLL/StDRlb/7AidFPNGZ+n6spzBqvbui+gGLKcXzyduuSk74Ij0av7
	 SytqUjd6UCKZyg8QeVUMWSxg0nslGceWtydbrLus8+yaIu8xNFdRis8O5yUxFNcgDwVWB
	 tLUTbCklFD8q+wrzO7zF0HxcXEeGxtRIgPiW32PglVVZCkU5xZGqhd5FOoSZDU8l8vXPj
	 KfACC3FiI0bPxrJP4Nma2KlJ6CVtAmsW6ny5/WpZqraPkyoZ8v2qiElblP4UEmv3LGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=EMGub12C;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CE3606A896;
	Tue, 17 Nov 2026 10:37:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3CE3606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=EMGub12C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794911863;
	bh=c8zHU6Ay0PGaYY5srsxx8EIZFQ2I29/SDUzcQnfyFSs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EMGub12CyzQOg0T0adgQFcbziZbjSk2tjFMwN+5bT11Hta6j1/P45Tefpp1cgZDJg
	 Yt0NwYAYCreb5CozfAlbaJPhqRqu/CetATSvK+4yJjI/YVRF2qlAo7vmBI0FH+VDIr
	 LxVMN/Q2lOwRZtjeZ2zY8sgkrkjIz6IQNPZnvA8HnbMLFpOXAMjFKcf7Nqoeb1sEiG
	 ebGwkt4R16APDRXkr1F3JGLtFThBY90l9CpyWtTve8+UbvfehtR7o9bDp0OeLeTGlv
	 8jF2zn0EIOZy9Ng70jJpKXm1l3wtvxLULQcPbX/SZtK/0DGI38BuUZ3rzg4fA7GqPT
	 K93Ujy2/iJEoQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3F35317E0A27;
	Tue, 17 Nov 2026 11:37:42 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	zoan37 <agentzoan@gmail.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Irving-CH Lin <irving-ch.lin@mediatek.com>,
	kernel@collabora.com,
	linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Miles Chen <miles.chen@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
Subject: Re: (subset) [PATCH v2 00/35] clk: mediatek: Migrate to common probe/remove helpers and fix memory leaks
Date: Tue, 17 Nov 2026 11:37:30 +0100
Message-ID: <179491184093.148303.14975208520347147103.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
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

On Wed, 14 Oct 2026 00:16:59 +0900, Akari Tsuyukusa wrote:
> This series migrates most MediaTek clock drivers to the common
> probe/remove helpers provided by the MTK clock framework.
> 
> Key changes:
> - Fix memory leaks on module removal caused by missing
>   platform_set_drvdata() calls (patches 1-6).
> - Add missing MODULE_DEVICE_TABLE() (patches 7, 8).
> - Add missing support for cpumux, PLL, FHCTL, and child-device
>   population to the common helpers (patches 12-15).
> - Convert all compatible clock drivers to use struct mtk_clk_desc
>   and mtk_clk_simple_probe/remove (patches 16-35).
> 
> [...]

Applied to v7.4-next/clk, thanks!

[01/35] clk: mediatek: mt2712: Fix memory leak on module removal
        commit: 3c764a2e704fad616a96bcba09290fcd4344caeb
[02/35] clk: mediatek: mt6795: Fix memory leak on module removal
        commit: c0c7b6a150f9127b010ab1064fc2bb4fde9a2538
[03/35] clk: mediatek: mt7622: Fix memory leak on module removal
        commit: 0c763c94049c6ccf22d1e19e13b9586e88babc63
[04/35] clk: mediatek: mt8135: Fix memory leak on module removal
        commit: df1bb20a19b660dddcf164adc69447bdbf423b9d
[05/35] clk: mediatek: mt8173: Fix memory leak on module removal
        commit: a76c9a023f985113e1439abe94b436d781097a06
[06/35] clk: mediatek: mt8192: Fix memory leak on module removal
        commit: e2d93b034b987071026b7fd6380e3c191263fb16
[07/35] clk: mediatek: mt6735: Add missing MODULE_DEVICE_TABLE()
        commit: cae5d87256ca44f79a81bb2adf5bedd5e7e0aaf5
[08/35] clk: mediatek: mt7988-apmixed: Add missing MODULE_DEVICE_TABLE()
        commit: 6b87bb39856083653b363126d0cb0f552a883a82
[09/35] clk: mediatek: Fix index in composite clock unwind path
        commit: e322430014a86ebd0d810ea366ddf8cb6d65fa83
[10/35] clk: mediatek: Fix memory leak in mtk_clk_register_gate()
        commit: cbc999dfd9192d5ac99d142d2e6c201ec6502971
[11/35] clk: mediatek: return 0 instead of r in __mtk_clk_simple_probe()
        commit: c68286724520481fb79a75ee5e54121d868f3fd7
[12/35] clk: mediatek: Add cpumux support to common probe/remove helpers
        commit: 4407def71fe314c81079f031c45ebb0ed7e768c1
[13/35] clk: mediatek: Add PLL support to common probe/remove helpers
        commit: 5ca9a52841c0a0cc534ddc6189f27f287076c1b0
[14/35] clk: mediatek: Add child-device population to probe/remove helpers
        commit: ad798877ae16c911d45ed7dc0b7584d5f9d5b2e8
[16/35] clk: mediatek: mt2701: Switch to common probe/remove helpers
        commit: 2bce22ab89e4b73db014138d6ed1bced8c337d46
[17/35] clk: mediatek: mt2712-apmixedsys: Switch to common probe/remove helpers
        commit: a01da26450fc04f3dc6c54c3290745a20adb4b72
[18/35] clk: mediatek: mt6735-apmixedsys: Switch to common probe/remove helpers
        commit: ec06ab79970223c88ade1f75a7e65d2b01f3ab8b
[19/35] clk: mediatek: mt6779: Switch to common probe/remove helpers
        commit: ad1a05ea482df00a12139d49e7af679036959032
[20/35] clk: mediatek: mt6795: Switch to common probe/remove helpers
        commit: 6ee8ec8711a10d7a4a0aa8b673911d9b0e68f2f9
[21/35] clk: mediatek: mt6797: Switch to common probe/remove helpers
        commit: 51f3e418b11779808d8047304fe5256af221a882
[22/35] clk: mediatek: mt7622: Switch to common probe/remove helpers
        commit: 1d2329640c0aea1941851dda592c80d8b6418147
[23/35] clk: mediatek: mt7981-apmixed: Switch to common probe/remove helpers
        commit: cd6f50ee8a20a30c48d583863cf5af8850ddd6fa
[24/35] clk: mediatek: mt7986-apmixed: Switch to common probe/remove helpers
        commit: 5d58e30e027b634e75163cf76cad3f0789aee349
[25/35] clk: mediatek: mt7988-apmixed: Switch to common probe/remove helpers
        commit: 16cf129487241358c5e35a90d3536b857cf40ffd
[26/35] clk: mediatek: mt8135-apmixedsys: Switch to common probe/remove helpers
        commit: 56bc91b655e632b9c38e258ab1b892deeb416685
[27/35] clk: mediatek: mt8167-apmixedsys: Switch to common probe/remove helpers
        commit: d43b35038f424bc6c8cd31f735553dafc4899594
[28/35] clk: mediatek: mt8173-infracfg: Switch to common probe/remove helpers
        commit: 69560f7442c644d52a40c1cd468fc0bb6693af91
[29/35] clk: mediatek: mt8183: Switch to common probe/remove helpers
        commit: 684dd2aed24635d6af7ef261233221525d0479c8
[31/35] clk: mediatek: mt8188-apmixedsys: Switch to common probe/remove helpers
        commit: 25581c463c2bd26c31b13ac27645d65b7a0e5bc9
[35/35] clk: mediatek: mt8516-apmixedsys: Switch to common probe/remove helpers
        commit: 4d756f808ba52310a9c36982096a21800f848a47

Cheers,
Angelo

