Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78853E3158
	for <linux-clk@vger.kernel.org>; Wed,  6 May 2026 08:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778057046; cv=none; b=Y6lHU7oSYiY6j+a6ofQ21D/D/YN/xJyEmkSRGf4LKqPbx8EhQERW51EF5vQ1vHeg6mQdI222BBJFHCu+vB0mkRD3qUpk6a3NkJQMNGdBzwhaE1vRK13Rd46bHRZfQ1UeHdNh6H9tAYNicvWMA1o9BYpkOhWxCKQvrcN57bwWxxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778057046; c=relaxed/simple;
	bh=eqZNR351Vtb4Sw1T+jYuH9TRyuz4xIkqLpDDeaojG1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p5UZnBTjJ01xSoLYdyOMgjQqprjSQlf5ZNxuiXokEfy6SbcmFBHNmzcaN1WE94FtCagdJYZHAQxRUkh7l/xmXvKLf2vIezud2U1ScPCG0Z46Z4lJXM0ziKiH8hoft4LZDx03hHi+oODDHUNjIjPo02j6G1zHmPjZGn3tmauuVQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cc/ytROm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZGIK73ix; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cc/ytROm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZGIK73ix"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6467d5Zb248456
	for <linux-clk@vger.kernel.org>; Wed, 6 May 2026 08:44:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1qKdaTvj75iC9+YNfnepvjsZUDn1HOgA0SpMkRiRCZA=; b=Cc/ytROmJe+3P8Af
	Wn/VDWnP3cTVGkouF5+Cs8uMtRFDakDI5gDe4d/x9BMki1+T4hCqyspNyxsXCTtq
	nnKYlAd7ZV8WvOvDtqONAFCAq+GMllxEhCaUZ78axxNXoHwhy2w3YwsrUuHNKljc
	N1zAKa10DaaoLNToUX2tN5FhPIVku5jpX6Mw1pYRgUQMi4JW/3Owy4XWxCoGzNh5
	nGFSG+jeqfqwR2WvIZY3GB+SJvcSVrI5YmAAQXoRV6FgBVRpfqrFX3pygU2KZamt
	mYwSdz4tUOr34SHuQNkeg4ufchuFxvuXgeSB3OIh/FFGnYfnPAwcehJpoEpS9IHI
	3j5aww==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyjq43nft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 08:44:03 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12dfe06b670so20822640c88.0
        for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 01:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778057042; x=1778661842; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1qKdaTvj75iC9+YNfnepvjsZUDn1HOgA0SpMkRiRCZA=;
        b=ZGIK73ixDCna0VFVC685AM1x2vk1PHwPWzOlJwBOSxwmW3gEwqZiMufuFnixYd7d8t
         8MqOgnvF55L7VUGfkiHHRYXpxp5bJSqXt9K4e0rEOhi13IOtwgeGDoIm5uZJvvLF/DDB
         rDDdhFoeUBy31eZbEirrnMDGaDoQj0xpVNef++YUMGRCM67xN/1Z32BZ/fM2m1YDjB7i
         HaTpjT7Fu3HOnUaB9ylCgGLx6J1L8MQPX/QCLR1NcBd+oxIuq2JsmzC2KnrLRAU5EQuu
         X+xQs/AtuPWDJXWEJZpWtEezzrzWYX54q9Lhi/6pke7jAx/nvfna/ZmPKRAsV+hRA99Q
         vvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778057042; x=1778661842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1qKdaTvj75iC9+YNfnepvjsZUDn1HOgA0SpMkRiRCZA=;
        b=RadpkRBVh9ODDnj7d5HfKyihUt/C5z9Y9rvzb1Gl6TA2pN+N9V126sLfh0PFukJn7g
         XEk9Ebmqw6xnhxjrXV/0VBs22fHw0ja++D+uN3tsUMTWkTR1357krbGws5+tEvd3642J
         1Le89AacW9wyBUyhA25MNhVndTZ2ASUmzXQoY5fjvAMbsYF5/EaY4X3fnNoOYupftiPH
         VDGWrtQjI4fAGIf+PjShE+PZIcnm/SBjGKHSBXetkNd8rAmGpP+WZ4mm88lctfj8ms0c
         gax3t6Ji8BCW8OW9tu5wTNav09IkQ16GzOMk7qB23uCjJg6cOiXUpPjsONybOA5vUSum
         /ImQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ODZDmkVchyL+5Zby5LFIftJZqWY4badD2yays6dlBCOww9rbBOtUpbuGaiT9kwIArIwU9rI+uxt0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzUc1qqdQZskWy8aXnuSK/7sj9R9YXR2zdcn1LwV3IOY2NSoDu
	JM2X5kt0oEeDza0t9yODtjO+ksakROgVvNq6Fl7nJZ+XpZmyBTdJtUpjcUktH/fFtNVhvUndufU
	1ndZJV/lwyM2w8Qs7geizxTzd1bkX3DHgKFU8DZnxL6nIBJmYdz4DBtlFkP+L9VY=
X-Gm-Gg: AeBDiesev0BR4sSUqJvRNDZ1gnO6euJ3WQp8WCKrl6hQJw85MUi9Q3lkOfWJSbtJ8ky
	DP4APkijEhnNTFjLLJ6mUqh06XMnqoP6MNMGPcf8ElmzpHeYHRGgpUzK+ZsBpGcRkXGpUq+aKOP
	95FsjL5px1JvRFsTweRDkn8r/Ciq/FJAaKiV8ta92ZAla4TUGk7HgGrVx/O481BpOehwGfhDRkS
	GUUJ2q1fz77THcnLcO0LnjBTIeyL+Kw+jRGqSaLtjYMpQN3bX0uM48uqmVT6G+H2dsBGm8QxIWC
	ra2X5zYIgn7hKuHvU1EzzcV/KCJVKvhoMOVRDvQgCPDgSCHe3MSNfEyL3MkCo/9NCJZUCl5Y5Lb
	onWEtdNMWjh7gTiA19CxaTErwoHumCKzMmBERl7wbAhb0p67dtUCUaLXFEm/uy7ngbtIzJ9gKoK
	bG/dc=
X-Received: by 2002:a05:7022:688d:b0:124:abaa:7ff2 with SMTP id a92af1059eb24-1319cd26b6cmr1279960c88.24.1778057042353;
        Wed, 06 May 2026 01:44:02 -0700 (PDT)
X-Received: by 2002:a05:7022:688d:b0:124:abaa:7ff2 with SMTP id a92af1059eb24-1319cd26b6cmr1279951c88.24.1778057041903;
        Wed, 06 May 2026 01:44:01 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13202fbf0efsm2257796c88.13.2026.05.06.01.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 01:44:01 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 06 May 2026 01:43:51 -0700
Subject: [PATCH v3 1/4] dt-bindings: clock: qcom: Add QREF regulator
 supplies for glymur
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-qref_vote_0506-v3-1-5ab71d2e6f16@oss.qualcomm.com>
References: <20260506-qref_vote_0506-v3-0-5ab71d2e6f16@oss.qualcomm.com>
In-Reply-To: <20260506-qref_vote_0506-v3-0-5ab71d2e6f16@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778057040; l=2788;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=eqZNR351Vtb4Sw1T+jYuH9TRyuz4xIkqLpDDeaojG1k=;
 b=VbrUi0OkuDq9hoaARgM6/TVTQaxY/TXly/WFEeJo9kHpiNb95b7xnO62/Uag96z+gR/kguLf5
 yGebgAyMbc5BmME9K5xPqRIyHCwUMTa/7/qGEAkJqd1IvZT6dua//is
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=MYxcfZ/f c=1 sm=1 tr=0 ts=69faff53 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=2TsNLSZGWbgVkw9tuboA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA4NCBTYWx0ZWRfXyhIzPuGBJfkO
 /ubetr1hdRhrKkfAJX6CLqjRGakp+yB1QAR86M2VmvT8c17GZ95qG9SzV7wFnRzQiDovK70Vwse
 JTwFimG+T1EluZ4FuvjB76mHwumSsJCjP7GBb+k65UJglmE+XHjGn9C9alCEKjIvhtcC88DX8Ul
 8o37wpYknFriwE43/jK1ykVtSSqC15jWz6okqYF2j1xHlCzFJ0we4H1kx6BwEzId4Y2t7xCrIAE
 jQn9/FgBhc2wvAbSsqTj/gBO1TXTikfoq/WllXkgKw/eWAbZ5ktXi+vjKIZD6XeoCUOXBEQxjzT
 oFva2WpnV8IxiQJcWSlaLuaEjwbwsq9WQkJNCM29dORLh0htd3G5ckqScfIWFTP14uPZuwFIb/g
 I6IFzoXuPY8iIeulSqb56Xe+f2IgPfvS+fTV+F05JN5kh8UkP7YkvIVxIo0Pbw7EDBSOb1jGOAR
 kG1rD0VhN25P9C+Cixg==
X-Proofpoint-GUID: 2ngmhS_-8iLjb3E7V9__usKN4tF3_hDm
X-Proofpoint-ORIG-GUID: 2ngmhS_-8iLjb3E7V9__usKN4tF3_hDm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060084

Add regulator supply properties for the Glymur TCSR QREF/REFGEN blocks
required by clkref clocks.

The vdda-qreftx*, vdda-qrefrpt*, and vdda-qrefrx* supplies map to common
QREF TX/RPT/RX components, while SoC-specific topology and instance count
differ. Document them here for qcom,glymur-tcsr.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8550-tcsr.yaml           | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 1ccdf4b0f5dd..57921cb63230 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -51,6 +51,63 @@ properties:
   '#reset-cells':
     const: 1
 
+  vdda-refgen-0p9-supply: true
+  vdda-refgen-1p2-supply: true
+  vdda-qrefrx0-0p9-supply: true
+  vdda-qrefrx1-0p9-supply: true
+  vdda-qrefrx2-0p9-supply: true
+  vdda-qrefrx4-0p9-supply: true
+  vdda-qrefrx5-0p9-supply: true
+  vdda-qreftx0-0p9-supply: true
+  vdda-qreftx0-1p2-supply: true
+  vdda-qreftx1-0p9-supply: true
+  vdda-qrefrpt0-0p9-supply: true
+  vdda-qrefrpt1-0p9-supply: true
+  vdda-qrefrpt2-0p9-supply: true
+  vdda-qrefrpt3-0p9-supply: true
+  vdda-qrefrpt4-0p9-supply: true
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,glymur-tcsr
+    then:
+      required:
+        - vdda-refgen-0p9-supply
+        - vdda-refgen-1p2-supply
+        - vdda-qrefrx0-0p9-supply
+        - vdda-qrefrx1-0p9-supply
+        - vdda-qrefrx2-0p9-supply
+        - vdda-qrefrx4-0p9-supply
+        - vdda-qrefrx5-0p9-supply
+        - vdda-qreftx0-0p9-supply
+        - vdda-qreftx0-1p2-supply
+        - vdda-qreftx1-0p9-supply
+        - vdda-qrefrpt0-0p9-supply
+        - vdda-qrefrpt1-0p9-supply
+        - vdda-qrefrpt2-0p9-supply
+        - vdda-qrefrpt3-0p9-supply
+        - vdda-qrefrpt4-0p9-supply
+    else:
+      properties:
+        vdda-refgen-0p9-supply: false
+        vdda-refgen-1p2-supply: false
+        vdda-qrefrx0-0p9-supply: false
+        vdda-qrefrx1-0p9-supply: false
+        vdda-qrefrx2-0p9-supply: false
+        vdda-qrefrx4-0p9-supply: false
+        vdda-qrefrx5-0p9-supply: false
+        vdda-qreftx0-0p9-supply: false
+        vdda-qreftx0-1p2-supply: false
+        vdda-qreftx1-0p9-supply: false
+        vdda-qrefrpt0-0p9-supply: false
+        vdda-qrefrpt1-0p9-supply: false
+        vdda-qrefrpt2-0p9-supply: false
+        vdda-qrefrpt3-0p9-supply: false
+        vdda-qrefrpt4-0p9-supply: false
+
 required:
   - compatible
   - clocks

-- 
2.34.1

