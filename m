Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12295412C04
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572522; cv=none; b=g1J4z1te4XLjvQukplYQz0tepVBxZVylxgkXkJ6ZNVX/ahwcSKUqdRS1izE2dUcjFqJHphfEpmC5Skky75TWac3ltMsIutfivJRpoGGWyMM9QyYLIaC+4BzZQDWJJb8yoMP7E/NBv1nY6O3kPcwlvaNAxuPXL5oSVJGMvaIC+Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572522; c=relaxed/simple;
	bh=qmIS9UURXAzWteJMKNBj/WlZerpxHsDLMz9STcV4Hxk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bEbc+ToJ1wDK8LFEdY8Aw79z/mqvSyqpQd5y6bL3DK9IDV8msbp5KpxbsFhZxinw1bFYkop2XOj8q52qLECUQ7x62tIFMgoZXFiZ7CtitzntGFC65E/Wyxq3XNbR0amheEmnGiZNa4QTJCsFS83mhfYqXoPB5uqSnh7tqzRQNI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jAuU2OcD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HhnOaCr5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jAuU2OcD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HhnOaCr5"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBN5k42373579
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:55:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ioTurFG44UpSK9/T/8OV/TN2zLy50fm/Nh4TZJVqzm4=; b=jAuU2OcDzTw1/kDf
	Gne4aEEMPmu7Zp4JExdcdfsTCGk8P8lmZA5L5t14CTLt5WVr1XwNyW4F5/ZsFwqB
	6fCyknHQXV4zv5WC9FDuBZcXpH1lo6gMkhHF1+Hqla2/l4XmlemwZ5hR+BqaoXMY
	oKOPXkCcQ/pwnPa/R7u53pJsZYk7EoNlfcWK0ASBqyJ/KZGpnGXtIvtgWNDbmtj+
	ByvdEwvCyOrLsWtG7U47uhrK8fq89hvlFgKsNp0jc0sRAgXJExlEn8bYwqjCw7V0
	m9A2G0ueWfvzuKuYWZBBgy8twuSGS8WXPrRY0glUfKar6re/RIxCNd8PNS/bshjV
	bRmedQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gdshegc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:55:19 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90c8da50f4fso16054226d6.0
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 04:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572519; x=1788177319; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ioTurFG44UpSK9/T/8OV/TN2zLy50fm/Nh4TZJVqzm4=;
        b=HhnOaCr5kh/gURgPiWSH6f/Acj1/kju/oAPRkOY/Ww7OBie07yrqM2Q7Iilm6wZPtB
         +oyf9cmsEpFatnGjtn8d1vy266DtP+R4El+QPf5rEGaBTULDZzvjPlo6BUqmx0KqAyvN
         Tld+NIsIzI4vJCFFqTYY8+c5ld7Rvw0ATKNdo27xPmrNLyj7JmgHaFAaCUyWK2NoaxzE
         En3EZJ/EaKBhL6Kwy8RX49+RTR0YobKR+HPBU/NEPd/0hoQpBqg/oY4rwdDp/KKe4ncl
         qdkZ/m4fFLdTOFJCIHldbZE2cqbjvLDf8Wxakjh2Rxq7YV1XOfaV9d4teG8odTk/79Tw
         DZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572519; x=1788177319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ioTurFG44UpSK9/T/8OV/TN2zLy50fm/Nh4TZJVqzm4=;
        b=Nca50mK6s3A6NJbSnW7JHiv+SbFu6pBth6XMvU93gllyO72NTeh6JpEEJGrMKEwsw/
         tfDUQQCShBYZrevI0MZxtSeZJrM1VvPYHLjTIu3H7P81hMwwtPSrUHeXRhXppCrHRxvL
         JYDMUno6c6kYQK4U/Vr1ycGaH4ed3BkRiR06XUf+m6ekr3utHQ33uHwnhPtk6ieLpY/a
         Vkml7lkBEpyCweXZ6sFXC8gF7jYUIU5vNj3NcVVyXrgWoIX5HcMeF7e4ILs8Mm5LlSd6
         d8VWHDHgMEokntqhL/sK6a1jU/tfaYUvJwIyExIK8ns//pTMnlPOMB85fF2SL6s+wbx/
         gCEg==
X-Forwarded-Encrypted: i=1; AHgh+RovnhH5iKQHPPFVYceJBTvzmU0pOT4AWF6HCqpuvp0SGTKe+MNCT8EsfGBWouPZPrzO7DuhWNe8gKI=@vger.kernel.org
X-Gm-Message-State: AFuF++m43k4HUVJIqqhdaUKGpXicHAuefkToyyUhG3zGZL9l2OcVXayj
	ySgalZqBr5ZkjVrQHLXqLLwwa9pV9sXsG2s6CjTmhiYlcsEE+Yq8yOOHQZQ1z47GqMknZ3CRuKD
	XyVEZHzXJHqazVBAPhmzPeQfrL4Z8UTRZdcZCsxW5LEaFUzeg+srxzLO+KTv0vTk=
X-Gm-Gg: AR+sD128Bz6yvxCtMi1q6L+ZiVF/N5ZdAIC2bdKldOEgZTVRT88BTRUlYYoBUasVm3F
	lajzBrwqVhNzLOOxCUWYIveNO3/so9Kk29cPkoGLiPNdDkhfpK50IwG8i+NSVdzVWZWzZv6Iwl/
	XNYfmMoseqoYQiUMCTSqO+BYHXppEdFCBBMKu/60Yn4jvrJ8B1nHGn+Vfj6kG/yjZNTVnWMoM4h
	Tj3rtklNfji7h2ZqD/cpjIcGRIONjdKx6qUNPaF7z+EZLrKehdEzxAErveK09fvcA2018oI5ajP
	lcAt/m4zo4set8YBMtflBZ+CGGT9LMpY818j7o86rP0ggD0fJN7yiLA51ZDVLUul54i0/QuqYCM
	uDWDD41E+
X-Received: by 2002:a05:622a:1315:b0:51c:b900:513f with SMTP id d75a77b69052e-52df5712136mr251454361cf.10.1787572519248;
        Mon, 24 Aug 2026 04:55:19 -0700 (PDT)
X-Received: by 2002:a05:622a:1315:b0:51c:b900:513f with SMTP id d75a77b69052e-52df5712136mr251453371cf.10.1787572518645;
        Mon, 24 Aug 2026 04:55:18 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:55:17 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:53:58 +0300
Subject: [PATCH v3 11/47] clk: qcom: gcc-kaanapali: Tie the CX power domain
 to controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-11-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=924;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=qmIS9UURXAzWteJMKNBj/WlZerpxHsDLMz9STcV4Hxk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDg+e1zYCrE3D6iTGFCVQAxc/Xvvv9UEBM8x
 6pMROKt5+OJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww4AAKCRAbX0TJAJUV
 VhGaD/wMqCtS2SkiPCz4O0+a/al68sdr2fEHnlgsmOtxo95cy0mLDrIv0BEDyMWP5MWCwWwBAjh
 RBQ5kCgwUEmww1VcTfDaZlrfforUbYrvie3Necjvx5kaWJlzcBfuu4FOc8ojbHuuH8mjvvDcotK
 stMmRadGgqVMIAf3BKG6HYEPyOJps7EojWnUIAhAxzNZB57icWkGE7PqN4lFzEtysTgZpk5nqXm
 7PMNOhZGeQ+UWnZT54mIv8YASFRhDBppL9w5LzGT9L0Yl1exUrdFvOi3gEUrFfYAtmX7O/kFklK
 zCt5hpEVHF18F+rWEGB9DC6yRlJ64+i326fvtlmK8m+37kVTaHJQUh/HrJF9C5Gwee0RuPRZoYo
 icug4kzzqci2KoVSLrKmKK3wV3NTaL35whlXSVi+/W5waRuxe5wXyMx5p29EXHG0q3vYr0JxMLD
 LA/sRnTbQvIcjXnCFEGFRwY54l8A0ZqYNAS9QUPyYk21I/nBRPtdLmgpE/abDwB8mpTd3C/k8Ns
 diNkaHykK+/U8L/0JcOEbZu+mFbLvMHgwu8OBrqCGchF4i1l4cayAymnKNyfSrczXKWStKpUh/F
 lD33vzwUZaoRpWbMSEPItMlxvLnGd3hkDEHBhvLRVE4qm+fZs57vwcMU7cY5rW2pCDQRjcSIJfX
 vyholzGq4rFCVBw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: IcE1hRJXVxILu2pQqm1y5UBPLgSnMSPL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfXxQ8Mrgg2Uf4M
 FMkEFV5rYpMMyKojTtmN2H8ZrhqmL4vrWw5Fl+tZuuDfYAP0vfcrz2BbakvWONzWJ2408bU4T4M
 ufHczTXGig+IAIxYwiIB9fDaYMoqflOQnwEb5q7+Qts3kNRCPlx4CsLT7cPwfXmoSd38AMtwkKY
 ST/oF70YYNFVzbB/hNUeLJ97ia4gsuxg2UJP1X7dVXZZwjUyS3L7O72SLLzXYImEgrKBtRtt0nM
 zXf7EMqtc81IYMCDWLrZX74Boqufr1Rqgs7oOVXe7+SA+LNbtvbMvoEClRZQngJXD3SPS1HThxm
 YLr2C/BMkHZm+m87EY+PWJeggXsq+kRw0lx4jpNz06LAiNC0zjysrvfPcdqcZD//LiV+wcKpf+7
 TDbUGFlNrdu8b6WXJQ08EAJSzpHvlCxFZSTYO5y2kGkqiktimk6rIR+qbPucxAYdhTlgY/jqDvE
 tnaO35nKUr8c3fi8bsQ==
X-Authority-Analysis: v=2.4 cv=Fqo1OWrq c=1 sm=1 tr=0 ts=6a8c3127 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=gcpHbPksm3HONcV3VD8A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: IcE1hRJXVxILu2pQqm1y5UBPLgSnMSPL
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX123y4cqo8WlH
 JCvMCU43s3stGrOrVUtWjk3O1fmtIwoAf47DoiQTG9+r90deoKR6aCV5qgEtAxhARr4I8/G1dAt
 8/+M5rcl5AV7GStaJjQQetACRKmS9P4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240099

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Fixes: d1919c375f21 ("clk: qcom: Add support for Global clock controller on Kaanapali")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-kaanapali.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-kaanapali.c b/drivers/clk/qcom/gcc-kaanapali.c
index 5bcbcd178657..c40d2da1086a 100644
--- a/drivers/clk/qcom/gcc-kaanapali.c
+++ b/drivers/clk/qcom/gcc-kaanapali.c
@@ -3502,6 +3502,7 @@ static const struct qcom_cc_desc gcc_kaanapali_desc = {
 	.num_resets = ARRAY_SIZE(gcc_kaanapali_resets),
 	.gdscs = gcc_kaanapali_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_kaanapali_gdscs),
+	.use_rpm = true,
 	.driver_data = &gcc_kaanapali_driver_data,
 };
 

-- 
2.54.0

