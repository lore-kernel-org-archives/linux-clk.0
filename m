Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D581B479893
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246488; cv=none; b=cgH4X5MvPyXY5rdte12XD7Cv+LMasDlQhT/tVH1+hDC2ovt00vv1mW0DtvpxW63MNtog5z9c/bwJIHaiCRUrqN/4kumBVCmCIoGQTKkxj40WTg7yBzMWOcrKGH07AKSNPYPRGHnzSqpyp0IzR5ty/lpL8wakm4b0XR+6MRprCrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246488; c=relaxed/simple;
	bh=8HzxPS7FvDZ+M+LS3tklfzFn4EZhdMtCAvEsfyhCM74=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OYsDLRcVITGxD/MeFaIrVDJ64h7X6lMEvTJGjO0n7HdPA0QZyiQsOsclzcJJP+vzdUnDb8wn3HCSph1q3CGHym5kO2bBVWqxCnkXgPGza0vnhco+PhUCmtCd6Wolf2kU0aPDGynN2eALtea31g2qGPlU41i9dA/hHJ6D1HuAgZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bWpTyBHg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fF3pNkXy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bWpTyBHg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fF3pNkXy"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA3PuV2483709
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5tN4gX89E0jlWF7kOOnp0F0vaWCM9BWDA8HEf/snB4A=; b=bWpTyBHg7X6syvcD
	zVY0QC5ucHZaQP5F+eBPVYFT99OWW3T31hnDYAiXYzgwn73VaztF0oxsnknYKVmT
	GGTmkMVuUCuZhaIA9htDlE2wNl40wB8uAq+Q3u+Kd2bG9rn1nfOb9PrnARH+mBO+
	2I4oYKAm3Epl6MJhrUGhf03Q0PzPNMFjbXpPC+6lXNX0GITq0upmWE8JpKdB5qSe
	TS2n+T7Iqq+AkHB5zsR47V0lgs8+fYQZNZ898K7W5OkMfviENayHII7Qhb5yeq39
	LDe5kobYjYDonamnkV0qeRjlcwYmHYJDJlAanWHF86DhHr75G9C4ripI8sWpSMEV
	CJLYlA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1s904gg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93c292c2fc1so310785085a.2
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 03:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246485; x=1790851285; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5tN4gX89E0jlWF7kOOnp0F0vaWCM9BWDA8HEf/snB4A=;
        b=fF3pNkXy4l+5IcQ5wsYebm5r6jhuvvxMDcVqw45bhnh+ik5CY68GYdFcvpyEXXID26
         z2jYtMyl4iyI9iYaVOF/uTNUggO0821IvKRAwWNE+nagobKK0pX/hVywOEhlKXmJH6+V
         xJ/d3QC5fUSgJ05CqvR6UhVEvJbm9w7MdJ+a8xcQunoRnju3Jemdkk2QmXb/iHydih1Z
         8ZvL4Y9vVwecZ9cMTkB0Dr8JtIOuI3RfLjso5KtOp7I0ovqmf9HmGvmBJQ5mvl68GnT3
         39qdKf+5LTV/KqWBxY0ATBtcAotLvMTKJtLC3jBsF5nSrOPI5M7oroqfSUS4G8xC++dd
         wfHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246485; x=1790851285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5tN4gX89E0jlWF7kOOnp0F0vaWCM9BWDA8HEf/snB4A=;
        b=BobDLwl3oknelASiLGpQsgid/49IsPLulzlwCKDyn0BkCNSx0lrDVEhuh+INDE0uq8
         yW0F2c6t6pNCNZLp0CWH7wyupPjElH6usYsMeU/Hj5zS9XQUi99E84lQADrhMGqDufrD
         Mv/JIKdo0vjJ7QFU/J145GEw7LAk+F3Ul+oz7BUbnHtJFjBKItFPgxqb0dDfxhP9Vvcc
         dLclrP4Za8C7DdiLkXSifh9PFOKV4uMP1T4jYCxPjti29LRwuG5lX5zeeww2S3d/N31t
         1L+OfQ4SX0PH5r5Tz41bqYI0bNGrTrfj2IO89lK4134PLekDWY02oP1DAqlprvX4OzpZ
         B0OQ==
X-Forwarded-Encrypted: i=1; AKwUvBzs3Rv/oVAIcsN21AzjQCJUCOMoUOg0/HLgEnknYBFcIwzuWC7ZkKhQpPQDIIEIXJccIMjHQl4Z5WM=@vger.kernel.org
X-Gm-Message-State: AFuF++nzFZHMpWFMqxgcOqehunZhNGRb8LrFvYzWo/tH1HL3emIDDyw9
	cF+HPvxYSxXRVz16FID5M0Cz4h2b37dIVocEpf68TGBRyhc62pYC37/FvPAMBetSVkcWgYFJ50C
	kFgp+lcm8ELR8QG75glqpnGlv5kr4vzTRKtvrP5Drcv/nfDPWYMo4ZwXQehEesWg=
X-Gm-Gg: AYBFou3OUaBRuaYOeEu1GGaIm/FXydAvwwtBFf6nXA8QsBP+60K+wyCHCe9ohMLv9Z/
	E5+QuaAyFcy8yJKM+IjEPubwiDV30ID+AVAtPa1OWjWKJAN33Fl1rc2+wnqh3LoEuPcXDUr+kMY
	p/VauIcqyHxWUsXsUPCnV/6YiutxbfLiJU8S2ebw7Prn4oSBhhrm/CXlf/aKeC/zCdVMzpSbuIV
	OoxIhMWfiCsNNSPIFI6JFBX50p3K7HLLklOh0CvE5OAFutkfc7ujRNGfQuP46goIx2cykcGgX8a
	7bnR+8nxjWnRuXDPBb9D6SOMtFMMgBg558W6F/VKcz1sl79PbH3s+XznDFva+9thE5UPX+JcRaf
	htHBggECO
X-Received: by 2002:a05:620a:2b81:b0:936:dbd7:fcb3 with SMTP id af79cd13be357-93c362b968amr194925985a.21.1790246484845;
        Thu, 24 Sep 2026 03:41:24 -0700 (PDT)
X-Received: by 2002:a05:620a:2b81:b0:936:dbd7:fcb3 with SMTP id af79cd13be357-93c362b968amr194905885a.21.1790246479892;
        Thu, 24 Sep 2026 03:41:19 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:19 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:42 +0300
Subject: [PATCH v5 26/42] clk: qcom: gcc-sm8750: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-26-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=826;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=8HzxPS7FvDZ+M+LS3tklfzFn4EZhdMtCAvEsfyhCM74=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3zTqaaLIR6IS+G8pNzSXTJFeJZVyAyXD/cy
 vHiXvx9RTCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT98wAKCRAbX0TJAJUV
 VoiLD/9xwSzUyNT3uJPF4SPhh/GGQKrr4hG+Rm0WubE6MkehUtW54CQTTT2enl0XRCUhbWYksnC
 nRiHH6fRUNAtgyyWEC8u/9pir03bAKE6q6ZtJd2d2GuiLfBVSoyFkkI9rNJqu6CORGr1gxOCLEc
 pf1RD5EleMWfjpXGn2C1tc8+ORxH7zMii20a5uPbMg2AUw6bnc0Wr+76oA+ys9+uC89/gt3TK8G
 kzAUhxntJNRVfDJN1m6aQLv4EVeD0+rLC1MTqkHQyhi5H5BD7TK+5JbtJOqWie7PFFwPT90pwEy
 qIZlbT4YYhetEAHi20qjHDl57oGEkCXeuTLGg8J2vOQ8dtMTaUCN8x/HChNTKe8aaqtfoA1H/C1
 rTIX1fZ/8QqpDJe7Kw9THK1SoMQuzOha4u23fxrT8nyIBeMPAUSutCrdHTCdG9nC1iYETGRc8Ci
 Q9FEl+ybzG9yWcJdZ4FB30paV2pCIO7hBILCj9S56JnvK+XADUoD+lqNIZ4C0ecjPDIFXy8z2MC
 C1/VC9ZS9pI3/5rcMQkWsu516XZSvWWdxj8k+GiymAIFGJo7naJg/fpL6wbti6eF+fvJOyezGFR
 wFB0BWhOk6e+8iLMv6SQshnu1YyZhkAYUgYGSGooYU+3YBtvDj5ilCQZf3ryTzM+W1boWBOZ9f6
 FIQ9Ghg23TG6UEA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX6entRQffIu1B
 dk1i1j8c0Od70Bfoelrl6/lFvP2YsKrKe5j86vDcldVk2W+FN53hxVU9nFdak7XMSWIjbd66P2h
 jKSdfkpB/gT5jDnZ9m6PgVQcsoyKwGbVZxA0cm+GulSTdn8A1YQvSRqFzokYUWHptspnGDj8UEF
 qXVXi4r+2MToTdUYdis8eL6XBh4xW7w9toWeLH2ek4LQYLVqAY6szI9N3nRODdd6CWZt7Lcu6sa
 HCe9WP158MJ5HlGe8963tFnfOG0MKbPo3GqHNPBrJoBL3c89rdJRq+vrk2oBLWm5C7pcgtRknfj
 52Ph7P1lv6VEwaM1dXV6JLJDEfHch9UjyygOw6fMWO13hu0k1/QGFVFVf+8FXJCXv0ABCp6nPrx
 iGnAxVlSUoXeOxFpbXw4Xryl1HCaa0/YeT7iGAEVH1lrP1kco+uvEzRXykA/PuFUMG99yKeefYm
 5L2tfGtWoHzOh6CEbSw==
X-Authority-Analysis: v=2.4 cv=VPxIDNPX c=1 sm=1 tr=0 ts=6ab4fe55 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ESHVkgNwe3RMy11JppAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX77w+x4tQiZwZ
 Ym7cvlzq6jIq0+5DoGiy0V3UVGELpWTE6QD5p5nRfSfOWpt/edw5kfVJVFqhbe8avvYA2pBpBZ1
 g5x+bmxnbAQZBsp+SCV541gKMXGVmU0=
X-Proofpoint-ORIG-GUID: 1QdcjRX77Qjr-qY_MqjEMzXb2NHlmtS5
X-Proofpoint-GUID: 1QdcjRX77Qjr-qY_MqjEMzXb2NHlmtS5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8750.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8750.c b/drivers/clk/qcom/gcc-sm8750.c
index c08130218efe..14d44c51ca5d 100644
--- a/drivers/clk/qcom/gcc-sm8750.c
+++ b/drivers/clk/qcom/gcc-sm8750.c
@@ -3196,6 +3196,7 @@ static const struct qcom_cc_desc gcc_sm8750_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sm8750_resets),
 	.gdscs = gcc_sm8750_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8750_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sm8750_match_table[] = {

-- 
2.54.0

