Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1C337C0FD
	for <linux-clk@vger.kernel.org>; Thu,  2 Apr 2026 06:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775110576; cv=none; b=Qhug34tD3SXGJa70E1wNvxnpaZqpp2h/3eivkPt0zDbqdAqga1PyNq556QFZurShort33X1a+LNN/b0uQ6/9kENIGBi5ZMgOZUIAULUpK5fSv+MhYXMqmC9jAmegxHYJAWiIXeJiizMe9OtN2k0WEpbG/ArzvBrj/Haz+qbk/qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775110576; c=relaxed/simple;
	bh=Gg5vcc/3RVUkhCzfHW9ClSxYoLFdUKduZUXpgADLaxk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZvekmuXTLYfUpg8aduK3gCfsD5r0JE30z2GPO71VIeLIEUVr5bpR7wSf4q8KzSNrgaD/c5dYthMQj57VF6dlOe1bhvt4WnyfTmmYgINqneJxSnhoXermaMi8Z4ib8bzTsDVLEBlATJyvNd48NfMFA409WkLRTv6lXX89mzEet0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mpkiiCCl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BX8jSw47; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mpkiiCCl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BX8jSw47"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6325VTJT090872
	for <linux-clk@vger.kernel.org>; Thu, 2 Apr 2026 06:16:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mPXcXgDL9LwDyWtOO4mR1I
	5ylhidkezebiRyWUGe/Dc=; b=mpkiiCClfhcAZN65/rew0mZFXobfwL5wza81m5
	XItLq9DnoTd8W63BrJ+/Q25LEt6KVwXL9ObeoEGTDNGf9rjbtqhdRygKfkfbvYCR
	DdAt7knuBEY+8OPTMKGswo02BMF6NVk5F4D9darb+WPhoyvmM+pdEkA0Z53X42eJ
	TPZBBH59zQSawhS1ihSnfWbzUZBRvq+qQOATD1i2W64y4RksgPcqvA0RN+bLHtV6
	XLVuxvMSRFlOh2EuB298CD065RWJq5vQuH84ixpA2375wHGIHBcppIFsD8liGZVz
	2JMee+yMU+vVpn8XkMR8/QpDygXi6TgMbXCm5cVNoYdvpg/A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9jcu8506-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 02 Apr 2026 06:16:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2aad5fec175so8364895ad.2
        for <linux-clk@vger.kernel.org>; Wed, 01 Apr 2026 23:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775110573; x=1775715373; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mPXcXgDL9LwDyWtOO4mR1I5ylhidkezebiRyWUGe/Dc=;
        b=BX8jSw479mjGmzMDKFudN8Rz1iiXrOtUCIU0YeV3XcQqZ6Gbp1jjNfuUlMwIjtwUYE
         PQtvOJOCQcoj6hT0SdABcbF8jMwxYhdg5jM0MawbH+RP1Zf7oR+yH8cbTb0jcP60ZOJT
         gj5njttYrH03lGGHFp2PntobDq2FzY4iKiyKTM5t949ftcIFlj3GjbvhQWoyv5h2nBtm
         BvT4kZHWLj4/3ZUEBuoYV5/cNYJkgeLYfxa+Arf5LZplVB7WFLNN9zfCarbkm5WMUkOn
         1EQnEG3U1KRGpKccsUzukYrZ5OgqNa7YQgbCRNzbzJcIRebKN6ZvD7gsVv2DaiuZulha
         WN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775110573; x=1775715373;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mPXcXgDL9LwDyWtOO4mR1I5ylhidkezebiRyWUGe/Dc=;
        b=W0wuoSrW/qhZcvLQ9LGZ7xN1p87iORBjpG3Sy+b8eP/Tp44SHGMMJpQNUGSd7TR0XF
         eFleKqJ7hdnVbFFpbOvqcVmK3hh70Crr3k/tSj9hYt3j5MlsADD7Kl5alWWlCGdoRbrO
         Ne3Jbh80pMUcEckSQv/k2SZLkp4UI8SG+DClLBAeaE0C/h6wNbg20lkrwD7OCZORSR4N
         81/hoxzAb/x7v5DMD1AkJeT/HWFlPbdAcaR3otb2n8EDcSBBgmys8jbFVWFBPHP7lqP3
         tdgoYROmzAjUs3kOZMaQpJ6cHJySbG+gexFRZe1FYmZTPSeINld2s61QQ8CJ8UdAa+Db
         etnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgzlkycYwvqknMCBOcX+/ELmr6IcpZ6MC5+6OhzbTXdcYIBJ36L+/wDOXqyIXRwmZcMLPzXbGFb8k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwizG4y+qOuUKCMxby/7zeiTyElHnh9rpyk6iBOXSvfYAVlJqE
	IFIEl8rU/+sR9a2E7QZUHXGb2qZunTF0C2p+FL7mB5+vVwLN+mCXScaMDqgcFqgr6jTUfDSAA1L
	TMaFfuup+IftX+msqMGoF6pxJnm6lhuCjl6r44+qAUSTZiCIn5Q+R6dr5L8rk+NE=
X-Gm-Gg: AeBDiesTvOCcKpFrCVWOOg0gsFPE0zwDlLiY/vlB9U2lZc+w0NOKvE+PsgsKWwpa3sI
	WbcgCyn7D/zAhanRYS64cMKKUHAXffvN9/TMess8TLBeSgda1+bjaV07iO9aWEU1+aqP8HR13eP
	1YMjD/8fesmBtGSyqfwU94kl12DmhA2jrVZHJyXArWCAd1m98cLTrXbSgNbqUb830RGJQI97x/d
	B9oH97iNOfkmcesMnGQVLtapHPCbeoJ/+TTJtBAKwUZMxV8kYwzFbhu4nT8VEqgR2zagCP3oo3K
	thUsrTPphAJxDLZuzURACX9CPtg50tGLPk49dtY6bzYDYn4BdUpObW4kv1e2vY6Qg5NCwf2kJ6/
	kRil318Q/IXo9Uj+71X5pT+h1lHCCUjo/6uZ5u1KWAjZvb43E2fEm
X-Received: by 2002:a17:902:e785:b0:2b0:a980:367c with SMTP id d9443c01a7336-2b269ae0363mr63090955ad.2.1775110572813;
        Wed, 01 Apr 2026 23:16:12 -0700 (PDT)
X-Received: by 2002:a17:902:e785:b0:2b0:a980:367c with SMTP id d9443c01a7336-2b269ae0363mr63090645ad.2.1775110572384;
        Wed, 01 Apr 2026 23:16:12 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cbc58sm16538615ad.78.2026.04.01.23.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 23:16:11 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH 0/4] Add camera clock controller support on Glymur platform
Date: Thu, 02 Apr 2026 11:45:42 +0530
Message-Id: <20260402-glymur_camcc-v1-0-e8da05a21da7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI4JzmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEwND3fScytzSovjkxNzkZN2UVCNDcxPTlCRTiyQloJaCotS0zAqwcdG
 xtbUACmE4v14AAAA=
X-Change-ID: 20260401-glymur_camcc-de21745db58b
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA1MyBTYWx0ZWRfXxo9S5VMqwOXg
 nlLYN4NjllP75W8OJCxNK2mnapUT/rM+iNituPHN/Db2T6U/tduMajJjXq7SVhBKnOxbAl5/qtw
 lJPe+jHY7MZuz9V30TMosDqBtGVI1yGWw/S9pA233RnbeE+knkwPupowFae51OBNetJ+feMVG7/
 8sMjfMSq60Uort/ab7CPZHQarTNgRcye8TXH88muXMxQsoKuFiSOQVd3TLbcHX11SYw8RVLTZ7r
 saWslYO7WEElRZRHJDIdbzxDrtwIa0Yls0Niy7dfbOO/RHOiw66YCu31Deevs2lwG2hAUHkpMg7
 wxaasIA+KrAen7YJDmtYUeUAiNYklOsO3IFfb1sHT+60tF8tHVITC7rAH1NCBuO3nyzjbFR/A3S
 S34LV4OyGVrtZ0E46EJlvCtqgWt3gcxABbb2TAYLILSz8CInDjRgr1Uk0jJTIfoU3LlxN5pa9fG
 kpebHCYtcAfzEhFFrDQ==
X-Proofpoint-GUID: ICEPWrOR_wOui3H1vjNxOQE7Id2CVmW7
X-Authority-Analysis: v=2.4 cv=eYYwvrEH c=1 sm=1 tr=0 ts=69ce09ad cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=HjKqFMqo481W0hlq81sA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: ICEPWrOR_wOui3H1vjNxOQE7Id2CVmW7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020053

Add support for camera clock controller on Glymur platform
for camera clients to be able to request for camcc clocks.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Jagadeesh Kona (4):
      dt-bindings: clock: qcom: Add Glymur camera clock controller
      clk: qcom: camcc-glymur: Add camera clock controller driver
      arm64: dts: qcom: glymur: Add camera clock controller support
      arm64: defconfig: Enable CAMCC driver on Qualcomm Glymur SoC

 .../bindings/clock/qcom,x1e80100-camcc.yaml        |    3 +
 arch/arm64/boot/dts/qcom/glymur.dtsi               |   16 +
 arch/arm64/configs/defconfig                       |    1 +
 drivers/clk/qcom/Kconfig                           |   10 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/camcc-glymur.c                    | 2280 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,glymur-camcc.h      |  122 ++
 7 files changed, 2433 insertions(+)
---
base-commit: bd0f139e5fc11182777b81cefc3893ea508544ec
change-id: 20260401-glymur_camcc-de21745db58b

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

