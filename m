Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62ED126E709
	for <linux-clk@vger.kernel.org>; Mon, 18 Aug 2025 04:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755490396; cv=none; b=NDi+ZJSStm9fTxXlJZDftBm2nmxJNSvytZKYiwOgvOAKNUHItxwWp3/w+t5s+J5qzDYSFzOCSNtpbLHNs0pu2Cdi7DGviuEy3d56vIzGkLtd+jrlO/CHQlBd7c77V2jyT/FVA953hXiGoNzHm6I5XCTZ6U75sg+ial/npvKoVbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755490396; c=relaxed/simple;
	bh=65T8ACHblxo2D9Y5oErp1bIX7U/Lm0LLwEyN5VeFGBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MQWtaNeseFDTV3ssmg259CfK3pGLtjC9nLaX/ON/rdpRixr+nGl2dqQ16FbDSS9WMSJEFLjK3/93A5rEVYSsX96jKCKPIafQU2OBUeSgFGnws8RD6VzR3Zf10S+Zfm3F2p15uLWfqPYkxPdOpHBsDiUA4TSSU13EK0Q2c05Uq3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=JTV2ukB+; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="JTV2ukB+"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-244580523a0so30893445ad.1
        for <linux-clk@vger.kernel.org>; Sun, 17 Aug 2025 21:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755490394; x=1756095194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJN6/jwOx6PvAx5UtYwiYDtqnVqwfwWox4DCK7OERJ8=;
        b=JTV2ukB+HnMME23zz9zmZujFainKvLGXSITX3L4GsXOftxayOBovaEsna10U55yfd4
         A9f0LrY1jO94hpaK5f+Uo3Zo9ORurfxnasIxF0Od9YCa/zmRctmUZxJxZFelETEJLmWu
         oSLsw5SetXNpM3LPY/acclXBxvFBjuqvMOd7ZbdnSz7qQMm9ziI3QcxcUQFcEZ0cip4k
         LxiQ1yPWsqCNNkUMdu2z0ezFGSQezNsD1BldnLmav9rEuyXtE6JqxSytgDJKwoAOWDXF
         3lLf2gS3upMaPK1+gX0yu+Bt1rq1/tjRxxunuCG5WMme8vXQxKuAmWxzpMYSp+kz9jhT
         AQPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755490394; x=1756095194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tJN6/jwOx6PvAx5UtYwiYDtqnVqwfwWox4DCK7OERJ8=;
        b=XmDLSE+C1Q605sKmdJQnZfOuvVoJOi94v5wgcvs1TTARu66Dky6i7lQU0FRl08413L
         Jf6hWl1PdncFxjMdV4atQI/CZaXzO09/KLHJZ13vS+yKFHr1EbPhYpem1nBfUFhfIU9k
         O3b1+PsOuJxKKB9IEDJVO9G9h7Q1zuCLwD+vLogBH79tpmT3CA8psm636Zf+fplrbZ+i
         FS09JqGrYo4ZidBXFAU/hs++x13q5JO1GfNtVB455Pva/yW4lHPHB3CdJ0kQNV+3ofAJ
         bWiWsf85z5qj6srYhsemJM/7V2zoR6TVwmL5+eaTtM36mQdnPXPNbBJV6t6QXftWpU6g
         6ppw==
X-Forwarded-Encrypted: i=1; AJvYcCXU88iAxE8h/6/MBvPZZyF3rgt3wAyc4/NwD/B8mxezMtCaRBx4+BLR4fOm2uLqf7fXe5vaArNPwA4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxR88sdvKTafRlmUg/Tyd5uFOEswu2VbjY7qLis96YsYhKlQvy3
	NaECm3NZS7tLhDnWACI7JVd1/YKFltrbUC1xdFyYOdArhpSPQHX7DliO+xQfiPX4k+4=
X-Gm-Gg: ASbGncvX55IoZXhHaHOtPM/t+Gf4l20tSQPA2MsmiZmI5MWTGBlfiRByfj7jyEeoTBr
	G3gYufpzy3aW4x14KwUeV8X3uTAGuoFI/nkTW4Syy+JgI+a0o1KIwGw1qf8LL1r9UosOYLtIKgv
	dOBZJ+atbskuaVKk+AbMiRsKxJm434Uzg+VPP3O56MF1UaQyrmfiwDhGv0e5edmPMQQ7yHymURL
	//MLLymfUC3DcnJvCuJ6rO7AlqVzpOMo7QZlkD36CBQvsp6xdPuywtmLkTPuk5vAKsP069UeJDI
	JW+AVW65WAPN0ARmyG1L8szDghYhYsMkCI7pGoGq4IDllAUAu5l+4GyEBbWcWZF55qs232biRaQ
	iPusdMmRJfASVBpYZ4t246gRfwReiXXCCDctCAzmO6ocHM7Pq3Q8O8H5+l02c9Jw9
X-Google-Smtp-Source: AGHT+IGHAghuq2SQgJxlaChRoet/Tx7S9hCYmLUP2wntlwdg9I81uVIMsAQNgL7M5sl0qBnBN4yH/A==
X-Received: by 2002:a17:902:e948:b0:242:3855:c77a with SMTP id d9443c01a7336-2446d8c6388mr161787285ad.34.1755490394370;
        Sun, 17 Aug 2025 21:13:14 -0700 (PDT)
Received: from localhost.localdomain ([122.171.17.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32343c70356sm6560972a91.25.2025.08.17.21.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 21:13:13 -0700 (PDT)
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
Subject: [PATCH v10 23/24] RISC-V: Enable GPIO keyboard and event device in RV64 defconfig
Date: Mon, 18 Aug 2025 09:39:19 +0530
Message-ID: <20250818040920.272664-24-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818040920.272664-1-apatel@ventanamicro.com>
References: <20250818040920.272664-1-apatel@ventanamicro.com>
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
index 7b5eed17611a..021baecb253a 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -139,6 +139,8 @@ CONFIG_MICREL_PHY=y
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

