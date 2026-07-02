Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9873633D6FC
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 17:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783012167; cv=none; b=Zcoc+5oksaXaRUl5EQO7z3PwTwYMq15sCTTXH4qY92rN+jwBasEprhbu5qq427p65v8lkMJx7oZWLdKllXYKE1EOHlzrAeE6IpjNnjZCbovocrCvwvuCLeIi9S8Emwri2N0C/bLyNxFCumOwRHOIwzFOFwwU0qKQPLtL7QpXGJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783012167; c=relaxed/simple;
	bh=u79lhT1lMVctCBRknaRHjj4cM7lR/xKEJk/uC5skegE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fX5H0OXhYEkNR0nzkqpanB9dP15tZXTBclFcS1RWH4bBOxusg4DM/BKOBPqii+ZI1Wyzr5RO3pyZunz6pHQLatGwEGb02QdynaY0hdXBvDd6CIypRoO3iwRhZVvSmLX0OZWTavOfJGPBaLMtoBJbULmRIxCoJRXxCct412wSn/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fm+8SKgW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LO3iObp5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fm+8SKgW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LO3iObp5"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3M4o661923
	for <linux-clk@vger.kernel.org>; Thu, 2 Jul 2026 17:09:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=E+tfsQg4XuWFCHdwZ0VNEb
	dCPvzW0k/M5Unmvuik7v0=; b=fm+8SKgWCh+y7CDJMa8kKmajoAkWlPfLj/xRip
	poLsmF6eWM22LAJQAhhwVtTC0XWOUAEp0AhHxPElDtuxPn+H9bRs/f9sYmWH9mfd
	nP9jLpGo5sx2OvbPku93o+ANJDhpOlplYdwLIHGTFqgx2YVP6xwf7Sd1QOX2m7te
	oq4z0BPwTxceEn2Ii98ZiKWAiE4/OvZEgSoe3fuBN2/ibxU6I4qOsP7pUngPV5CG
	gSAYVde80IAY5JPbuDkwM9nPeGLyMlAPQScislq98e7mE5ed0uw3NSAKy3af38V7
	mKGP9AqqXl4j/wQfnoPjGrfeThR7SNO5tqGqc9+rpMf18eZg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qnp9crr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 17:09:25 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3804e5c79d0so473904a91.2
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 10:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783012165; x=1783616965; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=E+tfsQg4XuWFCHdwZ0VNEbdCPvzW0k/M5Unmvuik7v0=;
        b=LO3iObp5YJdfMsCmndy3rndoqpl+YqY6cvoUP2r5g8ywgjKrJs/psNCbrbOzEvRWRV
         2Gw8WSgppd1FiBKIbGYhJOjwedGcamGPHztqGEisgNN8CSyWObh4WduwjhHK/7e3uKGA
         xJBqOs8zfh3rgPlQie0v7X3xvkCDfG6xra7Pg8Jo1CUFwXwYgcm/6aSy0lnJmDWbwEW5
         V76IpMLDHYZGp+TftYZSZxA8ZstG2aQ+PL0blNavBuxJmN0eenahG8y5q++U/OJdwE5P
         u+2HRSb2mDQ5WrDIWiWlZuzjfwF+oJ187RHbJYNuoCu3geZ4xqvR5nNpSB5Iw7X47l60
         QPPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783012165; x=1783616965;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E+tfsQg4XuWFCHdwZ0VNEbdCPvzW0k/M5Unmvuik7v0=;
        b=Bppra57yhXa9CTek0FA03eDdo2wT1lvr7dp4gWgDaSRd5GLaSDzGwJjR1HY2cRaU/r
         bSzx+8drolJyz2Ztz6Qa3Gd7mQO8gk0eqbfQxG2gkmrSCLCtTmnGAelED7X++9E29aY/
         ak2t5MyHUprZwelSiMXSXU0or620DNamnIKo4z8QskBu4gcsqcTVt3C2tjaLmwoDC7E8
         ONaC+IRSKwbk1LGleckO2kvJOi4hbv3BJpap+zkXw+XxQaUZS2ak5pHvpBIkUKYh1lq4
         53sbIAXyI9mY8QovFrxV2FXn/sLUh7miQCxkyg6jeGm6fyLzC+C82OKykvu0M7GG+DDZ
         dm9Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrw1YU88iil3dFz+4lXsGQb6lqQH3gOeKtpDynrHjZG1hJ8TMzZ7+vLIqJ3aMJQhYhrYqqKC8ED2m8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb86xNs1ADvcWgdCTGjN4c776JRHXwBPDTO0MXiesZq1gaH/Zr
	xmmp0r2okScZIWakJOxZhAKfTpuEuCjxCI7RAIBElI63h3vWdMsfiPnpnSLIL/X1JWXVkuut2Po
	JLQj9stp+VXX4eULz7sS5LcxcPrB65Ozevrc4KwZlZE2IHMTN+CfwA/gZl46Qcds=
X-Gm-Gg: AfdE7cnOFzb3AeO/5lPBv925iP7gkgf0IEytthup9NOP1jZK4I7wJopTBf6utVb+C3q
	c1o2dxLfGWyZVLqBcZdd+4mh4AzQjKlG4gv446WwR/mI/NxjndoI5fDUe1j0QYFRJ3fRfwsXXOB
	EGJG2ZgEMRx5x0OWPf5COWGxhRWeuLyCxIL+0BFratAW2DMKLv+6tl3GYgDAWrK6N/q9CihDFbK
	FS6n6WqLF5LDrhhTLBlQ92BEoU18yweE7nr5BmbdEkdVhrb7cONi5ZwtJ9thrBJjae2gZjG/xY6
	iDjKvkuOX7yTT58qlBgAUfDBD4e1goxYnw02ouII/IPhTEGdqlRdmQwV8jpBV0cUzIEd6c3v4Cg
	+ErgdB83LI1o2TYBW1viOlbmU6XjiYtF3bSqVvnJbfDGvddUxNJoKtLILfI4=
X-Received: by 2002:a17:90b:5827:b0:36a:5438:cff4 with SMTP id 98e67ed59e1d1-380aa23f18emr5132441a91.6.1783012164661;
        Thu, 02 Jul 2026 10:09:24 -0700 (PDT)
X-Received: by 2002:a17:90b:5827:b0:36a:5438:cff4 with SMTP id 98e67ed59e1d1-380aa23f18emr5132422a91.6.1783012164203;
        Thu, 02 Jul 2026 10:09:24 -0700 (PDT)
Received: from hu-linzl-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bb80f5csm16505031eec.15.2026.07.02.10.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 10:09:23 -0700 (PDT)
From: Lin Li <zhuolin.li@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: Add video clock controller support for Hawi
Date: Thu, 02 Jul 2026 10:08:06 -0700
Message-Id: <20260702-hawi-videocc-v1-0-6c1e640b0954@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPaaRmoC/yXMSw5AMBSF4a3IHWuiTarYihj0cXENkJaSiL0rh
 t9Jzn9BQE8YoMku8Bgp0DIn8DwDO+p5QEYuGUQhykLyio36IBbJ4WItq9MqnVGouIB0WT32dH6
 5tvsddjOh3d4G3PcDiQ4IPnAAAAA=
X-Change-ID: 20260518-hawi-videocc-90265db7e712
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lin Li <zhuolin.li@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783012163; l=841;
 i=zhuolin.li@oss.qualcomm.com; s=20260512; h=from:subject:message-id;
 bh=u79lhT1lMVctCBRknaRHjj4cM7lR/xKEJk/uC5skegE=;
 b=9V6b9oWSTx6kZeIpsgNN2N6YOY+vtGSyJaUmccYW12S6J4ZVKtTKtqTthLcRO5jR5xCnUVOA3
 OQ5SLsW6OgZAY8vwpzBKTTl9UOR/ND7tCt0csroYa8VKpFnT5jsjdSN
X-Developer-Key: i=zhuolin.li@oss.qualcomm.com; a=ed25519;
 pk=MHXg6mCJoooUzb0vMzMIbkL59skKuD2BVgAX/XneLrU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE4MCBTYWx0ZWRfX2DB5iEfKHZph
 6Y+thUFbcYzsp8uFHPo+FH4M+87xioqgpo6/j180pBp558P8TNk+C5ksKuDCnSj+3IdaERusYyS
 tRdBeJbpHBajCR038blRdTt6cbNtrbE=
X-Authority-Analysis: v=2.4 cv=FoI1OWrq c=1 sm=1 tr=0 ts=6a469b45 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=mUcvQ3vS3PEDK6hVkjoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE4MCBTYWx0ZWRfX0fU4DruDCDuD
 Genf9ZJXUSWth0jDrPUapNZp5MeORrh6ZiVqz2b2euqIOoqn13UUC/jQqhCS7OHxg9hRmrDBKWp
 x1bqsI1r67xY897qybb+xhU6fW+tsOXwQ41PrKUy+oPGwSF3qIqwooBx15iWqQblfrhxZMn06D1
 /GHsLvyMZiWg41sftteO2gGDZOUglWLvwjC6nNNJc7/Z7pHi2H9nw5NJBudZyIbF/nwORY3Enm+
 F0AM8LF/SPubivF1ag/q5wMLTPz9m9M6ewDhR8urm9l0EXY5hWxNHhKMSIa2FmLlDOxNof5jeAo
 qWdyDbvxhzirJXMbdJbKRz7cEKqXwW9wyP81sxeyTNJ3deOS5pAsLNvEzBPeC+GyfywKiGGnohj
 IRGQW2Y+LnymHkahXootAIdi5jgWTeReYo4nYakAH2vaisKcpBfLgdM2yPAnGMUCs8oQ40vExuM
 /03lTR9dcY2sgbKtMHA==
X-Proofpoint-ORIG-GUID: H2torNvlwG6-QB3Rv2Jkg56JzCxjaoze
X-Proofpoint-GUID: H2torNvlwG6-QB3Rv2Jkg56JzCxjaoze
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1011 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607020180

This series adds support for the video clock controller (videocc)
required by the upcoming Qualcomm Hawi SoC.

Signed-off-by: Lin Li <zhuolin.li@oss.qualcomm.com>
---
Lin Li (2):
      dt-bindings: clock: qcom: Add Hawi video clock controller
      clk: qcom: Add support for VideoCC driver for Hawi

 .../bindings/clock/qcom,sm8450-videocc.yaml        |   3 +
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/videocc-hawi.c                    | 840 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,hawi-videocc.h      |  64 ++
 5 files changed, 917 insertions(+)
---
base-commit: 4f441960e691d37c880d2cc004de06bb5b6bd5e4
change-id: 20260518-hawi-videocc-90265db7e712

Best regards,
--  
Lin Li <zhuolin.li@oss.qualcomm.com>

