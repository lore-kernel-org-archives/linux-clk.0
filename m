Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D070D32D7F1
	for <linux-clk@vger.kernel.org>; Tue,  3 Feb 2026 14:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770127706; cv=none; b=LqPRDDjQr7V9pWh4sl/SZBXW4mmfX4sTEbDlINjlmyMFKgjS2mse6ZNpB7M2x0h6Rvcf3gHktpmNdmA0zc1kVhXBqzym+mkc2KLkDLp5pUCedfvK3OSfrLN7lN9P7pSQMRlPCskUXYXBm4yrqCRrsiwiCHKSuo+ikirql3NwILU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770127706; c=relaxed/simple;
	bh=7ZLF4iCQxbFTodP5/N08fEkFkgqaaRd3959nJlVr5Rw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l71Wkuod8ALT5pBV/KRXAezQbRcU59RCgU+FNTvtMOJhJPJbSxMnH+2EibK+ZLt7A+TRc2KlyCv640x2J9ixQ6Bk9vI6PLXjXgR5PZdPcETOODV7olWlR4QlsisbbqT3cI2QZVykc/WeAWD/JpMg0Y9IOPqcXFsWaY1V+Px/yXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d8CEeOBB; arc=none smtp.client-ip=209.85.215.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d8CEeOBB"
Received: by mail-pg1-f193.google.com with SMTP id 41be03b00d2f7-c613161b489so2411013a12.0
        for <linux-clk@vger.kernel.org>; Tue, 03 Feb 2026 06:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770127704; x=1770732504; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vggTaQ/1IglRgZCrC6069BZ56pr4AJ+trFVQZHc37RM=;
        b=d8CEeOBBQ2pyibYEC466ViWJDLs+GFV2rmuZRe0A0o26nSGJCu6LP73tEOW9B1ykLv
         0wH0HiRFddtbL2mbPNngnR+xvn0g1hiNB52Xe2Wc8pCzldDXCBUwFEFh+q6PxpR0KziQ
         ed+55i/IW7nYo8fa9h7GPfZ59dCKzkHH4oaRNruvyVI9nfheBUcPIomc4mOzIr9/kh8g
         fLTZLQQGAtKWmzJ4rUzKgD+TV4c+xJuh6YCkoPJxyIlr9TmbOO994Gtyqvm9LzvIkHrN
         E+GdtlrLvggwnivrVIQqccTlCQJN1K2z/LHwh8pPgH2B+xQCzAVbiNYcil5zAPN5+rn+
         EBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770127704; x=1770732504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vggTaQ/1IglRgZCrC6069BZ56pr4AJ+trFVQZHc37RM=;
        b=n8r1ZkRw07fytowZCdrTpERlmx5Vtb18gx8DrEAWT0wGstOIy6cPEmQ5l7y6SFEm0y
         HsIFtw4DqCIEbzne58BTLC2t6Pt1SL1YrfdPmuCImPUifj8s0fY+e8SKeow8skFNI36d
         x6eu/VrgcWuaCM2qhfTns3vcIpPyrWOK2mij7ZOQnQtZbf23QRT2d+Eo0IAxLJV2kSGW
         cj/DCj276lZ2ZYxLrD0jhIICVPMdtPFJma+7Zbazo+AbXdofArVjrpBNw+VVCnAfqXli
         OQStil4yBNHvee04RUJbRrMzIBQdKw2wPTGJ5it+SvglsQItYq1Rn1pIhXFNKHHX3tJ+
         uWyg==
X-Gm-Message-State: AOJu0YwI+/sByOKd5TssMCRltvCVOBA6tr19TsoKZnNAzLyW079orqO6
	I/0HSOmQpz9v9yU2UfIZ8QTW1gPVRngRuHzr2ax63mrBuqxNvVT94qi2aE8GIJKyfmM=
X-Gm-Gg: AZuq6aK4VKDjGbnqWHgjpwtZvY65o5A4SZev49PjVALZn/Wnnh1delt73CGzs+pi/RN
	tu5HPqmH5yZHpFEBBFTD6NTIVfcqL712aU2a1+xjDC0Hdy7PWueMab7tD9fYsqH3wU+L485oOgG
	VfFw84NTZrrYBFjmmAXmS27d1f+cXKAeYHkSgU2FcSBSdy+q3IRsnlYRmnT40cPmnODgnlmTh3E
	2MNtq9AbHaLRdB2tWZ4MCkmkat54D7IR1y+/I/T/b/UEWMobMj6K9SfUGO2ySIRtfCDiD4prMPt
	Rxbn+2vk+D+U/AjnPvkAbMvn8+JLN0M9ckGu6vWr3iCQtpVOOK+Fkf/veU8g+oskM7XaW4roso9
	+LQsw1E6fJr8kFl+lUQdqR3YSgR2p4vrGylGzcNGbwGjry1rutcObPMCNMDLp8mKsQSlgRUzMx5
	5QljHB6vWolt0fDB8lf5gOFMVzqbX3W4GOjwP3
X-Received: by 2002:a17:90b:3b82:b0:34f:454f:69a9 with SMTP id 98e67ed59e1d1-3543b3b04bfmr13811322a91.28.1770127704120;
        Tue, 03 Feb 2026 06:08:24 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9008:ba52:f091:7dff:927e:f788])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3543d52c396sm7694684a91.4.2026.02.03.06.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 06:08:23 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Tue, 03 Feb 2026 22:07:58 +0800
Subject: [PATCH v3 2/2] clk: imx: imx6q: Fix device node reference leak in
 of_assigned_ldb_sels()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-clk-imx6q-v3-2-6cd2696bb371@gmail.com>
References: <20260203-clk-imx6q-v3-0-6cd2696bb371@gmail.com>
In-Reply-To: <20260203-clk-imx6q-v3-0-6cd2696bb371@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Akshay Bhat <akshay.bhat@timesys.com>, 
 Ranjani Vaidyanathan <Ranjani.Vaidyanathan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770127681; l=1463;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=7ZLF4iCQxbFTodP5/N08fEkFkgqaaRd3959nJlVr5Rw=;
 b=DCfqaRTuO/c9AWvt1I0DC0keOeLbELpHdMjClHQL8bIs/5szqeMTmhgfJZppc9gcC1f2quZJL
 unhYgZsD3wQAt48+SEMgmJH6spLmHlOQqnVc6AWYJIlz4uL3VkUO4WY
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

The function of_assigned_ldb_sels() calls of_parse_phandle_with_args()
but never calls of_node_put() to release the reference, causing a memory
leak.

Fix this by adding proper cleanup calls on all exit paths.

Fixes: 5d283b083800 ("clk: imx6: Fix procedure to switch the parent of LDB_DI_CLK")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/clk/imx/clk-imx6q.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/imx/clk-imx6q.c b/drivers/clk/imx/clk-imx6q.c
index ba696cf34fe3..048e2ddba490 100644
--- a/drivers/clk/imx/clk-imx6q.c
+++ b/drivers/clk/imx/clk-imx6q.c
@@ -188,9 +188,11 @@ static void of_assigned_ldb_sels(struct device_node *node,
 		}
 		if (clkspec.np != node || clkspec.args[0] >= IMX6QDL_CLK_END) {
 			pr_err("ccm: parent clock %d not in ccm\n", index);
+			of_node_put(clkspec.np);
 			return;
 		}
 		parent = clkspec.args[0];
+		of_node_put(clkspec.np);
 
 		rc = of_parse_phandle_with_args(node, "assigned-clocks",
 				"#clock-cells", index, &clkspec);
@@ -198,9 +200,11 @@ static void of_assigned_ldb_sels(struct device_node *node,
 			return;
 		if (clkspec.np != node || clkspec.args[0] >= IMX6QDL_CLK_END) {
 			pr_err("ccm: child clock %d not in ccm\n", index);
+			of_node_put(clkspec.np);
 			return;
 		}
 		child = clkspec.args[0];
+		of_node_put(clkspec.np);
 
 		if (child != IMX6QDL_CLK_LDB_DI0_SEL &&
 		    child != IMX6QDL_CLK_LDB_DI1_SEL)

-- 
2.43.0

