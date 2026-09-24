Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015D94825BA
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246473; cv=none; b=NLF1q+GbisZoLvygnjUeu1KYIyMdv0eJuLAVCkwxu5d7ZWfWr+4mQhCkDhxz70oFN14kAX9haSOedPqBsKMXymlUAPQTYpbq3BQrGA8PyB/198dldCVUl9Pvow5xgo9JqpFvOI1h6Mkej+rne86ijWjf8M5ITmVOdYPI/+CVpHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246473; c=relaxed/simple;
	bh=NLwQJl2Mety8v+w0gED1ABzvOlq4xUPMVk2Hw6gbPMQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T6bV5TkcH4Pbq0Edj2T4dHPYN1Yj2AjG1Zz2yexyLNlv0CfBrJmEz7VemMWsX0TZMiCOv8fwcrd1PIi8JRBAFRq3so+94sHFw7A5PrTzibvjSCUgN2xpiZr1ZopJI5UioZVdIMBMniluyrmiFGQ9VsSAbYxmDzBNJw98FR/df9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c0AE/mxD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZzrCYw2u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c0AE/mxD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZzrCYw2u"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9PncV1644235
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OhFr4HUfLOzEqRzgX9px4O8g1cygwzxilZf7Vwl6sOY=; b=c0AE/mxD++HOcUiU
	Gx5SMmeiMTwEsINHeAuGBXrQcpzw6rg+PRN0aauQorFbw8yeLD92+SIds1vpCARz
	KUI4iyPius9m4rfnF3x6onhWFHObbF5PV8tiXNL5fG7Czx3Z/s0ha6epkAtFMWBi
	GUO3p2vgjBwMeen1s5Iob///NRK+HjR09cDUNw4QP3YvBRLHo/oB4QkNbve9NE/a
	T/YV8G/TUTtD88l93gQ8M2OSqawNaBLdMoj29JQJ2vsSxfW9anPGskgedTsrHd1s
	XBqppUuNHd38rIDNXWyB3gsRJGP7aev6lOXkx/Jvxb2BhaKrTWtz/i3PD8y51CG2
	QDfR+w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvmrrb418-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a0312937eso228596085a.1
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 03:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246469; x=1790851269; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OhFr4HUfLOzEqRzgX9px4O8g1cygwzxilZf7Vwl6sOY=;
        b=ZzrCYw2ug5KOS5ss1Rpf1AbeCva4BTxe2NMOdCTzZ+x+02iVwiUXJgUHDexpAgOYem
         MCF3zEBfqevmRMugRmMh+nMHibnZpUg2MPMM+rEAcurbPIl4T9AvgrVyV4yGCeCRaM0u
         UYCgCPnWj3hOytWVYaAWEgK/ZCPu27FupPnCScr9YO2/FqdHIJQiE/1Ii0EEVdDGHkh2
         Tju/g5W+AWxbgOQLkcz03lkn03oTWsgOZEQ28YbYoAJqUSSySacIIG47TwSciiqG6R7M
         OqvK7Us5tTSTBEwjyLC/29mIWORbK45Hvp8Wj46hstT3AHM6oXP3LK9ZlB/VQYPPnckZ
         N0pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246469; x=1790851269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OhFr4HUfLOzEqRzgX9px4O8g1cygwzxilZf7Vwl6sOY=;
        b=AOpzTbEBAmxLGqpi0RHY51KdG/xS5FSIHZMJSk4fix9Erd9/kMuInCMI5HT/Zo0EWn
         qf88dwtEsUlNj0fWrL2y2vxVktvV4rL1f6j+BOcqdHKFAAAbkEA0P16itJFQvxRA1UeR
         SEN6FcFzRmJzSr9d82+XhF93c2GH4UzDiMOFq4yhAzDRK96alVL0ramLJHF3x0AQnOwz
         Pcc5cy/QcNdB4REdHW9BHi5AXG5BSdBTkGZSdHJcxMYOWUVrIpNJ/J8sUcV4xATWtV1e
         9ZwAiBoJKyupHLwDrfvPvaTj5Rc3q05sc6EzOxzIAEl7OyWeE9UO+rDpHboPE9lSenuk
         kXUg==
X-Forwarded-Encrypted: i=1; AKwUvBxGtmI6Zob7We8WBT9IByshzHryCJLm14M4VyscURGFS0VE/mZVDJOkBPR6UZrKl2y/2NsrNxRWYTg=@vger.kernel.org
X-Gm-Message-State: AFuF++n3D7UoyF0+IJnR279GAxo1XPWpHQDsPlatCwXsKJYq9NkcvOY+
	eNBCrUDVA7thMy6fpOjDNwiPW6KxOF5jugz7OSvn1slJsAsV1yTFdjdAbfxpgGdQ1Qz9Xb1OBi+
	JNWnHiNjYHushlETigbGsoa/+mXD5DL39775u8vU5HuXkMnx8yg1RVkyMlN+ciB8=
X-Gm-Gg: AYBFou1BjcNr7ei5pkoyPFCuVjPoOdo4By0o7wNoCMiMMFrFBsiQEW0zaHGHgYLqNhg
	797l5ogKPR02/3vSf62ghcL5L+MORaM4557iFK+gRHnCuDSv5NFH7uOLBcUFILgPCRx9+I3+BUE
	K435pNafmeWAWt27k4rEYwFNE+0wGkfo/HXEuMCz3nFlyK/IWL1ryjF35e4FAOylvopJuyezIyM
	LrK6VDR0K1ZJFgT5rMupZ1TmWwZcsQZHpqnBqNZeDJf0OK3UqKesqchXJPxUMpLxo1v1JoQSWYF
	3QWT2pIgHKCyAqigTu5HvKfBCkur0QEzkLVfYNtMMBfPxd/JkpSL7J95GiaXSh9mK4V25YYricw
	KHm+JbAXE
X-Received: by 2002:a05:620a:6496:b0:93b:d7a2:dd2d with SMTP id af79cd13be357-93c3641e06bmr219201585a.61.1790246468795;
        Thu, 24 Sep 2026 03:41:08 -0700 (PDT)
X-Received: by 2002:a05:620a:6496:b0:93b:d7a2:dd2d with SMTP id af79cd13be357-93c3641e06bmr219196385a.61.1790246468194;
        Thu, 24 Sep 2026 03:41:08 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:07 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:37 +0300
Subject: [PATCH v5 21/42] clk: qcom: gcc-sm4450: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-21-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=765;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=NLwQJl2Mety8v+w0gED1ABzvOlq4xUPMVk2Hw6gbPMQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3uID/BIxQEOjphq2+/ltLPcgadZ7XQ+cpDz
 39dgxFGSQqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT97gAKCRAbX0TJAJUV
 Vv+JD/0cyLGDEKQ5VdgblJvsa3s54MokVU/AWxhKbHZ7efksJysImPNMzA6FhC5ZmvEayzNhlFq
 cdEK4jfnQGkQG07pg1Jx1hwDikazHGxrxQ/6dM09vNy6EaC7tZMHxcfzKziFx3EzeiDlX2qKXuj
 baE81iqfH37DC43cL14NEnZDORA99urkfSz0fLW8YKCrzFoXf6s7LiKJkvaBaaE4EraozUQO7Zs
 lQweNcTNOPBma1mLGTCpAH7AgbY2MCsyeDqRY3QboARzeLvJAxP1KBuEGW+h0QSBv3zliH3SmMg
 tyZxXh1BbcNG9p4p8RfuF8d0eFzk9+yPramZMeIYTrGHUyKb/BAIs1hLV8SMqPhXwEhOxYx2KYh
 h3EDdxyT47DSZkJcGNn4x2AhTztOGiquXOK62HCP+0bwyVp/SsX/PbAWG1o5AHrS/WeCzG8DVNg
 fHgSoO16ueUysufvCG6QY5xB07f0caJ5xNpTXAe945bK93e44hqkOpvI5A0LWs3MIhm20qVM4i6
 WVHTulDIwIMJS9vy7VMgfT+tcNAxQPYDM5CTQxAEXw8n8NLedr/8PSrFeEYTACA44bO9FXr//e2
 4UEqqLo7+nIXp4Gd6DcuRdF3tk9YNuDrK+yz1gQnNAhmhTRwC49JshpdNIUpuN2iM9RkokLR+82
 u0RiIaQzGm35clw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXzb70Vm5hfPTw
 D6F4o1LfItqJVI7e5MgRg6x8vdrFxic00G59lntI+Cnhpe25SHsXITTb9HiaWoIWpKPTuThonvT
 lGd88Psv5ydJuK2MFwp/ExiB7MkHyUSghFzEO+uDDEX5CfWBl+ymLWQvBKlEtysgmsWr1QoXqkj
 IrziNEruyZFabK+sqa/i3EJ3y2eBHCrXV9sUANNONU5bWlfiX6WA4DVTrI+LNXLZ4CrX0NoKGOz
 3Zx1gW2mWbgHP9ggBxOrOCsFW/yZ6PcrxrCootZF9v2U9AjmQU+0Nlimd1XQS03qgWdY9zq1l1E
 yV7YKf9S7MRXFh6F4Garbk/Z8PnXPR1RkN4l1fj0AOXZrgH6kZoUCbdqzsKfUjZLmLZJsTn+dN8
 CbfBVznffN4lwPVIJthYkAmPwno4KKTrmG0OCUcEwGLUz/jYi3gSBqEr5U1zMAHOqx0xbbZ/muC
 Te7avbfbv7bkEDVJ0PQ==
X-Authority-Analysis: v=2.4 cv=TYwDJhQh c=1 sm=1 tr=0 ts=6ab4fe45 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX0Ujdosduiqfr
 60qYLND/h2jl28NcmCXyiu338aK6YVFd/6uzdnMXFf9UP4IA30abmakrrh2YdWyLiWTaG1NORnp
 R48PzVsX/OuTzm+S6nN18oia9RbY9V8=
X-Proofpoint-GUID: D3TX2MnNngvACbUjOZkAvnwXmnMQXZz8
X-Proofpoint-ORIG-GUID: D3TX2MnNngvACbUjOZkAvnwXmnMQXZz8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm4450.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm4450.c b/drivers/clk/qcom/gcc-sm4450.c
index 4fb4d43e8582..022b87572b16 100644
--- a/drivers/clk/qcom/gcc-sm4450.c
+++ b/drivers/clk/qcom/gcc-sm4450.c
@@ -2823,6 +2823,7 @@ static const struct qcom_cc_desc gcc_sm4450_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sm4450_resets),
 	.gdscs = gcc_sm4450_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sm4450_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sm4450_match_table[] = {

-- 
2.54.0

