Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318284746DA
	for <linux-clk@vger.kernel.org>; Tue,  4 Aug 2026 17:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785865858; cv=none; b=ldozKcyghMitiSgGUzu8pY08i/S3HhVEAbYrzetWhw4jVVLv7DSXA1q2rO0lPzxx8Ssm0dtJUNXO0l0s8WNqW05WowupMYrOy65WpcQ2XgwPX5r2vubnoRTQHUh034ZRUPPwIyVzTvRKGlbhv47pMhJ/puQtiQqj49xacvmNQ88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785865858; c=relaxed/simple;
	bh=YGVvXMXUYLnOZMf8Ms5rV1I/iooKVaJYiXlCUiVTNGY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Av5zZgmHaM+IJh9FY321EItPHARUfcqVjPgqexVrtRY5i+z3Vh823NRIxQEbdAOb8CMu/1KEVAQCOL4PZb08pvfJIS7wEcdVt4WxZ3Uyrc8ktOAER8n6UAEQ8zYRhvjwmB+1pNAND076zukt7Xs2WPQg33KVMQiavwETgZggNO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DHxsLfqd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iGevgd7K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DHxsLfqd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iGevgd7K"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674H3U2D404680
	for <linux-clk@vger.kernel.org>; Tue, 4 Aug 2026 17:50:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NqweWc75LJ4nKbvr/g9yL9BCMMlm273gZ+lOwmdhkaw=; b=DHxsLfqdjvdMgVXa
	YmK4jdlhDcrc0L+8Q+HtCEOSh19NqDnTdQF0mPeunZtdn7bNW+g5/u8iM+yROZkx
	ZvQiu/0Et/0fZwmJnAEkbtowVB7WTX0ZoNR8yyD2KbofrcGy2CFg/tZ2mdfp0O92
	QPSuwOWHucgUF20Hov9wL3vAcITh1PLrNN9NWulKm4TrL5obijdn0H2IAtXSXS07
	qVS/0aII1AKut+2+jEsUhIXzPL1pDaJe1mPH5janKzWJ72M58Co9IJ4z3l0f2mVB
	7rkd4eEXyhvgKcJxk2HZFWZEPp9S8qu7XGx06GbS9Wq2g93oa3m3EzK7umIxDPcO
	mGK2PA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum56g7cm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 04 Aug 2026 17:50:52 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dbf293831so108046a91.3
        for <linux-clk@vger.kernel.org>; Tue, 04 Aug 2026 10:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785865846; x=1786470646; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NqweWc75LJ4nKbvr/g9yL9BCMMlm273gZ+lOwmdhkaw=;
        b=iGevgd7K8noINI0G99ITcpM16/uQEuCuaSb97j/H0mEIjD+O0UInJtO8xt+phLQz/7
         xtAaSO4/ItQryz7X4FwH1QRj3Mmk60mrd26SPWqGXp9H2SaRM8dylt2ZvcsDxbKcyrkB
         nvu4FVbzm4bGqb8h8Dyj0QtV++tPlIC54OJqqSAk8MwYo6OIZgv6LyO80FxOotrknK12
         l+uhVsORQqfaMsnh9wO+ngzJiEwn58mziq7RF0V1tZ2ZFC03Y/sUuPpIvm2TOZKxheTW
         iSQALG4YG/Rrfnsd3V6hxzTXjoZvIeOMtsj9tHzTDm7QjytGQ832GsBAlsBkw1KzgybH
         /y2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785865846; x=1786470646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NqweWc75LJ4nKbvr/g9yL9BCMMlm273gZ+lOwmdhkaw=;
        b=HLDq6IuoEoMHVI3dWv87kXeVqcchpFjFHAFXp3bMSdhHwd3r4F6TIkqnLOmmy5vi9U
         4vpNxUAi8+ic32LK67lKWyQh9O+lkIFOP0HSyJquElUXA8fGQwYYcNInA9hZfbqBkFwB
         JKULyDitnMsyDWno42mOn5I3yVm2TCGZhESg1ae5+4e9+tRQHYPQMWjYtMaeA9iujMl4
         i/WehhmxS2Apd7+ySd1sg1QNt0JfZmWmblTnK7Wki0mO26qynpwAfLY/ZONY2LzfH4gL
         5wuLpjHaZewY67r/MbcoCzWOp+7ANZRnpWEYRKsJx1awzGVvhcr0g4pXbcMSlsCB74a7
         LXRg==
X-Forwarded-Encrypted: i=1; AHgh+Rp1c5ByqlYNW88rEpEnPwKG5jwh9rgEewT2ywhtQxTaF8O6C5afAdzrjrcBgAjtxwrg9VglLh00XCI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXgiZxMtL1MFPJe/wAJIDQML3Axm4Pvacm5eCGUpc+ImYn0EJq
	cLGEOoEQqHjkfv7F7xIekD9/W9xOdiWZvJM/9TtgVm56hq0IGg3TyRbdSf96JzYvRlDRbHhCusT
	YaMssY/nLxKaNdKbQxKWtGbClcKQ0kOQIr1rswJNq9bNEgPL18Q6/KndborxxVcg=
X-Gm-Gg: AR+sD13dYqSV3Y83D7n/wAxfYfnewiRbDJe4qQI1Wnsy9P/vboCeOnjov9AKR/vrCIC
	e71T5Uh7+SrWdRI0OqRfiEewJWcbj2BSlj26qqxVTMJX2K4kjrI6sfP9V7CgmbJFVBiDA7XS468
	bcbvn6XCZgW+JSiQS+J/HQ9+ezfG0PpT+mgVKveTUz1UmjgiXn8HrH+PhhZJ8Ek8GDdeek2Zjyv
	FiY+TDwXy2L3I3+GWuMzl/pULQYMMybvUeKdIwuSxxPPPMHQL+BU/tFWBPeF3dgY6+woLEoT9VO
	pe6XRzY4Us30+9/PCSN4csrioHAbvxVkxunO6qicAN6gs6DJ3XwKuzqH9cZFGqIBqwl0yQv1wCr
	hFet3Gi1PjGDUC9r9kjc3xXpX
X-Received: by 2002:a05:6a20:7488:b0:3c4:2eb6:c3a0 with SMTP id adf61e73a8af0-3cb85eb5c82mr580081637.30.1785865846414;
        Tue, 04 Aug 2026 10:50:46 -0700 (PDT)
X-Received: by 2002:a05:6a20:7488:b0:3c4:2eb6:c3a0 with SMTP id adf61e73a8af0-3cb85eb5c82mr579974637.30.1785865845105;
        Tue, 04 Aug 2026 10:50:45 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586790e21sm7052108eec.24.2026.08.04.10.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 10:50:44 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 23:20:15 +0530
Subject: [PATCH v9 02/10] dt-bindings: clock: qcom,milos-videocc: Add
 missing power-domains support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-eliza-mm-cc-v9-v9-2-39067760dc3c@oss.qualcomm.com>
References: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
In-Reply-To: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: Cqn_Hu6Agm7jl8LGw-nks8nej34vwzwW
X-Authority-Analysis: v=2.4 cv=Co+PtH4D c=1 sm=1 tr=0 ts=6a72267c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=PEPMgF9El5tgKvQp_-EA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfX+mOd7VvZqckI
 +4TPZFOpTXUc9uTjkM/56Dx+LLDKkk1dIVXSKwOcNceRwO86eiuO4CkV37CQfNvMMY6SjgWGF1o
 ef14xk4/TRkH6h+qaeInhjaGSxtPA2o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfXxnIgMGF4AZSa
 uDufd4c+AOVioSMQe75AKO4LRoPGsiXgYOi2h4G8Gb152u4TWjXRzGq9uFEZxm/PWUGwqDLTqM6
 hWDVziaNObJJGAPVrapR4PoQz8UwONJlAAnHDC2iq96b4rVKLNiJu7zs48fjPzxA0DqQPsCTyHK
 CQaDa22+6VoLbeDpRG2ZjN8VjeWCoqT8X9Kpemd7Rv5wIcjcjdaWS4ky2j1J3XhJrhX/+JCmWwi
 oDWI9ofV/8KydrOQESuhO4XZQ7p+TuBPM8d2I534zHfs+tsEVzuFMR1WiouoKVFWjIqHL0o2Kgx
 EUNp+g6XC4mwCMAm6VoMuQ2XUhlKx+ozTIBaII42jVY+CZo96N1ZWkNWtEI9wr0jB+FTukrH1xQ
 LhSxbMNopyDXTS69WT8xlSjQEi827PFtWv5sFlrU1XXVxeAdLntWiRMmvseb7orbsRO717g0Z9Q
 AYBvoSYRFC9I6/tLFxg==
X-Proofpoint-GUID: Cqn_Hu6Agm7jl8LGw-nks8nej34vwzwW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040144

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

