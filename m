Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6FC388840
	for <linux-clk@vger.kernel.org>; Sun,  8 Feb 2026 23:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770594948; cv=none; b=DWlEfWy17TqsvyhcWD5k3iZzqa8a0qPRTE3TeaBJuj7Z1r2XKbkx7DopoEalqLEA7WzOIDacFSLpHMtXLv5juzWDHKiWG8P0RmD/WvgaI58Uq5AEvlvObYNx6/ZfDCYZZQ4ogXg+1Tklehwtt5fuEX7x6qKHngimZg9g75oH1aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770594948; c=relaxed/simple;
	bh=AguPyjryJFtRx2eaJbYNMbx1txjYcA3Blb6q3wboAz4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B0eruoEoQeqgtYd9gSYL2uyudvfLvFJJ6alwHbbSKvb19UhxMt2ZQOJ+fgalIZGY4q0gp4y4XpUuon9leudOSy4/JQPabb2g4lB/Vd1Hc71qGAicZEzOLbOA9r5THy212Nq8c3XP6XNcqPvwscP2lfAjehs5A852P3QDbwPbbDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Atx1lWEW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HZ9w4rhZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Atx1lWEW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HZ9w4rhZ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 618NeCwI1918109
	for <linux-clk@vger.kernel.org>; Sun, 8 Feb 2026 23:55:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+rRlQKJisATzVZPJyVOcJXS8qbgH74hMR0xOPMwnDPw=; b=Atx1lWEWblDPAMwp
	7xSV2eP52dUX4koVfMcXw96uCx1rex2qok+m28aRfzvVOTKYsAAA/lkD50ANn0GU
	8DyFaonPNUrv355TvVRQA7KEc4fBbd07fZQMND4HvkPIPMH37/X+H521Kj5wCdLj
	CydJ9Amkiu1C2KwFILRtkLa+RB1xNlNJ2PKrkBNvQZighsa4LUfxsquDmpYkfcAr
	7IomCc0WfIPJdyiI0XtwCpgSzWVmxC9v0xGU7MOj6I3qhxX3UK4IgE3sFNo1URvg
	l3cFPWjKLrVmc6Z0C8b/JjtQRtdzhUb61Hzx1G3cy42HxkMCc6z/YGzgqCG/pZtA
	/0obBA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xj1b2gg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 08 Feb 2026 23:55:47 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89546cbb998so62161946d6.0
        for <linux-clk@vger.kernel.org>; Sun, 08 Feb 2026 15:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770594947; x=1771199747; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+rRlQKJisATzVZPJyVOcJXS8qbgH74hMR0xOPMwnDPw=;
        b=HZ9w4rhZtUPgJWBnjKO4I/Y5jP6AEILBDeFlRsoPNNRCMZBfQ0EGRt1+ROWnxvlbqD
         nkC62huSUQOwbv+Zfzit99pj0BClmgBk7nOMxzWHeJfY3uScoYGW6olzRuwu+2TmfVHE
         m2dO1Z9ugLiVULnEjtmgcUIJGcN7JTVqojbLSYNrsnpw72DPuLFbSdAD3GhrTtaCPsu5
         IaXus5xKZPuanMxinilztFbViRrD8NneGK9RveKqAhrtsTkqohj8s0Ecd1WiYgzsEXOe
         RscNcdiF4EQ07fRX0cx8AvLiQTNuc6QzZCU3CkNKdK1DdgbvPterUZNNva0RDHWcD2Im
         /orA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770594947; x=1771199747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+rRlQKJisATzVZPJyVOcJXS8qbgH74hMR0xOPMwnDPw=;
        b=R8pY+f4Dh1xwotuceE1XvyudQncFGaH5o8j9MzOdk4oAKVog/U3RaJRTNENvknTeln
         TElBNdW3b4uvXZV3mLcZ8F1KpRiAc1cMPqsedkO0vzPd4i12zrDac/R0J/IYbQhGqZX8
         jjVDsBUVkgQ2O7YgrYv/QlvUGavGIdHFGVdNrXu3jC+6X2YvrjnpXQWbmrgaS5JJu6E9
         Xy/Yk85mwoJGpB9B46tswxxsti1fl4R7iCHjd//YHSk8zRdGzCN4cL7NCpCtSskbCV6w
         WZi+BG+6su7KE/NF5HXkfG2Lhx7lZQ/wQ+cKAJEio4qVf+ugR0awyYFB0xQ9UCWu7sud
         U3yw==
X-Forwarded-Encrypted: i=1; AJvYcCXfsHmEczTaBYq2TsVYCSBusybNyM37mfEHrdYYjuXOEGsofd1XpilK6s8ZO8QCo5l+Kio5ZSl2nD8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6o3rHbSNwZ8ETbGGQ9UAeQZswqnKafVKv8SwIvZN24amR527o
	8lFgMp8R3NEgfPDm4RebCjp+n8KiWbxJBq/g7FxBDa7wS/CDXbhVqgH3gPJzUkOoFk6O7dCR/jI
	V8N3O+O7SdH+SKWlvF7a5Ck3Z8B6gIjqWVrLAGkkBkFi92RR2yd7LcwaFd+oJpAI=
X-Gm-Gg: AZuq6aKBg0oKM4AzMZl2DSeboiiXYsJ4E643ofJihbGJ322XQdpq4OgtU6kaU6Z0nIb
	fEoRAg6kbvYhZeF98d81dc0x+sYmQ95HCziZQOOklzLk92578b5mbeqtU1Lx8nzE+/1+k4Wjgoa
	0qRs8s7psIqrsorwkxqNPW/GMWhfd1QbSFjjT/DE1ciwTb8DotCxLI+xCY/4I2M2k0S3315nylX
	I7sItMAGsE7aBdevhAeH65ENApMjRDYfvRdmJtEv6QL4kGmuXlYyDZ/WPdNuLtTv17kDppjcWVV
	tke+fAEuHFRKMFn9dF/89KVFS5gwW6MXdQhk5Ah7CuZhwJ9HzBdo82PTdE1IDJG2bmjsEVmq8W4
	LD4LZtD333aKIYb+XV2prHuSrB51zdeTTmi0NVKMWbrz3+IPBDH9V+FPz53x45CCr0CdzcPT2Fm
	ZxdmVN4Qb52kAb9t1Y5y8GO6M=
X-Received: by 2002:a05:620a:390a:b0:8c7:1b3f:5eab with SMTP id af79cd13be357-8caf17e3d13mr1252410485a.60.1770594946674;
        Sun, 08 Feb 2026 15:55:46 -0800 (PST)
X-Received: by 2002:a05:620a:390a:b0:8c7:1b3f:5eab with SMTP id af79cd13be357-8caf17e3d13mr1252407785a.60.1770594946165;
        Sun, 08 Feb 2026 15:55:46 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44cf6ee4sm2188074e87.4.2026.02.08.15.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 15:55:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 09 Feb 2026 01:55:39 +0200
Subject: [PATCH v4 5/5] arm64: dts: qcom: sm8250: correct frequencies in
 the Iris OPP table
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-iris-venus-fix-sm8250-v4-5-9662a0471d82@oss.qualcomm.com>
References: <20260209-iris-venus-fix-sm8250-v4-0-9662a0471d82@oss.qualcomm.com>
In-Reply-To: <20260209-iris-venus-fix-sm8250-v4-0-9662a0471d82@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1944;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AguPyjryJFtRx2eaJbYNMbx1txjYcA3Blb6q3wboAz4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpiSJ70t1Y5lwN36+qM0IdjFviCgJPTo7IY9tFT
 nQCnAXi4eiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaYkiewAKCRCLPIo+Aiko
 1dngCACFJUOZG90YgvHwIKNH5rBm0cnYlHslF4iaZsx9Vv9DbFf5jJCHqjRKnRtRH6N70/B7mMs
 LYwMFOuuh6IcfU2YOtciTktW14G3GkzPDYc8m73e0AYiVM4Fr8/oQ6BEaFATQJNb4JQOAD850A2
 bNdWeKtujwd+JPUSuCRdElQ1vsuOYDtP4z//SN2mMqr519aE172IgPmkswdt9EOmGrt0BwGKY+q
 KxdO23YchizPSOwlZQiF1Zmp9HWQE7k35gBky0Tmw5VW13aK+HlstEW50rQ108i5XENqWy/6HIh
 kqqNc1Ga5GABW5SPabYcIWijPnyV/IXPEk1QxlgeUWrKhDit
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: wijQ979TFWlm8Ww94GGvXzIFJeeIu8Cb
X-Proofpoint-ORIG-GUID: wijQ979TFWlm8Ww94GGvXzIFJeeIu8Cb
X-Authority-Analysis: v=2.4 cv=F/tat6hN c=1 sm=1 tr=0 ts=69892283 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=EQKuo8RqpatckOKiKW0A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA4MDIwNyBTYWx0ZWRfXy4wtS4WVYMcg
 LhbkTs8q86PQR4++DPSXsDgMkROeIdDcFWc8wolpeqHuszcHqdpS6aXLwdGAPsdAYfg5TgDfFwd
 n7XzzF3fwEYJE2YjdJsf8RjHLgLvMqFguQkqQlD09CsQKjoYfQZ5Kq9cYcFNOhVCwBOfL92ehiA
 UKh8E2t6Ecy51+bv+wVYOEOFqRXcJLSG8xqG+9JEQkmMYKF8ZoSpw2adGnA6j2tFnAE2dVftNBo
 OLFJc1t0I3N6JhVSDtQB8EZeI+pfFvwIcjnnUWDn7/5/C0Alx5pGCpSZbNQK2hRtmZoF5m4gj2C
 kTxkQAEPtpAVRdGoljZB2grhKrLEx4AvI+5EUsClqcHRDOtC8C78Z/XJgzRyBEnNLbJuxd3ahuN
 Z3mTAdtm/PDkqx83Jddpcam1dvHEaI1JCt8z5xjNUYiERzsf5dCwJqQFPhNP+dzu30pX7sVQ3BG
 CH9876WGpj98EK+LNTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602080207

The OPP table for the Iris core is wrong, it copies the VDD table from
the downstream kernel, but that table is written for the
video_cc_mvs0_clk_src, while the upstream uses video_cc_mvs0_clk for OPP
rate setting (which is clk_src divided by 3). Specify correct
frequencies in the OPP table.

Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index a1ab8c3c27e6..a80defcb29ed 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4350,26 +4350,26 @@ venus: video-codec@aa00000 {
 			venus_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
-				opp-720000000 {
-					opp-hz = /bits/ 64 <720000000>;
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
 					required-opps = <&rpmhpd_opp_svs>,
 							<&rpmhpd_opp_low_svs>;
 				};
 
-				opp-1014000000 {
-					opp-hz = /bits/ 64 <1014000000>;
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000>;
 					required-opps = <&rpmhpd_opp_svs>,
 							<&rpmhpd_opp_svs>;
 				};
 
-				opp-1098000000 {
-					opp-hz = /bits/ 64 <1098000000>;
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000>;
 					required-opps = <&rpmhpd_opp_svs_l1>,
 							<&rpmhpd_opp_svs_l1>;
 				};
 
-				opp-1332000000 {
-					opp-hz = /bits/ 64 <1332000000>;
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000>;
 					required-opps = <&rpmhpd_opp_svs_l1>,
 							<&rpmhpd_opp_nom>;
 				};

-- 
2.47.3

