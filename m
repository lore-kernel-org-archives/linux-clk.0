Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB0235BDB8
	for <linux-clk@vger.kernel.org>; Tue,  3 Feb 2026 14:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770127698; cv=none; b=HV36V4aghKh/DxIzTJyDSJEKBdMullSHdXizJSwuYiLLKtcAkc0BjGWuqOsS1GTSwtTj580iIXDwcbQQ/rmZ8K2giqE4+D4ICDk38dp3h/RxxglC6+ReDum/FfOwoV2Etvp8FpcEgmduM4PlPbbwE7o4jV8Msqg5HHSlnn2PkXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770127698; c=relaxed/simple;
	bh=WD9h0fFVKsfX86DefFgHgmW9sLJVVxtbAMFvxApruCc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h6Zco7ls+ehDge+jExTcWH7jYdop4NCiooEOBTWPqAy/A7iEtWcU7pskt5GTKFNVsvPU/XIu354UBMWYe/8gpO3T/rn+fBf5kbQKw8zNf0wui1Pr5Or1/nVe6LKyRpr8l3VTD18kT+4dF1/f26kXasd4xU0Kqe+3Ypuv3IMBNbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NEBRzk62; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NEBRzk62"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-82318b640beso3189575b3a.0
        for <linux-clk@vger.kernel.org>; Tue, 03 Feb 2026 06:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770127696; x=1770732496; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uEVDyNGIeHf4pNw+X2bXrhjpf8wdFUs1OWtMdxxb5PU=;
        b=NEBRzk62PjZf3qzAEnDsc2d57pyEFgfP9hcZheI/C69ZCITXxa7A071VsQLBV2u0W0
         mF8JNkr++kC5R17OQmODFfRB02XcEgncJVaNQ6kLALmc4VWtS1oxjV/5byeQRY8/qOxg
         l4du6QJ06EU615jLviqURUQQwDu/678V+eCV1Y/Y8f3eg9ElfklxvZdchrrkB1egkE4g
         TBbigbdtfnJZ4qJ5+zPIcj0rfQ7aj4t0sO1tTzKG2+T06njcpNOAzPQUUTnEOyHvX1/4
         igjCf4pmxIK5EZbWxgM63ARVSg8ThXCw7e/gUj9Bs7x1RP+SDkZb+oLHJPfkQagQlBDD
         XGYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770127696; x=1770732496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uEVDyNGIeHf4pNw+X2bXrhjpf8wdFUs1OWtMdxxb5PU=;
        b=uK6OxFdEordJ6+1tuVvg5HYYhTKe2Dv9sjJeETV5+asPgqSX9IudcmeSHsaiYLlpXI
         6RLWA+RNVmFUHEFDymuTIbD5AMonER9kGh1vdxd8Ga7WkrueEB3ytHWYXlHbZPxlKKhu
         vF4oohlH212/JBTC5XABpQObzp4ByrAf5z+lFypdVHfkT9IcIhSCyBW/cXmm6JK9XbpU
         Kkacsf/Ow8nY3cQkRbZXNZ9irVOiPwfl7gjEKLWWz5y2qlHRFFhbxkW6Gi5S6DZh2eFg
         ELRUXV9sT7aGfZzu2z+tBeDg3w6ER9fNlB7ZEXpPHUd/OOHcCioAL9vSGPZG1GMkUmbs
         XxzQ==
X-Gm-Message-State: AOJu0YyPyYQb0jXqAbs7Na91dE+LoNCCSP6elmZS2SOUrnILc7g0voO1
	3ZQrX/DT/iSqZBjTixsP1CEybvfpB/UOZM3khu9tR1iqIAYqm1MLLFFVKUUi4+nhRbs=
X-Gm-Gg: AZuq6aIVam0k1TKF4nMBsqA+t0lTo6v+hL/SzPmyqEGFqUGH03ZtTv4vbMMXQ95QIlW
	BPgkSAsR2o1GA0dqzSpsTSXyR4/FKSyY+tVnTCOLRuRPPAU2PIqEfRNIrg3yX4OdXiu3032QNji
	QudVsz9yFAD15iTcdGUkFhTMqKI2wVq4iI8Lcq7Kwodr8yJOpBZRS1YREofw6VzZ0TthxoN/Tnj
	GdofwEbxRyRs2CKKGRiA5mBgiyT1bn0n9mmm/fFF2RG6Uso3pUdid64wWSAGgCfbZWoBf9hvjLT
	J9OHmBej96NCcF2Rrw9X1Q8rQpKytXd8MCUZhcW435hHy0iDVFyry8NziyW4a3sQPgMS4Q843u4
	5W4CJWkVbv6m00FksysEPnnBp9VPph8UlV202Y2QYWHk0rM1FXjBPgwbSk5WRDCi8fCnSx+25+p
	ctcKmnoSmzbaDVtxAKrNXxljIBzw==
X-Received: by 2002:a05:6a21:8888:b0:392:e81f:6711 with SMTP id adf61e73a8af0-392e81f696bmr11458034637.8.1770127695989;
        Tue, 03 Feb 2026 06:08:15 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9008:ba52:f091:7dff:927e:f788])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3543d52c396sm7694684a91.4.2026.02.03.06.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 06:08:15 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Tue, 03 Feb 2026 22:07:57 +0800
Subject: [PATCH v3 1/2] clk: imx: imx6q: Fix device node reference leak in
 pll6_bypassed()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-clk-imx6q-v3-1-6cd2696bb371@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770127681; l=1359;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=WD9h0fFVKsfX86DefFgHgmW9sLJVVxtbAMFvxApruCc=;
 b=wXAWXX5AmnINy0EhIfleVbe6g2DbP1E2ngkrqcfESd6zIOLTsamfvNCQ5N2/Z0tXObOxAKayW
 41Nf1MuQstPCrduCmw3LSegnipFmeLm3NxmMflgZk4fI7MuO3mnAE0h
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

The function pll6_bypassed() calls of_parse_phandle_with_args()
but never calls of_node_put() to release the reference, causing
a memory leak.

Fix this by adding proper cleanup calls on all exit paths.

Fixes: 3cc48976e9763 ("clk: imx6q: handle ENET PLL bypass")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
v3 changes:
- Fix Frank's comment, add check before calling of_node_put().
---
 drivers/clk/imx/clk-imx6q.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx6q.c b/drivers/clk/imx/clk-imx6q.c
index bf4c1d9c9928..ba696cf34fe3 100644
--- a/drivers/clk/imx/clk-imx6q.c
+++ b/drivers/clk/imx/clk-imx6q.c
@@ -238,8 +238,11 @@ static bool pll6_bypassed(struct device_node *node)
 			return false;
 
 		if (clkspec.np == node &&
-		    clkspec.args[0] == IMX6QDL_PLL6_BYPASS)
+		    clkspec.args[0] == IMX6QDL_PLL6_BYPASS) {
+			of_node_put(clkspec.np);
 			break;
+		}
+		of_node_put(clkspec.np);
 	}
 
 	/* PLL6 bypass is not part of the assigned clock list */
@@ -249,6 +252,9 @@ static bool pll6_bypassed(struct device_node *node)
 	ret = of_parse_phandle_with_args(node, "assigned-clock-parents",
 					 "#clock-cells", index, &clkspec);
 
+	if (!ret)
+		of_node_put(clkspec.np);
+
 	if (clkspec.args[0] != IMX6QDL_CLK_PLL6)
 		return true;
 

-- 
2.43.0

