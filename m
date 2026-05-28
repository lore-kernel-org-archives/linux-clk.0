Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26307305693
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 02:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779935374; cv=none; b=EOx2tPhJ/1Nn/z1HY4gJI5U1Jl8mspkcvoWSlzqVb6t1XAXHJzhq+82eHBYBadHf1RwZQVtNJkTRttXTOgnUzvX/ZjvMZPHer73Fs57AQHAMCepDuS+uT4L/aSLLOLw/Ahd39fcy6kJRtHcpbbxR0Wx/opHHDk1xhR0fVYhVJ1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779935374; c=relaxed/simple;
	bh=4YeWlIEukC55Yr2J3TwKx6HzkQvNRDSFgt+i8fnXgCE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PuLCsh3DPUd1YLFC5mKQzEdNvQBrQ35IVJRad940isVrpa5QOgCwpO7oANp/pIBkdQR2Qxa9W7cR5ep2FLU+wXAbnCf74wJqd+sp6VKzRczzK63ivpxTQgunrek+NHQv0ZHwzA5Yt1eo0Z3wpmwT8D4q3fZRjjWGKM51w9MMHU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BBncLDQJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZiBy+VYs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BBncLDQJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZiBy+VYs"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RKmqtq1638534
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 02:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cAfjiA1l0N3l6JHykhKskND7GC3CBlmNzpO/TGQIE7Q=; b=BBncLDQJBdMMGNdg
	ksMTizsD2A657dRshFN3Mxc8LKJJdDdaWO+nj/FIUoW/EnIUxT/CmpyXK0b8pNj2
	ChQj2LykFj/kF1CM+TeGdJ8aX8YqxX27FZyQECPf5zvYfGfTbdJG7TkQGlCm/CUj
	upFKzCe8gRtP2elGqeognByB2AAQHzknag2nitLbNahHWJ3Iy+wikXxu8beM7fFf
	8DswIjiYDcbBhKiSsT60rVrHPLoiFOLES0I5hQUGMgTws5fYzGRodPOgeI7ET7/G
	or9aPAEELDVjHckmaKiyRSmsPXCO4UgUeNYSzLnZv0U7hTasIJEORDZ/OA75Mjei
	HkipPg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yngy8v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 02:29:32 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-304d8613efbso127688eec.1
        for <linux-clk@vger.kernel.org>; Wed, 27 May 2026 19:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779935372; x=1780540172; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cAfjiA1l0N3l6JHykhKskND7GC3CBlmNzpO/TGQIE7Q=;
        b=ZiBy+VYs2pIb0OnQaxiSljYsdyOp63UA7pDMQ4m5+IeayHUr6JptI9/EF5CIyOGcIX
         0ub0+Ua9M4PCpQcMm1fUAVaVNomEDlQsetWemlnxE5IHiPWvsKv/5Otc/Z3Lha72e3AP
         e++siFwPn8Ek0/afzwIyKkUKXnjFghg+Ry1YCB0HQ1iPyBPju0sOufVNiTT1Ko9nwnHj
         JmZpjDkb92c5gD7hCgShy9hLeAwJ16yZhjM0Fljd7JAGo8v024xvwmNpd4EDookdGzmQ
         Gh7PqOQQJPRBfV4oyqySa6i8xwCodFOa0lP6rnLvpfZHaWuY5+5Ib7cWqhJgIC/uzy8Y
         Im+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779935372; x=1780540172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cAfjiA1l0N3l6JHykhKskND7GC3CBlmNzpO/TGQIE7Q=;
        b=qX8VOyRGM0C7hydgZVYws8ilw6Oidx4yZ0eq7tqkAYqWDPu3qHfOZI/yCwoA1amt2G
         h/E+Zh7FKi6yMhn80BhFQz0N4f5KM6CMCA+ccRGJGel8MWqbabodFeRuhZgdQZ+PgiWs
         PPshSChIZuC/uuq5cPIaMnZvqYc54uNxSRHr2BfQ/Ct7xL1VbBRnHBUZ6mdlAEtkPNwI
         H2VhLQ6mIKABL8Eb6GL0nL4o1DYVbEKG1gQYTwKDRKRVcBgPYtAFrUOYv3LOoHNRZwlF
         enHmj9UbDH+G5UNMRAa9hewxwgUshneUmvSabxtPFAnrDwDc8MWVagHyunBm+nYNp0yn
         MiaQ==
X-Forwarded-Encrypted: i=1; AFNElJ8w7mv5+KxcuIGGZ1NGP6FesOo3md7bi0opSaLRnWMxgewK/NsKX4UWfybDv5V1/f6szFj76gvJxQk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvxZUQduBh4Rd9GIFLx8TLfOUhodKhvHdCsK60I2W89XDWIArT
	9MVNJGydeH636TVoQYWquTXbilp5y7xqVJN5u12ofdvmo9wGbJ9oe17gaPFUafJ1+3+p0Mij+JK
	PTBHPbuVdUSdiSDNNtRgVJUGdaDzTGPBBgiH3jHxVUAWjpWpHvjV1JpDgw0p3QqqNDvltZaJrdw
	==
X-Gm-Gg: Acq92OES8Y4sJdL3huZWuxyCXXLZLrQK/kiaXT22LLLZr0TV0qC4LrPKNIcNtqnDfNv
	ahlA8WSS2Fr4XKMRVbt+QvZ1VqKmVxRAIEdaCYjQXqKor/06B5j4SvVMrcsBmkdYeylv7DK6bmw
	Ci/YLG5O9GcM7TairrPxeHXTHFR9OZNlSzaoFBexWCwSLwlro9ldnBHCe26D/ODQKi229Z18FAx
	qlKhaLASCSHzWcxkaVmvEI42f1kgjoivd/bdPRrGd64v3Iit5uETrDVO2ug+8Y/zbacSDDjd0Ky
	oVOZS+fDkohe2buRExRljlG4HO1REX3AWlfKZJm0ZrUCEa2H0NmSkVPxs3ZMO5C7JWIKQxS2Mli
	ytBA8ZpzHD70iy9NKJQLomGEQboC0y5Nxz/ZaabmUMQjA20QJdag+fnAVPh3xBKa50rUZnFMtSE
	1gGyE=
X-Received: by 2002:a05:693c:69d3:b0:304:5b65:5971 with SMTP id 5a478bee46e88-3045b65727fmr6618465eec.20.1779935371832;
        Wed, 27 May 2026 19:29:31 -0700 (PDT)
X-Received: by 2002:a05:693c:69d3:b0:304:5b65:5971 with SMTP id 5a478bee46e88-3045b65727fmr6618454eec.20.1779935371287;
        Wed, 27 May 2026 19:29:31 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304d4222060sm691653eec.29.2026.05.27.19.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 19:29:30 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 27 May 2026 19:29:18 -0700
Subject: [PATCH v4 7/7] arm64: dts: qcom: mahua: Switch pcie5_phy ref clock
 to RPMH_CXO_CLK
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-tcsr_qref_0527-v4-7-ded83866c9d9@oss.qualcomm.com>
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
In-Reply-To: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779935361; l=993;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=4YeWlIEukC55Yr2J3TwKx6HzkQvNRDSFgt+i8fnXgCE=;
 b=COh3DLSrUdls4S9gugZcPaAmxGOWG2zHoFNWQeMaQwF0siTs3LgLdHwH7udGTkA7m5AZol4NA
 NGkgV3i0rAvATSrWtmxtT3wBl0lboI0maZuI9rRecrfHpqUXoUSqsZk
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDAyMSBTYWx0ZWRfX2aoUYRkL+8rS
 pMEbz9xIcyVoftefjQ8zpErP+n8rw2dZpUF9dxBpwkLuLezW7mlYsgrqDTt0I9EoMazIg/HU2NR
 5TmZrJ8ch3/585KA4dmV5VfAW2143T1mv/Cqo1i5kz5a4ZpHY6S9ncrPL/+335q22N7ewVwGNgG
 qTFVoigYAhR2KIxBRi72WzJNo01Xr4pAzFic5MCxjyzAx7krHDevDr4RwjKKn4G5Wje630OpZpL
 9KO36FsdeswgJh+jeTJOICNnpYA/uYIIl/BQl6PT5Beez6uKl+hNPA0PtXiNKrXZnRKeUEgfLtf
 WjUhk94jCByqBJbpdYoIoj1Nh5PvBHKO9H2Of3OMXosNLpCkr2LbcNSHuG4NHulC6dPupfe6bNo
 Jq9nMoBd19gKSL8yvAsgSx+9qF2qbOuYOVMEJYu9J3I4DO9ZlJggqZ3LPZCRXb9QN+LNs5kcs+J
 BYvdvaik74aa+7M21HA==
X-Proofpoint-ORIG-GUID: Fy5RmM_wHT15Vqv3csyqAG-oxi3GsELS
X-Proofpoint-GUID: Fy5RmM_wHT15Vqv3csyqAG-oxi3GsELS
X-Authority-Analysis: v=2.4 cv=EdL4hvmC c=1 sm=1 tr=0 ts=6a17a88c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=CR5IuhOMo0Dix3IxAI8A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280021

PCIe5 PHY on Mahua gets refclk from CXO0 pad directly, so no QREF
clkref_en voting is required. Override the clock list to use RPMH_CXO_CLK
directly instead.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/mahua.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
index eb45adc8a0a2..e6c059708912 100644
--- a/arch/arm64/boot/dts/qcom/mahua.dtsi
+++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
@@ -115,6 +115,15 @@ &oobm_ss_noc {
 	compatible = "qcom,mahua-oobm-ss-noc", "qcom,glymur-oobm-ss-noc";
 };
 
+&pcie5_phy {
+	clocks = <&gcc GCC_PCIE_PHY_5_AUX_CLK>,
+		 <&gcc GCC_PCIE_5_CFG_AHB_CLK>,
+		 <&rpmhcc RPMH_CXO_CLK>,
+		 <&gcc GCC_PCIE_5_PHY_RCHNG_CLK>,
+		 <&gcc GCC_PCIE_5_PIPE_CLK>,
+		 <&gcc GCC_PCIE_5_PIPE_DIV2_CLK>;
+};
+
 &pcie_east_anoc {
 	compatible = "qcom,mahua-pcie-east-anoc", "qcom,glymur-pcie-east-anoc";
 };

-- 
2.34.1

