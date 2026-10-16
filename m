Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856802F6188
	for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2026 06:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792132136; cv=none; b=kPg2WiOZA0BqczUGfLA0F1uXr0K45/RuI3UKekPoRJDAvIppeAFkSeVD7We+PiRZSlsPE1PySsUMo2za/HPOw51JZRkmhOg+Zh5nrpEGEsDMlR/BLa4FqHgc75Lt0SvZK/lImT7TQ+giVJdtjLmEBUiPpIY5Weuiz8XTP0S9zrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792132136; c=relaxed/simple;
	bh=I5REzZ/WFiqd/PwWnEJ8yf3X+m91kZhkF2ZuNWQosgo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DSkMg5vdIKgcWZXmZeqYEmABy5FDKsn2JCtM9pUS0M9Odt+n40xbBXblueyue3R8HCpCQFZ+rsUXVgr7O5u/YgrcFeHXshJhW72Ap/VEYEfioJ6XSuSUQZlK2Ge/BqFCKD+qX92rXHL5ZCpIgEUmNUfW7PbLLMd8ib63ZmScdJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PyjG8TfG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OTyQIOuZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PyjG8TfG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OTyQIOuZ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G43tAO3874780
	for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2026 06:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YXJ6nT4HdJEIzEtGoCtJaU
	VRrkJ7BX5U4CPOy6uCn+w=; b=PyjG8TfGJute18KCdlaaJtqAtvBZ+ojqO8qdKv
	TIEe29vopDrnvucua1QxaUVkfpTMT8yBme8+SPGdobEAzLRe6x4ywq0uvZe+DV/m
	21wzqGJmUkzJ2/QgdcOIh0Ip2wj5D0F9GT1RiKX8cEwmsnX1EBKiX1ltc5Yw9C6l
	fMwA6fdrH1ql+H4j1IREuBLSX0GdkMIrUaSUGO/B8l4+Fn0KKhQJPAtDEEDcKKnz
	9hS9V0FKcmOvIwi4cC4v00U72DXj1IhPL7F3faS2wPo4CFZH6mEGznsCVBKwhWmz
	AeXHpShNaOOydOEDtJrrpIAPujOJceRpuGha4sPaTquthTYQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbcjt8ene-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2026 06:28:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ac76132001so2108419a91.0
        for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 23:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792132132; x=1792736932; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YXJ6nT4HdJEIzEtGoCtJaUVRrkJ7BX5U4CPOy6uCn+w=;
        b=OTyQIOuZQ9jf8J2nDmLdFVLXR8Y6HJhpzgOY9D0vL1CssdMzqg4a3EN9nR9wi7hqJn
         CkU4H+viB5fiwRvpSv/tO579jpRRJsO8nBqvL5iSLzpJK5kzXxGdJxKYsM4KyZovzT4F
         rokBS2Kzu0nYqG+DrRM1ZFcb/CEe3MCISokf7poy/KTQGB5cXS5LYG5WztA2RxYigzHB
         kSaMQyV/di+y2zG9Jd9D9ifbnYjg8b5ppZhHyPRbOugHn9QNQep77UhicylBSpxdbK8a
         rOicI42NhLPEcjhsV9rZ7qmpC/15geBvGXhLApEA/36uxW8pP1Oy5P0dSeL1ZG7HKipR
         YheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792132132; x=1792736932;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YXJ6nT4HdJEIzEtGoCtJaUVRrkJ7BX5U4CPOy6uCn+w=;
        b=gc3evQlzZEN3cIEIBN7jKus0VcsNOPZouoKJWq1PeRfTip+/+a/8XaTaA5Akqrxs1R
         pNytoBCWuNtc3YAC99Dch81BcfS358diiF4dtojOE5QUQeLRWnXoRoB3P9bAOl/wVG1w
         VNIWoJEvGaiKUOAlbBfkJYAU4jdNK+2ZxGNu9knTT2EywCYa8CQV6AxHpeL+qTHokLpl
         ked8YQ/CdvtiLebPrTg60QWALHVSAyV9tanxJne/NH0jmDdXXDFxeGIFEJIgdLqmAX46
         PsAwO7q8DjrPmatdtbY+a/rMTcoYZNrIswKVXKfZXLEtdwjLOcHOfNV5ff8kXWM7GYJM
         U60A==
X-Forwarded-Encrypted: i=1; AKwUvBwBnuLqbfWxKng6qVyTLFvu5QgA1WwmoyxytBMwYjFbu61e78/Tj+/zJIkjMpSDUHt6tkVcd/AftVA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLR3qg3xsgl3CttF1Uh3Ylam2iVSmUKkGDPLWBBZwz9f2SpMG2q
	IivPrYa+SoJT6XxThO9ZDaoz5xUV3/3tbKFS9U9h6iWixZ9pLSX8/S0rAprZofAZlTVyG7TM/Uy
	qeiOU0jAaJfJC50DLi8aVJknYZ2LcGBnQ9o+kgbtPsU1K5GpF1BMMJoKvynRFUobqZHcAI1M=
X-Gm-Gg: AYBFou1ihgcdDylu/rtOrG2IzKIRZt0E+3lwGAwGilW+r968NDa2eFJf2F+VELfqwde
	/d42OvuIEBYeRFstnvclB2ob/FjnzASTKYytrC/f4RP2FSAP+FRifMMldUirek/GwM75eLONILr
	Aq1pQNQtXPWM0R+o8MPJ8SvYh3EOF++lili5qvkVRwbGgcGQyITTEGpxPhTe4tt1gFr9lHT4mTc
	kkvxjKvnxqHbfliX3FVi7cA49fgTi0hEqKyRsRpaCOr8b/p+jlZnpHqq37W9VD7bODkM7vHBjVt
	XSNQiRC0YBSn8YYggJzOuNlKl6BGBG+wRhHqBov9dhamRAVPZy3DjC7VXTjAdcfiGqnLRHF9AaI
	w0FPhO6SS8lg2fKaMVFHM9ifbqrIxKb8=
X-Received: by 2002:a17:90b:4fc4:b0:3ac:c90a:10bf with SMTP id 98e67ed59e1d1-3acc90a1ce0mr1238590a91.17.1792132131578;
        Thu, 15 Oct 2026 23:28:51 -0700 (PDT)
X-Received: by 2002:a17:90b:4fc4:b0:3ac:c90a:10bf with SMTP id 98e67ed59e1d1-3acc90a1ce0mr1238578a91.17.1792132130958;
        Thu, 15 Oct 2026 23:28:50 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac947dfa00sm7654274a91.17.2026.10.15.23.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:28:50 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 11:58:44 +0530
Subject: [PATCH] clk: qcom: gcc-glymur: Use PWRSTS_RET_ON flag for USB
 GDSCs
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-glymur-usb-ret-on-v1-1-1790a523fd9c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABvE0WoC/x3MTQ5AMBBA4avIrE3SCg2uIhZ+Rk1CyRQhjbtrL
 L/FewE8CZOHOgkgdLHnzUXoNIFh7pwl5DEaMpUZrbRBuzzrKXj6HoUO3BxqUmWh+srkxQSx24U
 mvv9n077vBwh9Bk1jAAAA
X-Change-ID: 20261016-glymur-usb-ret-on-1e0850b9645f
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAyNSBTYWx0ZWRfXwfyHev2voLXF
 ADd65pH3uE0fyDglJVUIfEjkZ52eagQsR8dkvu33BAZbeMqb2h7w5koH8xFILv/vh97ZGGmIT+m
 lMgpfkw+PQP/FkR012/dDEy025Ycdg5dh4dxyHyRnvwci5WyzWKzcxYD2u/Uja4g2c4EKZwdcYe
 01xR+nVykqzcVK3MsgFo645FjMSFf0U9XIPnuF5RRAuTTEttZ9PJ1Q3kVhE6Gbsyv8LpuhcFBZS
 QcTGWd3alL3Ezp6X5WNeN6eKNLuuSAfP74ih6B+2Ug7JSFD36zDaxrCdwDBISjUR4SKkgnyrhK4
 ngJjmffCASe1LSMh+88r3Un3eAXajO5z2PLY92dp7OkXyBOrDnBM+TsZQZVRM4jkfDdTPPBfVzI
 LjXIsKo8G1FV0IBLJ23wUlQhImU6Dg0yNdtSCdMJTxnzj9rsDC55OaQ3gbmOw1UIUzypMYGPIya
 W2YY4AhkC+DT9UPRXWA==
X-Proofpoint-ORIG-GUID: aGXWk5WFejmNs5GJ4y3wsy5HfGOqUeMD
X-Proofpoint-GUID: aGXWk5WFejmNs5GJ4y3wsy5HfGOqUeMD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAyNSBTYWx0ZWRfXwYcrZuGaSn9/
 EFRF9IIs7U3SwYtVCtCgOuT87dYf2Xa34HhiaJAglr2jry6pZrz6EjXdnPkBsxQ4nayxCWPnwl+
 yvhzBFc0xvyMXreWyI/mMpdwm5v/S/g=
X-Authority-Analysis: v=2.4 cv=VpS2kO2n c=1 sm=1 tr=0 ts=6ad1c424 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=SxwTXxdCfPWGaMH8rwEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160025

The USB GDSCs on Glymur are currently configured with PWRSTS_OFF_ON,
which allows the GDSC framework to fully collapse these power domains
during gdsc_disable(). When these GDSCs collapse, the corresponding USB
configurations are not retained in USB host mode use-cases and this breaks
the resume of USB controller from suspend.

To avoid this, configure the USB GDSC power states to PWRSTS_RET_ON. This
prevents the GDSC from powering off during gdsc_disable(), and allows
hardware to retain the USB configurations across USB host mode use-cases.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-glymur.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index be18a555fe314a41e5335ce8cc100ae8ed226ccb..857596210f719b8d9b177ba30edf80264973b6e8 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -7752,7 +7752,7 @@ static struct gdsc gcc_usb20_prim_gdsc = {
 	.pd = {
 		.name = "gcc_usb20_prim_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7764,7 +7764,7 @@ static struct gdsc gcc_usb30_mp_gdsc = {
 	.pd = {
 		.name = "gcc_usb30_mp_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7776,7 +7776,7 @@ static struct gdsc gcc_usb30_prim_gdsc = {
 	.pd = {
 		.name = "gcc_usb30_prim_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7788,7 +7788,7 @@ static struct gdsc gcc_usb30_sec_gdsc = {
 	.pd = {
 		.name = "gcc_usb30_sec_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7800,7 +7800,7 @@ static struct gdsc gcc_usb30_tert_gdsc = {
 	.pd = {
 		.name = "gcc_usb30_tert_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7812,7 +7812,7 @@ static struct gdsc gcc_usb3_mp_ss0_phy_gdsc = {
 	.pd = {
 		.name = "gcc_usb3_mp_ss0_phy_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7824,7 +7824,7 @@ static struct gdsc gcc_usb3_mp_ss1_phy_gdsc = {
 	.pd = {
 		.name = "gcc_usb3_mp_ss1_phy_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7872,7 +7872,7 @@ static struct gdsc gcc_usb_0_phy_gdsc = {
 	.pd = {
 		.name = "gcc_usb_0_phy_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7884,7 +7884,7 @@ static struct gdsc gcc_usb_1_phy_gdsc = {
 	.pd = {
 		.name = "gcc_usb_1_phy_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7896,7 +7896,7 @@ static struct gdsc gcc_usb_2_phy_gdsc = {
 	.pd = {
 		.name = "gcc_usb_2_phy_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 

---
base-commit: b810335a0699d1810683796b0e3ffe8827ddfe6c
change-id: 20261016-glymur-usb-ret-on-1e0850b9645f

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

