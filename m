Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793278291;
	b=uK86jUJzKiXZK1FZHD5/XYD2td1KjvenEjIrmhhAo/+mVPrlQtbq78rjZ/KpcSpMUdMr
	 1JGuwnnKBtrzznsRccm3D1FnzsluCXDmgxHtV5Atj1b6KECha3GofkbXDLGN67OLsvqg3
	 V+wfW7CuXQNRIuMHNYmbx4AFlHjVVMovdCOmuHjtFgGWbNjoJTheb1AgXPuj082Faq3W0
	 x7LoeCEm1tj2L/rnQYqdZXCwWeWj+VlABS04/eVGWv5ukSIrWjVn5+p9WHL80i5IM84EM
	 FegC6/ZdJ+hrObGGlWbMy7FHObeF6BrxI/2EXXZxCGkZODBmC4x2rGQd03xJgDAE4sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793278291;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=0kHgxGMUvPTVTYGHDYlisAKuFkYZIxd+qzGaqzzNgio=;
	b=sGDTpIVQg4rdnhjfD/z0Oi04TS9hyptAcbafMCw9DQQnf25AFd1VzZMnhnYsRS2Fs5Ut
	 pJ6siTkoFo9y7BH8AlKgzRPLfN+rBl4LU/P9wv1qY+JpvZo3QS+f1S9r0L2MZBhGKoTwb
	 LUoknfYlPkmWykJQAJKaOvncfQRuGyf5hfNPY6zJIEJRLCZYcvlEuDCm9e22sdGmrzS8A
	 XcB/6DxqrAEdatrO6hTTO8GVKYbuGfADzklG0ZnDGfSGgtDDFfiExGHabN6isdIJwgUju
	 hgEhFrSbHlzaYlAeGxQDA5Vi0vXt94Lpj0inYUWt+G7Pao7s/FG/ZvaM7mL7JIUvOmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=mqH94QwC;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3BD606A31C
	for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 12:51:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C3BD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=mqH94QwC
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261029125128euoutp01d6fd25bdc9fe68c57ec5064afed4484f~jARoWgaNf1974619746euoutp013
	for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 12:51:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261029125128euoutp01d6fd25bdc9fe68c57ec5064afed4484f~jARoWgaNf1974619746euoutp013
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793278288;
	bh=0kHgxGMUvPTVTYGHDYlisAKuFkYZIxd+qzGaqzzNgio=;
	h=From:To:Cc:Subject:Date:References:From;
	b=mqH94QwCy6hmdt52M1fpFXBGmyZh2fE+d43sFMmCgwYZgZvEIXTL2uMUnrMMjDms8
	 dASHmaMVzGMFMGEFPpio4AP+inCtpymC1+H7DIW/JxoStiBsUbMOcwz7ExhBBwisw0
	 gXG5t4W6Mme5Fggvz6m6z0xKWVBW94PzTJHcBO/E=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261029125127eucas1p2f42d6d880a25119f8976bfe239b60d14~jARoBrMtE2295222952eucas1p2M;
	Thu, 29 Oct 2026 12:51:27 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261029125127eusmtip1167bf345e58509220a9cf38aecee19d5~jARneLswW2306023060eusmtip15;
	Thu, 29 Oct 2026 12:51:27 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi
	<cw00.choi@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, Alim
	Akhtar <alim.akhtar@samsung.com>, Stephen Boyd <sboyd@kernel.org>, Brian
	Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>,
	Henrik Grimler <henrik@grimler.se>
Subject: [PATCH v2 0/3] clk: samsung: fix probe-ordering races in
 exynos5-subcmu
Date: Thu, 29 Oct 2026 13:51:13 +0100
Message-ID: <20261029125118.3191455-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261029125127eucas1p2f42d6d880a25119f8976bfe239b60d14
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261029125127eucas1p2f42d6d880a25119f8976bfe239b60d14
X-EPHeader: CA
X-CMS-RootMailID: 20261029125127eucas1p2f42d6d880a25119f8976bfe239b60d14
References: <CGME20261029125127eucas1p2f42d6d880a25119f8976bfe239b60d14@eucas1p2.samsung.com>

This series fixes a group of related issues around power-domain
availability and probe ordering on Exynos5 platforms (observed on
Exynos5800, e.g. Odroid XU3/XU4), which can leave clock muxes stuck on
the oscillator instead of their intended PLL parent.

The issue was analyzed and patches were prepared with LLM assistance.
The whole patchset was tested on the real Odroid XU3, XU4 and Chromebook
Peach-Pit and Peach-Pi boards.

Best regards
Marek Szyprowski, PhD
Samsung R&D Institute Poland


Changelog:

v2:
- added exynos-audss-clk driver fix, as the exynos5-subcmu change exposed
  an issue in it
- removed __init annotations in exynos5-subcmu to make the driver deferred
  probe safe
- grouped all patches into one patchset

v1:
https://lore.kernel.org/all/20261015115008.600082-1-m.szyprowski@samsung.com/
https://lore.kernel.org/all/20261013111840.3645724-1-m.szyprowski@samsung.com/


Patch summary:

Marek Szyprowski (3):
  clk: samsung: exynos-audss: Propagate -EPROBE_DEFER from input clocks
  clk: samsung: exynos5-subcmu: Use pm_runtime_get_sync() during probe
  clk: samsung: exynos5-subcmu: Defer probe until power domains are
    available

 drivers/clk/samsung/clk-exynos-audss.c   | 33 +++++++++++++++++-------
 drivers/clk/samsung/clk-exynos5-subcmu.c | 29 ++++++++++++++++-----
 2 files changed, 46 insertions(+), 16 deletions(-)

-- 
2.43.0

