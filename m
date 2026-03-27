Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA07395279
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 12:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774613638; cv=none; b=KI4SmHIUO8+rG5Viqrj+KubDPXDsxxz5CqsuPnzaxQLwXxlWtQ6f6FlGf8jTb4w4Psm8L2nk6FpQ3nZS1t1SVWyc021ellKjzYxxRhdKffjd6+9IgaHGu6XrDAWn0g+Fsrysj8upltuUmM7mTKlEeTNy+QjceVmdor/ZVgITric=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774613638; c=relaxed/simple;
	bh=OYhouiq3q0ZDatpkP0Jk+C4Du/ssLvYTFdzjmmNjzZk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZAB4YVyigB8Seew4xQBZCy3MNyLIWJfnQ28FLZqLyUtyz5JNq+0nfIkTtEAGqpHzk/7wqC5Fw3I3cqP6FMe6QjABxQv46KikX1KVwqWBTopftlrnGjhiZG9eDUJGULmmlYaFE+XQ0QXtohmapzVG9X5VltzP4MWShb7DhcTvTB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bz/IKWRf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kHAOcawe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bz/IKWRf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kHAOcawe"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6w7rT3132138
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 12:13:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nCyZJYSNUFNBG4vYgpcbj48rTe3RgrEG+krWZIRlkrc=; b=Bz/IKWRf300lTy2t
	4FYH33FDDGHcmTKXcCLsqG+BYP5H4rnawdm0Abu5sEdUOSZAvflb5ZOozYXNugLC
	b9gSCLTpq5AXA7z22/AdgOXxb0Cd4Rxw2J2fMp+Zah9PkkmVS8eaWBsK09vGW0FG
	+K1UnIgzDksR9cviRDwi2qmukpBPq87GyxjjdHtKfG5hc81Dn/s3iM4l5oGB4lH7
	/orayNsWOzTzGaxQ62kMiWu3dM+Htq6pKNwSgNndhwsjCn5BTgZG4NmmtdQ1tCqQ
	vtaDvEahBz/W4YGZHMimEZMRQt2TATH+Tk+IVhUXNVERvmMPKIC0aWgMGP7UngYb
	ESiNHQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d59s43d81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 12:13:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5090cc6a7d2so61777531cf.2
        for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 05:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774613636; x=1775218436; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nCyZJYSNUFNBG4vYgpcbj48rTe3RgrEG+krWZIRlkrc=;
        b=kHAOcawekCCIoH80pKGfZtkOJytBMZXuS4iZw5/7DA42UXUkfpKE7mP0LqnE2FUO7j
         ZJuLrKMELFoZK6bRx9ENk+FZMVu8oblypwvu3NlRHI8kN7FycdaecCPRo+F8ueYFBs6Z
         UTns5hafbWlsHuSeK9dMRgpOeY3lfy3w8Si0qmXpogFZsiU5YZ2EgcSNzDfokb4Jhbce
         Zyik5fj8gzbw31y0ePL0T8Jz8OYu3dDY+ITn4uZJ2/RCp99NDAoZ48JRrtQ4nazdmeS6
         SZptiZv5I5nLWfHB9u11ForCfa3p3scxMcrlP2VqAYxGZcRRzvq9T0dQ4U6AQxQwfgcu
         ljJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774613636; x=1775218436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nCyZJYSNUFNBG4vYgpcbj48rTe3RgrEG+krWZIRlkrc=;
        b=WTbZNorAiY1GxcvTgt5vDWgQy/z5jB4+0zoGaxF26C94INVigL3TixKiWg/x7SMT+e
         gIqKL5N/6EMY0ujffO2gXge8NfvxcIHklhx+m1n1572oeWJZm9DODYhvf1n5LFbYpS5f
         +iMhtcRl8rHaHbnvaXm/Z9mjoXoSBdepScJE/JbZYH5QWhBgbuIePQK5ERyWpFc/ZZhD
         ABGLQMvZBmqZhhEM+VrjgWrRZ4UM9XGanhN+CKJsgr2VC2dOIszDit/Qc62eO3KpKOhZ
         udsNXiAhRqJM5MHg9udW17EbZQK8RsBYCX7aY4CqTm5AXXTRHVdFp/pIvfjVYJDmZUrm
         oDXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWqCVz3Nb7S7jzWqDB8kqGYgJNOn3HODvDFlisbu/yY6ddu4xtAgLWvfo7bCxk8THAvtWbuZ7LdE4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn8pHN1XGLoiibfDZk93nMj0MJ486M/CHj8HwqP29G6l7MHExY
	RJgcskScVRJ27rMdpEpdRAzP++J8g/H7wXGi7JHatAIghhTJtFQWDdQZjv6i6VqTR+PVFaVpQKo
	DmOB4YHaiIzIAIMeCYlcqVyF/gm01zojHHL6JNkThjzKTkQQtsa2CfOEan70hzyE=
X-Gm-Gg: ATEYQzzyA8N7uyFgKZxuF3rGcd8We+FfIvwvjkVHJCV/jbCXY9EXomC/e2yaMlb3S+k
	msocM+rVta64WMl2NrfDt9sRyRdCOvEYqlx1mZSo3JptD4HqY/5pxIfnZgHEqlExhpy7rOsk2eZ
	JgWbxXSiltmzJUr3iz19mbkqpMoKbw80yY+Bw1T1K4GM8Pk0t0rWRX3pG+ZQhFNw6KwqWDbEf1L
	1uJHVJ82mEPUbBK6WJ+NvIG6uf81eiVd760GJZhcsurPKggYyI0/JPTUo0pYPQNU4PqRScbkcNT
	Mi3Lh3yw4a23g5kSjJ4c5gmiHE5zxjFuY4oWFEtP9koqvjaDdd22PLUqAhzkWZkSeIgbBC9YhdJ
	1Qa17QmhakbT60HMcmicd1MV/tQM=
X-Received: by 2002:a05:622a:1aa1:b0:509:13a9:552f with SMTP id d75a77b69052e-50ba37f68b6mr31657791cf.18.1774613635534;
        Fri, 27 Mar 2026 05:13:55 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa1:b0:509:13a9:552f with SMTP id d75a77b69052e-50ba37f68b6mr31657141cf.18.1774613634939;
        Fri, 27 Mar 2026 05:13:54 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919dfb54sm14647927f8f.31.2026.03.27.05.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 05:13:54 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 14:13:40 +0200
Subject: [PATCH 1/2] dt-bindings: clock: qcom: Add missing power-domains
 property
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-dt-fix-milos-eliza-gcc-power-domains-v1-1-f14a22c73fe9@oss.qualcomm.com>
References: <20260327-dt-fix-milos-eliza-gcc-power-domains-v1-0-f14a22c73fe9@oss.qualcomm.com>
In-Reply-To: <20260327-dt-fix-milos-eliza-gcc-power-domains-v1-0-f14a22c73fe9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1664;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=OYhouiq3q0ZDatpkP0Jk+C4Du/ssLvYTFdzjmmNjzZk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpxnR8x1193sU8zac0btSsLrcziiHBxywYAio3H
 yRvs7NAfWaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacZ0fAAKCRAbX0TJAJUV
 Vo8READFsryJswnsDm0PlANo3n4UaqFu16h59gBNGshdYL6Z2/9dqsmnIDRCH8ih+s5DATAmX3s
 3u6GfXnHKX2CIwlmuThO2454vSlkDr4T50cBiJnL3rSAiKlmp64xxyjk/kVbcZy9EjX1Xee1tNk
 ixK1bqr8XTsvnS9J+yvDYN+2FnkHUlzxbKCSfDTC1or2JWXTiAzXVkuINGOQhudSjx1a1vkzjNC
 A0pgyGhpRizKFac3HnVGFly126JNr7EzFZHJS9KUxBKL25fyiNe724WivjdG7SfMRfqkHBdmoa7
 VXH2hitIYW0z2uBBKneTPUoSRmo2u8ahrSeyIf0tgKtTpIKi/ofvhxbJ/4jLVfBZuwdkXiLgWZf
 rcDxmvKSm+94fw3J672FNdbbplRlvtIR60ME2SwFg08gC/o6L76T9Asy7f1m13w3Ae4sRviBgkm
 YPjg+LhYq2vF1wqifqFQcRZc0sCN6LfCT6UYPtWno19xZvb01EogYBmK9RddTztYvuv+sqprQLh
 7JZK9giBjgzdbrzs7gQHrWn4jzQos2ZZyoosBbyrJ8g03ulfjfKODzmN4Uh13XT5WYAUGLEaXmF
 e0dF9v3WiJr9K1WF+Rk/h0tIdp0a1t6Etblm3QlHMzuGpiZOjCrLh9KQ4kICq0zFBMurbkAUvy1
 Vfv389wdsGdXm9g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: SYeIKBSjgTLa_zwDYuCkujudY4Qdj3im
X-Proofpoint-GUID: SYeIKBSjgTLa_zwDYuCkujudY4Qdj3im
X-Authority-Analysis: v=2.4 cv=CoGys34D c=1 sm=1 tr=0 ts=69c67484 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=jcP1HsbDA0ark0d7qT8A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA4MyBTYWx0ZWRfX3qCsLxZoweSB
 4fvs79mUwKRC07qmuqIdFfyquqxsBfOX8DS6ULN8rknuMxoOFGmMAmlnjish7dniRS2Jgf4D2F9
 XRF/Opb6lDU4c3kVqVoWtVjrvhHn4U56myevt8z7tyAXo21z5wdsYMEwpZA1VpbZuzIgzg60L1j
 lT9tqfvGXfbL/1acVovXPmo1Y7bukveHl6CMJqYJQ7nl/aO+AnUtxTS8ZpxoRrrByqOijGgQYwL
 7drhNm5NEcP+ERVh2CBZj2qqCIdZUgYDXhrLvrR5bL3Te+LyrY7sQH3085HKbvYUmbIjrdGreFM
 7P60GSXRsyJxo08VfMMteUi6KqVMzUYnsglJ0ZrLR05mdMejPnoTuVwy409z1oa3VNncZpLSZJF
 btKhkO8RB12DGzF+ewEZxJkU7Omi7BEbTWl6g7GhJSeKaIF+qZZdFTwf23fgJ/rDj4g3V7XKQXH
 VgSPSzkTgZph4EtsiGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270083

In order for the GCC votes on the GDSCs it provides to be propagated
to CX, CX needs to be declared as power domain of the GCC.

Document the missing power-domains property to that purpose.

Fixes: 95ba6820a665 ("dt-bindings: clock: qcom: document the Milos Global Clock Controller")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,milos-gcc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-gcc.yaml
index 60f1c8ca2c13..c65a6ad893d2 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-gcc.yaml
@@ -35,9 +35,14 @@ properties:
       - description: UFS Phy Tx symbol 0 clock source
       - description: USB3 Phy wrapper pipe clock source
 
+  power-domains:
+    items:
+      - description: CX domain
+
 required:
   - compatible
   - clocks
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -48,6 +53,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
         compatible = "qcom,milos-gcc";
         reg = <0x00100000 0x1f4200>;
@@ -59,6 +65,7 @@ examples:
                  <&ufs_mem_phy 1>,
                  <&ufs_mem_phy 2>,
                  <&usb_1_qmpphy>;
+        power-domains = <&rpmhpd RPMHPD_CX>;
         #clock-cells = <1>;
         #reset-cells = <1>;
         #power-domain-cells = <1>;

-- 
2.48.1

