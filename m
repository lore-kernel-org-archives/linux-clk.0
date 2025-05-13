Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00C220101F
	for <linux-clk@vger.kernel.org>; Tue, 13 May 2025 21:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747173241; cv=none; b=pmn2RFIuUtx/6ifjEw10j2gqYXX4AenAQNtUjlcUc6o4ftWQQ/FN6l1eOrnkEB577QxWevNASRdNYn3L+EfhRrioWmmhyAqfpQk6K70phD0JDcnNYtwdLW6HmHXYYwZ9aZLghQXksQwAGcQ4DYq9bhK/uz5JtRLcBRcy31lQj50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747173241; c=relaxed/simple;
	bh=ofhrWzbkHpmkRBFTa000gjfyL5s3fJzmMKuP+Rinp2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EwLCJmi+NIdxEMt7XVVyffEV1pFAZOlTRSA7iKQ55jYNz1MfJmclxMENUnGHnkGjSge5abQfEbXFxvtmbC4xLV1h2RRIlg8Ipgscl2d8G75koksTMaGEhiQO0Xg0wsZuwZhHIXW37XRskCfoIqGjV3ykf57IbMIEy/krv030qZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=dz3b6fUT; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="dz3b6fUT"
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-86135ae2a29so579837739f.2
        for <linux-clk@vger.kernel.org>; Tue, 13 May 2025 14:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1747173238; x=1747778038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXQ0rLrEsZDkkO0xDOFrK28pA119DtQt4oQHk7dYEkk=;
        b=dz3b6fUT5Bo77jLbkE+xfWniAuHBX8z0tWvW7owyxF+9dDsJMVQE0OgcHl2Kxetltx
         FDi7Z85hcahSYDWUKD1MoBFsQtEGV7yHxqhbL3CpsBVtu4cg3qVSaPLLlbEpP8DI57LG
         FF/d8+0Zt0hVA1u73zeZCVqO3+kma+Yov7ygBJytTddSEXNZ4coQnDZrgYgE66pMIYPR
         hu/5l1hGODg32/9wqudcrjRMJR1xX5JlXVPa1diWkU811Xj69heFefY389AWvKPQc3Ui
         PXK0M0iwrRzd0bOISi+HNO6e3CM7VC7aHT/MT56ruOAhZ+6MRq54c9dJWSCNm5A1SSF5
         NAnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747173238; x=1747778038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hXQ0rLrEsZDkkO0xDOFrK28pA119DtQt4oQHk7dYEkk=;
        b=h2t9BuOUjDPAZw0cyUpujk6xwTubs01AUz1qPpuA94MnSW55PIekcanSRtCSTXrJF4
         y/kLffu2tlGjpwG5MdQGzpJ7uBd12ngoTqsM5bGR+NdP0jIefvD686ytVQRKn/6Az9JY
         SBdLKgMIOHHH+5titG+qXGgOlQKpco4REm/sFe3nqagwUrBItyT34Ws7JPpvyZL99cK6
         XScWj6Nnr9/dP27kSQQGlWaUPM4sJ+mN92ziyeuaWc/3+xlLpmMLnl1kW5inEJ/Wb8z0
         T0rz3HCU4J4RPGt07eS6eF8Ynjt0ilzUhIT36ujY8q443AF9wvSYzcwRilFF+nipKcFj
         /YUA==
X-Forwarded-Encrypted: i=1; AJvYcCX55YbJkfTQRt6PlGf3mXF4lsBvt/rpuGPkCHe22VUcCBt91Fo+1zDtGI4axUdfmWkHr7CxNAcNi34=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2zWwXW74RdYFl0xXGCON9ze5UHkFbhsQBm73B2dj0AHOpgdEz
	CFJEZ1Le73GmUhr9K7JTVKvVSTmj1R0Dq0iYYbVrlo62GEzc2bdQ0mpXZhv7hfc=
X-Gm-Gg: ASbGncvwwb4/Zv44Wjdb1C1cT5ogsfF52ME0QOjF8ycSuXt+at7lIn3sGGnTiK+s8UI
	hH0tiJv1uoMrk4c931Z/HC01axo2q7WnDGziry6K7dvFxkUCrlyro5u9nYx7rQZN+0tPKZFp2GP
	H7cbrJXkqlcZCL7dkf2cZAAZwd/l2D5EXw3/8tz+clcFN2q0qOT5cCeyvejh+ybxHzutQqSsyk3
	6qrk4szZsG/PdFg3KfwR9RlETAYhXQg89Mli4n4TMcsTJ0lXM+UvlS8y/umKXicF6j0+m3qO7ln
	ELXbcH9jYhXpy5ozitkKxZmczxEsVypkS4BiDNQHA7rZJqZVP1X9CA1zjVW3d4ZfeSxFXjYHqwa
	HiEhdLvVulcUps0BXiyzu7Jcx
X-Google-Smtp-Source: AGHT+IHAidM+Hnbk1eCF9zik0cgy840UdEyeKKKxABRP4OWyRlKVuC+CHVe97np7fF3lS1j5FvMYHQ==
X-Received: by 2002:a05:6602:36c8:b0:85b:3885:1592 with SMTP id ca18e2360f4ac-86a08e40afemr117157839f.10.1747173238154;
        Tue, 13 May 2025 14:53:58 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-867636e0dedsm239622539f.32.2025.05.13.14.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 14:53:57 -0700 (PDT)
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
Subject: [PATCH v10 6/6] riscv: dts: spacemit: add reset support for the K1 SoC
Date: Tue, 13 May 2025 16:53:44 -0500
Message-ID: <20250513215345.3631593-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250513215345.3631593-1-elder@riscstar.com>
References: <20250513215345.3631593-1-elder@riscstar.com>
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
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Yixun Lan <dlan@gentoo.org>
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

