Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E11733ADB0
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 17:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783012168; cv=none; b=igqsOYhITrOx1rV5XyXHm56Dryozh/kMGfqbA8D8NXB/QC2HGzzTYdFnGvZ/UwLzjRlbP20IlLNfQ1FcnZWorEoAIB8D6Js31sVjpiq6CQyuW9+5T2WUwnLMtLqdHK1SrPBhF5SRAcKDtGmTtcUVFHHn7c5c+Fh8v/TBoFSH+4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783012168; c=relaxed/simple;
	bh=cKqwClXNxU7u+xSUDBQ9Brn00QjM1FW6vPXxe9i3ims=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k/GMK7MfHVGL2vLBgPYObuSdc8PlHmIrvsc3dHZG5NxOpLZU1WbcKbAv8fPdY5YKPdMF7oMeIKLE9+Q0ct8lDXItxufScIWq9cZFpAVsYdLTRmUQj9JEJ0F3xay6zolpDWrkS7LKYWqNp1rZZ2GEgMD2USuX0LTr54RdXYUyjuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fsGJ454y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bi0O7tbT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fsGJ454y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bi0O7tbT"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662FUfCK866119
	for <linux-clk@vger.kernel.org>; Thu, 2 Jul 2026 17:09:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CsRqF/VVe9Ur+OBuk+UfrGRhTIFOLaL6m6mXFREYy5c=; b=fsGJ454yyr1xZktf
	h/a+dcSLDwpl7VwHIpnJfuSWOP0RLAvmnHZWhXwe6YchsWf0YGXZ5wi/+drJ8tqy
	Y/ZalibyX3TWpXPsR/HfrYeMogmuiTCoXd6q/9tTN49+SKodf/KBk0b53ojes7qZ
	X1jb3VK/z8zljLQXnF+T5Msg7wf0jyvhVeP4L8tKcLMAlZVjhnMC6UTpWXG3DNxk
	YtmMvgP/WC+w0QGvuyuxeAqFnWjt4tifMfI3OjJgVr3DIFqjztCu8BZRG3nCInG+
	ZrX52Dmwk7OtzZz7znW4AThMYIjH5RmCx28BJCHQSuJ/sWKf3TKxMsUoirx/ii9l
	Ka6QZw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5tpngevp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 17:09:26 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37dedbd1cf1so317939a91.3
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 10:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783012165; x=1783616965; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CsRqF/VVe9Ur+OBuk+UfrGRhTIFOLaL6m6mXFREYy5c=;
        b=Bi0O7tbTiRgvxZ7FjHhlZLfhX0aapbzirsFUqEaBqAi5kXxjIfl4yWTZTkhzkTYUSN
         MpOuS2Ao+8/w7OMVfNLR6aYxmCOus6TDL8mX6KYLHWN6FcQcFGlKix2FO0yd/hwUG0JP
         SJhibf+albM0XTUhcOgSMoGc59NDcBYnLiCToNGqO83+MprSiD3vbcVc4KUX9LyeqAMh
         8FBMWd166x3utkHRwAiHlcv8p7Zlv50RbiXHuAPSJ9LV5RQEONwpaYKQ2u3oshkKRfZD
         N579SyMcPCAHjDSxb/UegKnLNAhSyFgO+2dxS1oe3z29/J2eEKe0c3UddWdnyaT5U5FR
         aoeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783012165; x=1783616965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CsRqF/VVe9Ur+OBuk+UfrGRhTIFOLaL6m6mXFREYy5c=;
        b=Y8T0Szo81jlpmTwKCTsfrsZsnxZ3gnKNXysVBKD28WN9qCVALcr7CPRAjYDjupucEO
         2OEaVzO8I3lgKmvtix3P7n4hmt2++yQvh/9Xl3rpwdddFwIEI205+wOdsYmI4i0p3Yfb
         laWLIW1DvC9xZjR4LB/hq4dEiq13fk+THlAXXlu0k5BoNRNr7BU01YwGcjlH49kz52Xn
         +Z/G6n4ydATFF6GkZgL4GNbjQeStKVmwmBLBC3OHKd0XxxbK9MbBgvBa9pBZSlbWqnBK
         R0jSpZhHW1jzuBM94oy+HMWzJVouTBjEKacBHfuz6/dlz+LihdpAO0ozxjCSlKQkWCTw
         Uzlw==
X-Forwarded-Encrypted: i=1; AHgh+RrYaBmllwLkO6ACakiF05lb6xGPgxrz334DfAIaF6Jxks/oZgz4wIIHNWmE7P2vJMPdKcMzGwsBmLg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVL7fz+A4/SRFFqCLGUqBF5SOUzLrmKkSajT3neSkSeEMiYiBm
	nH8J95+KN25NkHD1VlXETTVgzrp85DSUuEsABleIyctd2h+xUTw+h/fAswATLnO4wjPejLBD9SF
	yV25ua9IR80osqmpgQsceyAhV4rh66n/lrKsD11WMVs88o+QrpVTAbRL75UM6Y7M=
X-Gm-Gg: AfdE7cloYpchSycYojF3InXTpRJxJAb3CX3px40LumLekekJCb+3udROXvLThH9QeFR
	R4AHvvtKXMtclNuYVx4jwBV3WUAsZKiSxQGRAhqOZmun5KMAYCLzkvujrDKMS7FI7J+pQ49d31G
	Sfsq9bHdxtIB3u7H9YiEFZvKYgDPoeYnxCpZos2RFjBejXEN2aleKZ3eyWIm8BXGwzcJahbd9fK
	997NJ91rpmtZiy6DLqOi2W4EqN+M9VgOHE/l0cJjTViyWcscMDA3uyuLPScs7JGH24CViSzovbc
	OuTzskAiBeqLW5MtKV8L+B7yGhmL1t39XJH5fk3lCg7Shca7yZt2rwDySRvQvt8ltBeYimHI/aA
	RVaoMDFEXJOauZqxULUN2gOJzbb7WgGCxdMju8OYoHsWFH//361DaTpSiTOc=
X-Received: by 2002:a17:90b:1649:b0:380:83bc:84de with SMTP id 98e67ed59e1d1-380aa1bebccmr4331871a91.6.1783012165415;
        Thu, 02 Jul 2026 10:09:25 -0700 (PDT)
X-Received: by 2002:a17:90b:1649:b0:380:83bc:84de with SMTP id 98e67ed59e1d1-380aa1bebccmr4331855a91.6.1783012164980;
        Thu, 02 Jul 2026 10:09:24 -0700 (PDT)
Received: from hu-linzl-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bb80f5csm16505031eec.15.2026.07.02.10.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 10:09:24 -0700 (PDT)
From: Lin Li <zhuolin.li@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 10:08:07 -0700
Subject: [PATCH 1/2] dt-bindings: clock: qcom: Add Hawi video clock
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-hawi-videocc-v1-1-6c1e640b0954@oss.qualcomm.com>
References: <20260702-hawi-videocc-v1-0-6c1e640b0954@oss.qualcomm.com>
In-Reply-To: <20260702-hawi-videocc-v1-0-6c1e640b0954@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lin Li <zhuolin.li@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783012163; l=3926;
 i=zhuolin.li@oss.qualcomm.com; s=20260512; h=from:subject:message-id;
 bh=cKqwClXNxU7u+xSUDBQ9Brn00QjM1FW6vPXxe9i3ims=;
 b=pmnf/yHxl+D4DXqlIRJCzVN03uie8l7XViEY1AiJkBCR3PX8fQUDNZnFXdpdtXYVtfFfWx15b
 IBUQEevyoKKCCOQkvXSwlCjdsF9dF5gWxsmBLGZxYb/HCUNkunolJme
X-Developer-Key: i=zhuolin.li@oss.qualcomm.com; a=ed25519;
 pk=MHXg6mCJoooUzb0vMzMIbkL59skKuD2BVgAX/XneLrU=
X-Proofpoint-GUID: XAToF8DqUfAhdNoa-cJldKuicNutl64J
X-Proofpoint-ORIG-GUID: XAToF8DqUfAhdNoa-cJldKuicNutl64J
X-Authority-Analysis: v=2.4 cv=UMft2ify c=1 sm=1 tr=0 ts=6a469b46 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Es2KtYj6OvgIQp6ayCIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE4MCBTYWx0ZWRfXw8hlzxJuF2Hn
 l9KGcc3/UKMrB3QSrZUdZo7VCIlWUOpV+FIQ+xOcacsxMQepXDvI6qRXKiHm0tQlS6NAFkWQRZA
 XPQx24nZHvNDsj6XRF/RH7HVFgJ2xFI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE4MCBTYWx0ZWRfX7w3wafeK1TiQ
 xbGq1Gk9hIqA1bK3NDqYK9LXhep/EB1uUUJBTn5tPjtydYeFxtKMbJjLK4wotuDDZQyYz1ujRjM
 IpO518lztdVSGy9AKnoDaKYHXecARx32yZWzIoSGwjuits9upAxJiSRs4eVAVN8tbAj/o5eAcw9
 Xt0ZZmRdMa03TLBNANXe2hi+j7ZvT+iinFrGL27Zd0IhYe9hNXx4jfma/lJWl04GZmW7ko36n0S
 JM7gIOZsSj5CepOuyJeHsW5EEG7voJAqi+dZGECA39Tn4zXsefoM44WAcWrsESXNfekXK3rW35B
 l901tXlIv4guo5g5zP0003TbB7mTqavilJIgvU6USiH8ZjXaYs3VIV9G9qekEqm26WAyIbd1XGJ
 EU/9vVaj63VCNrPBDs57etltZhzh39mq/nklW77yh1lFHMHSQJzMg9kiEjrjev+UeL/Lzmtx4zk
 u2nGj2ChF+26utZ022g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607020180

Add device tree bindings for the video clock controller on Qualcomm
Hawi SoC.

Signed-off-by: Lin Li <zhuolin.li@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-videocc.yaml        |  3 +
 include/dt-bindings/clock/qcom,hawi-videocc.h      | 64 ++++++++++++++++++++++
 2 files changed, 67 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index 5d77029bfaf8..a6fd1992d6d2 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -16,6 +16,7 @@ description: |
 
   See also:
     include/dt-bindings/clock/qcom,glymur-videocc.h
+    include/dt-bindings/clock/qcom,hawi-videocc.h
     include/dt-bindings/clock/qcom,kaanapali-videocc.h
     include/dt-bindings/clock/qcom,sm8450-videocc.h
     include/dt-bindings/clock/qcom,sm8650-videocc.h
@@ -26,6 +27,7 @@ properties:
   compatible:
     enum:
       - qcom,glymur-videocc
+      - qcom,hawi-videocc
       - qcom,kaanapali-videocc
       - qcom,sm8450-videocc
       - qcom,sm8475-videocc
@@ -68,6 +70,7 @@ allOf:
           contains:
             enum:
               - qcom,glymur-videocc
+              - qcom,hawi-videocc
               - qcom,kaanapali-videocc
               - qcom,sm8450-videocc
               - qcom,sm8550-videocc
diff --git a/include/dt-bindings/clock/qcom,hawi-videocc.h b/include/dt-bindings/clock/qcom,hawi-videocc.h
new file mode 100644
index 000000000000..8c97079ff1a7
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,hawi-videocc.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_HAWI_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_HAWI_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_AHB_CLK					0
+#define VIDEO_CC_AHB_CLK_SRC					1
+#define VIDEO_CC_CX_AXI0_CLK					2
+#define VIDEO_CC_CX_DBGCH_XO_CLK				3
+#define VIDEO_CC_CX_XO_CLK					4
+#define VIDEO_CC_DBGCH_XO_CLK					5
+#define VIDEO_CC_MVS0_CLK					6
+#define VIDEO_CC_MVS0_CLK_SRC					7
+#define VIDEO_CC_MVS0_SHIFT_CLK					8
+#define VIDEO_CC_MVS0_VPP0_CLK					9
+#define VIDEO_CC_MVS0_VPP0_VPP1_GATING_CLK			10
+#define VIDEO_CC_MVS0_VPP1_CLK					11
+#define VIDEO_CC_MVS0A_CLK					12
+#define VIDEO_CC_MVS0A_CLK_SRC					13
+#define VIDEO_CC_MVS0B_CLK					14
+#define VIDEO_CC_MVS0B_CLK_SRC					15
+#define VIDEO_CC_MVS0C_CLK					16
+#define VIDEO_CC_MVS0C_CLK_SRC					17
+#define VIDEO_CC_MVS0C_CTL_FREERUN_CLK				18
+#define VIDEO_CC_MVS0C_DEBUG_CLK				19
+#define VIDEO_CC_MVS0C_FREERUN_CLK				20
+#define VIDEO_CC_MVS0C_SHIFT_CLK				21
+#define VIDEO_CC_PLL0						22
+#define VIDEO_CC_PLL0_OUT_EVEN					23
+#define VIDEO_CC_PLL1						24
+#define VIDEO_CC_PLL2						25
+#define VIDEO_CC_PLL3						26
+#define VIDEO_CC_SLEEP_CLK					27
+#define VIDEO_CC_XO_CLK						28
+#define VIDEO_CC_XO_CLK_SRC					29
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_AXI0_CX_INT_GDSC				0
+#define VIDEO_CC_MM_INT_GDSC					1
+#define VIDEO_CC_MVS0_GDSC					2
+#define VIDEO_CC_MVS0_VPP0_GDSC					3
+#define VIDEO_CC_MVS0_VPP1_GDSC					4
+#define VIDEO_CC_MVS0A_GDSC					5
+#define VIDEO_CC_MVS0C_GDSC					6
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_AXI0_CX_INT_BCR				0
+#define VIDEO_CC_INTERFACE_BCR					1
+#define VIDEO_CC_MM_INT_BCR					2
+#define VIDEO_CC_MVS0_BCR					3
+#define VIDEO_CC_MVS0_VPP0_BCR					4
+#define VIDEO_CC_MVS0_VPP1_BCR					5
+#define VIDEO_CC_MVS0A_BCR					6
+#define VIDEO_CC_MVS0C_CLK_ARES					7
+#define VIDEO_CC_MVS0C_BCR					8
+#define VIDEO_CC_MVS0C_CTL_FREERUN_CLK_ARES			9
+#define VIDEO_CC_MVS0C_FREERUN_CLK_ARES				10
+#define VIDEO_CC_XO_CLK_ARES					11
+
+#endif

-- 
2.34.1

