Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3DE331203
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 08:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769847112; cv=none; b=otkapES8sIgFqd/RKW+/x/WU8Ak/8XY8nB1ditxYp+Eqq6FhikjBk6U+T85Kxm1NUoL9jC/sdRifA/VrJTCCxxWQAjd0It+bL6WQxyUj2rQQzT9iaeUzBAPZWYuDRxIyTKa3SJ7EMP0H5d2cXf+XAf0PzrRtCRudp3W+bdW4cIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769847112; c=relaxed/simple;
	bh=8z6Jwe22roU0IcUq5EjPKimwprqUXrkhxOXSXzExrCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Djg4hTej3tabpSXaygepJdgCNORKPd01JOv8A8Vad6uKv6+jmL4q47t3GcrjIVjsRbaN+A0hP4Mm7B4tlYpJ/Z0nDPrktzSFMWSUMhAzzvfNC1Y7nUzHvUIKDE7Fq6v1TPpUrQ/p4NLeA/bxP97o2PDZvckORxvyiewzuX6X7/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BtQh+d3X; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BtQh+d3X"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2a79ded11a2so19689665ad.3
        for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 00:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769847111; x=1770451911; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FjfAJsvyjCO/vjM7jBeWQxefgcvpbHgFUQ72gcagyLo=;
        b=BtQh+d3X6ZJf8Y7tBkPZZ0wEyajSbDy3d4GBxmel4Vkg00X544G70M9IzzpvGrwwKV
         mb2PrmnrmTEkhUJ7Cy2ptl0316YP+ukcUtkipRFkja3QtxefRE7yF5UCZbjUOtAP8cED
         k+FvMaxJr2CdNfC1SjaZEOWfYbkkSirMhkClErZOTIMk0nAqakZIieMdJ1t1XyGg6Dff
         eES8DxjI7eTXyAOiAglRGpYHL4wHiNuNkj2KfGKq27asbblpCm6djpXW/rzfYIpB9+rL
         1WMK8+vW2c2f1y18CA8v8CK7S4GBUYD6E/RiiuXQQSDM4HCMALhcINS5Wg6DsjrpoL5e
         UMqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769847111; x=1770451911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FjfAJsvyjCO/vjM7jBeWQxefgcvpbHgFUQ72gcagyLo=;
        b=jLdq65tG12O8ePfixyOn2RCKaeXBIOOGGTJsz1YFIp/qNrCtKaxBaEfoplI/dJsyZ+
         yXUSC/fcb+HIR5Zali+NEtymyKqYRJgZpHbytW1f6xxF0M0pynNWYYSGC82tt5EOIXaZ
         KrsL+3av/BebOHZfXn/e7kHpqmGLfkWDe8qcEy7fW66ncP/uaUyoZMa7ErBiGEfZLxKj
         lALT/JtP0E2Vh/8GeGOLboQVOk3HBd0YInL+pNGrJxcVILFsJ5CORg30Di0zsIR/F7wH
         MS7Ca/gL6wYSKex6UD1zQP8B08GsQGKxuBmzvCkC3TAH0bmdypGYywdmVqEXrv+yveyH
         0IBg==
X-Gm-Message-State: AOJu0YyZTIrVMFqUshFtnev4E9T8PzofjGfEoikRk9bBaQZ+B5ASIVmv
	qEZyMz6KpMe3kInKEfkYQ+WyPtDyoaQKSC8UUABsTDsFzZX5VWMLaZe1
X-Gm-Gg: AZuq6aJ/lcuM74VJgaf7Tl42B6kfZFdGn4iZbnXuaSgVdn9PAfqOWpvXTXNod0D725+
	b+dIyLnSjF+u7CHt6PJZBt9PZ6amoD9iCgY9+ZlpHHgDO4ZumwZwrjJ+mKaFGFhN+O8Bx5vzZu5
	Av1g8ZFAo3HUE+96UYFJ5HGlqh46/xF5VoiURQlO/s3+fyNj1MXM96mO2wW8FvLkQYaAUPjs+BD
	JVIBJ3PfLWlqr8Gsx1uRt9VmcGP7/s6teJPP0I6ANQDRn2c9zReG3jNadd1THi7VtAoD8m2L/YT
	M9qh5Z1a6rSADDpngx0DigFdxs6bfwGt2HmLCVHEuUSMIesUov460GiJcU9eniIEbNpTVsUJlGe
	GLfmeRfgw4ZguRe9GVycb5LHFzpnw93MNHiwQxiwVTs05Lr7vPsS55mVwnAkJQbcLt+BaBEhV/E
	EvEzbnPYA=
X-Received: by 2002:a17:902:f544:b0:2a0:fb1c:143d with SMTP id d9443c01a7336-2a8d9592938mr50396115ad.1.1769847110853;
        Sat, 31 Jan 2026 00:11:50 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9008:ba52::3a87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b5d92a9sm92115125ad.69.2026.01.31.00.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 00:11:50 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 31 Jan 2026 16:11:35 +0800
Subject: [PATCH v2 2/2] clk: imx: imx6q: Fix device node reference leak in
 of_assigned_ldb_sels()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260131-clk-imx6q-v2-2-70471ddc99e0@gmail.com>
References: <20260131-clk-imx6q-v2-0-70471ddc99e0@gmail.com>
In-Reply-To: <20260131-clk-imx6q-v2-0-70471ddc99e0@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769847097; l=1463;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=8z6Jwe22roU0IcUq5EjPKimwprqUXrkhxOXSXzExrCg=;
 b=oiRk1okIysEjvHlGj/5wAp4PFaBltdhhMRDvFAiXGskFVm57xO67i5mEoNGJaNojLeDz5+wu+
 WdOTQp1dMycC//jtDtoXsQb3Te+V7M8qOzaj4IqkCVqdZ0e5zHzDORo
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
index 1d8e8f0891a3..58882dbc3a11 100644
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

