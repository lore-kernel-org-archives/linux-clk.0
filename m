Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E797828DEEC
	for <linux-clk@vger.kernel.org>; Mon, 14 Apr 2025 19:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744658252; cv=none; b=Ld9vUIDSEiHYLAyuJbB1aMrmumDzbDE6n+rIdZdkDyUd++REwD7OXmziyyBnp9U9zei7pitahRdMFfNnv+Zn5fonb+5V7bDkqlEuGuBkBqnj4Kbe/FgiUV6hVhosBewFx6mRa48GX4zV8p2hwgN/Z1Mcf4zXSiB0jL3d6Q3erlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744658252; c=relaxed/simple;
	bh=2wkF3pIspsBICKC2HLHsuT/AUDwllqmRkvg4pojS36g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qLrXD3dpRw2W3yGdpF7wUeKUcLJ2VbKOFPVQvKcLH2EDKsLJ2YwPweIa4yEKWhrTVpoGtRQ3A9SRgXJJ7wOUY9UF/Q2tJ2ntaHbCMX/U/x/nS3Jn7vA9IVhsewkjhP8DxuU6M2g2QX66nAhAAgKq1WKZPob6ncQHLnlt074Nm0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=XGvpJDGl; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="XGvpJDGl"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3d46ef71b6cso39949695ab.3
        for <linux-clk@vger.kernel.org>; Mon, 14 Apr 2025 12:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744658250; x=1745263050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eoPF+bCrpMBavT+34w02cPZ0ktfHw7A1w/wlErW18/c=;
        b=XGvpJDGlUOuOcwFU6L0ajuTRJz3pbX13JRfyZgt5xQiPGERRE2dO2mldeUGmP1h8H/
         HEP/fSUu562TBf/gqJN21KMBKREzeVDozKgJNGbAd+rEaiVd02/Qg93HpcH8T7pP9dQs
         fq3jkEwAh7p93NPkyhTp58fxk+lm7XYp3uKZB25f8AYltN55X4qY76hhrm2xgXmDU6gE
         VuxapUg86L+VDodfqz+YLEw+3oUTci5dK7wM/CCFf/LCxSfeq7pFu+lmgXbRiDjBE5++
         xOreBNP1YHQ05Gao8wBt6ga1LcZoHq9hh8MMyvnAGZjYZC4eQn5OUFjqUFxZl3AmIVXA
         16/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744658250; x=1745263050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eoPF+bCrpMBavT+34w02cPZ0ktfHw7A1w/wlErW18/c=;
        b=LdptMv2oqOFprEEqIoDCjh8wjUanLncScQUCxOo4wP5hLoLBHjdwmUi9P+Py9YE+dy
         75S0H83t0SfwbuJeRLxnSdCE1c8IcMkCWToGnIwC2dldAZpNy48MNCdIQ0jFxosGkwvv
         a42A4ucBCbznaiRe59cH/8vr6fOM+gyi7Stqx7KZ08sKObeh3E+SHyZDbEvFXlbmLLNW
         DDT8AXkPTSjuvBib5GIZpzlt43n7WyS1nd55wRxWApnAf1JQ0YkLkE6dpem+Z637xOen
         7mKWhhtRCJvX5SvUKo401MFUk0MCCB3lB1RJuwvvfNWlgJrInQIAW0IM0sSetJGsCeer
         wqlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzri9LCEFSr+yrDBcFExaUuinsp1b9MPKURBvcoXjhs89Ww9GH6zQmlWIWIq1hhymAn3r9S+jCbLI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwABthoJ5XtUyhzcEwEPCpEoP8tJ/h8bWVXqYQHLGvm/y0VU21K
	ZGKwu/9Hfnb2A7vHoX/bBGTo+zhMkr28cJMuKJwkCdcXZVqhtUZye7aSrYHqxKY=
X-Gm-Gg: ASbGncvm1RhHWCa3XgfMk5GkTByIJi7bErkSSxRyblB5TxlfcP6T33sUz0+jcBDb9En
	1WCDUw2qzmfwNqefVsGRRuF9Sf+yJ6jTfjKAjK6rckfe6n4dkTcdQqjJM1gQ8IIUfNVrDR+xGz6
	laRfGCdChMQf9P+X1W1AeOtGRpAAblku7WbAVx58gBWIne7V8OBwsZKfJ/nrwdql/CDBkOA5ZXo
	A4iBozWkowR2Qru3lZoyiYOzrYsvc48b7u8Vx4QcXNhE4k1M0t/gIEqKu0J0i8VPTtSK4irwkn5
	QR4rcOBVAYZLIeCDBg3dRsefvGTKuAduAsDDvQ/teVrw9SWNkpOaCTmwr3+mzLxRr1AqXV+Ja1I
	wfpsBKQZYW3UUoA==
X-Google-Smtp-Source: AGHT+IEU6Rd4B2MJE8zIB8lmAeawMSoY6sk0rn3tiUuI43W7gRnclnskoSuyT6dVIrc85c9v5hVyDg==
X-Received: by 2002:a05:6e02:304a:b0:3d4:70ab:f96f with SMTP id e9e14a558f8ab-3d7ec20237fmr158153915ab.8.1744658249848;
        Mon, 14 Apr 2025 12:17:29 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505e026d1sm2715662173.94.2025.04.14.12.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 12:17:29 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: p.zabel@pengutronix.de,
	dlan@gentoo.org,
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
Subject: [PATCH v4 7/7] riscv: dts: spacemit: add reset support for the K1 SoC
Date: Mon, 14 Apr 2025 14:17:14 -0500
Message-ID: <20250414191715.2264758-8-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250414191715.2264758-1-elder@riscstar.com>
References: <20250414191715.2264758-1-elder@riscstar.com>
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
index 584f0dbc60f5b..491ab891788b8 100644
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
@@ -514,6 +526,12 @@ clint: timer@e4000000 {
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

