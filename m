Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B435B31714A
	for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 09:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786352519; cv=none; b=P8mj32cKnbau+UzWVxJ1pwfMqtplWjbG2cIYJcVsskFPzbqDuZoVhTy2iVppr+F6q7WWSM5qHrQMrK/Z3vw+XQwCUTTVuMJWcbGIyY0OJoULpJqpogKganh8uDcjREx3Y67yxPJH7SUM0nk1GlDGJbhIxNCuUPDknL/RMpGbPCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786352519; c=relaxed/simple;
	bh=BeGiej4IUPjT9Cd+jcYbt7GKGi93yknSzUrbBsKCeKE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mW4aH4RQlJX9mIGgsyO9YcsXsdh14RXoVPFZXzZq7SJFLtoYgA2KmwfVSkw7o7Nt6w3v3RFTiH6keH/PQtcPSCZPAWG6PbxJNLMciUc2B7f8twT+1oRVLioUqXWZtgsWNzk+Ufvvru2zJanNGzLCi/kjwI4/wb0rWbALNd8w8PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kiZIRWnA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cv5t7ERO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kiZIRWnA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cv5t7ERO"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A5pWkA697978
	for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 09:01:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=snuObXVsK1bpP/PNwM2eJg
	xMyfL5RJQlKdDCoHlozYU=; b=kiZIRWnAfv22fE+nTP5S/dufwpjk8SrGmOlKDF
	zdVMS8RbJYXRYOacKQfL2tcrCxUDOZl1JRYwuudaGDYJpiw/bOcb1+xUDu8RNr2X
	3QLj3iT2cf4r4ZmPudJZW+XILkt8Xl2TMbAW40YYaNRM0ZuT/Pq7sD4gNlwRb7Qm
	7yrcizg0EHaBjxEnr87rDV5bIqkT+hYE5BG/pbuh/4cdpXV7JN66ydl0SLf41q8T
	/0TsHZgGW2rnXx1UZ0rMmp/k8nuuGlLej9gBa/pltlxPF8xpBL9c9wNzSYwpuBQJ
	Qwye9op+xzCcVzaX2RRDMRqoz88iKRftBqmGQAgfYE4A0n8A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v28mp6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 09:01:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51ebdfceddcso20645771cf.3
        for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 02:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786352516; x=1786957316; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=snuObXVsK1bpP/PNwM2eJgxMyfL5RJQlKdDCoHlozYU=;
        b=cv5t7EROgZdIWQ3A81rVBiBnTy0DiV0Oh75un2jbD2z6xGigkk+K+6f9bmyIc6bu1g
         q25xhxsRK8o92wVXgmFk7B/krTBiqSMy62abuvCFXnZy0sbam85/RGayTCP60NqnT9Ck
         1KP9cngMtsN6ZglqZKn6cSlowEgJklzy77S888m8KU2n8z3aXM9wmL1SdW5r60ZZ2pnz
         oS2YjAhwVcEQ8yGHibWtvR7leCTLrHt3psPFTIupE6bSQRrwZOkkSzzwUZ4SiWlwTJw2
         Ht6BSALrAdGQ04Qb/XDgOKJ0Rwp7Lq5rFAO4DRzf8xybQ8ukeGI5Pr2qlKAVrjvS59uL
         6kMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786352516; x=1786957316;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=snuObXVsK1bpP/PNwM2eJgxMyfL5RJQlKdDCoHlozYU=;
        b=SldBKmVqZeZQ8EzmomgkAI9kLEnfcE7MRrpsYM6VHRzBIf/IiL/S0kCb65gWPHvnNV
         C0uoR90qbDW3i7BykohZYPtpMUHpkXcN9EkCyd92sDrG7wDxygPvjf8BkSQAXAbsEz6L
         trLtO66jbkBK5h4JdwlzyZHTUvSWxohEM3NUJz12jx8bWnoCQwpILec5FtyXlkgxq/eP
         BfWIjE0owdKlZmRk8FrYgy/KMnAZTBkXp5UzrDwZaeLkJ0PNtkCfml0nxBztIGns8TRy
         4SliOPDXaIxOjrd7KrMLsZgpD29zrEhfCmZnRiHciiYDJKmTEcCQbq2Ct07eq5tqOMtY
         7OAA==
X-Forwarded-Encrypted: i=1; AHgh+RpTHjiIK3WWM3ANDQYl3+udQg6L9K/YVbqqz6k1GCCwzRJljUN1rBEY8g8SdBrA6gCYds9bjWqW+LQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy07meU/bo9V+W08UtTdzRiU4p++T9lWYFU59T78JsuQoQMYp0b
	dF75+AfzIzYiUboZzvUKwFV3JANM5KHmbRnzTntTYSXSrQu2YpkrgyPijFra4DtKpTXj3KN5j0k
	kE9FpQr1Ik5dI7Ry9WRpLJReSY5TNVHs1DNQZPozl5LONOmW4erTrpRuPLXgEENs=
X-Gm-Gg: AR+sD10gmSgEnDH/FI/fMrMSuBcL1nE3lLuuzCBtArQRIlWz9LAWjWgnkQzNhKmH2KA
	rwEb63RLyW5wojDi37+RS8n+82Xzbn/ycjcUlOofx8PV59SoNIZRC7gkZq++DBJ3Ed8oaYB2XHQ
	CSMUStVP5VfyW9x+nZnOl4nBwdaqVKJeoCuAQsWVrKrX9OCKlCzQlBkLZnDLAvk22zy+NqNoUos
	XpEG/Y0M2QVUMWGAHBbXKZfwpvxF93Qlx8Yrpb8zv234462/1wxFJHuQWLIU0hyVGVziyRuV4Ah
	AlJiVDVrTOf70/oCPdnj/WIeNQe7qvSxy5F3tDIEUifwmcUsb8c+W+9g0HZJgLt6GS7fYwAwJmj
	ikyzJTkd3tUCBuXF4WYQKmpi1E8KZVRpWidi+QxNc0E5Y+JquCPMgmW38ocrmScV+pF3oaxaA7F
	vH0xy5nZ+Nk7eBwA==
X-Received: by 2002:a05:622a:5806:b0:51b:f40b:2fb3 with SMTP id d75a77b69052e-52d4be1ab03mr103821cf.9.1786352515676;
        Mon, 10 Aug 2026 02:01:55 -0700 (PDT)
X-Received: by 2002:a05:622a:5806:b0:51b:f40b:2fb3 with SMTP id d75a77b69052e-52d4be1ab03mr102851cf.9.1786352515219;
        Mon, 10 Aug 2026 02:01:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b304fd1d76sm1911792e87.16.2026.08.10.02.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 02:01:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 12:01:52 +0300
Subject: [PATCH v2] ARM: dts: qcom: msm8974: add MDSS reset
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-msm8974-mmcc-fix-v2-1-5c787d79c0fa@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAICTeWoC/32NQQ6CMBBFr0JmbUlbBQsr72FYlDKVGku1A0RDu
 LsF924meT//v1mAMDokqLMFIs6OXBgSyEMGptfDDZnrEoPksuSKV8yTV9X5xLw3hln3ZkYd28L
 qSpTaQpo9I6Z4V16bH9PU3tGMm2dr9I7GED/7z1lsvT/6WTDBCm5lZ6xQncRLIMpfk36Y4H2eD
 jTrun4BLsRlU8kAAAA=
X-Change-ID: 20260809-msm8974-mmcc-fix-c83b5fa916af
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1721;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BeGiej4IUPjT9Cd+jcYbt7GKGi93yknSzUrbBsKCeKE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqeZOBbZYeEwQHMUL9Z9TXNIbe3d8jBFXy6V56N
 2muVE/zw6WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCanmTgQAKCRCLPIo+Aiko
 1STHCACq5iEo1kNw1v9C4Uf+e1OGk5lak+6MMNzgIaXLuQbUp37AGjbtJ4f1MEB96qT7JldL0y9
 2nvju9Jd3lt3/KU/O+URMztszg7gx4otKKf78Tm270Lw3hRX/ko9nyj0ajHCEd4pA/KynvASskW
 B9EhXkFRd2LVxmOgN0cZ9Nmul3Xct79D0yHGQGtcLKsG6LEjPUwxl/1X9kVtWsUMuQx5Qh7fypa
 TvJzjxASFlg4x1nEcurgnbWfcpW5oRwxEspPB7/k0sSlv3cpxSWDEPcaVyasDpqviK/YPZ9IMZv
 4Vn/a+G5MjLTdRgMpF8OuiO8fOTAxdUfMxOjEtbQElrPhEqo
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=S9PpBosP c=1 sm=1 tr=0 ts=6a799384 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=fGnOUpkfZkl4fvj9H_EA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: kSea2vsW7kROP4W515KBnrN61PyjWH4A
X-Proofpoint-GUID: kSea2vsW7kROP4W515KBnrN61PyjWH4A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA3NyBTYWx0ZWRfXz9hS6XTT9R9O
 sViEm92pCLQxc7uqXiA3CBkQFR4b+BrxRLoFo8EhMMWFc1aVVPvCg6CL+Tm3wRNb4QcQGlV/Ewo
 m2wumih7jKutzKHq7POMZ3Fa5oGC9yHo217e+ykMQThSascGDJIM0D20ph/Z2Tf5ugKDDyL/epi
 U/7rtEH8KmPguuwTE4qeYZnZa3agqyi4E+Lb2rzqb/J0ASIu3tYDaqmKn/GAzl0HngVsBv93HcT
 a5UXnJgrzVQSjNrMioXmf8klayzAwJ9/NyGcP/ooL/1C05CS60Wn3DAz3yfiTG2wjeX9emk3tLH
 nbgWPigWX6LwkbTblvo7BvWPaJSRiv7ZWl+zgVZCEpIA1hWJQXhk0c6zUFZ5OQoXyeiGSriSalD
 xsJrmhKt9kqWs34+FhMESaB3Lnd3qf5CCviXz/FUZ0UQYudLA/BJmv5gKwdFnhKyhu3bImfBtxI
 Y3fEEw2LLopdaIyhRog==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA3NyBTYWx0ZWRfX16S5AVSIi+n6
 v6dYIBbEJ9Yggd9Ybcoau4weT7G/IKzFvfmqwXgJ1xBL2CsUMujtjIxKd5wTfY2QAHnO4AbFv4H
 vY3PydoR7jVI8XhhWQ25ShLb4ZBAxmQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_01,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100077

Commit 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds on until
late_initcall_sync") kept power-domains on longer during boot which is
causing DSI clock to get stuck and fail to acquire its configuration on
DSI bringup. Follow the example of other platforms and add MDSS reset to
the display subsystem node, fixing DSI issues.

Fixes: 5a9fc531f6ec ("ARM: dts: msm8974: add display support")
Suggested-by: Stephan Gerhold <stephan.gerhold@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Replaced GENPD_FLAG_NO_STAY_ON on MDSS domain with MDSS_RESET being
  specified to the MDSS node (Stephan).
- Link to v1: https://patch.msgid.link/20260809-msm8974-mmcc-fix-v1-1-50f2dcf18d2e@oss.qualcomm.com
---
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
index 06c0af0aa317..f300de74c47d 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/reset/qcom,gcc-msm8974.h>
+#include <dt-bindings/reset/qcom,mmcc-msm8974.h>
 
 / {
 	#address-cells = <1>;
@@ -1935,6 +1936,8 @@ mdss: display-subsystem@fd900000 {
 			interrupt-controller;
 			#interrupt-cells = <1>;
 
+			resets = <&mmcc MDSS_RESET>;
+
 			status = "disabled";
 
 			#address-cells = <1>;

---
base-commit: 6b8c8af514d739d0335f5579b585e02babe8a727
change-id: 20260809-msm8974-mmcc-fix-c83b5fa916af

Best regards,
--  
With best wishes
Dmitry

