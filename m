Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539167;
	b=irPcRIgbNE7ThJREYGtA0m9FGB6cx+7b00rMg22Jj5XGmPhbeedbdHfIDK9OLmd286qB
	 n3Kx3luvRUpykoXGR2PY03W4rg8RYymaV3IXId1kXSly4UygIME5BT35uczxVRi2yCCqU
	 VnugusgWOJgmvSAWCIANLetSe6pJlmXWKRtyNNxeAJr8nx00r4+Rf3QxQc8WMEmYdm6Bk
	 j4WhzP4YpVmYMcn7mWAR2IcE++0D/F55Lvvad6v1W1I2TKVFIJq0vZtlJAY8tzdpAHX8y
	 3899pu26LvDNz4geudbJHMJusSziYQa3wOyz4hu8xhWI9IRjTWhbMgHspprnHtgcbvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539167;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=XULPdpOXhZWcxF+6fl42iXhP5a4/0BDAv6XyxShQgu8=;
	b=qrp5eA/rGlB/vLxPikyh102ybwSbjI6rF8zA6ZxJk0ZCaWv1BRk2dZOTXMlAj4BW4dVi
	 hhJow2N/2Ag1/eafywld1Ap8od17YkV2d9v7ksR5mosi1enAfOPKzqr5iAWF8GvFTkUfl
	 EktGV//RzyJ7Llhc8sPS66Yip3pJbCAXu1xi9/5FxWS/6uTd5zOw1iqZdHJ/PSZPozmEF
	 aCQ+EFsQM8ic4MIFRF5YDGeyWYJ+hw1peHmiOc337rnLO+aQuUrJ1raCWbrnXZ3Pf921D
	 WdQFqXhdYgOTJbO9LEmyByJzP653dZktBVXNbNf8mpv6aXJxbhwSRGhiygClqNu/llQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Jq1bhgdJ;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EA0606A33E;
	Tue, 24 Nov 2026 16:52:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19EA0606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Jq1bhgdJ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B55934E41764;
	Tue, 24 Nov 2026 16:52:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8A372601E1;
	Tue, 24 Nov 2026 16:52:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 86E5C11E6998A;
	Tue, 24 Nov 2026 17:52:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795539163; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XULPdpOXhZWcxF+6fl42iXhP5a4/0BDAv6XyxShQgu8=;
	b=Jq1bhgdJ1xgjbe6h02/W9/1SiXR1ZGEWUP2U+1XCsr7NPP8siG9u9opAAEmq4XoJXvXk3d
	jOFtA/y4yh8eDsm5puLKee09wiVvEZUuB85bbk1cOaexmGj+wk1riKnlPEYpS0bK7ApInn
	DTZSDKlllFOYbawBZjDMWdLvexco4lj+y/UuK0uHLT1298TNtOkwVi64pIjnRO2cUD6d06
	erAoMdpog0azAQBwGsSLHBxfW+CoU9PKG+SIRAF3OjW1DAI3qSTd+WPeo6w/dIP04rNXRT
	8dglv/C7PffBCM1dz2m1N4d3ELz+TJdVyDmR5NuUSbEG2gdhuvfYabvp6Hovtg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 24 Nov 2026 17:51:33 +0100
Subject: [PATCH v13 08/10] clk: nuvoton: ma35d1: Reparent SYSPLL correctly
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-perso-ma35d1-upstream-clk-v13-8-c920f4a9f0ce@bootlin.com>
References: <20261124-perso-ma35d1-upstream-clk-v13-0-c920f4a9f0ce@bootlin.com>
In-Reply-To: <20261124-perso-ma35d1-upstream-clk-v13-0-c920f4a9f0ce@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The clock tree is still incorrect. SYSPLL is derived from HXT_GATE, very
much like CAPLL, DDRPLL, VPLL, APLL and EPLL. SYSPLL has a fixed
frequency, but if HXT gets gated, SYSPLL stops running.

Reparent SYSPLL under HXT_GATE to properly define the clock tree
topology. After this change, the frequencies are identical, but the
clock tree looks (again) much closer to the reality.

Since the TRM does not explicitly shows that HIRC and LIRC are
internally sourced from HXT and LXT, respectively, I haven't reparented
them (even though that was tempting). This can be done later anyway.

Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/nuvoton/clk-ma35d1.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
index 69a97aafa80d..06bbd63f2ccf 100644
--- a/drivers/clk/nuvoton/clk-ma35d1.c
+++ b/drivers/clk/nuvoton/clk-ma35d1.c
@@ -139,6 +139,12 @@ static const struct clk_div_table eadc_div_table[] = {
 	{13, 28}, {14, 30}, {15, 32}, {0, 0},
 };
 
+static struct clk_hw *ma35d1_clk_fixed_parent_hw(struct device *dev, const char *name, int rate,
+						 const struct clk_hw *parent_hw)
+{
+	return devm_clk_hw_register_fixed_rate_parent_hw(dev, name, parent_hw, 0, rate);
+}
+
 static struct clk_hw *ma35d1_clk_fixed(struct device *dev, const char *name, int rate)
 {
 	return devm_clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
@@ -288,6 +294,9 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
 
 	hws[HXT_GATE] = ma35d1_clk_gate_parent_data(dev, "hxt_gate", hxtg_parent_data,
 						    clk_base + REG_CLK_PWRCTL, 0);
+	if (IS_ERR(hws[HXT_GATE]))
+		return PTR_ERR(hws[HXT_GATE]);
+
 	hws[LXT_GATE] = ma35d1_clk_gate_parent_data(dev, "lxt_gate", lxtg_parent_data,
 						    clk_base + REG_CLK_PWRCTL, 1);
 	hws[HIRC] = ma35d1_clk_fixed(dev, "hirc", 12000000);
@@ -299,7 +308,7 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
 
 	hws[CAPLL] = ma35d1_reg_clk_pll(dev, CAPLL, pllmode[0], "capll",
 					hws[HXT_GATE], clk_base + REG_CLK_PLL0CTL0);
-	hws[SYSPLL] = ma35d1_clk_fixed(dev, "syspll", 180000000);
+	hws[SYSPLL] = ma35d1_clk_fixed_parent_hw(dev, "syspll", 180000000, hws[HXT_GATE]);
 	hws[DDRPLL] = ma35d1_reg_clk_pll(dev, DDRPLL, pllmode[1], "ddrpll",
 					hws[HXT_GATE], clk_base + REG_CLK_PLL2CTL0);
 	hws[APLL] = ma35d1_reg_clk_pll(dev, APLL, pllmode[2], "apll",

-- 
2.56.0

