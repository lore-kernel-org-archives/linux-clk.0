Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B913470440
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390118; cv=none; b=fQ4GrJkkL1LAWqWm0sCteo1lX4BF5FDgxu2jZpp+TQx8uFDK0kW4fAcduHt+3taP42vGAjYOq8hsBvQ2M4ht8MK5XpAKGoUHtJz1EFM+/lbi7C5c/pCsuvglXVDzJomS2I8hsZ8BaaS2zBh17iPYyDDgBbaKfKVPV5pCqQ0PKYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390118; c=relaxed/simple;
	bh=cCljZSqJv1A83Fv6szFpAkL1t54SP0MkpLJrDu+mmuI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LggifbyMUvHfWX8gfOtXbYnFaQrbQ+1HNmmbXGprrLpIV/KSfAmNgVcLasdx/cZtEFr2EniN/POnVoSoTVaJJVKoEuHHvjQBz31dnN36I8/uvUISZEZHAbQ6TpUXAlczqCNh7DBucwK7MyQ/CGp1g3b2XolxxZUJri8BAa7Vqtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hisFSkTh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ies62Mqc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hisFSkTh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ies62Mqc"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm8Jl3793350
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DfTRQLRQckPNfNVwEPDgQHOo6su7rg2rWpbow3Tx6Co=; b=hisFSkThXRaShEda
	ClxHJYdo1kqPQ0bpLg1NWRR8m/0uLU6auIXUOXAP/tz2/86RhfVnZ4Kj5ul9Nnvh
	tOA9bxogDc7fhjYBYbcaooLs+pnSKOreoF3kPZRkxNIxt1JVzQqfntUzoYN0nYyZ
	0D5J3b5/JehOwDHs67UoXRbZDLJqJBlYs3uPok2jtaiBlNnRYKtaMfV39Xb5T9Rt
	lQ2UPx3PgiDdWiJIxVydTOJOPIrYzCaz6E/SlghYbczWbCQv/m8EaDMueKJxn2Kl
	liX6rMBgLhh7nW+pUYxwfXICT6EHxNYdAOPUJnNETWP/30elTOV5oAR7sBxU+C9F
	/TPAzQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg15v9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:48:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939d6c515deso648405785a.3
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 05:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390114; x=1789994914; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DfTRQLRQckPNfNVwEPDgQHOo6su7rg2rWpbow3Tx6Co=;
        b=Ies62MqcUIfdfLw+IGc64hzbe3e9VTOPGypcTz4WFBX3YlNdvDk8QW3sF3E+WFBj2T
         RzqXm0Eyid8Ht33KAOd2V6FGo5/2p0JWCXIazWGvjrdDS3cs+QpjNTGu0sz0gt06JKy2
         6kG6kWfRmBsvK5gCXFsbMmkFad/xUV6a6b5Pf0uNnKS/jiem70QFsKWIzTDoQP4Cbk5c
         oKmOZEshjICDJ1dqhSMcRAk9v0TYuS7uf6WFA80Fy8MJPoHNRzCSVUf//5nVFn7hCfxu
         4wd58VpZj/fqoQNRJpWqsVBcx/5SKJbKBysMW2UGKpw5HIzw3SvwUZO31lKt7bKFZEG3
         a+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390114; x=1789994914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DfTRQLRQckPNfNVwEPDgQHOo6su7rg2rWpbow3Tx6Co=;
        b=lsiwxF2L3DsdxaglxFvU0eUpei71FQWr6LSV9eRXkiXiwb8ENlLcfLTQ4rUBnrVXAb
         AK4j3Y9lZwYI8eP5JV1tEt1FAK0gf792ZksILINL6St49uPpBtjG7KvwfS5bTL343hHg
         2zXgGE7WgzxWWUchqPcXGUHvx2sS+cIZ5fx7Pbb7O4RC8opxjrM8T6pOlLLqRNSLSELd
         3VZu+utNFixSPRqoF1l6Qoemm+WzdIj8OL/h0sATTcrP/BCOcMNXjpciVyQqpEEOAadS
         LIX6Op//w5SQe+UX/HCk2r5DubGPnKvQaCPqDXSB2RPdeE8UyRnqCZeiM6UyZRcp+Zov
         1T8Q==
X-Forwarded-Encrypted: i=1; AKwUvBwh5/aRLlVSYVWGjYVw2s5qELPeA8JEPrJThPk/yAb3HumYdXNdsF8WmyYCSbwLiHtXBxq57b4ZDp0=@vger.kernel.org
X-Gm-Message-State: AFuF++mZCyH2nWf0K7LBZq7dL/3sEDHM6zegOEN3fyEbAu7TnZoKFc/E
	9Vpm5HAgXk6Sxw/mesOe+dQ4HXBIIIfOV7DtheYFJj/CuwHn/X+QRRJ7MxZcb4bHSigrERf1Syx
	tM9V4c5GXoURigwumHcHstrtdi9WgWa97yDS2er9HFR+3Dcjd6h3k5qi7axbY42jqd9TR94w=
X-Gm-Gg: AYBFou3z/Y7MnAK32c8/GI93zmW9GAEMBMH/G4ck5k2UOxDB6wYcX6r8zmWeWv+gASu
	SXq3HbhMnX24GhZtZWHz/49agcoWuofUaSqoXjgQZZ3NNplAeNsXBKL+RFdh4RFKrPzYQO+RIuy
	IwOcDWKibA7cstdhiIMC109bPzTwaH3AGM8exWgUqk+xXwBXPfA7ncCa9C2PA9A7/ZDOJvRJugb
	CaQWiODYs1Coa+EJUJ/OEGBgywo/ahMD90nkH62jUXXPOYjO6J18sHz1KmG5HKdRl5VQdKl8fIu
	gw5MqHXy+o0MnBCAaB/gBCmC6ZNznkUjkhD8U0ITlWd2vRbsals9j0YinEpsKH3s7D2rTBFKRRt
	sk0c2dP84
X-Received: by 2002:a05:620a:4620:b0:93a:1101:a21c with SMTP id af79cd13be357-93a299f084bmr326051485a.25.1789390111932;
        Mon, 14 Sep 2026 05:48:31 -0700 (PDT)
X-Received: by 2002:a05:620a:4620:b0:93a:1101:a21c with SMTP id af79cd13be357-93a299f084bmr326044385a.25.1789390111270;
        Mon, 14 Sep 2026 05:48:31 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:48:30 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:10 +0300
Subject: [PATCH v4 11/52] dt-bindings: clock: qcom: gcc-sm6350: Add CX
 power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-11-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1691;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=cCljZSqJv1A83Fv6szFpAkL1t54SP0MkpLJrDu+mmuI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zWrMvA87ZExe/HNo+lke6CFqVCgje/TtVuq
 6cz39h2+TqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs1gAKCRAbX0TJAJUV
 Vs/eEACBe3Loc/76bXBuUrnjcXfFR3LJZDLpi2bxjyqy2mebuM12DwPLn1PpkO5uI27zJEBhsM8
 7u3dsACuLJzsNqUsVGK7OXvqmeuhR51Nq3QZQTWBavTzFrWPH2I6TlLPnWNHmgdSKLXk4R80U07
 7/9T6VFpLX6TTB1IsxBaYHL8OSx/3m1lD/a9/j1Se065tocYM+lBIR/14LE4kFuymCkGJZXAxE0
 ANZALbRBhnWSGQUEGlFt+VDANsQp8XcAKnR8gx1D/8dE/iwM3xzaPz4TUTPGXluySsEEhyP9PLk
 rDySLK1F81NyK6GRQcADlCpOm3QR/8fnWi0E0enxs9yv6Af/LWcasauEyzMWgJ76umOY6rUd3+1
 jYaSpZPQqvsLoZMmd8yuehsISjUg6Nt0lFHMxHwfzIiJagevGiLNj9E9MpWQbd7xpYbOMVyr72g
 7G9K7B8M/n3gfpKAqReDp/5fvsYhSUFCeHn7LPk0UVuaGbkMgKCms8s2CQAGKnrpXO6MaA5d0BM
 4/3H4aExQ5jUwXXxYavJtcy5YxvJXCgexAUssOLNYvMUeOSKwjHI9zZ222uXcF06yeHh6aIdkXV
 ODVDmw/28f7snpamUaeV9MaB/RQaPm/CCqWzhAKeYiLQHh18GxYAF2/iP6Hs+m7NaAjnIynFgGj
 lNmIbl+OjuZtVTA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa7ed23 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=z35zQ5kvS4wbvuCDxioA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: zqMyUZQmJTm2sKPenYACdsiKP-d-ozdw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX6UVutJi2jnXC
 75fDzX+pbpLOHH8NEGsiJMR5ZrALftKQCc+luysrN+yLua7JKQH7vTmAELMF5nGvHiSa/NgVZSC
 NwT2LH8N+xJL2DN94g+//IWXvRLh/F8=
X-Proofpoint-GUID: zqMyUZQmJTm2sKPenYACdsiKP-d-ozdw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfXydzwjCCWbai9
 bvoZf4CebegWG7a8MFA5wo0ARpszj8QexGfcAfYuYntWYTGg20T9yDH18J+0oiXxYnp1cPaMPbH
 KFtXERPDOvUGB1ZLtdv9L57Mwx4PWwmQsVult5tG79x/vh17xswZzj/+3cfuzuXVzp9WIcapHx6
 lMKTTnjoeODhdymL1whmQau+KOlW7vijIAjXjOt4pXnPJf3FgHgRizezvhVM89YoeFEDVkn03YY
 YUfdXvrTtwmGVYhBgQ2E/z7SwXA28tfKE4DlWNjHUzdmf0S2oe0R6qSD1eOpux1x1eT8Zu9XbeF
 /8jQ1rnbnaSvC+BEtSnSfnaSMkTBPGEXN066zDkkT92Aybun2ANSO7BaaDaCUFYQhHO7okTjY3Y
 jTqIl3r4tc6kGGMjFYGIbQmZbp3H+HKJXWixnTTbrPqGtbVm6jDfDbhvr6QPyXThD32OW2y7iOM
 avcCfPaKB1NKlC+Apqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140182

The GDSCs provided by the SM6350 GCC are supplied by the RPMh CX
power domain. Model that parent domain in the GCC binding so the
provider can describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required.
Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh
may undervolt it.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml
index 819e855eaf9a..098a108b8123 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml
@@ -31,10 +31,15 @@ properties:
       - const: bi_tcxo_ao
       - const: sleep_clk
 
+  power-domains:
+    items:
+      - description: CX power domain
+
 required:
   - compatible
   - clocks
   - clock-names
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -45,12 +50,14 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
       compatible = "qcom,gcc-sm6350";
       reg = <0x00100000 0x1f0000>;
       clocks = <&rpmhcc RPMH_CXO_CLK>,
                <&rpmhcc RPMH_CXO_CLK_A>,
                <&sleep_clk>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
       clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
       #clock-cells = <1>;
       #reset-cells = <1>;

-- 
2.54.0

