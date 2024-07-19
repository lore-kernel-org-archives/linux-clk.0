Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DD412A177
	for <linux-clk@vger.kernel.org>; Fri, 19 Jul 2024 09:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721381991; cv=none; b=KUujrCrkhPHEPitnyE8YY+FRfMWSTavZl1XgrSSuhpbuWk+hiVRjBboB/EVYwgWH3je7H/TaMYomZ3ZwBDj2j647cqMpqqSHadA7Fu/YvTkxLf2/apvzcpmZLO+oCWCAHrC1VLxQn5Ew0XZkVM0dv94reb2vdqG5DoMf1P6R3+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721381991; c=relaxed/simple;
	bh=14KsoOKsE/lQj1HeIEntUuL6mxkwimaE3iXYynYqn68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rIrrXcRfNOvHdgmc6Y8p4fa0R3ON+Wu+jU8pjYlqGDLi5AsgaUFJPP8uTwWF+ftfH20nYxrquQAcpUEmo/KRGxellFRDRMJ0qUnWEKNK0iNncsYj8Apme58W39TfORXhG7tOt0SDmUu5Z29TAhW5xoRauBqwWkSHhfA8p+Zq+Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=MTwxffdP; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="MTwxffdP"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3683f56b9bdso543373f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 19 Jul 2024 02:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721381987; x=1721986787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Jh83wOtVueGX1PE60SDgHxPA51mTtiJu8dK1JiG1H8=;
        b=MTwxffdP8QaqqyFhHl6we88e7s8FiKSQLy2WW1uNvr5uxDvLA+SK5Rc4fu13kksMem
         watmq4ps1D5Wiq2w/9X1xwwqj9vj74JI5Vt6mlwucS87Zr8v3VbwGA8dYT5/o8NvLQD6
         howr6HEOauyCeudKZOvS/AGJUqqAsaD1lqxvlry/1bi7eQSxQZWoHdP9c9JbJY6rB25R
         tUhjWvqzARDVN5R1wgFPL3ZbUHOz587bjzHNqs5hdQ8Zh2XZ/R+LlVpjxxRv5EhD26AZ
         qcW+HZdyMb3S0LteMQGXkAR6ncv+W8WLFzghGoWejSe1AHhpDN4goBvZjc0gCQ8DqGgX
         skYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721381987; x=1721986787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Jh83wOtVueGX1PE60SDgHxPA51mTtiJu8dK1JiG1H8=;
        b=NYQIfHCyjEfqEa7qbicrP7jmLLsj6deuVaUYplfJmZIyY5OanqU7q3EwmA2m9bGJ5X
         BQJKVcB+j9wxgzHAmaeg2+q9USLy+4r6wpBI47gL5TCzsP8yejDnEh9YYG+O4LSRwyzf
         i0tQoKOe+3CUe7B4amIQsbn88Nwy851nugETDZadGwpqC0sJarqU5PnSU9S/VAFUs4l4
         kkDFzdSDSzuB+Ykc+bVGXsyJuxjap/v5l0hHrBdAHDzS4OJ6467jpmw9h69Q9uwx5r4Z
         WAoenOqtA/wDQp1h1pANr2tL9kqS0vlNhowJks6054T67OVUPSIz6rT7hIgZT/PE6Tcn
         JckQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXfqT52il6O4x71CKBddlz8nMP1ed5Jhy9W8bxVSRyq7hC/5G6hnCBanGcX7Ya66wwr8Mip5M8Vq99SqwybDJvnkdbp80u0fHs
X-Gm-Message-State: AOJu0YwFNnjZdqw9FmHlIDxkpqhfpEsuCWFk+HdJxneoftutrMhGZPCE
	U4Iwaneh6oyhL0Y2E1dKiNVakkxUki4qKmm1XXts+dwM2hnnnYL8815yAozx7HA=
X-Google-Smtp-Source: AGHT+IGoIHykh7qghcwtZ6qPH84GebsqiBiwyg8/MutBl/iiTMSTkOqe8DvSeJARQHPKgBnAI06U+w==
X-Received: by 2002:a5d:6485:0:b0:368:31c7:19dd with SMTP id ffacd0b85a97d-36831c72ab3mr5458249f8f.5.1721381987400;
        Fri, 19 Jul 2024 02:39:47 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:5ac4:5655:4dfe:ce97])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3687868bc91sm1100956f8f.45.2024.07.19.02.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 02:39:47 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 2/3] clk: meson: axg-audio: setup regmap max_register based on the SoC
Date: Fri, 19 Jul 2024 11:39:31 +0200
Message-ID: <20240719093934.3985139-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240719093934.3985139-1-jbrunet@baylibre.com>
References: <20240719093934.3985139-1-jbrunet@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit

The register region of axg-audio tends to grow with the addition of
new supported SoC. Mapping slightly more has not been causing problem
so far but it is not viable to continue like this long term.

Setup the max register based on what is necessary on the related SoC.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/axg-audio.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
index e03a5bf899c0..2426f3dbb7a2 100644
--- a/drivers/clk/meson/axg-audio.c
+++ b/drivers/clk/meson/axg-audio.c
@@ -1726,11 +1726,10 @@ static const struct reset_control_ops axg_audio_rstc_ops = {
 	.status = axg_audio_reset_status,
 };
 
-static const struct regmap_config axg_audio_regmap_cfg = {
+static struct regmap_config axg_audio_regmap_cfg = {
 	.reg_bits	= 32,
 	.val_bits	= 32,
 	.reg_stride	= 4,
-	.max_register	= AUDIO_CLK_SPDIFOUT_B_CTRL,
 };
 
 struct audioclk_data {
@@ -1739,6 +1738,7 @@ struct audioclk_data {
 	struct meson_clk_hw_data hw_clks;
 	unsigned int reset_offset;
 	unsigned int reset_num;
+	unsigned int max_register;
 };
 
 static int axg_audio_clkc_probe(struct platform_device *pdev)
@@ -1760,6 +1760,7 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
 
+	axg_audio_regmap_cfg.max_register = data->max_register;
 	map = devm_regmap_init_mmio(dev, regs, &axg_audio_regmap_cfg);
 	if (IS_ERR(map)) {
 		dev_err(dev, "failed to init regmap: %ld\n", PTR_ERR(map));
@@ -1828,6 +1829,7 @@ static const struct audioclk_data axg_audioclk_data = {
 		.hws = axg_audio_hw_clks,
 		.num = ARRAY_SIZE(axg_audio_hw_clks),
 	},
+	.max_register = AUDIO_CLK_PDMIN_CTRL1,
 };
 
 static const struct audioclk_data g12a_audioclk_data = {
@@ -1839,6 +1841,7 @@ static const struct audioclk_data g12a_audioclk_data = {
 	},
 	.reset_offset = AUDIO_SW_RESET,
 	.reset_num = 26,
+	.max_register = AUDIO_CLK_SPDIFOUT_B_CTRL,
 };
 
 static const struct audioclk_data sm1_audioclk_data = {
@@ -1850,6 +1853,7 @@ static const struct audioclk_data sm1_audioclk_data = {
 	},
 	.reset_offset = AUDIO_SM1_SW_RESET0,
 	.reset_num = 39,
+	.max_register = AUDIO_CLK_SPDIFOUT_B_CTRL,
 };
 
 static const struct of_device_id clkc_match_table[] = {
-- 
2.43.0

