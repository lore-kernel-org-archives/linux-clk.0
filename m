Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0907612CDAE;
	Fri, 27 Dec 2024 22:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735339783; cv=none; b=uMRXccR4z7VwujHTJKDRsYwDYQ/4vfbkaXOYZEJxbGD1HDCiFaqkP5cxbpoJvqzEZhqadXu9bAOiqv6A08EC3ERwGjZYZqs0DLpQhWcqWDkqj1Y0Ti33rwJU6QJ60Mji7Sw6kAXlG1/0r5L9dSAewnJoslV//K/T+GURk7N2csk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735339783; c=relaxed/simple;
	bh=qlHPkCaJELMbNWUpcfIlNXWV1nfX+Y37d2bQPsr9C+M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BuEpyWbYET+2SM36w8TvTcjTCm1wWXlHIiPsZxLCk0iTncHwxxN2W5gB0wmyJNwcc7rdv3hVMqvDuw9y9ZK69W+lQ7mPpuaG/qYKHw4YdAQOgm7xW0fhxcX9svGxcNoeN81K8XmIlqmpIWljhIa6py6X1A2MQciwncp+cLm6wM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=kGg3lWk1; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="kGg3lWk1"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BRMMAuT019525;
	Fri, 27 Dec 2024 16:49:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=FVa4ZWEyrX8PiJz7
	DT5X3WWKUQFX1yTH2mjZD7aqmY0=; b=kGg3lWk1cytWHfhqxgApnvGLxXFbLbGX
	19Wev9J0KdQqFYn8cu0Q9+TFnKZPT7GzfzagTj5nW59lGkXCKdKlBT9eZByDRRnb
	16VPp1R7Pz+FFo8+BedS1XMiH3+2whUv5BfLnv1CSstFOBh7MVF+u1zeCPYg6HRP
	/ecGkYwLIyPNrJVJa/K7xucFNUEMBp7RDpZR1nYII+tggGsG0+5gBtPq3uHAqUV2
	Lg8E0nVsOwyT6XbvMstX4QEjh+V2WpSI796fwOOE+pzXHrJ2egU41eLyjUBLKmW6
	Th7J6uv+jgvuPwxTOPF6w49gWRtvfWtTGCA7UvO6g+Q6jy+3zpJAcQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 43nuy26kss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Dec 2024 16:49:26 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Fri, 27 Dec
 2024 22:49:23 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Fri, 27 Dec 2024 22:49:23 +0000
Received: from paulha.crystal.cirrus.com (paulha.ad.cirrus.com [141.131.145.123])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 74E6B820247;
	Fri, 27 Dec 2024 22:49:22 +0000 (UTC)
From: Paul Handrigan <paulha@opensource.cirrus.com>
To: <linux-clk@vger.kernel.org>, <sboyd@kernel.org>, <mturquette@baylibre.com>,
        <devicetree@vger.kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>,
        <conor+dt@kernel.org>
CC: <patches@opensource.cirrus.com>,
        Paul Handrigan
	<paulha@opensource.cirrus.com>
Subject: [PATCH v3 0/2] Cirrus Logic CS2600 clock device
Date: Fri, 27 Dec 2024 16:49:13 -0600
Message-ID: <20241227224915.3813253-1-paulha@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: CBz2GdrTzBhfNQ9mYWUi7UWwqo_ncke_
X-Proofpoint-ORIG-GUID: CBz2GdrTzBhfNQ9mYWUi7UWwqo_ncke_
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


v3 changes:
- Changed clock-names in device tree to an emum since the both clocks
  are not always required.
- Changed cirrus,aux-output-source to a string input.
- Added cirrus,clock-mode as a string input.
- Fixed ordering in DT example.
- Removed dt-bindings .h file.
- Add in_range to allow for acceptable ranges for clock rates.


Paul Handrigan (2):
  dt-binding: clock: cs2600: Add support for the CS2600
  clk: cs2600: Add Fractional-N clock driver

 .../bindings/clock/cirrus,cs2600.yaml         |   89 ++
 drivers/clk/Kconfig                           |    9 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/clk-cs2600.c                      | 1177 +++++++++++++++++
 drivers/clk/clk-cs2600.h                      |  173 +++
 5 files changed, 1449 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml
 create mode 100644 drivers/clk/clk-cs2600.c
 create mode 100644 drivers/clk/clk-cs2600.h

-- 
2.34.1

