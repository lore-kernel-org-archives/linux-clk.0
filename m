Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A4C22332E
	for <linux-clk@vger.kernel.org>; Wed,  4 Mar 2026 17:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772646067; cv=none; b=s+XBi/LaKsA9njKGa5iwoBXqZkxVyFJzIXFAlSD+wWckV8O57yHOD0c0Us07SWMGjwvph8iulCJ7fAVdVfcHB/7Ekl/sneqXsdR09lhClrSBLTfHYYES/DqHDuCrnmNt0RBYUjg+kXu9AN/cyiTG8LmuTNlXtNu2pIhu6Gio44Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772646067; c=relaxed/simple;
	bh=fmMpSxSANH/XxWlmwdgOpxQtopGuJqUbV8vxTEABn8s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Px/CWWGCW93+mWDBVCnwCKrA79DJ5IhpL2l9xvdtkPlqJOz/CQREfZ17b+Iq/16qfEIBhW7OcS2d0xZI1klKt4Q6iGSIb9azr3FOYy+amtDeJNuOjJoaEx84SFoMZV5uAPl8uiRfkeZm98wX0G9lgk1j3WgcpKKf87SpebFC+SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eiCERews; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wh9TfSpX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eiCERews";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wh9TfSpX"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624BvnZ8152717
	for <linux-clk@vger.kernel.org>; Wed, 4 Mar 2026 17:41:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PcvxfbbczHcX6WWI4xy9kW
	Z0bQCBbDw9HmDzvdNQ1eg=; b=eiCERews2sRLaTr2oNYh/AufwNJHJJFyn4tCbC
	DxTUNQK44ef/rB6fuYcb8BXI7vTgLvuYA6mkEVgqLIDfD7sZ7T/l9VlVUB7bkTUx
	fZIiXztWtA1g8FUMD9v8f3GguukttCBms02RwP3MmX/0HQu7UxP1kr+7ZGENOJSW
	zW8POaJ8r1IuDM+jktYRXsdcpFmtSUjfi33L7Emu8BuQQw9OYM6I9/ash6hZv8ox
	cBI/ndx4IgpJWjaXtzR1WPnxAQJ8kGq+4E4AGhx6nwNZLiUf9WXIc/TDr1+Gb41E
	bPI4d+pP6zUrOK9JBe9uceoACYFP0k9SM/qBGvA5Ob+lNJXw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp3tvmm4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 04 Mar 2026 17:41:05 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-354c44bf176so6569775a91.0
        for <linux-clk@vger.kernel.org>; Wed, 04 Mar 2026 09:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772646064; x=1773250864; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PcvxfbbczHcX6WWI4xy9kWZ0bQCBbDw9HmDzvdNQ1eg=;
        b=Wh9TfSpXmRXUXYZ/S1XTVfsnlGySbkBuHAPwmlgVNNjAxdzT7tVZoSr1vzxNynapHQ
         huZRO9Ksk3ZHbnnFCcVUwlrTHBO90Hzu7hJwa8UBOiMjj4odZkny6z05qGXenNulOABU
         ASUtcNwsKNpjTSlhoYbzq5jodLNSpp+xwh8wBPPsDDvTIaPB+NfaiwJxFflFWKEYA3mK
         eN/h2QtJF1zyWOs7LiGEz5N7aEMjtINLiJ2OTXuUOEjomlg2Y2r9/8+Vw5+k0Tx4GNzq
         bCAfGSaWt+apigmQ+mW/BDAXUSOb8dv5UpIl4Nkl/+dbD6yGQBBlB/YhaRJ4VcAWg17v
         XuqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772646064; x=1773250864;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PcvxfbbczHcX6WWI4xy9kWZ0bQCBbDw9HmDzvdNQ1eg=;
        b=DpaDvELsNYWWdRnPBGEBo3QIpWaqBvpnA+Ac7ElriZ7EaZMHhiG70174wj/BD7X1Gw
         +8HbMlsH0HMrCXfg+Klb4NNDbfvOCC/GGF+yvB2/cxrs8undJn3fpx/VoPNpIOsUMFEx
         rfWoE0THuDeRVspXta0wLtzIbcSGLZYtT3hKHQza7bVsEXWAdmil49oMEhdfv0Hej5iG
         xb469rKbW4Uus/SYt+U2MUuMmLhdaW4QhKc5trC6u8zNxcMVyuvd31tSMKGaoEL+uOCX
         JD0PYfN5/8UGuzpnGt0GK+59XCO5Yd8v59Wa4R12Ilcn6ctDAVlkP7EWtKeqNmNKaawS
         /LgQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3LxxbCNtaFm3beBBhuo3/f+wc/XNWzLOR+OQ84IEvC2cIHuPiyvDywzsKv+T6sOpwlyugQUWma8o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8hio/tx4LvY3EWNXNoyQf6dHYGZBTUAmhVl32Jz4sATU3EhiQ
	AeXiuHNDt4RmFQ1bkuiVTSV8ei0ZycPLwnKJt5Am5TN5nZz75lGtZmkTplDekTjRihcI8ApXwpC
	LTu1hf/qv9vZoXIlB5YK/9h3K+TVk5GS4cqTBG0xGleHtDqq5yP1/Vf5tMjevRtI=
X-Gm-Gg: ATEYQzymvN1kDYoIo4A7KWd36myY1OTgkKgUROHrj5+KRCGsbAeGw/k1k+3g1OKDk1P
	DyUl/t8ziVu0KhhYI3jIYh73LzXPLcyrttgc0YqWBHhO9Ir9wvGW3Kj/u87gyBHKZe49P8hCYfQ
	f3KVvI4FjphHaf42gEpmwS/Mgf49Beh6nMlI0rOm1CZd0rxLObkgCG4i3JaIn2Or+xllnn3eq9y
	a3O9jbHLPWQ5dx+38cRWj4B6DYaUNJLbTmgPtFpH0MzlMqGtXROAixw49cxCgYE+EdgEnY6PamK
	I+rZLwqfzq8/VW9Ts7wRvG42DzWeZkfz869DuZu7t4p4zqgucwvCQ35Awj2lcyc+C/QOuuQqIE6
	yn/XayxBxLNBiVI0xWsiZgaOxX2uqAGjmWuVb1Fij81GkuIWRl5hW
X-Received: by 2002:a05:6a21:b8c:b0:394:6159:175b with SMTP id adf61e73a8af0-3982e28bdf2mr2644844637.71.1772646064460;
        Wed, 04 Mar 2026 09:41:04 -0800 (PST)
X-Received: by 2002:a05:6a21:b8c:b0:394:6159:175b with SMTP id adf61e73a8af0-3982e28bdf2mr2644808637.71.1772646064001;
        Wed, 04 Mar 2026 09:41:04 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa5ea0dcsm16608794a12.3.2026.03.04.09.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 09:41:03 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH v2 0/7] Add support for videocc and camcc on X1P42100
 platform
Date: Wed, 04 Mar 2026 23:10:50 +0530
Message-Id: <20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKJuqGkC/22Nyw7CIBREf6W5a2ko9qGu/A/TBYWLvYmUChY1D
 f8uNnHnZpIzyZxZIaAnDHAqVvAYKZCbMohdAWqU0xUZ6cwguGh5JVo2L/4pWSSNTimmpM3JOXb
 8WHf1gAbycvZo6LVZL33mkcLD+fd2Eqtv+/Md/vpixTgbxF5j02nTDPLsQijvi7wpZ22ZA/qU0
 gcrIKKHvQAAAA==
X-Change-ID: 20260126-purwa-videocc-camcc-00e709474bef
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE0NCBTYWx0ZWRfX8SiwfkHy1JUM
 GeH+Yl9l/WooaLryVqb4nIqwsAbWkYlyle97X/kvnpTMf6i2+gYIAO5/hA+fplFOYbSxItx23+L
 n1x5Mukvk71MH4A4t/Xoycv2eRw/YCpwTV74LNHvUjDV0CwgfHwFleUqOGX2KxTYFbkZ+QqLOx+
 FWycd+Ep+OjRHPfLAkjMtR8yL1CNKM5bhJza9URn5ykx9HvR478o0cND6gmSlLL1G0KkPPNj2eA
 zZ2fgeFb/GGeTR7kjaKGztP0stuIROURZc4TYlGMinGkz2DOGQumzE5WVVNT8OAOHoDY2F8MxGl
 r1AKlOMFlhh/1o4Xu4jW8TT/Mja/U6ZiHzvNZfNRXjFtl1IN9SJfLRlW7kix/2Y/3Vk8whL2Nzx
 Oiw3SyW6utwvBIogiC9f7X88/YInDhnOkkZ9LiCS6H3kanE7zzDnR3OJnEF3sGhGq0/8nLScXsW
 wRZYvnm33wb2mw4w5cQ==
X-Authority-Analysis: v=2.4 cv=VYv6/Vp9 c=1 sm=1 tr=0 ts=69a86eb1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=bl4M-8LdCsxBmHb54JgA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: vsdRf_lG3ofwWywgBO2kUrtAphDTn8-j
X-Proofpoint-ORIG-GUID: vsdRf_lG3ofwWywgBO2kUrtAphDTn8-j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040144

Add support for video and camera clock controllers on
X1P42100 platform.

The purwa(X1P42100) platform includes the hamoa dtsi file
and camcc node is already posted upstream on hamoa(X1E80100)
platform in Bryan's series[1]. Hence included the camcc node
patch[PATCH 06/15] from Bryan's series[1] and extended it for
purwa(X1P42100).

[1]: https://lore.kernel.org/all/20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-6-0bc5da82f526@linaro.org/

The camcc node was added in x1e80100.dtsi in above Bryan's series
but moved it to hamoa.dtsi in this series to align as per the latest
changes.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Changes in v2:
- Dropped new header file for X1P42100 videocc and included
  additional clocks and resets in SM8650 videocc header file
- Updated commit text for videocc and camcc driver patches
- Squashed Purwa videocc & camcc DT compatible update into previous
  camcc node patch based on review comments
- Added R-By tags received on v1
- Added Fixes tags based on review comments
- Link to v1: https://lore.kernel.org/r/20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com

---
Bryan O'Donoghue (1):
      arm64: dts: qcom: x1e80100: Add CAMCC block definition

Jagadeesh Kona (6):
      dt-bindings: clock: qcom: Add X1P42100 video clock controller
      dt-bindings: clock: qcom: Add X1P42100 camera clock controller
      clk: qcom: videocc-x1p42100: Add support for video clock controller
      clk: qcom: camcc-x1e80100: Add support for camera QDSS debug clocks
      clk: qcom: camcc-x1p42100: Add support for camera clock controller
      arm64: defconfig: Enable VIDEOCC and CAMCC drivers on Qualcomm X1P42100

 .../bindings/clock/qcom,sm8450-videocc.yaml        |    2 +
 .../bindings/clock/qcom,x1e80100-camcc.yaml        |    1 +
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |   17 +
 arch/arm64/boot/dts/qcom/purwa.dtsi                |   10 +
 arch/arm64/configs/defconfig                       |    2 +
 drivers/clk/qcom/Kconfig                           |   20 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/camcc-x1e80100.c                  |   64 +
 drivers/clk/qcom/camcc-x1p42100.c                  | 2223 ++++++++++++++++++++
 drivers/clk/qcom/videocc-x1p42100.c                |  585 ++++++
 include/dt-bindings/clock/qcom,sm8650-videocc.h    |    6 +
 include/dt-bindings/clock/qcom,x1e80100-camcc.h    |    3 +
 12 files changed, 2935 insertions(+)
---
base-commit: ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
change-id: 20260126-purwa-videocc-camcc-00e709474bef

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

