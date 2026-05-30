Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023093.outbound.protection.outlook.com [52.101.127.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2648F2E7635;
	Sat, 30 May 2026 12:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780142568; cv=fail; b=h6CqSSVjqBWX4ZvL4detQIWw17nnKezHZMgU8xj3y7dTY0xLmjSnCouwwjzngeKm2ECDUarnb9qj72LXKd09sYhgzbn4PgkACU4F0RuGU69SxaXO1NLZyFiH3cs+Bc2NOYi8eIQkENzT3tP+OE9IwkGB/FgOfNQYVprhjgQMW9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780142568; c=relaxed/simple;
	bh=2ywCq+D7FB/GvWG7zZ3KANTvNizm5CIq2B5SjbSO8lc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HtrfzlNvHoSKlXsQN05fmBjlIQOJ+8GZdI3CXC3dMf8Q/ewKtO0CI3+u/BGQviOgyx42EGSH9qihf3NUzeOD7r5ULQlAUf2zRaWZaQP3hA69wvSK3F7el0vrdDAWZTn+556SsSB7O3pmFCYxz1DgjdVJtbto+Uv6sOMXn0uqBSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vZ6C1MxMhaz4nM1X3gH9EGnGVXsVDTJCab5ANxI+9t5ChKuSrttoYPFvahTUHA3Nrv9Q2ga7BB3MV82ZpKjNa1xoXl9qtrOR2F+fquHGnV3A6SHme8pEn2fvjCM0ZHLB0FCbvUt5vxmWbkA+3ZKQJ+vGHUfdWu2K7RxatqT5EXAYB48b0MlKWBxPsbl7UrfBhpzFGCntJhc84jjMlJo/vnvMn260IAm6QxIw/iFXRy/KJduFkmo7ttZS5wZH1fMCTY+AdZxV6GknWWjWwrRp9dSSQ7XjlxzLi8tjV/8DAmngskLK+iWUYmQU5ZGVkJmbROqOiq8SvclU9nsod8bUUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fYVsvEcbSWbixTS67p6wQ5DDjwLyyxBXYyEmXSIa8Ak=;
 b=sCpaUDtYyrkruwZtVxUsmeiYZ/DdACY9XlKVXMofrQQBwS2bphvU4Qt+ctqbuieT3pkIMbsmLbc1Ucb8EKmE9zxAdzCMdxnVWTWzR0t3pzuKs7pfdPKslk4bPaQn1k/iioshNorjoepY+gW4iK5qJAas7vmbvQFvyJqhwsDxwZAqVQwa6oMZtp6F7NNw/SSuwZzDmtTjkOp/aBRlCKO+trsFLAXeDc63t0rAueDK+Hevxhmpk+ws/bdduqehswy0r3kIcf5CWFCVjdVIdPdjmKbUgrcSoMfeKkUDKBraEZ/ZIb4RshMjMLa5Pp9G5WEnEt67/2PETvDvOVK3ZIStPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from KL1PR06MB6236.apcprd06.prod.outlook.com (2603:1096:820:d7::11)
 by TYUPR06MB6193.apcprd06.prod.outlook.com (2603:1096:400:351::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Sat, 30 May
 2026 12:02:42 +0000
Received: from KL1PR06MB6236.apcprd06.prod.outlook.com
 ([fe80::2c9b:c257:fe54:16e7]) by KL1PR06MB6236.apcprd06.prod.outlook.com
 ([fe80::2c9b:c257:fe54:16e7%5]) with mapi id 15.21.0071.015; Sat, 30 May 2026
 12:02:41 +0000
From: "Joakim  Zhang" <joakim.zhang@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>
CC: cix-kernel-upstream <cix-kernel-upstream@cixtech.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: RE: [PATCH v1 0/7] Add Cix Sky1 AUDSS clock and reset support
Thread-Topic: [PATCH v1 0/7] Add Cix Sky1 AUDSS clock and reset support
Thread-Index: AQHc79pgGkAMhKd2oEeJ/Tp6qxKNp7YmSI0AgAAR/cA=
Date: Sat, 30 May 2026 12:02:41 +0000
Message-ID:
 <KL1PR06MB62369C5A2F7014D18376849382172@KL1PR06MB6236.apcprd06.prod.outlook.com>
References: <20260530021642.64059-1-joakim.zhang@cixtech.com>
 <1dc091d4-51a6-486c-9a8a-f7b3f3de591e@kernel.org>
In-Reply-To: <1dc091d4-51a6-486c-9a8a-f7b3f3de591e@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR06MB6236:EE_|TYUPR06MB6193:EE_
x-ms-office365-filtering-correlation-id: f366fc10-d3fd-4379-026e-08debe435a3b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|3023799007|18002099003|22082099003|4143699003|5023799004|56012099006|38070700021;
x-microsoft-antispam-message-info:
 HmYwBmJmvXRKkRQAHkkPmCmAOgzf1511pa97+Fpc90lqvGmSGkkAsqjEs04Gw1CdbqAy9Htrp7WfcriglVeTZImJN1d36XHmFu/TUMAWVbf1ZebnXHBMiJE7gHFC/S1A13rC5pztZ8bTZoxA8CAPGGy1TKRQGZspi4puwowB0fyKZDLPvHRGqycuLJdcV2Lw5EPYNfNF2ODivWPftdQOzR9P0uxZr8vFSlrFxr9cC97YWYeHUlhczgFcc7306OEu24MzsTpVa9PeSMzpGhroUPW0trzW7s/hcPDLBPvtmFxlCPPMNbmXDWNGsGrCiO0Dcq1SNgvHOE73nONhdBtVYlf2sHrTEXzRRQV4ZWi9Ci0g5lZ8XvQTmPktEDJMw061zpAq77Tw3sd7diLRCm8fO0GBygpvDxXwUdKjXWLeqxZpnO3gITglFlkANb+s066IZTX5fauWIB5mFPBzrRHrWABKLc5AlR5q/5AIBsxq5Q3l7412ajfOqWooOF+rQGKT/xJUmWCEWIHFpmaCp3mRNtaXykUOwqmHUKbvvKCAQGkyGZ/M7NZcWebyfPs2PVcY8uuqbOJO4ReNePNG2jE5rSJxgSfZlmP1s2fdKq37Xu4ZpqQVGbTtvbQed9fG/BA630eTLLsbZ+6xfPB5bWRQ0qsO0qLsAQ1lW9QkHdiES2vnncCA0vxwVlZ6auBcp7ZIHhZHD6UhES7NeCIVF/f9rX7cPAEbZg7G30eYD1oDA0OPxq6apF0uWR3ykl9V59r1
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6236.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(3023799007)(18002099003)(22082099003)(4143699003)(5023799004)(56012099006)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?DcU2SnyIDzj66u0F17Sf9zPlxMIfj5/fYEjN866wqAB7Z9IfHe1ELCpg1bRF?=
 =?us-ascii?Q?mmAPXqXtLrgipOEMpNn5OUWQ0E+lbq8q6zKgNn3NftaEjjYQOc5D9qKcjv9y?=
 =?us-ascii?Q?eaPz7WJryYKk3OlzI/6acyO01NHl849EhJicd/8ppq3KzrM45UxJcNXv4qx5?=
 =?us-ascii?Q?UGQW4luxfdCReiFHTB+8Gc+GuypmYrgBCyi2oWH8JjSNqmZX7DUKMJDEIBk9?=
 =?us-ascii?Q?C4j/uy88o/sduCtt2YdN7s7+ovHHpfL8BxFODNnbHjSEEjFwxhvtk0y+NuJH?=
 =?us-ascii?Q?VEc2AbXlMBXxdf/3qR88ZoOAzWaAllvO51Xt85rteXjAKAB7yVDArpYn0OHx?=
 =?us-ascii?Q?AM63ZTzsnNjBoHL87/ukm14U5dJ0BRWkZFcSdUGljJiFJamig23xSa+gFwzX?=
 =?us-ascii?Q?ynDwYe4jzRsqgSEiaAg62FZPR1j1oFqWepNgMHYWT/oA7EcpnMn/DRFoFQfT?=
 =?us-ascii?Q?g0DDqshnTLTDPp2wcWXMS7qHX26eg+P68ANqEEaN7RPPWYaVGNzesaxuWIXL?=
 =?us-ascii?Q?lFbd1qsrqwWA7WidMdeFXySBnWGuML8ZLYTrNz9oELb9bS+X8HewRdosV1qv?=
 =?us-ascii?Q?ruzp1f8R1Jix65zmQP31gA8ljLGsP3Opfl6jpfOa7HSCs1Y4s/cYw9G6clCS?=
 =?us-ascii?Q?S5W09OWP1Nlc1bcg4Pr7j4cghSMF5l3wSe5LmKxoZ76mTRNdOs3HyF3XlPWM?=
 =?us-ascii?Q?6i3oHLXiibI8BiT02+9tazVuZVSQIYvyhuc/Xgeuq+7Rhw06TCYUeQk+Jn9x?=
 =?us-ascii?Q?0q/U60gN/y0ynKCB4BeJYgPvq6IH2WI9q5k14VK6wBYj+Q5MDLhptAilJftE?=
 =?us-ascii?Q?MzrUywyQr6H71v5QbhHPHyVYBQEd1WH6539+gCi9R8p08tZi6GVbqCFNVFL0?=
 =?us-ascii?Q?WzrJ1Rl7/ghmmH4NE9/uf4EsOSyiYVAjnWX497nz5ENZ39S1toZa9F+ppl8B?=
 =?us-ascii?Q?CeVcOP39zhsnhxCaWnH3YPytLz0Oy4aMU65NWvwmFrnyPVjtcFELmcYHAGV3?=
 =?us-ascii?Q?cGchQ0QVgEfTAGQNgXuFfFA3YO9G08svVFV1BUkGHKGk4ho6C3ekbfKCDZ3D?=
 =?us-ascii?Q?XlbxXze+LU/+ZMmtwEHZh+xCLJAPwBNfAqWBdUv2PD6ODTbGkyGebjQoPZXU?=
 =?us-ascii?Q?qopNeTOApOB3vPfr30/sBx1zRCT+tPNUP7qKqSo1iKdrCv3blEwU+WUrxkRj?=
 =?us-ascii?Q?MxHN70lxRqA//Oenw79Zz9RV2wAoGpvuuv2oKRj35PAKrpuIl6qBucFRQisV?=
 =?us-ascii?Q?4jFKYfsdyTdoj0oORoqG4qzUxJFOVFpN5bM3EaoajwqfCcfPcESpLfkV2Wl9?=
 =?us-ascii?Q?XALbQGgyDlnXUHK+Zbjyl/1E8EMZk2YfQMohSlilAJQwiopKDRNHRXf2N3jp?=
 =?us-ascii?Q?jFOtlfEC2pEtGKSMs0eeuBVtV5Oel7sNbvqeJfTj5806G1eejg/wXarlv5do?=
 =?us-ascii?Q?POTajaiuS0e7mgdodCQABfVLNkvxHgE1Ciq02cuzHyq7/2BmRohF5P3Ydl03?=
 =?us-ascii?Q?XPy7uFRTQLFT8kv1/jULJY8y+1W8xhsv5k3yCACsRQ7z7KvOYJQeN9Cvzq02?=
 =?us-ascii?Q?GovCzWt1Hyfy9RKxzJ5M0mtDgbjWMj66jex6nwsQ+dONinYU1Iyizplddu+K?=
 =?us-ascii?Q?8aLKuZkLRaYpb1F/UKyhgPNORYTRpol7FvtYYY0UaVRNVAlrEhen6VSGfi5O?=
 =?us-ascii?Q?XcLYYWyMxTTrfS1YNZQVvwPwfQYpvfo6mPEPHtesWCF0Pu2wCACt6FAkyYgK?=
 =?us-ascii?Q?V9Km9f94+w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6236.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f366fc10-d3fd-4379-026e-08debe435a3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2026 12:02:41.8565
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G0u9OTIis72PAptyrJ+Gai0X+a4nJDqWu7mnIzvpBPGA4HRRmUp4oUmzaKHSXU8uZXQ7flz8/EE9OUbvKJLU8yXNf0TDcSJ/M9lJcYZJ03w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6193


Hi,


> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Saturday, May 30, 2026 5:10 PM
> To: Joakim Zhang <joakim.zhang@cixtech.com>; mturquette@baylibre.com;
> sboyd@kernel.org; robh@kernel.org; krzk+dt@kernel.org;
> conor+dt@kernel.org; p.zabel@pengutronix.de; lgirdwood@gmail.com;
> broonie@kernel.org
> Cc: cix-kernel-upstream <cix-kernel-upstream@cixtech.com>; linux-
> clk@vger.kernel.org; linux-sound@vger.kernel.org
> Subject: Re: [PATCH v1 0/7] Add Cix Sky1 AUDSS clock and reset support
>=20
> EXTERNAL EMAIL
>=20
> On 30/05/2026 04:16, joakim.zhang@cixtech.com wrote:
> > From: Joakim Zhang <joakim.zhang@cixtech.com>
> >
> > This series adds devicetree bindings, clock/reset drivers, and board
> > description for the Cix Sky1 Audio Subsystem (AUDSS).
>=20
>=20
> You just combined patches for FOUR independent subsystems into one
> patchset. Please don't. Organize your patches correctly... or describe ex=
plicitly
> the dependencies and merging constraints. Nothing here explains that and =
it is
> THE MOST important information.

OK. The original intention was to submit the entire subsystem together (thi=
s patch set based on latest clk-next). However, that approach is not ideal.=
 I will release the patches one by one for review.

>=20
>=20
> >
> > The AUDSS groups audio-related peripherals (HDA, I2S, DSP-related
> > clocks, DMA, mailboxes, watchdog, timer, etc.) behind a single Clock
> > and Reset Unit
> > (CRU) register block. Board software obtains the CRU MMIO range
> > through a cix,sky1-audss-cru syscon/MFD parent; clock mux/divider/gate
> > and software reset control are implemented as child providers that
> > share the parent regmap.
> >
> > * Patch 1 describes the CRU parent (cix,sky1-audss-cru) and how clock a=
nd
> >   reset child nodes hang off it.
> > * Patches 2-3 add the AUDSS clock binding, clock IDs, and the
> >   cix,sky1-audss-clock driver.
> > * Patches 4-5 add the AUDSS reset binding, reset IDs, and the
> >   cix,sky1-audss-reset driver.
> > * Patch 6 extends the existing cix,sky1-ipbloq-hda binding so boards ca=
n
> >   supply a reserved memory-region for HDA DMA buffers.
> > * Patch 7 wires the AUDSS nodes into sky1.dtsi and enables clock, reset=
, and
> >   HDA on the Radxa Orion O6 reference board.
>=20
> And this is completely redundant. So instead of writing something useful
> - what we can do with this patchset - you duplicated commit
> messages/subjects.

OK. Will be distributed in batches.

Thanks,
Joakim
