Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010040.outbound.protection.outlook.com [52.101.84.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E4B35CB81;
	Tue, 27 Jan 2026 15:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769526002; cv=fail; b=Gl1K/BGmZvHX76wB1u29EtFUD3ZFrcqwRx2miWB8UdvldsDc0PylO3OhXBtrroU1/Mfue8Jhaws49tyyuPKie02iI8E5Jf0d66klbqOCB2icbi3sD7p8kd22SCd9XPh7VixuwaMD6SUEgVIqCpvs9bq1a8IlzfyF+LL2rvQD/to=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769526002; c=relaxed/simple;
	bh=nBhaGMOj5bUxjNaWq858sVY9IhVOxOUymhuhpjvaCug=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iVH2wc1Gp09BVavv03rFoRSlc6fLYKGs0Sak+x/hWnFZBhOKeL+nUrS9zpcL1N3uvBlV4FtT33L9xCzTTdFKAvTYQt3IHotzBHGvQtAlycFNb/tXK9wA69lexY0D/yJnimNB2RFJ4hHi81EL7/jWAsfD2BH5dbbqFTDqS1EIEdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hBh6B0gv; arc=fail smtp.client-ip=52.101.84.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hBh6B0gv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mqoyN18fwIlfZsuiBoqJ6V3kwj7n6vdnYvU4an7TMkoAzTXbU4pzVyyWWjyRzGM3jQwzf7NCrrL42D1HuEz2V+Av4EgUaBdQfRZ3+fclIKSEnmz1emoz6K9vlmM20O9eo3/H2Earjep0kH1sJqu5VmVxW8rX4JxJRJpvvGAjF3gjJsPFpu3EmMjuAg2XjsZEbMTCxZUfdEKRJ3+jyFKoONX3Ct+byAp9h9lNeBXEOkVp4Da/foJ8ZJrKqvBLLUtHiWFycFQPDSECVQudH5M1YZs7d492/yv5Gdrm8p4NHVGaBX1pPPuR4Mu3915TkA1r/QJpEl/33dAfj5e4JGiPVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nBhaGMOj5bUxjNaWq858sVY9IhVOxOUymhuhpjvaCug=;
 b=Oyv3oBVrVRDLy8Z6e2rzcat4ZSMzAmrqVPOerfpMKVv0k1d+5J6Pxdeq7eRH7xKdqDTSV0cWaXZom0D4eVGs4F6kEQfp/b60hzzVFVglvy30guFaHjn7DLxWeOAGKga0AkLce9ChSEyzRh4ob8WGHLmtGC5KcwYUbaGzHml1A2EjtiS2mqNfTkPPDYR0lAW1ExAiRcG3KRzSY2MocWRL1Bld6W2hsikUuJSDpG54CfB8xjeNOvJJMaGXGz24nXQ/jb+WOfrVP+v3T2JvVEm6yBRBAk5LQPQzWvkz3elSLqAerMSwymNgocHmzkKD1KVfxVfdipKhwwO8nkgjoyFWSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nBhaGMOj5bUxjNaWq858sVY9IhVOxOUymhuhpjvaCug=;
 b=hBh6B0gvEKVmO55198bQTXDdrPbc2YMqBZ39Qqz9oBdoBA8q8aRsOGDKmcJbISmTuMX1mA410Eo/QUMQHfTtjz3WIJFIAsUOmxF4AqoEndCy0tORiJfn8SYk+k27irqlhEz1im2U69R8IUtc4jZ2RpD1gQdhgFABa33cTmL+UwRn3iJZ/XitYHBa+0T+0XoW08Ss7Spe/PhOZP4LBYjX/jhnLYfdwJlXNRw3vB764TrB3pjxNluiTmYkygkeSoutA9DTTGwjF+AwvWu4wX5AtkNXKtfT7zEgEVyc1+yz8v3Gjx2FmnuVu/2h6eAYK190c4qIDZ2QuqvumQ4yS9v6zg==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB11477.eurprd04.prod.outlook.com (2603:10a6:150:287::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 14:59:56 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 14:59:56 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Lukasz Majewski <lukma@nabladev.com>, Abel Vesa <abelvesa@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v3] clk: vf610: Add support for the Ethernet switch clocks
Thread-Topic: [PATCH v3] clk: vf610: Add support for the Ethernet switch
 clocks
Thread-Index: AQHcj2o9owi9wp337k+9ravv356CkLVmG7gg
Date: Tue, 27 Jan 2026 14:59:56 +0000
Message-ID:
 <PAXPR04MB845936115A4DA73A9042650C8890A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20260127085150.3040586-1-lukma@nabladev.com>
In-Reply-To: <20260127085150.3040586-1-lukma@nabladev.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|GVXPR04MB11477:EE_
x-ms-office365-filtering-correlation-id: 7d465e9a-61ea-4f3e-91ed-08de5db4bc04
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|19092799006|7416014|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?3iEP28ay3iXeJELtEZRNrIW/kBDdNNlzHM4b8Xao7oESt2MGXnLzYeXaDJc+?=
 =?us-ascii?Q?y5ejnaeB7P392juTVrcRGiN2C9KkVt+FRrtKPs6xPdGbp76tCKglMXGzkiOx?=
 =?us-ascii?Q?i9TE/MvCacpL9NdVGrv20sjuC2VhcYUJC5h32WWIQ4OTY7SvWcNpbts05Zcm?=
 =?us-ascii?Q?3iyPxes+Uz6BuJB23qhFZdqadfT4ZZnzTrZsbfT4qrCLMm7XlobAERVS8rIe?=
 =?us-ascii?Q?Cj854UgQM+vAH3BhBueGdbYrQF7tHpOylMBEmilQnGrdzqmMLGWE1dFWniSM?=
 =?us-ascii?Q?6B/cp08RL1p6hXk5IfSbNURRYpZOwKH8NTHuPAW8tR7rHwuiqMA4SSYG0Tb1?=
 =?us-ascii?Q?x8dPi0y0IYyrXnoRRDOtvFHfTTT7nEM5AbRa/A60hTM7Wdb/bmLo+vY0uI+s?=
 =?us-ascii?Q?R+w27JuzrCOSPoTH6qyw/NRgIYc+Qp/0dlhusQ/U1NjbdKvTA4aZtRH65xtE?=
 =?us-ascii?Q?Pzp5mBCtPNpbEBPDynWZYwlSfHXSIG1hAARxVoQnEVygQD1VImXJ3vC2lCLV?=
 =?us-ascii?Q?SOuJ2mZv0W2jFh8AX62KhijpcajOpglemb0oM88VPmTH7y9yxElgZKOH+jRq?=
 =?us-ascii?Q?3c1S7S4Rpg4MHC3zAVS/ny8pDLnmzaqXh7d9VYd0z8wab5sougdd6Z5x9xbg?=
 =?us-ascii?Q?AmE+x3DH+WT0U5pNoosnUXdEY9Xj+iOt1Oyt5acADFwJ662YaUXMboGM+IbX?=
 =?us-ascii?Q?8emZXSCBo53gsms3iEV9B8iTYrTtM2wMVt+blygoF5/5rQnwCTNlhODbt4su?=
 =?us-ascii?Q?vGAvwSg6Qb/nIq1SAHSz7p3Ecz4RP9VoVJmdAhCkkeIUWThzeIl0AufPiP18?=
 =?us-ascii?Q?2dmUZYXvs5N/i0wa1A0axa8J9/7bBbiqoR7yxt9kk51rj3lHjk1BiQTWM/TL?=
 =?us-ascii?Q?foxjkGRQlnWGGVYAofKDPO1ETbo7bDKMDPq/DXE/l9jX+vfSQ7c0NHjU9LT2?=
 =?us-ascii?Q?PqfQRiKZuL5VTOb6ODPLAWWQf+BBqgm8vKPkVjKQsNJRNIkwddkjZgsjl8SC?=
 =?us-ascii?Q?wv/3MxHKf8VdTYEzosCwwxI9/OMOLJ+FwbUB73OPwsb2BL4mynmB2Sd1WGcd?=
 =?us-ascii?Q?juEkyX3F5C+fIGZFcl/VJsLEchH6vRFHqByhTR6XTG57WwcEldEfLAfTdTsc?=
 =?us-ascii?Q?4XXLMbxHInodrFKQ0uYb/VWC8CT/Vh4wrMTc1nx6wDOYw/wtZCJaaMgmGKEP?=
 =?us-ascii?Q?FDDetRhRmnBbLVz57HmrGUttFWzrEmboz2jjmp9m1rK/3tPxBU4wMhuTsT6j?=
 =?us-ascii?Q?XQtfjNqZTDGBx+wi8WhV3KJTTTH8j4l0Ot4C9uQPcilzi8huxrmzUAHeroxc?=
 =?us-ascii?Q?/VI/dIGBxaTrCYUyQz3A0HVWeExCHIxiwabxLqzJgc/2NqRLGfNEYJMPDTOI?=
 =?us-ascii?Q?d5REI2WK840zVmNrL4voF4BAiHgK9l2UNdYcU98FEN3d6yeiKaJmd7oOW5o9?=
 =?us-ascii?Q?8jln2OvSAkYT8JdOL42JLfLTWkY0pvZnPbXPd8mVaJ2hQU3KEFbLay70TEGs?=
 =?us-ascii?Q?/PbZMfC0Vf6AFNfPmhS6ZnwhuCu5fN7QQ1HA305Pa5hFid9AnSkv3tAW2hpr?=
 =?us-ascii?Q?yBVRDERsO1ODPW3LN5J/ZrSSR25Cya8xnAJt5TW0T/SoHBRs+Qc0ZloyEZHp?=
 =?us-ascii?Q?nGew5kouLPP86RfjYLS5Un0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?i0LMZfqdcbKkpGeNZ6iuzujrCUXCO+dVk5ET5AYIjEK3yj9lOOsvPsLug1pk?=
 =?us-ascii?Q?zRs999Qt+6rd/aE7HpIin15jK/bz8rA+VS8JQi3Xr3SymxofehR3HdfQdK2c?=
 =?us-ascii?Q?A2Nc9SvUFcTpeUGQCG5r9m+hJXqSPmVV87mHwGiZ/YTMeenQyREs8Lnvzv4G?=
 =?us-ascii?Q?jfODzY026iFgogdhf7LaoGHXTXAQPc8L1UlkszudSQGX7jRjqM7848tYg4wG?=
 =?us-ascii?Q?ArdMl4LwvZboIhVTPIPaV4x1toOMmN8GGGzg8YJey2WhjYYuy8svhbKn9o8M?=
 =?us-ascii?Q?bepFJQA8x2zOKucRSHUfw2Oclsa2KrcnDPJWgnPOckZl1Mktll6OMMTilCGo?=
 =?us-ascii?Q?BylXCwtfdXiVYVZ7K9uIlu+stbxM/+VNzsoMNyTQarD/wvc1qPsCDAOI13N9?=
 =?us-ascii?Q?VWJiRdgl8W9SkViq15USY1Y0EvRF4RwS4/An5SoF4VzVRBpc8iE1HOzputsA?=
 =?us-ascii?Q?cwcmJ/TaqwTZw+9XqTaU0b2/iMiKmgBYeVwYW0TH4PQ/GSlgzvxZbGVmPnmI?=
 =?us-ascii?Q?S/zOhVuIB5ZXrLZvkDBw1b+NMuqybI7q1eL5oxdnkqSnMpdHUQ840WoL8Tfn?=
 =?us-ascii?Q?896yhhSD5silvqjQ3OAJp7+kuV4+pk+8irjRne3MA/qDccYIxbZQe2TPmJ6+?=
 =?us-ascii?Q?PlN3O8pWVjcnqjfZEwD6c1Sz67ADWlVjjN5Z446cYn5G9wcJG08l6S3/KWe2?=
 =?us-ascii?Q?sz7g4ddZHrYUUvXkuX53qWvrWe0ckrVxaVDaDCSMMRue9EJG+wNLn+RXY2t5?=
 =?us-ascii?Q?yPoNwZOzDLVqC56hSnhpu2yS/3vJAXayTDUpcA3k8eryvX2bKjql8V37MakZ?=
 =?us-ascii?Q?l/bg0ogt7j2XRbBqUZMK1PGlXqMG65HVGDMG8iJzN/wqSLNTm5aGfjZc4nRP?=
 =?us-ascii?Q?zSDmgenuJZE+jNT+mQA6H+f89d4hV1/DbvlJQtZjhAz7S+9i4luqSKtmD52A?=
 =?us-ascii?Q?t+uZejy15WuvEOEmiwbyOkkhddbHHTz7Qc4kXz7jN4UKoQ6r4e89YzcqWuIb?=
 =?us-ascii?Q?Fk88b/NtmUK0gslz7Co/zypLo8oiWhoJcqOXof1SyX6jR+M05YBlM+d4QWMB?=
 =?us-ascii?Q?Ior3YlDCxZCYUUstxVNAwtmxInGNwNyNd81r0JV+Lw9p2YJ+Rg0XuNbw5qzT?=
 =?us-ascii?Q?zXVjJHxt+H3UjH+fk0e39Gmig+87KcJxFJlct5u3ZnVRUobtt7CFdtMNiXzu?=
 =?us-ascii?Q?pUq152QZwAhgCsbDdB3i5N2cQyEXskhb01NA4erPB8ZGS30RdTMHO4zBNp6s?=
 =?us-ascii?Q?sbp3enbVE8i6alYb/e9Uvxxqa7OW9ZlnCbJiPesXJK3quutgRH3EQi+42die?=
 =?us-ascii?Q?lHzjFZ5otyj8o6ACxEEf7gXROhPlRGc3p6e558nzB4+H2CTaKAHTd4L5F4lX?=
 =?us-ascii?Q?n3qjizd4O3hlRsHy3tFLca2ykrxxin/21ED28qFiqGczQujS70wcgGQYc9/i?=
 =?us-ascii?Q?ZzEIfkMe7cHtVK/H4dfg4WR0ofD8YHYOnzfVbf/c9B/UAEtNxfeOfA4i53rD?=
 =?us-ascii?Q?tKmMxfAjHbz0R3fL3Esun154J5N//SaMYRibMYaivAPdbBn+VPTg1SKfiWKx?=
 =?us-ascii?Q?URtRPy6bXWDl2JHKKkqiMKBUckTHhk4opDAgLKecxvQzFsKpdwNM+UJjabDl?=
 =?us-ascii?Q?w0xsgHLYriglVglRgKQcO3mUPYLBpjXa7fSA5G1wjv6pcWJkS5Wy3tQHNfBM?=
 =?us-ascii?Q?Rzo39FpFTa5c2/T/z7u531T2n4T95EF+cFcAVyTvcSjbffH1?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d465e9a-61ea-4f3e-91ed-08de5db4bc04
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2026 14:59:56.2610
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AKsrhB3AzMAJqM40BOAnOn3vKVaezVcF1YD9SVfDhjvkbRK3o+/ja45zeEiUQRBqv2Tz9XoSya5lNlc6hrclFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11477

Hi Lukasz,

> Subject: [PATCH v3] clk: vf610: Add support for the Ethernet switch
> clocks
>=20
> The vf610 device has built in the MoreThanIP L2 switch. For proper
> operation it is required to enable ESW and MAC table lookup clocks.
>=20
> The MAC table spans from 0x400E_C000 for 0x4000 and it is necessary
> to provide clocks for each AIPS1-"slot", which size is 0x1000 (hence
> four separate entries).
>=20
> Those can be enabled via clock gating CCM_CCGR10 register
> (0x4006_B068).
>=20
> This patch also adds VF610_CLK_ESW and
> VF610_CLK_ESW_MAC_TAB{0123} macros definitions for L2 switch.
>=20
> The VF610_CLK_END has been removed from dt-bindings, as its
> number had to be increased when MTIP L2 switch clocks were added,
> and defined locally in clk-vf610.c driver.
>=20
> Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
> ---
> Changes for v2:
> - Squash clock DT bindings to this single patch

Sorry for not being clear in last comment, dt-binding
update should be in a separate patch. So please
separate into two patches in one patchset.

Thanks,
Peng.

