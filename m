Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911868;
	b=k8sybZZ+GNrH91LcSZ5Trhc86iIXtRRiGdz4P24hwvJQkCEJ/+Kb1VuPisJH31TFcaai
	 6eMbcf849RUZ5xNtkpNr1KrdTDASIC9MKerp1H3tmIw4931cpe+u62qrPIgaSRcK2PtMZ
	 XPYbzkwwQGpKrzChG8ZVIOP+Uewq918dY1Ywq3ccbQujwvsQMIIdryrAtMtYBm6pdWxcI
	 GfTSzy/s1AgsZuf+cLGcY2ZxTgHUyaMa1l0hSqdMq0d7sSP5/SkIDLDAdF8ufUAF0IGdg
	 zCCnINy5xVxDtQbnCIcoqymM36+44DhjjxSuj3xtTVFQcQdesnBUu1cJh9WqikadYzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911868;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=43e2SNcVBWzb1UbgyRe/OhyamtAg+Km+Wi6/wDg0QSQ=;
	b=487ltK30gCEJIhIRuXh6532o5/8CRgUH51mYi/1zSaQp8k+yRGoNdptJb2M/u7doKa19
	 TKrW1n/nSPntOfq6Pfd+q6xxdQ4W0lP8lQtv1XLfirVahCyDGgyZjZU5+XDSiNPD/7s0o
	 tP2ZOVpbrzS8kH0msm8QXyjN81+pUiZw+u0UAKHoZM8yyJl/LdXkS62TnXNLoYNfCdFGo
	 p/VGArMcML7lpYCd3b3njkMcKhbbVNMBVy5xdvB4u6GWdRfuRu5JG5dHOoA0ktATOXRSm
	 fRR1AIif6Ph7T2ok5CSgLKQyMa+lCeOFQwrmo15HLQ+CEfbav/s/DQyMAOtIgv3yrVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=lWzhVbeX;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF89606A8BA;
	Tue, 17 Nov 2026 10:37:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CF89606A8BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=lWzhVbeX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794911866;
	bh=BPi/q9qq8U5jbtOV/H4x+dghN6V5mYBj2nUNtLxFRAg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lWzhVbeXhrHpZSfg1vhi0IYmf/uKR95T7TPw6Zak3JApn5n99ftHqDojn+nDc2B9B
	 z208WnI1LuuPqfcF+xLklrPJppJvQdgKBzs++nvv7ncNEuo+7ckHp55uUtTbIaj8EL
	 pFhuDgRkcDNFtKV2tD34/k5ZmLSm0orzrIV1//2hUQXdjRyqr9Ft2FFpw4xb9L4Id6
	 5m2Ou3eXGLXj35SZD9krDppHxm8O5WhsAsL0x0sA6OhU6k5JcWa3JcpVN5GlGpLYrO
	 yxB/Cn549c5Vz12LO91+twaA9J3MQ1+FYxo2onOt1LbkP89qxinRSafmslzcidzGXR
	 vNezYw/UTo1SA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5680A17E0EF0;
	Tue, 17 Nov 2026 11:37:45 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	zoan37 <agentzoan@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Ryan Brue <ryanbrue.dev@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Irving-CH Lin <irving-ch.lin@mediatek.com>,
	kernel@collabora.com,
	linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Brian Masney <bmasney@redhat.com>
Subject: Re: [PATCH v2] clk: mediatek: mt8173-mfgtop: do not use the clk API from power_on
Date: Tue, 17 Nov 2026 11:37:33 +0100
Message-ID: <179491184093.148303.15758957296593434573.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913-mfgtop-no-clk-api-power-on-v2-1-b84771a3d5bd@gmail.com>
References: <20260913-mfgtop-no-clk-api-power-on-v2-1-b84771a3d5bd@gmail.com>
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

On Sun, 13 Sep 2026 16:47:53 -0500, Ryan Brue wrote:
> clk_mt8173_mfgtop_power_on() calls clk_prepare_enable() on the mfg_26m gate
> that this same driver provides. That is a layering inversion which cannot
> work: clk_core_prepare() calls clk_pm_runtime_get() on the clock provider
> -- this driver's own device -- and genpd power transitions run at _noirq
> time, where runtime PM is disabled and pm_runtime_resume_and_get() returns
> -EACCES.
> 
> [...]

Applied to v7.4-next/clk, thanks!

[1/1] clk: mediatek: mt8173-mfgtop: do not use the clk API from power_on
      commit: 8f1cb3fc8cae44baffef31d73c772dc77e4a9061

Cheers,
Angelo

