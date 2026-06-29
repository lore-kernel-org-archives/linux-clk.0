Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31946407CDC
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 12:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782736959; cv=none; b=kZkWAjxUqmVrXmcXSFeLAUJON4SyAQ0tQeMdRyScXBwQPZUUqvwIOVXHZU3mEhEaxlxbHQPiToFsfhln0yfwEOvpHROCaA7wnBA8eBTFNRXP6H1reCZcQtj53GNwG+P3qHTNX5f+RgWicS5KAM3XkvuZ2d8AAtd6Maa2bv++3xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782736959; c=relaxed/simple;
	bh=FoMUBVpR32MtJZer6V8lgBnEQWSbZvsirk0xN6alb7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Go7bQQL9BeUKVkxAaTc1kNAGiYG2NnpNl+T1l/S6waBiXVM3DAYT+cjGSn8fTKSV0W50LLc4sj8FxP/EwTQjamYcu6CepooHOq8aBPA51lwqSCsLsrK8OC2mwsBtPe6bL7Dj5PNlK/iXrREplt2c1aPQM7vlFi97km9WG0aSxVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=oxMca8I7; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="oxMca8I7"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4745492ed3aso444609f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 05:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782736957; x=1783341757; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pw83rsiBFZIUZWx5sliCML1fBJ0c8WhT+nfZEUBGdLM=;
        b=oxMca8I7GdgmO4i914/lyl/hFCkTFtoMBubny5FlnhvelebvEQ3tX4Xx6AQ0Dd95HK
         D4wlOl5uNmHpl1o+gd6u45F+Hzd1fRHBEtu7ZYw6lLIXNCbvu0UoQPEdALmAc/84iXrp
         Eh/T8ncbfyFVwBT4t29ZmEbjQf+6S9AYYA6xHsaXAINByrPsjm1MsUhSu3gJr5CEWUvF
         OCyqpaNMMYUlQoeRXZkoSXgUob6HxJAPFwXMbZhGrn32fNxppaJ8HBPxz8vzYFbcRIaQ
         dyJR5kb5XjQWrXZOrOqXPCOYTQEutzGfNN4zPemi8DcztEbWXghOLoJr9rXxoU1ZpLkr
         GOHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782736957; x=1783341757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pw83rsiBFZIUZWx5sliCML1fBJ0c8WhT+nfZEUBGdLM=;
        b=WW/VR/s+dZVteI96PKdmVEb5NLyHNVWe3/tSeg3HNJ569/oIoSRoZ15vwnXQo4F8R0
         ua5oOi6/Tswlb0qhq+NgBKUNJsnxRCeJngT5MXlnhWjGN8BGaTdYEE6nTbEargEohsvk
         hPfecL99kApk2NCIt/LGooZXqOtW+/KwbzuAYcj7UVVGrUn51IWBwtDPm9H803+yeeuU
         DhTnY02DmBUqxClJ0MWuVcneJGDxOBrqjpVwj0K+2HHUktnAOTy1QRqtDO+607pDaymS
         l4yxXGrFslxMrxo2Zbc9JHvpn8bM7Yg70X2I2eVfBEDT7cVnrLzvuaHn9O3cyVIHqkYq
         4VrQ==
X-Forwarded-Encrypted: i=1; AHgh+RpwdCFMIrXCmL4XZ08swaNCoCdhSgNNrK0V/WKSQr5OTWLR+mAVm2WIPrN6SHKlVLpnpgPtCqj7Syc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLM88ZkB6hJYQA/b1cs3wAoX3JLbnSJKLezT+NHpeKS2zfyEOD
	Ky/V7+T6Yoi4FmboqSVLQZMtDEBREImvhPSHKqlWP08J8CEqpAHlLX0Xh7umsedLk5xyHY4OxAl
	3GOlc
X-Gm-Gg: AfdE7clF2uaYbpFy8Sc3ATrG3rZAP+Jq70DBR43wu+cxw+i/Ba0gDfO9kLAQYND+Wf/
	KBGaeVkI7I6CZUP1k5XL9EMYZbcgYAD4i8BK8uANPwI1y/LbSWzeUIH4LcXDs3pCCieEZ78dhsP
	7Voayhh/uKnH5FKUuvZM1y89tvC1ZepaaEnW7z5e5db8iFTrlxqW5+MxOObibwhQEg0Cg8+iG9u
	JFqtIHUhENwZ6TQbl1EPa57gxMKT5v2IdlseSQ/dBa82P0Cpa9tRQSFmxhd+aXNIx5h9YM9a86b
	pTwQservVg7qbRi4zNF1EsLxYqbvShYwZH6yybrsa10M2mFvsPUoIlvAag2z2U3AQAt7oRbGuXp
	x6KsSurpQemq0YXBSo25lOeAeeKyZ7461dSn0WXeicCIV9BcxhF3geJEzPmi3hql0zeh8p+baAb
	2uEb+Ue41upI8=
X-Received: by 2002:a05:6000:2c0b:b0:466:6ed8:1e1b with SMTP id ffacd0b85a97d-46dc263a79fmr26849485f8f.21.1782736956641;
        Mon, 29 Jun 2026 05:42:36 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d21:f5d5:2d3c:23a7])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-46f9db29b15sm21643420f8f.18.2026.06.29.05.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:42:36 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 29 Jun 2026 14:42:08 +0200
Subject: [PATCH v2 4/6] clk: sunxi-ng: div: add read-only operation support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-a733-rtc-v2-4-7b72112784f8@baylibre.com>
References: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
In-Reply-To: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1337; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=FoMUBVpR32MtJZer6V8lgBnEQWSbZvsirk0xN6alb7w=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqQmgvEGszTwRXVQ3roYF7XUovP55Mn6aarufxX
 8kePw4A99SJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakJoLwAKCRDm/A8cN/La
 hTF3D/wL66zdurLSHBXauyOo/Zxl5eIu+ExlDjOXHuoU9nsyPbxB/Fvr5arOgZKgvkzeEFBeNyD
 rAJUqyTmc6DVlZirO2UJrSavRMrcf+PRwdB+UnjMkSCdqVrVRG57FRA69nk1XXGZooC99EBbYdG
 bhssIXwrI+pW1uDUGU5nLIn5+FoTUHgyM1DL9Wldf6WnJjpfYxvSmQLtGGwBK6Jp80BbtvgBVka
 FTJVT0SjaBvXOqJOYhqJaAHPveNEpUEhV1DgPiydlgT0i88N6GkXizHXfgPNom3dpTjQ1vPrRum
 QCL5QHaaIPndE7AZcGSyZAQ4OaxI/yEOEIbKFlAggihe0wBUWdf9tH9wiUVdvDZWrpErGfeD92F
 c9w3gkhEKwy47mVjQJcH9gGIF+CTmr3ND2kG3EzotXk+61Ok3LmVZcKWPSDrddLk2rY4x6LNqh9
 dJyxjsiE4Ee3WyWGcaDN1ajaqAavcA25KwmSg3BooXCtZPsk9rMDvcvylni/8+CoIqKYOwNwh7c
 xdUuJ66mrS6VvpM8TLvIHuoyK2t9uhapPTa7a64zx7i4RW6FP+20MIBepUl4nU8BvisqT3l+iKy
 AfZQswZZ7g+C8UCJH2Xb000LCLKJRgS/Ym4EDI5eEbwLYMTbotAmQnFlaOzSmJoxoU3bav2VMNW
 v1fkXBQp4GKAnTQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Add support for sunxi-ng read-only dividers. This will be
useful to the a733 oscillator detection logic.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu_div.c | 11 +++++++++++
 drivers/clk/sunxi-ng/ccu_div.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_div.c
index 62d680ccb524..0e3d9e6e30fb 100644
--- a/drivers/clk/sunxi-ng/ccu_div.c
+++ b/drivers/clk/sunxi-ng/ccu_div.c
@@ -143,3 +143,14 @@ const struct clk_ops ccu_div_ops = {
 	.set_rate	= ccu_div_set_rate,
 };
 EXPORT_SYMBOL_NS_GPL(ccu_div_ops, "SUNXI_CCU");
+
+const struct clk_ops ccu_rodiv_ops = {
+	.disable	= ccu_div_disable,
+	.enable		= ccu_div_enable,
+	.is_enabled	= ccu_div_is_enabled,
+
+	.get_parent	= ccu_div_get_parent,
+
+	.recalc_rate	= ccu_div_recalc_rate,
+};
+EXPORT_SYMBOL_NS_GPL(ccu_rodiv_ops, "SUNXI_CCU");
diff --git a/drivers/clk/sunxi-ng/ccu_div.h b/drivers/clk/sunxi-ng/ccu_div.h
index be00b3277e97..a30a92780a05 100644
--- a/drivers/clk/sunxi-ng/ccu_div.h
+++ b/drivers/clk/sunxi-ng/ccu_div.h
@@ -300,5 +300,6 @@ static inline struct ccu_div *hw_to_ccu_div(struct clk_hw *hw)
 }
 
 extern const struct clk_ops ccu_div_ops;
+extern const struct clk_ops ccu_rodiv_ops;
 
 #endif /* _CCU_DIV_H_ */

-- 
2.47.3

