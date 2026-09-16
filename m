Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011030.outbound.protection.outlook.com [40.107.74.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF70485CE7;
	Wed, 16 Sep 2026 11:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789558643; cv=fail; b=FJtz+bdSiAx/psByhcDw9DPvRotw7AtKw7Lkr1cGpaEd+vX1FR7ygSd0zbmiJehqdp0ttmCAYbff4Kd5lZ5izLCsEsc+Gn1FY0C7OQnD0p2CbFbepkwrtNv8WJJqcX1Bg5uxPLI2NZ+Ci/FkItXnoEEv/qYIH24gvq42Mc5Uwzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789558643; c=relaxed/simple;
	bh=NB5CeRLEjs8wuqi3BiHIJtqIwm5sgLuBxpbObxqHvNo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SUHihmeSGPpZ6BzmH+cBWg9mkrX9MjSbNr1ioL5VCtrg2xevvQVuyQdZwkGFFXRXIwc09WG4/LzN7lJUDK+dHZ5Zu4pSH/DY5smb5qy+0OFX/1INmFQUoZSdX2IdUy9CyKc2xh78wBU39lyW1HI8n25hgILg8X1du3SDlUoGKpA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=VpxkpRl/; arc=fail smtp.client-ip=40.107.74.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="VpxkpRl/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H3dgjLEF3qSbzTu0FfOC9nhHNkSKz/OESzMFlMGkBI7guEkyNdmJoGf+sbsuQMHHwx+SGxH4/vd95vpKe6yOoySROWkkJxbqO6Kq+eGvfL2aivrIalnaX6y06DjtVx4L8R2DEKvGS4EcasT1PIZEAnpaL/2q1bZpaQI/lMb3VSO3zCjBntDPdrdztAOcRzU9YCLG1nBBUSbccWK2DYzrN6uixCQei4TroTWLGHM65I1zkyJNyBp7I4bmLv5pQFVxQWB6+ZGOujfvO4bx9wir5M+FG9RRMj2hohPRiIcN/Unqgr4I56R7mU+n+vCBtklGphZosH/l5w1YmOxLkMJXrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wawPGXmY7GS6HqtjHuTpmERU0a7vLBDhUObVQDhsT8E=;
 b=SZVBM2Fithrv64JphBD+Xbt5ib8oBALyJiIbJWW/5ylByEEQuL3WV+T7V56R4fq1jJxwgfv828d3Xv3N7IYwrmDnskGH3/Exr45S+4253eOC1hEZo/kDRnNenj4+6q9lwEPJc3WnZdM+f5whVhJfOT6Dc1rLQW5Tmj/TwSWwarYw8UUlt49BRqxIrjPJukLpssUmmMIaPRsrzfcI+cO7QTBLuNA76KHJzCBwU4vp6UwvbAp5KxQnn0xVj9oN4Yowpae3uw4t2kz7dk9A7IcVok9LCEhxNE3nyh15sbpfzM1wg0gX0BeQMIpWyGwwqIcwUbAD6NCprMnehgdZEn4Sfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=baylibre.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wawPGXmY7GS6HqtjHuTpmERU0a7vLBDhUObVQDhsT8E=;
 b=VpxkpRl/u5mGDJW8Bz8j2nbcaN+E3MxqNYAlrPmOdWMbGDTg3quaehfIVHZMfoLOnhqhbf22CKWih4h2DKxa4YAbPkthEfSGXJEL66olSmBXlpUwGZ/Jpbchodqd40nPDwZ6HUbahsfYzRHXz+gTNfXQ09uj/yCQF4zoadGwz8I=
Received: from OS7PR01CA0107.jpnprd01.prod.outlook.com (2603:1096:604:258::9)
 by OS3PR01MB10091.jpnprd01.prod.outlook.com (2603:1096:604:1e5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.13; Wed, 16 Sep
 2026 11:37:02 +0000
Received: from OS1PEPF0000D213.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:258:cafe::6e) by OS7PR01CA0107.outlook.office365.com
 (2603:1096:604:258::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Wed,
 16 Sep 2026 11:37:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 OS1PEPF0000D213.mail.protection.outlook.com (10.167.240.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Wed, 16 Sep 2026 11:37:01 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.205])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 971773000442;
	Wed, 16 Sep 2026 20:36:57 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: geert+renesas@glider.be,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	biju.das.jz@bp.renesas.com,
	p.zabel@pengutronix.de,
	niklas.soderlund+renesas@ragnatech.se
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: [PATCH 0/3] clk: renesas: Add missing of_genpd_del_provider() calls
Date: Wed, 16 Sep 2026 11:36:34 +0000
Message-ID: <20260916113637.86947-1-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS1PEPF0000D213:EE_|OS3PR01MB10091:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 74fa516a-2fd8-422e-e505-08df13e6d329
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|23010399003|1800799024|13003099007|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	V2AqsNkoQx+KvKVGeJgDGNmEPsQ9EiI+m8Ej5y3ra/z/k9BHPB0GpuTM+atETjsv4p6g1tO7Ul62aqmwKCrEa1SvHc+m2YfkefuW0jcVzc0D/uayu7tPKx3SfPN8TIU/Mlu+K9c75NWqJwC/LF2jWPyXdmlRlDSvQHjbJg7+mgPAlSED2jbRYZ3zsUyFDCJ13YcBRQ2ZLEtvkDBYdiZdCq/PNsfWHgMSH0S0mySBnBlfpReh2cpaptoNdjZUZOXYw4oHwMVANHj1IpKSSdtkRSlAPXjftYlqXwub3mTKvVwB5cQM1HtmUwTIAIOUmX3U0Ygm+mHLpkqN/COPkIXrjgkQX6en1Acr6z8SlXhBYLBioVwCPX8ColwSaTTWEZPpztmp2V81ZMPmSSBSWwq5K4kTXVRUDCp2Sh1fUZ71QBXrhcf3UnSYbhbGnqP83uPgmAjx9OPppDtNKMM4YRf0u6jvnCp9Y2jWTsetHeC/NuJy1+hmUtSfOciWCRjbuwMRlWdAVmyRnFE6Gja1IzzOyUAasASV9ZLFZ2+zl/oPDpww8tTNjZe521jSKl37siW//IPkFKGgkQGn5sOvj/WLBRTrl/djKUWdnEWq+1maR0h0i2RFyHvBBPKKbHBuvm9LGe44xWOvmgPS0OMbVeVoxA7SPzIzwZUB5GLgXct8LSxSY6LuNHM9n3CWvIj1jlPM65Q23/lifvbIZqhfP2ke5A==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(23010399003)(1800799024)(13003099007)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pfavnA4E96FUXGe7DjIgIyqwIrowAfk+8vtDOG7HqIA3uaT9t60SdxxEh7/ByTu1Q245Zj2hn+gXajNTbmukhcTZCQMFcHivcyW+HIDtWq6goSuJD1vuGtVFHb0KJv754M/ALE8cy42MrqKCqwLvG+g8rOCt/ypeSfKWccsKD5ELXI1KavaZ05EtYiGFcsx69/neKTtD+DRBy5WP+sMfIQxNYlgCT+vRBnH945bdmRBYw/Zi2BtXpEINfTYx65jsP6lZVWiVZWH3Wk0+smKdJ3hgE86OSab++KON3ruI4pdq1PWtWQy8ZhAsBPLzBGJSc0s4oevJnFAL3+qV2XJ83OGMFMen1MVNQW/qBk/fBri1JINONcgGBoNNsS5JlcuGEpXo97rcjZOq5lPaHPI7/VYEIKRuo9jmUmmoaeplEMQYz+5LDbdiEd/7t+UvmYGf
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 11:37:01.5411
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74fa516a-2fd8-422e-e505-08df13e6d329
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS1PEPF0000D213.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10091

Sashiko reported that the RZ/V2H CPG driver registers a PM domain provider
but doesn't remove it on probe failure:
https://lore.kernel.org/all/20260902110443.959CD1F00A3A@smtp.kernel.org/

The RZ/G2L and the CPG/MSSR drivers have the same issue. Add the missing
of_genpd_del_provider() calls to all of them.

Ovidiu Panait (3):
  clk: renesas: rzv2h: Add missing of_genpd_del_provider() call
  clk: renesas: rzg2l: Add missing of_genpd_del_provider() call
  clk: renesas: cpg-mssr: Add missing of_genpd_del_provider() call

 drivers/clk/renesas/renesas-cpg-mssr.c | 17 +++++++++++------
 drivers/clk/renesas/rzg2l-cpg.c        | 13 +++++++++----
 drivers/clk/renesas/rzv2h-cpg.c        | 13 +++++++++----
 3 files changed, 29 insertions(+), 14 deletions(-)

-- 
2.34.1

