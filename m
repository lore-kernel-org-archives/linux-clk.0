Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8F41F470E
	for <linux-clk@vger.kernel.org>; Fri,  8 Nov 2024 13:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731074346; cv=none; b=SeqxrSLYqaSnX4dE1Bz13PlI++/oCos3PCro/0dom7KXu0tKdLWJ4izJQnJGzlzDb1Jjxyu9vJUi+BBFV8dm8vZJznUBqdX2UmF9nPlNy3XWOTGYz2DfJ3BlhLbRBCFnRXQKXdxUQiImpTRd85PLlV8MN9X1JYoZJnekotbxAzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731074346; c=relaxed/simple;
	bh=0qYOjG+PxUVuapY8Zq6vV+DKT4rZuCwk4o65LvIXdhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NqyhmBxBMdcepp1nAWVJMGtdSyzOFeP8VT382I3zMNpBzwnBCipmKEocOjmd77sK7as9o7lLncWcmFDfKoT49h1QkOkQKta825cvq5au7tfuZ3fniSdAkEUSdND1JT+ox51tI70w13iXI0pKoFMbamr9G4erm1EFTRZ/yQvEh2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=CHG3r8G3; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="CHG3r8G3"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37d50fad249so1533771f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 08 Nov 2024 05:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1731074343; x=1731679143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xdZLopVjyjhT5RSAFFKohTizpIqPLaJt6XK15njFe6c=;
        b=CHG3r8G3Ma4CTi1T9MagF9MzWOZlrdsvhB42Ic5qQKy0nM6yZCY0Q6dlkvWautjMKa
         ylKiz5Fk6IyzoGBsCiEIAaTmT4U/nljUuFNnnrfjRC9X5GuF9tHlcHB3hfChy8CjOi2C
         CjiFJT1fn3oS7fsWeBA3EPXbCrfiY/VZ6hnK79LP8S2d15kdInSBsEdS3H6QWAHSdfyR
         nM4KOVFMpv1ewK1IEG1udSG7ObA1fSeNwwJdU+fzDVR0HZol1xKjsdEDYjMivbv4fdpf
         iHObXSmJkHR0RExOSEDGVoY6HJ5s99DdIxdKtloFPO2ideGdMkNiQuVnkhCOkbSXWt+k
         scPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731074343; x=1731679143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xdZLopVjyjhT5RSAFFKohTizpIqPLaJt6XK15njFe6c=;
        b=xSBacH5NNAl7vY6Vt9sdNpItxVzC+CCPUBghe4qB5BPgyupyQ7UcGechcgpRT0fzWs
         bX4ynfuq6uaUOY6/WX5A3jfysW4eje7v9UQ4AkI/rSivW35lmlqN9DB7gGhvMEbN7eGu
         JjGG/P4c8ww8egBBRjgdKiMS0cyEI51NJKO9V6HDRZeY3S3jGIVA/+c4ozjrUulikNvb
         l90RNX3QF62EJIzBv4LUUY8Q47Kpxm1TvcZm9VSUYaEd+lAMUnAKqShrt2+23n15kFdB
         ZewLx4l8CSwb8aL5ztRFvfVLqqFLoWhdVPesSozte67cYD0tunKBgEy7/c97co6E0RyR
         ooDg==
X-Forwarded-Encrypted: i=1; AJvYcCUV19Zdl48ZQ9hg4yB2O/PSHgzmhGynjH53WtV97V1XWLeI1kIa012q2zefou0b9QpP6KsjNf2K6NQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+5joyrWPVZfM62r3pW2rHtJhjJEWHEEiO5BEsHcT/2W+bIOL8
	nvIYqsyfPzycmrACV/LjY4xFhff7HoAuqk7cSz85RcxxZPbRc6ILzNPArAStc7g=
X-Google-Smtp-Source: AGHT+IEU+4qezTXoyunjCox4NNDvtuGiupxZONMcrWhdVQ4IuBx9NDZjHYgJa4s0rv587Kx6mZc+cw==
X-Received: by 2002:a5d:59a2:0:b0:37d:326d:305a with SMTP id ffacd0b85a97d-381f1866f90mr2485874f8f.2.1731074343506;
        Fri, 08 Nov 2024 05:59:03 -0800 (PST)
Received: from fedora.. (cpe-188-129-46-99.dynamic.amis.hr. [188.129.46.99])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-381ed97cd97sm4924431f8f.27.2024.11.08.05.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 05:59:02 -0800 (PST)
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
Subject: [PATCH v2 4/4] tty: serial: atmel: make it selectable for ARCH_LAN969X
Date: Fri,  8 Nov 2024 14:57:34 +0100
Message-ID: <20241108135855.129116-4-robert.marko@sartura.hr>
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

LAN969x uses the Atmel serial, so make it selectable for ARCH_LAN969X.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
---
Changes in v2:
* Pickup Acked-by from Nicolas
* Add whitespace before COMPILE_TEST

 drivers/tty/serial/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index 45f0f779fbf9..976dae3bb1bb 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -128,7 +128,7 @@ config SERIAL_SB1250_DUART_CONSOLE
 config SERIAL_ATMEL
 	bool "AT91 on-chip serial port support"
 	depends on COMMON_CLK
-	depends on ARCH_AT91 || COMPILE_TEST
+	depends on ARCH_AT91 || ARCH_LAN969X || COMPILE_TEST
 	select SERIAL_CORE
 	select SERIAL_MCTRL_GPIO if GPIOLIB
 	select MFD_AT91_USART
-- 
2.47.0

