Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1614C379EDC
	for <linux-clk@vger.kernel.org>; Mon,  8 Jun 2026 12:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780921391; cv=none; b=RPB8S42Zp5myVbAFFhx46BMSrPwY8sj+Fm2b+Ki/wUxek/e0+dlq3AXAGGdg/mi84hyVBtrHtpoEsDwLOiOQBtcE32pHMl6PZSh1YnV1QfTJMgzqbqYEXYmd6ID5COLh4QNzieG9QCbvIkuPTxidxlI8ek70sOcT7Xm2iik27Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780921391; c=relaxed/simple;
	bh=KgWAs6uln74wF6T86ce7PoBVL8SE2Q+p9u3v+P4rhfY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sM1o3vp+iQbNebsCJzAzD/jERRoaqTGYJIMVfLfb5XoQ4xBg/wtGfk6olnfM045iN8DGIpAY+wlDsrO4Jmy/EzHpMtDdkFjgEvp+35PFQ1jJztY+Qv4uiYwSMRm/pa0wthRZwjD6gEE+ZLvvqMfmqahaCxQtLBrcw00PpQOFQAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m78D9bQe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YltPyVfN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m78D9bQe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YltPyVfN"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658B9Ua62993065
	for <linux-clk@vger.kernel.org>; Mon, 8 Jun 2026 12:23:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nUXqryqbAOjs6yJOJea9Ql6DVReDUNpP/P68DHSxwuc=; b=m78D9bQeing/TbET
	5It2VbK2o6oenwmmceGxgcxEsKqJQE1uubWkm3CsLCnhM+0B16LkBZodK82ywIrS
	oLU1h/N/sGNBpalMO2NlMKl9yWlCU8gkZFMbo5pwptwKjYZk//VrBcNGX6aXm25f
	Qj30gMicKwcNldX4vcoMok0f33D8pb+dfONUcaTthsaTcO4+9pcCuMRd789wRMKj
	1utS10vR/yyuNPWX5pj5MaGvsjjdALy5ref/LiN+DcUZG2an5/Bkwsd3vcwD/sRp
	X8DAp0HnOhwskYUSboSN94ut/oXBY/CIMglVNFeTQ0Tvpt3MyjICOmiE1I07lZkb
	1LlPZA==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enuna8jg5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 12:23:09 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7df25ce3000so18446897b3.1
        for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 05:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780921388; x=1781526188; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nUXqryqbAOjs6yJOJea9Ql6DVReDUNpP/P68DHSxwuc=;
        b=YltPyVfNrS7ctz/GL8sC9Kp41eNO7AhY1brUEOf0/NIsVnUiTkIvtrZxkY71SThq+1
         y+e4EVzjrWbTwPxTLqmnNNSsWWQW9TJzsfHtOjYrZOhFjDRcvs0URVsba8ULJi0+RKdR
         QLDOoWgT0OTBNYUXnwms+Cw8r87e0DArpLFn3Zpt0wFqs1jFh7WCK0aYpNFMMUi5kqI/
         ZMb74SflTkis35d8yU9LE3WxX+ZpAC8pFSZVopim78tOB+vlubnOBDvwI1F5tkt3XQ0q
         UrzUZL9mSzSlEcxqoH1TtIrz12ASdV+69zVHllw78i2AOW+jDPWLVh8TegYZasPJ/Oby
         bEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780921388; x=1781526188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nUXqryqbAOjs6yJOJea9Ql6DVReDUNpP/P68DHSxwuc=;
        b=sF80BnIjpOnFNbh4HlyYWGd+yWz303HqmY4RoZwVB+pJGZ2LX+Cr/kb5217mpS6A4R
         VlZOsnFMeNPsLvi22yQ3+4TXhEoH1SSYTk/Ch5/NqjTgzicrsJA8sgtimF89Z6BncNkm
         rj1xhD5evkcpgfgBMmNVKl8esHwByYReanvVVHH8CtNvfb77UIymK1zQy/zOl+YQueRP
         y9kYJ0SOSM1YsR99w1XBZosiKfbHsJZOZPhZodf0yhBGk47lX3bVyjyDaKRaIJkGZyfZ
         comX59Kx7FjYEMY8Je4VboBxWA7Y5jJbucuAmx9A3VIGHgUGgbIGxxJruRWT5EjfzerO
         ynGQ==
X-Forwarded-Encrypted: i=1; AFNElJ8NfO6zYpTEeBKCHkd5BIBbZCvNn7C4MgWfSUpXo+rGtJwCf9MZT/e6ijfyzo2XSnKxvm8i72s1N2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdv5QM9+87dsvUbb235vf8eBpQxlx02FkLTvSErU+BL8SiFCKN
	kbhn8/H2GcT59AM7PUiPDmZZrpXmL/HnOMKn8oAQ+0rj35sBXEdNBx2yZZrFCpZhwrCBLQ7LZD2
	ss9UuZ7p3wsD9dMc8xv2xFb8UGQmo3doAGL7nOtecMN1tQwob2jDiMY06U3vRGW0=
X-Gm-Gg: Acq92OF6cOGxdEDCA5KUZb5/2R+ofg1tqIJwdoKmYPbhkWQtPF2Eyd7tb5X1JvsKgXH
	Cv9hrbPx2XPR/pZmXgu910gusw/5LxEtxnlt15YUyhsfu5AkvcDLkh+POmPAO+j2ds94BG9/1lw
	Z6+8XFTTK74srRMoYBGqDo3hrnvjRsoEGzY0jrK5lZD9C45r0g21C72pb1bXjzn22DsLhqM9ZuT
	QJV7SbcNAEgrQ+NztyOAvBufSuvCKqydtnfz7lobFZyq6zI70d+iPQm0ltNR2zTfAE7Bs2jF9+H
	aTFa9mxM420c19S6CnzhVFdyv9QpXcNQxNxulqA8e2CrqUF08yd4XH12lPcm/r9vN3ylTJzHUFo
	PTBg4oV43qbiLpwNfe+aa7vvIiPkThWrW9c/em+wH0VaXkWJ+tK94tAllrzvjn6s=
X-Received: by 2002:a05:690c:6e04:b0:7dc:1609:53ae with SMTP id 00721157ae682-7ed0ea5d4e1mr128120397b3.25.1780921388233;
        Mon, 08 Jun 2026 05:23:08 -0700 (PDT)
X-Received: by 2002:a05:690c:6e04:b0:7dc:1609:53ae with SMTP id 00721157ae682-7ed0ea5d4e1mr128119877b3.25.1780921387682;
        Mon, 08 Jun 2026 05:23:07 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7ea20ea8186sm84076257b3.4.2026.06.08.05.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 05:23:07 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 17:51:49 +0530
Subject: [PATCH v5 1/4] dt-bindings: clock: qcom,rpmcc: Add Qualcomm Shikra
 SoC RPMCC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-shikra-gcc-rpmcc-clks-v5-1-94cefe092ee3@oss.qualcomm.com>
References: <20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDExNyBTYWx0ZWRfX5PteDsloQzKo
 WNnh4hWfxbvtmpjN/Xg1/aTVIuqDHDmz7Jk7njvfLZnM2AbDhGq5OT+7+mU0XoKyYt3P9Sycm5D
 6gknrg9v3arFh3aQsBqJvc8BNXu3L9OYXq2k6Gcf1o6mBaMxtkxc1M32h4JaSU6Ys1JjQ/VpXLH
 oAeQvL8jyFFJnM2ryWirAQAOK/uNm5/ziMwkGVwSqvkfiK2GbK9jPEhtFujSZB8A8QegCYZYvBg
 uxkVILCMFOgL3Wd2qtdUhZQS4ixMZwrqV/wkGl7Jc1A+H1zMSwo3EoH6K/g2qY5egwztnjis/Ev
 IWtpJF5Br0iS6vM5ggrQRHFL+zgytJntUaS6SC7SKbMO3iTkk7maD0M2LiRrokzAGb/RRp9Kb0c
 R9ETJQY/eC3h7ib+fUVVTZhSYj6M+p3BhasrONJ7vzLr0tFrxbUpe1JlwLcfwz6WBWgLJwGDoTB
 JMnFeYU8NSgHZrBncgw==
X-Authority-Analysis: v=2.4 cv=RfugzVtv c=1 sm=1 tr=0 ts=6a26b42d cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=59sZcjbcK_zmYAmOVRMA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-ORIG-GUID: JCdQ3-HN3sm8-Oe_GfAXXmtmbP60TZKA
X-Proofpoint-GUID: JCdQ3-HN3sm8-Oe_GfAXXmtmbP60TZKA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080117

Add bindings documentation for RPM clock controller on Qualcomm Shikra SoC.
The Qualcomm Shikra RPMCC has the clocks same as Agatti (QCM2290) RPMCC.
Hence, add support to use the QCM2290 RPMCC compatible as fallback for
Shikra RPMCC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,rpmcc.yaml      | 65 ++++++++++++----------
 1 file changed, 36 insertions(+), 29 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
index ab97d4b7dba8bc8d38903b399d2bd4bda087db8a..af9fc5b14a8102073f24a2ec4f5c8e79d492a14e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
@@ -21,35 +21,41 @@ description: |
 
 properties:
   compatible:
-    items:
-      - enum:
-          - qcom,rpmcc-apq8060
-          - qcom,rpmcc-apq8064
-          - qcom,rpmcc-ipq806x
-          - qcom,rpmcc-mdm9607
-          - qcom,rpmcc-msm8226
-          - qcom,rpmcc-msm8660
-          - qcom,rpmcc-msm8909
-          - qcom,rpmcc-msm8916
-          - qcom,rpmcc-msm8917
-          - qcom,rpmcc-msm8936
-          - qcom,rpmcc-msm8937
-          - qcom,rpmcc-msm8940
-          - qcom,rpmcc-msm8953
-          - qcom,rpmcc-msm8974
-          - qcom,rpmcc-msm8976
-          - qcom,rpmcc-msm8992
-          - qcom,rpmcc-msm8994
-          - qcom,rpmcc-msm8996
-          - qcom,rpmcc-msm8998
-          - qcom,rpmcc-qcm2290
-          - qcom,rpmcc-qcs404
-          - qcom,rpmcc-sdm429
-          - qcom,rpmcc-sdm660
-          - qcom,rpmcc-sm6115
-          - qcom,rpmcc-sm6125
-          - qcom,rpmcc-sm6375
-      - const: qcom,rpmcc
+    oneOf:
+      - items:
+          - enum:
+              - qcom,rpmcc-apq8060
+              - qcom,rpmcc-apq8064
+              - qcom,rpmcc-ipq806x
+              - qcom,rpmcc-mdm9607
+              - qcom,rpmcc-msm8226
+              - qcom,rpmcc-msm8660
+              - qcom,rpmcc-msm8909
+              - qcom,rpmcc-msm8916
+              - qcom,rpmcc-msm8917
+              - qcom,rpmcc-msm8936
+              - qcom,rpmcc-msm8937
+              - qcom,rpmcc-msm8940
+              - qcom,rpmcc-msm8953
+              - qcom,rpmcc-msm8974
+              - qcom,rpmcc-msm8976
+              - qcom,rpmcc-msm8992
+              - qcom,rpmcc-msm8994
+              - qcom,rpmcc-msm8996
+              - qcom,rpmcc-msm8998
+              - qcom,rpmcc-qcm2290
+              - qcom,rpmcc-qcs404
+              - qcom,rpmcc-sdm429
+              - qcom,rpmcc-sdm660
+              - qcom,rpmcc-sm6115
+              - qcom,rpmcc-sm6125
+              - qcom,rpmcc-sm6375
+          - const: qcom,rpmcc
+      - items:
+          - enum:
+              - qcom,rpmcc-shikra
+          - const: qcom,rpmcc-qcm2290
+          - const: qcom,rpmcc
 
   '#clock-cells':
     const: 1
@@ -126,6 +132,7 @@ allOf:
               - qcom,rpmcc-qcs404
               - qcom,rpmcc-sdm429
               - qcom,rpmcc-sdm660
+              - qcom,rpmcc-shikra
               - qcom,rpmcc-sm6115
               - qcom,rpmcc-sm6125
 

-- 
2.34.1

