Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC652200BA0
	for <linux-clk@vger.kernel.org>; Fri,  6 Dec 2024 11:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733483650; cv=none; b=Wb6TK6GgMU2vGijtWLR+Ad68cJvc5CwDV/RnqbV7zNwiBSBS0cZh9JgTz6dIY5oBreI0aniKswwbzzsvXGHLykmjYWO1XCory+XyjexSxW+OsRFXtIJWj/8smmvPFGVPLqVgq1E7QitpN789eSfjFHKDHoFcSFaKEz/X/B5EXNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733483650; c=relaxed/simple;
	bh=dEqGILe6UUa2QV4lg2cHxtBVoCG04Pl16cd95wtxMm8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WsNZvNFQ3rAliWuzlurKjBH+oVUJPpBGOFZELuoVPdh1PLJO1/PbEoyB+NNJb4v5+fs+kDxkR2P7m8SE3ywxN+y/8zKH3BUiJk5nCJkpMc+tWQOAJbvX/DZCUUHh9UX23G9ifJnF29sQ3wkTT9t04wd5olSbsZvvAiqJrJGMcjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=imMOzar5; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="imMOzar5"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aa6332dde13so636566b.1
        for <linux-clk@vger.kernel.org>; Fri, 06 Dec 2024 03:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733483646; x=1734088446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WhaQ2fSroT77bogvtIM7JXpl0W5k90kfLSeiQn1uD6k=;
        b=imMOzar5XjEWVg6mv/DR06oioKCfIvh6QHLnxG6xky10HI3yEYK6Dl1YYfPAQrzrTd
         CCZrbF3MUOWlC2tRox/eu/Z+Rkydjplxdew0FPz2yyLF+OfkBxrKLhUWh0j8Mh831xHb
         8ZVZf/UhbVeVApC2w9Wct2YQtvfmek9JBly6lOfBCbmpc+LlR86knIUGGOGDixaSe7A8
         iZp3XvqrApAGMz8fdtAFjF/5H9zpw87d2YZCZl+2d4oCfsiupkTbZegbYLrXaVObhRPw
         Q4V9hG4+2U+icNDTpWi69vhqFm9bSi2d5q4X/qyRsIMuIJiNyKQDdwayFsxJfBIcdbNi
         9zDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733483646; x=1734088446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WhaQ2fSroT77bogvtIM7JXpl0W5k90kfLSeiQn1uD6k=;
        b=Vx2a83h9Mb1rCTC5SQDJPbLoZW1qkLv1wALUC86fTqpD4DW3/CKzw3SipWdMPJ4dnU
         Uic5o4/yujuDaiOyEuhat0jqBK7Dk0KXOr7IlJQyj5eKQzBYlzsBWMP7z6LOFl/cg/HU
         AOX6fw8o3MskHm67Ni18jXqiS2yEpqimqIWvkPi5VFLIEGnEA3pqutbKKWETBhgHExbX
         FKkX3hchbtkzIWb1TYnUbfEqdqfX5iGdp0ste1aJpvb7OBCNZnJ5mQwwL4MlGX0MiUXv
         UkBs/abaD2snaIM2nx/Kn8CUKohsf831u+mf32NPFILpOV2mfr1B9KS3CvJlk6EvdSHS
         x2xA==
X-Forwarded-Encrypted: i=1; AJvYcCV2UrJwNvJ0iQFLwU6+RgGCeoY2527E4FEl9Ybf7DeX8SOWWZKmPLhlE0gKl3yZ32AfXME+r34s3wo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSV4/JanDJjlgqJuEvOIzffVnYjdL2dLdAd8yIBmAyRKh5R9Le
	OQKLLddsebnqH0hT5AtRolfo1NHyCjiBnX2aS+ECO3HHjX6rgwXDqwCvMrGng1Y=
X-Gm-Gg: ASbGncs60s7ekXH70WSs3a+GspXKeKKhlhoTNq8/i70hpy+hu7fakFWJir96tHvHCd6
	0A9Ki6v3+9aOz0DtMX6rQvxDljZiDJzeVgmKTO1y2t/u6TBILQ1Mqb2QrrCJeBTC59/Shlo4o/L
	+wqOA/S86MkTDmlXYmZZnU0F6glcfNgoM0PCEN46oGUV6DkCD6aTCwtXwsPXEo3RlOP7bWjhlhW
	dTZnYzxg6HVN5xKfKvWF499+LZnVHUaliCEqxE521994wFhP7wGnEpu5sAvDQ8qsKT0bzcKqljB
	sctV
X-Google-Smtp-Source: AGHT+IEde3hbpI6Dn8f4HHeLFJDahnLdyyCKzWeVkTOjBA3NVheYqHyT2l/Eb2Ag14Vr/Xb63k1GrQ==
X-Received: by 2002:a17:906:2922:b0:aa5:4ea6:fcae with SMTP id a640c23a62f3a-aa63a073542mr216321466b.28.1733483646108;
        Fri, 06 Dec 2024 03:14:06 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eee2a6sm226877866b.90.2024.12.06.03.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 03:14:05 -0800 (PST)
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
Subject: [PATCH v2 07/15] iio: adc: rzg2l_adc: Simplify the locking scheme in rzg2l_adc_read_raw()
Date: Fri,  6 Dec 2024 13:13:29 +0200
Message-Id: <20241206111337.726244-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241206111337.726244-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241206111337.726244-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Simplify the locking scheme in rzg2l_adc_read_raw() by using
guard(mutex)().

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- used guard(mutex)()
- adjusted the patch description

 drivers/iio/adc/rzg2l_adc.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/adc/rzg2l_adc.c b/drivers/iio/adc/rzg2l_adc.c
index 38d4fb014847..953511191eac 100644
--- a/drivers/iio/adc/rzg2l_adc.c
+++ b/drivers/iio/adc/rzg2l_adc.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/iio/iio.h>
@@ -220,21 +221,21 @@ static int rzg2l_adc_read_raw(struct iio_dev *indio_dev,
 	u8 ch;
 
 	switch (mask) {
-	case IIO_CHAN_INFO_RAW:
+	case IIO_CHAN_INFO_RAW: {
 		if (chan->type != IIO_VOLTAGE)
 			return -EINVAL;
 
-		mutex_lock(&adc->lock);
+		guard(mutex)(&adc->lock);
+
 		ch = chan->channel & RZG2L_ADC_CHN_MASK;
 		ret = rzg2l_adc_conversion(indio_dev, adc, ch);
-		if (ret) {
-			mutex_unlock(&adc->lock);
+		if (ret)
 			return ret;
-		}
+
 		*val = adc->last_val[ch];
-		mutex_unlock(&adc->lock);
 
 		return IIO_VAL_INT;
+	}
 
 	default:
 		return -EINVAL;
-- 
2.39.2

