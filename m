Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1498422C32D
	for <linux-clk@vger.kernel.org>; Fri, 21 Mar 2025 15:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742570327; cv=none; b=DImAxHfk6sYzUT1lpaxWweW8rYx/YNcyOTFGE3rcptiBIcDi+23zTDmm8fX+XusX+YwT6yIjJL9Xh0qn0k4NnJodW/u5S1SeHplxj3dZK7whcJz+FOEvvmLDK+nn4dSFb9A4LPOtdOuSu2G5TWDu3XyQ1LKzzH0rfZ7ejkPD+Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742570327; c=relaxed/simple;
	bh=KwRmEv3W3EtqBDLfbMtwfsqs1joXJAuCfqCxq5Hb990=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C95vHkUIi6yYAf7QYmA8o3A1ABaKrHOpb2AFf3BcqyjlADCWzNGHtNeZXBQLwD9WgTBGHWJ4FLa3T3sfwUdIuHLnVnFrLOO9aDd24UVLAKQOJowdg7lanyhLrYAl8zbqZO/AFaMVkdKOUztBxMUNy9e13JGUiPsQw/5kPhcEWnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Gd15sIhX; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Gd15sIhX"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-85afd2b9106so204400539f.0
        for <linux-clk@vger.kernel.org>; Fri, 21 Mar 2025 08:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742570324; x=1743175124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nY3+cr8LwPrnwPUbr8ZQVdT4sW06Crewhjj4AmYBWuU=;
        b=Gd15sIhX4tO0We2cOgrcjjCQILRs9oNjnwwr8VcMiPrkYPlUQudRVvzHJ+tlLx0cxh
         6w8O9fbHHMbGhofKrkj33y4bbMeSIyY+HPEKUp6QLr+QElgcFxcqRnywXxdJciMO1Lyc
         98HfIqnZ8GP+wfpMAPiwJOs+3MnmysBWGGHaYMFDijrE9FJhbb7hNTW9SfB+2TGNmIwn
         LB3k3YA2OOSqdvX+a92wPeTSCC6FMIiBkZXdmWVSyMkcqiCl5sHg/KFfKsl0PDNuAwN1
         k+xMazFE756CJ+fiC80VHYQRtHGCCQg00n75lX9zKLAPnWh7zBsQRT6OsGHnT9Fytlrk
         Z/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742570324; x=1743175124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nY3+cr8LwPrnwPUbr8ZQVdT4sW06Crewhjj4AmYBWuU=;
        b=YUXsDycLYHq/lWDAlXpmnnOdoipGFSf2nkCOJ+9RIuZi24fX+olxN7m/yIhpPREYIa
         mU086RhFpAn0aLHH9H6W00O6ZEB1TKJ8767gQeIEuYWGmPMEFKk062eanhnF/aIrhKUB
         sM5wQaVIjymADN7MfbA0Qj1Lb7LOsPl4Isok+Fu9PJSNBas+zL/RE5MuxxhFNrRJw+Oh
         wf8HL/pGiTQoBKNHc90bVoAFwg9bEQxydA9kUA3kCURUMeilXVpGVilfSzu2xYR2N/3N
         eKGEWniTEPqgpwnWlzYULpMce16Rs22ElD19hfktPK2rmaQhNE5CZZurVlZv6CrloqMM
         i8NA==
X-Forwarded-Encrypted: i=1; AJvYcCVZLwGIsSkdA0Q2nV1BqQDGuXecK/7RDczLGu8eLjLF/3vPlP1e+hlNlR3y4VZoOP0HOY+M4JclSFE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3bPFFxcGJWJBYG7tOFrEaaDQhz3eKMaSLGuLgpqcqn5dc6/hw
	0/MqpzZpr55OY/bwqKybPD+ku3kvjygeuxBQb+j5byWUAPgcaeMXIPfAjYUGLzY=
X-Gm-Gg: ASbGncvSHpjWAFbc5lw+Xe9bNvny/LzJ7F2LeUZPdSUwYGNQAUyDvG+0b0eEDDgZ5gT
	frjGG04Jawl82LEiFQZpoXuhyvms5G4liluwRV5n+pUB/b1qJ/tDqrO45xotNy14QA70V/PyNfd
	Idg+zoMTIUTXOs2nT91XJuwdfNnQ+7pTS76JZ8sLspEsiFAL3d7Hui6mJTIEjAXCr0hsySfTg/j
	Eh5Q4RT8i/4/MdHhCclq9Kufbnwx75aeNzkmcjccCu3rJFaQGUc+faGIDIVWO2opx7ShSgXpyKF
	Z4FyiGr1qFsx81TikUDXL+pryrtzdnP1gMtJnNMurg/T1J/1GtyDYI2WCHjuXJYPsSb/mTFaIRL
	ZzDc4AquQiFmBSNQJ//PZOHvK
X-Google-Smtp-Source: AGHT+IGguI55dL71gHl0tK+hT91rVomg7KnVgw+/XoVslENUEzuEPRHi4KDVzYnSZRrU4EihCkbgug==
X-Received: by 2002:a05:6602:7512:b0:85b:3c49:8825 with SMTP id ca18e2360f4ac-85e2ca62dd3mr380237239f.4.1742570324050;
        Fri, 21 Mar 2025 08:18:44 -0700 (PDT)
Received: from zoltan.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f2cbdd0a21sm475553173.41.2025.03.21.08.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:18:43 -0700 (PDT)
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
Subject: [PATCH RESEND 7/7] riscv: dts: spacemit: add reset support for the K1 SoC
Date: Fri, 21 Mar 2025 10:18:30 -0500
Message-ID: <20250321151831.623575-8-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321151831.623575-1-elder@riscstar.com>
References: <20250321151831.623575-1-elder@riscstar.com>
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
2.43.0

