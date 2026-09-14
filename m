Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1C0470EB3
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390112; cv=none; b=fJoz6re5/HIt7ye3wGLODycDJ0WCTOq2hAf78zX//8SNG7S2jun4YBtYnmktxeLaFbA6cEEhJmLCDHMELm5+Xm5Zp2NdFyz2qdPy3FlFa+Rg5308MEme9O9j/gNtGlzIAh2tbUw36MAtGpY808uVL6QD4kcUqZyv5d3Vfe0T/Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390112; c=relaxed/simple;
	bh=XCZH8vhB2VqAgFOo+HO9pBpLZBnXr1kzRRdbw/lyKII=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qeUlhm9jH+V4mjSCVcrIGh44Cnt+uwEl2jBanMQhB0u9xY7s+oo1PnQF/l1iUxOEN1/r5Hijcq0nN8I0HWCK0BX1lUV12v0PdYFW59+D8foaLiMN80Y0+8dq+DKARcR91FP8HZmIRm2oPrfulpr+3r+LhnwV7LJHwOJvLHwqxe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PCikKDuu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IN51y1hW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PCikKDuu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IN51y1hW"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EBRIke407030
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:48:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mhr5wZyqoRDadrIxLws78Oqy3KLTVlUXwdSwqb6H0iE=; b=PCikKDuuUuZ+PqWG
	vv6htoSxQhItiCTvHkDrZIhDYwRDeL4OZuv6A/hlz88jY7d1vNMFoVgezZDGkdl7
	mfMJhNyOJjF7ATVRHuXwIO3OyJoablCMejFTCm0FMY/7I8yLqagMND5TN9wRpdhK
	W8eBZ1BZN9no/ZGH1TP3f9bIRPUcfjH2ZXecfj66S7zqi6LHRYyfFi55byZtIwt6
	yjSvSQaOAu3Y5WVA3vlMQkHtXst+0eA3qZ1qToIlJHyp2wQMp7LO/ByIYfwbrZEI
	EpAWErTYa77Da3ghiUqpNZRyOkh6oLaXyFE8XfapdlS2ECIETomxS+7PeG7k1WqZ
	/CD36w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2kr87r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:48:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934956beec8so601386085a.0
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 05:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390109; x=1789994909; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mhr5wZyqoRDadrIxLws78Oqy3KLTVlUXwdSwqb6H0iE=;
        b=IN51y1hWyN00J9IL5SexOJ3oE5zixTa0Km/E4daxsZ6GFM4lrsCBf87nJpFgDCt9Yh
         7Zbqck4GAKN0ajel4rLpsvE6Orioa1xg1y3sjjpbXPO8ZNoh4Z3KuzuqNnyM/qA1e3Gp
         bGYbN/0gZUtxB0KQNvI1LYF9ictLiqbD+u7VGJWaoQ5yalkbHDMgKIHRjGO9t4g0UqNg
         yUtl3pROaDXG2FJlK/qoAyjfpDZjz/wPpzvFEpl0REq/T4yFB7x/MdzmTLZILSrBrgw3
         1yIlMfP5u8uosnURBsO6cGwxdPAY2O7646gTPOS4ZRXi1arrDV9mIHh2HrB3gKpGAL7i
         EXTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390109; x=1789994909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mhr5wZyqoRDadrIxLws78Oqy3KLTVlUXwdSwqb6H0iE=;
        b=msnIociG38cj8cH/c9ByP0wjLWtHVSD5m5YIQSwql/e/5PwAbyzU/1OyTSHglEYDEz
         FPJ9kajx439x9efAfFnne0lgeYEv3N4wDB1/nHu+NjZIVTi1Iy2gJJE7Wm0gZzQQ57RD
         5v8TC+soCQzk2O9m0mkux4JRzGkr8yUbbvj0CryC57YXmh9gnlC7kbl1i51nZfpPJnLm
         YlQk/lJ45Q7iUBGl5hbmHe4+JZWbhPaxUYEqvp30Ywxj+yGbWIT0YWKXsguvWUE9K/k0
         F/R8aSK/gqP3QdYsexNtS5xsbu756QuCsQN9VGsXlAtSCll4e1dz+50WGPFYYipnMR0j
         QWkg==
X-Forwarded-Encrypted: i=1; AKwUvBxI1VtH+MH5M7qT8At65CyufllO2oieJ60yU9uGz11tlOJMQE4AemoC/+ghJXJ3Y/HpJPMvlbJyC9E=@vger.kernel.org
X-Gm-Message-State: AFuF++ks2g0lAkGEE3+uBflmdjS9vEF59tCXHwIbm4tZF2ullIk+9eS2
	+kaJjFFSJnrVIwPWRPy2/ftCACAioi52eVrjeV/MuqutlBJe3Tqo5pWnSyZqbcqQgsbyN4/ahWu
	dpAn9xGch12p+VxaNEzuQK36TEdra23iEFlvSL0Q78HFg7CKdYBWAIoSC9WbE/qk=
X-Gm-Gg: AYBFou1kWF4vk87a5WsHZ2YL2bXn/ljofy/HZKJZrx0/GnXK56htuWVx56BwP7viiHf
	hu3NxfqC/E8bn7a0g/1lFaTEtDi5nt2ov1foa2OFvUBNtDLitpdrn2JnhVepni7l3RJnWcISehX
	XvTKlpXSpUN8itFpWtPxHQ0Yuo2KXqIR1ta8fv73luZN2wYgy8duFstlQUFLvTHHwx8DueBuhQt
	uFb4ZeMDwK5MUhoWLxIu3NJ3fdSm5WQT+0gVedrHr3Rb+fScP0akUQWUAA9XxqCOafYlalqCUkD
	Fc8Yai4osquLPaQSzuHve2/tYM9/XJ6Dsw7weOXkFcCg9K3iE9dXqxJx+8+9VGxbJPcH/yXYfsz
	Tsampdc4V
X-Received: by 2002:a05:620a:2b9c:b0:939:c1d4:e2e1 with SMTP id af79cd13be357-93a29942509mr323791485a.25.1789390109272;
        Mon, 14 Sep 2026 05:48:29 -0700 (PDT)
X-Received: by 2002:a05:620a:2b9c:b0:939:c1d4:e2e1 with SMTP id af79cd13be357-93a29942509mr323783885a.25.1789390108610;
        Mon, 14 Sep 2026 05:48:28 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:48:27 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:09 +0300
Subject: [PATCH v4 10/52] dt-bindings: clock: qcom: sm4450-gcc: Add CX
 power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-10-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1753;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=XCZH8vhB2VqAgFOo+HO9pBpLZBnXr1kzRRdbw/lyKII=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zVcvdsJW6EaJgrZmzJn5ejesPlemy9bpE4q
 PCpIFdu3sqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs1QAKCRAbX0TJAJUV
 VkrZEADF5Rw+pixHDP52iFJHw8Q40KfxTLrvP8g9zolCFBa0GxycZgsAUzVHa1eqgTLcykzl9St
 oxtq+fMn6QasBBnQ71xeJCWQWkBHoz29O4dxow4mUGwpb/rSv1Oub9I/wAtEKAGjal2sJSzznNm
 TY71dCj/A4aQiNMRS9ZmeXk+kIbr7LJ/WrkGMmzYpGlbvD69aOPKV5ushNtxoQeczKRU6NcHpz9
 D1dn2zkR4Z4yx+j2QASZ3s163qmjNHTbYRSUP1XTw5st4230brVuRFX9lRHt6//r6s2zYHnBNPu
 +5kZcGW1onX6rqRj0xYpOtoQg1FcVq9dlsBKRuZzWwigR8pvKUWAohoaGdjVz1KNPDrFa/HTeQR
 qWxAdSojE5MWhEfWbCAKTi96f3Zj9VpQhY747EXGh/TLjXSOpUFB+vKbXCV9Brt+uJGudZltez3
 v22FwKKpbCTWS7Lt3IseUGMBEajS+61Tofv03J3Q3GnC2wuetioHSnCb7hzyL/lvrL4xiUDS5D/
 v+8Mt2GoCtNfc9gb1Ozvl4S5h+NW6rKl62XW/VU8iAxlTJ/AZ0MKiY1YanjeybvpM3bvV1tdHDm
 7fo29joQiVrp3Iu4q+OYjvx8V3sM1kXVLJ6eHCmKsjEkpdiH8cqKRgaLZQ+1UmT9kKfLU3M/sgH
 8z1Ny/59H40cZ8w==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: IKvY334iv3BCyaaJMTnVEFdLHxKPeUX0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfXxrFac0Z8S0do
 C7+rpFLJ6xFMDHIhNux7xx+iAfgMzCZ7dbXMurNhOmuu27eWCkSPpqwjNBMyrFshQQdCWxhw9rW
 tS67Em8s4NIgvR4SkO0mn+Dk8Xn45Hu+/ruaeh+dmpPZnRS+fKlRg4Ae8YIfwVJ2JITXJnOS2wQ
 jrxIf7peFQuMN3LLZ85wd3j6xDlo41u8gtrxCMojPDsQhoDbK2VgUilULtoOgzFPobhsmCbVQ9B
 ZnoJwHHOPy0EdwADV0oNctQ9lfjbVdXjlWenApmE4OCu1HTcxY0FJ1IwY0moNt3DG0dC6Kgq00g
 BLt7TZ1cA5P58bUu4fjr+kFPc/JqEsF0npMF06iWWQUYW749zCcq8vWZOxCiutRf68ND5z9uzUZ
 r53KZvzLhlu/AQ6k02nCkIX6P41ADdSK+XEZC+DcREzAAVJ1yRJUqrtUrbS1fkcfjr8v2CTgCn0
 WCptMiTNok5mZJMeeCg==
X-Proofpoint-GUID: IKvY334iv3BCyaaJMTnVEFdLHxKPeUX0
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa7ed1e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=8nTHk6HmgCSZk9Niz5oA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX4/5qMTSdmcxT
 7yP2m8wY2SmrUWdKYzNIS4pljNS0zuFLSSzLI3X+dMh3l+7tKmm7e5kADjWhtfXXCfKVnZAvgSW
 jfkDX971gn2vvNN+Dp23Mr5+/1dtJrE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140182

The GDSCs provided by the SM4450 GCC are supplied by the RPMh CX
power domain. Model that parent domain in the GCC binding so the
provider can describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required.
Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh
may undervolt it.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm4450-gcc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm4450-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm4450-gcc.yaml
index 9cfe859bacc9..e143300e7be9 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm4450-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm4450-gcc.yaml
@@ -29,9 +29,14 @@ properties:
       - description: UFS Phy Tx symbol 0 clock source
       - description: USB3 Phy wrapper pipe clock source
 
+  power-domains:
+    items:
+      - description: CX power domain
+
 required:
   - compatible
   - clocks
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -42,12 +47,14 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
       compatible = "qcom,sm4450-gcc";
       reg = <0x00100000 0x001f4200>;
       clocks = <&rpmhcc RPMH_CXO_CLK>, <&sleep_clk>,
                <&ufs_mem_phy 0>, <&ufs_mem_phy 1>,
                <&ufs_mem_phy 2>, <&usb_1_qmpphy>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

