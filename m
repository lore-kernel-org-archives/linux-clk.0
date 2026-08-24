Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE99411FA6
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572506; cv=none; b=fI6B4p9GRJgsAyut4lBByKdJ+OLqiok/25C7MXskqzn1/G8gJGKwrqahfKahULr2sQUk9lNtux8OSbkAp7Nx7Z4VyVD41cPLUT4P+tno9bDSngPQPkjuzZrSKullzf0dDoPzmYWK4GyaP5ZuITPbI46UdghVVbSLBRN8ipnzoUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572506; c=relaxed/simple;
	bh=WE8SPa6yD/8Vsr0XBcQ8QeMQeEo7fKLx7MRpSzRKPU4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qcXzuJ/WV5N8dVVXjWH7M9XdbUrg352w4JgvmmxQaawZvJ9oSYlZgg2HbxzzFR3k3IderfK4ku1LCpx/4LS7WXLXCrAwA4OLN6mCDMelC0cod7a0R7q18wwUdApViJFCd7rNVsc6zbmFx/8P4Y69P1mu9zNMokZfxgTWiz3Zy1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NC57nUKC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HZNFxhYX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NC57nUKC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HZNFxhYX"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMmZq1673476
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:55:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uX09mNqqD7TcFqgZFNDRf6AYdH0B3eRxZ+PE5D4Ukj8=; b=NC57nUKCF+A1R+cu
	TENcMr92qnSjCm1uW3CqYPJuH4/20VNMmgnKpG7Liey/GjYQgiBulPqPhECdiCd+
	f/ZUnWUj991vHKzFeHNBBS8q6J1AKvR0mqjvFQ2jLfDUHrc+MKvYfftB/Q9hqtIS
	Rp4ByyoR0u1gmdiCLPS8gXt4TOX2FNUEK+qgXgcab4cWRqCQnc4LMnTev/jae+B6
	ZzEoExPP/VpYuHICfa2JkehbZ02grIFoPNU5IMLukRupzN3+Rr89+ptgavW7+wTF
	l6h7WiSCphapiqdxAjFJOy1q5jzBo0CA++e3kHHOcWrNYH9/3VM7UyLAGVvqGx8g
	f7jlQw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8huf115r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:55:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e5e38fbc5so399820385a.2
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 04:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572503; x=1788177303; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uX09mNqqD7TcFqgZFNDRf6AYdH0B3eRxZ+PE5D4Ukj8=;
        b=HZNFxhYXCZBX5Q8YFJO7B27ep8m6VWd86EFF+0D/gqDP9AhCGGKLcK+Dlc8VeKCgxl
         +NjCu5y4tbo5gyg6ltMjgvCjNtKbIgTIjMcIewLX3RBOK7bgExkLbLSqkVz5lsBBjPCH
         ALORCWt1nShYPpt0RNAMlkGQM56ENMeTfacvC4en7XbRSlL5zibHr3TryNPe1qURAO2A
         8NOSE/HqaM0RDd13W42olJt+nHs7XE+hpsf1OFS6/wEoi7sqT0hacIGDEPZI3ircf+BM
         OtFuz9Sey4TTjwfLPW4+fwLMPnD2cyI/QSuk8VVGp4XO/Dm1HQukiiOMO140gsJJnwPw
         olSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572503; x=1788177303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uX09mNqqD7TcFqgZFNDRf6AYdH0B3eRxZ+PE5D4Ukj8=;
        b=W/8NG21qtCIaJFfvKJO9pfHPMQE0WF6dQb4ZlnYhhau8Tjzu45kJlTz+XJRDLoIT7C
         5jJ+H5QF24g3irg1xqSSyiCp7w+8P5fmAHfU86Qzdzl0o9xvpLPwmh97eio5Gqe5x32Z
         bMSSZ+HeasrPavS3QXKWlCBKLVIIg51IDDxIA2TqmTFYQyci0BZ4SWpPF0vWmV5FrVkx
         iIrzSXPC8hKHsepAVEhPKn1+zeKVQ0GRRMajpZnbfWkWh6y/PcdQUZaOKFM/a3jq2OMW
         DrXNiRCEcI8VhPI+U3fiuErPTSIX4dtYpc/yMMjGFNH99LsRm0jZVzcVMjUo4ssygdr3
         228g==
X-Forwarded-Encrypted: i=1; AHgh+Rpwq7CVxqRynwqoO2Bx+ReU67PEfcaPyBSJf0fxvvmLGRdfcba2GN1CLmdsFJhwB5UtK72Eshwn5RE=@vger.kernel.org
X-Gm-Message-State: AFuF++nhWHl1EJ9SEml9nGKX46zDWlzIrFdymyRkjO3t5q55eUCF/e7B
	pLk8JuvH+dt30If8VeXZWxZK23naYG/Eot0GyBp+o7GGWURdfGMu+3GkGjRQN9jKzZvaOdIJ9mv
	ZHSDXOxrQM33hGRrEvFd+8j5Qwr1o9RpDz6z9qePdESpP3E/Kv9HBzO/vXJ+mB10=
X-Gm-Gg: AR+sD13hGPL0/FQEC8TME3c1ub2B/5+ESQG7cGy4h+juEfsudvkOk3jbvOk7GnR6g6k
	tCE+odvDprCCxEESDMlhHCpXgZyzbLdZTPh3FP4TM6V/MG36XjKFy0zX743HSmef6GXgFZ7HO7D
	iVzmZuRo9f0rfW/zBugF+Z0BLabTRKMZ3aZrP5EMoP0GknI7y2vYw1wRNoPJ2KSxlzYX6EaJrfG
	jYsa8JENgEao/nsQmyKuVnfcYITwmBpsczZttIOemrkXUMeUQVinYw5X+KgHbgGb06l1+EqX4X/
	5x1zOQ4/+P9Jd3FSonFHls6vM1n2bO3ophKxt7og4BFako8iiD7EUodmfFOmXIIu5IzK+g0qv1A
	xbXCJxwpW
X-Received: by 2002:a05:6214:4e84:b0:90c:ab32:d9 with SMTP id 6a1803df08f44-90cab3204d4mr60547066d6.9.1787572503218;
        Mon, 24 Aug 2026 04:55:03 -0700 (PDT)
X-Received: by 2002:a05:6214:4e84:b0:90c:ab32:d9 with SMTP id 6a1803df08f44-90cab3204d4mr60545546d6.9.1787572502659;
        Mon, 24 Aug 2026 04:55:02 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:55:01 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:53:53 +0300
Subject: [PATCH v3 06/47] dt-bindings: clock: qcom: qcs615-gcc: Add CX
 power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-6-f1205a92682b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1731;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=WE8SPa6yD/8Vsr0XBcQ8QeMQeEo7fKLx7MRpSzRKPU4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDb51iLBtJvqvl/j/WQC0B83DKmmUOpV8dsj
 XflBYO5e62JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww2wAKCRAbX0TJAJUV
 VtBFD/4meUSu81eDLp/GYhGDfGoxT1ubHWM21bGi9AvpuFbJPOiyAuw1JmuM0avtK5pQhDI2/zT
 O91K/d0M9IXDZfuLzLFi1BfZlrkihMpT+2q3GTQAayGa3GPPlDoxY48NO8aPpFdITT3+N3XiFpW
 ugxhKi6zSt13eoTE4zCB7kQuGemvCpIBnHNsZzX2NZPddiyRisenYo2o18aJj4e/D3+ROu+2tYG
 CN6gINEkKWSkp65MAogbBl2kmfCeFKv4kIKCmJIlNgAwZ8fme6/78nFj5yypmQYevfSDwfkOJ1S
 5wG9VbfMLafq/XzTGCzT7QvBWrRcruSb14VTor1r2Cnoiljz45Qt5ZLiry/IarwWJ/int9vLDdf
 PSoBt9u1TXqRscVmf9cPSdIhizgnxcpCGq4AqLwiAr9DksYF/lzLWJlNwb2GSGN+SEg1QpE8XTy
 MTZbrmqQfIlM1FOZBLYSPo1wygVauw6CG8R7bycCGfe6hQaC5hzPdyfdcBLKkRIGQ2YZTA63Vsa
 qpypq9h0lZHQL5GHXBTZDX9gFul/Z22zsPf9g64Gzk8qHjc2s8lK22njrkLWooiwvJtvuZzei7S
 LJ2qhA6MF8Ba44efHnGPfgzEJ35RscOeJ06Bz/FwDSALPV8hWbsIr93tgx07pnVX3VuVbsCRbwa
 suZZBwgb2XbU2kA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX1v9lpJ9gET3Y
 TERNuOLg3+D5kaMPuB8HOcvNuma3Kyq+q2duiVLnjUTFZWrfS50piufmshHKzq44bXOeAevcUiE
 9/S0DhfmRG2eEPeu37QzqrvfYe9lOtg=
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a8c3118 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=1VWmMwf-hiIXLgPH03YA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 05xnyb97sgCQw2c_TNzobVzuBkNk5PsN
X-Proofpoint-GUID: 05xnyb97sgCQw2c_TNzobVzuBkNk5PsN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfXxMkbUinEruD4
 /+OyECOhdOdm/+ADSr0XEF78xq9DLQRPH27ZEkHR521C6V+hUh2Qd5w6Cqc+tY9nU5t2tQDwkee
 kBrSHdZNm9JVb+DYwavfFOln/farZrW2yFUvuiBzfL4sOUlXtGiEXr6D2eTfKZ4u/aSwZNa3cIn
 0dLrEFUxFKcnlQjXIo+z4WWcblG1A92lsCeIT6U9XxShZKmfLqkiYi/bO1TOeCi5zRdXPgUgvF9
 DRFljEMoh0ur06SfSf8if6GA3owSqB8lKzBynoRyBTzO49JYszhkbtunB5EvLYH9y3uKhaW8FXD
 oiCchbrZhq6n5T0ObToYX2LHQxkk8UnzlJ4xBhydTinlmV39DYKawakKfDi6f4JwvvfGAHD52ZN
 nuAEUH3tiMFtLSnYyjVT+GOm6nH4rK59B6pvNLfK5UGcNeRVdQaVOz+6nDTAQ19cZY3hHepCKqO
 iNxMzM+yT7y2ttip2Cg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240099

The GDSCs provided by the QCS615 GCC are supplied by the RPMh CX power
domain. Model that parent domain in the GCC binding so the provider can
describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required,
matching the hardware description needed by the GCC node.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,qcs615-gcc.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcs615-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcs615-gcc.yaml
index 4a828e102d25..5fa73104df0d 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qcs615-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qcs615-gcc.yaml
@@ -31,10 +31,16 @@ properties:
       - const: bi_tcxo_ao
       - const: sleep_clk
 
+  power-domains:
+    description:
+      A phandle and PM domain specifier for the CX power domain.
+    maxItems: 1
+
 required:
   - compatible
   - clocks
   - clock-names
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -45,6 +51,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
     clock-controller@100000 {
       compatible = "qcom,qcs615-gcc";
       reg = <0x00100000 0x1f0000>;
@@ -52,6 +59,7 @@ examples:
                <&rpmhcc RPMH_CXO_CLK_A>,
                <&sleep_clk>;
       clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

