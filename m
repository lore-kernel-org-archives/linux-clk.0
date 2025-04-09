Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F8621CC7D
	for <linux-clk@vger.kernel.org>; Wed,  9 Apr 2025 21:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744233477; cv=none; b=RSugFUZrurDd3RO0cCT4AFvv13+q7fVx/fWLCVk/hyofFFHdYdUa+Acgu/ujpM+992IveuDNWZSpDdCLlxZ6Z0NdOqY8c7hzS8oXK2zMwGIKXe6a6d9b779B1vN1qLK80we+42M8mOjoapF1DLS33fSlRth8Og4No9HVIS2BGMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744233477; c=relaxed/simple;
	bh=2wkF3pIspsBICKC2HLHsuT/AUDwllqmRkvg4pojS36g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jaowjBfZyj52RIFA+bDnm/9tsLAZSrFlq3+MpIYaWHl/11kY/1xSwyYuhD2t7hHjnyX0Bb5sPyLDbLt3kK/4KgKBhl97kvzyg5Sj65ykLsVnCpHuZREhqzB1lI5m3xOfIg+Q1mN8ePpOVzuDlSXyankmQJeFotBysr9mUzH4kII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Wgd9dG67; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Wgd9dG67"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-85b43b60b6bso7180739f.0
        for <linux-clk@vger.kernel.org>; Wed, 09 Apr 2025 14:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744233474; x=1744838274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eoPF+bCrpMBavT+34w02cPZ0ktfHw7A1w/wlErW18/c=;
        b=Wgd9dG67O3b9KQcZIiyez7vBcybE31TYpwb9KDtT2l6EBd2KwQ5Qaof1p7yUgUlVIp
         gOXmwFAT8pML8Km2DfmORUb/XHxgjYOzpoZeRkSNcKTsOds4iKIKjixMxXUj6O3Mjrmc
         cmWJGliaKFnF3btdoP++HblYfbh+bJJyhiBfJO9OaI/AScocpFuzzB+1GZZIgsDTycnY
         VOIyzpnUnHtU9L5m1/iipLv2o0F+1UPe5RorGXh4imwPyzfFwsTpDPpm3guEKHVGCfo/
         6rrpLqcdchMpX6JHgPsD/slYlYomK0kC6HBjpYuw1WYI3Dnoc1Y1jMphvvJrHCWEd2qn
         YhHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744233474; x=1744838274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eoPF+bCrpMBavT+34w02cPZ0ktfHw7A1w/wlErW18/c=;
        b=dCTi6u9Qdwl+7Av1xY8HGPMSMRVPbjKCLpp4fifmirzvXiRVs5rQ/2mm0lmCBSuOr9
         JeFDgmvi/Xyw+7IgrJAke3AOY4B6XCIFQdYiNvTzjkmQu32Au3eVUzeDQBp7dxjDJDpb
         ipwpUr2tc6L96bef1XlLDSt9qd2BbBm1x4h2rB2LlJZXtJ6JLwXF5B0L6I59y8sXhydV
         37vYaSMc8Nyy+qceNGnwpbaz/KrlXTFJvofaUSCMBYKIuQCvAOxCKuaEepAu8csgD8g/
         UIBoOK3wJdYxwfuyvjr1BBsx4HEUYTHaW6AVtlgnSkDPA5MuazqCotcIhwKEawNfHHNu
         A7Bw==
X-Forwarded-Encrypted: i=1; AJvYcCWlnAj0tErxL7dfB07U5cIQtSbGjhYTaPhupfsVi0RfzJDRGKZ+uCzjtZEu72g0yyaSunCQBEb4O98=@vger.kernel.org
X-Gm-Message-State: AOJu0YwB1adpU9DZN7u5ZtuF0UbxiQoB9r+E+fMfoQSUodsrvzoIz3ky
	YCXGNWoXORdH7qixMyAatHwG5Zb+u6/mlDSTxs3Rv6zbzhEYpwOvBhuKsyNqH4g=
X-Gm-Gg: ASbGnctUId8LU8jZ/L2NhZPqXYFvuDq06kEB28p1Tq1w0hHopCKfGHivR2v4LgWB66T
	r6Z9UvRqkgFspB8X/8rHSYSIt7tIBUv/TAQny8ycIzkoX8TK46HwR4+A0s8jgzMLrsJe56buvU4
	s+5kVo14ULG53hs+QEwKx+SVFADLqWk0skitQ95mTaK4lQ5TzHVwpvwlOdCeCh717Q3VWdJZwO+
	UdNpr+YDValAWSUDF4v6ZZBddzXr112PS4581Xmo0deuuGfyKgq639Mm2Ae3rM97VWBcXN7tZ3c
	PJcV7gz59JVGqTZf1Q5+4bD72oqn2Pxw0hewEulRtO8f8+GvHY4AQeLCboJrUNK8uMVyjYgDx7G
	X8+1agSIY3lXfjw==
X-Google-Smtp-Source: AGHT+IE2EFUaAUGzZqdq2RH+minAxPrbtolq6/W/NBIYcCuS8He5fK97oLjQC2cX1JOUkUtoZzh2cA==
X-Received: by 2002:a05:6602:6e8e:b0:85e:16e9:5e8d with SMTP id ca18e2360f4ac-8616f206ec2mr29618639f.7.1744233474607;
        Wed, 09 Apr 2025 14:17:54 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505cf8e91sm420735173.6.2025.04.09.14.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 14:17:54 -0700 (PDT)
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
Subject: [PATCH v3 7/7] riscv: dts: spacemit: add reset support for the K1 SoC
Date: Wed,  9 Apr 2025 16:17:40 -0500
Message-ID: <20250409211741.1171584-8-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250409211741.1171584-1-elder@riscstar.com>
References: <20250409211741.1171584-1-elder@riscstar.com>
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

