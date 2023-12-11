Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oBZ+QKFn"
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A64EB123
	for <linux-clk@vger.kernel.org>; Mon, 11 Dec 2023 08:24:31 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40c25973988so49267405e9.2
        for <linux-clk@vger.kernel.org>; Mon, 11 Dec 2023 08:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702311870; x=1702916670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZDDirj6oE74DYjeFThqKliMdW5Crzi8BOjdGcSc3/xA=;
        b=oBZ+QKFnk4A7O/CkudKBC+gsdJhp5MJdc2GbBtqLk1E5ylbsCqp4M/UZzv1aBblJqx
         IMdcZsZLQNKVlrFvX37ETBOlW7kxLo/VqNVN+RpZt0OgZ7cS6/LhkjvRXmd/z9QOA6XX
         lSZKKkSChTeNT6yw82F/K8q5Of/IPsIE525C2J5APAfMPrijaAtyJhHLKbEyJX3S4z/9
         qSF+w2QmkxshCcvpiArIv7Ij0f0ACi2yAX63hKwnwAfMM8WZDKTrxuTSNlgDzMf75+VB
         8H0KWH7LHYqo/uhjC+QzpKhzpqKiMT8NPybbSSDif0lsvVzsCtkbFDLprPeA+l/wWf7l
         M5Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702311870; x=1702916670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZDDirj6oE74DYjeFThqKliMdW5Crzi8BOjdGcSc3/xA=;
        b=JDNTXcpF+0LCRD15a066m9N387L4fWRdSuUWi7KJnmr+fXi/VOjiesgEIyFnsXo69f
         b6XFtJFeZdN0xY0y3VFPOchwnY4kbFB8eEJ81tnJ8cuTX4k2UdiFs8vRSl06hR3eoR5R
         s2xa5uEH9ix5mgJqlvrrQKup5YR2o+IJLa5kwkykolSp5ae/QiseteBNRKSracYv/O3v
         YrixevuyspoRM67Zf1WK/k7ENdBbMYhNOLrw9I3YZNU8i+lColEwi/p2EBY7HRQHuGm/
         bqKl6q23GGWZR0K9JIMKgwr52hq2J0uXyd/meXwUHJnY26kFA60Kp3ukbeRnlVdvTHMb
         evPQ==
X-Gm-Message-State: AOJu0YzljkKKndwEbBwaDEJMIzb/VSjUQWMYUhIxv3pNdpO2KkPmwHsW
	5fmuQNG+aAaya6DJ/B6TJB7Pzg==
X-Google-Smtp-Source: AGHT+IEAmbAul6ZrpXg2twzLckxDam20V+qQFqTsLJY9Hw6C2Df9rmcAE5tB+Ru7HFpc1ZGE1jzsyw==
X-Received: by 2002:a7b:c4c6:0:b0:40c:2766:5424 with SMTP id g6-20020a7bc4c6000000b0040c27665424mr2453843wmk.171.1702311869976;
        Mon, 11 Dec 2023 08:24:29 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-28-58.as13285.net. [92.29.28.58])
        by smtp.gmail.com with ESMTPSA id o4-20020a5d58c4000000b0033333bee379sm8923103wrf.107.2023.12.11.08.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 08:24:29 -0800 (PST)
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
Subject: [PATCH v7 11/16] watchdog: s3c2410_wdt: Update QUIRK macros to use BIT macro
Date: Mon, 11 Dec 2023 16:23:26 +0000
Message-ID: <20231211162331.435900-12-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231211162331.435900-1-peter.griffin@linaro.org>
References: <20231211162331.435900-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the remaining QUIRK macros to use the BIT macro.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/watchdog/s3c2410_wdt.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 7ecb762a371d..b7a03668f743 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -107,11 +107,11 @@
  * DBGACK_MASK bit disables the watchdog outputs when the SoC is in debug mode.
  * Debug mode is determined by the DBGACK CPU signal.
  */
-#define QUIRK_HAS_WTCLRINT_REG			(1 << 0)
-#define QUIRK_HAS_PMU_MASK_RESET		(1 << 1)
-#define QUIRK_HAS_PMU_RST_STAT			(1 << 2)
-#define QUIRK_HAS_PMU_AUTO_DISABLE		(1 << 3)
-#define QUIRK_HAS_PMU_CNT_EN			(1 << 4)
+#define QUIRK_HAS_WTCLRINT_REG			BIT(0)
+#define QUIRK_HAS_PMU_MASK_RESET		BIT(1)
+#define QUIRK_HAS_PMU_RST_STAT			BIT(2)
+#define QUIRK_HAS_PMU_AUTO_DISABLE		BIT(3)
+#define QUIRK_HAS_PMU_CNT_EN			BIT(4)
 #define QUIRK_HAS_DBGACK_BIT			BIT(5)
 
 /* These quirks require that we have a PMU register map */
-- 
2.43.0.472.g3155946c3a-goog

