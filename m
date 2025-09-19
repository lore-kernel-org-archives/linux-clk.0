Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20101256C91
	for <linux-clk@vger.kernel.org>; Fri, 19 Sep 2025 09:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758275961; cv=none; b=OfZ+DJrXpvdoClMNXED0gwhcSxb5OaZI+PGBMYyfgKoakzowTv99o6891FqEIt00puFU4LFj6p4bqFweeSfoAqBTf4OvmvrN2aWj2zmcenJxRPJpQU3ElzaN+U+wCEggXZxGkT22063WajyRa5HJQa20/7F6pfLDLjp5AstyiwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758275961; c=relaxed/simple;
	bh=mMraxz1KfXDhOa4Lp6riixVKju0PQI0TmWYwlUzbwRI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nGty9+JpT8Ysyceo7nt+PQvfNMb0Aysg2j4NRO1fUEVU76psVj4daPLkVqMm1RvsoOE8R8TS+CNgo/kHizlrZGDb0vz+z9ZQXuUJm9HSgsDWeFbUpLVHBilHogdl3INFo2TS69YWk1tKJwWAv5TRO04QD5bAtt7ywz7CZXyCPeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=yfjJbs8z; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="yfjJbs8z"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-61cc281171cso2726024a12.0
        for <linux-clk@vger.kernel.org>; Fri, 19 Sep 2025 02:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1758275958; x=1758880758; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xJg7U22MK1JiQA5LO5CM9bHHIrHca1NYKtGFQsxP4r4=;
        b=yfjJbs8zJsQGgpDtUh+/DhjEBnUciTKP4fenL/W/StDYTtrH1s01OgdQ3nIlhvowS8
         T4RWct+vVfttatWB3xNrqwyebq4K2v44o4Ta3a/Kd42FKQhI7d66eMjw0N0AtxsWRLMh
         a2Xp32jmSJMVkMlVZ+ErCkdLErJWasksYy3gM7UiBUV9f0UPAChKDJrB0NQwTUGgfTS5
         YZVYKNvgZWx+GssTNrCc1JrQgGD6A+t8j4g+yNJoRgusmhOsvsYMzE9wEYL7dxB5R/Y9
         Z4KOW8N4NW+Tt4tgpMRWu8+vvF/hYjwa/4IPmQ3eEGxAe65aCv0iOmzQVY15B3On1TdW
         ZC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758275958; x=1758880758;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xJg7U22MK1JiQA5LO5CM9bHHIrHca1NYKtGFQsxP4r4=;
        b=td9kYLRYRyJr0TIQU6VNxr7YTv8y/svJQGCvU4mTUU84tLW7khLtUhCAPGENsbYvs9
         jp8EVU4GBAn0cIpEHEq7S3q4YGBufu+43O8GCMmLd+kYe0Y8WmuDiWe04gyANxLDTWyX
         f+9YXsQLILFZhd3AZ/sZOtuOEPfQDtHiWrmvVYiaSNJJEFBisQToNxr8dBrqwEwXT+ab
         gkfEQRs8Iq8XvRV0O6Oqbb/C+wcWEJDjiostXRzKqm6NHHd0L2+0Y3vtPqYSy+GEgDdu
         JZLG1kj6qXsr5ECa9ahZql2umCDIdlBES+ts+ZLqnS4BtTudjXAOKWmgiqYicNed9aCg
         1/wg==
X-Forwarded-Encrypted: i=1; AJvYcCXdvyHqrTQdyKpLmLXXANzswKPEC7MJc5HKlEi+EyAVn7a2yQyahrlLaqmiNzLefSA6kvyXbgFPJyE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk8NECXEPslQqnxov3avu1LT0LYBGeDNCmRVpt8AU1ufaw1mz0
	WDQjusD2BSTpqzIPaRarBtLR+/rhFasw4tSwPzH8waQHMchckdm9IFj2LglLVrsrJWE=
X-Gm-Gg: ASbGnct97qGUYlO91krmMy8PsM4y9DPAsV2yev3oKJfODnt/Wh3sehMHLt/vEkC2H6u
	XqaEFiUEsgzgXxCoqW159oJVDcvEDgFF9JAloPuYvBRXziaf+y8TZCWjqFk0ytNjEJgDjoE2RS+
	BBr7wQTY0PydepOQm7zZgvTcl0I094BgtfAtE5QmCjPFUQw2H+waRQxQuqVbXMHTK+PHUjTLEfz
	FMXq9OCeC3SOncbqu5aoz93JBhCQHnf/iFKtqxSQf4d0FVh/Jj/SHR+hUlZhFmVrF4UEIk/xfZI
	2cl74cXeqUOhmO4nhQrvRjP411A6geIa3zW+1kz7YkKlZKCmreZMN/cFG7yMv2qRNGsC/4AI5Ly
	ROCHMRp7/4Q6FsaNAQlvgLY0f9piLaIrATjGNUEI4LWHVEzt4FmRFNduxbz/nxTJ2dLT7QA==
X-Google-Smtp-Source: AGHT+IGVYm9E/cx1SKKQgvlhctnWTkhe6Z+JABeK/WVkRlVG4Nq2CQ/rYTfusBlwv0oZAUdV2jr6XA==
X-Received: by 2002:a05:6402:23c2:b0:627:f3b4:c01a with SMTP id 4fb4d7f45d1cf-62fc0a5a09fmr2234196a12.17.1758275958517;
        Fri, 19 Sep 2025 02:59:18 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62fa6f03008sm2972107a12.7.2025.09.19.02.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 02:59:18 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/3] Add MDSS_CORE reset for SM6350 MDSS
Date: Fri, 19 Sep 2025 11:57:22 +0200
Message-Id: <20250919-sm6350-mdss-reset-v1-0-48dcac917c73@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAIpzWgC/x3MPQqAMAxA4atIZgNt/aNeRRyqjZrBKo2IULy7x
 fEb3ksgFJkE+iJBpJuFj5ChywLmzYWVkH02GGUaZbVF2duqUbh7EYwkdKHv3FRr43WnHOTujLT
 w8z+H8X0/9sPIj2MAAAA=
X-Change-ID: 20250919-sm6350-mdss-reset-d7ab412d170a
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758275958; l=860;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=mMraxz1KfXDhOa4Lp6riixVKju0PQI0TmWYwlUzbwRI=;
 b=nEOvSMIjb1EJx8t/h3B9Qt+6O9RQANHQ/rfdz2FT+zMFtNxpXQ4F4ptH5JHP5tdcBoV5FrGri
 a3q1vhC481vCmbBR9Tm/W2lJACJtJCfDyKcCaIy9h921kC4lQ2W+72x
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

With v6.17-rc kernel, the display stack needs reference to the
MDSS_CORE, otherwise display init becomes quite broken.

Add the resets into the dispcc driver and add a reference to the dts.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (3):
      dt-bindings: clock: dispcc-sm6350: Add MDSS_CORE & MDSS_RSCC resets
      clk: qcom: dispcc-sm6350: Add MDSS_CORE & MDSS_RSCC resets
      arm64: dts: qcom: sm6350: Add MDSS_CORE reset to mdss

 arch/arm64/boot/dts/qcom/sm6350.dtsi           | 2 ++
 drivers/clk/qcom/dispcc-sm6350.c               | 7 +++++++
 include/dt-bindings/clock/qcom,dispcc-sm6350.h | 4 ++++
 3 files changed, 13 insertions(+)
---
base-commit: f83ec76bf285bea5727f478a68b894f5543ca76e
change-id: 20250919-sm6350-mdss-reset-d7ab412d170a

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

