Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A462E5B1B
	for <linux-clk@vger.kernel.org>; Fri,  8 May 2026 04:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778215937; cv=none; b=XX+PW1PTBjynn4qHyJDkobGrzG7wzwUQeX0p+Xew/nCenUtPg/9w/AHrLYxsYnOvFqo8iZJboXVOmh2PAQLihnHJtCorOUvGYua2ZKj6NUh8dVymYdUufLaaz/emB3JsPA1sUvDZoyxJImxGWpT4zFaiZbR8FAYse90f0ue2Z2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778215937; c=relaxed/simple;
	bh=P4C8k5K1ErvhgwFkZle4aus/aS+aZ/YlzasAP57cJFY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iTTKSQ+iV3zBDOMysXEjaAaqWATcryT7+eG/HkrTVdiHCNpLQdM0crmoX3Jk3V4EfvhgA7U54D/84i4Qzjo38Qc2RqrmJF2VBqP9kmNTR9Uv+moFJfOYmPNS9hSE3oHH+LNlmN0qd8VAa+mYfdN0XarctmmK/xMXFq9G2nGlcVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pm03CQfm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WmtIrZnw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pm03CQfm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WmtIrZnw"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64824A1T2384187
	for <linux-clk@vger.kernel.org>; Fri, 8 May 2026 04:52:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OBZL99WklIEGKlY5KCm0vX
	ttleoAmTjvHnB0CO2GC8c=; b=pm03CQfmFyOyF+C2ZG6PM84CWcx+VWB1pp3AYl
	DyPUJjNN6cRQLTemQVlWtzGwGpwWXn2zkuXyPJXNJX+WLTFWQgQwIuZU1sgOFFig
	QBZoMxwPJFlsJaGFvWmJfuOw7T/ak4U82JBbXgftnrbK7ESrHPZuPTYjbzwVxGrV
	DYOxUWKbA9PKxxJTMCpmJgmJxfO2YZVlo8nsXVvyQ6qq39vWbpv5TEW3YE/2VeWy
	Y39pQPdGUOI1y1MS4lziEm0ZgJLiwj2sW9Uc8N8NWou09HzUaLqrbu+otuLbfIsW
	ep+4K2odqYfMhMdJXxEfTGq1r1Gq0Ybrt500cURIh5Kv86jQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0wwujcgh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 08 May 2026 04:52:14 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-365e70c39d0so2100783a91.0
        for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 21:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778215933; x=1778820733; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OBZL99WklIEGKlY5KCm0vXttleoAmTjvHnB0CO2GC8c=;
        b=WmtIrZnwCImwHREqHuEyoUnHfuAWS3MugfXZ2MJjGKTc7pF31Zag4zDNO6uFNMFWlL
         8v7yiQb4Jp6y80xsX4HbphRSGrhk50nu58XQwsWUcRt6R9mHy1B8RXI9i3iv+DTzUx+Q
         BY9eh9HOVMCqsZFBVbuD1lGNtF8/ozgFg3e/ydDMNWlgRQGi/tN5Rz6jS6fA6LRZSNmm
         dyzdnHkCBGpBA89mo/5PYRBTqPqrC2uvWo0TjI7Oue2CqYEednziyhPigU77PtDInHV+
         z/cP+E5C6tLWD4oYmclQ9VbNPF96Fq1WDTSONfKwhpgHxFawF7j9z49obd9zDKdgqUEg
         pGbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778215933; x=1778820733;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OBZL99WklIEGKlY5KCm0vXttleoAmTjvHnB0CO2GC8c=;
        b=SU4Bkfij9ErqBQWfimCNu+AJNPvcXFVTrYRXg7b9iXzh6cd+ksoB5uQlNZCRwdCNes
         HPO9l2uWogZMcMRilFWNfHt1XhrN5UJm7ny1aJ9QGGe1BI5Vq9DAuNeODrAgw21cVqyx
         n2P6ieY+dAo61IMZ8L8CP2OD9ZQdTkkLXjtyn6oaO0iXp1oVIdsm2i3DYL2Qogz4ISq6
         GRA8NOAWVK+M6jmVFnd/e2PYJJqfat3j1PGDf5tnMck1vI0zb1qL/RMAwxxHm7xVpc+l
         /0QjcVBUf7nB3R8JPV7VLnrk2+6EI6FDgBFvFnMw7Iu4KKQJ7rwkWyNzfSoyUPY8IxR2
         fS9Q==
X-Forwarded-Encrypted: i=1; AFNElJ9gbPjtPHPqLAGmVfxSRxTQooMIUzXUz7EieiLQey+U1WnHmIvXAjiOqYR9b6+zpiBBAmAMZJm3T+E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbCJnQNTybcnmQFi6hUFcj6/z79pOqhcYaDX6gWAESpxPvZYIk
	mS5QceAlMRCKh3KF3PNSp5IEvj68bPNBiFsdawe2mnvzwHFxI8aqxoegSMtNtR+190/6X/YJQi8
	G5j16TQjpGFfAE4XKjOslSZRt0k0VV8SOCFnUJsliV7qYcqEUkMi9nmLCTnwNuCkfcyfcX+0=
X-Gm-Gg: Acq92OGK/zgGdHu5zS+5L2rU5sSyNlmvUerR6q9Pf8qNLNTFIkBfS5ruUCf+Cvpfq7D
	IqrPoG+I/pWJw8DO64j+B6fVbwTCTgoYyJLcqQPzcnsZ2owhKCohKqqkVG7VWzrYozvlMcSmDrr
	CaRBCXRdwlaSq608x3R4p0iAMpeT+3LfSsKE+lJTMIuFx/+oBn+JBXbA4ULulckNak662Zb1cla
	2n7KU63z/9WJzB9yXAvuuOfHPRoP98Kgh9/XH644lSajUWxZ652ZHu1YvzZflUfmGsmEPY32GXp
	XWifOe8ZhhTyU8PJJFkrr7tH1MepiinCtJwvjjlJaO0Dj7a0n9dC3b3UvBU5RWKt9N6WAYjxiFC
	SDAl9gweOnmaQeRlWpve7rOPA2CEDlNI+Z6AcmPjf3r/GawbpjJw5
X-Received: by 2002:a17:90b:2248:b0:35d:ac4d:3cb6 with SMTP id 98e67ed59e1d1-365ab9b8e81mr10834456a91.5.1778215932711;
        Thu, 07 May 2026 21:52:12 -0700 (PDT)
X-Received: by 2002:a17:90b:2248:b0:35d:ac4d:3cb6 with SMTP id 98e67ed59e1d1-365ab9b8e81mr10834419a91.5.1778215932192;
        Thu, 07 May 2026 21:52:12 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36645bb9c02sm556076a91.1.2026.05.07.21.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 21:52:11 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: [PATCH v2 0/4] clk: qcom: Add RPMCC and GCC support for the
 Qualcomm Shikra SoC
Date: Fri, 08 May 2026 10:21:49 +0530
Message-Id: <20260508-shikra-gcc-rpmcc-clks-v2-0-83238ba24060@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOVr/WkC/4WNTQ6CMBCFr0Jm7ZBSQMSV9zAsytBCw0+xo0RDe
 ncrF3Dzku8l73s7sPZWM1yTHbzeLFu3RJCnBGhQS6/RdpFBCnkWhayRBzt6hT0R+nWOSdPIKEV
 d6M4Yk7cC4nb12tj34b03kQfLT+c/x82W/dp/xi1DgZRTV1VleWkrdXPM6eOlJnLznMaAJoTwB
 ezOFjbBAAAA
X-Change-ID: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: yVxYf4KAFidZgc1UbrBmV1iW3eAYty-c
X-Authority-Analysis: v=2.4 cv=Nd/WEWD4 c=1 sm=1 tr=0 ts=69fd6bfe cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OWuwaAbB12Tzs4-beUkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA0NSBTYWx0ZWRfX2OBHiEFYmr+m
 /MjnYLjEZvUNSu8J40bcR7QGUCdL77Oph7hRKUK4NKewZRsVLTd5mwSVTAH/IRqb1S8RpA1figy
 WvTZljLd7G0WdJOZFd8PSHo84we7+4R+RIMP/OUN5zeAIZY2OCN7B7aYTpbemzRiaswNJScsOg1
 WAnnGCrLhZ8WmAG6j6nnM9HjFO5CbSEKLNLvEmt+C1E4aNI3wVYZY5XmkHIWrAKE0/y/OnkECoE
 /hBEHeLeEcP7bFjnNMrlbRROzq07st1tRj0NyNTEEvk/vaZrQcu/qXxdK6ddiZRuKgrzRwH9tj5
 WkbD2yIqpmkdbeftFOrMbRKNXdtybjxymzMKVQJh609xSEwOZVteYSXkm52Xf0DPaK/RwqkyU71
 ujuPJI3pdX0YSqxgb6xjGmAhhLMw7XOENm+VtcVzgNKnSec4uYR0lxXhFNwYIeuFplAwPGZBpeB
 CKbrkB8MC9kCps4FhIg==
X-Proofpoint-GUID: yVxYf4KAFidZgc1UbrBmV1iW3eAYty-c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080045

This series adds support for the Global Clock Controller (GCC) and
RPM-managed clocks on Qualcomm Shikra SoC.

Qualcomm Shikra SoC details:
 - https://lore.kernel.org/all/20260428-shikra-socid-v1-0-6ff16bad5ea2@oss.qualcomm.com/

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
Changes in v2:
- Dropped defconfig patch and enabled driver from Kconfig [Krzysztof]
- Updated GCC bindings and driver patches
- Added R-By tags received on v1
- Link to v1: https://lore.kernel.org/r/20260429-shikra-gcc-rpmcc-clks-v1-0-c3cd77558b7a@oss.qualcomm.com

---
Imran Shaik (4):
      dt-bindings: clock: qcom,rpmcc: Add Qualcomm Shikra SoC RPMCC
      dt-bindings: clock: qcom: Add Qualcomm Shikra SoC Global Clock Controller
      clk: qcom: smd-rpm: Add support for RPM clocks on Qualcomm Shikra SoC
      clk: qcom: Add Global clock controller support on Qualcomm Shikra SoC

 .../devicetree/bindings/clock/qcom,rpmcc.yaml      |    2 +
 .../devicetree/bindings/clock/qcom,shikra-gcc.yaml |   70 +
 drivers/clk/qcom/Kconfig                           |   10 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-smd-rpm.c                     |   39 +
 drivers/clk/qcom/gcc-shikra.c                      | 4428 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,shikra-gcc.h        |  262 ++
 7 files changed, 4812 insertions(+)
---
base-commit: 9974969c14031a097d6b45bcb7a06bb4aa525c40
change-id: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>

