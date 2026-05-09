Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941E3175D53
	for <linux-clk@vger.kernel.org>; Sat,  9 May 2026 00:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778286982; cv=none; b=TqB9A+R8istdKU2B8F0OQM1sKzA/LDjuUbFK6UBIdWm2ubci/LmHeohky5Q6Eh/ZNvpK9yRPFPj+3siC1sys06DwAppcQhgJIbTnXXZ0VFbNLmmuqTyopON9m++xILuOTspo34YGxVTckzkRMUoO/SmLKXPXSGzj1SAKdu84d14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778286982; c=relaxed/simple;
	bh=SoX9G1f2128v047CqPSyVLgjJ8UzLro5Z+kOziH0xUM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tNcYScTw/cV+yxtHFyxuJ1GjCrhRM2czok13lJBD0Q2lQ4epYwxT14dIoDZ6tmgDAZC/PqYGNHqNvb1yrrhLKr32gVcrfLOVV6fjWhWqmqeaZtP8f7qPOfdX5lML4oY1K2AEUbCIcs5fz768/pqg+gVzVN5Yzopuk8BhMvAnCJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JI5d0SuE; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JI5d0SuE"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-362e30526f8so1264497a91.3
        for <linux-clk@vger.kernel.org>; Fri, 08 May 2026 17:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778286981; x=1778891781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TPu/RkDwR7YvogozdUsQJGqDvuX7QJ4yb5QSBtBcOm4=;
        b=JI5d0SuEFFXpJidaYxSsH/2TQb4Gjvfl3RQop06FCPAj9oI8hA1DtN5xNpnM9tD+5C
         N/aB4WQ4Q7kJGdenpP/iXMiiQYCWfEiKQ5Vph7sKFyaOFjfp7opXrVjmkdOi6sgjW1P2
         VifTggqmQHSD1lqxv2qIRKPaMEgOJKlykviYvkrmj0FC/CbsGbt1JnWoQl60XrUhzRqg
         VU4f0OXJz7qLL7ZWXztQqfD/1tsyu0QQLQXVutPLXxZU9SWRfU9nqSLpu8odu4CKKYt3
         7u/V3J0pMwKkTOb4+AfCofGx5u8rX4O1j7Z0K4z0ZWwFQIrZav/A9JXXslRZVFDg2Cxc
         pyVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778286981; x=1778891781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPu/RkDwR7YvogozdUsQJGqDvuX7QJ4yb5QSBtBcOm4=;
        b=RK4PPIOJl3XkYC4iKRAeK7eoRMNDEO6rD7miMfDZxnHu479QUG/kBi0/gugjc1nL6k
         t1CSXPnjjl7rmvSL494C7/SzVaUdhe8bTKcdmDxaPmg+aHyJawh6WzbxnRtdV7/rm/4b
         Ov0TFmsv2lCfuei9WaJHjZSRnvqCSaMicdse9iNOE7pCm4BkNERN2j0zYsZPArl7zgZy
         IHXIUKzlpZNtviKq3YPreyXijeMID0z6VmFIyvl+Laxr94+WhGTjxPXkeuY9c/1NFeWB
         gicWA3K9y1vdVjt8EL7tfTLwe7zuprS5n3wk7O7AN5r9LSMbCJiBR5sSlVGcswAiAeQF
         kIhg==
X-Forwarded-Encrypted: i=1; AFNElJ/fMbTPQKfQ7ecvTpxFQUS9+XrRGKxU8vMpLBgTKNVJHmoRdiYEPyS6S1Zn+h55MryM4lw1WGIUvLE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc8X6/lq9OZUEVYLO4ACwdaMarDW64Qti86ZYP/7kf1dU0Owc5
	ykssbZpZSiP/GKudp3/ElRaWo4J8mhIUOJ59m6qVu1SUoZWFNAOcextX
X-Gm-Gg: Acq92OF07n6c/Cn6CRqp6EbCvBx39FekOIZtNxnnl54xM1l9MvXahtal9FzS1pIse5h
	4rwdi3kw8m08ONbgxIT/b1F1g5X0tNHohP2w8KUmv173yNv3ECtFCwbJ8vvqCO63IBgPoCiWaQX
	fEBFsP/zfcHbqvr8S1yld+iVG4HMX+xsleGfxbQdnbyePQcWmqfo1NCV9iVMXTmWqlo0tYf2X+O
	orr5CvXJs4dWnxHIWEsQ86Bs/IzwNxWzzDUpNWLemtpn3Ot/RbGsB22EPor5WDlRanRdWng3UQn
	lY06nhjIxNxjr0GXyTngz1dI54lJkYQTH2CxHOaTlaeESQ/5OByTYhpvrGfGmSKsl9b4J7Pcj/p
	JGqncZQev0TZUhyG8scPmwVGMbUlj6Ek9ctjvsJdOsEihJfPAvo8rMRSwQAZiywjxrRjTdtnAo1
	gAAN33SRx+/Wuzn5zQ5CQgrcmpaJFZ6/NbAHNLYsmBAp0NWCcKZHL6ZjM7USBT63aTrT0YCfLZ8
	AKhDZ82D4I2GrFmer8LTMXswzlOLnzXM8Y=
X-Received: by 2002:a17:90b:5343:b0:367:d9cb:fdb3 with SMTP id 98e67ed59e1d1-367d9cc08dbmr72836a91.24.1778286980922;
        Fri, 08 May 2026 17:36:20 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d609dd0asm288566a91.0.2026.05.08.17.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 17:36:20 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] clk: rockchip: allow COMPILE_TEST builds
Date: Fri,  8 May 2026 17:36:02 -0700
Message-ID: <20260509003602.956186-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

COMMON_CLK_ROCKCHIP already gates the Rockchip clock objects inside the
Rockchip clock Makefile.  Allow selecting it for COMPILE_TEST and use it
for the parent Makefile descent instead of ARCH_ROCKCHIP.

The per-SoC Rockchip clock symbols already have COMPILE_TEST dependencies,
so this exposes the existing build coverage to other architectures without
selecting the Rockchip platform.

Tested with:
make LLVM=1 ARCH=loongarch drivers/clk/rockchip/

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/Makefile         | 2 +-
 drivers/clk/rockchip/Kconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 3aa6241fd2ec..4b81757f9090 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -141,7 +141,7 @@ obj-$(CONFIG_COMMON_CLK_PXA)		+= pxa/
 obj-$(CONFIG_COMMON_CLK_QCOM)		+= qcom/
 obj-y					+= ralink/
 obj-y					+= renesas/
-obj-$(CONFIG_ARCH_ROCKCHIP)		+= rockchip/
+obj-$(CONFIG_COMMON_CLK_ROCKCHIP)	+= rockchip/
 obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
 obj-$(CONFIG_CLK_SIFIVE)		+= sifive/
 obj-y					+= socfpga/
diff --git a/drivers/clk/rockchip/Kconfig b/drivers/clk/rockchip/Kconfig
index 7e1433502061..85133498f013 100644
--- a/drivers/clk/rockchip/Kconfig
+++ b/drivers/clk/rockchip/Kconfig
@@ -3,7 +3,7 @@
 
 config COMMON_CLK_ROCKCHIP
 	bool "Rockchip clock controller common support"
-	depends on ARCH_ROCKCHIP
+	depends on ARCH_ROCKCHIP || COMPILE_TEST
 	default ARCH_ROCKCHIP
 	help
 	  Say y here to enable common clock controller for Rockchip platforms.
-- 
2.54.0

