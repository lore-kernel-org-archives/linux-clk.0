Received: from mx07-0061a602.pphosted.com (mx07-0061a602.pphosted.com [143.55.144.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2329136126
	for <linux-clk@vger.kernel.org>; Mon,  1 Jul 2024 11:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=143.55.144.161
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719834892; cv=fail; b=HNRj0AzpXD+Fc+70UfJamfpqAZk+b0pWYj+qArf6lXlAu4CmOja4PGtb4iv1ajzqX5dF9uao8K/zxi0OQxid3KSmH0GnKx4s8WPhGv9eUxAfgTEFllPqIIxjZqkVkoV//ym0iw6JQRHIDm3u+29ED+tGezl3c/ZVIytO80JNlJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719834892; c=relaxed/simple;
	bh=PwsEdx4YHo5TZ4khsZy5wUlaUPr6Xtj8yrbCBSGwJ9E=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=dgjtFgVcuzA0AYz4SuYWBiNXY3pfWbn8VxINx+Zoj6WMBsFeNYSe0wqlg/nCkz/+nlySkKMR8zboIuX/MeDyEYhnOVJaB8Ht5WKSxqlmcEo4V164ladch5hIyrpzqPTprYd4/lTxlRvzRz6Hq0NP7rSrnB+DcgV1GuNZwEXiIxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ttcontrol.com; spf=pass smtp.mailfrom=ttcontrol.com; dkim=pass (2048-bit key) header.d=ttcontrol.com header.i=@ttcontrol.com header.b=qb2D/rzF; arc=fail smtp.client-ip=143.55.144.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ttcontrol.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ttcontrol.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ttcontrol.com header.i=@ttcontrol.com header.b="qb2D/rzF"
Received: from pps.filterd (m0278995.ppops.net [127.0.0.1])
	by mx07-0061a602.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4613Ss6K025878;
	Mon, 1 Jul 2024 11:54:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ttcontrol.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=s2021; bh=msHn4OBppFtOg9fbkP8RaEPo1o
	6ZtsEMCzEEY5Yn70g=; b=qb2D/rzFvPAWeYxPgRwP0xmqkxw8JUJkom7446KpEZ
	O6kJ7JXjx+tVYzxuQVg8ZDVFpo74bHasL5/+XNpDgILLZLe+zDMSajEhI33QGhNW
	DLM/QO75RX+OzH8JLA8DPztfrYF1wbAr3eRwBQ4AkJ8H0RdY6vVzk1m5F1EkewOq
	I4SuCw7j8kPwGvq/ckmicPLFXuA8crOGMqTyJsuvTT3C4aoBi3Y/ygbATpaakQTu
	X0OP/XyYcDbWi80lw8LtnMuZvDXlGPfysdT1Wp9+V6Ry21IZh8FODtMZir2xCwoV
	cm3zEfmmcmU1f1eUPbbEm2KI6q2hlfxZaXn9jSPyNTDg==
Received: from eur05-vi1-obe.outbound.protection.outlook.com (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
	by mx07-0061a602.pphosted.com (PPS) with ESMTPS id 4027c8a6yv-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 11:54:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yug6dInCo/mIYEmAmT+1AzflIVGcSWAfk/jsL2iveZAv3Yx7w39aJtI5RJdZ+vCnQMOsXj6HpB0S8vsJrBMQgsXzMhh1MzujFMt7tK6TG5WploiVuErcD6VeWPL1jXbbr/OK2mD2k2QWMU3q3UEuoEWYmJwFXpLQyCFqi/zL88PhWe8NiJuW2uEieqw163T2ND6IyaGVFdCWUw2UOfvqOl9GQD8J42BCsSM5gnw1I4s/2PASO2HJlGyed4f+7VX3rfxxPZhsMht+8gojPCDAen3xXzb3jf9c6tlyjCpcsPEZY5e0JzpG85oekY82Y42JsbttRmIjflDuvDBHk/5++A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=msHn4OBppFtOg9fbkP8RaEPo1o6ZtsEMCzEEY5Yn70g=;
 b=jQLLrivhka09MITZrkJs28yFy8ZcuafmaOHwdNp2k0a46aUqkrBdUYQr7l90MAawgzSA3Jm3M6+Lym8lAEmwiG+m119dRY/fHNJ5c1/507/QbXpA4G+4gSQ01sDCBshFKfDpZLkIUW4Y2zFzIWMrutoXyd+RRyzr8pCeySzdVcJK8PVCnFyJRTlq/H+4eMa5Z1ucJgtKMsyeGunTRtutjVKUXKt8pkU1eMZ7vlchbll41W8NVpd6SDybNEry5fkaGB0k2ngyo5+yzkkI7ghWdx7LVeX3Um6eMKjG9QSzp2/cCKKCkNIg638TM4y57lLN0ha6GEc7EocGODeIU99IOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ttcontrol.com; dmarc=pass action=none
 header.from=ttcontrol.com; dkim=pass header.d=ttcontrol.com; arc=none
Received: from DU0PR01MB9382.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:32d::6) by DB9PR01MB9295.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:364::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Mon, 1 Jul
 2024 11:54:13 +0000
Received: from DU0PR01MB9382.eurprd01.prod.exchangelabs.com
 ([fe80::c41d:dc9b:3f97:1ae1]) by DU0PR01MB9382.eurprd01.prod.exchangelabs.com
 ([fe80::c41d:dc9b:3f97:1ae1%6]) with mapi id 15.20.7719.028; Mon, 1 Jul 2024
 11:54:13 +0000
From: Diogo Manuel Pais Silva <diogo.pais@ttcontrol.com>
To: "abelvesa@kernel.org" <abelvesa@kernel.org>,
        "peng.fan@nxp.com"
	<peng.fan@nxp.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "shawnguo@kernel.org"
	<shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com"
	<festevam@gmail.com>,
        "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "EMC: linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] clk: imx8qxp: Defer instead of failing probe
Thread-Topic: [PATCH] clk: imx8qxp: Defer instead of failing probe
Thread-Index: AdrLqtcnJw5WiRwIS5yj3rdrX17wMw==
Date: Mon, 1 Jul 2024 11:54:13 +0000
Message-ID: 
 <DU0PR01MB93828B0E6808E33C608BC0E29DD32@DU0PR01MB9382.eurprd01.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_48ac2777-9b6c-4bb5-936f-abd66d5117c3_ActionId=0780da09-e070-467a-9fca-39c6d5ee4255;MSIP_Label_48ac2777-9b6c-4bb5-936f-abd66d5117c3_ContentBits=0;MSIP_Label_48ac2777-9b6c-4bb5-936f-abd66d5117c3_Enabled=true;MSIP_Label_48ac2777-9b6c-4bb5-936f-abd66d5117c3_Method=Standard;MSIP_Label_48ac2777-9b6c-4bb5-936f-abd66d5117c3_Name=TTControl-Internal;MSIP_Label_48ac2777-9b6c-4bb5-936f-abd66d5117c3_SetDate=2024-07-01T11:34:07Z;MSIP_Label_48ac2777-9b6c-4bb5-936f-abd66d5117c3_SiteId=5638dc0c-ffa2-418f-8078-70f739ff781f;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR01MB9382:EE_|DB9PR01MB9295:EE_
x-ms-office365-filtering-correlation-id: 7c5813cd-e9a9-4045-6e50-08dc99c486e5
x-ld-processed: 5638dc0c-ffa2-418f-8078-70f739ff781f,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018|921020;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?c2h0R+2jhAhSjMAmtUEEl4Wa+xdB6v7jEfPWrQ47pIUZuEoSusi7EodhFZ9c?=
 =?us-ascii?Q?ZlePUwqoRpOEPRa4FYipUfeAycpJa3HiX+DZbBR7OR0d19ULgyLuniw5S4Yv?=
 =?us-ascii?Q?cY1qNF9/a5Nz/f3eij7VRlBZTL9769JNN13MHIdBuplqJ8NE46pcaecfYmmp?=
 =?us-ascii?Q?yriyE77Y4LbarC+J56yHzEh4HdsShQHy7rrpy1cN9KcLJjpP4QCp1M9aZlMT?=
 =?us-ascii?Q?xHnvtLFk1ksORP77rT0QooYour7M+xMIpIUGrfy3PcRlOCc1De47D+kTjaqj?=
 =?us-ascii?Q?4WXi5zdAh6NJzNYlzgoCcW7fX6osiyIyI6lvbrZRwn1+eRZmFCyYu3CYXF4U?=
 =?us-ascii?Q?1lOC74SNeBEWgdfHdA/0iXnrbnEWi6PTBm4w9pl/T0qlHSx94eiWb2JS2tur?=
 =?us-ascii?Q?0pWBqf45/b1gSqSeoPWFjjkYb2ZWtyA6eB7E1unZF23LJXcZSs4D+F4qXCxu?=
 =?us-ascii?Q?3HuBG4vfAY4OWOqHK9Gjp9aor6YWu3cbuQNVmpxGzzdLkZH0sTtAvQluVLUr?=
 =?us-ascii?Q?M/nng39791HQV5l8AQ1b4DyhLS35v5QQe1jW1MOcN3ChLo0ix56wssdFI0N7?=
 =?us-ascii?Q?nVy1I6qzL9FWSnETBRy8fCNXW2jW/HmLzBegr2GeVzcidQruJySNFvjDzwCa?=
 =?us-ascii?Q?9v2NStgyQeLyoKdqpy13WjweoFqGC3XRumy9hGVKhUmYyt3gmlj9YLrJwemu?=
 =?us-ascii?Q?2H7jMo38KgCV7xaJBoqix8yhCrjqGrqfVaS/i1Rf+XJAIs2LTpHsONPM1PSz?=
 =?us-ascii?Q?Xlwqi4Z+ameCfvMJF1sJVSfknce12S3Y+qRuKTt+0GhGHWEehUyrgYZMWV1X?=
 =?us-ascii?Q?wCqtC3AaA+tv7BxjyNcMQXwZRXvN1PMPg/zGwwInEc+u9G2OUR/8PelPtRsq?=
 =?us-ascii?Q?BcWQthyDBay/sjPIkpAChkqw9G2KcbfUpcqrjJGR2BPKOnDlQkLeQgaquLXw?=
 =?us-ascii?Q?U/U6u5enCyEFyIInDqXgQFj5+Cskb1PHR4U8Z0TimkQ8PptSYP8//TnCwm8D?=
 =?us-ascii?Q?PKUz/XMgbnrLn1jvOsd//S6CoiswIqgtXlcwKqRchFebGwqtlrTazHenCDXC?=
 =?us-ascii?Q?R/WxWRNXhmjFBAkOSoIwPChDnMYHw87awdaHbrbAsTpEIE7rINWK4ALrYikl?=
 =?us-ascii?Q?wuORq8iddg238NmSru5ZAKCfiPfEdBFInHa3SCIuXrceSTOwF2/+YR7CaVRm?=
 =?us-ascii?Q?3XncScq2HzsXRe/dB80NHLcm+/QUZSSCIO0oXVuGd+XnJHR3zGYt+tplm0V4?=
 =?us-ascii?Q?UyM8ahB/1Bzsc9ViBJvjKuiLtOsL7PM4p/d86UJNMpzBsCyVk5au2GGbYHms?=
 =?us-ascii?Q?RHB4/spE5c180ZiA4ILm1DxhWhNLwUmyRT0pg7LXQBK/eh+0m4Hh9O7GfRvs?=
 =?us-ascii?Q?1wGD/WXw8xW6g0sabTaQQSID2NGSoBtEv7gBcxzG6whTawdtJth2v0QP2VXs?=
 =?us-ascii?Q?iWbvoGCWBAc=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR01MB9382.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?3QvROuBwqmRqzVwe8r8yg0csj9dPeK2TGqcuUXYYOuVXUqrNINJJLsssSlMQ?=
 =?us-ascii?Q?P6PIZu2KRUl8iKREBSrmfcIXl+/HTx7DOCBVKgYwcyH8dtooPJVhNMBTWERZ?=
 =?us-ascii?Q?+2xrurwOqOnKIFTPNflyOtptham0pNB2h3haXpPsHq2nKfrxq3/KzcpSNyab?=
 =?us-ascii?Q?uY67sAMrwUko+76K2FxWBlvQWiFlnC4hXsHrHNHMVINqbdCCDrMpjofUlx9c?=
 =?us-ascii?Q?E6GX5Wo+QWw2iy37OaTnlhjuHNjpbeHEdokbNvFRZn1oAfH20slLBCed40ac?=
 =?us-ascii?Q?0InqKuE94yil6fmtDgJIrjDAm+ZuH3xLB7KGtZqhMCUi+d5TSmLl3RTypNAj?=
 =?us-ascii?Q?s1rMTRWd0sAV7lEaAcYZuk87eHTa1TqwG46lLq+YFfyycCjMhQzQL/9wi0ju?=
 =?us-ascii?Q?OuHKr0uLT92J9x1iNcwPFQFJ1+RvN4YTMqC8jrEQqdrI8yIeea4o1vbAMiXw?=
 =?us-ascii?Q?3HnJUaB86N/gG8pKA9u8vkcprhKD7VUDF7gkNz7x1szF7PScL9qw2oL0iKqo?=
 =?us-ascii?Q?uwDaWJ7lN8LCJy4+reIY7fbV8CL8CjDJkDItCHQBASm9U/5K4zRP6bpamJ/s?=
 =?us-ascii?Q?aT9MbhmWIyW7varmyoerjWR5/PAmfT6uTC0MaadMW6bO7H6BqjDqXqELwuzX?=
 =?us-ascii?Q?L+GiVSU7XYUoFFXnLORVyOKW+9jBCBlWRHS5EE/sDzMbtdqAuz/m0eJVjpuG?=
 =?us-ascii?Q?cweloR//SsuM/y9n0CQ8CMnZoAJDA+3ZVRepvovLmaytpAV1ckCiATT2qVll?=
 =?us-ascii?Q?CM/YYTH6F1ObE7t4Y66Q4cTHBe3ysYJG1effa7IABxNr2PiHZ4IeQRwpSi9x?=
 =?us-ascii?Q?65kIynfwIi8zyBkip+V7eHLXC2bYkZ5GP7iuoeOrEb+1oyVF0x+11GVmC3bO?=
 =?us-ascii?Q?ooBPtjzO0lP5XOWTcvszXpGzIio4aVvwuapjtZNTbXqXsOoO8/N043vXNgmH?=
 =?us-ascii?Q?arm6cfGYbhADpUpOxC/WLNt10wwVYXmcHIFrBadUgUJD5EEg3ew/At90hv1U?=
 =?us-ascii?Q?rfCk4v1BjWJtZzxQ7rI0mJDVubM4rf4u3mktZ7osfEdnyROkqRualbbtKGfW?=
 =?us-ascii?Q?pekPeIG+u4tPiSlCQADXTvevqu2psYn250A/0ClWyUhQy6Ru5Em1n4zUfKqV?=
 =?us-ascii?Q?SKuSM7Su7RYItAzpx69L1/bA8P9U+GAViKSmo2wPiai7VFTwJuOYRm2GI8Vp?=
 =?us-ascii?Q?298irzOWG6Km5ZHojG19UyUhm64I+rhnEaG/VEZrLNsQ7cnFgm7zRjHD2V0U?=
 =?us-ascii?Q?Q6sd/Yb8DByA0GEyzohQSqEw2VzHGgQDjnyY8RGcmB3gNTXtfxHsD//UiV50?=
 =?us-ascii?Q?WOSJk4o/ejQsV6j81Mck+BHaTe6sRat/pM4fHUCHqQWmwLefFfVwlpns/Mue?=
 =?us-ascii?Q?Tx8CIFHXil2cImE7hQNBuJ4IEQ3b/mAIn6RHN5HheIEku1D2yK2JbY+9wzXb?=
 =?us-ascii?Q?527gZ1aHG3XJCklcJKXI6Q4J7V5+MeCpKODw96d2vdy7pU7RM5aAtwzLfOjZ?=
 =?us-ascii?Q?H73V2+3crOky5MMcQjbLjXUqBzp48z4hio8ELe8I1ekz0DbQ/zVEFQz00m04?=
 =?us-ascii?Q?ySxJl/zLZ82asq8Nmph3azPs7vl2fDJMKnHRCll0?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c5813cd-e9a9-4045-6e50-08dc99c486e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2024 11:54:13.4997
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5638dc0c-ffa2-418f-8078-70f739ff781f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jn6oJR4OCZLHWzEg0FtOAbahYih4WVs6Q6iUKC9+Wfk3HIwQ5/UAp4X3DjM+aJhlssUZzv7aPjlSky6kUpJ3Y0kjCkJqXTlS1Ic/3tjJrJA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR01MB9295
X-Proofpoint-ORIG-GUID: LLZS9DBKs88cgdUo-DGgtpokQruKYqi7
X-Proofpoint-GUID: LLZS9DBKs88cgdUo-DGgtpokQruKYqi7

When of_clk_parent_fill is run before all the parent clocks have been probe=
d then the probe function will return -EINVAL, making it so that the probe =
isn't attempted again. As fw_devlink is on by default this does not usually=
 happen, but if fw_devlink is disabled then it is very possible that the pa=
rent clock will be probed after the lpcg first attempt, and the lpcg clock =
will not work.

Signed-off-by: Diogo Silva <diogo.pais@ttcontrol.com>
---
 drivers/clk/imx/clk-imx8qxp-lpcg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8q=
xp-lpcg.c
index d0ccaa040225..520a05ea0bef 100644
--- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
+++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
@@ -225,8 +225,8 @@ static int imx_lpcg_parse_clks_from_dt(struct platform_=
device *pdev,

        ret =3D of_clk_parent_fill(np, parent_names, count);
        if (ret !=3D count) {
-               dev_err(&pdev->dev, "failed to get clock parent names\n");
-               return count;
+               dev_warn(&pdev->dev, "failed to get all clock parent names\=
n");
+               return -EPROBE_DEFER;
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

TTControl - Internal
