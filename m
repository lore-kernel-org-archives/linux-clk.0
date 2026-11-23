Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447675;
	b=xJeJLwGuUJpx1aL594V328PJE1g6ci6J42mY5cK382OSqmqDI3npozA+Wwc6IUMUTCn9
	 lydNC94RCtqWhcnZthVMzkYsgiZFHhs02G286YudUwYkpORYuc941PU1BbuMnCilioZs7
	 aSDn42T1RUJdgmGrhIRO3pu3CuD8i1DW60qhGq06ZGGd0rxCZiLpAECp1s8kmPajqXtYe
	 W+fKqMHoiAqxIpXNjsS3T/HrPmIuK+3b0rbg16bfy38DFoxzsuYPAzpaCr7kiqQMyJhtn
	 FeJYKZdYaums24KnX5iXxXQBk4fere62yBddyAkOakXjzH3oYKpzYuswNxFC922+X9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uBAOfdEywnKwLI3Q30a2UJ1axUEupHQCdZ1P51aKI0w=;
	b=uoIMGO/09ckCQ886/7srPOzVsQzjnwMDAJ7JJvT2iFhBpvLJq5G+YsWZ0XIegfQoQI8i
	 7G/kBkCdd0QRhRpFEcA95PXQv5VIN73zFV3VZ7A4Ux5q6JnJ7JD3Nj0XSEzT530onxbvy
	 +nRl8yPpWmObtiF+mZgan/bm8tBG90I9+P67wTcYszPZrIzijYclrf++aAOB3pA4tN+S3
	 CjMkIt3w1Y2kq1AolG7XqxZArt009Gj3qoVBrFLcYrH3y7FI+kym8NPHaZA6qfJBudArG
	 QY1s+lmmxmK1HWN5gzGOcWiZpgVqoSLiYPPgXebsLrGxTaE8EElajUuBbggvoUrcVfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cWUb1R2v;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186D6606A330
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 15:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 186D6606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cWUb1R2v
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so4199059c88.0
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 07:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795447674; x=1796052474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uBAOfdEywnKwLI3Q30a2UJ1axUEupHQCdZ1P51aKI0w=;
        b=cWUb1R2vJjz6q1bHmoPN/LqInvTMfkVUHJM4/GfA2TcN29DOBUjjq8PtpXn5jaj5AL
         93lxc+XMTCtIQ+iYvqkvAWdBYKVc7/OGn8+41OgyJowmRjEGLTX8UIqIv1s8UCJfmqYk
         AzomVOu58i73iY/MROCpGxPoHo9igrRfdDeNzrI7OKLGSbfrXrSHUTMziEfZCM9z8r+B
         VBQ1n3AmEHl3IwSJ1PcxhZuO78OiBdcDPoAv+SjwCWtQ/gu8RB9cWNYT75p2l7guU70D
         nCeDlvuXjJyXpdv3FcZFxsnRu6O3lmeDvcfcQmCKaOw/FgBK1982jNY60Awlp/F1GNiH
         cwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447674; x=1796052474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uBAOfdEywnKwLI3Q30a2UJ1axUEupHQCdZ1P51aKI0w=;
        b=KcXRVikvS+CwfRc8qg0z/Ha+9b5EJMftCm+R4jnOtmBsG3hAqFW3ZF359NXPy42pgS
         7C9/Gx923msWZydwWI+lDMX4m5rrsBbjtqsiSZm4lg7fuyMFhkhVHdR6IC1HSkrYMXYd
         L8LpCnbU2BXBt69u3LHY0J1T+pSszEYyUaYMh7rCZzwRwVQv1Q/X9gpW+sK4seBsxgAC
         zTO3RbUEQLqTE/ObvaHFNwODZ1+TBTT8mlq8lD+epblFS12ZzW355qQOFBrPZLJTjOVb
         ZiSFTQ0ZxDjojCK7D4qghnJvFF5NYr7qpCxT4JKzLZHfNVx6Ml+KH8PUqPPAqiuTosaX
         /n3A==
X-Forwarded-Encrypted: i=1; AL+hErF3WKwOOw3AdOHsdu5sWh6u3Qcpjcr8izRia926+48Q+n1V4tk9JaZppdKyRxzIcN2NoaiQuz+PyYM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Rc/bP8zV4JbMC1i0i7Rt6sB3PHArZi4fXFqUv1ViL9+zQVN5M
	McubfpUrSZ1xLDLwgK2eah95//CDuZ2mvvKDynHRkhjkzKkMU0QiWKTM
X-Gm-Gg: AZFdTZdtEOj60rOwHzYBLAL0ErOnRrnz1Rzf8/JvsRyKc67FqHID8KPeLBlzjHnlqcN
	FuH2MWQIqecwOlNbDPX+/D3gAFjw1mwdM6p9hqRGlCc7hYQH9F1u9jg0AEkd7dTbXdhfiVL9Wts
	M00kKSBFhhz7sx/3Wna5QI1OQ7DK250zQywwctY27zeRiHFnP0yzVI01ae9K5ZVtCaBcRveW9GY
	xnw1svciSnvTLAcLlEUHKNarnYrryqPM4Ws4W9WwTHJcfF3K+kurytakqT2TOZOsS740e5Fm8bY
	+nzcsIqi4/hljZDyiFLgjrXkQbgAp2I4AQ9fMn+7CjUPb3Q2OL6ALQTWAFpg4SZQUyO6elTK54q
	JfhY0gisM2OsNoi+QaJIjgyH4t/8xhF4hrM9qZc3xrwL+Rdi3dKtvLa+4A3cb0L5fiNRldBW79p
	b3GlKsxYSQ9cvOCHcyT2S7KSlOwDUnBCZVuHXPNBhxmWj/gAHOK7+PK195MgqE7u1Ls/DlIhcQO
	+bOmeMoWZefGeeeQmBbpZYRd/kSzUTd4SgkN1REjw1RZa5CXb76B3xLDf69yyrH6xDAbDS2Fh7Y
	Aty+8fZ0HarxiGsigY45Hk3PS5FOoST9wvDsoHGkafWejw==
X-Received: by 2002:a05:7300:de08:b0:382:42a:d3ea with SMTP id 5a478bee46e88-38570258929mr12093640eec.29.1795447674020;
        Mon, 23 Nov 2026 07:27:54 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm46569087eec.5.2026.11.23.07.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:27:53 -0800 (PST)
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
	linux-clk@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v3 0/7] arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
Date: Mon, 23 Nov 2026 22:27:15 +0700
Message-ID: <20261123152722.168879-1-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123123546.152162-1-hikmahgumelar@gmail.com>
References: <20261123123546.152162-1-hikmahgumelar@gmail.com>
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

Changes in v3:
- Add Fixes trailer to clk: qcom: gcc-msm8953 commit.
- Fix $id and $schema URIs and switch MIPI CSI-2 data-lanes to 1-based.
- Replace deprecated pwdn-gpios with powerdown-gpios and model GPIO62 as
  a fixed regulator (vreg_cam_avdd) supplying avdd-supply.
- Drop unneeded <linux/mod_devicetable.h> includes from s5k5e8.c and
  ov12a10.c (suggested by Uwe Kleine-Koenig).
- Fix runtime PM ordering, pm_runtime_get_if_in_use() <= 0 checks, active
  state initialization (.init_state), v4l2_subdev_cleanup(), exposure range
  updates on VBLANK change, test pattern enable bit, and endpoint/clock checks.
- Drop undocumented interconnects from camss@1b00020 and sort nodes/pins.

Changes in v2:
- Rebased onto linux-media/media-committers.git next branch.
- Updated set_fmt and get_selection pad ops signatures for v7.4-rc.
- Added MSM8953 SoC CAMSS node and MCLK pinctrl states to msm8953.dtsi.

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
 .../boot/dts/qcom/msm8953-xiaomi-tissot.dts   | 119 +++
 arch/arm64/boot/dts/qcom/msm8953.dtsi         | 145 ++++
 drivers/clk/qcom/gcc-msm8953.c                |   2 +-
 drivers/media/i2c/Kconfig                     |  22 +
 drivers/media/i2c/Makefile                    |   2 +
 drivers/media/i2c/ov12a10.c                   | 719 ++++++++++++++++++
 drivers/media/i2c/s5k5e8.c                    | 555 ++++++++++++++
 9 files changed, 1776 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
 create mode 100644 drivers/media/i2c/ov12a10.c
 create mode 100644 drivers/media/i2c/s5k5e8.c

-- 
2.47.3

