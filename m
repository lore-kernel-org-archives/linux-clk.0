Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795492584;
	b=q9up3ts5nC6yJQMDyYEvWmcABnu6RYz9uiGM1D0bjdwXPGwW4SOBAAHg+ahQZ8JuUSal
	 Xf0DjdSD7AYEryrVvrzEo4XIt2hk+TbsZRr3fBhWpJZUenk4N2scfq44L+eU4Btgoi6kk
	 J72ZdISvoeqJ6IgelYTMPyE4CNc3v86AI69AsIQD4APUC+nrrvfjKK2dTh4OPmloF5OES
	 uK7WIJ8RTYmekTpZLLtdC9VibcSqV5zoc4cJ76l3njT3mbagFUwRraRa0RzNm5pZsvSis
	 rhJ9dD2/VFoIEPK2DBdWQFq4/cNx+SCH5UaVvc837axqG01GRzpSywSVTtfkY7jwyyw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795492584;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=+YdvZbzJrs6MnFfqfxi0CDVj0ByOt2FocnTvLTVd/bU=;
	b=fCnfm87kp3O0uJrj7rtdCOuK4coQOVqu+La2XsHOXOZSZVw38Y5thhK3PdOnpVuCyFAY
	 9MtnF+e0vZdI17O0L+99wG0e96NW4vJe/tlIwqSdCkuSnEzLveGl3CbXaqe9vfokhE511
	 uSum5/bvf6T5mTJrqd7k/EM/oxqkBWAqBDrEyPjqSF0kC4h3OrExw+ZfFjvWcB7KoRUrt
	 4MvF8N54M4C71izCJoH0HPk0KjvUsSYxyY/2dXYBy+DbLIK+nyVc2KRSBH9ldmCzS3LtV
	 56vAIoAw0BH/IkIlnJDQU1vd+yYqhD03L4ftPByu9VXItu0CcBm0nRD5Jr2309aYMsw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=y2rftIsW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.44
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010044.outbound.protection.outlook.com [40.93.198.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82771606A31E;
	Tue, 24 Nov 2026 03:56:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82771606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=y2rftIsW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IuB+nKPnBG/g+S49hqV9bsQ3JPy8qtPbhA6L97p+RhFNvD8/ngL4cMULqBl/EFpkzI7jMATempuIoTL+gjhTWFS1a+pZRs4Km9jfeqLqUtQ49sUlV0LpSnNOWSQwPj/RVJuExHv4cqPlfWwGR1expr9a7NLree6luF2Y/HsxFAvBxpNZFZoQVJ+Zaezb0naYiHDjbBWflCs6EbhZXyH6UsyaRW5TmzjMly3ZjQ6ZzT5d718GHRbuUzJykJHIZoBBjAieErnC1hcFdfqZbVQnpnoCAlH3SAPLqEhrnudcruiubyIP01SzqOPDe/hpnEkb+PeaRrN9EzohEyuzUBzk1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+YdvZbzJrs6MnFfqfxi0CDVj0ByOt2FocnTvLTVd/bU=;
 b=IZMxN4QORMpChUjEbgAuqjmlcCZECUAM6L7KB5s5zBivjS9cESc4kNFKhY3y90dSlRQxQmov2+IfzDKnG1+hzViswROtg2PGauG92AUFLElfc6P0Nu4PizmdgFh0N2v+y9Fv12t0oYX0avaRA6uNzyuJMJtmJ3pdhohX4pWKA4xhMW8tP99y5a+2oKE6oJV7X6LN8BoUvtwXh1yQZox64owwyMv5sbldY50F58usmACFq8nx/xl9p1/pYMaM2uYJ8M7rfsmhww6dfLpzr5BhSU2x/i+bV6dMo9wjzLClLkThn/JMB/OxLYaRm93NZn3eFq+6rThjsnaEyJk/ck4KBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+YdvZbzJrs6MnFfqfxi0CDVj0ByOt2FocnTvLTVd/bU=;
 b=y2rftIsWXNCKj1hV+tVOTesMKu/VHWDXRyxhUjHL2T22R++1kdh6Q5W1B/yFlgBAPuqffwLchnLvlHLfofMrHJjvuCm92zLs4XrGJbRYyidu1LLYyqzanin6X23Y9NpPyIr9SgIteLwM9pbdodkAwP0HQNzRuNizSaV0mHKCdpM=
Received: from DS7PR03CA0310.namprd03.prod.outlook.com (2603:10b6:8:2b::9) by
 CH3PR12MB8972.namprd12.prod.outlook.com (2603:10b6:610:169::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Tue, 24 Nov
 2026 03:56:19 +0000
Received: from DS8PEPF000000DE.namprd05.prod.outlook.com
 (2603:10b6:8:2b:cafe::3d) by DS7PR03CA0310.outlook.office365.com
 (2603:10b6:8:2b::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Tue,
 24 Nov 2026 03:56:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS8PEPF000000DE.mail.protection.outlook.com (10.167.23.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 03:56:18 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 21:56:18 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 21:56:17 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Mon, 23 Nov 2026 21:56:14 -0600
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, "Shubhrajyoti
 Datta" <shubhrajyoti.datta@amd.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v4 0/8] clk: clocking-wizard: Add static-config clock provider support
Date: Tue, 24 Nov 2026 09:25:45 +0530
Message-ID: <20261124035613.1968260-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.44.4
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS8PEPF000000DE:EE_|CH3PR12MB8972:EE_
X-MS-Office365-Filtering-Correlation-Id: ce80915f-8c3c-47c8-7c3e-08df49dee53c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|1800799024|36860700016|7416014|18002099003|261009223027099003|3023799007|5023799004|261021123027099003|56012099006|261102123227099003|261026121527099003|261021121427099003|261026140227099003|261022075727099003|261022105027099003|11063799006|261028144727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	nVGkH73XiFMIBaOODGPF/+Hzgpq2H5BTySJ87cuCsrF3ZmazwSwdsJLO8g+94dIILGZjZLkUw9m+y9IVUiza/o9RHzeRp/wyAuGsLbOPgVSBVBfPLfWNjiHpIM+QdIWTqRcfX2OeTJeodgCmbLyy7C45VAo3SZISeyqlZfgzg66q8e6NrPpTy8Zxyzp/m78kh4y4fnCyHlYpOkbfcfzHcNAk/tgT8wgEP4er3o8QlkVV7tCN43Ut2MG6JJpgn+DBg2z4+IxVIQ2ZNIyX2+/M4KS771yvcXFR/tZh7KvtoL4oEp2OW07MK/LjnDxuVg/2vqg6A4+DTV6CUF/0fJAdPIWa70PxRDY16hy0PTI0DzblF5RdEOARe+cWXPDaJal+BKeWLPnFaDotzkLHWwVe4JJUI1pixWptjs96GtOSbqe4zpgGNCTUu881nWQT+AAL23RwEC6QUbOf8ZKBJLyWSfO3tR3xlLmqv8TmXNZwMbPPh5WpvdD2bxfwp+61mH3L58InVKJDD4sZVCr4BHfrKrDxaiN7R8aII5RN9ho7fX+HydiTsakNy7CFZjv/7nz4Q7fzeQ2L60Oi8ylPRcS2mWPN5tBOU3tavnFmAKJXOXJ8sdVMp9pL2NmK5c+raRS66gYqXA9qXLPggsRZRyktGe6j25bFYfJS1V2V0t/29fCtzC+cV1p6iOAOY3pQvhPhKcFgzrDrzoCEDpEFie7oYw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(1800799024)(36860700016)(7416014)(18002099003)(261009223027099003)(3023799007)(5023799004)(261021123027099003)(56012099006)(261102123227099003)(261026121527099003)(261021121427099003)(261026140227099003)(261022075727099003)(261022105027099003)(11063799006)(261028144727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8S0LB1dK5qhw/IiHDmj/gA/RNpVR/jXkXQKVYxopy6JdfvfYRa0mDvcCaOU6Adp0XI20AjUDLZGKBrbAwFYXnfRHlrbaq+xrLCUBzgz56hzqKu6FQyrFPqJy5zNOAlShDJjJ21AiDBt8KcBbS3kFnQDEFU+5zNaMgQqUoKmIbRuJgm2zu4aQZ0+M3rydzklEnTWPev9h6D3xjKAHBBJd3XHZMNTcz3wHWVCN8lnX/bhsdDZDPSeWXI+bLcIWQJRI1v+bbZ76ottP7LW8Nh7UCVBGTvW5y4ajGFgoALHA5WU9tc5p1O7tts5ZLv/eXCuGvkzh3oG/Pu2S8G6UKNufwJzlRNHeeKlyqWEpGaYp/cEQBOlbJPPHLwLmcqA3a1xJyqkOrc9zBBrx8QFnqeH0YkeP5jF+GUqysAOdGX3rr3yLwNqmNq1okVxql53xqktL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 03:56:18.6812
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce80915f-8c3c-47c8-7c3e-08df49dee53c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS8PEPF000000DE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8972


The Xilinx clocking-wizard IP can be used in a static-config mode
 where the hardware is pre-programmed at boot and no dynamic register
 access is required. In that case the driver should skip ioremap,
 read the fixed multiplier/divisor pairs from the device tree, and
 register fixed-factor clocks derived from clk_in1.

 This series:
   - adds the xlnx,clk-mul-div binding to carry mul/div pairs
   - makes the reg property optional for static-config nodes
   - skips ioremap when xlnx,static-config is present
   - moves clk_in1 acquisition before the static-config check so it
     is available in both code paths
   - registers fixed-factor output clocks in static-config mode

Changes in v4:
Rebased

Changes in v3:
- Added Reviewed-by tag from Rob Herring (carried from v2)
- Squashed the three separate v1 dt-bindings patches (clk-mul-div
  property, reg optional, s_axi_aclk optional) into this single patch,
  per Conor Dooley's review comment on v1 patch 3/8
- Removed duplicated number-of-outputs handling
- New patch
- New patch: split the shared notifier_block into per-clock callbacks
  to avoid corrupting the notifier chains

Changes in v2:
- Acquire clk_in1 even on the static-config path, instead of only when
  the dynamic-reconfig registers are used

Shubhrajyoti Datta (8):
  dt-bindings: clock: clocking-wizard: Add static-config mode support
  clk: clocking-wizard: Do not map the memory for static-config
  clk: clocking-wizard: Move clk_in1 acquisition before static-config
    check
  clk: clocking-wizard: Add static-config clock provider support
  clk: clocking-wizard: Skip s_axi_aclk for static-config
  clk: clocking-wizard: Use dev_err_probe() when mapping registers
  clk: clocking-wizard: Fix division by zero and unbounded register
    write
  clk: clocking-wizard: Use separate notifier_block for each clock

 .../bindings/clock/xlnx,clocking-wizard.yaml  |  51 +++-
 drivers/clk/xilinx/clk-xlnx-clock-wizard.c    | 229 +++++++++++++++---
 2 files changed, 245 insertions(+), 35 deletions(-)

-- 
2.34.1

