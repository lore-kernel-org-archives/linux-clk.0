Received: from mx07-0061a602.pphosted.com (mx07-0061a602.pphosted.com [143.55.144.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D51712FF7B
	for <linux-clk@vger.kernel.org>; Tue,  2 Jul 2024 08:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=143.55.144.161
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719907870; cv=fail; b=jzT1s3EHm5YzbtF+5zZ48KS4HrXURxh7wtjYA4aQLUDmJCt6TLzUXhzO9uSHzT/VqlAh0hQWjAl0C8dreLhoFevNn0ixY+jW9wA5FXwrF4HIeyImVWGhY8pM6M7jKaB23JkcbgMHUifquYmN55dL/Dhrp6KOU3/R4x34gkeRTgQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719907870; c=relaxed/simple;
	bh=pMjwfyarpek+i4kI9Rb2ZAku9+DVxgB+g4lk+hptXhE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=L1j5Cy8eXuhDtZqLSNgRRFXRClAPXA97Elwy03/ImqPcc4WMdiYPYVSWs6RFESXN+cSYh3IDK/dmNt1v/tBob7xQQQgh+dkWI8ClmD+4zFy593IT1QDB7ds6r7egh3Exm70NKZEPqaFMXk9CTowTMxuZQZgxhBLFkkrMus8/AqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ttcontrol.com; spf=pass smtp.mailfrom=ttcontrol.com; dkim=pass (2048-bit key) header.d=ttcontrol.com header.i=@ttcontrol.com header.b=anrICpYv; arc=fail smtp.client-ip=143.55.144.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ttcontrol.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ttcontrol.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ttcontrol.com header.i=@ttcontrol.com header.b="anrICpYv"
Received: from pps.filterd (m0278995.ppops.net [127.0.0.1])
	by mx07-0061a602.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4627sVp6005022;
	Tue, 2 Jul 2024 08:10:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ttcontrol.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	s2021; bh=G0x0C5ms6eu8jJkMUHPPzZWQ21zJAm/eyQO4v7Omk8k=; b=anrICp
	YvJzqsMDoVDEiE21w2DShdSUOD+y3wO8YoNXnxq6n9TDUXxC8vQ9uPCdfIvackjq
	+d/1YJnL9PMaZfPgdvSY66qTBmpG4/7TZaqtR/WUAmiNHw4AOI8MXrR4gT43Lqkh
	mvw2jRItoWSu7cPZfM6DDlbxCA+ET2D68QcsKkPiPBmn/rRfKEPooApGsRRtl2oA
	ufAyLkuBKv3LSjiiyZOXXjUGKHxfOq7xI98m1wKDPsNd3dBQBsV71WDQ5kLLWYdK
	WsTJNXkGu2iz09jAfTFgQgs0y0Wq1wkwDO7TxwetVcNPHhiToTyOdidGf0L6dUCK
	kPQ4yMCaYys/9M+g==
Received: from eur05-vi1-obe.outbound.protection.outlook.com (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
	by mx07-0061a602.pphosted.com (PPS) with ESMTPS id 4027c8badn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jul 2024 08:10:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V8kVec7a6aNUBomMVlxHyVj8CVRlS3E9y2ufd7mozJdcyCtZEZ/7foAOhwcqdfxX78/I2dvKE+Xak/0/tM7qQy9eP0nPrh8yfNwYlmfxxDAsKIxQMieQkz9wHXteRNg3PnZc1deTTZOc6YI7h3Pd7QnheS84vtlDkqaGNz+FHeIcP+eyXlWeNp4e/lTJZbjRaWKRTHNw0agfUg26ODW3b7l77iyNMLMwYIKVPW1pi0WsdW04LcH6PcA28oNXHFcoeZDt4tlwbJmI70IzyutCmhb1UEHXkEBgI+Im6/tCvRuWxg54P440oFIti0Gf/68sowjOoZpQTdNk70eoJJAlGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G0x0C5ms6eu8jJkMUHPPzZWQ21zJAm/eyQO4v7Omk8k=;
 b=Gq+eCss/n+BSyxCEuDxZpltQaJz6mDkuP1P/NYfr+2k2DUPlI90Su1XJAzTbJ0RCtqKm1l8pbgCDiHTZ1Py/yJ4Z8Q93gtV/9jFKob8R/CEye9U9yySExg8JAcIsQraf/4Q/tJCSZhvjpiF2h7otyMycdeuIDh0NqSspolcdi87FhpNb5NLAcO/FLLNs7v2VnUKz6QfDbwyDC9HZ69lmy8ZQKSOMb/6aPlA0lpu//9Ctz2+5KQHGKAn8Z14xwfz3WOzypYbNCjuQjjkaoVmXdmCe28PvJ7glmgLkEZutc0VLBuufmCxi6MkBwKScppSeKVQsYwoQurKFYFuPWWygwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ttcontrol.com; dmarc=pass action=none
 header.from=ttcontrol.com; dkim=pass header.d=ttcontrol.com; arc=none
Received: from DU0PR01MB9382.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:32d::6) by AM0PR01MB6513.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:167::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Tue, 2 Jul
 2024 08:10:44 +0000
Received: from DU0PR01MB9382.eurprd01.prod.exchangelabs.com
 ([fe80::c41d:dc9b:3f97:1ae1]) by DU0PR01MB9382.eurprd01.prod.exchangelabs.com
 ([fe80::c41d:dc9b:3f97:1ae1%6]) with mapi id 15.20.7719.029; Tue, 2 Jul 2024
 08:10:44 +0000
From: Diogo Manuel Pais Silva <diogo.pais@ttcontrol.com>
To: Peng Fan <peng.fan@nxp.com>
CC: "abelvesa@kernel.org" <abelvesa@kernel.org>,
        "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "sboyd@kernel.org"
	<sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "imx@lists.linux.dev"
	<imx@lists.linux.dev>,
        "EMC: linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2] clk: imx8qxp: Defer instead of failing probe
Thread-Topic: [PATCH v2] clk: imx8qxp: Defer instead of failing probe
Thread-Index: AQHazFdWN/m8O/jmP0WAh/I/zksSxQ==
Date: Tue, 2 Jul 2024 08:10:44 +0000
Message-ID: 
 <DU0PR01MB9382F1AC496F22A20C074BDE9DDC2@DU0PR01MB9382.eurprd01.prod.exchangelabs.com>
References: 
 <DU0PR01MB93828B0E6808E33C608BC0E29DD32@DU0PR01MB9382.eurprd01.prod.exchangelabs.com>
 <AM6PR04MB5941651E3920794104B3D24F88D32@AM6PR04MB5941.eurprd04.prod.outlook.com>
In-Reply-To: 
 <AM6PR04MB5941651E3920794104B3D24F88D32@AM6PR04MB5941.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_6d12e765-bdb3-4a42-8d1e-507ff5c9fe67_ActionId=feb09c1b-e3b6-48ef-89cf-48121eb19752;MSIP_Label_6d12e765-bdb3-4a42-8d1e-507ff5c9fe67_ContentBits=0;MSIP_Label_6d12e765-bdb3-4a42-8d1e-507ff5c9fe67_Enabled=true;MSIP_Label_6d12e765-bdb3-4a42-8d1e-507ff5c9fe67_Method=Privileged;MSIP_Label_6d12e765-bdb3-4a42-8d1e-507ff5c9fe67_Name=TTControl-Public;MSIP_Label_6d12e765-bdb3-4a42-8d1e-507ff5c9fe67_SetDate=2024-07-02T08:05:07Z;MSIP_Label_6d12e765-bdb3-4a42-8d1e-507ff5c9fe67_SiteId=5638dc0c-ffa2-418f-8078-70f739ff781f;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR01MB9382:EE_|AM0PR01MB6513:EE_
x-ms-office365-filtering-correlation-id: 056a171a-608d-4345-994a-08dc9a6e78e8
x-ld-processed: 5638dc0c-ffa2-418f-8078-70f739ff781f,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?ASdYPJOfGUdRJwoMeYZQDClj5LPIZfR96pBo65PsEbdbqjxxsB3GBp31HfkU?=
 =?us-ascii?Q?TCUbYcrCkat27BV45jiUAZulpUdzoe5gzyWZG/Xr9X1ftaaMkdMSJa83G5By?=
 =?us-ascii?Q?lgcaR66J6B9fOadZIFGtMjI4cLmRH04ZK+i+xRUA+eb5YSLFK0TfEntGsF6g?=
 =?us-ascii?Q?Nc05NEdIWhaqDtsACZm2mopTJYaBhwUj33vDDqul13BKk4+xemo+V62F3zsU?=
 =?us-ascii?Q?Ru6uBRHaXlK4SV8wcO7D0RzeQhd1sPEB2tJZYcMDR3gER1nCwu0orzbWiaAC?=
 =?us-ascii?Q?fMi4mX+jUFV/w619dufo4UJLvA/QMbpcKK3Ay66ujen6n1aomYiFEpVPtb0U?=
 =?us-ascii?Q?oi8jh9buRjzx1awZ3UK/MKsL0tpZK4AHy1K3r94xuRYFOBqQv/qDw3wnrPJm?=
 =?us-ascii?Q?Arm/pWYDXIqyqLo+/rLDyFEhKW+gixLWHQnRQQe6/X6R7lbCYoykCUEqYi19?=
 =?us-ascii?Q?Yo+4gKjk0SMjllJifa2IxDnVcrZUJAw8v9kv42WGUs6jCT7uDfPGWr0AsloD?=
 =?us-ascii?Q?HJF3WPSg4nNaf1J15N8OKopSmIVtqzr7mEW+Qz/24Dw1N049jEusXw5nbVpe?=
 =?us-ascii?Q?M0atc4/HdId5JOtbcKXJbQfU8wy5Sg5NhKrblJXNoC0b78ZLnAevE5UAr4e3?=
 =?us-ascii?Q?AizGq9+oZxNUlVVTK1PWTaBo5iCvf4RODwywieijJ4h3+tPz33YDNwq6aFlU?=
 =?us-ascii?Q?wIeCPYLKNz3q0TglAbDEJ46tuh7oBEdi9+lnF+NcpH2rv01f5idZIDPpA3LB?=
 =?us-ascii?Q?g77Z4x1o4slvYV4jsw5Ai7EYrt9JKRB+vEOH5/QtHoNnmdt20X5S6NhnJjQR?=
 =?us-ascii?Q?HO2pTc57b8KBxm2lAETyyx1jT0FwPKBYZQ2qbise55q1hI7BBR2P77nfMvqi?=
 =?us-ascii?Q?GBsTpbQ/VvMPsUBaWHQEGWFU8LdtWAFcPCYqs2nunYsdxHdrFpcuyd6CqIJL?=
 =?us-ascii?Q?UoblWPTo/wkjjFrmiZGJAExlto0kOufoBc7fdf8ogdoBQNyLQHuJDLT1/buQ?=
 =?us-ascii?Q?pB1wdtsJSO4geSzNkQ+UId7SEryvQZitgDgn0oC/4SLZTQNqDaNqz9Oo3H9y?=
 =?us-ascii?Q?D5wciL/hC0lEMkiltOdZi2bAn6/06jrOOO/XlUSsWJ43+uqY0T6YOPHz6GRf?=
 =?us-ascii?Q?YRy45yPWjT8K5kMXvS0eJViMiundCLIKAT2QtBgT0V/mjG8IPQbj+qKrs7i3?=
 =?us-ascii?Q?mA1gdHSkBKviBY28k36KVrx8bhml171vKW6Awyi9EkwXZkC+j6/IcdaGuvoD?=
 =?us-ascii?Q?m2L7jiCClc/CfRX7uDfUVADTa1YBllJFob9zntRaZak/yWvvtD1ipeceTykp?=
 =?us-ascii?Q?kjeX8Glf7WgZ1ZJOM2+4OeX5+s8ag2o3DvjTyK0JI5HbA6gQ/RA43ieoyRZe?=
 =?us-ascii?Q?HJqJ7J265yY3l9UqEKO0vGD2k8Ehe5+CF6RzS9i19TMpf1/NLg=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR01MB9382.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?pEelCHD2nsWWcRXe5/GlNtAGuFZInTBsm6I6kA57C9yrsg4/FZRSIL2OTKxD?=
 =?us-ascii?Q?uPi7n6o5qqdwIJb16IT91i8CnzUvYi960gwMYOhK4P2VrhHrqxl7w7wDe/9d?=
 =?us-ascii?Q?1F6DBV/GJn1Jar2WiDbitfCdgqnJN41dxp3MXqMEvkc6cg6/UN/zjbX75HjL?=
 =?us-ascii?Q?IweJ9WmedaE/08Wf824zs5xefVA6TEfTKcaDEX6Ll+yIdk6mei9YUOnw73C6?=
 =?us-ascii?Q?hCQPtZzpeVQpNo3YcCdwGR6uRw2KGm8Vd8px+vjtJMzs/6dfqkSM0A4Y3lRr?=
 =?us-ascii?Q?gO+QIIRna9T05pEvHPO4w0NGo3IdJ6tM6bEQ7YOU37xpHAsXJ1sDELsJkc0Q?=
 =?us-ascii?Q?qRu6QdoY7b0YnWKPssRTr03YTsVx4U0eHxzT1u9WWKlOPL1pUUQ68/DMsW2S?=
 =?us-ascii?Q?DLRXlHh7adFEK00nay3M1r86sfLRwnJHEtDpsociymWOBZIzCayJ0i3jCP7S?=
 =?us-ascii?Q?15pHYrKaFyu4f+yy8OC9eiO4WPhYx5OhTO+dfMJwCT55vpi2BuGwFvxwcBMX?=
 =?us-ascii?Q?qtNkU89JZXF0Xg/ShfrqWEgYd0SbwvnW0VIoHCx+IsgsRJUqq9qedX+UtZ2A?=
 =?us-ascii?Q?MCwEb139XJ7P49Sg3gUA1By9evDzY+smizSdKJ5zA/ewN5YnXNeV4AzZBh76?=
 =?us-ascii?Q?EnB3Zqy+CDK3jjWlZAT+U2JCd9sEncLBcuG4QqAcTd2Gx8KXtDrdT9gp7BQd?=
 =?us-ascii?Q?PHKYOz7An4sFWrrmp7H2dNduC1LIa2Y3ocfZBekGauweiyleluKGL34s7vSn?=
 =?us-ascii?Q?Jo/7nLw2sTl2z+LM67SwuKY861xk9lxkLxF2i1//RkbkU33CjiyDHAsTZBCr?=
 =?us-ascii?Q?Q89wms8z0yv4W8CCkF7bWY1N4r64Wgwb0Zvd3DEKDiRrCugcT2cqANRGU3I/?=
 =?us-ascii?Q?4G+IDB+F6+zNqG6He71bnmi/ae9BTpBzRIC/McUZV3L3+i0eqr6NZIjt41ZF?=
 =?us-ascii?Q?IKzGg2PR5OLNce41G1aLGWLS+Q48979MmFNess7CGpwgqO1tAgSksjy+nd/E?=
 =?us-ascii?Q?ZEePW1jBU/qMlelZNhe2maWqz1X8DEKXQg2wTWpzbOmjmhKrX8EemMK/lXaz?=
 =?us-ascii?Q?YP0XAbs66NeFQLevKE/KCsFFVVn8XPl4boFkERwOZZ/gJYuZKNMfhqF62ptF?=
 =?us-ascii?Q?W97Anp7JihlfNjwN6s5ngF/6cPOrrm+T4gxd4t5kEaZhND7KxgichOgL0uk6?=
 =?us-ascii?Q?pCvX/eb/p4TCQAcPLiRqcc6Gu4bBeJif9HaFu8718mqHmugE02ZCfj+f0bC0?=
 =?us-ascii?Q?JCOD2t9KQJyovSImn2HjmS/V5fJPVMYSXXKwVIx9/YDf+I8Tx6pPNxxPwccv?=
 =?us-ascii?Q?4GUoo0yE3Khu9RG/ZpBUJ8EO/CIF899Y+X38fDtmuU4LbKk6MDziX13qK+sY?=
 =?us-ascii?Q?hVl3kh5avNDgo/vDBTxwF5P44yBzmgfAxS75d35gnA9pwVyNDDBbVMZdOTOV?=
 =?us-ascii?Q?EW+AfAsEVXm9p6FY0L6WBpoObk0I5CsEcOdrjbJO5se6AsTQ7gIy1LX54na9?=
 =?us-ascii?Q?pDfKGFAZWqt8u8/J/d/ufnrL3mgtzfkJUxbuPDm7ytEnY7exU96N6LYlhtb3?=
 =?us-ascii?Q?3ZNs/Qa95xqi4RrLPz+jNzJG1BVO0JVCeTtnrmR8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: ttcontrol.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR01MB9382.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 056a171a-608d-4345-994a-08dc9a6e78e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2024 08:10:44.5329
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5638dc0c-ffa2-418f-8078-70f739ff781f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bOVN6WWGr8fUnp5dLSqV3k0ZtMdL0k0eI++6QiKJZHhFPDo+KSWf0K7zgX05e3gx/dYnOfmLupsY9Ibqgz+8tWOJSPc+guxRry/7nEbDdoU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR01MB6513
X-Proofpoint-ORIG-GUID: pjn8LIHxlK5UuZqiziMbBDF9pV6xz4r9
X-Proofpoint-GUID: pjn8LIHxlK5UuZqiziMbBDF9pV6xz4r9

When of_clk_parent_fill is ran without all the parent clocks having been pr=
obed then the probe function will return -EINVAL, making it so that the pro=
be isn't attempted again. As fw_devlink is on by default this does not usua=
lly happen, but if fw_devlink is disabled then it is very possible that the=
 parent clock will be probed after the lpcg first attempt.

Signed-off-by: Diogo Silva <diogo.pais@ttcontrol.com>
---
v2: change from dev_warn to dev_err_probe
---
 drivers/clk/imx/clk-imx8qxp-lpcg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8q=
xp-lpcg.c
index d0ccaa040225..7bd9b745edbe 100644
--- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
+++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
@@ -225,8 +225,8 @@ static int imx_lpcg_parse_clks_from_dt(struct platform_=
device *pdev,

        ret =3D of_clk_parent_fill(np, parent_names, count);
        if (ret !=3D count) {
-               dev_err(&pdev->dev, "failed to get clock parent names\n");
-               return count;
+               return dev_err_probe(&pdev->dev, -EPROBE_DEFER,
+                               "failed to get all clock parent names\n");
        }

        ret =3D of_property_read_string_array(np, "clock-output-names",
--
2.34.1
CONFIDENTIALITY: The contents of this e-mail are confidential and intended =
only for the above addressee(s). If you are not the intended recipient, or =
the person responsible for delivering it to the intended recipient, copying=
 or delivering it to anyone else or using it in any unauthorized manner is =
prohibited and may be unlawful. If you receive this e-mail by mistake, plea=
se notify the sender and the systems administrator at straymail@tttech.com =
immediately.
