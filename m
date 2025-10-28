Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681D5347FD0
	for <linux-clk@vger.kernel.org>; Tue, 28 Oct 2025 16:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761670315; cv=none; b=rtQ/k44vjFOahODAk9FMTU2RSJk4vMrcB8734TAr3le3fD52NsPM9iPIUkk+BXCosCR7RfJI6jxrSCZb+DM+6CpqWLY4D6ClGjPAYDp+swTpQFDPxCL2fwaDGjcDv3nG/ImP1kh6g0uM+z0nBgBTnSpByNofWq7qbKZl57rVsmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761670315; c=relaxed/simple;
	bh=8Bofhv76xiZ6SkaSp/xpBcxYedthlmIGe5RQkTkfBLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LlCL9ieSlEFQwTF3TzWNBEKb7iHivjUaL/RGQnxSsYxoaNmHCSJ9AeJO9Z9t84ukketFzBUohfCAeieqKATLtHuRNAaXBpa2rU46CoQ6kL/1744r5jdUdVADfNkbeKJLxL0WGl+H/p4MxINoP2F9KSNNrDfStcJPqh4h0dHbFwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gNuUWFVP; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gNuUWFVP"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-27c369f8986so55884695ad.3
        for <linux-clk@vger.kernel.org>; Tue, 28 Oct 2025 09:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761670312; x=1762275112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nqGbM5vvwSaAdyr+kisx/6GyJLMoi/JUgGO1sEcNgzM=;
        b=gNuUWFVP3N2CrMMyOfEaL0txGchAhfKjdaojawQFq9ZvFE4Gzx1CDrcWr8Gn7ypgJD
         9BqsPdZnvmbTo/sDJEXiZYrQviiqe9x4buUPVZcwsB2q9aL0WbG0RBBjyKHxQmG6wq36
         bQuYhbH27gBYk8+amVDN4fEgYm8wGtgv+dB0XtElja1Lze1EPgAQJrU0b6RTrbmDYYe8
         I+4kjv/T6sjezUzKIfYBEGMWHaSzXGUnAjB7/GoNAzjvMQkxggF/E4iYuxEaLhQZhntd
         3g/PSWEu1CdIe21xL882PpeS/p2wm3Qal06Wd/9QcStWflEB/Id6P+L0xlndoISxKune
         WCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761670312; x=1762275112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nqGbM5vvwSaAdyr+kisx/6GyJLMoi/JUgGO1sEcNgzM=;
        b=UNjY/1CaW7GdlUp3qUz8MidnmrvUul76Jbgl+oNxchBtT9F5Q5/e56ecHP0cwWnvVq
         Y8le34RTfzYQ7aDseA/nHtuiA+gTxMfvdDuHnncFYzWHp/YFNyMhPnIhkkT06WYZGWBU
         sxFQZSqQ7iL9zVVk0RzGN+MJfXaDd8nvi6AdLTk3eWcGizKd6U5l0Nk7r2QBPmkCjBwo
         F15TOvLAHJZ36VrRdhp4WKYO9F+t6zoDOIdhQIf5lh3sgKCbKFv2ISvauVflhxUWehDN
         IHqTp+3fdpHML1hH12YjVHe+OQfhLyLncnQkbc45ILd++NYWfwVMe8i8T12vQbbuZ0cg
         EkdA==
X-Forwarded-Encrypted: i=1; AJvYcCXSYNQuFPDoGsYj80fbk+O9F6NBT22N6BKkXGMY49SgYhSH2TyPLk1lniYdrrKSzYFo/wWrJ/K1U00=@vger.kernel.org
X-Gm-Message-State: AOJu0YywTzEf6S3SoNGUkOxULU6vlD3h9Mo6yE7cIjOA6dZ2LFmMQmuk
	54GW1LBn0x8gPymTD5o+DYXd957d1y6a8d1wFBEafvQJwsFBjldXWlXN
X-Gm-Gg: ASbGncsSyYAYHPwL9OzX5KN/PKQ3Ol62sIMMBsdDMxIYvFRGT7DFTLNKFq3LA0aDD5k
	xYBojxvfqzi9Nk30SnVGzuWaHuMEji9Oeoh16cUE+7kAGWF2wi4u8Eyld+mR3895in2iA/uWQZ8
	8meWXssrUsOHY2srPTLpazEqBYM1chLxdp/NJhuvP+SmBi1wkLGQzC83YL4PrcH5QL8uCZRDlq3
	NIBbobo1I3Bm6gfLBB1Gfq805f7/7niGid2u0dBmfUd793/1QU7YADF0khpuyTUrVj6INNBXNJZ
	Zn7i/4elfHkwhvsNfRF0dj0j2Dx6Ti6O00Wqz6K2FXZQbDxyGnKHdu34EOTg5DVcVUIVcf5blxA
	o/7/HxsxqB/M/so9gyLS020eoDoxM4AjLMQYcdW0/u35jZETPv3iPl3SW8Zt1TrxCug6iTNqzGo
	8oKSSIn5CZOtSLJ8IrEcrRAg==
X-Google-Smtp-Source: AGHT+IHwlx7UTwHMvwMgoePukjEkmehBzU+pJX/qbbUcV5S5wP0HYILyy8+Mz1GCKLEfOQitsWAwUQ==
X-Received: by 2002:a17:903:1248:b0:269:8f2e:e38 with SMTP id d9443c01a7336-294cb378634mr57410855ad.6.1761670312365;
        Tue, 28 Oct 2025 09:51:52 -0700 (PDT)
Received: from iku.. ([2401:4900:1c06:77f0:168f:479e:bf92:ce93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498f0be0esm122123665ad.96.2025.10.28.09.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 09:51:51 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/5] clk: renesas: r9a09g077: Propagate rate changes to parent clocks
Date: Tue, 28 Oct 2025 16:51:23 +0000
Message-ID: <20251028165127.991351-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251028165127.991351-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251028165127.991351-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add the CLK_SET_RATE_PARENT flag to divider clock registration so that rate
changes can propagate to parent clocks when needed. This allows the CPG
divider clocks to request rate adjustments from their parent, ensuring
correct frequency scaling and improved flexibility in clock rate selection.

Fixes: 065fe720eec6e ("clk: renesas: Add support for R9A09G077 SoC")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1-v2:
- New patch
---
 drivers/clk/renesas/r9a09g077-cpg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/r9a09g077-cpg.c b/drivers/clk/renesas/r9a09g077-cpg.c
index 8b7e84a4c307..1cb33c12234e 100644
--- a/drivers/clk/renesas/r9a09g077-cpg.c
+++ b/drivers/clk/renesas/r9a09g077-cpg.c
@@ -221,7 +221,7 @@ r9a09g077_cpg_div_clk_register(struct device *dev,
 
 	if (core->dtable)
 		clk_hw = clk_hw_register_divider_table(dev, core->name,
-						       parent_name, 0,
+						       parent_name, CLK_SET_RATE_PARENT,
 						       addr,
 						       GET_SHIFT(core->conf),
 						       GET_WIDTH(core->conf),
@@ -230,7 +230,7 @@ r9a09g077_cpg_div_clk_register(struct device *dev,
 						       &pub->rmw_lock);
 	else
 		clk_hw = clk_hw_register_divider(dev, core->name,
-						 parent_name, 0,
+						 parent_name, CLK_SET_RATE_PARENT,
 						 addr,
 						 GET_SHIFT(core->conf),
 						 GET_WIDTH(core->conf),
-- 
2.43.0

