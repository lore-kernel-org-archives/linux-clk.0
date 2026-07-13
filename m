Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4EE3DD52C
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 09:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783933467; cv=none; b=fkz7cThitvq2cNIY8OiEWbWDZMETSGJ9bYgK1uno4RXruyIWRtlg6fLqUDYpKJnni53Jf8J32JhFeAVaSBL3VmVdvAyszenPA2luVANCK0QLgCfnfLmPHCBs3z04dUGXLgvCFv+DIGkcEFp8oM2oz+z/rNyM2/ffR3KNEGPz7tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783933467; c=relaxed/simple;
	bh=3MohiFJRk7R/WUpguwJ0RoRbuy1k8TNuGFgJUfVj4ag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WRaxBA3A4/1gH6FK0uuk8gj5tqgb/8V/+eaThSuEouoVAvu6oZl148fQ6EGNp9OXRiQaFX+RUZD0bWbWPAJ6/7RvMZ8bE3e2M0/vBbQ55u5OeUHUkA5xYGqsgiL3Jiai7yneBo3FDVf0LLWO55QDShSOYblZ7+F4N3sl0kmiKKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g0V/b/pt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bDa/UB7q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g0V/b/pt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bDa/UB7q"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NkhB668623
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 09:04:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8b33FVeKQ9T2e/rU+WrSlOpsIVAOIk5Xr3oABwt1L0c=; b=g0V/b/pt7gBOpS9A
	FcIZUlgSmkt3HZrco9HVzUZPygAbgPmlabCne12CbH61CVFRkW4NjxNnaJ2Lb5C8
	HGhnDBApJf+KLd+Cp9yGoE9B/fGTPtqlQXh+fKo4veuBM0VGOr6x/V0Vnq3tA3OY
	i61ztCNT06Uy4mNWe8v2GTvPEFn3ODtaqu2PZ67eIXi7KkmrMWH6a7A60UPz0juw
	6Uu1n4PJ6GYxewUXClb3JmlH2qziy+jttO+/DbOWwnISI8bNuxAvKRfNHxuFR53D
	wCwn1B5iFTpozcnzLSH12M7XYeuB/+GLBUzmT0iOz8qJqZHnb7xmmFi+hAGNHMxV
	UygTkQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjnm1smf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 09:04:25 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e095fd889so853478a91.2
        for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 02:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783933465; x=1784538265; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8b33FVeKQ9T2e/rU+WrSlOpsIVAOIk5Xr3oABwt1L0c=;
        b=bDa/UB7q7lQRcDEFosiSHeZaPAqhI6MTR30ujT9Li3glDc26oRWF/siFS3790hcKJ1
         v/uLj/CRvFQYfkYEHdcTUmpD7Y5hekHPBabXA6AakH3AkX2qMLb+JZ4Za0huoRgzVYSH
         DM2E5JgPE+iylgJr/tEzhkxMJyivvtV60KhGiATaEilMghUcFuW6EuKMFV2z55bZbQDx
         6KGnpiLF5v4Cs4Oqo7iFa7screi6pV+Rflg4Q6kfx2EJABE1JYVX0D7xxdPhIDLbOkRW
         hAlaN8/Z3Z+fN3Wwa5ZXivQnfH+k3V4Tiu4FlLZcexQHUODOHjiWoNlpLCC6tpnG3GWe
         5mOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783933465; x=1784538265;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8b33FVeKQ9T2e/rU+WrSlOpsIVAOIk5Xr3oABwt1L0c=;
        b=hZh0yW8trZXU6UmaKLN/fUTffhpgULaLj5RSCMLDMpaTyOYwCZcF659gnnpf+DllXd
         hQ4m49WCmOCh1qnFxOXSMkc5le+DepuOpV6pZQSHBV30SX4HKuSJiKgoNsqBeaB4ROcy
         12Q6fCfnn9ox5XJgF5WDTx75LZ5MPz4ST0e4QyJZr9bMP1uBz7ncWyCw6Gef363fiYbc
         +V+OrWpuGyNhZoeuhuKsmYtx/0l9GJlU39nXPsZUHhEgaHkJQQ+cTtHK9szcYvP/h77b
         8Vs9nmMiVCGvVMru07zzZWyATYhfIw8iN1JKLYrU/cigMJy8Okjax+xaoYobjTfSWG9T
         QQCA==
X-Forwarded-Encrypted: i=1; AHgh+Roqzz+irCIAf36D/xff2O0Kwzpn5ytT927tQTqa7ewkhTDWZIgORrfhI0m9/g0uqnXxjsqhlcK4+eQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJvyqOO1A6W6pQ+HlL9aru5ece+sn/U5BNichx25nuNALHHoC9
	RJW40EgenLIOkam2eDTxotvii11W0fUygN4rjikToWi7jUQ8fAxIEOjHgfxN9pnvQk26T/JqpQH
	w+m6QR/HvWvFEXVz7/rgB6O6P4c+QVg1DrZIB/C+04YElHc62krQTiuXTrSagAhG8+70pc38=
X-Gm-Gg: AfdE7ckfhGwXmC4CQH5uyMqDi8ErOpNOf/plgagQk9Z7JbMUDCb9Dxe50AFKrF6Yw0/
	bK5XvdrlTYI71WWs3IX113N4mfpeViyUvDqrIKjRxV65MtQmZgWJgehjq+tijCCNNwCnmwq/FAc
	cPA16RNpr0vjf+AY/3/+d6j0pPTtPZMNjBf8YwssiMqbhG9oMmoQ3DPa1Z9vOXvZihQ7F4cDs2W
	X2tJ1FniMmg1ZuOKVSRGDjPCQ7ARGVjLujwAa/vgyQxrUntmHgcdKgGXAMqesjSZkDamVLj8FHl
	iAcSQxtm4wzv0pYCEwQcylhwHingVqDyjymDLcUCG+z5mMut9P3LZFS2dxgep6eemZPiDtiFX3q
	NiVd96kFszOPuy0YiovVFpJF169uRYHxAX7Y=
X-Received: by 2002:a17:90a:c106:b0:381:20b:a9ee with SMTP id 98e67ed59e1d1-38dc74cf96amr8305940a91.14.1783933464682;
        Mon, 13 Jul 2026 02:04:24 -0700 (PDT)
X-Received: by 2002:a17:90a:c106:b0:381:20b:a9ee with SMTP id 98e67ed59e1d1-38dc74cf96amr8305915a91.14.1783933464259;
        Mon, 13 Jul 2026 02:04:24 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3119c2a7bb5sm43504435eec.25.2026.07.13.02.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 02:04:24 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:34:07 +0530
Subject: [PATCH v2 1/5] dt-bindings: clock: qcom-rpmhcc: Add RPMH clock
 controller for Maili
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-maili_initial_clock-v2-1-79548f0bb58f@oss.qualcomm.com>
References: <20260713-maili_initial_clock-v2-0-79548f0bb58f@oss.qualcomm.com>
In-Reply-To: <20260713-maili_initial_clock-v2-0-79548f0bb58f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: 79uNaFFQdGlZKX97_LCLSyq_YIlg4xe3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5NCBTYWx0ZWRfX2QdOAb/KT6pE
 aZcRjrmjrxmMqIzlswDbntSbKt57FT3Dv0/k1GkGHyVkO8Shbu2iLe/Czn0e/7XYnvpN4vPjJHU
 JKqX69GL9QAdyJC77J0G6lufF6eHftVzLKjZrC7xYhpCU4Z5eskeG+raWxMu1fjkR5O7gLoUy8F
 5pNr+31cke+9+wGS3pPFdtRKeepkVLa8RCl+3f73CyLZP9M7e+psAsWXRHXlt0/dnLoP+bbnsKU
 vnH0SRkaoExenVjltJp1CAdH2cDbksoUike/LtHkUlcy1iK1/qNa6dsbjonWFRyII49GddcUZlm
 +xiR7JWJudgiqjemFbFtCCKORaepjWR12zgSsm3hGhKzK3DH/5+AQpipqIa4mfifcnav7bKgZm+
 3RnRcazkzsaZ0rK0XDfu/iKTvV91PYjKtn+zkJSyLU0ycNTJp7+wnMa/Nk0CPKAUyOuyIO7YV87
 r8YOALu+foMefZB/2zg==
X-Proofpoint-GUID: 79uNaFFQdGlZKX97_LCLSyq_YIlg4xe3
X-Authority-Analysis: v=2.4 cv=AfmB2XXG c=1 sm=1 tr=0 ts=6a54aa19 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=OozyDhJeiyY2DhU_uTUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5NCBTYWx0ZWRfX9eblFhCxu9MU
 3fTB7gp1tLkGRy840Ay/i8mVU36VQU7rfqqAuI97+egyF0+CEzlmyDUxxwi0QMuZRDu+1RWbbjq
 OVpr5p06hJqLmiKRvf21SDMl9yZXv4c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130094

Document the RPMH clock controller for the Qualcomm Maili SoC.

Maili SoC is a derivative of the Hawi SoC and the rpmh clock controller
is identical to that of Hawi. Therefore Maili uses the fallback
compatible to reuse the Hawi rpmhcc driver.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     | 65 ++++++++++++----------
 1 file changed, 35 insertions(+), 30 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index d344b33860429527246484560823074f52a9159d..2b446aca5207c9cc2922635b0539f2d2f926ea0a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -16,36 +16,41 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,eliza-rpmh-clk
-      - qcom,glymur-rpmh-clk
-      - qcom,hawi-rpmh-clk
-      - qcom,kaanapali-rpmh-clk
-      - qcom,milos-rpmh-clk
-      - qcom,nord-rpmh-clk
-      - qcom,qcs615-rpmh-clk
-      - qcom,qdu1000-rpmh-clk
-      - qcom,sa8775p-rpmh-clk
-      - qcom,sar2130p-rpmh-clk
-      - qcom,sc7180-rpmh-clk
-      - qcom,sc7280-rpmh-clk
-      - qcom,sc8180x-rpmh-clk
-      - qcom,sc8280xp-rpmh-clk
-      - qcom,sdm670-rpmh-clk
-      - qcom,sdm845-rpmh-clk
-      - qcom,sdx55-rpmh-clk
-      - qcom,sdx65-rpmh-clk
-      - qcom,sdx75-rpmh-clk
-      - qcom,sm4450-rpmh-clk
-      - qcom,sm6350-rpmh-clk
-      - qcom,sm8150-rpmh-clk
-      - qcom,sm8250-rpmh-clk
-      - qcom,sm8350-rpmh-clk
-      - qcom,sm8450-rpmh-clk
-      - qcom,sm8550-rpmh-clk
-      - qcom,sm8650-rpmh-clk
-      - qcom,sm8750-rpmh-clk
-      - qcom,x1e80100-rpmh-clk
+    oneOf:
+      - enum:
+          - qcom,eliza-rpmh-clk
+          - qcom,glymur-rpmh-clk
+          - qcom,hawi-rpmh-clk
+          - qcom,kaanapali-rpmh-clk
+          - qcom,milos-rpmh-clk
+          - qcom,nord-rpmh-clk
+          - qcom,qcs615-rpmh-clk
+          - qcom,qdu1000-rpmh-clk
+          - qcom,sa8775p-rpmh-clk
+          - qcom,sar2130p-rpmh-clk
+          - qcom,sc7180-rpmh-clk
+          - qcom,sc7280-rpmh-clk
+          - qcom,sc8180x-rpmh-clk
+          - qcom,sc8280xp-rpmh-clk
+          - qcom,sdm670-rpmh-clk
+          - qcom,sdm845-rpmh-clk
+          - qcom,sdx55-rpmh-clk
+          - qcom,sdx65-rpmh-clk
+          - qcom,sdx75-rpmh-clk
+          - qcom,sm4450-rpmh-clk
+          - qcom,sm6350-rpmh-clk
+          - qcom,sm8150-rpmh-clk
+          - qcom,sm8250-rpmh-clk
+          - qcom,sm8350-rpmh-clk
+          - qcom,sm8450-rpmh-clk
+          - qcom,sm8550-rpmh-clk
+          - qcom,sm8650-rpmh-clk
+          - qcom,sm8750-rpmh-clk
+          - qcom,x1e80100-rpmh-clk
+      - items:
+          - enum:
+              - qcom,maili-rpmh-clk
+          - const: qcom,hawi-rpmh-clk
 
   clocks:
     maxItems: 1

-- 
2.34.1

