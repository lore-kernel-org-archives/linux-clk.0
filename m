Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B671F9F7C;
	Mon, 13 Jan 2025 23:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736809862; cv=none; b=t1nxZ7XbrX+kF5vw2zx3+DpRrnL+oPslSvXWVjUSpru6mCMKCVA+2Lzvg1sLsWs72azOlrHiQ0swPRGHYgcHAhHAEIumCx9fOSdExNprSr6f8Zr1vd3XNbZMXmBjIx4SqO3wudOaYgdp8u3j8R0ygIGLPralKrnFbbAkFGknVcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736809862; c=relaxed/simple;
	bh=5KTdFPnxnpArGwMGVFkV/IIZnXBWhpWLM8+dm2ej1g4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BEZXyml/g5fEYRaGv1vfX+zFXM+Pgkj5uq+8224ojSeygo4Wy3QC+vebl7LtjOfZ6lnTqIG+DAW8u5HH/wTkZTOyV7IlymNOb6rzonuNmxMjmaSTQ0YkJmOHrMZs66ZUIaomilbGf9ECo7wIiZgXXS58rXsgouRF0UhHiFU68RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G8+T950q; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G8+T950q"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso30072405e9.1;
        Mon, 13 Jan 2025 15:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736809859; x=1737414659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wx9FXy2Nmb839wfaKsC26EG/DxUwAaShFW6TlBHPqXg=;
        b=G8+T950qa1XkngfIQZBsTk+wVC6kvJ1PnDZH2r7oFswLsyJV2LLBYsoQtoAE6vonpY
         Tg0cGXz1wCg70U4HdHPNi/XUTMkNiDQzY9gITrnRBM9vBkq5cX8pDoTUFHhMLvmsUB5o
         4u9dV4RJ9yC6RfZ0uM58QKEz+ic8fwaa4yKqeFWB2L9RIhYMvdvQzDh1TfKKlx+XnkO5
         CaaaGNuXiqCaZnomGaeSkLFRzb6l2AWlvzPliBivJI36I12yAvJe+jt7MD4M2g0lHwHG
         2kB8ZBR8tG3wYTWA/IIgqSxbpfnOvWX/Hg/1RerF6WSJ0LHsebbwfCHTRwwEhi0sCfnT
         m7sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736809859; x=1737414659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wx9FXy2Nmb839wfaKsC26EG/DxUwAaShFW6TlBHPqXg=;
        b=Yn+KQW3PT+A5zaWxUks99+6UEszrlVJQAdxaRGFt0yL0pzMAdV2JR3AeeXgB3xrWZA
         0YvD3McrVqVg0J3MzL1leiO7iAvXismvPNWJ2j85owLyjQoU+ot0qWPbqtmIl8tLOto0
         ZroBn37lvDyF0c1zdGNCv5WJnQpou1xY8NVeSLTMYaQZlv4Y5Zl3wpFSQEYcTBiSae2t
         VIlMeCfeiJuAedIMbp2cPfJwTlXYzcg8eRyp//yaeog2JJQjSTixUwP9nVL2iggDl2bQ
         Y4TGEj4QnASPbTRTZJLz4+1BjZGAUXYhVbuL+VzKVV8J5Jip2w/LjCEhN2Wf9Dmwz2VT
         qe7g==
X-Forwarded-Encrypted: i=1; AJvYcCUMZgZ1TcCVhw1PGxAP+0eM5fsNPelrkt0ajHXDMq8L6Ee5ZQ/PYcdAzxOupza4gM+GSj9vSGuC4/ZP@vger.kernel.org, AJvYcCVppmCdGtLWhzbfxa4blBxQWpPWdaKsLNtNLRekD73zdzjkDPddBOP5DCEzJJs8NcQUpKlw34nUJrom@vger.kernel.org, AJvYcCW/LqA1G/ObXPS1hoQJjG3M4H6SpQzSzA+E+Sc6eRavY87PGHwbSgz4SgZVoe7yMrVMMsLrVKZ3zFkscVeU@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7+HOiL2bjomdY5OeQb5le3jowcBpXqQx6c9qKzG57qyh9TnL6
	Br5G6vmVPYqART7CegTes0NH2irVAizMR6rJ0ZmtjBBKZzWJ/qs3
X-Gm-Gg: ASbGncu1YD3wLQ5ZCeGsBtqHWQFIvCmgs+f6qZy64WnFnUh3feD4pD4ULPHxVWq5jxK
	KLAPHaI2LTLaaR9AdP7pXKMBUBHNVmIWnbganlWRY20PuGBe+PQhlrjGdqVamlQCxiBk/rvlWEv
	0g/UVbjYN86wLYDF2sZpP7udtDrWcUclbiRa0pUVK8ErjPe6/TVsiSJ9arbZM0yVmiI1q8Uir0K
	p7XRaaobrZwrFKFeNbWgOqiKPRj7naOl5HkpCbAsZPfIcKI4yMBw1L457ITyVRCs8IlYjo4vPKo
	a8mGHkBFHs5sSKk/1P+MfFDsag==
X-Google-Smtp-Source: AGHT+IETw92tWWGO7BEG8/AEf0PiHR4ku5OIXaq1i7sihIV4ANtb+1QQ1DLhc23o4licvBWj6Y1LkA==
X-Received: by 2002:a05:600c:4749:b0:434:f1bd:1e40 with SMTP id 5b1f17b1804b1-436e9d6ff7bmr132289195e9.6.1736809858349;
        Mon, 13 Jan 2025 15:10:58 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436e9dd1de9sm156091075e9.15.2025.01.13.15.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 15:10:57 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	upstream@airoha.com
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v6 1/4] clk: en7523: Rework clock handling for different clock numbers
Date: Tue, 14 Jan 2025 00:10:02 +0100
Message-ID: <20250113231030.6735-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250113231030.6735-1-ansuelsmth@gmail.com>
References: <20250113231030.6735-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Airoha EN7581 SoC have additional clock compared to EN7523 but current
driver permits to only support up to EN7523 clock numbers.

To handle this, rework the clock handling and permit to declare the
clocks number in match_data and alloca clk_data based on the compatible
match_data.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 495c0d607c7d..3a4b7ed40af4 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -75,6 +75,7 @@ struct en_rst_data {
 };
 
 struct en_clk_soc_data {
+	u32 num_clocks;
 	const struct clk_ops pcie_ops;
 	int (*hw_init)(struct platform_device *pdev,
 		       struct clk_hw_onecell_data *clk_data);
@@ -504,8 +505,6 @@ static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 	u32 rate;
 	int i;
 
-	clk_data->num = EN7523_NUM_CLOCKS;
-
 	for (i = 0; i < ARRAY_SIZE(en7523_base_clks); i++) {
 		const struct en_clk_desc *desc = &en7523_base_clks[i];
 		u32 reg = desc->div_reg ? desc->div_reg : desc->base_reg;
@@ -587,8 +586,6 @@ static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 
 	hw = en7523_register_pcie_clk(dev, base);
 	clk_data->hws[EN7523_CLK_PCIE] = hw;
-
-	clk_data->num = EN7523_NUM_CLOCKS;
 }
 
 static int en7523_reset_update(struct reset_controller_dev *rcdev,
@@ -702,13 +699,15 @@ static int en7523_clk_probe(struct platform_device *pdev)
 	struct clk_hw_onecell_data *clk_data;
 	int r;
 
+	soc_data = device_get_match_data(&pdev->dev);
+
 	clk_data = devm_kzalloc(&pdev->dev,
-				struct_size(clk_data, hws, EN7523_NUM_CLOCKS),
+				struct_size(clk_data, hws, soc_data->num_clocks),
 				GFP_KERNEL);
 	if (!clk_data)
 		return -ENOMEM;
 
-	soc_data = device_get_match_data(&pdev->dev);
+	clk_data->num = soc_data->num_clocks;
 	r = soc_data->hw_init(pdev, clk_data);
 	if (r)
 		return r;
@@ -717,6 +716,7 @@ static int en7523_clk_probe(struct platform_device *pdev)
 }
 
 static const struct en_clk_soc_data en7523_data = {
+	.num_clocks = ARRAY_SIZE(en7523_base_clks) + 1,
 	.pcie_ops = {
 		.is_enabled = en7523_pci_is_enabled,
 		.prepare = en7523_pci_prepare,
@@ -726,6 +726,8 @@ static const struct en_clk_soc_data en7523_data = {
 };
 
 static const struct en_clk_soc_data en7581_data = {
+	/* We increment num_clocks by 1 to account for additional PCIe clock */
+	.num_clocks = ARRAY_SIZE(en7581_base_clks) + 1,
 	.pcie_ops = {
 		.is_enabled = en7581_pci_is_enabled,
 		.enable = en7581_pci_enable,
-- 
2.45.2

