Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10975435507
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 09:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784799612; cv=none; b=s5lOzhnpDdBlgAQYS+EDvM/wlEfy8aCc/9j2Vp+KnKUWBHENVnJQU+zaJQI6cXqytzti/C8QxUQo3OkrfvUYRgm7E9S7DzcIcui9D+92bgwfARlk77m4JO55GQlZAvYInPVHa9MrbrfxeEYqfqiOFOXpKb0D/HeWfqMmQfWIX6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784799612; c=relaxed/simple;
	bh=BJX69CI3rhPgFIC+UOKYakZAgmiE1nvMLkgOXW1N7vs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AtTau/81ULJhA62jJoW2paOYnD76VSemlg7pFSxd6VSnxPW6b8/5eCZzpPLNLCxgBdpwEFvXeRnYj0pED6O6XkCRJx7/6YSXplGl3t+quNUdXxG2j2gZj81Px1e6kQK/PYvgPwddWevu3NlFJ3QVE1p37VHSyleGTwS1AyliHRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=lPLYaH6z; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="lPLYaH6z"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so357600f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 02:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784799608; x=1785404408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ANuM1EedXU7mO5+fHrN+6vU75uZRwSQMOxEu7bukQuY=;
        b=lPLYaH6zPzYd9vZtVEreChvHFwkppqjdm/CMRTxFxt4bZLAIj+7ZelkdyS4UUux+JA
         +0IbkPNTaWao5qNm3xXCL7A2LWV9igXzdja7B7F10fXF8oHHKGeYzqo2ilScBdkSRuDf
         b7hZztVqIdHNlHSoGoZt8fkPGq2ap5AGR0xMOkjbAwSwDwITqF/LH/jZQM2pbXUw4fQl
         z2vSB93EBpiYYg5LIzsQb3WKYP54Fbzl64RLZPH5qEWl0I4YAsogIFqscfwrLUv90xdT
         cLe5XvoqvW0R//LgJ7XJipEtkYuuqa8w2djrmLaZndVsdtL5IuLH2V8rCKIjl8Na/Mv3
         eaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784799608; x=1785404408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ANuM1EedXU7mO5+fHrN+6vU75uZRwSQMOxEu7bukQuY=;
        b=Tx/0nWvWm/vnaABTUcFDfgAFh0oHsA8jMJ8WbPPGPBwok98jRzs29Fb2abt8yhcoeR
         aLlJ2PQXhEhzg5spQO/jeU7wcGZxx+Mvoq/fNb5eNdOt01j+XwcH+hM4riEJMJ0mHIxn
         y7NDKtSpbyIw287wJodSiMwe6m8E0Z9Y8K5fPZBiBa5b3y9/6cxGUU5D+CgKqfE+X2FK
         jtRe30mIXzprQJACPVbcQl1Hx2c4SRXGAREUMN7d418NjZjLES1N/cReQNTMTq8SeW2t
         F2c/SNsY5zT07tQ2lfRZQ8ojTcm/7kjL57Q2zYXQGvup7UjxWxy6XyKz9aI7XrvneO9/
         5dog==
X-Forwarded-Encrypted: i=1; AHgh+RoB3pR12xvyHxljxOnW/dmEtSv3KC/yIBUtRgmrdSwoQImV5fe5k+OJ/BGbbQIYyhawqvpkHhOSTik=@vger.kernel.org
X-Gm-Message-State: AOJu0YyG+wL0VGcH/T+sq0Jue6P2XB1iX2+e0tH+qW8JJ8CzfJ0NY5AC
	AiIlBOMHgq4QKlThpuA7fgRLit1+H3TRqBJvSB1DT6EcdEtAikrahslMRZ7B5vR8DGU=
X-Gm-Gg: AR+sD10viGRyG52CyuraIn922li2nsAbVWqJ6W83UL9Rre67O5ahfE/2SFSM0WqpAgH
	DReMkr7J8jJRFakCP1R/pt7wRpl5SC7NTgJy/ya+X1DmKmzIzSbSQkXehIMkZKA6GVs7RzdK72R
	BXuU/MN35CfbXavvebss0f9SBjABxg4QC2YiI1np4UOyCxCzm6Q3DPVThVjBWope5wwJiesfl4S
	6YS9uoVe/lSJJUcitXjvL5shh2SbVVlVBiNADHkQ2Cez89zlqalL9eaehgLvr+p2KUjxfbAvyce
	FC/VTkdhnVosgC/sy7Vel8m8ynpz1Z6OCMi/SsK9NmYjKO4aZ3K4rN5rZeWUlslXLDYeaVRPYa2
	IY4+NdiTj4X06VL6PJAb5SCO74oYxd1wAN6BZxGdUJEWgHSblC9FvwTHlocYCoUS4Jeu01SQ7/O
	ct
X-Received: by 2002:a05:6000:1883:b0:474:5a38:f650 with SMTP id ffacd0b85a97d-47f8d710ffemr2834486f8f.3.1784799608255;
        Thu, 23 Jul 2026 02:40:08 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:3274:dbb5:2710:802b])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f85b9a6d7sm15256235f8f.2.2026.07.23.02.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:40:07 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 23 Jul 2026 11:39:52 +0200
Subject: [PATCH v7 2/4] clk: sunxi-ng: div: add read-only operation support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-a733-rtc-v7-2-8fd68aab94ae@baylibre.com>
References: <20260723-a733-rtc-v7-0-8fd68aab94ae@baylibre.com>
In-Reply-To: <20260723-a733-rtc-v7-0-8fd68aab94ae@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2289; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=BJX69CI3rhPgFIC+UOKYakZAgmiE1nvMLkgOXW1N7vs=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqYeFuAonlP7DkbS7g2+GVMpDyLmLNQ/yrcz3K4
 GDc7mIRf2aJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamHhbgAKCRDm/A8cN/La
 hXuMD/4yhmqW9LF67++G2u3n2Ore+4UjWpvySCijqdBgw7p7SquucWZp1DLDI2TxsuNXpFv4Vu0
 ZJ6wnSE7VhjkXU8frv89pskHWhdH/uQzwHyFfrUH+uS2J6S95Iha5zJ++bum+V3v4wZ6uzar1rh
 /2EhCsUEVeoG+74PZ5izkjZ4Im3XihSvPXs4zOGX8GGAEiMNRPY6pE5eOXlOG5XPfDqKZswX+GI
 wGZNcGXAzU9CY2B2/wTgy1bfmtZo9F09IeQ4YrZ+a6mTQl3Gb7qVk/JKr39p/Jyvd/tlMiZxkaJ
 2qQZLF+SSPslhfmDmoxW8DGHtln+LI94LvPzjsO2HotayRJgELlH5DBiyE3vV/ZOFPUhHMx9PpA
 MsSr+nobCw9ddH2GmjXRDtQopTN8d80N8jROx5c2p3Jivgz8Hcg6AGZ9bl59BhKnImTIhtPsYGH
 ngyF3AyOUkZlSbu9cHSaS/9+HKDCiOlhH5GOpn/T8lhyQZns6+Ukw8CDbpUPK1JPYMrxNV4/6/M
 6EWg730zZZ0S0jAvdeofo3VTd7PTXG2za6B+PVgJ3H5eOcX5OtZqIMFLlef8EEiIyFpB7LsyXUB
 8+c1NEs6MA0n+m97jU9jrmh1yzs/9QvvoBFaaAbowrv2R+zAnTD+8FUHOvFz68EDYA/A44M4wrI
 t+Eb0dJFejElW5w==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Add support for sunxi-ng read-only dividers. This will be
useful to the a733 oscillator detection logic.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu_div.c | 31 +++++++++++++++++++++++++++++--
 drivers/clk/sunxi-ng/ccu_div.h |  1 +
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_div.c
index 62d680ccb524..c385e0160f13 100644
--- a/drivers/clk/sunxi-ng/ccu_div.c
+++ b/drivers/clk/sunxi-ng/ccu_div.c
@@ -20,8 +20,22 @@ static int ccu_div_determine_rate_helper(struct ccu_mux_internal *mux,
 	if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
 		req->rate *= cd->fixed_post_div;
 
-	ret = divider_determine_rate(&cd->common.hw, req, cd->div.table,
-				     cd->div.width, cd->div.flags);
+	if (cd->div.flags & CLK_DIVIDER_READ_ONLY) {
+		unsigned long val;
+		u32 reg;
+
+		reg = readl(cd->common.base + cd->common.reg);
+		val = reg >> cd->div.shift;
+		val &= (1 << cd->div.width) - 1;
+
+		ret = divider_ro_determine_rate(&cd->common.hw, req, cd->div.table,
+						cd->div.width, cd->div.flags, val);
+
+	} else {
+		ret = divider_determine_rate(&cd->common.hw, req, cd->div.table,
+					     cd->div.width, cd->div.flags);
+	}
+
 	if (ret)
 		return ret;
 
@@ -143,3 +157,16 @@ const struct clk_ops ccu_div_ops = {
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
+	.set_parent	= ccu_div_set_parent,
+
+	.determine_rate	= ccu_div_determine_rate,
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

