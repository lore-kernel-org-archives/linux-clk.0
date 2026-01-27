Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D55C36E469
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 19:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769542038; cv=none; b=kdpYizZ5rMnVth2c/CUQQuIC8XDuLJgycbb4fwmNjVmKxCoaU2huIT5PZesEnH1PSjAsEWIX++hLp88Egd4zvhWTF0NXZrBK8H35ZW80D3yUEc0Ucd9GHsjNmhk4A52Vr8yrPM8uWmFIwfSJCX8GGOcwtZvREtN3Aoe/xOsh4d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769542038; c=relaxed/simple;
	bh=vSZFJNlN6qqaATMmPhFNfzELRBaXsIenPjZTaoKki80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ViBxikb2L2lZkv4qmwbuzvSjm0sfEr5jM320ixUUPFppxsrXhQdcGwer3iFIpHBlKtDSc0eJz0deZdfnwIjeaEe7WOL9/pcTw0uHy4CPfC22peSIA0H6kAm1An7zgEmIS1Qj4FvuOAi6e0SgJxKuf4gvPXYKwOjC78MGynQ629o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UVrlzJXQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sm/DDENu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UVrlzJXQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sm/DDENu"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RFwxXE1714606
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 19:27:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tuv2CM/Pv8ftgiZOhxmVb0LJSvxTt50odthKY0Xr490=; b=UVrlzJXQzAgUlDJK
	xhxwqzxd8b2vTUUdUeP8cu7xHT+iH9082e5o6zSLub1xqhdu3497ay4J0VIs+4R0
	allnpY6DYHHbDOuIi2ApZX55MvOsQ8YOKWJ0PGfeDldyd7Z5cheSR45pqZytRmkL
	pdNqy7kWi0s6kMw1hQQU9BNeXjQhzsXwDX0W6SDoslHiqtyO1g0BY6myT+KCAXmc
	Iim7zrT9w5PLMHWIlr5Xohknl4l+03emDolUeAYRMQCOyzibz0SNbITezrIgmZaW
	8IHXP7Kqg1BE3et9Dwndy0H5sZ1lAyHS/mU8o+CwRDDFFNiafv78axkNCY7SMg8u
	Cx/j2A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by0g08rme-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 19:27:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a7701b6353so60005455ad.3
        for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 11:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769542035; x=1770146835; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tuv2CM/Pv8ftgiZOhxmVb0LJSvxTt50odthKY0Xr490=;
        b=Sm/DDENuheHLIfSa0RhrR+mH2d4/+DmII+msjY2Liuu3z87Gct73ACMJdScOAmXkID
         wpNstCBeoXBxCPYKg72OSipYkqWyO82cLDT3fatjXUGTjk+HZz/qhHHd80Bh95Y7i8qt
         8hWtV0qIxkKhdhdMqUzCECLxcCMr7Dbk6CrIurLd6nOmGgYuqk9BXbvMasi8HILdzxyo
         PGi01juTfNl7znveUYcV4losjG/m18/HgQf08FoS76+ciB2SYFGrdcdDv3bSuCV6kLzG
         e2v7i8lPi5jrfhGCWbbakd8nbZ7VQm8r6yfnCIaYvrl+nkPPyk68sOtCnk6a5u81mEx6
         aVQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769542035; x=1770146835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tuv2CM/Pv8ftgiZOhxmVb0LJSvxTt50odthKY0Xr490=;
        b=s4AigAgAFoCc8RbHihJr5dtKDXqt/wEARAoSWC8lDNxd7VXksGiCrGIAO8IMSm1Cyx
         buZ47xROYkOKik9RIw02qmUDYsFuRyIHgQ5O84mkPOFtolpMBbD2eN8Ry8VmA70IO3zL
         O2Nwn7YDaA57Xzv5GgMahBWOaxk5KvErZYkOAggLHaf6hWEms87uGlalbW2iMkPukuvg
         CALDnNTDnLjSOCphTckJWweklfWurlBB/nGwKD2yDbTMJzRvdo21OcKEjdQXshEOJ/jR
         Jp2AzlP7iun0fwhZQrJWhmky+7fBYwV/sVlVwAVIwSNMrs0sL/SdNoVxiGCJbzJ72In8
         hmsg==
X-Forwarded-Encrypted: i=1; AJvYcCXBy8CizHCznkmgt9FXz+ynCznA1yyza/Dom1qsHj5ZDlq421cZ+d2290ckJumlOpuqjpeO9dmrjWs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSlGSyT5qdkRA2EUPoNItpURKhZPbF8iStnNLC8VAWpHsNJeYz
	ezZtZlR47oquOztxXpUWvFycXvgV2S4gUJ8ZRJaAd7hffmTiMLy0HrIUaS9uPY8orpdRBP4Pai9
	bWHpEIx0Fy1b17Qn18LXHoSjb1rouS6Etgpuw+Nroh6GJO9pWqeAYfQwocnOUEfg=
X-Gm-Gg: AZuq6aLI5QbG+Z0F0zH/5QdDRhly3ziSPclOUtSnx6wsSusi+S1CRjXAEHfhTDwdjEP
	JVQyAL5ieEEX7N4ofhkDkc83KqqzNo4/bkkb1IGy3ABrk9/H4JF7KZbco+ead/N1jPLcXY1NIZE
	Xtyk+KkYCh34af4Eos/b3z+uO6JlybU9ylGIJKMWH/lgZFY61gHty3lbR4STvB7Ny86oQFWjGs2
	Sws6VYb7tolCUe+ehpJsj3YY0e5xeD+neTj1NowJU2N3HgX6/V213P5ggotZJOyczRR1CMiTip/
	HdVWn+kcnn3wCs025C5fkQF0Llk52j6VYJRmI52DwYJvzILNE4yyN3uO5xtWWfniBpSa5ShxHt6
	hjWodvHFaR3zQbWnd5i2uZHyuaQnvmFJIboPisYr8
X-Received: by 2002:a17:902:ea04:b0:2a7:845a:7eb2 with SMTP id d9443c01a7336-2a870db3f11mr29518095ad.14.1769542034851;
        Tue, 27 Jan 2026 11:27:14 -0800 (PST)
X-Received: by 2002:a17:902:ea04:b0:2a7:845a:7eb2 with SMTP id d9443c01a7336-2a870db3f11mr29517805ad.14.1769542034407;
        Tue, 27 Jan 2026 11:27:14 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b414fc4sm1322225ad.32.2026.01.27.11.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 11:27:14 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 00:56:37 +0530
Subject: [PATCH 6/8] arm64: dts: qcom: x1e80100: Add CAMCC block definition
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-purwa-videocc-camcc-v1-6-b23de57df5ba@oss.qualcomm.com>
References: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
In-Reply-To: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: gVNkmL5iZ59tf4DA0jTh5lS7rDarIEbW
X-Proofpoint-GUID: gVNkmL5iZ59tf4DA0jTh5lS7rDarIEbW
X-Authority-Analysis: v=2.4 cv=UPXQ3Sfy c=1 sm=1 tr=0 ts=69791194 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=blghiRbc6UYj-mkbEtoA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE1OCBTYWx0ZWRfX/rEz61+hHO2D
 Wb9dIEcPkmK9SaarrMQH82cD5L7YD6vUwJF4ciUNmjr6OCIF/d1e1GNP9naVO2JuSusfrE5Yb93
 sgFm1fWyfoBsvs6cAxY2D9KrdAJHY9qXC+/Qznz4DwAdsYfZm2g9Qo7YxZZ9M8udVPLGaKxlZLA
 0tSGcmMZeHEzP+7vaSjOMIxUrsxZ8yEc0Akg/FMZywAnkD5Tm5LdGQiFMmhops/ZISaRyjdIG3w
 do7iS1LWCszJbPHPSGOtF6Gw5fgWypuBLO8Gur/Vk/jzqA1X3jmwm91tJjGPIxKBQMlM8TLdaKA
 EoJoS05jG3vBPWAg/+8tZ3GRqoTD6QLGT6DWYKMCTSU30jJmBiwZbS2ytWCuQjfbq1Clta2Ka/j
 rzsMP+0VlAFgliNVKI6+o//MybD2ieAgFoSQ9h8031UeqYmUtXgBNKAXBBHmjLW5MUhVCjb/3wd
 ThRchNZLDDV+SZuuPqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_04,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270158

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
of previous CAMCC blocks with the exception of having two required
power-domains not just one.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index db65c392e6189920a137169b14b607c6acac6ce9..029ec012d0a94b05f8d4356ba4a95badeda65c39 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
 #include <dt-bindings/clock/qcom,sm8450-videocc.h>
+#include <dt-bindings/clock/qcom,x1e80100-camcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-gpucc.h>
@@ -5464,6 +5465,22 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,x1e80100-camcc";
+			reg = <0 0x0ade0000 0 0x20000>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,x1e80100-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;

-- 
2.34.1

