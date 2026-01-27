Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B8D3624B8
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 19:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769542007; cv=none; b=YePwF0wxYQTq2yZaWksoVBD/7E2LLFJn24KUr0V7Js3LcP0ovCoSIm+A/ADWQU7ixOHj3WWzer7sp1UfoLkkMANviBkjF28jN4IrKGp0nOZVWxVNE6j3UkxiwOKZ3AEGRNtJfUVm12sKvSYyYKMnQi4gABKRgv7bTHbQrxk3L3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769542007; c=relaxed/simple;
	bh=+dxg2AYPWOBezbo/AusD04dPbtAzqmuYg8xU4IUzxDQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZY/Qk+NGGlsY7QeOzxbdTR9rHbEOB2xqB/U/YZsmQwzIjZhP4aNOpXCMygpcBn8Qyv1rTP/IgADkkdSoYxSooS1FeVFOIA5vOMHpOGddaqouP7p2MalbMm77W1ZZdw7u0sdXYGwUpNTnbbieGeK59XSIGQv1ff/tAGwebm/6VO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WyhRwKlB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AIHJncje; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WyhRwKlB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AIHJncje"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60REZeEH1065897
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 19:26:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=orv3m8vsoj1ff5G3TkE7oP
	TvE8SD/wrAmlZy8rbZhHc=; b=WyhRwKlBrhVPfGxQGxXP6BPM6hvNZ3bx7rh+Fh
	plcnHu5kPWu9XdXjDWZXNt4ijXUenoaJkzTD4fbjvS8J5EtiRO5UUy1kGPfGtNC0
	ltDju2N/4NpWdReO1u33GlWTrmn7TzU56LXuHVsbKXTzmAU2x7mIl7+kgr0ppmUB
	Noq0AnRVRP5cHhZYalRpOY0m3W6SdqvZ3FLFvV0/CwvLBrWpxapSvAVs0LRDDFq6
	llpzCnKXSSe7wBcycfFKlLt5QqGyj4ssoCvFROa2ZhJdgS62Co7JkF1293fgNKa5
	kymRANPJJ6/2O3eINOeuG243ScU9koIxJyHW10nPGgcvTM7w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxy8x12qd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 19:26:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0d058fc56so43656745ad.3
        for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 11:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769542004; x=1770146804; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=orv3m8vsoj1ff5G3TkE7oPTvE8SD/wrAmlZy8rbZhHc=;
        b=AIHJncjeVpxqukxGHuPXii7RcuQ3Mg/U27Hiy+78kHGiWHCecZjsvYpgkIIMxUYPGH
         rbhIUtAZeTt2Scz3L8tQPgftTcH1fPPpkHlmCohsdlQUjFwjSy3bHgGOeMQ3GbQykP2r
         0QMtUsh7FV28g23XxR+LpPfRg27ZovjNM+dW316hhQqtuNHBfHMSa/STsKZBY3bwmLFb
         GVx2hY2h6LVGcSYEquSiZNBbm2Yvf4EYBtWzK/Ps1m+zInklCoNCT4KDOb665yo96Cqd
         BCxJsRJUgopeD1rcVji8ow2cMu9jE/2mj9Ag3vV7xMdVYFys+PLgtOWylC5Fz6J/gY0U
         4EXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769542004; x=1770146804;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=orv3m8vsoj1ff5G3TkE7oPTvE8SD/wrAmlZy8rbZhHc=;
        b=kETgdwJJzCBXp0qTfhK7kWFX6CJAFPtoctdeuNHHw4DCOHlaw+rkL7U2f30Ud4gFCB
         UkfjEA7W9RSc/Gi9aMgNRXjzA2nKRkFsVwxC/NdB4p8DkfLQhA9n3AtdlyaF3O4BJtn/
         ZNilYAVTb97t+NSFaN1BydRM9HMIvKGu9o2uMybA9aWTfdclxp//g2Zu8w8qaFi/ODHY
         y08ewH1zVjSEXSwv9bb++m1j++MNghRbvD14RDuZzdwo9vDcSy9EEt66rPkTZ+c0oDPZ
         OWmpJsg47R2eM5QYgOGlZzpgjMQhbT+J42ZMiEOZCmgZQsAyJkDzlTBdgjmxX9chtJ06
         0O6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXTGrXEVTrNJYI6iA44byd1qSr2T282Jk/uzPtHQFPXRYg+gl6olztmJp2rrE3AN5jyDIUP4HtrfBs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg0Brsbmzdyyhf8YurqvMoVNyWDGWXvfan1gM99bJZLNaDfrv0
	w5CpzUBhGRrJ1ELpnf8ntn1C3T5cb3tKm4oFfeOMKzhA/eYnDneT+c3h2NfCXh1uhq7WlwX3Egt
	FsfhvL8snXuqciN00mh6X5cmFdWqv4DeD6s2sAZ+w2OkappbvdrfD5tL1cwQ5n/0=
X-Gm-Gg: AZuq6aIWcN89rAA+gviMMsXysNVI96dFn8htFuBODG0dbI1yqnoBsslXM+065X7t3+u
	2ykhPidYOg3cLHolz58y+zExRfnROzCG4qZbZ9zrr6I1W5MNpw7VyDYMkR7sjvzgYNWvEVAGTaZ
	nuJoxH58Pe1yjJtkM8jDAjwcwDd/oSu7cDJYDuvE7KnyZyH5XWhISfjhb82TbSWGfEnfjN8yIzB
	0CZH+OZ2mJSsnNAEVJPVa6/k/+RibuPvED0mIoUTaOfVbkdDaWv4lXtFEEpOPdyQXijwk1mZsMh
	MTaPq+DBiSNvDf79VxA8go8vtclyL60OH184BoqcXfcU2wuBc1AkB6Hj4LL5v8OGH3IMjuCbi2c
	1IuFh+JmV5Qx1xBBQMos3GCr/Zat8HH9qu7jpjoSL
X-Received: by 2002:a17:902:d58d:b0:2a0:b7d3:eec5 with SMTP id d9443c01a7336-2a870de2f61mr27623275ad.33.1769542004108;
        Tue, 27 Jan 2026 11:26:44 -0800 (PST)
X-Received: by 2002:a17:902:d58d:b0:2a0:b7d3:eec5 with SMTP id d9443c01a7336-2a870de2f61mr27623025ad.33.1769542003644;
        Tue, 27 Jan 2026 11:26:43 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b414fc4sm1322225ad.32.2026.01.27.11.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 11:26:43 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH 0/8] Add support for videocc and camcc on X1P42100 platform
Date: Wed, 28 Jan 2026 00:56:31 +0530
Message-Id: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGcReWkC/x2MywqAIBAAf0X2nLCJFPUr0cHWrfbQAyULwn9Pu
 gzMYeaFyEE4Qq9eCJwkyrEXqSsFtLp9YS2+OBg0Ddam0ecVbqeTeD6INLmtEJFb7GxrJ56hlGf
 gWZ7/Oow5f8qzzidlAAAA
X-Change-ID: 20260126-purwa-videocc-camcc-00e709474bef
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: GamsZglssvtskPn1640MEF3FbzJ7trES
X-Authority-Analysis: v=2.4 cv=OcWVzxTY c=1 sm=1 tr=0 ts=69791174 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=bl4M-8LdCsxBmHb54JgA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: GamsZglssvtskPn1640MEF3FbzJ7trES
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE1OCBTYWx0ZWRfXxPccDCpOfYX1
 aTaHZuJG/49uEcYnvZcQPbPnwTFCbBckrJn++cJ/xSni7Em1Zgw33Fbc7MrAQDsw2nSLNwTxEE0
 JQvs4vBDDKCfb3qXhCJYN75u4w4urXxcOfym6pHeyZfqniItfoPCBwsNIx64Jkm4qHXAJRTOQXR
 +kmAwN68GfsyxrzA8h4hH3jIeZeAdqiFQNCvSxRN/Ak5xq9dcqfM90A7sluFSJRsAy8cb/RnxwA
 VCrloKSJrxP9lZrNYil3K8kHioWx7uuPRxu1bNhEdNCvnBkKSCvMfKI1xr3nnWPQJ6HJSaftJjX
 wldAqpqO6Li/lvsBS+h3cdYUyOzEDGmyF5wwmB4/73h0xhvvnyw+02NmiGE15706BSlKHzenhnw
 lh8YzXkB1Zu8HUWuiJ2MCDwf8Ls3j1POCXnaFL10dotY3femnXQUE7X/5TH6pt9i2fktqA0vnRG
 z8N01qvEaU2U2R5MfHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_04,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270158

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
Bryan O'Donoghue (1):
      arm64: dts: qcom: x1e80100: Add CAMCC block definition

Jagadeesh Kona (7):
      dt-bindings: clock: qcom: Add X1P42100 video clock controller
      dt-bindings: clock: qcom: Add X1P42100 camera clock controller
      clk: qcom: videocc-x1p42100: Add support for video clock controller
      clk: qcom: camcc-x1e80100: Add support for camera QDSS debug clocks
      clk: qcom: camcc-x1p42100: Add support for camera clock controller
      arm64: dts: qcom: Update compatible for videocc and camcc nodes on purwa
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
 include/dt-bindings/clock/qcom,x1e80100-camcc.h    |    3 +
 include/dt-bindings/clock/qcom,x1p42100-videocc.h  |   21 +
 12 files changed, 2950 insertions(+)
---
base-commit: ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
change-id: 20260126-purwa-videocc-camcc-00e709474bef

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

