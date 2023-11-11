Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8601E1864C;
	Sat, 11 Nov 2023 16:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="uOdxAfII";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="GvRa6zxV"
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 944313A8E;
	Sat, 11 Nov 2023 08:08:28 -0800 (PST)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4SSLG30dTkz9skh;
	Sat, 11 Nov 2023 17:08:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1699718907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=piYYf1dl2LfAa99R19jkampDYxFa2ddx0cCMItdWC6o=;
	b=uOdxAfIIOog1dbNUSzK/+g3nzq8bO5hIlLXKG/LgLEGH/xFIlsmuhtnERCwE1DC6Yc6gt2
	oSMPb9gemt6x3U9kbMXPn1uXVNqYMDRWIMMTE8y92vVVvxTPjmrL9Mm4SSgAnq5gtHWzDw
	4FgMga/NtFwNCjRtcVYUqkbZxD7lr+CKgfha0XgiBEtX6TE4P8mxevi1kjS8b6Cy0V2+qI
	wIyOxFtnHlQDZ7p5xX3HgVkpH13EeBxuHxKXF4rk414udrTzMux1ZDlNXH89+g4hbkKByN
	9mLKIw3QMmuC2QLUNtrXdYjHe2EnDEMA7vPk1VubCYykajwdazO2jr+yy91WDA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1699718905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=piYYf1dl2LfAa99R19jkampDYxFa2ddx0cCMItdWC6o=;
	b=GvRa6zxVuPsANS7PI+nYSf9tonxhqWkuAXghCudME1Qig19FDlupxaOhskP+fL+yyAaxKE
	UHnyZgviHpoGLPVqsq7AcbGSESfssTKWanxiBaVVMAE37nuseQEaMsv5ethM72lhrFKCoA
	Ak6bpHzkXtbxnHrXBHMKuppBDui1+ls9StRNnxaQRDZAf9CYoZ7Pgv68YBXnHv02l6CII0
	CLnpw6rNni16QTnkIcySjYu8X4vsb9sOemiD7wti91bjhcXKGZuOREV0vWlEpp4kqAvccr
	EZndnIrf7svSv1k492WG8F065y7QrToyO3KYdwuUA1Yp3MioFyrBZPSSRKzu/A==
To: linux-clk@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 2/4] clk: rs9: Limit check to vendor ID in VID register
Date: Sat, 11 Nov 2023 17:07:00 +0100
Message-ID: <20231111160806.32954-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20231111160806.32954-1-marek.vasut+renesas@mailbox.org>
References: <20231111160806.32954-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: e1789c2d3a99e5ffaad
X-MBO-RS-META: ptxy7amyox6nbgb4ioeeqb3txp7ibw6s

Extract only vendor ID from VID register, the top 4 bits are
revision ID which are not useful for the vendor ID check.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: Split off patch from 4/4
---
 drivers/clk/clk-renesas-pcie.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
index 6606aba253c5..b5c430e4899c 100644
--- a/drivers/clk/clk-renesas-pcie.c
+++ b/drivers/clk/clk-renesas-pcie.c
@@ -42,6 +42,7 @@
 #define RS9_REG_DID				0x6
 #define RS9_REG_BCP				0x7
 
+#define RS9_REG_VID_MASK			GENMASK(3, 0)
 #define RS9_REG_VID_IDT				0x01
 
 #define RS9_REG_DID_TYPE_FGV			(0x0 << RS9_REG_DID_TYPE_SHIFT)
@@ -333,6 +334,7 @@ static int rs9_probe(struct i2c_client *client)
 	if (ret < 0)
 		return ret;
 
+	vid &= RS9_REG_VID_MASK;
 	if (vid != RS9_REG_VID_IDT || did != rs9->chip_info->did)
 		return dev_err_probe(&client->dev, -ENODEV,
 				     "Incorrect VID/DID: %#02x, %#02x. Expected %#02x, %#02x\n",
-- 
2.42.0

