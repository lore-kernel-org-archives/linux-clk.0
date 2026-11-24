Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550515;
	b=fda9hxCGrbC5y6tQDXGsz/GSDX54/byMRXbN52EoLyV9DIlw6yFOIKPqAElHo55ISIBh
	 roFNif3WmfWqAkBveNX6E6gCdr6I6FzE+xZ08LPDVabnU4vfArt5xAkGI7zlrLDhd68Ex
	 UtDX3FcJZ55+glSW4pwtIq7zzVEm/5yXnx69A574ycAZCMGisaVng2je5XUv3RG9RhX9d
	 W9uYu9YwL2TJj0ZITjj+7uZCmdqJua4Y8EP3zUiQfLWkIEIIB7jzXk6D+x9bLlnKFYG/3
	 8RtP4aCI6faCD5gB70ipA/tJdK93vnWuy3XHe5TGL3iyiHMyJp/+9swyLwMSwO2Di5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550515;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Zy+iehtUsspoMXUA/AtEi2Wy/F+ut0xsQzXWd1oWWZ4=;
	b=BV/xwDgdI8zxq/6AHS2C/TrH3gmzmltmMPdLaW5xamuztqZxioHwNsYarkMzGJDQCNl+
	 R0ret3cAOUcdltdIFSloO7cut8b67BXog+Ia8D6x+ibbgn2pg83EFR62HJFuUDZh/3C8l
	 vUDcQA2Vj9Gxx26raQmQj5hbE1d7Hi9D5JdiEyrF8I23XGdQildaFxUPFsxIrFDh7JQcA
	 5qGHv1y5pbAMZVs4Off8ZJiNCs2a7c0lWdB6gWTy0vgQlWpeK4usRPL+K5hFmRzoR8eQo
	 4IOhueMqLiLIG8ux4Mk/TZ/ADvbKH7+kHrEElvwq9V4R1cAljCnJlhbDpNny5uNaHzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Mbn/v1qr";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OuvqWbU8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92020606A327
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 20:01:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92020606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mbn/v1qr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OuvqWbU8
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOIXaDY2132816
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 20:01:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zy+iehtUsspoMXUA/AtEi2Wy/F+ut0xsQzXWd1oWWZ4=; b=Mbn/v1qrEphKP6KH
	QaIjKnLmuVnDvXfbLR6ZtxJdtug750+GoiZnmF40mZeOHvKWoDt63ndD2ZwZXIzj
	gaKsI5mTH8d0CDotUO8cNR8JiCinSUgae2+s1PRRuqCvMvGyCS3laYuVjP8FrNPo
	/Ss9riJxY6fEqH8UMf3VcGJOeR75lD5JNoXVub45yZI/n3fBJLYsC+Tftu7eBkef
	nTjgiOrHVucjsX6amchlYUEyoV5XKJo/z6UFRH+qmkoDT2JzTv1Ydv7fAgZzU4Nv
	oMC0v1eG75HZ4SQB7Pi5Jik24I1IgjuaCpSevqNtqtFzXQZBgro5+VYp0X7YPV9X
	hkivAQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5b801ygw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 20:01:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-949664eec1fso64430785a.0
        for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 12:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795550513; x=1796155313; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zy+iehtUsspoMXUA/AtEi2Wy/F+ut0xsQzXWd1oWWZ4=;
        b=OuvqWbU8JJYCbjLLyksHQInVkYq5GiNguQxohBWYa2miYRiGX+otHvzcOjSq+rF0K7
         brC5g/b0+d/0Vt440D179Tx/5g35ry7rPtcwOJhnjkjzirm/8+aGS5Ow3mesoY08bae0
         xN9nBCrGHmlzmnmoJ2Q7m7c6YqTo4Co+Yli9qikXq9GBT90SdlasZF+SMfn6ju3QdVSr
         M+C8TzQO5nyi6wBu0QCDJsgwUFKbqGwjsinISXhLDKuGpW3MGxJQWMjcqZg87k6Wsks2
         9kGo98s266gmdid5TL4sv6NIag1t0aI43qmJdOuOcjw2uGk5/7N5fPnpbjBC8oAuoBy9
         9b9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550513; x=1796155313;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zy+iehtUsspoMXUA/AtEi2Wy/F+ut0xsQzXWd1oWWZ4=;
        b=HY6oRs+e70CZXKzd8YwReHJDhfNcb/x6v64B+HanUeowrWSkhyZoo3EHnWNEU8C7r7
         hpQb2p+7HR71xO8/LpsUifb0u8bLL/qKGW7VvCDiuRic9Ep6drzPl0Jx7qvsL+4YNu5E
         InzbbZf2QBBhfnVQzxH3hv3BL0aND8ZIv0VsFfRheCjWm69hvmU1cJtsBsmm+GLE28mG
         MphRtqlUBFm7dELDUyuH5xEXmVM0CUAQJyaEDgap1UD8Hj0koKHmnY/DsX3cMHGePGcv
         cAsrwZL/abdt8ip/PwVM4XgxhI10E+n/dlC1R7t8oJai5j+lR0hfi5/WCsW8VIpb9cOj
         yS6w==
X-Forwarded-Encrypted: i=1; AL+hErH5cEs7EKbqlJtuwlV6QBaVUg7pauNv5njKno5Sq1lTWEaRHuuZ0PMgmiSB9UJwdsTiseYfpQK+fXU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/G6KOkmxiyvFK9lUYYS4/bTl8erJKkuWhaxcvaXJrDen1EJoq
	ZqBgKh1nxNiqY6lPTNrcsCQAlau6huXrqT6n2W9vs4FLqSv6KaM3I0bmN9S09NCQXz2H7OoVueG
	lBOIWnNnP64wi8MsuiQt3r4apoglFVXTRdMn9jQURmoneCSgmaYFSKkpihyQ/n2c=
X-Gm-Gg: AZFdTZdWhs+dMjRli+yytSkGyS5QxvVXHX/Bmk4SfwvhdaC2blBN7LTarGeT1SDPZsm
	tueAyuAJNC+euIdtFUR0RvESBkCpZrq1ABc3j6zTCY/yQBo17xXFenwCJ6IpGu2T8b4xwIWxcaK
	TMlXopD7iqxzEsbPwiIhAvDj8DvygJ53IHM4krO4j9NCy1Ac7fH/L2KpRdtuVyzBzaXyvWc5lkT
	sVloNuMAgxP399vL9A/EPrFYFKOTjYayN4fyk/PTCTNN6bGwYPHX/iLHMyM0USuy/MqS1FLm1cG
	56meKOUEb69V5lW5oUBTa8bLibpmaCkR6pF2VsMice1jdJWoyiOm3Ld+rcnT1M8104qe5dPb1Oi
	JbA9+LdZtc6WNGO0Kz/RzBJubAn29v5BxIuA0eBUtlRjEvZeGm+tWoNZ+qVaTpN6gynS74bjit+
	Hwb/etZwY=
X-Received: by 2002:a05:620a:a11:b0:93f:740f:5a62 with SMTP id af79cd13be357-949bab7d122mr2707798485a.6.1795550512873;
        Tue, 24 Nov 2026 12:01:52 -0800 (PST)
X-Received: by 2002:a05:620a:a11:b0:93f:740f:5a62 with SMTP id af79cd13be357-949bab7d122mr2707788985a.6.1795550512169;
        Tue, 24 Nov 2026 12:01:52 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:7192:a019:58a4:eb4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm517678195e9.7.2026.11.24.12.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:01:51 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 21:01:33 +0100
Subject: [PATCH RFC DNM 04/15] soc: qcom: pmic_glink_altmode: Enable
 TBT/USB4 negotiation
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
Message-Id: <20261124-topic-next-20261116-fsm-mvp-v1-4-a9b45c69cd38@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795550497; l=1317;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=3/ET7POdT5Pe+t+Zq/yBmXJJgRV/1106W5V/3UIdJRI=;
 b=qv7cILk12lrlqRgI8UZiPG9d9Yieiz5lkd7kkOPhcEJOFVffw1JubNmMvhJFTs5tWJE7etKhH
 eT4plqUe5EJAL6sEKHgE1mFJ/adw3SwYZXmYsinV7VV9tLoCicCt3Zw
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX1WHS5Qmzh2c5
 Z8OAQHkSA0a2a21FnZrw6n4aueS5CubxgkSbPLns1EOxYPuEwI7gaGVah1x/U1aCjAPIeXp1vWm
 YOMJTrH/6+tnvaPPGglD4zJ7a8BxFBT9Vyc/M7H8Y18fO1gKJ5hiSzvC9SFopBMsVcgoq9QJ6MO
 BJ1GMMeo49eFb0e/0fezJVVSj151v/Uc5TMQoidzK3R8i4oOipTRREYqgoqGr1gUOSJhNy9EbNb
 hS2Ls1VaZP2W6Rd6pSgsghXwKBKuvfkwh19zpIe2HF+o5yVcAlaeJz4QH5duMGUW5mv3S40PGs7
 L/wliBaPauL97dTtEerxcB9J5ee6Fd0Ixg3r7qJRRCUHWdoyXFvK1HUouuNNPdlvEYyHPHMd4Oh
 O4WW/pdsFLYvyS+VcdOT7acc+6eEAMK6k3g1RY/lleTcgR6LHf2xyeZwNDN35GlaO1qov+2fRDF
 yAfVopWzW94csh/jXNA==
X-Authority-Analysis: v=2.4 cv=K5W3jCWI c=1 sm=1 tr=0 ts=6b05ed31 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=WbklaN51CGUtf8hYuKEA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: u_wRDqCp-c_BTha9Sar3gBaat5CoqX8B
X-Proofpoint-GUID: u_wRDqCp-c_BTha9Sar3gBaat5CoqX8B
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX37/0os1elTaE
 RQnPwOlz/lMyB5vrp6I5eMJG5eyQHxy5e1ij5dyqFwLmhQCZfoR4KghKOeDGcpJctaWGMEIVgud
 kZSHhyWJf2EYszCmiZqT/3AmCJ8ha2U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240078

From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>

Now that USB4 is supported, stop identifying as an installer image and
report the default OS type instead. Newer versions of the Glymur SoCCP
firmware require this argument before they enable USB4 tunneling.

[missing W's s-o-b]
[konrad: commit message]
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index a8097c54a65559b48f64bfb65a1a4d0d8e033be8..f54d02994eaa96af04c673459b28edd482de37db 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -571,10 +571,9 @@ static void pmic_glink_altmode_enable_worker(struct work_struct *work)
 	struct pmic_glink_altmode *altmode = work_to_altmode(work);
 	int ret;
 
-	/* Set OS to installer for now to restrict USB4/TBT negotiation */
 	ret = pmic_glink_altmode_request(altmode, ALTMODE_PAN_EN,
-					 FIELD_PREP(PAN_EN_VERSION, 1) |
-					 FIELD_PREP(PAN_EN_OS_TYPE, PAN_EN_OS_INSTALLER));
+					 FIELD_PREP(PAN_EN_VERSION, 0) |
+					 FIELD_PREP(PAN_EN_OS_TYPE, PAN_EN_OS_DEFAULT));
 	if (ret)
 		dev_err(altmode->dev, "failed to request altmode notifications: %d\n", ret);
 }

-- 
2.55.0

