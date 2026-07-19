Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A152F35C180
	for <linux-clk@vger.kernel.org>; Sun, 19 Jul 2026 15:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784475106; cv=none; b=HYJxxdGnpWTwFk/fPv87XSBNni1Q8YcrFnriTTbLP94l6xAXZRnBkucSHd7osBUmzCIokbKQf+KA1cuwTMQiwYTtX3ie2a+6Uey+OC4/QWlph0gFpHs8DYGR1WYNgugqnJG8CHMgBRxL8LNa4ILArNCM9qR3EDz2OxgtL/76EwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784475106; c=relaxed/simple;
	bh=7rKizl1VwNt3GDPCkBsLZAl45i1jv9HwynJC+jxYgbk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BIcb2zBezLw7om2iCET3bzJN8JMlFoaotijQFEWRsOcfSDxnh0T8RgbI5kw3MdJkxZmu5vE+gyS7ykI4acTSFV8fXcfcvCQAll9pTm5czn/UqS4xaLpA38wI3zbFWvx1fMwEr1o5631Ap1k9Nx3W8p3A4bwtjsVKrCW9oxYpiGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yfyh/hRx; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yfyh/hRx"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-476a130c138so5791431f8f.0
        for <linux-clk@vger.kernel.org>; Sun, 19 Jul 2026 08:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784475103; x=1785079903; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RAIvFoHSot582y5nPwOQ/4JfZFN3JPm5c7b4D+Z0OhU=;
        b=Yfyh/hRxuwhSbwta1e4GpE6+eJ3zz4BYuPUJrBVxyo0mTO4e5IJ7y1gnAkz2w9HZQm
         jMGKg2LV0CE9Z3XXvQZeXBaVZY6Alne4NidzfZTRFwX1U9cAMdoeyvgP8/N8GnopILNY
         7UK47oHIgdAbLnT7DuyrS/qPOIf5YTVMYwo6xVHrViU+cbJom/5Zl8nQDrWyKXOCd/Uh
         RdbQfrxLdAEjuLTeXzcCYYf53GfQWbY/RQFyy3DwmKepHl6MNPfK3Bdj7uNWd3iZ+PPP
         VOoRofYsRyC6JTycpX2YYGdZfOsHHBcaRuhlLoDXS4cbOnLXdsLS6azDvglv+ZbKtNjW
         QUwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784475103; x=1785079903;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RAIvFoHSot582y5nPwOQ/4JfZFN3JPm5c7b4D+Z0OhU=;
        b=L/DIO1FWfo/ycob+/CDNAK2FbeqM7xjZoj3sALIjPBPmj2JCpdRKBpjQzNjcbiHNgH
         KRu9vG1Gb20fJq0NbV2mejXTNjVdRylxDEN5Bu5Rm+CArokl3G0u01chuMDpoqDODFcI
         z2nznGvxvkwbxhusR8THxS1JmeJwNL0WANqD8iRY8i5mPvEIaWreR+lCx7V4AxuJO5ZP
         RxC6SfHi8hA6y4E3qt9latHxdLJYYCg6CwjDwbyI7jm4b2UaIJtDhrPH0gMQTjThFMWZ
         JXFogMpu72vRzWvB13qJpk34yzUatzokqGyprp4jo5n2FJEjMg72IpUXuKtFNVk40EOt
         t9OA==
X-Forwarded-Encrypted: i=1; AHgh+RptZjWLb+7Et55aF2tk2ZX/6M3hlH30OJ6lk3dfPKRUgUaGvwRwHdyshKgANhy52Mo+a3sVuB8Y6Sk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqzsYlqmT+ra+X2eUEchJTnf6SQ4AKWN2Mv96iF1B8jou+0v21
	1wX4cvB/4uZFoJWYj86PtPZ4/Q4iVHTuWnOdVFrqCsrKYi/RU9THoNv8
X-Gm-Gg: AfdE7ck7rgRMj0btTUIJATdSYg+BmGk4EJIqZLe60PAbeHeBQ+o3Sp+FU6R6wT+hL0T
	MOns02y2I2HkNJFI1F/KhBcocmjWcyZgO+YXDqCaQ34Qc1bGUkr5zCZ+egiJf/mRDG7Zs3QVBLb
	n06PuyePPpt/SSKHDhvq5dnXG/Sq2FnV0ynffq68yZT/qXdI0RgRXRvta0kVWraCwxrx7zcv5+x
	O1J5+7gV20vFl+Jv4UL14LAoTPTG0knn91jF5i2MYhPTwURqdVazkKcNGTQxADVPo/UL3qvTUy/
	FtxtO6HAc4O2IkOg7PgUdb2L3U6G6l/GL9tgSqHgzmTRXm1zrt1Oqf+kdaug+DoWkvsSqPm5RQL
	V/wuwa5zVfapW+mbC+3/eZsVxRDAc5Tjlc54H+GpP8daOowYRdwoEOvNGvK9TLVSnn4hNkKx/Oz
	u2Nvt88zbXScmrj1RpcmXIvWFKFfy1JohioX65
X-Received: by 2002:a05:6000:4b11:b0:476:7036:f854 with SMTP id ffacd0b85a97d-47f622f83ccmr11899817f8f.21.1784475102735;
        Sun, 19 Jul 2026 08:31:42 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:3344:2841:7708:a101:2b8a:f76:a00f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63edd7d3sm20420729f8f.25.2026.07.19.08.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 08:31:42 -0700 (PDT)
From: Aureal <juanmanuellopezcarrillo@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Brian Masney <bmasney@redhat.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
Subject: [PATCH] clk: sunxi-ng: div: implement set_rate_and_parent
Date: Sun, 19 Jul 2026 17:31:22 +0200
Message-ID: <20260719153122.892013-1-juanmanuellopezcarrillo@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Juan Manuel López Carrillo <juanmanuellopezcarrillo@gmail.com>

When a rate change on a ccu_div clock also switches its parent, the
clk core, in the absence of a .set_rate_and_parent op, programs the
parent first and the divider second.  If the new parent is faster than
the old one, the clock transiently runs at new_parent_rate/old_divider
between the two register writes, overshooting both the old and the
requested rate and potentially violating the consumer's maximum
allowed frequency.

This is not theoretical.  On the Allwinner A523/T527 the GPU clock is
a ccu_div muxing between pll-gpu and the fixed pll-periph0 outputs:
going from 600 MHz (pll-periph0-600M, M=1) down to 400 or 200 MHz
(both derived from pll-periph0-800M) makes the Mali G57 run at 800 MHz
for the window between the two writes, 33% above the vendor's maximum
operating point.  Observed and validated on an Orange Pi 4A (T527)
with a downstream GPU devfreq setup; mainline does not yet describe
GPU OPPs for this SoC, but any ccu_div consumer whose set_rate ends up
crossing parents is affected.

Implement .set_rate_and_parent with the same ordering rule as
clk_composite_set_rate_and_parent(): if keeping the current divider
while switching the mux would overshoot the requested rate, program
the divider first, otherwise switch the mux first.  The intermediate
rate then never exceeds both the old and the new rate.

Clocks using a prediv feature keep the historical mux-then-divider
order: the prediv helpers look the prediv up by the current parent,
which is ambiguous while both are changing.

Fixes: e9b93213103f ("clk: sunxi-ng: Add divider")
Signed-off-by: Juan Manuel López Carrillo <juanmanuellopezcarrillo@gmail.com>
---
Note: this touches the same area of ccu_div.c as patch 2/4 of the
pending series "clk: sun6i-rtc: Add support for Allwinner A733 SoC" v5
(<20260717-a733-rtc-v5-2-3874cc26abf7@baylibre.com>), which adds
ccu_rodiv_ops right after ccu_div_ops.  The conflict is trivial
(context only); happy to rebase on top of it if it lands first.

 drivers/clk/sunxi-ng/ccu_div.c | 36 ++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_div.c
index 62d680ccb..9024bcd8c 100644
--- a/drivers/clk/sunxi-ng/ccu_div.c
+++ b/drivers/clk/sunxi-ng/ccu_div.c
@@ -130,6 +130,41 @@ static int ccu_div_set_parent(struct clk_hw *hw, u8 index)
 	return ccu_mux_helper_set_parent(&cd->common, &cd->mux, index);
 }
 
+static int ccu_div_set_rate_and_parent(struct clk_hw *hw, unsigned long rate,
+				       unsigned long parent_rate, u8 index)
+{
+	struct ccu_div *cd = hw_to_ccu_div(hw);
+
+	/*
+	 * The predivider helpers look it up through the current parent,
+	 * which is ambiguous while both the parent and the divider are
+	 * changing, so keep the mux-then-divider order the core would
+	 * have used for those clocks.
+	 */
+	if (cd->common.features & (CCU_FEATURE_VARIABLE_PREDIV |
+				   CCU_FEATURE_FIXED_PREDIV |
+				   CCU_FEATURE_ALL_PREDIV)) {
+		ccu_div_set_parent(hw, index);
+		return ccu_div_set_rate(hw, rate, parent_rate);
+	}
+
+	/*
+	 * Same ordering rule as clk_composite_set_rate_and_parent(): if
+	 * switching the mux with the current divider would overshoot the
+	 * requested rate, program the divider first, so the intermediate
+	 * rate never exceeds both the old and the new rate.
+	 */
+	if (ccu_div_recalc_rate(hw, parent_rate) > rate) {
+		ccu_div_set_rate(hw, rate, parent_rate);
+		ccu_div_set_parent(hw, index);
+	} else {
+		ccu_div_set_parent(hw, index);
+		ccu_div_set_rate(hw, rate, parent_rate);
+	}
+
+	return 0;
+}
+
 const struct clk_ops ccu_div_ops = {
 	.disable	= ccu_div_disable,
 	.enable		= ccu_div_enable,
@@ -141,5 +176,6 @@ const struct clk_ops ccu_div_ops = {
 	.determine_rate	= ccu_div_determine_rate,
 	.recalc_rate	= ccu_div_recalc_rate,
 	.set_rate	= ccu_div_set_rate,
+	.set_rate_and_parent = ccu_div_set_rate_and_parent,
 };
 EXPORT_SYMBOL_NS_GPL(ccu_div_ops, "SUNXI_CCU");

base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
-- 
2.47.3

