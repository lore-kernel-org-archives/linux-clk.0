Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE487175A7F
	for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2026 04:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781758237; cv=none; b=GAKV5nFTBNBPsa04km9Dkb1UZEO/4a1Q5czueicx9v6Cb5931gPRJM52opufmlzv7eAiTNbJGPXN1T5JygK3F/AGBHsgNXUuZ8pG3FhkiTCzkgEvkp+GAfwqV5SHnuEWgqFZcJq2cpPvyD6Ap7Hux7wna47NEOMJsQqBxsXUVbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781758237; c=relaxed/simple;
	bh=Tq5HpbMHkfaX/kguaxKLT+S3TKi6LgFcPVxSs3/BNMY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mCc5M4H2syA1FVEsueLuCa/o8q9flHc9rEmIYzMWGz8z+7dS1PJqolwtd8Pj4EWU2MZjHzkh+f05LP5fhlWTIW7tgx8C2JPcOxl0ljjFQaIISnm1bUKWiykx4xpYHOjaC+hK/oRV11NMnAi3KDfSM29xVCsmG0zOIQW0g+XsMdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LcqswcWu; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LcqswcWu"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4905529b933so3704935e9.0
        for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 21:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781758234; x=1782363034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VacQXbVEU94Chhv1WpbEGfuNK3V3Bl3pAscUT4//yRE=;
        b=LcqswcWuj2UnqzVezEH77te46HLv/w3cOlhB1JtzB/Yv/H+ISPwBSXexAXTCbCRhDd
         TVSVbnff4IN3L0hZzedpHIaYVhKPrpO82FVekuX1V0En8AHUDBrOCtsxSGN7mR5eu0g4
         CrV+/Hw8L1WJCGjYhWzdh0Y1zc/OHzgMRg9WfRPEf4EgDx9TEOpv7BHoS53hopYV4PPr
         /4e0Cxk3Gbl2+pcOQoGsjQ7gJhcVHjSFezPQcG5WZOoLJljoXuF83/++VSGHkGwd7q6u
         9nD+Qpd0y476TJ5m5zdYzD6dlNz0k5u1+Cqqv9Xs58kXToEZySC2RX8oeqEUd1Gb3htq
         uz0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781758234; x=1782363034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VacQXbVEU94Chhv1WpbEGfuNK3V3Bl3pAscUT4//yRE=;
        b=fUDZlLR8wvlc9RUiU7IAE9pakKgdWIBAK/piyf1p9XkxSPfA+oOqHxoFcxU6L02prK
         nlP30F8bQw+CP6l5t23hBKjqv3XXCUbCJlxqFVePFlYss+PTkloq1lqLSdRiLvGSsKWJ
         IpFADOcoAVW2FJfCYWnf1K79PAgfH3B0uQ+ffoZL721lEvv//Xiq0nMlONNMEdmeGaYs
         /rbNWy4QsdKWpgYSHIajawzBNCbUKlsvoUxL15hPU1oY/8ZHdRUJl0ltT+4qe0WNxkbo
         qt5Qfp9i8+QSPI0EIJOD9gxilcByM6qvrfUSycehdkuHNVqBlbAYJb3DtAcq91i3ZSc3
         I74w==
X-Forwarded-Encrypted: i=1; AFNElJ8IVYsmytmkYEaLdbLlowR1QyEFw6Rxtsmnz0jyhza63agbicChQk5++YHPSSXTiJB/b0ZpvW+Eseg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyN5tXShVlFRN/A9tZ7T6/LJpibtXwoUISvd5ur1tWoFi79P1HU
	ZNx4FOUijSN6+4JJfyIzKPwUHMUC2TfW6+vnh38Nc5e71c7EOBiPUMxg
X-Gm-Gg: Acq92OHF1p6g9UnXwHCgop0JBB/OST8Q0lUqGZLlofUdnQTGOpPHLnpupQQOvedm/Jz
	NHlAklaH4YD6tp24mKVgzCg0sfAK2cbMIWmsKm+DDq+22a8jdWUduuivRrM0sXPK1Q89SgWFVhe
	omVvDslBGbiSaV5nJOsKeVNc3jBQDjLOZ0SdMg4u7nDdAiGDpozi2SDgtA1VhUyFWil2GboQh5O
	pvZ8j2aW1UjkZzj3NWALrFibQG3/UpoVdmN80/LM3dR2r6YxsNJ/emi5DXC7MXFbvVaui/8cFqt
	P8kWKJgAqJFkjWKFTQpFuBK6Dl0o0mHZc9tdwO3gQLeoXUaTQ0RjgKzhwLioMqJODqmqBtiqWuN
	bSjLRrAI12XtGcugJs4+GAZVjViJ2k4/cySI5FrfrZhOlgtjrpw+stD9TlSziHBo4l5Z1PHrZMf
	9Ip1BHW4Ibbw1ZA3eNmTO13VSWVbWkfowCtNgb1n2/nChE39b3ZBNN4ZqiwNlLKdaREHpjPIhP
X-Received: by 2002:a05:600c:608a:b0:490:b65f:8b1 with SMTP id 5b1f17b1804b1-492333ba1d1mr131957285e9.5.1781758233797;
        Wed, 17 Jun 2026 21:50:33 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26392esm59281440f8f.3.2026.06.17.21.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 21:50:33 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
	Xukai Wang <kingxukai@zohomail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Troy Mitchell <TroyMitchell988@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH] clk: canaan: Clear rate fields before reprogramming dividers
Date: Thu, 18 Jun 2026 05:50:30 +0100
Message-ID: <20260618045030.12581-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rate set_rate helpers perform a read-modify-write on the divider
and multiplier registers but only ever OR the new value in, without
first masking off the existing field. The first write after reset lands
on a zeroed field and looks correct, but any later reprogramming leaves
the old bits set: the field becomes the bitwise OR of the previous and
new encodings, corrupting the divider or multiplier.

Mask off each field before writing the new value so reprogramming a
clock to a different rate produces the intended register contents.

Fixes: a7b7c7c6c016 ("clk: canaan: Add clock driver for Canaan K230")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/clk/clk-k230.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/clk-k230.c b/drivers/clk/clk-k230.c
index cfc437038e4e..f34a3e6d3bca 100644
--- a/drivers/clk/clk-k230.c
+++ b/drivers/clk/clk-k230.c
@@ -2227,6 +2227,7 @@ static int k230_clk_set_rate_mul(struct clk_hw *hw, unsigned long rate,
 	guard(spinlock)(rate_self->lock);
 
 	mul_reg = readl(rate_self->reg + clk->mul_reg_off);
+	mul_reg &= ~(rate_self->mul_mask << rate_self->mul_shift);
 	mul_reg |= ((mul - 1) & rate_self->mul_mask) << (rate_self->mul_shift);
 	mul_reg |= BIT(rate_self->write_enable_bit);
 	writel(mul_reg, rate_self->reg + clk->mul_reg_off);
@@ -2257,6 +2258,7 @@ static int k230_clk_set_rate_div(struct clk_hw *hw, unsigned long rate,
 	guard(spinlock)(rate_self->lock);
 
 	div_reg = readl(rate_self->reg + clk->div_reg_off);
+	div_reg &= ~(rate_self->div_mask << rate_self->div_shift);
 	div_reg |= ((div - 1) & rate_self->div_mask) << (rate_self->div_shift);
 	div_reg |= BIT(rate_self->write_enable_bit);
 	writel(div_reg, rate_self->reg + clk->div_reg_off);
@@ -2287,11 +2289,13 @@ static int k230_clk_set_rate_mul_div(struct clk_hw *hw, unsigned long rate,
 	guard(spinlock)(rate_self->lock);
 
 	div_reg = readl(rate_self->reg + clk->div_reg_off);
+	div_reg &= ~(rate_self->div_mask << rate_self->div_shift);
 	div_reg |= ((div - 1) & rate_self->div_mask) << (rate_self->div_shift);
 	div_reg |= BIT(rate_self->write_enable_bit);
 	writel(div_reg, rate_self->reg + clk->div_reg_off);
 
 	mul_reg = readl(rate_self->reg + clk->mul_reg_off);
+	mul_reg &= ~(rate_self->mul_mask << rate_self->mul_shift);
 	mul_reg |= ((mul - 1) & rate_self->mul_mask) << (rate_self->mul_shift);
 	mul_reg |= BIT(rate_self->write_enable_bit);
 	writel(mul_reg, rate_self->reg + clk->mul_reg_off);
-- 
2.53.0

