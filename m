Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011029.outbound.protection.outlook.com [40.107.130.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309DAEAC7;
	Mon, 18 May 2026 00:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779065214; cv=fail; b=hVZ4pySFY+qdhXlm1uC5QMndpwjWTKnaZMRzoVnE0bnWAgFLQFKLO9x3P37DvxCfjLZBxpR39TRn9uTdExzRuVQHTlnhGL9bvy6aTIZARFj/n7EkAjcliBL5iWeHP10hmDBpH/NMYCEnS7EkIpDvEB+lZAiUp6/V95zHemgpXgk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779065214; c=relaxed/simple;
	bh=Jq+OsyojQOCuSCiCMJqJnp0cIIhVlEmhgL/oVAzl36o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RXV0GV9APUUfohPvdluWFkeGSoRQnwtdO81quJQa+R5jfA1kood4n61e/TDQcyVjfpg5HTZ7EqWLWhcjfMSg4VNxHSMXzw+O1jQI+ZlKY55O/QuhwMGS1wGOUNaN2LWzAQiuSOGiBSpyGXX8IXSDbSF7d2P7epKBrEH2t6B4vCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=uq4JSMAi; arc=fail smtp.client-ip=40.107.130.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="uq4JSMAi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fbBH2B2k+9CXk3pX7XZ8nMDV7DuKZN1RZ+HA9d5M2kzbZuz6xm3Fm7ferbPI+T4kKYCqc2z2vMhd0MEm6oyr+vmjdy5WOmDLUCLbdujhuNWBcTQ5ZVHJsOBtVVrOF7/9dvIjNz9eCN9BmOkeh2yX7mdFq6Duj+HTR1LTh6/3A6PTN7fc8eiSh6Ec0H+a6X3rAEUGdVIR0h0w2fm0lnopCF/lmHf1P/PZXXsApGgMBtt4lWIZ2b/jKEiwYcNeRhknTOygJoWphtoaVs0DjLXzEl47lEu0MhNIaq4g0GntcFu6g+grM5j9MldTRtICilbThg5ZGWzedhxLU5tcnputtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jq+OsyojQOCuSCiCMJqJnp0cIIhVlEmhgL/oVAzl36o=;
 b=DXK4YbqjrxWuje6bWK+5R22wyLGsljVAr/Z4amuDavPjJkaQGvad0iqjSoRMJbfYDbUzDeHoe5dCKihVKd9cQkeNIHm2pEYgTRsp/N7k2m/usoSH4fSbyMVBYktfmgK3WQC8uUACcGPqyb4QQ57pghpF15bL5/ueLfIZenVUXZsapPg1FKy7pddCRoa9pICU7IxIZpvpt3d43eMwjpu4ScF04LWW0alpMeZfags7onKHcDXJ1tMAwm1Ei/pzgajkeBsX3KT9rBqs61666A9cwYsHhjQNrjRBQs9KITWC0GhZmBzqY76bKpYP+OOAK/2uiB6Q3tMRHpeFy3iUFcvqdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jq+OsyojQOCuSCiCMJqJnp0cIIhVlEmhgL/oVAzl36o=;
 b=uq4JSMAip3Oqz6ZP+1obr6YcKBLad0LvSd1+nm6yeKbtOG5i8u5Aj80ELmC8Lo9uHypAt5OK9fkY+bH/iN48nECRbeCOYtPCCRR5ZanxJtpLGSg+9xLo5QOIH4/79D6ul/GmUolxSX97rOfwjcpe+EAwXg032QP+zfziStrXM3vsfBpnyLl4pbB7z+3iZTRLZ0Nxw6p6uH7JQjXjEgpGEZ6ylGR+CNW97QGXipqGqvQw3zgdP5eDAnzKMdNcK4TplGwJr1Pxe5ICwIhEPfPAOMWR5k4Kn9Lu8i98L8TNByl1C4KxaeDsNID4ETn+QpjyXkGPAroH1aPQ7F6Wkjt9pw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by DB9PR04MB8220.eurprd04.prod.outlook.com (2603:10a6:10:242::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 00:46:49 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.21.0025.020; Mon, 18 May 2026
 00:46:49 +0000
Date: Mon, 18 May 2026 08:49:35 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 04/15] clk: imx: scu: use clk_determine_rate_noop()
Message-ID: <agpiH2buJIgNruyJ@shlinux89>
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
 <20260505-clk-determine-rate-noop-v3-4-f3f829fbacdf@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505-clk-determine-rate-noop-v3-4-f3f829fbacdf@redhat.com>
X-ClientProxiedBy: SI2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::6)
 To MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12330:EE_|DB9PR04MB8220:EE_
X-MS-Office365-Filtering-Correlation-Id: ba577868-663b-4ab0-22cd-08deb476f1bd
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|366016|1800799024|4143699003|11063799003|22082099003|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	qrJzOCiT6AV4EnMF/gQ4TnHsR2GaY4QltClGfB44eCh4eEwlQmg49joIPw8u+gO9rC/+83pr8QCJ1uxMa5c28REq6Y2u7hTzzqNQ2+l7cgNKYyolXk9MFPBlIOgug65wkAwxj/4WWt5QKos+Jc8nO32cgdFPv1W3EIIPY88GmFsNcx4YZC7z3WEQ1AAjHneNM2PFk4oa4NUUbebbBbOFl0zDjvS/QZoGm8nXJbsb861JNL2/xvVcKJy9mOaiKDHm4BoljBA74xNOYknUOfmxc/OOWhYFdYz5CrHKHySO4nY4jeBRCyx+O4Au6bo8DF0Ww51Sw1kSwTdb2e2mV66KxD6ruWRjhChwdImp96li1xs2xokm0iuCmHpZb+QrZOYoFLrGuY1gvDW0t7+WmEHI6HAcWAcPz9ad7OWr+1AktPkQINfwEkT2Us9NM9BoSuwZ8FTBUsowM2OlDhJEM/4DGLKMBUXr7m3wLX9OrK7gegFdBpZed/qTLz86kYhY1YjcXzhqKhVfX8b9ioy9L1lKXTMRZJK6ElHAP7vX4OuJH7zrUGrkr26QzNAs+U/vX8lWkkE5xaEC8tAiDKyE7W83uym2uNHKk7fIAGVBzah6KBR1WhzV95UWNDxZjNGG95VTNyEOwp10cb0bsMH0MneECEY9mkL17pbnzYs+82le68L8CgwsfCrENZD48oyslYyHe+V+MDdAGPgYGegX2Sl0b3/3jd40pznkq4JlmpCgQdpU5i1Rbv8ucdnVgQ9zHS+x
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(366016)(1800799024)(4143699003)(11063799003)(22082099003)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7hgWFfCPJncY6bzXWOYl0f4C7OZmULc4RkO0pBRsX+ve9Jh61hvXs0IJfaTo?=
 =?us-ascii?Q?9C03yoi5wc5Hu8tZwGYSTPsAtpcjZbAaFyqNTHTOTdD84WYELjDY8DdCkIx1?=
 =?us-ascii?Q?maJT7mYMBI1z51B+9I54p9BzuxCFV9E5CUdAYeobAbcld7g10BdfjldQ8fuJ?=
 =?us-ascii?Q?81Zt3VKzmSfMYLUkmJrt7zQr7F/Hkq3IpHCJM+RWzmmUOe/uq05QW9hDDO5b?=
 =?us-ascii?Q?Nbx14qjyNZqc4UZomtIeCUh8wFDoF8EIT9CiFu/pCKe/3WqofYhAVqH1NaYa?=
 =?us-ascii?Q?2LvOiMr7+UpFrsQXinrqp2JvLKgZZGwsRyY+XVJ8fdiK5atL7n8/bzJ603qa?=
 =?us-ascii?Q?CGxD/yviVTEW/SqxEow6G5Az1oaZi0LoNQSchJl7e7/OFWdwfbnWuJMtrXiW?=
 =?us-ascii?Q?U3CFmyd8TC0IwwvCOiX8u90G7EOqHktFggr4VV+1uKb9p0zYEDkfzMMCJkhd?=
 =?us-ascii?Q?xkF89QPQcGZ1A4Do9l+fwGJIfY3Lq6J70x8UobmqYtZ0XI0agTxx3yX5IYBs?=
 =?us-ascii?Q?Kd0+fcblbc3nmPfUSxw2306cCH/AZFM6BAe9XqBmkxZKN+YUwCud7l3GNHtM?=
 =?us-ascii?Q?8MCzjJI0/a6Cx2d/MSGimJyqghIwgZMZA42K0lV/LmyImL3tILONUwMVP+kF?=
 =?us-ascii?Q?76/UDtlqq24Oi9M5pbIaxHroquD11wiprkTLZDzWJUWFvr+IR7Gu7IP11QjK?=
 =?us-ascii?Q?dA+zLKteD3JmF3kdxd2ojqJEhJkzdaH17/CY1lpRuTUq3X3Nk2Up6ZyVE7Xz?=
 =?us-ascii?Q?iwLjX89pJeRU4vr+K6jWEFbhiCuyJT++/YrCmw65rLMD3kSh0zPkmjnqjsoF?=
 =?us-ascii?Q?1qweFkLfrKGuMBOBzHSYVAufd0C1vYpOOc+uuxolw2R52ckrxIP/LO4YVg4v?=
 =?us-ascii?Q?NRt2JCbZoTHZcKyJd7YfyEOylXM8eMvRhL3CYfIzPgBqcujDYnGt+AK5Xffw?=
 =?us-ascii?Q?fltfOik7R/BAdfaHKY60JAByGeZvX8MJlnWfxZblb7ZHNAqxLBb2JoplLlIo?=
 =?us-ascii?Q?dUpKCv6c+rQNMFWCZHc2aCUkiSBVDMJeNMs2l/46rgaJ1BzOo03ZdeF3p+pT?=
 =?us-ascii?Q?kRI83Nog2RTdJt6RrvDfEN9I6aUytH3MMM+j3e4bZp4x0m18BbL5xzSDHn30?=
 =?us-ascii?Q?Wl5Lg5ni2yAlmGqYWsJycJLtgdIfzG9OMwlOgV513iEhWcdzbh3uLuN8ORAE?=
 =?us-ascii?Q?jaH6egMq6GKz6MoV0zhjLy0yTTMtOxxumGWQ1CZyNPe5wTKJqjM0kyvd45bb?=
 =?us-ascii?Q?YJj6TH1MaY8825fV4hTffeD2Wc5vLOwMeEHgD541ZbiBO1v0rAg8jmNUXK4B?=
 =?us-ascii?Q?l3Tz6lkrEkUhRIAs4RIMA04LiYJX5i5ac0KgR/yu3YfNENYNEun9AgdXzMqw?=
 =?us-ascii?Q?afzuGQ/LeTlzMC3bfAFfuuWkbDa8JLjqVcfpUl6uibZ1aNt4LoJn1cF3fyAj?=
 =?us-ascii?Q?yY1/s2Wg8yU1auOztP4J4LuseCGtSXebFI1XEOfW5rb542f8PUjVziX001lU?=
 =?us-ascii?Q?QzPypLaac0Vc0qzFqX7L2E1e+Rvs0OOhNTxvCxsk6kV7J4Jg707RoeLDsKHe?=
 =?us-ascii?Q?1Ico2qSvJ3gaE1Rj2tB9OkFA9rKta/Bv18NILkD29JsGxlsIWFXk/nQT8Rcf?=
 =?us-ascii?Q?0smdX+rStP48eMIzIcGriAyWRNU7RDeRmrAulR1KQtkZiJavTEGAECsMsUjN?=
 =?us-ascii?Q?qgQ/f9Xcx35odNVPGi+oVl1PQ9GIOXtLf4uxjlKIA5Co+lq5k9x5nPYil7/9?=
 =?us-ascii?Q?iv2AFh/mGg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba577868-663b-4ab0-22cd-08deb476f1bd
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12330.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 00:46:48.9894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YJD5v8bh7wrrFev5ksx2+/3+DGCMRQuDIUTDiBx2/LC7oWT7ZcpxcqjACLv4IzUQXC08Wd2pqK7bEq4gCaQRjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8220

On Tue, May 05, 2026 at 08:49:00PM -0400, Brian Masney wrote:
>Drop the driver-specific empty determine_rate() function and use the new
>shared clk_determine_rate_noop() helper.
>
>Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
