Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437361;
	b=FbLknKejTc64923hIwLfIyivOmpS/UKE20NxEEnX+CYNYlZ8KxTGKnV6pT1tcfS/xVL6
	 KlduzpoTNuUIYmNUzt9f4FbDvyQxU3qy+5qFib78zwjRRE+eBxy90puAkhKUQRVYl08KS
	 mqGS+eODSxbXQw+aX08hulKtYHm3r0HvFIryCmfuPB2jJzGDQC6c3QexHMXlJjRkOQ5eI
	 YuZ7rLtx/9ikkT68bCXqSRBUPmPgTuR5cmVduSx5Wyqsaz08SNW5QG0omo/WXxuCmnQKH
	 Or2+CdvIeVDKXB19BlQGJvgBYvJiczk4wpOXPGMvT/k2tjmv595RV1n6h4fF9Be4Rgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ncj4S8gNxyfQfqVipK+ZlxLd+2fZZ7DWNGqNx0Zlc7g=;
	b=rKJee+TcUpG1LdNEeoGW5rBdZuqhFzyBpGjvZUfc6CBmrJNZ2VDLyR1Ff2ghyc3lIBLv
	 VEcPVcwUTyxthBX93Y/pawZRDplMuIiOBI5sQKj1cT9OGpOW6pYl4pPs8hEUw5YTgAhQG
	 0n1yh6PTYyAAp9CJ39b689t/TKoc+SdgpYysWDmCHg0AVmuhECLiHWel+ygfxe85dGW9r
	 YAHEK+BhsVMvkLMrGJGsk3IC3X6d7qpHLH2XcVMz5GIZQVYDzZ9EAhGNsFLyXh0VtEbma
	 tvZHdnq5wgw5vwqiO/BwpB7s97detS0jgwJzQPG7poe4FICjV1gdaFnA3j5QwMwS9+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QTqnQskK;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C86606A335
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 12:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24C86606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QTqnQskK
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-382f4710a17so5494726eec.0
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 04:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795437360; x=1796042160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ncj4S8gNxyfQfqVipK+ZlxLd+2fZZ7DWNGqNx0Zlc7g=;
        b=QTqnQskKRIE1cgebk3mNS42vnXeE3k4W3M13JDorM8JvXmThQ7ACiYCLcu4VK+bQ9V
         g9layI4Geer0IOQZSMpwe9SmleQDj3GdZ0xBTxfRnNCZcIoDxaN4eMTAAQcEORsQ0/80
         tii9DA5HDOBumdveehsPOCePuj/xeFzr+6lGzKrTexMPx6iaf2QQaouV9oVfECfX4GbR
         tktf5MzOOMFFJmCl5KCqs0BusxJIYl022a8IDjATdmIUAL2jKzvhtbHQmBqgFV+QyZlp
         5QUGCEimTBcZ/hVaYWkKucKZXfSp2wPr67biq8Y4qw8gmMngKzfe9Z6+Nfv+VVPoYlOQ
         cPHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437360; x=1796042160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ncj4S8gNxyfQfqVipK+ZlxLd+2fZZ7DWNGqNx0Zlc7g=;
        b=tFogu7PLUsc+sqNYo77jsc+8+c2VEGCJj/4vdNuMbcYo/c2UG5lYiDIPo3fh9tmc5S
         aK/yZt53J+a5WxhsFD3E2ICBQp5nTlIFVq+gVe/Os5byTRwsxE+mXPhnM9yUJWsrkzxq
         XHyMm8M4buMJjP/z6JgaqZE1iLXrbQAx9wtZ8glgG1dSAXDUTW1R4/pCBnIj3pJqj45P
         QKv4+i6FQ3X3/GojRMUIBQmHITUHUt2i/sXTJVGU9dikWhG14Or735bppZesu1Ag/1yo
         c/0YDA7esEC4kjKxdNWjoROymIvUeEL0RKs+wLMEp1K1LNvOgWXHEgli6FPIE1koMS9P
         gciw==
X-Forwarded-Encrypted: i=1; AL+hErGCv5BnTvHjw+Mxs+ZVCUO+qubWa0r1+6Nka9DUjn7obnPe8sgSAkG9qbBdU3VCgNtPTEwC0FJo060=@vger.kernel.org
X-Gm-Message-State: APuU4Z+09A3KziUTxtMXHsfplDVeJlXlh4eeneS1ceSpN+oQNvfxlGd4
	3joOauHUI5+O99RJ6y6s7jILat3HzGnDEUs2LmZORDo25JWam3gQ0QDM
X-Gm-Gg: AZFdTZenxsEVeSweix338GJQzvD7sOQTnsUxL2yVUxC8aFboLI4AlCtfRnvJft7Lhf7
	Uu8N51RtmB0JpvkpNSuweOrgrtunwP7WiOpEZ5iIZdKvM8ogZL2fMcD2kFPQzyD/Lw6ITtg/5g4
	zyVq11wU44w9thQwPJTFzYSB6QCCns7Kn0iQTXiTOcLPU5e0/41YlDamvnzxhUNf5LpEJrYS6ir
	rpF1pbxJVZeRGY5sT8Zdx9gBJMg7vPDTWZnIrMmjy6auUwTd3TsP6SmMzsHJXMtuUZI/dWYUvlC
	GjnRt3KkCGVzedLHUS4UrD4VGWdoqbvsx+de23DjLQcz4DpTa9KLnWQT+MdJLZXhezC7jDTRfrM
	qoiwhY9Tyexohc6mnLdv8kp6AQYzZgRRDSmRr2nwzINGpBw+Lt1r1bgaQlJGi/AVh49ziymPMi5
	mv3oDclQO+S7JdAtF96oaADUcyZx95lWsXQxHGAdg9qfLTccWtVNpqLRMEmDwxBGLBFKzQn1/3l
	IGcXYMYiCTsTOdyu+5bxYnz1tuK0sVRTZY7h+VuW1sfjNH8BVhlmVvGiC3IT+ihRz6ApZ6whqDy
	zCmW4pRWaQOAdDTliIRcQD0ekrI/YveyCuwlCCgcbnjVVQ==
X-Received: by 2002:a05:7301:7110:b0:383:b90a:3535 with SMTP id 5a478bee46e88-386a0ab67c8mr6531336eec.24.1795437360084;
        Mon, 23 Nov 2026 04:36:00 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm32854353eec.13.2026.11.23.04.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:35:59 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 0/7] arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
Date: Mon, 23 Nov 2026 19:35:39 +0700
Message-ID: <20261123123546.152162-1-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123110805.119610-1-hikmahgumelar@gmail.com>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
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

Enable both the front (Samsung S5K5E8) and rear (OmniVision OV12A10)
MIPI CSI-2 cameras on Xiaomi Mi A1 (msm8953-xiaomi-tissot).

Changes in v2:
- Rebased onto linux-media/media-committers.git next branch.
- Updated set_fmt and get_selection pad ops signatures for v7.4-rc.
- Added the missing MSM8953 SoC CAMSS node and MCLK pinctrl states to
  msm8953.dtsi so the board DTB builds cleanly on upstream.

Hikmah Gumelar (7):
  clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src 100MHz parent
  media: dt-bindings: media: i2c: add Samsung S5K5E8
  media: i2c: add s5k5e8 image sensor driver
  media: dt-bindings: media: i2c: add OmniVision OV12A10
  media: i2c: add ov12a10 image sensor driver
  arm64: dts: qcom: msm8953: add CAMSS node and MCLK pinctrl states
  arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras

 .../bindings/media/i2c/ovti,ov12a10.yaml      | 115 +++
 .../bindings/media/i2c/samsung,s5k5e8.yaml    | 103 +++
 .../boot/dts/qcom/msm8953-xiaomi-tissot.dts   | 114 +++
 arch/arm64/boot/dts/qcom/msm8953.dtsi         | 155 ++++
 drivers/clk/qcom/gcc-msm8953.c                |   2 +-
 drivers/media/i2c/Kconfig                     |  18 +
 drivers/media/i2c/Makefile                    |   2 +
 drivers/media/i2c/ov12a10.c                   | 720 ++++++++++++++++++
 drivers/media/i2c/s5k5e8.c                    | 500 ++++++++++++
 9 files changed, 1728 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
 create mode 100644 drivers/media/i2c/ov12a10.c
 create mode 100644 drivers/media/i2c/s5k5e8.c

-- 
2.47.3

