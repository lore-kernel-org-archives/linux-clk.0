Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0739D477294
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246427; cv=none; b=bPsGdyRL3FXVqSTeigSDJAbFYBp3knvsAV8N36A0NlBWQYoFXgY9fUGmbpCwzGQ6cLHy0nmJUQlrSumFOohiwNhAVerALQgPvfDsUqVbpUPmutjuSEuoM7zby+Kll8IoMWOHUs/hKgZSFQSuT7pM69eFgtMsh0zKQRtVKAitq0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246427; c=relaxed/simple;
	bh=det4iaX9v6ulwRd6ib7E1q1Jk+qVBw1JDKVElqTx82o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KlYPFuOAmUFPhlhhpdCbpACdBJTVGEohhAep4gxcvIfZ1808FS9ECoC5WKv9hnfQdNf5FtzyBK+0J2KGdrCBbVsH5oWksLeHlHnAVL6t+Y24KUzoOu34Va1NvjJ5ZSWB3oVW2Z0LqD876347lsRJ6LEZF//J7MZ+TBV0aGywZNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a4DYb+P+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wt0UWYEK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a4DYb+P+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wt0UWYEK"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA1QT72858000
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:40:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Th+Tt/+/3tqHfV4D+2s77l3jDH26+Q6yQKGLqEcxvKg=; b=a4DYb+P+pgswvB0m
	ouOZXZD8AvoBTYqDMzt8cOilkYZlK2BAX/dKq0/kq9sGAC+v3F1/wgSLqOYrYxLW
	8DdU0xItSxC/1KF4JdKR4hRQt/MWOpQBSS7vZGM4+Nv76i3bgzmSN15zRqfkpk7L
	m98srG1L1Qxw5skqaRCBtEUYFG8i7t5li01Q75M6zDdFdgfWkmkDLocK4p/HMM5m
	SZ0IZPnb5v/AJNL7piQshct7JJls2TXw7TlXeIfm+vC374BXk8ErqAiZU2cUm5TD
	Lp1MHOtQ5AHX+efO/3Thmles5Vln+BLFwD4wKjn0fr9S/L1/mYK/holQ3JiPFb5u
	KAqVWw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1rag565-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:40:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939f248907fso180184985a.3
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 03:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246423; x=1790851223; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Th+Tt/+/3tqHfV4D+2s77l3jDH26+Q6yQKGLqEcxvKg=;
        b=Wt0UWYEKeeLqfcXGk0PwbIPKGF+z7s8DwZ0zpb1iazwsYX3WbO8OKobw/0Awg1688X
         DcZITE5y1iTavmwa7baQ3Pr1bprz2399OCTkUWBwydBN8D/nvTP1rxEb7NM28HKNXQOs
         9RPQUzqJFEaZ24dVcPoKJTwhxZOI9qTFD+HIbzTyMGHJjsWsn88Ep4yjejPaH5vXKKyY
         dKQATvklIQ4f1oc7087D8AYxqJRMAQ0U0lXL9KYYzxxW0BNeFaVPVfMYjip7rOI+Eovn
         tFOLDzdg3ypF2eYxoehPUg6Pe+j72cN4xuHaj5LemYy6CYZQGK+vfAuFrX0juo8JqLKG
         72cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246423; x=1790851223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Th+Tt/+/3tqHfV4D+2s77l3jDH26+Q6yQKGLqEcxvKg=;
        b=sFmNiVMbI1GwdJKNqsvCindoqNGaZ8WNbNzaj95KQvMFtGfO1d+zgTqHZTkb7yL+bV
         c57HVt77DDpEjl2VLM7e7AvlQ0/2yIodu+Yg83W7SiJG4Ivb60DzVmq0y7RoAXsjcyde
         pSTl9LPg2XVKbCTwTITYF7dnLiACLTTX4sBRcC2Z0SECmZXuw3sahYk78o9QWUTevv9u
         j85vx7PmyvBblUaEfYRFTopkunnyXb10WVu/xr67hSYkJOqqzYkG6oU4pISFICcGip9l
         oHzw9LIEQxmQwaTHagUrcsNEw7Mbv72XgZKkI/mSBvvfp5B9y6RsVr9ZtMRCxsy0BAwd
         8lYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqS0XeL4k2rALv/O7RyljksKmTmSD1KVdV+rZmDC9uwrUXo3jgDmDWQE98LB51+7gbbYhOyzCpq84=@vger.kernel.org
X-Gm-Message-State: AFuF++m6ST8idqXAZ4wiaJPFPl+v3Nig3XNVwSOPOn2ZMvXYTKQZzcEO
	jBQJCsHDVknZzDpXaDlTZVkqrPMJNyxQ4w928omVY8kZlVWEyCPncva3yU5uesoN7iOPaN1zoZx
	ymvUls96oDX4+KEb0o98dakCPVkbrtnBHvayQKo2+cmAEiLd3jqL2O5HTsg4IiUc=
X-Gm-Gg: AYBFou2ptfJxvQcluH+ZUgKEF9yfOmxQdfzuEXf9cYeW6f49hId9J7U1nmkH4wu/LhC
	gDxzQ8WCHRX/GHA95u1Wt1I8hO3wcURg0XXo9QEu9dTIomS2Ny+B0a43+WCiuR28/vgPVHqRYgd
	Uzc8u7UPzV0W9thdxYo/QSqs8/IoRWyj11ICDYu0bu9PUO6YOiluOPxMsrWJ/fMxPZpojdReXbf
	RwMwlSMWj6GosozAMUBfrjMX11/IwHxsYko3mwVEJgrWD9V6EJD4SF15qlyrKhP2SRymcHuu6S7
	2zQMKuNTs9TLpaSLgOhopTNu7nZx+ObPqoFz5Kk2UIFM9RhGKhC7GFJ0m9IzlgOwYYnbBQCsqGA
	La0q+tpS4
X-Received: by 2002:a05:620a:178a:b0:93b:6113:21c with SMTP id af79cd13be357-93c3625bfedmr231472385a.10.1790246422719;
        Thu, 24 Sep 2026 03:40:22 -0700 (PDT)
X-Received: by 2002:a05:620a:178a:b0:93b:6113:21c with SMTP id af79cd13be357-93c3625bfedmr231468885a.10.1790246422075;
        Thu, 24 Sep 2026 03:40:22 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:40:21 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:21 +0300
Subject: [PATCH v5 05/42] dt-bindings: clock: qcom: gcc-sm8450: Add CX
 power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-5-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1760;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=det4iaX9v6ulwRd6ib7E1q1Jk+qVBw1JDKVElqTx82o=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3evxVa3Qe2bz6u1k69Uh1xNHnvdskXo59zI
 Wktzen+STqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT93gAKCRAbX0TJAJUV
 VnTcD/9AaCA+r3iQpUxj0B35EkjnEso9bbAyMzoPirtpabXE7CjFF56nTvXwVArIH+jiLyucdcR
 xAVtg03oeRf4+KNaALm5HzMUA0yVLSuC58UXYqwG232SMjoQJM7w04ckf2mWDNbqed9PbYZLyhS
 A5OGxxRn/7LDhqbzE0/rkEmkgl+Nml+GQ2q8DaR5WKHsqB4QeBNUH+QgdTH+OUUe/+hwUi6VQ1X
 eINrfUhU2+RaVa25a2QvL8l5JRHywGkERFF+SBWwVEWtY0vHF1zkwfezxc8jsbeAkWq/mM1dXxk
 s5PXsui48cr7BwE6kzcNz/PXpwBILaMcAPvVZVA0T+k8ARqafHqCNQfZOxl8MfyyTzjnjLh+xaZ
 /kGhAKuscOlZnLAL4mpqPEIUDSmdh3eYKMUP6pYe7UoIScvYplKaRYkulu9vCznj+9XnUU9GgZF
 B5hp/px5C0hbyAAFuToKBDtfmsfLGxrjWyrWrRlQmqzzBkqiOYkmW5KiNhx3TT6/U9pA5SJHK2Q
 SFKwXi+A08PflulsvGbKXx9FTfuv8SAfGaztvHYJqlJ9m77yhg61sbVio9fbXmEXgcVWqRz1o+k
 Afkm4BK8jih4FynkDzip1sAYS4dSiM3cIl392KgThpwIJbbdoX4k6LeeMH6i45Is3VOz0HfRG3a
 yAY9WpHdnnZr2TA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX+llAO+MKNUvi
 H9u/JZnnlWlldfwAoX+S/JKEezWFQiMmIv5KfPJMKHrMNT5LpSo0khBtmcUgGnC+h7/19Hsu6g5
 KyOsmHD4ajNp7w5rNsB3gjWIbjDw+J+mpUhxG7H9isi0+bSTGS1xr3RSAz14TUAssDE22Gew9TB
 rf1FwJLEQG1s1L2hA6kGPxBSbT3vFlb/1to6MrhTI+km/x6f3UbZQCLZPak2PGRLMI64SEPn3IP
 cLdkwZfe6V4wfJaSQ5iY9k2U5gbIFcTzpqvlliRY8mo5kBVWWd3ZMLh9ac2ban4RXlQ/l5dVceE
 jX9OZyyrhucOU7vqqzfUctB1mncRlXnL/mnFqWzc50bZjhPA/xoatLV8rBi6sJt36jmegCagbg7
 77Kter6/sx7HuhDYyxMXXVMQa24S6gLCDS7K7efceG42b8CjG+HROKnzg9oPo25akTCMJ+bqUbc
 jKdARaXXeBHAX21LIjQ==
X-Proofpoint-ORIG-GUID: PeigWfjtCwPbU5Pir4o0QjDrNrJrAnY6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX/o8LuMLKPnvL
 itErQdbfEJyHvevly+kJyGExn4sb+fQyT/riprPoKHPcJtzhMxTIp7uABYsJdNJJxeSv1ajs7+x
 guS5f5UCKrIRm8q3lX8/5S1QzUnch6o=
X-Authority-Analysis: v=2.4 cv=fvpJ914f c=1 sm=1 tr=0 ts=6ab4fe17 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=z35zQ5kvS4wbvuCDxioA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: PeigWfjtCwPbU5Pir4o0QjDrNrJrAnY6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

The GDSCs provided by the SM8450 GCC are supplied by the RPMh CX power
domain. Model that parent domain in the GCC binding so the provider can
describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required.
Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh may
undervolt it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
index 3169ac05e1d8..793ee9e3ff10 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
@@ -47,10 +47,15 @@ properties:
       - const: usb3_phy_wrapper_gcc_usb30_pipe_clk # Optional clock
     minItems: 2
 
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
@@ -61,11 +66,13 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
       compatible = "qcom,gcc-sm8450";
       reg = <0x00100000 0x001f4200>;
       clocks = <&rpmhcc RPMH_CXO_CLK>, <&sleep_clk>;
       clock-names = "bi_tcxo", "sleep_clk";
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

