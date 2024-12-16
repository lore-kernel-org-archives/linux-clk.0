Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF959200130
	for <linux-clk@vger.kernel.org>; Mon, 16 Dec 2024 08:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734338922; cv=none; b=fbpG4iqzTnqEuGUO3h+bAOw+QqhbcknjL3wyDQuFBlNsPPoaZuUTBOMrfM10Rs1ClFuTTefaKumj6dPJ1bMBCzby6R8yDqPVcLNkkrBnHFQ/90g4GlAg8VnrE/XvK+C1SboecRc3Il+Hfp3ZKDJw6601w+oS6QktYvYJU5T+jfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734338922; c=relaxed/simple;
	bh=WUNE4+/vgYu5ic9c+DmiHQY0R8adpw80lkuC6ZFbCtI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PVf8sRXtNjjCv3WEUJomBXI8qomiHZ3/Y+AISUaRHE6gdtHNUitErwp0+zm/0meKjrHqnS26SvVm5liuSM3frYQmBHCNEjNMJ7it/TlLL4tKOsDAfG4EUIrtfbJOVsXAy8paFvSfg/4Xs6QvVoJsO/JyLDJLyQQQXa6exS+97rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=c8ddOrWh; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="c8ddOrWh"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-216426b0865so32239205ad.0
        for <linux-clk@vger.kernel.org>; Mon, 16 Dec 2024 00:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734338920; x=1734943720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eei5CeEAyNvf2PS4xwdFaq29ZOKnFWm89T3hqpCmQHw=;
        b=c8ddOrWhz/YN8EN4xP/LzezHbkEEeYwwFofldTa+UX3v1ZKc/xOR5thbXheHuQaaQx
         KKNdaMTqFjCMEZeLEigC5qxwMbdeCLbAP3/SCysHbZoU9UmGFtlLt2z2VCWrJeiL+c6M
         dG6YXGsdz2Fij6aMYX/VMNyRgknwoGeixQYjAVkV2u8EmFxBP+bAHIFPradgB/xXLseN
         SKGb73MS9gXiQtZrEV5Y651FRTcrpplFtycfpvyOiJ5GufHuGLE99EvRUJzEzHQZin9i
         9+0u8T1Ld7PeCne5RIH4OUNbFxBs00i+H3thX4038V99WgYAXCFCco7ok5MpXprLIVoc
         jxHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734338920; x=1734943720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eei5CeEAyNvf2PS4xwdFaq29ZOKnFWm89T3hqpCmQHw=;
        b=d1uuFS/nMFLHEjSymKIoLQ6rVPtXMi+w4+cPuOlyVvAJlByA+J+LgRG9RpSwsqn3W2
         0brNKYj4GOJGHZcHcZvrezVbGg/LbmTPoLsozxKGxHzHFdn7OleNr38oQOBp74SKSL7O
         BKs1QQoWs4HhOaAot+qpjIA6QtG4N82HBa/eqdU4Ci4kPCsejWh8Y99nSHs94VeJih1B
         fKhsKX398542wQNG2ktCG7dTSBRTos7cXXMAbY7glqh/OSgQdm2WSAgRInSA3WUrxDll
         9BqszIHfVZYLW0tqi2pCXTcLL5m4T7IvIHpas1qjxO5foTVbsZVxqxvmI1rTsRg2r9rV
         qnyA==
X-Forwarded-Encrypted: i=1; AJvYcCVwy2ggKdn1FBCJn38p/eJJCDu5U0IyK4tmvcHONibcyiDG5tiUbd5jIgNI26Na9scxzmy3emkHajM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbDxsY77zFEmkCdo+aHt5lod7ZjEkSLs3gHr5NGdbP4Pe5GTYT
	J/kcGeS8hblHv/D5tLIGdZQ9NQeGkIGuAu8C/0EbNlgc8n+dVUwxytV4LJArcpA=
X-Gm-Gg: ASbGncualmLBEirEBxJUuYagzBCY9ddFopW2Ht31GTmbPssMAN0uYlX5e4eVFpxZnWq
	tp2IlG5cNE6bOyYGDqQ9B4arhtvQxF2WnnWwMPjBR77qOEVMS6PyjxR/tLF/+GPiRluu4dZ8ldt
	kJY6I73pxuFnHi3lJzMTfrYN284gIuOrH2Q3IpNwUnNkGSe59NHIXTHagBBuNua4CWQMYNHFj+x
	mEzKqA6rPE4ILfC9z/zwqq7AylHrP5zoJ5NBayx8nIFj/cN+hL7L2JOqvC8g8Ssz4gkn9G1bBBh
	osYp97bxwS/9bU4=
X-Google-Smtp-Source: AGHT+IH23xFB2kNx/gOskLUHtyyFSXX+WD7siqR8qRzGwZ+oJpSpIMc4NvB33gu7U5vEEvlRMs2S/A==
X-Received: by 2002:a17:902:ce85:b0:216:7cbf:951f with SMTP id d9443c01a7336-218929c72b5mr138434115ad.21.1734338919985;
        Mon, 16 Dec 2024 00:48:39 -0800 (PST)
Received: from localhost.localdomain ([223.185.130.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e501d0sm37711495ad.116.2024.12.16.00.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 00:48:39 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [RFC PATCH 1/8] riscv: Add new error codes defined by SBI v3.0
Date: Mon, 16 Dec 2024 14:18:10 +0530
Message-ID: <20241216084817.373131-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241216084817.373131-1-apatel@ventanamicro.com>
References: <20241216084817.373131-1-apatel@ventanamicro.com>
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
index 6c82318065cf..bc35ad750e28 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -418,6 +418,10 @@ enum sbi_ext_nacl_feature {
 #define SBI_ERR_ALREADY_STARTED -7
 #define SBI_ERR_ALREADY_STOPPED -8
 #define SBI_ERR_NO_SHMEM	-9
+#define SBI_ERR_INVALID_STATE	-10
+#define SBI_ERR_BAD_RANGE	-11
+#define SBI_ERR_TIMEOUT		-12
+#define SBI_ERR_IO		-13
 
 extern unsigned long sbi_spec_version;
 struct sbiret {
@@ -504,9 +508,15 @@ static inline int sbi_err_map_linux_errno(int err)
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

