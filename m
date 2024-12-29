Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A4F3595F
	for <linux-clk@vger.kernel.org>; Sun, 29 Dec 2024 07:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735458470; cv=none; b=RvIfZSLugUobG5erwsUqi8/q3De3X7LzpmWvO4SeGSgpfjEljpR3TvTrBgewWPeQ42snW8QiQOn5k8ZcJThi/qddkULdnfK8RT7N6ccG/K17ZT9P0N1uZV7Cl8jccfqvrt2MDACzEREqE74l6QDnOLXf0to3Hq4/4sfnEVzGm4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735458470; c=relaxed/simple;
	bh=8T8t7MGnpmXJLTx/FTaUwyAyBANw3bF2QBNIkm+LiUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HAnHOPAOFCqV82dT/jR5Ph7ByHMLsM9Nctp8wEszCC+mhH+LNiYt010pvvA8Szei9zJHYsjwmU1PI4V1RSu22zm/7fN4qnP9dXsMIVkD1d30bzeNp6nZFND5wyfFwKPc2QAd6vlzpvGfdK6skNaFJh8B4Tjk1hSVR3Gv5n3BdG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=KGdezIJM; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="KGdezIJM"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-219f8263ae0so66278715ad.0
        for <linux-clk@vger.kernel.org>; Sat, 28 Dec 2024 23:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1735458468; x=1736063268; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oUvVoDhVxDNuu/e3h1RthOZUTTkn0l7kTPxKU03cvts=;
        b=KGdezIJMsh6GssY9fNo9ZyQMDIoMP61ZrG0XhyqE524c1M2604cHGUKlFlgTwa8tDn
         9ssI4Q1TLsyixDChk2e6JaNTbkQFZj2pVmLyoR9xknlj6UTrLgUaFXbp+FBT6lbEH0FD
         LBREH2na8PxnNR66JYQSz/xxNalbI/IxRm62oUDDzFVpvS8Rp+EKkD/4WDpWIVzgdOdS
         k4xnug7hqsZqkpLZueSJL47qYN9DNrkwo/EFDZVKg/07gGP+0U/Uq6Sp/sRmEwY68bgF
         X0FjjiNGHhAB2FHBHhl4TP2ViwRWipy7SUET58yHMtmAj2KBdH4tH5kQoJ9zxO9vZdwa
         FTxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735458468; x=1736063268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oUvVoDhVxDNuu/e3h1RthOZUTTkn0l7kTPxKU03cvts=;
        b=lHrsOrz7yrS6xGYBeURv5ZNjlpgF2yo8fcbXk/LK9s51fG2wXWRzsAY/nih7NVQts6
         +HGSustbEMe0pgpEDwNmjDkc/4+dl+OqGzCHOEAr1bqOggfmxnjfWB0IxebY8pM8by3O
         mbYoeyD6y2R+s7DYywOrbfHMhi3pkBwEGHxKmBWRfSt0vlRxHv51gowY9tE0olJAewjf
         T5Z+EH+6mzPb9Bm6ezold+KNlyq+dsaHnE9h0bCwHjjvLvafQSa+lqi/kZ2QPHldXqQQ
         JEX7UlhDEBeX0Ip39AFYuvgaiPW4Fd1xHFdNQUNKMudthuSn29RDxlrtKbDtqBRHTK2w
         x/KQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJ7EmNU919YX7xbkNSrooBGJbOYfeFS8noIisr/1ivMp1ORxHeOmQRGYg9GQdIsDRWHEJ+Xozg0vk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yypt4EfuqqFT3YkDyiTpUMA/zRK0NqtXw5VsE+QSznDpiKaZK43
	YcBro2K5WXXSn6xflbO2QORFFbgt++omtyCZMfkEzHauXYTETMeO3g+/K2aDLBA=
X-Gm-Gg: ASbGnctr9ebeaogd3nVf/YvF9feK6JR/yZuChnXus/VeCRpW5iyvOWBeuVT3LpJBLFu
	GsLpaZ1JEkrB/v1C4QxEt2eiHb9q32JznQZGVt+Hv4mY1ypWREMr+vrhQajI3eDSmZyspGQxpnx
	wgD0ZQoWCG+hKTaq8jRa+szIRvv/c0ujK2q2Ubr/UyzqZskUV1e68tpuCHncrsDa5GzDLExY+d/
	zGV8FP03A03Qcd+/1egYfqJJcZ1kMM1CkG9nGrndGJhDzU68hD5/NnBnqV8bWgZ+Ev0nb7v/A7o
	i/TN96SI5Ety6Mg5
X-Google-Smtp-Source: AGHT+IHqsni2m5eaDcRqtxzDWRYhuVp63TQTc5E6K1zeiuggIW4mudwRgzaxbglJMxuljed81fs76w==
X-Received: by 2002:a05:6a00:410d:b0:725:e5a7:fdac with SMTP id d2e1a72fcca58-72abe1ad517mr47137154b3a.26.1735458467863;
        Sat, 28 Dec 2024 23:47:47 -0800 (PST)
Received: from [127.0.1.1] (75-164-218-15.ptld.qwest.net. [75.164.218.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72afb196c04sm7907658b3a.150.2024.12.28.23.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 23:47:47 -0800 (PST)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Sat, 28 Dec 2024 23:47:43 -0800
Subject: [PATCH 2/2] clk: thead: Add CLK_IGNORE_UNUSED to fix TH1520 boot
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241228-th1520-clk_ignore_unused-v1-2-c8f6333d1784@tenstorrent.com>
References: <20241228-th1520-clk_ignore_unused-v1-0-c8f6333d1784@tenstorrent.com>
In-Reply-To: <20241228-th1520-clk_ignore_unused-v1-0-c8f6333d1784@tenstorrent.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Yangtao Li <frank.li@vivo.com>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1

Add the CLK_IGNORE_UNUSED flag to apb_pclk, cpu2peri_x2h_clk,
perisys_apb2_hclk and perisys_apb3_hclk.

Without this flag, the boot hangs after "clk: Disabling unused clocks"
unless clk_ignore_unused is in the kernel cmdline.

Fixes: ae81b69fd2b1 ("clk: thead: Add support for T-Head TH1520 AP_SUBSYS clocks")
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 drivers/clk/thead/clk-th1520-ap.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index c95b6e26ca53..d02a18fed8a8 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -657,7 +657,7 @@ static struct ccu_div apb_pclk = {
 		.hw.init	= CLK_HW_INIT_PARENTS_DATA("apb-pclk",
 						      apb_parents,
 						      &ccu_div_ops,
-						      0),
+						      CLK_IGNORE_UNUSED),
 	},
 };
 
@@ -794,13 +794,13 @@ static CCU_GATE(CLK_X2X_CPUSYS, x2x_cpusys_clk, "x2x-cpusys", axi4_cpusys2_aclk_
 		0x134, BIT(7), 0);
 static CCU_GATE(CLK_CPU2AON_X2H, cpu2aon_x2h_clk, "cpu2aon-x2h", axi_aclk_pd, 0x138, BIT(8), 0);
 static CCU_GATE(CLK_CPU2PERI_X2H, cpu2peri_x2h_clk, "cpu2peri-x2h", axi4_cpusys2_aclk_pd,
-		0x140, BIT(9), 0);
+		0x140, BIT(9), CLK_IGNORE_UNUSED);
 static CCU_GATE(CLK_PERISYS_APB1_HCLK, perisys_apb1_hclk, "perisys-apb1-hclk", perisys_ahb_hclk_pd,
 		0x150, BIT(9), 0);
 static CCU_GATE(CLK_PERISYS_APB2_HCLK, perisys_apb2_hclk, "perisys-apb2-hclk", perisys_ahb_hclk_pd,
-		0x150, BIT(10), 0);
+		0x150, BIT(10), CLK_IGNORE_UNUSED);
 static CCU_GATE(CLK_PERISYS_APB3_HCLK, perisys_apb3_hclk, "perisys-apb3-hclk", perisys_ahb_hclk_pd,
-		0x150, BIT(11), 0);
+		0x150, BIT(11), CLK_IGNORE_UNUSED);
 static CCU_GATE(CLK_PERISYS_APB4_HCLK, perisys_apb4_hclk, "perisys-apb4-hclk", perisys_ahb_hclk_pd,
 		0x150, BIT(12), 0);
 static CCU_GATE(CLK_NPU_AXI, npu_axi_clk, "npu-axi", axi_aclk_pd, 0x1c8, BIT(5), 0);

-- 
2.34.1

