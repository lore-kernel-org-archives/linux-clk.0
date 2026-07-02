Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3AB369D4A
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 18:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017192; cv=none; b=kIgKNlj00ycB5svRM6S3ergM9mSXQjvXo/sbQL6xDmQUfjDCPEghUgbb+31SK/xlWg/XEewqHdD9jh2ExnSgpg5103hQYX2a64T2gobcLekIXSKJP1DLKMC0uaHY/lDgO0KOLiNMRRnTGsptyTVypwXr/V9Vm5C67pljD/boEK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017192; c=relaxed/simple;
	bh=f/MBvLSlvOrVtcOCNXoZMzdxKSBrPIpKBpESta4zVZo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VwxV9eSSRo7/nCVwA/Avhhu53Rqt3MvsR9Npe1iyq8nCkI7m+f44Ly/WU4Ec73VbP9zOGZCEpHrVzsuVboWAXKBI6kfOfQYmSDcWKiPDpK4uizecm7nPMByU4PGFyB/vlvX3YGzf9dCtqj+iVaV3HTK2fluqjikeZxq/y2LjVZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SpR4mmMm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eDwnpVpG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SpR4mmMm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eDwnpVpG"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3Ok7516226
	for <linux-clk@vger.kernel.org>; Thu, 2 Jul 2026 18:33:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HuvHWPMyyWNa3Iqhcyt1Ymrb8278ll+uGvKMDjBJNv8=; b=SpR4mmMmmLI5i5oi
	2pg3TvJLaD0htgJ62aD8UjAk4CQNpDTlq++/oJ3hIYFFkUuy1U8QLiLIRzUXFjYo
	3ufOVgdyz1VC3w/UC3/ELTcVGDcSmjVCfJN4yxoyH+l2/C4qa1+sUKKYxahhOu8m
	c5RJUBLLRq+b4V+QQOu7J+HwdLp7OZUPyXnYrOMqSLWZmYmBDFSHSMJ7x/puvobO
	cPms3GkRY7XK7TWWH/pzZOh0LZFG/ehlF7aobDNYYhlb5oBLgT5sSdt07m1NOYNN
	Vf7PWcfJu6FEp74ikUN3lPkVOaH/1OVWZxg8pxTnglMWimvAyhEfnQYKjzlxFZCn
	Zk5dfQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5npra8dg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 18:33:10 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ca5d2474c7so51852035ad.2
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 11:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017190; x=1783621990; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HuvHWPMyyWNa3Iqhcyt1Ymrb8278ll+uGvKMDjBJNv8=;
        b=eDwnpVpGd53zW1SZ5tJCV0yffPZW0U7VyVW0O4OEsgUgJzQ5CrJcMk3M5UcVCeu1Nh
         3mjzdn0JjjhdR1eOUdiLLjiqjGcm0igwhvanqN+LcvF9yAj+8KTWhbrhwxbfRW3gynYs
         +tFyGb8gA5sPNjvm0hfTovz69WUTBVXatIujYvs5qj0hm0yU2WdDq0v9ypVTEjZynFxs
         Z+mPPC4U69/ILlo9xFzNcD/pL84hqLkz7dCT3oB0uBcl7zwAmMLznszm9djkdEq3pe1b
         c0OVa1vm8euq5Md81CBUQ5WeJhz9LWKhOLzIhrYWQtS/H2dJE2X2QKdeHDyhhmEdvIAC
         iRTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017190; x=1783621990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HuvHWPMyyWNa3Iqhcyt1Ymrb8278ll+uGvKMDjBJNv8=;
        b=Swo+istu8xrjFaUMTtihDfZwhDNRE9eW/PVO9Fmi7CYPSjH+fE+poPxkfVQWgwgc1g
         tpvkKT/F+wN5bVNzTvjFdaS80kKI795lbyRLOyBkv4PtS8Yz86fTaaeUx0DA3VhRIIJc
         HmbNg8PKIMSlrU/6kBV99Lh2xUwB/kqyGM01YdwFqGWMOe6xGMD3ljtMInb9jPsUJmNK
         B5Kzu6nBZWLadMXT830wAQ02IArcpkbPLmOCaZgIs7IPZOsAvHGVaVxDg9SQp4lHe3x1
         QZQLJhcq7fXToJng5keYNJXqBHcGOA+MF07EoZnWyW3kfQSdm6lKyQTMuu+ZxCd4CADp
         1wXA==
X-Forwarded-Encrypted: i=1; AHgh+Rrx3pVZuPjnePix2CiGw8ckks0z+PrhYcXSm57bYSpRbZr67dIAAMUgJyY2d4HIB4r281/yGyquO4s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwERkpGdkCLk0x2dxOK7dU6udKh7ab/G0KaLzuZ7lRIIk7BoF0B
	aQdZWT7jIK+WN8n1hiMKBRomFsQ25X1d7T/3GYqM6LWr1XIaU/hSYF/rid7/lZoWnGxc5h+mdcw
	QHkoaOKY2PnXyk3bx9xoytrTRtbfbdNVyt92X/bolQS7k2SrIJBVXR69hb4dgAA4=
X-Gm-Gg: AfdE7cnxRimTqMLpWtvaHssPn49gE0cE2iOwVqfiHDLxrp+QGVbYTxbvd+wlT8SqnUF
	pE9m+N2mzwFiF8N0wfgIOtCLDTS5lH6fLe75bWQ7iBgrTtVmA+OyAEJLG4yuKWQdctgMOARFA5R
	EEgD61yOGYXhJhWnxTF5XFTNvkhBbKvE8TCX1f8X9s6UISRAvfETUcpR6URQOn+jxxoFTqjcK2N
	3Z7dMEQSwlQqCkx1tI0RpFefCngUsbxwPC1P5XGiDTsU8y6W/PnOJji7L6GD34e5DRYglEH9aYq
	b4/ApHlE5jflMjDctaukN+F561xMIWcCaPuT+dMlhMBEr21AeGDIPpIXDUquNLzuD99UzN+Qisf
	/8t4hns+vpKvVlg7gd54DC1+1W05AP3bk0Ogqeh0/gA==
X-Received: by 2002:a17:903:40c9:b0:2ca:5d9a:ecc6 with SMTP id d9443c01a7336-2ca911de617mr65967375ad.28.1783017189830;
        Thu, 02 Jul 2026 11:33:09 -0700 (PDT)
X-Received: by 2002:a17:903:40c9:b0:2ca:5d9a:ecc6 with SMTP id d9443c01a7336-2ca911de617mr65966995ad.28.1783017189353;
        Thu, 02 Jul 2026 11:33:09 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:33:09 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:01:25 +0530
Subject: [PATCH v5 03/19] dt-bindings: clock: qcom,qcm2290-dispcc: Add
 missing power-domains property
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra-dispcc-gpucc-v5-3-cc13826d4d5a@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: eY_UbYk1Ww_KioGFw-oXxzPhzkDkn9DF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfXwhvfkXz8HUJx
 UDxWgBiaZA5woTVog5mFaTzWkGIqDQe3gA5M3Nzx5Cwc/O+dkBgXITooJ1x/1eZ5M7obzkdM2ma
 chlXrzqkfMTT4CiL39iXZif9ngFLiKQ=
X-Authority-Analysis: v=2.4 cv=NsvhtcdJ c=1 sm=1 tr=0 ts=6a46aee6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=0_3QScb3BezPbPigK3gA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: eY_UbYk1Ww_KioGFw-oXxzPhzkDkn9DF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX/o1OpilYDma7
 yj+VP+iXpRm3mk2TCY6pTjUWsf36emACjDgijyT4i42b3qXGg4lWKK9tIhf3V7BiqJG/qXgFOI2
 zVwRkXpTITO1cPmd2RP+yziyNMvP6eL53VGoYfZipyFtAASfYRxFwfw9pm68gMcJled1a1z3S9R
 45cosjzn6Ym6NEPTrq4r0lv2zJJHZVDexlV6L6MJiYz/OPFIQFLf4z02W8D5pMwBOfzh6f9wTrj
 yWlwae36JUlpn+iCfufaCMfIRb7l69eVt0Hj10VjxpznBeTSXqm8eiekg5yF9pBivNLbVtLY98y
 0wadLzKblwIIcgM0bTKshgCth/E4NbWTPNlCKyjmcZEkqmLaiTbRZfdrHYJ0wHMwQwEDL1dIpnX
 Y6z6rD76hsj73svkYC1Oup17e7nkz76zDHs3hdroq420UxUx01KgSdzoJBYHKrAsM6vLvgT3CCX
 Jm765zBIAfr35Z7KZlw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020195

Add the missing power-domains property to associate DISPCC with RPMPD_CX.
This is to ensure the genpd performance state votes on the GDSC to get
propagated to the CX rail and to avoid the rail under-voltage conditions.
This change breaks ABI, as the power-domains property is maked as required.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
index 24f2cce033f6e109b65a79553fba5295eb9adf3a..fe49d7fcbd4985adf340945c4b907758abf7ea10 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
@@ -43,10 +43,15 @@ properties:
       - const: dsi1_phy_pll_out_dsiclk
       - const: sleep_clk
 
+  power-domains:
+    items:
+      - description: CX domain
+
 required:
   - compatible
   - clocks
   - clock-names
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -59,6 +64,7 @@ examples:
     #include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
     #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
     #include <dt-bindings/clock/qcom,rpmcc.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
     clock-controller@5f00000 {
             compatible = "qcom,qcm2290-dispcc";
             reg = <0x5f00000 0x20000>;
@@ -80,6 +86,7 @@ examples:
                           "dsi1_phy_pll_out_byteclk",
                           "dsi1_phy_pll_out_dsiclk",
                           "sleep_clk";
+            power-domains = <&rpmpd RPMPD_VDDCX>;
             #clock-cells = <1>;
             #reset-cells = <1>;
             #power-domain-cells = <1>;

-- 
2.34.1

