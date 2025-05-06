Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9319D21ABD1
	for <linux-clk@vger.kernel.org>; Tue,  6 May 2025 21:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746565614; cv=none; b=B+PDDdRXXFsCA3HcEjDanEoQ37PaX+3toYU9QBndOSawKy9fSKvE174xWjs65pEuhHSHDAv2F/Lksp70UNsu1V2SrndqsoI1E6h22/PTy+1pMLpY7R6PPfQtZyXMFRnIdYvINwW9eHiGTFUBoy7fOuOLtmoLCiYIoIhxt9xIoAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746565614; c=relaxed/simple;
	bh=o+DTlUShzMqTWdpVptHXPZF7T6Hpe95l3FZm/2enEAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AzrNZ0SEwFJ3F/wTfYrPUQtmyssp49PRYDHBkeB+ho8szrd65N6qYL8TEwZBM1IlQnEjkHhFw6AIHmgQxE2MJiJMoIqBkQz/iEFL+1rqZdHzL6iX3TGqPYe9Xhv/iGhEv1FuhH0HeWL4GCD/P4vv1oE+b5THM4pMbMcGIhCzgww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=s70s/p9Y; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="s70s/p9Y"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-85e15dc801aso560380239f.2
        for <linux-clk@vger.kernel.org>; Tue, 06 May 2025 14:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746565611; x=1747170411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f4O20IXLpg8jEm9xUHHnlctypzKfsB1ZRP9Xc0/of3c=;
        b=s70s/p9YwSg76W2CTUcTOU/9EKFOSwuKQqErfuIuUBIRKWXo0xgx6dnHv5A21YPgsE
         UjE/KpAvjPMp6/D7tUn76o8B0eG5qcZI3Wwliw/pxspJajr6NsNzj5iCe60ZXHn/H0Wa
         LSnJUApysR8jiBaVWhCKrLcQDy6LFtKcOQ678+06MZInDDv9TXe/YA10ZXgzQobp2lqP
         IGepf4+M8ss5Iovx3620LCehFDUwimyqheTYxrN59v7OxMYxjwwCb6KFBgPKZEkeGV9B
         Z2//pNl0OCSOGJbhMBU4kld/4sWRWf/mBv/8gfKh+V4Ws8PnKG7oqs5zhdBLIxBcRsVZ
         6QjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746565611; x=1747170411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f4O20IXLpg8jEm9xUHHnlctypzKfsB1ZRP9Xc0/of3c=;
        b=maSA8vzXlnRextVYmfqwlANOFIM68F+VFrZ7RrKCxzEPGcRakgpxM5PpchN8WUFrb9
         TzWFDtWhWPIUMRrr28NsUKIL5IteE2wtf/ZoplnBRDc0Q95H+tXoJaehSzSMwQc+DUaE
         +k0MvpJb1VwM1qSNz5Eg7r+Y6wrt3l9EguLkgHq2QnGwBg3okpF0Y5Hur+radepioZOS
         mg6W7P7PbMvjb4YOPWPYn9/gl6oXoy4OhDDwEVzu2hrZcXnbZYAxky/T1D2lXhPlPckt
         JzIIX2fgPVoEzC+2rvM5VOG/Ul6LfnlxJUjc7Z3aOVq+TwFAEP8+vzTOSr1WMO2/loJM
         irQA==
X-Forwarded-Encrypted: i=1; AJvYcCXdAIjm4KOc+bW5IepO+EWPL2l7CR2iPOGxbnbCYkxCWv1Lsjxnssv+FjBIYFc3KNK/Sk82YCgq13M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOmQ/QBt3qr/ZLF/B7T0mqpcrmGPZEKU2yhWTkizHoxlRUSAyZ
	Vf0Mj7oRQZH40vXFeJ1mD6agbWrRYIPOQuM2Jo2uz5KequY53XoLbJ8obbfLADI=
X-Gm-Gg: ASbGncuv4iFunZX8FjtuwD/P2zgYNDIFZFyJMWR2bYuH1QW6wKu5HtyWI4sxvGpzOp6
	xBpKjM8xOdJb58S9j9XPhEiiG4gSNWCJs5pMpvXirBUl1lzQGf2lWtf0TARyqSJjm/A1Ebbg2aj
	8MJ6g7ytowJBlPoJdTSUFDzEhf8lFVnElWflxbSEbmnjM+paPbSMb+D4DKmSP9H4lBYzmWUsXTZ
	fP45JLvX4gcO0vkQUk75YQpNKIpaeXN7rwrxYq51+fujVmXtboA/7YJR3/AQnEpAChFtcU4Vr2Q
	rVvktfka9GKxjMMv4jftKy7uBhRkimhmvb0zkKLTAKSHy7uc+Tp1UTe0voaYUVxFF8oTPmKJbbL
	MWsjitICI3hv7zw==
X-Google-Smtp-Source: AGHT+IEul28rdtLnf24eQSg9o53hrAPhvZHN/Ndz1HzML1us6xJoFlvoRMcUFOXYOR8J/ANloTh/Jg==
X-Received: by 2002:a05:6602:1350:b0:85d:f316:fabc with SMTP id ca18e2360f4ac-8674731bb70mr129539539f.8.1746565611497;
        Tue, 06 May 2025 14:06:51 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88aa588basm2419559173.79.2025.05.06.14.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 14:06:51 -0700 (PDT)
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
Subject: [PATCH v6 6/6] riscv: dts: spacemit: add reset support for the K1 SoC
Date: Tue,  6 May 2025 16:06:37 -0500
Message-ID: <20250506210638.2800228-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250506210638.2800228-1-elder@riscstar.com>
References: <20250506210638.2800228-1-elder@riscstar.com>
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

