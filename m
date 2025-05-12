Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59681DB125
	for <linux-clk@vger.kernel.org>; Mon, 12 May 2025 14:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747060019; cv=none; b=kDLg4VhUhYAB4hTTUSDB6Oy0J/JXFZo9MqMEb0o7G8HIRP5MtPwAs1AqzXKsqUfjcOdkWPjFNF6m+E6S1sINM7K9TbG4z9DmdYS/ilBDNWIXYet/KGoPbpra+s+rDLXHJCwSswV11t3jv/P2YRg0r3g3JtGXHbaB4znGryvwd+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747060019; c=relaxed/simple;
	bh=6T2kDON1dhsNnU+XjIY2oPcsXbHsrN2ApoTFS8oDyVs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dCSOQOp6JABl+3bQD7JS9tRP1V+aGAqBUUh/6b3u5zclP1YhAN67YziRUQXz3gXyc/1DTpRgUWM4cJNnW2g8hDA7uRp+8QTULyxNCZ49UMJn5wsP82xH1ivLjxb/6tIl3oKSRkfTSYTQIFXSQXFUVWbXCyvgAWDIWftU4kxlSUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=libre.computer; spf=none smtp.mailfrom=libretech.co; dkim=pass (2048-bit key) header.d=libre.computer header.i=@libre.computer header.b=XKPL7R/Z; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=libre.computer
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=libretech.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=libre.computer header.i=@libre.computer header.b="XKPL7R/Z"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6f0c30a1cf8so78298386d6.2
        for <linux-clk@vger.kernel.org>; Mon, 12 May 2025 07:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1747060015; x=1747664815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RKMd5G0cFDMucPOpi+tWbuy3t/lyFnn71icIWCgXypM=;
        b=XKPL7R/ZhanEz962li/zfhA6mK3Kl4Wt4vgXw4oWSqjQdvTjwsg1UByr6HxxrH+HEK
         78lp9LNx4oZxILKw/eBgl2TF4mK8j5WtEXf1h4EY0c07yNDTkyJRK145B/Sm84JkTMFc
         h9fNZ7BrufrfHJdbkFPb1MX+40dPVKMUNPEKr9sGKC466AQRDO2MsJaohVgdnbvIeB2W
         EFJjgTG/CB2DXl6m14GG6uot9gOkQvg050Yfnydg+o75fcpufAAO/J3yJROqdUUTA6H7
         nDODuaXp4gm/AKOVdi3zoGF98PBqmAbPg+IPi01j9ZUcCRuc8CcsbsGXtD4Pikh5TOsa
         tgNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747060015; x=1747664815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RKMd5G0cFDMucPOpi+tWbuy3t/lyFnn71icIWCgXypM=;
        b=A8hR1zoP5cd70/xteF9wpb4NoPSG5hzIjVDQydi0JNhQFFRQ8UOu0dpU4a1B9ip43Z
         tHz4lKJgdzG9PU4hU2247aBL4MY0OT+iN87BrTLhfxKvyxpDmhf6Kegas5xRQQPvScqg
         kinqxmBhE5f2dQ6WxG2W6cIDHiiUsEwUpfrs+KAXMWZq8QB33UTFZnJYBvan4/xl3kJp
         xpf0ENKNO7wKL6agUOW+XHKBn9AihVNEJweK11TwmVAMqe//xSz6Ev0PVJHnJW3JOfei
         tBH4LIL2XX3mI/FU/7bwg3vvj/s5+Xmw8RRO4wdk98nIAq3w6vRhW7CX3F7HCg7/ww0m
         Imaw==
X-Forwarded-Encrypted: i=1; AJvYcCUSXKs/g4dJjIzn82p7+06DTSyNiioy89WcpJ/3wVFQgCaGNzQZ7Xp5ycbDbBJnOuv/WrWrdEJ3ips=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMDmF5U6u0v+RyyHOok9IhjB5WLxOwha0n5sAnluwQsav44cln
	0oQeLyvSGzL6+u/hA2QdZvFBqx3ZRcJbFvQtFwHaYpDNc4d7E4rV53IxMDZNHA==
X-Gm-Gg: ASbGnctX0x2SFr8LpSAeMEIRLzrXX3iL0usuMVNEFyD6elKw/f0WLERDe51uzGttB+K
	gGU7J8dgRfumVbsnYN/PkWb++6x3dNp7M//u5wkTm0WDxwfPJwHGCfU9gSJmgjEGYUSr4VBkpMA
	I70AJgeOXZprYd7cpXjKHoJKDNp9AorJN/77hYHsNyjHa8H+f3rXd8Jz36cmhpoQ4JffBIuhYxY
	zQ2rErBTnZH7LXSSIriZgngFNEudGXrvPpzirtkrb6YrNLe4Gl3S0TlrDERxdbnm+rRoRG15c6U
	D4Qw27FwueuVs7lkdfWjuJsaS5ea9Ym8S4v0Yi+cxzvWZq5/
X-Google-Smtp-Source: AGHT+IHwLWxHT8fQlj2kksRDBg+A0JhtXKo+AreGOwt+ETP5hLx/Dy37l3apsuA9OkV+nl0kGKBq4w==
X-Received: by 2002:a05:6214:300e:b0:6cb:ee08:c1e8 with SMTP id 6a1803df08f44-6f6e47fa918mr229336596d6.23.1747060013390;
        Mon, 12 May 2025 07:26:53 -0700 (PDT)
Received: from localhost ([2607:fb91:214c:42a4:3793:dd95:dfa1:719a])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f6e393df31sm53362726d6.0.2025.05.12.07.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 07:26:53 -0700 (PDT)
From: Da Xue <da@libre.computer>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Da Xue <da@libre.computer>,
	stable@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] clk: meson-g12a: add missing fclk_div2 to spicc
Date: Mon, 12 May 2025 10:26:16 -0400
Message-Id: <20250512142617.2175291-1-da@libre.computer>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SPICC is missing fclk_div2 which causes the spicc module to output sclk at
2.5x the expected rate. Adding the missing fclk_div2 resolves this.

Fixes: a18c8e0b7697 ("clk: meson: g12a: add support for the SPICC SCLK Source clocks")
Cc: <stable@vger.kernel.org> # 6.1
Signed-off-by: Da Xue <da@libre.computer>
---
Changelog:

v2 -> v3: remove gp0
v1 -> v2: add Fixes as an older version of the patch was sent as v1
---
 drivers/clk/meson/g12a.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 4f92b83965d5a..b72eebd0fa474 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -4099,6 +4099,7 @@ static const struct clk_parent_data spicc_sclk_parent_data[] = {
 	{ .hw = &g12a_clk81.hw },
 	{ .hw = &g12a_fclk_div4.hw },
 	{ .hw = &g12a_fclk_div3.hw },
+	{ .hw = &g12a_fclk_div2.hw },
 	{ .hw = &g12a_fclk_div5.hw },
 	{ .hw = &g12a_fclk_div7.hw },
 };
-- 
2.39.5

