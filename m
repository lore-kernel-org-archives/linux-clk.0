Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953838;
	b=ED2OpMtkACrnz//o/Fyh532nqmfHpI5/ArA6hsNMF+Ojoz8vC7KeCIq2fgAreWvMVfVm
	 atp7ojciB3rFD3YHtmh11dBTG62cIMGBtyCcOyutvUeOYfaGvoijhjuImQKSg8tEbKJsr
	 +0ctJR9wn3jgEZwtAEfpLayLVO5NAYmHqJ9TC2yQz+hMxqFgWRbSE+2JOCn1jRxUNte8l
	 70/0rmx1Q/i3t4y996x2iIZPFaEbjQ6iSQUBD08yFNssEfp9pBAX9gov8wNUEQWVGorak
	 sjwHyv3JmFcUYUJRNDnUlrvbZ0DOQqJBYybnII/dLFaL6hjlHFIiLbw+cHo6AgBPtfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953838;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=z5PBEnq7VF6lYD89KsFrntzTjwO4LYAxU3lHBv/vL7c=;
	b=OB0n14tV9VmNAfNksSo4taxiK7fI4V4YDds2+h01BB5ck93r9jzKWunEg8f5vyQ0HYuC
	 yljO9gWUqbdxX6KTyyRTYvUA+TlWtCTEmTRbFb1csEJyWUWCcewyX7DEc+Av/me6Drn6g
	 u2oaLBeNmnUbup4Dg8wZDf+teUFO/NG3DNAMObApnjvDRffVBW5WKZX8IlwnQHOsau4NQ
	 ZKhl5nZP2ttdPD4GVW7EtACZlWOqKvIDQSwBQ2y4A7QoVuHC1OZT8zOZvVku5zyDwvlNY
	 IKus/sxGaCM82wdVxG2sqYlmpVQlvdOyJ8Gp9PshXBEIt+EjKdb56OPNMqsfOBS4BZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=N6MSp7+V;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824CF606D81A
	for <linux-clk@vger.kernel.org>; Fri,  6 Nov 2026 08:30:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 824CF606D81A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=N6MSp7+V
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-491846221ffso294329f8f.3
        for <linux-clk@vger.kernel.org>; Fri, 06 Nov 2026 00:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793953836; x=1794558636; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z5PBEnq7VF6lYD89KsFrntzTjwO4LYAxU3lHBv/vL7c=;
        b=N6MSp7+V8HPEY6Bt8+49slpA+THfhpi4GFCegpfPQB1BwD6XA+2XV6jk7jfCQT6GE+
         XWkjn27k5eNayKlwF5LkRZQoyrT7VkNE9uF3NGP9eLJWffeUlKyYsI7ghz4U/ziWHPR/
         Raq8TnQXGg7gFPb1seUKNycA6taol9D0mZeyH0lJSef//OG66qDH1ffptAis12J2ao9g
         s8K24obObXIjdgCrAIf/OFlb+KcFQsAbPl5vqVineDW9wGoDZoacfUabloLJnS8HKPYk
         VgTsLPCbWiYUDXwaI3DDmTY4nnKwYs59VcAcj8AI+46bxla4+nHLy5KUvEhedVS6nw6L
         x3uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953836; x=1794558636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z5PBEnq7VF6lYD89KsFrntzTjwO4LYAxU3lHBv/vL7c=;
        b=Ece2eEgHAgbwFVB89ul7v/u0mHYbW4VI/L8O9GYgaiUc3ZqcFLsH7Fl4qjCQIUcFea
         cGUdYYb9hPinfJ6NAStrfDcqEtcTFbIiMWBiLOeEu9Vj5nkJgK/bQT3ZdDqEi1bXCVvz
         /Q8X1JT1S6ELkZiDx0exA/rmCcR9qt9jwjleDiCsZOigHo+dCGEF2dzD59qpbl2sFNHs
         Ra0r9g85JDJiMJVqL5ca4k+HHVJv06dEyXM1d3fZ8BMPqthummU35T+IwVYWuBC+xu+w
         AfPhDKkjlQKdeOt0QeU7GDwNbLjTdrmRyJ/ZB06J/DAgrpqULsjov3p0RKS49BI6Vwsr
         MuPQ==
X-Forwarded-Encrypted: i=1; AL+hErFIXI+3g8iDfKTMULUn/u+8BIxDI4S3eT7Qb5ZnnkDGMLYSr1w2GZtsIeI6+1nbToeWpuOSs/y2w4w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vZ9xdBvUjW6RjhpkW18EfCpdxLyYpVPUJBxajWgrz6oTW1qhD
	zwUB78nr/yh1SQcZ+EP6UExLy1DObxwtwQMVVTcliniwzgibw1xtI7QJdF3bmn23KVk=
X-Gm-Gg: AYBFou0XI+xNPdxkefHm06Hk2QIuRahaESooVzWN2ue8P7HH9nNC2/kTbPk1ffj21SW
	8VaMlJmuEHQ7+13IdkLgUtUovdgxA61ZTvVr5g/1MRMEcrYrcAguf0adGqH5QgNQ7zNmhtRfDrS
	hRXYzcQLBo3vBUbiDvGthawatIsNrgng4Oz4kD/8gHJh16uMjxI+f93R12dUJqPCCNwRk2dP2bY
	fNtY+gO+F+CtnSd3DfrvffWxy7XPx0XJR7+7FVZCDYvfS2FRRGfYAD1zzhFcXTTU6oarMvPaAcA
	NR0Lwm3sQ5KoFJS0VdpCiwzjyloKkScbZVumalkBe5AakimKIqWLO48KnZDWeovagRY7czseq1K
	9V0aH2nu8ztHkAwGN1hZJQOz3gJHfGVbs5+pX/n7s9Yqi0N9a6KvDbvKWYG1SqHUagVH1n8ZD7s
	mNlmXwQOnejqlo+NCj0hnl07RV61rlq+1mPAJmRDKjXJlJXbMkvNycTYaopc2HzJnfwZTB4vrv3
	uemu1BWKZMLKcAtFG+Xn2KEdaCWdMQiPYXxjtTL4sP9i/VunUaBaVJu96/qwAlNpG6t61znlz+T
	y4SVYcAEi2Pnt9Va8kIhsX8OXTEA6Ov7YqmwYZMkU1mxVKtOt1He7FHKcj+PvF58vvdBzg2YoZS
	N5ti0XQ5yIGZdmS+ZWVb29GZKpu/uYV21FWtSt1T90Id0+w==
X-Received: by 2002:a05:6000:1882:b0:487:27f9:834 with SMTP id ffacd0b85a97d-492778d1739mr3822099f8f.41.1793953835726;
        Fri, 06 Nov 2026 00:30:35 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d8472969sm2366839f8f.58.2026.11.06.00.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:30:35 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Fri, 06 Nov 2026 09:30:26 +0100
Subject: [PATCH 3/7] clk: meson: pll: Support active-low resets
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
Message-Id: <20261106-upstream-s7-clk-v1-3-7d501d62621f@baylibre.com>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
In-Reply-To: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0

The common PLL code assumes that the reset of a PLL is active high. The
S7 HDMI PLL has an active-low reset, and its lock flag only rises
reliably when the PLL goes through it.

Add a flag for PLLs with an active-low reset so this PLL can use the
common implementation.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/clk-pll.c | 43 +++++++++++++++++++++++++++++++------------
 drivers/clk/meson/clk-pll.h |  1 +
 2 files changed, 32 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 44b33051405f..4ac5e45c1e9b 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -293,13 +293,37 @@ static int meson_clk_pll_wait_lock(struct clk_hw *hw)
 	return -ETIMEDOUT;
 }
 
+static bool meson_clk_pll_in_reset(struct clk_regmap *clk,
+				   struct meson_clk_pll_data *pll)
+{
+	unsigned int rst;
+
+	if (!MESON_PARM_APPLICABLE(&pll->rst))
+		return false;
+
+	rst = meson_parm_read(clk->map, &pll->rst);
+
+	return pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW ? !rst : rst;
+}
+
+static void meson_clk_pll_reset(struct clk_regmap *clk,
+				struct meson_clk_pll_data *pll, bool reset)
+{
+	if (!MESON_PARM_APPLICABLE(&pll->rst))
+		return;
+
+	if (pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW)
+		reset = !reset;
+
+	meson_parm_write(clk->map, &pll->rst, reset);
+}
+
 static int meson_clk_pll_is_enabled(struct clk_hw *hw)
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
 
-	if (MESON_PARM_APPLICABLE(&pll->rst) &&
-	    meson_parm_read(clk->map, &pll->rst))
+	if (meson_clk_pll_in_reset(clk, pll))
 		return 0;
 
 	if (!meson_parm_read(clk->map, &pll->en) ||
@@ -328,14 +352,12 @@ static int meson_clk_pll_init(struct clk_hw *hw)
 		return 0;
 
 	if (pll->init_count) {
-		if (MESON_PARM_APPLICABLE(&pll->rst))
-			meson_parm_write(clk->map, &pll->rst, 1);
+		meson_clk_pll_reset(clk, pll, true);
 
 		regmap_multi_reg_write(clk->map, pll->init_regs,
 				       pll->init_count);
 
-		if (MESON_PARM_APPLICABLE(&pll->rst))
-			meson_parm_write(clk->map, &pll->rst, 0);
+		meson_clk_pll_reset(clk, pll, false);
 	}
 
 	return 0;
@@ -365,15 +387,13 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
 		return 0;
 
 	/* Make sure the pll is in reset */
-	if (MESON_PARM_APPLICABLE(&pll->rst))
-		meson_parm_write(clk->map, &pll->rst, 1);
+	meson_clk_pll_reset(clk, pll, true);
 
 	/* Enable the pll */
 	meson_parm_write(clk->map, &pll->en, 1);
 
 	/* Take the pll out reset */
-	if (MESON_PARM_APPLICABLE(&pll->rst))
-		meson_parm_write(clk->map, &pll->rst, 0);
+	meson_clk_pll_reset(clk, pll, false);
 
 	/*
 	 * Compared with the previous SoCs, self-adaption current module
@@ -406,8 +426,7 @@ static void meson_clk_pll_disable(struct clk_hw *hw)
 	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
 
 	/* Put the pll is in reset */
-	if (MESON_PARM_APPLICABLE(&pll->rst))
-		meson_parm_write(clk->map, &pll->rst, 1);
+	meson_clk_pll_reset(clk, pll, true);
 
 	/* Disable the pll */
 	meson_parm_write(clk->map, &pll->en, 0);
diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
index 949157fb7bf5..8384b75ae38d 100644
--- a/drivers/clk/meson/clk-pll.h
+++ b/drivers/clk/meson/clk-pll.h
@@ -29,6 +29,7 @@ struct pll_mult_range {
 
 #define CLK_MESON_PLL_ROUND_CLOSEST	BIT(0)
 #define CLK_MESON_PLL_NOINIT_ENABLED	BIT(1)
+#define CLK_MESON_PLL_RST_ACTIVE_LOW	BIT(2)
 
 struct meson_clk_pll_data {
 	struct parm en;

-- 
2.56.0

