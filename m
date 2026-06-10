Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023077.outbound.protection.outlook.com [40.107.44.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5716432B121;
	Wed, 10 Jun 2026 06:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781074137; cv=fail; b=cSLidbffaTPlee0m1x5GLo94lhR3ZxupvhfnRCIrpt+jkmztRPXZ4D6fVMcdcIe9V0dc1oWAdobi+PswzxewtesWMeTt4XWWI8M7FA59fJnFOw1KBt0DIGIwkigAIWD7KeVrS68cEQBURapR6+/Pfbf3vKVPhM9cmbH4g6XV1wg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781074137; c=relaxed/simple;
	bh=T3CDG/XPa3rQ8ZmkjUQlstxvT/Ig3LHO+DfY/aRWZ1s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jzYSDzQwuTtt5MQpysMsTIk2rQf+/y8ANCxT5YXo0DCZVLIBuAtNBPMaP0yJOzUSG2wzpYaXft97abDggaqcajswDr9mpekdS1YXJpyodA/ZXHQGyzX0YYksFmzLyZ4tPqSqJleGdAEFwf4gfpRU8A85HHD33BJaNvYBUSdVN6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mck/m99UlfJl/RrglFu16Xb3myTL9z627pj+zhlZnGwAIhd1bOqO4q8lSQNP+fvOTev8uXM+ygeCyd4EVtDD5DE25PtUVj+IGtgO+C0i/wi8Fn0sBFDHZ8xWDEyo6CaDTFXfiVyh5uHqstOLKy4sa1LC5fIwqx3zp3Vyb8pQhL5n690rvFsUo8Z2Pr2DsxHHNhxAjLSoe32WN+aIakwEc1BHveNpK+LIvwmPxu5qdwkpmTtIZdsOpCwQPPJyQeZoyhuU5CZAwFFWYQ7P4hkEc8nRvmi/5ikkMzX1WytwbqWSNDtr0z/tsvQFZ8oC1EEJpj8OcXkq3CD/WZGTz2OCpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zdrnauYIQRSJK/deh1IRnflC1TKXcpHZvtEKbx4RLT4=;
 b=B/wAmmzFR/kNAO56qrzbdq7Q6nDBXLUKw/1DTCP54pYdUWL8nA35T5LAQ5/NdYinswgRCOn0RPr99esT4NHbDy0zSvfF/NpILnkjywbJsCnC24RNA388IrOhnn8yszl1Uf1TBNtPjwlAzGkNCMTIue+UVk8+atUVHVWLj6bXW0+AnRlul2heJ3BlqSmzPKzRzv7Sh6dySeG3F3nJf0jWkVOS83lIMKQ+IIuDZWQ07NdfXz0grovkhC3UQBcmcedd9ZCJwPItu2Yfa3pc7g2f6wbC56B2DsZKLL9Uh6PLwhz0zNrKeXr7zMvkVUEfR8ckRwqSFWx7Lmon+Lm0/o4x9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com (2603:1096:101:df::13)
 by KL1PR06MB5970.apcprd06.prod.outlook.com (2603:1096:820:cb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 06:48:50 +0000
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364]) by SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364%5]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 06:48:50 +0000
From: "Joakim  Zhang" <joakim.zhang@cixtech.com>
To: "Joakim  Zhang" <joakim.zhang@cixtech.com>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"bmasney@redhat.com" <bmasney@redhat.com>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, Gary Yang <Gary.Yang@cixtech.com>
CC: cix-kernel-upstream <cix-kernel-upstream@cixtech.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v3 0/5] Add Cix Sky1 AUDSS clock and reset support
Thread-Topic: [PATCH v3 0/5] Add Cix Sky1 AUDSS clock and reset support
Thread-Index: AQHc+KDKogvgvjpPKUmGqtT41Mg/RrY3WE5A
Date: Wed, 10 Jun 2026 06:48:49 +0000
Message-ID:
 <SEYPR06MB6226D4E0619C7DC90E28D8A9821A2@SEYPR06MB6226.apcprd06.prod.outlook.com>
References: <20260610061712.3203984-1-joakim.zhang@cixtech.com>
In-Reply-To: <20260610061712.3203984-1-joakim.zhang@cixtech.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB6226:EE_|KL1PR06MB5970:EE_
x-ms-office365-filtering-correlation-id: 5f0981a1-3983-436d-cc77-08dec6bc5413
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|56012099006|3023799007|6133799003|38070700021|13003099007|18002099003|22082099003;
x-microsoft-antispam-message-info:
 UMh38YSUHPFBm9Iv/YHO5I+WVYV9+QDsi7En72N+8uwRzrPj/ZKrGVyBLRNlK2yXXjqhJKfwcrzTCujOpQg7Gfe9EbYakbzz0yaOwvzYbkqbr2hEJ+OVD7rj7XgdA55U6tB//vrW/AxugIcTpxavyfNEAr4Vg0ZTaO0r6gZ5mIlJXTgtpHMnamAjR32t8DPe1XTdqgNYx+MtgAvb6nH5Rr2CEcCGRAcO50Lc6dWIfvT6dN79ujDk3U6X8hbhAPDYZYx6PKN62RQsuIf1VRRRSEuN8s9TmQkr7gWfk9oSXphyU6WL9SWKjTnVEGhN8VGGbdyRzez4clkw1Dbv6cpX8gw9tv8q87jRSu+GJnAquTe9cMH0AeY3ffwfaya1aB2K735mxRWJ9idsFsaB2pr3EFOh1LL0L/62p5WFlIkagHqi4dkmuBrM45dpuPLKncT9gXYSapQZMPYjJj2mUSsXF6GxRNpnFa4kVFGS1rx7P7oeg52eCLjJxPZC2Ac2DotmRhnDVYdi7LhvMQ4a/iq6gAlTPUvzJywCPwWyM05yXoPbT7WUkXHcPya3K7vG6Pd+y2RjidkdXPqMmSrCwL8bBKvUPS9+CPmy+jRCcZ5ThO9A969bSGpkPt9RCzkeYowA72M3DFEPHARbM+1Pg75/G2aK4HMR/+pFCHBkS4IzMM2pjqE8KtXE4PWlStTPiWRBqwSVPuQJtQhJGNZFRmQFfizT4um1S4YBpcRbOOWNiuelkLwNQFu3ViqZ0COWgsXB
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB6226.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(56012099006)(3023799007)(6133799003)(38070700021)(13003099007)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?xkgNDXwyBipGXKq3FIdbzHVpWl4Va2SBLe4feRVh+vEpQ9EKEaVgnE3pHqwW?=
 =?us-ascii?Q?T9bY/cUJtuYJcST49jVo3L8NUE+BTjGlk0FQSfF50qBX+C13GnCMKd5Iz8gx?=
 =?us-ascii?Q?8toASz7RlYUiuY3fyBz0fBUJEwRIL0k6WzNlWJ93k3UIs1MfXnddq0KnoWCN?=
 =?us-ascii?Q?qtjOEEpthLHYf6IrLB/HJviGpKIXc/5gjYJj8/qM9gx6zsouwmlYCqBk0rMq?=
 =?us-ascii?Q?l6Dkr1ILPuS+bIzSsnUhxR07lPQIkDVgMPJtBcxUOfwBZUQH+VqiVTIhwp7y?=
 =?us-ascii?Q?WPRS565uunGA2iIyUmRtEc6sg34jyTB0kJm9CLFuQA6YD1haQNvVVUxZp8Vn?=
 =?us-ascii?Q?vjVDuIT77k+Ckud5OHVsQN5if9jfSXg9sC5psj4Wz+ORg0jy27l563qhI0Yn?=
 =?us-ascii?Q?an29jbFDNJpWsQgFMM2geGjk0xw6Tx0AR82Nq+ab0TCQnPnD+Lo5ruubecqe?=
 =?us-ascii?Q?T5tpcGHJP6ltIu4lqXsUvc+3k2RF85xVUWq3Pw/EbYgtii10OzrzR4toEVSl?=
 =?us-ascii?Q?XIOudRurEw736zuZg2dsL9KqwqMf7z0JettsxkCqqt1IXUqE7NPWRyWHTiD+?=
 =?us-ascii?Q?v5A8F1CUOLyAL7o3gmwyM3KpSfz8RcWkN/cxpKcDDvu18HqvK9pdBc5kuJl0?=
 =?us-ascii?Q?kt0+yvvr1BPHN0HVsyBqiUQBXaaiXEiGS7/1g7E9OVqGN/Xn9RuFjtf68qVt?=
 =?us-ascii?Q?IfM0W95MUUfE/9yTr26+7Ym9Dns0W4Vg9vcFuYVtdLEIbefu0F9oCnCDEJJP?=
 =?us-ascii?Q?cwTMcE9MCYadnyFYS+kWuvS3jGcMdDbCSn61LUqP5yjbzy++KQ1Npz2GLxtS?=
 =?us-ascii?Q?lE2WJVzOIxJFw5iNKl2/uUSTvYvPtrQ+oiAPjh4EKeZoTdmejFn1MeAqUK2y?=
 =?us-ascii?Q?mTx11c7rsimGm+Zr6axWtJlU8RCTdAgzoCx/hNgDVc0BleeTe3NujzUczTDB?=
 =?us-ascii?Q?L+8L5Rw93wG2c7Sz6ti/bGXAN1TZ1JZxLNa/e++r9lbvL/m6raDDZ/Ebrmcs?=
 =?us-ascii?Q?PuL+LyEDSU3NTf7tMuMtTX22USMsD4D9f+k86gXjeisYokRMq58mYjBI+nB3?=
 =?us-ascii?Q?MPTG28BFqr9k059MhFRPdk7JVOAnxLTAh42AhxfklIZOkITINZena43Q7IqL?=
 =?us-ascii?Q?sEBeCLUYqLnt88KlelR3wYFxGgQ8c/yLX6XQvSRuaKAo8PidavVTgSh7+ZHV?=
 =?us-ascii?Q?c5AJAng8yDFMoCctdlFroYuJrLegzPcg852hoxnK9J0YuE5smuyKMyxtmbnv?=
 =?us-ascii?Q?o8BKyIRXd4rENmUB8vmj501GKLq2pAzMkMfdV7wkCC8sbIHC+Qhqo4KzDi4k?=
 =?us-ascii?Q?XTaeFYwtRRUq1dcSRUzsV/Z9BzTH5JQuddvGX5TZ0v/UN/6ugPZm/xuAmL+Z?=
 =?us-ascii?Q?dKrmlDD2ZZs+WsJ+ZPFKMu5e9AAuGN6Wmbpzi4dn9iXm9imAy3YSFe9TsVYv?=
 =?us-ascii?Q?vMbMc6gB9+puaccruFQ4Dy+hisoi3oVvUVT9Nd3nXEOc6JN1+lDfXCOrHeTa?=
 =?us-ascii?Q?yb/2QK4ZpoJx1Y3P2jeO/6PaLEuRavxZeNOF/tX/4j0r753zrSceV5VJSiHX?=
 =?us-ascii?Q?j+CMrvGy4UCL3bY36cxyUtG0tMK9IX3gG8g1nwv54rV/ZHQ9MZPo5j4lRDcG?=
 =?us-ascii?Q?KUV+87fQfzYFg5GB9Tqvr7mIwunDsHXhdTJIfHWXODDYFQLtHYtCS6rsIHT1?=
 =?us-ascii?Q?fEtkOlddFYzBPUM3tgX+iD3keXQZsM4XipQSlscy/i+5cV+zruIzB7rvR8bR?=
 =?us-ascii?Q?058tKPOJcA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f0981a1-3983-436d-cc77-08dec6bc5413
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2026 06:48:49.9535
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: twaXFemNzvh/IeeuykSnw0OpkxAQeZ3Xytsnwmo7Jl4DVLJT/MdQz7FWycyTrZFMP4X3+Ns0bR5kWl8zd4nHZU9tnOopU6nDK4UXZz7ALQc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB5970


Sorry, I only checked the corresponding files, but forgot to do the overall=
 check.

make -j8 ARCH=3Darm64 CROSS_COMPILEaarch64-none-linux-gnu- dt_binding_check

upstream/clk/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-cont=
rol.example.dtb: clock-controller (cix,sky1-audss-clock): '#clock-cells' is=
 a required property
        from schema $id: http://devicetree.org/schemas/clock/cix,sky1-audss=
-clock.yaml
upstream/clk/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-cont=
rol.example.dtb: clock-controller (cix,sky1-audss-clock): 'clocks' is a req=
uired property
        from schema $id: http://devicetree.org/schemas/clock/cix,sky1-audss=
-clock.yaml
upstream/clk/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-cont=
rol.example.dtb: clock-controller (cix,sky1-audss-clock): 'clock-names' is =
a required property
        from schema $id: http://devicetree.org/schemas/clock/cix,sky1-audss=
-clock.yaml
upstream/clk/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-cont=
rol.example.dtb: clock-controller (cix,sky1-audss-clock): 'resets' is a req=
uired property
        from schema $id: http://devicetree.org/schemas/clock/cix,sky1-audss=
-clock.yaml
upstream/clk/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-cont=
rol.example.dtb: clock-controller (cix,sky1-audss-clock): 'power-domains' i=
s a required property
        from schema $id: http://devicetree.org/schemas/clock/cix,sky1-audss=
-clock.yaml

I will fix it then resend the patch set.

Joakim

> -----Original Message-----
> From: joakim.zhang@cixtech.com <joakim.zhang@cixtech.com>
> Sent: Wednesday, June 10, 2026 2:17 PM
> To: mturquette@baylibre.com; sboyd@kernel.org; bmasney@redhat.com;
> robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> p.zabel@pengutronix.de; Gary Yang <gary.yang@cixtech.com>
> Cc: cix-kernel-upstream <cix-kernel-upstream@cixtech.com>; linux-
> clk@vger.kernel.org; devicetree@vger.kernel.org; linux-kernel@vger.kernel=
.org;
> linux-arm-kernel@lists.infradead.org; Joakim Zhang
> <joakim.zhang@cixtech.com>
> Subject: [PATCH v3 0/5] Add Cix Sky1 AUDSS clock and reset support
>=20
> From: Joakim Zhang <joakim.zhang@cixtech.com>
>=20
> This patch set adds the clock and reset support for AUDSS. The AUDSS grou=
ps
> audio-related peripherals (HDA, I2S, DSP, DMA, mailboxes, watchdog, timer=
,
> etc.) behind a single Clock and Reset Unit (CRU) register block.
>=20
> Clock and reset changes normally belong to separate subsystems and would
> ideally be submitted as independent series. They are combined here becaus=
e
> the AUDSS DT bindings cross-reference each other: the system-control bind=
ing
> describes the clock child node, the clock binding documents reset lines e=
xposed
> on the parent syscon, and the DTS example wires both together. Keeping cl=
ock
> and reset in one series gives reviewers the full picture when evaluating =
the
> binding layout, dependencies, and integration.
>=20
> Patches apply in the following order:
>=20
>   1. Reset support
>      - dt-bindings: soc: cix,sky1-system-control: add audss system contro=
l
>      - reset: cix: add audss support to sky1 reset driver
>=20
>   2. Clock support
>      - dt-bindings: clock: cix,sky1-audss-clock: add audss clock controll=
er
>      - clk: cix: add sky1 audss clock controller
>=20
>   3. Device tree
>      - arm64: dts: cix: sky1: add audss system control
>=20
> The reset and clock parts have each been build-tested and checked with
> dt_binding_check independently. If reviewers prefer separate series for t=
he
> reset and clock maintainers, I can split and resubmit after this round of=
 review
> once the overall design is agreed on.
>=20
> ChangeLogs:
> v2->v3:
>   * clk part:
>     * devm_reset_control_get()->devm_reset_control_get_exclusive()
>     * assert noc reset from suspend
>     * clock parents changes from 6 to 4, and rename the clock names,
>       explain more about this: confirm with our designer, In fact,
>       there are 6 clock sources going into the audio subsystem. audio_clk=
1
>       and audio_clk3 are redundant in design and are not actually needed
>       in practice, so they are not shown here.
>     * refine clocks and clock-names property
>     * add detailed description of clocks
>     * drop parent node from clk binding
>     * drop define AUDSS_MAX_CLKS
>   * reset part:
>     * rename reset signal macro, remove _N
>     * drop SKY1_AUDSS_SW_RESET_NUM
>     * switching to compatible-style of defining subnodes in parent schema
>=20
> v1->v2:
>   * remove audss_rst device node since it doesn't has resource, and
>     move to reset-sky1.c driver.
>   * remove hda related which would be sent after this patch set accepted
>   * soc componnet is okay by default from dtsi
>   * fix for audss clk driver:
>     * remove "comment "Clock options for Cixtech audss:""
>     * add select MFD_SYSCON
>     * move lock and clk_data into struct sky1_audss_clks_priv
>     * const char *name -> const char * const * name
>     * remove CLK_GET_RATE_NOCACHE
>     * divicer -> divider
>     * Reverse Christmas tree order
>     * return reg ? 1 : 0; -> return !!reg;
>     * return ERR_CAST(hw); -> return hw;
>     * of_device_get_match_data(dev) -> device_get_match_data()
>     * add lock from runtime_suspend/resume
>   * loop to more mailing lists
>=20
> Joakim Zhang (5):
>   dt-bindings: soc: cix,sky1-system-control: add audss system control
>   reset: cix: add audss support to sky1 reset driver
>   dt-bindings: clock: cix,sky1-audss-clock: add audss clock controller
>   clk: cix: add sky1 audss clock controller
>   arm64: dts: cix: sky1: add audss system control
>=20
>  .../bindings/clock/cix,sky1-audss-clock.yaml  |   80 ++
>  .../soc/cix/cix,sky1-system-control.yaml      |   47 +-
>  arch/arm64/boot/dts/cix/sky1.dtsi             |   24 +
>  drivers/clk/Kconfig                           |    1 +
>  drivers/clk/Makefile                          |    1 +
>  drivers/clk/cix/Kconfig                       |   16 +
>  drivers/clk/cix/Makefile                      |    3 +
>  drivers/clk/cix/clk-sky1-audss.c              | 1175 +++++++++++++++++
>  drivers/reset/reset-sky1.c                    |   36 +-
>  include/dt-bindings/clock/cix,sky1-audss.h    |   60 +
>  .../reset/cix,sky1-audss-system-control.h     |   25 +
>  11 files changed, 1461 insertions(+), 7 deletions(-)  create mode 100644
> Documentation/devicetree/bindings/clock/cix,sky1-audss-clock.yaml
>  create mode 100644 drivers/clk/cix/Kconfig  create mode 100644
> drivers/clk/cix/Makefile  create mode 100644 drivers/clk/cix/clk-sky1-aud=
ss.c
> create mode 100644 include/dt-bindings/clock/cix,sky1-audss.h
>  create mode 100644 include/dt-bindings/reset/cix,sky1-audss-system-contr=
ol.h
>=20
> --
> 2.50.1

