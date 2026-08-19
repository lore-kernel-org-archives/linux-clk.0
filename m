Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08375313E38
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 15:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787153195; cv=none; b=EQpKQLw4mj6kH9l/twUh+YKxPd5GWcQ+vn2o+7CJEMLSpxvStDs+b+3up2rNY5XMEhMnxx7v5tQzkiAFRWRgZAIzebJsKAl20XU04YxJOszLHUGlOzuaBhNkKOJgUF3vQTzhoblc7xuxlj4Z4BTgPiFQ1F4oM3srNwI24znNMcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787153195; c=relaxed/simple;
	bh=N+36xrUjkOa1sFBgSJgN+WTh7PZ3GhdlZultGg/uzmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oMpCwwFY2PzgrzpAgsncjK9y/bfPsHOUIgunE7/4nUs6YNLN4SWXxj9sFaOyiUSMnxo5ylwypv86BrYYfT7fVm7vfKZ3IHK4nMBNt5m3wfBgcqudkSYQYw0te+JhjasMAqzbkMuWGHOj8KsamBC71Gg3YQ3Q4mnG5KIFBOniwW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IbvHjkvn; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IbvHjkvn"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ceab75934dso13464045ad.2
        for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 08:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787153193; x=1787757993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5FGrDocbe45FnzHVdI0AJ39xfusQIB2gkHqvovUs3S0=;
        b=IbvHjkvn7Jes6Hy8Y30bWuJBvBh+Ic0voURZ8J9Ptrq+o7Fo7ZPOiD+ERrnkeSpJ5C
         imNpKB7+1yiiWLHN1q8XG+kWOPmvISVwMVJWTAfKf9wcZHIie5DibOwpDERTz54xOhJt
         onDQRDOxDRtXYEkoXXzuKy8CFc/GX1uNftG4/Lq/z12PwFSGu7Wux82gFxK1Za7mf6aS
         Kd/spScH64RkBUH0aqF0bQlSFzpHLT7ITLCf0pfqRJmK/0qjhCi/cg7jMWDDoSTmCwL4
         4EKaG3H5PaZ8fnKZSIpR9emMD7Fm0bdyI4J7rShPC7fNdynl/708YayLUSLcawqjJK+u
         g5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787153193; x=1787757993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5FGrDocbe45FnzHVdI0AJ39xfusQIB2gkHqvovUs3S0=;
        b=Wo3ler4+H9h27DV6koGow6WaDNjNhbmTiZ43yeZIIXrd+9tnNXVG2AVX1tvLomrTZi
         fFN7KcFqepbnJ83976mnU7wpwtDfVLRP6yCn1sx1lvV/lxkhTJiTSOIUcXpoNGmaKyKg
         GcU/ruqQ56dV+wgDj73xcbpF4ez8f2kkgHaNePLeMAB33hvU9hH2dE/4eXUN7FBaUdL4
         s4GzsdvRlGHtvzqmfpq8l4bxEU238SdTvYdsLpK7cDELpBAySfChZ3bppLadr4qGjBTi
         pEDmaM2Yeh2DJG4AwEzOlojXpAPFuis+wHPUMwYnGJZFbxyFiqqcNJ3TghXqQWkH+mk/
         LqBA==
X-Forwarded-Encrypted: i=1; AHgh+Rr26P03NdPlzpq7WFzxLSVxpsIcVvnPr57FzRJgKBGC4a+5y+wuCohl5TwD3fq8sAOOi7Y7H5YOvT4=@vger.kernel.org
X-Gm-Message-State: AFuF++mbC6UCi97mnkQiJja18vbc+Tqcq8ZuBtGulfNuowV64XzoZG9m
	9+m7F4VZcIjKnxHnae5Rmu1QX5jBJyPsLPGMCBGGsQypH1ru/7FUzO05
X-Gm-Gg: AR+sD13wwO/ITo77qypo3sHLZlgam8Hx9MU6dB3/ktKWVC2onca4l5aN3lccSiEvwyo
	7wmVRm5qGdKyjDWM1aLtzzyQTQJ2Z7MRWcW84+v08O+bVZhEVrPm+w4CIbBo6b2aHEAtvBnCV0D
	Nc/Eg8smkOTV/0m4B+9Bkf1FYugljjg7eFf+gtM0gmOK3f9QZt8+LEUGAHz0iBF4ZANlQHn89Cq
	Ro64lMavcNqyjB1rcE4BuzvpirBZy9K9CIvXwq5AKeMK8fNq9xwuno+dRHGAxVbZ+Oa1z01wKlj
	iLrf6HP3AqpQQJjfMHhe4FgCsX/E1972+6xq9VEhURj+lf21K69C+vK4DgQvjY5qf1iwrw27zvM
	3m8tDiQbNLX2wB2bh5tLS/nA0XEVWL0OQpp1jWtzhxjRp4QNcJghofzQ+H8FwoTGJGT6ejgAXFE
	3ubJrnWbHe01jbYw0nBf/0y6Tl0n0VVK8sDstV6ZW0izsHQWlsqb9wKLSInaMpBDvnodYY8kPWJ
	oPYl2Xo8XA=
X-Received: by 2002:a17:90b:380e:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-39581212176mr9795535a91.9.1787153193270;
        Wed, 19 Aug 2026 08:26:33 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf14376asm8232838eec.24.2026.08.19.08.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:26:32 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	lpieralisi@kernel.org,
	quic_tdas@quicinc.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 02/13] soc: qcom: socinfo: Add SM7250 SoC ID
Date: Wed, 19 Aug 2026 15:25:31 +0000
Message-ID: <20260819152545.3934-3-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819152545.3934-1-sreeshankar0910@gmail.com>
References: <20260819152545.3934-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SoC ID for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 1836e226a..63ee5cd56 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -450,6 +450,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(IPQ8172) },
 	{ qcom_board_id(IPQ8173) },
 	{ qcom_board_id(IPQ8174) },
+	{ qcom_board_id(SM7250) },
 	{ qcom_board_id(IPQ6018) },
 	{ qcom_board_id(IPQ6028) },
 	{ qcom_board_id(SDM429W) },
-- 
2.43.0

