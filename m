Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E5A2DEA93
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 02:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779935368; cv=none; b=jGZRTZHSYG851aUD346X+rLbKgIhVp3nKAVQMcIvhKQwEnsjK3K1TLcE40NS8Sriib600C2MVUmyIcyd7+WcxJgAmwf8Yswt/lCwwUojh6NITh3QiARW6ob6hj5FnCXnBzrt1RdFEWzVzFQHa+PPFT7fAldp0dA21hZS5ogFGx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779935368; c=relaxed/simple;
	bh=WtpPDP907J8Nn9pP4O+K4wkFHYLpz21QFKFWYhc+jsc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JQaBJQLLC/BlcdokIXVRMwrF/OYWlEtlSjPOp4l2u7np9KBACiEQ0jYAWGuWUz5h/ZSOqKrgYcSxXHGdVubz94L11fUld071KuyQLdBsFljy9v/IJBkg1XniHP1vj/ZpchMFzHijAJdSfZKIs/uJoDj66Hc2c2B2mHXZlUpXxXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VpCnfp8Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EF2wZsOd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VpCnfp8Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EF2wZsOd"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RKmuql1638623
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 02:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	25tyBNUWP5adeDVJ09nDG6dQP6rYSjQItwo7tLsffeQ=; b=VpCnfp8YvbFXBLZ8
	HYpnbnbECWdBq/UJpGo9O1rtWN7Bh0Ur52sSG7TNu9be0cNO4reGIDsXG2abNWIc
	uhikadoBpQhIMlU9traZ9yN1VfGRnI35Hcje2UsAA105P23tVnbDmh8981vwY7uM
	1vKnuDP75QBO1O9tKCEIOR6O0yBLtIVVdlvJk77dVIxeWnE70yBfOSDMLeT0k9lD
	QC//zR3vn/x2FVB+0Dxccyf22rkdegWZ5QIZWpFqtSSbQDzxg7ZD9yN2SIBRGmSM
	Y0ImpiZa0tA6BXSvjGsbCDPsIQ7KqrqT4gSzq/k6AInrr1Uqq06HlkfiFeqXmsr6
	42if6w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yngy7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 02:29:25 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304d8613efbso127651eec.1
        for <linux-clk@vger.kernel.org>; Wed, 27 May 2026 19:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779935365; x=1780540165; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=25tyBNUWP5adeDVJ09nDG6dQP6rYSjQItwo7tLsffeQ=;
        b=EF2wZsOdg/fNMHSaAwbqePS+sLDNEgj5kzgSZ/rtIKXaF0co3QpjkAzZdyVTNA7qKb
         oqzvYfrWlF/J6xuNE0C68AOKTO2zIeXvNxfKa6l4Useb87IjxKhHUfm7vv2fowP9wmq6
         OhY0To2pE0zZ/m5rZvNZzDzlLBopd+hPHkQW7VR8c3gBTjejm8Pjen1bVpRQW2x13SdC
         upXQ9bNgqCXQXQ4e2as3QUy9xRcfbQb8dqGoCHUkUK+KJO9h5KD8fvLiomtw/f7ka5E2
         0aAptVSvpJI+jE1gxaFaSMG0P/Z3Fwk5t041N6uj1cbFGb10P3fYxg6wAR5+iyluUdLF
         IWPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779935365; x=1780540165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=25tyBNUWP5adeDVJ09nDG6dQP6rYSjQItwo7tLsffeQ=;
        b=GcIXdMLROUErM0yX38EMxlNQA5ygMPY8wMu5229T5ROcdZ12gPhCbAJ3H/UObBVW+F
         Q3P1ohMpcqf5teMlsBDP2OmE/vW8zbQKU6t3M/6cVL5oDLzlRw8XO4Bmp1HAvsKtIO4/
         sDTbtXDe7OMxD/sMbOgkO99IA1sLHpyNwgkPL+Kd36dv4a4GfgVvI5T8viv0Vl6uxt+0
         //Su0o2MT2wMf57UxMWNgQby72jM/0Id9KoekolRgmsI61OEeWdeYY67HokNUQ569hhS
         qmn6T3BFh2MSQycL+oEp48Hr0XtANpn5tGU1kV5RKpb9jNR40iyrv6w+Kk9xGjqG7+lb
         5RfA==
X-Forwarded-Encrypted: i=1; AFNElJ9c69Nkeca9x28I8ReUpFdRjQuZqfCOMyRjzZ7E70DZqU1dXr0gbVKTVwaSa2gtWg0BwngTo8ce91M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx35r1dY40HnyHoPNLacR8zxe7IejiTStr47e9uXVvCIR/tCWDL
	NfFIadSlC7AvAn7cjkOdL9whUNAgmPqSvklnkMFL69G4J08Gm1JmX+BWPYbnuh4gD83EFEjkRbS
	QwJYFYNgj8bIVSnJbVUmfRyO7dzYLeQXq+r7W8isGMyFo2X4x1xe0hE2UbmzjnvP/zNWEglwZTQ
	==
X-Gm-Gg: Acq92OGTjVtFcRxBFLh5qBITJHd/SMeNiRjFKMJ2RnqT6X2bazy+Cg+SU8Idk5GfCQt
	FJ0e5N6Ej394YPTkvqQYiL5Wt065rgYSP12PQ4pg1+NqihfCFyeVq3w9iym5fa/aQkjI/qkUhTv
	E0dZ7FbodmSWH8NGafcNLF8FSoehNTZyZksBvHyBB7Ja54Dtcwtv0eXrswHn+t26ChdQ27oT8Sb
	XCRLyoDcDbLHiznWTs7ckf5ZShd84gPQvdlC2XjQF9HacF5LVD322Q20x/qVQK01m2fopvNcQK0
	/7M86MWRWcwC7JFfDt8yD0FyYmhkLN8Q5r5OlBZHcKb6B3tGWFW4TfGvkuHVrgdVp3j8BJt06Q3
	kecHvz2KfOjQCPROxLTUyW9TUQz2YWUXLRSis70PdScF4Wb6zTVP38O/crAFxjDo7t3GKkQXlI3
	gyn5M=
X-Received: by 2002:a05:7300:f191:b0:2ef:83d4:647f with SMTP id 5a478bee46e88-30449094103mr11127818eec.25.1779935365067;
        Wed, 27 May 2026 19:29:25 -0700 (PDT)
X-Received: by 2002:a05:7300:f191:b0:2ef:83d4:647f with SMTP id 5a478bee46e88-30449094103mr11127800eec.25.1779935364502;
        Wed, 27 May 2026 19:29:24 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304d4222060sm691653eec.29.2026.05.27.19.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 19:29:23 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 27 May 2026 19:29:12 -0700
Subject: [PATCH v4 1/7] dt-bindings: clock: qcom,sm8550-tcsr: Add
 QREF/REFGEN supply properties for glymur and mahua
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-tcsr_qref_0527-v4-1-ded83866c9d9@oss.qualcomm.com>
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
In-Reply-To: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779935361; l=3605;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=WtpPDP907J8Nn9pP4O+K4wkFHYLpz21QFKFWYhc+jsc=;
 b=XhrGeWmgpKIsHUWiq4AppbACbHOcVj6K6rxQn7Yws8I79Z7jXYASbFMT0wJ1M8kTF4QI1BKnH
 g1s1Jktz06JAfPT5/MThSpK7nKf5WI4cypHghocHKhSyDi+jvhLq4/w
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDAyMSBTYWx0ZWRfX+G6GtTcIqwd6
 tXCE+p+W4T9yXtih0XdGhBPYbXux5/FY9tYskqj0sBPfYH8byDYeb80869RWTfIp+NiFQOW6fDk
 b0CXROc3/FSVcFVFCt2L35+F80m2a8MNWVh5VDDy8QUjvwdyijYv15a8sQPdHxrlXc0cBZjm/D9
 f10MyUW4WRIecPyl2ZhM1RzjOr5kPpMJBZFFUzrLinmP17H6UYKwKm2UYC+Uc1eyxDRFsE+03Lf
 hlnpdAH1GxSaeilTfWFwY9wtXVFzLN1zrE3h0D5qMpnvSTQu8ubQbeja/hF+oEPU/JAAszcyEfn
 U4m1uwxZcWWb4zmAEgvL8XT/0fshqil/8N8W5GMltkyLBZDU6MAkeZ5LeezJZeHSrjGKQq1UjtP
 2enaYCyofSkPC+rq8jFTcYFQbJxYshIUL6lYxLxzfcvKnad5Xig99Rge27xFTfVlLHDPDYadls2
 e1POS3YFjblM2JBzVDA==
X-Proofpoint-ORIG-GUID: UVJLBbhlrLUhZ8lQF7BpRKjF-Do1kjvR
X-Proofpoint-GUID: UVJLBbhlrLUhZ8lQF7BpRKjF-Do1kjvR
X-Authority-Analysis: v=2.4 cv=EdL4hvmC c=1 sm=1 tr=0 ts=6a17a885 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ED1JfwARjmvM9eENDMIA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280021

The QREF block supplies reference clocks to PCIe PHYs and requires
dedicated LDO supplies to operate. The digital control interface for
QREF (clkref_en registers) resides in TCSR on glymur and mahua. Since
QREF has no dedicated DT node of its own, these supply properties are
placed in the TCSR node which acts as the control interface for QREF.

Document the supply properties for qcom,glymur-tcsr and qcom,mahua-tcsr.
Both SoCs share the same QREF TX/RPT/RX component naming, but differ in
topology:

Glymur has two independent QREF blocks fed by REFGEN3 and REFGEN4. Mahua
has a single QREF block fed by REFGEN3 only.

Mark the relevant supplies as required per compatible using allOf/if/then
conditionals.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8550-tcsr.yaml           | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 08824f848973..fd3736ad8c8f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -31,6 +31,7 @@ properties:
           - qcom,glymur-tcsr
           - qcom,hawi-tcsrcc
           - qcom,kaanapali-tcsr
+          - qcom,mahua-tcsr
           - qcom,milos-tcsr
           - qcom,nord-tcsrcc
           - qcom,sar2130p-tcsr
@@ -53,6 +54,71 @@ properties:
   '#reset-cells':
     const: 1
 
+  vdda-qrefrpt0-0p9-supply: true
+  vdda-qrefrpt1-0p9-supply: true
+  vdda-qrefrpt2-0p9-supply: true
+  vdda-qrefrpt3-0p9-supply: true
+  vdda-qrefrpt4-0p9-supply: true
+  vdda-qrefrpt5-0p9-supply: true
+  vdda-qrefrx0-0p9-supply: true
+  vdda-qrefrx1-0p9-supply: true
+  vdda-qrefrx2-0p9-supply: true
+  vdda-qrefrx3-0p9-supply: true
+  vdda-qrefrx4-0p9-supply: true
+  vdda-qrefrx5-0p9-supply: true
+  vdda-qreftx0-0p9-supply: true
+  vdda-qreftx0-1p2-supply: true
+  vdda-qreftx1-0p9-supply: true
+  vdda-refgen3-0p9-supply: true
+  vdda-refgen3-1p2-supply: true
+  vdda-refgen4-0p9-supply: true
+  vdda-refgen4-1p2-supply: true
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,glymur-tcsr
+    then:
+      required:
+        - vdda-qrefrpt0-0p9-supply
+        - vdda-qrefrpt1-0p9-supply
+        - vdda-qrefrpt2-0p9-supply
+        - vdda-qrefrpt3-0p9-supply
+        - vdda-qrefrpt4-0p9-supply
+        - vdda-qrefrx0-0p9-supply
+        - vdda-qrefrx1-0p9-supply
+        - vdda-qrefrx2-0p9-supply
+        - vdda-qrefrx4-0p9-supply
+        - vdda-qrefrx5-0p9-supply
+        - vdda-qreftx0-0p9-supply
+        - vdda-qreftx0-1p2-supply
+        - vdda-qreftx1-0p9-supply
+        - vdda-refgen3-0p9-supply
+        - vdda-refgen3-1p2-supply
+        - vdda-refgen4-0p9-supply
+        - vdda-refgen4-1p2-supply
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
+
 required:
   - compatible
   - clocks

-- 
2.34.1

