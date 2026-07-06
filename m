Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59B141D4F9
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 09:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330367; cv=none; b=OrrXiEQfmx3jTkEwLbpu4Lf7PEcPgsgGr3xaSq0Hird2VG3aSpghvgBJdk8WEs2jxQjkefpv2VrV2V8IucWX3VAEBUtu99blzPF4pk4FaVuLySZyLHkQJao5ZX5D8YdGr776TXOdamb3GnJ25d21Mcw3agCvSb6zztT9wrcdZLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330367; c=relaxed/simple;
	bh=YM5ShWAEXTvmgI5Fwj/9iD61+1bTWSy4EWyE1bdkdA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aUOKB+kvXi3taieNbm0kDApb+GQb9+QXNVdaqcsA0ynM4EdzFIs6JW/TIRditodD39sGauKwHrNbn3Vi0zCwoHyfd5aFgOjrPrYF+kbL1FGHQy8jjNmqap0O8V9C5MjhQavkazeuvO3kDiD41gVQhvrqDT4sjBSQUnnYDbVQn2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=VQRVBWFA; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="VQRVBWFA"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47db714766aso450091f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 02:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783330360; x=1783935160; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8qaD3KpHXlXTlsicr8XbDQzikndK4UikxNXryf78w+g=;
        b=VQRVBWFAB0Sa4AwsqVebx7b+OzetZdShSmMISP3IxZ+MyUrMPY29H7JxBkgaPnXXt5
         Au15mNgX8mgH6U45DM0gV1mZOMEIQGiqzHkUwKr1vItpJJ7g0LLxt2b7MfhNzu1b0ffR
         Q2CWf1hFyygWBc1+lkmtCcrm9ICpZ36iPJsl7lKGgGCYXPZ9f5Ww90SFkGc8gjmbFRGV
         NY6vwzixiWFbQ4gN0FxoDpb7akBJL5oc8OvyRTedwjr5iiMZo8I4Th6LBbUsBtDEhD+d
         Bl0cu6opEDud8J/kqT81pHpzdeT33f9XC/gCg9l7NQLOf0Ow7RdFsVVMpgfX3EraYWwE
         1OhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330360; x=1783935160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8qaD3KpHXlXTlsicr8XbDQzikndK4UikxNXryf78w+g=;
        b=LS1LU1oduIEpaRVfIHFq1+HDdAUpvAQJkPRBHOY52f6YXgYx3Z7Xou3Cei1qW0bita
         zhezNHlsX8BAT8NDEu06siTJTnkuIoVMxKP55DGukBA8NwPSRDRJSF52P5ekDVII8NE7
         mE9EhUtNz0oeL0rhxU8lrh4DlApARDzyP8xmsoby/wRgKsDR9VZ1loLQoXFxVtYHia/J
         ZRzBFEWkeUmbJjrfLdiM6v1GBWFjwZ0FAb0HOKIw1kHILajYxK+W3/aqIks4d10iTlHn
         cmkjattUvTUAcGFkyAj5B+QspfNweZGGKpVfi+joCHN5O6G0Nvbpqa0UHQcFBJQVDXae
         JsMQ==
X-Forwarded-Encrypted: i=1; AHgh+RowZq08Hn+17OLz+rT2jFG6iT5KIM3tornLTrHJZrFURtWJGyqerOaSHfjl6zNzHG+x+rl2S9gHpE4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzApMNERK5LkWV4o0h+TWFUyaPjAYnn+wHyIlbRLHujR3upbKsb
	GTWaTp3Atr6TkF55n8q5frBq3lScyeeFwYOXpopPr5xf0TYtOVWGnG2fYqKL0aA13gY=
X-Gm-Gg: AfdE7clsryxLB+mTxauMCmvF9q2AHqAMznne4dksQn7SRKgftr5EM5XM/9Fdkf7u+9q
	blPF3m6Smnqltq6L69p7txL5trICzq9DA0tY7Q3po7hkAMgixnG4HZPqqNBXTS412bN7TPzExIx
	/kua9utbOB8TAV6hrdEB4/sADXTZxUGtfk5+sGrtLrdfQfrS4m1+DgX3kZKgEB0H+uS48jH/rb7
	2Yv52GtnX9VZI0/qdL9jnSkPJxgdS5hWOOHtW3SI06eFOEDlCQLS+6WzW6j9XMYCNUEY+DKJg4x
	GtnPyf/2HN8h8ghNt+qAmaMtdzQKk5SKzzWXEWf5AADUUGb5sLoUqB5vKcRCEg4/3B342iFv4fe
	GlGRa7S4RTiNERdDZFYaxJ4n8jS6iD9k9YmKndw9bsUN/aN+t/8Fg5mFfKxrHtx/mikSiibv1JW
	owK4AaxpNR7GQ=
X-Received: by 2002:a05:6000:25e4:b0:473:41c6:f1b9 with SMTP id ffacd0b85a97d-47abad9f4e9mr10488782f8f.11.1783330358720;
        Mon, 06 Jul 2026 02:32:38 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1495:8c97:96f4:dff8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47a9e4d6da9sm22724967f8f.12.2026.07.06.02.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:32:38 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 06 Jul 2026 11:32:14 +0200
Subject: [PATCH v4 6/9] clk: sunxi-ng: div: add read-only operation support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-a733-rtc-v4-6-f330728db3d3@baylibre.com>
References: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
In-Reply-To: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3945; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=YM5ShWAEXTvmgI5Fwj/9iD61+1bTWSy4EWyE1bdkdA4=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqS3Yl3dlm1jKmbVqsn7Rcc9HiTF6eoKTChjUWI
 t1qYB/aI5OJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakt2JQAKCRDm/A8cN/La
 hbzyD/9+ecBIMkVBHC9SbhtGLh+1Wq/re/x8RaQWpRit6MC1z/qa3av70z1wyB2NcUDQkRWHeBA
 SjFnA/G6Ba3ajJfE7fEzeqeoGCeApCTWt9js6jPSzMbQzQl8c2JBmRF1sRlxWzkTJl+L/Vp/yqb
 mWCp4QZAFRq7xxeBYzuAeGYj0mObaO57Th7VCqYlTxQFrBtDURG5eXacWE46CA7qC1QYl9oDb95
 gPPKegGUH40KsqiC7k+dQXklTL8bU61dR1CzYx4jzYIcQmTWCr2TCPy/sI1ft1uL1P0Du9TfXaf
 AxPDUv98UFuUcAJXZlive0q8HiYhwUe39R9DhriwKXzGTt19Axex6TRBEIh0v6FZ/VNjmZEJEKq
 29p7D6jXKU06slB4XfVElIyW949dAdP5cNWjFtpdb6Y+HGh0EuxAIajiGTmcqgxCEt8SmHKk5DH
 rPSIQKzA3HZwk6oIJficJ/t7RwAUo7VE6zTFQ0BY/skXgzwin0D48AfyAeTIJtyzGLRDdFaR18K
 mQB1F47Ks5G89dWYJpsYOzcb6YYlCXKVN1BzsruSmYO0MIfFEt++ssSijsUzaUx3NPEZyR1JFYO
 szCS45D5E4IJuFEZuwlcWr4GUUJQmxp+WwUX9SJ9kCul0K0log1R1X8qH1FWizjlI5Ov9Pv2Fym
 579DH1hjT/dZqKQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Add support for sunxi-ng read-only dividers. This will be
useful to the a733 oscillator detection logic.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu_div.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu_div.h |  1 +
 drivers/clk/sunxi-ng/ccu_mux.c |  2 +-
 drivers/clk/sunxi-ng/ccu_mux.h |  4 ++++
 4 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_div.c
index 62d680ccb524..d1c8c7baa12d 100644
--- a/drivers/clk/sunxi-ng/ccu_div.c
+++ b/drivers/clk/sunxi-ng/ccu_div.c
@@ -84,6 +84,36 @@ static int ccu_div_determine_rate(struct clk_hw *hw,
 					     req, ccu_div_determine_rate_helper, cd);
 }
 
+static int ccu_rodiv_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
+{
+	struct ccu_div *cd = hw_to_ccu_div(hw);
+	unsigned long val;
+	u32 reg;
+	int ret;
+
+	reg = readl(cd->common.base + cd->common.reg);
+	val = reg >> cd->div.shift;
+	val &= (1 << cd->div.width) - 1;
+
+	req->rate = ccu_mux_helper_unapply_prediv(&cd->common, &cd->mux, -1,
+						  req->rate);
+
+	if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
+		req->rate *= cd->fixed_post_div;
+
+	ret = divider_ro_determine_rate(hw, req, cd->div.table,
+					cd->div.width, cd->div.flags, val);
+
+	if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
+		req->rate /= cd->fixed_post_div;
+
+	req->rate = ccu_mux_helper_apply_prediv(&cd->common, &cd->mux, -1,
+						req->rate);
+
+	return ret;
+}
+
 static int ccu_div_set_rate(struct clk_hw *hw, unsigned long rate,
 			   unsigned long parent_rate)
 {
@@ -143,3 +173,15 @@ const struct clk_ops ccu_div_ops = {
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
+	.determine_rate	= ccu_rodiv_determine_rate,
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
diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mux.c
index 766f27cff748..775d396ccf31 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.c
+++ b/drivers/clk/sunxi-ng/ccu_mux.c
@@ -68,7 +68,7 @@ unsigned long ccu_mux_helper_apply_prediv(struct ccu_common *common,
 }
 EXPORT_SYMBOL_NS_GPL(ccu_mux_helper_apply_prediv, "SUNXI_CCU");
 
-static unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
+unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
 					    struct ccu_mux_internal *cm,
 					    int parent_index,
 					    unsigned long parent_rate)
diff --git a/drivers/clk/sunxi-ng/ccu_mux.h b/drivers/clk/sunxi-ng/ccu_mux.h
index c94a4bde5d01..272a2c36a8f2 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.h
+++ b/drivers/clk/sunxi-ng/ccu_mux.h
@@ -134,6 +134,10 @@ unsigned long ccu_mux_helper_apply_prediv(struct ccu_common *common,
 					  struct ccu_mux_internal *cm,
 					  int parent_index,
 					  unsigned long parent_rate);
+unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
+					    struct ccu_mux_internal *cm,
+					    int parent_index,
+					    unsigned long parent_rate);
 int ccu_mux_helper_determine_rate(struct ccu_common *common,
 				  struct ccu_mux_internal *cm,
 				  struct clk_rate_request *req,

-- 
2.47.3

