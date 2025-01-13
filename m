Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81CE1CD1E4
	for <linux-clk@vger.kernel.org>; Mon, 13 Jan 2025 20:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736800295; cv=none; b=XIjlJBNVj3TZBqtxyvfNTQ+rNMYl6mp02BqGV0b4bDBtUQxsIcsZcYtLZLqH4nvwDYu31ApvWuxiqON3bWd+fXp78yyV7qO/j8ZSGjPxF2saLg3BW6EOwHOA/362KAk3E/Q1Ex7/5KPQKGDHtWD826R84gpjL+G499vXoTzOlaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736800295; c=relaxed/simple;
	bh=8T8t7MGnpmXJLTx/FTaUwyAyBANw3bF2QBNIkm+LiUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y2WkE5rqbQ8oSNNP2kk4VWWtTNkQ5+zTr2lfJt69eNR0WgdlCr6t9/KKyd91QL8Ix8sGdOj6A6SqO1KRw84L/x5uU5dWGbx97x6yBVHvBr0hUlIj0HWcpxQaRAVCTLJbfFI3sMHHL12N7Wf5c2ASWNTdKzwC4ElzjabfcG8aUeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=MQttmlT4; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="MQttmlT4"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2f441904a42so8301089a91.1
        for <linux-clk@vger.kernel.org>; Mon, 13 Jan 2025 12:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1736800293; x=1737405093; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oUvVoDhVxDNuu/e3h1RthOZUTTkn0l7kTPxKU03cvts=;
        b=MQttmlT4qc/xo2soqpRKeB1R3qRBUXDeHX4bd9BSdqGlaoNljfraolU2nBHqd0agLa
         3QwuFgIQ3s2WqCQbcV5NlMRtzpJBhc6/W45MhrxDZb9mjb1K/WyIM9TMkADoKTWY+bRM
         Tc3MAeEItclg24vnj+LFXTO9tXc8kDroHXBosdTlaw1IYSoHEP6/SXd0Ns2F93sM2OXB
         uRN5TzsvxMBwaOEXjrGqrgGSFjCCI2G3CIcj3fimfBCJe8zi/VdfhfdcdAxIKuKY7SvK
         DGVomaSdst/8RayEQZUeKTXy45LDUI4nygk9p9dXo0YP/QNFjUqLuI5VpjJ5+oNtQFnM
         E/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736800293; x=1737405093;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oUvVoDhVxDNuu/e3h1RthOZUTTkn0l7kTPxKU03cvts=;
        b=Ad02LO7G6OTD+WFMAe0CpuvY33HTi4uZXsA9ExqBAKnIlBkdi4Pt4sJ+Wb2H19EUh7
         mxrLTpVVO+1QgH8JNpkTajWKTzV7U/8Tfu4fMuaCCHUgHVoFWCTwtUrrGeVM+fkMdgNt
         LPRbqHHcFE4K0IrLVEIgrrXKZvhznCBOwZicBwStSI4vcO05PGMFxQ4DeGyC3YqJpqfb
         9cMzZ36iX0zLQ6l/esaCnMdCI5DhtNPS91YsCALcZnfXiIZ6E4iBTXUw5ulivM0qOkuL
         OHPQqY3tSKSBnv5ehM+JvbgU/Fx70Bwsu/FfSY9tHUYSxsHJVI4xiePM760dYL/qJUpf
         j1VQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmfLMJ6wubQGwwExLvSX9+28rP4e0kHxFCGhHP7efRQeBdCsf91IkE4Zc4SpOF7FWd0woGLQnXKeQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxKjVE17PbBwh8nJXp57/M0DaoUc4JXbkMI7wMsAcTDXsgHbTh
	5zylWgTAE55iUZNTeIBEz7lGQmPtZZWvG0yjxLaugbKbRMz44Ns/E08floj1OKI=
X-Gm-Gg: ASbGncvGZEMr6SDQZtgBxJe2IHmopm1huJFYAtYghNrwUV9k2/cS2XaXKuPUKdaKl5F
	Gy2kvAQYk19+drvyqpZQSVitV/ozdRFCJbsuNKsfko2A/0+k2sRLnPGTh2RJgRMGYnQXMsaAEpc
	vjs5OIFhnLUKPuqx8NXr0HrAmb2nexjpmI+pi0m7EDWUaGHI+ewF6wmHPzapwyu8kGZYR6wOSbp
	q5DeG3lE+IceFdIM/zL50Co77MhhpUfJzwBsvuMpEg8327WjkndnSYRH2wy4WIGWby6opi5fYWv
	xt8WUfWruQqEG20M
X-Google-Smtp-Source: AGHT+IETyPk+dkPDvT+m7Nlwd8jsvTLbyizrVTdVzrO+oEChgBr7zxyycDxXOJNikGNq0OksD5a6ww==
X-Received: by 2002:a17:90b:2f0b:b0:2ee:db1a:2e3c with SMTP id 98e67ed59e1d1-2f548f1738cmr29086701a91.1.1736800293053;
        Mon, 13 Jan 2025 12:31:33 -0800 (PST)
Received: from [127.0.1.1] (75-164-218-15.ptld.qwest.net. [75.164.218.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f54a2ad3b7sm10514811a91.31.2025.01.13.12.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 12:31:32 -0800 (PST)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Mon, 13 Jan 2025 12:31:25 -0800
Subject: [PATCH RESEND 2/2] clk: thead: Add CLK_IGNORE_UNUSED to fix TH1520
 boot
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-th1520-clk_ignore_unused-v1-2-0b08fb813438@tenstorrent.com>
References: <20250113-th1520-clk_ignore_unused-v1-0-0b08fb813438@tenstorrent.com>
In-Reply-To: <20250113-th1520-clk_ignore_unused-v1-0-0b08fb813438@tenstorrent.com>
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

