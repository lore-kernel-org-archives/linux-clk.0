Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DCB17A5AD
	for <linux-clk@vger.kernel.org>; Fri, 26 Jul 2024 11:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721992727; cv=none; b=RZcdeBjRxCvKYRuQe9a2j9Azc+xOKK6qWewd6PZPu8+L6kUsItAlpgGnZeK6TU41Q000mjmNqynJYFFZpVyl7Dzrx5uWIzgDGo8G5Cb8OZui2mhyL9rX+h7r2WUdLlH5fl+aNuGHEFRSG/ZaJjl32vhTj/qeR8VlHe4utyXXnuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721992727; c=relaxed/simple;
	bh=/dPro3zmVHXBKc6IoJRwERhe3BXDGxTNO7EBgEZy8h0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DNNXzhoAIV++91ifRl71hu9szXe3FaQyYyl8aLY0R174zuy4p/6RM/fygz0B2b+Psc4xmlDQV7Utr+zjWEKws9kFNzohlfv3iAxfkXIgSP1GsXKNxld3ay/9Cy5/JVY6gWoHPC7TgNzTC0b0culilidJIELngdBsDkbUZCw/Un0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MOpzWCsb; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MOpzWCsb"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a7a9a7af0d0so198504566b.3
        for <linux-clk@vger.kernel.org>; Fri, 26 Jul 2024 04:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721992723; x=1722597523; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VxGxU8SYIBjBWPzi4Sb41+wNLkpnb94P+sh7kj+6cNA=;
        b=MOpzWCsbzeg4cantUz4Y6bvtEe081OTTCjfOiAuOkxAeohDbl4fk0BPOlTUrwOCnPV
         PR+6Eo/TRNwfQ6U09iHAdx5JIUuC8KKI7bRZ9yyfCqdy2U2nimDvm/53aeCCfsdnJbPg
         DrRPEdpxp5L0G6/u9BeJ+0e4/pI1q9UOUcRLQvnkYjwb7U2/I0FtZO84NNUtnE30IY45
         vuh8ClpQeqUpR4FibhM5Olfmobc+eMlZV+hFSqupL18hwatDo4alYpMpHiUzcLiAPo6M
         VIorIaM3iYff6ShlMFwdd8qz6Z9FdFzJ9Ru1GZIJSHfqdHv5fqY250l9fbrtg2CdvOM+
         2Nxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721992723; x=1722597523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VxGxU8SYIBjBWPzi4Sb41+wNLkpnb94P+sh7kj+6cNA=;
        b=YJrf7MzhGfxRJNgEEJn6ZT3/jmikaug5o0lLvqo4jSSy/elSUrf92Z/Dq/6dqlFiE/
         82waFPliUR88Q9Ree1naDxz+yIFBfLq6XXcYG6JWc/jnfcHPcwRAicIGYF/FQ5ca6IQ3
         yAQZma5FuVwCiCgAuEOPJCpFQg7+wdaV0UMXk2KrTGwQcGdI/ZqhdAYrI04M1N1jxguw
         aEkeF4H38l6mXxOxVcrAc7tiyquZCI4YVJMsGU/0nYNxMtwQVdLYN6SyiPj/Zkpl1Lg1
         +mukEH4dwNeq+1/5BMYiaAzHYLPioge3elAhs3qv7AwKNRd5tuRXDNJDITBy3/Ht8Dli
         UH6g==
X-Forwarded-Encrypted: i=1; AJvYcCUqnaQfRucSj0C2yo/dQiVKs9uulwqBq+siKTEu2k2igbEbojmjGB4x4h+q9wHhWGB7+wdtaNlhmR43yFHoD2y7H16Jef6xGohd
X-Gm-Message-State: AOJu0Yzm2+HLAcQgRsMMwbYCsA4PaGFef9JTUBeFZikEIlhAXl611Moj
	+tgWGw/ldIbOMiiyhMpSPSS0+qEKfMdFqbnXe3h2C3Q39idHKsTbNhqI53ByzE0=
X-Google-Smtp-Source: AGHT+IH+rwWCKvZykJlAAH6LNkpi65KtAACKb0MHHBRIglRLIVIJhjuI3O0okF7LvJcM+Fs+Wg3qfw==
X-Received: by 2002:a17:907:971d:b0:a7a:ac5f:bbfa with SMTP id a640c23a62f3a-a7acad1c3f2mr345732466b.0.1721992722770;
        Fri, 26 Jul 2024 04:18:42 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acab233aasm164703166b.8.2024.07.26.04.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 04:18:42 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
X-Google-Original-From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 26 Jul 2024 13:18:24 +0200
Subject: [PATCH 2/3] MAINTAINERS: Update Konrad Dybcio's email address
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240726-topic-konrad_email-v1-2-f94665da2919@kernel.org>
References: <20240726-topic-konrad_email-v1-0-f94665da2919@kernel.org>
In-Reply-To: <20240726-topic-konrad_email-v1-0-f94665da2919@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-pm@vger.kernel.org, iommu@lists.linux.dev, linux-gpio@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721992717; l=1340;
 i=konradybcio@kernel.org; s=20230215; h=from:subject:message-id;
 bh=/dPro3zmVHXBKc6IoJRwERhe3BXDGxTNO7EBgEZy8h0=;
 b=ju0yvv6H2nwlTdVb9cib/k9p3rqemfp5NXS7b/Y34MGtZuQUegciMPzF7tHC7+U6QA00B1Za2
 ECyneyJz3BfD/m8cFCsM6T6occxCyUbApmwMI8k8On8FV3B08w8yBoX
X-Developer-Key: i=konradybcio@kernel.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Use my @kernel.org address everywhere.

Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
---
 MAINTAINERS | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9200d953868e..6c7d3951192f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2745,7 +2745,7 @@ F:	include/linux/soc/qcom/
 
 ARM/QUALCOMM SUPPORT
 M:	Bjorn Andersson <andersson@kernel.org>
-M:	Konrad Dybcio <konrad.dybcio@linaro.org>
+M:	Konrad Dybcio <konradybcio@kernel.org>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git
@@ -7107,7 +7107,7 @@ F:	drivers/gpu/drm/tiny/panel-mipi-dbi.c
 DRM DRIVER for Qualcomm Adreno GPUs
 M:	Rob Clark <robdclark@gmail.com>
 R:	Sean Paul <sean@poorly.run>
-R:	Konrad Dybcio <konrad.dybcio@linaro.org>
+R:	Konrad Dybcio <konradybcio@kernel.org>
 L:	linux-arm-msm@vger.kernel.org
 L:	dri-devel@lists.freedesktop.org
 L:	freedreno@lists.freedesktop.org
@@ -18765,7 +18765,7 @@ F:	include/uapi/drm/qaic_accel.h
 
 QUALCOMM CORE POWER REDUCTION (CPR) AVS DRIVER
 M:	Bjorn Andersson <andersson@kernel.org>
-M:	Konrad Dybcio <konrad.dybcio@linaro.org>
+M:	Konrad Dybcio <konradybcio@kernel.org>
 L:	linux-pm@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained

-- 
2.45.2

