Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920782DD5F6
	for <linux-clk@vger.kernel.org>; Tue, 14 Jul 2026 04:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784005196; cv=none; b=dzIFOV8cc+I6rZNl0+J/M7dNMM3RJhUBnsFLAngivWI7CoNObUvuZAS0Ajz5XeAFYDfdJdv5uqyTmrRzy8DcY1AqbPwerjq2ekKkXO5ISa200jlci4KHCW4YE6xe9JtlTg/zWEwUrX8huNO4RS5XN4bNoLGKAcwVRWxqSY3qmtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784005196; c=relaxed/simple;
	bh=rWbtb1W+stySBwVTYmTH8aWgwOvBKUz0d7zkndsOrdM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HqiEuD2jgItwWGQ7dCnr72nA2vOwTTd5oD+cWDgSw6ouqsFcbAWG0GsmOmWVEywLJ2+ORB0FPxfR7JAvHvylBHl7lltcQoyslY+K9FZMjp/YyZU6wU2eDjTUHA3ibRr021+Ts6+5Suo+Fubooxuqig3hGilqriYYEb3HR2P/Bh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g1y6JH1T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CWLgc8bV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g1y6JH1T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CWLgc8bV"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E38Phs3303131
	for <linux-clk@vger.kernel.org>; Tue, 14 Jul 2026 04:59:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YtW4Ak09kXgiLEZNs7J/4jrifXCWd9zql1exxl35Rg8=; b=g1y6JH1T6DfjzNF6
	BaerBrMsvlAy9iKUNiWhxq1pTw21/asu3EKKt6xD6zkOXK00gmn+Bj2FpiGbVNGT
	xUadMmgzdCSf/RayBktt7iLrdPVoMCaImbRO6HFFwe9JYyNX9Cv8HWpWpyb4ZpXy
	hHebozuIijuySV20hRiuSCCo0N4YY/ILuEXMOplRbG9VlBXmB94xnY4h6SKkPrEO
	xBhyzK7i90MKeva8FaOY0NTQ4wABXfTkWJnB/Pkw4gcZnoAonjm5ZTYu5Cs4lcyb
	JJehPMvmjh6yLO7pf1AqUKRyHsidlEsS+wNdsoN/oYnFMUPpOdbX0KNaO6qUvMcl
	FPAXKg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44p1yra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 14 Jul 2026 04:59:53 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38de842a1a9so2623054a91.3
        for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 21:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784005193; x=1784609993; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YtW4Ak09kXgiLEZNs7J/4jrifXCWd9zql1exxl35Rg8=;
        b=CWLgc8bV0DXk+CwV2TsVy4TyUq/geqeg7Vz1BvW7Ppn9jrIQCG9uVIFIv7evHI1peu
         VR2x3edpFOrKLtHstVc5dpvz/2zRGVgH78kopdDhRTSIdWMaV4W6umYn/9PLx0NKdQmj
         BXn5IYZg/mpVVzXwMPHzNDXxHGCAga/YL3FEfWyd0s7vc8zJIWqBm0p78hmwLeeoUg+2
         xqAN8skXn+VFwjR+jW8Jktgv5FIMWciASSEwWNIb1NSKMkLdWzt7+OEBixmNY1U0IGZA
         zVBBco3/1OcJJRc+bN3kA7Tdn3g+06tM410Q+SfywHxqZTQgrDD3nb3FhLUNB/pas4B3
         SUUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784005193; x=1784609993;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YtW4Ak09kXgiLEZNs7J/4jrifXCWd9zql1exxl35Rg8=;
        b=sqxAK8Mjvl1Tc9vGmfl8PT8ELU9FQAFvlT+2A+mzxvsJ2jwffXcPwwSX6l4kngHvW/
         ptyb2lRiXptq0t7J4iGf+JF0DuVmmtknFVdqlhTLS7k4TDBGZZZcwDMIRKQCs4HAM2kX
         3P+9P70JAai4C6HDUlntMO9bCzJXssJFvqkOaaT/dFwsRjmTdQCMDDNWdE6Z50+vuTSW
         3+YdmBFjNwDUoz2WMjUhxPrI2TBkewnhH4JDuLDMoNeLa8IuDXXxlpEJPDIulIVPey52
         HBD6B5oLOLHNKXQHBZr2D6m44Na0ELzDO6SaB8C5ek6GV/EUaqoF/4hqYB0qxozLIfvv
         cbCQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp/a0z+0blDXqgJm6ahn2gPoyKGq9A/tLegZZhQ4Sv7lCsaE64WQvSEn7BD4N5RaQ4m/oxlrQUfv8w=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp75k1c07qLB1qfmOxfWh7b6FdDlv9HN5UwKrJNpPiNxGokxZ0
	o/nXUbzOgmk0Ynn3Zy33XPhiHAYH6VsIObFAls9x1FdrHP42yFfO7yf4zHL79CvTw8k0+wjdW1R
	ZCRbPx6OBW1s02XmENSaV7PYra4VYQfjPQyrWYpx1Fw4Oen+OO6jtTkSdaUv/FbE=
X-Gm-Gg: AfdE7clyDEkpeWhMppDCRLKY8y3lr+j8SUcmg7autQA9SmH1mY33BvoD2GkJYxAW/cs
	7jqe3Yl6y2dpE/5NtA3EWmX8ExU4Pglq7WA0MCC49MkK3uWDHBUJ4MgLmQo23iDKwSLRUfxRM3t
	8nKojVjrDw0PvL6Rx8VxAChv8SYHrW4t4uQjmedvqb21WFEZVmRnkG/7Frz1fL8MZYtRBvPeXqG
	AVGvznFn748VBaaZPFEvPkkC1Zp72GTzGc4JxmkGq3EYLAHeFiesc/ARms0/7vhyv9horDtGYu7
	SIiIPhCQFLsVCjp+1uioDOcb1DenQ0VVaop9kqEdMNpsSyyxbUkqtKWyniueCj8Dc5FGaceylv1
	HJji/ncRQHkrdUdCXEP4JZdgc0O7Mbz6LlHliOOgGPxfyZTN7Vi/0pym1ag==
X-Received: by 2002:a17:90b:2750:b0:387:df8f:1405 with SMTP id 98e67ed59e1d1-38dc77badd3mr10713098a91.38.1784005192950;
        Mon, 13 Jul 2026 21:59:52 -0700 (PDT)
X-Received: by 2002:a17:90b:2750:b0:387:df8f:1405 with SMTP id 98e67ed59e1d1-38dc77badd3mr10713061a91.38.1784005192490;
        Mon, 13 Jul 2026 21:59:52 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3120c8e41fcsm41874021eec.15.2026.07.13.21.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 21:59:51 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 21:59:37 -0700
Subject: [PATCH v9 2/7] dt-bindings: clock: qcom,glymur-tcsr: Add mahua
 support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-tcsr_qref_0714-v9-2-373670ab15f9@oss.qualcomm.com>
References: <20260713-tcsr_qref_0714-v9-0-373670ab15f9@oss.qualcomm.com>
In-Reply-To: <20260713-tcsr_qref_0714-v9-0-373670ab15f9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784005189; l=1880;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=rWbtb1W+stySBwVTYmTH8aWgwOvBKUz0d7zkndsOrdM=;
 b=P8t+Vk9j0quvabeBmT1OdSoFANC9FVLIAbuJevQ1qm4wbN2sJdQmDvyRxiniMg6PzlT4XgYcq
 TRLkHILtCrhAx7A84t/1I5FRIVZ121m3BHONU9+3jxPhK7UVaGD2dLD
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA0NyBTYWx0ZWRfX3nBLISXEmr2w
 ZnpAqFbqPV+RIP2rvjO7rKuCa0dPVb065eJu9aaylNz28FVPhFRiNQ1DoHRIQp9e+q/zxPfWTCp
 DivTugFmRWlSUVQh/ljgzIuUMNvAo2Y=
X-Proofpoint-GUID: qvZAW_BhzjFU7GX8J21CBYlnkT1a341L
X-Proofpoint-ORIG-GUID: qvZAW_BhzjFU7GX8J21CBYlnkT1a341L
X-Authority-Analysis: v=2.4 cv=BZroFLt2 c=1 sm=1 tr=0 ts=6a55c249 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=tHEUkVd5BVjdM4dvyhIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA0NyBTYWx0ZWRfX414TvyUcAW4p
 MxX7LXWPCFm/DWARg9xU+KcE7foWCanu3ckveWE4HXJ/SejB/9DZntlG1zNS9RgI3e5IOprK6TH
 cUfwik6TUgN7h+mnd0qgL4eDsHI/wd4fgxZTKz1+HwxEJNNHteZB0K27zblYWgKCqvFOE8QnEoH
 V1SmkF6JxSNDpT2mCrrzyls8/EmcahTwUi78/QxtJY4daozXo8lW6nbMxjBZVfcYXJVZY7ZUQtF
 bc8Kpd/YglShrM13GLrZ6EZ6gLxh91XXBduv1fLl9CUhwD29JhQgcsMS9i6z7LsR01g40KKGM0Y
 R2NT37YutMRaRTgEhREIWYGSGjxVWJ73EBUDXU+H9d69Q65/88NYmgL430xBQhuS8I6ZvjDvdod
 6OfvqYIv1aDCkmwSjK0yY89A2snOOGrr4Tf+pGFZ/oUNqTOdn55hygiOA8dONu1e1ZbNOqaCYbP
 t2ChHaESNceQHqbPz0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140047

Mahua shares the same QREF TX/RPT/RX component naming as Glymur, but has a
different topology: a single QREF block fed by REFGEN4 only, rather than
the two independent blocks fed by REFGEN3 and REFGEN4 on Glymur.

Add qcom,mahua-tcsr compatible and document its required supply
properties. Note that REFGEN4 is supplied by regulators vdda-refgen3-1p2
and vdda-refgen3-0p9 on Mahua.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,glymur-tcsr.yaml  | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
index ec89feff89e4..2b6422627165 100644
--- a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
@@ -22,6 +22,7 @@ properties:
     items:
       - enum:
           - qcom,glymur-tcsr
+          - qcom,mahua-tcsr
       - const: syscon
 
   clocks:
@@ -82,6 +83,25 @@ allOf:
         - vdda-refgen3-1p2-supply
         - vdda-refgen4-0p9-supply
         - vdda-refgen4-1p2-supply
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,mahua-tcsr
+    then:
+      required:
+        - vdda-qrefrpt0-0p9-supply
+        - vdda-qrefrpt1-0p9-supply
+        - vdda-qrefrpt2-0p9-supply
+        - vdda-qrefrpt3-0p9-supply
+        - vdda-qrefrpt4-0p9-supply
+        - vdda-qrefrpt5-0p9-supply
+        - vdda-qrefrx1-0p9-supply
+        - vdda-qrefrx2-0p9-supply
+        - vdda-qrefrx3-0p9-supply
+        - vdda-qreftx1-0p9-supply
+        - vdda-refgen3-0p9-supply
+        - vdda-refgen3-1p2-supply
 
 required:
   - compatible

-- 
2.34.1

