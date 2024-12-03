Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1257B1E8849
	for <linux-clk@vger.kernel.org>; Tue,  3 Dec 2024 11:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733224431; cv=none; b=U+HGXWdgzPoTBGosfpPuUGVJX/O5XxG0xhewK1dOFgVaeXJo+Z+Q+Bf5dn2rUOBKxaQeQ66xuiQ7HVWzmptw+6g8LzlvkdP7Eq5fQyf4Tt86RL7SxAXOaP8GsB8SOK5CplzapT8U5A1mOUUgFzioGKc3WqmnseShGRVEPs0pdNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733224431; c=relaxed/simple;
	bh=Y69irwvA9nAdEISeaSugtmkBncmO2msbevmdeed4uNU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FVFwaZtJd/nWAj/OyK3pAvIZlxCBcVBIwU5Ql/or/1GrIYfX8HuG1Q76mLSSjeJzRnMPqF+B4Mi/pBkEbwqhmBHVjIqGPkFXV6PUhO1N4icEkr4CW/1KjKvfnUhR4n9c6NYqbztyiMWQuLmoXNqIeIjKvyJEJuRCfb2O37L96jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=fW428MSd; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="fW428MSd"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-385e1f12c82so3560523f8f.2
        for <linux-clk@vger.kernel.org>; Tue, 03 Dec 2024 03:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733224428; x=1733829228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yY1awRQa+zyuro3jiB3ITZ27W2RkjLLr6d38wv0V3dg=;
        b=fW428MSdA0eNsKRq0KSPQVgU+Sy0KRs9d3NcJjm4eMygeSGLbvMJOPtfV3254a7sF8
         qTGb1urJwgTYoTXdryABfoKjjYdgBmuBN2f2tfz8Q77ZKy5kzvrOT/9oF+YB4K2VZ/3M
         Bg4vU+ZhF8ik9iIzxj26/NG+Xgtau+FY+Jkk8CsPDf8ngacRGXdmvofm/06WJlOKGKn6
         87emAInSFQBpNxPK0fmOYDoHt8s3YXhT9fKiydDLGXp6IvAd05tf/VB58GCVmAeMEITB
         EGbnCRdiIveDGYQsjJ22/xbbiGlEtJVmFzMsUeQoBM7iJKpczkZ5Xyrx8l90GHB5Smy7
         9MBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733224428; x=1733829228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yY1awRQa+zyuro3jiB3ITZ27W2RkjLLr6d38wv0V3dg=;
        b=peMn8gDnRNaYw+Uvf071aadTcSbnj+hpB8wEs9w3AEG1gK9rjxk+ZJOQICYXZ+AAF4
         6aQcHNGPwFD9KTk14Kjv8FvUg9s5q0SnAjUchp9rQG3cPPkwwwmR/Jpzb9ZDXrHXIywt
         iahqvdLtXw7HnGt77g3kSQUYSqeKgA88Ht3vJtZjeDY7ZdUSzA+5sz8FPPNi1ZBbyiUF
         DzUyWjpcWsmFgPWoq3mhGXq6Q/O35BRwRNvd6wyUdh1AAGOqpyrMgGwn2b3ySeu6tYH1
         j5fipGwBB+yQABRUbRYg8pwSSSXbJJhTtP3i/QnY1EW0lo5ifbUaCAh0YNFPjrntxTkZ
         eCHw==
X-Forwarded-Encrypted: i=1; AJvYcCXnN81DtoRXmWuLy2Th8ctoxcOIlb2wsCeHmA75SQfjt6h/4Obd3KL8UoAXQ+EXhaNxu92b0vvRBzI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUsyiDzpWKVMMW/xocavddoY4n5dILBJO9ULIyh6k5uifhPQtM
	PjlBFy0omGpKbqDsC37t7f6aYJvl1TwYAKX0Q1f7bOYNOHPBHj2QOGa4U9sabPw=
X-Gm-Gg: ASbGncuK5NIHa1PlnPTDB4y7rSVxhRwz7QkLXq0sfMZj+p93BlWJfIvEiqhLCd9liti
	6eBsaw1gqkpVlWIuoCe7an6tOGyd7dqgXjSNfAODgNLTo7E48tzc1fNbVm187rjBpkzQxEE+bte
	G6YCOnVu0UYACFZXoq3BmJCTda9VxiPdSAUXnfcoxKcLcR7QjDpdqNPcCM96rF4f+jTaJmD+99a
	Nb12F+veeHWatiVwepYozFVHr/3IIBmns2mBlmauXXBFWG9KKfzDM6jFRgk6ldpc8NdP22amOMF
	NFgn
X-Google-Smtp-Source: AGHT+IGk9ZwXh2lv3kqOYSslK9UCT/Vz0YqKSpfPIhAVOKw3r9ANzj/+Y6x2dQoPHDh+kHHLlBU9Rg==
X-Received: by 2002:a05:6000:1f85:b0:382:40ad:44b2 with SMTP id ffacd0b85a97d-385fd3f8c6amr1816729f8f.34.1733224428433;
        Tue, 03 Dec 2024 03:13:48 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e0117069sm11794315f8f.60.2024.12.03.03.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 03:13:47 -0800 (PST)
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
Subject: [PATCH 10/14] iio: adc: rzg2l_adc: Add suspend/resume support
Date: Tue,  3 Dec 2024 13:13:10 +0200
Message-Id: <20241203111314.2420473-11-claudiu.beznea.uj@bp.renesas.com>
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

The Renesas RZ/G3S SoC features a power-saving mode where power to most of
the SoC components is turned off, including the ADC IP.

Suspend/resume support has been added to the rzg2l_adc driver to restore
functionality after resuming from this power-saving mode. During suspend,
the ADC resets are asserted, and the ADC is powered down. On resume, the
ADC resets are de-asserted, the hardware is re-initialized, and the ADC
power is restored using the runtime PM APIs.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/iio/adc/rzg2l_adc.c | 70 +++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/drivers/iio/adc/rzg2l_adc.c b/drivers/iio/adc/rzg2l_adc.c
index f938b0f9a795..634073e7241f 100644
--- a/drivers/iio/adc/rzg2l_adc.c
+++ b/drivers/iio/adc/rzg2l_adc.c
@@ -86,6 +86,7 @@ struct rzg2l_adc {
 	u16 *last_val;
 	struct completion completion;
 	struct mutex lock;
+	bool was_rpm_active;
 };
 
 /**
@@ -550,8 +551,77 @@ static int rzg2l_adc_pm_runtime_resume(struct device *dev)
 	return 0;
 }
 
+static int rzg2l_adc_suspend(struct device *dev)
+{
+	struct iio_dev *indio_dev = dev_get_drvdata(dev);
+	struct rzg2l_adc *adc = iio_priv(indio_dev);
+	struct reset_control_bulk_data resets[] = {
+		{ .rstc = adc->presetn },
+		{ .rstc = adc->adrstn },
+	};
+	int ret;
+
+	if (pm_runtime_suspended(dev)) {
+		adc->was_rpm_active = false;
+	} else {
+		ret = pm_runtime_force_suspend(dev);
+		if (ret)
+			return ret;
+		adc->was_rpm_active = true;
+	}
+
+	ret = reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
+	if (ret)
+		goto rpm_restore;
+
+	return 0;
+
+rpm_restore:
+	if (adc->was_rpm_active)
+		pm_runtime_force_resume(dev);
+
+	return ret;
+}
+
+static int rzg2l_adc_resume(struct device *dev)
+{
+	struct iio_dev *indio_dev = dev_get_drvdata(dev);
+	struct rzg2l_adc *adc = iio_priv(indio_dev);
+	struct reset_control_bulk_data resets[] = {
+		{ .rstc = adc->adrstn },
+		{ .rstc = adc->presetn },
+	};
+	int ret;
+
+	ret = reset_control_bulk_deassert(ARRAY_SIZE(resets), resets);
+	if (ret)
+		return ret;
+
+	if (adc->was_rpm_active) {
+		ret = pm_runtime_force_resume(dev);
+		if (ret)
+			goto resets_restore;
+	}
+
+	ret = rzg2l_adc_hw_init(dev, adc);
+	if (ret)
+		goto rpm_restore;
+
+	return 0;
+
+rpm_restore:
+	if (adc->was_rpm_active) {
+		pm_runtime_mark_last_busy(dev);
+		pm_runtime_put_autosuspend(dev);
+	}
+resets_restore:
+	reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
+	return ret;
+}
+
 static const struct dev_pm_ops rzg2l_adc_pm_ops = {
 	RUNTIME_PM_OPS(rzg2l_adc_pm_runtime_suspend, rzg2l_adc_pm_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(rzg2l_adc_suspend, rzg2l_adc_resume)
 };
 
 static struct platform_driver rzg2l_adc_driver = {
-- 
2.39.2

