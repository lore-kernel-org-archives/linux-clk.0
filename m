Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609953;
	b=G6DtY3UH3lo+/XDJAte/CTKL9LxyY+Abgn1/tkoNny6vDINKbuu/kQG29SpRg1HNAeMF
	 sGGToJd0385UmPAsTdIYjmOLDldpBcd00Cxm8MJHQNaCwKJz75eC9Vv7Ec6kCHPa0NE0l
	 4o1VvRTwuy4uUNjjc193vqFD5g7MoKjX4IYiUo2zv0pBCocZqnwH7B1eCfeMFOIBfGMQH
	 bmt/om9GbXuWzVMm47zSpu95g1q6NnSQekoKIKiSl7EVV99bHA/ztdrrEX5PW3CrkEnx6
	 L3yYh6H3xnvzRbHZF/xrxpHZPxD/D3AomeJV9NBYvcZh9IOroMMEjJ6Q5VMnKyjOjVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IvHx9D16QzbXJ9PEfv5MhOt53lp6B9YTM5O0ok8W/NQ=;
	b=CnvR21I7ibmGOFyCDrHXFsU1630cI2uvOlq2Pk7e6j3lPMU8Tax7+kW3iNas9c/tMXio
	 A/e4ZOz0NTA3qKsD1S3WMT/kbD6XN9eeE/rk2iJdCIMcKcBrjfIcOhEMyLhsHcF30DAuN
	 MFsd7sb2Jf2kWmCH600lZVQUJEHhYOI60lSlXlr5b94cDJH03KT8+xFvV7hog+PMMgH4t
	 LqnEyGp3NLRyWwmyFyiFYrhkhwt0kNmXLaRtzbr4ANW93py9CN09WqZ3RxlJY1bGuzUvi
	 FfEcAaUH9Nm86ZnnKvhQRjJaGg7NPEfAiVBfEDp5I16d1Fo9m2SYfR09zqigI1s35QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Ppjk/PHX";
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C3F606A32E
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 12:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17C3F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ppjk/PHX
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b413997581so4469412a91.2
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 04:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795609952; x=1796214752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IvHx9D16QzbXJ9PEfv5MhOt53lp6B9YTM5O0ok8W/NQ=;
        b=Ppjk/PHXaFf2xFYnTBi2dflKcU0hPvBRvusUu56u+X6FH3/D7MWrpc2TAdElIndzie
         r5b5IFSr/FZecCaM4clvxCwNoPcyYCygW4Koc8jqu16fbHdPP5dNj+f2swgSkZUuugCS
         s/SADxoPwCg0kTSvzM+rCUdOzdhHnBwOs2YfOqthL3g5i8/CoSyc6hLmvarCkZTahFTm
         s2Qr3l1l67VnUTiVAahMxc9jHO4cyRjmiWlR6Rq7ZUl6A9f1iACWbpvHxkVIw4jnEEpg
         oJHTRzVHAKJ302EvQMbmkA1aqM49jXXVkKaOxNi2ML0YYdIPxip7PQknR2CUZFawOUun
         6ziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609952; x=1796214752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IvHx9D16QzbXJ9PEfv5MhOt53lp6B9YTM5O0ok8W/NQ=;
        b=niS9aIwenGIgJpDxn7BV9qqv4K3S52l32x8M0a0rihzy1/H4jGSioQmhZs/Acc0hGb
         AUgvorHCjMNLY/betaU/rgl0udLAxAgflOzwSWm0LJFQsk2y/nhwce/d/RRklBE7+UA5
         Qq6qcLBATAxNw3NYcaedWA/Ghh3jf3xjn7PmTMs+FI7w5TWnrk8DL4TaaBbW0U9Fc82/
         fAj7JfouAgO+8n4C/p+0fcjgcSAlkFOkYbSqhmhuE7oLAgerRH5epE/CkVd12yv0e4bq
         QLhL2IawrUX6ghElEk1Pvywr5/Y6YfoDdbvhwVpqTll3zfS1Qzr9pBAJyAy8XOfvNUaR
         bmLA==
X-Forwarded-Encrypted: i=1; AL+hErEgQY0r1l7HeUBeQrh8v4zcz7+huq+ek6WqSKKtpq/cidD05pDCj1iK6BiWkZDCmZU1oTTVM0i17y4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hhlUuNBsS7BCk5cEP65o+32DxiiafqoEpXDcT03obQYrMKLWR
	aNoDXa9QOZqZcJuMzZ94mZaXJnTukslqEZ9TvQ/6Z8zTZPzJ28Fjxe95Gw/9ceUpZfs=
X-Gm-Gg: AZFdTZc6145opTY73rc7IEdeeRLs2PRC1AXXzAOp3jD0ZOf4HseLwzlAliwg5ioPP1W
	atLAjvK6iMqk8ue7c7dm1Pc8f9ul5rw5AiFuPkx71VafU4mSG5G3hqITJT63WS/dI6PaYi2OLDW
	je3+taKQMPds4eM3viWrN0WrFeWY0r1pXnVvqz8fz8m1DzCG/OOfb1bKGhwKkoz38poHo6s+AaZ
	Fd3OgTR/Xub6rUdBU3i7xbJO/ayEtQYoGCXiwkYRifihB4w5hYnGMwvPJmMEfA99abvl+ZAWq9u
	HxIie7yJr3OdXj18OgOaciUrADFki3HK+K7i5TvkTdQswJjXRaEKMM5Q4qb64m5CzsaY3Me8xV/
	9IfX0bCTznTDBG9aCAcc7ej+3oLJsZZcfZ3dsynR4Uu1iOpr+UZ4fFDqBb9TECqSOdg3kKcLFAY
	LZiRfdY5WVJBUMSGHgVUuLPJYQsisO3xuYyHwwZK0MBfHGp4zEmuIhpSSdwbQauy0FNzXPTsAYZ
	PYtebkIuyt9I0j7eHXa9xnOQS7zuaqJsi819RSNJ20R+xOg5k9oeHGbPwlZCpv8Gfh92kqm1kGd
	xhXQTj/ijpRrHe1lP4kTQsdUobV4jioC6xFnBZnGUAatO8OI
X-Received: by 2002:a17:90b:3b86:b0:3b3:fe22:2739 with SMTP id 98e67ed59e1d1-3b41c9c34b5mr16172380a91.54.1795609952223;
        Wed, 25 Nov 2026 04:32:32 -0800 (PST)
Received: from localhost.localdomain ([103.118.130.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b792474sm12698366a91.3.2026.11.25.04.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:32:31 -0800 (PST)
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
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	u.kleine-koenig@baylibre.com,
	Hikmah Gumelar <hikmahgumelar@gmail.com>
Subject: [PATCH v4 0/7] arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
Date: Wed, 25 Nov 2026 19:31:39 +0700
Message-ID: <20261125123146.379057-1-hikmahgumelar@gmail.com>
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

Enable both the front (Samsung S5K5E8) and rear (OmniVision OV12A10)
MIPI CSI-2 cameras on Xiaomi Mi A1 (msm8953-xiaomi-tissot).

Changes in v4:
- Wrap all commit descriptions at 72 characters (Konrad Dybcio) and fix
  all checkpatch style/alignment checks in s5k5e8 and ov12a10.
- Keep CAMSS CSIPHY0/CSIPHY2 data-lanes 0-based (<0 1 2 3> and <0 1>)
  to match legacy_phy lane_base = 0 in camss_parse_endpoint_node().
- Add vdd_l23-supply = <&pm8953_s3> under &rpm_requests for S5K5E8 DVDD,
  and specify assigned-clocks / assigned-clock-rates (<24000000>) on
  both sensor nodes.
- Request powerdown-gpios instead of pwdn-gpios in ov12a10_probe(), check
  IS_ERR() on powerdown_gpio, drop vana_gpio, implement .init_state,
  add v4l2_subdev_cleanup(), set BIT(7) on OV12A10 test pattern enable,
  report 12MP native/crop selection rectangles, and validate CSI-2 fwnode
  endpoint and xvclk rate.
- Use pm_runtime_get_if_active(), check __v4l2_ctrl_modify_range() return
  value, keep post-power-on delay unconditional on reset_gpio, populate
  full pad colorimetry, and reject active format changes while streaming.

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
 .../boot/dts/qcom/msm8953-xiaomi-tissot.dts   | 124 +++
 arch/arm64/boot/dts/qcom/msm8953.dtsi         | 145 ++++
 drivers/clk/qcom/gcc-msm8953.c                |   2 +-
 drivers/media/i2c/Kconfig                     |  62 +-
 drivers/media/i2c/Makefile                    |   2 +
 drivers/media/i2c/ov12a10.c                   | 760 ++++++++++++++++++
 drivers/media/i2c/s5k5e8.c                    | 567 +++++++++++++
 9 files changed, 1821 insertions(+), 54 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
 create mode 100644 drivers/media/i2c/ov12a10.c
 create mode 100644 drivers/media/i2c/s5k5e8.c

-- 
2.47.3

