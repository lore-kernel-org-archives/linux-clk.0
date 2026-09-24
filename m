Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7F54ACC93
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 16:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790266338; cv=none; b=cHZv1b56wt4fHMZvBlC9Wsx9VQoZnZseN8pyje507syYBNxPQRmfbaBcX80O/Knsq9e60LiX0phHgKwGWL6TE6fgbZqjnlgTsN3t9neBr2pcJr0QV1YSXHryhXyFw+TGP1a4kjoMZ/sGBjDULoW8x2BWkezqvpmM3j8oLOM6sCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790266338; c=relaxed/simple;
	bh=nFu5cZyJWfYCZQqJSD1MA53aV1Ql8TKSLZDCBHA0S6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p2/FXEQCgeFLzzb7oO5hzjVj8MFGZQgZ4cpKFMba6owU+QHCcSvXziSrfpQ+pZbNVMC4aUIp8nIyy9y/SAIY5811bh8VA0RR1c7Mfp+b3PXeVFUkTxW3XzL3r5bq21PfyxzLXh1x/sQqUfpUqsBWg1xJl8ZHrRS+8Lf+35QoWpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oY9i4VQh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a3Z28Cpg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oY9i4VQh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a3Z28Cpg"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OFeuI33220552
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 16:12:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wtr8nAFBmhA
	G5ZPJSvNGUOY/BVd0Wfn7M3OeN6XL/Kw=; b=oY9i4VQhZvH7+/N1hgVd1bwVEFM
	duRiBpxxXX+r4zzax/P49F83TCf8aEekqhyZJY40ITQrntV39eNX21sUofYPA+wr
	ggit7y3v9jHh1cmbYVJU2VPpF7HDHLKlWTTdqhHGGKHA/iZ46rVPs/JRC11qCEWF
	ynp/4ojMFg0A1BZAkj44gLIw6FFootcHgv+uPbfMdS3B5mvzaeCv+Kgyn7+Ctg8r
	uuZMxM4wjI3c4Y5X/qSIDng39vgUDNVbTSJbRURU+MkUuff+DfOa3zjFmglYRv0k
	0gw6TWYJl0y8qrZu16BDyZ/jMjauvaT6roL9kp2uANOmaZEv0wDagLGeRvg==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1s91ghp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 16:12:14 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-66cdb701595so103896d50.1
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 09:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790266334; x=1790871134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wtr8nAFBmhAG5ZPJSvNGUOY/BVd0Wfn7M3OeN6XL/Kw=;
        b=a3Z28CpgS5pBUPDs497NzUt51LFiXHdfCe7h+lvPlEQnfGqaxGI8IOCq/PqIW9UQrs
         +U10o6Mv7ZmLm2uZJb2jF/If5CQ+bYpzKavsd5ELxaJ+qbTOOQofxfGmgl03O3YsprqY
         amcDIftVCFHMIHwjjYGcxcaAyQY/deOEKKjB5HEh8dL+SpjUrG7HRDhn7DmPyvNEhnvh
         nwfa3ysTRKwUerP9z2eVK9oKxfw/kYvurfak/JZTpGBSZUTbuK+3OyrxdiE7KuZ4jHjq
         S2e75NIQgRn0xeOP3tFHNFndobhY2zJPTGVyamfaohPVQ0clLjbLWQfKjv/t1T5YR++x
         SaRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790266334; x=1790871134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wtr8nAFBmhAG5ZPJSvNGUOY/BVd0Wfn7M3OeN6XL/Kw=;
        b=1unlIXi7HVk5a8LbSdMJfh1h3Xyp9WGUa6vBlcyxzMaxPHAgSEznK84n+iOu0IZr0Z
         0/QLkdHfP+7EcK2PTNkw48Nr063i3AB+iLCPRqG4memxmrpCldg4/Q9iwOvSuZ/xJu39
         yu5DVfCmduoG0hPPtAGjwS0zySXj/xDblCNQ6VVmHafkfKjYblY4pj2s6zfx381AxRWH
         yV3Aos3pVh72K+/9X3+MpGP5MOaVvuPmviLyFSb0kAynuRHuzPJr7Tu7tcGZxk1pLYn+
         9+hlN1hxg3RNZelTF5GkHk76pFTQXHbdPhu+tOq6IwLSnjsm6VLnf9VnOWEbxbNtPxVf
         UYbQ==
X-Forwarded-Encrypted: i=1; AKwUvByLqxoXxI6SYozfTtCeQZvSW/Q6jgILGz2I5EclgVKdD9hrk/1MygZ3/L7bK7bLABzY/tPTQyxCrE0=@vger.kernel.org
X-Gm-Message-State: AFuF++mkS+Mt5/b61PzOnZ5W43+6VvmWqXLwGH2TdgdusrrUOKz2IgaU
	dwVKd39a+KHlKP2vxv33MnHBL2QfUsOABnK8fHdqpSQWH27jm/SGD2VSrLLPj9mlErNjlqd6uuG
	2kEMUD+pEklZZDD/bRzaqAT+CPxM+NgSa5CJZx+496BZKQvX8Yd+W0wZOKVr3/Xo=
X-Gm-Gg: AYBFou3AzMPwaFf0FbvWuM9pGmaNO+JXjuk5wunrqLu4pwK8BaFcKkvfBjpZgy8lPKB
	TOvNmfnWGM79cYLTuqMzPJMsziIDEGVkp+L3DR/LKMVxMnpPGye5nMBY5JiNlEdV8btUPsVrlGs
	POdypXSS9bY2kVMniVjuyod94TxyMvRZHazH81PcwL1wtgE7z1ucerAjSyu+SZ6SvLW3y377goP
	GXEeMR8SlZet/XLsoHTBQ0aqkPM4oUAzDHHrvRMbB+i37fVFLLcTHQaHZVEgyTFk6BWkvNmalza
	xrtbfhhDgDjwNZEYzMfeOo1zzI6UpcMocnFD5mzV7v6dkqZAjsNX/Xmv14FpjkjE1ZP94agNxeF
	YxcgTIKQshIuadwBSlEqTPaLzEnWtHqqsktGTZh189iclAuXbq4pI0GlWam8=
X-Received: by 2002:a05:690e:144d:b0:672:b007:dad with SMTP id 956f58d0204a3-672ed38252dmr1794975d50.71.1790266334409;
        Thu, 24 Sep 2026 09:12:14 -0700 (PDT)
X-Received: by 2002:a05:690e:144d:b0:672:b007:dad with SMTP id 956f58d0204a3-672ed38252dmr1794935d50.71.1790266333703;
        Thu, 24 Sep 2026 09:12:13 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91425cd8416sm9698296d6.17.2026.09.24.09.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:12:13 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/3] dt-bindings: clock: qcom,sm8450-videocc: Fix clock inputs for Glymur
Date: Fri, 25 Sep 2026 00:11:50 +0800
Message-ID: <20260924161152.1162301-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com>
References: <20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA2NiBTYWx0ZWRfX9QrZMrJg5Z6s
 j1MxzHblMGgtd+/+EnxDfDFisaP6xoOf0aorbiDIXcPjorhqwt7u4zGrly9pK04OKFvAJ370cg9
 Td2NbeNM+hBkDtbXkV6j2ZwbrLy66nsSNDwDulvCT4nGRYrazP8MuESN7COyJU+gQtFGPF3JhtE
 9/Vv7BfRFm8sZL97vWwOl2ycQWRgg5T4Fwv5Fki6QxJdlVRLWAS9mYirwO55sbsy/FI35dFNnEz
 L0qY+LNFSoJR1ktUk91vRCR2h/elKBz2F8cuW7G79a/bsvnyMoc9g64l8C/CnOuvGPm+oYf0fQI
 zOBHhD/+wuaBF1Psz+eWbwEn577kPkIySBuYYTAuigI14Hab6uiLlFhCegEgKVN5WYXTbNl0xxr
 eIlHpzUP4o8cMnUMcl//HfrI9LIbRgAuUc2MeQrO4B5XvXCwnju6EpxzLItyKIsrilRLZ2dVMCS
 4BgxWqm5M/BKxAHtyOQ==
X-Authority-Analysis: v=2.4 cv=VPxIDNPX c=1 sm=1 tr=0 ts=6ab54bde cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=3WhL5buBUIyFYQ3kjXcA:9 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA2NiBTYWx0ZWRfX5nzOZGSQHaZ9
 1ginkfZiC8LWM3QpRofgTe+0HwdaSv1Y/UqaymfrR0EMfHLhIJ5hD/vA8Ub35fVnqlE7U3VjhcB
 iPOkGxWsVikJlkzfevI+w2uDEKilDbM=
X-Proofpoint-ORIG-GUID: xOYJLRsevFhUvzoUaFIHjban647UDK26
X-Proofpoint-GUID: xOYJLRsevFhUvzoUaFIHjban647UDK26
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240066

The schema describes exactly two clock inputs for every compatible it
covers, a board XO and a video AHB clock from GCC. That is only true
for part of the drivers bound to these compatibles. videocc-glymur.c,
which handles qcom,glymur-videocc and qcom,nord-videocc, and
videocc-sm8750.c both declare their DT inputs as DT_BI_TCXO,
DT_BI_TCXO_AO and DT_SLEEP_CLK, and parent video_cc_sleep_clk_src on
DT_SLEEP_CLK.

Because the schema stops at two items, no device tree can supply the
third input, so video_cc_sleep_clk_src can never resolve its parent
and registers as an orphan clock. It also documents the second input
as an AHB clock, which no device tree using these two drivers passes,
and which those drivers would interpret as the always-on XO.

Describe three inputs for the Glymur, Nord and SM8750 compatibles,
keeping the existing two-input description for the rest. The sibling
qcom,glymur-evacc.yaml, whose driver has the same shape, already
documents a sleep clock this way.

Fixes: ed9ca8296147 ("dt-bindings: clock: qcom: Add video clock controller on Glymur SoC")
Fixes: b190eaea5780 ("dt-bindings: clock: qcom: Add SM8750 video clock controller")
Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-videocc.yaml   | 26 ++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index e985a450451d..9bd746afbc11 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -42,9 +42,8 @@ properties:
       - qcom,x1p42100-videocc
 
   clocks:
-    items:
-      - description: Board XO source
-      - description: Video AHB clock from GCC
+    minItems: 2
+    maxItems: 3
 
   power-domains:
     description:
@@ -79,6 +78,27 @@ allOf:
     then:
       required:
         - required-opps
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,glymur-videocc
+              - qcom,nord-videocc
+              - qcom,sm8750-videocc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Board XO source
+            - description: Board always-on XO source
+            - description: Sleep clock source
+    else:
+      properties:
+        clocks:
+          items:
+            - description: Board XO source
+            - description: Video AHB clock from GCC
 
 unevaluatedProperties: false
 
-- 
2.43.0

