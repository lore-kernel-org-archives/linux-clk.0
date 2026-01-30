Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30923446C7
	for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 15:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769788596; cv=none; b=jfWftC3qWKX2o+sH7fA0DSVi0bO0IkByVCuK+GY24JbsKiiBmaVulD9n4MRdcVPZgcGIHgrZO4a61ACBUTkF6WF+eMPL30H2gLJsFj8ZaKhulWABFD/+6T5xQJTAtGuiN19SyG1DxfXggH1QQuagMXMX9eWpYAWzKAc6D4rJ16o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769788596; c=relaxed/simple;
	bh=SpffUkjliwaKx4GCJ0zzoKE4MJf/13e/7G80/BLtTt8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XuuL1G3wUbBKtjRur4HmHbFzKy+O/5Ca7dMVC5ndI2/2NJIIhqJ0Tk4/DSmjF5zc8NA+Re+U284hRGqKerrwwgxQeiIMKLHV9BaGfJzQk9HloDmUQfJi0eOz17wSGUmFSlsu4CZ8YIyvQTlYSKqgHc3svi8UXW6L/jRCtyLzvVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wl+8NVsT; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wl+8NVsT"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-81f4dfa82edso1303226b3a.0
        for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 07:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769788594; x=1770393394; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zBCSSoRoE8bVuHZUQ0AtCJQPfPq1ZSOXtwQ+4NnM5Ps=;
        b=Wl+8NVsTrWpfnwzzXEj1U6H3kCi6X2kNKdNwLDrBJSwjl00vi9aw2FD3nmp1DYZeSp
         rM4rw2xMtUK3riGc4rK0i/BkSP2OUaBzJmTlFOpPLtFx4bQoertDFLPlGtbMae7PbaRE
         s8qf271f84EHRdggqwqenGOQbhqkrA+k3D5sW9tRhmh9o7JjeRvuFYzmlL8YqxOTph9m
         b0KMbvW+m0M53BOzVs6XBaSgi1hNUN4JQMla8aBwRGKnr+JvsJF8g4YB3gLkFSLK34Mp
         1pG08faMqL+5r2hKAJZgor+UgX4a8dbfm6aw3l5vnQb3IIXOytzSe10tazsClGhFyJFq
         e/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769788594; x=1770393394;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zBCSSoRoE8bVuHZUQ0AtCJQPfPq1ZSOXtwQ+4NnM5Ps=;
        b=QfBaOBJC/f/J653dq4f4plHtqdWxhzA/RrP3Hz8x/Zt2vYOdTTsEi1MaJWN5eSTaVB
         5FEre0SBW4iFQkCIMzi4LbQWcAo6cgCTJpngvgjldM2XmyrhkgYrhT19hKZ9qtthh03O
         72QphXFKdlN6FyF/PJGSatbMYO2Ekj6cjT2S3O02ULF58VWb3m0KQLQlaQQgP3e5dpda
         lvwg2PToOaKU3TwhbOrwLLy7CR9uxDUVWsVpr66qCaYL6CeOQmI5JDtLoikvXh3e6NXD
         Q2dfNkEkauEHXZQTj2TeHTDNegaAR/ss6PGrpojfOLd1eKL9zPhNsqoiuyyqpyG/9i/s
         JPzg==
X-Gm-Message-State: AOJu0Yz1fm+2BxeenJUK/THrWXzwmH7LVN/bNaJqU8b2mH+DLKtwGTSm
	XCdvXnK/12XTgw/wnxB5izka+6Then/mbFj6ElVekcI8/i6AIJYly9PqltOlVI+wRxI0Gw==
X-Gm-Gg: AZuq6aK68gPOKJyJIxCShlgeLaVKQmXTx1NG6TnpHNEaL7coGhYKwpb9ljmi6onLz5W
	9R/KAVPcIcGAaxCGV0DWqj27UM0Xl2pLqgBBda2c3+tI5zp6jdksYtRaZXy73NZdu8Fd+P0AmIP
	QPdPVdznKtVSgtcT/U+WxNfGtd+LJ7EUPsiMMzwT4VHIvOG9u6CNZuz8Tyi/tng7K43CwYsn+b/
	FaaXADH3pDhyo78VQpdkffOs5Zsx5qUJ+LLW7CG3pRUCZ6BoIqdlMa7AMyTHW3oy5+3KX92JrZC
	18zu5eUk25NWJTFn3XmzZPnnUxMNlRsXsC9Goo0+5499D4lnDWijWl86DAPuF8rXvwjK8V95RN2
	BIV4PGi56vHQ6mkN7JSSSyg21WpqvEqI/gwO6vpB35UyhD1FOof6pGLj2J54pAPy8AOM81sDOdU
	rPwnmbonyXAaQuNjPNtCjNVsZT
X-Received: by 2002:a05:6a21:6490:b0:2dc:40f5:3c6c with SMTP id adf61e73a8af0-392e0145956mr2877751637.54.1769788593981;
        Fri, 30 Jan 2026 07:56:33 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9008:ba52:53f:14bb:e0fe:f839])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b5d94c5sm80540015ad.71.2026.01.30.07.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 07:56:33 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Fri, 30 Jan 2026 23:56:28 +0800
Subject: [PATCH] clk: imx: imx6q: Fix device node reference leak in
 pll6_bypassed()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260130-clk-imx6q-v1-1-2fa4da5dab85@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKvUfGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ2MD3eScbN3M3AqzQl3LZJMkCwtj07RkIzMloPqCotS0zAqwWdGxtbU
 ABfTUf1sAAAA=
X-Change-ID: 20260130-clk-imx6q-9c4b8835fc26
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769788589; l=1401;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=SpffUkjliwaKx4GCJ0zzoKE4MJf/13e/7G80/BLtTt8=;
 b=RenJYBVdy/Ov1ruNAsJl/+5Atz9o7oZITqzqfuFckxK2XcbQReo5YwVM9xuKAyR0SSGv96MM3
 NctQ2VuE+pNCrMSbJ7AHd/nF0J8oRW4968bGtYuOEoGHg8D4lH7rp6s
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

The function pll6_bypassed() calls of_parse_phandle_with_args()
but never calls of_node_put() to release the reference, causing
a memory leak.

Fix this by adding proper cleanup calls on all exit paths.

Fixes: 3cc48976e9763 ("clk: imx6q: handle ENET PLL bypass")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/clk/imx/clk-imx6q.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx6q.c b/drivers/clk/imx/clk-imx6q.c
index bf4c1d9c9928..1d8e8f0891a3 100644
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
@@ -249,6 +252,7 @@ static bool pll6_bypassed(struct device_node *node)
 	ret = of_parse_phandle_with_args(node, "assigned-clock-parents",
 					 "#clock-cells", index, &clkspec);
 
+	of_node_put(clkspec.np);
 	if (clkspec.args[0] != IMX6QDL_CLK_PLL6)
 		return true;
 

---
base-commit: 33a647c659ffa5bdb94abc345c8c86768ff96215
change-id: 20260130-clk-imx6q-9c4b8835fc26

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>

