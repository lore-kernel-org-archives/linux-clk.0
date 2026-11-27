Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787125;
	b=vo078Z2X+x3e7cqkqbU5+b7bmIcIOwSZW7GoO1X5KRf4rr0iVcqrMgOVZ9bXVjDi2+DG
	 PeJ5bZAZPqr9GTc7ZfbAqewJJFNF1XwZq1rKY7m9BAvfscYpqn6XafX+gWxDXBZLWYWfJ
	 0EMuxgcbiyQnjqnfKeSygeVVfF6W0NDrH5w8sVtoxed6RCn+ub0B1Vnl8thJJdssJfQDn
	 EVeDy1HpEE4glR3lYMq0fv+8zrCNuFDVBjUyDddVBPT8srZBSSg3oqlfuuKkQl3UBpbH6
	 DCKMnLm2Vm5wMMhS7AHnx6DHzsMch9lyJUi0hAPMwPVm67qHpq9K0hzmi/ahow5V4Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=soBllhnRsKIz6tjmTzgFLG5DRqhYbElDc5QHHZS0VwA=;
	b=UtWXnkjZp6H4eblEUNz79EfxT2BeR9gEk9mepPa7ijgBn2Kx43OWkoVGRHVdxYZXO/Ln
	 84e7+ATJh1/GrCuacKUs47tTRZ6fotS4R+hUbF9T9ivDx8kkYQC3KfUkpg6koVI5hZuwo
	 KkxPNQKjagGolX43AO5fyqUMNwUGTkrsjUzjOjjAjjpoN7WtokLV31+uxSTitj1JNFNlU
	 IkGenDmwe+DgEEGdEmXV+sKaOIlldds3/REKmSyeAfM8vrFwl8BpqlqoxrxOCAHT8dzqe
	 Skov2/a5VKk6EZnL0d1UOLNk5Xcf9vma34g8QcZE4SIsaN7CszoGuDJWzymk0H0qqeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VRfcINcX;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8183606A327
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 13:45:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8183606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VRfcINcX
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2f03920c477so68112655ad.2
        for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 05:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795787124; x=1796391924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=soBllhnRsKIz6tjmTzgFLG5DRqhYbElDc5QHHZS0VwA=;
        b=VRfcINcXZkGKJlamNcG7ibHTmkHDvq6tYYNhQjY8ADYHJWVBhMYpYMWxlRm2qkwme9
         lgTfSZBRZSLaG312p4Ohbr76U+E2prGbnT3tnj+y3hln2bc4Tgmktck+bQqd6qpQXR7O
         tOr3JiU5A4+HmQ28gVgxTLEnuDIjFyohxW7UNtSCDqueBxW5v+FxvDr5XEeH8NNks8j+
         eADDdfx9BNuutaS7srnsPUxi2rmFhSeD3tYDJMEhuZ8V/WVNs8+2dKZ8LuIOC1kFyAAB
         bPRwEn8AWHHS0vwm9zq8MrCkxzNPbmF6QFSZLGQDdcFsQMc0/v+H+D58OIk1vutYWRQA
         4dBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787124; x=1796391924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=soBllhnRsKIz6tjmTzgFLG5DRqhYbElDc5QHHZS0VwA=;
        b=jIRnzs6TbzJhjlOtrqrBmjiDvxFzdgfvVBOZ9Yh2njnzfKKdtUMqG+4210N8hAeI0n
         wft6nYFcvEycCgcUqnQFXtQwZ8qPMi9s0nE7mkUGaoLIgm9kniRKE0amKblVgYX/PczV
         ZsBbXlbwcXxFctnKEqTGmV0dhFRWstXSw0u75aB1XWFzCVihFEmFKPGbzbgHhBAAU+db
         A3P6yhFos9hobR7pMfNHwbCkhgQTP8akRJ/tPoBJAEAOJe1sXqcpK0aKg33RRdRXouFP
         peQUe/T+KAPtZOH75kIK+fgvJMNHBkl14SHgI4jFk+sENenygnySb4+wQFkUl+NTpabV
         +/IA==
X-Forwarded-Encrypted: i=1; AL+hErES0cQJdV4pwcvgmUDhhJsWUv4BN/OXQ0WPifRx4dOcro34X6JdQimXvMf/8Kb+ho6ApH4+IYDqI1o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Y2e9LniBbLFIc8w2K1zcpqkiH4WiSOLKh6PmrIfCy80ERDl3f
	P8Xaa+9q+Z/WCTochBqdcxQGYkuVQqGUAX21ATf5HXiuA2DR8Bql8lrR
X-Gm-Gg: AZFdTZforozruM6jrg46R+IqlZzjm1l2aNKT22Svh+Jao9EKiebZcQc2x12vEmPZ39k
	FKR1NHs1jLXZcOObek0G19xZx7t7o0XahgI/lwG3BisodsVs+A1moOng6QgcnpUOHZsTfTYyy+0
	eYT1tSeDHMRIKoMxsJEX+28SSOdLjw3E5aEn6h5eC5uzwXG//zavsI8e6AMb8GocOrzEFW5jkE0
	QysSoIepEJ5IPulGedHwJTncsZtiYmeFHAoKz6Nk3ziKzD2hUQjO2L8GiSwd+Kz3qWevNVc946k
	7ZMIH1ukXl1E6lLR4BfDYm2Hq4tz0LPdLZl+Kao/n6C7/wFb7N8P8QkXL9A12GsVTUPAU+NPKRy
	NmH74ZoOhMXWGbh1JCelwXI5U4UsEABzlEHCL6AnQrg74soUAi9YgYfLeuyBMQinuGWmc0UXop7
	LG82oLiIs3nM9MN+fJG3GeB+wbcaY2qbZE6pYPJUYmwObs6pzKWheta8Xm3pUekbt1D420fwP57
	reUJIbq//T1NF+RbWSIbA+G0uGJ/pOYq7ZbgcuPW55LkDO2T0XrUDotTh80ZiHGCyJOYHTx6hdH
	/PyQgFMsJIH6N5FV03OOpFfnqMKgu0vP3LL9Pu+uO7PI/w==
X-Received: by 2002:a17:903:b4f:b0:2f0:3b8b:9145 with SMTP id d9443c01a7336-2f03f1851e2mr258565905ad.55.1795787123904;
        Fri, 27 Nov 2026 05:45:23 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1f2csm121741545ad.22.2026.11.27.05.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:45:23 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Abel Vesa <abelvesa@kernel.org>
Subject: [PATCH v5 0/7] Enable front and rear cameras on Xiaomi Mi A1 (tissot)
Date: Fri, 27 Nov 2026 20:45:00 +0700
Message-ID: <20261127134507.125513-1-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
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

This series enables the front (Samsung S5K5E8) and rear (OmniVision OV12A10)
cameras on the Xiaomi Mi A1 (msm8953-xiaomi-tissot), along with the required
MSM8953 CAMSS clock fix, sensor DT bindings, V4L2 subdev drivers, and SoC/board
devicetree updates.

Changes in v5:
- Restore missing `select V4L2_CCI_I2C` lines across existing camera sensor
  entries in drivers/media/i2c/Kconfig.
- Move ov12a10 Kconfig/Makefile entries from the s5k5e8 driver patch into the
  ov12a10 driver patch to preserve per-commit bisectability, and add
  MAINTAINERS entries for both bindings and drivers.
- ov12a10: Call pm_runtime_enable() before registering the async subdev, add
  v4l2_subdev_cleanup() in the probe error unwind path, update the active
  subdev state and return -EBUSY when streaming in set_fmt, add the 35 ms
  post-powerdown delay when reset_gpio is absent, and match the initial
  V4L2_CID_EXPOSURE maximum (3372) to the default mode.
- msm8953-xiaomi-tissot.dts: Move `vdd_l23-supply` inside the `regulators`
  child node under `&rpm_requests`.
- Include base-commit metadata via git format-patch --base.

Hikmah Gumelar (7):
  clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src 100MHz parent
  media: dt-bindings: media: i2c: add Samsung S5K5E8
  media: i2c: add s5k5e8 image sensor driver
  media: dt-bindings: media: i2c: add OmniVision OV12A10
  media: i2c: add ov12a10 image sensor driver
  arm64: dts: qcom: msm8953: add CAMSS node and MCLK pinctrl states
  arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras

 .../bindings/media/i2c/ovti,ov12a10.yaml      | 110 +++
 .../bindings/media/i2c/samsung,s5k5e8.yaml    | 103 +++
 MAINTAINERS                                   |  14 +
 .../boot/dts/qcom/msm8953-xiaomi-tissot.dts   | 124 +++
 arch/arm64/boot/dts/qcom/msm8953.dtsi         | 145 ++++
 drivers/clk/qcom/gcc-msm8953.c                |   2 +-
 drivers/media/i2c/Kconfig                     |  20 +
 drivers/media/i2c/Makefile                    |   2 +
 drivers/media/i2c/ov12a10.c                   | 770 ++++++++++++++++++
 drivers/media/i2c/s5k5e8.c                    | 567 +++++++++++++
 10 files changed, 1856 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
 create mode 100644 drivers/media/i2c/ov12a10.c
 create mode 100644 drivers/media/i2c/s5k5e8.c


base-commit: b7ac871daee981f1963f632586ff9b9d898ce5dd
-- 
2.47.3

