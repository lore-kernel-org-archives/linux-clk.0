Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7190F35960;
	Thu, 19 Dec 2024 02:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734576419; cv=none; b=q4OQ7Qb5dS350R67YR083VpzhrZLc9+Jex0hL0RcU9rtIQRBS50UYC7O3Q9abbqOWDRHsdpWxrXBaQP0zB4UFJRpxy8XuAbZ0rOGzZFPDviL7kgJIWgJil8aP91rPd4voaEMEgMf5WkhSeRKWu6Xin4MkWeLq2rnjDCoXtFTKR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734576419; c=relaxed/simple;
	bh=U4yAcZvgCp7q8iAYdflby20lQvDNdL+TdDO8hw3lC7Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ReVObOmKIlMtHZ+jKIP77b5JP0GMtCRNgV0mXhZgI6TB/wHx3+DIwrFt9k/rQ9F0i4UHd6+YECKH87DUfBFVq7eb3soKblIqVhp9TsZF51ewy1BdltQ7UCB7AWlWeAMzEnfb/TGEwysMvTXjC0nA3mdJmutahc2o5ASRKXrKKMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=b93c5Zte; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="b93c5Zte"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJ0wYje001493;
	Wed, 18 Dec 2024 20:46:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=vfrpb3C1v2EhDR3g
	Vye8huExqAcwhSUxaIjme0X0Lm4=; b=b93c5ZtepDYjfWcP824ZGdd5nVzEVIw2
	h8GixQVx/b49Kl1WQxUJ3A09nEV9sj14KyZ9B9z4wrvcnu9LxQxvTxNNYY0Eq3sd
	KeImGA+hn57ADT1rMV8iTaGMQS9TGbfg4g3Y5Z+hCcj51rOOU4zZsRbg+yhlm8CT
	vmO67UQKqVcxMkWtTLh+2Ci62t5GK0fyr++edIQpdKE4B0XpriK7UG57mtx5V7GL
	6hhPc6ejBBWz3cf/SY1yPmMMH2jjtPJJCkd0kenLjp5OCg6tM6NKqq5Qyjb2L7BO
	3KPF+GlUTEgrQbqpchOk46JzjtTT5135GGKy8irKxqJQVsoxtZsETw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 43h7akdnhb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 20:46:40 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Thu, 19 Dec
 2024 02:46:39 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Thu, 19 Dec 2024 02:46:39 +0000
Received: from paulha.crystal.cirrus.com (paulha.ad.cirrus.com [141.131.145.123])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id C9EFD820248;
	Thu, 19 Dec 2024 02:46:37 +0000 (UTC)
From: Paul Handrigan <paulha@opensource.cirrus.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>
CC: <patches@opensource.cirrus.com>,
        Paul Handrigan
	<paulha@opensource.cirrus.com>
Subject: [PATCH v2 0/2] Cirrus Logic CS2600 clock device
Date: Wed, 18 Dec 2024 20:46:29 -0600
Message-ID: <20241219024631.3145377-1-paulha@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: QEjfjnd9woblstXXaESGe2ny_r5wvN95
X-Proofpoint-ORIG-GUID: QEjfjnd9woblstXXaESGe2ny_r5wvN95
X-Proofpoint-Spam-Reason: safe

This patch set provides Common Clock Framework support for the latest
Cirrus Logic clocking device, the CS2600.

This device has two input clocks and three output clocks.  One of the
input clocks, the REFCLK, can be a constant reference clock input, a
crystal reference input, or not available and use the internal clock.
The second input is the CLK_IN digital clock input.

The three clock outputs are CLK_OUT, BCLK_OUT, and FSYNC_OUT.

v2 changes:
- Remove | from after "discription" in DT binding.
- Remove discription from "clocks" in DT binding. 
- Change ref_clk to xti
- Clarify auxiliary clock pin
- Change DT example to not have "reg" for the bus
- Change DT example to change i2c@0 to i2c
- Remove "OUTPUT" from the clock ouputs in the dt binding include file.
- Remove AUX_OUT defines
- Use do_div when dividing u64 by a u32
- Include the dt bindings include file
- Use the includes from the dt bindings include file aux output.
- Move of_device_id and i2c_device_id tables next to i2c_driver struct.


Paul Handrigan (2):
  dt-binding: clock: cs2600: Add support for the CS2600
  clk: cs2600: Add Fractional-N clock driver

 .../bindings/clock/cirrus,cs2600.yaml         |   81 ++
 drivers/clk/Kconfig                           |    9 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/clk-cs2600.c                      | 1158 +++++++++++++++++
 drivers/clk/clk-cs2600.h                      |  173 +++
 include/dt-bindings/clock/cirrus,cs2600.h     |   24 +
 6 files changed, 1446 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml
 create mode 100644 drivers/clk/clk-cs2600.c
 create mode 100644 drivers/clk/clk-cs2600.h
 create mode 100644 include/dt-bindings/clock/cirrus,cs2600.h

-- 
2.34.1

