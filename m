Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F5A34C9A6
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 16:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776702586; cv=none; b=f3QVUHAiTLBki2WNcW8MicbhvOV//1Dn1bvBxcjA4KDvANiEn0h2InJ3amO4RJHid0MaR7nwZuN9w5TpgBETYTqpvUf4v90ukURAf+VTGBFl+dnS6JPuf5cHQZ96vNYwN3P3BEj8xM++aSolElFbQmP9a+RoOg0CJirH7tpqkls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776702586; c=relaxed/simple;
	bh=R+cnwwKh6gMxYvBMtYkKztMY9ceDmfHMAWSwMq36ZjQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=k+nYQwUsyf+fUqAMCGbN/zhuQneRpAGVFW//C8yH41TgWEroO96dXPKevS1S6W/UJLXnT6J8lGEI1tWOhryCyggwbR4EFQEWNHH+Onn9g5b6P6ZQ9CDZGGdQHHLnVp2HDTXqewO7t6NP1VIGm1fF0G8MMReblb/9k3c+bx64tpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W1fBtnRQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ibZudol+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W1fBtnRQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ibZudol+"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KCG3Jv1532096
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 16:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sVskgqgdYaRh1WgsIQp10h
	RnRPGXP1X79hpcIG03a8E=; b=W1fBtnRQoq1p7JrrBLKoGTqC0B/esxHZE1aFqv
	vEG22iRmSeGhuGv84ssZ3/mnBB5ABZhfZ1XEXp8x9SuMfDN39c3vh30AKjlpHYVs
	UdaWN974lDpzbMr968YIIRdv/rk1W78tmZpdp96jZAUVXAiVm/XZXcq8gJW6K6fT
	COXUxPLls5UBOUopwIP74flLijOA4EyoSIMUlBV3+hu1cvkLHgrj6RLFDcfehX+f
	e6LDzFIC+ASogmOxpYc/4syd2DFSnmxceO3yTjY28iT2bcOufXnoMAv6IdKazT6w
	jcz/UiwqUvlTkrux8JywD1T7EOcvY2P0uszxfEt9ClOTmWzw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfus29vb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 16:29:43 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f504f6b75so1748329b3a.1
        for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 09:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776702583; x=1777307383; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sVskgqgdYaRh1WgsIQp10hRnRPGXP1X79hpcIG03a8E=;
        b=ibZudol+BYc9eL+VKOa7djQhHJUhhBFeKve7innJovDajReTZxLRtC9IFOSqZdrbsA
         D/B8a587OSwKU5IcuR0IwDIlHISsz0ESLQ3Cl7m7FvbeMD4n874Mdqrb4t8QxsuzgvWc
         bT5f4LHFlzSQSBJTviQfX51URDep4HQgKi11KhoNKiPcjIrFWNluO7f6G+HQNhjm4IpE
         ZZBWbMU4g78GY3msaoLjE2SYWz6H7aW7w6xOJx3sHuy4b9r2S/I8aIknl+urOKpEzPNF
         Q5HbUgvDkZj/5SVOUXtrzEyp0mvKdYdqwugcW58yt/SZMUeX/OtmX1bitOOacZdWSumw
         Me6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776702583; x=1777307383;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sVskgqgdYaRh1WgsIQp10hRnRPGXP1X79hpcIG03a8E=;
        b=TP72a/kSwQCfQSj4TQPXi5MHPXfNKxYCXyJx48dwscwmBOfYojw8o2XLIzLCgBuy26
         HbIJlU3AXo7oWOs8dWYr6B+Ji+Be4fufyRNxpiQs5tlzhJ09bbAjbui5xEEjtf/qYyET
         i8T9/kl6LWFs8sPuNtw0yNgeGOz1x3CQZgzNt0wrgxTXMF/f6ltESTsMqMsGUrfzrPva
         6gTCO04cydTI0TBUMwN/RHNn6L4yKidZl1o26vTg/QX2cSLbymcnPm5HOK51zzYUFWlz
         dFxlhkYCG45GRobkDXF2jShlJPa6CK4XZpdHSADlahKP6vRwxP8XeVgxA1z9juY16ndz
         BCrg==
X-Forwarded-Encrypted: i=1; AFNElJ8ExDHWq3uISXgyngg2eD1C9RW/GStL3zn7+UxlHnQQeSx1/V9F91M+u/0zH+Y+pj10LSc+1lMRxkk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4un02g6JFIL6dtXaegu2HwipFCwcnWhtVmOSJNyQvFJ9Sx/As
	xOewpv0cfxLNPw0MPjxHdpr/7mJOeq6mKM/rGRzTWR3mjgaFanX0krFW2e9+f/ju9HQtCNWBZ+J
	13cMZ4EnnHJDiiiGUBHNbtdSHSw+1q8DFGsbpdMFpqSWqxGZMvVwUOb/UrKp9d2k=
X-Gm-Gg: AeBDieuqk8SLVWRYRB35cjt/hZGYL7rIfUsfKgTNJ98jZjOzB0n/bU4+6I/o7xD3MKz
	VY4U5XbBAA5TpFl1EaWwKJwi8zB5OcTXwap+Tekfv2pH6JW0AWkXDGV+9p3+p5bCbdMsnSXMTEU
	qrdFzaK2fP31f51At26gd8LJc5n9gBuVpiL0jJdXYwq9PfAWJRQ7jTV7fxti0W11+oG81ddH5g0
	HsnBb9Jo1+zuT6L7CAtaRc1PTw0vyjGpwIsGjfWT2Zzf06yT35MIaMRg8vtqvQhPUbYvY2mTguJ
	prJW3jhc3GGDaTGwjlYT2LRsYLfD19WHbC0EpG1CLBuGCnzzMkEHvo8L7zOt2qO3NuVC0+Xwk0O
	pLzhckXsVY1CzhvqFCdulDMZGvgm5r3TjttLrouGrzK2oU5Qvycgs6gpY7Nhm4Hk=
X-Received: by 2002:a05:6a00:850b:b0:82f:948f:d1db with SMTP id d2e1a72fcca58-82f949f19f4mr7553867b3a.44.1776702583134;
        Mon, 20 Apr 2026 09:29:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:850b:b0:82f:948f:d1db with SMTP id d2e1a72fcca58-82f949f19f4mr7553834b3a.44.1776702582586;
        Mon, 20 Apr 2026 09:29:42 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec05391sm11666469b3a.56.2026.04.20.09.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 09:29:42 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH 00/13] Add support to control clocks using CESTA Resource
 manager
Date: Mon, 20 Apr 2026 21:58:53 +0530
Message-Id: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEVU5mkC/x3MSQqAMAxA0atI1gZqbZ2uIi5qjZqFA42IULy7x
 eVb/B9BKDAJdFmEQDcLH3tCkWfgV7cvhDwlg1a6UqZo0ZNcDmVraoUTy+k9WjKzG2s92pIghWe
 gmZ9/2g/v+wEZawYEZAAAAA==
X-Change-ID: 20260419-cesta-sm870-dispcc-5e4fab72b53e
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE1OSBTYWx0ZWRfX8/QFvv/sft/Q
 xzERjUB6TcFBeNQ1pAeRn3RUW7WaP8IjaGp3a+MrF9+VM7UGBESr50Ty9uL0AmGjB/dnb6TPaDD
 wUa7F+GDMwy/bUB+BQMszp6hW3LMiNKVM99zbrN5NizXZyHRF0BbO6arDb1ZcJb8JV4QJkPdfSo
 VOP9cXrSObxZ9UKyR7jx/2V0cH+vLHiCHQIhQsrzbFQh/Ouo/YgUfTv+GvaPXHlHVmM6llNmnyt
 KOByD1LkPdhUEU7Y01KtSYTR/vDZbqwI5HfncRUBmI5oQ0+3GGJn8vExDIXjgHeUJj49fbaFPVS
 uZaEElWthg4YKL+IjAcXbsBPDqkG3FJXCOHumVmwj4M1+ZZuEadiEF2/87R/+xr204B/3yE4TAS
 LWwQyW+tFwOQ/8wQcFhZ3vGQ7HdxVoDhrWZY+D4uvDAkBC3wt6KcB2fzW+K7d9WS2/LwC6IZoKi
 FGaddXsRcNZ2An2ssRA==
X-Proofpoint-GUID: jj-_ZOWXklAcXJesF8mDT_mxjK2JzzSL
X-Authority-Analysis: v=2.4 cv=PMQ/P/qC c=1 sm=1 tr=0 ts=69e65477 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=_r1upjipn-BL6pxEU20A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: jj-_ZOWXklAcXJesF8mDT_mxjK2JzzSL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200159

This series adds support for managing SM8750 DISPCC MDP clocks through
CESTA (Client-side State Aggregation). CESTA provides resource management
(e.g clocks) for local subsystem resources.

Without CESTA, the clock driver directly programs the clock tree (PLLs,
RCGs, CBCs). With CESTA, the clock driver instead sends a performance
level request to the CESTA Resource Manager (CRM) driver. The CESTA
hardware then aggregates requests and scales clocks to the required
frequencies.

Without CESTA (direct clock programming)
----------------------------------------

+------------------+
|   Clock driver   |
+------------------+
          |
          |  programs PLLs / RCGs / CBCs directly
          v
+------------------+      +------------------+      +------------------+
|       PLLs       | ---> |       RCGs       | ---> |       CBCs       |
+------------------+      +------------------+      +------------------+

With CESTA (clock driver invokes CRM API's)
------------------------------------

+------------------+
|   Clock driver   |
+------------------+
          |
          |   sends perf_level request
          v
+------------------+
|    CRM driver    |
+------------------+
          |
          |   sends received request to CESTA HW 
          |  (CESTA HW programs PLLs / RCGs / CBCs)
          v
+------------------+      +------------------+      +------------------+
|       PLLs       | ---> |       RCGs       | ---> |       CBCs       |
+------------------+      +------------------+      +------------------+

This series includes:
1) Base support for the CRM drivers
2) Clock drivers support to communicate with CRM and control clocks via
CESTA
3) SM8750 DISPCC changes to control the DISPCC MDP clock and display PLL0
using CESTA

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Jagadeesh Kona (9):
      dt-bindings: clock: qcom,sm8550-dispcc: Add display CESTA support on SM8750
      dt-bindings: mfd: syscon: Add qcom,crmc-syscon compatible
      clk: qcom: common: Add helpers to control clocks using CRM
      clk: qcom: clk-alpha-pll: Add support for CRM based PLL ops
      clk: qcom: clk-alpha-pll: Add support to skip PLL configuration
      clk: qcom: clk-rcg2: Add support for CRM based RCG ops
      clk: qcom: common: Add support to register and control clocks using CRM
      clk: qcom: dispcc-sm8750: Add support to control MDP clocks using CESTA
      arm64: dts: qcom: sm8750: Add disp_crmc node and CRM properties to dispcc

Maulik Shah (4):
      dt-bindings: soc: Introduce device bindings for CESTA Resource Manager
      soc: qcom: Introduce CESTA resource manager driver
      arm64: dts: qcom: sm8750: Add Display CRM device
      arm64: defconfig: Enable Qualcomm CESTA Resource Manager

 .../bindings/clock/qcom,sm8550-dispcc.yaml         |  48 +
 Documentation/devicetree/bindings/mfd/syscon.yaml  |   2 +
 .../devicetree/bindings/soc/qcom/qcom,crm.yaml     |  83 ++
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  23 +
 arch/arm64/configs/defconfig                       |   1 +
 drivers/clk/qcom/clk-alpha-pll.c                   |  15 +-
 drivers/clk/qcom/clk-alpha-pll.h                   |   3 +
 drivers/clk/qcom/clk-rcg.h                         |  23 +-
 drivers/clk/qcom/clk-rcg2.c                        | 242 +++++
 drivers/clk/qcom/common.c                          |  93 ++
 drivers/clk/qcom/common.h                          |  57 +-
 drivers/clk/qcom/dispcc-sm8750.c                   |  89 +-
 drivers/soc/qcom/Kconfig                           |  10 +
 drivers/soc/qcom/Makefile                          |   2 +
 drivers/soc/qcom/crm.c                             | 996 +++++++++++++++++++++
 drivers/soc/qcom/trace-crm.h                       | 111 +++
 include/soc/qcom/crm.h                             |  72 ++
 17 files changed, 1834 insertions(+), 36 deletions(-)
---
base-commit: c7275b05bc428c7373d97aa2da02d3a7fa6b9f66
change-id: 20260419-cesta-sm870-dispcc-5e4fab72b53e

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

