Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D736128C5CB
	for <linux-clk@vger.kernel.org>; Thu,  8 May 2025 19:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746734065; cv=none; b=otBdCq1ZQkG6K7o+ELdYKt2ch5T4BOkV4dTn2KmGtYYBW5c68CHxu03iUf6l6Yo3/jJeODvJnfIcR0FFYVhhz1W/Se9/ameDq13tlVLNTkkLqc6ReAOGVaTDAMVP43lgvI95k2ZlSJdNPG99isXhdKy6kEGvF0HLO2qjyD+C0kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746734065; c=relaxed/simple;
	bh=o+DTlUShzMqTWdpVptHXPZF7T6Hpe95l3FZm/2enEAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jFfkV3aaNxiNVdUd7HvJVQ6NkRUeYfQW6HU31ZIPcBEvsIkrFQ3/GsZ5cmOR1vFHo+whgx1uFSWiObCIYDg+Q7Nmd35VVGb5kaJfPLecvp2iIvIKVlLnSsbRwdzsUkno1otZEtl575YCs+PHWOPjRT+ifCaixzhunpFIySphIZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=2aXdKOav; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="2aXdKOav"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3cfce97a3d9so10931515ab.2
        for <linux-clk@vger.kernel.org>; Thu, 08 May 2025 12:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746734063; x=1747338863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f4O20IXLpg8jEm9xUHHnlctypzKfsB1ZRP9Xc0/of3c=;
        b=2aXdKOavPUn9sAxWmYsuQ+EB/nmw+/n0y7Aa/BYfPwwslcWuase61qzV0M5vcUA5Vd
         /YSngQ3ZVuNg22tgxXI1vsAqeJqQyYyeU9ILOa72fMyiOsz4E2O2BdHBapCQTKC5cBld
         y0tzePEX/qXqGB6yAhGtOtPXP3/TmFIaU6udPQztcmcUF45GrF3Gf0cuENiqDPBfdouF
         Y2YDHq9DPjjMLmMuuoKJGsh5Zfu6BHloaNSHM+nNMu7QL3pk7/pAna7UMpP8dlyexMI4
         mizZUmmGgAVza3mTOOya6UuJU1uvl3/3PQrSxsqYDap+lA81q2ucvo0QcSf5oehm/hIf
         i/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746734063; x=1747338863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f4O20IXLpg8jEm9xUHHnlctypzKfsB1ZRP9Xc0/of3c=;
        b=kMKNQO4w9fDnN47MdY/3U1gSkTk1aR/ZjcQDd7K+pRqkop9IifurjNswfSf3Gd6/9H
         PDW3Y/LRkmN3gof/6zDehdZwLhBeE8/AQGQAUg5CfGFLNDjE0sADrslwKbBUFKEmZhyn
         wQ6b6qX1gqDN2hOlK3o1GFlJpkOXA6tqE3plpr8iMdhyJx561KC/fpAYOAT5fzlRLk+4
         h+4s7/jdkXl4kkvZz6YfBwGSLpVZpFPA9ncAeBfbPWzBvz5jArdaiXPk41hA1mzp2MN/
         IkobdWp9I7MF0siIRM40k48BfkVng/+xicKkz+JTms5+QwAIApuu5kAkXwc83c7ht457
         BQKg==
X-Forwarded-Encrypted: i=1; AJvYcCXANHuF4edEHNp+/UjmTNTGI+ulcNvKbeITdS9AESUTgHGw85xe7JlUKoQBmVAh7sToV4mxaBHJaCo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc6OIEDNNOGpy85CIZzJocVD06VWC/AyRc7gslAaLAEUbztPAc
	jDBvVafjAfEf7yL4HjzGZqs1r3sn4rrtnTvRhivC5fDxea5Y/mGiCY9MeXFnb6M=
X-Gm-Gg: ASbGncu0a7NDKzbh8T8xdy4gfP4lfIOrKUIZxy/f61ibhqyujjC2KiRx8CopI5KV+Nb
	+y1qO8uSi54NmCd4TDQAT/IakZ7Ar8BIi4G1kaKj1Ks2rOBtvLb47czkWKWUs4VFgiihAd/cXXN
	bNnWvFPZtm2Z6gNg/jjZ6LLyOTss/FwQKnsBCwCy5ekCliNnsgcA21LZLVTbcMYyrjiF+YXL2qQ
	tHFa2CFcnRTUYUcuD9JSycoUL3iKUgJS5HK4XSOtXeM+u1ouNXO8vKRHifx0qeyKwnpgZx3OE+6
	2k8UETwyzs1A5JeO00pYguveAqXjmfvKFK0rFizCXh0idPa7mHMCuvHJZHg4lMkEzwdvdBuH/iw
	3cZTdXUL1w+81Bw==
X-Google-Smtp-Source: AGHT+IHxa0h5ENM9DziETWmuFGwasgRig2JIzf55dVO2uhr/X5qFkUD+e9t5JjAw/tigV8feMiv7Kw==
X-Received: by 2002:a05:6e02:349f:b0:3d8:211c:9891 with SMTP id e9e14a558f8ab-3da7e1e26bfmr14255055ab.2.1746734063073;
        Thu, 08 May 2025 12:54:23 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fa226850e1sm93983173.134.2025.05.08.12.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 12:54:22 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	inochiama@outlook.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 6/6] riscv: dts: spacemit: add reset support for the K1 SoC
Date: Thu,  8 May 2025 14:54:08 -0500
Message-ID: <20250508195409.2962633-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250508195409.2962633-1-elder@riscstar.com>
References: <20250508195409.2962633-1-elder@riscstar.com>
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
index 6eec6328c26fe..f4afb35dc6bc9 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -346,6 +346,18 @@ soc {
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
@@ -553,6 +565,12 @@ clint: timer@e4000000 {
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

