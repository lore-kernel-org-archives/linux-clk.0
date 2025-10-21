Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A6C336EE1
	for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 18:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761070190; cv=none; b=XbyCGoqvvWedlMv1SnhfDEvUtaQ6TVdx2gVoc/wE4Hu8V+hzGJk9CmWRDsTRZILd9sYuyhKPdMdCLoGWawFirkhxvG4rD4XxZUXhEL+VRPJ1Kq8oy7Jz7GMh00bSVr6HZgJcv1ILj/pawbx/zDQI94m8WRmfmIVEXQIf6H61kKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761070190; c=relaxed/simple;
	bh=aRp9PLA2Ky1tVA6uHK/HKcddWUGAl0+QPgh6k0eSPvg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TE/3Ku5iTRwh4c0Ra/X2VHeCvG9hvm7bVixGhAEYuqxbxRAWnulb1j9lohLN1lryUYgxubgtyJEes02QDilSTc02GCVKjcWRPZEGgYOWajbsQd+9kFiTAR/0Ex12KwmADQnzqF6mFdGBUit6sqFQ1qEAHlUxlVSee9a21KVPgz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=qw5BLrfu; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="qw5BLrfu"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b3e7cc84b82so1142726266b.0
        for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 11:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1761070186; x=1761674986; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ruRUvdvkZoLr2jJW0Z1cLwXXKdDFMs/zL2a1Mukfk9s=;
        b=qw5BLrfuRyqVv/RI69PT48U1aQMImgHG4w+IxtLVGQ507YWzAkf/bbWVpcmuHRJBzj
         K/Vxu8mvoIWV66ccb3pHFssuCO1P6Ominbff4HBiJfYnv++HhDU+M98uuD6UOr8D+RLX
         oX0nsuf8KhXvVQJlGjvb7gPKjKNGk1WtKBMrt+Jjo+N/yrJgB3CpMUoLnO2emKkHm8PB
         C7k/qkEGSTeoxabXWNsYdx6oUiVHVqluN2+SVLWiQG6GcU0pZsswroz6rJC1L3o7APtd
         wos/GbE5AL8udIAcGT9a0k7vueCaQMSkDi9f01o2hU5vdB62iztixttAr52d4dPcpT6u
         oNpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761070186; x=1761674986;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ruRUvdvkZoLr2jJW0Z1cLwXXKdDFMs/zL2a1Mukfk9s=;
        b=W7FSMa0m722dVkSNXeYa0kT6qzbmLlaPkXNx/TGzomLqPXxMuAy3LmRqQ3iuNGQilZ
         W8N6ZCi+FzCnn6j35g8JqrP0jspiG/P5WhRH+waOUsenZGow/HVxLFGH0spv+SqKDgKy
         JB4MhPuw4AWom0/EM0/242DP5J8KBy6yhDTYILRIJ52QgXdAnyvPX5CNOyiag5Af7jLA
         D5VhlLoWt6bR+31dponKdaLx5ssNm9Uku/LThXn7iRXBrDNtTQCT3Oz3QD4vmotiQpYy
         LFEenwO3dXs8QCggYAa7QeuH90eD/CQn1k6df2/qkXMWKoslP1M8olwgIiIM2cyYV2ad
         BCsg==
X-Forwarded-Encrypted: i=1; AJvYcCVeSVRLOARtsDLppw3uhbm+wPeGr2+joKWaR/aI4RSgCqVtjq5TpiOrdKTJWUUpYw+xDLcpp3o4Vfo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzypU/F0xGn7IIvyrpHoquv22RMnFRWAXcKIXBZrwN0ogDgd8cd
	R3wcur5jm7XlUfM+37T3lHXXIvP7r1GWRFul5o2306hnjWM3c6Odv1xI6zGJ1U1wWdA=
X-Gm-Gg: ASbGncuG3+hbRyGSLPQ1zBW8Yg7OaK85Q/WWheyskDIbPpq6XbBsvR2ZqxAFHYwYMo7
	Q+5dnJmZTWGmm1Aiip/+AeXgQbDbFW/o6Dsr/G7dLPpsDKddvvYU39JxaOK9eWGsGOAo2UIQD8/
	A0dvV7pHWu7wGXy2vDwTuNRX10yoO5amm7ihOvuVQswkx/tQtRyzTOoYlmR7nzv86V9agSiJ95V
	rEFPhn/UUHh+0SgTO+CDuWHYGSlCJKGGFydoidJTScY+gdslLRBlZmK6hrFCfkDRudxaQgpja+y
	53Uoy/bdj5DVMTuXdxGXLz7rNZkz3/F6TDSavdxi95q5/GuDoCY9zyy9nw1/Jjoc2gBeb5XLpHA
	IzkxkTQumiIT8qV0jKIlW0xzh6jNrcY4H1Qzp5RFhveRu7Y8esbGrvIC9m9W5Gvx2/27FTo0vNU
	iNnkQS4bSLlGJ56mBKRQ==
X-Google-Smtp-Source: AGHT+IE5avVzpvShmbvSnzjVvBNOm23bDLEnbiX6D+4Il8N66SDi+tTOysqbM0IZc2AcphKPy6ifOQ==
X-Received: by 2002:a17:907:25c5:b0:b4b:dd7e:65ea with SMTP id a640c23a62f3a-b6474b365c0mr1913226566b.35.1761070186373;
        Tue, 21 Oct 2025 11:09:46 -0700 (PDT)
Received: from otso.local ([213.208.157.251])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e8393778sm1116758166b.24.2025.10.21.11.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 11:09:46 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Fix Agera PLL config of CAMCC for SM6350 & SM7150
Date: Tue, 21 Oct 2025 20:08:53 +0200
Message-Id: <20251021-agera-pll-fixups-v1-0-8c1d8aff4afc@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADXM92gC/x2MQQqAMAzAvjJ6tmAHKvgV8VBdnYUxx4YiiH93e
 AwheaBIVikwmgeyXFr0iBWoMbDuHL2guspgW9tRawnZS2ZMIeCm95kKOnb9QnYdqGOoWcpSzb+
 c5vf9AGVVLs9iAAAA
X-Change-ID: 20251021-agera-pll-fixups-dad6b12c715a
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Danila Tikhonov <danila@jiaxyga.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761070183; l=921;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=aRp9PLA2Ky1tVA6uHK/HKcddWUGAl0+QPgh6k0eSPvg=;
 b=ZZm6/NmPI1u7xNg8IcgQWaMv/5laGL+vT63Yqr0y0G9t5kzsMV4D43xY90DReDodb7sG5F7Ga
 lYwR2fsKLeEAlTe4FrguUevMwr8AIOwddbg+Pd5SurfbMzZ1i0MXvEQ
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

On SM6350 I noticed that CAMCC_MCLK* refuses to turn on (being stuck on
off). The cause seems that PLL2 (of type Agera) is not configured
correctly due to the implementation in clk-alpha-pll.c differing between
downstream (e.g. msm-4.19) and upstream, and therefore the USER_CTL
value is not configured.

While looking around, it looks like camcc-sm7150.c has exactly the same
issue, so fix that one as well.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      clk: qcom: camcc-sm6350: Fix PLL config of PLL2
      clk: qcom: camcc-sm7150: Fix PLL config of PLL2

 drivers/clk/qcom/camcc-sm6350.c | 6 +-----
 drivers/clk/qcom/camcc-sm7150.c | 6 +-----
 2 files changed, 2 insertions(+), 10 deletions(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251021-agera-pll-fixups-dad6b12c715a

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

