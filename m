Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794269290;
	b=CDCzA5KQT62VRY90+t7wJ3Xw0G32IWBxixJtxsvVtHUCgaBG5KSpIqPeLOsM33aEKOmq
	 1dwT49QuRtbSnDZ3rG/9exEAlWlxT+FFPjvSEckNxOJ8eN/dRgqhdiudQGpaFnJawEdDx
	 SnjNMr25JXLK6KQ03dePw8A59KIzgXKXQlEwqoOc2ngSvkoZ+Zx1b9Lk48O3ZNe5uSNWE
	 6HMKU43E6XTJcgP1GV3TYuGCOS9OhyI5cXcVHMYJc+zCH7iztlGxMQttx7C7UfroCKXNy
	 nBpxLnFdA6+I4cKwZ0NISZuk+reEQEHQxtPRM19tfi2hWYGd58O0xudu8Qpwpr5z2/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794269290;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jrxKnimkJlrFR0WRqhZUCXVjI+A7zsd604Fm1CjsY5Y=;
	b=X6pJ1/Bo+ezFBoaB1c0XToVYcHx5NFFhbyOzknBc7+sv1bIWEm+WW7VAQnxCBQ6gGfZP
	 BwSPWn9vtKFRjHDmUUriIEoDkhw88J0s5DeyT/3IQ/O0BegF4atARCnXPusieM/gnUkCQ
	 gRegNvV+JApGfJHGNI7Xu0bvIGKW1ho36FCviSprvJbiaTFoM7ZPEOOfXl9Y4wky/ROkB
	 trnG7D11wZ/1xyGALPZ/DO5SAd73LPyNj38LJVjk8++/YFbOj4o/1IhewT9/aCRjTxIQU
	 eNKALTg85DW0S2b8kwUPgo+nurSfYr6OzrnuHqFKaT/5O4e0qPS3tCsGe73+HIMN0gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="fAT/bcyF";
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4448160A2615
	for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 00:08:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4448160A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fAT/bcyF
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-490585eddfcso1173028f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 09 Nov 2026 16:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794269289; x=1794874089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrxKnimkJlrFR0WRqhZUCXVjI+A7zsd604Fm1CjsY5Y=;
        b=fAT/bcyF94tPNIyAtZNuFvVu25DD39UP0tsXgVALMMITkcXdx4F2P0SUEwY0K86s1s
         HeC9TFkDEbWLcwNm+5FsT+WG1ZaoQwSsv/Wc7yPMmfNiIe7fJjN4jTDZFK8xw0inJzZV
         7/7hSxUntpvMfzQTau+SSllyj6MLOPxQtPiAWowsbfArxB+J5WU0b/3ePEvHEO6IJQgE
         YboiXsN3ioo3wvXLBZ7ZaLPdAYoA55ccPVurWQ4cu9hNID1KbYm0E36fUhN5OF/A2+Tu
         FJO76NOBVp7oWMyS+7AJGwP3iy90/Puo9MV4D86jZ4xYnl2YDtLl8glWCcE3RGF3ogYc
         hIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794269289; x=1794874089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jrxKnimkJlrFR0WRqhZUCXVjI+A7zsd604Fm1CjsY5Y=;
        b=tR78adu13sAB7KX5ChS8f3S24Oqck3T88gLx0EPLJrnmdtDbZdvbaKEl3iVexLF9Dq
         ENjJRB528uuyN9NAe64eif6/XKRJVTePyulpBStvwb1eUYOc7sRpHyEMRMFhLBpyVLq6
         TZZpCoCV+2iLn4IyExzWVYVl/5xzgDCjeOpO/GlQFipwLymsmls1eK5h67vF9fXLQrIw
         w+P5D6LzJEOui9i2guN7/8BqavAts1B+DLMarfzcy3H26hs/kODx7M4MEnDuTeo3rHBP
         3YCPEygaEriRWG2NlfhM7+yvgxYGK7rw70P1sPEyPptsnAoAMej43/eX+2F5JlmGkNk2
         HL8w==
X-Forwarded-Encrypted: i=1; AL+hErFJBiOqIV8+doaNLW7JzWxO/KaY/f1gdEiRg70XXmIIZEPuQbMK6bWBWRKe1our6L2EcqL2KGOxHPk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8C+ZX5OdnlLXlazoNmWDG2SJ7Xb1tBHmJTfgkCZHlei/VZPeQl
	MspnOvOXPBMmYbkvJvqgkTVI/7FPSnJ6FRgd12GHRtSB6rqy8JPKazBbWx/s3A==
X-Gm-Gg: AYBFou0JR+fas6PF2eeHub/oeVkqjP0+ubvkmGvaMwCrRY6+sz3nl5Ylooj7Lm4O84e
	X/YQLZpUhqacHozm26Iz9Hx59f5xP6bf9i/3paBt4QBUSODfErTXu3xJB0vFGl3kszRRTUowNCw
	R2/wcf+mpJldZhCnp/H4BOeRoOk2+DfQMwHMQHxhCBFveiwwnUF9ncb7Z+VdYx7tNzna1fs/8VA
	6rpjKqJZmX/5dwpTlP/89iwNNpjXZSI2qs7PCTZKF3epmCmIRslghWLzdEG6DFtUG2Qs41d5/51
	wtsj3EABgNEH3BnCucZv40u16PJP4nrxAttP8kQ2lKn3/F44kz1yVCtnF04+cBRXKZ+HJkpVqNg
	cjB24k7R7Qo3cyfmOb+EjU5WBgyIkmE2GDFpPD+eWppOqFzqRi6V11lOa/pAR+sMauIRRdSKjic
	gRLAUDJA+fSId3RbtHyaw4vxrkG185l3vkdeRDsNXlqlBByXnZMyaMUSH5R4zamFqSHxJc6cu8n
	4Ce9+yEw2qhBd1aezKF6jsCYPFzwT7WGJJNCq69tlb/JDh4aETewiQ+f/x8FRVxPvQooklMNq5/
	gp6a+5KT8+6nA3eAO94IxoIdfBjNDmx7hRidWuXK8e6RsU56nLE6eJvFJIX3B80C3QQ/BxfO9cV
	R/K5tViio4QrWGVOmIWqUJDTXRj3qZ/pXr1x1LyaeqEeCSs08nh0=
X-Received: by 2002:a05:6000:641:b0:490:b23b:802d with SMTP id ffacd0b85a97d-498308b94famr1294764f8f.37.1794269288613;
        Mon, 09 Nov 2026 16:08:08 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-30.retail.telecomitalia.it. [212.171.11.30])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-498363df7a5sm1704703f8f.37.2026.11.09.16.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 16:08:08 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v12 2/5] clk: en7523: use devm variant for clk_hw_register and fixed clock
Date: Tue, 10 Nov 2026 01:07:47 +0100
Message-ID: <20261110000753.508-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261110000753.508-1-ansuelsmth@gmail.com>
References: <20261110000753.508-1-ansuelsmth@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use devm variant for clk_hw_register and clk_hw_register_fixed_rate
to correctly unregister the clocks on probe fails.

This should never happen under normal condition but it's better to
handle these cleanup.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 24fdec2e6198..2baec734df9f 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -651,7 +651,7 @@ static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
 	if (init.ops->unprepare)
 		init.ops->unprepare(&cg->hw);
 
-	if (clk_hw_register(dev, &cg->hw))
+	if (devm_clk_hw_register(dev, &cg->hw))
 		return NULL;
 
 	return &cg->hw;
@@ -708,7 +708,7 @@ static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 		val = readl(base + reg);
 		rate /= en7523_get_div(desc, val);
 
-		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
+		hw = devm_clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
 		if (IS_ERR(hw)) {
 			pr_err("Failed to register clk %s: %ld\n",
 			       desc->name, PTR_ERR(hw));
@@ -770,7 +770,7 @@ static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 		}
 		rate /= en7523_get_div(desc, val);
 
-		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
+		hw = devm_clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
 		if (IS_ERR(hw)) {
 			pr_err("Failed to register clk %s: %ld\n",
 			       desc->name, PTR_ERR(hw));
@@ -1105,7 +1105,7 @@ static void en751221_try_register_clk(struct device *dev, int key,
 	if (WARN_ON_ONCE(key >= EN751221_MAX_CLKS))
 		return;
 
-	hw = clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
+	hw = devm_clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
 	if (IS_ERR(hw))
 		pr_err("Failed to register clk %s: %pe\n", name, hw);
 	else
-- 
2.55.0

