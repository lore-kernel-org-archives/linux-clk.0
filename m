Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBE6480342
	for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 11:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778846382; cv=none; b=VcPEn6ThNjuKcrKev9t9apgrf396+aW9ePNQzy0mRNJx2lS3hKgnIPKxmwjPnl/pc4VKn9bp9ivKUh8N4zNwueu9pnojUUCkjCpN4gpVIsz2GN8Dn/RT3FUCdF71/9d1ez+u+HUF/W3X7MABLKjm/m2QUL+ekUFLCcXnbmMfA8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778846382; c=relaxed/simple;
	bh=m9X312GlyTzYrjaE5voUXDp0+TdVreRfHVkajhAsNBw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nr7xSVLxQZW85BkO5JZ3U2/T/mtdMQsgo0geIGf4muBUDKngzBvczWXrVr0bwYh7c71p3hcEJV6G2WVo+1ea1P2LlZ4efCSx0srRsiHSs6NBjxebgtU3K6Wgwebao2n4/Odi3HdytE3yOXUoqRq4POecGki3x2HI9NkJEWxcITY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rofz1WSw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U+s5rcpP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rofz1WSw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U+s5rcpP"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBFrB43197601
	for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 11:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j7Zo3oRVuQPAjn9JSO06MZzxwB1mFI14yIOh6gsjIS8=; b=Rofz1WSwC8NXFeex
	9wimSd1UWAgNAkFqoJbtrRAa1pZVR5B3SHpcVlyWEe+goM4vyPCN6d8+G5ZDweZX
	rZizdsdd8AtwfxVXTZEYKNBldbqipNUlAdWqUVbCS4KwL3nqwNhqbuWAAF67GIqS
	jxhugyQgtkBqSYc2l8cTvIl8TWrTfPU3/gWYTTLDWRzubeNHN1WuO2t5DrKo5kdf
	nj1aqf4xNG/YFyKeyuB6PPj3W1l6Eb9jOKl/vUy8UPt3RcdwPOuZWSlaSHwl1thR
	3ZtjQKIXStJnR03DZ+L12Z8akNScM6VcyotOnKsFLKJNjwgw0nftVy/Mmnj4vbhk
	TpcCoQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qb4gd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 11:59:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d812c898cso217602031cf.1
        for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 04:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778846378; x=1779451178; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j7Zo3oRVuQPAjn9JSO06MZzxwB1mFI14yIOh6gsjIS8=;
        b=U+s5rcpP2Hl20XcT3x+zUXnnzsWzT9SPsipOkpZgoXiAqXSd754MCXtR6GLAYKvLdY
         zC8cne9HEzopqkbXylOB+zeubNlc/25ZaslW2qNv1ezOjoaP+q79I9rEEzKNz79H3oa2
         vdByDm0ptLt3Trg3Sx3B1wJ8hMl4VNl3TkVokuKcAyfoVDVBhumEthK6sw9Mp2MTCTmA
         QwgjF9ZgHMWeFb19cKaX3Gnz1li0I4eA2Ih1AFgt8LGrExbPPQHV9xvdpDMMX9q+Q7iB
         6HoHpRoNpfULsIb+wXswqCA04xCBfIv6HwMQFy2ePQUJwmvvO5hiYpC1TuH0FYEAMIy4
         W9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778846378; x=1779451178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j7Zo3oRVuQPAjn9JSO06MZzxwB1mFI14yIOh6gsjIS8=;
        b=iXACXRlrpeTeHKoinB9h72zFfavj5e7HtYnAA2xsHw6rnOpNwdyAHk7VnYs8M86BuB
         MdNBc2ZkgRo0xsafuGP6Sm+LUBEZpxUL9kzvN/BBrmlmqIYOh2kG3wVugTPCLo+QqtPZ
         wiYwqVqUrJBn3bSzMpAutn4oj0AyCVOj2SL5fZWXlJoGImaucQCX1pJjtDK7GK2MJMq1
         27YFfMDmzixOc12aQyBpf/Z4iU1m4TZHVpHw0BcWfY5NYhMmUbS5OO2WOcFstji3RJqM
         PuOFSm8GPNwg66Yan/xKdsHvd8H+Qf8tDdcAiJMqWgs3qE1y05UBshCV/GFaT5MhBfCG
         6shA==
X-Forwarded-Encrypted: i=1; AFNElJ+bZW7utMU+VbLozHymLw6d09XVDMHiQ5d7rQHLroy833kCTTH3gCR6nqPylV7CG5Y0HjqQaJvcqDA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJBilwgNgbxm4NEsF6iB7hdV6ToiD89Y5QI1/9DPrrz79oGl69
	Z+bdAbtD6qJOO0sY4dhYQVSDh9OMN9KdGkWAWtVxpr6TfPfuzFHQ1aNDvxBtb1D9N9fRzxufYyF
	rmP6zAUi4oRZelqDZjB9mFBNjsQ8ngHBHNej5iQ97TWXYIwirEPiKPLqtIXJSHos=
X-Gm-Gg: Acq92OEIxX+3nuznTxjtigxO/KjCQW+D46IW7auDwaCHhXk0zbUTP8ZDpYn2Ka9ckMY
	LkCDHqG4JQSu1I4Lx+F/0bZ1cDAcE+7H9x+N9vpyaI95/kvSXAZ1gsl31Px5Gd1EUnU5Fyy5oJi
	M+AdqAZcSQAZlkRrqQe/Yf56eKRx3aGFUOb7edsMoIY50nZbHWHejfJv3hB3B70mcRTIo05NFEZ
	9C/wQCejBejnEpFvn5E+LAyHV6BChSX6E2cOO8b5zsQKMx6P2cUZBG39eF8WCfqHzAf50cuxbxT
	W7VBeKY8bxcY0M4ImEgbkfoX4XJbllecJGUsd6GtJXHVbuDTYJfi+l8JSweb9Em6qQGNq59y9n4
	wWOkdneCNH58BT1m4K7tLG/MU2vvcefb7LC+v3CjfJ5R9wb44GCCLHD233XpC1MD2xpXAou80Ih
	Cz4uXACfoyxaX5EdEFqE0aWhmuX2AhiQDMvjZrlK1hyHD6VQ==
X-Received: by 2002:a05:622a:8c1a:b0:50b:41bf:4ee5 with SMTP id d75a77b69052e-5165a27b291mr45163751cf.57.1778846377788;
        Fri, 15 May 2026 04:59:37 -0700 (PDT)
X-Received: by 2002:a05:622a:8c1a:b0:50b:41bf:4ee5 with SMTP id d75a77b69052e-5165a27b291mr45163251cf.57.1778846377248;
        Fri, 15 May 2026 04:59:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f119ff4sm1295651e87.20.2026.05.15.04.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:59:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:59:26 +0300
Subject: [PATCH v2 3/4] arm64: dts: qcom: sm6115: add venus device
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-sm6115-v2-3-2ab75229de61@oss.qualcomm.com>
References: <20260515-iris-sm6115-v2-0-2ab75229de61@oss.qualcomm.com>
In-Reply-To: <20260515-iris-sm6115-v2-0-2ab75229de61@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2620;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=m9X312GlyTzYrjaE5voUXDp0+TdVreRfHVkajhAsNBw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBwqgnkK8T5+7VBArmDGhOKqMgQ7aFld7PTRcY
 M7vxipk9RqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagcKoAAKCRCLPIo+Aiko
 1WZ2CACL3N4/XJFOIChQ+TPtlId7HFLg7XpZbJGG/9XaSd5YSfYG8p18jb0GUxSivqXVHC+j/Ij
 fq7MKkcCM8hi0kaamX0R/NNWCQ75qaYrncC8SEkz/3P10lSzFWXcA8vSxKgCtqZF4i+Sq1l0siZ
 teAkeLoanWxXxfSe0YxcSppfX+SSMhWDiCZzTjKuhBf5zV+5FYQ8BTCDUtOli2I1bC5HJHzS9Fg
 FYJS2O8nzBhPExSTFOn4GeoH8DorDvNS/v0ZShmLBPCzBPFoFs76bifkjZsPrZf4BPFpKfGWiBL
 RS7i/pL8cuIqGZiZuytBOUwZsg7QET5n/DU4bl5MA8XG6B9u
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: r8dBNqepstyS08D76S1KhRcYiN-sv4To
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a070aaa cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=RLkLXjOyRIPW4P0KXqIA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyMSBTYWx0ZWRfX8W4TNTbVasW5
 A54u4llkfrLW4vp54gCR/aOS+yDA8qL1ntCgf7JgMFCIlkB/tubzPuT8etzqoprdqVJPcZAa6Ez
 E2/xHnLQFlzNXLqIEDqNl4jHHAAnYwruv3JNJfcr0sznvaQJiluAJLL4Wowi7jtFoL8l7vBZeSN
 ehSbjT9WjQWLsPg8AdclzFj6AhjotLKP5ErKVd2YsHQse4JrXKTo27YQy54qFoAF7f506dsHc5E
 ckCWbTOIqw7mZC3gkKbpIpRHJGjsbtf6S3iFrOl/ptKsB9z46VhelUsIaWXPr2J1zgVKvxYgIab
 K5YMJIDpDmMh+IBvVYfJoOvEILKiHzwtkLmU1wQ3ZgWf1CawkGw+KhxY1ffDKnnaXGX+VAfyTRM
 E5ICxmwtAdCCWbRh9cQPk4jPpGEYgfO7OiIaIKw4z8EicGoVx6HkoXuXHKU3ikiRAY/emzFSOH4
 4Pawft1MJ910dYz2DlQ==
X-Proofpoint-ORIG-GUID: r8dBNqepstyS08D76S1KhRcYiN-sv4To
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150121

Define the video en/decoding device present on the SM6115 platform. The
core, AR50LT, is mostly compatible with the one present on the Agatti
devices, so it uses qcom,qcm2290-venus as a fallback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 65 ++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index bd94eb87d6f9..3520802d1fed 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -1853,6 +1853,71 @@ adreno_smmu: iommu@59a0000 {
 			#iommu-cells = <2>;
 		};
 
+		venus: video-codec@5a00000 {
+			compatible = "qcom,sm6115-venus",
+				     "qcom,qcm2290-venus";
+			reg = <0x0 0x5a00000 0x0 0xf0000>;
+			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
+
+			power-domains = <&gcc GCC_VENUS_GDSC>,
+					<&gcc GCC_VCODEC0_GDSC>,
+					<&rpmpd SM6115_VDDCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "cx";
+			operating-points-v2 = <&venus_opp_table>;
+
+			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
+				 <&gcc GCC_VIDEO_AHB_CLK>,
+				 <&gcc GCC_VENUS_CTL_AXI_CLK>,
+				 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
+				 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
+				 <&gcc GCC_VCODEC0_AXI_CLK>;
+			clock-names = "core",
+				      "iface",
+				      "bus",
+				      "throttle",
+				      "vcodec0_core",
+				      "vcodec0_bus";
+
+			memory-region = <&pil_video_mem>;
+			iommus = <&apps_smmu 0x860 0x0>,
+				 <&apps_smmu 0x880 0x0>;
+
+			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
+					 &bimc SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&bimc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
+			interconnect-names = "video-mem",
+					     "cpu-cfg";
+
+			status = "disabled";
+
+			venus_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-133333333 {
+					opp-hz = /bits/ 64 <133333333>;
+					required-opps = <&rpmpd_opp_low_svs>;
+				};
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+
+				opp-384000000 {
+					opp-hz = /bits/ 64 <384000000>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
+			};
+		};
+
 		mdss: display-subsystem@5e00000 {
 			compatible = "qcom,sm6115-mdss";
 			reg = <0x0 0x05e00000 0x0 0x1000>;

-- 
2.47.3

