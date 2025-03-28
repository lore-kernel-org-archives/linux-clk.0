Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5ED31F418C
	for <linux-clk@vger.kernel.org>; Fri, 28 Mar 2025 21:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743195770; cv=none; b=UKoSTvLkIxZAdokxj9YBMYonocS83HR07lHVrKJXlh6Wfg6sTEn50c5uX8wiSs3WxgJJFQaYD8sMkawv8Q97KteamffIGwV9+Qk65gDAQ4ej+/ugCnja+y05VFg9t2hgdyXkKRw9iLyMD9QGmfT9doMcMn6jkBLeoV4v5s3+Na4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743195770; c=relaxed/simple;
	bh=qVNF/97Fzr1SWnglsbvekG+r808MZVRjwdBPHhVs+jM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WJ6YaNvipl24YuBeCe/ivsFPxRch5Z14S9Qev0faQEAoJ5YMfmba4aslatplSOSw1Clu/6kL1qz6bc/mfHEPT1eH1cfITeIDnMF2PXP/iLdTXuj2eMFd+vkkpz7UcmfA8xOerOqfbE4AxPIcLgS+ygE0y6agTdYkYSj+2d71kFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=CJ+RyN9R; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="CJ+RyN9R"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-85b40c7d608so228716239f.3
        for <linux-clk@vger.kernel.org>; Fri, 28 Mar 2025 14:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1743195768; x=1743800568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Up6UVO27Yn/XqWtQdUwLGOA59Ljhuzuee1Xv/FAc+zk=;
        b=CJ+RyN9RpRelRlmPUEU53s9zgD27jdtZod7yaP2ba6eoB5sTvH6lMdSeMqW6zkJec7
         Z7YDJEwtPaaRb9tougW3du4L/h5Lv/IQpcWE9bUGnXilU47dk1F17ouAm/1HUgrUAw75
         5Uya1kNPEGe4Y2QqRkucUvDQ62+4CZISfVt+nNnvzVAVaafvVwLcvLNYD7CBXlJrNaI9
         7qeQit6lcf4egmXug8tEo7oHAoyPkkjmnsr8Ga2tYR5zAX7oWdP8Ov37KOw8pgkY0sLB
         me3mDuVlFxvXFeAaCXTq4J80m1ht+lneoB5F/+304mVmjJajsm68i/AObrmzN0h60Ayk
         vKPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743195768; x=1743800568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Up6UVO27Yn/XqWtQdUwLGOA59Ljhuzuee1Xv/FAc+zk=;
        b=DcgaSCqnyg+6DbY8y1k6SO00EmEkA1j1oH3p+tN68TCu/tp1L/uXiS9DGLoDUsZTJ4
         AV9WtLoak+wQzCT8AcCm5Gzmtt7VnBLxHA9vLo9fSphAfjOEIDMaHP4gldEG4QLcmc4y
         oOvi5zzBk9kk8wxhuu80YHv1L9kbFyu0PFu/E8ew0uq05Ae2PDK3xYmN8Qh6AXYwHb5h
         l5PJYsYKlvH19a0OggowbHiKTn6a0NsSu+H61U7ciR01N8kmsckGVMvLcscvw+Fe7WdK
         1/hgMnV8VK1ujj/5341FuaPdf4gH0OAfJxTlajRBaq8l416l7e2rnEFFjs/647GuvinP
         4W8w==
X-Forwarded-Encrypted: i=1; AJvYcCWSnEFuvET30pW5sfgecoX7d5Yflt+eGXGMYpRdxZ2XFLe+RwW8AesJT07f5O4b5M65QBz7c9h2f0M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ0rrw7m5g2CnU966nOI+Bh1F4wy7GAEvsTqv2lH5FqPFJYulF
	SDfRHbmZ4ueQHnOKVkRte3138hruT2Yq6Rico99pVyt+pPBmVoKiFxQfgXZ6LPk=
X-Gm-Gg: ASbGncuZaEjLECrxZNrMiiXQzXlAZIYBlC9cYhBSErnSqDxkjAetCleeNh/luTwiMYj
	M+LFimKGEZwnNPahCRmpTa4lHjzhcxxtFVjHtWlMG6jPn+jB/WOpjCQMLF0mP5Qxns8sOGnsRpZ
	fFPGaptE7QPUEFsfukpvLGoA7QhVjppv5F+BpiyzQeDHK0OcN+BT7iRR8PZsFWo+u+D+UT8Tc+D
	ubL6kqtZdw8/2vpnl6C+oWJI5c5okuvDLrCKwfrzFA1dx0BsPGZElYO24YkgnIZmECUg6YzCDXT
	wSH7aTjEmZyqGJtJRAvfF3+VLnY/guvXq6+2iYdx2Xd88S7W+1h9INJHiZ1LYIP0Yfa+a7s7XJ+
	jt3RLIeasQsh/vSiehA==
X-Google-Smtp-Source: AGHT+IGycY5TIkiYNgkSFBznHFQkpXRLd390tmdbEA+ih3++uzphzN5QAmfZxFmfAoPvrq6k/CN1+Q==
X-Received: by 2002:a05:6e02:23ca:b0:3d3:e296:1c1c with SMTP id e9e14a558f8ab-3d5e090e3e0mr11364365ab.9.1743195767546;
        Fri, 28 Mar 2025 14:02:47 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d5d5a74286sm6769405ab.39.2025.03.28.14.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 14:02:47 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: p.zabel@pengutronix.de,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dlan@gentoo.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/7] riscv: dts: spacemit: add reset support for the K1 SoC
Date: Fri, 28 Mar 2025 16:02:32 -0500
Message-ID: <20250328210233.1077035-8-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250328210233.1077035-1-elder@riscstar.com>
References: <20250328210233.1077035-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define syscon nodes for the RCPU, RCPU2, and APBC2 SpacemiT CCUS, which
currently support resets but not clocks in the SpacemiT K1.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 09a9100986b19..f86d1b58c6d35 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -350,6 +350,18 @@ soc {
 		dma-noncoherent;
 		ranges;
 
+		syscon_rcpu: system-controller@c0880000 {
+			compatible = "spacemit,k1-syscon-rcpu";
+			reg = <0x0 0xc0880000 0x0 0x2048>;
+			#reset-cells = <1>;
+		};
+
+		syscon_rcpu2: system-controller@c0888000 {
+			compatible = "spacemit,k1-syscon-rcpu2";
+			reg = <0x0 0xc0888000 0x0 0x28>;
+			#reset-cells = <1>;
+		};
+
 		syscon_apbc: system-control@d4015000 {
 			compatible = "spacemit,k1-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;
@@ -518,6 +530,12 @@ clint: timer@e4000000 {
 					      <&cpu7_intc 3>, <&cpu7_intc 7>;
 		};
 
+		syscon_apbc2: system-controller@f0610000 {
+			compatible = "spacemit,k1-syscon-apbc2";
+			reg = <0x0 0xf0610000 0x0 0x20>;
+			#reset-cells = <1>;
+		};
+
 		sec_uart1: serial@f0612000 {
 			compatible = "spacemit,k1-uart", "intel,xscale-uart";
 			reg = <0x0 0xf0612000 0x0 0x100>;
-- 
2.45.2

