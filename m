Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A518530AAA6
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 05:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779773399; cv=none; b=ndknw9syQ06y9BZkhxLtjXYlNPAXZC8H2LeMXKD4yPyR1+WCW8NSl3qZScFfCcxYxmbFqF87u8OQjOlTeklCCgf7S9W2JiK4wddQuoS6HTi7SKPb3Wuz3lpoTcbK0TfknYAChmMDn8Up4wHl/f6bNFYYURQnsXb8/6wrpXxV+i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779773399; c=relaxed/simple;
	bh=RDv9C8vo882b7grqcNEBmysk+rZ5aRPE3/o5s+kdDtU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ww2UOwB2KdcFET5VeKC98w88QbglAQYlpNYGXN3R3h1fUeZ146re3VwUrjnb1bgDtRbM15yVjJQVmlAasqg/BDpur2xcfJY1vFQfhI2wBLxhDXFUErPRIYQJye9s7gAE7iiayhE//aGPQZ3xE/8JmXTP3Fr6zbLTo8HfQ/xS9So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OzVCek8P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gx4JvDuo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OzVCek8P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gx4JvDuo"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q2Y10F3794845
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 05:29:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AMn6ZNqovB2tg0uVljWWvF
	cE+D/UKXK4nk5ckLii3Rs=; b=OzVCek8PAyzJSsFP3OaXRyT0ZKKAwZjVwg/1gs
	bdVE9YcM4F8bXndBaEMJ9iaY8nGTAycODZ4I0t1J6MNozzX6aDpkL5oqX0silZFe
	If2QitzRW9E9UdvO+5O8Rv4AByWKW+6bQXHhvUVZOCumIIxYUXTqryHMtdONe1et
	bg+voXHjamUgSEm8zY/nzLDoa+TLoExD8dx08fneW52YjGcKO5apQ6uz9F3+n0ke
	B4xkfleG/7e1qQyRvAbQlpiRr+/I7C3NaRBD0KNu2ysRepT8z2OXzk/IcQzRgwck
	aHHEkbu+g2G4KG027GHsClaqcm4VgWRq1JeLFwCXei9W1kdg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqx8a7mw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 05:29:56 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2be9e0905a9so63303055ad.3
        for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 22:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779773396; x=1780378196; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AMn6ZNqovB2tg0uVljWWvFcE+D/UKXK4nk5ckLii3Rs=;
        b=gx4JvDuoP5dcPvOpzvZYFmGfdK3b7SgcecZJZ3Zi2eff74DaGU4575CqUHI49UygtW
         20wC4y3SdoWmJoGWM0OfNBRcqkF+fMSawvXWYS5/0nyj6NSrkD70jJHSQqJCvxR5P5jO
         xLDHoDk4zfB5UXnq5xPTC+u8C/xFchnMsGplpCQWC/4WM7tn77Hsk1/R8WA/d3Q2GxM+
         l7sZB3l2RddzGLOieJfacHGgLB195GP4f3rlxe+QJTIj2ZEaI1WhWAmsdQvbIhi9znkP
         TvAfeVrUl1F4gHDoAVyEDtTvQnnBRN5UitTY1Te54SR1pakMHl9Bx5zwl1iroMqcnj3m
         GReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779773396; x=1780378196;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMn6ZNqovB2tg0uVljWWvFcE+D/UKXK4nk5ckLii3Rs=;
        b=c7Fr+dJnHjYlmNcnMASFH0BZ5fePkYqBi+BNN1rKctG0J2zkcZbRU2C7v/iR7BoiqJ
         WEZVFQb6+OzIwe9aTaTIcZky3kW54Ynjvts/eOsnDLGbEPvvd2RnahlSbnP6+OvHrfEw
         73oGoWcGCKu6HapR+r8a0CHbFcHPPx5KflIhUxMo31Lp1d8QO7TuzUpnuWOcJUTu7X4h
         id3wb1hVUe0IgQNORM+SHVbdzd3Q/+UDN3AKoJKJb+v7Ks1N9fCt3WwYD9Ox/A7yCUY4
         j11cEfIcZii3ceCxO6jin0pURKYNrx+5xzr21zKOTQrfJduyXM42P9JdkWm3gSz94oSA
         jsAA==
X-Forwarded-Encrypted: i=1; AFNElJ/Zih/NuEmrO9jSeMIr3W/oaG/aKLpTOv0Rw1eA06GXJ3E5xh2+eee7993b7pHS43r9mjIZspjHuVg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKKODEs7NoHdUp6hASOJh4EbQRW2WKcNN3vKwYurAMrpVGcuGd
	ET2JKEpmI1mrWAXySnEA9buN/gnU7D846HSZvt8DvSe5Z6uG30VR+3hTdVSdkmZEHVxP1e0JxBt
	H/UmpkM4HlYo7P0Gm+3xIXMM6ycuWZuJRPXqZJhBwShMdVuIG834lmal21RqnyxU=
X-Gm-Gg: Acq92OE9cwk4lBoq1cP80K4EsHqbePC28c7tp/zJvfD7fLd7OcQNKqHrRhAl/VCSEsT
	qzlnnoZC7MPH9/fNaBYZO86AwktFJfmvWasUarbxhbFhLwtGZpPUhIY85dRd7BhnmHjsvIEk1X9
	fBbyVjCxcX9olns07iZeSkJmcIb8cHthmOkDOcU/qIJOELgUrondiRF/PgfmHmke2tScgNQz5XS
	25UKNbTJSlhKoNLqD9lGZPIK6ZZKnGDaqT58LaWvXasxlAHF7GbSE60MN946HwF7QfAb37WnUWp
	YEegTe6Vpw8zehe/nL8JUn9lxHmqfD6Nh15rMiLTZwagruRViIxsQ5w3tOkfFPnYDEFzW0TcxRw
	RzALZVWBBCYj6wZG08EoOOtgBRMX9t2UX/fCCsYKN2qWa3g==
X-Received: by 2002:a17:903:2c07:b0:2ba:bfb5:9cc with SMTP id d9443c01a7336-2beb0631a41mr173092635ad.26.1779773395578;
        Mon, 25 May 2026 22:29:55 -0700 (PDT)
X-Received: by 2002:a17:903:2c07:b0:2ba:bfb5:9cc with SMTP id d9443c01a7336-2beb0631a41mr173092265ad.26.1779773395067;
        Mon, 25 May 2026 22:29:55 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56b7920sm114088995ad.21.2026.05.25.22.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 22:29:54 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 0/4] clk: qcom: Add EVA clock controller support for Glymur
 SoC
Date: Tue, 26 May 2026 10:59:43 +0530
Message-Id: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMcvFWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUyNT3dSyxOTk+PScytzSIl3TJIMkEwvLxDQDYwsloJaCotS0zAqwcdG
 xtbUApM5BXV4AAAA=
X-Change-ID: 20260525-evacc_glymur-5b0b489af038
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=HITz0Itv c=1 sm=1 tr=0 ts=6a152fd4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ECThnQJB1zpBJANexocA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: o1PW89-KuMHXQZDPYzBzulLzgWHe5udM
X-Proofpoint-ORIG-GUID: o1PW89-KuMHXQZDPYzBzulLzgWHe5udM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA0NSBTYWx0ZWRfX6RKYY+Yl0mTw
 MIw89Z8GHHrkgrrq954Ibui2wkQhHhSukCth1elIqagpSUV82p9t3i4Bg8j/NwgDUX/k64ehe03
 VqY7NXbjYuK4H6H+u4pQ5rUhWDla1w3WYxQPbADFNaeQwNdJ//b9JxBC0PfGNI36Wn7ZkGXRBFQ
 H/K8TXbjmj3kRgoGhGiWnFXjR8+nmILem0Zr46jpgqoEdcWfRQQ7mBYFDFf1ogPYofdBuTJZDFn
 Xnt2l2JIQmj6+TJTI1M7CuFhDhxmebAaXcJ/MEK9vLiDqHRp5TnWwnnlFU4d9iWGOL/n8E/JrWO
 1yv9UDXVWdLLkmx57Ppbf+MdX6r4LZWhpKZlG4JXD3/0YOJR7iNIJYgBNE2QnFVZ4keFcl1Q6yv
 fOqu00RZ+4NBqFW3Lyly5qXYQI8ZSBhOh5N+CJ7v2zF2TvYZGrUSyajV+hKK1vinX0rYMf2JF1V
 9QRZZeeX/Nl/FwPGDbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260045

This series adds support for the Enhanced Video Analytics (EVA) clock
controller on the Qualcomm Glymur SoC.

The EVA subsystem handles vision processing workloads and requires its
own clock controller (EVACC) to manage the PLL, RCGs, branch clocks,
GDSCs and resets.

The series consists of:
- Move gcc_eva_ahb_clk and gcc_eva_xo_clk to the GCC critical clocks
  list since they are owned by the EVA clock controller and must remain
  enabled during boot.
- Add DT bindings for the EVA clock controller.
- Add the EVA clock controller driver.
- Add the EVA clock controller device node to the Glymur DTS.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (4):
      clk: qcom: gcc-glymur: Move EVA clocks to critical clock list
      dt-bindings: clock: qcom: Add EVA clock and reset controller for Glymur SoC
      clk: qcom: Add EVA clock controller driver for Glymur SoC
      arm64: dts: qcom: glymur: Add EVA clock controller node

 .../bindings/clock/qcom,glymur-evacc.yaml          |  76 ++++
 arch/arm64/boot/dts/qcom/glymur.dtsi               |  19 +
 drivers/clk/qcom/Kconfig                           |  11 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/evacc-glymur.c                    | 453 +++++++++++++++++++++
 drivers/clk/qcom/gcc-glymur.c                      |  32 +-
 include/dt-bindings/clock/qcom,glymur-evacc.h      |  38 ++
 7 files changed, 600 insertions(+), 30 deletions(-)
---
base-commit: d387b06f7c15b4639244ad66b4b0900c6a02b430
change-id: 20260525-evacc_glymur-5b0b489af038

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

