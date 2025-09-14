Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8483E26C399
	for <linux-clk@vger.kernel.org>; Sun, 14 Sep 2025 12:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757853767; cv=none; b=G8pOBtwV/yQSy1usgEt43iorsBUf1aYECb0REIMEYCqVRfIGCOaSsTTlQsOXbVCoMhzKAtOFSHSjran0nzgbgJJm/LEZiMLpckPvJcEQ6GE7v2s+LSgu3mMUT1X+3m6GNLHCXXYiHMAzGvvOXtH3PpfgHXoteI2R95ZlmBs9hME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757853767; c=relaxed/simple;
	bh=D22DQEAI7GUdY0C98ZI2lUt2RWXEbX1YdkY+EOaEysY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ba35+vQKPOAU2VqPsCrMNOZ9RKL9ARiEYtcqpN7KniuuRfcrYCKSZuTPtAArptUZyIxhBJbHlyiLPQc+qJrxezpBHX+GPwmpMZS/vjrsXm51KTheboyGsZu2mLF89zTJGFu1vjmk3nPqLep0qpGLWFvDDVUpk/p8o9N7MKf2FCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PuxeCqBj; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PuxeCqBj"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45f2313dd86so19740905e9.2
        for <linux-clk@vger.kernel.org>; Sun, 14 Sep 2025 05:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757853764; x=1758458564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z5IkwHpWT3vjOUxYuXQio/Ms33Sg58fY2czp9a5UdkM=;
        b=PuxeCqBjJ3HDaqIFS8HzlHkBE6W6j7uxWv8VYHtczVwYtuUrdp+Ayn1AwxJq85OcFJ
         6pProTdwI7L11VVqbh52KND6ElxLC2osvR+wUYLfiHN0ut48bXBC4moItQfkG88e771f
         W5lssByHXe5oGdCMHFUeSZPngRQxFBELBAJXllrNIXOptLCvpV8iSDz3Bvm+4OfGTVbc
         iVn/Vw+jQ0xfd8b9yoig9/PoPdIBHQuHkUTQFMFpz7sn/iT3xu3diMCCb6BeFql+jyWf
         62XmTSQCaQAbfYXu+RKkS6bT82EfpWeVSlBz2uh75TvMDTyCNBFSSFvJOUtDiiOn3Jkv
         b03w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757853764; x=1758458564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z5IkwHpWT3vjOUxYuXQio/Ms33Sg58fY2czp9a5UdkM=;
        b=O6c6la5pEeRreGRK/ZLROiYgjYlGsu3RRcJpDS82B4aifQdlzTjVkTRG1rso/wKNwu
         uHG/kWtjWNYoqy+kWcCA2+cYdjdrn2kKvD09EpzvmQNEjpCGjWOpecWxqyCYY3xF8cN7
         3TSzcl3LydD77JEH2NA0ancJwi3LE5uVufcXfUKIrH8fuxZM5vYeS1Y7zS61vl4VYFaV
         axSj9RnWmzzVt0YPCi9OU175IUFftXNI6RO9GDZeuXDCuUIGWhzP4NgJe+nQLNisGaCD
         nhJmx0UKINqiRboI5HY+FhPjUIfr3GtLd5TmSde/RYzjlWgtm9tVmV7zidKlpBLBwr8T
         uIuw==
X-Forwarded-Encrypted: i=1; AJvYcCUrVRn9CC/8+o1WWoQD6xBJWf7ETFooKMZWA+xnR0P9VW/RKm4zcWF3J+7fetlHQwLEIb3S4uNfLV4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvcPDpkLaplyxcENDfWyGjV6q5EBJMy3rB8H6jqGc/aNZiokGo
	epy+De7Ga7yQ1BjDv5q7kJw6/1d9F2T0KvM1A3SZRNL1PSCb2qe1g5by
X-Gm-Gg: ASbGncvODnLan2Ll7x+iqIMLhurqSiTtYdDm8Ou3aAuiJmbiV0jwoT5H9P7Kd5B1hmp
	qEcCskxVV+5ojaFqUQeql49dHcrtmuLP4wEUk2wv1FJchEdrrQgD3DFHafMd6wybfoeNTFB87Re
	il2JJ6AAZD53I6pmU+OKNbyMYCaXJDBkR1dByZvZ1CKBhu3k0HDA/BagyRKEicjzRUXYV67RnX8
	QI71HZupXN1KzrI5ebA7+5rHQmS2eiwGnRhQloVp8Z9L5nvKPxe5p3FSwoZdHFpXZpv+9LFMqpj
	Tj4gaKX0850ljvriEO/pNhY0oqgd/5zHgCZK44qwuGn9oBlKJM4QegcjzCaSWRyTqw9/n84Pow7
	m0bN5refVHyynPUZbNhH/f9y2TdxuHkZHZ4FnC6QTKuQorPemXEn8l1f0wWx2Gcy/Gc0l4mE9Cf
	hjWaakdi0K
X-Google-Smtp-Source: AGHT+IFJplQxPa+oOwiL3HwRMbWnzwzx1xcdaJkdmZixyb1ZQ45I0gzLQ3rbeFTRhbx5TQ6AuRvPjQ==
X-Received: by 2002:a05:6000:2dc8:b0:3e3:921b:659f with SMTP id ffacd0b85a97d-3e765780a76mr8171220f8f.2.1757853763840;
        Sun, 14 Sep 2025 05:42:43 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e9511abbccsm3727773f8f.9.2025.09.14.05.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 05:42:43 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 5/7] clk: s2mps11: add the support for S2MPS16 PMIC clock
Date: Sun, 14 Sep 2025 15:42:25 +0300
Message-ID: <20250914124227.2619925-6-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914124227.2619925-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914124227.2619925-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the support for S2MPS16 PMIC clock, which is functionally the same
as the currently supported ones, with the exception of a different
register.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/clk/clk-s2mps11.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c
index d4e9c3577..7c766d05d 100644
--- a/drivers/clk/clk-s2mps11.c
+++ b/drivers/clk/clk-s2mps11.c
@@ -14,6 +14,7 @@
 #include <linux/mfd/samsung/s2mps11.h>
 #include <linux/mfd/samsung/s2mps13.h>
 #include <linux/mfd/samsung/s2mps14.h>
+#include <linux/mfd/samsung/s2mps16.h>
 #include <linux/mfd/samsung/s5m8767.h>
 #include <linux/mfd/samsung/core.h>
 
@@ -149,6 +150,9 @@ static int s2mps11_clk_probe(struct platform_device *pdev)
 	case S2MPS14X:
 		s2mps11_reg = S2MPS14_REG_RTCCTRL;
 		break;
+	case S2MPS16X:
+		s2mps11_reg = S2MPS16_REG_RTC_BUF;
+		break;
 	case S5M8767X:
 		s2mps11_reg = S5M8767_REG_CTRL1;
 		break;
@@ -224,6 +228,7 @@ static const struct platform_device_id s2mps11_clk_id[] = {
 	{ "s2mps11-clk", S2MPS11X},
 	{ "s2mps13-clk", S2MPS13X},
 	{ "s2mps14-clk", S2MPS14X},
+	{ "s2mps16-clk", S2MPS16X},
 	{ "s5m8767-clk", S5M8767X},
 	{ },
 };
@@ -249,6 +254,9 @@ static const struct of_device_id s2mps11_dt_match[] __used = {
 	}, {
 		.compatible = "samsung,s2mps14-clk",
 		.data = (void *)S2MPS14X,
+	}, {
+		.compatible = "samsung,s2mps16-clk",
+		.data = (void *)S2MPS16X,
 	}, {
 		.compatible = "samsung,s5m8767-clk",
 		.data = (void *)S5M8767X,
-- 
2.43.0

