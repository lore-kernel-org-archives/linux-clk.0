Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C4022129F
	for <linux-clk@vger.kernel.org>; Mon,  9 Jun 2025 20:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749499708; cv=none; b=sOOPuD7Sx5Is6fl/BL+1Ne0baDVk28F9XqVkYUSYY1iFl3pDbKwk7d7p+EHTl7gb/JbZo20Z3PeoH0+wE7PYLo+MpMs8ClGCt/DFmTjAL2ZSKxlKVRLy4UMAKsmG4FgAi4dcGDnJruNG80fzC21/BNJ3pOi0VAun7AF9C3RqvCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749499708; c=relaxed/simple;
	bh=5col7cyjORVDpBjeMZhgvIznfmZtb6RKuoV4CGQF4zE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N7aTacsVWfobacKqdONEBf82ucBU9YAxvXzbfGRFI6VjdJ93intJx/uBaM5mqzLCnHvi0cvv60PaHiBoQpvPbtACxzpg6BiP97B7THA3ZTI0MRaGcq45cZkh8cUWuOVs7jnAwXUAKMl32r3akkif4XgqgWY6TzgsifuroCafqpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=1xQWsPbL; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="1xQWsPbL"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7d0976776dcso446345485a.2
        for <linux-clk@vger.kernel.org>; Mon, 09 Jun 2025 13:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749499706; x=1750104506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hXZOtes7v+x/7Gb9DsK5r+A9Wyuu/k4Jt+Vsyyna0xw=;
        b=1xQWsPbL7P8N9EmE6n3gdLajrRrmH7qwkV8o3pHI6+215swv7e27kb/7QAxW92YU2u
         QFLjpYvW8YUksJDknPsNst31FelRsgzIPV216vtxxHiXwlC0uQf0d9dryOcJWMevNUz4
         0ni8HSwAdms7dy4+cc6yR0ooy3puSxk2GE75t1uGiHzWWX1YeNecckGg+C9jnCEdrysO
         jZWdxjirMMOZMUVWhZxHjMU550baAwn2PGI8zLbqskNVJOgg0qpaQBgV2/rjQTu8e+m3
         WybAIj/OXSBItCZze2Uj9pGe38/4CZPJwQPdeItqvIb9KRXiSixWOhkieUpU+POwvla/
         N34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749499706; x=1750104506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hXZOtes7v+x/7Gb9DsK5r+A9Wyuu/k4Jt+Vsyyna0xw=;
        b=RF6nm9sqvCa/0krM/wYb/YINgtHj7vzTPzi5DkJn2MD7ZIERGrzOzw7pMHyCYGZfzP
         aQU80B3pIXRpRAeQoTCokgNJdoGLFA8J+SEjjH5J8fR1tEky/T1ZDOAch8yXSwd9CIpb
         2YK5XqIB/nOQSiki6P8iU8SEGEJVJyyfZQ1964ziTFtygeMlV9uXLA5kcJ0D0BcsP5+N
         ya5A6YUzyPXrBBs9oZg4Y2gVElR4KFI6CFEBU0RlVhXmK6VqZ/eLhieM4HklC+Lz18NE
         8nleqRRIfMg1YrdYk73c3+fSWMkb+2Xfuxet+JtEfrvqem8Tytjmgrx8EpBRWRUrRTv4
         Q/hA==
X-Forwarded-Encrypted: i=1; AJvYcCWHWDfQWMTLuye1vVZFWiq6pz0Axm+ItP9zjWsgde5iPvu4IRmzvJdlvVXAnxDwrHRvLIUOv4v/jxc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yziz9LFuKr7tDOtIQgxcTFl3V+bb4gIazzMVb+mZY2R2n7bDw0w
	39tX0uObNKcZd70/eGG9H/XTgcpzUCQI6qO5bx91vraK7FYQyNn/BLClaHp+9UkGVHE=
X-Gm-Gg: ASbGnctnBQXweaSRVvIeCLzovCSDym74omIo5fQVYTttg1mtdxvM6T3hlYVqY6qs5dm
	8RiTA0DWErbEq9iOXySXqPfQDUEtH0eqDStyONlETqaPrX2S1czv7jSo1+nfZ3O5aJo/6MtqE1X
	0FIp2ZB4VSn3Rdtj08G/bNQhLDz/naZ1cqHPGYexU2xynh4QbWjcMLHmYRe1lqi1/q2P+iIpbvH
	le08N0MryuKqxYiXmkRBA6IbvB90mUz2BDciyRNBVP5zGIt+nbZ06yPWNF0nKHLzs6cvn9wtCyT
	g5j6hjltsqENFfj6/CcTa0z0N3x7nrLpswSVd/IYQnAYBAvFPPGZmsu84TbQ4dKEM4imAD+uytN
	knTZgRA9ucAnuXcrPf7V8
X-Google-Smtp-Source: AGHT+IGQOWA/DdgNdcF0vOFp4bfRniwjEhSufXRdrgu6ZhEZb9CO/nMVcj463R4KXqdEUZZrqIYgZw==
X-Received: by 2002:a05:620a:28d0:b0:7c3:d7ef:f7f5 with SMTP id af79cd13be357-7d2298b164fmr2068749685a.18.1749499705469;
        Mon, 09 Jun 2025 13:08:25 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb09b2a021sm55869336d6.83.2025.06.09.13.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 13:08:25 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org
Cc: dlan@gentoo.org,
	heylenay@4d2.org,
	inochiama@outlook.com,
	elder@riscstar.com,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guodong Xu <guodong@riscstar.com>
Subject: [PATCH] clk: spacemit: mark K1 pll1_d8 as critical
Date: Mon,  9 Jun 2025 15:08:21 -0500
Message-ID: <20250609200822.468482-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pll1_d8 clock is enabled by the boot loader, and is ultimately a
parent for numerous clocks, including those used by APB and AXI buses.
Guodong Xu discovered that this clock got disabled while responding to
getting -EPROBE_DEFER when requesting a reset controller.

The needed clock (CLK_DMA, along with its parents) had already been
enabled.  To respond to the probe deferral return, the CLK_DMA clock
was disabled, and this led to parent clocks also reducing their enable
count.  When the enable count for pll1_d8 was decremented it became 0,
which caused it to be disabled.  This led to a system hang.

Marking that clock critical resolves this by preventing it from being
disabled.

Define a new macro CCU_FACTOR_GATE_DEFINE() to allow clock flags to
be supplied for a CCU_FACTOR_GATE clock.

Fixes: 1b72c59db0add ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
Signed-off-by: Alex Elder <elder@riscstar.com>
Tested-by: Guodong Xu <guodong@riscstar.com>
---
v2: Reworded the description to provide better detail

 drivers/clk/spacemit/ccu-k1.c  |  3 ++-
 drivers/clk/spacemit/ccu_mix.h | 21 +++++++++++++--------
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index cdde37a052353..df65009a07bb1 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -170,7 +170,8 @@ CCU_FACTOR_GATE_DEFINE(pll1_d4, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(3), 4,
 CCU_FACTOR_GATE_DEFINE(pll1_d5, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(4), 5, 1);
 CCU_FACTOR_GATE_DEFINE(pll1_d6, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(5), 6, 1);
 CCU_FACTOR_GATE_DEFINE(pll1_d7, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(6), 7, 1);
-CCU_FACTOR_GATE_DEFINE(pll1_d8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(7), 8, 1);
+CCU_FACTOR_GATE_FLAGS_DEFINE(pll1_d8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(7), 8, 1,
+		CLK_IS_CRITICAL);
 CCU_FACTOR_GATE_DEFINE(pll1_d11_223p4, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(15), 11, 1);
 CCU_FACTOR_GATE_DEFINE(pll1_d13_189, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(16), 13, 1);
 CCU_FACTOR_GATE_DEFINE(pll1_d23_106p8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(20), 23, 1);
diff --git a/drivers/clk/spacemit/ccu_mix.h b/drivers/clk/spacemit/ccu_mix.h
index 51d19f5d6aacb..668c8139339e1 100644
--- a/drivers/clk/spacemit/ccu_mix.h
+++ b/drivers/clk/spacemit/ccu_mix.h
@@ -101,16 +101,21 @@ static struct ccu_mix _name = {							\
 	}									\
 }
 
+#define CCU_FACTOR_GATE_FLAGS_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
+			       _mul, _flags)					\
+struct ccu_mix _name = {							\
+	.gate	= CCU_GATE_INIT(_mask_gate),					\
+	.factor	= CCU_FACTOR_INIT(_div, _mul),					\
+	.common = {								\
+		.reg_ctrl	= _reg_ctrl,					\
+		CCU_MIX_INITHW(_name, _parent, spacemit_ccu_factor_gate_ops, _flags)	\
+	}									\
+}
+
 #define CCU_FACTOR_GATE_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
 			       _mul)						\
-static struct ccu_mix _name = {							\
-	.gate	= CCU_GATE_INIT(_mask_gate),					\
-	.factor	= CCU_FACTOR_INIT(_div, _mul),					\
-	.common = {								\
-		.reg_ctrl	= _reg_ctrl,					\
-		CCU_MIX_INITHW(_name, _parent, spacemit_ccu_factor_gate_ops, 0)	\
-	}									\
-}
+	CCU_FACTOR_GATE_FLAGS_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
+			       _mul, 0)
 
 #define CCU_MUX_GATE_DEFINE(_name, _parents, _reg_ctrl, _shift, _width,		\
 			    _mask_gate, _flags)					\

base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.45.2

