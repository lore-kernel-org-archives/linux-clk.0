Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360AF1E4101
	for <linux-clk@vger.kernel.org>; Fri,  8 Nov 2024 11:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731065044; cv=none; b=otIYthj5VtvUc9zu7+D7gJioTmaaTiZmScEOiJm2xogSsGR4S/uM/VuJQVnduYk/haSo1YlT2UEcL4TYNzAvinYCppM4k0iC43d0WDs6CdA/XmBwJq6UfDgqx0S6T51tZGfiUbj8/cAR7cP0KQZ4MdaZEw75hhWob+hwvC4P/6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731065044; c=relaxed/simple;
	bh=Hg9luVEPDNEyrEB3D72f6ILBx2FRij6PelggGUIez3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eB4hfMpgOzyu5TmJZLVHRYLIQMc+eGD6DZBPgDTF6M4ME095UEkHWOlTVmOovdVku+1Y/rMfwsIoHiJXISMsB8BaPy78wH7oPmjAz3xbnNDWk/dTGWLlCzj7ouMKz383r/YGroIPXi0YUotSBeu2ewTF3G28tVASbR+eRXAMnsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=bC6Uaeco; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="bC6Uaeco"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-37d49a7207cso1411388f8f.0
        for <linux-clk@vger.kernel.org>; Fri, 08 Nov 2024 03:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1731065041; x=1731669841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DnSKG3TH+X58AcZRDigmrjfJlOAFQ9HXiZWebugh1IM=;
        b=bC6UaecoBSpprY5fyg4OsKrxS6tZUxU7WWayjsHxmsS0uUMbwssisoK6vW8jhm224x
         OfA7SYAh51VpoQwHU76IyVTfZd5ONW48KIdKCn0ne/lvqUeMSwXcoTp9leRWcLYJcKBt
         JTKdZ4k1bJaG8X583pPOUJqPC0MwF7j2Er7TUD2JuVl0Gplht4yHGVXQM60k4kDhuMhJ
         Y9ZHuP5R1nfhqAlse4bdEL35T+FlJ/0cmgKXsPRm/PBvoqanbnuWxCdWsH3LtXYYSnxb
         Wfcs2KXJPnUswKpdjbi31K2772SvTxY4o8iI01S9Rqpx0RCox81lOzbS2tEt91WeDZ9D
         lj9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731065041; x=1731669841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DnSKG3TH+X58AcZRDigmrjfJlOAFQ9HXiZWebugh1IM=;
        b=LjU1bJ6Uh36AcbyNLmUuFmcOFXEOFrJH1WATBLSIO9sS7gW9j8ZoPNK85KAxd8kkgw
         jnAojJY3eNX6n/hcSOyCZRfeg9/HvrWthUtBh93/7d/sYJd11yvmVov8g00t8bE2JXjH
         wz4nfMvs0TSCB+ZB2kPaL701nrkvfPLeLwOVgFuHQwRLRzV+2hyANJuFYOU9ZBEVMQMv
         pFpbanMfv4+gCdr8Sjvy1fW7QULaoxVzn3UV7b56s8vOtJmhtw3s5ieFsa9873dqq5I1
         B2dY2JNeKtjKA91wbRWPa4ycyTk12OD18ZzH5XRJvLkqSUS/0/3JyEK/u1OpB+QQPrh3
         PAPg==
X-Forwarded-Encrypted: i=1; AJvYcCWAhTcluShYMbcMya3o3GuTXmnjaROTDwDM7tOEUMprg/32shBvMEnubnUyhaoAO+ogDxYFdv3NCFY=@vger.kernel.org
X-Gm-Message-State: AOJu0YytQ+M0t59Qi4VDHaYh9/b6XyLBmN+P4oLLs582LPypKsMz8Od+
	BMsemORCJ3ZzpWvLcgHYol/F6PyppCutTFI9wxD917wZyXArjMV8gdApKjWx4iM=
X-Google-Smtp-Source: AGHT+IFhDdWJ9/nrt/S8un2QtY9kM8UUNO7BtPJoNvy1L5IL1cpiKGJx6XnADmahjiBUVox1mtdnAA==
X-Received: by 2002:a5d:5f81:0:b0:37d:5232:a963 with SMTP id ffacd0b85a97d-381f1866f10mr1897932f8f.14.1731065041488;
        Fri, 08 Nov 2024 03:24:01 -0800 (PST)
Received: from fedora.. (cpe-188-129-46-99.dynamic.amis.hr. [188.129.46.99])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-381ed970e18sm4281443f8f.10.2024.11.08.03.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 03:24:00 -0800 (PST)
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
Subject: [PATCH 3/3] tty: serial: atmel: make it selectable for ARCH_LAN969X
Date: Fri,  8 Nov 2024 12:22:36 +0100
Message-ID: <20241108112355.20251-3-robert.marko@sartura.hr>
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

LAN969x uses the Atmel serial, so make it selectable for ARCH_LAN969X.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/tty/serial/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index 45f0f779fbf9..e6cf20b845f1 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -128,7 +128,7 @@ config SERIAL_SB1250_DUART_CONSOLE
 config SERIAL_ATMEL
 	bool "AT91 on-chip serial port support"
 	depends on COMMON_CLK
-	depends on ARCH_AT91 || COMPILE_TEST
+	depends on ARCH_AT91 || ARCH_LAN969X ||COMPILE_TEST
 	select SERIAL_CORE
 	select SERIAL_MCTRL_GPIO if GPIOLIB
 	select MFD_AT91_USART
-- 
2.47.0

