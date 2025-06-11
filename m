Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A863D22DFA2
	for <linux-clk@vger.kernel.org>; Wed, 11 Jun 2025 06:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749623171; cv=none; b=IZl5WAgPunX0tMrk49OAXCAfCFZJF9+wQ9lVreeA6crXOFEuPoeJDb3209W8GhhuIV+XfA/iX3d0UojMXmFfApZms5N+IHLx45fTb3xbFjLciZfVpgI3WYXCGQp+rT0f5D5pVTr+jasU/DiIYssvoOcYHu6wNI28mCM2c8rlSG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749623171; c=relaxed/simple;
	bh=do4xgD3FIKiBFCXHybdwqmJMFTQfLzd5+SYEVnCmQ8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CADhJThKApS6TM8+qUjqs0VLzMAXQRo9Elrlet76CP0h/RolpuO4709715KqiLF1WprrxSlRsUG1FCgH7EGR03zKoLVJ7X+ZxP64pBAvlVFqgiomJnT38jMH2PzbXVHgW3P9TpSk9jkkyr4tMFrNmVr3gk6Ac2u0X7NZNSai9xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=P7e2A5/R; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="P7e2A5/R"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-23636167b30so17453545ad.1
        for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 23:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749623169; x=1750227969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nCKZPLGMv6q3Gia2CuwihlvGGifXlgSwREijf4CMFzo=;
        b=P7e2A5/RMbpKWV4USYgEX54JkYswpao4dAxpHRwOtDaJg2iIbqpr5n5xCDDwJT1YsG
         RWmezbfWNp15lLMJ0zQuQDlTPyr+GNtPH8Ql14sHNNjNgdUEiveHXin4q3ULUXJBHRry
         5mPp7o8+0JQbZI4Pg7biiiX1+PQRKES6GYhJEW7Y52PGD0QnXVkEucY/LegXYvoPOa7V
         X+YfH4JfgedMbkGbRn4fEmuWac60kIoUEF3YbbL698Im/BZR43juROuTTOuoPJs78v7e
         beQc7WnzNKTCIY2eDlidnXtLwnp8PRnK8IdDtc12XQaPsE8ZZqneW3uQhJjUEsyWIz7+
         89sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749623169; x=1750227969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nCKZPLGMv6q3Gia2CuwihlvGGifXlgSwREijf4CMFzo=;
        b=URlHkONEo8oHN0uY+R5XSkEXYFXFF3XyOKHOh/6nufg/llfTikoUw7WEUaJ2VjA+pd
         n5/H5c9q4GiPTXGos4jO6+Hxl8ASjukKtOGg06celAi58rO6bY3vRUFgSGPeDve7ySZN
         cFcgOM4XaSui+VNOf5oUhoo9NkyEVYtke+BiR3DvksWMQiG7ngbbs7luNk2lseQk/Wkf
         +M06XsJQqC+yCfUavzjDdTGpe1zCZx1AaEeXxfMVVzg/9Zpz6smkgKXkk1rkklhg9srh
         qT+R0VLDRa3D+OFHG6D609cQCVDpN7eCOu7LQjGhvHa0/PhWhxKmmuG3fGHgyUeXPetI
         rQVA==
X-Forwarded-Encrypted: i=1; AJvYcCXgqXEIT2o2DjcFnPQcuJh6ith4Uqy5GGOHqGiyJX7GWlvXs4YIH2UxY5u5mtbJhAcm9maJOEbdvjk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrQ3jQOGgBc/BkY8eHa4oU1mZiIHAwakG5kbhdMnAdf7/N9U4m
	vodzCsQY/glDKe900udv+GnnZLEj496SLMtYeZvwIPWbz+Sxr3PDY+CfU0UVeukzsTw=
X-Gm-Gg: ASbGnctCd1wbDKfF9jCtqrSZ2Cvc4xn/s9pnA1y3Ogq1BsnyhBoI085U/1J6ccvYQQZ
	EyOSIn2JLq8HKS1pKiG0E30PgVGnLeDxVLSoe61+mCyXcBnWdb9+a6fH+ELq02ewOIoeSyS3963
	3PAkzsg2z9o/SwFIqueg5HEncTrdq9unLUoMsTIiBKux9s75zW/ln3wzvzIR4Sj+oiNnhKIN2v6
	OOIyzi4WMU6uKYn4UdhhXKWtvE5iS4lBrTvr7au4dRbTXz53pr/18yzgiX9+QYEHCwllGvsnsKs
	0mJ/zvpFj+DcgaWPZ0jOn04fW029ZyyOKyaXaMlKYnjfYFsU7lz9ZoT5fuCc6AbfMSptBIc2DT1
	O16F35I7Yps6cB3I3aZ07xe76vVT33XXxqg51
X-Google-Smtp-Source: AGHT+IHxgzd+8XFQeH6I+CnI3pJzaPr1EGnWCnVsqBSz05ercFVxc937r04XmAc5WZ/WtZq89w951A==
X-Received: by 2002:a17:902:ebc4:b0:235:2403:77c7 with SMTP id d9443c01a7336-236426a80b7mr21936585ad.37.1749623168893;
        Tue, 10 Jun 2025 23:26:08 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:26:08 -0700 (PDT)
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
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v5 22/23] RISC-V: Enable GPIO keyboard and event device in RV64 defconfig
Date: Wed, 11 Jun 2025 11:52:37 +0530
Message-ID: <20250611062238.636753-23-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611062238.636753-1-apatel@ventanamicro.com>
References: <20250611062238.636753-1-apatel@ventanamicro.com>
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

