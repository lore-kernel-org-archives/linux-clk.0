Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087E0160860
	for <linux-clk@vger.kernel.org>; Wed, 31 Jul 2024 06:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722406504; cv=none; b=NpTnEnTD/SaEZYtOeNihPiUuKfhg5khMXYa6K0kv4AuGCA1l84z65/fLj14QVmDjxp82XWW+fhKBj+ptIfBJm0jd4QcBPC3myymHOgXkG1wPId3ORwNOrzbvzkeAHYrYURYEWFi85W9Ijrf4UvhvH7ufUMW8vj6HgMs+0lZcP2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722406504; c=relaxed/simple;
	bh=3qhd4SE6YoyKmVa0gQyG4Is1h6oEVGw8BykU91343Uw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AlQI8PuxC6Y6RMCiENvOVRbboVrimSMdZNltE3qkwZNQcN2/ANVSusYaj/+BoafW2ZnMS8vOgyUjA2u/7CVA2E3uCeU58+ZS9BcpVi2+LpAI10LMR9LufSCmS+LO+/y16F8gRo5xzB29wqFltiPN0RbXy2NMH5M59lzdgG5Drvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=nlIc327F; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="nlIc327F"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1fd9e70b592so35933875ad.3
        for <linux-clk@vger.kernel.org>; Tue, 30 Jul 2024 23:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1722406501; x=1723011301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mC3tXuwifMCr47H/ReF2rBsHBnKM2KWjJi3hvYggrH8=;
        b=nlIc327F9hPlv+ofO2AdpPmDRyN526KjxIhTA2mFsoGuFlQ6ALR727I4VSefxLgRqj
         TZUbR8ekRzG7xFpJWuXPyH+5wKmvsalVznjipfenGBtuD1ZG/iph4MU20ThaQXwbakaM
         Q5Hx9MfQuZ7swxnN3QVZlISeYm20sA9Wr1Akoe9B1a6j6xK4CN+waqAgvJ6hkw4nZ3O9
         +psZkTHRp5EihIcLsulS0Da11DAaa8kEgSOs5g2KYsx/9XSLiwbybXoOwuSUV0dzmiHv
         DKSWxk5dA8IkU3FHcjiv3qu/ip1JDaORce7s9sdZz2dKJ6lZ67gVtW+XU9TL5OrtwNf9
         nMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722406501; x=1723011301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mC3tXuwifMCr47H/ReF2rBsHBnKM2KWjJi3hvYggrH8=;
        b=pjTQIC9soR/5OIe2bpCXT9JaIkvHRX2QCqkxunHNB6U+ulURAAvUFtO5t/NiDaH/ZI
         ClwX3eZU/dkX2NtvuLvQNyy3iRTpfvQI9qqrvEOXnt3yzggqDKeEO5uCW3VO/Adf1KpF
         FkRgFg5nM8HT81+DpubPPPTysm/G0PDQQUOF0pU1o6nmRxjI6hp+unkJVz6rkOG4OqEy
         jBWv3I5PBGY0GoFtQm84AEELHBewyOOpANKQ/RbVkjlHDLfiEBswBH2V0b6/l0/LtzL/
         bAnSdvEgKufR6msqnE3ZOzrqHaZlHihDZLNFUvPaEpMwQND4T1aGgz+HmlanNxm/NEPb
         qqGg==
X-Forwarded-Encrypted: i=1; AJvYcCUiTCJIU4V63TV7cQFjlPFb9q5+ogtaKxbq4iyYw7PJIxrgcOY+2YBq8z4UGMdt5j3pgSAV5Iz9J7d1voUICxmt9M0V9G8VtzCh
X-Gm-Message-State: AOJu0YwyWIBdqDxYulusJve+1UV50GXumXO8CTmK9Cm4836lmjZri812
	o+z88jBZeAXRHDZT1985AVxvNJR2kJ0tMGRSIJNtwFPBLDandKBJEk8gGHG2gwc=
X-Google-Smtp-Source: AGHT+IHAm8yRTbqgNkd3W/umYT9moh5/2wBAdYnIzsqz4npYm9ETZcWZ1wL+JK+URtWlkoJNxI+00w==
X-Received: by 2002:a17:902:ce0d:b0:1fd:a360:446f with SMTP id d9443c01a7336-1ff048afb6dmr108366915ad.65.1722406501309;
        Tue, 30 Jul 2024 23:15:01 -0700 (PDT)
Received: from x1.hsd1.or.comcast.net ([2601:1c2:1802:170:4520:8165:b9e7:a203])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7c7fff8sm112384435ad.53.2024.07.30.23.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 23:15:00 -0700 (PDT)
From: Drew Fustini <drew@pdp7.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Drew Fustini <drew@pdp7.com>
Subject: [PATCH] clk: thead: fix dependency on clk_ignore_unused
Date: Tue, 30 Jul 2024 23:14:40 -0700
Message-Id: <20240731061439.3807172-1-drew@pdp7.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1597; i=drew@pdp7.com; h=from:subject; bh=3qhd4SE6YoyKmVa0gQyG4Is1h6oEVGw8BykU91343Uw=; b=owGbwMvMwCF2+43O4ZsaG3kYT6slMaStvOZ/XWZz2cX5vivMZj5qWLAguf/bGbbNAdUbj0otr lFsVJN/31HKwiDGwSArpsiy6UPehSVeoV8XzH+xDWYOKxPIEAYuTgGYiNprhn/K3J2smRu/PufJ OrJz25NFps82VTE6uLhX/Evbd53357dKRoaLzjcCUovLf6TmbpuoMcP+pAvTlonTri6+GDuZL7R e7DIPAA==
X-Developer-Key: i=drew@pdp7.com; a=openpgp; fpr=1B6F948213EA489734F3997035D5CD577C1E6010
Content-Transfer-Encoding: 8bit

Add the CLK_IGNORE_UNUSED flag to the vp-axi clock (CLK_VP_AXI) to avoid
depending on clk_ignore_unused in the cmdline. Without this fix, the
emmc-sdio clock (CLK_EMMC_SDIO) fails to work after vp-axi is disabled.

Signed-off-by: Drew Fustini <drew@pdp7.com>
---
base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b 

This is based on v6.11-rc1. I've been reviewing the TH1520 System User
Manual [1] and I am uncertain why "vp-axi" affects "emmc-sdio":

 - EMMC_SDIO_REF_CLK_EN is bit 30 in PERI_CLK_CFG (offset 0x204)
 - VPSYS_AXI_ACLK_EN is bit 15 in VPSYS_CLK_CFG (offsset 0x1e0)

I don't see any linkage between them in the public documentation.
However, the addition of the CLK_IGNORE_UNUSED flag to "vp-axi" does fix
the boot failure when clk_ignore_unused is not used.

I've pushed a branch that has the dts branches on top of this patch [2].

[1] https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf
[2] https://github.com/pdp7/linux/tree/th1520-fix-clk_ignore_unused

 drivers/clk/thead/clk-th1520-ap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index cbc176b27c09..17e32ae08720 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -738,7 +738,7 @@ static struct ccu_div vp_axi_clk = {
 		.hw.init	= CLK_HW_INIT_PARENTS_HW("vp-axi",
 					      video_pll_clk_parent,
 					      &ccu_div_ops,
-					      0),
+					      CLK_IGNORE_UNUSED),
 	},
 };
 
-- 
2.34.1

