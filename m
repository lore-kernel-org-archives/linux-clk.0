Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C3C388369
	for <linux-clk@vger.kernel.org>; Sun,  9 Aug 2026 18:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786301926; cv=none; b=DGCTn/CsKqCAGIz7uDRx3MRnc567Zgg6U3RtKTu9RjmmElN9WARCpNDxcplMZJtAZo1t+G7viU/k6dM5lBBiA2iVMrBzwTmkdjmwGWFAOPNPlMXPSuzn+2ZcbNTTdGpix9BWkbZEyn2owPwJ+6dg9mX75C3FTJii06rugiVaJNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786301926; c=relaxed/simple;
	bh=4kdQcLHaNqH0bNFWSMBUN1Ena+T1hMkJB23bHmNC13k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QNvbKbQaU5JWK0oC1Yst61gRLV0M2Swj5hjqbx1bEjG6lN5bfSuMe1lPMcZHtnlkKM4zWQ/07pJG5bNoB379T2QdRVhwow+7RzB24W94tmSpyEvgpvqCHMEoLN4lReRIMQs3PD1wuiEfCNiBd25Lv7JafH+wxQ2q1HIM04NTiN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fdzmGQ+1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LiKOomIo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fdzmGQ+1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LiKOomIo"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679IACLv3078468
	for <linux-clk@vger.kernel.org>; Sun, 9 Aug 2026 18:58:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lzRXDP37ElESnDzMwft4DO
	8ex8QQj5ZwDC+i3fGv56Y=; b=fdzmGQ+17b/LM/OO4sBPvd02HD3/+2FnqOy1Uq
	FOPjw2F2Qg3tlmacOrUzWRUGtFXyLUO5Wj10jw2Y/4B/PDsZlHXrGybTxOLl2SUr
	ItwdKRXSpJifRcHNi5wckDA0JiDx59XqxOmQBlkvo8UmWm9biMqAOMUBuyEZ/RII
	O7RQXeHIXq9CYnAn6OWcLzem+0KBWeRZayG3aXAqhk97GsVyHI1J31hWn9w/5u0G
	KUpKH3gW02XmuC4mAQYzrsdMrilU4ZMjQWMnDURNiQNzZdPxGNYjVqJR6ucgAUkg
	Y9vatBwbbhJ7SBzZUulm3VqLSAjhdqY78dL0SfmtV2JRZJQg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwwr9k8mr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 09 Aug 2026 18:58:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5276aa86d00so11645341cf.2
        for <linux-clk@vger.kernel.org>; Sun, 09 Aug 2026 11:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786301923; x=1786906723; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lzRXDP37ElESnDzMwft4DO8ex8QQj5ZwDC+i3fGv56Y=;
        b=LiKOomIoejBMbzhW2zrC/+emLBzfr3UhqflfdBp3I+hE48GlSGp5TEzuA/qoDvMcSP
         llzMM3pO6c9gbvCxrpf6DMBo7MoO/TgTcFAZ/7XzJNaOm8KAK1iVrwZnKsFenKZXeaZ0
         uDdwSxgXvOGoYfizCMeOeyGJFO85e9CwJAGn7DIr2jlJd13Oenqy6ihAWLehXk9KM2km
         Bxk8AJqv7oewr/icGDDQRGJnA5emss1e5BxsmXbBa9h0KNnLlt8U3cXN/Fj2bpdEpqkk
         CDzyytkPTgY/kR37XbfQfXPvYEGKJlMSQImqpIZme+EpsK9ycMBEOaNK3pbhZkaXRB6g
         a/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786301923; x=1786906723;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lzRXDP37ElESnDzMwft4DO8ex8QQj5ZwDC+i3fGv56Y=;
        b=XDffGt3gvC9cRvsntBxmUxQvYmasiYt9WrkdyCH6WNmdc4FlfUVa534kxx3cmUvQVN
         0OZXNPxYGG0zhNBlONmGgyN+2Xml8BX807ZqN07w9BJ15YQov9pfjzn5Gmom9U8l+ndX
         NxtAlXyDskCW/rYOvINT4FdOkTHBS3VbW25i7KfGcSgVGpXeaNvu5qf+Xqb9WbolEMhZ
         FRWoIVQHjvy9MlonvwSCpJ9/TzjviAS90fqCZ/xub7mfCkD7PdKfwLJg32RU/9zgjLYJ
         73IyvNTgIG1b8A7ZghfsKfUr+5DejUkSf0iTfbCYLzl9wrAy/dKl8mMXIqbRsICDWepd
         pg8A==
X-Forwarded-Encrypted: i=1; AHgh+Ro84xVvhlYBwXoVad3Xwa0H/5tkCcWuMuW3CqJFGjG1feX32ydw7INFF9BtGgU6gAL9kiyqlhG9jbE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRtdnRvcE4mUxarhWnQCL1LyGiTJhRZW59DY/2h+5krvU3LRt1
	Od96KCbvc5Fvp5i9O1Yq6e6tf/CVcLibNlkQmBwEegHs9Nyg5Lmffj4bJ/azOH0pBDxDr04YIY9
	GMFrsPZxxZpip9cxqslgdTcRtVyTi/XpNcRRrNR0QgxbZCw1C/U/DHw6tBBUlcXQ=
X-Gm-Gg: AR+sD11MvWXzqS9Ebp188eBdSQKKANXT/eyMUJRTgaXlApdih+4/eNMLuFIM9Nj4eqr
	wI4aMn75ab06QzezB6wHf/bdB4gsJdcE193yqQtP/jR2EWhPr43xq8oca3AdNEavaCqY3HD4cyS
	dPdje635Xe9nKkmaXHBUdnwNmoUUmsQTl3AM36pISdBd6AdLkcnHUowznG1aObOWERiGg69/x8d
	j1vbzUeKegfyAWkFuIl+u5ROq4jOX/22FVnjWW5wB7ZOBiXQx5XuXeRGElbyCBa2PvjpSr/7lBA
	WOY4TekO2jIguSYkYxrbm4l6hLbujPuHwj1DLxEzQexwkqsGcxMNQNiEvzn9m+e2dnftJ4xueoh
	6MSWjklvVSSdu5WaBO63pmR0uKeG+KxqtGWDBrVKjd1PYgng6qzeN4N8+3lgfRM6OgJi3gTp4pS
	BkdUeDIYd7I8QQzg==
X-Received: by 2002:a05:622a:a18:b0:528:399a:8f81 with SMTP id d75a77b69052e-52d20a16251mr188882311cf.23.1786301923226;
        Sun, 09 Aug 2026 11:58:43 -0700 (PDT)
X-Received: by 2002:a05:622a:a18:b0:528:399a:8f81 with SMTP id d75a77b69052e-52d20a16251mr188881911cf.23.1786301922818;
        Sun, 09 Aug 2026 11:58:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fddd52514sm17157581fa.20.2026.08.09.11.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 11:58:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 21:58:37 +0300
Subject: [PATCH] clk: qcom: mmcc-msm8974: add GENPD_FLAG_NO_STAY_ON
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-msm8974-mmcc-fix-v1-1-50f2dcf18d2e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANzNeGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCwNL3dziXAtLcxPd3NzkZN20zArdZAvjJNO0REtDs8Q0JaC2gqJUoDD
 YyOhYCL+4NCkrNbkEZI5SbS0AWjQNMnQAAAA=
X-Change-ID: 20260809-msm8974-mmcc-fix-c83b5fa916af
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1160;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4kdQcLHaNqH0bNFWSMBUN1Ena+T1hMkJB23bHmNC13k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqeM3ewXo6wdqTel4JBpyKPYEM4EUeVztB3OGZd
 UA2dwH2zyGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCanjN3gAKCRCLPIo+Aiko
 1X6bB/4qX3fbZyLBywYfelxx/EJperTokpK4P/Cpy0VVFPQnYdjRa3eJ9n34XKgLxOK6RhWKbjh
 Wu3x/GbisfNsX/0kucffupLZRlWbtti0UsFHAY8rLCV5y0FcLR4CUtZIqYfx0sNQbSdPs7DphpH
 8mc0R8MHzf5lPoUTldrkOzAdl/0UUB1aRY1WRDA7RuELKDKOpjJf2kgQ1Zd24pnVSm8Nyp0rxq/
 qeKFhYMmU7ouLAMjSoCdXAn6z693yJHbVVsmtE3bmQOarRnkwobJPdpzgmXoH+Z5ye+MBV1fb/D
 i620jsCSjiRN8GFiznjalxrT87G5HnL0JGDHLIUMxmNFVnsh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=d73FDxjE c=1 sm=1 tr=0 ts=6a78cde4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=fGnOUpkfZkl4fvj9H_EA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: OTLeCj42duZwXHhBP1F9O6RsiBSaPUqR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDE3MSBTYWx0ZWRfXyTNAyRyJYTlZ
 9nrpTPulD4fbvkXqeELnMfvj6J8jIo0R0vSgJXG/F5DBs2ACtXErL4S1z7MWB7Ncb0GxXfXIL5L
 4y+ASonC0kcdwrM1iLa4a22JjMdIbJZ470625QNBjINz6d0AQm7DDOnHEbHuzKrwP476xmRHarB
 /MbdURhvP1hSVzTQIbupQQPO+Q7H6XB4IFN1zzUnX+sC8SwbCNLjv8QuBdQBnJLjbpyHjPpSSDy
 9WVZ0g1cz8BjOOPll3JTSrjM9Kpx6T0qdi/fUVfQtukldSASQBeeV8imUNGC3gdqlLIkFDIXJVN
 8isHqsW281nu3Gxld3W8YcJydIO376eoyWKhMfeqRowj+vfW6qy97J7SG89HzYCmn6UnQAuT07Q
 +7EoSbdMVuH8vLjhJl9hCpEvP+6LvA5Pw1t3i3JV9b3mOvEStkHq6lqYplqZCWoyho2+tdjHgIo
 wuClwF+DXlVHanCXOiA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDE3MSBTYWx0ZWRfX7aW5drWYuLLo
 TGX0IFpxN/f3SaDjIYGmiuzguqvClLRO0k5acabijBooZDf0Vu5rHT6AMs8gcibhlO+Siig6Kv+
 W8VSDCpfUm6ftRne5CZrDprSFx+ljRQ=
X-Proofpoint-GUID: OTLeCj42duZwXHhBP1F9O6RsiBSaPUqR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_06,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0 malwarescore=0
 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090171

Commit 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds on until
late_initcall_sync") kept power-domains on longer during boot which is
causing DSI clock to get stuck and fail to acquire its configuration on
DSI bringup. While this is being investigated, add the flag
GENPD_FLAG_NO_STAY_ON for MDSS GDSC on MSM8974 to restore the previous
behaviour to fix this.

Fixes: 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds on until late_initcall_sync")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/clk/qcom/mmcc-msm8974.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
index f2e802cf6afc..b04885864baf 100644
--- a/drivers/clk/qcom/mmcc-msm8974.c
+++ b/drivers/clk/qcom/mmcc-msm8974.c
@@ -2367,6 +2367,7 @@ static struct gdsc mdss_gdsc = {
 	.cxc_count = 2,
 	.pd = {
 		.name = "mdss",
+		.flags = GENPD_FLAG_NO_STAY_ON,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 };

---
base-commit: 6b8c8af514d739d0335f5579b585e02babe8a727
change-id: 20260809-msm8974-mmcc-fix-c83b5fa916af

Best regards,
--  
With best wishes
Dmitry

