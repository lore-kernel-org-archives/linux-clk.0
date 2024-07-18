Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C1112D209
	for <linux-clk@vger.kernel.org>; Thu, 18 Jul 2024 09:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721296691; cv=none; b=QeG7pI0cBXp9oC+0DMam3cdFRrjuR8F6g7Ljzg1ZAZOUdzE4Gd1yBG3clUuDLCWKaO2Kr2WbeOvu/6vA1or/iExTsTzsTCkJV9HxHGCs8L0GSjrViMuRC9pqyA9XkjH5rffGKZnBc5zwR4ntvgvvnA2omTOsbeOcW6IRL9U7sVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721296691; c=relaxed/simple;
	bh=sNK4ErMz2o48l417rUcSJGHPTYne7cRpAUMeOaIUetU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I3iELTSvpyWOvZU3aCxkyxf38GxyA/90oCaaXvY51Evff/HKfoTHs6jMzLrR4d6Dc/bTORtkx6KlPjZle5KbZMouzIrHk2BcwsALcCksmceAqrKTt3mkNtZ4Y/gOmcOGOqBIDzltp+Iu7uVdPKye2Ad8+Q4DLeILq3xGUdZeyxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=qel0Ge4u; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="qel0Ge4u"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42726d6eca5so1016155e9.1
        for <linux-clk@vger.kernel.org>; Thu, 18 Jul 2024 02:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721296688; x=1721901488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5xcwXqNbcAcoUEX6kCiLZbJmCheMKB1aLHCgp/Pjck8=;
        b=qel0Ge4uV51zuheVcwRYlER5AW7vuB5cvxDmSFO8wutnk/dW3bnWrxrB6vcoeY1cSk
         Og38SmBNL7pWVLJY8QuWkzGeOFxunCOYReNssBEQA0E1jr3YTOL9w4MzRxrYIdiH/JtC
         BohnwYmqqTZcuSHzQH0eiR0l0qaW7+Wf+TzpsraRGPRx8w/2fiRHebZRRXExTUip7/H5
         /roEVJyFZpEv7WVGW08wKSieFWsMXRR+vPU4i76aceezUcSBBCdYAFcpDcHQrmVpMGCL
         uQtS1Jl4X0R28Oo75eTPlCAzgF7EbhXqOGyVGhhVCg4YFQylMcxaqWv/ePSR0W5NBiwd
         UNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721296688; x=1721901488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5xcwXqNbcAcoUEX6kCiLZbJmCheMKB1aLHCgp/Pjck8=;
        b=hxTrwWPEzkMP/MS1SEJ4ggPhlBLa4VG1KlUdBEovs6uFj/l7/KKc6spl8eG3sCngAs
         eQ4ZOPWbImWBYv4WYTkIPJNedHyrQMq4SfNwlWxQSMswqakrR++aPnxJ5yk64djwfWj7
         RlIPKwCBfHY3xweN/+0gDLa3vEIfBTSV7530vyro91pxPwcJAt9bJjpj1tP6p1Pz2hJL
         wna1DnRxAAWDpmXTQ2gF0NezGxCEWpQHk/xgTJ7hA51ay1Cl9zsGCSdJkhhaeSS4R4Tl
         eWarTsUkBvUUwX0ohykiCqs2dgSpTHA+Lx9ZxH4s1zfwwXgcOXl8UJEcvdNhIVrDE2T6
         VGDQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+T0f5v60dfz9qOc0zDYwoIdBY0I+ZCwzTfYRNSrFTmhJDNKcEKrWvRFUbybiBNYXtmZ4bzCtaTvV8rcbfXrBCw+VOO7IfcAMX
X-Gm-Message-State: AOJu0YyT9n1Zm2DciA36a7/dObI+dDqakQnzCnplmaQduAwk9G6k64bh
	gPW5272/lu4AtznPrBY8WiLS13uALUiyA2AvRlX5pRwnM/Q4mUVTLBudJ93h4/Y=
X-Google-Smtp-Source: AGHT+IHUSAbObAZJT7KXYxyHY/CVrKUlSK4TOOFWbep8mWkhqc4o82VXvxTyvmakEMq8v31akCeXEQ==
X-Received: by 2002:a05:600c:4443:b0:426:686f:cb4c with SMTP id 5b1f17b1804b1-427c2cf6b1emr29425735e9.32.1721296688224;
        Thu, 18 Jul 2024 02:58:08 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:8d37:f44a:c212:e320])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3680dab3be3sm13837155f8f.24.2024.07.18.02.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 02:58:07 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 6/9] reset: amlogic: add reset status support
Date: Thu, 18 Jul 2024 11:57:50 +0200
Message-ID: <20240718095755.3511992-7-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240718095755.3511992-1-jbrunet@baylibre.com>
References: <20240718095755.3511992-1-jbrunet@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit

Add a callback to check the status of the level reset, as done in
the reset driver of the audio clock controller.

This is done keep the functionality when the audio reset controller
get migrated to meson-reset.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-meson.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index 5a5e1c2358b6..b3ef1a1c7cf9 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -57,8 +57,7 @@ static int meson_reset_reset(struct reset_controller_dev *rcdev,
 static int meson_reset_level(struct reset_controller_dev *rcdev,
 			    unsigned long id, bool assert)
 {
-	struct meson_reset *data =
-		container_of(rcdev, struct meson_reset, rcdev);
+	struct meson_reset *data = container_of(rcdev, struct meson_reset, rcdev);
 	unsigned int offset, bit;
 
 	meson_reset_offset_and_bit(data, id, &offset, &bit);
@@ -69,6 +68,22 @@ static int meson_reset_level(struct reset_controller_dev *rcdev,
 				  BIT(bit), assert ? BIT(bit) : 0);
 }
 
+static int meson_reset_status(struct reset_controller_dev *rcdev,
+			      unsigned long id)
+{
+	struct meson_reset *data =
+		container_of(rcdev, struct meson_reset, rcdev);
+	unsigned int val, offset, bit;
+
+	meson_reset_offset_and_bit(data, id, &offset, &bit);
+	offset += data->param->level_offset;
+
+	regmap_read(data->map, offset, &val);
+	val = !!(BIT(bit) & val);
+
+	return val ^ data->param->level_low_reset;
+}
+
 static int meson_reset_assert(struct reset_controller_dev *rcdev,
 			      unsigned long id)
 {
@@ -85,6 +100,7 @@ static const struct reset_control_ops meson_reset_ops = {
 	.reset		= meson_reset_reset,
 	.assert		= meson_reset_assert,
 	.deassert	= meson_reset_deassert,
+	.status		= meson_reset_status,
 };
 
 static const struct meson_reset_param meson8b_param = {
-- 
2.43.0

