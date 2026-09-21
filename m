Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2124936E46E
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 06:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789971653; cv=none; b=JT6GaDpoLRwwb2QL33AiudasGkgvIb+IjNc1zOTOOdtbSrNUlPTfPj46jWJFVGWyCn37WKzYEAPLFyhJdXI5riAKgmiatWdwAb9nOaDlrqd/lgovXpCEoTG6yCQkjcJoNNFBAluPP+UUzbOHg3mC6ig+lpODudB6nuGfVJv9nDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789971653; c=relaxed/simple;
	bh=wLv1YZiGVAIfGkU8hNTnZBE7kQceQYpHHT9BZGMZsIE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hp+rM0m65Z9O+6S+5FaUELw7GgvcaFtHCiK34euDjwtN4b6wEaF6JLqF/YhWxRQLhoVWnwQL7lUPEL7mWfXl/nCiAmoerRxyVLkFJKflULt5w8E7Oj+H/T0BEo+BJmf5jJKkr9XZVmST1PjLmsxBLH2WdbUZnewEtCZmBxzhmnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a0TsWHir; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OklFSOD4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a0TsWHir";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OklFSOD4"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3Z34J3550229
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 06:20:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nDfCMBzk5C/jCeqMsCboIT1j7/GdYpI29hLh3WDtNcE=; b=a0TsWHirCjDXGyef
	V3GM9vQm1eIzE4MGCzz1A9VLNAq7STEJcVHMmJlEs8lqdXwtBZWJtDAgbH+9w+7d
	6RGLFIqGRvtvqBLu4ZQLMT3eI9mtbHZurGW6X2E58y1ryqgqTEdE/TTyxwZrg45K
	rDrBN6NSa7cK0E8MYc4sUX2+QSPDrVphg877wc9sAlyx+PGENncNvvPKZcPvob+o
	fwXMVoZ5iNa9FW3VJvjKmkl2jfubvyNLI6587SpD0pEN7SX6zgz2AEXmL/apwMyB
	ox3ZXQHLirppJqECttDlEg8GYxa0Defhlmk7jp/806cdit29eCK09aZgqcbIB7lU
	Gnfi5g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjs84xjx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 06:20:51 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso3639076a12.1
        for <linux-clk@vger.kernel.org>; Sun, 20 Sep 2026 23:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789971650; x=1790576450; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nDfCMBzk5C/jCeqMsCboIT1j7/GdYpI29hLh3WDtNcE=;
        b=OklFSOD4szqiEnUtqy5tww4dgrUUvRy2C5rZ2lNFdYG6WWsEVeOhho4xYE4Owuqjvj
         h1BZ4CvpSTs+S3KC4sj7x2gmlWo0CQzkonRSsRPCg9BmX8vZWMH/qRY3uc2wZCsIfHhl
         qO8v63lvrxBTRxtqrNPFL5LGzBYWNQTNg2W+RB+sV0bUBGpUjexQVlDyH9Ul6zFJS/vl
         uhCGduVXgLfnfnAS6kWI56wMmXNB42S1H3igLFBBZSz9c22CSoEKbkP4PiAWXuCpuJ2s
         Z92GpXpzx11ki9PFNYT/GzZz+3TO+OeoEhRsoDt/Uk2Od+HXdFo12SW3kgoMPqMVvQT6
         qouQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789971650; x=1790576450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nDfCMBzk5C/jCeqMsCboIT1j7/GdYpI29hLh3WDtNcE=;
        b=Uufy30z10c0LhEt3uTZtlHqQ99BIlpKWyGoyWCWxdQ4xhFmVPQPp9kMplXhMYpXxJJ
         CLcuv2QFWKWE6qjlsqLPPBvJYZsbstTTX6Dt7UIH4DRSZD+Q2rwY+/VzVfTQY8Hj9uFa
         hpAbQRnMPt95R5UNxfaS575SPM7mLaTr3A7RhJiJFlJigfu3nJLTJty7Y+/08SHS8wKJ
         lWgNe8S2fHBPmZXEV3o1NK0lBVNmCvEnGgIDIR0bZdfBBHoYh6x+vTTC7VVzsedKOXxd
         UXTlutn+pNhPwPCEHHLUteoHAgf2b2I5vHCo7AuPoBVaC8Vv5kuMzMzet+NvvRSs8kNV
         plAA==
X-Forwarded-Encrypted: i=1; AKwUvBzKCRYIsCtgCUbpLKwlHrN7GK4IfQagLize2T94wWSWcon/FshOqSGX0FW0nyugOPvWO++FhT7D8fM=@vger.kernel.org
X-Gm-Message-State: AFuF++kmALBcNbqZ3cTO8L4x7teKu12SPF88k5TAMaEa+2xF8BY69/QP
	lmm9AqFs0CXZYZrIpsdGQ2lio1DbpZrZpYIUXuV74N6aMh8njI5bN7gpmtK+0vC+0YeLldP+TGL
	FLs79jpVqelwBQEWJgqfpORgYp2Bw1CaCkX0QqgSN0S/+4nAyG132RXYrP/g1Fik=
X-Gm-Gg: AYBFou00j6jlup5LkZCXvfiJj8UD1pFQl4oiTGwT4ZJAhRoEB8K2TikawO4vjNnjd1X
	gV+M/D3ReR/94ugfVrdhRUhMAWYSP82+Xufs3domDXtmccyCLt4Vh5lSmBzfGEclGQTrnIvJgAt
	GiVhw3tScdsqwAWlqlGdPKuKZWVU+BaYTVnhFmFnGkPZ5w3EeyAMxqY9wid6dHWtFdBUF0ZduL8
	qWIqw5dnG3PNNoYLUrf+3v4zLkleLauMjTg4Ps5m/LxfyaepLv0C0jFylDLKaJPjrbROiXQAjQ9
	SDx6TrgkNQI5HPsWMWY/D/ViDRq6XItB7S669/gFKdhh1fvxwENvtSHk37TXTkIKfTp6ywIpDpY
	SGFgdtGsV59UpZek9CdYpE+nHgr5JX0Zji/98OBiB4ikPzpIlRhr+eiJemJpjYymoQQShlk/Ewh
	/PES6uU4WWlHJVmulH1cw7UbxH/aamKVKv3g==
X-Received: by 2002:a05:6a21:918c:b0:3dd:85a8:cb7e with SMTP id adf61e73a8af0-3dd8c4c8cdemr16602871637.33.1789971650126;
        Sun, 20 Sep 2026 23:20:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:918c:b0:3dd:85a8:cb7e with SMTP id adf61e73a8af0-3dd8c4c8cdemr16602851637.33.1789971649712;
        Sun, 20 Sep 2026 23:20:49 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d3f2csm14091444eec.28.2026.09.20.23.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:20:49 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:49:42 +0530
Subject: [PATCH 09/11] arm64: dts: qcom: ipq5424: Wire up PPE clock to GCC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-ipq_clk_changes-v1-9-d242e3d49648@oss.qualcomm.com>
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
In-Reply-To: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Kathiravan T <quic_kathirav@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: WZfETRnSuZ2i7arCzPRmq_YVzEGS7iBN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfX0zUe+/4AtZgP
 v1+eIWZHtqWgqreceXMrJpptjTQpnVdeE4oiAmDDnwe1UhAjnzB1barf/amlkvXwG6G4ob9wOX9
 pxZ/VRC6VpP1gkXiouG5rwz2IVQvImk=
X-Authority-Analysis: v=2.4 cv=YqWa1IYX c=1 sm=1 tr=0 ts=6ab0ccc3 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=W7I2jtZzSWFJvz47EOMA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfX4f0w+AkdHdzO
 +zI2FrvteiXCOyldsbgRzPOuIS9/QDQxVUq0/fZWCOZ8wdHpAc7nqz8kew3MLKTvN49VEGdwaan
 oW+dviRNfDZLaNQKsPpJoLHnCgIdqj6xg67PQs87e4m/rR8DlQptWpBgUkgPeCEhVKjHWdiE6E+
 kdVZ4zql1N9ZazdBLEw7T51HA3RkAmhZMR5b/C0qQQ1nuilt7D6iRUW/KlAQYp5HOkGRBmqhYXA
 oNlpLXmUGAED38lMelgg+piUgwhkt8czkffvZZmg60stu98MhQYzXhEpRrqDGPpjapiXYXe35df
 3mwdwPlb0wwX6owb0MbsFGU4tveuzb7eRkZYvXc8ypUK4ldZzMyA1H8Gnx3jPs+qDIhKHJSMs+v
 NRhsdftNtnpOWb/8vsyX5e7JWOTIFtKSX7rc02Vn2qztYj587U7z0RjzgSsg2qqpwh/yG3+50i2
 ooLs6f8Hkfs/k2YHS+g==
X-Proofpoint-GUID: WZfETRnSuZ2i7arCzPRmq_YVzEGS7iBN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210089

Add the PPE 375 MHz clock generated by the CMN PLL to the GCC clock
controller inputs. GCC uses this clock as the source for the NSS
MEMNOC clocks.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 95e2508ac145..64a06d615d61 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -486,7 +486,8 @@ gcc: clock-controller@1800000 {
 				 <&pcie1_phy>,
 				 <&pcie2_phy>,
 				 <&pcie3_phy>,
-				 <&ssphy_0>;
+				 <&ssphy_0>,
+				 <&cmn_pll IPQ5424_PPE_375MHZ_CLK>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#interconnect-cells = <1>;

-- 
2.34.1

