Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D6235D60D
	for <linux-clk@vger.kernel.org>; Mon,  2 Feb 2026 10:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770029837; cv=none; b=Lm3Bxg6Lu96xXOW6yEq33EQTne+8nTPPdoLbhwR1kpcLDUDnEsiZL70TN2wskhy/BZaVSNOmDkPtdXTR1TJeBNW5fhAXra/kJ7DfGaJUfAGBMSW3YWkhs7mpiKcxGHeQE68Hb7PV8WkmHdDVLt23iOSyVBf9RqZUcdgJoWZloVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770029837; c=relaxed/simple;
	bh=mwwR5/m+SQ+W7fXnPWloO0v5qeZLn71VhIfgfzsp0WA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PRFW34oHAuf9VfSbWVS6WFhDJso/Ma+EtTCyH2p76fXPDsAgqambeoLEufzHkN4Wsn5t1i0+yA4iYRiTXTO6rvqtzDYbs/7L5+ozfGo7/znFBjVBtcI5pqZJ7tmJS1XBo7KVd8ufqPo026GGN7M3HRPd6eJDM9KXZve7iZ9+BeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PB7HhW5L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H1PpHKgQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PB7HhW5L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H1PpHKgQ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6127QpEM1349755
	for <linux-clk@vger.kernel.org>; Mon, 2 Feb 2026 10:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LJbPYNH8o0DuJj+prMbOGveCp5KZaKE2+xR/ODLTLjc=; b=PB7HhW5Ltnv1H+XZ
	2LZ813cn+NviiqLmRFSq3r8MHUrSvSp4ONAw4vXwYPNevliLJ3G7BM5FUEo3IbK/
	9L4N2ekpFRprHTkb9v/W7uNbeOYNbn4YYi2JMNBCycELIFySF/UkCkaZx5tGSnIH
	vrq9wRzBXjFFb0N203ktJQ51NKXrXfaMTlrsJgeJ4IpQOFQ6X1crE7rOtpsJljYG
	2Ka2pD/W8Z7JgXij0sZiWrVfmQClu10LfYpQEaLBmFOXR2+BDdHgwy1V8jeojGyf
	52mAeGSfWevPDgmgh62e2Put4Racu9DQGYcgyxosLIuMVI04/mRGU078W2/WbMks
	oA9exw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c23h1juqh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 10:57:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a07fa318fdso45087065ad.0
        for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 02:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770029835; x=1770634635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJbPYNH8o0DuJj+prMbOGveCp5KZaKE2+xR/ODLTLjc=;
        b=H1PpHKgQY8DNorK33UESNEqNsu7YuPToc5XIDqZly6rRml8GfXoxQ5iB7cF5dyJFtx
         3tIO1pZYDHd8k1nX+U95L6ieN2grdgp2S8JS48anNCkCXa6mRjWCjrm4Kyp7h1Cfm/OO
         ULbe7NZLg/G8TykUOhiEJJowaNgNjF9VDtqiKVc9E0kU1PCWgo4laFcDGicv1IEv4yOq
         jWnmUZLNc1qCb9QxbC1e8cY5Z5mIheDqTV80+DZ7PL6yrHZQg+VJUtxkKZAG/xoDU20P
         AGcamIFYa9CMea54xqxavBekwie178uYVsATHSK5rEyvPfR/iuKSB/xIWlLayXJPTgMQ
         giwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770029835; x=1770634635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LJbPYNH8o0DuJj+prMbOGveCp5KZaKE2+xR/ODLTLjc=;
        b=rJZUNWmvtq5lmaqWfdh1vBu7IbcvMbvImK2Q6FadHh7RAYcQ3/xnyUL7SI3W7y6U71
         7ywcM86zdvomdzfDy6LV621wu7+XXDmGn2DcBe4JMPl6wa4ji9xgX6Srtu7PtY3yFZee
         eFTYn5ksmWQtlQq1itoJt+O0kl5yycKnVIyRsjUjHltpHm8+5xYOhXlWDvotJQQhePEG
         tHDUCFU1Ad5evw5tANxf1Cm+QK6l6hdahm+7o/fdpCDehKzcwbe5UPYmUpirq3A5M1Sj
         sEMzMMuj/YyI3y0qvd+lwwEhqlpOw/V2VH1Wa5i0nmMDo5VPjY/29+uto0CmT/D8ZKeC
         f2SA==
X-Forwarded-Encrypted: i=1; AJvYcCUgn9uIuKtINffBqVU/UeXnY9x0GIB/jyxOD4n8sKeCPXAqx6dL5BALS6F6JeqzxGkum785L/NZKdM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAXTQL+oY0rpcNctkZxMtjbv7yypuLEcXj4RcRDoR+tDcl8nQQ
	ZUdFxxUwKkdCGd1E/dcRF+QRYmBbiWu/66u1yVuFksIjqoo9epa4MHffmGR/3KRBUEsnehr/2zV
	S50ctWuprMFhW9Ow8q5uXuyZwn35EyGF7suLdy+YGVUGgOazJvAuSFjbEXDgZ5CTVDLJopY0=
X-Gm-Gg: AZuq6aLJB7MKR83cgTVQPBzh1KH5lIH2TBNu1M5mBvNW4/kggOGO2MiHWTUP4AJjCE9
	U0QQAcWpaxiyflyuK8k3tOEdpU1jd4xy7MfiYbqnumCjrhXRZO4SsD7m7eE3goS3A5Fy36klhDX
	w7Zqutrgt6pTgoDTQFWDVgcebSv3fIVKx67ygav/6djUVKOXnnEMe2wcrZ2Xj9o7kIDnhx3RZwm
	DN1qo37sgEzgbk3znsvb3bDx9pCo6BKmlr6LQx5lDegSBMcbGGdzbKHJOVtvJLP6974mRngeVHX
	V1cmQ+kUNm+TwvHMDkj3SRTf6FXHKcKZxjXVZKRF0qapJuP16C+QUCG114DVNdg3miwIa05AYLd
	d80cXcFQ9ePJfHDb8FROZEZUs51Ge/26I0g==
X-Received: by 2002:a17:902:e846:b0:298:4ee2:19f3 with SMTP id d9443c01a7336-2a8d9943dcfmr128668435ad.49.1770029834682;
        Mon, 02 Feb 2026 02:57:14 -0800 (PST)
X-Received: by 2002:a17:902:e846:b0:298:4ee2:19f3 with SMTP id d9443c01a7336-2a8d9943dcfmr128668025ad.49.1770029834192;
        Mon, 02 Feb 2026 02:57:14 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c4665sm143981225ad.64.2026.02.02.02.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 02:57:13 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 02 Feb 2026 16:26:52 +0530
Subject: [PATCH v2 3/4] clk: qcom: gcc-glymur: Add video axi clock resets
 for glymur
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-glymur_videocc-v2-3-8f7d8b4d8edd@oss.qualcomm.com>
References: <20260202-glymur_videocc-v2-0-8f7d8b4d8edd@oss.qualcomm.com>
In-Reply-To: <20260202-glymur_videocc-v2-0-8f7d8b4d8edd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: IoVvBECON7e8P7z990-myxQh78mJcEbf
X-Proofpoint-ORIG-GUID: IoVvBECON7e8P7z990-myxQh78mJcEbf
X-Authority-Analysis: v=2.4 cv=Fu8IPmrq c=1 sm=1 tr=0 ts=6980830b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=h3uFTQrF-vKaECCUKRQA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4OCBTYWx0ZWRfX5fgTqSZreZww
 n7S1R2cRIzMXQxrCDmGNYkmUcZm/q/POtGiUR4uoqUyNaEBD+8TCQP5xm+BOmW1jCUesaQQfIH9
 MI+1ZIcxoInPOhWKtZhzOPdANTq8qIpt2XD3/tVMkfllKmCekei7AvjAXNyo4xv0sKSjcZCuM5z
 /fl4Rl8T6DWgCYe5AiSPsrjI7EtpM5hpEGtfYTqorpc/v1LozyP6Li2//AX+WJy22Zye5cL31lW
 xHlKBkI2bUBLmV4nfw/tQC384ZEKJoRQFFXJPBCMNSGdo69bvEq9gm+MeCfeAGNCG3HsPZMCdwj
 SLDK5G07uKaziQiABtVBV8BdncQe6ceHUabG/E9PzfGDCoE4jULVkZwA4l220zoRkuCrMbgZYuU
 lSiaopYXBL3kIdBm1bafaHV/T054gbDXuojvzVAoNQ9RStdfrvSUxnFKpyj8M0hAWWJQPWeCj2T
 349c2ApDF7lFWUBA7Jw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020088

The global clock controller video axi reset clocks are required by
the video SW driver to assert and deassert the clock resets during
their power down sequence. Hence add these clock resets.

Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-glymur.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index 238e205735ed594618b8526651968a4f73b1104e..cd11470a75f3fec67c1c0cb7fb2b54a814cfaf65 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -8507,6 +8507,7 @@ static const struct qcom_reset_map gcc_glymur_resets[] = {
 	[GCC_VIDEO_AXI0_CLK_ARES] = { 0x3201c, 2 },
 	[GCC_VIDEO_AXI1_CLK_ARES] = { 0x32044, 2 },
 	[GCC_VIDEO_BCR] = { 0x32000 },
+	[GCC_VIDEO_AXI0C_CLK_ARES] = { 0x32030, 2 },
 };
 
 static const struct clk_rcg_dfs_data gcc_dfs_clocks[] = {

-- 
2.34.1

