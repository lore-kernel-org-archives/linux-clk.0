Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8376E1FAC58
	for <linux-clk@vger.kernel.org>; Mon,  3 Feb 2025 08:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738572581; cv=none; b=OIOCRpATKLwRhgRUke1VOX8oA4pdHcZSxkWuAlYvmCUafCeVPOKBenYUt91PzXeWefTAkhlOEd1IBWTs7a96K2AS+exncmKwETQCJ3vS/sPEgvIDJAqYUk0s6sOIYxt6iqRIaUP8g4PGHFPsDWnhdjSXSf2dWXsbiiOvdHX2YK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738572581; c=relaxed/simple;
	bh=kwBh8tuwy6HyveKbcfC341s6VUevxlvDE+A5AE+gDro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SS/Wj4rPxNh7VR4K58nlgHdNGs4OxQyBfD7wdPrUbfVV5z455ouYfixNsMxwTEQLraPwnEcB6FRoUWTQwkPkgRPWMNXu9LvNJaAIdYGZ0owf4AID7rLU1Ed0w/TF2w6bPOq68l1lOAm2b78Rs1p80yfIwTScIpRw/zociEIx4sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=kh48cjM+; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="kh48cjM+"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4679ea3b13bso31585451cf.1
        for <linux-clk@vger.kernel.org>; Mon, 03 Feb 2025 00:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738572578; x=1739177378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=asyaJaTKEI2I1t9xzdu0UJ7536vRQbg3knNHFZYwbZs=;
        b=kh48cjM+02rnabzQAlZPjhErOBpuDsca/8rncBDf4LfzMmC97S9QeBy+YCsy0WU/sv
         38WzuUKR5L6AjaL1ejgXbOe5fDN1gMJP4wQiVFOxNfPIyiR2qp9QtzV9DVbCmIIDvwc7
         YYohCbI83akMvIoID5O6K3tJKabB0CpRISKQWJJhygPWOBVhxrWmegEUx9qvZzPi7oHD
         h/pOK1Dq2gmws1JKlfehd3kb5BE4fs6IXCFqTaqGubiazb+DzxD/qPM4TUfFPV5nK1Zt
         aXdmfE4O8oQKyrtRtePpe3p8R+7JTcxhEBIlTwPmdZfLFWKSiqEPn4/lYM4GaD4vKYKq
         In3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738572578; x=1739177378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=asyaJaTKEI2I1t9xzdu0UJ7536vRQbg3knNHFZYwbZs=;
        b=SaR7MMHMRvJ3JV/yrucjDsc3Ev+4T9zzs09Iao5qJyGk3Klefp8G67EB27Q9VEh0WR
         L9WYHMA8aYerLBRq8NBPIENOuyzDfYStBMrgsfNy/gmKTtviYyBLo2DV3sra9bd5NYAz
         0jkBY+29hmxYEx/oigyflF3YYmJGjTj6dJyjupnEdHCexEztqKzfXQPABIpkTto43RDN
         hTne+zqJN8QpvuGpEnQLPfdDP2oJ+/6fRNJscrT6rE+NLva6WssaMsVM70720TJDPlJ7
         qRKegtnWlvOIv/f25c0AuVYXRqSWp2MEcqlp4szMM37RrKpDhQhrWwIgcJtPpzh7o0Sw
         TaMw==
X-Forwarded-Encrypted: i=1; AJvYcCVIZeIUXejWdEK0cnBuW/xk6FGVs0r6OOxsOF8QUIscIjnIoWHs6cPFAE0x4CEtG3ptQCGPFq11Se8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxdCS6VaLhFd+Q/ZrppiXjmhH7QJfNxVVOPhGGAfuW9k7u+q44
	xZhyeJRLLCJMg9JcJ3cMFT1dbcmBQm8RPFEv/El1pipH7PxRbAJkkbm2Ie4/fNg=
X-Gm-Gg: ASbGncuOoBeHz90ggdX5cC3ASyzIQdSdvWvUQa2p7OgwEHJq/GAPRu2kEpEowaxLo8p
	FgWkVOX2xre6ylfWRQFqtjQURobOYXkhHKfy+/ZNJPf09DGw7fpEPT4Ha7K3fmoIdzlSR8iRCfG
	NGxkwWNJN4dXyQ8aNngbe4+/jrS1VyVRi1uuCwJyOYGcKb/KxjgrdzIb4uaE/ha1xorKzoKDH6k
	XJDJZjQ7VxAQMjtSYUGAbr4tBhzBAS/zhDqwFvWMYpLT1KIODEgPxLWDda3DFu4VYArbwpfUMI5
	dq3E8iW5CunkRifp39xEXkog2OyyRtkr7SKTY7FjS1ZyxIP3ETJQJ44=
X-Google-Smtp-Source: AGHT+IGcjaF2SJDXsNc6wLt4ldMm5Rj7yqw3jGMd8EZTRoB/t2JLI6T/ZVSpOvzgm5WgVhySwgNT+g==
X-Received: by 2002:a05:622a:2594:b0:467:7cda:936d with SMTP id d75a77b69052e-46fd0a1e8bcmr332465921cf.14.1738572578196;
        Mon, 03 Feb 2025 00:49:38 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e3089sm47657911cf.46.2025.02.03.00.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 00:49:36 -0800 (PST)
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
Subject: [RFC PATCH v2 01/17] riscv: Add new error codes defined by SBI v3.0
Date: Mon,  3 Feb 2025 14:18:50 +0530
Message-ID: <20250203084906.681418-2-apatel@ventanamicro.com>
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

The SBI v3.0 defines new error codes so add these new error codes
to the asm/sbi.h for use by newer SBI extensions.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/sbi.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 3d250824178b..972eecccfb2a 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -419,6 +419,10 @@ enum sbi_ext_nacl_feature {
 #define SBI_ERR_ALREADY_STARTED -7
 #define SBI_ERR_ALREADY_STOPPED -8
 #define SBI_ERR_NO_SHMEM	-9
+#define SBI_ERR_INVALID_STATE	-10
+#define SBI_ERR_BAD_RANGE	-11
+#define SBI_ERR_TIMEOUT		-12
+#define SBI_ERR_IO		-13
 
 extern unsigned long sbi_spec_version;
 struct sbiret {
@@ -505,9 +509,15 @@ static inline int sbi_err_map_linux_errno(int err)
 	case SBI_ERR_DENIED:
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

