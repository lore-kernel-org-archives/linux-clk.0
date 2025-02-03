Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E711FCF68
	for <linux-clk@vger.kernel.org>; Mon,  3 Feb 2025 08:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738572774; cv=none; b=CUkewbRPiIMdIDWtGxQvkviMKeOOdRJkfefGnYy4V5TPNGrZ/FMQVbMei8c+6pUXUyHdEYxIWqW7kmSaEM4pRKcwViwg3jtCn6fEqiJoF7LXXhZ5i+Nf8NBJyLyaLCZG82zn0XWvbpfx5maQKM+xZgT4B8aChBT2Irwgi//0KuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738572774; c=relaxed/simple;
	bh=22AgTEVKq+xXA4vNaqP0QKEUOoUwv4sTkP/v4MXPynA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jZ0CVzMWpJAh3qKVTAlLs+qKXyrMbNpKk+/VAzVafRORoO0W0q7CZ+Dz6+pV1Rwq6+3e2lIkoiX0oSA8uaChKRvGNTTyDp8dfpBQ76ujt01z2a1Lr7jNcKE54shdLkumuZFW6olxJXV8Rsjrl/Sv+wzeRr+gLxGHrKl2aHOwxkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=dUANwQF4; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="dUANwQF4"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4679eacf2c5so37595381cf.0
        for <linux-clk@vger.kernel.org>; Mon, 03 Feb 2025 00:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738572771; x=1739177571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lrS6UZq8voK5d6I6M8hMOQP+PQdCTVat6aZNVhGKd/U=;
        b=dUANwQF4WM1HeceqvS2bUw+eqQiPF5DsiLySq1rPsHRCOEQU59r++p2bF/aSpadXyy
         BPcCpv0fhgAYy+yVwm4zp9fy0YkGbxUkA97jXrPAJs/rptxC8OjqvG8pqvFqi7Ou7LSy
         fa56H/seQ5tnGEdApiTcCo8moYGVEgCMZjIMesiKlbwO167f7oy5Uk+Nf4/heCjIINZY
         RvcmBgZk+h7j2Hxz7WyHZSSkUVk6tPe5tNrF2bg11wOMkwu98/vQ+qmDsV+EN/UKqCJr
         V0KfwKAM95lIwG0gd17xZFxynfYBMM/QOW+JgST/xZeY9CJ5zFk24UAwn39/2a4e6ljG
         Oa2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738572771; x=1739177571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lrS6UZq8voK5d6I6M8hMOQP+PQdCTVat6aZNVhGKd/U=;
        b=c/pe36+T+zfJ5SPxuPfuI/HZKH/w5oLkv8Sl9eAyICnw7yjLfEwSwJPGdfGACRBYiy
         TlPxEWmGsYTq3bgeZJevpLA3ooGejAn49gTtOyMLz7jBP9xL0hQiHoDmhSxzmNmdZG2U
         hCOqj+EZRPchmXR0dC3MeYC8tvHeOZ7Nwzv8M0dEeRQdeCY5hAKUiH74YmKtbbokFMO8
         JoVFYZo7S7AEVKaxrlh1KjWCkoVlBF00ZjegAgDYbi6wmDfXqoZJ0Wu1HsTeuUqaPxER
         h5nM1ijvL8cAKFJvZyYcv4+1/5G1LZWNR80eX9RP23yg9qB7k3d4sy73W74FDn/x2IZa
         Cy8g==
X-Forwarded-Encrypted: i=1; AJvYcCXEWzcUQNa7a4aEouWI/IAoZROAa42KqIjwAm9m5r4bLLeEozKf6MMP9sDcWK9SMdKYJewmuRI9wi0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzqymEvUHXpGC/Dr0mu7tULdYLJd0CU0eH6OqlcACUytODCL3m
	OeeIWY7wjEW6SXgMc5a2WK6tGgX+erogvM+OFkxka9e1JnGnIJI7p4Kso8f5420=
X-Gm-Gg: ASbGnctuYVnkA7CPIhuIiezz9VrgF11G0BEvZxWQcWHvlHTaiUb4q+/zvcKoTLhrEnM
	2+TEgYXJyLU7PXaLvzuC1NpuSZ6AvIlcbOQN6lLdRTd8kJWpiLwQzK+7uoR6/dyxCSd+RkA+Jc2
	LgG4Z3Vil6ym2+SOhugbvNb+IDrlne1BVPx2tpGD9kJiPZtF8YqbVmZR7O6ZGX7O6QD4kXpQ0LL
	V8TwbAav7GR/a/vQHcn/wGekiNwH6q4GqOkrcqlk7CROTz/Ikk9Kmc3Goia9HkJvm+1ndTmL0bt
	SgS7IWH7eA1Dmy0/BaqyK7mPhwmBSzOfGxGmkYhpS/bE3m3ME9vyxpg=
X-Google-Smtp-Source: AGHT+IHCJxve5T10aPiQPDTrvWu69tjDV21FWaMmTfndSVMbeYY2fptctuonpJUVJro58XKkYYFZeQ==
X-Received: by 2002:ac8:5f8f:0:b0:467:672a:abb6 with SMTP id d75a77b69052e-46fd0acbcebmr285604751cf.23.1738572771412;
        Mon, 03 Feb 2025 00:52:51 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e3089sm47657911cf.46.2025.02.03.00.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 00:52:50 -0800 (PST)
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
	Len Brown <lenb@kernel.org>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [RFC PATCH v2 17/17] RISC-V: Enable GPIO keyboard and event device in RV64 defconfig
Date: Mon,  3 Feb 2025 14:19:06 +0530
Message-ID: <20250203084906.681418-18-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250203084906.681418-1-apatel@ventanamicro.com>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
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
index 0f7dcbe3c45b..06265b6febba 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -142,6 +142,8 @@ CONFIG_MICREL_PHY=y
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

