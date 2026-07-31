Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB0647F2ED
	for <linux-clk@vger.kernel.org>; Fri, 31 Jul 2026 19:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785525197; cv=none; b=nfh3n+N6sUrSXG3wKfdPFRhGVlxNGRMBf7gj0IYus6a6V0A9JDvNJZIJy1uAWXLRz8fqfaY1ZIa1nt371biCMaaI3GEgGdHrBYIzm3ButLfo64FFzgBT3XWCNWNRjvE86v3LH9ahLHuSeSEHS7nJnl6I86UMOM559p9fzbczGbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785525197; c=relaxed/simple;
	bh=OB+2g/j1GiFVGa9N6ZeMmBNn8zrJezJPNkDnVdbzClY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OTBbzmMYnexXGKuNWV/qLvFyApNK48lGgtMCQevg6w9HRzvAnFh0If6/ziFdyRB+XDMhbT3bTWzM5KszN8EYwFj5Nhp+Z/IxFdOvoLfklzAirJEgSUXkaXHBY90lZuvTMjSFTFuE65yWCCUDrLZGzd9BVLXtqOTn2tUy+/3Z0xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=one0UsOJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UBKgpMy4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="one0UsOJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UBKgpMy4"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VIcsbg856485
	for <linux-clk@vger.kernel.org>; Fri, 31 Jul 2026 19:13:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dLNtZrWze2Hd+uTS2QLg96amdIvCBDGGQYM2zYiXMaY=; b=one0UsOJ/pP/9clI
	G+jmydz6L1uS7cIptTkd2bMJCG8UuBcmtqR5a0r7SVX6icxZ03YDTMgGRYyaa9Ck
	SqvOypB039DlITmUpvAvNtm5KWe+SQyiIFJ9n05Y1sqMyn6kNfHvPeLCX8JAoDAv
	1nPthJwroxTCKLcDnpPJR9g3zbQ8TMKAe00PANQxTuB6FOAygwMRJWiU04ng0DMG
	iyR/NyyveVChff3C7DWPKO55a8jFgD96GYJKLw3ii0OjmtPXM5MTmvG9TM6CHgiG
	/Gv2YITqyFeZBVB7mxkDIFsoR2L7fwzHs0KvRoC+qe9TJrHDbWRgmA2nMWYcqAC8
	F9ywoQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frufkhycb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 31 Jul 2026 19:13:14 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84e04598adeso1168990b3a.2
        for <linux-clk@vger.kernel.org>; Fri, 31 Jul 2026 12:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785525194; x=1786129994; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dLNtZrWze2Hd+uTS2QLg96amdIvCBDGGQYM2zYiXMaY=;
        b=UBKgpMy44U3vzffm65Xu8eL1Z40HUgf4UbgcaS7R2Vbep0emPFF08xyCY9IYlqCCJT
         IrSSJ0BVGKbWyjbk76aZbdkbKZzBn54/siOk/FBq1DEA03/WiMm9H1oNWpuJ/9kHIUlN
         OM5GOzAWeDyie9wdc5pvNun7CuDsnDSagwGWfAFhDmjDgL/vuI2GaeoIvnoF64dUF+1S
         P5V5ATfWnVeFb9vnsGS17HqXQgUD4ZVSJ0Ufr9ILaBYTugN9Z6Z5vapJvFdhGGyTCda4
         OjRkdzX+SfnVwvi3sIsxzm0X9VeeaNcNu40HXMN13KL9A+q/25gx/u/hfkRkSanEaDwQ
         S9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785525194; x=1786129994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dLNtZrWze2Hd+uTS2QLg96amdIvCBDGGQYM2zYiXMaY=;
        b=nbLsaiuZFSN642yA7ArfIEqRdxxOlVZ1A1oldbZfneqNr5jjaGoaporSsr3Ue42mrn
         5ypKEG3xXQubl6vRAveLRSPcKaI0rF0qKSlUC+lxTyUc9YI/WkuW85yM6OVmg1IzG0pL
         7XdaVHXkDW588ahOCXRIQrErgFkKl9N+Q7dY/Xtw5G66HeOjfdA/wzDiMWZCOCzdm1XY
         hIugPWE7Xn/vqlw/I2ES1HYupsBTw8vv85XgU9DXrcSfk5JNNt/FY1CCF2y75aa3seZj
         TwlfDOGrgcC8VYk9zYBIBnPGh5bQrS490ZFPVKceouA2pmYZncVRu+Yh646tVnj6W+Ee
         9omA==
X-Forwarded-Encrypted: i=1; AHgh+RpTpiV1tFi54MjhJr4sGmjzjod53AqxTLDdezScPQnMYNDYrrns4cG+xkzAD8ADavikZhWXavamH4U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmkDSsyoxS0MwZsH8QmXBZEH01NqiwtiA6ZKjG3fjymSOEcp8p
	e41NsYx0Azg36OmCIhinIgH3kReFp+7oz8gWphE05a+MUQXqkuJvjjg2+KByQUXcTJsU0fVxvHM
	wIaiuYejLgJOzzfd8sLlVbztBs+yd/q6VsuIum+PmxexnMYbv96pEzootnZq2NWQ=
X-Gm-Gg: AR+sD116g7LBD31oVagwApx/UToAJTsbdbe0QTIKPcToWw3Cfcg+nEE7xVMX5r5l9OP
	bAJvmvk//6DETWlNXOGlUUgTeKwSrjnDX5EOZQKdQKbWaLbrpovU0Dx/tn7meEmrOiIFDlpyWCV
	LE/KV/8a9Z16Z4bUaHUp67jtyjl61Yic0m+l2eUzd26poDCMIeaOgkN5igxowhRtprgRF9XaSig
	2x2oa68Jhz3WtIydrIgYcNvMA6arbya1Pjjr8+KWmrXf/eM4I3bmcOh5alAs2rKC/vwh3iAto16
	0TUvMJDeEvQNSNsxxicZtEex4Qdmn6oCKWOkXkGafU4mw8biCfkh+RGQ7BJfKk9vp3WTrEGSJot
	JUIa7H0EnP0rvirzqSIK9Nh4PDujw9Zo=
X-Received: by 2002:a05:6a21:6e03:b0:3c0:9c19:b275 with SMTP id adf61e73a8af0-3c92ab2ab0bmr845898637.67.1785525193711;
        Fri, 31 Jul 2026 12:13:13 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e03:b0:3c0:9c19:b275 with SMTP id adf61e73a8af0-3c92ab2ab0bmr845867637.67.1785525193292;
        Fri, 31 Jul 2026 12:13:13 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4d10bbsm4945869c88.11.2026.07.31.12.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 12:13:12 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 00:42:46 +0530
Subject: [PATCH 2/2] clk: qcom: Add Graphics clock controller support on
 Qualcomm Maili SoC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-maili_gpucc-v1-2-9d8c37bded69@oss.qualcomm.com>
References: <20260801-maili_gpucc-v1-0-9d8c37bded69@oss.qualcomm.com>
In-Reply-To: <20260801-maili_gpucc-v1-0-9d8c37bded69@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDE0NiBTYWx0ZWRfXw/7jKOP44c5q
 otk96w0R+pWtUPDS8kVoHDELoo42P3w6ltlXhCwuQSNitLxDRhl4/+DG+Ypx+rBSQoJAZSSjW2X
 fXXt2/ywTj7Ff9gu7kxecjPaeFCRrEk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDE0NiBTYWx0ZWRfX2X36lwElFwIo
 BJF+qRdoi5WXe1kSAPDulSkc6Gl4UWAXTrD0a/gsyaXzUNvv9jjwjRqDj/fbdGAzrNgEW1k0ZZ4
 rcgR2YE/G84arK8AN7zwPMFZfwfHWTCHKhoZKR4TqL6HcWsXRNRrFzLLJsjecSjuS2fml1Ye+C2
 ex1QhKlWlIvNNtGV6FZCA0CYmMPU9DfL62vHgqtwdpzEOE8Ub8BSHA01zJ5bjr3+4imkIB9kyEu
 RIEjXtBSEpARb2fZm78M4rfyzBXydog4wj6YOW6gMAY4zcr1oMvWMxwkv6D8EOX2YGB3cjEojyo
 cdxmJ4GROsAviFsgVA3pCzerHqJ5L9VTnefb9zLwlsPthVWCacU0cAd3BPiqDOqSGo6N8XsoM1+
 kYNncBIzWJg1lgn8U0NtFt6DOBV8nRIWgPQIqbtwJVO6aN+baLhNbV44NcJKGtbhaZRbrz+DH/Y
 3WX3+qlwzvlxtP2WzAA==
X-Proofpoint-GUID: ThPYIOPTP0cnVUOf2emFFp5UdLmKSPGj
X-Authority-Analysis: v=2.4 cv=BpOtB4X5 c=1 sm=1 tr=0 ts=6a6cf3ca cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Hk_bfOifH1X1uJLPQC8A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: ThPYIOPTP0cnVUOf2emFFp5UdLmKSPGj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310146

Maili gpucc is a derivative of Hawi gpucc with pll0 configuration change.
Hence, reuse the Hawi graphics clock controller and extend it for Qualcomm
Maili SoC.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-hawi.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/clk/qcom/gpucc-hawi.c b/drivers/clk/qcom/gpucc-hawi.c
index 30b3ffb0638fb79e68dbcec66f60ad750768d042..3deb7edf7810ded20ffaa7f56cd8c2dbb516f3db 100644
--- a/drivers/clk/qcom/gpucc-hawi.c
+++ b/drivers/clk/qcom/gpucc-hawi.c
@@ -49,6 +49,18 @@ static const struct alpha_pll_config gpu_cc_pll0_config = {
 	.user_ctl_hi_val = 0x00000002,
 };
 
+/* 788.0 MHz Configuration */
+static const struct alpha_pll_config gpu_cc_pll0_config_maili = {
+	.l = 0x29,
+	.cal_l = 0x42,
+	.alpha = 0xaaa,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a806160,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000002,
+};
+
 static struct clk_alpha_pll gpu_cc_pll0 = {
 	.offset = 0x0,
 	.config = &gpu_cc_pll0_config,
@@ -438,12 +450,16 @@ static const struct qcom_cc_desc gpu_cc_hawi_desc = {
 
 static const struct of_device_id gpu_cc_hawi_match_table[] = {
 	{ .compatible = "qcom,hawi-gpucc" },
+	{ .compatible = "qcom,maili-gpucc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, gpu_cc_hawi_match_table);
 
 static int gpu_cc_hawi_probe(struct platform_device *pdev)
 {
+	if (device_is_compatible(&pdev->dev, "qcom,maili-gpucc"))
+		gpu_cc_pll0.config = &gpu_cc_pll0_config_maili;
+
 	return qcom_cc_probe(pdev, &gpu_cc_hawi_desc);
 }
 

-- 
2.34.1

