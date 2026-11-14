Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794699758;
	b=Z+W7LQOgpDQKKCfT4pC77otkieuKnqi4Xz2dV2Z/KeeMlj1NyovQqtG1gz2syDxRaLwX
	 FMLyJFZ3GV1x6f7J3r5j3f5zBWhDz0Oz4QmqzxcjvirE9w4gOz9/18f81z+Y6qpX3rrFb
	 jlxBETm9GU9JS/OW4K1RS2aCIkWwx6vpmq8eB3ytp1Kk4aca5w7eOu220Xd7BO0Ut5eyR
	 ai4MQqxtrF6Z7KTHJzjr2SghIOoBvZsW8MUXGlHyKRnUAOiSon/BDJNeCeZzOQKhil4O/
	 q9XM5HhjHd4x5e9QMa++bs2bjx7jcFaCmmQHwXj2Xb7H3B/2expM0FFn3UBRJTnejLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794699758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=W084RD0vMitsWt5r0GlWYVXrFKNwmQsR+8dQtTFBHCQ=;
	b=sgDh0sc+Fv2n0FWyw1WqFGxQRkoOgEM5BFR4kDsspeMj1mOFNJfdck5qUl9viGjllDfm
	 ktV4T1g23oQUeYbN0i0YUF3RRnio7wiYvm+dbnbpilBixY03pnQUoZlQdn1gtXrh5L/Yf
	 L+Rf+NwTi5EOX0vhvEPlZNiZKqMQiuOBe74AQendSp8JdKw5SGpGpGYpuOyJEIGM0qZRZ
	 KKdv+eyRFg5rS6lv/5lOf9VH9BQiFz6XZoj73D+ig+0kW+ar2fGxcZqfmuZMQ6bw90b1T
	 xC15NtkiAT70S/KmstAJJypkVoaYRlVvFeQRTKVUYZN4cOVLfZ4ApcoTnthv9BRhgBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DG9s3d33;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFE9606A893
	for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2026 23:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DFE9606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DG9s3d33
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so1183642a91.1
        for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2026 15:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794699758; x=1795304558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W084RD0vMitsWt5r0GlWYVXrFKNwmQsR+8dQtTFBHCQ=;
        b=DG9s3d33XVxFHN9OdMlrQizyH32SS28Z0pjRS/Vx64SZvizFw6a98TZcj6jr/GpZyO
         8uPe/AWMPFNzKqXlD5TITgeGVM+O+sIWE3iqRgVgg0S67t6iwcRsGaqtqEcZ5FguqgA7
         Wt12nhYnQ4MbDAljt0rcO72ySodvZep5pIIbMTHWiXTGImaxQX/tj0//q76hbSqEg9Ei
         UQv+2N78i4sR4DCryexyX1Of+9VvuZak0/t2moqY7KxYLpGPUbj0v9H0PNoG8vDs6I2V
         lyS2V4pPgb3Xfi4ccuaKjDUEpY01+FNK8teUEXpRE9bntEZe1uYg6UNTJcJAr8rfzj+X
         oPkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794699758; x=1795304558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W084RD0vMitsWt5r0GlWYVXrFKNwmQsR+8dQtTFBHCQ=;
        b=fLeOC3G7rhDyguuLDNfZIJzmmTOFlVKwD5nAUYQQLu2LkyIZXid7/5oD472C5MdPwt
         qKICkS379Vr36kvirftWg03EFlYra944fsdYQhoMlLGqq1ms6Mj0hpb1PqdwD8diU5/Y
         985t7MEedd2xvv0xNiyN67nK8O8ZNiCpvR74teiKElL4AxppxDR96NTQj6cLaG39NqkC
         3jln5QCc1QDCWaJaIxkWWXJikhHCOnDkLm5F5K/qTdirvuDEtsk77YvZeqJx4XS5qU6S
         eK5Fjxa6ZFWDtVTbH805GSJ00BwB7Pr4wOxTnGKtjyFLydmHjsI92OAT4sITcXHS07OS
         pL3Q==
X-Forwarded-Encrypted: i=1; AL+hErF7W9G/PB4hDb7nVr1Mu0/oZwjoj7g8KKI/hPO7Njx/aAmMe9YY0boz0MI6oKiruDuQWIHAf0rNxlE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pYFbOle5LwnbZjH9LBt9s/atLViToHPPBAHxnejdJTPni+i+e
	uQztmk56ivkYizgJntj/HW4YVYWpW8SUb1T1mB+ZU5GcBnxfsvrCevbM
X-Gm-Gg: AYBFou1TmAMzi6REErtz44CiVrGt94TcKOng/Akc3gB7n+h4+5sCigxMkpHT2YEIGZO
	WnAIFZhiEvpsB/QJd4EL/r+X/84i28Ig261JsRBEEMZ1lU1Os56HGm/9Vob8yITYS4wwtE+46qz
	Qv77v/4Zosx2j7V2Uw3/ixsR++GkfGiYUE0CEvgNM93mV2rBQrWsUUMmHQ+H3VXXkuKV1tpo7+O
	uc6vYnqPuFZFoYq8mDZ+lj0H9HEzheTJxrSJZgA0is6PB1G8a/cmVfSoU7yUM3ZiFkn0yu7mpa0
	Ksho3xFejRYl9M3JfcxKNi9ntm3GzCzj5NcBvaU1G1fqEUIwpCz8LJbeXpTBfAyDPE3ptYP5YKg
	J7iUuJwSqsHFJa+qbz0HSjxgMkaVTbhbWqivA1TtWQmeO7W7cIXa6Ra7Qgz4vLIW77d+3GcYg27
	rPkAG2BWR5BsvZQaJRivZIxDIWBuvTiyFMHOpGl4UG3sT5zptSO5vXd80H7iDVYVsxwLYxoMbBB
	MYE9oB0GL/ws9+iaWW8mHa6P9Gw0BUJYG7MVsnHf8WpKJIqvMvYZWo1+joYXyNTixMgtjwoEPUD
	SX7e+kP0jk5zZOnGtm1vI+J0v/6Vzq42RxJUaXOJuIPremzk9QFq3mEpqHgGG16L7xenF7HM6Ig
	yFrOTHicSvClQ8fXrnWPCH2R/Q2YRjTIlln/yFvySlpGBb0+Iz/P2rOgGksGfeChAs2EJXlIB8B
	HjNg==
X-Received: by 2002:a17:90b:39ab:b0:3ae:8410:ae6a with SMTP id 98e67ed59e1d1-3b1b0a1eec0mr6608862a91.22.1794699757612;
        Sat, 14 Nov 2026 15:42:37 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d04336sm15755574a91.7.2026.11.14.15.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 15:42:37 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alban Bedel <albeu@free.fr>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 3/7] MIPS: ath79: stop using ATH79_CLK_END
Date: Sat, 14 Nov 2026 15:42:18 -0800
Message-ID: <20261114234222.88337-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114234222.88337-1-rosenp@gmail.com>
References: <20261114234222.88337-1-rosenp@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ATH79_CLK_END counts the clocks in the dt-bindings header, which means
it has to change whenever a clock is added, but it is not part of the
ABI. Size the clock table from the IDs that the clock code uses
instead, so the define can be dropped from the header.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/ath79/clock.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/mips/ath79/clock.c b/arch/mips/ath79/clock.c
index 6a8bef782186..55d8ef8c1c8c 100644
--- a/arch/mips/ath79/clock.c
+++ b/arch/mips/ath79/clock.c
@@ -25,13 +25,15 @@
 #include <asm/mach-ath79/ar71xx_regs.h>
 #include "common.h"
 
-static struct clk *clks[ATH79_CLK_END];
+#define ATH79_CLK_NUM	(ATH79_CLK_MDIO + 1)
+
+static struct clk *clks[ATH79_CLK_NUM];
 static struct clk_onecell_data clk_data = {
 	.clks = clks,
 	.clk_num = ARRAY_SIZE(clks),
 };
 
-static const char * const clk_names[ATH79_CLK_END] = {
+static const char * const clk_names[ATH79_CLK_NUM] = {
 	[ATH79_CLK_CPU] = "cpu",
 	[ATH79_CLK_DDR] = "ddr",
 	[ATH79_CLK_AHB] = "ahb",
-- 
2.56.1

