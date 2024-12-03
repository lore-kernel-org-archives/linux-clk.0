Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E551E570E
	for <linux-clk@vger.kernel.org>; Tue,  3 Dec 2024 11:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733224425; cv=none; b=bH2TD6C8G8a+k0/9zHYEMv1AdISzx4HWibJW311TSvoddidNxDCUVsUcnXSRbdAkOB3HA+XRHP6wzSg4F0up1hHx8f8Py5cHUOHlXvsq88EUzLPn4k95PWx1tlA9WPWuIxA2wBeH5yBV/W7eLtK9XnOSe6ZdXbZ1QMuZiMX94Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733224425; c=relaxed/simple;
	bh=dJ66VqH1lPKbG1vJ5uyMkdnhCZK/cj9xWl8VrZo+eZw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VQp3QVp04VuwquO7tisF8EvG6NpgV5Fl1wNwRs9T75vZ1Ha6cNlwgdnnZiGos9wYimitraew2C8t1McE98ai0nDVOEJCm2jeWUEifR/wNwM62ACOq2WnhqETDMZrO3SPGV8TsXf2EBkr1AGp9/+24feosig5u+LvzUJucI40Xgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Z+2gqJEx; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Z+2gqJEx"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-434a736518eso66708995e9.1
        for <linux-clk@vger.kernel.org>; Tue, 03 Dec 2024 03:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733224421; x=1733829221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGjJNxAUoLlbHeze5dKZ8rYLCdUS04mEhaX4QA4tgNs=;
        b=Z+2gqJExQdzuRiPv9DPdYMSZwZ5IdAbriIf91XWR916L8+vIxd4nR6+x5WeJtL9BuV
         bGQzsrLyFcBToFHCiOHVrC+16vXjoVi5XiodBOLM4KyEdUa7bujkBN2liLc9GjE3+Sh/
         NMER/kcmbuI17iMa32Pq4r0H+TI3Q1kEd3qFvU9YEB524KuuWy7VisMkdIGaof+t3FOi
         Qrp8o79MZu69kJ6XgUpamlAJqPWpcCwQxi7bgfS845vRXOD92ujjh41zbUULSNO3S7Et
         +7BDQnnQBXx4ZjWIUN4ABT6PeJrpyw9dg4QerBeYSZcFsCer9HWVnnQpRmnyya1/4VvK
         pC0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733224421; x=1733829221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JGjJNxAUoLlbHeze5dKZ8rYLCdUS04mEhaX4QA4tgNs=;
        b=p0StSSV3VjwecDfJMhmYuVpsotkIPc31ZAeCTMtQDEOcPlFm5IhocOhYBFbV0ncc7N
         /QwegK594cr59wuzRcvf66XW4qZhFTmm7vAi0kYLdBy7UrADpMSwkLnRwqQuRFB/YiRr
         +MmnJeG1cTkRfThsNYqktsfwu7WMwd26ISIS1p6OltTp6F7/uMaRXpTsP+w8HHY93Adr
         Tv8tj7vYf1kODOa3GEp/pNI2GVANS7OQ3/rj9svr/N7jWQ+quizUL0ScD2fXgENjyHg8
         KlqxvTKti+Eee+aM2llNT2huamq2ISSl5GtcuzghbyADWXVt15L7ddvD1nRoKtmiZXpm
         ckyw==
X-Forwarded-Encrypted: i=1; AJvYcCUeppZGsGBXF/rTYU0k8OfRJK3ywgS4Da6j0jS743l5CEaL/qYEyQgriaBXJFmw2WeMXAr2Rhtg5rM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSUFd3d2J2fKKmlHBO0yNz5b8DLSY6fPME1nG50zqox8HmKih8
	BCPhUMPVjTUYPh/C8D/tJbpyZ+r0t2iWAi/lPQQornA9yTg/fUaykqQUuZG3kwk=
X-Gm-Gg: ASbGnctTEECMMZUmccBgojWSQIsUKJ4WB6I4nzW480XWPV7oVNEng7XcOxLsqbn8ZlW
	FytCQrrdnHNb1L3GGcIybGYXj7lTs5dJ+/UJxr6na69M9mo6JoraNKTHo+1ZwW7MMVmKbfy48AK
	u7qUjC+NrQKym7Dc/lz/1NnPqGyHQjasfiRBWu5xmScXussmNi2ZA39D6YX+lWig9gU7leakWoZ
	aae5O50ZxVYtEKnH5gHF4qGMV/5Co90YvKgHOjL4ApfutvwqYGpuvLdy6UfgmMbiWq7kKvROZGH
	zmSt
X-Google-Smtp-Source: AGHT+IE+s1yoVLBzbwgkBBIAjbk6p+3eCyfk26hAJKZF4jfFJbnwH4ZzJ60DDcfVvJaXNdjv9UMOjA==
X-Received: by 2002:a05:600c:138a:b0:434:a684:984 with SMTP id 5b1f17b1804b1-434d09b2f31mr20189215e9.4.1733224420880;
        Tue, 03 Dec 2024 03:13:40 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e0117069sm11794315f8f.60.2024.12.03.03.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 03:13:40 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: prabhakar.mahadev-lad.rj@bp.renesas.com,
	jic23@kernel.org,
	lars@metafoo.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 06/14] iio: adc: rzg2l_adc: Simplify the locking scheme in rzg2l_adc_read_raw()
Date: Tue,  3 Dec 2024 13:13:06 +0200
Message-Id: <20241203111314.2420473-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241203111314.2420473-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241203111314.2420473-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Simplify the locking scheme in rzg2l_adc_read_raw() by saving the converted
value only if the rzg2l_adc_conversion() returns success. The approach
simplifies the addition of thermal sensor support (that will be done in the
next commits). The downside is that the ret variable need to be checked
twice.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/iio/adc/rzg2l_adc.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/adc/rzg2l_adc.c b/drivers/iio/adc/rzg2l_adc.c
index 62932f9295b6..eed2944bd98d 100644
--- a/drivers/iio/adc/rzg2l_adc.c
+++ b/drivers/iio/adc/rzg2l_adc.c
@@ -227,14 +227,11 @@ static int rzg2l_adc_read_raw(struct iio_dev *indio_dev,
 		mutex_lock(&adc->lock);
 		ch = chan->channel & RZG2L_ADC_CHN_MASK;
 		ret = rzg2l_adc_conversion(indio_dev, adc, ch);
-		if (ret) {
-			mutex_unlock(&adc->lock);
-			return ret;
-		}
-		*val = adc->last_val[ch];
+		if (!ret)
+			*val = adc->last_val[ch];
 		mutex_unlock(&adc->lock);
 
-		return IIO_VAL_INT;
+		return ret ? ret : IIO_VAL_INT;
 
 	default:
 		return -EINVAL;
-- 
2.39.2

