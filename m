Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C3528FAAC
	for <linux-clk@vger.kernel.org>; Fri,  9 May 2025 11:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746789660; cv=none; b=J8SlXji/cHTeaX4dej45QypZbxzvIx5+4quWrN8EIwZqi5jni3IrA15RNG8hZMSJVneha+ej6CUiJxJlTQYP3ccnIqAd/MZ64VJgq9gtX8HD7GSjk+HAyTLBqCsH/N0C0Gd1d1NMYhlvHk2f/2GJkYVI09GrB60JSU6DesnZt7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746789660; c=relaxed/simple;
	bh=o+DTlUShzMqTWdpVptHXPZF7T6Hpe95l3FZm/2enEAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jSoh5kQFiv4+bn/Njr9x8+hWPu8R6GnASVuC0QmmJbPM8YttpcKa+SvWAZKk4C8/92r5DTO2CkHrVmc96mj1+gK24e0yHMVxfikDZdVRuifZtCmV0eyG7gOUKC0mJQaxDuRSHeCGUXcJasMLscbml6pLYdDIX/+fuqXXDpFpK4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=fpRMZNaN; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="fpRMZNaN"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3f6a92f234dso1589661b6e.3
        for <linux-clk@vger.kernel.org>; Fri, 09 May 2025 04:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746789658; x=1747394458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f4O20IXLpg8jEm9xUHHnlctypzKfsB1ZRP9Xc0/of3c=;
        b=fpRMZNaNzcLTqlWIM83XdQyUPopISFsG5+RlfVX1N/Ma+GF3Dk6AjNeL7wb6MDRSIm
         rNzTowjAkrIlDmATUuU4eLqFKDh9JhwFWY1674HWQ4rT8WtsBSkFUziXw4zxFtOaAATx
         M17/Z5VH0A/dDQuqInHbkbcAqNGyrOa6ydaw+qw72hi091io3sRrU1q2chLOnCnWUSS0
         YNFBJ5xpj3VH7kUsWGos8N9Qqlbtb3VhUS7JjEHMk27epV1qGSRidy3TVUCaScEvjXrj
         TRW0jAgZSsruLtfKQrZnP15yw+bm3EF+e9IbiSkm2y97u1TiGB9LY4nf6JqvIKvIamEK
         hMiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746789658; x=1747394458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f4O20IXLpg8jEm9xUHHnlctypzKfsB1ZRP9Xc0/of3c=;
        b=lny0yVuaXCPLIrcTN/bXlLsmHzkGBX0fy3hwsAdgdfi0p/RhJWD/sz9gltEqleQxAE
         bBPK3I6h27HsRIDrsL0V9mpkT5FRpgCpEDwJdUzceHsCeJSp6fbbvOKLBUsjs4aENrnW
         sTullL8N2LJDn/tEQvIJW6QccPZqUxwtb5seiqXTPmyKghvLPE4s5y4Fu0RrvSgXkn3q
         KbcAGE+EV2t/yWQsVdHIIGW0ls9njUV+h6zwk49P1QBu7pyRu61xA+PLXInQR2ym7v7f
         2y440HlQjC3rPcXE4mu1YuCln1ong79e8POyGid98vYyHXYXmgbwDSa68z4CqaDjAFuP
         01MQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPCwWlT5nY0an/VWqMquxAzREPmagtlb3VpZURnK42rAwo9AOX+uGa1/ElJrjgtLuS+/nBbHOjdeM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVYvMLiMkGc2oBriXWLw0RhQu1SxMkFTJ315pCC27aD3X0DoEK
	dCLj4+6gCcUYy/P9lTANgT5pMc7buWTVEBLhE8k1u4gG38GF7zEnJ6vBik/iZyl4zKYuKAFx90n
	V
X-Gm-Gg: ASbGncv0mFinyQos/iBYX3gnLQaGeOqGCmnbXZ7z8wxBXJ0SmCQ9NiO7zYt8pSagf6h
	oFEh5UwefCCUyIuuWNTw52+zM0N0HbIZklUHB90oYw+3Tvy3xy6E38bZCexzlY+/oImdHU88Z4d
	lxtpB+9exYLDNaaxg3RLe8l40/vx0kHD74mtkM32QV/qsgQCP3uHe7KVoqWao+ndnjzdGtaZ8Qs
	SfrqT3zgd+B0I7g+jAf0YmTQuSjiz/uoRlbeedjsytkv4xA/Q0ZqVAc7IrjfdCxQ2M0UlLOcADS
	OCaFfqMtcpfOWZ3M73Np+Fu5PqYg9yDkBtG8yZlOviuhNsefaIUHabLHlST44uWJowVhr/FKTkC
	5zy4h3BrdyfwOC8rdDkYwFrkj
X-Google-Smtp-Source: AGHT+IHhcPDh8pSsBNqyKD2nWRDYn4h+n+ZvD9Pi5ASi8e+tMvfh3KEcYvhc33cDnA1c1ksabwra3A==
X-Received: by 2002:a05:6e02:198e:b0:3d3:f4fc:a291 with SMTP id e9e14a558f8ab-3da7e21748bmr40779945ab.19.1746789647038;
        Fri, 09 May 2025 04:20:47 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3da7e10549fsm5136325ab.23.2025.05.09.04.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:20:46 -0700 (PDT)
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
Subject: [PATCH v8 6/6] riscv: dts: spacemit: add reset support for the K1 SoC
Date: Fri,  9 May 2025 06:20:31 -0500
Message-ID: <20250509112032.2980811-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250509112032.2980811-1-elder@riscstar.com>
References: <20250509112032.2980811-1-elder@riscstar.com>
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

