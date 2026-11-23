Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432100;
	b=XBeouSSOv8QNIbHtaMBubVBfMckXF59hSTGsmocyFqUnLHuPJU60nF0G/V4cngOVShhp
	 m3eC2uOBzgLo/Z8qD3VOt5/rxxh2sCAZzYvQvLv44BCDdcvkV2qflMBMw4L0irDKcneVD
	 s449W52ZZeqeb/Q2BXkDYXgmLAvq7azepmreXpqbWw9AMimeqUodLN/RjPdCUvdMkrhr6
	 UAPmu0jofshDxD8yD9YOXy2l/1gTPMzGOkqcvMZ09hIr60eQ88mwVtqxPQwMgK4FG22vw
	 88PT1aWmLYCavRPPS01oW/x218moOQ8zv3errIapfhka32u6IXETN42J6GMsACXfXAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432100;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IMN0qsksgNIN9kMeTfgWdFSfENva8adgCXhd53cR/YY=;
	b=hHKqICWixc0m/5JxPHJS4b5Zbaoq5H0c/EzoPESMUltS/LEo+hgsINw0bSuy3kPGx6Ov
	 ZVVwWhoclGF/JOnvaY9G0SIO4WqR6Joq7aSHl8TWe8zA/ckgJHLPtUhipGXmI/5PvRsc+
	 BQ4ePSaNCHOqdEQQXKfhZ/iieIyltg7u+vxEiiSWyPq3xbyfDw1/XJQnTW7J0+ZOujQew
	 sGZLNMPOp5CS/fpRAnXBcjrrD7xL4R80uf8ktqMdrr3xbABgwnUdnpWscl6E2CuVYvjb7
	 Iyh1Npi6LCpzpc8EkI3ceAe0sVX5vnF7MjLWllz5iPwHdLjlxI71gI9hZ5fj1SZyF5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ec3UFjGz;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FBB606A31E
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 11:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73FBB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ec3UFjGz
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b3ada81853so3510951c88.0
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 03:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432100; x=1796036900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IMN0qsksgNIN9kMeTfgWdFSfENva8adgCXhd53cR/YY=;
        b=ec3UFjGzf+Ax+mOyj+jbqDFmxv1s+/ilYTPPCkCGVgYuPO3q35DWB/+HRF/Oz2sLvL
         3aQyHI6tHe6HhGEfoUlt+RPLm8ZWtFcdQbDy9jO3MlFzg7xTHIVOcfPEQcIPxRIAVWzQ
         BZ5lRfv4aUhyVlfNm6x6F94Qj4rbgapEOVaNaU+0o+/9/9iRZAOfOBG6MpyGxIQUt3xO
         ALHIZuvHue22QtQ81fiHVBB+0KkjfYRpS44nsn1Fob4Ikd3/1INTRshst8/sQFb0hzRj
         MAVu9TNdZwo0izTaUC/5fX2acbHZrF7RzdRbrdJR8h5+MxGc+rwHlVjLyFEt2n4mkv6k
         t4sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432100; x=1796036900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IMN0qsksgNIN9kMeTfgWdFSfENva8adgCXhd53cR/YY=;
        b=Uez5cukke58tgPTcJ/BKHjJ13f+qUtcs0/BOXWSx5uwgXUsDH72cB34oypLxA1wf3U
         68IJ9B9IxSTSqS4VctNm5wCFI776AUlPZqRms3/ZCr5q6yo0WVK8fiCFOFahK6Z+RK2f
         NYzJLlXrimgp2fhalHohThjCNttINxvGmKm0zDyaUBclxATnhxkMlFwF0yOkPBuPAepL
         eiEc5YyRtjyWTGiSTjfemmA8orZInBW0Qkc7gBNSt3pJhlytkgINTq1PFG2lJAO2kmrE
         T1iiHnET/vdi8cnkpcmf3Uu3+oxcvnwlzmfI3b1r0QPBKbrmJj35SGtUVTXTv02VR55l
         SEpg==
X-Forwarded-Encrypted: i=1; AL+hErHfE0+k5DHsgXDCKh2YpqUXtcALCcRhIW7GaFwa9vYZIuAveDzO9pZHCTA9rFBDu5vV47zhYRJsH+E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KHLmpNZPV8tR5D8LNDGGLVgvH26Xa2BKINsvtCG6ByfSFdkUH
	tZ8ySPtX8nubolCEXfx1MxsnDOT0fJHoB7geBsGrqqm9qFqGbmZPCSds
X-Gm-Gg: AZFdTZdkZSXmfeEpgAwUClH3c1oJe3snjJ9hwbzjI7NnMSvQKTi4pgizbPrvvWUPiq7
	tn28jlY+CE0GBUxu4kOZXDmPMRY4fXj57YUk9ZrOEEKDjEl2f4cHAsbDwcvri4YiHoksE49OdnH
	g7uOlm8fAwgo76fhi1ND9tpnPw/DjqNVdidDDO0XPfVJTsa9jFtajcFxqWs0LONzEXLqE5b5CJx
	j36O8aBOsIqlLZKK9Xk/GTy7SmUwMDLiiDlGHPJrFEgRubWaM160fdq+9/tsV93FF7KLmBxNGmR
	gL5Zi3FtSW/SvT+jn+YJlSUZBkQS/0k86NWjA0ke073JAsxgT0cOjqje7NoD3tFVLpk/9DgNEj/
	RhAXS1HdOhpyoOoCndaTvE60oo45AL6kKqES9XW7nPKfwl9cfMlnoAqCIsdR4lq4F2yQVFu76Rx
	bKlUm4TTOsU84BZqeEBUUy5ndjv/BSsmO5YvTJt6QR6u2MU0HSNNIPmSsxraHQcY/AA3mbSkZwP
	+eQtwd4KxO81SNoCWzoiNG++hc0y/0sPYlAixsoLWuL3QY2r7ECo8cVIaIJLZKuxYiJgwNa3uQJ
	3BuPmV7ZxRpTHxGX06MfBbFU9daCuPnMk22Vx+kKVInotw==
X-Received: by 2002:a05:701b:4587:b0:1b5:1a7a:2ebc with SMTP id a92af1059eb24-1b56f87ab60mr3863029c88.16.1795432099526;
        Mon, 23 Nov 2026 03:08:19 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5568592adsm27061102c88.15.2026.11.23.03.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:08:19 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 0/6] arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
Date: Mon, 23 Nov 2026 18:07:59 +0700
Message-ID: <20261123110805.119610-1-hikmahgumelar@gmail.com>
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

This series enables both the front (Samsung S5K5E8) and rear (OmniVision
OV12A10) MIPI CSI-2 cameras on the Xiaomi Mi A1 (msm8953-xiaomi-tissot):

- Fix the 100 MHz parent entry in ftbl_csi_phytimer_clk_src so
  gcc_camss_csi0phytimer_clk enables properly on MSM8953.
- Add Devicetree binding schemas and V4L2 subdev drivers for the Samsung
  S5K5E8 and OmniVision OV12A10 CMOS image sensors.
- Wire up CAMSS, CCI, CSIPHY0/CSIPHY2, and both camera sensors in
  msm8953-xiaomi-tissot.dts.

Tested on Xiaomi Mi A1 (tissot) using libcamera SimpleISP and GNOME Snapshot.

Hikmah Gumelar (6):
  clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src 100MHz parent
  media: dt-bindings: media: i2c: add Samsung S5K5E8
  media: i2c: add s5k5e8 image sensor driver
  media: dt-bindings: media: i2c: add OmniVision OV12A10
  media: i2c: add ov12a10 image sensor driver
  arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras

 .../bindings/media/i2c/ovti,ov12a10.yaml      | 115 +++
 .../bindings/media/i2c/samsung,s5k5e8.yaml    | 103 +++
 .../boot/dts/qcom/msm8953-xiaomi-tissot.dts   | 114 +++
 drivers/clk/qcom/gcc-msm8953.c                |   2 +-
 drivers/media/i2c/Kconfig                     |  26 +
 drivers/media/i2c/Makefile                    |   2 +
 drivers/media/i2c/ov12a10.c                   | 720 ++++++++++++++++++
 drivers/media/i2c/s5k5e8.c                    | 500 ++++++++++++
 8 files changed, 1581 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
 create mode 100644 drivers/media/i2c/ov12a10.c
 create mode 100644 drivers/media/i2c/s5k5e8.c

-- 
2.47.3

