Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F8E3370ED
	for <linux-clk@vger.kernel.org>; Sun,  1 Feb 2026 10:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769942970; cv=none; b=Xz+jVgsYsDcN83ErRBEApaLxjO8XJm++1TgDAys59OVgmVL7b/zDHMhhDriEs33XgRk/GiY+jZzRE//TZjL7NATZOIVkWRzkofoKf959D1qTSgPRu+IJWCgnGW7WaK0IWVuIMaDeelFqtuIMiU8QTJ6KWwvR7xF4E6sBTprmPK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769942970; c=relaxed/simple;
	bh=rOtATlSUdBEg1H0iWW1mR8swNg1N1WiPDt1QTwWw37Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QPRucx7aUBIcZrNWsu38arQ3aamtkdvUZcZWMnyUwaaEU7r4Bszb8iRQXajhTxKnx6I2krkC9KFCZesSmBwbqq2OZLHadQ9CeKyjlSdl8FwTb7bm2gcwT3Lp6g4Ur/lJl9FZe9HJW4GoYMl0dcOFzAoAauELGY0nOheA+qTTJJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aa23tBV7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a//g5Xam; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aa23tBV7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a//g5Xam"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6117mEIu3685424
	for <linux-clk@vger.kernel.org>; Sun, 1 Feb 2026 10:49:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FAPtvj1aaT/4nS3PbQJ8vu2dWXMqUi3SGtAzQD4qK7c=; b=aa23tBV7ONrBIQXf
	HkaUgvvVAUtiwydR0UX1F/GOAy0MPW3PNYf+i6yotyR/DY2beQEpOmi4oy3JRTCu
	WXwi9JBc6224Apt69Z3TFfyr+Sg9a3BSVc03y77TxxmiIEqITXnjEagJRuraEO+A
	evK/GRhDiB2wcxu7bfcaDIkSPzEROt+E4wjKO34vV019LI7nNHe5TzTI+M2oFP6d
	z9mkE53LL+38PQLG79wTv/Mv1geS/H3OYdfVR8vGxKr+tmmIxXnwgnv8e2E8M1v4
	gutw3VBeMMdO/DPAq8wP1uSpjRy1iqlZrzNT3e3DO8N2HKgTeRrTTpr0DKMFPBsi
	3yDlTQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1as0tfun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 01 Feb 2026 10:49:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-503915b0a88so57255201cf.1
        for <linux-clk@vger.kernel.org>; Sun, 01 Feb 2026 02:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769942964; x=1770547764; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FAPtvj1aaT/4nS3PbQJ8vu2dWXMqUi3SGtAzQD4qK7c=;
        b=a//g5XamJQkvZj/is8HbT6D4aetlSZS9pvnRW4sB6Z3TBCLFyuVPDunt8zhsbvf5DO
         KSRL9uSllaSYxMmvLsCZwe/vTVOdyWtN2ibGm/ScOQUzTWE+X3I/12muREQOtZQcymao
         oo5s5os06Q83LjadQM44gSe1GuY9BpsX/6LYO4ealHOrWkYjAqd8hJz6RKGMYDCv4dj5
         iV6fzxaZrwg27cN79jdZetEKi1kHhLQsDwoJi6gkkqflXeVk50l29e9Yz3YS2uifdVkM
         gX3hQVMP5OLv+ElLfPEI/UyyMgx4O5J65R91tEB/4OZDjookWv4kYNF9gFq5AfIXC3jX
         sXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769942964; x=1770547764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FAPtvj1aaT/4nS3PbQJ8vu2dWXMqUi3SGtAzQD4qK7c=;
        b=w3QKFAH7klYkL9ccCJvdM2e1SForInsbDNPJkptoxk6ujLglqiq2ltZ4rbjW0x4fT0
         IA/sbyOUtM8pF2wy2WZo6Y4c2sqquhrGdOygBaldSoDay+SeP3njOByhgwroCk3tqiPA
         a0vT7hzfbJuu7g2fcK2jxpvFK4nSRc56bUt0Irdh30qFka+CfeTRnW2Of8LGb+ueWjv2
         yNAg4fQ9095/0gNy4DOleV+BWZI6cS8qXl5S3aGfK8IiwVbmpKZyX6+l/q3vC0snObhq
         OjIsYRSWJmU5YTKz8tyhOuzMsaeuOx83axkQFISeQy5JMNWU9wIGtKsscleAS3f0Z2hR
         iZ6w==
X-Forwarded-Encrypted: i=1; AJvYcCVcFMNJS0x1WAIclMSVuerirbDQcicfsXPn/y82MEysoGOnnKUwo5lq3ul6WWcuumeUJJlosmcG/s4=@vger.kernel.org
X-Gm-Message-State: AOJu0YykC1c8Lt2w1WCdUDOr5Z30XCjh4eNLWeAClkNcaIxOYSlBiayD
	8CLEw/ufdVzLaPBzeSO/Si5c2FzKHrS6FrwBOLXP/tMgyAnaA6e6BmyLri0TRZ7KEki/VZUU875
	EcKqQBrVMOZkwPG63vq52NVGDyIfMciu0It+S6JPMN94HfnPrVXSFe7iP1vMeMH8=
X-Gm-Gg: AZuq6aIlsgUoeDiaI5W7kq7igDhPX6hADEPG/4uqzDy1v6OR6zJCbYI7CL7Tk7wtiyR
	ujR46iaFqmqcS9iD4N+8NWY8+JrMZlPZJi+wCSPnViIea+yUxSGPEe700aVa3yVch42Nh+taSAB
	VS9eIehQX1jGfajIT2w0AoHu3HRN5NBBHQf2zXr6kUHrsXxBm7mqJtx6MZINp14adFuc560hA+5
	ac/lup7jJCJMB6Ubhe7eaeLSpJdhc3DK79DlVytzZ8MF3q0u1Mht3ZLXh0K+xU2elw0MTwGzVks
	Gi9MxqsMmnxTPXUx69YwATxAl+BrjQpwC+jAtk32Fo0QKRCEcJU81X35t7Sq4RvAVXmAYPwOZOv
	xYIezSQIIzQBtaTGJEvMHnA8qsDxn5vDZ/vfkzHCj8B+y0YcbuVN0RQ4kKFwnrt4gRaLwYklDE+
	Rq2z2PCiDdc4mmamdh3cKlcmo=
X-Received: by 2002:a05:622a:1186:b0:4ee:1301:ebb3 with SMTP id d75a77b69052e-505d226c899mr92131451cf.54.1769942964430;
        Sun, 01 Feb 2026 02:49:24 -0800 (PST)
X-Received: by 2002:a05:622a:1186:b0:4ee:1301:ebb3 with SMTP id d75a77b69052e-505d226c899mr92131241cf.54.1769942964085;
        Sun, 01 Feb 2026 02:49:24 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074b7a8csm2835006e87.77.2026.02.01.02.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 02:49:22 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 01 Feb 2026 12:49:05 +0200
Subject: [PATCH v2 8/8] arm64: dts: qcom: sm8250: correct frequencies in
 the Iris OPP table
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260201-iris-venus-fix-sm8250-v2-8-6f40d2605c89@oss.qualcomm.com>
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
In-Reply-To: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1819;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rOtATlSUdBEg1H0iWW1mR8swNg1N1WiPDt1QTwWw37Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpfy+mrexJvxvRxvLaDB/4xTWsitXwKRuyapAos
 wg/sBPcXI+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaX8vpgAKCRCLPIo+Aiko
 1eE9CACeDHGYlons6fPMaRboS7Ni6okVtQVdnWfL12L81cp/aVNkJSn8SC5yV1oTFjQLoo8PFNN
 isOA74pcXcDEcKxmDKGKK0Ukcg6y5aezORHTjfw2eBYENAqFz18givnM45c2feDkHhDOtA3X8WO
 xyDB9oT5EU1HTv5vwRcw+kC7cpue14qKM4AD0T/R4FInatsE29mwajYRBTDSlU+49ku4JTbLVQH
 wsox9HD/rbKxlyWWrcchYEYlKxsIRdcMvd/Ik9JgAB09gVotPHLzNfVnsmPXoRfH8eASGGXuquK
 /gnW+qiBIJgQoIx4dz77KWzj6BsUEclyh/ByBnOgW2UCFd+J
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAxMDA5NCBTYWx0ZWRfXwfgbu41M7Ihv
 WNSzeOOcZvNOuuHFe1GBMrfGry/vrmtP8x1I/zv6iS69yE/JyKfHMk1iZkEt9/qjXqYEvRDAKkL
 FjV/MNtezFXLxJnkWfHlHRdgOH07Bm33H9KKPPPuE8HKMrM3pUEYWyb4or9fn/674vy3sfuvvKB
 r2Qo+uLva+zkQJRKba7hyk4r6jBAykBQVPUTTr8qmKW6q3ilUx0IpJpmD3O+HpaGXs0ykUMQ40S
 4bR1xmevqFJO87YTgb5h7zBlp5fI5au8al8B3g2RbW0Ec9YT6kpEOMm9LwtkxCyJHerLYiEb5hM
 Atyt1LI8x5J7MPDOEd4sZ5mSDma6v/NpDAtmweNL3EH1npCzU/U94KmXLrZPEPBNlZCasX4xkBf
 VH+CdE9kVBpv/RfgrFYyXy4b+agsN9wmPIuTKpLquKE5don4vFRzz0uVGVX+CedMszpMK9aj3gy
 uROeAAKAyxyRCtaXN7w==
X-Proofpoint-ORIG-GUID: L5Loych9LRI0g_jwWlHkUkBdK2NH9Zv3
X-Proofpoint-GUID: L5Loych9LRI0g_jwWlHkUkBdK2NH9Zv3
X-Authority-Analysis: v=2.4 cv=MYthep/f c=1 sm=1 tr=0 ts=697f2fb5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=jxPhmlQz5o5YGUuCidoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-01_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602010094

The OPP table for the Iris core is wrong, it copies the VDD table from
the downstream kernel, but that table is written for the
video_cc_mvs0_clk_src, while the upstream uses video_cc_mvs0_clk for OPP
rate setting (which is clk_src divided by 3). Specify correct
frequencies in the OPP table.

Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 531470506809..21a186e199a5 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4350,26 +4350,26 @@ venus: video-codec@aa00000 {
 			venus_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
-				opp-720000000 {
-					opp-hz = /bits/ 64 <720000000>;
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
 					required-opps = <&rpmhpd_opp_low_svs>,
 							<&rpmhpd_opp_low_svs>;
 				};
 
-				opp-1014000000 {
-					opp-hz = /bits/ 64 <1014000000>;
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000>;
 					required-opps = <&rpmhpd_opp_low_svs>,
 							<&rpmhpd_opp_svs>;
 				};
 
-				opp-1098000000 {
-					opp-hz = /bits/ 64 <1098000000>;
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000>;
 					required-opps = <&rpmhpd_opp_svs>,
 							<&rpmhpd_opp_svs_l1>;
 				};
 
-				opp-1332000000 {
-					opp-hz = /bits/ 64 <1332000000>;
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000>;
 					required-opps = <&rpmhpd_opp_svs>,
 							<&rpmhpd_opp_nom>;
 				};

-- 
2.47.3

