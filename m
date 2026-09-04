Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011009.outbound.protection.outlook.com [52.101.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEC03F8892;
	Fri,  4 Sep 2026 04:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788496872; cv=fail; b=CBVVRoE7Z7llpE3bmOO5P0te72W4bk0Xg6Rm6YZxM5lwBkbtfOXsGPGnlMK+CXy6JOFkwdBAtJ5bJ7Xa2+DydGq9pj5p8WVmcx4PpoRGwCqBDwelkTvK4sBc2e6w5w25rpDdPBUj+ds+jDiAG6C1m7w6GtySv7kqFWElR4VO9QA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788496872; c=relaxed/simple;
	bh=1SmuLcnWUtyxeG4eruZtR2GYpu1GOr3XPS9VUe4hays=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=O2PchaGSxBAECOZbrfXAmAJ9VAjPWoI8DNIdfg4sVLpBpR3xAi3VWSyht9Hgcs0KctijFKDA07AqZscl28vgZOKIR9CqwboWFIPpohWvgKAIZBIc9oyi5GMKv0U8uBMqsY44zKsDvIiqWjnjnk1S9dvrLrl7SkJCjbvHSN5eSp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=l2yMgfH0; arc=fail smtp.client-ip=52.101.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="l2yMgfH0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xb+PjBHRjzBtLzffJRNTAfWgzPFj9iNWIYfuXvdWZMXkZpctiKQ+jQCSsIg0CVyR6iN0+EJvy7N+yYX+Ec+aNrhspBI4LuwULmdxrZ7rx/tX3HkNah+RPbzZ+Sw6F0EGXYaY2kqxQFUCUrW7zQpAHGPvxhAfX9vgK0izo6M2Jm8Jd4hfZqDE5mZEo1sfzu2dow+pTbrDMalG+kwobJgR6x9aHwueYy2F1kTkiua7QE5rZvdjzQtBFXSvFkL4zMjfD9zIyLDSnrIzEEXwQXqjBlfEd2FtPkQB1MwBmwd4n22jGZtUKZdx9YgcFX7kpLVqWt/rHYXWkopRHZa4uUaawQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1SmuLcnWUtyxeG4eruZtR2GYpu1GOr3XPS9VUe4hays=;
 b=UJnijtFXNLLjCtY7hD8LKbFF2GkW4lRF+b0uuEskWbA55KOfk01TsmOqvKXxTkV1aaCMEvdTaiGhzzaPlO+7qqn+p96h1kB69J4rXJTE5+ZATSqU/pTTdDyYIQRVB5OxuM8WuuMivwzuDdokwmvgOSHyccMgymrO6j01HGQSBxY73I97ZbQDS8ka6fpkq2Jkto0F44tzCePl38BnvwN6djU3WThQ0tvzP95dit+TqFVOSt/s/IOhrbTp3Z3Etk3VwD60VoeYreCb9YaAoDXzAnVaZ0rgq/i6doYWkCXqLfB9eWRVny5zb6JGn7goQRqStPdd4giV0Vtzzkjf+QZ5WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1SmuLcnWUtyxeG4eruZtR2GYpu1GOr3XPS9VUe4hays=;
 b=l2yMgfH0XIb+5E7h2M175P4Gl8lSSNSpMiWGqXGFsRHE6ANj6YaEHMKis7lICV5F4GWQjO6Cr7LrwoYKtzOd1G+DICjm118Z6quO8VK0exxkEvf+zFkdiTIlDM6mq9oJP/EG4gf+y+hWM+K9RO0uf9o2S2cvBU2/QwZyZMoFcG9CVBTY8cK6YnstRiqxTzNzoXqmCFfXhqM9ClPphLsZE/iCRW08kvsSOIzLG5BN3DijAHkH06+ZjyeSlG3ojE8mbUTzp8qkBcz5m0IbKIzD63WWdALR9nDSZExzllsH9IZWhH38qwav9LLrKDALO1M4awv/S+1lUDH98Qqiyr5pvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DBBPR04MB7676.eurprd04.prod.outlook.com (2603:10a6:10:20e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 04:41:08 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0382.007; Fri, 4 Sep 2026
 04:41:08 +0000
Date: Fri, 4 Sep 2026 12:45:16 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com, Abel Vesa <abelvesa@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v13 4/4] clk: imx: pll14xx: support spread spectrum clock
 generation
Message-ID: <appM3K6fgE4fw9sK@shlinux89>
References: <20260903153836.373267-1-dario.binacchi@amarulasolutions.com>
 <20260903153836.373267-5-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903153836.373267-5-dario.binacchi@amarulasolutions.com>
X-ClientProxiedBy: MA5P287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::13) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DBBPR04MB7676:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f54a325-1cd0-42ea-dc17-08df0a3ebca5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|376014|7416014|18002099003|22082099003|56012099006|10067099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	RcKke4CWtvriXecUM1Wj5WeGHh8ga7R/pmkLvGa5d/OTiujJ5vXZWmIV2cUwsMVM6esSxJwr2o9gPaiUJ0gSH2AzcXCalOC3vHQt2Q4qdyPX0xSjrHnn/bhOyjECor3qZmV+mFfVHnVuwVzRqSScWTBfupn9Fpdo46ulytyngMD9By/y4QkCAK3iP4O4zSGADRwUQKUIehP1u318KAyAuup/XkhCRmhfcJl6K7QcpYOAVFd7f1L0E1WfI9meTds8b7iQBVI8tlC1s9XV84c/KoZrvwljOOvPsidvarVX6VIeIyVKrBnmBqyVfmxtIx8HPI2j6n8Tw/quSU0wYFGwXkKgZEbO8CbuzWH4cxc2Qqktu0D60fknDmnwb0KDKk3F6BSS0CC/Hs9vAuwwstZY9AhPkFzubLBO4zTd7GSsQl91c6uB8B7POFnqmdv/5MvVoHSzeq3Nr+MyqFJ7ryq0++1eye9oXthM0lCKoTm8VuNqN1aiQSkDI1ngeXC8p6c/kVJJzS9fhubGQmxXQhP+8izgCzHoghhRtI0oJRlEIvm7V/tiIgB17/9fN9ogPbK/OYxowtBx0el1vB72g1sAnMCDkq8Kfumt56PI0N/1e4iKT6urvApLAKfyYxG+JWcFxxmEILF6r76UJts/jdJITuJU022+FwtKc0t5NkFCzMM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(376014)(7416014)(18002099003)(22082099003)(56012099006)(10067099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9nTXQMgEKsv0Zm3hWzd4NJqm6uvmWHXE50YzWBBwrYVVm1VJHgq0UFTJ3Rto?=
 =?us-ascii?Q?52znVH5uNZ8sA811Qj7sq9/GiDfr7LcZMZ07x5wnSoRgbIq9wvtabT8JcfuP?=
 =?us-ascii?Q?LGb1eHjIGxVFDjhucP7cMIdfC4dybDpb5Lr6r3ZUMw3OcJ72QhSNXvPk+SV+?=
 =?us-ascii?Q?dQwGSCQJdGUru+3R/qDW7ptfGTRsuebeH1ONNK8cjph31WLDmYdnWse5/6Mh?=
 =?us-ascii?Q?wf0iwWC82DrJuX/wRkApkvG7r9eN9s3Jt4S073hmrjba/IuA4REq3TVBbg+9?=
 =?us-ascii?Q?fTG2kWtcljo6E2yOHeQm60so0/nMcGuli5lrH8XiFvapuwge4BWFvBj2sfca?=
 =?us-ascii?Q?AgFP9Sqq895A4RhS65euZ8Qny72yrW7qZPZvceO2qM8cN39qawlZ1H835ADJ?=
 =?us-ascii?Q?ToAiRkivz8UGyzavN1xVkzQR6v2y4ANhzn66zf482DGSn6RYNysQWQHoEW5/?=
 =?us-ascii?Q?7Rddbzvo1KP1l2E9dwQoiSocS9R6Sjpo5m/OrVRqeZlywJ4+P83+UCJruywi?=
 =?us-ascii?Q?AhBXt8tMeiylxeGMfrIlFwitUeS9IiLnhD5PcQXwowQULCGhOVPr7WT/HWx0?=
 =?us-ascii?Q?8bl5aQw5gWBcWtWKiKSvvsNmiFvA2VVqtox5WYJaKERFTC2vIrRJW15Z210P?=
 =?us-ascii?Q?whCtksJSKW9OSQFq0yBIBpcChbDDsCtobBPQ1tj7PG9cVWJFcr/G3XrOMQHs?=
 =?us-ascii?Q?MT9wfn5kOI5Ofie9IiCwCRSNdfMyFRShWuCL6e5ewVnNDULWMi3hdn5b3ZVl?=
 =?us-ascii?Q?tmQuz27shtKhNAQALgzlU9lVsib2V2g/lhF4cCEg9oVntCBf4cax7Ye50vR9?=
 =?us-ascii?Q?tMchikg9/vCdyAZ1GQuSvCn0XN2Qmckn8K9CNkOSpAESjIQoFYuqE4HYKRLt?=
 =?us-ascii?Q?i1Vomz1iTTchg839tZ42rwbE96MZHYpgz8hBNF88XffiI1uuW1EgXE+ozw8r?=
 =?us-ascii?Q?tO3jOsPbem6ZK6gU8+q1E7QmzRMaomS/q7vv1ps305H0v7+s1il4zapMku+1?=
 =?us-ascii?Q?oH1Dxpva+Pbzcf3xAQPkTwBc69ZHVfrNGyvdSPhx00qLtQcc3zL44oi+Hyl2?=
 =?us-ascii?Q?BHLDJMsN6t1Qd6vqci706pwcyianQRHiNBAna8lXVRRqZf2fjhzppopKioUB?=
 =?us-ascii?Q?S3LTyWJ4qyQj38WrCX54X2L/2nLXd3qD/dMG7jlY6SwhvTGyZ6ZNt673+cWU?=
 =?us-ascii?Q?kIu9fKOC3qxRLnr97ro5uLfnBkhhN+hyLRLiHHpRhLCECm2PYFwhy0Hdvbzh?=
 =?us-ascii?Q?dKGcrEcDcP9wqSKNb++zbxoF+wPrbDypDTVzlRv/zfESFPoymvOO37rTlseW?=
 =?us-ascii?Q?7QQA+pd3Cv2pQvIp8hC/gp0bWTAgqo8b9nvO1gJqoD5fUY2Gat/+kZYLCdoA?=
 =?us-ascii?Q?pfRvUtk8hKZZjm6HdS6BeLwfxsGD8Cny9Xm57knKRPFGfo7accTk0r8EV2sw?=
 =?us-ascii?Q?waCTydJyYeZ5XQ5RRldZmcvvfCybb4BrwfNfiheXM33lF9xd9Hq/h/YxX5qi?=
 =?us-ascii?Q?j3dSQ2AUvtMHdxtgDOF70S4J8jMBj1fanWthiQ9Vc3wLRI0jLzJH83pewomn?=
 =?us-ascii?Q?AfKuiRrOnlSXKvBNvYFv6DWnO6mthHdAFvCa9OengJMPaSYZN5zygKcoBB1x?=
 =?us-ascii?Q?fr7FtTISnzQ3LOf2Ka1/3tqM85l5MQOGOemZsp2T18Ueno5cltWGAJdF4Uwg?=
 =?us-ascii?Q?aRYIejjQP/2muWe4zZqhKc8JzFMLncEsUzxrg3W5+ZTwIvz9r5wiRFvFUHAo?=
 =?us-ascii?Q?LUwOQJcQJUQK1wCjmhh/4ZsqLdxhXyh0C++MEL/Nuti10Lm7+dAx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f54a325-1cd0-42ea-dc17-08df0a3ebca5
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 04:41:08.0523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TjeARr/O7/DONoaqRkrCi+RrxrgGinzthru2ebZO7DoUQm5eelHgY2Bu6oiPgSzIquMiCVvgDkpXo8QtdEjidBQYdTbTtzpll8y4MrEcx9RE3ySeHdhJhH3oSwvK+8PW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7676

On Thu, Sep 03, 2026 at 05:32:16PM +0200, Dario Binacchi wrote:
>Add support for spread spectrum clock (SSC) generation to the pll14xx
>driver.
>
>Tested on the video PLL of i.MX8MN and i.MX8MP based boards.
>
>Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
