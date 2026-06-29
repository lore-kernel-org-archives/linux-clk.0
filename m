Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11021075.outbound.protection.outlook.com [52.101.62.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A87C348C4B;
	Mon, 29 Jun 2026 20:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782766435; cv=fail; b=Sn9Sk31Gjq6u/Lq6uF440fQw9EsLobPk9N2HSfOmEReuMXC80xjE+BCAEK0JWkI06lZTJ0W1n65wnkuFOOd4UBh1OuNx4T8lNaF0PGvx6kbkMMj0bkUGNOnBWTGaZY8gyFtnhUAz5NoSrunK6SvGNG+vZbFPcUTY5FjoKQziYtY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782766435; c=relaxed/simple;
	bh=U5uQJnAOPj53+UJdff29oyhLAB9zKqbopv9IgnQR1fU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=jYP2nmLO0mSxXYs3nQL9G63zjrqMWlQEpW3SKkeOd05q27foO+HbIBhxR+AoHdWEfaBJNHcUvZkOYJoJe6nxVK2mK/h5sA3JbKtUZArTwLthqrmDaFRM2mmj7OD8O8a5FXW8z9muP1nxJA4KQi4tmYWNm8fnQGs+pThOnzbqHhs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=in-advantage.com; spf=pass smtp.mailfrom=in-advantage.com; dkim=pass (1024-bit key) header.d=in-advantage.com header.i=@in-advantage.com header.b=AjEW1Ch1; arc=fail smtp.client-ip=52.101.62.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=in-advantage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=in-advantage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=in-advantage.com header.i=@in-advantage.com header.b="AjEW1Ch1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xvPgydqBM/i1EULhYJ9bOWh+1+sOgNBeCYkmK6wL6uoFwdFWCLZSXzoFl7ioFr++/Hu0uw7ZgRT4kq7GYtCSEvmRucQV+2Sd66Y3qZRqVtAlvDxBlejUQtmBY4EuSZWPgs3NTaeN1tpV1wc5tUBmBfSHz/OcjM2aa3gfm+519IJoPko3jjqkbiM/Q1st/SaxEaSYPIZ4WCuSeMX7WgGmq6/d/rMoEODUy4GTZwLyrn7S9L1Q0itp51/BE+OAfb31h3kwBc0QbSNvrwZ4XPBW/cNvcN2XNPMEqonVxtdOQhpW7gehXJ5KOICWZLqL6ZwZNBvAH2Xi78j21z/2UQO6wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Asl2j7yCCjlD5LrfCshmb45PyDwM64F3ce65+BVPYQs=;
 b=fYSWF0XAtddSFSquyWnM+/EaV0ZgqJ1BUV+beU14gaCgfACbpOSnSKprY5fYGAFbk6HhdraGJ295nDYtkFKg5AxlYPq/Qicp0cV3lxiGLVGek9skvWfJjNp7qCfQkBlRjPvwYs58ZoGjMYNvzQykxEp2RjGdMHjOQr7KLcefT0fIXfJqR62rCuLl7JOsLUgkEARWAeBjbmjrltBsOnbDtThwE/JoFaL4LavyzNPulZrQYsm54rbIGe4ivL2z4Av9miq6erzyqnMUO0gsak7QuXU+fe3C+HxIJ6Pwi/8OcjQzt7Q41o5DG8p32OojCuwkXFWQ8EzFFJh1vyCWRLzw3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=in-advantage.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Asl2j7yCCjlD5LrfCshmb45PyDwM64F3ce65+BVPYQs=;
 b=AjEW1Ch1mR7OhkxDjA+9tqVMnmWQa9aCSzAXww/Eh+GpwlDcycfFdisqc6HtsIgkJvTjB/iY0CdwNpweY2LCXO6YtmE3YxW6O+w0Szgs+++ZwLG295GJdl1etaOeLNF7/4aCfJQXHlid2/OTahxzt9z70TTU9Ody2x75UKvjsBE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Received: from CH0PR10MB5290.namprd10.prod.outlook.com (2603:10b6:610:dc::14)
 by SJ0PR10MB4749.namprd10.prod.outlook.com (2603:10b6:a03:2da::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Mon, 29 Jun
 2026 20:53:50 +0000
Received: from CH0PR10MB5290.namprd10.prod.outlook.com
 ([fe80::fd87:b9a4:818d:5ef5]) by CH0PR10MB5290.namprd10.prod.outlook.com
 ([fe80::fd87:b9a4:818d:5ef5%4]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 20:53:50 +0000
From: Colin Foster <colin.foster@in-advantage.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Brian Masney <bmasney@redhat.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH_v2 0/3] clock-wizard fixups
Date: Mon, 29 Jun 2026 15:53:43 -0500
Message-ID: <20260629205346.3228886-1-colin.foster@in-advantage.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0159.namprd03.prod.outlook.com
 (2603:10b6:408:f4::14) To CH0PR10MB5290.namprd10.prod.outlook.com
 (2603:10b6:610:dc::14)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5290:EE_|SJ0PR10MB4749:EE_
X-MS-Office365-Filtering-Correlation-Id: 53e62b9a-a416-4e36-c040-08ded620859d
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|56012099006|11063799006|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	hpB8zqHjNJ9qSLF0OxHpOAD0/Xw/zGwtvKiznB5EJyL54Ii1UZV8+bF7fmMN2qcTexdunvUwh85VzBlAZsHsBdQNcqlRx4igMExMQ1CF7m2BdQeQDOwhiROXsTnac0//NglaOWNp4ePiEIW6PJ26hv3P0glMyhNT03q69+CT579Oj8v++Lg2anJ+7xqvvcxRvuAQ1zCmpSEYYSpfEWXtrygATKy/IEjCrQpyOo47rBIGZDrHUeCain3XOFNeHSsqSIIQaKerPXyobxAjpcx+v6YMZLjKadSqcrRoY7uAWXX50BeyyRZEHoSKBjWMxaTSySkCCcqjB0HXkpb+J+iT/1BM+LgqlYwodi9kStVQKew6T6A3Jt2AZx635ljv1mi7zWZbpqAK4lC10OnS6SmMqnSSaET5qC8HyGSqcLIIMrDDCllAoBAomw6kf2Tze/W4pLxSv4R4DHIK5K6B+bTJ1GM8taaA12UAWoSlPqGkiMGdtgPfnLp5C4JECOwJ5quM/e+7obWd94pwEMoMVVAcRk3Pu2H2ilwcpD7uji7rQXb0OQJGV7/TmJ7UX5fdJ6U3raCCPPEawZsaCQu2/gyyT8iBXWglqFb4/TjeKrrwe8MuMYQQWVW+Ac/4v5wEfhGcQZSYIG+YtK4HJ0jTWiVyZL7t6U6XVSJNgt1WPMqx+Pg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5290.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(56012099006)(11063799006)(18002099003)(55112099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rgwmnqcwEIYqZ6H8CBoFdezl4fxAd+LebAkh5/xbUmx3jYJgtrLseHlcPLpN?=
 =?us-ascii?Q?m0G+/an+Ew257I+0ek/a7EG5zLdIh/KvRL032nM5rKa29vZYxa5hMF110WvX?=
 =?us-ascii?Q?UBtrl4zsQWW5jwNQtJHNO6F5zlmau6/p/i67h7bFKY8W042na/NHDSkc4Nj2?=
 =?us-ascii?Q?en9x648JX8bLenGvdspG0+JPmyti6M5ktWz2t1z7gpvcR4SXFAO168J1LiNt?=
 =?us-ascii?Q?sDkw5bSiuy64ICuAHMl91fmqSAXBl12UAG5dW7YD/7nlVSECs3rIjEyuot+x?=
 =?us-ascii?Q?VeOBl0S+9dCuG+dfZU7qv9JpadSiimS+nBz8KlPD96SZoRGGNbVXxMpMw+5d?=
 =?us-ascii?Q?J694jrwuvdlaxQB5AKbq+p3A4DQemURdn8HTCvCPDNNqIoQvJrrYZo+hGD7Q?=
 =?us-ascii?Q?ijXdf0DujUIQ5FsqlVve/TSCFm4iaqtEevGl8GQishT8/7UWym+Bw9u9RgsK?=
 =?us-ascii?Q?gBGNz/mV65Dd7LvFf37eULjpPqtLnMWPihVzSP+0pVDUKlsu+7/+mcMiwcVA?=
 =?us-ascii?Q?rl7urH1tE13d4d+pd7pOXaFkyjsCZqB2LaQUAxKt724xn21TWoyGkSCV9dNP?=
 =?us-ascii?Q?uWI+Nz5rKWk3tXzKRKVuER5jrvWiEGb86l8Txe6zw6+PQDdhl/oXVaXJnJUK?=
 =?us-ascii?Q?vJds6szqjr0X0gDTYTfHKJ+99u7hGPwmlIS7RPT+AS+VAaKkugRDi3dj8dK+?=
 =?us-ascii?Q?9psudRSuHq0yI6AKNLEJVNQxh2Zi5NiYohLA7BN82kntERObNj77I8JuMpkV?=
 =?us-ascii?Q?rxw0QavrMDT34oGTSy+P9VHYwhfMecYeLTx8bFTLNBO8kUFLaAqdK4k0hW8a?=
 =?us-ascii?Q?BZ8/LmYp41oceWiZ9W2OqlYx7xYfsjZ5dVS5Ww40DSTK6mIB7om/GU82sQE0?=
 =?us-ascii?Q?Gvy8+pjHaMbPubVa4RQOirRIBI7bnQRY9/Iok6ZPkIpM2MYfOaJtsG95nu3p?=
 =?us-ascii?Q?dPcyz2lq8NrmJpNDPPl+C5PKt1NCP+8tTTSs3Ag/l0chT9gJWriuYYlFKMYY?=
 =?us-ascii?Q?cUSEmMur1BG09muiOU/9h2RyK5YaAKcZ4d9xqXW9Zhh2NupOcu8Xe1VzOGnp?=
 =?us-ascii?Q?Eh9ALRuJT75ce7wOdmSJ3Mpb/Ez87njKpd8JcW5KVaUWy8MeLK7u0MOIsekW?=
 =?us-ascii?Q?Ixnr9uP6+tfV8yT1VPSozMzslJcefa/KOCCicAPgt3+AESWpOsTP4t6pQinM?=
 =?us-ascii?Q?Wfacl6LvrNS562Rp4TWCCVBr6qP3F1i8Stu32nGGj8xnKTwK0x5dGY9papGm?=
 =?us-ascii?Q?WOMZYz9YPKbJSIItj+vsfPu0IB0MXo7a+pWRrHA7DDzkd81+C4M2l+x3awkL?=
 =?us-ascii?Q?dMgnakzMEPOzsF24oHcMClw3W8M/elwY/TSAr7vBOBw6qoeSqD/E7G95OULN?=
 =?us-ascii?Q?muc0tw4awIPHe5A3OzHxeHQwFWSS55K+TeCtNhhQoPpNhLk95jppqIkP9XUo?=
 =?us-ascii?Q?7JprZeTdRPgnJkEHwiPcrIz53K1pZ7r9avwm5dyYzjy6jYMCiPhN1WAnfFND?=
 =?us-ascii?Q?+IUXtmiUWbPRHSNS+DKrz4p9h6i/vx0IIRANRyjWf+m2v4QUvITQ2mGZiUjE?=
 =?us-ascii?Q?GF9GPBB8JqEntU5f3BSAWOVvI6IO8wJPP4waapTZ4MgOzWa4mL/n3SdydWGK?=
 =?us-ascii?Q?nA2y65Z3hn6JWmmT7cEfBMYKAX5Y63fVMvdQ6WBSkdyIlQIycicsnqyokhd2?=
 =?us-ascii?Q?E7M++FMN0CQN+d4Kakmm0s+3hCnrfe092SZTtqecH16UGbl7G10W6NhmSCqu?=
 =?us-ascii?Q?4f7xLrhsU7nlPb+BY8ZzRbE0tcsKp7c=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53e62b9a-a416-4e36-c040-08ded620859d
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5290.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 20:53:50.3419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AM2giDJM9wJpfae8bxCtdb1uzBe2ZqSliTKSJeq5ytTGZmyN8SlNMdUO2RIpl0okYI/KSouuxKM3qmnpetG6gcA9EfpXG/651kW+UArQfPg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4749

The clock-wizard driver had a hard-coded 20KHz minimum accuracy. This
led to out-of-tree drivers silently failing to set clock rates instead
of dealing with the best-effort.

Remove this 20KHz restriction to match the Versal clock wizard driver.
There also was a bug in the difference calculation that is addressed in
the first patch.

The second patch optimizes the search if an exact match is found.

The third removes the restriction.

v2:
 * Rebase to apply cleanly
 * Add signoffs

Colin Foster (3):
  clk: clocking-wizard: fix clock difference detection
  clk: clocking-wizard: optimize clock search
  clk: clocking-wizard: remove 20kHz restriction

 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

-- 
2.43.0

