Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013005.outbound.protection.outlook.com [40.107.159.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2FE1E570D;
	Fri, 27 Feb 2026 00:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772153738; cv=fail; b=p9kAk/xCZwcqVsPIQERVI/AGTj8LWW6KlTX1UlmEi4ZjV11URy7LdZIaP6K4A0eOtEKtbgm38z3lehgzp11j6Vh3o1Hb/+TTHSiphlaQ0uOsBAjbZrluwVzOJ7ITaYA65oz2QWb7QqbjtVW4/vjgEz62l8TRZ6LC3VdIzS7K3Sg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772153738; c=relaxed/simple;
	bh=czUEyLuT1qJN7LTVtQgYGpoewW8wK7nLRvHwub9ZUO8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=u3IQwaWTgj+VafG6D0uttAz1bsJBRpkubFZwF+uT5Oa5toxKSszghVriO/WHywUMcdcjrTrih3cMDNRK+AQax5U1059WiYekXwF2l/pqKVArYphyXihXGGiDUKRQ+5XwyJU6WNIhK30Jq6NETpd4vgebb/swfsjdDUnzRDf5t7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lRPz+vfI; arc=fail smtp.client-ip=40.107.159.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lRPz+vfI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WPRphbkcQ0bC5wBYULdSCVeXvJcxCP2lREp+iRYC79/71gdQAFwpzAG3hbYELjgBHm3QYzAuAfyQUfQISX9PMnSSu/OVcpnShl4C3pSjHn3esltlvUgMBrNiyW0fsiHDjvWgOTNet1SHB4ew+UZX9FiuFzTh8Q+pYclb1S+LVBiJG7HpD+MmFNlGwGqapdQCPf6nR0xDXVSuDjGz2Wls7yu0+eQCGHUdwi/U984R0qU8PSSpLWBs6x6aKrX+yqKUPZZs42S3EMr9CK9u6Rj5CrtOGtYyyLqk8TZB641+rLonuH1pcx9fouCYOF45TkWAJpsx+o62VMs8rNbmgwE3Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=czUEyLuT1qJN7LTVtQgYGpoewW8wK7nLRvHwub9ZUO8=;
 b=DBsG07z8jzGfva49tNXDuEyshF/4/UG76Q6MG9fBpeZFoyFd8YBEEq5mhehf7PSESBsk5q2tW/4OpXWGEpB29/rLzVVCvQ+dj30jrTjoHtt04/tqKVULmDP+nnCjWk7bxjhba0qSx4ViGnOQ2eje2QBexItJNs6KRD/ZaS3F+5KprxM/c46zGgekTPGU2hL8r2FCzbJhHzdiFiwhvLEeIJBr3zLwPaEt9Qp//5ecQBNibTAzZYlu6I/MpYcgbnUU8+7RX5TLb53RSZ6sLQAVexjT/1yNdX6YwPpnnewuFnXgxVHxJ7I3fTORi/qCDJXc6rZ6aE2Gv8F+vN7zpTHX5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=czUEyLuT1qJN7LTVtQgYGpoewW8wK7nLRvHwub9ZUO8=;
 b=lRPz+vfIXdmgXcCo+Dp0AhIylcsZefjYuzak4OQSbH1cytIm0X/OniDHHRhvYrPJzn0XtOA7gAGEvdgm9pmPmWRBIcLXwuLOWeJDXYi9vO3C3C1Et+JM7uMn4KQaLNFr+mp4nR8RFr0yNO24tvdjfw2pdKbMyfySmzRPrvuk/CI1Sp7W4+uzhTukdX6y2DRTqh7+8a01QRkGcsKz7GlPkw3ozQxRMg/HWG+mDTQlBmV/g1mqEG6Vr19qZ4gOC6v7HMSTekDJfRYcoUzmZ2WbTkxGuj6T+BHkpjtTfiKzz+JPaFUK3n9KLJEU5jWQG5jMGN6vQImxBkLseO+SlV6kOw==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB9927.eurprd04.prod.outlook.com (2603:10a6:150:118::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 00:55:32 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9632.017; Fri, 27 Feb 2026
 00:55:32 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Danilo Krummrich <dakr@kernel.org>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: "abelvesa@kernel.org" <abelvesa@kernel.org>, "Daniel Baluta (OSS)"
	<daniel.baluta@oss.nxp.com>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, Frank Li
	<frank.li@nxp.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "rafael@kernel.org" <rafael@kernel.org>,
	"hanguidong02@gmail.com" <hanguidong02@gmail.com>,
	"driver-core@lists.linux.dev" <driver-core@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Alexander Stein
	<alexander.stein@ew.tq-group.com>
Subject: RE: [PATCH v2] clk: scu/imx8qxp: do not register driver in probe()
Thread-Topic: [PATCH v2] clk: scu/imx8qxp: do not register driver in probe()
Thread-Index: AQHcnHuMOJcyrC2J00e2NxelqVzzHrWTJQaAgAA2tYCAAnKG4A==
Date: Fri, 27 Feb 2026 00:55:32 +0000
Message-ID:
 <PAXPR04MB8459AB8E1DF33401F969EFFE8873A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20260212235842.85934-1-dakr@kernel.org>
 <aZ6vyQw5a5LhSCaT@shlinux89> <DGO0COF2NCJ0.GFYKM4L9KTP0@kernel.org>
In-Reply-To: <DGO0COF2NCJ0.GFYKM4L9KTP0@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|GVXPR04MB9927:EE_
x-ms-office365-filtering-correlation-id: 549239a4-aa90-45ba-77fb-08de759ae8ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|19092799006|7416014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 0ZoBHaXkfXSSDH3q2K0QnofF62AswOS/Zy7qbGaeOLcz7Wf1A/SRhhBtLVnUGWArFkEIuraxdHqTjSDn/EdB0weepKuXl25PyWiYWxXULEj+wATLibKjxv3+0N9Ab6oHoXiPj/xV0PhlbBi0sdGbj9ZzoDnCxKOyBKgC+IszZT1gtzUtVw+6HJnbdYSBlhDwadOY31JdEWVJtU3aFLcacgBPH6GAT9134yecst0/ogNztQXydO4G2Q05znOfxnR74BTDQkT0Dt2/TCCp/g0AwV3Ncwc+SHoyNlbkjLz7bfn+GaaloU92IxUBsLlbxPKgEAuOgcBkus8+aZ3FWCrVFg9Dojg/8dRpbqkVLkCmVL3T+66vwhLxljMyqOc6sx7ZFu3XsanT9+3TlxpDferXHhszs2XV8oKez58jd7uDvgGThBdecY39SXl8G9lAy5F5xTB27FoVY50JlJ5azTgHfSeCY5sTP7i+autTrjujIePH4jDGJZjPg8ops6t+OnJgaBtaIEqKjxLj6zrQDzo0N8KLfmbxWsVYwxe51FV70wpTgK8mjh0ebV0A4Fw7oB9InWgE7OMVmDWwfZO8KUq5vhRre/KpZFENaMws3gVxkiIekqUOlF80qfTmj3AzFAfgifMnLnJRK223la5KIMGcuvXhG80QkLs/u/0TBs/JAzL339ptLRS1GoGbOBSEkNCMqZYQORhJ9piV6eZrI9jby8gJjMnEnKjWa7HRSMlqQUoRSnXC+KsrvfmPGaq74HDWs0xRwOryAweM3aXRat+/VKT0KRqLapraS88MEcMp9SI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(7416014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VDJnWktaZlRJc0c3bFZidy9sNHFPSi9JZEJ1bWVsMjN5b0JRWmdhTnl2T1Q4?=
 =?utf-8?B?dGFaaHV3T1hKajlTSjdKUTYxcGlGOTliSW5xczAxTjFmUFQrVG4xYm1ZQWhP?=
 =?utf-8?B?U1RmSm1qR2srcUszZjVEcXNyZzE4QkpsNGxab3BJbHFoYlZVOGxhSTM1MHlZ?=
 =?utf-8?B?VUhiM2tEeHlQU2hlY3V3WnhCQTNrYTNxdkNrUjdsc1FCdW9wdTFJM2FNL09P?=
 =?utf-8?B?Y3E0THpCa2lLK1gra0o3Y2V0YXMxVXlPZUZTcURWZ2ZiN0dXRC8vS3ozYmtK?=
 =?utf-8?B?bW1tSlZMRkdSQm5pNzlUMTh4Z1QwODArSHZjQmxoL1BKS3ZMdEs4L3hmM0Ir?=
 =?utf-8?B?Tm9LaDhVc0dSajlhZzhUWHlaRXBLV28wN1VzbjllM1NiemR1QWdxSEhVOUQw?=
 =?utf-8?B?V2IzY21FQnd6aWV1RUc0YzFLem9RRGlhMGc0bkltMDdDa3BSQThocTU4SEtM?=
 =?utf-8?B?ZDIyY1NTMnNnRVZzR2p5bGtrL0N0OTlmWGQ4Si9sTk9IZnBWYmRPK1FVbnY1?=
 =?utf-8?B?dXNOVUhKTDJDZWt4QXpmVW1CUlVQNWFJZ3pnZzRDdGExRHJLZnJ1ZUJyZGQ3?=
 =?utf-8?B?cDVzMDl5MnhYS3VXcWNJZ1M4dnZUYUZWdlZYV3RwNzAxVEdHS2ZjZGlDMUgy?=
 =?utf-8?B?T2xUK2JrT1h2dEtxVzlmYnBOVHBucm9HN3NGU3p4WDhhck1TandXNkFzMWhZ?=
 =?utf-8?B?V0c4OGlFdE5UNlhENVgwZ3Q3c3l5dUhCbDV1Zm9IVHlHZEVoVlZnK3dpV25j?=
 =?utf-8?B?d1BPd2ZkQitJbjJWZnFXT0lBcFc5SFJXM3UzaHZ4R0FDL0NEN1Z2d2FreWJr?=
 =?utf-8?B?Mk1jZFVZTjJHeGFFN0l5dlJoN2Z1NXdQZ0dZRFkrYndiUjQvQWJ5Q04xOGZT?=
 =?utf-8?B?UFZ0Wk14QWxzR3VSeWx6Uk1oWkR4VFI5MGlHL1NMZmtRRFNidVdYSlRDSWo4?=
 =?utf-8?B?eWRzSTBTUGorYzg4Uk50bzRPSHRHWVBOeXlHN2NWcmdZZjZoSi9yaTVjOUdy?=
 =?utf-8?B?NHhSbXc5QWNMTzdEU0p5MWRUUTVaeFEyclZEb0xvdzRMWWs3a0R0SmdrRnlW?=
 =?utf-8?B?eW8xZzBURjZCRXdLdzZFL3lqb0xLK2puZDdkZUNHbWlkQmdRa1RscjlSZGFt?=
 =?utf-8?B?L2NIZlV2bzdjS242QkFPV3E1eHBhQkxKL1AwMzBtUXp4dzJvYVRvZW1HTjJ3?=
 =?utf-8?B?NFFlOXpWRUtTcFRIdXoxVEU3NHdzK0h3MVhGOFNUa1MrUlE3OUJSVHJKTElG?=
 =?utf-8?B?SW12b2M3NWl4MDkxMDBYY0xONzVEcTVGdDZMQmhRRDRiNnFla3hRa2ViYXcv?=
 =?utf-8?B?MU5uTzYrSUFsaXEwaGx0MC9tbllaNXVtZFpQT0I2eGd4QWFRVkxwNUxPQ0lo?=
 =?utf-8?B?SFBmaXV6TnRVa2hwekoyYUV6Tm9FOHRqNFd3czlkcFBZQ3V5bmdpT3U1U1JD?=
 =?utf-8?B?dVh2QVE0UlZ5WFBmSThYcG80L29PK2pYeXQrWW0yaVhuSEkvZHhCNkNLQkcr?=
 =?utf-8?B?eldUMTE3Q2RBZEJOUVdCSi83V0UvYWdhamdjUk9PRFFjWUo2T2JFcEtnSmpl?=
 =?utf-8?B?RUhZZElXZTBVYlpXMXllL0ZOZ2RNTkUxYm5vb1Vub1F2a2M3OWVxTnR6d2ZW?=
 =?utf-8?B?dzZEd1owdU03ZWdjOURlQnlmZ1FsckxMTlBnYVY2MldMcndIa1hsbjhOZE1D?=
 =?utf-8?B?MjJDQWRSK1B4dXBxVUJWVmJOTEdUR1N0RkRHYnJZeTZYT0NSUG5WaDJSdk5o?=
 =?utf-8?B?aE5PWUwrOFhrWE9mNGRXMnUxMW9LaXYvS1hNTmNPMlJRVlIrRHlwS2ZZNDM2?=
 =?utf-8?B?SUtNTXlaTzY2dWpZWkZBUGlZY2VpSW9jTC9zY0J6NFVRTzMrOXlaUnEwQS93?=
 =?utf-8?B?T2VqQ05kRDBoZ3l5YytZSWM3SGY4R25VbGxySTR1RlZ4YnVXc05pb05ZQ1lF?=
 =?utf-8?B?UC9iUEVhMUQ1NGJhRDRGQkRsekhGSzdHS3JVaWw3RWVSRWxBQWcyQm9PVnZz?=
 =?utf-8?B?WjdabzU0c0IvRm83KzlnbGsvQ0xDQnRYT2FsdTUySW5oOENOWm5IZk50ZGR0?=
 =?utf-8?B?SHc5ZlZJTnlJK3V1TnVuREJFNEtRZENLV1BabC8xQUlWZjdxN1M0L2syRTVS?=
 =?utf-8?B?N2RCWWQ4dG1nYTloNE1Cb2dmVmU1OGc0MXBwYjRWL3B3c1o1bWFlR01QbUJ1?=
 =?utf-8?B?QXUxL1RHbURPS3BMZmVLVTk5N21KUUhjTVhVWHFWZUFCa05ManVPSS9BaDRm?=
 =?utf-8?B?TUtES3N6MVJ4UWU3aGtGMm5PMnZsUzBoYkRuYXZXeS8yV0NBVSsrd1RqdlN3?=
 =?utf-8?Q?uzttB1CY8I6SG7uUwx?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 549239a4-aa90-45ba-77fb-08de759ae8ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2026 00:55:32.2057
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W/DmHa/HxrHeaN8vUzeckOUmdLbykGHfNB647cJNBlqjuJJ65dSqR/V4pv26TmI9Bb1vIT43+JXp1utGqxOO4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9927

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyXSBjbGs6IHNjdS9pbXg4cXhwOiBkbyBub3QgcmVnaXN0
ZXIgZHJpdmVyIGluDQo+IHByb2JlKCkNCj4gDQo+IE9uIFdlZCBGZWIgMjUsIDIwMjYgYXQgOTox
NiBBTSBDRVQsIFBlbmcgRmFuIHdyb3RlOg0KPiA+PmRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9p
bXgvY2xrLWlteDhxeHAuYw0KPiA+PmIvZHJpdmVycy9jbGsvaW14L2Nsay1pbXg4cXhwLmMgaW5k
ZXgNCj4gM2FlMTYyNjI1YmIxLi5jNzgxNDI1YTAwNWUNCj4gPj4xMDA2NDQNCj4gPj4tLS0gYS9k
cml2ZXJzL2Nsay9pbXgvY2xrLWlteDhxeHAuYw0KPiA+PisrKyBiL2RyaXZlcnMvY2xrL2lteC9j
bGstaW14OHF4cC5jDQo+ID4+QEAgLTM0Niw3ICszNDYsMjkgQEAgc3RhdGljIHN0cnVjdCBwbGF0
Zm9ybV9kcml2ZXINCj4gaW14OHF4cF9jbGtfZHJpdmVyID0gew0KPiA+PiAJfSwNCj4gPj4gCS5w
cm9iZSA9IGlteDhxeHBfY2xrX3Byb2JlLA0KPiA+PiB9Ow0KPiA+Pi1tb2R1bGVfcGxhdGZvcm1f
ZHJpdmVyKGlteDhxeHBfY2xrX2RyaXZlcik7DQo+ID4+Kw0KPiA+PitzdGF0aWMgaW50IF9faW5p
dCBpbXg4cXhwX2Nsa19pbml0KHZvaWQpIHsNCj4gPj4rCWludCByZXQ7DQo+ID4+Kw0KPiA+PisJ
cmV0ID0gcGxhdGZvcm1fZHJpdmVyX3JlZ2lzdGVyKCZpbXg4cXhwX2Nsa19kcml2ZXIpOw0KPiA+
PisJaWYgKHJldCkNCj4gPj4rCQlyZXR1cm4gcmV0Ow0KPiA+PisNCj4gPj4rCXJldCA9IGlteF9j
bGtfc2N1X21vZHVsZV9pbml0KCk7DQo+ID4+KwlpZiAocmV0KQ0KPiA+PisJCXBsYXRmb3JtX2Ry
aXZlcl91bnJlZ2lzdGVyKCZpbXg4cXhwX2Nsa19kcml2ZXIpOw0KPiA+PisNCj4gPj4rCXJldHVy
biByZXQ7DQo+ID4+K30NCj4gPj4rbW9kdWxlX2luaXQoaW14OHF4cF9jbGtfaW5pdCk7DQo+ID4+
Kw0KPiA+PitzdGF0aWMgdm9pZCBfX2V4aXQgaW14OHF4cF9jbGtfZXhpdCh2b2lkKSB7DQo+ID4+
KwlpbXhfY2xrX3NjdV9tb2R1bGVfZXhpdCgpOw0KPiA+PisJcGxhdGZvcm1fZHJpdmVyX3VucmVn
aXN0ZXIoJmlteDhxeHBfY2xrX2RyaXZlcik7DQo+ID4+K30NCj4gPj4rbW9kdWxlX2V4aXQoaW14
OHF4cF9jbGtfZXhpdCk7DQo+ID4NCj4gPiBUaGUgY2xrIGRyaXZlciBpcyBjcml0aWNhbCBmb3Ig
dGhlIHN5c3RlbSB0byB3b3JrLCByZW1vdmluZyB0aGlzDQo+ID4gZHJpdmVyIHdpbGwgbWFrZSB0
aGUgc3lzdGVtIG5vdCB3b3JrIHByb3Blcmx5IEkgdGhpbmssIHNvIGl0IG1heSBub3QNCj4gPiBt
YWtlIHRvbyBtdWNoIHZhbHVlIHRvIGFkZCBhbiBleGl0IGZ1bmN0aW9uIGhlcmUuDQo+IA0KPiBU
aGUgZXhpdCBmdW5jdGlvbiB3YXMgdGhlcmUgYmVmb3JlLCBqdXN0IGhpZGRlbiBieSB0aGUNCj4g
bW9kdWxlX3BsYXRmb3JtX2RyaXZlcigpIG1hY3JvLg0KPiANCj4gSWYgYSBkcml2ZXIgY2FuIGJl
IGJ1aWx0IGFzIG1vZHVsZSwgdGhlbiB3ZSBoYXZlIHRvIHVucmVnaXN0ZXIgdGhlIGRyaXZlciwN
Cj4gd2hlbiB0aGUgbW9kdWxlIGlzIHVubG9hZGVkLg0KDQpJIHNlZS4gdGhhbmtzIQ0KDQpSZWdh
cmRzDQpQZW5nDQoNCj4gDQo+IElmIHRoaXMgZHJpdmVyIHNob3VsZCBhbHdheXMgYmUgYnVpbHRp
biwgdGhhdCBpcyBhIHNlcGFyYXRlIGNoYW5nZSwNCj4gaW5kZXBlbmRlbnQgZnJvbSB0aGlzIGZp
eC4NCg==
