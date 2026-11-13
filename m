Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.24
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567066;
	b=GTKmPNzl8BD4xqQEI22ARkx4/Bfn5/egwlMfFIKyQptKQPioZ6YAC/ZGMbzvUbn2l2yY
	 /26ftnRzPXDgjklSkOpL+o3hywD6iqo8bSeDR56oZxecKutsYzmqqonAwQsDcyj1FRCvi
	 8d2gurNnYjc/Pu7NF8g5sO3G7R4iWg1lRhLnKY+oxTp/QswtbFcPHzylbiDtwMd6ycV4M
	 2pZS/yWrfJdcMjzJyZ3+6PWlsxb14zN4k0H/nnviQqquNy3u1a2VbzTt+ezKIH+crxnTX
	 FHf3XVPSFsc+UaFANRy1Nl7k/RxHfFkwWOCtCuMPerHb3Zh0MadOiKEJRC6CGEMLA1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567066;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:
	 Content-Type:X-Sendblock-Type:CMS-TYPE:X-CPGSPASS:cpgsPolicy:
	 X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=PM96lafS/rwv826v2LZCH6guF3z+x32g3ULBEqHU5jk=;
	b=sSOzGWRuBTdPkw1Y3J/w6HJutCryRzvRNUvJLjqpPdIdT2zT6sn6DQ9R+9wXTLC3ih8a
	 vnn5omhU5AFWwMQUhzaH1N+CDPjx9ylOatkn2/HZYIzTvvti0+A6+LHGq46+Dpl3hskEh
	 9zS5B5QBeVDsInZOpcDelLNMQymo9b7h7lryj7YclhBeLYT80hAd4Fm5NCfh04DaAwtkV
	 KqdPaXjK3bRvU+Bvphf6inq539kq7rAJvXl+IQVO852fdXNRK5bw6Bju+K8J35XaRY9pR
	 Z47twS/kTY5xfj0jqc7YQp5pVN2SdvK+fT89t9h8HoB1gziESIfL1puKMl1lN9dE9vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=YO3uMZ1L;
	arc=none smtp.remote-ip=203.254.224.24
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F363B606A888
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 10:51:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F363B606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=YO3uMZ1L
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20261113105102epoutp018aea36cde1e6f546eaeda81803783bc7~nlTwjEUDY0722207222epoutp01J
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 10:51:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20261113105102epoutp018aea36cde1e6f546eaeda81803783bc7~nlTwjEUDY0722207222epoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794567062;
	bh=PM96lafS/rwv826v2LZCH6guF3z+x32g3ULBEqHU5jk=;
	h=From:To:Cc:Subject:Date:References:From;
	b=YO3uMZ1LKk3HCzxl7OnAt/8z/BO8/f2rg9Jt8hOFV2XVXnVmp4r2s6E/PAd0mu9+h
	 r7KBVHYg2SMPx6FI+E/rDrXjPrmhOXbePwEynWxlhz9hvD90avkZZxPnHUGy5z2ipR
	 6I6f29rfTQ+0xnCg7mwoLvYESfqCoAUHialrK6NQ=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20261113105101epcas5p100e5c266cd26e579976a9f322a776c23~nlTv160Ni1299812998epcas5p1G;
	Fri, 13 Nov 2026 10:51:01 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.92]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4jQvF04Fmrz3hhT4; Fri, 13 Nov
	2026 10:51:00 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20261113104829epcas5p13695795bc337b89816b05eec610a0dba~nlRiak2-X0455004550epcas5p1i;
	Fri, 13 Nov 2026 10:48:29 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261113104826epsmtip2c360208ef38f5550884792f7a48e171a~nlRgCU2-52451424514epsmtip2-;
	Fri, 13 Nov 2026 10:48:26 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v3 00/14 RESEND] Add clock support for Exynos8855 SoC
Date: Fri, 13 Nov 2026 16:35:58 +0530
Message-Id: <20261113110612.3265841-1-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
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
X-CMS-MailID: 20261113104829epcas5p13695795bc337b89816b05eec610a0dba
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CPGSPASS: Y
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261113104829epcas5p13695795bc337b89816b05eec610a0dba
References: <CGME20261113104829epcas5p13695795bc337b89816b05eec610a0dba@epcas5p1.samsung.com>

This patch series adds clock support for below blocks
found in Exynos8855 SoC
TOP & PERIC
PERIS
HSI
USB
There are many other blocks, for which the support will be
added in a forthcoming patch series.
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
Chanegs in v3:
 - Addressed Sashiko review comments
 - Collected Reviewed-by tags
 - In patch#2, added samsung,sysreg property to the binding,
   somehow this was not cought by dt_binding_check
   Have kept reviewed-by of Krzysztof on this patch  
Changes in v2:
- Removed name duplicates login, as pointed by Krzysztof Kozlowski
-Corrected the sequence of binding, driver and DT entries
- Removed <linux/mod_devicetable.h>, as pointed by Uwe
- Added all the TOP clocks in single patch
- Organised the patches in the order: dt-bindings → clk-driver → dtsi
- Added Automatic Clock Gating, as suggested by Peter Griffin
-Since we are adding ACG, we need to add SYSREG, hence, added that
- Followed the name mangling strategy as mentioned in clk-gs101

Link to v2: https://lore.kernel.org/all/20261009120137.2801911-1-raghav.s@samsung.com/
Link to v1: https://lore.kernel.org/all/20260728121111.2077860-1-raghav.s@samsung.com/

Alim Akhtar (2):
  dt-bindings: soc: samsung: Exynos8855 SYSREG compatibles
  clk: samsung: clk-pll: Add support for pll_4313

Raghav Sharma (12):
  dt-bindings: clock: exynos8855: add top & peric clock definitions
  dt-bindings: clock: exynos8855: add peris clock definitions
  dt-bindings: clock: exynos8855: add hsi clock definitions
  dt-bindings: clock: exynos8855: add usb clock definitions
  clk: samsung: exynos8855: add block top and peric clock support
  clk: samsung: exynos8855: add block peris clock support
  clk: samsung: exynos8855: add block hsi clock support
  clk: samsung: exynos8855: add block usb clock support
  arm64: dts: exynos8855: add cmu_top & cmu_peric clock DT nodes
  arm64: dts: exynos8855: add cmu_peris clock DT nodes
  arm64: dts: exynos8855: add cmu_hsi clock DT nodes
  arm64: dts: exynos8855: add cmu_usb clock DT nodes

 .../clock/samsung,exynos8855-clock.yaml       |  196 +++
 .../soc/samsung/samsung,exynos-sysreg.yaml    |    8 +
 arch/arm64/boot/dts/exynos/exynos8855.dtsi    |   95 ++
 drivers/clk/samsung/Makefile                  |    1 +
 drivers/clk/samsung/clk-exynos8855.c          | 1378 +++++++++++++++++
 drivers/clk/samsung/clk-pll.c                 |   11 +-
 drivers/clk/samsung/clk-pll.h                 |    1 +
 .../dt-bindings/clock/samsung,exynos8855.h    |  233 +++
 8 files changed, 1922 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
 create mode 100644 drivers/clk/samsung/clk-exynos8855.c
 create mode 100644 include/dt-bindings/clock/samsung,exynos8855.h


base-commit: b810335a0699d1810683796b0e3ffe8827ddfe6c
-- 
2.34.1

