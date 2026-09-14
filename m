Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F43470EA7
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390110; cv=none; b=oUBNS/4zOKwE0dS5Jpdt6p8pUeLawP1SAUv3X0vr8tdJbBZ5vZviQ8o/Z3WONj+pX5PqPtoxIHrtmCgi/jcw84IZp1VPsAG5XC1hVheRkPIZMmIxQqdhn13Iz9RhOKtnyUyfNheS6LDHW93f4mBR7hZy84KzIY+MurWLjCcSWYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390110; c=relaxed/simple;
	bh=A//nsmUiFXDU6Or3j4w9rUqGBv0V0aripcCsO0cA8jQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Za5nkhkC+CJRcVtzsr1KhzNcR6BeNUQwL4v64+l/AnYVL+NX2Ilm4u5wAFotA1UmcRgbHnMV/snNfeHHsxRX573cBn0n6t4S5JquIET4GZcB/n+maXJuJukqtBUUwedG1+kwu96BKhNv3eEytqy7UmF1SUwTPAmYfKaigPMWmwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O1kuJgO9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UNZNwN3g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O1kuJgO9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UNZNwN3g"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EBRFKL406579
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oxx/bW4mNl335+EzkTHg/H0Wz6TbPkYRSHy0X1T3ang=; b=O1kuJgO9i9OQohA2
	73QJYaM//CZbx8pcbLJMQWXyQOuVP2zaunVtpI5JAuqclQirjBREbJLxpiJ7MGw1
	YEL/bwQ46NtYJYKXIbCBLS/0EILdPvkcxS3AhWO1Si0apa6tEQF0/MZv+nUTRiTN
	iHAotUq18YREs56xujsvOX38nfx932wS0dMRzMBiPO2i8Tl8OHyvbdKSRHqn9IBp
	jZIGCJKPCAYLXKr39XrvQIDs1b56GqrdJXP8/KYUrdLISII9EiypCjRcKsJsWE6+
	JlUJvJKIpIf0Z8ipW/bo+HuZFeaijIIEl6v7wRIywlXnDxQr2otMVQYQhhs8ri+N
	XpzctQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2kr87h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:48:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93903622880so849837685a.0
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 05:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390107; x=1789994907; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oxx/bW4mNl335+EzkTHg/H0Wz6TbPkYRSHy0X1T3ang=;
        b=UNZNwN3goDVNI2CMq43DHicb4HpY9wSFgPnWa59l41oNZ8IwtYSXRPF+xtLtx/83FN
         IE+2bX8wG6aA6fsi4G8OGE9BaFxWj4t5iWCpxymnTA3GNhfnspEOYH94qEnDkgdl28Mb
         7fssRQeISjTxjBUnl9EYgMBO4wQXGrtcrk6muAutERVlvZ5gQFlHqviUpPMczgGSpRuk
         M/8KS3n7D4iyijIrnbGsSAuwFFnuxiAfQA54nRISQup5j/AnKbNqlzT9tuZOKJMILvjI
         tOrk8DR4KuT3A2drVQT8mu3eq1mQg2Nz6Nip7Mqggoi3PhAnJtHXzRRzdcHbHn5iCFhc
         7yLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390107; x=1789994907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oxx/bW4mNl335+EzkTHg/H0Wz6TbPkYRSHy0X1T3ang=;
        b=o+VwffxcdYNEwWbv01hpRnXYEpAny8Bz5j5dN1eCb/Z1idIYlri6m9bhezROFexxVw
         NuloPnGXXSDCYjhiyR5jffVIJDcoDp6Hw/u0eKFQLIDSMc0iGiCykcxOd4E12Ke/Ddbs
         1oOn/7qcGGr3tvUl5RrEi6YFaYAJG0xkjM5lbdbspS2B5hPZPABG6/+Bjil0PJ+koz0s
         Kc7X7XdHWe61hxG7Dz6Smw6GZH/ZGJe+F6Bg6Bk/UFQ5X+co23vD2rHvUe4mrSpErBOK
         VrN5XsOqbYFUki/r9TNDvJrRCEtj+W0K1xgL/DwhR3Jb3EL8h6OPf1k6R5JsA923naHq
         Wdug==
X-Forwarded-Encrypted: i=1; AKwUvBw34oHxJ6/mGxM29sl2rBjQqjTpf+ltGaZ0bT37Q4zOOIiH7pFBPbrDtxlnus3GxTSLauRLrypQ0Mc=@vger.kernel.org
X-Gm-Message-State: AFuF++lDIpppQW+vILK/xbaPqF2/JE7q1Z9QZfyOetJlmPpPZwmjddLP
	TJ8sfrALrox4mvR/aDm/95M3TVw1HSs1FGG5f3SdIaubR7pPV/iyPoF4FVzzqjv+gIamhnq9rDz
	fP9gEjIng3mW9N7LdD3c66fEG8T7qeQy8NJ4M1rbgHaOMWTTHulFKxunGoOI60vg=
X-Gm-Gg: AYBFou3j5/wDdr0+5gWiihFf2yk9bIcDLdeiVtrS69pSmhcryKbcuBE/0JsCXSNKA6n
	iLwcU2r5ipIvJvqf15E15YbJbU24YALh2tpMsZpouioy92/AAMrYLC8ufIHxCjOBbSLinnUFOKW
	jVpyJg5xprh/OKQWrfbKDB2qiuIEHWhzGPxu6Xyf8SCDp7h8x27AtRmAZ49q59ivZPlzhMyMu8n
	EcGiE0dea1IrCUCjOWeeOjtwr5VgxcYqZpAzNKdi9t95OZ9aAgbSx7ziGNDJ7TD7FD2QxlBLgLA
	Pgq8OXPQwUELgL0lbgHiu0R9ip2f02Ln/wUDORaSfiSwdkkIErcaCwnE/yIXh2C2giop0mumTeH
	H2KTpMDh1
X-Received: by 2002:a05:620a:6287:b0:939:c7dc:8712 with SMTP id af79cd13be357-93a185ceb80mr570990685a.15.1789390106476;
        Mon, 14 Sep 2026 05:48:26 -0700 (PDT)
X-Received: by 2002:a05:620a:6287:b0:939:c7dc:8712 with SMTP id af79cd13be357-93a185ceb80mr570985485a.15.1789390105971;
        Mon, 14 Sep 2026 05:48:25 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:48:24 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:08 +0300
Subject: [PATCH v4 09/52] dt-bindings: clock: qcom: sm8750-gcc: Add CX
 power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-9-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1828;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=A//nsmUiFXDU6Or3j4w9rUqGBv0V0aripcCsO0cA8jQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zUPZ/NeS+CLOYx8z/K2r+Jqoq04fuRqLzPG
 JrcAU5DsMGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs1AAKCRAbX0TJAJUV
 VuBgD/9QrLzdsHp1iDQpesjLiPWWrCDpFvyd1jrgiv47raTH88VxgUzTR+0mtIZV3CPolg+XUcG
 YoswHllGsE5x+HJYb+VGDWg16uqvPVJajZbUw+ia7g5ngk+Q1u5D+EoaZwhluLQfs2hU7rSYG6n
 yJMJCb/xF4X9l7fFkn2VgIxnvC10eI5oIZmFBMeFbjdq/pTQ9+WTImHE6TFy4UAQyg3KXR7v76M
 CKh85HkATHYaf3Dx4hXvSr0EkXzyw8swJnmlyx6PY3STmcV75vbMkhOA4m0BqKgwI5JCVLOvW3v
 38mvU45cnw/egAOVXyE8qON5F5n9FfPB4756ufARwwhgMRkcR3cgqfPtclvBl69Fk1cnHZAOpq9
 HRoon26CtuTz3kzSNNQzOmd4l/EXwjbilXxcig1SVUXHC1hUuJKmYPuWkkidS7x0heY3OCUYl9M
 2eMb03Qe4MghWR7dh/5DtbQf5SaTw7YsQ1V4J5eU3J6x4Yl6IcfRXAWD95NOHVubbNwFdpUx4hw
 sw5RMEtufHlB4g9+OyNGglUYV5T6IAPFzdRYq/+edGIRm58Zc2cMjC6+F7ZNX9rMqUsjuv0oJ95
 A570caLBX2fjL47IIlxWJFYrRrR5YrVAwZKQhGernsNM0Yt2pW2ZOaNXddQktRig0xUM9uwMXi8
 Lud1iLuyy6n9ByQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: x_IWhg6seMNbpUwdBxwZxFj2AT90pezk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX4D0Vs6e/ZtHY
 FgvAs+oghtsUWT4ZvzXSD9d3I/rFiUKYm6LeGUi2lBPCYfwMdM4a0voZozaRORcccL8/MoWa4FP
 3PrqWFF6hmoyY8rDl2RhKt84tEnXV3ah6wRn2Lr+kS6zm2nOxqwi6OBlnFw02HKsoPoJ2VE9bgW
 mhch5wQqZR/7KG+v+Rs+SaU+9w7TAcrx9kmbKLAFKN8myCUP6lqDCWkmHfFiLQVnYvPBoNZhAi2
 QXnm/q/oARdSebgQZG+0CtngI1VWvAIobS1wImy5yUMFHJdwrqzxFc2httaYhhu+01K33ze4cXS
 Lwo8xyXgXo07vOxb/VENQKCITZlh2u2tT+K/bIRLCL6TenI4qKDhQLcvDkSQ/QbeITtCbvQhA1O
 obqfg4Y/sKWM57FV4erO34lpnDsVmjDHhe3KogrWC7w+JC5qcehbvZnuCL60EIoUm/dCIzBXD0q
 CAWVNpRuoF0Uic2QWGg==
X-Proofpoint-GUID: x_IWhg6seMNbpUwdBxwZxFj2AT90pezk
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa7ed1b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=z35zQ5kvS4wbvuCDxioA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX2frtZB+wVoz7
 K7G63C8ltGa/Fsc7INfRs9Mh1Gqh0lvz+KA3CxKwHgkqaihj//x1p4YR2NQ4EufyLxe+oWrdamU
 dRrBt8IADQnKOzOjSOH1SI73YA/aaZw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140182

The GDSCs provided by the SM8750 and Kaanapali GCCs are supplied by the
RPMh CX power domain. Model that parent domain in the GCC binding so the
provider can describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required.
Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh may
undervolt it.

Fixes: 342d2a607450 ("dt-bindings: clock: qcom: Add Kaanapali Global clock controller")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml
index 0114d347b26f..59da3eb2b073 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml
@@ -34,9 +34,14 @@ properties:
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
@@ -47,6 +52,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
       compatible = "qcom,sm8750-gcc";
       reg = <0x00100000 0x001f4200>;
@@ -58,6 +64,7 @@ examples:
                <&ufs_mem_phy 1>,
                <&ufs_mem_phy 2>,
                <&usb_1_qmpphy>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

