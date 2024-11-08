Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76041F426B
	for <linux-clk@vger.kernel.org>; Fri,  8 Nov 2024 13:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731074345; cv=none; b=HXLd6/9ScDun+IAGDV+F271mHYZWAgXV6+0K9JeeaeR47VzJA9rbf3BHi4cmJ+jUhn372Y2z8ghR1Ov3yau1K0aKJxN/hFeVVsH4oqaq2FY8OoSuvAlPE1GD8bEWas2mPWqNuqtYUK6tbMx4wpXjUd2pSml/3lAsV+cpPrnmMLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731074345; c=relaxed/simple;
	bh=lMfKsf12S0K48wHK6+KFJJk1kLie0pg7opOx+E+fnpM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HzHR0FVE64HUioBpp2JeXVPMNOkztGIHx29QByRFdNvyM3V7FMoCG/Fe/cZcWF+SkUpc+S7tolv2gTIsfasoHskQLJsMZ9oWXmLqEw005dV/DjyB5kjrzGMxkLWtaQrZFn3fvKboVFfPiElc3gfYiTCRxgf8grVQuiGSadoPg8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=qzd9WW1r; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="qzd9WW1r"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4315e62afe0so20126565e9.1
        for <linux-clk@vger.kernel.org>; Fri, 08 Nov 2024 05:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1731074342; x=1731679142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kn7pAJeAjAQBKS7X66mfb/roOZgIjXWBw7c3PZeLLVI=;
        b=qzd9WW1rupmtxy/vIBB3Hb653nw2CcTUeA9R2dcmPJ7bkPK9DuHdOhxQKBlivYkkAB
         VTU4F45190SosQaPDBxJGKKGLhF+Tch+y238uX1mCpQ0t/8Uw810i3r/xa1/A3bTRN9A
         MZfr++ne12go5VdMCqvzOIYcyxvsu0ol0g3Y4MPuBrXtk+rF+N/ZIyS+xs51Cdfbgagr
         DPCtEIE0Vb1bMrps8RnUQ2pJ1kQCvqqcjbp9CgXmd8PlfBKke/+hTo437xFCiqk8f1ye
         sx2h31jQ7/Jz/O6OGQke6tr8LoaVnLtNTIOXPp7AmpkzEWaHea7URtW6pGhX/txbvczU
         F8Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731074342; x=1731679142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kn7pAJeAjAQBKS7X66mfb/roOZgIjXWBw7c3PZeLLVI=;
        b=DjuTgZ8OWoo0mqwhBvVrPabW2NKJUhjQRJ950fuc8z+jQfEHjCorwmcYu6u3a1i4go
         TJ5XQQ6KGMg0l8IcIUZhkM913QC8qJ0TCUQ2sGOBs5r1NhXh/txOiFu71HkHm0lC/XZV
         WaR9a0KmfIH6En3IzK8KCej05A09jkpvYyBaeouWAUx4wuiBCJTbtAjoceRCDm3BprOA
         tvcv0U5OeCUD96yesEFW6fyaoaw/IqF2lJlLZg7x00G3PvewAqV2/ma6OWKvjqr7EOiR
         y4PGkK/YJQe/lQ1D0XnXm5igyzInbUwRBa/Wq1H4LRyv522HR9eIIJ7L3kOoCLtOs95B
         UrGg==
X-Forwarded-Encrypted: i=1; AJvYcCXkrxY2UBAHyRxPLnYcVWE4fVVANhgxTn+pIvGDc7L+DxuLn16Ag/w31dZUeDqTjjPX9fAsO7rFEz0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6+2e0p2y3jijzJYkXeS3lLyKeSCfh7O1YITJbbQ7s0c4VQMJo
	luD1T60qUg1eP2UP++nhyCMTvOTJKqNVVNJykO9sFiF8axFylRCuXKarY3tJ14U=
X-Google-Smtp-Source: AGHT+IHrDQs0PBQTgCK63DboffAmrhsTnn7i995FZLXxkWto266aljsAzoWEwTEOFu6My3noEjNsLA==
X-Received: by 2002:a05:600c:354c:b0:42c:ba83:3f0e with SMTP id 5b1f17b1804b1-432b74fcb3emr24421625e9.7.1731074341213;
        Fri, 08 Nov 2024 05:59:01 -0800 (PST)
Received: from fedora.. (cpe-188-129-46-99.dynamic.amis.hr. [188.129.46.99])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-381ed97cd97sm4924431f8f.27.2024.11.08.05.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 05:59:00 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: catalin.marinas@arm.com,
	will@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	lee@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-serial@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>,
	Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: [PATCH v2 3/4] mfd: at91-usart: make it selectable for ARCH_LAN969X
Date: Fri,  8 Nov 2024 14:57:33 +0100
Message-ID: <20241108135855.129116-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241108135855.129116-1-robert.marko@sartura.hr>
References: <20241108135855.129116-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LAN969x uses the AT91 USART IP so make it selectable for ARCH_LAN969X.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
---
Changes in v2:
* Pickup Acked-by from Nicolas

 drivers/mfd/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index ae23b317a64e..f280ba28d618 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -138,7 +138,7 @@ config MFD_AAT2870_CORE
 config MFD_AT91_USART
 	tristate "AT91 USART Driver"
 	select MFD_CORE
-	depends on ARCH_AT91 || COMPILE_TEST
+	depends on ARCH_AT91 || ARCH_LAN969X ||COMPILE_TEST
 	help
 	  Select this to get support for AT91 USART IP. This is a wrapper
 	  over at91-usart-serial driver and usart-spi-driver. Only one function
-- 
2.47.0

