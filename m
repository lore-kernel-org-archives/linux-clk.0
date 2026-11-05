Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793880687;
	b=ffAnEopw2L8iBueGYD93xzEJ0r3+SRH+wAYGp3rhIG2gaOtWa/mAdG9y23recgM9ePWh
	 HWjWG4tSRSj5GvlibJllJzL9JPZYvti59yH/CbZKVptdZfayQaTy/l1UwtEAC1XkUVHK8
	 0WAjOyRIirnhzsJ2AJOt53bbimCHs1taVutrtjIgK5IEkuf2XNaeMELt0JEJ4HN24/Pxw
	 xswe1uBN/ud19zmcouW+XCfOiyFsYgwIR+38u73EfOCuGY9PYWyp2l1nVKCSYE56ZY/7e
	 nVr4ByLRNL/HYAMDizH4DFcHCshNgzu+WTXl8Akh3NxXa+tulE8oD0rwSQ/UNIOJ6Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880687;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oU3a7xXmURYifUlGxPa33qdnIX73vZnsxZLBFb+NsI8=;
	b=KTDNIeSSX1KGiSgEtCT0ul5Moaf+pgKS8jB3Qj0wS+XUt1tvhPG68YFtH/L/M/viwTze
	 7UCBDt7YL62wSveq1ETHaiTmuF5284ynT80cpwWDl/N58ndqTdOPy8txoXGWV++lqgKST
	 oxA5c0uwd5wKY4gxccJC15DMHQ7BmussFJ5PIBNkcUHAlEye0ii3FJfJfywXiIJoQYewN
	 2hvvFxcCIxdhsXhIcbKWZ6mKoUNUD9rfS/o5tGJtkF+Yw8/7T4nx1gJyA8GrSgt+NoAT9
	 GOQ1QZ8roZI9yl9QBZ8yQZ17QVQy38rs2a+jul5Bnc5JwiNmpYfkSRYWuldeel3SLkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="VEn26V/p";
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45AC606D805
	for <linux-clk@vger.kernel.org>; Thu,  5 Nov 2026 12:11:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B45AC606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VEn26V/p
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e00eee27dso1015182f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 05 Nov 2026 04:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793880685; x=1794485485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oU3a7xXmURYifUlGxPa33qdnIX73vZnsxZLBFb+NsI8=;
        b=VEn26V/p8NYKFjB6iovnRMzQb5XBCGJfH1f7fzdCf1fyjdKd+EI/7GGp9Q2IluxPS9
         XjquYP1XiVth52a9Xe3nW2R8vZ87a/Mm1bgbEd7a0P0WlqgRNKOLdFSgnC9qm6iNS5Hx
         XfRM6cf3gdCv6DLJJ4Pwbd008COZ5BoH03HTts0GjLBxequGn4OnLaYkE4vW+jBn+cs9
         hrWYU8NkgMZo6NUbu8FhM2Uo8F2hOjksf23LsDuj9q9WdRgukZ3qbWEby/SbVXNcNzgL
         ud5zTlb6+hxsDrKj0nQymAPSplNGD27T/w2x+bfPG/Eg61dpkuAmqJ3ggUzDMNX8i3H8
         Oj6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793880685; x=1794485485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oU3a7xXmURYifUlGxPa33qdnIX73vZnsxZLBFb+NsI8=;
        b=zpPof0LV2Ln+ayZvGLujKrin7Wixfin8GggmPdWcI1YNE4JD8tlpUhMvillsTnSp9a
         uKCgW5Zo86XYFlYZ5cNBQLI7fyTpLqYW4MUDb1+AXbF1R0cXJhABpRoMf15SbSGwZEDo
         SN/F/VELR/XSx+AmmL7i5qFp8HDVk/yMZWm47G3Mjkhe8CrjsWUE/FeZFw03jlM1hyhI
         sJ+6tXzIWHw55MGTIdR2oTJ+Lunqf5KMZFq9FUicRk49irwKLX/JZJn8O4q8/qJrfJXF
         SEDrhPbQgWG5Eldlycn0jjXomslKiAzamXrq1m3pcaX47M63mxzf0CokqAHnxCbSAz6I
         eh1w==
X-Forwarded-Encrypted: i=1; AKwUvBzU/US5Nghw0vd/B1PsG2Sbih4SaGOPQR3LHIO04HkeKQU/puxOERxbysdAGh5W/tJDl1Mht6HG4rQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8w3BmzuYW3ZR71YN0VfVLSDJC8JjS9gzo1tc1p9dVDT2oOwwEr
	87W4R8Ef6uuE9eV6X9SCAzrGGQ2EBQvYa9PRJIvOcCV3BBhRY/6rkdlR
X-Gm-Gg: AYBFou3Gde/deETk268Pa9WGApBDjkxPy/XIzYG8nZI31Tf4i0mRRm3b38Cyq/NbFzI
	aAiM+2PTCXxoMttBCa9o9cUn964dlFcerjnJc9Vxb3OiQHE5wbt+6KrDgRoNUOY9RO91BTgw/xd
	1dxmcdifp6TzAzhTjVBM5vlCeu9EaoG7AIPucjJUFPaOT9ORgOHK32b8GLa0fHUywjAih1PyKHo
	8cgHL6rIolwmaxBlq3Y0LJyECJdTZzy3kGxh2B2rBeVJHb4ATD7cw0sis1KgLlyArWNKLfiMFq2
	dBWCVSwu0a+18eeyElAvU2DfJ1T9UFI0vKbOIMgUxmq+fgXi8RNGOyib2ZGp0pDiIR0VD4IXaOU
	0L/q8YAm3temp5t0nB/UQN3MY+1wL1qbLJu07eeTJbztvGuzBgh398a/hEcNR96bHPZX/AOyjoN
	C+MOzG2M33Y3wkWY5vnG2sOIbCo1PPfFWLXffHSvTsKyWCwhJF2GT/hB6292zssxQj1KY4KpLcM
	D1IMUz3/wYyrcOQ7dm/vr7Xps2fjgDcqkRkYj7KTYlgDnva3+XZZY4OyOZ/xlYGI9Qs/Huw8T/d
	f/YhxGbuY0vs9E4NgkxpWJ1NODP2VKi7lDpmvWMLMBqEsQXmH4RO3XBcNK0tWICgfMgJ+5XYsGV
	8MmY1JsdKzmy/WIL7ZfU0bqB/
X-Received: by 2002:a05:600c:3554:b0:4a1:e7ce:107b with SMTP id 5b1f17b1804b1-4ac150b20eamr442431325e9.2.1793880684946;
        Thu, 05 Nov 2026 04:11:24 -0800 (PST)
Received: from Ansuel-XPS24.lan (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b56f02386bsm58869885e9.7.2026.11.05.04.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:11:24 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v10 0/5] clk: add support for Airoha AN7583 clock
Date: Thu,  5 Nov 2026 13:10:53 +0100
Message-ID: <20261105121059.11201-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

This small series introduce some cleanup and support for
clock and reset of Airoha AN7583.

The implementation is similar to EN7581 but AN7583 introduce
new reset and more clock divisor support.

Changes v10:
- Fix whitespace in include patch
- Add reset and phy cell as required
- Add additional patch for devm variant
- Add additional patch for lock for clock and reset access

Changes v9:
- Fix compilation error for priv (again) (this time fixed)

Changes v8:
- Add ACK tag by Connor
- Fix missing priv->base assign

Changes v7:
- Add further info for DT patch
- Add serdes selection support
- Rebase on top of linux-next
  Link: https://lore.kernel.org/all/20261009070725.13196-1-ansuelsmth@gmail.com/

Changes v6:
- Address bot suggestion for DT patch
- Add further information on chip-scu phandle
- Add dedicated PERSTOUT reset and PCIE_HB reset
  Link: https://lore.kernel.org/all/20260819221458.30040-1-ansuelsmth@gmail.com/

Changes v5:
- Rebase on top of linux-next
- Drop even more patch to reduce patch delta
- Make chip-scu specific to AN7583
  Link: https://lore.kernel.org/all/20260528190000.9164-1-ansuelsmth@gmail.com

Changes v4:
- Add review tag for DT patch
- Fix clock patch to use en7581-chip-scu compatible
- Drop PCIE SCU SSR write

Changes v3:
- Drop .set_rate patch (will be proposed later)
- Drop chip-scu binding and related patch
  Link: https://lore.kernel.org/all/20251106195935.1767696-1-ansuelsmth@gmail.com

Changes v2:
- Add .set_rate support
- Rework DT to EN7581 implementation (clock driver is parent)
- Add additional cleanup patch
- Merge binding with schema patch
- Add chip_scu phandle

Christian Marangi (5):
  dt-bindings: clock: airoha: Document support for AN7583 clock
  clk: en7523: use devm variant for clk_hw_register and fixed clock
  clk: en7523: protect concurrent access to reset and PCI register
  clk: en7523: generalize register clocks function
  clk: en7523: add support for Airoha AN7583 clock

 .../bindings/clock/airoha,en7523-scu.yaml     |  25 ++
 drivers/clk/clk-en7523.c                      | 332 +++++++++++++++++-
 include/dt-bindings/clock/en7523-clk.h        |   3 +
 .../dt-bindings/reset/airoha,an7583-reset.h   |  65 ++++
 4 files changed, 418 insertions(+), 7 deletions(-)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

-- 
2.55.0

