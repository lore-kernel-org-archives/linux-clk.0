Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FF23AE71C
	for <linux-clk@vger.kernel.org>; Mon,  9 Mar 2026 12:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773058122; cv=none; b=YbSKy06uLYo9869fMicSlZOFlWPU3bcex11SSzdgUqXqOdLfSRFr0QAevphFRxcF5m0wsXXXJA5uoD4GyQrxt54vA6t42o/CFQhwe2ack5tzWgE8h03cZBj7jwctiBrMM6ei1l8tluTilMQvS5TpuRb2vSStbTMi/LfB0HbpdzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773058122; c=relaxed/simple;
	bh=rHJsocNfNwVm2MjdpQ8NBJ8I/rjbG3Qcpok1Ai/CgR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VuDTKL9ag8BjuxyrZ0Lt7jxUWZO+C/O1y+It59E3oMDtLI589Q0dhNJnwjJVrZ/axYzt6XKPwSYkmpU8bfEcpYjn6etF0TjWawBk3LjL40c4CNYYVOELAsxHQH4SXHz4Z+2WBqaREyOccNNuZoVADEWdb4kzneES5ICgp2PN63s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ff/FXfFO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DyvBA88H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ff/FXfFO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DyvBA88H"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6298WGO23773410
	for <linux-clk@vger.kernel.org>; Mon, 9 Mar 2026 12:08:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7IdqWoT+UUiyloygT8MTrbnVWYlg2uxJ7b2MUvC7aI8=; b=ff/FXfFO1Nv/kloL
	hHHcEksr3ks58rS+mDhbDedoTIDzTmFikAcDZIrIQUpouX7z4XOSoTJXwwqHstX4
	ppOHxW+BK4uHaa4OEDdxatyGADI1F+aa+MiQU2kG1eIdQgNOLYd1gL096NM+JqnN
	SJCnuZ+yLAw+na9VJtwBPJBhxU7lol+PLaIuKHVjXueA/bHwof9VlhmiHMmRdbSd
	DV/WRePohEJ1w0eCsK5sCz6htatDrM69keGjPYS6BYrovc4xZ5BJs0Mcy37WjlAs
	UsuAoQ6IamZUh/6WRhbBj3xPpYaoV2hWzUfmJTiBOSUzT8nqxpCjcDI3zopixWTy
	5oSHgQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cstsa8r9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 12:08:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd77bc8186so2029804485a.0
        for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 05:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773058119; x=1773662919; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7IdqWoT+UUiyloygT8MTrbnVWYlg2uxJ7b2MUvC7aI8=;
        b=DyvBA88Hm+utIRRnKavkMWZNiuTbD+VaV8t+1QPXBfBNOGr01PTfj5KUp1bKzUztMp
         PaXOO4zkw3MgP1BLnky7OrjZIHBe4XjLVu+4C3Zz/NyaBr2IWa8yhXWusDzLyfJLCaO7
         Q2jHdZduopEJ3X0EzumTTTu7kkRV8rxmot39bYfrv56JGp7PV10PWONbY56WpH270UPV
         pODs0l8RQkEbUHRhD2bJ+zxfgMokX4mrxrZLdxXhRynAr2F2LSD8IrHhg9qeBAYoX4Ft
         ZQ2yrMMAGTGhtSDn1cKrukOIWagOi/KGXVs//5nZ5qN6Pu4KLfS9r26J1bnwmesnoOmh
         12Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773058119; x=1773662919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7IdqWoT+UUiyloygT8MTrbnVWYlg2uxJ7b2MUvC7aI8=;
        b=N7ispRmo+nUlS2Qnmr+3YheT87tX27mABY2UacNPSMbx8y1NbN9KzQ6bM5UA+mYUEg
         +MctIKeziqFp+AM7qE8nZTEjGTNs+/T2A1izyMDKJto1Ckv7Wr+CO1ib3Y4AzyughbAI
         ZEwjuNXdHj7pOqCeKjr9PD6hCU4awTesTdPunP3P+9/7N+nbXqXrKPb0Y3AHfkbF8A/D
         B854y5a1w7JeFKIPbGflr33WlCrBdQNoO66TPQG+g2HMAOhjscUvmelSlreQdQg8tOoQ
         e6s6vqLjWRbTwc6WpVXcvHhHehmfHy6Ysf52wI2uYvMCkPXERN54V1I1Z5XJ1Ysj9vpz
         5q/Q==
X-Forwarded-Encrypted: i=1; AJvYcCX8l5K5yy0d80zeHZTVTU4MS7FAFr/kkO9yfrLVwdrNwFljqhU7FenJ6gSChYK+OEEzphr7X+7k+Ik=@vger.kernel.org
X-Gm-Message-State: AOJu0YxX9Uy/bcSFno75hEH1ct66GvACPWPwzyloe+DN4Ox8UWSWbDQn
	dt9QGFB7WmL4QmjyiH6qg4DxjTCyrs5wZmemE2JAEiEgh/FKxWg9NbJlqv4c5VQHcU0juwT6MVw
	dWSW+xSGOrwRlBvhoJrTF9zcr0yJXEKZQAWDOYmrhpQVqiBnSkyODEHJljWgG9OSWWtsQpQk=
X-Gm-Gg: ATEYQzxg8qJRMV7pTwMcbCKEOAbg9w8Y6GOs1ZIQnafV+xKU4zF9gmUsW8RezQqL4aL
	/a0bYDs87ubhQA1VTyXW6MXKbHu7wGwQUpx65E/WRM88KbiocnmBv86v1XlKLNrT7/A0XjUjSGR
	kIyUvc3zYOyoadH0Nu9PbgMFNihiIWo1Xs2FlICu6f7FJE6DKCKuJEaRDPGE6FxY9MBM68cODhn
	RqbDQRPHFdRCLA5vn47vzBLFwb6rfAsXob/cohcFpAcOTI0WyZOuN0LXTK7a7DKsVMIwsr+nQTd
	WUWDbavgFOs/JxVnh4dVNxHtKiFge6b0mqnwM7AavebayRLJln2Sgf6ZMM60t89CyKowyoILox1
	eVr2BHJRcifn+mPbWzFPQbal1vdHA2A==
X-Received: by 2002:a05:620a:f12:b0:8b2:e058:de83 with SMTP id af79cd13be357-8cd6d3eaf3dmr1385357585a.15.1773058119493;
        Mon, 09 Mar 2026 05:08:39 -0700 (PDT)
X-Received: by 2002:a05:620a:f12:b0:8b2:e058:de83 with SMTP id af79cd13be357-8cd6d3eaf3dmr1385350585a.15.1773058118925;
        Mon, 09 Mar 2026 05:08:38 -0700 (PDT)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4853916624dsm107826075e9.6.2026.03.09.05.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 05:08:38 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 14:08:17 +0200
Subject: [PATCH v2 2/3] clk: qcom: gcc-glymur: Enable runtime PM
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-glymur-fix-gcc-cx-scaling-v2-2-d7a58a0a9ecb@oss.qualcomm.com>
References: <20260309-glymur-fix-gcc-cx-scaling-v2-0-d7a58a0a9ecb@oss.qualcomm.com>
In-Reply-To: <20260309-glymur-fix-gcc-cx-scaling-v2-0-d7a58a0a9ecb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1118;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=rHJsocNfNwVm2MjdpQ8NBJ8I/rjbG3Qcpok1Ai/CgR0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBprrg7pdKzLsmoD9r3Y84p4pzCxAzjF6qMpZDti
 NZ1INZ89UGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaa64OwAKCRAbX0TJAJUV
 VlhPD/9uAIhNz83B5iwD7Y750ftbsKWYHtDGpIxAJFtvtXbxoC6zpc2FpV4F+0QpW3tv4m9bjIB
 bDh4p48tkr67lrSzzIegVqXXcMaK1z9SVZtz1JwmOTyo4buOR+0TofP6ObgR1R0HZRayV1SGsX8
 tqpcq8hYOLZnUyH0VjeoIhumGOKj/sCH7y565zfHup3YIpV5DYy8AGzhT1g6BfzJUaKaQMbG2Ef
 e3CToDor4wiKvBLAVtwF70wfTqGCZlLRch/PIqEFxbWq9oP7TATtLHZ/oWWVbQtPvw2xysTD/Bz
 o5gSqCCrzcddgBRRUPOr2s1lrwBT2HTYeQL8hRZZxLB+WmTpMIBtEVgrKSpQJfhNjennqbCMoYJ
 gBDvM1NcDykOC8Zw3ySk07rrUkFafqA3AM/6zOanMzNj6+ouWT0QR+yV1dHrcvn/XufYwXsOxJ0
 SB/VuRLOf8CpDXvECHzQqma2pmNbKKjajx7Pjo4gAZ+ikdvEygApWtuwLkTPhuc30NqaScmv0if
 Sw4wDVt5xfcTceMqtRbATFoqBUZCffu3OJxEujU97WRfQKeAkEZOZFaTEY3x4RLWO90PpcMI4/Y
 VEHYrMqX208zohxsI9WQtLLNoTDx8tGUQyRH01OleIH0KzLnkHC3ExbssW5M3t39g5GFqWPhKLK
 6BuncfOl0ib533g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: _N_t58y_AHP6Iq1gApA3HTOA_bVkZK4S
X-Authority-Analysis: v=2.4 cv=I+Vohdgg c=1 sm=1 tr=0 ts=69aeb848 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Q0q0LOKJFIdqpUU2TdAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDExMSBTYWx0ZWRfXzTnph2FQoN0r
 odvK9btlMnNAKNVD3p0+gc9IXv2einu0BRDeDt1wo1eBqaShA91Gg8ij5EMmRfNAirYye38ueDU
 mFeI8o9HBHltabYm4xvuvMdyqpLj8h5UVlF8oAnHyS2mFO97aZulbZXInXlYsg2sDWHzPYf7ius
 /vBKzVs2Io7JWrR6iSaWIFE0YupHsF7stH3ASfVxnY376jr/O5S5Yv4jQAXDJxKt8KHVlxNkeWW
 FfiJS1wg0ico4CeObSFr/vO9lNaeNeQVJ27Dlsnfafiqa6+yRf6hpnpKLZw42NtIdfyV9E8obku
 eOnRalCRgLYQiQKMlmtfqjDDAHdGm//b8yNGInf+G3IS3BZxmNUfkHZxoyZmo5Gphp5XVThvcIn
 mPXbtdViWusKw6GKH7XaOaBT159lmeowRKYnbkG9YIm4rseStNn4e90JYj1ysosePSI99uzeato
 46sQkMs8Fbm43nV5ZTA==
X-Proofpoint-ORIG-GUID: _N_t58y_AHP6Iq1gApA3HTOA_bVkZK4S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090111

It has been concluded off-list that the controller needs to scale the RPMh
CX power domain, otherwise some of the subsystems might crash or be
unstable. So adding the RPMh CX power domain to the controller will result
in all GDSCs being parented by CX. This way, the vote from the consumers
of each GDSC will trickle all the way to CX.

So since there is a power domain attached to the controller, enable
runtime PM.

Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-glymur.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index 0f3981252a68..7cb5076a460f 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -8578,6 +8578,7 @@ static const struct qcom_cc_desc gcc_glymur_desc = {
 	.num_resets = ARRAY_SIZE(gcc_glymur_resets),
 	.gdscs = gcc_glymur_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_glymur_gdscs),
+	.use_rpm = true,
 	.driver_data = &gcc_glymur_driver_data,
 };
 

-- 
2.48.1

