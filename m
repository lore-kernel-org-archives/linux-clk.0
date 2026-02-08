Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7D13859E5
	for <linux-clk@vger.kernel.org>; Sun,  8 Feb 2026 23:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770594943; cv=none; b=VX9ZWT6EqS4tG3W63TRsEdyMpl+8C/0T7MxknyKxMHuSSn4ndfoZ+F6Ku0KGqz8qcjPtqCwrXCqvYT1eWZuYiowY7DVtujnCfO8o5Rq1a/zo4Qzf37vSiAutXuB0r31rxOGVhuke6MgK2V7Yyd8x6AgvbQexJ+RdkAOoaJnB1DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770594943; c=relaxed/simple;
	bh=QHhMVC8Ba5BOMF+mfpbI2ACbKzjNYug4cucxI+TmuSM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GbIuubXIYDfdBEnG1TZVR2lCdyrEL/yccvjsOo0io2j0tXh8rSP0U5wDQrMMr99PojIWGZWU7sHLr1d7T0Dg6oJBHcb3Dd8zH4Illeebq1sQs4Vd6TGaWZBUtmFgeAPVHaPVariZCNzAjqwRE6XctXAcJ/88xehSRuZQobylxng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XpB+IgQQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aYSysiOt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XpB+IgQQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aYSysiOt"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 618Kf2IV1659786
	for <linux-clk@vger.kernel.org>; Sun, 8 Feb 2026 23:55:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WWrIAGbD+swm1Y8eE8Ndqc
	BisV5nldwTY2Z/dAcM4aY=; b=XpB+IgQQCZTHrwCL/2TI3CL74zFK5LNM2vVMjV
	WPQb0R9Ji2YrmvTFEQTiCLXOVAuvtxBUuPxa1s3+VxOCj3/NSnI8X7OfnIge1Tvu
	FjGTASuKeUP8oitdWFATbC4G2mwx8awXWY+ZyFqf/xQaw06EAsqL4880aT1mGsU/
	qAf7QXK9SNdPBig5HwqSTmGMy2OAebU/ftJrxqwzS2hGGOiOb9R3QNOcIj5zwDPG
	gQ+gtudoq5I2Pny9ALTsSxjOn9dqANzvyJXFHaNBQT3D8vNNMwD4rSd6oXimnvdT
	FGJp58G9NPL82WwYbPb/X9+Fs7KZHAXnkTxtNJdFMnGD1Krg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xamu4ch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 08 Feb 2026 23:55:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52f07fbd0so1075547685a.2
        for <linux-clk@vger.kernel.org>; Sun, 08 Feb 2026 15:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770594941; x=1771199741; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WWrIAGbD+swm1Y8eE8NdqcBisV5nldwTY2Z/dAcM4aY=;
        b=aYSysiOthVXhgu7fE1lvlGcdaWI8hC77RvAlx6Gm3OfbCJNmZWHtV0iUhx4oUcWlhx
         w4cHNNxHaGtL7xnN3B28vbB3WzSUA4wGv7iSLvha+B23UlBoC9goyGdn6XLDI+FzjbkI
         IwcdmFQbQ0+XRARcI+9zjVobbmSW2BieOHOJLXZvv/L78eZ6BwDXqpTIRGGADNzylHCt
         X65TrxKfROgf9b/wH4xNulmnB9VbGC7l2xEES9yMDq6evFd+gWI0Lc4eQIYuOsz9NXTJ
         qvMntbWi9BfxqcbaUSzekde5KDOyY12uZDPyk43uJvMQNc5+TjzM1ts5FByD0TonfDwJ
         CEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770594941; x=1771199741;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WWrIAGbD+swm1Y8eE8NdqcBisV5nldwTY2Z/dAcM4aY=;
        b=dltG55SoeZTsnCiTs/p/C3uUCig823L44DCDyMah4Dkm4GGe8FNy6TcuPkbtKKQdzm
         3kw8JVYjpZv1rAkq1LB3Kcqonyss3GZt1FnZcn85JnhoXmGy378zleJTJlZOqUATOBFc
         zkx4hFb2PG7s/VRiEEZL5asnJ7YWa1QmPmsM30cRn/YECUivabLufbkKS2z4biynUcQH
         88Q7VqfN+xc1jlGy2DaQP+npIcWtCY5Sr5c3FKgwARaNEgQPfAOpcB6QD7ZJO/azpE8N
         lBsxVHeeboJFoPCmoqnjv2P+OvEtfzXBLq5YsHIySnJ18Kid7FhQAJH3z1RQYho312gi
         IqMw==
X-Forwarded-Encrypted: i=1; AJvYcCU5muVuyYGgYnzdRkK6WWlr8kew5p3LSchlxIsw+saDZrKliOArCk5I9jmAvUVPNWOpOj7VYK5qkvE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFvb60+AApJiUmVYwh41HdYPXY11sOZsW4BLYX9ay/Kjy7QfA/
	0tW903QeUeSBMRy4NiBVph5p6GwG4nm+0CwdU1P2J9me/7YaA+Tg+pQy3SUkLfKQLBBnOZsOtci
	xzMBW31DscXkPCEuwPGWuKh5igCfvdOSLCiGr2YZA8wE8qxs97TCQR6T+0DoWWv8=
X-Gm-Gg: AZuq6aLIgYJBO3IN0cStsj1XmIpcjD3l+sdK+vA1qu4dd91F7El38KREPVypjzk+f01
	HNHsoqdVbYjErkcOvKDp4LQroOP5+Jf5temfAUrYtGtyrn/5qB62/0L0ovq+M/tLNCv7wt0WXMY
	2J3W/ypC08qxfXzH+FnWcKmFvN7SmLMoMLx7hStmBID5wUdesu5cII0744I3iRUjv2EeARYIXWi
	EZJIknMMFBot9OhOICFcA2lb+6ethOzpYQuyehlrRXLHKnaNVNZvGCpmMdvlvWRo+vtq21M6RW/
	igId47Ajqs2UNw/snMWjxh7VHxIFTPB3dPY3I0PgkQv5GOY1yVL31c4DY1C+DvriBCeGfjId3Ib
	XV2DXPmhOCZvvgLfscnUlsBwES3QjfSEoa2vXRMARZfF18hkxz6j1UeYINH0d7+PJ1eJXA15z+B
	/fLizlYZ/Oy8ilUN8JWUX+ugU=
X-Received: by 2002:a05:620a:4728:b0:8b2:ef2d:f74b with SMTP id af79cd13be357-8caef7e772amr1312214185a.29.1770594941045;
        Sun, 08 Feb 2026 15:55:41 -0800 (PST)
X-Received: by 2002:a05:620a:4728:b0:8b2:ef2d:f74b with SMTP id af79cd13be357-8caef7e772amr1312212285a.29.1770594940463;
        Sun, 08 Feb 2026 15:55:40 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44cf6ee4sm2188074e87.4.2026.02.08.15.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 15:55:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 0/5] media: qcom: iris/venus: fix power domain handling
 on SM8250
Date: Mon, 09 Feb 2026 01:55:34 +0200
Message-Id: <20260209-iris-venus-fix-sm8250-v4-0-9662a0471d82@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHciiWkC/4XQQW7DIBAF0KtYrDspBowhq96j6oI4Q4NU2w2DU
 aood+84WbSLWt0gffi8keYqCHNCEvvmKjLWRGmeOJinRgynML0jpCNnoaSystUtpJwIKk4LQUw
 XoNGpTkL02qHy2BvfC/77mZFf7+7rG+dTojLnr/uY2q63/4m1BQkHqztEa5Uzw8tMtDsv4WOYx
 3HHh1jhqn4wJTcxxZiNRh651g3Ob2D6N2a2MM1YL2OwDrs+evsHdnvsION54ZWWxyLEIRDCWkp
 l30x4Kc9joIKZ+7dv6veefooBAAA=
X-Change-ID: 20260131-iris-venus-fix-sm8250-f938e29e7497
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2267;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=QHhMVC8Ba5BOMF+mfpbI2ACbKzjNYug4cucxI+TmuSM=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2anUtVde48/n0W25PT6hJ57pR5mo/s8svDBIdPAxDcnj
 sRb2RzsZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBE2PPY/2fFBU+SuP3+iLpw
 hY3/jH2GJ4UnCJn1vDm/dOmWXdeMLDLLM+ZySW794mEozThVdedsG4eK9Gob97/5L3/NruxU/xe
 4sTyhcvo9pYvFW/X5n/sE7XP91HghuPTZ43l7XjNeVvFcclHr3HcXU6HOwGsuHmWVkxeu4NCVur
 5XvlJnXWJecWlUwul5iux9l06t8YuxbDVI9zAr9951OMRpT1qWQZNLolAxs1PmTV21Cfc3hVxjL
 H98wuRJ+Blv5r3/dmZE75uXvPtzsfeHLjcZ3qfMFQduegc7Lql8UXrs5fmHiq+9Aj/338qKC+kt
 2b9JTzSwPuC+dFy81Xr+3MhDL2S8KhO35/PyCP68tSsOAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: BJ3nHhd0ybQ_SKQlCrNeUhPcOa0uq3DU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA4MDIwNiBTYWx0ZWRfX4o/LXq1W9h5H
 fF+CJ3A7Ag/iE+6d4318hbB/lB5hMCD7KfezrLQU7oyYSp6sahJbzr2dgKLGgTj6U3RkmqBvTzh
 ESOf7BjeZptAe9DgDwXGOnkY6DPbjKGzCvrA36LtSDS4WGxo9QyDr1LrJ2kxcD0ISihqPKvIMkp
 1Hjjk1nUMeVTshTXFkJYQUP2EnZ3uD6F7lOu/wzIJSWasof+f+a0xEuRCX/KJiwC+SQCEVU4vr5
 rfhl36KqoDnHT+MQMPrlFawhcklCRSUYZJzPfE5jRwdszWfYZROmnlRw9iPOKKIMRwGpQU/MT2p
 p4V2B0lNzjEDMGJmv8qk39goC2WWVUnO2kHQ2wNWHRdX07jZHwuInqItnPZdSZoU7o3izI2Eecr
 bAVxKMyErb52etJekbOq1M6ajcsSXQSeL7m7KKskND0Qv4cZEIiVzAU44bGiF78oDJ8YyAgpNE0
 2hZHonb0wUEAPWpgQQQ==
X-Proofpoint-ORIG-GUID: BJ3nHhd0ybQ_SKQlCrNeUhPcOa0uq3DU
X-Authority-Analysis: v=2.4 cv=Or1CCi/t c=1 sm=1 tr=0 ts=6989227d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=cvYA71F9yvrgsMZaK7wA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602080206

As pointed out by Konrad during the review of SM8350 / SC8280XP
patchset, Iris aka Venus description has several flows. It doesn't scale
MMCX, the frequencies in the OPP table are wrong, etc.

Let's correct the Iris/Venus enablement for SM8250 (unfortunately also
stopping it from being overclocked).

The videocc patches (DT, DTS) can be applied during -rc, the rest of the
patches should go for the next -rc1.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v4:
- Dropped MX voting by videocc: it's almost-always-on (Krzysztof)
- Restored minItems for the venus device, preserving the ABI (Krzysztof)
- Link to v3: https://lore.kernel.org/r/20260204-iris-venus-fix-sm8250-v3-0-70fa68e57f96@oss.qualcomm.com

Changes in v3:
- Dropped applied patch
- Fixed typos in the commit messages (Dikshita, Konrad)
- Corrected MX OPP levels (Dikshita)
- Switched Konrad from Suggested-by to Reported-by (Konrad)
- Link to v2: https://lore.kernel.org/r/20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com

Changes in v2:
- Fixed example in the new sm8250-videocc schema
- Link to v1: https://lore.kernel.org/r/20260131-iris-venus-fix-sm8250-v1-0-b635ee66284c@oss.qualcomm.com

---
Dmitry Baryshkov (5):
      media: dt-bindings: qcom,sm8250-venus: sort out power domains
      media: iris: scale MMCX power domain on SM8250
      media: venus: scale MMCX power domain on SM8250
      arm64: dts: qcom: sm8250: sort out Iris power domains
      arm64: dts: qcom: sm8250: correct frequencies in the Iris OPP table

 .../bindings/media/qcom,sm8250-venus.yaml          | 15 ++++++---
 arch/arm64/boot/dts/qcom/sm8250.dtsi               | 36 +++++++++++++---------
 .../media/platform/qcom/iris/iris_platform_gen1.c  |  2 +-
 drivers/media/platform/qcom/iris/iris_probe.c      |  7 +++++
 drivers/media/platform/qcom/venus/core.c           |  7 ++++-
 drivers/media/platform/qcom/venus/core.h           |  1 +
 drivers/media/platform/qcom/venus/pm_helpers.c     |  8 ++++-
 7 files changed, 54 insertions(+), 22 deletions(-)
---
base-commit: 9845cf73f7db6094c0d8419d6adb848028f4a921
change-id: 20260131-iris-venus-fix-sm8250-f938e29e7497

Best regards,
-- 
With best wishes
Dmitry

