Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B488B297B7D
	for <linux-clk@vger.kernel.org>; Mon, 12 May 2025 18:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747074758; cv=none; b=sU3erE1lYscLbA9yibuSMCAeg3PHvp25UGwc+uVmf2GDsdg4quJZgweHhF7xPOWxwWHFsqNA7RVswnG9e3bpeEzyahn/6tZNYib0661NXesE9EJhlo+uFCI8rlG7KwdOUNtP43Njt6Q16oveFz466UjPewg/BHNADc8Xn9vMwsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747074758; c=relaxed/simple;
	bh=KZJEwnPF2oP9YPtwzisRM5EnPhICPVWmlwFr/un/FRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OezryTGiFZ+AlcrW+xkPQNwjh5XUjS/mjqYthFvYQ0KRa9ypD7xiCO8CTp/8fU7RzfsPUIe/xa8yWYIDQZZ4gAtOn+O90OGZAmCDYFGcT8ey0w4td3j+6rPwPZ4h7DjQhWb9Vos12XIGM+V5JTxvsdvv2d+Eo6Uhc1uujsHKDzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=oDT9UmQX; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="oDT9UmQX"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3d8e9f26b96so45463525ab.1
        for <linux-clk@vger.kernel.org>; Mon, 12 May 2025 11:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1747074744; x=1747679544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EyAsDOHX0TzSNx8TRSfIb8QCj6vETa2EWwj7A6u+8bU=;
        b=oDT9UmQXV8dBmXK5S+NLUe6HI2cW15SYDuOUdyf7xEiSQrqM5aV5Z6+to25+RUHFjf
         j14aNFd64PHAYjzBfVLIF/MBOkWTFguQhgf4cnKF7cyX7CN58AwGkVpVcmYhSgmhmp1z
         UGnSNaZgyvWz5V1ItUyK7wsNhcu3RwVRxU9AyEl0nCUutftlxoZBtsBr12OjTOThtZyv
         n7c8XU3Ph3aPWVTh2XAgG+rexeF+TU1mBAkUCygYdOJX3z3oE9F/vbzNNM2C13oqT01h
         Co/HYWhVggZ/Uh6BjDjNrVbjxW5ln0kZaNisdNJyAvBYBKXswqM5Oi+br3a8/JZGJWPY
         1GdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747074744; x=1747679544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EyAsDOHX0TzSNx8TRSfIb8QCj6vETa2EWwj7A6u+8bU=;
        b=E8mNcKrBjDUmEtLEbDZklUdlVC77BZHLAdPzDIHwanHX3NFP2JrZxnHKkjQMhFuvBE
         Pn+vqDMfXm1FekEB3m1IBysoLYuMjEHDeD0HKBaASxElJX2OWtaeUzBhSeKZW+kLJ67y
         5/nEySqTREVQ1Adqn+EVR+GqVgU4DK54LtMTjXgQf4zMG9pxcPdeOYQhXG3xGdZZCDgz
         12CwXe+IvmkgcZqL9hlOuGipvHJYm7nT8/WNY7LTLXjQnp3rmLBDtprh9CVJOPmlYy36
         2a70H85ECc5R+PBxv4yq2lk8CEe56yPxPOMO0vdRcLrdKrIYt3I/36b7sup3dC9E7qau
         KS6w==
X-Forwarded-Encrypted: i=1; AJvYcCVtFgN3ZQ01pj8ExJi4zKGL/tABwEGey5I+BNRu3p1Tj/7Dw8piMyzBmKT5PIILusviL4LCRefdJpA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQOWFmK9jzyuMWRLPac7x87lrhhTzgmoHnoL8O2eO4rUEPJGJ4
	2OqqKU5w0MhoEMV8WBWBuxkuGHSVqvRxccyFHt5OOy3mcL20kI/3plwTdV0lhnk=
X-Gm-Gg: ASbGncuWU+55bK82Qjja7MAa/bo+ihv/k+7GpBiGmhOe2IgmNcKNinLNAPS163qYecJ
	JLAOcMXUyk1LtiNkaS176ef2cop4FiE5vk7WfUgIyvoWmpt3qWdtIaKA/aTQYV5ViBZ7zWkS+9C
	hHJD3F3Tzn6/iblXyy5GKbTWDwNKConpZbbyZ3sMicZ9Hp7BVbU7f1uu2wVkOLFSn5IGfJD5Wx5
	JkTy1xeOuXDsCRxbymnSmRLHnhZ7g5nQNd0XCbQIPNXz6Cn0r6CNbLbx5V7fhvIyRkcrevcJDHu
	dsifmaCBMgr87cmBR+AoAP/+aQcqqkhFdaYbuNQ3EeNRoY7BGmRhZ2rOsDAq00hPqM1B5rNCmau
	oCiwuU5Khsyz4MSt6ZWlMzbF3
X-Google-Smtp-Source: AGHT+IFp8y0gq7FRiygtuXYQxumD0qfklzDcQqew2MqXSZ32JaN7tFBN5F+L1BBzUbVI3IjffHBXLA==
X-Received: by 2002:a05:6e02:3784:b0:3d8:1dc7:ca7a with SMTP id e9e14a558f8ab-3da7e1e1acbmr157948855ab.5.1747074744563;
        Mon, 12 May 2025 11:32:24 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fa22496e9fsm1740333173.11.2025.05.12.11.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:32:24 -0700 (PDT)
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
Subject: [PATCH v9 6/6] riscv: dts: spacemit: add reset support for the K1 SoC
Date: Mon, 12 May 2025 13:32:11 -0500
Message-ID: <20250512183212.3465963-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250512183212.3465963-1-elder@riscstar.com>
References: <20250512183212.3465963-1-elder@riscstar.com>
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
index c0f8c5fca975d..de403bda2b878 100644
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
 		syscon_apbc: system-controller@d4015000 {
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

