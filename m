Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5CE43B4AD
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 15:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784905243; cv=none; b=rBYO0DjotkE95MSkUyKHg0+tXIY5w+9yaXbvV3uMu4ipUA7CqWg5z6u6hwWXKxLS7ReAcrZPhDZk9FOh5PJctuy1rAcTp7t1q7GTZAEHmTVRaZblWewN8mowm6fVgK85RvTasrhCdzUN44c0lniF80W8zOvHp8KYoaZrsSmamAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784905243; c=relaxed/simple;
	bh=wbagZecBaQaRTzpU5oWRY+OBJJnCD2znP6i38nr/QN4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZEayZai1XChS5YTcFOxfhw3sNdY4y7qAxhydkf0HVQ29h6CcN89Qw/QTiUPFtqheg3hkhvjPkZzQCmSnATDlow9bYbDf4ODzfumbPpOSsNuMtUvL1CmSWLB85WX0L1zyTJy6zBBLRmbcltpwF73+BeVZZ/61a+d0EAYzla6fcG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jt6KMXoA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eV7Cejxm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jt6KMXoA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eV7Cejxm"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODb8Ca3344390
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 15:00:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fla9eVpDtoO8o2/FJMp5AumGNTB0vGzRk4H0vkXm3gw=; b=Jt6KMXoABCG3Y554
	syw/UST7zaZqjp9sQ/ZDNusMUycnpCAUBnpGXf16fmg3kjXibgqmVLgGpC0KxfX/
	PaMMJSnHzIjgAg9HULthgXQzodtFRxuA3CgHT6/wFUWk8a0Gm9/WuRpfsNJZwaQn
	nPZ2k3xYBbG0qKeQ/DivqjTu3YBqj3xyQsng9xcMKC3RwGOrIXu4AR4SGvMdTVQ8
	dCihX8hos2I1FdClxVp47S+hZWcZqnnTQIrC3cd1PgVFTmv2TY+azsLr6hkoMd6G
	mKdTGgSI8VBvOKpn2e7ecC2m3Z8Sm9Sbk4Qhi3SknMBCvTD6NZFe9yz3hKtt0ule
	wL8Myg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cf0h09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 15:00:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cd01a14e81so7220275ad.1
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 08:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905238; x=1785510038; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fla9eVpDtoO8o2/FJMp5AumGNTB0vGzRk4H0vkXm3gw=;
        b=eV7Cejxm2B4natjVaBXyUevgPp153r4SuL1+nMhEtz1ilZX/RxzEFHH65sswW+rELs
         n/17YLEmn7yBnEvn8QxSliUbaMpccwQ4mh6QN2LgZPoReRu+my2IP8qlLe172b+Jea1s
         i+lKBeNJl9B7Ccqmkdb30GEAhmN/lbXYtcVyFcV5W9tC3vUnKQ3bG7SArefqYs3rh7BS
         IusYKMqS7tEQWIM2EcDXRNcNnEmoLAQKyvnGT4hruYC7UdZhb8MXexoZ4VxMakM7B/yC
         9I0nWzjnJVZ3V+SWF/K7rXVDuNim7w0jvqv4o8rtKeth7GYiVT9KB4z02WMSn5hAtW7q
         qD8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905238; x=1785510038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fla9eVpDtoO8o2/FJMp5AumGNTB0vGzRk4H0vkXm3gw=;
        b=TB9pQQBitmdjRolHT3MNuJI2cuqfM17jF8eWZoRsV1I6z97ivd1xq/48fPyP0Osb+i
         Zm+Jjov70kuAXE2p/Gdml0B+18LsX9t+3GZ+iVEikNe2fBIsgaShIh3BI0AxdGF1834C
         Oh0KNZw/gsj2lxsAhEqbCnhUsYQI3eG9rGoDt4BppOKgwD/Q9J39a+ITpize2HeZ3zgV
         QmE8nd5jhH1XFwbopsY0FeeBl35nAibw/3XAxVuUoM/pkgJJQGlwKXPPK9b/CNtAKUgx
         hGYbxCbURSKzrQtfw6eHS3GwA5MV19mhyrrufImf8jICwsM7Ln/nuL01Uv0sqJAZRCkR
         SCrw==
X-Forwarded-Encrypted: i=1; AHgh+RqaAEXnhFfbffjJxZKV+FuqqbqJSYfYgy/cY5XfeoYs/Z9Cn4yLG5cqWQX2X/c0dV8vh4Ky4/S0+pw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKoeUIRkRQkJmNsHqXOzaUKi3Yo2ZFNJqmiueiXp0a+bjNpqsy
	dyA/7+CJ/ltiSaN43IuBYLrNdtVqCLDzzBs0cuYQYB8o5hIWYuO87vis56pw6ddgMY1jZgK3EvA
	t0+rsslF+t0LqOivvJ4CxJU/tNtSLnOFpDcdvDlAPQjIru2/qxaDOT+sdsrHsa3c=
X-Gm-Gg: AR+sD10iQnkNdHIyF87xoqnF7qP9DmdUVMR6Sscty0vhyE+E6xhH04MicUtP4a5Bzca
	hppj9SoaY674JbhLgnbUG6NM/ehLZe+Z2/+hBuujDTmPStgS2zLm9rZoWn0Sc5fUuLJW5jp2yLe
	j35wG9iDZsPNG81rw7kp1yyXUMztXNaC4JisnLZOwAuv+FKTlWcqkNfj7r8t4BmEqda6QyhkLOd
	NIIm86L/kh0jlGN/T4uY15PHEUMYIbyON++fuHOJSfIfk4r1Abb0VqS02ErioMeEtyBAleWBUsS
	ltJ9D5f6eGGHEXtmawgu3Z9FngXTzFPkQS1Tm3DIzNj41xHgZi/HQ5c97DUqyVGpujyFlZrAY2r
	DdgoFYd3v3KhWMpXBH5+EB8GpIB5pU2NHPX/44Q840g0=
X-Received: by 2002:a17:903:ac4:b0:2ca:ed41:d331 with SMTP id d9443c01a7336-2cfa708d196mr89843145ad.45.1784905238199;
        Fri, 24 Jul 2026 08:00:38 -0700 (PDT)
X-Received: by 2002:a17:903:ac4:b0:2ca:ed41:d331 with SMTP id d9443c01a7336-2cfa708d196mr89842385ad.45.1784905237511;
        Fri, 24 Jul 2026 08:00:37 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc593b57sm621809eec.25.2026.07.24.08.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:00:37 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 08:00:34 -0700
Subject: [PATCH 12/12] arm64: dts: qcom: Update IPQ5210 xo_board to use
 fixed factor clock
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-qcom_ipq5210_cmnpll-v1-12-a8b8679d215f@oss.qualcomm.com>
References: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
In-Reply-To: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com,
        Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784905224; l=1388;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=wbagZecBaQaRTzpU5oWRY+OBJJnCD2znP6i38nr/QN4=;
 b=II2tJeI+QYrAlC0j4VnZRc0EEtf+s+4DoQ2s23PX28N451oypkU+KqQirS4y3dyrCa8XgagYz
 ENZHwYOcxEEACdz3lO8dJ2BdSOYHK+NC4EkY82URuCHEcJHcEQMvlXC
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfX9GldstBKrsqU
 9lYhXyw9w+POaUQyfI+iXNXPUoWLzgCV8aW/Hz4SeW7lilvuOQkK0zmkHcEX8KOzZunrluYLZPR
 eW96ma0bmBL4LL6Ur+YVwZhAzOf1gDU=
X-Proofpoint-GUID: 80mC6cHr_Aac2u81U6zxddzyayER9Ugs
X-Proofpoint-ORIG-GUID: 80mC6cHr_Aac2u81U6zxddzyayER9Ugs
X-Authority-Analysis: v=2.4 cv=er/vCIpX c=1 sm=1 tr=0 ts=6a637e17 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=CPdYy-Otk887xBsD2wUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfX8K6+r3MrA62E
 kio2uhlCpT52YFMe65ZxTTeQZAqyO0m0KGRBkj9ZYxiUDf1UdcE2qa9D9Hh51WRcRbkcuwgOhva
 Vh3X1+1iR5BnPoKCwHmA5gMylQFlKp6bzVQIA6OZZMLi+y2PCTaT4SZrNpThWVx8s5dthC2VFDm
 AmDUIoI6iffbK9klsbEHkFBkil+RJbHzvVKTOw9fUDHtHC5bZolxuizIzjZ8KmUL337+wRkeyAf
 oJVOAxtfuUwZ+bKWqsCqaoleFE0sNhyt2ZPiC12zAWPR4hPClf0/OaJgrN6E0TNE9a737VKk0mK
 3Fr7rnrzOo6Dj8ouscKpSDz00NKZa4+UldvNtO7yerUs4z+7S+DN1UnPebnNl7tdRHSzRnireUF
 INFkWgdQUtUavJbtMlWDE+eTgjMy50HdsuBTdwtRIdFI2HennSzgauBOiZOR1AdRlTMP2sBQUpi
 Mi1dsNsLqPAytCWsfSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240135

xo_board is fixed to 24 MHZ, which is routed from WiFi output clock
48 MHZ (also being the reference clock of CMN PLL) divided 2 by
analog block routing channel.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts | 7 ++++++-
 arch/arm64/boot/dts/qcom/ipq5210.dtsi       | 3 ++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
index 7410d092814e..fa537633d5f5 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
@@ -85,8 +85,13 @@ &ref_48mhz_clk {
 	clock-mult = <1>;
 };
 
+/*
+ * The frequency of xo_board is fixed to 24 MHZ, which is routed
+ * from WiFi output clock 48 MHZ divided by 2.
+ */
 &xo_board {
-	clock-frequency = <24000000>;
+	clock-div = <2>;
+	clock-mult = <1>;
 };
 
 &xo_clk {
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 9bbd55cc1e75..45026f7835bf 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -26,7 +26,8 @@ sleep_clk: sleep-clk {
 		};
 
 		xo_board: xo-board-clk {
-			compatible = "fixed-clock";
+			compatible = "fixed-factor-clock";
+			clocks = <&xo_clk>;
 			#clock-cells = <0>;
 		};
 

-- 
2.43.0

