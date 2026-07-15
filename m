Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9184657FE
	for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 13:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784122180; cv=none; b=OLuBSjVv2rPGIvQoAdXnxuS5M9q36PmqqdnroTngx8yWq3HYPo4aYTzw0pM5/yr6kxqTk2gAd637WKJGhT0M8gIM3va7vBykZYQ/+CrByTJK7Efef41/n88azouHj4ma/dSQgFZe3FnIXYFRbRmRiwoHuz4MewIINW55p5+l4eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784122180; c=relaxed/simple;
	bh=RG+2NhTeu2iLP7GDKQnZinA0znM+EU9zjm6IEJ0H2G0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ba0lQQeMg0BWtrBG2RRst9oxrwInMa22XbJlUbZw4sMOb0V7F3pY4k0s8b3SIlX9si/3odSTzPlw234OINeXYLIeAEyyVomaBCV3mICpz0T48KBJVnEcpj3gnWhcu1DJN4YVC1MGQUCGN1jn+6Fr6xPTKtghXxM8gvwkvQz2qe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k78hml7b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h4z2SQQy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k78hml7b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h4z2SQQy"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBcv9u3479847
	for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 13:29:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jytwvE4MoycSrSXL8N/TT2deQ9+mZfWatCBgM+WxdVU=; b=k78hml7bv/O8HC8z
	QOhOoVArWpIOSde0mUpi4dYmFM+n4/HcCaKHm4fAizjTHSMDRmIZEtPR38UpIORi
	E02kUjYGRfE55slqc0aYlF3ZYyZ/e9Hc+N1CtsdYv5wErxWD6a2K6v1MZ7CDLVMQ
	bsVSNwlvNpX4JiGWcBdxrR735J+aJLq8hVKw63z5l2TCyE9IbsvvLesnSP00QoF8
	zU6/h4F0UeVg1tlBb36nbTtcW0oi1XAQ9EKGBYActIZu/QZkCzI345DRYHfR7h1x
	R27x84WrhPpSFjfGUYFN5Ij/Zsd91dFS3ZKj7LcC8FLsR3/FWYCUtk/Xmw+3QqqZ
	oDnlbQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9g3tpy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 13:29:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bec738909so46397811cf.1
        for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 06:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784122175; x=1784726975; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jytwvE4MoycSrSXL8N/TT2deQ9+mZfWatCBgM+WxdVU=;
        b=h4z2SQQyta+0SWhCTIO/DzLtj2gH4aIzZTZmRawNYVlb1iv05ksPSu0DK2DqPFrvuu
         ikJYRJadDEHqGh/AzG2ho2GgDvxl/3DKNEUmnYlKuXjU92o6a6IbHqgkVfw3P8OWk9qR
         gfhaVHdaHqp4Ex3IGct11jU8t7EPJvUDNbUzL4iZ9L5RxOWMgeRTQRfhZAsX0ChRxIUQ
         28s69nKSCQ0EwpZNVoSnK9AlNQzoKYDT8jrPzwVOyMK+h22mo1vmTCUrhhvWXIMU/d/y
         rbzt8XKEWgd6e1CimSNapwI7RD8cFZMO0/s6/M6+nTXKbFL9Fi5yUpKn/oCF8oDVcXEm
         D4bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784122175; x=1784726975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jytwvE4MoycSrSXL8N/TT2deQ9+mZfWatCBgM+WxdVU=;
        b=r/TNpyZHC9N2u7WgNJvNfYN21rfqYYaSroI5B7uCcQDcemLRNh9sfj5ZmUrdWTxt7B
         MNrDszXyIBxbV9CNqI0IqDaITNCZe5Gs/gmCHEVZsLkXef1fVb1PS9XYvsCfxLrIX1MO
         bYsl4NxCasIAKcv3gg56t8FAtq36oEwBe9py/tvOsfGnWowsldsbkNtJy88G572P4qQ8
         yHyBTb6YnbqRA+u493VsnoC9gOR89FvLbLTV8539U+lXlWdzyAHHUGLcuwaF7OAC5PhP
         TdsqlidkDe/hL7ikWCvldq1Z75aWHka4Xnn/Tyg8QZVqIINrZZvEIo0YEdZttDqZJo8l
         uAoQ==
X-Forwarded-Encrypted: i=1; AHgh+RpVT3D4B6VYC6eNuj29b1FUxXQBVkNUk8sIpaAJuBbI84PCUBuduxQZqAhrGLk6GnYiN1C94pKHs6I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDYLSNP5xW+XgGktCN0U4/iHVKt6x+bGztzoU4zP+mBnhnCP1H
	eOH7v7GZY4knhfUCa0qYWb76KYUV5z528A9rwizAoppl4McEkiNpC9bfVGt0YWHmmvliHcWP+Ve
	VrwLK2Ne2SqrQpWoRUUsIrI+8RGweGr2KW4iWv76vmt/NH+TgsjLQ+5dCzu5mYL8=
X-Gm-Gg: AfdE7cnFxM1Hb/k5aAj2WQ6N578jMagoifaLecgTB/VjsfisYKf1yUzWoArvk/tRK89
	MdvkPY0Kin4lr5fnJiUTCcdQ+2L1pBOMhBfKVGrIhtGaNSwBFQALLwhtLVNDC0xUZnZC8wpWA5Y
	zuPDVlHlK6wrUmMc4XpfTGdvIkewnHh70qX35mODjQAljU22f5zWXJDqJOmWXbOWlpXsrHG3f8t
	lFrTXGTIPmQcY0gxQlQNpt38KJcwdpkErkip1NPWFhC8jyxtE8pOdJCBF2S0nG+gUTS6cNvwpJ7
	1gshqbXJ24C716d4/EU1BTYm+jfKgdcuWROFH+Ung7ZB57eGtGJup/sqXLSTlpciaLu6zNDhEDe
	LQYQboaY1RNLvRxM=
X-Received: by 2002:a05:622a:13c8:b0:51c:167d:b346 with SMTP id d75a77b69052e-51e4237c4a8mr58335771cf.23.1784122174722;
        Wed, 15 Jul 2026 06:29:34 -0700 (PDT)
X-Received: by 2002:a05:622a:13c8:b0:51c:167d:b346 with SMTP id d75a77b69052e-51e4237c4a8mr58335251cf.23.1784122174104;
        Wed, 15 Jul 2026 06:29:34 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635a9cesm16945760f8f.14.2026.07.15.06.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:29:32 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 16:29:14 +0300
Subject: [PATCH v3 1/3] dt-bindings: clock: qcom: glymur-gcc: Add missing
 CX power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-glymur-fix-gcc-cx-scaling-v3-1-72eb5adad156@oss.qualcomm.com>
References: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
In-Reply-To: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
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
        Abel Vesa <abelvesa@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1929;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=RG+2NhTeu2iLP7GDKQnZinA0znM+EU9zjm6IEJ0H2G0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqV4s0s3bRGOPigrskaJpqSs8szumcn7kNdh5P3
 o4gsx4E0vuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaleLNAAKCRAbX0TJAJUV
 Vi3OEADJML07IVNxB6pIXf3WRfjJjI9Ren3d7ZUMSeFVQbUP1DQA041jplay8jhMmT97HCewTWi
 uG6S/H+fo225Jda0IfI+YRVJRV8Vo17XlBLwcx8fwNJUMCERxicuj/iplPvzMALYZSJhN5O5YyW
 iS884/SI8olEG06i63T1B88hITtgsmOR8n+58fIqyFxyDF6dp6dTb5/47lGieAX4izPRXXKiMTs
 dAGRIwSWHIlySjg9sP68razQBscVil4KBQTX62PHLVWX4E0Gqp4zhISpPffP/rB/6cCUtChc7Js
 IZjmUE+xA7OinayYkAVKOv2pkUmXu5WClGo3H/pcWVbL5NXIZkGo4MG9HdLy7ilRvSvLUGmqu0R
 VBN9SbWvrMp5LarFEV4cVw61HXIG7WW0GklrWF4v+811OaAoXDZw22te1S8UGdEdp3F5S4RFk76
 cs42IopPSB832FdkNpAo7yDaqbivEzhlwzoYJeROYChwpCGOVPE/wG3evraQ3ccWtYxHa753Ets
 ILezYRzyvx236d0C3L0XPaMav+EJNJriuaJcAf2vstBFdZD8SAU25rNlW/WARCHqGQOPAs4C7iw
 WwMLuj2qVYdqWEYc+72C8LyzIrIQhkFc4f5P2e2WEZLLzB8eO713TKelZERqwwwvsCIWf5zKhKZ
 fl3QtlEIozqVBhQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzNCBTYWx0ZWRfX6SbYoBV2Ezwm
 hOkDu9tml0kpoqusfe2htoQMAhp0APy3EJFcWShGeDLOaBHQVxzizimHm+gkK6BUQLGf7BqT0A7
 05SlPgmdIR6J7NeYRvDp4NDWdyYUps4=
X-Proofpoint-ORIG-GUID: EE0JuVdNYogpiqe6Jit0vKhIT1zRq_-m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzNCBTYWx0ZWRfX9fi7J/zRtA6R
 XEL2k4KmJAI3k1MB7++O9kfEZJ2laAiKGR6Adi5d7zjM3G7B09mf4ui42RE/4/PYIZYWmaCmHNj
 knm90fT8FM3hbxi7QdC22FJvS+4XG6xyszoaWAAqKC5udl3XfhJzP9z/2WLOxoU4Olf2nrUFvxf
 vMBAbPqn62PfjOA3lI6wlSiyIczNU2TJicB8QwXiU8XwLEvguItD53iQHTIk8KWurGqXL3xv8Ay
 EaDdt7L09cw9lke7tWlhvsLztN0/aupvtW35ysGeppXeYSmAJSRRVBriT5ZXP382k8iN/76V9MC
 3HQaMIKDQ54U5KR/oeoD39mtKPeP+W7yBiYK9Q8c6VQq8BiWTLE6OkNUGEJwN30LudRc1EpgrdL
 HqyFY55hXzQrLoZ3uhIdD2p3+BNYYY7/g/4HE6Ie2dt+ijAtyaVujGnxIL6lCFtjCbtLtymG2KQ
 fsy9rdSSZ1o/AHbt/6A==
X-Proofpoint-GUID: EE0JuVdNYogpiqe6Jit0vKhIT1zRq_-m
X-Authority-Analysis: v=2.4 cv=VoATxe2n c=1 sm=1 tr=0 ts=6a578b3f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=1VWmMwf-hiIXLgPH03YA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150134

The GDSCs provided by the Glymur GCC are supplied by the RPMh CX power
domain. Model that parent domain in the GCC binding so the provider can
describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required,
matching the hardware description needed by the GCC node.

Fixes: ee2d967030fe ("dt-bindings: clock: qcom: document the Glymur Global Clock Controller")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml
index b05b0e6c4483..7a4054c9f215 100644
--- a/Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml
@@ -65,9 +65,15 @@ properties:
       - description: USB4 PHY 2 pcie pipe clock source
       - description: USB4 PHY 2 Max pipe clock source
 
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
@@ -78,6 +84,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
     clock-controller@100000 {
       compatible = "qcom,glymur-gcc";
       reg = <0x100000 0x1f9000>;
@@ -113,6 +120,7 @@ examples:
                <&usb4_phy_0_pcie_pipe>, <&usb4_phy_0_max_pipe>,
                <&usb4_phy_1_pcie_pipe>, <&usb4_phy_1_max_pipe>,
                <&usb4_phy_2_pcie_pipe>, <&usb4_phy_2_max_pipe>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

