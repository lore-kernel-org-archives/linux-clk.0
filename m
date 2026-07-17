Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA833B0AE1
	for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 07:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784273539; cv=none; b=rcMePXJdYMwTWSXzmWYm0RsfRwGwHuJckM7yrLEoxqmtEtcWhgbXnYcjJETXD7eV8EUevYpDtHuVTLost2NiMauEKN65hAYT2yL+Wk8wgEc6TEIMRV5SBhr9jBBHQXiUOxY+YVQfajNRosDXDjy0XZKZJ139Ini044fbBIWNQVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784273539; c=relaxed/simple;
	bh=YGVvXMXUYLnOZMf8Ms5rV1I/iooKVaJYiXlCUiVTNGY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rn5vvEII9B0iXJ3Cn7RCniUheM+9hKBDyPAH4RlPzFod7lf8R5XzHUBljPhuyFL4hyoz41cMgNLX+qKtaHLHxOraWergHXDGP4eXpin0uafsXGNyti+CmvW8tYEfkn47LnG6yD26X2QbXyLpyvAjiEKCf0XWnQ4EFJqIZjp128w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Py8LvuyP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JdQp3CnF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Py8LvuyP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JdQp3CnF"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cvfG662142
	for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 07:32:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NqweWc75LJ4nKbvr/g9yL9BCMMlm273gZ+lOwmdhkaw=; b=Py8LvuyPCUYIugxd
	Mukqf1gED86qPjIRSzkMHAAQ2SDPMh9f9EHtAIZye6NLkJAHu0v+APtVuJZ7SRDY
	/gYgu91JHoE/72RYW58t5VG7SU+sjzN/QOTpLqI11qyGpTZpbhhcReQb4ct592DK
	DAbflv93w45hVGFolfXUKyx86nfU+BI3yT/BcRGjjyKsB8vQ9b0jTej3KoeIjY1a
	jTqzH5Cyi9YDkerkFg2AoMM2bEEP6zX7B6W0enyB4rF5D4tbyfXykCLCecj+RfQV
	uJTkP0LwF0ZnsQLXKcBUmT1QFWMb6p+GrL4FwzZJqD9+OxUP1B9VzFYNcfBBbvnK
	+bnK9w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff1m9k90v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 07:32:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cea6a46766so102351925ad.0
        for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 00:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784273531; x=1784878331; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NqweWc75LJ4nKbvr/g9yL9BCMMlm273gZ+lOwmdhkaw=;
        b=JdQp3CnFwCX3aAZEpii6JE+oVhWsoj8S7YO0oLVgi7ywM3TlG3JZy1PDBkcNeF+UhB
         ZZ+ite/EXyFeqS2BO8qGIY9ykhyL9cspTBdI3DzcprRHAEcevdY5nbrPx8wze9MBwMRp
         qI6IBPNegYAAFsKd166B71ElR2ZYOjnD9FCwKZHytisLJNdmzDC7v3YDNP1DBxY+AuoS
         a0iwUDdl4ZtiTrVdXW3S+mOvWB9UZk6sVmEfcK1KDh8AzJWSzoaNhjV14jLgsnBvJhy7
         pf5pC4lr2niTZ9YTSmB6iPFYo4pVs3gXTH3jWQTm0F1VuohaFYj53hsmaVb8+Ed+Zpuv
         1mxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784273531; x=1784878331;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NqweWc75LJ4nKbvr/g9yL9BCMMlm273gZ+lOwmdhkaw=;
        b=gjNasmI3RswtmodHnXY4SNmJGpJRrjwxwfJNqg2hq2FRuDxqto48O04NTNM/MfgROG
         jfa4nrk052YgfDsY0w4fRYdKqwOogmSmTVaDZO7TBa66ZPJ81Gi4g9OrvGxMDenblTHP
         hWZZA1FpzLWhSMPeNeqzrBVkTh7EWwaLR1WS7wxgxcGfN5bYKu8cJ+/w6UiiR+d8Fdfe
         87HuUiNjfl5svFHOO1RdpArq9F8r+lbcDb0QQZ+0lKD9PPN18dfh1yQFFNjmr9c+dtnI
         ZEZSMGMmYKHOdXRG/8I7zaS4RnBluKL5XoeDz+Pf1Df+LruA34xxNl9uyOtCf11DnpEE
         OuRg==
X-Forwarded-Encrypted: i=1; AHgh+Roo9/vz1oOVhuyfw2/PR3RyBazbK0z/0nCgjff/zBsokAm4V/xC7f+HCw4Fn6h7urzvkinzYx5sG3c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyguqJknGzRf9+ZTde9F4Qbx9J1t7sm/FGo+/pUDplCsyR2Io5e
	2aifhwHASZSIfsnQpWFOsoHIBzYbB9PhOo0zM17pW6rqPPFE0iAeX2qr+eJMSSLstVh+Wj8PTaU
	odfq+raWr7DXwH7pBKYezR9ydzxp7GjLOEtTjy9wXA7kl4+yR8rM5YCh4IVBV5Xw=
X-Gm-Gg: AfdE7cno1VzsJGb8jkOj4UsLVHzUBX6taoHiqwB5MaT/z49pMPGVVWoE3cW/5KTmuYP
	+OtQNVSLmZMV7vsR/Zf12nG+vgejCRaieTtOuzD8W0+/X5VRrraCOlScc/62hCP0pN64IJ0yJkd
	Z+0LlDualZ4yEzz+ERMBXERaGaoZUkcL+cnRVFyizM43QgemXIe8bW6d2TiXhIofvpvpkDORrCv
	WlX1dzUrNvj8VArJmDUpU1Oo/opQZHTIZHu3OZNcBPZSqE5cpAwJ+kbDa7rO+X0NOojLj+lHHoE
	B3D30EV6TBuxxG9Qhuerw1dsJ9DbcvstDC0Cv9coJRe3wEhOQQxmIylSw/LHB30JBGpMdcQK8/u
	avmYNSAFYqI1HH8HroZJJmpsi
X-Received: by 2002:a17:902:ce10:b0:2cc:f43b:fa4a with SMTP id d9443c01a7336-2cf34a0a416mr15804905ad.24.1784273531054;
        Fri, 17 Jul 2026 00:32:11 -0700 (PDT)
X-Received: by 2002:a17:902:ce10:b0:2cc:f43b:fa4a with SMTP id d9443c01a7336-2cf34a0a416mr15804455ad.24.1784273530594;
        Fri, 17 Jul 2026 00:32:10 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448fba7sm5882525ad.6.2026.07.17.00.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 00:32:10 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 13:01:46 +0530
Subject: [PATCH v8 02/10] dt-bindings: clock: qcom,milos-videocc: Add
 missing power-domains support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-b4-eliza_mm_cc_v6-v8-2-5cca1bef2e48@oss.qualcomm.com>
References: <20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com>
In-Reply-To: <20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=IMIyzAvG c=1 sm=1 tr=0 ts=6a59da7b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=PEPMgF9El5tgKvQp_-EA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA3MyBTYWx0ZWRfX1UvEGZNPq/qp
 +U7ea0OIzwyfcixvMBN12JuexGpNPkizB+K9SkagVzK/j+T0pORLc3XkLdVBaP1MX4i4HhxqzYe
 9Ok7scVWt8XS9f94OZAMWglIB/z2UoDkHoMdnh4Kqv/F6S1fkbVGT6zarZ//U31fC4Mabd7VMZk
 ekw8BTqJWROGrDjTZXHbRc0yZ2yK9ntLnUPGKQ4BhQFLbJAsUiTEElxKusZ928sGjY+dVEJrV/O
 DmitIJKIAKXkzqBAz9U+aXesZUxnXZFrc27icD/EuSNHOmb+iqwVHKqmcZznhuOhQvZ8fWgPe0v
 VMymXNzGb0zhq5e/RhWQB12YVGboGCWRfIwdTJOuyftladc9pcJL7RoDsbTPdGlu2yIv5MDDRZS
 IZhkTOiVD6mThzUtPUtMaUbJLe3QuaVMEA/fZoBxxeEhAAYiyubVE0oG1gyt2bnwYkTlpF5tGR0
 5BuOtu5B+LYeq3Ms57A==
X-Proofpoint-GUID: cCq_WIXqB8GfItlg8zBu5F8k9v7TWHpg
X-Proofpoint-ORIG-GUID: cCq_WIXqB8GfItlg8zBu5F8k9v7TWHpg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA3MyBTYWx0ZWRfX7zTuAOTYRFi8
 ao7ZA92sr/SZrhV1h1gCxNG5/4ggP67Emjy/yafetpJEiQ1fA1KEimoCWuxDZd6Rji7XQerYRz3
 KnHF4ytkmeMPq4MXOQCLKgwpv7/KmzA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170073

The Milos video clock controller requires the CX and MX power
domains, along with their performance state votes, to be enabled
before the clock controller can be accessed.

Document the 'power-domains' and 'required-opps' properties and add
them to the required properties list and example. Since these
properties become required for the already-documented
qcom,milos-videocc compatible, this is an ABI break for any devicetree
using this binding without specifying them.

Fixes: a4937e974186 ("dt-bindings: clock: qcom: document the Milos Video Clock Controller")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,milos-videocc.yaml | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
index 14c31efe1308aadbea61eb7be7e56039a923aec5..4d8d109cd304ef0f5afc5c3fc7961a6156003d4b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
@@ -26,9 +26,21 @@ properties:
       - description: Sleep clock source
       - description: Video AHB clock from GCC
 
+  power-domains:
+    items:
+      - description: CX power domain
+      - description: MX power domain
+
+  required-opps:
+    items:
+      - description: CX performance point
+      - description: MX performance point
+
 required:
   - compatible
   - clocks
+  - power-domains
+  - required-opps
 
 allOf:
   - $ref: qcom,gcc.yaml#
@@ -38,6 +50,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,milos-gcc.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@aaf0000 {
         compatible = "qcom,milos-videocc";
         reg = <0x0aaf0000 0x10000>;
@@ -45,6 +58,12 @@ examples:
                  <&bi_tcxo_ao_div2>,
                  <&sleep_clk>,
                  <&gcc GCC_VIDEO_AHB_CLK>;
+
+        power-domains = <&rpmhpd RPMHPD_CX>,
+                        <&rpmhpd RPMHPD_MX>;
+        required-opps = <&rpmhpd_opp_low_svs>,
+                        <&rpmhpd_opp_low_svs>;
+
         #clock-cells = <1>;
         #reset-cells = <1>;
         #power-domain-cells = <1>;

-- 
2.34.1

