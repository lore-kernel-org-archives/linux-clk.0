Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEFE367297
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 18:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017276; cv=none; b=ZTSrGynGRcj1iPilk8p11rxckEPw+VyvWdjY1TjOQ8jUc5vyK4QfQZ+Rhcp+aNYjOHgjhMSQK5c1OrK3xCWMmUv4O23NNUZKbDTg2w242wsftUyy5Yi7khnh0YPH0RWByc1C+k/TtoruAWhLZLk1Ezs64j34v7AvJmYTBiP5q/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017276; c=relaxed/simple;
	bh=vEZCAk9bX58jYAl+/vm7G2IzcvyJQv724sGua82/GL8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kn9dib0IHC/7WpS84rfPNGQHor1GUrWDKjoM98zZx+gV3b47IHam7Cn2nhiUs+QeMRXkigBCyNKnAR+OXIRUp43dJz21x9c44RwMiz5Ku81G8nEUMaxP3NY+pEhOz5Kkfx2FrH7bU5Nc0aYTlLMs4l4cdwDF+D9Vsg/6Z5SwinM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kH/LVAXN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z694M0/Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kH/LVAXN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z694M0/Z"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3JEP661900
	for <linux-clk@vger.kernel.org>; Thu, 2 Jul 2026 18:34:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	INxEC9lkQk8WXwhSmUHbixXVYFbQZX7AQC+fRCLBU1Y=; b=kH/LVAXN8uwmEPzx
	0i0s3Crsm+jNbPl7M2PjPVPV5GFLa6IvAvMvSnoBPi+4xydboQHQc72cLyhLwzhp
	49tlfJGzDYL2ViY0zJDC733Zm9pjEAc5BeXEWn9mMyxKpqRBET3jGi6oYs9LD658
	7nFXvIm2WKz4/rdJC3dsA4AFvzlVTLzNwYr5JQtLv6WSyMhHhT2Gs8pYv6bMK2gu
	dMCw8s/K7RZ4otbiZ4QA7ySJZIFUX9lYRqj4prDHvuCrsxNO6NEz87eCZtkGrLFK
	4mtNdH9dhy1EHIz9DSJZ/hNki7Wq3RiXMi2o4raeN+AUihNLSUWiwdPgF/DzlWfl
	H55faA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qnp9pg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 18:34:34 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c890bac374eso2900310a12.1
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 11:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017273; x=1783622073; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=INxEC9lkQk8WXwhSmUHbixXVYFbQZX7AQC+fRCLBU1Y=;
        b=Z694M0/Z6+pBVaLOnyX6jO7ZZX/CSxIKQRhMO6VN6AJ5+eB0aNn59UBCz9S24AcaHG
         eFq2CPLNVBjpPMZGOZ2oObAGwfsc2POWTCtkfXsZ9gVru8Y2EqQl7XyhZxYgsmkgzzoE
         2eO/HcDp16HgDJnemabSnqvXND5/oGNuuvEgmBlpnbwmjpjSHGQLTEAOtt9xuqTAj70s
         nhZ3nnhPy4+ofwrAeIuPZsgkKw/qlLH95nWOMFzIt7/yLEvgy+2K3nHCZJlwlS9DsNwh
         8N8CGLko69z84qRkJtgYF9jClDJM+sG5/PCdLcWyQ2fIIPZGCUBTeniYmWeWtvbC5Kfi
         Jxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017273; x=1783622073;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=INxEC9lkQk8WXwhSmUHbixXVYFbQZX7AQC+fRCLBU1Y=;
        b=HcoFDv7l5aiBZdA1bvAozXiug8JzbXg/WRH/rQFR8Uk6yh5bAt8sARI/xxsEO5vARI
         E39xC2kyBOe89NYZGdPKICtRm+IX9+RMWK91jOjOkYoycTU5JkRXG1am/25GEa1W7mMK
         B8RiCqcJWcJ+pWadTonthyhIhFRup/0liee0GuMc26cM7SVH0k1R6VyheZCF4fq/88/P
         iyOZIvBZCsNBoKpD55rQOlSAInB0/vmF1hhGgJX4CH/Bfv2DCIl1SVzgWicNH+CgWZNz
         eUmllW6BilH7Zh//XdDNy4ekwydYmrv1uSRuQwC+ZLqYurE1+LtU9LES/J1ACiJbKsA3
         09Bg==
X-Forwarded-Encrypted: i=1; AFNElJ9A0i9gnIqDG/SH3iXWbiE73LVXmA8jlSqhXX+3YQkCCYpRqgyN+pkbG1S11k5+BlWP6CLkWQ4y9Yw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw9LFYRclUx8nIg1VvfwE6M7BQ6fZXwWQYlbVwWVycv+oZm+y2
	bqKO3P70Qn6kTGX3i14yWb84idyRooVFCPhohUXzwqHMMIltmCpeBMb45BE51uzDpzTXFKJdIib
	mA3z8tCHCM8++2s34P/71LYOMxCgcMAiSRoVNefM/BR6IJnCkQ58rhzlFNaUno64=
X-Gm-Gg: AfdE7ckte/irfq7FjTWkORYk0mD23Xs0f9clCWnflsPAdYLE+1iZeQly+BzLGugGwEW
	uV9hRtvyGnm4bWopf/SZt/fqW+MDbc1+1W3y1Ntg+PTsar4e9TlfHIbpH2XXkMLB6nd3tBcysAg
	60V2XBUeX28jYivokcijIlBVNDz/xl1IXXreDEvx5bv2H61RdgHayb6+KmMp4rUeSFnpJPRKrzx
	Skn9gvkkqazxL40NX0537bSlNee/5FKH94hKGTeEvcdBpcJXeUxNKeecrFkJ5SNg5HcK9QSMtr2
	qBrhMPbBHr4i9z3A+V49nC0XJWCd04IHFR+jt3TFmRH6vf/R8h8R41LSFGEn16rSZnJ32uUY2O0
	COWlDzK+sLSBfZChSQZb6mwdP3OHyRRgIRLMBG0p/SA==
X-Received: by 2002:a05:6300:4049:b0:3b4:84c5:45c8 with SMTP id adf61e73a8af0-3bfed236e9dmr8276171637.24.1783017273214;
        Thu, 02 Jul 2026 11:34:33 -0700 (PDT)
X-Received: by 2002:a05:6300:4049:b0:3b4:84c5:45c8 with SMTP id adf61e73a8af0-3bfed236e9dmr8276139637.24.1783017272767;
        Thu, 02 Jul 2026 11:34:32 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:34:32 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:01:39 +0530
Subject: [PATCH v5 17/19] arm64: dts: qcom: agatti: Add DSI1 PHY and sleep
 clocks to DISPCC node
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra-dispcc-gpucc-v5-17-cc13826d4d5a@oss.qualcomm.com>
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
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX8xRm/AaSiA91
 FQcCjzksAncBJTodevmNBZs5OrCm/BNzuZd5vJIOo+GDyXvN/tp8xjYELMDZZQUWbO1mkGG9SUp
 8Wl81TUFp+qNnXuxHxDybN7sdP+6DQA=
X-Authority-Analysis: v=2.4 cv=FoI1OWrq c=1 sm=1 tr=0 ts=6a46af3a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Gd0QNvzNEKi-DX6Kg7cA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX/n5xxIzW56OW
 +HMb+WL8fBgLRR5jKdA6pC2EYSIN8Y03/dcuWTTB03eG2hY9c+GToLFRhrlfQBARxVq+ap9XJRY
 LqkeTKR7UGFbHnGl3NmWVIpPPfr91VUPe39wQ5RGHH95n9DoBS2CgC5y+WtHCUIkwcOr6PgsWwI
 nnT86O23kMkWuXNQUhRnWUpqdzH6eSwMSNtd9K0Xv+hznMtOA5YWWfcFpd4DoxUQn99oMioXxsQ
 BlT39kK7AfZjeH8uevITFdzk8DN0ViiLOFOjvSgsn0hcBLSl1HYXQlWXlaXN4aI1+ioT+nUO/fe
 C66dci2MB9hIdKDMhwSuHqHa5/EyN3thhrQ8LhfANnusmLDb8jEFS59IW+V1eU2RYIMJbMDSs+j
 dI5lP/V3tVLsjFYWLyzydeXZQMopqKTC4pj8S5O8SLxS1UHVpgOE3HZWuicmLN2jBiaE342UfQ2
 8CLL98+9cusFZIfZACg==
X-Proofpoint-ORIG-GUID: ua7PgkJ5LN4WdSGiguGUFZ-9F1Vt_YvZ
X-Proofpoint-GUID: ua7PgkJ5LN4WdSGiguGUFZ-9F1Vt_YvZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607020195

Update the DISPCC node on QCM2290 (Agatti) to align with the latest DT
bindings changes, which adds support for the DSI1 PHY and sleep clocks.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index f0b6ae9b81528a848a75f6884f1b27137d780f07..f1d93f86d0a62a813f76580362e850ab847e51eb 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -2190,13 +2190,19 @@ dispcc: clock-controller@5f00000 {
 				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
 				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
 				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
-				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
+				 <0>,
+				 <0>,
+				 <&sleep_clk>;
 			clock-names = "bi_tcxo",
 				      "bi_tcxo_ao",
 				      "gcc_disp_gpll0_clk_src",
 				      "gcc_disp_gpll0_div_clk_src",
 				      "dsi0_phy_pll_out_byteclk",
-				      "dsi0_phy_pll_out_dsiclk";
+				      "dsi0_phy_pll_out_dsiclk",
+				      "dsi1_phy_pll_out_byteclk",
+				      "dsi1_phy_pll_out_dsiclk",
+				      "sleep_clk";
 			#power-domain-cells = <1>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;

-- 
2.34.1

