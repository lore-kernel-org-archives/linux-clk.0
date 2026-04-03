Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E103C344F
	for <linux-clk@vger.kernel.org>; Fri,  3 Apr 2026 14:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775225482; cv=none; b=A5a9+Iv7uQc2bRnq0fzD1b5ElFG3rFT215mDwNwkIFrL9khE5yIAz8W+DgloIwA45XZqLledqOLkfG8Ov4Ld67B6+KSiAocEUXpKjKaWyT70V+zuTleWnMvoGsubGqVAHrNJviVeLMStRfewj1MFURS0W71Dx1rFt618iRpXY3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775225482; c=relaxed/simple;
	bh=L1Pg2DImq+7vjEK2v2ttUsGwFkHZDAv0iSDem33OKRQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ilr/lzMaSHtYB5IVX3BHunjLlGSFNtoMV84+8RTN7wSCuRh+VMcsRes217KOkh3jyD8uVMGpq8BlWHrw691Fv3SCNLymP5lX5jwRWgVikd4InPOi3KdbazJL/vnncXZo4qGrMWFMdBUdosws8B+c3wjEN13kLCE898zFs+8j2n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EcyAPVel; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cFcK0k+V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EcyAPVel";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cFcK0k+V"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633COsZk823333
	for <linux-clk@vger.kernel.org>; Fri, 3 Apr 2026 14:11:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WsllSCq6C84HtAi0olm1ZV7KgvkWp5Ncx0XiKo5lP7E=; b=EcyAPVelvaa5q0Ae
	Cd03BKFaJdKDuiErQ5Z8e2QsKjw0/HtWQuA+v2LV//QepPWXC01dJIWWGUIn1thB
	sFQlk7YM1HSIlKUGGuY+wV3NteMXk1dsKCi3Mfy3yInlJ0rLL22jqTQOv7u+ABFF
	IOt0scZyMnRHwyfzboPCdn+yuWe+Jb+b2zXpqRmzd6YWH37iV67pZWQXNOoQ+Esy
	a7oziANpEuULfNwbiwo2cfh4QrjaianVDrDkzSG7sMQ+OfJ4YMJpDj7QI8jbYSiL
	SoFonZi69c5atCImW1USQ3olcMz3yx2nJ62+te5em9QTHZouTiACaeZZfIEMQBZq
	YEhhLg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da6739mq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 03 Apr 2026 14:11:20 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9484dbd65a7so691200241.1
        for <linux-clk@vger.kernel.org>; Fri, 03 Apr 2026 07:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775225479; x=1775830279; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WsllSCq6C84HtAi0olm1ZV7KgvkWp5Ncx0XiKo5lP7E=;
        b=cFcK0k+VSFXJYOx0PXYFp269qraLc7yPmLo9nph4NETADjLgNwXYqZ8OGWCfNYcp9z
         i0QOmCOPdzY/iO+5/GpdqKDD8S1uIOD4YbCgRtRS4Pa94uZIDb2uWRYKai4ZGmCR1bs4
         o9bmgamv9fExYugcFopwp0XHNSF2qII0mDCeZEy+pyDQJi1tRFbFnM9eFpBk/5CRn1Xx
         v0lu2ApIrt7PXFMCWI941ctR3DA6vbhcYXj+leX8CyorJubwTzll/qp4qEdtpZIWbe/b
         UBbjbaUB40uj0WifUvE1dCkPQhx2Os/tCI8cqtUq8enrJ0IPJdwZjP9NrbBsjABcMcMT
         s35g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775225479; x=1775830279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WsllSCq6C84HtAi0olm1ZV7KgvkWp5Ncx0XiKo5lP7E=;
        b=liQInC8VsxC7SNyqY8eC00n/HDdxC5DpzDJKec1jDbt3HvratbltxXKuJpnBWWCXXE
         XLsYfr9hezTF7EOF2Efh1j1vKYQZU5ge0GOH8WE/mwchD7JCUAAm0vmZj9haq57Ujaci
         dwmQYv+dAmFRbEuS+4MkoPg0cn5m0lwlYBKo2U0sqp9oU/Qr1Zb3JevEEDDy0fUgNvgu
         xfFFUSzWqjbpT9Dkvn4OvuUDVlu+XXSksR14Ntuf4BlkpAfTgMnSUTb9EavieAIBVdNQ
         r9EXQhu9rdnN2/5SXxUuAcZunvxE5K91joyr2R7UliVi4yRyhr7IOVS01zGpoOurEwgw
         evgg==
X-Forwarded-Encrypted: i=1; AJvYcCXpEIeaf6WdgV+PcpUQ2fB9MNlrQxC20FaW6hCnj94AFk1oReqLgR7Tgh5JLZrSUSTDNlwDjGpIAXc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFJe16idsUlc9PcowsS4MtajflT2A6OnkXmpHrf7IdnhuxS9Dw
	iHFJBZHyMMOV3Vt1HOnljVoJhuOV0ZDCMjcjr+Cet6F47/3QdtQ77ctREZrnqwGqR3ErAU5A63J
	fSg1S3ro+VGg0URsJgmaFfPBn+sXGD+t4zSEvmEua40Yo0KQczbaKQUim1o4n1QA=
X-Gm-Gg: AeBDievIBuB8dmeX8gyXdsIH2/BFKGpVTDqRBtE1F//luoPMRcNZW9alJhe5LF1wsqT
	P+BFBVbQxdvdJAPm7xOg4mBXfhzdSt0cJkL57nivR5/rm6Xh491qkZOD10ubDxVAqtO06vFYctj
	/Zg8RnU3kRdmsAD+R4QsM2xraxFS3Totv+a8iU5bpkXhReSc/+gHxbtS85NAhT/Uq8v99AmioPu
	7tcEQ+Ijr4z/cr3qVz4Xt2GlW9MBd+mrvfVdWiQEhL6TiwGBdJpRdrWp0BzQmQcNM/9A1WYnxnf
	FZyuh0wmXuezmZBni/jWD1QXVAzVaMZ5SChjuuslx4RemKVatP+1rgZyXn2UEEwO044S3sQkVX7
	7AaKMhoGuDG2B5Hr4lnHKbeWWTbYYgciZu25Hyw+RSsgQ9Foq+2s=
X-Received: by 2002:a05:6102:b14:b0:605:26eb:cc1a with SMTP id ada2fe7eead31-605a512c49dmr1023740137.29.1775225479132;
        Fri, 03 Apr 2026 07:11:19 -0700 (PDT)
X-Received: by 2002:a05:6102:b14:b0:605:26eb:cc1a with SMTP id ada2fe7eead31-605a512c49dmr1023693137.29.1775225478720;
        Fri, 03 Apr 2026 07:11:18 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:129d:59e8:f7c9:47ca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899d1b19esm30127315e9.6.2026.04.03.07.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:11:17 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 03 Apr 2026 16:10:49 +0200
Subject: [PATCH 1/7] dt-bindings: clock: qcom: Document the Nord SoC TCSR
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-nord-clks-v1-1-018af14979fd@oss.qualcomm.com>
References: <20260403-nord-clks-v1-0-018af14979fd@oss.qualcomm.com>
In-Reply-To: <20260403-nord-clks-v1-0-018af14979fd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2692;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=AyAcliCUWAjW4ermeATIw1vRy5W7EApnIO59761YyJ4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpz8p61WK7iqwgWTqIT3d25ee38kUXCXkqpyJ6r
 FgZKPVKeRKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac/KegAKCRAFnS7L/zaE
 w3SiEACncAOXhvb/hs6HH1RnCDpjmnKuFWxxLWGVxpOA3RwOaIsHNb1QcDJr9TVuGJI8wILaBjT
 qFhM8dvMNEX4DGuPtBJ1Glex71WHMZispIkBrW1yjewa2h0v5Ml/8CfpIi3Nk3yIHAlLetFf/L6
 zu67cZuBFDGZplvVw4ujwBbHjCSQXMxKjJVK7WDo4rcR8ugHLJz+foKk0hFOBmBz2LPoWXVEvN2
 hZPb0BKBCM/pr3TvbahEzfXlWQBLJUGFfogABxUmC8XKrX7TLJcqoC0HI3RWJ1M2Q8AEs8w+d+v
 mvjaWwm3c5H5WTHnfDMtI7oZGRtipyl7Z2YSNeDoyaPEnsdjqZ3Zm6D3+NpAaRdpN3YW3Ep4Y2r
 Zmird7FcbmaLM4vS7TX0SOQhFDJ3z6hls0on+bEkrc2kqB0J+aA3Gm45ojIR2EXegZtKdhnGxVs
 +j+erGv7NB6yHtKw8tRKzGtHCSz4Pa2ZrPA464X98b4+w5svKG3zDsvQ5dJlY65nEcZzvh9vzN/
 CiRdS+9I7gpBMI2rup9aJKleIxf8vcDcwr6Jzpj4pB7wZ315aQLEIroiZ6OYsQpMYReVT6dJylc
 Xs/fDMcdlkEI+8Vwcj5mKfhrf4CyHMz4tp/riexu9rZw2bNXcGymgiZ3eprvSky4inqqrS7HQOC
 zmQXyIIrGNk3OTQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=erjSD4pX c=1 sm=1 tr=0 ts=69cfca88 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=yi_j7UWu5214FLn0tX0A:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: Et-wpf1ylVjRLX29Qtqs0pNCDH_IZpho
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDEyNiBTYWx0ZWRfX4Oe6MlDgpwdF
 jAn/4yRNrvz7YFyiykAxlU3K946jHGKI6p6FUynGx0XDREm7YY7U71iq42v3ri22ZWw2fH87Zcq
 3x+rWnPJbgVpRztmPkAzUPukHpPBMPZ/1lS9KEWoGUnVpCXiwom7TioxxDktUER0hbK0c7EulNP
 idF/3NfhEVVQGX5JkkBH8T8sYgZRUJVB/6XF+OvhpPf4ESXNzKraaWkXYZ6j0RlajQdK4+Oe713
 2tPZHlp2D55I2qwYxAuu2u4N8ItsbIzoAY3xC55q+gTiPmeGVU+FclcCjQ3BKO63L2l3tzbrCFF
 bC3NcU5rqCRvXXCuhqr5h6VffmqmM/Qy6/AeDXgfUGvrTgBTe4SSowip1oDvAcwW8ULOjcIfjDt
 WzAudzAm9cPZ3T14MF+9bCCeIaR87/X/KAi+6kvx5+9+DRYhEvoF4ae6GtugsphC+pxKhSEuV/+
 GK30SZqRS6u/L9ZUY2w==
X-Proofpoint-GUID: Et-wpf1ylVjRLX29Qtqs0pNCDH_IZpho
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1011 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030126

From: Taniya Das <taniya.das@oss.qualcomm.com>

The Nord SoC TCSR block provides CLKREF clocks for DP, PCIe, UFS, SGMII
and USB.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
[Shawn: Use compatible qcom,nord-tcsrcc rather than qcom,nord-tcsr]
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |  2 ++
 include/dt-bindings/clock/qcom,nord-tcsrcc.h       | 26 ++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index ae9aef0e54e8b8b85bc70e6096d524447091f39e..1ccdf4b0f5dd390417821494cdb97d8f4ed26c58 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -17,6 +17,7 @@ description: |
   See also:
   - include/dt-bindings/clock/qcom,eliza-tcsr.h
   - include/dt-bindings/clock/qcom,glymur-tcsr.h
+  - include/dt-bindings/clock/qcom,nord-tcsrcc.h
   - include/dt-bindings/clock/qcom,sm8550-tcsr.h
   - include/dt-bindings/clock/qcom,sm8650-tcsr.h
   - include/dt-bindings/clock/qcom,sm8750-tcsr.h
@@ -29,6 +30,7 @@ properties:
           - qcom,glymur-tcsr
           - qcom,kaanapali-tcsr
           - qcom,milos-tcsr
+          - qcom,nord-tcsrcc
           - qcom,sar2130p-tcsr
           - qcom,sm8550-tcsr
           - qcom,sm8650-tcsr
diff --git a/include/dt-bindings/clock/qcom,nord-tcsrcc.h b/include/dt-bindings/clock/qcom,nord-tcsrcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..3f0e2ff7acc72c10d00488c48ec17af8ea6de06e
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,nord-tcsrcc.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_TCSR_CC_NORD_H
+#define _DT_BINDINGS_CLK_QCOM_TCSR_CC_NORD_H
+
+/* TCSR_CC clocks */
+#define TCSR_DP_RX_0_CLKREF_EN					0
+#define TCSR_DP_RX_1_CLKREF_EN					1
+#define TCSR_DP_TX_0_CLKREF_EN					2
+#define TCSR_DP_TX_1_CLKREF_EN					3
+#define TCSR_DP_TX_2_CLKREF_EN					4
+#define TCSR_DP_TX_3_CLKREF_EN					5
+#define TCSR_PCIE_CLKREF_EN					6
+#define TCSR_UFS_CLKREF_EN					7
+#define TCSR_USB2_0_CLKREF_EN					8
+#define TCSR_USB2_1_CLKREF_EN					9
+#define TCSR_USB2_2_CLKREF_EN					10
+#define TCSR_USB3_0_CLKREF_EN					11
+#define TCSR_USB3_1_CLKREF_EN					12
+#define TCSR_UX_SGMII_0_CLKREF_EN				13
+#define TCSR_UX_SGMII_1_CLKREF_EN				14
+
+#endif

-- 
2.47.3

