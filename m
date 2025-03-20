Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6CD22CBF9
	for <linux-clk@vger.kernel.org>; Thu, 20 Mar 2025 19:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742499907; cv=none; b=S2eCiRhVvQlIYaQflkkzEucRvnOFI9nRr5hEerqn8lzq4Fy9v3u3Um57KUTTVfqRh3KcESBADX5DZreCdrrPm5TCay+I+k/6gas0vK6GCv6Rw+w22DGBYtK2HmyNRiLJuklhjvsiUKDCb7bZrnCS13Vlh079WJrcLmdW3sSR0ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742499907; c=relaxed/simple;
	bh=KwRmEv3W3EtqBDLfbMtwfsqs1joXJAuCfqCxq5Hb990=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ruwJhKMD9sGYN2m4oGchUfRmK0pEp5bbK42WGUzmcfZw9fE1HktjYNmxFHSQKdtXpZa3gOEdll0dvt1tKPDo3N+oQRcTaOZehCpEb0s1IxmU3KCEE1//TaCoCCTlqxwpwrGkWXUpuSgiR/zlgUXHz9d5XPE/bJnJpvYNGA2yvFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=etZ7FVHf; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="etZ7FVHf"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-85db7a3da71so84693539f.1
        for <linux-clk@vger.kernel.org>; Thu, 20 Mar 2025 12:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742499904; x=1743104704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nY3+cr8LwPrnwPUbr8ZQVdT4sW06Crewhjj4AmYBWuU=;
        b=etZ7FVHf/t4RCwsZTTGfwWYqlZhphkFp4QJIBL3GOOpZxDQ9nbLGQH9PJ2cgyAePPl
         bYBE024SQRI60ILNL3ugxJxPKrw33j6D6RWL66JWKJ2NeSMqTs1kL4u3sJ3d40NYR4YL
         5rnSJ9qDaGNIot2I5KBU/nAke7YKPyks0NGYmYP/H2SHzVncbUVMsYVcZUeYZx/yUT90
         9eQM6gWaGkF1YvfK6cP8s/onN/Y661U8ITUlq1UXBVT/6327J/s5tDoZXbx8OSMG9nv1
         zpfytJN8xdBueBPlJBrevoNz9+S+eix7ujXtXaH24Rm5lTfMjL6CoqI+KZlqhbl9OAn0
         kWPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742499904; x=1743104704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nY3+cr8LwPrnwPUbr8ZQVdT4sW06Crewhjj4AmYBWuU=;
        b=PZ4gzybZC8UEYicWzefyO6stBMdYFcK9vdQEpNNHRzXMTDgBeKwTWjGApiu1U2h84C
         tO2D8hN1FIT/73kqYtkq/ukcXAezSP/+W8K3ddu6T/DXwssDYG8sZm2Mf0CRMdGTC2KY
         GcdVe8Dg1jSN/UeGQec0m5vs7utxaCZuNIa05v103GzvQevXtY8Klw3Q9A0NZ8gXSfco
         6wO6ZREITsgwDInFSU0pbTP2sqAWE5h4g7GqGrBUJ8qsJ9s4jpdZMJCEZEotUv5E9bFd
         2yraaQ+fqjCiOdrF5amHY/a2wSfncbKmLRwvJhppxXTZu6856yzKyyxjhMYSjEAcweXV
         n58w==
X-Forwarded-Encrypted: i=1; AJvYcCW4xcl5dADcOzp++t9dsjB6Bnp4IXUQq2rnXoYhLZWo34Zv2YJcwKGgRgvODmwSwze3Du/L5Lbv8I0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6c8YHLXUnxSPDs6IRhIqVjw4clyYhE4uVni2LhqWxIpa/nlhA
	gPrVD6cSv+9g9/5XOV2yAfrP/DDgKRS1fDixpwYAnUqU4sX+8ppEDoNCOmaH/NU=
X-Gm-Gg: ASbGnctBBcFAjkm/ygxWItgvwZgzyha4zRNbhgku20uDDg94Cha8FbXFXkCedt0gjwD
	CLYJVQBL0ogXvjQnZQzKY9EbQqCpNbIoccPPXA6hWfzDNNr33Ckt7Wbe3MGs0pQN7zbYqnAxbPh
	IrHb8MYL68DwUzSVM+mtMkTSxVw4V3nF51BlUI6WlXWak2SDvHntf6aEcMqhkxJSMbTYWjntsfl
	j0esTqlDxjN6b+94rdh2C2B7j6aLOUkvv5Ex6vG6giarUrlpNhtPK3yf9a9xJfUg3wyifrfzDyi
	WLPHW73D2Kewm0JuTJVPGaLtIc0Nd6SC53U0k7gHJA/m6pV5iuFLeLX6/mz5+/ifmmj9gvxR6ox
	zfhiGAU5pWzlzh0ytpfILdgCc
X-Google-Smtp-Source: AGHT+IHW4ltSCaG93SoWDansawq4DbhKwVMoGQNM/OgukHjVy68CtBuW9QNsRfgK8upO/XwMcw3t4w==
X-Received: by 2002:a05:6602:36c4:b0:85b:5494:5519 with SMTP id ca18e2360f4ac-85e2ca6fff3mr65533439f.5.1742499904534;
        Thu, 20 Mar 2025 12:45:04 -0700 (PDT)
Received: from zoltan.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-85e2bd8c40fsm8341439f.32.2025.03.20.12.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 12:45:04 -0700 (PDT)
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
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] riscv: dts: spacemit: add reset support for the K1 SoC
Date: Thu, 20 Mar 2025 14:44:48 -0500
Message-ID: <20250320194449.510569-8-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250320194449.510569-1-elder@riscstar.com>
References: <20250320194449.510569-1-elder@riscstar.com>
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

