Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B452929D260
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 12:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784724375; cv=none; b=aIfLf7Y/gCjH0tArig1jGywJhOzxoCPZO+13r7ke+lFCf0tNKd3YzoEAO43z9B6O13eh+8XbqDGrq0pimHfJqwvNnK9DnnJ3wDsb1m7NvwCcNnzoewDHm9dIFlLzFUqHThaQspuk8bQxd+bWPMj2oR7gjcYQ8S9nDULEl+7sCRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784724375; c=relaxed/simple;
	bh=PrYnUKEtLFlDsv1T+hvbI06+m8BqexCeAChjzu8vfmQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OhteAv8gewpXsTJ/o4iRDzpLh4v/h4KowYO0UcAMC+LylRoKHKrlMyW17nz8gUROSVRHAIJ28SdzA8vwoj7GUvcet2m3fX8khDZ14VueGEMDZJHH2YKPrCORcVpZ0LX1iFDb9P4Nga38pF+2oZbjZGkLcm0FVEDtuJrOxKta7Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XmYS1Ns3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jtIKJbty; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XmYS1Ns3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jtIKJbty"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8x6WG383767
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 12:46:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6iKodIy6jVMMRtmZ9FUUEo
	Z37/RimmTHizcgNq2v7r4=; b=XmYS1Ns3FeRbvINHwRmhLBe4s0aswvYC2/Q2WP
	Wdx2PAFl6Bpz9i2uotrCSY99KX35xyL2xOfT1ldMcWIrHBef3zlwwXWzflj4Mbp/
	C13dpD19wIzrqEm5nMT9WkHlBMtVfQ4L47nZBUyq1D6NTB4VQ5CFvHTfeQ+k/viJ
	A5f1P3LdXO9rmDxg0TdmeRLX/wB4HRU0/+aRfU1NeSJvxu09hC8s9KpW/UYgXxQR
	mN4QIcGFjFzR5uHj+WHlmJPnGQhYO7RaRoydpEM8il9vKYK/CPEcUD+jtTf+yaQh
	9Rz5R8VAoGGLcXI6LYSXYoaazuEkJvRB78lHBV92bwvp56Ew==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjs929b4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 12:46:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52827090cc5so10582751cf.0
        for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 05:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784724371; x=1785329171; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6iKodIy6jVMMRtmZ9FUUEoZ37/RimmTHizcgNq2v7r4=;
        b=jtIKJbtywCHXwVxu3Nhwz6C2ZRbgIsDz7wcjAKFZiFeZoOl/HEGoSPDDEZ6mjMx8KP
         g4X/LXSiXOcpJ/F0nsAnwMWf7Zw/+t6RsPjrmoZsY2b4Gh4GpJFlq+DJbsDyQC73ljCu
         NU/AOUAyMbh3oYNicHtKl180s1b51xKlaqhsWacJrpJbbd+TCo3yjflaeIVQeI4G9EJq
         QbFLnm57RcK+Fx0x/9PnDRFlETIPX9H+bZaordEJka/y3bQG2GuLonjZK/yfBBd+3zoz
         tTxqiUd9p5DOR3Zi8braM2IdpDgvTxuvChlcyowAncI/K3I8/1s4NRYyH6TlQX3PL6JH
         sguQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784724371; x=1785329171;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6iKodIy6jVMMRtmZ9FUUEoZ37/RimmTHizcgNq2v7r4=;
        b=RMjVHVvvMH6Xy5OnOzpda3qMpHk8mede3JrIomJrVRlnaomKHUgdrVELjP00B3B//2
         cBtJlv2IgGCckafTgI6VIVpOUe898cZvM+k7Unvq/uVe9eRTuaEhgoDRfA09AlWcfHBl
         BovBc30ATb+pu9x9jA1dnRm5DjLOcrkfWcV1efS5qLfVvq1jiQ8rMa9UnP1aZtJKY92f
         wdN54x3zjGRkz3sWEx8tsgYTr95N8Xa5Xlrs0YFnCiRsMHUBTvwC3+USYeKqH0nzZ3g5
         9YuJv96oH7+c34xzRld1dz4ndAWJHGzWUJ0adOIzNC2HNe35wdYPqzz11XvbN29DDw7m
         oZ0g==
X-Forwarded-Encrypted: i=1; AHgh+RoOG6LhksEZRH5TpvSYMKupJLzU/EZSBMVHNX+WujWHRG/x3PSyAVlH81eBRo8UOG5JL2rY/n+HBFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVWmNFOJJiHafCgqO64WZmpVfQKIk9qrhNaTIF4dPslT6FPsUz
	1MoYrXKcuGtGE7Oi9W6iGBEBSqJ00XiOhk6KeWde2YYiZf0PEO8nwwAX2kxHOyEEwwh4v3Zmp6U
	+p4pdO4T+TmEjzIjR/IHJL+889hRRAKZeEO5/KzGQPX+eIEFduXcR311OAjR+rig=
X-Gm-Gg: AR+sD13kuC/sgF9PU5PcACU6XgptxZvBeKtXdykW3xu7gJkXNw57SYwaLN+lHFRgYJ9
	IR8Nx+1QWRk2lriyHQb6IIhxgmF2HXEZVK105/OJ8UjmTsmAQAd+UcXlWGKvHRJm5BEg6Hp9eBP
	amkzpxYbe01QbiyhDLN8q8M3dN16uvyAp4jvAXOwNkafrEQm4xqWlQzqVokOiA7h6iUdu91Ac4Y
	JeFHnRmN5vEA04Y6aveHVerRaIxaraQwOKOyOqBcwacDcAblJQCFXU+dmUI06hBpfycSNXPAAJT
	/nObWwd3VAt7VSal7jhLZ6hd/JEoWEpp2nZVIzuigz8Hrn2wnqd2/Q0Vw1raY7D4ovezlOT0hbj
	GaGPZzZYgyBrxDb0GK26l3Ex8Leq31BnyYIWaoDaw16XIffh5alpB9gv2NI3UIAYYoxbtb0jm17
	1CMQAdMYqde/J3pw==
X-Received: by 2002:ac8:5e4b:0:b0:51b:fdc0:ddee with SMTP id d75a77b69052e-527a8a4c63amr39550051cf.30.1784724370989;
        Wed, 22 Jul 2026 05:46:10 -0700 (PDT)
X-Received: by 2002:ac8:5e4b:0:b0:51b:fdc0:ddee with SMTP id d75a77b69052e-527a8a4c63amr39549611cf.30.1784724370455;
        Wed, 22 Jul 2026 05:46:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9d316cesm467241e87.53.2026.07.22.05.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 05:46:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 15:46:08 +0300
Subject: [PATCH] clk: qcom: gcc-qcm2290: don't park QUP RCGs upon
 registration
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-agatti-no-park-v1-1-31ae3a4774e5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAI+7YGoC/yXMQQqDMBBA0avIrB1IhrZCryIuJma0YyFKEqUg3
 t1ol2/x/w5JokqCd7VDlE2TzqHA1hX0Hw6joPpiIEMv0xAhj5yzYphx4fjFh/H0ZGsH7yyUaIk
 y6O8ett3faXWT9Pm6wHGcVzbz/nIAAAA=
X-Change-ID: 20260722-agatti-no-park-40d25a11fdb1
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Douglas Anderson <dianders@chromium.org>
Cc: Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3282;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=PrYnUKEtLFlDsv1T+hvbI06+m8BqexCeAChjzu8vfmQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqYLuQdKA5MYraAekvWoRAwPfwAcUQBPTuWGmYs
 Iw0NFRfBd2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamC7kAAKCRCLPIo+Aiko
 1XL7CACW3Sy5sXhMLYiM7aFiRE3q2lgbRjJzZl7OC+TVBOEmt7deepahE0G8v/6PGrYRa+FGnCm
 jzPIbC36q2GD9/5ZqQA/o+65kAO3QAVsBA11kGgQ2ukcFHrnr3P6oPKF2CjrX4+k3qnZlQhNnf4
 lR7c8X+F2y2wZ1xBatjgkEg0QaBiQfq4H3EOIWbWTY8l3TebPaDGtlwnIvyAxc19d4OponxEZ4h
 uAsqWGeKVXIF4l4RTcOpB7Sw8FqptUjQ5lySC842yKUjMRt1faEr1JeXXQiL+028lNgdtJIrpxn
 +1KUkjhO2uoxPClF4/e5XgaVf7fRVqlvNguWzZiH4rTDPXfS
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEyNCBTYWx0ZWRfX+OymkDA+1Cyg
 kiwwp/2DLpHQbEbFkHRWDK4ywVZExQEoS2h+k8kCPXe31wU39Lc2qsGcW31x0xWBCLp7qZ1OMTC
 KkDHpiB2lKsryCI0UA2ypp6Ci2MVQhU=
X-Proofpoint-ORIG-GUID: Mw6YOKJbW7-RhrQShh5x1rbn3WIXZ7Pk
X-Proofpoint-GUID: Mw6YOKJbW7-RhrQShh5x1rbn3WIXZ7Pk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEyNCBTYWx0ZWRfXxxh3BzK7mv8u
 8x/5lngtbFacF2zCrk4S4cDGX3fDqQduXnOSElSiyKKzsBa2hKZCfhSbBm0bgTLklj0AOogWveR
 SBqTP8qvDXCP/nDV4m4iOsH5dGKeeJhHohzTh8MtibR7+F1MgkBaIIZ6oq/fCLAPdmTFjHyZKiQ
 ZtfIul0CP+M18ZNam0bKvOT5bY61OvZhdJNj+mlWdL5sL+ek9a4ZrBugB2MjTwPLkdzWSgKS2+/
 bozCee9TBWlw0ZK5HzPInkF2fVoVnIi/P+uwxzZ9tABw+iSAZTAz2smDgG2gLw6TtNwt2ORpYmz
 x0UblXgySN2kAcAU3v0WpIIvMPne7r8RiqDnkHGGahtn7C5Mvjq2VUhccylUp/5YjHu4MQu+UBP
 /n3458cQXKV/JqRXrEBM2uNckDn/xUCInnGgBy9AL4SXD2GDYWYSKzkLhKzridx2suk1wlzs4y3
 W2iDZZxXK8wRxUQdOaQ==
X-Authority-Analysis: v=2.4 cv=QahWeMbv c=1 sm=1 tr=0 ts=6a60bb94 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=6w3LJLvutN4hriyJED8A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220124

The gcc_qupv3_wrap0_s[0-5]_clk_src RCGs feed the QUP serial engines
(UART/I2C/SPI). Since shared RCGs are parked to XO at registration time,
binding the gcc-qcm2290 driver reprograms these clocks away from the
rate configured by the bootloader. For the UART used as the boot console
this drops early console output until the serial driver later
reconfigures the clock.

Switch the QUP wrap0 clock sources over to
clk_rcg2_shared_no_init_park_ops so their frequency is left unchanged at
registration time, keeping the bootloader-configured console working
across the gcc driver probe.

Fixes: 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon registration")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qcm2290.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/gcc-qcm2290.c b/drivers/clk/qcom/gcc-qcm2290.c
index 6684cab63ae1..02ca37f58477 100644
--- a/drivers/clk/qcom/gcc-qcm2290.c
+++ b/drivers/clk/qcom/gcc-qcm2290.c
@@ -1082,7 +1082,7 @@ static struct clk_init_data gcc_qupv3_wrap0_s0_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s0_clk_src",
 	.parent_data = gcc_parents_1,
 	.num_parents = ARRAY_SIZE(gcc_parents_1),
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap0_s0_clk_src = {
@@ -1098,7 +1098,7 @@ static struct clk_init_data gcc_qupv3_wrap0_s1_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s1_clk_src",
 	.parent_data = gcc_parents_1,
 	.num_parents = ARRAY_SIZE(gcc_parents_1),
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap0_s1_clk_src = {
@@ -1114,7 +1114,7 @@ static struct clk_init_data gcc_qupv3_wrap0_s2_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s2_clk_src",
 	.parent_data = gcc_parents_1,
 	.num_parents = ARRAY_SIZE(gcc_parents_1),
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap0_s2_clk_src = {
@@ -1130,7 +1130,7 @@ static struct clk_init_data gcc_qupv3_wrap0_s3_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s3_clk_src",
 	.parent_data = gcc_parents_1,
 	.num_parents = ARRAY_SIZE(gcc_parents_1),
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap0_s3_clk_src = {
@@ -1146,7 +1146,7 @@ static struct clk_init_data gcc_qupv3_wrap0_s4_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s4_clk_src",
 	.parent_data = gcc_parents_1,
 	.num_parents = ARRAY_SIZE(gcc_parents_1),
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap0_s4_clk_src = {
@@ -1162,7 +1162,7 @@ static struct clk_init_data gcc_qupv3_wrap0_s5_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s5_clk_src",
 	.parent_data = gcc_parents_1,
 	.num_parents = ARRAY_SIZE(gcc_parents_1),
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap0_s5_clk_src = {

---
base-commit: b9810cd75b9fb56a3425d391cba3f608502bd474
change-id: 20260722-agatti-no-park-40d25a11fdb1

Best regards,
--  
With best wishes
Dmitry

