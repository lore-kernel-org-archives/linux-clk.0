Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3CA1DC9A3
	for <linux-clk@vger.kernel.org>; Sun, 11 May 2025 13:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746970815; cv=none; b=H+P5YHZZ6Bvz7qNXlFgMKARgZs76Ru+3OHDWdmZ1AmvcAnds+SkLAZKjORZ2xDlT88xp+IL8EKC4RQB98OwpZGVqHe1rUFNw4egBP+0TKSVjFYu3FhYjCUrB/2G2OUGZjjU9SsioqHaZfkopcMGsKKvmmjXSG955Le2IrSZNV/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746970815; c=relaxed/simple;
	bh=gv8a347ZgM8grLLMwGRczaN5bCj8XaY5cQilQ8vIa5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jYP8O4I7J6EL/5TOCi/jdWpJ5BQiD9Vvqi8bxfnvVEiLlIBNmteObOiNyDPiq6VMPPSkn2Th96R4D/WlE1CHjWPXQk0+Ao5IO+xIiKdnC8AB4HNdi/HoFohykVomLwOIe99mEz9d375RlZZFBdrvpYstS8c85KxoSBZbAC0vAy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=drY56icV; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="drY56icV"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b07d607dc83so2798793a12.1
        for <linux-clk@vger.kernel.org>; Sun, 11 May 2025 06:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746970813; x=1747575613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DVsERMSdIf5sKMRIf3zMFFXP9slyQDAj89Ix8Yi7kgA=;
        b=drY56icV6tdieKz+DAnOABe29F2zlSM4UxxLw5e1Q/VjViRxcUkhmtyE4fxM0ckqTn
         oeyHiqE10+QPXhzpjIpFiWHFEfIWHUInTvhAE4+GEmrUNhZJoKKu5y/O63PnOoo9ghBy
         jn4kZI4imIYj9cAUMNDjkdTgpxvpe1erahQJhsNyRBG9mK6p1dxsLzfNnW3D5QLYZi33
         b2ocBYnP8F7ntxGxnkc0OHEq0X6jBb8HK3m88Gme234VcA0T8fdFmu2XMwN2ZaTV4Ica
         EXne0WVzRcD1nlkY7qwpAIplPi7DYEJZ/iecEimh8dpGMO4LxVm7yCSkx38grrvTUpnP
         acqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970813; x=1747575613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DVsERMSdIf5sKMRIf3zMFFXP9slyQDAj89Ix8Yi7kgA=;
        b=DZ/3Ul45gI2Qdfl5B7W2bekjC8DOQHSyIEa/GQyAnCnuTGQ+IpeZqZJFLrmGI3Gge3
         s1kOqAg382pbl0rmB3rv+yoQCcoFbwhd7FZ/cQ0qbHZhy2j6GtwcLw5VxC8Peaq1AzCK
         YKTxPJ1ylvCCuBiiQeEVrOM0c7jgC4WGq53oxEgIgQmPhvZBcWaJXxlYfTeb5CSI180y
         ssXs0xgH2tBWmRELuNfSePcdq1nLT4k7WhcAcNU4uG+g68FHrF59LNOAGiQ7hx7sP0OK
         FdfQS+e9WR9T7PwIr6Wj/QVi5kFyjVgRBqLxK9VjEzexG/Rg9wiDBVl38nMANnObyVR+
         PL+w==
X-Forwarded-Encrypted: i=1; AJvYcCXLxyxh3hLUEMItYSTcbrnoW9Udr3hPB+ps9VFRi5aLDOxdoDaPVSgIsZg/Py11v8QCKqxOmBj9+wI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaazDNxmta/xz8fjPGCLmQVsL3Hp93hWfIvBzFM74bpVSq8SU2
	6ySnJqbUW9HSuoPBEo0QPj56jMG32DbLh6FaQbA0xFPbyZeIzwnCA+dYOkZVPd8=
X-Gm-Gg: ASbGncuGAqr/L3BDnT33N1tncAoisAqueObUDsmv1WgG2jpw7s3YCatfgbKWeGMYtUt
	62n4eQwQ3GUKfBU0VnVt9Y7kx14+0CfVhO0nZeE5drjfMqbZzY1E9oRsTw5+9Vc4zZhm+1BBoxz
	IzV8PFtAEdECcjT2vrzbRb/YESY7ndAiWtzAmEnH536KOM5cvIMjo92omWH2giNlT3KnvgR+5us
	1UsOA069cuGiNFv82ZXuXMb/tgv7GhOJWUAHd+OiLZvOTQZhKsfIAkXnu5P7dYcaLxDum2ybgqp
	sucGnT5zU9RYdYsNsEWXZQA4rvcBIaGGrDUTWTbCGJQKE4Tc+CyZAFF+3EB5iu3kmUawcjbL3cY
	C+EYXA3EqKJxNBQ==
X-Google-Smtp-Source: AGHT+IHFdwKqWqDeRPUbNBSRmc+vSywbFgnPqE/8PACRgl2hkEeI3vsdadNPhXxEMsmI76yi2E/0hw==
X-Received: by 2002:a17:902:e952:b0:22e:3b65:9279 with SMTP id d9443c01a7336-22fc91cbb8amr136349565ad.53.1746970813374;
        Sun, 11 May 2025 06:40:13 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:40:11 -0700 (PDT)
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
Subject: [PATCH v3 01/23] riscv: Add new error codes defined by SBI v3.0
Date: Sun, 11 May 2025 19:09:17 +0530
Message-ID: <20250511133939.801777-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511133939.801777-1-apatel@ventanamicro.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SBI v3.0 defines new error codes so add these new error codes
to the asm/sbi.h for use by newer SBI extensions.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/sbi.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 3d250824178b..4dd6aafb8468 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -419,6 +419,11 @@ enum sbi_ext_nacl_feature {
 #define SBI_ERR_ALREADY_STARTED -7
 #define SBI_ERR_ALREADY_STOPPED -8
 #define SBI_ERR_NO_SHMEM	-9
+#define SBI_ERR_INVALID_STATE	-10
+#define SBI_ERR_BAD_RANGE	-11
+#define SBI_ERR_TIMEOUT		-12
+#define SBI_ERR_IO		-13
+#define SBI_ERR_DENIED_LOCKED	-14
 
 extern unsigned long sbi_spec_version;
 struct sbiret {
@@ -503,11 +508,18 @@ static inline int sbi_err_map_linux_errno(int err)
 	case SBI_SUCCESS:
 		return 0;
 	case SBI_ERR_DENIED:
+	case SBI_ERR_DENIED_LOCKED:
 		return -EPERM;
 	case SBI_ERR_INVALID_PARAM:
+	case SBI_ERR_INVALID_STATE:
+	case SBI_ERR_BAD_RANGE:
 		return -EINVAL;
 	case SBI_ERR_INVALID_ADDRESS:
 		return -EFAULT;
+	case SBI_ERR_TIMEOUT:
+		return -ETIMEDOUT;
+	case SBI_ERR_IO:
+		return -EIO;
 	case SBI_ERR_NOT_SUPPORTED:
 	case SBI_ERR_FAILURE:
 	default:
-- 
2.43.0

