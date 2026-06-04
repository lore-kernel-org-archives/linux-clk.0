Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECA03BFE5D
	for <linux-clk@vger.kernel.org>; Thu,  4 Jun 2026 05:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780550847; cv=none; b=OQNJUONIV8rUZkr/AVbrqFN/3sfNOtm6e26ZE+7+hY91ID0IE16RhLQwy6FXpRCvsnR5JmsSLcTtuclX/aq6BDU0PXAk/yWqfFQcqprsgLP9nKTiTfWqNDbJ3L9pgGiQjQgUUCZoH4Qpxq625VLGC7AnSFyjoDGLqAkhx98jbpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780550847; c=relaxed/simple;
	bh=Fb7z5iu2Tu23nAp6mDwCPKGAkCEtpKFZU1e3tF43ZGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OSE1m9IFM9HSJs9rwzoNbg+QSLHkLGgw82bLqpZkECdQ4DExpQkLF4dIgxTd4Ep2OkPwXNUPAbnjrDrBtccf1ugu87a5h5GKFElYjVS9b1W1pZCSa8oLJJs0LPYDKvDmIoJTBrBJacxhuqPTNjC+aRShZYGjGGwQS8vbgkNDl7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jP1BgOpo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A2ROExcL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jP1BgOpo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A2ROExcL"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654025Ch1476664
	for <linux-clk@vger.kernel.org>; Thu, 4 Jun 2026 05:27:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gk1LjnHnaMQZUuwx1TTnzERzXyykYwap6JC7YNxS4po=; b=jP1BgOponwXvKH+Z
	uKI93IC6ylBIZx/UCrvwLa24Otthi1EFGoTFh46JddICAqYWhwKQCo+RJDWkWhBv
	8xP5iNkdwClopAA8MZO1Ja/J9Zj6VlXSKP8awd1Cgjg4tmBbWVfAcGmDaOaKb7Nr
	xdiAtw8J2HkDGmLobafhdLv9SpHAs1ixN5aYFGmscew2kmpjTE+bPGwjplxqIsy2
	R3kSBO7F02DfDlfAhKZ/L7fAtcOrvEGky5qu4UmDe8sRqCgX3kxrX9/0Uk5fXVSY
	nfnGYg0sbrXR77OTMiN/uxUm7HZBvdheBsbAKBP9chQm7yCawnvilKRV4TqWAh4W
	m4JLmg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejp6nu4p8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 04 Jun 2026 05:27:26 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8423efdbe6fso251843b3a.0
        for <linux-clk@vger.kernel.org>; Wed, 03 Jun 2026 22:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780550845; x=1781155645; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gk1LjnHnaMQZUuwx1TTnzERzXyykYwap6JC7YNxS4po=;
        b=A2ROExcL4f3m7Q5fnSffSgewS/p5u01TPZcAQa5Nv/Uv/XZZRIYGmZ2/ogFGvfjpPR
         M6dr9vOK1dgxP28gdoI95g/o+F7B5aOO1vXSKFCihyFuV0fQVIjSfhqT4IVHA8evaua9
         pI94U+TjilP6NOcmH7muklb7p8EQQFcnK0pnm5eLkHPZqgfVk7vrmEoACFc9hWFq/ry7
         F+s9wNPnnPNScG32wt5BT0ddXjf0yj5JwPN2ulUTK9MmTEPfpb0e2GiGWYa9JPIQTDBT
         byxBxzTXjw4BqLnO4BImqo9RJCkL0mNJhJbVo5llQW0/4yxrHGyptMdc+DM/IVuqlnQi
         X2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780550845; x=1781155645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gk1LjnHnaMQZUuwx1TTnzERzXyykYwap6JC7YNxS4po=;
        b=tEbj5NBib1kfAUQdokb8NsiPQYp5PGR5t2rtBWw5+9RE8aFswVDJ+sKVCempxC1V42
         bj+TUxTGgWDY4IBL/ilZJCNNEEGRhca2KBXUPFlQw2/buUuE2LLnRvYzWP6pFdl8d2UN
         Vs0K98E/34vAkTC8L7d/Yjy5XO6weR7W7HH1qxzr8LYx5SiyvKDhzWL2DF6nc1DqKO32
         w1fBuKrXgRXA3HzXU2V+017DPiLogJKux3msoNoSRWPlmLqW124wLPD4Ju28ecBgMXUt
         XiNrEOxEbShzX69LBcfWrWB93Rpzy5/5gaJGNpFKe+OZwIa7+SYgzsoC3LaJmwaU2I6c
         MIiQ==
X-Forwarded-Encrypted: i=1; AFNElJ8z8zeNL8glQKjm7fNiaGPx887oUKW6BjfSQHafGWvUJ6Klz5HMFbMAupVco+1xPxJM/j72AtXTMnU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv7dlW/+Epuve3mIMwwm9sB1g8tlgse63skmfxTqOpfh4XExUL
	uboeQW/AbnDvLDntAWwu08gEDZYU+3HJ9dALkUoJS0alLD25sdAyWdZmTMW0vWfRPNCKbgOZwSs
	rjFV5BYWCDZEiGZcKYMVZy4LZHzssFvXnNwOiOpENq/MDHElkoYkFvrp3ERo+1e8=
X-Gm-Gg: Acq92OGjwYnF4FX7OkT56YoVpClfUL0khl8J0iEcvUH0ZBhqw7SpeHxL6HKAeYfEmkk
	2txB6LfoklGYoEqqz3nijsSHEtEmOz25CqBQggYFP5D5E1J3p4mcCykjIHRxlI14xtvP5SOYQIw
	f6TfcaGW1ViuBkM7dz7/1D5yXTbzZUvuT0svn7/qKfSG3n0me4BgJ4+rOJJ3ij3GODgmM/AEwDN
	bMglHbp1lpTmdCBqQaXrOtI7T97q/eXV8jCVyiOvGhU4IEnTinAubpJOhClWabnFoL6v7w1vYXN
	Lv6RE4U0DIhQjsmeA5sVSyoQUihRaB+YKVn1doQmxP/fEciNTdDVowaI+rsVEga+moqYJr1uUbf
	7t5tphi7nk9E0YRx4x1OgP+1W7iWwCC8txuUl5HIIef+u0c6rnFdFQzpNXdbMqwM=
X-Received: by 2002:a05:6a00:2999:b0:842:6004:3fd4 with SMTP id d2e1a72fcca58-84284ed9801mr6234781b3a.24.1780550845454;
        Wed, 03 Jun 2026 22:27:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:2999:b0:842:6004:3fd4 with SMTP id d2e1a72fcca58-84284ed9801mr6234757b3a.24.1780550845013;
        Wed, 03 Jun 2026 22:27:25 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842820e8e6asm4493678b3a.0.2026.06.03.22.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 22:27:24 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 10:56:17 +0530
Subject: [PATCH v4 11/13] clk: qcom: Add support for Qualcomm GPU Clock
 Controller on Shikra
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-shikra-dispcc-gpucc-v4-11-8204f1029311@oss.qualcomm.com>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: R69XcWziCLcjzR7uS0JPdg2SYW0uTU-q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA1MCBTYWx0ZWRfX/6S22iZi2w1H
 GPchrMBOfd3kMwvIjxX3HMwHvE/Khx3+wKJ0mVlJRANHL6VBUxRHnVk+s1PG4qnB+LsW2uEFiFP
 4uUxH9NcSdbPRA0Kmg56kAtmME94qjY+j7t+OwW48lRxHrEoI+gYEikRT9JxDmgQjqZEzV51Fml
 BD00mEbfqS7WmPk4Wd9RmsKHn+jO2uNzwCdEyTa9h5XEoMKUECFjUKRW796jSgaOsTfUNPYdIbZ
 qik/ACuPszC8x9/NOyfh96yhmtz6yBCnMaiSnVY/blIVOW5gaDq5IQWfcFrjeMNr75ijHgLluIz
 Rl7+CHbYihaXFZ80q4F6NXote2G8Ieh1t2mFPHbp5xUCfKWvoXz2Cv3dJMvEbhbs/nsd+pX8T4W
 VXLSftEY9KcL2gIZyEL85owAI/sC3xOs9yX217ZIHGPDdcDmOaAFGx3RDpUT2HcUFHlB4IUYOgH
 R/YjpKxe46GOtNrOGBg==
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a210cbe cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=vsOEvA3BJYGQS88P8KEA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: R69XcWziCLcjzR7uS0JPdg2SYW0uTU-q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040050

The Qualcomm Shikra GPU clock controller is similar to QCM2290 GPUCC
hardware block, with minor differences. Hence add support for Shikra
GPUCC by extending the QCM2290 GPUCC driver.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-qcm2290.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index 6e696cf672923495c789055dcd2ff905d1761e16..f43dd8231fb20d6f44a10ac33ed7dff923c81fa4 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -133,6 +133,17 @@ static const struct freq_tbl ftbl_gpu_cc_gx_gfx3d_clk_src[] = {
 	{ }
 };
 
+static const struct freq_tbl ftbl_gpu_cc_gx_gfx3d_clk_src_shikra[] = {
+	F(355200000, P_GPU_CC_PLL0_OUT_AUX, 2, 0, 0),
+	F(537600000, P_GPU_CC_PLL0_OUT_AUX, 2, 0, 0),
+	F(672000000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	F(844800000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	F(921600000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	F(1017600000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	F(1142400000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 gpu_cc_gx_gfx3d_clk_src = {
 	.cmd_rcgr = 0x101c,
 	.mnd_width = 0,
@@ -357,12 +368,16 @@ static const struct qcom_cc_desc gpu_cc_qcm2290_desc = {
 
 static const struct of_device_id gpu_cc_qcm2290_match_table[] = {
 	{ .compatible = "qcom,qcm2290-gpucc" },
+	{ .compatible = "qcom,shikra-gpucc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, gpu_cc_qcm2290_match_table);
 
 static int gpu_cc_qcm2290_probe(struct platform_device *pdev)
 {
+	if (device_is_compatible(&pdev->dev, "qcom,shikra-gpucc"))
+		gpu_cc_gx_gfx3d_clk_src.freq_tbl = ftbl_gpu_cc_gx_gfx3d_clk_src_shikra;
+
 	return qcom_cc_probe(pdev, &gpu_cc_qcm2290_desc);
 }
 

-- 
2.34.1

