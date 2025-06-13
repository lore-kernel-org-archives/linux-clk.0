Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE5D1F8751
	for <linux-clk@vger.kernel.org>; Fri, 13 Jun 2025 01:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749777118; cv=none; b=GP8Mxnenk9WWGQDeF6mQm15Pz//BNhf57oo33Ub4M080Rk3oO54IueKch5ok2dwLZkHH9Tjdn54cwunzHF34xqoRiFlhLVWenIH1NrUiG0y0ldqxKOn/e5UD/vnPyXeRU6SLjYk6JEXYkNv1a3JhbIEu6PMbPVsx4gqHe+/KsSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749777118; c=relaxed/simple;
	bh=ofhrWzbkHpmkRBFTa000gjfyL5s3fJzmMKuP+Rinp2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R/+ELNz4X1mp3I+vMu3TkM2Sp1iaAB4jJMQDunww54W3j6HyRA98etJmWYBl2DL+JGCUYBAPXLID4K0Rr6n+/wHHZMZtF05OvFpNZBxwolyTkUUy7lllId5Gva8/ElogfllRXwhkphCIFY1vKfUD6UHyStz5t6yJINTnEqpCunw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=rzwb0w2n; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="rzwb0w2n"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2e95ab2704fso983543fac.3
        for <linux-clk@vger.kernel.org>; Thu, 12 Jun 2025 18:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749777116; x=1750381916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXQ0rLrEsZDkkO0xDOFrK28pA119DtQt4oQHk7dYEkk=;
        b=rzwb0w2n5AvxAfY/2lxncPaWf58Uof4h/hNJ4tOREjuGnidyIzDmvVHBMRh2PPyw4O
         emULH71LWz88F/4+Nu7kdB+Px76c9ufo0X50iIjKaRWSPSms/CU032sWZ+ebHepuWiAM
         LXvsBeA13Z1J68GFSS7o1Nv4nuuFkZynMs3Ky/zOMAyb/aTTGJRRrv7BM3CXRzIoTEAA
         aLG8qbLzC2Fe/J7hqFNIgUIRjSjVIW1J8d59vye3R1dEafCmuT1B4zKXqxlInGkrSfgg
         J+DaxXWJPQw9+ZqUxlu+Gc43YwF+T+9GA3VtULuAh04MD2pdoHbcf8Y44UNjcAhjxUsN
         zrzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749777116; x=1750381916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hXQ0rLrEsZDkkO0xDOFrK28pA119DtQt4oQHk7dYEkk=;
        b=Hmn0bDHBv+1xLzNfUFmbm5SRIR65k7KS4abTl7LNi9HEyym7Fpk4lcfyMZAd8SZupd
         E6nTBQFuLawaF7cUqEk3UcewWiU2KFBayWqArVdPvyY0pjo5/sQhCdnzXu9XSXmSVhzj
         RZJKx4UboMVGwFJtydyUDT8bP1Q7CN26vgw2kvPsP7eauAxeQPYXmQlsUGkyaCtjCFfJ
         Fs4flgkbDwqdrbg2qCXcNK5mjR1x5NPVkfGtf5uKchjeiyUg8NUckMeV84RvQHxF3PxH
         J4DcR9HE8D2V5v3AtsF92A2tUMYVAtXQl4jYvc9LmQqgNEqoZ5C80P8LY93pcTs1Xq5d
         8bNg==
X-Forwarded-Encrypted: i=1; AJvYcCWqpYhn3WM6nyLvHAkfLElO49xIHcJxl7NQIU1IFLGfp3IV/bAcZV1bhI0Kf/1DwBi50v9TMG539vo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiwFIPMcv8JAii8iXp3A8n7rBc+SjfwdH+jbyhZI0MU1sM8gLP
	lE0gz3RmXIw1sTpuXD0q9QnwNlPS0su9wqa9tC1iGfRy+ATGlkpqElgsGpQgYJseOws=
X-Gm-Gg: ASbGncuxwydhwoumAX82rQF6Y6Qpi9n8vGQJsLRuQriJHxMtGHSkVarxUeSZuJPJQ1L
	dVZla7rYWxmeecNVauHjkmd6tR9VN2XSCrnvSYaL3yrY85Qy90YdOcdRmZdqAcFcetuvxs1+Nsd
	edl8QKFeesgwM99tsF52WZp1CLcG+fHchqInyNO9mEJOt9LgNWDHQT9aCW/GzFDiDEhLffMDDrj
	3Beu5DCy6jvqeo22sEq3Mk6T31f+D4f5xPkbj7eW896vQTEl5+YeiK679ly/PDUajG388r/Kqo/
	VKn229DyQRi1Z901HlV2yl0e5giNBPo2SYAQxAFgKV00Nlte5zCRN0aHzGD4V8dqKfVLiHtAqO5
	zVz7pgsh+JP0Z/PejfVtKidAba/QtccY=
X-Google-Smtp-Source: AGHT+IHLGWUc6QmwDBxYgPL11fCgmmDxgrSTZTWJDq5NM0vixs6NHFASZt4TXSVYr14kHaayK453+w==
X-Received: by 2002:a05:6870:ce88:b0:2ea:d491:eb45 with SMTP id 586e51a60fabf-2ead510a3fbmr744385fac.18.1749777115684;
        Thu, 12 Jun 2025 18:11:55 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2eac0c17211sm407685fac.18.2025.06.12.18.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 18:11:55 -0700 (PDT)
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
Subject: [PATCH v11 6/6] riscv: dts: spacemit: add reset support for the K1 SoC
Date: Thu, 12 Jun 2025 20:11:38 -0500
Message-ID: <20250613011139.1201702-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250613011139.1201702-1-elder@riscstar.com>
References: <20250613011139.1201702-1-elder@riscstar.com>
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

