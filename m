Received: from mx08-0061a602.pphosted.com (mx08-0061a602.pphosted.com [205.220.185.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AFD19E97B
	for <linux-clk@vger.kernel.org>; Mon,  2 Sep 2024 14:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.185.213
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725286732; cv=fail; b=Tuk5OztojF1e7066DCwvYji1sz3VTh0FloAy5lf0MKbZx8be1DZulOG9R7MRwdVpRZiV+v3bzyBMsJCsbGwM4wLMPBL6jPpaSJb47aFs4E7MoVRZnH2tsAROdG7/sAcXxZd9j89ml8Jaf14qDXx0hgD7SeGB4LGlGdUe5m+mZA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725286732; c=relaxed/simple;
	bh=0B76Yp+Ijs01pe597P27eGSu5sbqD1x32Ns5GSA5RUc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tqG6JBPStXAgKDF38g564yS7yaoNJO5xy1A2TBOIFoHFCP+dglhFe4fOoemVaGp/13Juhd1IqAZj5202WBFnpObKOe4k2IPjUpcW/zXNcSjiP+U2WLGSXACCwwdNg9Q6ImkVvQ0hSLN47+lzwc3Fv0aXburRAICySyvzamAtgSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ttcontrol.com; spf=pass smtp.mailfrom=ttcontrol.com; dkim=pass (2048-bit key) header.d=ttcontrol.com header.i=@ttcontrol.com header.b=BnBo/MCD; arc=fail smtp.client-ip=205.220.185.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ttcontrol.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ttcontrol.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ttcontrol.com header.i=@ttcontrol.com header.b="BnBo/MCD"
Received: from pps.filterd (m0278994.ppops.net [127.0.0.1])
	by mx07-0061a602.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 482DWkAH016046;
	Mon, 2 Sep 2024 14:18:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ttcontrol.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	s2021; bh=eBbwr8sUp6TVZt2DGhYafTV/Eo+QUMDygu3bpu04Rt4=; b=BnBo/M
	CDGbH/k1VP26c5r6T2Atrosumz0cQtVQjlp0Y37MJfK5NuDQIJ5fBonMwwrgog8g
	B4paqPgiM6lF9Xsw2HgJTnh5XXiDY+UARpRLF3woZk/y1kgXjTdjv38GmTg4Mfq/
	yvhqdwHjU/KD2QrH+xgMeutNCdxvzfYQKOmwKr1jeyDzasgR/rzg+GyrTZnkf2g8
	i6Du/L1ARvFQEOZEONqa7d9DZ/wVKEP4el9w+0hdlbu7gLaBpmRED1OeYqU6cc7x
	N6Gu1foRQR5oSI+3M1jfU+pMUlo3Pr0TtOixSU0dV67/kAFQKYsyrLDEQgfd9G9q
	F2zl6i/N1/RBayag==
Received: from db3pr0202cu003.outbound.protection.outlook.com (mail-northeuropeazlp17011022.outbound.protection.outlook.com [40.93.64.22])
	by mx07-0061a602.pphosted.com (PPS) with ESMTPS id 41brd0252v-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Sep 2024 14:18:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P8e/pKU+Si4J4zFuIW0stKZfhmPk2Re3C7UX7mNnHBU+gYGRLVY1Gwk1sKnCmHsui+9Nh78fDYaeziUgH8mN6Zdl56uAmM5O6lWf9cTk8oeKeWMg2bUTNHu4oU/X7gLHRrtJTQr1pl7YGeQ/PVke4UtfAaeJvt+RVcHWlrjOBz0QlhG3ZGh84S+zOeM5EPhkIZxuCgYyv+ol73NHeM5t8Xsf/QKMkyM6AJY5MDHA110pff6bfXgh5+tenggAPNNAK+fvGEoOvdeD1O1k3yf0HlSVqCuwfuQD4O/44I54c82tH/ZHUgPzLuQX+Wx6JpMV1KdjCrsSaUJP9Oik+8lrSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eBbwr8sUp6TVZt2DGhYafTV/Eo+QUMDygu3bpu04Rt4=;
 b=W5AbG/vpKyyENJGGYBN3HV/IFuko0tLIZT1oYXmdZfrgMB5zHHsyBEEuLtZVCDt0lLkaoRIExHl7qPuYh8400r3tZzVkWrWMeLP2xfEA1jgACtwPkv0v/BOBUAynmE7DGUpF5x2aaPIjpgq+yklfwjN/7QLSvXse+y5y3+zFnpRt2vPz6epWchyekzXpGc1AAq61qnwf7PyvAPEO6Nhye+MPwXn+u4QYKB98ujoz9+dljTW294igOjhMXYNIH+1je9mYrcGgeizii3TmyJu+RZlzuv378Rz8rIJgn6zc6QMxDy6UYIjTegNJssK0fVFjQ7OsCimzk2eTmycMONzeRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ttcontrol.com; dmarc=pass action=none
 header.from=ttcontrol.com; dkim=pass header.d=ttcontrol.com; arc=none
Received: from DU0PR01MB9382.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:32d::6) by AM7PR01MB6675.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:1a7::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Mon, 2 Sep
 2024 14:18:10 +0000
Received: from DU0PR01MB9382.eurprd01.prod.exchangelabs.com
 ([fe80::c41d:dc9b:3f97:1ae1]) by DU0PR01MB9382.eurprd01.prod.exchangelabs.com
 ([fe80::c41d:dc9b:3f97:1ae1%7]) with mapi id 15.20.7918.024; Mon, 2 Sep 2024
 14:18:10 +0000
From: Diogo Manuel Pais Silva <diogo.pais@ttcontrol.com>
To: Abel Vesa <abel.vesa@linaro.org>
CC: Peng Fan <peng.fan@nxp.com>, "abelvesa@kernel.org" <abelvesa@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "kernel@pengutronix.de"
	<kernel@pengutronix.de>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
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
Subject: [PATCH v3] clk: imx8qxp: Defer instead of failing probe
Thread-Topic: [PATCH v3] clk: imx8qxp: Defer instead of failing probe
Thread-Index: AQHa/ULwBX4QDqA/8Ua7zDhzNMik3g==
Date: Mon, 2 Sep 2024 14:18:10 +0000
Message-ID:
 <DU0PR01MB9382A2BBCCD8C786121975B89D922@DU0PR01MB9382.eurprd01.prod.exchangelabs.com>
References:
 <DU0PR01MB93828B0E6808E33C608BC0E29DD32@DU0PR01MB9382.eurprd01.prod.exchangelabs.com>
 <AM6PR04MB5941651E3920794104B3D24F88D32@AM6PR04MB5941.eurprd04.prod.outlook.com>
 <DU0PR01MB9382F1AC496F22A20C074BDE9DDC2@DU0PR01MB9382.eurprd01.prod.exchangelabs.com>
 <Zs7gXhohOyQ/abOf@linaro.org>
In-Reply-To: <Zs7gXhohOyQ/abOf@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_6d12e765-bdb3-4a42-8d1e-507ff5c9fe67_Enabled=True;MSIP_Label_6d12e765-bdb3-4a42-8d1e-507ff5c9fe67_SiteId=5638dc0c-ffa2-418f-8078-70f739ff781f;MSIP_Label_6d12e765-bdb3-4a42-8d1e-507ff5c9fe67_SetDate=2024-09-02T14:18:09.837Z;MSIP_Label_6d12e765-bdb3-4a42-8d1e-507ff5c9fe67_Name=TTControl
 -
 Public;MSIP_Label_6d12e765-bdb3-4a42-8d1e-507ff5c9fe67_ContentBits=0;MSIP_Label_6d12e765-bdb3-4a42-8d1e-507ff5c9fe67_Method=Privileged;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR01MB9382:EE_|AM7PR01MB6675:EE_
x-ms-office365-filtering-correlation-id: da2f63ff-360f-429d-ed97-08dccb5a12b3
x-ld-processed: 5638dc0c-ffa2-418f-8078-70f739ff781f,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?s0wNOuSlY3ezp8zlsVF++0JMGw3l3Mq3Her3PWqqfFrScs3Zm9tivlS39c?=
 =?iso-8859-1?Q?cmUHPSvOMHpKeUzctlmKoWO11MbN596lBHb1inA9dKggdJojpkpAwMOxmF?=
 =?iso-8859-1?Q?QUYd0byz6qbH80deT844UI3DLJZcZvQEiqwSKLdPR52IYJLY+sqKFzq0cy?=
 =?iso-8859-1?Q?lA9K6JsNBCRImlPSu6hyQYWqa83m+unyBMiyqcX6ELBU254miPZxtMdJ8a?=
 =?iso-8859-1?Q?R1fE88Oz2fmrKpHHvq+4qFH5+/zzBANUZKVV7M6qWicAgO0UlNlLw3ovRR?=
 =?iso-8859-1?Q?5GxgfucDb3hj/5Jlgr0RqXxWet1j2BgcynvHnKkVjeOgoI3s1gIhoS8iOT?=
 =?iso-8859-1?Q?Rkvpvy5yMklgM4doJlMd+N+4rQ7Ru93+GhUJcIdpm7U/KbgyGO5SweCko3?=
 =?iso-8859-1?Q?T+peGNEmUcN0nFBZf0oxM0/YDDudJp8anKwWPjnn9k4IJeEiVDEPhFspMI?=
 =?iso-8859-1?Q?djOx2mzyVeYaashynre0YVyElINC7U8NOhE8qoHQYHBQrdsQombyLnbcxc?=
 =?iso-8859-1?Q?Zg0/nzGZ+O96iPRjc7MI+uSmJeICAj9Jd4Ka3x4DV8V/Qi+iWzde1PsLrg?=
 =?iso-8859-1?Q?+8r6W9fLRdq0NsF9OwaGx/s9DkKEOGO9sA7R41TBP3yvopNUtw0KAVb8/l?=
 =?iso-8859-1?Q?kc/VUQuBrM7bStd9Gz3Si8GXwY1mtLCq933PiVxm3cpCAeiQ5AWE+J1l0S?=
 =?iso-8859-1?Q?nezCgNmCeKJDIEZzrLWmjDHuuHJvL92hlapGYiHjZRZ8vfP1AtDWYNXzFM?=
 =?iso-8859-1?Q?L+x7tZuG0Ra3o+1Ti0KYkpA5xvP3ER4e/CtbqZlDbNntoctIIDeiwQdKn/?=
 =?iso-8859-1?Q?JTwLA/6v5o4yyFH387PiWEwAPcZruS4fWI+fKiBu6N7DxtlXqnXXaWuPet?=
 =?iso-8859-1?Q?QgAgsdPmq4DeeZBXH0zTd8/m+UWhMPFbw59gKWFQ+XxwSsZf3jX8rtiftF?=
 =?iso-8859-1?Q?/gKX2c32mffLqWrMl8A0exIXk1+XiJB6YZ+BU9Nvxv8yhfjvzzLuSMhSqO?=
 =?iso-8859-1?Q?w3lDdrZasC0Px09tYBLPZiVzeWx+o/qLN0k0xDxTX3Rf2wjKOBcnVBMD4b?=
 =?iso-8859-1?Q?BRxUFmnKKesvLjxKw9RALJ/V6D2jjmJxN3Dg/Csb34ymwks8JzfJehLJV/?=
 =?iso-8859-1?Q?WRv4sJL5VujJ19+4hdPNMeie6HFjxgNsKzUZUGk5u/1s9Vt3RX/Yo5Lpfd?=
 =?iso-8859-1?Q?rDT8+rfrChMs/6gjRYW7PQZ/fRRTWiVR2Vr+wucxngXp/Tlzje6CyTevoM?=
 =?iso-8859-1?Q?mosAaUSL1ZN+lZ6zG304+gbvvJFBy1bKQOPBsjSpaS8hb0yA5oNJlwnry2?=
 =?iso-8859-1?Q?JIHL1n+GcAMNWUfptz7HQjGyJ6VX+3D0qyo7iNejVbeUVxCEe/+HRUEjdP?=
 =?iso-8859-1?Q?Azd2ayl0fUvX5jDAGWDtMzVMCOV1+c7YzZFXLTMTU7VdrTlnAtWIP0F0ba?=
 =?iso-8859-1?Q?CS3vCMOwFF0XOcimhg1EgW1hpSfdtY2ZyDqN1w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR01MB9382.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ye8jV0BCoTK22Xd8J/mkE8zA8qWBi8CB143BP27pAZjOg2QqelpR4wLES9?=
 =?iso-8859-1?Q?3AQSjErQ/qqT81yIcPW6DmdMhPVblSaKvPmyA3TRkeCcLTYB+afls0tvMU?=
 =?iso-8859-1?Q?OSGE3AwEpfGELdsdmZfyz0JT4b4MUzKNn+dB2AaQ89nydbPvdmn2fU1LSV?=
 =?iso-8859-1?Q?1ocbmo0Uqk7xvS76/MI1WBLa/9wj1ga56HOom9spR4PCsMEarbuiN95v7N?=
 =?iso-8859-1?Q?kMCb41B1NJwgaAvRGhP/cwN7jILPJLGV+KYK2EQjuGF2QYNRfDhrXxlWEy?=
 =?iso-8859-1?Q?yL/Wb/c6li2/yy+jfuv+KPAod55ygBysAm7FNCh+CJjIa9sQ8a8FNY3o8e?=
 =?iso-8859-1?Q?8nXf6IPbkgsrbXCocg3A6Fh8U+Iip6ifLrZ7iAkuvQR9Y7m9oiT8z2bm8S?=
 =?iso-8859-1?Q?2rB37cT9HXH9hH42HLP2vh9pFN+hZB3a8FswkFBBZ8rIQX3IUqiiZIK2w8?=
 =?iso-8859-1?Q?hGuO52FPF15H4fgkE/nF7CyomLi71SrbhYpgnnF3NOlkKXnWCpxvsaaVeY?=
 =?iso-8859-1?Q?SC1uuuZJ8luvMs0+pw/So0daMi5J1++Ey32hXTIhkJkpjVwrUIuqeu7Yyy?=
 =?iso-8859-1?Q?yfaCqiqda7FUYCGXKFmq6CyhygIxujoPjntiR7cTI5+HT7vnZOfXPIRmtA?=
 =?iso-8859-1?Q?IXXAEY0680ZkcmFxzEfAjemTpZMA6N4tDDC8AZ/uyYESVOW2KhHfiX4acv?=
 =?iso-8859-1?Q?Vuq6s5upSkT4Rv7J/T/caZ9sqOC94j0y+t4c84+pxJE0CHluRBti8HAlle?=
 =?iso-8859-1?Q?Hj3jW9PjHCzSash4xw4tpz9IuA6aKG4wkWjayeu9njbP355G7tQm3bBco8?=
 =?iso-8859-1?Q?a6eG5fxKwmGYWeMhGLuFmLxBWXiCh5Hm7heeQm6DLfka+BH96pcua6QFvJ?=
 =?iso-8859-1?Q?1/oHncVKeGwGxaDQoq0u4sw5hjhG8xXUK9wGXuutKBPf1q1+9uUOfACfDo?=
 =?iso-8859-1?Q?OERQ/5OFQjWngLTPV8eVOeBscG5I8ehYFdahNK/Cgz2D8fvJKaDmyf9B2q?=
 =?iso-8859-1?Q?Glv8HC1ra2y0IUbvnep2KULOVKhyvSH9her8uE42BQD70gMWTuA6Nf0pBY?=
 =?iso-8859-1?Q?dTm+u45NHThxUs1B+lA0SJ78QTQkkNT82abUMmygmPksIpGWi1RSQfxpx+?=
 =?iso-8859-1?Q?fyGeEi/v+3P+ly6oof1Q3K+hi0l8Slvz/9SBs6vl+OuRtkw11i7JGM6Nv9?=
 =?iso-8859-1?Q?DGfCYPrzpvnt1QykqG03N5b0uUhXopGMnTcORgWbs+b9zGmHIRHuoUJqgY?=
 =?iso-8859-1?Q?WxrtF/UVHYbGyNoWTwK65kxlzQavJx3nLEVeKFhm6S1M7iMJGoC3L6iTJ8?=
 =?iso-8859-1?Q?tI6UjWLQZQjalbuytDM4biJhocXqJskDqxuzNMoCtX8vIQZxx2S9CMT1VO?=
 =?iso-8859-1?Q?VmQ03gI6+nUB6KPJBq2+i36/QHNtA2BBNdzM1Jb7qmnUN1keMbntYjULQS?=
 =?iso-8859-1?Q?rmDgpciPdlebgajctZB2bY90dl94eCrUeZEwrWPQ7z9ZMGy19/G9apB6T/?=
 =?iso-8859-1?Q?cB/Wh2bkcph4I/Hakk4DfRRlBKSvnj00fi/54uyq1ROR0Th3uBV3lTbgxd?=
 =?iso-8859-1?Q?Bnl4dyY5AO41fjlhqm/5Bqo8fUg93lTbaF2fTZiPxOgMKh518x8u+Cp/2b?=
 =?iso-8859-1?Q?Kg4iCNADNSHCm16rRmmk3IRaGxWNdT6z+Y?=
Content-Type: text/plain; charset="iso-8859-1"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: da2f63ff-360f-429d-ed97-08dccb5a12b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2024 14:18:10.1004
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5638dc0c-ffa2-418f-8078-70f739ff781f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cSH9XGCPg8co14RXQz3+j6QbVYd7jL6AW9YaMq90zaIyBqkvwBYKvPbcTcj6iqGaDvweyqg1mCa72V7GvzKE0VD+dBdL+bg8DM2JF0Bdwys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR01MB6675
X-Authority-Analysis: v=2.4 cv=C4i7yhP+ c=1 sm=1 tr=0 ts=66d5c925 cx=c_pps a=thxcoxaKSrYYC4Q79zeVCQ==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=EaEq8P2WXUwA:10 a=9E89HhfwiosA:10 a=EZQmGfNXMHUA:10 a=nxb4IF0AAAAA:8
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=IpJZQVW2AAAA:8 a=pGLkceISAAAA:8 a=rsmfmBjOAAAA:8 a=gwMhcH0e1l1swrN3wTsA:9 a=wPNLvfGTeEIA:10 a=muotpCzfy8uUhEcWaHt4:22 a=cvBusfyB2V15izCimMoJ:22 a=1CNFftbPRP8L7MoqJWF3:22 a=IawgGOuG5U0WyFbmm1f5:22
 a=5SoQ0aNoiOvKt2feW1sf:22
X-Proofpoint-ORIG-GUID: PFHpBhMnNeD1ssGO8qq8bFEvvozN4oyJ
X-Proofpoint-GUID: PFHpBhMnNeD1ssGO8qq8bFEvvozN4oyJ

When of_clk_parent_fill is ran without all the parent clocks having been
probed then the probe function will return -EINVAL, making it so that
the probe isn't attempted again. As fw_devlink is on by default this
does not usually happen, but if fw_devlink is disabled then it is very
possible that the parent clock will be probed after the lpcg first
attempt.

Signed-off-by: Diogo Silva <diogo.pais@ttcontrol.com>
---
v2: change from dev_warn to dev_err_probe
v3: refresh patch
---
 drivers/clk/imx/clk-imx8qxp-lpcg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8q=
xp-lpcg.c
index d0ccaa040225..cae8f6060fe8 100644
--- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
+++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
@@ -225,8 +225,8 @@ static int imx_lpcg_parse_clks_from_dt(struct platform_=
device *pdev,

        ret =3D of_clk_parent_fill(np, parent_names, count);
        if (ret !=3D count) {
-               dev_err(&pdev->dev, "failed to get clock parent names\n");
-               return count;
+               return dev_err_probe(&pdev->dev, -EPROBE_DEFER,
+                                    "failed to get all clock parent names\=
n");
        }

        ret =3D of_property_read_string_array(np, "clock-output-names",
--
2.34.1
________________________________________
From: Abel Vesa <abel.vesa@linaro.org>
Sent: Wednesday, August 28, 2024 10:31 AM
To: Diogo Manuel Pais Silva
Cc: Peng Fan; abelvesa@kernel.org; linux-clk@vger.kernel.org; shawnguo@kern=
el.org; kernel@pengutronix.de; s.hauer@pengutronix.de; linux-arm-kernel@lis=
ts.infradead.org; sboyd@kernel.org; mturquette@baylibre.com; festevam@gmail=
.com; imx@lists.linux.dev; EMC: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: imx8qxp: Defer instead of failing probe

On 24-07-02 08:10:44, Diogo Manuel Pais Silva wrote:
> When of_clk_parent_fill is ran without all the parent clocks having been =
probed then the probe function will return -EINVAL, making it so that the p=
robe isn't attempted again. As fw_devlink is on by default this does not us=
ually happen, but if fw_devlink is disabled then it is very possible that t=
he parent clock will be probed after the lpcg first attempt.
>
> Signed-off-by: Diogo Silva <diogo.pais@ttcontrol.com>

This patch doesn't apply cleanly.

Please respin.

Thanks!

> ---
> v2: change from dev_warn to dev_err_probe
> ---
>  drivers/clk/imx/clk-imx8qxp-lpcg.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx=
8qxp-lpcg.c
> index d0ccaa040225..7bd9b745edbe 100644
> --- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
> +++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
> @@ -225,8 +225,8 @@ static int imx_lpcg_parse_clks_from_dt(struct platfor=
m_device *pdev,
>
>       ret =3D of_clk_parent_fill(np, parent_names, count);
>       if (ret !=3D count) {
> -             dev_err(&pdev->dev, "failed to get clock parent names\n");
> -             return count;
> +             return dev_err_probe(&pdev->dev, -EPROBE_DEFER,
> +                             "failed to get all clock parent names\n");
>       }
>
>       ret =3D of_property_read_string_array(np, "clock-output-names",
> --
> 2.34.1
CONFIDENTIALITY: The contents of this e-mail are confidential and intended =
only for the above addressee(s). If you are not the intended recipient, or =
the person responsible for delivering it to the intended recipient, copying=
 or delivering it to anyone else or using it in any unauthorized manner is =
prohibited and may be unlawful. If you receive this e-mail by mistake, plea=
se notify the sender and the systems administrator at straymail@tttech.com =
immediately.
