Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD8338B7D4
	for <linux-clk@vger.kernel.org>; Mon,  9 Mar 2026 10:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773050801; cv=none; b=kLR2rN04jL1T0wTqjlMfCj4jWrEW2nkjwRw/u/zHvUjRjme0cJJcsmEz5Zol4iYTCGCaWHrVI/KOtQaDdsFpGPrZoajTMJLOvouJYqKExhQQLDB+6dnIeL6hSKapxPe6mNHh5KdAGoEW1dXrzlpT/pa8rw09V/XBFxnsEv7QWok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773050801; c=relaxed/simple;
	bh=nWhNAPhfiOzBhVrNTMsZDmJQ38A9ALefiGQc05qmPak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aFlDJ2vsplnbJprTCK0x/+BLLaF404NiGlmqWkKTc7nHgcB0bBqIywnr1T4QEt8y+L/PE12JmVBuWBeaAme5WImigMaEbfg3Jk6kX+2RVjSq4byh8K0AwfZWIKF9/keJ7shcyLW8Pnznc3oX869viWpC4nb1r9IctWSZtu8+wc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HTrRkJpj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BKRd79Si; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HTrRkJpj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BKRd79Si"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6297mTd42798716
	for <linux-clk@vger.kernel.org>; Mon, 9 Mar 2026 10:06:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xlrs/nciaVZP/N4VHCfQ2zHYFEeBVdKNE/nyGQcIbPE=; b=HTrRkJpjy8a+gv/O
	jzFiQmTjRqlaDBSDVK4YWjugGDxLEwgauzKtm6xyNgnByc12N7jovu6g26/00Pxl
	xLDx8WpFHHJLNOr3GjY7mMh41gcsZ4UKi6pCeopfDww4pOr06Ac0LL2+BSIMRfWy
	Z14bzoS1FqZrEyAff+JAfB2YxJ2cjxtSLR7KWoqe67rmqrzEx4bHMDW7/ss9kYzf
	mRWXPaVfbueYZrd+F6DbIWKIkMx2+778YL7CHYD2l42OXL+IfvMrUI1J+ygvn6jZ
	wOVNwjQoeAsO9MZfwx9BLuHnag34yUIR1jzppCcvNopD838IkWO8p6DE1FwlgN50
	eB4U3g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9qew8ut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 10:06:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd858e8709so922042285a.3
        for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 03:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773050799; x=1773655599; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xlrs/nciaVZP/N4VHCfQ2zHYFEeBVdKNE/nyGQcIbPE=;
        b=BKRd79SiLIuLF85cplsQrLGS59DYnnm/jnph18bWzWEzEfYKzg70g/B7PYTZD1jzSM
         cfoTeqqUs7p4Lu5Q95BHwAz1FkZAGb8vvVXhdCLyN5pOnHpXfwYJbheVh4Xvv+SGl4Jf
         tFO+ggbq99Q/jiB8cu/1bN0wNsfP+5KIHoIXlRKl+W8D6fxo+CNhgv1dBRszujISL+4u
         M2VXLeKUbegm2h9+rrPm1pU6/dF0JbqK6MOyDbQoEZTzUXAkiPgdeVKPRHLbwMhraEtE
         oA/M+EltKbnqkU+bZyGaD8FtNdQ4HUFI5SJNduolf/lGKyeWCGHhyY1HRz9AnCZ7Pu3B
         yNJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773050799; x=1773655599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xlrs/nciaVZP/N4VHCfQ2zHYFEeBVdKNE/nyGQcIbPE=;
        b=ZQvHWz1pXZy0o7GQDfU/L2es+BLIdjIcnXvlXgVWxSt5fP4GHU3tJIlmSsE6LejPUF
         FDc4BS6i0V7Qhn9jABO9SDWfaLTwRqRE4YQVC/cU5wWLZFE3OUbEv6sFxKfE3xWmt7s+
         Bue3eMqqxiqCsAgDevc4wgF6uJ8c29TpPH1N2VABvyiQLjG+umBLTZcjBL8h0xUdUsC/
         Viuf7M5JY1H+5Sx4xy0qGfZ+fFXg+9KWEvPqfu5Asp1CR69H/+5R4RigB4w+rvXEUqYb
         IXqE8uFlmdI8WlUtbOgoOntay/l0FTbaC26qJTAQ9jHmmsxwJK2vTooRBC+EoG0fOMeu
         M79A==
X-Forwarded-Encrypted: i=1; AJvYcCXqgQcsrl4326wVM4krntKshkHTBr82uMZXShc5zStrRrLVA0LLWnKQCjlMo5H6s0D+haMh4YMwLsA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp3EfGV5y86jNH9bOtQ4KJrz3MUXByZ/aXlv5qxWQgknUw9jOh
	BXBe4c25kzwNW+JjAZtH4T17hfrwZ5JPGp6hdJX+hKQWPlXaFr5Pi0Z0MYFf0gdkE/ybwa3mVkB
	IPQSBZe5+nfJBqGQzPl0VjvMASH/DRsaytKu6wC+FYUEpioYDnFn8/5GR2jWpI14=
X-Gm-Gg: ATEYQzwdWk8R+D6iaznI/mLYN7m7Jgj7AN41Dd+XiVaw95YDKCJbBZrZxQ83Jg4XpSQ
	0zOTAzU8Uz9JqyX5vGtmlxJrXHKfHhFgGBHfc87rLDLY/i7yFtmwctbE1fb6IM6x174Yi1Jynzw
	eyNGnz29CiETv7YUdwBs0k0I/uL3+78bIoYnP/dgkI9GetG7yhjGMYkjVk3GC3QtgbhTcxTUzpp
	VnniLi4RoJdw/T7Z06iOUaot1iNOj1KbnL2FpbKBF2qGHd9aG9HBqKtdcHmjq0Ld3gWruRXP+vv
	Fa4Fu9IRNVGI4w3YWT9BeV9ZjR6N/j/YAEAmH3OFVms3ZDlR7gs7JzzwRY6ZBT7o6DzQtskrquT
	d9ehOjRcY2tXU+LmOqaSTg2HblhSZgQ==
X-Received: by 2002:a05:620a:4407:b0:8cd:8f66:c9c9 with SMTP id af79cd13be357-8cd8f66cdb2mr78104285a.64.1773050798642;
        Mon, 09 Mar 2026 03:06:38 -0700 (PDT)
X-Received: by 2002:a05:620a:4407:b0:8cd:8f66:c9c9 with SMTP id af79cd13be357-8cd8f66cdb2mr78100785a.64.1773050798095;
        Mon, 09 Mar 2026 03:06:38 -0700 (PDT)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d973sm24114052f8f.3.2026.03.09.03.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 03:06:37 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 12:06:17 +0200
Subject: [PATCH 1/3] dt-bindings: clock: qcom: glymur-gcc: Add missing CX
 power domain and required opp
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-glymur-fix-gcc-cx-scaling-v1-1-f682c82f116f@oss.qualcomm.com>
References: <20260309-glymur-fix-gcc-cx-scaling-v1-0-f682c82f116f@oss.qualcomm.com>
In-Reply-To: <20260309-glymur-fix-gcc-cx-scaling-v1-0-f682c82f116f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2225;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=nWhNAPhfiOzBhVrNTMsZDmJQ38A9ALefiGQc05qmPak=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBprpul8X6ADnOIlMirBe53WkxfduJBrSPaGOc1I
 Uc+HvcZg12JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaa6bpQAKCRAbX0TJAJUV
 VvlSD/wIfH2EUpN8I73NVh5JgdghJIrCG9x1GOASVFanrTgfYEPW8su8hNlOfTsHmBuiBLL2US3
 p/Q2uqG8a1U2aok042tunLUiwSn7tWZCTY+6zImZf8O5T+ebfaKRYx1cuxnkHNCmAci0CDRQcqZ
 pL31Pqprhk6oZwFPy9fBkSo4xnSG5B3OUTqn+Z6/x6cy14VZYysWeSwsAgQGBaNsx9SnKsFuMG8
 JuJshsTNE8sZVzZUjEdcQmcf7Iao2xeoUTNBcTy+iKH8bNLzFiDy67WUtNt9vwg5hz9/mtH/S11
 t6jtN2AkqM7VafeCZ20UfT/kc5gWg/r/kVDn0h5gsquGe6kSW3YOnFIGxOMhCsCBLfetXryAetA
 Zcu8rDSuQ5KFco7JPfj1/nq8IQoPFlqDQy7+RCuBqxpcgI73i1dRrav+96E+S3WuO6QNEcvcixs
 W7qU9g9qatfSribnF3ujnelJzbzxZaQSSfpJsXmATFOU6JHVRKLTJBhB6Bd+ZMAHRO1W6bdJKWX
 6cETndEQvWAOmVwbchx+hJTMfHEiZnAC3IYnjx3eLQAQpuXEBp2IgiTv6CuTtqAUejVB6O3iUF4
 adRec8jcFm4J6pGPLhBY/6m7LdUK7GUeNuYHCTH0xakmt4MT6fMwmybTx5sqZzTCTCGLqCZDQid
 rr2Rovwcjhc5mlQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: gWSRg3abKXpJ9tvVNSDFmxN2j7ucC0Tj
X-Proofpoint-GUID: gWSRg3abKXpJ9tvVNSDFmxN2j7ucC0Tj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA5MyBTYWx0ZWRfX8Z0gMkEyQeA7
 30t97yQCH4Jd6BspGuQBjrsrH2uDwS65rYu2fqM93PtxPWE7Q1akTQFB7cEZ+VijyOfI4JSdqRe
 HgRWr+EBB34QFhZeijk/7x1F/d4v07Yci76MUl8WQRPUeaSLJEiqiCOY9u20RdDVqdrkV870zeP
 9Ms9dGotfOIGTOmi/O4M4X6oW1A5h/Fj8rLKIEbH0vulaT5erhKkOjKFW2L215/nNUAz4SlqOzb
 AAhPjxYj5bBZTfxfWgNb1YyTD73S6xzfcLDtalviJMhxN3o8CLuzOAR9+/bx70iy6ON0gQ4DxJg
 Xz/fwcHd0h/aHyaRfALRUGu0UobSypGB0FnsM/0xFAZ3bOb89dfV2B4knx8GR6Kz5VRAOHuvQ/U
 zCCoJK8fcryPmNSyZ/+q7JV1JhOWdAVw+buw+C67ePCCxqieHmre63q3AE98zJVUXNIps4r2Vs9
 g/1U81/bQLljQuHX+iQ==
X-Authority-Analysis: v=2.4 cv=dcqNHHXe c=1 sm=1 tr=0 ts=69ae9baf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=LvnajV2DHpQ1gAc7Ay4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090093

It has been concluded off-list that the Global Clock Controller needs to
scale the RPMh CX power domain, otherwise some of the subsystems might
crash or be unstable. So adding the RPMh CX power domain to the clock
controller which will result in all GDSCs being parented by CX. This way,
the vote from the consumers of each GDSC will trickle all the way to CX.

So document the power domain and the required opp to that end.

Fixes: ee2d967030fe ("dt-bindings: clock: qcom: document the Glymur Global Clock Controller")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,glymur-gcc.yaml         | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml
index b05b0e6c4483..94a911855776 100644
--- a/Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml
@@ -65,9 +65,20 @@ properties:
       - description: USB4 PHY 2 pcie pipe clock source
       - description: USB4 PHY 2 Max pipe clock source
 
+  power-domains:
+    description:
+      A phandle and PM domain specifier for the CX power domain.
+    maxItems: 1
+
+  required-opps:
+    description:
+      A phandle to an OPP node describing required CX performance point.
+    maxItems: 1
+
 required:
   - compatible
   - clocks
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -78,6 +89,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
     clock-controller@100000 {
       compatible = "qcom,glymur-gcc";
       reg = <0x100000 0x1f9000>;
@@ -113,6 +125,8 @@ examples:
                <&usb4_phy_0_pcie_pipe>, <&usb4_phy_0_max_pipe>,
                <&usb4_phy_1_pcie_pipe>, <&usb4_phy_1_max_pipe>,
                <&usb4_phy_2_pcie_pipe>, <&usb4_phy_2_max_pipe>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
+      required-opps = <&rpmhpd_opp_nom>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.48.1

