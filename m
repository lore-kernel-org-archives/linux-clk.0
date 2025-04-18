Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05DA1E1E01
	for <linux-clk@vger.kernel.org>; Fri, 18 Apr 2025 14:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744988059; cv=none; b=GFH3N2gnKHA4WwU4TQoQcqtBoS6zfIAEoVrYYOkCoG8LW0uko40VLaw3FoJsE6UWQxtSpKGZY36BSlSWGW1Gpdd6bxW2MQH+wFmrnWZEWul6ogrsPpLk3e2PDdBZ1ERtTAnRNVAXJ3DmXHcHUMQBcNPUW/BeVk1/s3B+23X9HHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744988059; c=relaxed/simple;
	bh=2wkF3pIspsBICKC2HLHsuT/AUDwllqmRkvg4pojS36g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fl078kChxTQx59/kTjpx9ncDRit7afXDE4Ea/TdfpMJXH9vXz2IqICbPUYmitU114uB7jrDweT//r642OaxQpYJ/EH2xBL+oaKFy3NQ+dhV9nd56LD/YoU6s2z50ytJV7QG7VzwymnFfIDzZeRNxp0FSPL1IlskXlVt52Vpkrdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=brB4WiJ7; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="brB4WiJ7"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-47690a4ec97so20005231cf.2
        for <linux-clk@vger.kernel.org>; Fri, 18 Apr 2025 07:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744988056; x=1745592856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eoPF+bCrpMBavT+34w02cPZ0ktfHw7A1w/wlErW18/c=;
        b=brB4WiJ7ykQIKkjXrsw4pJSxQ0RzOI6JhiBwqVGN35guHjs8QLRsD2LRvqfQ19v3Ck
         WssnAE6C+TEGUQaT6gO1f9c5tGmax0GoxeBzRzaPxJSOMiyZMXUcwpn5FKE0EwQ4Dedn
         44XK/viYf2HaVWAV9kEv/vmzYIxk4SifolvdtSKUwXWqLyINHz3rQnEors1kMxhNtDWM
         uIHkD8uLVnWF29+ZOEOPj+yguxceA0CFH6GViIw1N4klLtJRE8LZNtvp4BT871RYhVa5
         vAn0Kcj+4HjNiVWNHihLekgL86hUTfIQyvONsWXSO8oaKF/cOsIzk4AKdv6uAsnXU81j
         6REg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744988056; x=1745592856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eoPF+bCrpMBavT+34w02cPZ0ktfHw7A1w/wlErW18/c=;
        b=SvGwTxTDQWwXBQP9B8W3c7CdgGOh+tiS63r/nwtb63ICWZSQKIk91hlp6YwsnaQR5m
         I+N3nRT9l2qGI+LV//QdxR5JwgiYL18JqcuFo7/gy20uHHhgaosyabKTaUr1p/9su+rt
         sUj1V/7mE7qqSIqDBraZTRbA1568szYsRT0XPkCA6kXdGGd7ftLvqXmmwvipp6iK/Lz2
         23gxjbkC/22Ani+r7kj1zYR5wS/aX6eejCO+1dG4Cg78Gk+CXtaYvLyiK1N/g6WQ06wT
         h2QG7xPBFSIyilcfsQgblrpGGfwqGJIcRS14sVLLFxGfbXH6AY35XM0HBTwy3SpQZp0N
         2LrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaxcXJVvnfmBnGx/Lekye3koRJVMAYw/QRtYt5rRHll6EvAHVEgq6YEcvYvTq3sEIeC7DNTXGnfy4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCyzlX68eeG3F/hOKXZIhPLW8UeHPD/rqira/AQU/pmq9rd27P
	Y16Ug8fOjNqTAxjM09CQy59jIYzODfPVg3Dk+SbpkR5i/QIE4pia4aylkxyhMRI=
X-Gm-Gg: ASbGncv/TmvIPlKAXy1fvjgizr6kGzGHnU6hmXXK/8cCitFx6mycydf4mgsqayQqziy
	EmojwSazVoU1Q65BPIGcAvYes6AWWfIA18fgN9lIeNtLWcXxMiFnuHQS2LxQaZ9CSR8/j6P0zP1
	2vzmwCxcNrr2EZK5vTMgBqEqxG5c+rTQq28gMkV5AtxYqN9T2rWpD83MDVWNaeR6iVdlUO8+mC4
	7+YWaHPzrZsWeb02YRhEdYLv0g9LY+QCprGR4UHb4z6eftVtfAgMfgy/wX8d3g6+OSrhkImYDE4
	IRE33uIA7CpMlgOMWVJH4P5AXPyb5u+t7mBYcDi0GG68AuiW6XzXz8BlLO5ToalNDfZ38GEkJrg
	7Ec2apzroY7gyog==
X-Google-Smtp-Source: AGHT+IHNVbMfjIlfo9PHEWLdLnnlwobHS10wrAnQS7/2BfmnC2z46vdeRRFOkin5pnaA1y6blfUwPA==
X-Received: by 2002:ac8:5fc6:0:b0:479:be67:3bd2 with SMTP id d75a77b69052e-47aec3cb8f4mr50692481cf.23.1744988055824;
        Fri, 18 Apr 2025 07:54:15 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9c16ddesm11329201cf.3.2025.04.18.07.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 07:54:15 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
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
Subject: [PATCH v5 7/7] riscv: dts: spacemit: add reset support for the K1 SoC
Date: Fri, 18 Apr 2025 09:53:59 -0500
Message-ID: <20250418145401.2603648-8-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250418145401.2603648-1-elder@riscstar.com>
References: <20250418145401.2603648-1-elder@riscstar.com>
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

