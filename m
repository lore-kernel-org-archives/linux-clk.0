Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEFA1E9B3A
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 12:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784379412; cv=none; b=ooALgBzfi31jVYw2XcTgogdZGVgiTYVCqXXezKcyItTVOoUJNRwKe6Jd/S6omdcRAzAjMYTDRP5yL3ZItJLMF2eTr8yWuVo+8p5tN0CpL98DPV55k2RIxJSJ1vv/SL6CTk+gn/r/r3EK2Bqx6f5svTC/My4bQsNzB3dC/xkJIcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784379412; c=relaxed/simple;
	bh=DDibhNq8GbSHNp6BcKkSXQbdjHjDiWHzHvxWR5kBACQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oExPE4Age9yiK4NgKeDaZWYVAK7m4mnttvdh8W7IQnsfxvvWVk47R9Bcgs0LEwkHe4Ph1+6ZCceScYfsPEYyCwmeABTwifujo6Ya3pbeZl7nhxaqR2qOk96x4hvGkp40MPGaDKB5C33kkLwo7rlWCAaomKHqVvlkUDUiEVe/co4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aXn6UjSl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K0STSd51; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aXn6UjSl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K0STSd51"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IAHVme501883
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 12:56:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zRCqbDexTjq2/U5PlBKikyQSF4mNQEN+DiPj2REuMQo=; b=aXn6UjSls5rCTgRK
	uRP5vQdhVekU49n1gOLMMoDYplWTuWPUg0jd4MMTkALQPxBfZVpXtoQO3HJjQ10H
	xHzDT+llmALkXPdazrsaNcP4TSwjxEWq3UkKd/XFOsyNCp/Wu7eu2EfanSpU4oJB
	tNsBKRuoLA7oj55wTA3Bq/VO97meROIVZfBYGLd3WNrdVegJIb8c5DZ4UHWFfZyD
	O3LowhlbuOtoJqcnjYOvA34ddoUfAV6owN/s5sePRVzRz9M/JTlNBEntPFyEYoAP
	NnetsIzqKA+fGJG+QUKy50OI2sM86ZZj2A3jlhlDCOgcliXvELPRzdb26RPMrlSJ
	O6yf3g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2c68ses-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 12:56:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cf1c86963bso20626315ad.0
        for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 05:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784379409; x=1784984209; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zRCqbDexTjq2/U5PlBKikyQSF4mNQEN+DiPj2REuMQo=;
        b=K0STSd51H1tjOvL1euSusLBlZMoBq9H/jnRrC+5c4RuC4MmF1PhWCuoCLMDRY1H8yq
         unLhlj47Q6u5ArJ9cYgqiKA7fFl3vpewHIV0M05VkSGRHjnMT8UytyJaHOWHG5nxIMlW
         ZueWaZ++DKDRlYLmXvR0zRzf/lSx+asyTZlGD3tE58LNI/HTB8kIn2vQOqCvWmkEaUzd
         GLTcGP7Dp4Ag5EcK50qgsjphqveUuwD8G0Kfv4hXUhsBtr3/CVM+GlyaIIUs/ziI13j5
         RchQw8y84nmx0GiavMQ3okCg8XXHy3jHOcEVt3/FEEGWkuTOGeGWfug3xuvDesCtPW3v
         j0ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784379409; x=1784984209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zRCqbDexTjq2/U5PlBKikyQSF4mNQEN+DiPj2REuMQo=;
        b=Y6hl9Du+iXWqVc8FeFYDoQj55BMf/DkY+FYRVWQxfmmekoBNKDvFUnXV/VE4YiZxhx
         56xuw+jay5JeUozoHL2KIfTbFZGuzDbbbWFASxff1TzR96QrJai0oVd7pe7JhoKb41Rx
         seKECja+ezvl74qWzaZ83nng6PKylj84XAvz/mgZ8JiVSy5taVeV1tfCsSsP0LZbd5F4
         oxEoXGwkPiuQ++8OC86/CpzzeEdJxXpbXJ2yufIT3hPJJ0NIPe48jiDu2M2xOOU+ZSNh
         V2vl58vuEzo0LgWXQY6esKtRuxXA6f1w/r+CWbs0krkimYMFS0CvnBMelZsaGBvkkpwe
         BYLQ==
X-Forwarded-Encrypted: i=1; AHgh+RqwdRcd/BzEC08NwcoyHPA6XWP1St9UmXoAVOcwznE7Dxw5dIkPLBq6lH0AapHEjrnz41DCChRxy3M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXwCyB/hRS8NZdhOsPHgSpE8MH5A6jT54NMNjQVS+f/rqq0sjY
	AMg2ra+CXJYa9hMUxMfRmu7jJZI7K9OgiGBdmKsgk28V36gJslzCvCTw637aG6TCSKWdfSwHciW
	o9qvajIG2jGPvG6yWOAQIwsjlpnzj80BE5Rxv0vFK+TWJAIIXd9E+iPfvSiXTWH0=
X-Gm-Gg: AfdE7cnEZ2UgKZGVHiwVMslGYJgyySxB4Tfu5wXYBAC9XlcmWueu7vAZuGX3Pujk3cF
	cZxbfqT/g6P4V4REwn2VE3tCTUL8U2NwHF7elUP4Ab9fvmjRJdpV4sSG1lU8N+FwSWZhqm2tjOS
	jx7i6ww5BCBMouMu9t7SYdeqRizBXQGNSEnqh/q1owem3Pu8XwgDF7AGca2Wum0TrT21BYmNsWE
	YH09asHWlpWtXhD7CN1jSZkFaSvmWaCW4lL+D10yIxsRsp/ahn37DzEYt1z4yCXldEqlr1KycYc
	cbAug6KuCm0D7WP7qc+PBO2nndfNc8HH8bqmflKK2wRq60oQ9fA4sGT1de4MfuoD4PooZTO9NqP
	GZzRkTeBNYUVOrBlrYhDAFJ9jXUkXi4E=
X-Received: by 2002:a17:90b:2496:b0:38e:5828:a446 with SMTP id 98e67ed59e1d1-38e5828ab64mr2495300a91.19.1784379408921;
        Sat, 18 Jul 2026 05:56:48 -0700 (PDT)
X-Received: by 2002:a17:90b:2496:b0:38e:5828:a446 with SMTP id 98e67ed59e1d1-38e5828ab64mr2495290a91.19.1784379408508;
        Sat, 18 Jul 2026 05:56:48 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2a18a47sm14238910c88.8.2026.07.18.05.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 05:56:48 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 18:26:11 +0530
Subject: [PATCH v6 04/16] clk: qcom: dispcc-qcm2290: Enable runtime PM
 support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-shikra-dispcc-gpucc-v6-4-62703e05ef0f@oss.qualcomm.com>
References: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
In-Reply-To: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: EMv9niS81pPyGSjHOJAXUJjSsNMqX5YX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX8Tb4OD9Fzm34
 54GBDckKiIUhk+XkmSBLS0B7eawFeYflvrHvvZur1VHMQnZOOloO/Et7nTwGBbHEV/rS5QtoGyg
 +vcHkgzz7e3dVsDDvcIhe9/1bhkgaz8qRUT5EH5kfR0PkHQ8PcC4GKdSLDgwbMqp/QNQIEwN2nE
 GQCML3azLKRGnhe6kz7RpB9dXc82hYayjVtSw86oD/9IbpTy4d/SGb6J3rfArJkwWi/AsseqSBf
 6lwLNu4DJenPj8TOUY/hPbEGa3mDKryd3wdAJqPeIDlVOD7uGoP+wvTL+o/ZhwBL6L8qdQC10Jl
 yH/C249EojyhjAJlTHn+q5cmcYfzruHK8Ps9cnNRhF/NA9pc0XyhGnTvkUUmpJVKbhTX/YiyMQe
 zTAOdVTS1AkHrLG2L1752sOrHy3luse6/OLPoFW95zx+ttngc5X+X3lSm2lqCf0opxJq1TCUwPg
 /LgqAd9UnYeP3ayEP3Q==
X-Proofpoint-ORIG-GUID: EMv9niS81pPyGSjHOJAXUJjSsNMqX5YX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX97MOAWjQOxgg
 dNF+s51JqLT9zYh09zwMqwNai8eZzdikvogTnbcSo9iVRQroPuPWQlaJ2nQeFmhmKfMyj3FvBmT
 ZNj4lO8xIdRIRqsVXZ5b5meFhYPaVWA=
X-Authority-Analysis: v=2.4 cv=CJQamxrD c=1 sm=1 tr=0 ts=6a5b7811 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=3kQL-WaTcMt34FzATK8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180133

The QCM2290 DISPCC is now associated with a power domain (RPMPD_CX) to
propagate genpd performance state votes to the CX rail. Set use_rpm to
true so that a runtime PM reference is acquired and released around probe,
instead of leaving a permanent 'enable' vote on the power domain.

Fixes: cc517ea3333f ("clk: qcom: Add display clock controller driver for QCM2290")
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-qcm2290.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index 50a0705128a37073a077b560d0c9e57544d54348..2350ce7f46d9f6e395c87c7a00669b10e8bce3d3 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -515,6 +515,7 @@ static const struct qcom_cc_desc disp_cc_qcm2290_desc = {
 	.num_gdscs = ARRAY_SIZE(disp_cc_qcm2290_gdscs),
 	.resets = disp_cc_qcm2290_resets,
 	.num_resets = ARRAY_SIZE(disp_cc_qcm2290_resets),
+	.use_rpm = true,
 	.driver_data = &disp_cc_qcm2290_driver_data,
 };
 

-- 
2.34.1

