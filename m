Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E8C1E22E9
	for <linux-clk@vger.kernel.org>; Sat, 24 Jan 2026 17:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769276133; cv=none; b=jIYndtB7c8FTj/QDkz8XenHmlAz05DSn8uZpLa/NMPBP3Gu9OM8GFlUuv2snl4Hpu8S3oJ8HA0HEGZ94IV9FmIRuS44kOlQDerDwvqN/ndqNZ9LPAp7630rK3JUTHvRDY6tghLUOfh9Lc3HAn9vMDEu8CXzAbyiewCE1jLwN858=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769276133; c=relaxed/simple;
	bh=Fu1xoi9CBY9eiBtnRip104Q3DZqU8QVcRYaJcdPLYj0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eGjQTxm7C6yxCDPB3GlyvVI54XYwCirfty/EQUqbDuRwGcEjqpUY4fv+X1QSLcrzpWcFlZIRvvCd9xjotVyywRQ1eismg0SWhOasqRChm0S1dWwdzd2mh7Ki/zPdgEL+7sISHdvi6TZxwzJUW+0jYfzKybf3HVnUVz74e5jdBIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l6uNS83t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YtGYccin; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l6uNS83t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YtGYccin"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60ODq0AZ1252253
	for <linux-clk@vger.kernel.org>; Sat, 24 Jan 2026 17:35:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=16G89u6+BhHcoNsBKlpFOb
	IQxZvkHd3dDl4LIKtGP1A=; b=l6uNS83tdTvdTXEv2QkEq0ryQLoLpbw0debpAP
	KaGewFsLfbY4SFznpANcmDVEkIn+sW0m0kyc4IJJKO4BnPDhYTscCGPSjF4wd63o
	o5mlZwyLtGwCG/H1vJG4aNg10crkKp8KB/3kMPb1vbDA1rpG2AEL5Me5aHyALfyx
	JcjINehOFrYUiKBa1zAOrJjBkcBlQ9qR9lTPCUv3Hd0sD64m9K2VqjMSGt/Ie7JP
	9kDn9H6UvD1fewNRRH9NSBSmMq7mcN43EtQp/SNU+fz90jU9twcch78xDvl0mbKy
	nvXRXNdUoZJJNXrqjLeQzrb7RXekZgkJYqEuFKActMwygCkQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9f0x1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 24 Jan 2026 17:35:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29f26fc6476so47535405ad.1
        for <linux-clk@vger.kernel.org>; Sat, 24 Jan 2026 09:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769276130; x=1769880930; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=16G89u6+BhHcoNsBKlpFObIQxZvkHd3dDl4LIKtGP1A=;
        b=YtGYccinozWv8T1/IqoPUpZJ296Hgv1I1/DwaBqX8L/r+ulvPQQVkOjtWI/zEXZDyE
         HLIz0D9cmqYlZwaJGVJ+VPq+OJOc1KJ9+7ejNOfLNwdlU+2SdHBNQRe79X6U2xdQIQtD
         UFmS4nBzfBRtUJUSpRgXuA+fyqczCLpDaemWuyPpyyr0lq2PjG6qhW4rfzInCn3Vp7mP
         XfM4howcQl1dpNj7pIt4gazL/Gd/46P95zxIz/gOICl+7gwJRF03feaxZIKXvTZp11g9
         hMPtgjRX6AjQoasnyzVLD0i3AWRBDh9Q7dR8wQdm/CbA6xZ2IA5Y0A+gxsqY4d6Y+s2S
         GE2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769276130; x=1769880930;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=16G89u6+BhHcoNsBKlpFObIQxZvkHd3dDl4LIKtGP1A=;
        b=G3/E490WvI+V6MErR/TxunX6xRpC7wngwVi53HUoxPwpBoz8M7OrLpfOrU1QpXH0CH
         vBAz/78lE0VGVPrmNOXmldNPw+Pbev8gmBz5r2NgDspjR42PoUUfQVEnwDZd70PQafqt
         BqMVOfTTapHB/L2siqtysd92g3UoqJznqWZCjX1anJdT0CfS8y5v7zpXVM+sCQ13FkzF
         pFZihsaeGuKDOoh+LsxMBT8wvK5d3xibnKw81pDKrkTA5tLxrkpJo/SvigMwXtIa2GBd
         Ojy9AHc8huiaKhBtT16VIdIC7h5/ejtzrxceRLcpPINpMO4QygFzfUX86wJSI1zXqHJ7
         JV6A==
X-Forwarded-Encrypted: i=1; AJvYcCU43iquzunquAwPsIUnnzu5kyWRTNyC8hVssRGl95dy7gtYqr0PU6C4d9sXX7UxI3I4WHYjdE5wirM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYRkUmXUzHq5ERf4jQ+gXKlsAxUf1TjSgH+IW1sJrDOPQV9g2G
	SCReDYHk9x+ajDXohHl/NZJPH1UPOQgerHa6WPZcAsVlhlxlNluFshRhY4TlCS5L2AyxEm44X3v
	GTfpMFmxKOv8Adm6a9brxvzQKtw9gMx8I0PH0cI0r8KWcMk2JM5+zkE7tF51OwwikN6vycDQ=
X-Gm-Gg: AZuq6aJ9HtXWDfsmXwm+qr13++LcB9sOH7hvHOD/MT0ldGFMjymO+D2D87DbS/X8jSo
	UqVoRUH6jRkJn+xVRvoImylThSSJVBh/CA6OFMz4eTMZneB9q1WzjqzDU7apB4grMpHZpNSweKg
	UkT1fj3YggtaqcB6T/Bzur0SX0ziP9WULTp1/Em/SrWEvMhS/DPKAe39SRKpgJEnDWXGFWMgo5D
	KI+iTWlLjnYNZBRsRv8wFxKeeFmURScPCaOAz/8egQHZvRrmYcedrF1z1SpbXkh20ow15FtAboD
	ajezI4y0+OwRkar8k40QrIhjdFDhfE7GtLi8Z+ro5tyLcO+AcuXBI61iOByC2bra5Yjyb2JEpmX
	aIwSfemgJMOfQ9gE8ABLyyBDfRgQIBjsHuw==
X-Received: by 2002:a17:902:ce09:b0:2a0:d629:9035 with SMTP id d9443c01a7336-2a7fe43f2damr68765515ad.3.1769276128737;
        Sat, 24 Jan 2026 09:35:28 -0800 (PST)
X-Received: by 2002:a17:902:ce09:b0:2a0:d629:9035 with SMTP id d9443c01a7336-2a7fe43f2damr68764875ad.3.1769276126739;
        Sat, 24 Jan 2026 09:35:26 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802daa79dsm49036765ad.3.2026.01.24.09.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 09:35:26 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 0/2] Add the support for Glymur Video clock controller
Date: Sat, 24 Jan 2026 23:05:01 +0530
Message-Id: <20260124-glymur_videocc-v1-0-668f8b9c63be@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMUCdWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyNj3fScytzSoviyzJTU/ORkXcMkUxMLs7QkQzNzMyWgpoKi1LTMCrC
 B0bG1tQBbZM0tYAAAAA==
X-Change-ID: 20260123-glymur_videocc-1b5486fb1676
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=YLGSCBGx c=1 sm=1 tr=0 ts=697502e3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=yGsrVBdmsvV_QCB3mFIA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: fQMIiEWJC3ZBrHOHwTHF-lcRQ_MnihyO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI0MDE0MSBTYWx0ZWRfX86Y4R0AaKnLG
 b3PAkTsZCb8L7MGG5Z0GdBkpyTxTxEq3wFjHChDP3V7m7THPq/Z9qKRqiip0zBa2d2GLeC9hbi7
 ByGQWGUb/fZtSuGvl0/rr/hu/mg0V2l8pI2sZC6vOzQR0xwoSw9BqkH1prwsc6cQmC7akpFCNuu
 0TauY5OL7HlvX7mVq1tmrG9P/Dc23Pr7N+bmAzPPP0uGmSgdTXfbtjANkE3iTD4GA1zw++elwAK
 I8tU2uTQRP4f89AQgvW8sy3bZsYE3Vniv9sUTGzfgKS6vWfNox5N+9nW0xzBSUJx3tZj2a8HEra
 25SIM0G74GSlcjaX4aLDabTxB9lIRX4CU+po4TbNMF6DNDL44StxrbC+UJ4Gsnd0u+KXTvs+Ww/
 e5oJXquPlu7fHzT2Kb21iCo5Qn7w3FmD/RnLKnqh8/X868ze6CypgSC9ZkeroqnkKCYWWUETbdH
 kxpauN7HoZOM2GBJmzQ==
X-Proofpoint-ORIG-GUID: fQMIiEWJC3ZBrHOHwTHF-lcRQ_MnihyO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-24_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601240141

Support the Video clock controller for Glymur Qualcomm SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (2):
      dt-bindings: clock: qcom: Add video clock controller on Glymur SoC
      clk: qcom: videocc-glymur: Add video clock controller driver for Glymur

 .../bindings/clock/qcom,sm8450-videocc.yaml        |   3 +
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/gcc-glymur.c                      |   1 +
 drivers/clk/qcom/videocc-glymur.c                  | 526 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,glymur-gcc.h        |   1 +
 include/dt-bindings/clock/qcom,glymur-videocc.h    |  45 ++
 7 files changed, 586 insertions(+)
---
base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
change-id: 20260123-glymur_videocc-1b5486fb1676

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

