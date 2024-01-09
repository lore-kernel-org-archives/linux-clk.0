Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41ECC39FD5
	for <linux-clk@vger.kernel.org>; Tue,  9 Jan 2024 12:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XmA0cchq"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-33677fb38a3so3028673f8f.0
        for <linux-clk@vger.kernel.org>; Tue, 09 Jan 2024 04:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704805117; x=1705409917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76U22CGER4KqXBDXUKva048KHZBhjzcIPjnq3/iJdsQ=;
        b=XmA0cchqPso2PFLQlH5YpMaKpq58JiSdBnh4J38xOhs6Yte1HG+LPPk/0GfgNa1AKc
         htRSK1DRHfwSP0ZbiAqkM29mMt8cXxQ/hzEac2ThT93kyjbJWtVMtcDmGqDuGu0lYL8C
         N92Q0eVcqF5F84i6nY9giWfg5sOWlLtqe9clSZbMr2vF/AgZbAI1b59YitA/0fNTSd55
         /ErjveA+lOaocoAyPClasFUNGVNSG+vK6ywKTymv0NQsrJfWWlAYAKEabcTov5ICilFR
         VHGMF0BFmX1vkEqTmtVk+I+u3lzhGGk/Jb8DiJtFHNK1BAbpgFb2rLLxWwkQa+AhA288
         EKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704805117; x=1705409917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=76U22CGER4KqXBDXUKva048KHZBhjzcIPjnq3/iJdsQ=;
        b=rTKAUnoCKO7t1CrOCN1Nf8Jr/rYgogj8NrEG7gZinKhGzQpKotPSvNzBW/9xKZPhcJ
         Smsm2xYJoCXeqd0zqLmvPGKu/kgEnUiPkSqH++dioUs+o+YhPwLqM+8jC9zu3f9U7oSZ
         TI+hW2766NXaUBpTNF/OQ8FG8aXvlN2A8li5rxJDwY4N4jEyXV5HnpNrALapGtLwkNDO
         YG2KnAOCCtLe3dKtjUGvtCPvso90LkjDv5fQUswtXJeLTZrrVOnHQ3ufl7/slGEs4fXn
         WZFdlcD6YmIMg4AHKb1ERddS/wR01raTWNLkzS+S5zURxQBJnG1RvVq4+nswPJ+vrHQj
         ifXw==
X-Gm-Message-State: AOJu0Yx6qwF96r7QG9gdjzcJEwGa8AToUhCe/PzYBrA+XWP0xD2mFoec
	VzgwLqQWJcAp3L1i4Wb4W3TpfdoCISfMgg==
X-Google-Smtp-Source: AGHT+IGfTVOxZ1Ho2+dMSFGhcbHn85rCRhUsxpYmob34IB77B2T6ZjXcPLNi8PrEkA4cKi8r5HQUrw==
X-Received: by 2002:a5d:614d:0:b0:336:8d4f:6b1b with SMTP id y13-20020a5d614d000000b003368d4f6b1bmr443504wrt.131.1704805117683;
        Tue, 09 Jan 2024 04:58:37 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id cw16-20020a056000091000b0033753a61e96sm2351302wrb.108.2024.01.09.04.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 04:58:36 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peter.griffin@linaro.org,
	krzysztof.kozlowski+dt@linaro.org,
	gregkh@linuxfoundation.org
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	conor+dt@kernel.org,
	andi.shyti@kernel.org,
	alim.akhtar@samsung.com,
	jirislaby@kernel.org,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-serial@vger.kernel.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 06/12] tty: serial: samsung: add gs101 earlycon support
Date: Tue,  9 Jan 2024 12:58:08 +0000
Message-ID: <20240109125814.3691033-7-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20240109125814.3691033-1-tudor.ambarus@linaro.org>
References: <20240109125814.3691033-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The entire bus (PERIC) on which the GS101 serial resides only allows
32-bit register accesses. The reg-io-width dt property is disallowed
for the "google,gs101-uart" compatible and instead the iotype is
inferred from the compatible. Always set UPIO_MEM32 iotype for the
gs101 earlycon.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
v3: collect Peter's R-b tag
v2: update commit message

 drivers/tty/serial/samsung_tty.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index a81b61953a28..fed50423b7c1 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -2812,6 +2812,17 @@ OF_EARLYCON_DECLARE(exynos4210, "samsung,exynos4210-uart",
 OF_EARLYCON_DECLARE(artpec8, "axis,artpec8-uart",
 			s5pv210_early_console_setup);
 
+static int __init gs101_early_console_setup(struct earlycon_device *device,
+					    const char *opt)
+{
+	/* gs101 always expects MMIO32 register accesses. */
+	device->port.iotype = UPIO_MEM32;
+
+	return s5pv210_early_console_setup(device, opt);
+}
+
+OF_EARLYCON_DECLARE(gs101, "google,gs101-uart", gs101_early_console_setup);
+
 /* Apple S5L */
 static int __init apple_s5l_early_console_setup(struct earlycon_device *device,
 						const char *opt)
-- 
2.43.0.472.g3155946c3a-goog

