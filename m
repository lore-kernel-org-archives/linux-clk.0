Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF47E2D0C7E
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 13:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778679655; cv=none; b=IGqVIuRS65QpC/lfPQlQWxndLopc2HUEUr+6VHs4JWDXcctlWAP6vlx0goJu7oZ8adnmQqzo8aWZwiKmtPko9oPSeKVKjsTo/y1nKrl4QwaSVQKMfQWIxW43UlEeG1S0vnwLiuZhcsTiNx+d3K/q5HX+JA1pl4J3Dc6ah8GszU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778679655; c=relaxed/simple;
	bh=oTkQmi/Uxg/MsPd7MCP2dQ4kUv6dyf90u6MlcCrioms=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IguwzWQPe+Z8/QOKZjxrZB0poPXczL8TNhpRWa8zHljHrRE2ZWy56gwxg6DWxkaBzRjOVRtIJGlz5095nVOYoks5XKmUxV4QA3xXTZHaFTJjN5r3Qp0eJZbXo63mG25FaNRX8to9t4SRVM482mZa0LVJ022R0jwQsi2gexoE44Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AnnNTWRH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PQiff2qS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AnnNTWRH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PQiff2qS"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8n8qJ2887813
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 13:40:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZAgafHElfkN4za1YfuXxY3
	7xpnsh7yTHu2eNk+K1HqI=; b=AnnNTWRH3xJcWjMK89gbg1/AXsWZvT8f0RekuU
	R9EyhF6PyI/IMuyoEOCvKZ+jxU68ya1Hxr6AntL49XwZum16IeBr7A16DGtYTtQy
	OBJ/bv5xIggzcWcz6u69zEXrWPAzT9jqO33GmDEDoXEItW1Bx+y7zhC/+TIwFNzX
	v1FyOSX1dLwsOzK2gIz1lOfLjqwmwW2fqghiaPwO4Rrtnpy6ZrvTIUj8eztJCXNq
	31vNagttutv3/Cmc+nEaS2DlN5FCyOQ7A+62IjY4HfocUjpC+JB7f4aRSdnWMJq0
	BiCsWbvvVICxfvnfhGX/zWNgjJvomGyXb7OAZAfA+x3saiFQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p4gh2eg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 13:40:53 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36641fe4aedso10488543a91.1
        for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 06:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778679653; x=1779284453; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZAgafHElfkN4za1YfuXxY37xpnsh7yTHu2eNk+K1HqI=;
        b=PQiff2qSpWoY1AzjVGaf/TFAuUvhTBBONXDVxlrsTtUsZh35TVg/H6n9VuGeHu9kHU
         iTViYsdZj+ajJSve2ebh8eO68EO8XFmy8hm8C/7SllIjBPSoHTF4vusDHJ4CSCXrm3np
         uySdMEcl+4aMhX9j667sr6MJAVuRQvQYrt6CYVjuPSI+2M3FMGYy4RS3/9npCk6bhuIx
         b1H2vSXG9e+vjtXHOYYxlga137K3Uk9V7n5KOuw+ZUlF6Yprki9FmUXJisl204i/Ad3Q
         SCo/TIvMJu6aTjSbsdNr+XSKvrXv2r4PG3BbeocPuW9P/KwXxm3Ci1y3pQCrFnwPP6iI
         Wuvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778679653; x=1779284453;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZAgafHElfkN4za1YfuXxY37xpnsh7yTHu2eNk+K1HqI=;
        b=PtX+TuZrVe+2H4qYMQGTS85YBgIZnBJJqKaW8ccGLHvrrqDFLrVaCu144lZsZdlb+A
         2fy13OLVAGMcuzTGSGK+nitJuhRW/ZcTfHpKkRo5Mw4FG06tL6nu5olOvDDSQtuIkMyf
         6GBoDzttegH1WajVSp3BBYurtKukyOlEqtr3BY63Zu5uWCIo7e6T0d6w8AIacKbUZD6x
         TDEoGD5RyFmhJrhs4gF10LasREFjBnjTAfe4vqnWwveC+hHVIJqzQj7q2UYH8gzX1Msn
         nFb06s5L+8gDyNpdAMZ9AbHoAsEvQmc0JLmUDB2XyYrVsuBsKpEBj5IGIWHwVzdzKZfx
         hQDA==
X-Forwarded-Encrypted: i=1; AFNElJ+MpfcghC1ygWt/PQ9LN/V8ZIa4qrtae5vDbEIxeISozNroR0Wcc5C9uDHVrxd6cKnNvpbsfWRn4Vk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyISG7cNlPNGu1ZVzSwVbBcPaoQlqBgu7KGjBjkQPIP3CcDmlRJ
	XaTjfgZQmtK3Iit0klZ5Q9tWnXkVV5ur5/crG6Y0kOJVlDpeH7BpgSOsu7mltkZEAwSjPyqKA/1
	mVgIIjg7WeJrZbgk7ebr5WuriXwqQK35NQOkg3Y+sOubhCP3QT+Y9GuGYfxfE+iw=
X-Gm-Gg: Acq92OH+sgD70Xuu2cRem8n6sx4aV9LdhZZ9jfKpNfs+iaI5SyZ8Iy1/1QtJcuyb4xH
	o6r1k3HiE57zEjIO2o+SvlU92qDcZsd4m+2DRYAY4f5ugBYYrgRuVppY0wWCksnolCIaRSt3+co
	RXNwRknl8T1CTC0ddqKkB+LOwhVsqTieL0RxAxl4KHk64tC1lUPqV3w7uYIc861Z7zPtCd5xEeR
	MzrUJl5LcqxJ80FK2ZOXfPVvLtd7/F3QH0TPe/GwhPPO6ckfOmFWqDv269EqSxTbFlH9GOvBvFN
	jK+Bh6AjrApmA9gDJSBy34B9/g33VZzhXawPXGFtHjQ6X1Gyj74OvQsuxB7rTwsQjk1tYZTRfvS
	fEnJdz5nhXHj3aHNRbJsLbeXLM8JEynr/1PEkAjWlszGwEXydoQUL
X-Received: by 2002:a17:90b:3a46:b0:366:4782:1379 with SMTP id 98e67ed59e1d1-368f3e4758emr3971547a91.24.1778679652599;
        Wed, 13 May 2026 06:40:52 -0700 (PDT)
X-Received: by 2002:a17:90b:3a46:b0:366:4782:1379 with SMTP id 98e67ed59e1d1-368f3e4758emr3971434a91.24.1778679651211;
        Wed, 13 May 2026 06:40:51 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368b00d2131sm4317403a91.1.2026.05.13.06.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 06:40:50 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: [PATCH 0/4] clk: qcom: Add DISPCC and GPUCC support for the
 Qualcomm Shikra SoC
Date: Wed, 13 May 2026 19:10:35 +0530
Message-Id: <20260513-shikra-dispcc-gpucc-v1-0-5fd673146ab2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFN/BGoC/0XMTQqDMBCG4atI1g2M+ZN4leIiGRMNVmsTlYJ49
 6ZK6eaDd2CenSQXg0ukLnYS3RZSeE45yltBsDdT52hocxMGTIEsOU19GKKhbUgzIu3mNa/yUiP
 jwMBLkj/n6Hx4n+q9uTq615rx5Tr+7bo4ZcH0T+4yGOcxLz6GRBlo4VrvPbdQb+zLW5Mcxec4h
 qUutK6EVhpLAbw0oKtWWSEt2sqAslYYI5lEAaQ5jg9pqujC7gAAAA==
X-Change-ID: 20260513-shikra-dispcc-gpucc-6f59c23020f5
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: yJlWqZgfDQl7bgvrhCDD_WayPTy2RfFL
X-Authority-Analysis: v=2.4 cv=DOS/JSNb c=1 sm=1 tr=0 ts=6a047f65 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Nlnp6rM-Y-S_hK6644EA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: yJlWqZgfDQl7bgvrhCDD_WayPTy2RfFL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0MSBTYWx0ZWRfX7xBJ5d/LyYKj
 6qlChf/ycIE/X2SnfffOBNMk36Ml8bsrQpTRNWZ80jfYfVcsp1rWm3y+8bcisRpWKeqNstH/HqC
 ewcj06qQQnIYj/rRYPeV94ipCZN1FewFQDZ3cWBgIqbUURbypqCYUUfvB0lOEl1ppj/NcZdTA/j
 tJ5QNhdSkNLhswhFtQYwaOl2hwTA1KGRSSI6BQTJjpSVp3ZbR4iBSu8xlB7v21P5aF4BQC7/CQs
 vaWNip3KOokk55fefR/qSl3Tx5uZXtkEWzEz2hfYUHlRdSLQEzG7rQaEdFdU5OjblVRwTC6hgFb
 ccd0TA4ZR3FWUcBgVRVoPJdBnK07sW6zsJcDx7wB9HtHy+seX+EU4uqMb0o5fgz7jUHhekGq1Q2
 EEc7awAz1djog763fAUaNSrfAEjjkgI3kCSQU4FwiPRZ+lHCzz179O3KCSosZToOTVfP5YCxtY+
 Ku+lKL8Ufs4AKHggQXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130141

This series adds support for the Display clock controller (DISPCC) and
GPU Clock Controller (GPUCC) on Qualcomm Shikra SoC.

Shikra GCC series link:
- https://lore.kernel.org/linux-clk/20260508-shikra-gcc-rpmcc-clks-v2-0-83238ba24060@oss.qualcomm.com/

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
Imran Shaik (4):
      dt-bindings: clock: qcom: Add Shikra Display clock controller
      dt-bindings: clock: qcom: Add Shikra GPU clock controller
      clk: qcom: Add support for Display Clock Controller on Shikra
      clk: qcom: Add support for GPU Clock Controller on Shikra

 .../bindings/clock/qcom,shikra-dispcc.yaml         |  62 +++
 .../bindings/clock/qcom,sm6115-gpucc.yaml          |   6 +-
 drivers/clk/qcom/Kconfig                           |  20 +
 drivers/clk/qcom/Makefile                          |   2 +
 drivers/clk/qcom/dispcc-shikra.c                   | 565 +++++++++++++++++++++
 drivers/clk/qcom/gpucc-shikra.c                    | 406 +++++++++++++++
 include/dt-bindings/clock/qcom,shikra-dispcc.h     |  39 ++
 include/dt-bindings/clock/qcom,shikra-gpucc.h      |  37 ++
 8 files changed, 1136 insertions(+), 1 deletion(-)
---
base-commit: 9974969c14031a097d6b45bcb7a06bb4aa525c40
change-id: 20260513-shikra-dispcc-gpucc-6f59c23020f5
prerequisite-change-id: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0:v2
prerequisite-patch-id: 5a0fbdd458785da2d0e850c851a05046672ecadf
prerequisite-patch-id: 1f98e515a52bbeb25e2a960a804afe16c6a472a1
prerequisite-patch-id: a64476b2ba6e0f2a55928baf72ec32672ee0123c
prerequisite-patch-id: d0c8651205232862b40f942929e1efdaa3084eb3

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>

