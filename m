Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07D236E472
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 19:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769542048; cv=none; b=K6hcxOE6QPtA99Wtf1f1YmLL+qSlJKN2QpAu6Y4tp1X+jVLWuji/q7QHqUkWwKxyU3TlSdNrip+k1VRk0URXpLZyYYVMr3wEhEd0nMmtpodhHFbyFGH7Qv3/bOrMX87/tK1fQH9JAcBtZTtJm1ZUrYqHbyQnoBGQXWL9obWSWNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769542048; c=relaxed/simple;
	bh=4oyhsvL92/W6SaipuEPDVxPDMNpnID8mT8emKAyjkSA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vul/zq9Im8vF3Mi70S+OQpDrmRiiKOuduA6W2Uk/qO3hNfFoQrUOcGsOIjb+9JFdPOTIPlqR4JqIOucE9bHIvzfIdwSEs/4qtrIUFMrrwSzzelG47c5EedtXql/yKBirpTovIMmaynPjgVhsmbo7KjBGz3LGildKdI29NbtREZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UYHj4j5/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JWg2hO05; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UYHj4j5/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JWg2hO05"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RH1xRI1334303
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 19:27:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R2bEMfrvG+BG/GFJ/bryXnEyoZu75Z9QE5XgUVO7MPo=; b=UYHj4j5/kpnAINPE
	T3un1S+7SbF7+OmqRM6P0WhuVk3OmXRLPNTzaoLOIJ4UcxHTwQcBUqCBaOTwr95S
	KDLgblvdil+o72DlG4hO7IQwXBJkyS4HY5HvTkIzaVy9ZS0VJgLF3XkNroeZUaJm
	oGaa5J76//22XuHsYXyR1uLsqX6aNQodmmxBhBWbYCabWSCdQOYwGHfiFwMO0J7V
	5nApYB+BKizUHTT2whd32aBNeS8YH7m7pEBICNuEJU/KCFfIDCI41IS7otBUk3tZ
	MuNFPooc3u7MY2gIT0mBVjffmPeaks9RQ0WhUvpRPQZ4gDZ9u+BgaHghY7kLVSC4
	qh38NA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by1dfrgkv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 19:27:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a7b7f04a11so27950865ad.3
        for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 11:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769542045; x=1770146845; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R2bEMfrvG+BG/GFJ/bryXnEyoZu75Z9QE5XgUVO7MPo=;
        b=JWg2hO05879upO1Bst+dLGD4o1o7YBh9p9hzsR6WL95SbXiibOcI3GwMGldMie6sqh
         Sf/4m4Ta5TSGA9psEliMR3qP3Div7VrE9aLKt/zhk3rCi9aiKVGdjUjC59OU/ke2OUIV
         qddIZKM5vziMVfHnPRY/icArLcShZdJXxn0mk4RJIXT5sUnIrk64olciRNgMVOsKSVPk
         pqEWjYezBOykmclPnYGnbs+HFWpIx0KtSNH2cppaCdY/b8luVf6NTXHm1cY5mVDeY7LG
         Iu/EJ9quFOR6SvJGhF2z70DTLnoG5bKMYWdgceazsFEyoMxIMNNvca3Rr4+nvmg/BRVP
         sywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769542045; x=1770146845;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R2bEMfrvG+BG/GFJ/bryXnEyoZu75Z9QE5XgUVO7MPo=;
        b=J+f7fRdNezguQLrBPj0tYm49F0rSi6uY98PkAgZU/zMgTzdjqEEdIwbFWeJm6rfVvQ
         7z4J1+aZY/ez6W47lBB++Akb1p4XF8zTJqaOVV0gCmf3TCyLK477TEylz1d5smRR3qCu
         iHhTy2nJNDg2tyMysMCgY7mGPZGravG1cX7pIBltUtrumGmsG+Bwdsge3YIgoCFqSajQ
         43ZZO/kdVA5fnCwGxwYSDt7M82VZcH67z6Wk/uC3zNnQWlIIqeIBj0z73e6O6fo9Ynae
         FEJX6N2RL133YV8/zDz6MUrkAQVJEASf8iNktlFn5pbjB3RpX+7ZxnBS8YFvvQNXs+CY
         FwcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSGrTxzb8OUhTfXJZstUcyit22Rq9zDQsIwle3eq3SgD48RAYh6lgWryNI6oy2XwPF+z46qaT0udA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhltKsXLJcvRMG2k9OouSXgNdy1Zm8RR/RpIWxRvc6PBllQAPV
	r/gMVBlzzIz3V+r7A8EWHsqUprW4A7sl0Fnt/1uPJGICKi2YCqpSwu2mjlpYMcnXPw+UIY8bgWM
	5xgBUbyMpabIymHcF8fX0IVxx8Dz4iziBn/UMbTl+gypMA2+FxndiQgy7OvQizIo=
X-Gm-Gg: AZuq6aJj3C34/8gxPL996m+GNYrE88qpdoslfSb7xNEINSUYvvjnQ26nv/bRYzkxxwZ
	lVb9wdwSARrL1Txygtu+ZoalXNwl68YmHaXAuAJqhvLrofKXQ4D5D+mNuUO1iEDfxF7zlW+1u7/
	HtE2K9jRK7zQTO4K/tc6m7iCjMjSEzriZhkQztYzuM3/zHnZgeKZ5EOTQihptzYyAb4MQMdcBL4
	glhwidu2n393lTv4I2X/qa3UYOlJg3NckEwlrZtvkjA0ywdFt/yGaGaAh9lFn5a+QxEvhyFF1+j
	1wqj6bzT7KCb017h7WuVLo97hdjikZWnzNuwQw3uP9fHH2uR3FaNFp5GjB1qX4tFTLxeWvv1TGW
	GewrE2VCNiTKzVi7o6NnA+fRk8C4fRSdMlua9Ivo2
X-Received: by 2002:a17:902:d4cb:b0:299:e031:16d with SMTP id d9443c01a7336-2a870e193bamr23418615ad.33.1769542044693;
        Tue, 27 Jan 2026 11:27:24 -0800 (PST)
X-Received: by 2002:a17:902:d4cb:b0:299:e031:16d with SMTP id d9443c01a7336-2a870e193bamr23418335ad.33.1769542044206;
        Tue, 27 Jan 2026 11:27:24 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b414fc4sm1322225ad.32.2026.01.27.11.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 11:27:23 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 00:56:39 +0530
Subject: [PATCH 8/8] arm64: defconfig: Enable VIDEOCC and CAMCC drivers on
 Qualcomm X1P42100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-purwa-videocc-camcc-v1-8-b23de57df5ba@oss.qualcomm.com>
References: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
In-Reply-To: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE1OCBTYWx0ZWRfX+ZXRyO2g5VXe
 4vC5VtgTcb80TpwkxKPfElogfBURa8kKS6DAs92lVb+EnYoQqWlxlXF+4Gnq2unCi0lSPkXhG4x
 y7pppIu1rIq4W6N4nng1tFox4GN8wafqiJOArvLQzwhGTpsaJz5+9EiK1ZTPg6Q7DDCV8pHoLxl
 FiNvmwNg/y6M8KxXmD2iVODNtzH2D+2ZyC7WZ1XW++Z9oYHuibHbsIpoC41cEhljlAUu2bEV/Ty
 V/RqsoHAr8sfkWGRZAuSyH2z90kuW4lD/5mee1hAfzZa20CtegeTJCkvOPy6heg9v+viigM2AVD
 3i9zss1+Bja6tgL5jsT0shGWOcUiujEXKmv/IHeqMnQNm7V5+dUu3zXPi26zrUs9XjgaJ/CkIGV
 a0SLMVXsVQ5MQ3+rcaXoP9bXqDc61QyfLb3uf15Lg8a9MTZx3W0Wi0/NvNKE916rXmj3p5x9B57
 /d4MvZCPxJct2FcqI6w==
X-Proofpoint-GUID: 9R5nn7yEk1DLTxpCmatTGvCS_VKH83Rp
X-Proofpoint-ORIG-GUID: 9R5nn7yEk1DLTxpCmatTGvCS_VKH83Rp
X-Authority-Analysis: v=2.4 cv=YeuwJgRf c=1 sm=1 tr=0 ts=6979119d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rO3wVDe-YCVyVCuK1RsA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_04,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270158

Enable video and camera clock controller drivers for their respective
functionalities on Qualcomm X1P42100-CRD and similar other platforms
with Snapdragon X1P42100 SoC.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7a6d7e70d38352a3eda4a39c39a9549508b3b944..50cecf05027e6de754771b9ab5195216f908f859 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1461,7 +1461,9 @@ CONFIG_CLK_X1E80100_DISPCC=m
 CONFIG_CLK_X1E80100_GCC=y
 CONFIG_CLK_X1E80100_GPUCC=m
 CONFIG_CLK_X1E80100_TCSRCC=y
+CONFIG_CLK_X1P42100_CAMCC=m
 CONFIG_CLK_X1P42100_GPUCC=m
+CONFIG_CLK_X1P42100_VIDEOCC=m
 CONFIG_CLK_QCM2290_GPUCC=m
 CONFIG_QCOM_A53PLL=y
 CONFIG_QCOM_CLK_APCS_MSM8916=y

-- 
2.34.1

