Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5141545979
	for <linux-clk@vger.kernel.org>; Wed, 25 Sep 2024 15:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727279399; cv=none; b=tyPQA9IA9yi36RUByjN+hbTc91JGhFETisLPmbq3ag7mYvksiiuRIFs7eyYoBRdHnpbSn43IVcloPxrZl7PlGfLbYZ+FWN111/zC9ISBhc0iA2NnZ9tbdnQToQPAEEqO8cMMnIVlaUVdxwijplRCWo4OynNqYI7ItnQNPV5GFjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727279399; c=relaxed/simple;
	bh=9TsPcuUYM+Ss6zqclxdoIjmneAaFI96S82iLraC7iZc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lNKds+hRa33gmD6FPIHDbPoE71fM8wTRfrcNe91PJbfTyjiihavR12aqtJYs+JVHEULwcNdHEWTX8LZZIFwm/qXUf+sN4BYST1oT+z8/QWn7wU2cDcoe0GHhtM71QPW7aAns+2vB3PlFr1GcvaZfPElj6n3n+O8+08y4K3SOgBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=NoB6Bnv6; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="NoB6Bnv6"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-374c326c638so3869118f8f.2
        for <linux-clk@vger.kernel.org>; Wed, 25 Sep 2024 08:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727279395; x=1727884195; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=37Uo+LYHc9uDv5WXDoS/QUjwvEuwcoXI9DaReh1Q9jo=;
        b=NoB6Bnv6+8gZvkasvz6ezjeJ6jf72qUM4SFrcvGso0e+M56jGWIzPTPuvVtt92cMVs
         3zqotfMgaLviO/A/oS89Gb47QPDQEUjdhY3OTKyIInv4+l0L7eSTtlE/GACsxTARl4Qi
         aEbuRm4fyhKnbTdmeRRZZXhCoVY7y3VlUSBTs42ts0IL8AS8HbxWKsnb/gcNNpD+1IRx
         Bd7YWUgtEzemkFdumDCserQSnIoosACWtzlpUqHwv8cJioND3617C08W76KZ1pnT/94s
         kX9q8dhO2ytxsy+08nQG+i5taIbpr5cRRVeg3PcDPhvHwQET4NGjJl3Uy6wcYGbJqLdY
         5KLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727279395; x=1727884195;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=37Uo+LYHc9uDv5WXDoS/QUjwvEuwcoXI9DaReh1Q9jo=;
        b=TpkPkk5ajEWTSoyiFfj293KPVydn6tzW9e/MKIJA0PZV6Q3i71YynKReXPuQO6qfHo
         fdBgeTzNMRcTw0A/9EYiIFu+OH7BXCvalyTb1ov1RyEMjXwOhurwrZji448UXzlb52b5
         CSrDFJTCSAop6BwngHERCv3Jp9c6hLJrXha0Xegs5cOdkNczIQyP0Yyw423Zt7w0Es8c
         M1OgtPXTsEvSBPbg0Xi2sxMLfw3j4PMXgTC95TK5r+agBIEQWb9XsB5wQqANA8B3kvuA
         bqZ+Lf0j1tqanokIWZtigedgvl/ZR8GY6loFkShmyGzh5A97h7v/PtJXdTphYEEO7fY1
         PI0g==
X-Forwarded-Encrypted: i=1; AJvYcCViZHLke0v5VhBqKrSjwAR4i89bxhxa/p1d86lLdwe2wMSMfZbtYKE8ZnRsr+DnhRyMcRKC/BBhEkg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd95lrhumFHfViU94EfzQco2zPnB7oyCNFpg04v5Kh84DhuX7o
	rHJ8P+j4i26Wb9SHd6Pg2f1IKyKhHgr93rADT8cNwWz9O+7GOMGlVc3W7yshyl4=
X-Google-Smtp-Source: AGHT+IEAS0LwFCOdWh/KDz7RDglph2fRnUmoWH+9kNxDyY1e/NNyCJMDVGvV3rFMYpCS8UvnTzLt5Q==
X-Received: by 2002:adf:f010:0:b0:366:f8e7:d898 with SMTP id ffacd0b85a97d-37cc24cb3d4mr1738982f8f.50.1727279395568;
        Wed, 25 Sep 2024 08:49:55 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:857b:1996:7ede:6ce4])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-37cc85a520esm1475699f8f.61.2024.09.25.08.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 08:49:55 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 25 Sep 2024 17:49:48 +0200
Subject: [PATCH] clk: meson: meson8b: remove spinlock
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240925-clk-meson8b-spinlock-v1-1-50b7f2d02d7d@baylibre.com>
X-B4-Tracking: v=1; b=H4sIABsx9GYC/x3MSwqFMAxA0a1Ixi+gwf9WxIGtqQa1lQZEEPdue
 cMzuPcB5Sis0GcPRL5EJfiE4peBXSe/MMqcDJRTmXdUod03PFiDbw3qKX4PdsPJuNI6Q9R0NaT
 0jOzk/m+H8X0/Z/yGhmYAAAA=
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1318; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=9TsPcuUYM+Ss6zqclxdoIjmneAaFI96S82iLraC7iZc=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm9DEhF0lAj/EqoEAesyRPssexBVC1QtaRwk44F
 aNx1o9GuN2JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZvQxIQAKCRDm/A8cN/La
 hZ5wD/9tJin5d1OCx/JB3/3AG+c8jcCTXnA8GtC+HZV3qQkwmHVe2OuLxH5qD7Ex6p2LQYRjevQ
 ejXwTMK13w2M8pwtuEZNyMgVC5vL9/XC/aNEbuDPVPF4UKCFOieBuL9TVY8ak8cFkjh6tDsvIgJ
 2ozud1HL0QLPPsZ2gSjOdxgPq56dVcVux/EF9TtkeUBF1Njr5IKU/PCWRK3/j7AqhYw4SutZhT3
 XQ3Of3SYPUPnyKdate0pj+y8u8tZJFivol4PzcPab1B9rOO3e7J82WXM4+qO1VBN16rG1FkYdj5
 JkP6cCXz+wxYVSuLAVXDds0H++4kPagnH2eyvU5LimtUf3lXSebQ1JggTuXF2WTTYwnISPt4GYg
 hPp1Qv0jxm6gFfOi4qwZ3qIHciYSR+tUyP/IxEBDsqcuAi3TXx/rn7K9seA/aSCXQ5z9CSCo8Jm
 yUN9G0AJ0kPE4EuvRzxfKWbx/7+nq9v9LM8C8nun8g+LdgFZgsA572bskptKEVpX7BakBoP//bG
 4TfQT1dGoloaX6FGFVTO6ITuvPa7J51E348wtIKLuzum4L9qscHAeqtNV5PiGVHpgUCZi8GYDU/
 QlUwAT47KIXu23155c042aCPWoAQ+6qZ0Bri2IgaU6y7fnOP2p3TLA5bJr86NGMBQyX7yoWczWl
 MV2jovBeM/j28Gg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The spinlock in meson8b clock controller is now only protecting a call to
regmap_update_bits().

The regmap API already has its own locking system so this spinlock
is redundant. Remove it.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/meson8b.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 5011768c0f4e..96358bc054b5 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -25,8 +25,6 @@
 #include <dt-bindings/clock/meson8b-clkc.h>
 #include <dt-bindings/reset/amlogic,meson8b-clkc-reset.h>
 
-static DEFINE_SPINLOCK(meson_clk_lock);
-
 struct meson8b_clk_reset {
 	struct reset_controller_dev reset;
 	struct regmap *regmap;
@@ -3709,13 +3707,9 @@ static int meson8b_clk_reset_update(struct reset_controller_dev *rcdev,
 	if (assert != reset->active_low)
 		value = BIT(reset->bit_idx);
 
-	spin_lock_irqsave(&meson_clk_lock, flags);
-
 	regmap_update_bits(meson8b_clk_reset->regmap, reset->reg,
 			   BIT(reset->bit_idx), value);
 
-	spin_unlock_irqrestore(&meson_clk_lock, flags);
-
 	return 0;
 }
 

---
base-commit: b7fadc62b8d700e14787d26345379e95c86e1684
change-id: 20240925-clk-meson8b-spinlock-abf4cfb22796

Best regards,
-- 
Jerome

