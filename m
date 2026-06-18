Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABF3331EC6
	for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2026 17:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781803289; cv=none; b=WIcVKyMml46k2SNYDViuriDuqQj2+HvhfcTSQdf3ZRRE1rnad+OZ+VfZu8MSj9p66GghyWPIrbDwR/oltnrl9dtZr0Xjpptm+X50WYX+Vaa3PIRNF0H5M3eCk+xiG+6klFjnwEx2CHWo5zMEn/s+UrnQXTcZqTKnGDnuGdTHxL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781803289; c=relaxed/simple;
	bh=LCqQueoooqk1QVlkRvPlmTHpiHm8HjxSiH78KPzgC40=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RLMGUQxTeWF9aFS9DrLrKkM5jNeNNq9/Y2A4TnAqQ8S99a5ooot257TPXUaCNkHKHlotPO3K4GfSi5vmIIgmF/EFzHbbGr2s/ipvEbG+Y91uqbbp7Kld9QR+6apB2fsOdqBlNKXoJWTfY1mqIK5Kgx4skJiAzVxFA/7uV8aUpFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dZPMMwbI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XoqKNGE9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dZPMMwbI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XoqKNGE9"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IHJdFI436197
	for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2026 17:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TPaQW4JIBNiyx9NXi9UMuQ
	jkYUZLH9jSR0WJTcNOy8U=; b=dZPMMwbIYv3uVzmP8YkVFhpnuZTOP200JY7Pb9
	ooDtdhAz7dZRFXxVKXDTcAW+uGdFJtNjWt0D0vy0pbTrEXGheyYIs4dDYLefHdpH
	YckYIjzq0YCc4MykVjBYQWLKcbjEZphz5GLWCI+fyrxSr0z+GeSbjbu1JfgDFyQu
	HcbUodEPUOEeUczES3oKV9Pzfb4JzCq67oRHYBpaSvaevw78Zg0zl7F6VDULQOFY
	Clki7w44UhKmRPG9BeTKhK0e/bA163NXhG97f0DtzYH93WWLPwlz+3qT3N0R9I/2
	r3jHzIGfpKdsB5j3kAoqFS41QqhwsUE4jm+AxdUgTKMp+8+g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evmyr80ay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2026 17:21:27 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36bd4146cb2so1121609a91.1
        for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2026 10:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781803286; x=1782408086; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TPaQW4JIBNiyx9NXi9UMuQjkYUZLH9jSR0WJTcNOy8U=;
        b=XoqKNGE9Gj7cSIRk3UpyXLIW5Cdc6CLQmlz8zbO6S1P3GnjDt1C+ZXT4ENuioVh9iu
         mPbhfMtFo2UjbthIkTUKYvGYlYK1peZ2Y88riX0lUpU0+/vi8rOLF4GAZpOb55Evhl5q
         FJGeU3jHZsbjOSVlek/yxvxDi3PIEGhqU31rxI29nr2WQk6t+dMnfCz448u0Dt4Sdjnu
         AImIELagBi2HXpavIxyWcQoti6ffvo3CDM4aKfZGywReYPsfbUO4h9rr+fZE5l+kSHYF
         N+7oaawB5/3152YMaHiEAJmasXkMV0TXUHymeM1nn4oTQZWfNb9MKYwtWDlRKuO0di3p
         xsGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781803286; x=1782408086;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPaQW4JIBNiyx9NXi9UMuQjkYUZLH9jSR0WJTcNOy8U=;
        b=EiPkUXP2Ccz6+VQUVJyXwv6MgW8SZuoTu1c6SX0ZF/sLVzl4eyZ60/5+5bSZML39S4
         J051r2z9Mk10BQE6Ohi4a+ZnBVkh/XhAWAo3pAND7Wpu5gQSfo305IM5rSGU25f6nLor
         ddcqeM/Ov154sleolvZrNpF9PUCLLu/iD0uUO3kdKgNgKMJ1AfGLNmeJm5QMSbgHPISP
         OJc1CkHkneFpOaOBpMXFSIv9wxWADymlBCKQ1mINln1KBgMd/Xa8jydr8kD3PojTzQnJ
         pE27Yi091Kxv3FavbU+OyAxW+Q9IUWWK39M1bfVcwVL6OQy4BtkuOKxNIrMaBtCsSWLB
         apew==
X-Forwarded-Encrypted: i=1; AFNElJ9O8202ydPkD+WoFQIy/KvsCefYxXLYvC6va7TAwrPP7IU4xX811FMY2Pn+FyaPWL6YyFS72OWbNl0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdH1O0to27YaCo/rchA7B2xL8lNxRWEDOWnmuuY4ehTpQQ4mmZ
	HWEcy/4GfhimK+dHsK3B3LTNEJkMfdWwtPks2LAbHpYv8mkzSHtjc7Wd0BL0y+iUSk+ADasrDoP
	+/te0lYASAx4TixFWVcMcdofepVQ07yI4O41RaIKCwqHbQn6+zUeV4Y45YrBlXPM=
X-Gm-Gg: AfdE7ck9ixKWjrJFlHqCXBHCDgx8EIjwItWqMbqzOerQxgicHv2SDTHAPMI2Tu/w1H7
	kBDwCVt710aKOJr3yUo8cPUftqnljC669I/oQn11wgfR8q6PjlU+A+Y/e1OAzFHCOr2MzSSGV4j
	OjXSikUTcd+lWw71rZjbPZlBwRthS6Qo3CayIZApCMS2B8zsCO0qH6j2JVqstG4XU3fjkCoe7T8
	5kWicwsv8P3r5fLtYwN8Os6ffD2R53PvT91wpQ9qM4xsmYA1Oad3yIxiCG1u3Gkhgt85IgsTPhq
	Pt1nU0g/NIzPKJeq6AW1/DH9Bw2sVRWj6j+OuvIuB6MVMTl03A+O3Z5QhuOSUxf8wUWNGTu9nPF
	ekhFsdRCW946RwAI4+T/bE8r0ifAPcNiVw88=
X-Received: by 2002:a17:90b:538c:b0:36b:877c:42e5 with SMTP id 98e67ed59e1d1-37cdbe3cea1mr4395915a91.17.1781803286536;
        Thu, 18 Jun 2026 10:21:26 -0700 (PDT)
X-Received: by 2002:a17:90b:538c:b0:36b:877c:42e5 with SMTP id 98e67ed59e1d1-37cdbe3cea1mr4395860a91.17.1781803285974;
        Thu, 18 Jun 2026 10:21:25 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d15df8b8esm187129a91.16.2026.06.18.10.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 10:21:25 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 0/5] clk: qcom: Introduce initial clock controllers for
 Maili SoC
Date: Thu, 18 Jun 2026 22:51:15 +0530
Message-Id: <20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAspNGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDM0Nz3dzEzJzM+My8zJLMxJz45Jz85GzdZPNUoyQTU2ODFAsDJaDOgqL
 UtMwKsKnRsbW1ACwGLx1lAAAA
X-Change-ID: 20260617-maili_initial_clock-c7e2b4530d80
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=RZWgzVtv c=1 sm=1 tr=0 ts=6a342917 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=WH5-n01XVsl9kePyjj8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: B2iRrplxpwZMOMJjLw0IK1R3B9ktFYEl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDE2MSBTYWx0ZWRfXyxQ4t3fRqcfb
 PPxio2U8dA8cXHG7/iHYV6o1iSGr5bC3bTlu0CY0iYVMDJBILkO5mOOp1B527wGya73lINBjGSH
 WT77IM9umVLdl/I116kjm2G70/i8/Ycz/zBmmo4SbCWwtIZ7r4On/mvBMN+OCQ3jBbs54U12NZp
 YX/gqJAMNQ99d1rPxAWTYzUPxxTXOC3TMjICte955QXugFIHBIpX8bucQUyzxj4hE/KoUrLjPbc
 UaLJ408vfjuE6LBmGai3eVT/DtjspmyfARxE/bpSpkixhhhaF5R4HS3HYXd4JaiD2+lkZ2cpzHG
 PGOGPz7M5KdeQaZhqXYlT0NBjf4laQqrE5tkzxXckGkDz9Y+DkB/qh8KEsdRIvjbKyp3p3isSah
 loaTlWpUPc6IRfXCeZUSGeO36HrHpCyi3tEzG8cMo494a5ayLy2SVrAp7hgDjN8yc1zYUgfeleC
 lAC6xPGUEcpP9yXcgEA==
X-Proofpoint-GUID: B2iRrplxpwZMOMJjLw0IK1R3B9ktFYEl
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDE2MSBTYWx0ZWRfX7ZwzEYfGA1A/
 4+Qt5AmycQXeHw3zmHBALltzwto6mX5MAQmSdzv0sJw7goibzmBsx4Dpl+HboiV+lJBgI4+wGXl
 rAUQmAhybkWSr1jfIFrVP8/kZQrYktE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180161

Introduce the initial set of clock controller bindings and driver
support for the upcoming Qualcomm Maili SoC.

Maili is a new mobile SoC from Qualcomm. It is a derivative of the
Hawi SoC and shares most of its clock topology. Where the hardware is
identical, Maili reuses the existing Hawi drivers via fallback
compatible strings. Where Maili diverges — specifically in the Global
Clock Controller (GCC), which carries an additional QUPv3 wrapper
(WRAP5) — the Hawi GCC driver is extended to handle both SoCs.

The series covers the following clock controllers:

  - RPMH clock controller: identical to Hawi; uses qcom,hawi-rpmh-clk
    as fallback.
  - TCSR clock controller: identical to Hawi; uses qcom,hawi-tcsrcc
    as fallback.
  - Global Clock Controller (GCC): extends the Hawi GCC driver with
    eight additional QUPV3 WRAP5 clocks present only on Maili.
  - CPUCP mailbox controller: software-compatible with X1E80100; uses
    qcom,x1e80100-cpucp-mbox as fallback.

The devicetree for Maili will be upstreamed later.

---
Taniya Das (5):
      dt-bindings: clock: qcom-rpmhcc: Add RPMH clock controller for Maili
      dt-bindings: clock: qcom: Add Maili TCSR clock controller
      dt-bindings: clock: qcom: Add Maili global clock controller
      clk: qcom: gcc-hawi: Add support for global clock controller on Maili
      dt-bindings: mailbox: qcom: Document Maili CPUCP mailbox controller

 .../devicetree/bindings/clock/qcom,hawi-gcc.yaml   |   4 +-
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |  65 +++----
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |  34 ++--
 .../bindings/mailbox/qcom,cpucp-mbox.yaml          |   1 +
 drivers/clk/qcom/gcc-hawi.c                        | 200 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,hawi-gcc.h          |  10 ++
 6 files changed, 269 insertions(+), 45 deletions(-)
---
base-commit: 4fa3f5fabb30bf00d7475d5a33459ea83d639bf9
change-id: 20260617-maili_initial_clock-c7e2b4530d80

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

