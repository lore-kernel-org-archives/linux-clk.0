Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DC23630AE
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 15:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787326875; cv=none; b=dNM+fh99QgpEFa0AXsg8CC5Mx6U1lfrobkjeCRHy2fjfPC7xlTGNtT/MM9prQfwoZXYMWw/qjrPVHwuwyDwbrEvwuK+ulgwP9sAxV0YDtNmaRNTLWKt5NzXI17+Hd+32WrVqhj7hhEZgMlf8R/DKUFWwQNRHkl/eN3P4lnY0Jp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787326875; c=relaxed/simple;
	bh=HpzD8eE93G0QF+A2LkG7W4+8iO6y5XPc4Rl8E5Fjv8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s8m8XfUWlkPFDXf0Y3ckR3mAGH/abhTLbIiXAGf5BGTvUgtAY3T/JqRxUrASi/cU/XjKiiPL+j3tY4I+SG8RZvxb+4DJ6B2xoQF84yBKJSmkrmTYV8TGbMRyviGp2aDWLsXP6uTezsh1STQe1eDBOqGvYhvV03WLPAl6qYiLvls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B5wmzQ6H; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B5wmzQ6H"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so793088a91.0
        for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 08:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787326874; x=1787931674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dCothkY1Rqth/F0B2N1+XSPKgmCrj36SkVxYCdKHFgQ=;
        b=B5wmzQ6H3qCVvb/kiwpVCc3GorS+NW2Zul14/aoQqZsgbRooEgmliA7t83ZK9QdaP3
         azNf1qIoB3/1Iuw1dHVJHqeb6mj5Trn9aYLwdHTAyxetxXR9euD6uQEvotKStzp1DBzN
         y66mMCumE1+NIiCyhQb2J8QDiPQYAC7DU3TvL9mT6JdYDrdqf/aa58lGYfzPWq7Okc/k
         pLRyGUo1bb12DoePiz7kOjyB1UCPcGRXEur+U1qwHsG7NhwV1d0NerBfHYOZ+AFToVAb
         ouJGEp+JddRzLWXtWNTSaGFDOgfz0rhDx1kswGF5bqTBK0sv61HQcM63wnCqzp+DGfdD
         GsqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787326874; x=1787931674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dCothkY1Rqth/F0B2N1+XSPKgmCrj36SkVxYCdKHFgQ=;
        b=ethZOXG0BL/l6cAA/sH+aA4MpvWNnvQJM/IKQ2jqwLnODKxQ+bqvM2zb9++0QymbvK
         irjoj3XVi0z0XOkCIEvMNpXV84dyN+zWcYUd80F2FdLFdt1ybIscoI5nsohe69s6+sw2
         5UXjn4FUkNBitb0lYH8ZTchae13kkuyFbjic4WWkzJzYrl06PaADOZn2pGrIVby9KSP/
         Tvj5beajKeVO6oH/YgAgxvo8phPmtP2Q4TeqQyLx/SXYZaLY5ECIya30Zoic+M2HzR7B
         DLwWDylwPPgxS+s0/MReGulFhp2p3rHG/mfOkVBc2NxITXx0r7Ig/FgMIkC3o67x9Lyh
         vzcw==
X-Forwarded-Encrypted: i=1; AHgh+RrCuARTHDWiydQBh9SL/Hg1eHYWmZTPTgGfqpl9t39UQG1mmBvsFNoRAb1kGaUBzc0q0hQg0onem/4=@vger.kernel.org
X-Gm-Message-State: AFuF++knyMRhdi/H587S+yw953UvaV8AgZo9pzzvfoJd3YzcSFvfm1iw
	vTbadbLczoJXX1coZadktTnm6+c14UrtRlSgLbDyF/3q2wgrbjuD5si1
X-Gm-Gg: AR+sD10uB6H8DhUSRIeHeTs0hACTIEm6fVFO79AWDRri1nZKYIksqcKbhicWK8BLRXO
	ge+/9NV912g8mcjklvePzV2Ao3QAfICyQboUYyLvnuOXgs8ag1ZFnfjkveltSBLzHmr5iilfM25
	lnRpKhjTuNdgdIgZPVny0VuDKJQiy/85Yv9bDtEq1fjYt5+lUrI1XTgyCL5nfarg/yaF7YgWfVo
	gzU33B5M6WGdFayZrAVRPRezWSPUcy3pLpjO424CqbauQeOjNlhPOJzC3kmcNnBrBHxLI8yvPiK
	eEXMhKh7H6UOTMElo639QPe/MAesQEFAhVuB2WUkzLvDXNFElyEda2kJFtf3S0QMYnAG5keNu31
	FpNgTgoL/SP58O6bacXjmRpDTKoa37c8YbyGHlyiP/sK3i80O147+6X3NWAmdAWrWje+JAP/51y
	A7r50XAcoYyeWVp8BFlKA91ATnlXV6BvKXaOsGGALSmRogRKyWP+q9QAaCsNHev7H1zMvTtUkCl
	FQ59Yk0uIL4
X-Received: by 2002:a17:90b:388d:b0:387:d9cc:7dc3 with SMTP id 98e67ed59e1d1-395a074a348mr20056250a91.21.1787326873816;
        Fri, 21 Aug 2026 08:41:13 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae5f1ffsm42903185c88.13.2026.08.21.08.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 08:41:13 -0700 (PDT)
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
Subject: [PATCH v4 02/13] soc: qcom: socinfo: Add SM7250 SoC ID
Date: Fri, 21 Aug 2026 15:40:19 +0000
Message-ID: <20260821154030.2514-3-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821154030.2514-1-sreeshankar0910@gmail.com>
References: <20260821154030.2514-1-sreeshankar0910@gmail.com>
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

