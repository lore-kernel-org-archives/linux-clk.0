Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TYWNqwaN"
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09CC7171B
	for <linux-clk@vger.kernel.org>; Fri,  1 Dec 2023 08:11:05 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40838915cecso21927265e9.2
        for <linux-clk@vger.kernel.org>; Fri, 01 Dec 2023 08:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701447063; x=1702051863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvFQqh83XDxX334cnnEsbE/4STBhqnMnZDTYflOVgq4=;
        b=TYWNqwaNUdnvcWT5r5g8CQgLskPSkgqlOR9yDkn9Qeb4rLOYc41dI7o+vlYrBYARM9
         bk0IBwWiOVdwEO/V9TOBivUSCK5zj+qYCCeGAgZjHBiDpLGKq8g7e0TXi7On0LyYRxRS
         YOWyf0HcI8JX0VVZMPfbMlg6/LmMYnxEXY2I3R8zexWPLK5z2sGh8vPA+RCw4mbWD4V0
         79TLBR0gY7bjFZtw1z3GYUra8pcXOvYvK65y5HUPY7Q1X8IqFYoN75IxZjXXXkpvmBSc
         99RYzCF0saxY1u7rAWEzlT9LwryrqezIM6WsoAWuNgn/J3wZVQOsrZORW5lDaIB8DSur
         l5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701447063; x=1702051863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvFQqh83XDxX334cnnEsbE/4STBhqnMnZDTYflOVgq4=;
        b=Uxr0QTJ3VKlff3WdVJAuTInf84RITiersVX3LzcZP+IE26zdAT++F/H41vsz4pHpww
         pegP+Pwp0GvE4qf2Qd8cYiQFzsekuYi+NrEXWL4SFtrYpcSb1A9HXfWp/MYQ2cSeu0y0
         YgQiObFtfn8pH0Djo5ZGXRZ9Txh7MfmyzR0MoYlR3xDKDbt0pxlJBUEPISCjrYARCBRW
         DB0T+5YVdQnP3OFX/G8MeBZjaIe2W25PQCiDbMhfpCB2DIojx5gi5HmxVwGchE4q26qX
         ENlng1+WIjGpCU5j9KrsSSXKQQkb4NNQFwMW/u7Soa1ws1Wxw2wzT1I/Iw62LKykI3NG
         FKgA==
X-Gm-Message-State: AOJu0YyDWqDQkTjTx8Xtv87E6nyC3Fwnz5k+mH/SsXvY4oeQUjSGCD8f
	mzshGH9bjCpPvnwMQI5sAcjRfA==
X-Google-Smtp-Source: AGHT+IGYzvD8BiSPCDF/ykP8FROhBDF7hWyIECBH3X3/miehAsBGVDoFGSiPYaol+fTU7lwN6mAFTg==
X-Received: by 2002:a05:600c:20d:b0:40b:5e59:da89 with SMTP id 13-20020a05600c020d00b0040b5e59da89mr512152wmi.156.1701447063565;
        Fri, 01 Dec 2023 08:11:03 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id cg16-20020a5d5cd0000000b003332656cd73sm3907386wrb.105.2023.12.01.08.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 08:11:02 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	conor+dt@kernel.org,
	sboyd@kernel.org,
	tomasz.figa@gmail.com,
	s.nawrocki@samsung.com,
	linus.walleij@linaro.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com
Cc: peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	kernel-team@android.com,
	linux-serial@vger.kernel.org
Subject: [PATCH v5 10/20] dt-bindings: soc: samsung: usi: add google,gs101-usi compatible
Date: Fri,  1 Dec 2023 16:09:15 +0000
Message-ID: <20231201160925.3136868-11-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231201160925.3136868-1-peter.griffin@linaro.org>
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tudor Ambarus <tudor.ambarus@linaro.org>

Add google,gs101-usi dedicated compatible for representing USI of Google
GS101 SoC.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
index 61be1f2ddbe7..a10a438d89f0 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
@@ -28,6 +28,9 @@ properties:
               - samsung,exynosautov9-usi
               - samsung,exynosautov920-usi
           - const: samsung,exynos850-usi
+      - items:
+          - const: google,gs101-usi
+          - const: samsung,exynos850-usi
       - enum:
           - samsung,exynos850-usi
 
-- 
2.43.0.rc2.451.g8631bc7472-goog

