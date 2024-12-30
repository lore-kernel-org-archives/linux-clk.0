Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B8718A6A9;
	Mon, 30 Dec 2024 22:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735596789; cv=none; b=hiJftrlGMduI0bb463R2BDrUuqTIe+cfkaF2cjbrhOLIzVDNmv2GjK8pI6PEN22t30c640k5vvQ7lO0kT3dVH2UpjOetmoYjWSoCXTTc8pUDmLrDS/rODKEW3ngcPUmUFclWCZ42pzsZmvzBn/pItE8PuW76PAZHdgA4aObAhEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735596789; c=relaxed/simple;
	bh=ImqFqnAeyLa1KMzB+h1qlpbhFbskkaUEg4JAlpjCKT8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tzYwxxKcS9u1jKmYZN1h94IHZYZnYO5/NMKGzNYaKHEU14/gdKW1KB/KBzdDXR+7ZAiSfD7+jg71pz3b4+Knt7T5nftjk+2pwsPpXQp3/TjDlxKqEx9WWDwZThZaXxLTN+fOg5oqy4I7Szs/+myztcxOhmUURVDxVeIoWmM1fk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=l/cA2Eos; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="l/cA2Eos"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BUM2jtq021623;
	Mon, 30 Dec 2024 16:12:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=VIsLp/AR6UosPP0g
	+lq0c71dGWHpBDHQ7ASpPGtIpT8=; b=l/cA2Eosm6H2YyLGXx8SZzw++Lg+NFvz
	tqM/xEynvNtAaoK7jSWLOS3yMEPmwX3eDMVTz1AsrOM5AINVfO3E+HTnlVFg1Hqn
	dqUE3SYYXLRLZtSVTMj87Hq6/yqzLm/AIiM60zyEeeqhAjJcJQlnm8XrbvKN9RFl
	BvueZVWBLdyQwzyj18PIAeiy/ZgO85MIoywBIeBUsLnxf+cL86x0PzYMydhQ/tev
	rv9HA+M01BECn4c61srBVmIM3854d4z0FwcNcpKCWua3cxWxOdlHZwLQVl3ToDQs
	X6eOv6bQQV0jTOzIimrmiLiaP8Ieo2UPI44PavfrxgyHRh8CGgrxFw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 43temk26vp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Dec 2024 16:12:52 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Mon, 30 Dec
 2024 22:12:50 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Mon, 30 Dec 2024 22:12:50 +0000
Received: from paulha.crystal.cirrus.com (paulha.ad.cirrus.com [141.131.145.123])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 12FEC820247;
	Mon, 30 Dec 2024 22:12:48 +0000 (UTC)
From: Paul Handrigan <paulha@opensource.cirrus.com>
To: <linux-clk@vger.kernel.org>, <sboyd@kernel.org>, <mturquette@baylibre.com>,
        <devicetree@vger.kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>,
        <conor+dt@kernel.org>
CC: <patches@opensource.cirrus.com>,
        Paul Handrigan
	<paulha@opensource.cirrus.com>
Subject: [PATCH v4 0/2] Cirrus Logic CS2600 clock device
Date: Mon, 30 Dec 2024 16:12:44 -0600
Message-ID: <20241230221246.3927158-1-paulha@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 5_P0wAWx1bzOGuQEPTWPJ530FcajKi4_
X-Proofpoint-ORIG-GUID: 5_P0wAWx1bzOGuQEPTWPJ530FcajKi4_
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

v4 changes:
- Change DT discription to add more detial.
- Move reg property to keep consistant with the required list.
- Add enum to string DT inputs and change the input values to lower case.
- Change unevauatedProperties to additionalProperties
- Reove black line.

Paul Handrigan (2):
  dt-binding: clock: cs2600: Add support for the CS2600
  clk: cs2600: Add Fractional-N clock driver

 .../bindings/clock/cirrus,cs2600.yaml         |   89 ++
 drivers/clk/Kconfig                           |    9 +
 drivers/clk/Makefile                          |    2 +
 drivers/clk/clk-cs2600.c                      | 1177 +++++++++++++++++
 drivers/clk/clk-cs2600.h                      |  173 +++
 5 files changed, 1450 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml
 create mode 100644 drivers/clk/clk-cs2600.c
 create mode 100644 drivers/clk/clk-cs2600.h

-- 
2.34.1

