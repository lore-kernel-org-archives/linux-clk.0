Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339CC3B14CC
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 19:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782760986; cv=none; b=enW1G4868AY9l7eET4nd6CiilZR4vhzPLpiS21PYuuzcMKZZ1yuwScARpUwbqBtSEQacHnebiAYPlQGhsd8o4xDNOvGWP1L2lshe2kpEe4LZGkYckU+w4MC0SFD0MlIAzOVhAo2yFd5mwhaauUaHjMM4gBP3+7PinjFVE4F1mTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782760986; c=relaxed/simple;
	bh=lK2qihkta9x6Yku68KYSHqtkE0Fhc1ob6Gdqgx/z87I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d4xBk4YvxiBblH0D0bZ1USPnpaeRtKcgFmcDQa/ZK18K7uChD+cu9RaAD1wsSPuEWlJltOfJ1EqtUx/p/gwsdu8Zbggd5WWWrRZa8lieQdkxQjhtAwU1LIcH40a7+Z4FOU1DTsAOx+s77mTb3vjau63yq4gPRdF5VTsk66jeH+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dsd6fYde; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jOmgvddq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dsd6fYde";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jOmgvddq"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TGKEvN3433064
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 19:23:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mfuWXLxjkstON29P4pmzi0cIfvLzUY/9LFyX/6274tA=; b=Dsd6fYdeihlzxaeF
	+uHby3shSE02It+cdLjvdmZ8P0n81ABtZksX8WxNz8kez9FxxT+lxzdJO1Y/IUPh
	myK6V6/+SaY6Dh5qWdrVKwOzTnDh07PHrN+BJEiOik8oQhK6xkMoMQMdpbj+ZYD3
	LGvHVzdoSmzsoW7H7ABu2tH+U8AbSSOlrOXFEUCLenCwRRd4jig9D0JLv7GB7OWD
	32QpWxn7lofiP8q6y1/GiaJv5D+Ez0A3K17hQlKSxtFH0E+U2RDjpLm/fbkFRfB4
	IwE4A/12P/36jquGE1QYeDXN1OusMg1AtPP/sgBnMzRvgdT0jGlkR3g3J7ZBkqyM
	vkhXBw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nbgtrvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 19:23:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e53b8a302so239643185a.1
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 12:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782760983; x=1783365783; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mfuWXLxjkstON29P4pmzi0cIfvLzUY/9LFyX/6274tA=;
        b=jOmgvddqWromKopktbLgL4AMRzfxVNZWHSY+yZYRswhoy8zyR4ob5hcIkbBgBrDaIU
         0R2T6izc8bbgH6pPySPFIwdm7jTcVmhVetBlao5ZFkqrTDD5UIak6gPBr2BrF8ei4zJx
         D9nbGyqFgZC/W8fRLz12NeZyFx4MZjl3QorA0A5bX2EhxToAmoUIZnDI+txSKYbAdAyu
         gqq+8mcrx74G/2f9akeS85I86REY/T43naiQR06PdpWqhkcbEW6JLir+L2TlHyOLn9pW
         iPQqsxJlSV3ooeMdiqE94NVZZDmP2/acRqzYxTCAmybTK8W1Z0febonn3huDHknsyOgk
         j2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782760983; x=1783365783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mfuWXLxjkstON29P4pmzi0cIfvLzUY/9LFyX/6274tA=;
        b=iUU+HAW+5AyUO1rjAV8jHctctRsJPMgC3lw3o1Wp+aM0Wn1dgzvPPE99D/euZyyccU
         11hcWj6WOuXznSK3UhEQhd0B/Jwp8aHVHlvjEeVqdl+PsAqYFGCQ5HajngH4YmiGid8m
         /vwJfOsLJfdzHd6IlQXVuw2nY0UAnfwBf5JVwEnshc4FimE6L00gQSVvKPwSRIOmJXQd
         nnXMzdlv1uF/o6cJE64ekUfdXaG/UeoCtbyUQXG8MP376x9I7b5lNz8GBwZt5ieuzROa
         7TvoAoKi+6e7Cs+4DDOOkwzE+ntWWAqzGxHBADJqiG804A+gK93nMksKuIM3edBkF3s0
         nHxg==
X-Forwarded-Encrypted: i=1; AFNElJ+NkBW5xHaqVsC58aZQuWPNaUksXJEdIc+YbSvbkdKb/xtnjsSouyUeGsc4SkC+75ToUe5CMG/V6ig=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBEAW2byEEAJLA/uLiQ1Ajl2zuW4hCdGGieZsBcw4vfDywGeSJ
	bh0n2GEDzHldAbay0dAUM9IIOHt7pHMi8MdYrYpe5PZjMyEgxj89SN62kWfYHLPO1XVUIdRyKgj
	FG7FulXlsP6DFFOCc7EXqSGbH3WUeaVfimwd+HNa1udlsgKhOC+/gf6nbzTmKqmc=
X-Gm-Gg: AfdE7cndzkIJiPaq84J1PO3GgZtbo3FF0e774hRT6CjzBy/cuNhtyM7ktEfQfCWOHZJ
	VRU4uuUcY4EW3CgSCiKknoK6NWc1MjX6J0lD07VbuYydVfbIRbEmG4pMztu7kMJKGtAQHss2K+w
	NQuYCJ5l/BH9cx/xkHJKdCXHKi/Pzo72eK5soz0wFjojDVaYGqvUe/4f83tDM4YFYdtT7/tAlMt
	sQV5Z18Hl1GGG0O1+rUl4XY/iAhNGr434dciZraLI9y0LEAsVSHVcgtXqGlGy5au9xiFTuzR+v+
	It0eIEiM4TV0n7SEGaIaUDx4dl4ZBZ91j+FxuUwcp7bXAmnKm0CGf6rV8oSZfMCPBVLwjSdHB9l
	LhqyKagmlPiB3CFCARzfau0XQVxjkWa7//qxhtmf+QdwfzF9pnAzkh1IgDJLrTOjX+B5SUdoOsH
	OR4XFNoLa7SlAeEwiCLGw+zOjULMYLaw5IbyOLLo/d/5BwINCM3PloaD098qIU+LZSNZhVMKFCO
	C8rzmo5IBLeh65/fudi
X-Received: by 2002:a05:620a:29c8:b0:915:cda5:27fa with SMTP id af79cd13be357-92e627e483emr145572085a.58.1782760982332;
        Mon, 29 Jun 2026 12:23:02 -0700 (PDT)
X-Received: by 2002:a05:620a:29c8:b0:915:cda5:27fa with SMTP id af79cd13be357-92e627e483emr145565685a.58.1782760981850;
        Mon, 29 Jun 2026 12:23:01 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-475674af239sm308506f8f.30.2026.06.29.12.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 12:23:01 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 21:22:56 +0200
Subject: [PATCH 2/2] clk: qcom: gcc-qcs8300: Use retention for USB power
 domains
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-monza-suspend-v1-2-b601d8a2f2f8@oss.qualcomm.com>
References: <20260629-monza-suspend-v1-0-b601d8a2f2f8@oss.qualcomm.com>
In-Reply-To: <20260629-monza-suspend-v1-0-b601d8a2f2f8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: IqhWwhjeX3-cIGppSH4K71r2Oh1W1Q6j
X-Authority-Analysis: v=2.4 cv=Z4Hc2nRA c=1 sm=1 tr=0 ts=6a42c617 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=K4BkOEyOW4MAsK0yrNYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDE2MyBTYWx0ZWRfX8S8LZVoFPj/N
 KZgPRGA9FO+rWrKAQysULIUlPGNXvzJp5U868K7w/ywgBajFdbNm+HU54m4BddAz1qvLuCSJ/kL
 Ph+tO6Mr9RXnS1PSv7/x2B2+qtEoWkU=
X-Proofpoint-GUID: IqhWwhjeX3-cIGppSH4K71r2Oh1W1Q6j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDE2MyBTYWx0ZWRfX/10jaXxKlg18
 ikBGZrYUXAKEOw/UtLZnxiDpruV2kUrOxzr+8eTbLGYR7LKldf6xdtpy0ax+YVrsutdVWtHulfS
 2+90z2GgpoFOF7p7Dr64oNCbZg4spl018A6k/Y5MA/fpECwFXlzPdMxXM+Imucv4DhvYPXfoGDH
 N/Bdi8sk3avrl/akl2/3MNNkCRN6oe+u4DGksfJlB2ei5um8xtgmV5DrbbksoGLtpa7wmpmZ0W1
 djhk85UD/p5QdlSyWbKoF3HUNIOYAPH+p6ZKZyHLYVVkEy5SqoX+FZhNeUDgbsLorN3ubNhCJn4
 cTrEAwkDS8jREetxcXDNH2x5SDAyfHc1Ygj135K3COM+8OBUjuvW3pMcM4opH/bcB/CE1AAIutj
 FUZxEBW1uoaiYDti2I65JFu7q1hihTEf4mu8WWkktWkWO35oh10QJtiS9ab9O3ayCdsSxwjDsOL
 KAeefpQNhUOoUD7tzeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290163

The USB subsystem does not expect to lose its state on suspend:

  xhci-hcd xhci-hcd.1.auto: xHC error in resume, USBSTS 0x401, Reinit
  usb usb1: root hub lost power or was reset

To maintain state during suspend, the relevant GDSCs need to stay in
retention mode, like they do on other similar SoCs. Change the mode to
PWRSTS_RET_ON to fix.

Fixes: 95eeb2ffce73 ("clk: qcom: Add support for Global Clock Controller on QCS8300")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qcs8300.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-qcs8300.c b/drivers/clk/qcom/gcc-qcs8300.c
index 009672b75fb9099cb0c6db7af3863654f2fa6648..fe0632687f9f0ec7c8205bd2daa31786373ff55d 100644
--- a/drivers/clk/qcom/gcc-qcs8300.c
+++ b/drivers/clk/qcom/gcc-qcs8300.c
@@ -3306,7 +3306,7 @@ static struct gdsc gcc_usb20_prim_gdsc = {
 	.pd = {
 		.name = "gcc_usb20_prim_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = RETAIN_FF_ENABLE | POLL_CFG_GDSCR,
 };
 
@@ -3318,7 +3318,7 @@ static struct gdsc gcc_usb30_prim_gdsc = {
 	.pd = {
 		.name = "gcc_usb30_prim_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = RETAIN_FF_ENABLE | POLL_CFG_GDSCR,
 };
 

-- 
2.34.1

