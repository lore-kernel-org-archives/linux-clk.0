Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFD8472777
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 08:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790326018; cv=none; b=GxnCx/NCbRKi21zttSPm7KZ3oEJvst8YFSY6K++4q79lHS3o3vkUEF1KdGFxkeOhusbbXWgRJvUDemnMX3OwrEzDT7zRpyxBwfyz2Wb98jlhTc2EB/D6onrhRW6cKy8mYlnVPVoNv76xtsauxTx7dtQurRqaISgaV3GAtk9iHYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790326018; c=relaxed/simple;
	bh=SDLAqJU6hsXEIAGdaMzzyy+lvvs5/IK3BK9h2abrj4o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mxtmx2BYorkQmEZREuGSaqI1Xrnn05rZpXvNGpmEsqlI8CdCSTSdY4r88jC8MMmWWkfo+F/HJsMcFGDcOf7ryOd2HqcJQsy4xEmwPYRZwaZ9BdPOo5mXS6iZi/D7lfK8S/l/Ejuz0hoZ8NqmsoZc+Dp2UDiZMZid2a1nnKLTFrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DRzH6uzn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eCcyZeTQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DRzH6uzn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eCcyZeTQ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YXKF289464
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 08:46:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=GJDnY4MLzHgxp33EP8yQnhHOBbNaUsNxsx1
	NqZiY4vw=; b=DRzH6uzng1YWnxG7YzVd5pkw4ae9YC9HIQifu7l/CqSksO2ljEU
	e4D3kqCvbV8n/kKqnk81aDFoLUscTI8EwU7Dqg23pheeC14EtzplfgSwGcciWKWn
	2zn+KWrxe5GFxKNzqjCx4kOtoazbVhOOWwlnnNkAtbveP566PXMX80tZnLUqkuEp
	0La+GbCNevm12kOLiNQoGwyk2mCjT/dJ/ibbQdO6/RiLX14qcQgicjEOhbT8SK7w
	gA9ysad6DsTGB7AjAEraLdZcC+/Byj7hmO/dXXaswd6ndWu/c0/OyuQaZCUFgvm7
	+mQ2Gm4wKdu6YYtRZy9gmw7rtLowsO7JDEQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw881trv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 08:46:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a183a0e93so136392985a.1
        for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 01:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790326007; x=1790930807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GJDnY4MLzHgxp33EP8yQnhHOBbNaUsNxsx1NqZiY4vw=;
        b=eCcyZeTQ9pE+1SB2/DjmNoVbIt4Wr/ndfasWYxlIWXzCm13MjNDSbgXH2WQJWjkgF+
         U8K+9UOopZYPNPvjUXuGWhXjXtj6UnlHIoRqH7uX+G4G5aKQ921olnCd8MAZp6Tv0Akb
         xxGzOZzEluEwt5E9hHe5XOYGmJxapnFTt0QrxAiC9bkli6SZbqC70EyW7xgHL0xarpSI
         gxZTsO16o1VAw/JZh80eEeUGYr0opl9DzDmqXpAvKPzDCm3MErjPp7NhqNA/nUIJPmlt
         dLdV5APuyP6nOxZwy0IJOWm/FVaPvDfVOCVprMl7i5pDwIirqkNBSgTsHnLgxdBWxNji
         xw7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790326007; x=1790930807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GJDnY4MLzHgxp33EP8yQnhHOBbNaUsNxsx1NqZiY4vw=;
        b=q0CUbSk1KXNRd6Egs3oCnZOIfYxhDXuD4wV1SxrOOxLh1nGYBeQ+DSIcg+3D8xw4m0
         7CcbSlWRHAA3QrRm6c9SxjBjd+jhvNkabEGO9o7L9IBrCemaVHzuDc+U5D0mkE5uksnL
         jPkMN/GiQVeOvKkE9ZMdJLCO/OwjyaF25eAW0cCu4WbBUC/yqKYmm0dIupID8ysSd38q
         ZImHD+H0gvmZe5QvLULpn47f/G3RkTgr+EmXs9vOPzUdO8ctu4dc3PnW8SQNa9pDWwNI
         x5LS5EU9pf9v00ntYreh62HgPXQ+doxIcwTB6qnZfUPk7HFAuGSF/whOIsPSUzTqp/D2
         s3cw==
X-Forwarded-Encrypted: i=1; AKwUvBwmW1R5kHXzCW8UNdsumwa+3IoXDTHo+QU92hq+YnkyJrySSmbZs+AJHR07cdYRRx2hDkv5Oc78VG0=@vger.kernel.org
X-Gm-Message-State: AFuF++kvT3xfIbAHkfNL6nxpUpScKDp98s5PcgwUQfdx4nPgbiwxrT5p
	Jfl6cQsSQ2V5fVHoRE7o++TsWo8jBV00/nI+Yqf+2JifXbI4zj5SGhI9qULZdFuku8UH4p8jzc5
	mJNiqGGjVr1Pro8zlJyMwJmw31LQxM2LZU41qJeNRA+9wwhb4uX51OHvKcw9KhQM=
X-Gm-Gg: AYBFou2T+lwt9FlTkchMT+014ucapzMjeTxNChW1nROdf4RhwlhtlvPZOv+eIh73MZ+
	kkuVTG6xcHVSb9+Aa8nkBpOJFuU4APHvTeOGV8jgcGgnmARI+JYa1O76Ua5gazZn+JtPnO1tI4o
	KqggwLOJ1l29Wn/Q0A1MFCyZ6EtjvVanWxtkZWGuGEqZ4neEIm9LVd8v96zBpYqA+A9ruMfcGpO
	VnocIJ/uePjr7S/laXZsAWdyQQSV6HBKr4rRwNb0Swyf3E+9+BDhkFC2KmFkKriy+PRpYm9b+rE
	lGsUzpcsdV1dnWpmxfrD8mzg3OpzmFb4ePX8oPyH0UILpX/9uctPivvE9wwFqtqGZtFyvvx5QNT
	kDV85jjWP1Wbz
X-Received: by 2002:a05:620a:4887:b0:937:6832:1f04 with SMTP id af79cd13be357-93c43cd6560mr337816685a.34.1790326006959;
        Fri, 25 Sep 2026 01:46:46 -0700 (PDT)
X-Received: by 2002:a05:620a:4887:b0:937:6832:1f04 with SMTP id af79cd13be357-93c43cd6560mr337813685a.34.1790326006499;
        Fri, 25 Sep 2026 01:46:46 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64f9bcsm5281953f8f.32.2026.09.25.01.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 01:46:45 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 0/4] clk: qcom: Add LPASS clock controllers for Glymur
Date: Fri, 25 Sep 2026 09:46:31 +0100
Message-ID: <20260925084635.112399-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6ab634f7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=qxLtA1zAx_OvAWKx6QUA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzNCBTYWx0ZWRfXycKNwyoK8GhN
 5ZfNr6OI9H5GEZqIsCdkndrN/CF3lR9RpeMeNDTEFXPVVqutj7xCi4a3leRrwI7nQVxW6wLSqn5
 UnIo6NVBqJob3m803JXxRGRIUCMDxQ1PwRl6jECJAqIim6nmRMiBkwZLCGIbJwOt4h82ag4ScK1
 S+4zWSXu7hbvfyps72ILiML1yYMxvooImP+qHuOkqzguGHhdhtNSSwrP7hp7eVKGVZtL+h/47Im
 xW67gyMHFJN9JfS/QWYaU1ilfSlzqCdfh9sqpqmRwFaokOBB/Z78GLJ/4bcOR9o3aT1TfRlgOkP
 xepbQkiiMG4pH70M+gJ/n9OoY9JD+IAYOCuqJfbMM5pMFQxiqaD60UQCi7+0PUfdrsX1sBs6YuY
 zsdfXPYGRcZD74EUuVBES5t/ru19T3HFfpYyoYeR4vevkmTvrRySwc44YpB2X0flHT3sjgbM1AD
 evO+68qsEYlOAqrbDRg==
X-Proofpoint-ORIG-GUID: zsSbGiEe8cdgfFK-fXmOZaFco9iYnvnZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzNCBTYWx0ZWRfX288kxCCMICMX
 KswbTdW73IT6wkpWXp5zahRD83WlwS1eouYs9uxPR5dsqwB/nVZ85/6RXthS8s7jMqflpYFzGgs
 nfjtNjdMKu6nY5tlk34LAejeixEgvvM=
X-Proofpoint-GUID: zsSbGiEe8cdgfFK-fXmOZaFco9iYnvnZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250034

This series adds the two LPASS clock controllers found on Glymur:
LPASS Audio CC (SoundWire RX and WSA1..4 resets) and LPASS CC (the TX
SoundWire reset).  Q6DSP owns most LPASS clocks via Q6PRM, so only
resets are exposed here -- enough for the LPASS audio macros and the
SoundWire compute-mode controller to leave reset.

Changes in v2:
- 3/4: drop <linux/mod_devicetable.h> and <linux/of.h>, switch probe
       to device_get_match_data(), lower-case reset offsets (Taniya)
- 3/4, 4/4: pick up Reviewed-by from Abel

Srinivas Kandagatla (4):
  dt-bindings: clock: Add LPASS AUDIOCC and reset controller for Glymur
  dt-bindings: clock: Add LPASSCC and reset controller for Glymur
  clk: qcom: Add lpass audio clock controller driver for Glymur
  clk: qcom: Add lpass clock controller driver for Glymur

 .../bindings/clock/qcom,glymur-lpasscc.yaml   | 60 +++++++++++++
 drivers/clk/qcom/Kconfig                      | 11 +++
 drivers/clk/qcom/Makefile                     |  1 +
 drivers/clk/qcom/lpasscc-glymur.c             | 89 +++++++++++++++++++
 .../dt-bindings/clock/qcom,glymur-lpasscc.h   | 19 ++++
 5 files changed, 180 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
 create mode 100644 drivers/clk/qcom/lpasscc-glymur.c
 create mode 100644 include/dt-bindings/clock/qcom,glymur-lpasscc.h


base-commit: 4c253ac4b29b8c6cc6fdef8f92d4facde62e63b9
-- 
2.53.0

