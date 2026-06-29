Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845EA37E2E5
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 03:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782703698; cv=none; b=kGa8jmdwH5cgpRJ9zkMmtuHOxNe7tRLkd6V5xifysHL/T+Xq3BLY76XyMQCdE9izzl8cQqUqPQjC8HvDfXRjzJGnYzvaEvgB7r3AvhuUk0oxjxN2Kp5QjQkYQDYDRRsnRNxOtl2CLer2WNw9qF63THksATmViroFuDhnLObYhkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782703698; c=relaxed/simple;
	bh=yGoH8IaOmzsv5qmZmnXquKbu3+/JzCiDe89ZF27Npgo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Om8vi8IrnFHy5yjOOn+4S0AUR4hkrWkCcraQgaMfc9teMvnuAap67XHnfTT1BE+pIZqFamiXwvlhI59dNdDB6kQl2y7hSsf1jt6qbL7iSOPkN9XXeBQhgbx4pzjz38XO/d/MYvfuNiGW4jZiNlmheYMhJJSMMEEz+N4wT5ea7uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aLuykIEg; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aLuykIEg"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8454160043aso2299355b3a.3
        for <linux-clk@vger.kernel.org>; Sun, 28 Jun 2026 20:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782703697; x=1783308497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uoog9qhwEH/PM5VZgEmA1A5PD5C88Zoi6u7AyRNBDsE=;
        b=aLuykIEgnjM05aE8S3HQeQRvjB/oLGzbcwsWH+yBqh0anptb8X5qRiYmsoSOFsoaNT
         J35lGrgzE2LzDm5NBARia8CfIxFIalQKkwMx1Pb61u7F1vwqMYHy9+fmJ8NWdS/UkdAY
         6PFu9BMQsk+StbkHyIVgPoS5STiJ9IS9w6wxSCBIbE5yHloygf+TQczgE9GUO1nu6piZ
         86/sffwzHRI67aFtnasl7uMhr2IiyivwbkcK59p1FstFEG71DkUIjiXVcPeRv/Rmgy1k
         phzzo9anO3xj+nDyyL5NBfi7sjxe1THG+n1CILbq0Tb8rgrahBJtkYagejit5nqYAJbH
         aybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782703697; x=1783308497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uoog9qhwEH/PM5VZgEmA1A5PD5C88Zoi6u7AyRNBDsE=;
        b=QtrecU3/BUXhuWDB2AxhkAgzJ0PxQDmwwA5LsmlXZEmguCU0PVCaggLyqz1tX7mIB9
         GbMYowAiDZyBt4VhwCi8eC40a0aNmKYgeFGZrTSS6kLk01lCMFQojFW9vX/cB/MUOHdm
         esC0+0Foc79HYs50XmxE1oHkFHhuyNtaH9l829UdRoCba5hiL04iUQvkA1Tlpgnd96Ct
         ZKddml/SIZalc4Iybhe3/DXwuOye1wX1ZZiZ/UF2tyT5697LSClj8dHRlHNZKDRqu7du
         ecHLYzoIAJWxJqtwHr7nYjPspk5LsR1IRcWxTMF3JpzjHT94Gul85ng2/C3vJC3n6gxX
         QXgw==
X-Gm-Message-State: AOJu0YzOAYoUCfYyKtD2XLqURoMGhMxMarqLmQdjkYIDML73VZE9kBX+
	HTWfnR/lmLkbb01OFDcA9qFYKuI4EDQe1ASg53RLlWBbuv5mCTMTsG8nQDs+UtIk
X-Gm-Gg: AfdE7ckWwvOlTqh4iGti5yYXCc+IAim+iKiyob8ldNL918M6qMTZoBlsfwRHfFchvzt
	vQ2oSK4egjOczwGtG9W74pq0ZptzjMZ/eRg512o8t+Kesxzd0pjzVxBXk/taH7bjuRqW7Cj780x
	WeUAlWx4h/1/y7selqoDCvRBeyI32/Dzxxr3cyOoT+c7iBclbCB43b8kZ9ssk9OPfdrL1c1IPQH
	BeOjCq42Ljgs4Rzu5OVgzVgdpXeXr+KQmIjJ0IIdzs7Qs+3mOQ+u8kG9Q7vVZrYdCaSIOye40XO
	rpepgtGJxz7MXlc5oy0+siFMNmotG7h2+TlQaW8xTDIoQqQ7xoZRG3PpXJGFx4lKP1qXOvYqgpe
	zqNeLX09RyF6WnUkGCHRzEGiLVKf4G2VRPpv2cY5lchePtR6eZqqcWGmNS9ouopPN30gpmrjQAd
	yYeUct1kmkoTrJWvA7LdnFUTCpjYVcU0Qp2E9YZtc7BuuRCU5BNcp0aBfm63gEy/HJABTF+VlC9
	iCDJZVFKA==
X-Received: by 2002:a05:6a00:9452:b0:847:82dc:450e with SMTP id d2e1a72fcca58-84782dc4955mr1525887b3a.8.1782703696785;
        Sun, 28 Jun 2026 20:28:16 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845d8560fbasm3624666b3a.15.2026.06.28.20.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 20:28:15 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] clk: thead: allow COMPILE_TEST builds
Date: Sun, 28 Jun 2026 20:28:14 -0700
Message-ID: <20260629032814.2344879-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CLK_THEAD_TH1520_AP already allows COMPILE_TEST, but the parent clock
Makefile only descends into drivers/clk/thead for ARCH_THEAD.  Use the
TH1520 AP clock symbol for the directory gate instead.

This lets the driver build on other 64-bit architectures selected for
compile testing without selecting the T-HEAD platform.

Tested with:
make LLVM=1 ARCH=loongarch drivers/clk/thead/

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 68145ad91035..d651e4ed3462 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -157,7 +157,7 @@ obj-$(CONFIG_ARCH_SUNXI)		+= sunxi/
 obj-y					+= sunxi-ng/
 obj-$(CONFIG_CLK_TEGRA)			+= tegra/
 obj-y					+= tenstorrent/
-obj-$(CONFIG_ARCH_THEAD)		+= thead/
+obj-$(CONFIG_CLK_THEAD_TH1520_AP)	+= thead/
 obj-y					+= ti/
 obj-$(CONFIG_CLK_UNIPHIER)		+= uniphier/
 obj-$(CONFIG_ARCH_U8500)		+= ux500/
-- 
2.54.0

