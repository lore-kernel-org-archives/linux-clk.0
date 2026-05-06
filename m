Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11021105.outbound.protection.outlook.com [52.101.57.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB90834750E;
	Wed,  6 May 2026 20:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778097969; cv=fail; b=GXT1nfP2hAe/iuPq6CIdrVpl5aw3VYKyemyMQfU0TwR4/dH1eJw8c4Ud28UWEoZfSKsRtbeDwBaG9UaDC6Ye9eS54ocPybM9Ock9vFdyIBSGq2ymrtNboIkMYk2PDNig/GOuDfDiVSoLgyGcjM/F18hJw0lQn82U7DGZVgJtqE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778097969; c=relaxed/simple;
	bh=HyjmlHV74VbeB17FIDNcgQQlH96dWv1JK6KKdltqj2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tl6ccO6KBaDzGuxHTTKtEzyhVWS93XAamVwPBRG10EuC4W7Ru9Ieo3fYH+CZBFrstJd/qIfOsWzlYaHhZ3DAZ2yq7Kyudi8T6XlDv0FUtVX0wYS67PLz1ye1ONAnCKx4bARv+TcFZ+v5v1aK4iZvV8WEQZlE93nhp5NH1AFo/jw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=in-advantage.com; spf=pass smtp.mailfrom=in-advantage.com; dkim=pass (1024-bit key) header.d=in-advantage.com header.i=@in-advantage.com header.b=KwiqV+7K; arc=fail smtp.client-ip=52.101.57.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=in-advantage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=in-advantage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=in-advantage.com header.i=@in-advantage.com header.b="KwiqV+7K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ebq/jYsTApT9hU03auFSYMhTD3+vtk0b6Ks41ZUulDACLiS3QinC2GnvmkqZiq/kVFZRC1fZiJLTI76RSUek2r7KwIGAf33YFInE97ECo29uJKe2ZxsxNmrSEFPrcHKIjE0c5jOjgQhUf5lgRYJk8AMir2RZmK5w6WbV06rvuXsa0/+IX6X4SCspnQ3gd4lv16CjG6UwM3EPgKfJHtgBZZ2HTyFYriykvM2OgSTZhJj2n+Xt02Y4PsfZh4U+1EcnBmSyXHykoBfspB1FRR7JQ47MOCgUFpPx1z2VcHsgldwJzNjX30Pgv9yhH/XuD68Oxqyg62hSbMmX0rtf7TBHcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aX/6571b/PF8rQfWkyUfOmsUm1JjNdrPprla0WtOnvw=;
 b=uWbGUfAsv11sinO4/1clAunK5+pJM2PhsMNf+1gnK3fWQKLdT0IHSYDGt7DAqhht6IEIsvOwmsyIB/yu3pi2z09pcENDwusN6w4jB1IsbC+b48SGPjjLARPgFbvlmhdFjgCE+AL+K4SGiCB0UjRgg/AD3+ZGViqTLMpSXfgeJoUG7IalShrH2nGondeu4ourfS1Tb7KYRiCOQj/Qf3KS92uBc6yg4ZsEpkSGgEebzlF95eanvtkwdIJx13WcUSxrfuOxRXhZEtGCBuCePzryTEIQoql0RhoVIcFR7nS/MwWcBz+gG/6+3gfEE57kfEutizRDKeQHE1awMW0ORxuRpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=in-advantage.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aX/6571b/PF8rQfWkyUfOmsUm1JjNdrPprla0WtOnvw=;
 b=KwiqV+7KjwupoyZMIY8xQ/xJYBeGka6FJplCu+Q951Q2xzwqm0aoz0bu8ZZEPBIbqs47oGFYu+TCwQT9Uzb4cqpYu5guoG5mhqIQMeG4iHXxqz04QIIvTpcdQL5rMrm2yobPidv5iNWBonu4oOu00CweTrH6ht6Y4XkTRIvZrjA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Received: from SJ5PPF2BB505D96.namprd10.prod.outlook.com
 (2603:10b6:a0f:fc02::796) by DM4PR10MB6278.namprd10.prod.outlook.com
 (2603:10b6:8:b8::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Wed, 6 May
 2026 20:06:04 +0000
Received: from SJ5PPF2BB505D96.namprd10.prod.outlook.com
 ([fe80::5876:2319:6c09:9a2b]) by SJ5PPF2BB505D96.namprd10.prod.outlook.com
 ([fe80::5876:2319:6c09:9a2b%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 20:06:04 +0000
From: Colin Foster <colin.foster@in-advantage.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Cc: Brian Masney <bmasney@redhat.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v1 3/3] clk: clocking-wizard: remove 20kHz restriction
Date: Wed,  6 May 2026 15:05:55 -0500
Message-ID: <20260506200555.2558434-4-colin.foster@in-advantage.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260506200555.2558434-1-colin.foster@in-advantage.com>
References: <20260506200555.2558434-1-colin.foster@in-advantage.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0P221CA0011.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:52a::8) To SJ5PPF2BB505D96.namprd10.prod.outlook.com
 (2603:10b6:a0f:fc02::796)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF2BB505D96:EE_|DM4PR10MB6278:EE_
X-MS-Office365-Filtering-Correlation-Id: 26eeeff0-f44f-4546-e71c-08deabaae6e7
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003|55112099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	sy/TG32VECDCTijhaLEJeOKh2oD7EAYBY3lxcAOtGJ4uxvHOd3fhwxC7hgOSYabqynQ3Hmzec9rZ3NKNw5DEzVe/1j0WcQhQVQ5hDde+86z2LuXDq+GQ0IRWKRpEffOygs1huxOSb3QfcDMUajPmiN8QftP/WjNyGrJ03RR4ChidszkmoriPdPe7O+7vGfDSkY1KqXcQQfsBAJ/+DzoXcnI5Ij/UyCrZvRv7ayyllCET6pglfWudGjQZccM4w5Y1aQxkslyilh/5gZsQAHj5qeeox9wqiAzStcK79qQwvelZE2IPB25cdyAB5ih/3Hn8kdEguxrpmYJ+q9wMUeqAzmD5neaOSOovXwxk1DRqX+DZh4fdttYriSgQ1IL4QtcloQEtFHxk39f/bOnkusT1HUcpshxeMiOzv1Dc3d8xIgfSD/gru9InOuyzoHco46wh932OkzBNBbDD51M7Mu76tc8Ft2dqow0Wy82ZX8uhTALtSgcm1Ht5ixjeVSxxXURFbF3Cx/K42rWAWBuNmz14VFAFa+QF3wpm3/HEubXW0kTuS6Mw9HMGqxR5BSy0A5VJoZNYa9N23JUifljuRJ+XLW7gqPSBeXTj6CRJgbLpNwWIp7L6DIDr8Y6XaxdJCp9efcYDmTGefkwzlqBw3wgn5UCKIRALuAa/wW+exRkK613jIznroYq4WdmQm8qgDVAl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ5PPF2BB505D96.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003)(55112099003)(3023799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9EgjkxmPnSrPVeAHsNnm1KMPhNHZXLS9RwLci21pygN1VO+px3IUAyTclzQK?=
 =?us-ascii?Q?vTKfz1cvHhJ7vqt0G6BZFHA9VZq1vyzAjVshZM4AwIW/c29UhwE3Nt9CFc92?=
 =?us-ascii?Q?rnOBPPj1WkLKGKxl/wcd/B6kHcv9TnxMQsZOOqjX8Q+DsVeEMiD4URBPWYQF?=
 =?us-ascii?Q?k1jKgsI5qYB4BM5TyAU5mUleRJEaOkilYNUtCtJRDFp9iN5VgpormWrMaP8h?=
 =?us-ascii?Q?0aTK32q3B7RQqkjXOUs+T1L83aD5HjmjgX3eXRUVpkUI5GjdwCdNBr6Uq4IO?=
 =?us-ascii?Q?0wUi1E4zkyPZtxMI0EyfPomGrAXMjd7h00WK/vDqbTEEIsCWDOLRcKRfxePc?=
 =?us-ascii?Q?WxQaDbHLj6TlZqFCvbOSEmmLIhVgaRFVQ18vUiPN2s6nQhispvoDmS/pBaSb?=
 =?us-ascii?Q?vv0B2FZ7QpnNcbOF4Hq10zVRZmsP5o3PfRkKTDC4WCzHIE4819ddej42iC6E?=
 =?us-ascii?Q?kU6QYLYlNFepV7txZQePMDGV+ivDN6Ugi4beuYUx7XIB/jo3Q73cOaudU3SG?=
 =?us-ascii?Q?TrzPMGh0fSDc/iUCxolm+9vXKWTfqDY18wCexp0OqrGm+/Q4SudeMhnoD56F?=
 =?us-ascii?Q?B6QbLnO1J4jJzN5EupB1gaKnpBEmXf1HpC4EUF2YY+K1KlvIyedqMO5XCUTs?=
 =?us-ascii?Q?hqsq75zpUHPGXu96geeYfPkMB75D4b0DnrtHYc8M56m1whcvl9QXWLVhmx4X?=
 =?us-ascii?Q?gdfpIMt+PxmIaksqunkXBZ98v16T4dCRQr82ycye6hDzo6BcPDaG3k8LIgJC?=
 =?us-ascii?Q?V7rVWgXnWH0fEfB3IrIf/JBJy8I5Sn78Dl3ednIGHaHzpx+1lbxO4CRqUOn7?=
 =?us-ascii?Q?zHusk0n6soiQ/PLsiBVClc6WAqBkzBlghXmj6NGt8t06lEBDqp3N2K7saoFA?=
 =?us-ascii?Q?UkUSMy2VEDmoNCZOpZDRv9tmJml42Kfq5Y4wrkKTthDPGXdoZZUU99seXWlk?=
 =?us-ascii?Q?qvyawHbcwHRl+xgyR9kg699am1wWHqkZHnJxH6Peipp8EusKGRvGEdf4//uL?=
 =?us-ascii?Q?1tVNtfSqfZ8JwrgQrBUSEOUsqb4iyfNGw3D3BCUNRai5AAhmmPPMe7pKqnKt?=
 =?us-ascii?Q?8PjHYmlvCmr9hekDbnzIYb7cohBlfa2ncw8wlgkkVNZYIEFB/T1QyMTuYADq?=
 =?us-ascii?Q?Qjh8zpKl74JEfTb7qCb4BC2lIo8hxPkwl6rGHj8sEXudPtHsJrViCdGJmjwl?=
 =?us-ascii?Q?AYzuNWIV7OadQ7gfufJWrp18Ojx2p6NykqmoS+UQYhpVQ/agzHcEetTi+JdM?=
 =?us-ascii?Q?qvMLfKxZEtx+AABTczzpymOa5AFJd0KRy+IYh94wjYuz4o7l4EWRkpgEiaLX?=
 =?us-ascii?Q?1X1ZcuKV7IFk3a4BNs3W73C1DwPrV7+8hod2/RB9cpdEbtevNK/bPy/aPIpU?=
 =?us-ascii?Q?qls15aLp9hGs6FnseDfTcl2zeVPLziB0N3Wit+8TAbx5YTv3iuuplotH9yR7?=
 =?us-ascii?Q?HwPs+spEh7Hd2f8GijJUc9YdsDTz4YVjEtn6M9OHrP9rmLnmubeLid7UuiE0?=
 =?us-ascii?Q?sFe65F0c8IkZAvMxBTiyAzpQ1HE3YPDjI0xrPYYhgb4pv347qX8eWy4zp6qz?=
 =?us-ascii?Q?opxcR/ml/VuarUDa5AWeHBP+Saq5DvqYZP4/pxk2WtVO2ciEjScwHYmAt4Sm?=
 =?us-ascii?Q?e4ff9HdiHzHetHLtpqJFN2SNPkUQwxIl725F0TmJYuTt/sp6c9dU9xDVFDna?=
 =?us-ascii?Q?UyX2Q28mUChB2BGZjaectM1uSaPJmbaYbS5pM+DkGwRfeYkMUPqm4jNxp7FA?=
 =?us-ascii?Q?EhjiHV694K+nm9CzAYJh/r4s7UVhpIw=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26eeeff0-f44f-4546-e71c-08deabaae6e7
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF2BB505D96.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 20:06:04.1861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pXyPbidYJqk0H1W5qERZOv7UdWL/YN/kvDULkkUnIkcyuDa2iAImb5NPgf2W2/qzj+PYE2XQsEGs5G0ibIC+qXws0GOWM777DlG4jlCg/G4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6278

There is a 20KHz minimum target for clock difference that was baked into
the driver. This is unnecessary, and causes target clock frequencies to
be rejected that should otherwise succeed.

The discrepancy existed in versal drivers as well, but was removed as
part of 'commit e0a94c6bb5b4 ("clk: xilinx: Optimize divisor search in
clk_wzrd_get_divisors_ver()")'

Apply the change to allow differences >= 20kHz.

Before the change:

8<--------
clk-wizard-test: requesting 133312000 Hz on output 0 (clock NOT enabled)
*** Clock wizard - Matching for rate 133312000 parent rate 99999000
m = 33, d = 1, o = 25, freq = 131998680, diff = 1313320
m = 35, d = 1, o = 26, freq = 134614038, diff = 1302038
m = 36, d = 1, o = 27, freq = 133332000, diff = 20000
*** Clock wizard - Matching for rate 133312000 parent rate 99999000
m = 33, d = 1, o = 25, freq = 131998680, diff = 1313320
m = 35, d = 1, o = 26, freq = 134614038, diff = 1302038
m = 36, d = 1, o = 27, freq = 133332000, diff = 20000
clk-wizard-test: clk_set_rate(133312000) failed: -22
8<--------

After the change:

8<--------
clk-wizard-test: requesting 133312000 Hz on output 0 (clock NOT enabled)
*** Clock wizard - Matching for rate 133312000 parent rate 99999000
m = 33, d = 1, o = 25, freq = 131998680, diff = 1313320
m = 35, d = 1, o = 26, freq = 134614038, diff = 1302038
m = 36, d = 1, o = 27, freq = 133332000, diff = 20000
*** Clock wizard - Matching for rate 133312000 parent rate 99999000
m = 33, d = 1, o = 25, freq = 131998680, diff = 1313320
m = 35, d = 1, o = 26, freq = 134614038, diff = 1302038
m = 36, d = 1, o = 27, freq = 133332000, diff = 20000
*** Clock wizard - Matching for rate 133332000 parent rate 99999000
m = 33, d = 1, o = 25, freq = 131998680, diff = 1333320
m = 35, d = 1, o = 26, freq = 134614038, diff = 1282038
m = 36, d = 1, o = 27, freq = 133332000, diff = 0
clk-wizard-test: success -- actual rate: 133332000 Hz (requested 133312000 Hz, error 20000 Hz)
8<--------

Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
---
 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index d43f20e9ac59..bc71d6155b06 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -105,7 +105,6 @@
 #define VER_WZRD_VCO_MAX		4320000000ULL
 #define VER_WZRD_O_MIN			2
 #define VER_WZRD_O_MAX			511
-#define WZRD_MIN_ERR			20000
 #define WZRD_FRAC_POINTS		1000
 
 /* Get the mask from width */
@@ -425,7 +424,7 @@ static int clk_wzrd_get_divisors(struct clk_hw *hw, unsigned long rate,
 			}
 		}
 	}
-	return best_diff < WZRD_MIN_ERR ? 0 : -EBUSY;
+	return best_diff != -1ULL ? 0 : -EBUSY;
 }
 
 static int clk_wzrd_reconfig(struct clk_wzrd_divider *divider, void __iomem *div_addr)
-- 
2.43.0

