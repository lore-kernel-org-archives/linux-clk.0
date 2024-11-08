Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D0F1E285C
	for <linux-clk@vger.kernel.org>; Fri,  8 Nov 2024 11:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731065043; cv=none; b=DP/Z/EvwP9+Hx9IDy/l+P6DepH/hzXqqRfoRIp1axsgtev1qrxSKE+DJfdqPDd/hV5dy9zaFT2BqgaamljlwfjGveAjAAXtlmKZHs7O5xJzdZyiCGL+vID4yZdWFuKR2E2exgUfUT3Xy88CXtX+0+fFDFSgBCtNppNoOrr33mrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731065043; c=relaxed/simple;
	bh=mazZoK0EC0wml2HyLSd0Y9MhLwlkOUfPfcHFdPeuX/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WZrPxO1J9GqgwFjRJRajw7PZCG2509ZD8NvH+DRbGmdJeOaWlnXjHhHqyhqtAkU/isB4PT/I6JOh2UiYxeJ6FHawSOZ0YUNr0ooi/G3fQjBMJxHqt3Sh3gnZ1jzvQdOtT2/xYC/cVSWm0GnHxX7NXGW3Jv0PjnShoh7tMKKElxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=Q6BlRm6K; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="Q6BlRm6K"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4314c4cb752so17433405e9.2
        for <linux-clk@vger.kernel.org>; Fri, 08 Nov 2024 03:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1731065040; x=1731669840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2oXJkzWtCGaIKJ5cbPKhS+LoIlQBWBf1ApP5urqLDw=;
        b=Q6BlRm6KzFVa3zBayCsgIcod/p7esmqiyeXRyfh+z4O66hscUV02jtmtDZj/UrAbtd
         KOTPcrggRtNE6H0XL755glaLRK9XSR/ZEGupCzOjmN1jPAmvlFe+Wg2W0guE020WdHUt
         189tumcLPz3EZJy2sBfXH1kalkoSc1JSPSANtz5EPItw+btjse62/C/JHJloEq/J15ON
         sj7qeb5iKuhe3DK6nI6yOX7LGyYco3vkoMyQ5Leo2tc/0Z9E7aq/Y03N8RcLFWRihNKt
         XvOl8UVHX/YFwlT5L8nftcQkZh7Z7AzH6Pv+bayvIxSIV/rMhqU6kDnkJnZJZtJtjhnC
         cWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731065040; x=1731669840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g2oXJkzWtCGaIKJ5cbPKhS+LoIlQBWBf1ApP5urqLDw=;
        b=QFyW4P/9/h0NUZNkMR6mcTxLkHj+ei0gCLgIWD539RqHxCu+FM2xOmTrFbK4EdJm4J
         AtQEmF2NyQSLMGRyNYX4vqhowkfk1UsxXSUGPwVGLmogapqaA9bbw9TQVYpy7sJ4tCxX
         uq6Hb8kMMY1d2kxsiUPBo8SoGOWX3k1+Gvq/XuA7JSHhlyRGQydvEGbm2dMlNPZ+GRCY
         NjIHS2lCrHgBDWTEcpN6s01jP7GA+2VJeafFXTYYDskOCVKhFeUwMUj8Ad+7y4yiqA73
         9UPsoiex6jZ/y62nvIawmnSpJVZxHKaA8J/kVoPF0pWGUgcbfxgvV2wg4XyUFWKEXlH+
         9hBg==
X-Forwarded-Encrypted: i=1; AJvYcCUmG+hdiGyRbhNl72rtF8ZgASl5sT5w8HKjxT7E+dhd9MOqXoer2jurcBww2seIZD9G5zrUg3ru+kI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqE38L02eheO6KCqqpz2uReTfv0QKQqgjtXOyvUWKCcg8LTmfK
	qxA+EnGyrBDpENz2LKFWtWgF9IMAS2pNT6WAUbxvQ+zVcruErhmvHWhDcoe64KFADbMcHRdcCHW
	P
X-Google-Smtp-Source: AGHT+IG3MD1LtAeRYq2Tgi0EQ1T2xgC9oErR/8Baw/cgSq2n2SS2IbIUneoqxr+Ubgn8WvPWUdOaKQ==
X-Received: by 2002:a05:600c:4ecc:b0:430:582f:3a9d with SMTP id 5b1f17b1804b1-432b751b68bmr20133435e9.26.1731065040128;
        Fri, 08 Nov 2024 03:24:00 -0800 (PST)
Received: from fedora.. (cpe-188-129-46-99.dynamic.amis.hr. [188.129.46.99])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-381ed970e18sm4281443f8f.10.2024.11.08.03.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 03:23:59 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	lee@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 2/3] mfd: at91-usart: make it selectable for ARCH_LAN969X
Date: Fri,  8 Nov 2024 12:22:35 +0100
Message-ID: <20241108112355.20251-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241108112355.20251-1-robert.marko@sartura.hr>
References: <20241108112355.20251-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LAN969x uses the AT91 USART IP so make it selectable for ARCH_LAN969X.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
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

