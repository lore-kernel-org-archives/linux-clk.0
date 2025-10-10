Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A542F261B
	for <linux-clk@vger.kernel.org>; Fri, 10 Oct 2025 12:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760100414; cv=none; b=c1n9ZTeKPqj5VgNOiUcnlLiD65zzPWHmS2hYiazXrE05XBqgria4rtx0IW+/R3q1ozVpv95V0tUQt0WHjlPTJlKvl0b7L55FUIgsBOHwMifgc9mBbO+lygAvi+nY+KrmA3frHYEh4ZLkoh4gVSGKIxEWAIZ4ruZ/VYjzGV6cMeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760100414; c=relaxed/simple;
	bh=hUk7p7wXwxuWON/P6SaBYN67C9x3HyQcVroLLSWoXfk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qYw66GFoEq8btV7KzP1YeI2NHGK289gH5mlFSe+PlqB7j4URcBdBwa2SLqr9uPe+qQ6oWct4Oy5wifd4CBpX2iq08rWZ/eew7uMb8J/P4e2boHKTt7xoZwzecX7yvhgQcxYUhb4p7ozSFW+rf1FG/uykoGr/kPMLcRDxs8mTKN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i+Q6AJqY; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i+Q6AJqY"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-46e3cdc1a6aso15687745e9.1
        for <linux-clk@vger.kernel.org>; Fri, 10 Oct 2025 05:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760100409; x=1760705209; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=euDBh1JPBik0jtg2IFON/RfdHFmTQnkqEMlQtD5Hj7I=;
        b=i+Q6AJqYmm8LBYnWZA8kmyEyGoHVTegHASQDDbaz4rGaIbsc/whJJvcu6vrzHNgRVB
         c9/g5dJlEG2S25+17M1PUWImRVua9g2HNFhsKv94T2aMxZJL1YL2PV6xJZmL86tgQEoc
         updU1xJHMb+MXNq5INGRue1lYsqWQ+ycmXUxkuN1Ma84PyrujDF8DP5UwjiX+y5yeu8V
         3D0QKAShx9+Nsgpo5fFl26AFnmCeuQ0QtAVXOLYN/qZ0WdEASFS8ca4onoPWMl1fu0eU
         xT7/omWnVlv5KT8YSoDi6AnpTSGwkzODlGfx5GTiwtrl+IaoXO+f3Fxv9wPmVtRrxzGN
         BPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760100409; x=1760705209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=euDBh1JPBik0jtg2IFON/RfdHFmTQnkqEMlQtD5Hj7I=;
        b=DiivM6TY1gk7AKt66KLFE2p95HQfnOOqJ0DsUWD7fLE7WYOJMGBFncA2EGV9qLeUV8
         tdr91Tyf7lUgn9puhvKGzOG7SejzjE4NhH72mhBIwi8WD/TpceY/Jmqz1d0e5b5/wR2o
         3AQ7LAnFpkVmNFx/hh5G+F72EghiBwtsrI7Eye+pYryNfmEyuaUigA18MSAczhFDq1eh
         X233JI2GzuJgTDmDGPssnIUYKqdw/yDLj++UguJS5Ig+7sUhQsObmF0HVMZl0ERsXzlG
         2IB5GSp+hE4/zfme5JvYnoJ5EsB/bQ+9TKXQ6WApad6kWK+nH3chEC8XDaABCQVz2S3W
         Ak0g==
X-Forwarded-Encrypted: i=1; AJvYcCXgLWShVL0Qh3uFWG5U7/XiytPZ7q8al/K+HdHOM/zCXW+FuIZtJjpeKleseOHOiaJD9+Szzyd/Fo0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyib5I28BTM98MdGyRVHD9pi7jshgdbjMdr1YCo6vSNwX5sFVbo
	44/UjblLR75b3xyB27u8stRbwZ+ABnI535vndb5Fd2x350NLdJ5s16qniF2EeY0ZVtA=
X-Gm-Gg: ASbGnct31g2ttG1A1d2vss/KGWKdcMnWYoWW72A498w0aE0nXBkkOsTrQ4F39mvQiC+
	nIv1Ttqm8XzJnTdyXCL8Ev5RRKQta4A3Bc9xF0D8/Pm4EocWebKMdxHyZspkiHXLR5O2ApwhPtC
	EpkOjmiuCZ0PtnJU+S1DLPxDaPLr0JrRBsR5Wr5uXHLf/lU7nDn315KKH1rhP3oUXSDRvJcbI7y
	b7Wcd2pYQL2ihP1p+3h6UL0OTeoxZ61+uBri0AMAVIVxgfKAtkpz/TF26KE3suIeONsdDOCeqh5
	ID8lNcAx+GAgY/GyQ9AXVmzMNPfZPP5jUxbPxNysvdxP5wEFGXlCw/8zG869fBqFc9sc+avBs8n
	nzYaJHpgGW6o5p0L7+EPYGFlpfBSNual21ms2esah6SUEExoU7heTxbcS45bfskLnySOHMCNwKu
	9NANA4ZiGo+arYwU31FXkXhQ==
X-Google-Smtp-Source: AGHT+IH8x0QfTr6wJYCjDE3d42CDoKbarW30rvQ/Cc2ORyEX4B7UUOdkskMSSnIc4XAyGE82hs4N5Q==
X-Received: by 2002:a05:600c:6592:b0:46f:a2ba:581f with SMTP id 5b1f17b1804b1-46fa9ec796bmr84534875e9.16.1760100408792;
        Fri, 10 Oct 2025 05:46:48 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb484d056sm46376895e9.9.2025.10.10.05.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 05:46:48 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 10 Oct 2025 12:46:36 +0000
Subject: [PATCH v6 6/6] MAINTAINERS: add ACPM clock bindings and driver
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-acpm-clk-v6-6-321ee8826fd4@linaro.org>
References: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
In-Reply-To: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760100402; l=1202;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=hUk7p7wXwxuWON/P6SaBYN67C9x3HyQcVroLLSWoXfk=;
 b=Enoypv5lWz1jLL8VOiF8wE4cWDFIyo47tyJbQitxtWSbq+eKO6jjL0y+BmtW8IkT/uywAVSZb
 namtqWy2kaMATnFmk94Ffxc0XmxkNambqyqvWPYoai4R6uOhoewf3BJ
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Extend the Google Tensor SoC support list of files to include the
GS101 ACPM clock bindings. Add the ACPM clock driver under the
Samsung Exynos ACPM Protocol entry.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3a27901781c2b2589a0f95678cf3df06401cac3c..6a6727ceeef67622e96441165aec542a2cb696c4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10599,7 +10599,7 @@ F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	drivers/clk/samsung/clk-gs101.c
 F:	drivers/phy/samsung/phy-gs101-ufs.c
-F:	include/dt-bindings/clock/google,gs101.h
+F:	include/dt-bindings/clock/google,gs101*
 K:	[gG]oogle.?[tT]ensor
 
 GPD FAN DRIVER
@@ -22756,6 +22756,7 @@ L:	linux-kernel@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+F:	drivers/clk/samsung/clk-acpm.c
 F:	drivers/firmware/samsung/exynos-acpm*
 F:	include/linux/firmware/samsung/exynos-acpm-protocol.h
 

-- 
2.51.0.740.g6adb054d12-goog

