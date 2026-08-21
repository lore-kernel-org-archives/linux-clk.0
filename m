Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3592A42AFBF
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 08:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787299936; cv=none; b=urR/yf5TZAqfnXppoUsdyNjIG/6W+ryC0Hpa+mXWofm6uIuv0d/kHsT9PCNPbaROmYBwE918w3GBbmDTsN35vhL+Wse7h2J3+rTJP1Ow41viFZoqNAjOfg5guSujmMkEQrg7d6d+KGzo+EWHivcc1InMmNhqshOxOaI2S+o9EqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787299936; c=relaxed/simple;
	bh=N+36xrUjkOa1sFBgSJgN+WTh7PZ3GhdlZultGg/uzmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vd2dvIcf5xeQfUY9t6q/svzY5iPw5k0uU8G9q/iC5hAYuDh8+YvNCsJoRvPST3HthpEjvg1zWBiS+w40AsL30NZayb9euDyFlpvKyCeTBRND2HwXoisu4GcTseSgFi8QGk0UqJ/cJO3h0tI0SJaXzfOupXRJ+2Yn3IYd83kkiyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R1xbJ/ab; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R1xbJ/ab"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c9e607d81fcso461327a12.2
        for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 01:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787299934; x=1787904734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5FGrDocbe45FnzHVdI0AJ39xfusQIB2gkHqvovUs3S0=;
        b=R1xbJ/abrF5H7QpWHIa1HZ4Ka4591QP0a0LcDv5pEBcg0D/Kn/MnLfD2V9+B0K0/0c
         5u2S/1sdc3ySTxvZaRHT8zCmqzDF9e3Idt0GG1kUA8gtCgrLwBL7UldEkSfGSuXZ5RqA
         UQXmYFGGtxfromW0gZfD43V63jS/2kRVokzsLW1I9QUjWzTl65I76SGY2o35aSm9MOlL
         lZw7ZD/xDLAjrT3MbdC46oVN6uCC85E3NeKTvrDo/MxWg5PH76b9mgWA+J5vb4IN45ut
         ndUb/1XsP3520aPlOEBNoTtEHKkudj+vqKX2hhkTFMiyULkeXrr6rBjPeyH4ZTSaDk+p
         ZXuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787299934; x=1787904734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5FGrDocbe45FnzHVdI0AJ39xfusQIB2gkHqvovUs3S0=;
        b=pZDHsLqRehwxrK8nCnvC3zKCOx0M67DXA89Qg2bEJ8u7C5pkV3lOpN4c3haTbSZBAl
         DKr1G1jvlYOZAKP3cTpT+2gR73yRcHxmCSa5tZku1il8dwld3l2uFc5KV/kD4uYZ2YW+
         Gk0QkiXbhzwgDDqPkGFdxK9mAa8ah8KTgcpBhbzOTbPC31/uvXFJ2G4W1kV5qbVNz6ek
         qFWz2neT/F9NDYpSchZXez48y6iDF8FwYS60fQHBAhw+c7Z9GKQ5qevR4HYrOv87e3vs
         BPjo35CSGEeMd+60R2/aLV0X5zDFlJtxYk0+mhjT7P9U4IuF8ujSlSRyEhRs6LxWC/4+
         cPYQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr8r9RqFV1FGgjiuqvTNHUdsyLyKBmbRpdssHiTGzCkeES7Ns4UnBpmR9mIxIt1VC7/z1iNIpskwL0=@vger.kernel.org
X-Gm-Message-State: AFuF++m2OL9DCryxrSqC4J0zcGLwaNULE8cFdKpLd0tnIix7VhhxYewq
	cWYYzgDreqdddKHqbcrs1r1TEdI8iTgxAjz+ft37upqCW31qdQfessEC
X-Gm-Gg: AR+sD122uFru9oRkvbGVBJdJgaaSPZ3/oNWUJG9ZsZUXsBJaFdvByukbHLKG6J/O/J1
	LYAfMb0gtinbQrbO5B9BRe+cJg+MpY2fLUy/GQvfuAMiZtGR24uw4FZuiAHvZDHJpYTo3wf3nx5
	zZZ2RGL0NiAUekPjuUNWCl5oVGyzqro8uxMmVfZR/R3m9bKyPKWrESEZS4EDBVHTBiW/h678wkE
	FFjRg+loF/0XNq7FuDTHLPyU71cFeYD5guiQnwuaDLkQOVSnpEO4WFvvw9NfVY6PYlHNK8bgncW
	DOXHQEJeeghe6B3ibsJ9yvFpSmqkI53W34HWx/GFSaMMcWkTHpSgAOK4VO/XNmq06czxG4kn5Qr
	kzhLWix78D0QK9fO25+R/Iufcc886Y6e7dqBdPoTiIz9cl3MUQOMHGW/1yiaco330eXIehuj5w4
	T1eb8UO5sWZTyD34CdzV4MhrHajuIRS+2BkzpBRMeN8p2GVl1IUj1kX83ORZjUAqyxjE3IxyQqC
	aybIr7X53SZ
X-Received: by 2002:a17:90b:3d8a:b0:395:4de9:b30 with SMTP id 98e67ed59e1d1-395c353e28dmr8357357a91.5.1787299934412;
        Fri, 21 Aug 2026 01:12:14 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae48761sm22040786c88.12.2026.08.21.01.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 01:12:13 -0700 (PDT)
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
Subject: [PATCH v3 02/13] soc: qcom: socinfo: Add SM7250 SoC ID
Date: Fri, 21 Aug 2026 08:11:14 +0000
Message-ID: <20260821081125.4522-3-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821081125.4522-1-sreeshankar0910@gmail.com>
References: <20260821081125.4522-1-sreeshankar0910@gmail.com>
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

