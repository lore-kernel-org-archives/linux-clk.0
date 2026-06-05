Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023079.outbound.protection.outlook.com [40.107.44.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F97D3EEAF7;
	Fri,  5 Jun 2026 03:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780629830; cv=fail; b=k5Ya/XkBcq2Mspy0LQkdEP1rzZdcxaRBwn+xL/el8sZigl798h/IL8ZI2KomxwNYsUsUnR4p4BFD3Cdug4c72a+XHTT2UY1iLGn6awlEcNiwRB5dVjbcbJAo1wOaycb7afvSSW629w2zLVZL9ARC45GbWIut05dNeLYYlsfCQns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780629830; c=relaxed/simple;
	bh=M53gkhkGvLFTrbELzk1JNDjuYeBrXMXqaD7UijbZAn0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Usp+6uZzUGGwdELThTCAXJJclRmoq5ppoDET7Q26wts6wkLQIgnaPVuQhRj8IngEHcntRgXHUVFNswv+Dq+k5lVxihctXtgUpKv5tWoDtQzGR3YINNIjJOy0kplWc5PCfXv3J+k7tDlEHnVUqv4THfcYIgKC3eSbkMqaHAsrJ4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i7G67/FS7tFpgUoUwxjhhRhmI/0eE9uADOcyg3ce/73FDcCCL527fjP3xUbrB2F/05LeQ4rnYywn3A7m80Lo/M47BDRUdpUHgnjrH77zlU2iLudcpbJpJFYuNyFbn6LVReyBIvTL8sLVr6vvijs6EIfvWNTEJzbAWTfv5vl1O7jJ3BaDmjTm4ycEM9pmy/jblnVWWqr76bTQ5t8TJ5ACuqKw/zUfHgiA3HXGMhnGwyge4LX4/6PCnd6XfpU5gYK9TyI3rIp+KBDpXBMVguul7eUgceQV/l03uXJ/5ch2ChrByM6hSJbqDaAD9M0XlXdUNtw/v7bxTsZ/4QZxZVUUVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xf4vnI+BM8hlNUC/0YKv07dQhqAmJiiFgvzGQJ6PuUQ=;
 b=MbhJgSwYpenuMTbzTP8KojIfkuTlkHD6y4lImeX+KDNpnTfST3cBFDHDaSmF/UusvBCrKw30YJAlnF27OjQJBvrffLhH2leWbnXSplBt2mQZE1S9iJN03bkIuPwW9VaIjG3oXOyBPujnftze2oZDsUdDJZGd+lvsLBNRKgCg38lf/i/NzAqHkz/SjXRKoM8CLGfAgrP6MgeIRonZaEI4L4XIDc9E+MmjX42a5vhLyZovtHyCVjpSkHMn7G28W/1NZR5Gqbai9uoZsfrfm6fPnwXB7fI/zrHD6HK6QhdZf8dH4kkrFW/IUExTTTqjklGe76zOqsjxK4BikYT/JAOWZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0005.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::23) by SI2PR06MB5170.apcprd06.prod.outlook.com
 (2603:1096:4:1bd::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 03:23:40 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:4:191:cafe::a7) by SI2PR01CA0005.outlook.office365.com
 (2603:1096:4:191::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Fri, 5
 Jun 2026 03:23:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 5 Jun 2026 03:23:39 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 7E9FC408426D;
	Fri,  5 Jun 2026 11:23:37 +0800 (CST)
From: joakim.zhang@cixtech.com
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	bmasney@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	gary.yang@cixtech.com
Cc: cix-kernel-upstream@cixtech.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH v2 0/5] Add Cix Sky1 AUDSS clock and reset support
Date: Fri,  5 Jun 2026 11:22:20 +0800
Message-ID: <20260605032225.523669-1-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|SI2PR06MB5170:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 598dd0d8-5e11-4c22-a734-08dec2b1d6aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|36860700016|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	JmMJrxqQFmPuR3vYtShjjtUqt+mH+DTPdUkNxelM42MDalKYq0nPzBJBVxrRdGL6nKSgDZpfmCiGg3GNlM2N0TsfOIJMY0zJ6JaejuQ5xM+y+nA3arRtfU5NLf/F2Q7aZ06vIAnvStcdsYW3GdrvugJDXGpLl/zndNgk2yVYdlEGzWkxwc3Jk8qzDhyY1T1KtkqQz0xk0jhmzAQR7qwf/h+cx0kW7wARctegCriDxDUJgAST8IOCnFWjA92dNGksznI/qmlE3ronrUhWKvX+8zBnCJgDK3pWPQ7Kah1IMhSj4DEchWJ/eY/rOTUvOLSIgjcSe/FmXbbuk/1SlFRKjCZ716PkoPwHss9IPgmM7bIC6HLGsIljBZ6n7Wy0Mb7Bg0ni6n10IwpGRo4yMg96plReFHB51lcCrc5q+wbpBc6QjvJ1K6jJTFW75+RqJIzkubqWYapfkSAsiIbmh5TGkPqXzMgz3EwAt+652MdM2urDM2RSKPSru+Jv36dvpw1FEhgGxcgwtK7715IaAdBT3Gc10ABRU2YiZQy8YqARYXmGqTS/cJX5RN1Cve2Vdyzb1kEviXmBlA/3/ifC4neE8xRy1lF9BFOnMeWcg5+s8R5cgXhiPLIotlADWL/wSfqQq+qehVgZpoaHLrGuFF3nvbHs22b3aLgLMllmFtqPdZ/04auidAzSyieL3TWQE3yDMm6Ygt5v8ZpAOu0pJg9v6V1zajGNbM0nThzHCSSw/Ig=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700016)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bsh69wu+y+PIV5dTKOCIqETUkN1tXoqtvibvZinSiVHFpVZ9sXCDVjrDtdUqo8595Kx/X5JmA8I4tYQkg6gl8ONjo4CmfTSNEu6p8GdLrH/DuNu3CLxU4AVfDXE9bvQKE12RKQxZ3u9HV7tomOS/6KEnN97UBTTbBpU0yC7LV5AZD5AY0J5jW/qKN67D9p69Px+ruS2tBMx8+ju1F2K3yct7g9Ns6w7zjyDti+oda07CkiTB1I2mlY5Rac7F2wVQRUcOodswnhF/4LUEYLHwf2pUfQvfPdECttmFTYXFAyBzVrgYoaNe30WSRm10cxLiNcgpThGCQGgz4gSG0bEqnnsaLvpWmpd7//G7gkZeBdTgnswqW59sj2mKT5xiWIKqHYpXSbm4LYMKOEL3KdA+nhEq12xEgZqvlnO047v35ODGHGx1WVHUVwju8olxN9v+
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 03:23:39.8012
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 598dd0d8-5e11-4c22-a734-08dec2b1d6aa
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5170

From: Joakim Zhang <joakim.zhang@cixtech.com>

This patch set adds the clock and reset support for AUDSS. The AUDSS groups
audio-related peripherals (HDA, I2S, DSP, DMA, mailboxes, watchdog, timer, etc.)
behind a single Clock and Reset Unit (CRU) register block.

I know the best approach would be to separate reset and clock into different
patches for review. However, here the relationship between them as parent
and child nodes is coupled, which makes it easier to understand and explain.
Therefore, they are sent for review in a single patch set, and the code is
based on the latest clk-next branch.

ChangeLogs:
v1->v2:
  * remove audss_rst device node since it doesn't has resource, and
    move to reset-sky1.c driver.
  * remove hda related which would be sent after this patch set accepted
  * soc componnet is okay by default from dtsi
  * fix for audss clk driver:
    * remove "comment "Clock options for Cixtech audss:""
    * add select MFD_SYSCON 
    * move lock and clk_data into struct sky1_audss_clks_priv
    * const char *name -> const char * const * name
    * remove CLK_GET_RATE_NOCACHE 
    * divicer -> divider
    * Reverse Christmas tree order
    * return reg ? 1 : 0; -> return !!reg;
    * return ERR_CAST(hw); -> return hw;
    * of_device_get_match_data(dev) -> device_get_match_data() 
    * add lock from runtime_suspend/resume
  * loop to more mailing lists

Joakim Zhang (5):
  dt-bindings: soc: cix,sky1-system-control: add audss system control
  reset: cix: add audss support to sky1 reset driver
  dt-bindings: clock: cix,sky1-audss-clock: add audss clock controller
  clk: cix: add sky1 audss clock controller
  arm64: dts: cix: sky1: add audss system control

 .../bindings/clock/cix,sky1-audss-clock.yaml  |   92 ++
 .../soc/cix/cix,sky1-system-control.yaml      |   39 +-
 arch/arm64/boot/dts/cix/sky1.dtsi             |   28 +
 drivers/clk/Kconfig                           |    1 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/cix/Kconfig                       |   16 +
 drivers/clk/cix/Makefile                      |    3 +
 drivers/clk/cix/clk-sky1-audss.c              | 1129 +++++++++++++++++
 drivers/reset/reset-sky1.c                    |   36 +-
 include/dt-bindings/clock/cix,sky1-audss.h    |   62 +
 .../reset/cix,sky1-audss-system-control.h     |   27 +
 11 files changed, 1427 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/cix,sky1-audss-clock.yaml
 create mode 100644 drivers/clk/cix/Kconfig
 create mode 100644 drivers/clk/cix/Makefile
 create mode 100644 drivers/clk/cix/clk-sky1-audss.c
 create mode 100644 include/dt-bindings/clock/cix,sky1-audss.h
 create mode 100644 include/dt-bindings/reset/cix,sky1-audss-system-control.h

-- 
2.50.1

