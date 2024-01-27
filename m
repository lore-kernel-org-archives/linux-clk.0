Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508F0A55
	for <linux-clk@vger.kernel.org>; Sat, 27 Jan 2024 00:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706315829; cv=none; b=KwFd7xflp60Z+5/SbbpSS8WwMI8jeYhCAiWdOpG7PHggbpKry/a1ofWQ5cGv4QCM74lZ+WMjEEQZldtlO1xxHYxVSEJikI7BcT4EoWdLfQ+DFMw7vrSZCL19iLEvUVp7F7ai1cYW2SAYrIf6/LvDWzRqUtnvAE/wHSF9gouMA14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706315829; c=relaxed/simple;
	bh=e67JZ6JR8CeyU6VdIHYyK7Ki6SpejtvxhPnH0TB4kOc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IsGwsVI1nWs6EcHj8uOLQ9uv/erOw5KoDae1EjEueSmAo+30eTGR2N5j91Kup90urlAN3GV2M5/0IGFkXO1tFgpgnJOiTzB8+pNIc5UEnwhDQr2mAA4gM9NJE5m1m391EbfKJAVnMYQih9dnjWBxBKFN5/0ezHEFr+ec49uW6iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w0XYvZ0L; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w0XYvZ0L"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40e76109cdeso19828205e9.0
        for <linux-clk@vger.kernel.org>; Fri, 26 Jan 2024 16:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706315825; x=1706920625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sm+b1B1zFt2eVB9+ThV9mqMVXPNNXKvJvmEo2SUwft8=;
        b=w0XYvZ0LYRfwScdXDUjTnkBjz94KPFW+5aKpFOffAzqSZeBqTHBY0qnuPT1RB8R3+z
         HT2O8weHD4scF0NhXsCPLiFUp+YnBFAvZDHuQcFA8xmoHSOy0JCsjn8pYGtT7WUmVDO6
         33pj/EDFs6LwfcsrRzXGx4JRJ4SlrMDIAf6b5KAxf2e32LImDo8iNrqkHJxbx0+sL2m6
         bJdj1Apqlyofvnt9z33tqZKiDWvOy5PghHcjFEDfJZkhermdGzuz+E7BZnins2ihHzpA
         L+VDSScT5ycghJpY6weapl6AJhLHrOSWb6NK3sZMnt9dW4cXueqGligUgfLL7DRDqrz9
         c79g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706315825; x=1706920625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sm+b1B1zFt2eVB9+ThV9mqMVXPNNXKvJvmEo2SUwft8=;
        b=uim666fD84H6Bn4cvU4t+IlbE9uOSDxKvkadPqYWcM0hautXjCg7GJ21B/pntdEVDq
         sFcq5/im/u5q4cVkLICgFPxEcBi5T/8QVBF5kM4H/bUPxqH3Byxl/nwlpx8oxDT47gc/
         1FzGz1cRgVnKGdQu7CD02JB2wQaLoKtOdm9PLykXMzt1zwlkc5PGnMCyixhgTCusUOyk
         MgokK28zmnBZSBuHiCJQ9IKz0mtagfY2EgK1x28mYNgaUsyJhL6a4Vfg3yMUnDHFlfJ2
         uUV9tKG9Mp8qzOAjvM585wy6aOZFTf5yVOX4tYaDPCKrxDlQ4t4d08N8J6XYWxFeFE8V
         Yozg==
X-Gm-Message-State: AOJu0Yz7IdzxMYn1M/6idLOBtb36JNQAz2gj05i22YDYTajLDwn4TFEv
	lIVyZmvRVWFww3doJ+DXe2jVLMWvkYMyD+zE1JXSsYYd646LTm1kJDqQXZ8c++Y=
X-Google-Smtp-Source: AGHT+IGeFh5Dj5LZw+UG+J/Z91OUe5JueC+Wd93apWSOWisW8wFE95eSjirZGUDRp0E34HcX4tKyGQ==
X-Received: by 2002:a05:600c:5123:b0:40d:484e:935 with SMTP id o35-20020a05600c512300b0040d484e0935mr455010wms.12.1706315825706;
        Fri, 26 Jan 2024 16:37:05 -0800 (PST)
Received: from puffmais.c.googlers.com.com (229.112.91.34.bc.googleusercontent.com. [34.91.112.229])
        by smtp.gmail.com with ESMTPSA id vi1-20020a170907d40100b00a2f48a43c3esm1152235ejc.7.2024.01.26.16.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 16:37:05 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
To: peter.griffin@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@android.com,
	tudor.ambarus@linaro.org,
	willmcvicker@google.com,
	semen.protsenko@linaro.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/5] arm64: dts: exynos: gs101: fix usi8 default mode
Date: Sat, 27 Jan 2024 00:35:51 +0000
Message-ID: <20240127003607.501086-3-andre.draszik@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240127003607.501086-1-andre.draszik@linaro.org>
References: <20240127003607.501086-1-andre.draszik@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

While commit 6d44d1a1fb62 ("arm64: dts: exynos: gs101: define USI8 with
I2C configuration") states that the USI8 CONFIG is 0 at reset, the boot
loader has configured it by the time Linux runs and it has a different
value at this stage.

Since we want board DTS files to explicitly select the mode, we should
set it to none here so as to ensure things don't work by accident and
to make it clear that board DTS actually need to set the mode based on
the configuration.

Fixes: 6d44d1a1fb62 ("arm64: dts: exynos: gs101: define USI8 with I2C configuration")
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index aaac04df5e65..bc251e565be6 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -384,6 +384,7 @@ usi8: usi@109700c0 {
 				 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_7>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric0 0x101c>;
+			samsung,mode = <USI_V2_NONE>;
 			status = "disabled";
 
 			hsi2c_8: i2c@10970000 {
-- 
2.43.0.429.g432eaa2c6b-goog

