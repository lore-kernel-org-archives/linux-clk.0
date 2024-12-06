Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0905B1FF604
	for <linux-clk@vger.kernel.org>; Fri,  6 Dec 2024 11:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733483648; cv=none; b=g0nrSOkxUJ/ONv0aeZU0lso5jXg3cmVuF9JkCjMK5WtC7RHWIxvldOj3N8zXJO3L0Gxs1Om//1KDlRc7Wa5VkEHzD5ji4Ij3bp+NadR7HEcQlC0qmrk+B5AY/b7rxgGIXdew3zl5Ja2tpgElx7Am2uYWtMGxUbXHTXKmJiBMmm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733483648; c=relaxed/simple;
	bh=k+e2xOqzzPlHXfQrE6tIHd8B8n0ckX4ZsqRauyT6SrU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ryyWQnMpvlRLrL47vYEf5JwD93r9ByAwwVyXv17ZoHQwiFYv5ILNSyFmt/yB8e76g4Ay/5JGgYJKTCQuz4JSqnlbb1dNq3vjU37qNXKfB3i1X8zOKoebdHu8VKzu7pJcwzvCAdQfsQ2CN58maa0CGgPkWakRiJp+AHjF9uH9rFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=emkRSVVg; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="emkRSVVg"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-434a45f05feso21545175e9.3
        for <linux-clk@vger.kernel.org>; Fri, 06 Dec 2024 03:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733483644; x=1734088444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Opknw59dd1fO7VceDAzkVbX2zeeLYIzonu5RWkuZeEg=;
        b=emkRSVVggyVlkmoOV1p1JmE08HiIcJ8YoF7+FB4K0l4OBR641AiHLbHDd2tKZVQVTs
         n1Ak1hFx1XUVUINezCkL6A/BZlVnzbihXdFoIQ9aRBgS+ixvxMbn7UbW9sAUJZXi3LKI
         WRnCSU78wJVggdW7OUaPqTzCUn70bKm4ZvnQ++HAyN8wx6ttyj9ZTT/XNGT3otHkp3L8
         cS7OHhaVV65PCLMiE1qy86bBGZpVQZZ8CUJjMbIkMiT0z8Ckucu+ZYzXD9z+sedwV35f
         0AmYy1t+EUOoNUqiFsbxm4jigpTvdThLC6pB0rkqD+fjVOf3FZ1OIFURuDdAfjqamKWh
         hvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733483644; x=1734088444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Opknw59dd1fO7VceDAzkVbX2zeeLYIzonu5RWkuZeEg=;
        b=vMFeQ1yYq6XCozEez/xcJPLJHMZOqx+RKUVWvhzalAQiYJJU+yOrkPDTpI/Q4AMTN7
         Q4s5KkNX7G06rdYiRd9+h2U725IfU9pF9toFbyn8YGIkXeOqD5+NYM+Fb5kBvLkoBuEW
         tZs2McBmxQ6IxSWfX4odRyi6RnGG2TtbXZXZ9kIClAY2bDjpv/KCg8HZPGuUElwfGL+z
         425HcZI3kaLKSCBjhKZysBP6+GejuvY1GfBilGtLKL96GTIQACkf/k0uFUVzn2CmYRey
         m6dwh3pfmZKgE1lfXuQONAXrEATO7Z5wFkHEBLp62F8V7o9x3yTagFOobyJJkep4QDAm
         jmyw==
X-Forwarded-Encrypted: i=1; AJvYcCWp/+FhCZoguBefEucGuQVIZFdqfE/3EnLk2dV/GL2rE+TgYa1dRpUItGMUck71U+dAnK7KWS+9Z8o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzT3Sna3vO7QfOI373FqG7/Yg0MbK05jZfcCWNH2vX/fOzZ4D+S
	443kNDoxCWTV69VcGWzfr6xpc/179G+0mGShbE3rpZtqdUljiuaurSJNoSK8zUo=
X-Gm-Gg: ASbGncuQv8U3cYZjCW6+eWuLHoEs+eTC1S0IKBOETGV6qs5xrQj0NtLceR6EtfFKDyn
	JAS0qS5ND2V73DoQt5tsscom/rPYzC7FF5kfSZmEuPoKdRi4P2CDXWuCGWfqHgjv3cnaZzSij1v
	oZCyb37p9O3jcuEJlh+HwIJFiHkiRHzXq+85DnDacU7SboSfn+rO8Gwu1fRWRl4TtX4rEOh0fdW
	d7zgKHQ9lOXp3P3q85UvQO9wcmr1Vg58OHHpMHtPSfYN+k5SrRFJWgB92iV8Sj2fo2dXpfYeXac
	JUFV
X-Google-Smtp-Source: AGHT+IGHPjOUenYoqUgXzgnQIz721t4g0doqmz4uKaZGCl3bSPXpuHOTDDdqMtgiDrRz79pHzQnacA==
X-Received: by 2002:a05:6000:178e:b0:385:e013:b844 with SMTP id ffacd0b85a97d-3862b355269mr1789922f8f.15.1733483644418;
        Fri, 06 Dec 2024 03:14:04 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eee2a6sm226877866b.90.2024.12.06.03.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 03:14:03 -0800 (PST)
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
Subject: [PATCH v2 06/15] iio: adc: rzg2l_adc: Use read_poll_timeout()
Date: Fri,  6 Dec 2024 13:13:28 +0200
Message-Id: <20241206111337.726244-7-claudiu.beznea.uj@bp.renesas.com>
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

Replace the driver-specific implementation with the read_poll_timeout()
function. This change simplifies the code and improves maintainability by
leveraging the standardized helper.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

 drivers/iio/adc/rzg2l_adc.c | 29 ++++++++++-------------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/drivers/iio/adc/rzg2l_adc.c b/drivers/iio/adc/rzg2l_adc.c
index 482da6dcf174..38d4fb014847 100644
--- a/drivers/iio/adc/rzg2l_adc.c
+++ b/drivers/iio/adc/rzg2l_adc.c
@@ -13,6 +13,7 @@
 #include <linux/iio/iio.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -112,7 +113,7 @@ static void rzg2l_adc_pwr(struct rzg2l_adc *adc, bool on)
 
 static void rzg2l_adc_start_stop(struct rzg2l_adc *adc, bool start)
 {
-	int timeout = 5;
+	int ret;
 	u32 reg;
 
 	reg = rzg2l_adc_readl(adc, RZG2L_ADM(0));
@@ -125,15 +126,10 @@ static void rzg2l_adc_start_stop(struct rzg2l_adc *adc, bool start)
 	if (start)
 		return;
 
-	do {
-		usleep_range(100, 200);
-		reg = rzg2l_adc_readl(adc, RZG2L_ADM(0));
-		timeout--;
-		if (!timeout) {
-			pr_err("%s stopping ADC timed out\n", __func__);
-			break;
-		}
-	} while (((reg & RZG2L_ADM0_ADBSY) || (reg & RZG2L_ADM0_ADCE)));
+	ret = read_poll_timeout(rzg2l_adc_readl, reg, !(reg & (RZG2L_ADM0_ADBSY | RZG2L_ADM0_ADCE)),
+				200, 1000, true, adc, RZG2L_ADM(0));
+	if (ret)
+		pr_err("%s stopping ADC timed out\n", __func__);
 }
 
 static void rzg2l_set_trigger(struct rzg2l_adc *adc)
@@ -338,7 +334,6 @@ static int rzg2l_adc_parse_properties(struct platform_device *pdev, struct rzg2l
 
 static int rzg2l_adc_hw_init(struct device *dev, struct rzg2l_adc *adc)
 {
-	int timeout = 5;
 	u32 reg;
 	int ret;
 
@@ -351,14 +346,10 @@ static int rzg2l_adc_hw_init(struct device *dev, struct rzg2l_adc *adc)
 	reg |= RZG2L_ADM0_SRESB;
 	rzg2l_adc_writel(adc, RZG2L_ADM(0), reg);
 
-	while (!(rzg2l_adc_readl(adc, RZG2L_ADM(0)) & RZG2L_ADM0_SRESB)) {
-		if (!timeout) {
-			ret = -EBUSY;
-			goto exit_hw_init;
-		}
-		timeout--;
-		usleep_range(100, 200);
-	}
+	ret = read_poll_timeout(rzg2l_adc_readl, reg, reg & RZG2L_ADM0_SRESB,
+				200, 1000, false, adc, RZG2L_ADM(0));
+	if (ret)
+		goto exit_hw_init;
 
 	/* Only division by 4 can be set */
 	reg = rzg2l_adc_readl(adc, RZG2L_ADIVC);
-- 
2.39.2

