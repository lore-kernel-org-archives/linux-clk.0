Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC01E411FB4
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572518; cv=none; b=ccs9DwKZ7RvB2gGjFW/MJiLfQTlUZg+Sgeuiu+U9f75xlDnFqKwjBSC8LLlQk14zH7hvn9wrDWC5m5p1C2Li7Syhh8QJUyHTkI2MIgAQJw74mXM0DI2DRv608A9BUbT+vfrLSaVZj2lb2QVCTRPVT5KymnVgpyuHUh+LlRpQH2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572518; c=relaxed/simple;
	bh=B2v5sAzVWh+Y/KNZcsDuUg3ogbWUHwCfTadAt6s6HK4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JP0dvXQge5eLNswlwglVLmMgyViKcJ9bB/Bl2nyn3bXgTUIzx4FJT36oulXdyszrYWsbKLVDsWx4JEbonOHIaOK9BAbMeIW1NISnm7xKP9kjeYFFTUKqLmhF3CGOaVRbOx22YVfkzmoQuf1+YsYKii57x9INCEtZvyRct5MsU3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NE+WZnlR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gLVqQCqo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NE+WZnlR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gLVqQCqo"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMhMC2372675
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:55:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OJvZQe906cJR+Muj+RF23flCnvQiEIC/iQkqh5pf9vw=; b=NE+WZnlRk31bOy6I
	uzohZwywIVh5tnNHZPgI88DaH0ew3+rId5YjlhnCE323okkFuxaQnVtBj+7LpPW7
	YXVUyiIM01AGDjKg1Myy25zs7p4liJZ6e7M0EMgvkxkxhfN8zR3B9oPn6R9ago5H
	MspOZWoe/4h7s7mvkpuiSqOYiMeViheKmVFe5Dnb/H7B0qotueDcW36WJATf39I8
	DgI4/dq0B8X5fLsLG6CQTV4eHtbpAODJgslI0ayuy3mvfpJ8h/GruE3Ba00HMa6m
	Y+ISzSxabwAI3PRvSqLlnLfu1Q4XgjU2WN8K2TUt4knGlJRr3jgW4B4h+Hi/0B7W
	dgkhTw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gdshef8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:55:09 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90c8cb9f37eso23391506d6.0
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 04:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572509; x=1788177309; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OJvZQe906cJR+Muj+RF23flCnvQiEIC/iQkqh5pf9vw=;
        b=gLVqQCqoOS/a21csX9PpYrWrrjfrUnWXXKd9s9Wb2ojghcg0e49E5XpmzRvJnREI8G
         1FkPDdVXfmcGtKwrlyueIWEXHZiZMWlPE/QDAhtTYpKmq1KqlVn6CVltJqT+Y1JYDfUq
         N4rwKwffcX5Y8HI73EpqyKGWz79toUSA1eOlOvp1g9lcGqDRHVk+j7HsiuAZZ1+97sUZ
         OpFpDUOfygFEEsUK/cJr+WHT2sVE/hqu3/P3iRNoKmQ4oGob6wzOBdlqUfAXm48mOB3G
         kxgiYKmggBgaLvfHMjgWI4mte50uQmC8m/83cngKT1yZSAgeLRdGTYF9aSRQYaH1p4Sq
         2JNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572509; x=1788177309;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OJvZQe906cJR+Muj+RF23flCnvQiEIC/iQkqh5pf9vw=;
        b=H3ucIlnwCozISQZ0983b8SCfgvWwTEN5n3jndW21mIPDQLSQ2htwcltWQcvTFcIh96
         527Vdkyki3TskMotc2Mwk8Tk4T+x3IXw8sL6s9/Len5H6zyXYGDpW4fC+tk9jmko5iY2
         nuT+HmzDxHnDYjZxkLfE4NYYJW1l1b6B22fpunujPrAypL0/5QngKmusrBgYDwF+8Ll2
         K6R/LtasUMjGt/LAZzxvt4db5tV35z7k5TBhYHbThU2UnNZhPgzcodyRtz3JQfs1tDev
         CHTeAij92s0Qf8TnhnKXoAkWZeN20hSZaJ/n6GaXHvIhM50KuTBPWSrqEY47og+pSVMm
         WXtw==
X-Forwarded-Encrypted: i=1; AHgh+RrZOYCaPj1DoHN+q1xfGviN6h/9VSmrzojeiyT0aJ7PDID/K5ex9HOMhGn4EoJTmiGlXSa98UiGJgk=@vger.kernel.org
X-Gm-Message-State: AFuF++kmQuQYPc7995ZJ2xmvzxzpmwoarvPkol+NYnuKVoxLBf839euY
	oPHoEpF3mXUiHTDZXYof4yOXNFt3YG3rEXKS8VSsghXkwVldYsy+RsrlHL6ELhE0+6CXWmpD6cW
	bfpCFrIR1m4pAmiibKpEnPt6wDWznZ8f5kU7hsoZ3kUj9zM4EGRbhbpx77nnaZWeHiRQeZqk=
X-Gm-Gg: AR+sD10yHOY0YAtKF8A+SrL6XFuW4C9RQWpkt/r1lbTtj/AHrs+kstLRCByr3nVn1mP
	8mHxFNJXyaA9T5+A9HYQOR+mVFt2hns1yi+N/JybZnTXHdKx6svyVIFgPSmu2rzfTZHyNVHgUxG
	MhqxS/YUoMjj7nUpj4hNitXPaQDETzvZpWA/5JuEjdDy03ufRjT7zT7+Lt2d6DAYj3/garErd8s
	ecoDunGoaRhpuPKN+ZQ7g+Cncf2cyEV0jJJym1aG7mSi9Sv2+nzmgWIzQTPfvkgY/rRVZRrL71G
	6PCsoGXLOAadaZdI0TKgbaf51VrvUrG1RwaapyliLGspoy7bHTD9SQMyyxXzJKHtxqUeAr2br+G
	tX/w/j4Mz
X-Received: by 2002:ad4:5ce2:0:b0:90c:5a71:f857 with SMTP id 6a1803df08f44-90c80e2dd94mr223902326d6.14.1787572508698;
        Mon, 24 Aug 2026 04:55:08 -0700 (PDT)
X-Received: by 2002:ad4:5ce2:0:b0:90c:5a71:f857 with SMTP id 6a1803df08f44-90c80e2dd94mr223901876d6.14.1787572508057;
        Mon, 24 Aug 2026 04:55:08 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:55:06 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:53:55 +0300
Subject: [PATCH v3 08/47] dt-bindings: clock: qcom: sm8650-gcc: Add CX
 power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-8-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1744;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=B2v5sAzVWh+Y/KNZcsDuUg3ogbWUHwCfTadAt6s6HK4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDd5ob+WiJlEstnbcvpjMyxotrq0sVZyAjxn
 Hh5BJ4I/8OJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww3QAKCRAbX0TJAJUV
 VhfQD/wM4S6e8bCj+fH3NQiUjVUzvQ35Y7MtFRbwk2shwGXvf2IjoDfmUu0c93NUixpsf+b7C0t
 sJSJI7iIn/5cqRhm68UQeX1NQBhDqavhhN01nVcflMnD5MpoL3Gp1OqcFAG0pep0bbnWBvbwWzc
 Sz9nmiVXqg71ClZ0kpGC/ufsgTnm6Utqw+FaF+Yn0nCX3c1KItjvQGLQ5b5gansMDmMv11Ip7lV
 UZ50/bCUirDqZCzfkFpjlFRzVz4tCM2e9qwGH8w0H9pBLVcO9Ijgf194pIam/bAZMZGMn2IYrMk
 JsWHxFMnNYJOlyVpWoOYWlkynYOTn3MWPdPsKD8yIeJD6ihkRJXxCfM1xeGbT+dH1ykMExcOBFK
 UO5A0QP8Hnx7RGKrsnHgQvgcQ4Ic6KO8/yDVNMQi/J1QISO8wy3Y3Blebd0F5+qBkrgViyUnygM
 K9wYH3yThEPLv1rSRjfS1vBUKJMxCDFZKlgk44Jmllp8vAQxRI3ef39oG+FvygZRMxiX5QI5tbm
 rNy1D0Zb9PjDapldvSBLvK9LVTVWnGbvhNjFGGoYfRoKJEF6MBS+VRT9UPTxbqBk9/Bfk5XM0oq
 8e0A2pr/1WrzkzIBDlNTNZFIVD8SZiXG2UzOBdA5UNlqsQIPGzmrfj5ncII4UrMFasjZSYA4k02
 Sp9v5jJjla3LhDw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: vqG3PrjImieCDvp-GJCm6DYoUcAxiHGp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX/iiGeDyAo+1R
 0CnZB/cU5Xge798Z4N7g65Zjbm7jrm9NyoFS0+yL1ZqR1cIUItXq5sep1NnRCjur3JIE/efATCV
 U+teamEyDCLmKI+VMxPSpeQtWfqKaG0DW/lQ0IYyokZILYKXAmPIKwego7g09WeV575qmM5tfJk
 miJ8EEzUbZaxbVsug6LidAesFtSd4Un3n0tS4sHA4S3q52PgsbHGdNuQXyCSuY4hE5r+7XJXGPj
 Z3mWWRceBrtG6/gLRk0kdKlpIEZgzPNS3OubyhJ6QqJnkVRcGYiKMoGHzMeG2NejN+nNzCKGtZO
 iHYrqhU8MgOZNihoe71CHN7z4A3HoYPAZ5X8CVA9Nnkx5kXJ1sDuJXTcpArjxenxrYfjGNlKbNN
 K6DJ8astjuNZ3ii4PViMItjX26lcLJLR7bvcGKZIiTj5unWrp8wVkj+CUrF9HkaXerUzCWRQL3E
 Si7cdHNZDclkg6t5Nlg==
X-Authority-Analysis: v=2.4 cv=Fqo1OWrq c=1 sm=1 tr=0 ts=6a8c311d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=1VWmMwf-hiIXLgPH03YA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: vqG3PrjImieCDvp-GJCm6DYoUcAxiHGp
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX/W//d00Dsyhc
 x6J2biUwPgdFmKMptp+INCzy4KuVmdSSsgxdqsGhWzSIFxUMNhyjEoUB5AD6pyWEi3cauv2ef5z
 h/vSkce8ScqTdL/ogq9GNP52iCejwxY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240099

The GDSCs provided by the SM8650 GCC are supplied by the RPMh CX power
domain. Model that parent domain in the GCC binding so the provider can
describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required,
matching the hardware description needed by the GCC node.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
index c7143e2abc80..f77b184e0b1e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
@@ -32,9 +32,15 @@ properties:
       - description: UFS Phy Tx symbol 0 clock source
       - description: USB3 Phy wrapper pipe clock source
 
+  power-domains:
+    description:
+      A phandle and PM domain specifier for the CX power domain.
+    maxItems: 1
+
 required:
   - compatible
   - clocks
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -45,6 +51,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
     clock-controller@100000 {
       compatible = "qcom,sm8650-gcc";
       reg = <0x00100000 0x001f4200>;
@@ -58,6 +65,7 @@ examples:
                <&ufs_mem_phy 1>,
                <&ufs_mem_phy 2>,
                <&usb_1_qmpphy>;
+       power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

