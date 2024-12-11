Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F274B65C;
	Wed, 11 Dec 2024 00:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733877180; cv=none; b=SMlSUXwCZUSYuCguqzRaEe+r4tEvukZRy1VyOYzD0xiDL18qFgyK0BKQpJtYCePDSvmeN9hnivIA/H3b/E51qMD2AKvLeuAA787zi/EqFy6AkjzfJhuV7d5+hqSxzcQ+cR9rA3oLYewN4imRFvdAdktigp4Fh+ywNRkOenC+N5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733877180; c=relaxed/simple;
	bh=9yYVZMNVBdNSUyhC6kASDVQ6VMxYiDkOkwUU5Y78yDc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PpOQsP+Ry10c/0/Mh/YMWpZ/2T5w6Jr+Ghnli8E6DDGodhshf7RoUeCVstLFpTrFmrr5y7snS01x8F6DkJZnWTzcOkeMJDb7UDOwyLQeS51oqdpMpY3LeXBDuy4OI5JKz9S7vpZuOIeA72yQlReRUJEWpLx2AgZxtuPIuKKy80U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=pW2Xwt8U; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="pW2Xwt8U"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BA6pe4E001359;
	Tue, 10 Dec 2024 18:32:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=hEEx+kkUoxYbwM/f
	EbVFHB1hmnVMaLBAaYLiE9rppmc=; b=pW2Xwt8UAgXkxd2Cz/xtxD2Fz61CwD8n
	RwYHxCokxbNcpcWfHSAUGA42/kTrwa1mWmS0TtdQBTK5uq6YC0hX+BR9YfWFYh4M
	sHCWBOhljg2ixq4D2C1XltH6H5sdUV8CwmdYUtI4btwYAeuZm2O+ifmmBKXMXV9n
	f8vWSNU+HJRygWIrcJvAVP3l7Smf39cOFTh6fDpP9IWcBvdqcbzvrz/wErwkxvM+
	AQVlTdkhAOZGH3Y5R6rdndrTVPL5urs3Ikn6poo5qhuuz1di/XO7w7HDGkyIaRpx
	YS28VopBUrQ5+SfKsB4jj9Mr5ukLGz207wMjtzo9A8eNtHRp8KvIjg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 43cmn248d4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 18:32:42 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Wed, 11 Dec
 2024 00:32:40 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Wed, 11 Dec 2024 00:32:40 +0000
Received: from paulha.crystal.cirrus.com (paulha.ad.cirrus.com [141.131.145.123])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 24D69822542;
	Wed, 11 Dec 2024 00:32:39 +0000 (UTC)
From: Paul Handrigan <paulha@opensource.cirrus.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>
CC: Paul Handrigan <paulha@opensource.cirrus.com>
Subject: [PATCH 0/2] Cirrus Logic CS2600 clock device
Date: Tue, 10 Dec 2024 18:32:34 -0600
Message-ID: <20241211003236.2523604-1-paulha@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: IZav4Ho1Vw_LjLX9Q5Vem441pRIpVdZL
X-Proofpoint-ORIG-GUID: IZav4Ho1Vw_LjLX9Q5Vem441pRIpVdZL
X-Proofpoint-Spam-Reason: safe

This patch set provides Common Clock Framework support for the latest
Cirrus Logic clocking device, the CS2600.

This device has two input clocks and three output clocks.  One of the
input clocks, the REFCLK, can be a constant reference clock input, a
crystal reference input, or not available and use the internal clock.
The second input is the CLK_IN digital clock input.

The three clock outputs are CLK_OUT, BCLK_OUT, and FSYNC_OUT.

Paul Handrigan (2):
  dt-binding: clock: cs2600: Add support for the CS2600
  clk: cs2600: Add Fractional-N clock driver

 .../bindings/clock/cirrus,cs2600.yaml         |   78 ++
 drivers/clk/Kconfig                           |    9 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/clk-cs2600.c                      | 1152 +++++++++++++++++
 drivers/clk/clk-cs2600.h                      |  176 +++
 include/dt-bindings/clock/cirrus,cs2600.h     |   23 +
 6 files changed, 1439 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml
 create mode 100644 drivers/clk/clk-cs2600.c
 create mode 100644 drivers/clk/clk-cs2600.h
 create mode 100644 include/dt-bindings/clock/cirrus,cs2600.h

-- 
2.34.1

