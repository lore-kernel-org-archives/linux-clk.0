Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2978B296BAF
	for <linux-clk@vger.kernel.org>; Sat,  1 Aug 2026 14:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785593657; cv=none; b=i3MJ2efNL3/IpZR9rJ1CazMRS1ATugesSDYdSvtlLVwoT0YrLdSA/R2UwDFZe2Cm+ZXTYtAzeM9Tnl6nbMJLJvTyzB6+O1a96dAIjDEFxTFsMh18y8ndUn0iRWQbJhRJRMxowNy/3q6gNjsDro5EG1D9dQbiif+GAR+Nz4TfyC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785593657; c=relaxed/simple;
	bh=+GkyL++ts1tWFcTIc097ZAcnH13RcWiW5T9SXWNf6Zg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QrpSdEKGGiGTDR8UC969QYvr/htruNE+7qx/KNJ8F926i3F7qwTWax4lvds01Dc+277abHgLYlWqcQBNRjbt9GlzDka6A/948rcaqVZzRMm2cLg5/8J/ohEC+LRGzTcHmqrPQ9UxfnqzXw0Kp7+oYO/FP9vUmjBA0FU6X7aTdFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IJO23uF3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dx7dJ4qu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IJO23uF3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dx7dJ4qu"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671Cadox3239458
	for <linux-clk@vger.kernel.org>; Sat, 1 Aug 2026 14:14:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZCEq289oGWPSqWxeEW7ACdtmmWifBbU77U9wvk09M3Y=; b=IJO23uF3Y5xB7Zo8
	/nghVP+6wxAm0dQYENSMm13rD5rWjMJIz+7hcqNjkmJhaV7vczLgyTUzlzSh3Bg1
	MexqT3N43iiSvFCCUB6KeGPUTdoiONT6dFIYj73bIjv7X+PUfh78CD79YfrfIsjv
	FP7Rjrp80n3AAdyZz4SvLBIOPz43nXGjnWIiwuDq4TsFgs9Z4J9bdkmBXP12DbJP
	L4BkSbGl3JKNIHDP9WBPOm3qA6RpD4MX3lmK73aU9jMV3k42Xp6YX43EnqqYEx6v
	8TeKjhXN/qdZyb1ggLxdPdimMq/Z1/SQLlkoi1PiJvABdAQz1C8/rW8xEEdrUbv2
	xWI03Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8q512pa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 01 Aug 2026 14:14:15 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e2f61c09dso2872447a91.2
        for <linux-clk@vger.kernel.org>; Sat, 01 Aug 2026 07:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785593654; x=1786198454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZCEq289oGWPSqWxeEW7ACdtmmWifBbU77U9wvk09M3Y=;
        b=Dx7dJ4quLFU/MyhMn0jd1+MWTA+VZb5k0A/T4F9juSM4jd8uLiyHdyhKM+wKbFzTT6
         t5BEuLRGxn0L3eZLVtvK8KKmvNjlZ91y4ipZzeKPlueLFWxfViwXWNQRdvediT9qpKKX
         x/kMk/Y0cr2uDxGGlWD8UtEfzuovnhzd2aXKu4BiaadOM2WHn1UMubWtIK6EH743U5Bc
         +60AvBd/7tbSQFAIFaMd9xYw5ozSHE3QqdCIzAfwKzE1gNKYO5dGLbBbfNwVUYLOmH3s
         XMerzYQRXwH27bZvyW4vTxzNdtgaFkj6f8hXxBfXgXywbBiaH5Ll07dS1aSsOJnRTXAr
         AFZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785593654; x=1786198454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZCEq289oGWPSqWxeEW7ACdtmmWifBbU77U9wvk09M3Y=;
        b=WAOPB6PR6WbkP9oO/e/25LcEhHOKnWv4tZpxs+hRHilFOpEVhSiW4PWwmtMryODHhe
         OvpQb6EviMykNAxI8rjQSpqPR3+IgRxDckvJaA1SmdzyQHVBmCCNgohXsSQKN0sfIFL0
         lnlYKtpPjolvFZ6iryna9HAY5Oef4WoJuT1YqpJmLhF7MQVAjLhgiFMXw0s3Rpk5JZai
         EWKPgXJfAkHaLvXyaVtrGOnmTHSsBEOO7I6X6Y5oRAYs0tQSrWadDY7IFFz9PNk8ZT2A
         fban1shHQpi6JGsb4FI+DUNm7uNN9c0cy6aAFEE7OpWn22vJFjOjdCNJep5uRchm6ugG
         Yi1g==
X-Forwarded-Encrypted: i=1; AHgh+RovPDw0w6PGdLc/0rIj5zULPG0OtgYElyfjkGlSO43juanvN75zS7wsX5xtUm3sb3ul6f4zHdN3x9I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+ecV4vdH2KayIJ4NLKf7PRtKM5TIr/zJYsAQaJN1U6Jq17dVN
	PJXyjbu25ft1WLxtLD99fKq4hMUmxRStgXhI9cLZ38RaVp6zq3rtBhgiQtoGAIiQA21we+ohkVv
	7M6CYNBuJvlcLpW884p4qSeeNSMARxUCEmwOkhJJvkVzqqaByeJLSckCfAItOvNA=
X-Gm-Gg: AR+sD11w6QA9bdVIJpD8fmIuIG9Y0geXXkGWfqQJAAv21b7WlSwML2Sv6V97IDq00Bt
	ps533LerbpUoio8XK07OMSNezmokQo8r560GYByQF+kgjf2ALfBRYTOaqTfRmI4mrBADkKSpgJu
	LuI8C9lMp9f64IIVUAKk9lvGFVtZ9qtfhqWhTEbS0z2JvSeGXHhKA/vr5i7rjklm4QUvSCCADTD
	rVPmdMMhoEDtOx2VX/8Dst6oonIIb61gOuM3pwGnITI4vNFeuFnuxqIfXHyNO0QYQs2x70p8SgH
	W7TTYK/sU28xzr6eHlcJI4zfr9tNYjF5C2c5ujr5faXIfP3V9SFXOJdMSrzttWZ+F4byikIqrdv
	EZRCevaZQp/Frm4EgyobMZn62
X-Received: by 2002:a17:90b:3a43:b0:38e:679f:3b2a with SMTP id 98e67ed59e1d1-38fbc4dd615mr3153883a91.30.1785593654146;
        Sat, 01 Aug 2026 07:14:14 -0700 (PDT)
X-Received: by 2002:a17:90b:3a43:b0:38e:679f:3b2a with SMTP id 98e67ed59e1d1-38fbc4dd615mr3153854a91.30.1785593653718;
        Sat, 01 Aug 2026 07:14:13 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4e506csm13570696c88.13.2026.08.01.07.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 07:14:13 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 19:43:53 +0530
Subject: [PATCH v2 2/6] clk: qcom: nwgcc-nord: Add video axi clock resets
 for Nord
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-nord_videocc_camcc-v2-2-674d7718e41f@oss.qualcomm.com>
References: <20260801-nord_videocc_camcc-v2-0-674d7718e41f@oss.qualcomm.com>
In-Reply-To: <20260801-nord_videocc_camcc-v2-0-674d7718e41f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDExNCBTYWx0ZWRfXyK0G8SVyzvVc
 UmXSgvsiNdBhrecf8809xVHR6jJ98BJuRfxKD2KFJh+sY9BngtZerUVNp7HxdPnsD0lTqbHDHGA
 RfGX/erGGUAN3zbg3D0QaBbO0XQ8lMg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDExNCBTYWx0ZWRfXxmZspP8/++x8
 ItBmaJu/R/PsQxgiWLwe+A2dYgjQ80XvbOUt8bnudDl8Dq/d3I/uVYuUMKKTbYU1bsXTh+MJOxg
 WTuqSo1GW2JBTsnrkw9Etia7o3uCo3+dJS70yq7POiPOT5/+eICt+UyxQ3VD+kPJ3n5wGZvuZrO
 BoW8NLha1cBrjkUIfzrEHO88VbdAG2sYwN13rqhGXsCDEicp6xOGZr8bnnqNaNTCQxmPD975hMe
 qtN6Hkq06UJlMoiMscgKxXosReJnn+vRZmvhRFZrJyv2my0+Qid7eNrKB7SAH+/TCi/ZhHkUk6y
 d7eVdKQSDYm9jtfqEnuhLTXvkwFtmbfU13rO4wRimBCJOdos9imKRVMffEOo1Ff1DgpgoKXyhys
 n+qQMDqwAZSlY0mc/njuiB3TbO6l8kLKoHVqXQuyVpTIhyKNJRMIFvfBagKisYVC2Q7MZMj6N7F
 wq/epdzXfRON6H6BALQ==
X-Proofpoint-GUID: BGGgtcpA8Er-mG8eUG42Qnq4Z5uLCBYF
X-Authority-Analysis: v=2.4 cv=IYC3n2qa c=1 sm=1 tr=0 ts=6a6dff37 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=F_NcwHkHckZFdKgW29sA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: BGGgtcpA8Er-mG8eUG42Qnq4Z5uLCBYF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010114

The global clock controller video axi reset clocks are required by
the video SW driver to assert and deassert the clock resets during
their power down sequence. Hence add these clock resets.

Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/nwgcc-nord.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/nwgcc-nord.c b/drivers/clk/qcom/nwgcc-nord.c
index e061c0623e9a468b87153f1b0ccf2e2c9e06ad19..280558f15748c95cfb373c09141b3023d7fcec5c 100644
--- a/drivers/clk/qcom/nwgcc-nord.c
+++ b/drivers/clk/qcom/nwgcc-nord.c
@@ -623,6 +623,9 @@ static const struct qcom_reset_map nw_gcc_nord_resets[] = {
 	[NW_GCC_GPU_2_BCR] = { 0x24000 },
 	[NW_GCC_GPU_BCR] = { 0x23000 },
 	[NW_GCC_VIDEO_BCR] = { 0x1a000 },
+	[NW_GCC_VIDEO_AXI0_CLK_ARES] = { 0x1a008, 2 },
+	[NW_GCC_VIDEO_AXI0C_CLK_ARES] = { 0x1a01c, 2 },
+	[NW_GCC_VIDEO_AXI1_CLK_ARES] = { 0x1a030, 2 },
 };
 
 static const u32 nw_gcc_nord_critical_cbcrs[] = {

-- 
2.34.1

