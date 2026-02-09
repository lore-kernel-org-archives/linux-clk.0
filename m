Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B222BF3F3
	for <linux-clk@vger.kernel.org>; Mon,  9 Feb 2026 01:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770600762; cv=none; b=ax7OXGdWcuPfvQvgODIU33so+VkYZ/QB6V1wKAjqkFtIeM2l+ch2Km24f2rzkfX1carsFEm9QpqMUc7BDKsK6+V7cdQo1AgYxJd8P1EcySi2SqOlBvPtIYE51JZqC4eHAUJmsNGdOz0kTOCmRKl1G3zVCCUxoyZuKqbSrvmXHUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770600762; c=relaxed/simple;
	bh=mp7znh5yUTXGIVAo3yop0t0MQrXUpW7C9vuYHOlkZ+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WjwSphJyLaPAFMNCF0jo9fio7KcKa5N317UqPqRaeGt6nuJxMxcoiMKd6EuoxD1D+Dd3+F6CKiy1RiAttuIpWML1Q84/5wFbacSP3L0a2Ae31jUBAnwJ9TsDUp+JLZA2fGEGJDHJ14J+nY+89rRx29gddjgTeVJcEh3JuDlM7ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sv39CkZH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NQNW7EfO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sv39CkZH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NQNW7EfO"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 618NQscQ1221068
	for <linux-clk@vger.kernel.org>; Mon, 9 Feb 2026 01:32:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OLZC7NStGj9UHK+dN1GsxWqO1A6r1SVJAMjsxlitvPk=; b=Sv39CkZH3lvXKsSk
	OUj4hlTSGaMxV5UN92ZbLeadowgI/gkGaPvtBUnJMdb0OrTW6C226j4jXosbjCYy
	IxWdAyl4CeQx+l8HPxxeVU4tzvVFd6rWWJxX45ii4saJ8LxqBjC0y9fHnRHcRwQ2
	JIolkha8+OBohduHoa6v1UZjZcU+xxlawekWErX9vmAHPd+zITcYm22ymmyBgV72
	+i6di8IeYA1GFC/ndbE38I81l9dqjL0RSZRkConurzFXpJgRFV4HjDcjdKVGBW0J
	SC2P0JFUdNZd+i1SWbqSwn1nGTlX9ou46wU63Qns1aUNBUApuv6Dy8awTLcbXZGi
	vjwl2A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xdd37q7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 09 Feb 2026 01:32:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c881d0c617so677301285a.1
        for <linux-clk@vger.kernel.org>; Sun, 08 Feb 2026 17:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770600760; x=1771205560; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OLZC7NStGj9UHK+dN1GsxWqO1A6r1SVJAMjsxlitvPk=;
        b=NQNW7EfO6fW6n2DENZZ0cL5Dq6ZtEBB++R19pVKqNghAvpdNSNsTNsqAzS23xNkD8t
         1JGNv/6Yp/a2b6CktyryD+9yZlaLcWNMXblPngk/A8eEs6x9EO3FUrLd4OHwXgJ6uoTu
         uGwy+OEBnu1zE8hP9ob59af4R/fZzdJCLkS4SJK8HPBK7waSqeFjROs9eIhMuRcZZPki
         Epzmr9auVmCcvHzAGMDE61GJa4PrQA6fCR7e5KM1xYN7zVXp4NMIOhxtn/Uut2+nkfdl
         YtrNh5/HYTx8Wnsk8vVhM28nRHVGG5vIYjfmskSqIHgod+ARJ3fA3H+/3tOe7uvsUAt4
         K5tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770600760; x=1771205560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OLZC7NStGj9UHK+dN1GsxWqO1A6r1SVJAMjsxlitvPk=;
        b=UcxPpqol7KQmdNHzfCf6CDCNNHejyO7XiIi9Vp1uRPvx1Ue4JbADobMnJTPR2h6MYY
         HuR+N/Lan45EeVHNdpSP7W3C2Qh3t+F5rRK649/t14eGvKKzFsM1gydnmjmILESeHO1h
         lwY0D65xSJfpQRlSnSKamgBD0zifi4x5RWh2djOjEAv9d+MxH+cGCpnBhP/Dq0v+4csT
         5aOako27VKfk3zZ6Lyb5q2ZFnfw+D9Int84Sxo/57sGaExr4LBbkmrnr+fUNYEHW+3ma
         aseTji7gzWYF5XhIkF+Hs256QMFJPLK30LxzSEAOi92g8PEsASbWs9eEiacW2Uu2adJS
         BhtA==
X-Forwarded-Encrypted: i=1; AJvYcCX/rSu2WxZKtO7Sa2jjUdg+YxIbnB2OWa/Z3hNuLfa9vgpDbH6P07sE8EW0Q840gp/Un1PYyOB7kr0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb+gtkYNzf5DNIFHXX0/M7DZE2C4KcNLDb0s5ZKAiEfpydG6y6
	ANhzWzHRWFcRwnBX1U6MFaxR64YUQgrh5E5S4k8P0xRwXKnhHWy8iUlrqGqK9/LPwvS0lFFHFaL
	zSUPo/RO3DQZ2NwMhkTij8cxz5iRV5e3RW6CEz614XURtK195ICrMP5439tj7Rxo9QN36CZs=
X-Gm-Gg: AZuq6aIYonT5/bgOBWYQhJIhMBdE9ItOwu4GrYEsSpugG62gDhejduB8+sp+Q6jxy8F
	cSBNyzBRMKB8QPzSzlqTo0M41haQP4MUnNukMIEju2+LKR9YguUTiBgkHz69bGk9tn46LQiu9HS
	eJBEEtiBrAKRhhmlndZPKzZbVFzy2tVc3sM80gvcMuAdiwC7Z0aY9dQp79MNAd4B1roSTpG0h1g
	5Ij/wajBGejWsxUWqKp3bB/73iZrjvuUiaaZWNjHL+wF87tXFikMhGO/mNnAMnX4LQXgnWThHph
	d2ryr4misG1QzDBvMGhXA6HMXsc5MM97j9FfxJ8O/fkemPGsP8H0s+L8haN2OlKAiObdNiRZshw
	3jU4qB5EHNjISnCa5aSM6ybp+m6M5qRRaA2eFd01eYy/Bd4M68rwJmJnpEx2s6Pt8ujOQw+40XQ
	u9qgFQgX71Y3tTozjnEDR/rSE=
X-Received: by 2002:a05:620a:d84:b0:8c9:737e:384f with SMTP id af79cd13be357-8caf16ec50bmr1247851085a.76.1770600760111;
        Sun, 08 Feb 2026 17:32:40 -0800 (PST)
X-Received: by 2002:a05:620a:d84:b0:8c9:737e:384f with SMTP id af79cd13be357-8caf16ec50bmr1247849685a.76.1770600759693;
        Sun, 08 Feb 2026 17:32:39 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-386b623668asm21688601fa.3.2026.02.08.17.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 17:32:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 09 Feb 2026 03:32:19 +0200
Subject: [PATCH v5 4/5] arm64: dts: qcom: sm8250: sort out Iris power
 domains
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-iris-venus-fix-sm8250-v5-4-0a22365d3585@oss.qualcomm.com>
References: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
In-Reply-To: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2348;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mp7znh5yUTXGIVAo3yop0t0MQrXUpW7C9vuYHOlkZ+4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpiTkmrrMdMhMEbVQIM2UwZj92DyXcxp10jHwj6
 jLWEQRZZzKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaYk5JgAKCRCLPIo+Aiko
 1RiAB/4qIi1i7I+vVAzoVhTQFOz0gVhc0D+EnKHisbvFDn3vTLE93OCIyy1sT+R3jpJT/I5FGyR
 aILzOSwDk7bmNV9iqh8Q046Yi1z5FwxGcE1PYC6ZclVsqzUkMjoP/PS5V/ZGPmA0M5e/To11NQ0
 iGrVdZ1Dx9B8vl0jVOL2MuGtNsblUbXKpwhpbDAx5b0Ia0jdOOUPWhJngOTxnsKEeRX+6XcBgXX
 fuHvmZ5ayuvKHqlSj/jC4SS7YYdPZMKzYqlSOmv5BXrK8rhzvFb/XKgKByn+55bRZOiKCYAXp6a
 Ucvx5TukvxnlZ0OimOI+itVCJgQ85l2t35XIHTDESkmypKLZ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: SIDm37yy3Y_suNMnUILCEzotRGacnoZO
X-Proofpoint-ORIG-GUID: SIDm37yy3Y_suNMnUILCEzotRGacnoZO
X-Authority-Analysis: v=2.4 cv=Rdadyltv c=1 sm=1 tr=0 ts=69893939 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=tBOqMctlXquWO7Kigf0A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDAxMSBTYWx0ZWRfX+NPrdX6HB/I1
 v+oQGONAaYebOGORzaTMofgnlCfBBF6lLzlBwSjW9nEE9yf07gzHM9T/QMnRFjWoVuu/YDIPsd6
 5JbWw/QE2mAaezEDNG5fL064Yu99Cg87Akgtbh7QMJOFOZ2iFqAI//NF6oiPODgT80e5ESvldtE
 FlUY6o3507lBFhMUBU5spsSEwZaDC9IaZSYG5PUqGx+5Tw0dx7VmQhDNIbp4Q8N4HB1N1A3RP5l
 YmJIsPulXYU6jlSNeL72TE8b3MX+BnnSNtmF7xG2RIhHXebZE8F3BERvurbQLrrmJyEtLinM87b
 feMnlsKvkG2oRXr1eLnJYfa04xI/CESr29xAguGivie1SCU70ZL54fvSJFeEPeZ8heQ5OMRgpM3
 /etNCtmFh6ASo/WqdiT3U6W8buPLssSeeI+RN6PQ4Uif2xzpcVKrkjkZtYKdu0PqwaNU15kq78X
 3aFK/rThu/aVh3t/CCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090011

On SM8250 Iris core requires two power rails to function, MX (for PLLs)
and MMCX (for everything else). The commit fa245b3f06cd ("arm64: dts:
qcom: sm8250: Add venus DT node") added only MX power rail, but,
strangely enough, using MMCX voltage levels.

Add MMCX domain together with the (more correct) MX OPP levels.

Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index c7dffa440074..a1ab8c3c27e6 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4321,8 +4321,12 @@ venus: video-codec@aa00000 {
 			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
 			power-domains = <&videocc MVS0C_GDSC>,
 					<&videocc MVS0_GDSC>,
-					<&rpmhpd RPMHPD_MX>;
-			power-domain-names = "venus", "vcodec0", "mx";
+					<&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_MMCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mx",
+					     "mmcx";
 			operating-points-v2 = <&venus_opp_table>;
 
 			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
@@ -4348,22 +4352,26 @@ venus_opp_table: opp-table {
 
 				opp-720000000 {
 					opp-hz = /bits/ 64 <720000000>;
-					required-opps = <&rpmhpd_opp_low_svs>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_low_svs>;
 				};
 
 				opp-1014000000 {
 					opp-hz = /bits/ 64 <1014000000>;
-					required-opps = <&rpmhpd_opp_svs>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
 				};
 
 				opp-1098000000 {
 					opp-hz = /bits/ 64 <1098000000>;
-					required-opps = <&rpmhpd_opp_svs_l1>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
 				};
 
 				opp-1332000000 {
 					opp-hz = /bits/ 64 <1332000000>;
-					required-opps = <&rpmhpd_opp_nom>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_nom>;
 				};
 			};
 		};

-- 
2.47.3

