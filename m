Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EE415624B
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 00:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773707517; cv=none; b=JkqzfguU/msZI6t5e3Wge+gzwSjw0i8fyRn1CAH+cSiGb1ujWq7CgvMi3LrzuCUDCvL6Rx/mEn0t6+jeCaZFGCU3dGz1zs8iL4aDHf5gkDxhX3OEf+Z9YAYgcBSn7AgKFbpPExrqcxWgw4X+7JHqXPEtl7cfSQS+2B9GRZpmXqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773707517; c=relaxed/simple;
	bh=CWjfyVHoas/Al/S+AU1mewbaNC4j2EOwzGBu243qQXc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pcq98J+WaaiwfxwicSRs8jgjHDC6zoeXP0pThviSohbWgA9/SHuHbgJ7uLoX/BUFZSdzbTlhCUoa/rINsfWdffgx5y/PKFu8AQop5pQ91TvW3mf6ukjYaQ4wGxQ9QcY3N5UBEKqi5jeBC98M5ZmRGrt05MWnjDsGNl0zyOkI+RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dHavL9RT; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dHavL9RT"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c648bc907ebso3586719a12.3
        for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 17:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773707515; x=1774312315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9iHRAaNqbtYbn+shwBAN76uisWSH3/VOXv7xXw03uTc=;
        b=dHavL9RTZZBR7Fb7Rp9U3oao/56yqGdmvXXobstsKIzgu7esPGr+BYwsHBIhqVtG85
         zSYxJyPNv5mIMysHt6IPgGwdgA7q65m3iUiYLk2KoLgcO4DWZN6BjyzjVhPsX5hDNibJ
         ZIZ8bgckSTdGNqgyW/VqGKylig3nBgTAnm6G1lLJhxz0gsCp0woSTcpBbuZ/Y/KDLto0
         Qp2TfaW7TUD6d6OFRzcQGBd5HVs08b71GMeYTOiMd9etRuH+LzdsEdYI9tztP9YRlEpS
         86gn8snD5aLJbpRgcRp6Loz6IS7wCPbNLHU0ENrntd6c2YEUNPcTeYbugo3UdDtNEV9X
         m1OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773707515; x=1774312315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9iHRAaNqbtYbn+shwBAN76uisWSH3/VOXv7xXw03uTc=;
        b=jxKyrBQsjaOQDR/X7/2qEKll6tB7YA5IgmldXZBmzIpLvN2u39+ly64hmZFD6ovjiM
         3XwRcpN8GPRsEuFKzKBEIjCgBIGkmI3iexlXa2dtSeufXnd9lZTaZpApwdW2LUKxFt/U
         PGoVOKmEJBf0nZv5R+AVPmi7mkbVxZ/i5xSwJKeJcqhpr6mrrX7NCTiKrktnxMC0deHW
         m+F4dCOkkR15NaWsiCaAkeW3w7aVJNyRZ3+0EVUeydUZir4N7NdRLlsZcjWLV/uhQC+b
         SN0Nxjpz8pcCiwqp1zu31DOnZG7hMLJDePbYP/SKqz3bbPzC/SYaxu5cxbXDjcb8rRxY
         Q8lA==
X-Gm-Message-State: AOJu0YwvLF65MlTnwsmC8LMUGcL3AC+vDoqwJSQBxQW5Q7ULK6ms3KvQ
	4KiINTzse4aDTHbX2V0KhF+4BfjnJ9GfOh5zsqQNfFIcHZDvfblWSA7fWvZQ1OTV
X-Gm-Gg: ATEYQzyv0R5srDF52C0FuXyeWuC/FUkg9NeJnXBCvTk1CHY86qPF0D2zcTGf65zTBQ3
	Dtlo72SouPIq2D3O67rnRmT9jZHmEbh/fqgmd9WU8kn9l03gvTIcsE5xZdk2A7GdjlFQrFxIRnH
	VkgqZysN6Gb/xD/ZCL0dYV5ikVRvB1eYjEajiR9usA9mYsGhvnUDkLR2RFxiwMHV8F+MWDIPZ42
	W6YdKEFMGQ6+PpBdk2ooEB47NMN0HOM36yd3HiLC8KnEnIY5aOKP3w5ODlhBM3OTbY3XiI34QcB
	z/RUTs6VWiPmAsesgu1t9DjMWe8e3JxWuzx0pA9mskUAtxIspkkojqkveEuOikVGiOKFw6SPV7U
	r8Q/jBVBhqGN0NNpI/auOzSDRIiEAWUUZofnpUbSFDCDd/yrAbRpci/7A65WUYg5gNfRS/nzLci
	QpHLczd15uHHG3JVZF4otZunAxFkD8+0ytP8ceqpBH6LeQUIv7PPG3QqM=
X-Received: by 2002:a05:6a20:430d:b0:398:7357:bb87 with SMTP id adf61e73a8af0-398eca1116amr14483246637.15.1773707515379;
        Mon, 16 Mar 2026 17:31:55 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7401588ecesm6230684a12.32.2026.03.16.17.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 17:31:54 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] clk: nuvoton: build with any architecture
Date: Mon, 16 Mar 2026 17:31:37 -0700
Message-ID: <20260317003137.71827-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The directory's Kconfig already has COMPILE_TEST. This allows it to
work.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index f52cf3ac64fc..31eaf19dfdda 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -134,7 +134,7 @@ endif
 obj-y					+= mstar/
 obj-y					+= mvebu/
 obj-$(CONFIG_ARCH_MXS)			+= mxs/
-obj-$(CONFIG_ARCH_MA35)			+= nuvoton/
+obj-y					+= nuvoton/
 obj-$(CONFIG_COMMON_CLK_NXP)		+= nxp/
 obj-$(CONFIG_COMMON_CLK_PISTACHIO)	+= pistachio/
 obj-$(CONFIG_COMMON_CLK_PXA)		+= pxa/
-- 
2.53.0

