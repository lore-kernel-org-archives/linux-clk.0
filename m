Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0624A14D6E6
	for <linux-clk@vger.kernel.org>; Thu, 16 May 2024 15:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715872136; cv=none; b=TpNl4GAYwW9GABb7BFSvcNkiMNd8IS8OdoP9nYs3stNqJDeVs3HbGVHF5r9RokHgxg5mYbs6RIdyqv1g528yin6SpdhksE/UylgJHeLOwxQyKg8TgquzOg9TMjR9UOejAkRAlQylOOziiiZoHtlNZ459EAVWvguxeS4LJVg8+AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715872136; c=relaxed/simple;
	bh=G+dvNYQOBLr+WoKmLXh98J7Aryp0MXfhIBc7+yfe0sM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xwo/b4aZc6aKAec1+JhL3vTwHSnFeHn4RrFDs8ptYQbC+QsffXBYtsT0A5JqSmjpXwLUlyKSOGzi8mpfq6PHLR2vp4sKIQu12Xe84hmQlRE8JM0V8+GgDztSewQMTCmUwnrfkAr39WuckBi2BPDFI0zhqNFttgO6QARm/++XrDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=bO9DB/Tt; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="bO9DB/Tt"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2e52181c228so8151401fa.0
        for <linux-clk@vger.kernel.org>; Thu, 16 May 2024 08:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715872132; x=1716476932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ypBfZt6woLl48yZMYWLwJnxD1n063j94AW3SXRtrghk=;
        b=bO9DB/TtArv+1pvyVORnixHhr8CWdanaBXZDbx7w5vfArNShcbpFZzeslsUPEiVHel
         Kxwxph9dVzm+GumrpWlU7IJrBV/TIHCq++s0K5JOZSD2ZrExHAYux3LYAkOE8mZsipju
         fxUEDBZizHwbyNBKY9k+uyZrHDGUJB0YU2mR9EXWd4xlKHPR0a+3ScnzVBMLymcIRRsz
         +zUbW4asZY67COG/eossn22HAnYSSdtOLBwomFy9colskEg8vJYDo/eGKJIE85ZirJfK
         2LBbOIYMIgB3ZUIZxciXWoBRimPILYrMHkCAJwmA/yXPy1jbMOpf1I4Pv1mMLvBFBlBR
         WJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715872132; x=1716476932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ypBfZt6woLl48yZMYWLwJnxD1n063j94AW3SXRtrghk=;
        b=cLTVehsnNS3JVxmITL40MS/GHcqZ1u0yfmc8/hblZzfrK1zz2tkL/DU0EMK4SkCDU3
         JRrzu54jUsSM4g6PPZAJvxtcC2PtN6Uzzoe0g/haeK2klVS7BK01ul/7K8UeO4ien0VW
         NXp1wRe2qs7xLaI+GkwJ6IBZkbxD8eaFVqDMAX09IO+gng77Y1x2gcMjugDvBIpRl9w2
         bJpwTGrjz9ssLMx7AjyGTavldIcZTGiZtXpTGkIKxkvLRvf0c65krq32ZSDaIEIkkg27
         C14HvxDbaohlNsnUL7Y1wlbgrhSuqL1RaTzCTmiY2kz1nZsMkrBE37OeoP6omYafwI8W
         Y7Ug==
X-Forwarded-Encrypted: i=1; AJvYcCWN6FbaN+4+OeaZDTWpH08ydUPVtqPofWtRzXhGVayNadi5NYSTwPw19y0+naSEKY4gbjFAk/MgpNmCvG9rq1Oq5rMx/wOXyd2N
X-Gm-Message-State: AOJu0YzWiWoT7/YcZSmt8HQfOQs6zkH/O4ZGy/XZ+yghIRwVamhejdp9
	yQs8jmM8ISCfjTarfw24PkjhvulAm/aZlhpI31xThSvbZV/TGlMnMh2PZgF0Luc=
X-Google-Smtp-Source: AGHT+IE8U/D0l2CYHxsSjMxEnW9Nswfn86/rBWx05jmcgu+/3vQwWvbBIKiUixNYwUsYF7gN5EXKtA==
X-Received: by 2002:a2e:81c3:0:b0:2df:907e:6de3 with SMTP id 38308e7fff4ca-2e52038a44bmr116578741fa.35.1715872130810;
        Thu, 16 May 2024 08:08:50 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1fce:7e5a:e201:edd5])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-41f87c25459sm309351725e9.18.2024.05.16.08.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 08:08:50 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [RFC PATCH 4/9] reset: amlogic: use reset number instead of register count
Date: Thu, 16 May 2024 17:08:34 +0200
Message-ID: <20240516150842.705844-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240516150842.705844-1-jbrunet@baylibre.com>
References: <20240516150842.705844-1-jbrunet@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit

The reset driver from audio clock controller may register less
reset than a register can hold. To avoid making any change while
switching to auxiliary support, use the number of reset instead of the
register count to define the bounds of the reset controller.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-meson.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index fec55321b52b..3e0447366ba6 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -17,7 +17,7 @@
 #include <linux/types.h>
 
 struct meson_reset_param {
-	int reg_count;
+	unsigned int reset_num;
 	int reset_offset;
 	int level_offset;
 	bool level_low_reset;
@@ -90,7 +90,6 @@ static const struct reset_control_ops meson_reset_ops = {
 static int meson_reset_probe(struct device *dev, struct regmap *map,
 			     const struct meson_reset_param *param)
 {
-	unsigned int stride = regmap_get_reg_stride(map);
 	struct meson_reset *data;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
@@ -100,8 +99,7 @@ static int meson_reset_probe(struct device *dev, struct regmap *map,
 	data->param = param;
 	data->map = map;
 	data->rcdev.owner = dev->driver->owner;
-	data->rcdev.nr_resets = param->reg_count * BITS_PER_BYTE
-		* stride;
+	data->rcdev.nr_resets = param->reset_num;
 	data->rcdev.ops = &meson_reset_ops;
 	data->rcdev.of_node = dev->of_node;
 
@@ -109,21 +107,21 @@ static int meson_reset_probe(struct device *dev, struct regmap *map,
 }
 
 static const struct meson_reset_param meson8b_param = {
-	.reg_count	= 8,
+	.reset_num	= 256,
 	.reset_offset	= 0x0,
 	.level_offset	= 0x7c,
 	.level_low_reset = true,
 };
 
 static const struct meson_reset_param meson_a1_param = {
-	.reg_count	= 3,
+	.reset_num	= 96,
 	.reset_offset	= 0x0,
 	.level_offset	= 0x40,
 	.level_low_reset = true,
 };
 
 static const struct meson_reset_param meson_s4_param = {
-	.reg_count	= 6,
+	.reset_num	= 192,
 	.reset_offset	= 0x0,
 	.level_offset	= 0x40,
 	.level_low_reset = true,
-- 
2.43.0

