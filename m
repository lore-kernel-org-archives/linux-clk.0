Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706A92FFF8B
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 15:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774624042; cv=none; b=vE4AZwDmMDCnCoJvXvX7LcVMWekH83ufyoO/DQ9v21hYDI6leiuhkWUgBEjNricU4a4ymEmTFgZuO/V5ecOTycnVg5C7N7tpYO+XgZi0GWCiPPYdpoCUvjZSjYe+ouGdkiEPT/DY7QlM8Mw4kyCFinyXdffiE3vjdmgXcz+IjJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774624042; c=relaxed/simple;
	bh=Q1M2TmMz1lIs8VVk50gUv7BVVCmurZMf34K29XAP1xQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=J6E5C0LZ3XhcHyycjq41XcNwOKY2LZO9utVyyRo0VK36Jq/Qz5kV/6hbht6BDfmd7/RUEQJAHiMJLItKr8Jhjkfq274jF43aOaEVGlxA2+louTQsY5ol48VZTZ+vBMo+9Cu0kzeZWduXk4zOKEUbawc9PWRU5KTgRsELlX9rLIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A+YTkFW1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NqC99m8R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A+YTkFW1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NqC99m8R"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RDhZuO1203807
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 15:07:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jm3Zt//eOBSWdsSrodcdg0
	HwCyKxynE9/sYFgcO8whU=; b=A+YTkFW1jcptDLYie2z6beyCl9fpODvGmBSkSU
	W6R/GYW52S1ly3XKhy5ouEV5w3tnDDWQ98h5e4QQrQWkb0Z4PC0BmvGAtj0ZwB3e
	gYEooIJp70TTkEVIi5iGejj1D2VleEPTP5UXFk67slGq/OSCAlj4al8ms3Bvnt0Y
	aOO77Mk5byXkwf5XkZpOFqy89cKXgsNYi36v98xU2u0tQd7D5k/oQE1VKX0qFcal
	BzUxrLSFtOycr/ObroT1V1E1WlXTZrZb64HpWLE8cotOhfMAq/fRGtwv+uHbnJKN
	LCE3DFLMXKiajlK0TliIHjc2C6y5iaLxvKKnSAy18SMO3erQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bd8uk7f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 15:07:20 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c73a4983fc0so1655926a12.3
        for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 08:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774624039; x=1775228839; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jm3Zt//eOBSWdsSrodcdg0HwCyKxynE9/sYFgcO8whU=;
        b=NqC99m8RRg5+WpzbRmXGN0fd9Qd2P9GNa+O/T5P+LEXhBA9WdEiI78WywnMQbCpY5J
         vXQ3Zjp7Rd8kVv4yO+1jYkSydkkJhKY4NqeYkITo145zH9LQSnj17B4BUc6M8iCfB2KO
         bL0toeT9mxDWNGkslGGffzp/VrxnFyh2AqcsSJmWZmE3u31H0yNOfgo6UCWUyQfeCrcF
         DztdlqxzP0QoAiOxgWmuQm6/d9mMTjQN0BE7bQpykZnC1ttxk/cd0blSw3NfYv9f8b1R
         2DUKARY+2sKwSwuwyljvKNVRA9dlINJRKJWp5yjYBdqboWzEPywyz8kcQQVVUrFhbYut
         03SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774624039; x=1775228839;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jm3Zt//eOBSWdsSrodcdg0HwCyKxynE9/sYFgcO8whU=;
        b=lL4mkF55QXU2XnzXzTCCvxPvMKFt4PXwUE1483Ezd37eiuyRR6ugTC+YYEHFSnJNZ7
         fnEcI1OHx/smJCGOiCOb9f6/jWnn5PrBZMEoCFb8+Z9Xwc+AwQzcekmAaVFNNYIz+y6m
         +yZLQEkmtdB8Pl2LhdnlGM8ClCL15vjvZvH0urMCbUeRnCkDxh7/vp0IK+hegtOHZR4Z
         xwZI9+r29hWKhuivmNZ+e1hoD9kMfypyU/2Tr0/qpupYUa+TJE1k7QiYXYjkUEXbzu25
         TltfHgYzjPZJ1uxhoots3F6AeJ9D+k/F4M59998hWaLTytAazHgOAcHN/zL3kSBODl2d
         /stA==
X-Forwarded-Encrypted: i=1; AJvYcCUDk2wK4290HNDN86WCnHDdpgGSt1lYJC6NHFypzBethzHbMBNM2MiO468p1KTUxUqYrahVcKQ2Zr4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYQTEems1pBmqaQpmDl3Or2+KJ4Nl/wEkQBSzi1o6VqtVnbhBK
	4Z2WsKI3wTMaaYNc9vF1sQzDkUtvLwyqWX+OxSI0sth5YSk83tlRq3qTyafibIzak3/EkbdUirj
	1e2uIKNxajLRgrOaTvQ+GO4lR7axe69rmAiVtF+YL/lBDGXMwr3PyRuF2quEaBxI=
X-Gm-Gg: ATEYQzwdA9wSI7a2tpBedXBc2wug5HN/GioPOqujHaZ7FPE5HQEyyChS6b3pIpCinhC
	lJEkyxuuNPESny8+nDSWkWcn2i0xr1Yc4/j8WmQMcUUkLQWnq26lZn6CqtgoAVd8hPddUFr6wnH
	f+WTgECOZFQ5ZGJ2hBwpuflgNbXx5AfTrBI1e5uG4sbnPyvkHlMuTJe/25g8ki/kq7cxhFQisiT
	UnXkNSWptM+mgYsXvB9VZ3PbrC74C+SKgnPJAaZ/EMUpdGWyI5r0lUAs8oRCouWs2EOEDFXahct
	ptV0AS4XUGAVowrPGZs3o1GbmQdxokb05KK1mwLqH5W2aHeyduxxCkbp3WLwT1jgyDMKE+xAfoC
	/m+dL1Z+cxVjqobjLbCtQSPj5mJJn04OWVwBLb44ygNMdsLrKGS6+
X-Received: by 2002:a05:6a20:6a10:b0:39b:835f:1730 with SMTP id adf61e73a8af0-39c877f8f90mr3784668637.15.1774624039158;
        Fri, 27 Mar 2026 08:07:19 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a10:b0:39b:835f:1730 with SMTP id adf61e73a8af0-39c877f8f90mr3784604637.15.1774624038406;
        Fri, 27 Mar 2026 08:07:18 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76739b5ec9sm4864561a12.32.2026.03.27.08.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 08:07:18 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 20:36:46 +0530
Subject: [PATCH v2] clk: qcom: gcc-x1e80100: Keep GCC USB QTB clock always
 ON
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-hamoa-usb-qtb-clk-always-on-v2-1-7d8a406e650f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAWdxmkC/42NQQ6CMBBFr0K6dggtlARX3sOwGMpUGoFKB1BCu
 LuVE7j5yfuL93bBFByxuCa7CLQ6dn6MoC6JMB2ODwLXRhYqU2WWyxI6HDzCwg1McwOmfwL2b9w
 Y/AiNaQvSNtc6JxENr0DWfU77vY7cOZ592M7YKn/vf95VggRUFZqqsCqz+uaZ02nB3vhhSOOI+
 jiOLwv56oHNAAAA
X-Change-ID: 20260316-hamoa-usb-qtb-clk-always-on-bcd4e5f3553e
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEwNCBTYWx0ZWRfX+ReRZ06fhIKq
 Xjeaacq2EfbHw9bKplJf9cMHnvuJU9F+rkCn4mhAPjABT6t8y11nmA858Dzaq9ML8VBibFkCAfM
 GUzbQQXOYf/AAUtdJEI3BKNvvCfxak3JlG1U7D+93B7j7/oxui8GNED1lNo+5Va/GAsF8qMJMFz
 l/TX7WCBidusC1FsuIV3kxt0w6aN27uLuTvWpekEyhOD4XW08Z7tGp6HCUhgx6VCyfj8DUwKB5S
 NNUp3k7J5IHz6s/xW6/TypwhTEH7vm48Lt91kuwcm6cBNZB53GsCLTPjwrE19iZZAW+NzKrZd1w
 aY3LjB+1JMhZfGsgkntqWi/UbAPcY0hLHLfCI/V8SmgjCcuy38V9C4t2Lqc2LaVE5ooYpVpKYHv
 BfsQ9FU6rwpvc98RgHol4SpsWWcLj7MEM1lJfHSqNnA+8QGhpNKb+H+zgsSs0OAAlKZ5fBs1w1C
 cSBpQy57y3YnkhucocA==
X-Proofpoint-ORIG-GUID: 1CiuMzLctolXvvpHQDCA10G60Oyaf1Yp
X-Authority-Analysis: v=2.4 cv=BZrVE7t2 c=1 sm=1 tr=0 ts=69c69d28 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4CI3Usps31ucNWVHWDoA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 1CiuMzLctolXvvpHQDCA10G60Oyaf1Yp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270104

In Hamoa, SMMU invalidation requires the GCC_AGGRE_USB_NOC_AXI_CLK
to be on for the USB QTB to be functional. This is currently
explicitly enabled by the DWC3 glue driver, so an invalidation
happening while the USB controller is suspended will fault.

Solve this by voting for the GCC MMU USB QTB clock.

Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Changes in v2:
- Updated commit text to add more details
- Added Fixes tag and R-By comments received on v1
- Link to v1: https://lore.kernel.org/r/20260316-hamoa-usb-qtb-clk-always-on-v1-1-a29ac94f20f5@oss.qualcomm.com
---
 drivers/clk/qcom/gcc-x1e80100.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
index 74afd12c158c01c121d9aecd56e65c0c302d7cd0..73a2a5112623e5190f41129af7fd76a86603557b 100644
--- a/drivers/clk/qcom/gcc-x1e80100.c
+++ b/drivers/clk/qcom/gcc-x1e80100.c
@@ -7480,6 +7480,7 @@ static int gcc_x1e80100_probe(struct platform_device *pdev)
 	qcom_branch_set_clk_en(regmap, 0x32004); /* GCC_VIDEO_AHB_CLK */
 	qcom_branch_set_clk_en(regmap, 0x32030); /* GCC_VIDEO_XO_CLK */
 	qcom_branch_set_clk_en(regmap, 0x71004); /* GCC_GPU_CFG_AHB_CLK */
+	qcom_branch_set_clk_en(regmap, 0x7d01c); /* GCC_HLOS1_VOTE_AGGRE_NOC_MMU_USB_QTB_CLK */
 
 	/* Clear GDSC_SLEEP_ENA_VOTE to stop votes being auto-removed in sleep. */
 	regmap_write(regmap, 0x52224, 0x0);

---
base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
change-id: 20260316-hamoa-usb-qtb-clk-always-on-bcd4e5f3553e

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

