Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A1E38DC5C
	for <linux-clk@vger.kernel.org>; Tue,  1 Sep 2026 06:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788245087; cv=none; b=mOJQU9QGlPJNxjc9otOiBvIxGqRd/cWXoYl0mVCLBthrCpeM1r9Hnv1jshypGGOxfiJJv19eHuHj+MLTE2ushdq9Q+k02ywcvV98+n+ylQoUCsEZzJJPwBwd5n3RfpMHI1+wEADEibfLKIleLhXHyWrsc0YsmOYD2Qqk1HRjxnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788245087; c=relaxed/simple;
	bh=HpzD8eE93G0QF+A2LkG7W4+8iO6y5XPc4Rl8E5Fjv8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XpGQ+rePq7ZFDlM8vvPrWzoFjAZumUeiyVUbzEjNMvUlZFsjlf1bd391AUKkLmnLYrU4xI8cV2kil22XIkaiYaBwgiQwyfrrD7+bFdR6i14tQQN25sKmfoMrnUgJJ7sPTZ1o6CBOIfvnWAungfPKElQbCYTlEurhIabdnTCECQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lQYbTE4Q; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQYbTE4Q"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ca80d708489so551846a12.1
        for <linux-clk@vger.kernel.org>; Mon, 31 Aug 2026 23:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788245084; x=1788849884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dCothkY1Rqth/F0B2N1+XSPKgmCrj36SkVxYCdKHFgQ=;
        b=lQYbTE4QqGdE0wQwwuysJR1UqNoFXLSrRZ+BftyXSrgZAzPEI4/M2xAAxr/EgMzVrN
         GrgD0PpRQJkfl9wcpCLCbRNC9Cp4rfwTty4HQqLcdrVAlwr/Z6V2vhZioofHYsXauKFp
         TZXdlDgYSOywXqb+RfUx2kDECKp128UnKWTEiy5PlvCCChZYFli3i6Br3ucosVUyOUk2
         jm8AbEDcHN2BRE4GX+Kgk7+jluxRpZl0719cKD8RYJQuc4DYTjRbbSWJJoGpP/sLb3+u
         HPAYSCnh7NBwRS5vfrknYI6qSKILABg1k9cIvy2bLDHrR7vAuBz6vVsCd0iRH3gUKEz/
         +orQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788245084; x=1788849884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dCothkY1Rqth/F0B2N1+XSPKgmCrj36SkVxYCdKHFgQ=;
        b=O/WymfCWjmfNfD0Z9rFZOcCyzMTZQm423DLiyMxcCiI8NcRGcvso3WflcBLDO8IBnu
         bySzKtoEGERnOKm1HU5h4GhcmKxKTIW2dBBAKhQLcIcjnt4htFqUaM4c/N3IHFqZPY+7
         cSSLvG9k9F7ciAQWSUhZuOiBY6xFm0kULobg1b25j1c/uKM3koK5lo4isKO2hzmh+6PZ
         4Gn/KF8PAZs11/wlFeFl5YAYGRX2V7dLKitBr916WiQFdgBVFQTB/glQyC6BoJfvQiie
         pjCgHaN/8h/TnwV2gZGSLr1cQJ4ITNUPWeHnZSRl2U2Rg/KPsEV2bj4pOuz3uJ0vlhyK
         48LA==
X-Forwarded-Encrypted: i=1; AKwUvBzla5zw6IOxW4HIbhTrntIVshizpZiewCoj6n9uhZq5xo2YxWs7nfPmkdNDI8g7Lj7YgoeYxeqcm4s=@vger.kernel.org
X-Gm-Message-State: AFuF++lvz60utQNAAgCsd8KbjiWpaX5HX3ytbpsf6uENpoXLq7XB3LfM
	O3yrOEgnJxxi1jyB53qROjlM7aNG2/VqehePTQP9lUH1JtO0eHMd/wFz
X-Gm-Gg: AYBFou2k/YPpSLYxafz3gbNFTisV6Pfdx4Z/QtjTySL0505mnUOb7x9spMhV8iBLTA3
	nOCeHT/9Paumyt7JsuoK226DznFQ9lhmJDCjILLqiHbIUf5Tx5Tz4z9YMLRF1vJCXBslm5fYuDK
	fOwEr3hx/3FMnDAEQJL6eP78ufKMvVdCgZSFxq3sWlnnCSfscjdVK7NBlRLFDWMl1azdXlxAmWk
	QbQLqg3OrVNCZIS6tSpj7gzo6iyF3v023EJsSyBhDX4gNPZXLy33AnZMEKilg/V6NNOI2xhJJOu
	nEFkxv7VMlZGwovz8BqbRpzCWPTxaG8MLvm+y3rWlewUe3KdWty7D5qaTeCywDONM1BKIbJRtII
	sC+Rf1wfAaAVVEdLS0O45FuLr/yMJGSz+wQmKK1Bm7C/GLry/X/bx37zsOwbgrl7EnmRtSh8Kor
	RPiX2rPUvcOHdikxKlfcVsxVviZgoILPkm2b2UXbCHv8RwL7Z/OuBtNh6grbwNWxAB3x6Dd1nbv
	imvhfOzFuDP
X-Received: by 2002:a17:90a:10d7:b0:38e:42f5:d096 with SMTP id 98e67ed59e1d1-3990f1b223cmr1809753a91.0.1788245084147;
        Mon, 31 Aug 2026 23:44:44 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-328713b944bsm37019784eec.27.2026.08.31.23.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 23:44:43 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v7 02/12] soc: qcom: socinfo: Add SM7250 SoC ID
Date: Tue,  1 Sep 2026 06:43:47 +0000
Message-ID: <20260901064357.20055-3-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901064357.20055-1-sreeshankar0910@gmail.com>
References: <20260901064357.20055-1-sreeshankar0910@gmail.com>
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
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
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

