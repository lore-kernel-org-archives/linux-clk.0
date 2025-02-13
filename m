Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779BE28A2B3;
	Thu, 13 Feb 2025 17:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739467518; cv=none; b=IACADfDJFgeK8pRMRnoD+wtWF8kmAw2A7bcI3jbEt/GgCFiUGUQJnD056HNj5F26mp+Ks/9d1iQKQTUVY9ftLheVkkPsKyzv1cThTleFE7Ij67t8z0T2JlnRS+jyzg581KVHswuSxNtDTsm145BmS1fUo5niH6yalw3H0jUxYq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739467518; c=relaxed/simple;
	bh=cxgqBBUoA1RW4v6AqkYWBEmaS/cKXUa9UzQ+tQnDnKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NQ1Ou9Lzi683aHJWjFUfYXQIKZbp6HzpT0tnF06c4INRQSkGNSdFxIRtYO7IM3TmwqD2YR9jIK9riRlmNHgNhb7SBeBA0QWVycXj7MK6tC2gQxzvp7MDO2oAl6iwDisAkiCDs6+dfJR2EPqQp8SEbOL42KgaZd40lW2Je5qykKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S3SJVK48; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S3SJVK48"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-726f989dc12so615053a34.0;
        Thu, 13 Feb 2025 09:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739467515; x=1740072315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=At0hIh6d9YHwPFv0kdC9x7LYgvuthrASy9cIAbH2c7M=;
        b=S3SJVK48WSwIAE+NxHCMmo58KaMteC5vG/iijJbzKYqmP6nvhaekmZq+lF+5beCF4Y
         jcNqGtqo25Kyyl5mB6l5XyJsqgYXIc48mXuqb36SOTp9V4KI9VjAsubBGsOLxulzrUPI
         Y5p6tSplmHnky5/Hv2tDncl2/+O9mJ5O3tikcoRPFZrbJBoUc7ILs4bac28ExfaJOnRN
         NLARs0SEe+qxl9d8+hdGwYeGDeHNRjEefos/euCN6MJBSlV4WlO6dqYl5qKUdd3j0ayl
         5Q0Cm+kd6pst1vmDesTH8fuolXB2bmOUoZJkHgWKB4NbKvP8VBVe2+4IcdqM+/qKnbAA
         olnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739467515; x=1740072315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=At0hIh6d9YHwPFv0kdC9x7LYgvuthrASy9cIAbH2c7M=;
        b=X0omq2TE6hqy9Vlh8+quOLvzhNHjFDzi1QGCVfR3kAU82eQFpNe8N0tp7nB0RK3n4J
         Y+lz+BfSyoqdPjK2Qlt4/TeN5S5RgOgZznw5tK7+4OErJIhKTBOL3/EslaRSrnIwtdWC
         S2LQN9AxJnKnMNvz5imFJxMKUG22ejt7b/ZC3wzJY79t1be9WaWjqmCchn6ctKK8qQ58
         bIcjZgy0fNahWMOs4hM5pYxspzwLN6Z/DRIto8nw9D6iDKyQ/WwKRSLrxrxGtsvKmGej
         kt9QOL1XglAKJXCh2h0d3QYxJc7rHWx3S8nGUF1GY8Q9KQ9Hwz4yzNey8qitU+guq4h6
         kZdg==
X-Forwarded-Encrypted: i=1; AJvYcCXNHyfuE62URRzMl9w+8nlyTOzQwUzsf9awuv3UyDlUWKLmw0xQmvH2J14n7yRs7Wb+9iPi1ZSyWcI=@vger.kernel.org
X-Gm-Message-State: AOJu0YznzMwmsdL7zYtOeEaTlFuBRtJwjQGtPqfMQJZFF4habra+47wi
	dx7Fd2mj24DFUXn3X/nB5v/EKzTJRJcFpxerePy1fBUnvyj9rI6P
X-Gm-Gg: ASbGncv3mAkhuua9vnMGemrQ0nqz2nPXCr9ZHVwd3bxfnOMt7Djon7f/kPSXMwHoaRj
	/oESe5ujdNeexfe47UMJKlf6/8nv6eFCOjfrdvTz39uOXaDMb0+x4MSADpXQFlUZ8vYJ+74foNl
	CSEH0HaBURgLV/DXhluIGrjVznTCB+XayMvrYbsTupDyaptycOSqglU5XHRTLutzw++5xCDq+vj
	Pls26S1AyeTaGKDDqCAsuwh4KREQpCS33Ut7ieEUblsBbvlyemKKm7wNd0VE6khR4QdptE9S7ka
	CRdA70qtJZ9i11HCKhDxUBWMDHUlNviDBBA=
X-Google-Smtp-Source: AGHT+IGy8Wm3TFQxFTy0vlN58zUI1YysrkEHI0sYL3AEPsSU8xnt2fKFb2VeDGT7QQG24DcP92h/8w==
X-Received: by 2002:a05:6830:608b:b0:726:ee0c:57dd with SMTP id 46e09a7af769-726fe80318dmr2637138a34.28.1739467515249;
        Thu, 13 Feb 2025 09:25:15 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:2d58:1e06:61bd:218e])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fcb155b77dsm680358eaf.0.2025.02.13.09.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 09:25:14 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	p.zabel@pengutronix.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	sboyd@kernel.org,
	mturquette@baylibre.com,
	ryan@testtoast.com,
	Chris Morgan <macromorgan@hotmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH V2 1/2] dt-bindings: clock: sun50i-h616-ccu: Add LCD TCON clk and reset
Date: Thu, 13 Feb 2025 11:22:47 -0600
Message-ID: <20250213172248.158447-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250213172248.158447-1-macroalpha82@gmail.com>
References: <20250213172248.158447-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add the required clock and reset bindings for the LCD TCON.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 include/dt-bindings/clock/sun50i-h616-ccu.h | 4 ++++
 include/dt-bindings/reset/sun50i-h616-ccu.h | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/include/dt-bindings/clock/sun50i-h616-ccu.h b/include/dt-bindings/clock/sun50i-h616-ccu.h
index ebb146ab7f8c..6889405f9fec 100644
--- a/include/dt-bindings/clock/sun50i-h616-ccu.h
+++ b/include/dt-bindings/clock/sun50i-h616-ccu.h
@@ -113,5 +113,9 @@
 #define CLK_BUS_HDCP		127
 #define CLK_PLL_SYSTEM_32K	128
 #define CLK_BUS_GPADC		129
+#define CLK_TCON_LCD0		130
+#define CLK_BUS_TCON_LCD0	131
+#define CLK_TCON_LCD1		132
+#define CLK_BUS_TCON_LCD1	133
 
 #endif /* _DT_BINDINGS_CLK_SUN50I_H616_H_ */
diff --git a/include/dt-bindings/reset/sun50i-h616-ccu.h b/include/dt-bindings/reset/sun50i-h616-ccu.h
index ed177c04afdd..81b1eba2a7f7 100644
--- a/include/dt-bindings/reset/sun50i-h616-ccu.h
+++ b/include/dt-bindings/reset/sun50i-h616-ccu.h
@@ -67,5 +67,7 @@
 #define RST_BUS_HDCP		58
 #define RST_BUS_KEYADC		59
 #define RST_BUS_GPADC		60
+#define RST_BUS_TCON_LCD0	61
+#define RST_BUS_TCON_LCD1	62
 
 #endif /* _DT_BINDINGS_RESET_SUN50I_H616_H_ */
-- 
2.43.0

