Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023103.outbound.protection.outlook.com [40.107.44.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC0239FD9;
	Thu, 18 Jun 2026 01:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781747024; cv=fail; b=Ic3eaCRLi5z2gfBW0TtprhRsYf+OLbcy2FdqJ2H2uLXZXntnICX+OfNRtoBl/JJsckOo5Ec/40KyN7nxCjVyJtz085mNu+hfdOb4vrpi00pzX23VFZ/LbB4+gSmFsIZzwW/6HIx8UV/pTIwmt2WRvTxyVYMl2+ZoZ0dQMIMDzK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781747024; c=relaxed/simple;
	bh=xLwSldS6yiXslWad8UZyQMwK5An0Q2yDco5u8/DrQh0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Kdu14d5jmM+cX/fCt3f+qt0cKtoCdycgVta1PcjSclIilEs6sdDjwiZ/dC7OkAJEXYwWkj9HBn3qr3b1WbemKRNfJCbWWySyfBg4/7kkTzq8osdCt/EXP1HSglNW7jwXIde7jjeMjHWZaNRGs+I29uuUpGq7Z78eMms+j/8m9jM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dM3f5SMq4em3K6nsOgd1JS3w/OWbq/aKRRdcK/UuiE1BdrkPD+AmshMrwKEtfh/iqFhVzhmeXiIuLx7M8cX90Kp0/t1GwcrvHeDcqfVUPW9ARKixkCn3EEEX2bSo6kAQrXHJRmRB3nLGR4tOByW+JggwpqXab6XINR23p65n7k3wdB/eRLF3TdBOHzHkYCy75l4aW5U8keQJ9qfKq/EMUkJpMO5+Z9N7q5trJa+5om07KGATycsq0J3eunyYx3MX7P6LW2oFj2K9rFnrUC5XQTU1hdQCmVvspePmG0rSXrRVhjzkcwwMSI670gazP8jXnpFG8hw2AOeMG4tJ5Jb1Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xLwSldS6yiXslWad8UZyQMwK5An0Q2yDco5u8/DrQh0=;
 b=AeEptbBVY1vLWdrlsRLbgAuzWFRn0CaYHk2YvF3fWsjZkGyJ8rOVd677MkObBI/LYJ2J2jBKNHfkCtjoYOX5ujOTanCtIoW8H+5T2Tm2emIV7FkEzY2vKQOU8mUF3qZ+7daX+Fn76s71Laev94dzZP0WreEZUnJirvKvd6muIXeUcADTHJAiPI3KYtPxKSe3Nkb7m5oPkt7J+4Ko6oCGlIjAV/JpvhD9uWrhH0U3C7MO/Z6rTKNM7JZtc4I2XAH/n8EkCPVp68/fdLhQFUipyseioxkNnVPCXa0Z/Qd3mKRs6P4dDA1O5zZJeVK9S/XVFp+CFw7S9CfmUlz5liI5qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com (2603:1096:101:df::13)
 by SE2PPF2BE5BD2CD.apcprd06.prod.outlook.com (2603:1096:108:1::7ca) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Thu, 18 Jun
 2026 01:43:39 +0000
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364]) by SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364%5]) with mapi id 15.21.0139.011; Thu, 18 Jun 2026
 01:43:39 +0000
From: "Joakim  Zhang" <joakim.zhang@cixtech.com>
To: Conor Dooley <conor@kernel.org>
CC: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "bmasney@redhat.com" <bmasney@redhat.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, Gary Yang
	<Gary.Yang@cixtech.com>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v4 3/5] dt-bindings: clock: cix,sky1-audss-clock: add
 audss clock controller
Thread-Topic: [PATCH v4 3/5] dt-bindings: clock: cix,sky1-audss-clock: add
 audss clock controller
Thread-Index: AQHc/h82CYMaDL0LD0Koho75ZPcCVLZC50MAgACkQWA=
Date: Thu, 18 Jun 2026 01:43:38 +0000
Message-ID:
 <SEYPR06MB62262C0F7823337CA9496DE982E32@SEYPR06MB6226.apcprd06.prod.outlook.com>
References: <20260617060437.1474816-1-joakim.zhang@cixtech.com>
 <20260617060437.1474816-4-joakim.zhang@cixtech.com>
 <20260617-clinic-blank-61289f8fc1c2@spud>
In-Reply-To: <20260617-clinic-blank-61289f8fc1c2@spud>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB6226:EE_|SE2PPF2BE5BD2CD:EE_
x-ms-office365-filtering-correlation-id: 81069478-6a20-458a-c1f7-08deccdb052f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|4143699003|38070700021|22082099003|18002099003|56012099006;
x-microsoft-antispam-message-info:
 azcw49FCraoDtbuHfyIsSw0LonyzH6435K3Ll0/uWPfZ3+1eb+h2PxlTmi7oU4IvYmNEuGI7lAKc+iW1ae6amm3lZtVhksmYi1K/0MQlj4179KKf/7kdF27l/p4VFD6qNXCPeZAl8/YJglq4+Bmb0Xs1N9cJLnizi+afktuDZV785BPdmu+l2uMZehU/ijibynfyt0Bzc7xGGBfQ3/qPOznXm3PhUKen5rsfaFuCmCajjNllmLfK5vcIXQ4DRcRkcjoha1+LwVPuORU2Xpil+z54nSsqtQRVc/AczQsAOHJRCKmuPS/ZdAvYcBFdGa4A0Qv0Ra7r59v5ILjP37SoP4hFzWub1jsAMHLKcmQgdKNqGB9Bcu5nGUAjTBF8DBJ8yhJh+mMhtJW0kG7HRlvMp7kgIgEyrVHxuHNNsazY7depnq0jSqKLW2hsQ1RFhB8WC2VnKciWhd80y1+5Fm6kJVXoY8HMouwAVhAywE6tT9v/LkXZseB07uBe3RijFFWxLw8v1dBjOLgpqX2kidbXrl0PJXkvfwKZLsaq6qT3s7yMsygfZzMW7z7HWj0/HqlAsY4YQd7FFGLDJ2lk+hoq16LW1mClli+QjoK9tmNX6BayndeM/krDKymB03BtAcLp7JFlNFvyehD7rK+mMWX2xy59/d7TDyIB88kK0sGBysa17hx51/98RZRzu+GrfNLnVKUW97YJG/Ac/Y+vYL1dQrNjoRE0r3hiLsvMMj8JJgCg1/HSz3zxYxACUB7W8ffp
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB6226.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(4143699003)(38070700021)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?UXrX1huD8dqs31N9XfB17HXzSf8UIfYgdBAIPrfnAnhWpjKJjQzPaa7pG508?=
 =?us-ascii?Q?nwJShYT6JbLrLLqDUW8s0u/glNFnD+3Vfb/x9F9MchgFmWDfmLjvz8JCiq+v?=
 =?us-ascii?Q?jTYZwWuGC/zuyFV8smqB/lMQUcC5zBKuDdj6xhZlV4yA4SNDbHeK8dZrnZMI?=
 =?us-ascii?Q?5Kgoo9c0g6hqwoMEzbSK6SP4x3uhYk1ZKGgLCoe0qRzjZtJYjbr7T2Cu0pws?=
 =?us-ascii?Q?L+WNsBIeSAAyrIdCklcKrPQCbe3u9sxiJUcwffmOAdM3GaIMaqb/HOwJMwgM?=
 =?us-ascii?Q?Kn7QK4h4+1DZzoZpdgxGakUN/ljlc/BNzsTZMlerrv3yaiBLifc6n3k6HfjW?=
 =?us-ascii?Q?MIXLBgI8oMYXnr18hcMjegxMdAYZr6CiPIYtQNfKofrPW6BzztG/A+yfhWoZ?=
 =?us-ascii?Q?4rKVHyJr0bF/zT6i+780/0dfvGO27bcqMxLrUEw6fhxmCjOliAIiuZV9ZRnu?=
 =?us-ascii?Q?F82DYE5h0kcjaXLgNQdW3Hx9Jr7FCHclMiwde+7wPC17zuEvomdbQMvMhLvP?=
 =?us-ascii?Q?xuOhhtCx6BskVSdRqnBBxWdXhRUDKnGwvBsNXfVOMqi/pGezDcE3qL45YCXm?=
 =?us-ascii?Q?YPYNhnquk9RmZpPwi72/1d7EvXsECwTmV8mWFU/xlq1UcazOQiqWmli7vo3+?=
 =?us-ascii?Q?9XS6DTE84uWnCIiuNBjiV5thj2YuTaQlfhCQbT+DTrt9+kihzSv16xaEazZr?=
 =?us-ascii?Q?2WhEpifMljUw5056YJzFwC9Dzd06qKzSDY/9XPS3WfbA2soHYdgaGcA4XzFQ?=
 =?us-ascii?Q?BQ8viOQx7gGnYmHmTjul/TSitxar7w619vFhGcg48nOTFwZR1PY9n9BSfzq9?=
 =?us-ascii?Q?t5wZss/CTSogWGbzpoK3grlBoNpcZnDuACoeYRu5F2BsrtNAa07uqb1fl+JH?=
 =?us-ascii?Q?QJ+JIdnP0SKmnuZdDP7HSU4B8B87mr7EsRe72mJ45cXi/SPXK1IOk56gMP0r?=
 =?us-ascii?Q?k09uOZi9bDJryMb0OnRsDVfRmz+D2K8ADjtf3rxeiMkybJHUS0zsfztVaHqU?=
 =?us-ascii?Q?XlqXrvfqPE8neUkRSTYWIBGzRwVFp/fPvorghzt1vuIpTzgRkYynxYWpO6No?=
 =?us-ascii?Q?l9CAs3McsgeJIoutAbqEv5PLJLtpGHpLupsuJvV+JFaRxqv5LhUe6qG67SML?=
 =?us-ascii?Q?3TgPMRJYkkHVcQ1Qz2PPD3JWrW0xvJv+3xN75prJZESr2pWfrRszXRVEgPln?=
 =?us-ascii?Q?1aq8r2YEj3G7QlOv40Q5BkZNM7JCuQx6aooOWvqLfnHpr18pMC1+RXIeADvk?=
 =?us-ascii?Q?chxLz02prOd64BPabwo5dQEtuQ+6pARa8sOKg45A4gKa+WWULBn0BDyDGjwn?=
 =?us-ascii?Q?eWla1nzNmPQWREJeYmdNIXVkqtOHLJqA8+zgclS5mYUMvTEnJajOFqN/4H60?=
 =?us-ascii?Q?ywHzv3L3V//FtYxRwbVuSDKWNLik8f9ZzLgmbU7SmcfEexOLbw9zvOBqg1Lg?=
 =?us-ascii?Q?90kFo1Y15fXlEkER+GBMBSrsKeXszOeZ7Z3ynme/Mp9wSyqK2sFI7YlKVEoh?=
 =?us-ascii?Q?xnQKvuGWYE3cKKFLa3rMI4HH+czxWIisJL6QQwte6NQLwczDu7Nypl0J6vYj?=
 =?us-ascii?Q?1vEK4TDbUGFyCiTWe5x3UI3fbCzKMSCxh/p2LPPVrr4Znh2bqm/FotvGq1CI?=
 =?us-ascii?Q?NV/HE0VxG+nnZWJylYQc00QR+uydkO/zQzizB5OFx9LitIrDxbSSsxX71oQR?=
 =?us-ascii?Q?VAxwS+WM+iQ1xNOnYqwAjY7t5jhvtjggL16xU9z4bq3vMcRlzc8odc+FaCBT?=
 =?us-ascii?Q?AEnK4qTdCg=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB6226.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81069478-6a20-458a-c1f7-08deccdb052f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2026 01:43:38.9957
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +Y350/D3zwwhsB+WLAKsi8QWYz768QlIav/Us4p1DpKKKI+BSCNmIZaIERAq0x19o1Itktd7uDccLaE/VD9sJuHep/SnwajmaiDvh/IXViY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2PPF2BE5BD2CD


Hello,


> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: Wednesday, June 17, 2026 11:56 PM
> To: Joakim Zhang <joakim.zhang@cixtech.com>
> Cc: mturquette@baylibre.com; sboyd@kernel.org; bmasney@redhat.com;
> robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> p.zabel@pengutronix.de; Gary Yang <gary.yang@cixtech.com>; cix-kernel-
> upstream <cix-kernel-upstream@cixtech.com>; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org
> Subject: Re: [PATCH v4 3/5] dt-bindings: clock: cix,sky1-audss-clock: add=
 audss
> clock controller
>=20
> On Wed, Jun 17, 2026 at 02:04:35PM +0800, joakim.zhang@cixtech.com wrote:
> > From: Joakim Zhang <joakim.zhang@cixtech.com>
> >
> > The AUDSS CRU contains an internal clock tree of muxes, dividers and
> > gates for DSP, I2S, HDA, DMAC and related blocks. The clock provider
> > is a child node of the cix,sky1-audss-system-control syscon and
> > accesses registers through the parent MMIO region.
>=20
> Why can this not just be part of the parent syscon node?

The clock and reset blocks are handled by different subsystems and maintain=
ers (clk vs reset). Putting the clock provider on the parent syscon node wo=
uld mean a single driver has to register both the reset controller and the =
clock provider on one device, which doesn't fit well.

Thanks,
Joakim
