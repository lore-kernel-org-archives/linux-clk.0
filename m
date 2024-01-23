Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF605A0EA
	for <linux-clk@vger.kernel.org>; Tue, 23 Jan 2024 09:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706001986; cv=none; b=MQNWqb78ar5aVSRE8gXfuAjMqhDEnDYe/v2rYJURwQXNNj5VXW+lHZUOpw/RVyXrKr0Ao4E4EtJ4b7vFvhnfUs7RLvMx6r1VxLrapUjHxhez9/KdMMywkSdni3nqpJuYU4m9JsPB/pSmDpY2dvtmO3wAyWp8mBwKn0E2mBpKr9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706001986; c=relaxed/simple;
	bh=d+ji7QeA2nW3W7Gc/Juv21P65TRJBRAPQQXq7yw1sK4=;
	h=From:To:Cc:Subject:Date:Message-Id; b=Wc24SXR5apgVwDP94DG+fHeq9qNlX7vHqc5rRVHOC/1ct6YakHZxy+NUbGnTXZOOAjg6rjMW6d7lJcXYOMH0UEScKD+SCmcHsoehZj2TjRiudDFxG6eCXrHhGZMybea3MIK+HaHHIfV/pIuIU6PvQ/WFAN+X2tOjhzfVUyFtJRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=8devices.com; spf=pass smtp.mailfrom=8devices.com; dkim=pass (2048-bit key) header.d=8devices.com header.i=@8devices.com header.b=Mo9m6cFH; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=8devices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8devices.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8devices.com header.i=@8devices.com header.b="Mo9m6cFH"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2cd0f4797aaso40300501fa.0
        for <linux-clk@vger.kernel.org>; Tue, 23 Jan 2024 01:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=8devices.com; s=8devices; t=1706001982; x=1706606782; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=da3DB4fuctftgszn0IBbViUysDG4/tuurWVRkb8i9zc=;
        b=Mo9m6cFHbh35eG05TCpyBAw5nW41qjqpC2PHGpTUV62gpTfirKNHuGGX57dnsbSxJ6
         rdzKx50+iTtuPXWACg5yMTvg8Vf4vyuWD7zFL3LKC8y8+jNXgVGYt9iRFA6/HTQFFSMG
         QXY4qNy0EmOpuYrnAJ/sgQRS1ZxOzAqGHLBuf1ECqHLKn1fzH+y4NXO/CF7ZCUbdYrC5
         2kf7Ek0dd5oWHckGzNLJX10ckZ6EqyAuNHs3Ap3COduoZHw8jKL7GEfy0YzHs1jz9jJ9
         se0cZd0im6AkrHPppD9GNv0CAOdYVN6qMY89d4cKs1J0v+IcuTkBaLChg6QGqujR5F+j
         OhTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706001982; x=1706606782;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=da3DB4fuctftgszn0IBbViUysDG4/tuurWVRkb8i9zc=;
        b=bTiTfF4RiaClARaaSI1jEvzSVP26E9sQ8AH8bAzNbGWL1WftucPQJLGlWQtfIOxthr
         x9LE/KTZK++FeineMLY75OH3hGQcd3HZ2ob86ZK/a4k4DNgoiS0lTh1vFWjG+Rivf0bk
         bK7sIkoJU20kgv7SzSMUAg/FqBc2+faWL2XYHYTnfDaDb2xc5Qrmvf6CHVXLxvkk5wZE
         9W6Xfw+jPJ+qgw9kuAKHaMe5q+h/IT/y2FFAi2M3CIJwlOMigAy1IyrLwrjLAaf9nZ36
         YdHMS6WAEvXiQTmFO/VgDVrPcGBeAX/+e1JTEOJ0QOfkU9WpZVOdyZyrne5PwZ570YOK
         UWJQ==
X-Gm-Message-State: AOJu0YzpZgkTTCGfxC5kRWBSS0dv5cChtqik5160AC77PZBT7QI90TCJ
	dsM/NvTrC3v7TSmh+pAutpl2Zw0vV6P8Ns6r7Y7BxK+cAxVYSMY7kI+8C38V8mf1aNZ8XPJJhD4
	fzWw=
X-Google-Smtp-Source: AGHT+IHI6Qn5P31tRVp9wkWdE0blQn6n0A5HtclN71tDiZKAJ3uAaQHsYm3HctwCzZ3l8O/L7QQpXA==
X-Received: by 2002:a05:651c:1c7:b0:2cf:2d0:2236 with SMTP id d7-20020a05651c01c700b002cf02d02236mr1278001ljn.105.1706001982001;
        Tue, 23 Jan 2024 01:26:22 -0800 (PST)
Received: from mantas-MS-7994.8devices.com ([84.15.37.222])
        by smtp.gmail.com with ESMTPSA id q31-20020a2ea69f000000b002cf088cef55sm186679lje.55.2024.01.23.01.26.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jan 2024 01:26:21 -0800 (PST)
From: Mantas Pucka <mantas@8devices.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Mantas Pucka <mantas@8devices.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] clk: qcom: gcc-ipq6018: add qdss_at clock needed for wifi operation
Date: Tue, 23 Jan 2024 11:26:09 +0200
Message-Id: <1706001970-26032-1-git-send-email-mantas@8devices.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Without it system hangs upon wifi firmware load. It should be enabled by
remoteproc/wifi driver. Bindings already exist for it, so add it based
on vendor code.

Signed-off-by: Mantas Pucka <mantas@8devices.com>
---

Changes in v2:
  Remove CLK_IS_CRITICAL flag
  Note in commit message that clock should be enabled by remoteproc driver

 drivers/clk/qcom/gcc-ipq6018.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/clk/qcom/gcc-ipq6018.c b/drivers/clk/qcom/gcc-ipq6018.c
index b366912cd648..cef787674479 100644
--- a/drivers/clk/qcom/gcc-ipq6018.c
+++ b/drivers/clk/qcom/gcc-ipq6018.c
@@ -3522,6 +3522,22 @@ static struct clk_branch gcc_prng_ahb_clk = {
 	},
 };
 
+static struct clk_branch gcc_qdss_at_clk = {
+	.halt_reg = 0x29024,
+	.clkr = {
+		.enable_reg = 0x29024,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qdss_at_clk",
+			.parent_hws = (const struct clk_hw *[]){
+				&qdss_at_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_qdss_dap_clk = {
 	.halt_reg = 0x29084,
 	.clkr = {
@@ -4361,6 +4377,7 @@ static struct clk_regmap *gcc_ipq6018_clks[] = {
 	[GCC_SYS_NOC_PCIE0_AXI_CLK] = &gcc_sys_noc_pcie0_axi_clk.clkr,
 	[GCC_PCIE0_PIPE_CLK] = &gcc_pcie0_pipe_clk.clkr,
 	[GCC_PRNG_AHB_CLK] = &gcc_prng_ahb_clk.clkr,
+	[GCC_QDSS_AT_CLK] = &gcc_qdss_at_clk.clkr,
 	[GCC_QDSS_DAP_CLK] = &gcc_qdss_dap_clk.clkr,
 	[GCC_QPIC_AHB_CLK] = &gcc_qpic_ahb_clk.clkr,
 	[GCC_QPIC_CLK] = &gcc_qpic_clk.clkr,
-- 
2.7.4

