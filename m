Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93296201009
	for <linux-clk@vger.kernel.org>; Fri,  6 Dec 2024 11:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733483651; cv=none; b=qRrrtVE+IK2naytJr10wpf5/CsMkjlt2M/m36EpH+zzs45a4st4lI34jfSCM16t30J85PUVZVXb65RBq4FRKpCsMnAThkp5iau8JBqAmCo/kAL0ZYgQ4whckdaotEWc5pSVdhCmJJnMkVO0laoU6jxzHj0K+EJDKEjNTqbhQy44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733483651; c=relaxed/simple;
	bh=a0X4aOYvG3pTfNgIEESajz8KrdCPF4/aLinqArXPrIM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lsyX7wiN28HZ+d7nSKKTDLkTdLxa04jzDbuB9Q6U2dmGZH4Ngt1Gr6cvIpI1VFBrhfdZVZ4TuGqPpUdoc8r8egD1+Dtj8Wp/r7mn8X5LQrxMGpCnchJkve3FithvSbrUHNZwo8FDOzruKhVGxc3VuSydy99rXy1LiHmwjqIKrGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=pgN8r8/z; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="pgN8r8/z"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aa62f1d2b21so198247966b.1
        for <linux-clk@vger.kernel.org>; Fri, 06 Dec 2024 03:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733483648; x=1734088448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JcFmoPRqWug/wF9N6rxPklzROiRzJUhH8R20dFRmNrI=;
        b=pgN8r8/zwM6QCbeVS/nKYXVqlIWc4HYobrPKAgRlsRchnq65qWHTmAfRn1gkIKgNQz
         YYPRUg/BmEcW0yfhOzPghaZ8BvOSjz14VaiKumjXY+1m/I5U/G3ulCSFZVmtrj9WDwJr
         A2uAkoZA6MrJTt/KnGwJNmpz35QCk3Azc2KdY1/xUW0Kq7KHbVjZp31yUgLZO0TsHdcj
         7IrjROxweNebSkQOibunqR2EFmQnpvfH53BXDd/G+ssXqPegTdQBHeTXiOVcTUyjeWqF
         8DxCYvdDaFsu4+bZaru6XgqVsDVdsKLVGKtgygyDB2l/jdC1wR6mFL7BdxZXebuL5rHh
         zV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733483648; x=1734088448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JcFmoPRqWug/wF9N6rxPklzROiRzJUhH8R20dFRmNrI=;
        b=NNXqX8nFiwecmJukqkovZS8kaxzytYYv7pM6/VvrXw2lm1urdVBwVgw3JfSiCmJuSv
         3yybACQ1nGyf4V+jPiJwn/pwMl40sfqsiUf1kSVkjq0YcolrsNP2vij36o4CyVScUuXl
         +quMJ3nf+pneYYehH8sbHJuUKo1JhoIadGkqbd+EOWzsQpvEDOaVv6FY5JlzEPPYaaGs
         DlV1Iu61jWKC1tMOUvRALmqDjmlkkNFG5nKNgK5C7mWZmovo+rrvLvWZljZ4TNoEKw6C
         4l83LcNOW3i3N6Su4nLb8WxGNb6EJXbMW6f2HEBeqAW/UjVZSXYV1hAM2mCL9t85eO+3
         kmEQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8qV3pQ1YIN+iUuZmi0s6XDfx4y2sVlSruCMqigzPbBH+zI88SYjJwVm05F5w5aF9QXZGx08jlEPc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy4vdHh4adtG2wrqOqW15drFCE0Eqye8x51poiBhwASl7cvZDE
	DR4oj4JAlPITjTPIFmajfFFsxPLs130mVIrgODxHQAwXtto5XxxOTwPSKupdgBI=
X-Gm-Gg: ASbGnctxqLHTrtvTsUzScYY09ZauXPLrPyO/uv+wOn42ZdRF9LeDjEVjR6vppJ0L2NG
	ub6YShy4DA2rUbEKvb83AHaYfTiX/KLzXrUWIfui8AhbewGXjt0ZXCqyu4/G1oylodFaENeTnRN
	jyJSHDrz9rVEYnBJRouxjuqtiizMYOVHZBvZHFHUAhkYUJmYYUhHNmICi5OmRLxljF1Q9Nz+G3J
	MDVYntjS+o74hGcKd+YhFvksKMbLQc7+6mahux6V2jcwamkFHnN/nN7dOmUWzigy8rn3TRILdY0
	feFd
X-Google-Smtp-Source: AGHT+IHiSsJnrO9WOBGpjGpJxD2jcZJI3sgccO1J+MWdvjykKFu0VlpAlkqINSQOhBcrCp7fpOjTGQ==
X-Received: by 2002:a17:907:6194:b0:aa6:3e97:f9d8 with SMTP id a640c23a62f3a-aa63e9814ffmr105149766b.54.1733483647971;
        Fri, 06 Dec 2024 03:14:07 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eee2a6sm226877866b.90.2024.12.06.03.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 03:14:07 -0800 (PST)
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
Subject: [PATCH v2 08/15] iio: adc: rzg2l_adc: Enable runtime PM autosuspend support
Date: Fri,  6 Dec 2024 13:13:30 +0200
Message-Id: <20241206111337.726244-9-claudiu.beznea.uj@bp.renesas.com>
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

Enable runtime PM autosuspend support for the rzg2l_adc driver. With this
change, consecutive conversion requests will no longer cause the device to
be runtime-enabled/disabled after each request. Instead, the device will
transition based on the delay configured by the user.

This approach reduces the frequency of hardware register access during
runtime PM suspend/resume cycles, thereby saving CPU cycles.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- used a non-zero default autosusped delay
- adjusted the patch description to reflect that the default autosuspend
  delay has been changed

 drivers/iio/adc/rzg2l_adc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/rzg2l_adc.c b/drivers/iio/adc/rzg2l_adc.c
index 953511191eac..c3f9f95cdbba 100644
--- a/drivers/iio/adc/rzg2l_adc.c
+++ b/drivers/iio/adc/rzg2l_adc.c
@@ -208,7 +208,8 @@ static int rzg2l_adc_conversion(struct iio_dev *indio_dev, struct rzg2l_adc *adc
 	rzg2l_adc_start_stop(adc, false);
 
 rpm_put:
-	pm_runtime_put_sync(dev);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
 	return ret;
 }
 
@@ -372,7 +373,8 @@ static int rzg2l_adc_hw_init(struct device *dev, struct rzg2l_adc *adc)
 	rzg2l_adc_writel(adc, RZG2L_ADM(3), reg);
 
 exit_hw_init:
-	pm_runtime_put_sync(dev);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
 	return ret;
 }
 
@@ -410,6 +412,8 @@ static int rzg2l_adc_probe(struct platform_device *pdev)
 				     "failed to get/deassert presetn\n");
 	}
 
+	pm_runtime_set_autosuspend_delay(dev, 300);
+	pm_runtime_use_autosuspend(dev);
 	ret = devm_pm_runtime_enable(dev);
 	if (ret)
 		return ret;
-- 
2.39.2

