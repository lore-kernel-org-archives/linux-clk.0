Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265E93A4538
	for <linux-clk@vger.kernel.org>; Wed,  9 Sep 2026 06:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788933695; cv=none; b=RBEEa6fUD1ZVkr3KUw18h1qBWyUBhadwofjRuRnIx+4nK9k4S09cvtVEq9RLB3rUA1PiLtq/XDuL5X2C+PrNjAplQAiKyVqIueztraBaJKZZ560KklagO4C6/FVnIqDBiDj17lCdGaDj0/Pkmo/l+Kim373zsSTVESd1ir7X2NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788933695; c=relaxed/simple;
	bh=oQcQQHOIXjxvnk9uZE9E4oYNRnfUpbFQZkWv35uyGXE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qcRwQ0FF0h4uXsW+3IzdVQl2clOaOH9zgkhs63JEwCpj8NUdtzzxUHlonWy6bfNZthxTeERipjOKPKUCAOaYaMkE5eY34yVNnmioRJygSXR0ACNH1DnT6WVr409JcAQphIY8EsE7ONDuGfXBH7DQoUU4x/+ikCqIrW+VTeiMovM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XTEcXHy3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DZH1dXUk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XTEcXHy3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DZH1dXUk"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688MgY5N482539
	for <linux-clk@vger.kernel.org>; Wed, 9 Sep 2026 06:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=K0GzJ31h+P3OloWw2ZvMbw
	NL8F4ayZYlLsmS8xdExT0=; b=XTEcXHy32jtEvb8s+rBHxd4XPt7xs0PGJsQZKf
	kCiyN9FgLDE38l7I8LvyUmdf0EnR99pNJTpo3mPener+9cGe2TlOq6RXpLroT8l2
	qMCwgZPCz10N5ux87a8xz4BPKjVG7ypCHTNyy0Ecn4Z3wUbulbQn6c1ne90Z+SAG
	WSWAAqTKLaKNjURDBWqsIITpCXGmiweU66OyHF8I79t6VgFKuShF9DaVlDlwGU0M
	rzSYwelWl5WG5P7unjBxEsRFl3AaWljzBKjblXAW1CuRjJPRLxCWnMPZh725jVG8
	14B7EW1/pJ8KA575EaP15NMnjq72GnIratNahTUpoVc8adLA==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqf1jddf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 09 Sep 2026 06:01:32 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6bc3374cb0cso1049425eaf.1
        for <linux-clk@vger.kernel.org>; Tue, 08 Sep 2026 23:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788933692; x=1789538492; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=K0GzJ31h+P3OloWw2ZvMbwNL8F4ayZYlLsmS8xdExT0=;
        b=DZH1dXUkcqN4HQ2NC2+H+eD0x2y3NcHmG/HGtTWlwd2WxN1Fsa4YkLrNnv8W615xd7
         vXVktoDraCNgpQUSPZ2WR86vHPrvrgbDnEWx2T0mLBGaIc5EeAs33ecTyuiUuKX2m6at
         pbwTbv9VDlZklHhjpeKOhSAgKDMGt7aEWYCxmtyJAjCAFRIEkO0vt/gHo3q/P1LT4ATB
         dpA1N1ENpA11dIc5pklNERfSIaMCmGvwyedl3fXjCmeFMS3e++BpHVGoWvIm8Q49Sqha
         ngCdqExFlKrjnFzvaUzEdwVTE0VmytGpRsd5ethhuximUHAcYrY2OS/shRpC9HpUoTKN
         eCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788933692; x=1789538492;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=K0GzJ31h+P3OloWw2ZvMbwNL8F4ayZYlLsmS8xdExT0=;
        b=tAQtAYjE4xRcH9lvcO21vbFxcNsMhgxRREq3KuRssre+D8sRS8jv5emQ3E0AsbL7tp
         +AZ8SbpFpKr0vyrCah7SUWVbK0V1wKZkI/XWEVauZoVmJjRT0WWNp28DOgNYhDUNsjHx
         muQpTYl+q7uTL+ZExR9xIX/JSYvvcpRY6kKWyB6UxJdrNENiVgNjJKJukNLt/eDzw5J+
         PkdvgICymHyMJrKgIRceo3ktmoO0OLEEa4sMAP1kAZQMhtg0ibu1CgzMNByWfaBp9bhJ
         5WDY1Hq1pYvaVuFddigQhkCp1iB/cJC5oyDm/xY0WMx2PfjWyCAM1ETGT4rsNqj/opFa
         NY2g==
X-Forwarded-Encrypted: i=1; AKwUvByKtrycHjmDjQnkFkHG1Yk4DpLfEvXAWU1cXhQfFvdC+WrjEzt/ZWq6JCHWUpiwUyOwblsbPvpdme4=@vger.kernel.org
X-Gm-Message-State: AFuF++nfXqP57JndIdCG/rLX07d7xqImTgPJOuOiXi3cqyVJ4BEh6syE
	FC3GVoPM9qGu6/UmDbneDohowms6N4kSrMS6uZS34o91+uSS9S7ZYXE4xE+7U/Scl61eWwmaV86
	pBH9i1QrSJ/KLVPXzPQRoJ0SFgXn0aunno+oMGx04WtsTFYx+JksKU+GdzG3S57I=
X-Gm-Gg: AYBFou25IXlrjXw9aygRd0aNCJYN1pU2MjuHYPnCHS9vEH4SZa0AW7M7Z9RAXO5hQtQ
	x0VwHprXO8pQUCJ1KHv7HNeBGCOd5O9jHqVC4W2YSVx6VaySpPkw8CDft+Q+0qL+AVN+21GL63B
	viStGjDWy/2hNi8ISw2ZuZ2h6yDHdFgkEu0VWeB+sTGBSa27fNNwmgl2S1Oj3SmpfK8xcYmrm2i
	XpTyRKESVXCsxGw1xVlRvVuUqohGPqkL/Q/R3TvUm2esntdt2O8xhRd5zD2MfWJBSpOXl8ZiI/Q
	RH0WlpxoXb0W8hsmAcMNgPaSG98FOolCf8R4PeOMPrW6AqvVa7yydGiTRSp5PzS/LVLseS+9CNb
	JfjP6UckvcNEFcX39v20OALt8z/+aQi35KbAMMCv5rDayZ7fmsImiIpM=
X-Received: by 2002:a05:6820:1501:b0:6b7:8396:f3d1 with SMTP id 006d021491bc7-6b78396f93amr17677388eaf.51.1788933692240;
        Tue, 08 Sep 2026 23:01:32 -0700 (PDT)
X-Received: by 2002:a05:6820:1501:b0:6b7:8396:f3d1 with SMTP id 006d021491bc7-6b78396f93amr17677341eaf.51.1788933691744;
        Tue, 08 Sep 2026 23:01:31 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333c9db92b1sm41342098eec.9.2026.09.08.23.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 23:01:31 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Subject: [PATCH v2 0/2] clk: qcom: add camera clock controller support for
 Hawi SoC
Date: Tue, 08 Sep 2026 23:01:21 -0700
Message-Id: <20260908-camcc-hawi-v2-0-f892ba1d118e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADH2oGoC/03MQQ6CMBCF4auQWVtSCqWNK+9hWLTjKJMIxVZRQ
 7i7FTduJvkned8CiSJTgn2xQKSZE4cxh9oVgL0bLyT4lBuUVK3U0gp0A6Lo3ZNF48laQ7UnryE
 Ppkhnfm3Yscvdc7qH+N7sufp+f4xR9T8zV0IKI7VptUWNjTmElMrbw10xDEOZD3Trun4AJo0Ls
 asAAAA=
X-Change-ID: 20260508-camcc-hawi-4be887e3beb5
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788933690; l=1391;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=oQcQQHOIXjxvnk9uZE9E4oYNRnfUpbFQZkWv35uyGXE=;
 b=omd4L/lc3C8G4Mx71ZdVJHuuH8ESomlGOvnnYbzG4aBqo8U4/brVVUwnHwBjbr4KjhPKU7o/S
 EdQqHI70rttA/AOI4tKYB4DFcEPTknYb9vmrhMPL2lOeg7NwWdQuj4C
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA2NiBTYWx0ZWRfX7uMgca6yyXhO
 XcQKjU4psBxbwFKDWb+Z4px1c5jnuOYzj1A5wtMenlIw7592GKntx3syDnOD4MxgchHMV40kHZJ
 TxcIVR+SiHvUbblMUX9M2iyUO92fi7CZcptIFSLy3hTiisY8v1Fdd2kgX/PfxYca8146MzPM10K
 LZQWRMtlAOXmInAVtJzeg18cgJwG5TmSnlzUW2cWwvfUXHn/3uYkV+1k08iKuIrzvZ/5AM7rt30
 6NizHI7tbbTtMQ8muyxwF9LMR1lCksoSHwIvr84F12Xv0ixNAHncOjD8EXcMtPOa5IbNW+ns4fb
 2hj1hoa5OaAXJN9C0E+UOsp7npOA5hcrUEx+NCbnMFH3vOsziYr4KJpn2bHbyO9Hk12kQ4hSlBj
 X9vOnv5EUwlApjKyNacRUSIAvFRB5P4LP0yPIm5q4GTSCc0NVCvMz9mh0eZ0vmTd6RjF5iWcpvJ
 LCEaQq8ydy/O/Xlzx9A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA2NiBTYWx0ZWRfX3eWR9+zgD6iL
 rbfeIW/k0xby0Fteafu/zLh0tmD3UN3xlK4CbkfaQeQwGbG7Nc6DzuFIqKC45YeOJWx/CluqRU7
 uVkmpuAxKynQZyEQXPZhbBPbntPVrdA=
X-Proofpoint-GUID: euCuWE5rkwLgeYLmhWHpfrTTiasOzn18
X-Authority-Analysis: v=2.4 cv=JY2Ma0KV c=1 sm=1 tr=0 ts=6aa0f63c cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0ofaL8MKJGBdPcn-MXwA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-ORIG-GUID: euCuWE5rkwLgeYLmhWHpfrTTiasOzn18
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090066

Add support for the camera clock controllers on the upcoming
Qualcomm Hawi SoC.

Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
Changes in v2:
- dt-bindings: Improved commit message to explain how Hawi's CAMCC
  block differs from Kaanapali (per maintainer feedback)
- dt-bindings: Removed #power-domain-cells requirement from the
  binding; will be sent as a separate patch (per maintainer feedback)
- dt-bindings: Rebased on top of linux-next tip; added qcom,nord-camcc
  to the compatible enum alongside the Hawi entries
- Link to v1: https://lore.kernel.org/r/20260723-camcc-hawi-v1-0-7057658c5c47@oss.qualcomm.com

---
Vivek Aknurwar (2):
      dt-bindings: clock: qcom: Add Hawi CAMCC compatible strings
      clk: qcom: Add support for the camera clock controller (CAMCC) on Hawi

 .../bindings/clock/qcom,sm8450-camcc.yaml          |   27 +-
 drivers/clk/qcom/Kconfig                           |   11 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/camcc-hawi.c                      | 2984 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,hawi-camcc.h        |  165 ++
 5 files changed, 3178 insertions(+), 10 deletions(-)
---
base-commit: 944a035ecca915ae947905dcfb03f2b9dc6d032c
change-id: 20260508-camcc-hawi-4be887e3beb5

Best regards,
-- 
Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>

