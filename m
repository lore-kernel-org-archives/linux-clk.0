Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438D910944
	for <linux-clk@vger.kernel.org>; Thu, 28 Dec 2023 12:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VGRgjEtU"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40d5d8a6730so14305705e9.1
        for <linux-clk@vger.kernel.org>; Thu, 28 Dec 2023 04:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703768299; x=1704373099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9P18XFXxLojrY56K1R6dgW5XgUJGd1RI2KgrEMEdbt0=;
        b=VGRgjEtUWQXaj45h2Kim36YsftjD3/lzrOlNAnGvcLcCCR4P1BndKG1WkmcaKn4krL
         KzgaB3pHKJP5hbc5SWan+JB+gmYLPxOyX0ZvE8MRoY9Davrl21fm21nEmCchRXULzMKW
         o61bqKoj18suCoBSNZGu59AmoTlGu1+Vmi2w3u86vVVkdKWlFCtsxLh2zJCGeAOH4G8a
         h6qLZNpQFjh3ZfM9bPKQTXuYX1tPdhGgj8brdvLsbotZoaViRboa3klaadVDZjkFwwS/
         i/zvAYf5TjhGjqh6709tTOlvn31WrdAXNVPij7FKyfoZv5z6OQgTFCznS1qPdzmrMNx6
         r74g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703768299; x=1704373099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9P18XFXxLojrY56K1R6dgW5XgUJGd1RI2KgrEMEdbt0=;
        b=Jpcfb1fXbkNQ2XgJV7QcW+mNf5pEGVimBSdHGirEY3J5gNkhRGT5B6v2g6MtID3AHA
         r9dX6/vz3QXQAlsjzz4N8fjKX5m2CtXbZth8eu/datAz4Sm9LdeT0jrKUigp7XHDxn+E
         z6Xz9R5xzBPMuHxRVe2N2Xx7ncZoXUxKCPk3sg+3yurH8z8eQ2mGl+klf1h4VQmAvAqo
         VHyl5XGBL4tlnkqxMZQyl2RY7WoI12X06I8e9RB3VbPZhEvsz2CVXGZ+9DMS5mJLyiSd
         FCwOnuyvet5eHll8dbkHbegUbmHl7+hj1X/R5zuvrz+E4ltF1o4RBVgivTO4Wp8VKtOL
         kxlw==
X-Gm-Message-State: AOJu0YwTB2imcmg3BEkcq5N7okivehn0gTArARocSfJ4XL2zqzyXt3/f
	Nepufjjp/kOcTRUWZD0+yskkK+//nPP6jg==
X-Google-Smtp-Source: AGHT+IEhfhBO50ykAwRsA55Z5OQSVWgKhNvX6SqkmYB+7qQHPv4Eq18tKnXzQa7B/fCe5uM8d1mYAg==
X-Received: by 2002:a7b:ce98:0:b0:40d:5c58:fd7a with SMTP id q24-20020a7bce98000000b0040d5c58fd7amr1705829wmj.156.1703768299747;
        Thu, 28 Dec 2023 04:58:19 -0800 (PST)
Received: from ta2.c.googlers.com.com (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id h9-20020a05600c350900b0040d5aca25f1sm8615807wmq.17.2023.12.28.04.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Dec 2023 04:58:19 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peter.griffin@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	conor+dt@kernel.org,
	andi.shyti@kernel.org,
	alim.akhtar@samsung.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	arnd@arndb.de,
	semen.protsenko@linaro.org
Cc: andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-serial@vger.kernel.org,
	kernel-team@android.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 09/12] arm64: dts: exynos: gs101: enable cmu-peric0 clock controller
Date: Thu, 28 Dec 2023 12:58:02 +0000
Message-ID: <20231228125805.661725-10-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231228125805.661725-1-tudor.ambarus@linaro.org>
References: <20231228125805.661725-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the cmu-peric0 clock controller. It feeds USI and I3c.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
v2: collect R-b

 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 2c27c3cb9237..c693791ae584 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -339,6 +339,18 @@ ppi_cluster2: interrupt-partition-2 {
 			};
 		};
 
+		cmu_peric0: clock-controller@10800000 {
+			compatible = "google,gs101-cmu-peric0";
+			reg = <0x10800000 0x4000>;
+			#clock-cells = <1>;
+			clocks = <&ext_24_5m>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC0_BUS>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC0_IP>;
+			clock-names = "oscclk",
+				      "dout_cmu_peric0_bus",
+				      "dout_cmu_peric0_ip";
+		};
+
 		sysreg_peric0: syscon@10820000 {
 			compatible = "google,gs101-peric0-sysreg", "syscon";
 			reg = <0x10820000 0x10000>;
-- 
2.43.0.472.g3155946c3a-goog

