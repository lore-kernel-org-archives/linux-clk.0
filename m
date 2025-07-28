Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8B825CC7A
	for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 09:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753695884; cv=none; b=fveeKTwa3/gVarRsULcHqUJKTcqjJfOIzpPeUOWsuDdG+IUX3jjsSU7Ddd4CRGvg9vjzOhRpebO4ArEK0as5WC3gcHGV6EpnxKvcKpZVbvtvNMUbx7hwjzB9vpHs0gT8569GGkvXzqYuLG61IN3CUqBTPDjpwcsVZM5f3xyZlNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753695884; c=relaxed/simple;
	bh=do4xgD3FIKiBFCXHybdwqmJMFTQfLzd5+SYEVnCmQ8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oiPviJv7khvP9SdRrcd4ohc2G8egsbfvp1rKo/phpD8PMAYPL0QIOiNlD3ud90rJ5i5MLHNxKIbk7T9td4RUF4e5M27uG1ao4utquNzOXIoUMJI+SW/I86KvswP4SeTx7071HrUIbmYHNpYpA4ddGah8BiHGKL3oRqnLD3d0/bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=AHNGymxw; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="AHNGymxw"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-31ecdf5faaeso988763a91.0
        for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 02:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753695883; x=1754300683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nCKZPLGMv6q3Gia2CuwihlvGGifXlgSwREijf4CMFzo=;
        b=AHNGymxwc6ze+foPPqiwLOrwz34x1+X+Coj9wPsCcjscm4N4E7tDbikib8qNvdez1x
         Xdi82sLba/BE8fLngO32PgSDiy/DfaN6Td13oGmal2mj9I6UU8L2czw8mFhEBdkFD7L5
         X7fM2DREQTJuPyR+oGkTsTHbh3ZlmhbRGj/3J290RZ49XEYei7zgcK8oYP61r+QrLV54
         44AD1VsoME9L9k0rgTtjh87OD+tK0EdhfcAYG7LcDBqOcjThmtTiAUbIhX1R65umAmYF
         ZzEnpjcSysfApVgU4KxB4W1ZXE33Kt5uDS/xKj6nQKHzRzp7tqopr5OcWmh2TGf7vPYR
         yOyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695883; x=1754300683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nCKZPLGMv6q3Gia2CuwihlvGGifXlgSwREijf4CMFzo=;
        b=VqfaO3J/6ljVZR0s6dQniv3GUZBxT85S+WsltJ1GKFsYxEQYGTwjtJEL3GP6U3mBvy
         bzCB7MEswSxbyU05ePDghzrcfbtxY9coVpNg4sjOFrqkEnZES1gtDBb55vRJlKgQkwu+
         a1ggiO3z3CXKRz3PvzxIIOMq0GV4nO1UyTsx16FR/uQI2aRl3LOU2sxnb5gPoJcFaJ2V
         eKFK5hpRmQUPgmNMVv37K3w0L1qy9WF+NeeFqWAfPMKIAt5fl201001MGSP6Cg8tZRV0
         ok2fTH2/FpAcp4CwKs9tzqyAkt8i3bkmjwg4yXhBVHFNGN0t5rNRXi98ezOhSoJv5l9Z
         Jngw==
X-Forwarded-Encrypted: i=1; AJvYcCVJv8AA1l8atNEiAncX9OjAfWsvyBaw96pfPYhEewzhD/5AsQc8nRP22JnJ+UPZIZ3FNKDMbixbP6k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzprLZBYbU9Ar49NE5sF/l4UiclzE7O81oO0W6m3HB+x7u8V1L0
	7m3w9L0ipDgJCMysJu9I1FIiNxbUbnbJkC5GRgoAdJJM4pyqkCa3EAkruQriowNq5Ls=
X-Gm-Gg: ASbGncsOnTxh7dEsgritRPFadYTsj0qd0oSI5lijgD4yd/DwnSByqEbHrujFZMuTHUQ
	uhJpRxxAEuJt94r5fFarQNaPmW6020+Zmqzbj+aImQOmiHgyFjLfFuAIVlZyxFtMrXDqhB/y4s2
	Y/hwmJztGc5Cu5P9CY/dH/1+5fRbyqBFxLjRYQeefyUqobEaKUQoedOE/c3see4+aaTU+ZC+drs
	ThgzhZ3oifacLiZf5FngPWajJWHbtl9mGB7SVZtGPA0xj9zw7T13X64Haxy/eD3dVs99I4akVlh
	e+ZJS9IePPuwenDovz3n09m6rUTn0T46KX71N38BzHJHOtQD9is0BrjeErYhppFwM+H6Kt0Qtl9
	7cy0P87+mpIWrL/nNoWhGFODyToDpGlLkU9MHDbeBX77Un9evy3Lc+D4XhlTo
X-Google-Smtp-Source: AGHT+IELZc1JoVLYVZkMGvFurZiEqv7IzPn8isjkF2mrjY4D12shOeNQi1Y8F1Z2Ck3l3/NTN/nxsQ==
X-Received: by 2002:a17:90b:264e:b0:311:c970:c9c0 with SMTP id 98e67ed59e1d1-31e77a00816mr14125480a91.22.1753695882475;
        Mon, 28 Jul 2025 02:44:42 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.19.28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e832fbf99sm5396230a91.1.2025.07.28.02.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 02:44:42 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Len Brown <lenb@kernel.org>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v9 23/24] RISC-V: Enable GPIO keyboard and event device in RV64 defconfig
Date: Mon, 28 Jul 2025 15:10:31 +0530
Message-ID: <20250728094032.63545-24-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250728094032.63545-1-apatel@ventanamicro.com>
References: <20250728094032.63545-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GPIO keyboard and event device can be used to receive graceful
shutdown or reboot input keys so let us enable it by default for
RV64 (just like ARM64).

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index fe8bd8afb418..bd5f97e1d1a0 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -138,6 +138,8 @@ CONFIG_MICREL_PHY=y
 CONFIG_MICROSEMI_PHY=y
 CONFIG_MOTORCOMM_PHY=y
 CONFIG_INPUT_MOUSEDEV=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_KEYBOARD_GPIO=y
 CONFIG_KEYBOARD_SUN4I_LRADC=m
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
-- 
2.43.0

