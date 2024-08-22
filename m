Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B121CE6EB
	for <linux-clk@vger.kernel.org>; Thu, 22 Aug 2024 15:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724340514; cv=none; b=cQWQ9o45O2GNOC6VD2rNMdVW+AyYMfJj4Rteq73Xks6Ju3jjV8TVkYoq3HvOmWb9EjtvzSeM7Q69HWRxPPg+5XAAezDJa+NlrW6qQ9BuoU8mtSbMXItg0TnNtZGbYxafJL43q7JaziYmNj6yinOA4GH/4scMjObUxPq+9dTlf5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724340514; c=relaxed/simple;
	bh=w+weaAEOmGk0To+KXOoCxU7aqcf94aBLMt0+/RCKEWY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sFcsEpiNewZuv3QnCXCvsZ3EUTSA/6nrfc9EhPVI/RPi/ud82fHrzLCzJpfLsREOAU0laI+ZmkHNXaLhZAsBBMALlPozHG7C0ZIPwAu9cjNVKGH0k/R6fzKVImGM+nHutXlCehzru5s5mGfookzFBvG/OtN3dLiIEKA4dKQ3yWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ahkaTrVs; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ahkaTrVs"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a7a843bef98so112703966b.2
        for <linux-clk@vger.kernel.org>; Thu, 22 Aug 2024 08:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724340511; x=1724945311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7FkQHIsvgS8tLvmRvs57rTjX/u1Y5CHinD6jgFXzvM=;
        b=ahkaTrVsbrgQ++YRM9CHFl4Zt1+3G69WBNK9S9wraUUldB5QsS/cWtF/ZG2RH8KU+9
         M2mKY0d7w9bWgXOPxNGRHzQlNSRPe1Gv2PZzkyHKcFWZEFacvO3ZMnwPg1xPpN1Mr/2T
         EAY+1qjZ8hzVKrfuOLjmN99yyXjMwK8yIL9+1geoJuAL1kuzzmEDRfZyFWmRt179qpz3
         oOcsMQnpIqJu7zne2Bxi4UpIhLT6f1BAlOPi2XaHNrDu9XNE/NMPTiz/Uk3Xx7vpp+TF
         jFa+A0WvOqtCHyqitBslzL2/bagHKsS02TQU/uZ1Z7CqjW04HvrwVz6ypKCwzt/XS2ve
         z+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724340511; x=1724945311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w7FkQHIsvgS8tLvmRvs57rTjX/u1Y5CHinD6jgFXzvM=;
        b=LVsXNL+nFAAFm5r1UBb6s5lZJlPCiNVHRe6nPPQCn4vusV/UnmUXmiejxKdLfMRPnQ
         5R0iTujo2671JYv5RLnNnFuxrVJ/37CigaYgGHq0M7hZUKcrZc3sJYi1owYWewiBW9E3
         Vj2U7vyPW0GHnho25nQwixghDzfZxOMhBIg9KD9SbDWTccVOmpN+MLFwONBxTcmu24HH
         /Hq1UapRN8SxfFYTjJg4rW+aoNJn/M6lrMb3zQ/aGsCkiZgWOJFL70mNNaMnP62JkUHo
         bzFTI4cnK0khpakTXPB/7/lHVv3SIwtLhlUfuoLYvcr2NH7uZSt2H4c1Vq3J5BjKs0RX
         34Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXLe5CT20pc8lQu+5xQRElHYC8UfOzFr5tUk3jB/yx1vYGdIw8L6AOc9WDSeELI9Q3LK4rO1AiVPIk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjMb/q2duDAtu0u1D85/yJAULaX5vc+O3qqYfYEZ/IVYrSxWnf
	ETQ44vRrLQ4NtITXzV3ZR6vx/YCzwXSOh6tM4WqJAKdQGXjsbtuz8/5i9yU7S3Y=
X-Google-Smtp-Source: AGHT+IGPID6PnpNBLXBTXMtHC4bLo5V7GR8HicFGoYSBbUPtn858dZ2vIoy56QGfOFS6q2WDw3Kkwg==
X-Received: by 2002:a17:907:c7dc:b0:a77:d85c:86fa with SMTP id a640c23a62f3a-a8691abe63dmr193992366b.13.1724340510445;
        Thu, 22 Aug 2024 08:28:30 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f484dc5sm134189166b.171.2024.08.22.08.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 08:28:30 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	gregkh@linuxfoundation.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	yoshihiro.shimoda.uh@renesas.com,
	biju.das.jz@bp.renesas.com,
	ulf.hansson@linaro.org
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 07/16] reset: rzg2l-usbphy-ctrl: Get reset control array
Date: Thu, 22 Aug 2024 18:27:52 +0300
Message-Id: <20240822152801.602318-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822152801.602318-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240822152801.602318-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Before accessing the USB area of the RZ/G3S SoC the PWRRDY bit of the
SYS_USB_PWRRDY register need to be cleared. When USB area is not used the
PWRRDY bit of the SYS_USB_PWRRDY register need to be set. This register is
in the SYSC controller address space and the assert/de-assert of the
signal handled by SYSC_USB_PWRRDY was implemented as a reset signal.

The USB modules available on the RZ/G3S SoC that need this bit set are:
- USB ch0 (supporting host and peripheral mode)
- USB ch2 (supporting host mode)
- USBPHY control

As the USBPHY control is the root device for all the other USB channels
(USB ch0, USB ch1) add support to set the PWRRDY for the USB area when
initializing the USBPHY control. As this is done though reset signals
get the reset array in the USBPHY control driver.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index 1cd157f4f03b..8b64c12f3bec 100644
--- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
+++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
@@ -132,7 +132,7 @@ static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
+	priv->rstc = devm_reset_control_array_get_exclusive(&pdev->dev);
 	if (IS_ERR(priv->rstc))
 		return dev_err_probe(dev, PTR_ERR(priv->rstc),
 				     "failed to get reset\n");
-- 
2.39.2

