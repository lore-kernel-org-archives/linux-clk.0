Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550534;
	b=Md5VykOp5yxeBqdElQxbsAm1Fw2haqfjluauocA688gGUIXyxs1GU01+UEz0cwhpajCK
	 XrppRU+GezDrNe7CEhkAoFSlDRKykVPYlUdE2B0DYtrp/Ujr5ApRsLBsDFU6dABmi3SSc
	 +RbEt6/s/FJv3lnsw0g8O9AgZLFFMN9BJQc0N6aAh7C6fhjn9k6GysiXPXXkhAWgRbYnb
	 9hE8E92zJDmC3HFu68iChbWny5CZnG9Lo+iV+clKNz8MHiaSfrwDfyFuxZtilR+vO8EvD
	 55lVYEO3zitQqRNivKs7DXq8KaYzKqKhuVZzx3M9LtT0toQORNOozAZ+0WtKgj5j4lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550534;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jDFGofZS9wIbG6zZ/KoqobVo6RlFteO9ubwUWazjPnM=;
	b=EeHL4TjnfFrop8ujAD74AzR+QeKrMC4Eajy//njssNWTras6/plCxaTEK5lQ2CWRNKll
	 MDfkJjcrqy25vZsEVN6OgfUC5ArELUG+MzdFsl6ULPzcDKIpyuPSSmo5RmRt16hfN6uHe
	 315Ntd6I15ftJi5mmlgMZZ3tfSShEiSAUcrOGVh1dZ06+IQ57LGA4wJaFGUEwXCTBprvs
	 S0UKarAh2RsnlrTvcwm+5WtCNF2/kCAxTxN3Tko78Jw0XUN8sEbN/K429t6MKMETlX4Xe
	 l72ndKvu3FfK6cMDVEsfdI+fvXiyzCSmITuF4glKmDaQ1cBXMxAPLm1pVjXFucjScUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TGvf9KwK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KLVdftPQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1799606A6B5
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 20:02:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1799606A6B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TGvf9KwK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KLVdftPQ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOIXFVS1132245
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 20:02:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jDFGofZS9wIbG6zZ/KoqobVo6RlFteO9ubwUWazjPnM=; b=TGvf9KwKvWtorsv7
	IlkKQHvhJ98YDIcRXg+OLTdiq0/gIozGKCv3qjHuNnCfF1KQPdQI0p4WDdDCbuTo
	EEBiY1xW99qNtNT3aRywF+X8/RB+pZacJPSK2khsA/BX6GY5wNZ+yV3tbQ9huJaO
	MuPwJCublkI/HInKTMAxX+y0oHfR9egSgOKWafrjzOVisMzqAf+Wsi+ZwCRiRWCX
	oH01GTUTd6AmgLaPJJT1IWb+EzG/SXZAmY1PGhjuLi5A8zIFX9/RdYyLg8rai3As
	zrl70kWcugI+5WDWyDTahbZIcpASndWkVhN1lYJ9Pf+cB693g4hq1fLPOcaskxVa
	OdRjzg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5eyd8nu1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 20:02:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94964828890so60178285a.3
        for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 12:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795550531; x=1796155331; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jDFGofZS9wIbG6zZ/KoqobVo6RlFteO9ubwUWazjPnM=;
        b=KLVdftPQp7M44I+EmAHNWMfsiHduu3P8YvJCAjvRfdOuuQNujTPihV3paMim1a/PKW
         A2wsqWS/uRIMRrVIh2g43Rrt944/yAlUc9ZPodj9/n+IduljF8voQQlByTj1/hsp00TX
         DsC7xbeKbJiiPoZ/W4gi/6D3R9paJ8djD7fynAC5zurBKwcAtmwg8QdI9VehNlix0lZ3
         X9n04HUoyQTjhYsrvHtLQdsinHVqCrH8kASnIxAEu3ZO5QJo6EzQyk8cH3pP4eAOE9kY
         EUH5SUHoQ2PogKeACo3j5eBcsEuBm7n3OlqD8vW2aFgTAyEzAEFV7se1/sQb6Zy0Vdqp
         VEiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550531; x=1796155331;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jDFGofZS9wIbG6zZ/KoqobVo6RlFteO9ubwUWazjPnM=;
        b=tbuKC0bU07K9Lkm0NR0rjipkcNerHi0QQqO0JKR0DrOEidMgm0SmepgOdzNlUXsWca
         ESE1GK71TCnGdS0ZgaZl2FzkScpglyVwOVJUE6gQt822PbeTwaEdOLXGBy4EiFZxaC4o
         sBGqnmgBwv9/jvVSnD14aktcTGekJhyUYPFRfZErxX6BzyvY3bcWNgf0E1K1+P67rZ/6
         O7RGjSKpjoNYVqbG19azZe7pBsjQtjHuwL3uuF63fIFpv1PQ+fn3KjBg0LabWjE9mUl/
         n93Zpax4c+tdYjkbUZDffmSO9KxOWYW7JO+nn86MUHc5CnObFZhxgy4nIrqOflCQ9MTe
         XjkA==
X-Forwarded-Encrypted: i=1; AL+hErEowyN/GmVqykWEiLBb4oxT44geo60Eihlz/lxUfdfUpw+J8O5JxQVX7P8zMvAmIQ3R5ISNwJrMPHg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DTdQKX3qe3qYsb1Hrmjnu9vpauanQ9qBPfoW/4pv+No57wxcG
	WgEdWY4VsLA3MNi88h5bwZCSL9QYIoMgpMFE+FB+FHi8j4DwHLZKJ5znC6QNVE2zKPs+kXzCCvF
	telqkgXwni4GX2HKeR7fWAvdqtnC4rSYFG8/7OZaI8Wn3tfoZQyEjjtlgwK8l0/M=
X-Gm-Gg: AZFdTZcPH5lVgXvC8Mk4CnaDY2p7U7ms9ssZAV0sk349kwsZu9uXZce52NjlXebbpI8
	uye2awrSVI2v9rRKeYpKXgrUwtPXgV4QaZL8iqjdTEPAdp8dI3etk/1yAQZYQZdJHhahVxWwQVS
	zgpYGG3rs2D1KRNLXq++YQgHq6sEB9I/71GL1XwR4E5Ye7nj/uf3L0GMCvwNecWrOhWEmYw4khA
	eS+bAYp88iIN03OMBpcLGjPm9KK8/Hzk0JMBbMYeuygPrApQitRgi9jJRPpyeRAcLAJbMo+Ex3d
	U7lCFCQB1xDAZWX0A3/VJ+rDCTyQGDaLye54AVr9lpFQTgwVlxkTi6QJJuQL20Yub1Bm6NnG+6m
	bihETHq4xHmgSSAdy1PYLe0u7rhh3CKgol/NmKxJvmgvdDG/c04OI1DyxsxpmdjSvTA6XpPqI10
	o4w7c7USs=
X-Received: by 2002:a05:620a:1118:b0:949:95d6:4039 with SMTP id af79cd13be357-949ba9c1d91mr2807628885a.3.1795550531122;
        Tue, 24 Nov 2026 12:02:11 -0800 (PST)
X-Received: by 2002:a05:620a:1118:b0:949:95d6:4039 with SMTP id af79cd13be357-949ba9c1d91mr2807622685a.3.1795550530332;
        Tue, 24 Nov 2026 12:02:10 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:7192:a019:58a4:eb4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm517678195e9.7.2026.11.24.12.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:02:09 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 21:01:39 +0100
Subject: [PATCH RFC DNM 10/15] thunderbolt: nhi: Resume a runtime suspended
 NHI for system suspend
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-topic-next-20261116-fsm-mvp-v1-10-a9b45c69cd38@oss.qualcomm.com>
References: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
In-Reply-To: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        usb4-upstream@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795550497; l=1364;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=VT0A3Ff5mjwo5JFp7mj0fXPs8lsBYJ24xhfJ+8TyvbE=;
 b=BI/O1PsXCKL75DybTynegzhap9M3cUZ42FTlJ5Ou9qvJpR0kF5q8oxlq+CxsGnKfDU1bNa0J+
 DWYwwr0nFv9D9l+3YxFMBX2j0dcjtFaVMoXllO2R+3oUn4HJ+WZFIi4
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX9JKJ89F6MtmU
 wvTIVGybPdyn7MJ14NQXuBdCVHnMmvpNbUobmNi8ZerfjXv2CisDJbJOVGXrEYLBUaM/JQT6xoP
 BkXpMhrIv08EPXULoIQx/xylR2awIYQ=
X-Proofpoint-ORIG-GUID: aA2yGN9sTocQ1D0e5PbnEpatDrMNzVge
X-Proofpoint-GUID: aA2yGN9sTocQ1D0e5PbnEpatDrMNzVge
X-Authority-Analysis: v=2.4 cv=GIGdgeNK c=1 sm=1 tr=0 ts=6b05ed44 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=KHM4NlRHU2ppStx7mUgA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX2osriY2DK5oH
 FWlTgaMzwWJZfZGq0GME36MJ5qtoy2Es46mFfjVxkY6t8u0hZqaeyhEL+LJ2JthX1JkQAsCtqzN
 7jhcq+T7LdMFmYmSfHOphdi9gIpJjSBcTmIsyV37TBrxsNKRN4EUoi36KJamlU2gYmupCvzDNJp
 ark3apgpHPB65ncGVQr4K7B8eI1P8U/xp/PjLHjJCzvISgb2qo/nerRWRL/c0CYKzkFlVDQ4WEf
 x+essNCiK5TuUMl4bUIFPcz2HLWQ8eeTDO5PLbgXjqjtyp4l8iBasCeHp+A30r1anz4dNv6pcyg
 GFH/GUSCszV3r2U97MZlt/YokASRAoen1Taz+8QKuuLXaI3Ktqt1XLPbdknvu63YwYylNXDYJ37
 2dX2ycpK1KRIp6IvlJWhhI2cCm01Nrbot32j4dXqufHsFMH1Pe74SVLCC90hBAikDFMEvxk1KHy
 DeI/jPMVyIxuTHl+s+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240078

The PCI core resumes a runtime suspended device in pci_pm_suspend()
before calling the driver's suspend callback, so nhi_suspend_noirq()
always finds the NHI active. Platform devices get no such treatment, so
these runtime suspended NHIs gets suspended a second time in the
noirq phase and resumed in nhi_resume_noirq(). nhi_complete() then still
sees it as runtime suspended and resumes it once more, which corrupts
the control channel (RX checksum mismatches, config space timeouts).

Resume the NHI at the beginning of nhi_suspend(), like the PCI core
does as a workaround.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/thunderbolt/nhi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index e2578740d569a7ee1d5ab22e8effc153cb7d4632..56bc5748b6515b9d4799aa87ce0f72e1d673d634 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -1258,6 +1258,13 @@ static int nhi_suspend(struct device *dev)
 {
 	struct tb *tb = dev_get_drvdata(dev);
 
+	/*
+	 * The noirq callbacks expect the NHI to be active. The PCI core
+	 * resumes a runtime suspended device before calling this, do the
+	 * same for the NHIs that are not PCI devices.
+	 */
+	pm_runtime_resume(dev);
+
 	return tb_domain_suspend(tb);
 }
 

-- 
2.55.0

