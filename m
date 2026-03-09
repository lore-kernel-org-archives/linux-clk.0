Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566C63ACF17
	for <linux-clk@vger.kernel.org>; Mon,  9 Mar 2026 12:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773058120; cv=none; b=SoPKEaBlqrEQOnd3v55fZ42fYW5VKkfBcfdt/iiANtI4/vB3ngCkxdg6wPcQ5fMn5SpRmp1dGg29r6FKndYtJLUrbbyC2qWy8VH7hVtDJmiKnPl1MvA/jgir0FZGKfjJadX7w9f9h0iYiw2CjDMNma0rRe03CszEdK6qkalkSS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773058120; c=relaxed/simple;
	bh=s0Gpr12lLOiMsyPdqj+nFCdGy5NxwGSWZglbiqC3uu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c2JnenP3qj9ZHWsZmWr3apo5HkLRwZdx4zB6vdvfQgWklcAGHr0G6rjSvVFo57Ug0IlIEbCgLbu+2esTUJoHjocSCjcKMs2jDjxJQ0LlpNCHkLm+DoyXExG5soXLXuBVmshepMlB2mV34zHnuQeV5w0foJZQ2RGbZWGxEDma3cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XmNDQxhZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N3M89+y1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XmNDQxhZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N3M89+y1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6298A4Ht2661676
	for <linux-clk@vger.kernel.org>; Mon, 9 Mar 2026 12:08:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OIycdCMVAHFm2LvzFmzNFCXgiMKffLWzH9oKhlVRQUA=; b=XmNDQxhZ0X1qhYj1
	zpRF47+MmyiyPIQwAlbXzz8VIaHswZlNoKD01NdSSka3eRPRrfN6rVhktnBFAQZq
	SZM3ALQMsaftPqD9U2glqbhiCu2/Wyj5FGgDgV2K5A8WS4zzgD7fGuQ//XCxAe0u
	1bNAOyG4JEl8TiAAIN4o/hrI5k0NpjcfqcIdqTqZKsifRZah4H4cmrjmT3wqQlnn
	joRVIGPEuIfCcq5EKBctyX3cJqiyco2kyiBzFQF4CCDkHo4OQfQe6dDqK5HdP9c4
	Q57SKsa++H3d3/psw33+WkY2khiCq9E+CcUz65TVfnoagPdTSRJzXo1RfeeuYC0D
	pxlD6Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9cpnkp9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 12:08:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd722c1a69so1337085685a.0
        for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 05:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773058117; x=1773662917; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OIycdCMVAHFm2LvzFmzNFCXgiMKffLWzH9oKhlVRQUA=;
        b=N3M89+y1xzfRdGUzi10iFqePkpcmqDgyGcceAh+CUKIOg9rXJbLzF7s2Kn4Vf7n0ZQ
         oP3oqx1xTR6upneWl6ekfMvS9gFalqBg8wXGUM64eqbzpvxuqpXNufcrWQI0tXqapGn0
         6erlZsvyAa49cIDWvTwn/FPGE3byK+9YPpy3sUm/PsfruTIzKtuhKBtEzEZvvVxGUqx0
         0ZaapAkEq37eM2P64sHVvXCwYzD0Ep9HX2jcEVEM+QnR2Du5W7jeiE4mxyqQH56XL9Mr
         OtdaYsouzimGiRKJvLvhVNGXlQLbnhoXwwYmmpbxz25TcMNYIavKEc0eQWdFpE8WV81d
         1/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773058117; x=1773662917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OIycdCMVAHFm2LvzFmzNFCXgiMKffLWzH9oKhlVRQUA=;
        b=vy6q6zupNO2y7Lzu4elwjcXOgaqpne46uGjhP+yh0wSuHOtptY5SX1yKo99fuYM3Jb
         eCqq9BHCuGOmuhi9gapYEDAyDX/gpnSHytKnx4Rb36s+EbuQoZ41be1YIOiKUQ5CbnlI
         QALaB3Kf6lbhDd3eyUirPC1CBWPs6m5vDdem87btsxsuAG2bM1kvdFPbtyNW25a7ak/G
         kh86RANUg0toapcR5CciwCEAJBNgKPoiaaLCy7JKeHGolh9NiqymJ6/qvfVqPM+ixsTh
         vj5gwbz7mBpNJVsFogSJ2IbQ3lhlkMJC8QNZJg/eisajPgMFpZHgnYHmCh9PBAtCviRq
         LgKw==
X-Forwarded-Encrypted: i=1; AJvYcCXxXVrt6NLiqkHd7BNF3b9rlaJRxWsGf2rq5O5w3vpYiGhE/zMGGo5DCIRDrOEHYMp9ZU2WeVCm0X8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkov8hDPNDdlGzorZaYC8/WmfOL2M7AHBwRYRFdLe+0sfJ5q/h
	R/HrRfpEXNMmADqXBfDMt5kOhTflitocVdteM7pJ+h4X6kARJYVGfkzdi9A3yfT26NGnTjjHjR0
	V5ueTfjh3sGEtY38z+AsXnaIAHkRSERF78NP8Yvbis27JDEUB1pd/Mic1PjzKZivb76xtKa8=
X-Gm-Gg: ATEYQzxFaaILm60PFW4jER9mmvTHQPkLFasLpO7/NZ/O83N+fW/u9fx3kilpNUy+/4R
	wKR4spulTm2YhYFJdG1kCv/33ApzQDp2uPsLZS9jpMt42pGTUn6IGsESm34YliUuS5FwFQ04Hk5
	CoQdTUbotuVhVQcvalifSPsawyaUsUAjS9UhLDy5djj6JxJAJhI6CquNXdJCB0/4OP8n/91P6FY
	XILQc+zn9A4qCiG2Er7iycKvCQUDMxALF+iB49RzY8K6brWwcQHBQCrzxU0tEfc6/UHUMLa+4fd
	2h2+0x1hjvcOwlJ6hvSptC3Ztb+8Yv6rK8eJ6hiqziEN8HNwTFl4Tiil3RzxuyL3B6DDRDCs/Gf
	/WIn6O/G+JLre8c4lycvMPDqdIJX8EQ==
X-Received: by 2002:a05:620a:112b:b0:8cd:7dfc:ce63 with SMTP id af79cd13be357-8cd7dfcd002mr601169085a.47.1773058117085;
        Mon, 09 Mar 2026 05:08:37 -0700 (PDT)
X-Received: by 2002:a05:620a:112b:b0:8cd:7dfc:ce63 with SMTP id af79cd13be357-8cd7dfcd002mr601165285a.47.1773058116517;
        Mon, 09 Mar 2026 05:08:36 -0700 (PDT)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4853916624dsm107826075e9.6.2026.03.09.05.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 05:08:35 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 14:08:16 +0200
Subject: [PATCH v2 1/3] dt-bindings: clock: qcom: glymur-gcc: Add missing
 CX power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-glymur-fix-gcc-cx-scaling-v2-1-d7a58a0a9ecb@oss.qualcomm.com>
References: <20260309-glymur-fix-gcc-cx-scaling-v2-0-d7a58a0a9ecb@oss.qualcomm.com>
In-Reply-To: <20260309-glymur-fix-gcc-cx-scaling-v2-0-d7a58a0a9ecb@oss.qualcomm.com>
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
        Abel Vesa <abelvesa@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2009;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=s0Gpr12lLOiMsyPdqj+nFCdGy5NxwGSWZglbiqC3uu4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBprrg6+cp9bXUCSPOuwfVxuUZQhhHmxRHZo3ccM
 iTp4Ysd6TuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaa64OgAKCRAbX0TJAJUV
 VoDSEACnyD6DWhAni52yGYdvAhELJv62fTzM42Xw/i52qRUbRaFXbjhinkDI5+o7oZ8nrC6MPse
 DpZ6IquO2/FSQYMN51rKhhPmABuWNE/XJRopBnBBOPR6KHUiUX9fWTEbv06s7dspYUFop4JDGh+
 HcLiu0cSXkr1fhqP8bS5d5ptBk4eovOj2AYfMXBjzi5rSnDKRVCVl/aMU2Dl79CxkN9yw5i6nwD
 GYy7ala3rksFIU0p2XfQwcwPcMgnr5zGjWa7EdU/oMIg0L0pB9O9e5SQxijfU4qWX2j5SGBMVbl
 dLiMbG1Z6nPLoMbOJo1eGsXpgxwh0pj4l9tAbl5OqEtRPFLvtIvHpPT7KC/KqES89TZSmr5c17K
 OgLWJRUPNZUF2V6s1LPaTFa7yZ38fGbgysI1dt4Tn0g/E5gJ3rkoXgYO4wrPywCDswFB6Sf6O+9
 kHyjTRT1AuF5R7ZBbbli1pC4LvsuSCaYBn3mpZjr1AY9lFsOByQxpAWX4Bj730HxvwaZw0Hn6ss
 sk+JYQv8B1lzPcnbQ1lvaiUywwCyb90UQfRsqqroRXcMZELSOIjqvq9FV3EXFXBfROsswAunA2w
 mRpt9A9mDFNH79MyTlVpurDErN2OVcpWMKb6dv6Bs8EAhLM65dRLs/RwDBkpbIwzz56UrMBlaUB
 /phihe6f1eVoAQw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDExMSBTYWx0ZWRfXxvPHegUrEThD
 znukHOYwhfCErDjKznMVMb99byv3JpcvpLRgltC4KuEjGF1Qec+3/lYg2Y5DC994TJVt1uicwHL
 2cukX1ojHeKzDPWSG5+I3x6hzzv85yC9U2GrfGC1ZhVZR3iEMkjQaY7pg3dVKe4WqDscdXlCV1X
 Om1q3lDAIvgf19kPM0WW4mjOCBVou58HbFjhF0AUjjYoTbuSlS0pNe8/VpWbHLRcvBGvw1XPSNf
 D46ZOFWqWmCz9ybusM95I8a6EqDmCsuLZiaPLvqoL4OFlgsVE4K885YZny77Lv+mPcdJqEusvNx
 yasIsjU2WpprKxCN2BSQevmmfiLym+mrycM0zUHFpN9IMvcieMxptkKbXo1aaxpThwODV0CqE6O
 qsBTLiTyvv5dyPUqCb+wVfRnuv/nruXSXPw3Zkxd0MNjl9WwUfCiN0mw215Sick5eKlWSacUTgW
 YU633QN5BM4w25O6pzQ==
X-Proofpoint-ORIG-GUID: 8UvF6fkkoPYZVnctWxAeoCryqdXjaDor
X-Proofpoint-GUID: 8UvF6fkkoPYZVnctWxAeoCryqdXjaDor
X-Authority-Analysis: v=2.4 cv=e7sLiKp/ c=1 sm=1 tr=0 ts=69aeb846 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=FB_zh4ukohLvxuHn9zUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090111

It has been concluded off-list that the Global Clock Controller needs to
scale the RPMh CX power domain, otherwise some of the subsystems might
crash or be unstable. So adding the RPMh CX power domain to the clock
controller which will result in all GDSCs being parented by CX. This way,
the vote from the consumers of each GDSC will trickle all the way to CX.

So document the power domain.

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
2.48.1

