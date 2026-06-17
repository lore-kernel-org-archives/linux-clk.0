Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022088.outbound.protection.outlook.com [40.107.75.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BC33B27F3;
	Wed, 17 Jun 2026 06:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781678336; cv=fail; b=Org0OdtNV0w0pU2nv78a1+P3tUbMhjVTkU63KHZQ3n4sqGuKsALMD3SycMqluXGE9N5fLbqq5AcNFhrA0/1iJQ2nlSWFzqf2RpmktJUagqPgcb2MMMNqEbky2spCtxBNw3w9WMlqnPuu+rzQ/y0XvVY19QIlsgb3gwgQISMn50Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781678336; c=relaxed/simple;
	bh=o+0ZOaLTcUR1rYoPKrJd3JzO+6+44CSEpufwU9iVJNo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uPoxNmC6np6snI1KBYnvhGfLskK1DjoUw9XzCert5D0y0Z5m1jVTdw8+0ogqRyWEAoLzcv/lMgqV9YkTZGW/o6uY90IOk9eOAJwcOEQb3kf8URziPfs+UXjDot1npYIM/rDZX8/GIg94erXTJs3lo3tu3MzlIdSS+aPKVp3eOu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O6ezkm21/aO2+dZBiKH9B3YVLghHdCEiw8RFWF3Q4nkQHY4Hm57xBQv4IDK86LEuHlRVyrO1RhWI17ALBQ7t2kgegke4NiA05+Ww7HdzD/s0zmu1kYD+4oX4zZWx/8hlGEXpB3/2A5uHIPgSOjt/XH0z1DeoYP2Szs2MVQyiqQFePA8So8BJcPyXLswyfR0sJokRFGM2rwz1FBhMIOqnZsPMYACzV1BgkiFU52aI4vOvEWHuwV/1+dKnqK7pwW6Z5rsylmQYrYFnKXNv8YMiuDzqmqUFsGzRO2t53QH+iTwmRHPXz607WgaT/aL5QoegRLIzO8CAVuYCi00kpiFVUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8i3ZBOEfRG7BgDxurOeRQoDXm+GzmuXfbZlALLpD6Nk=;
 b=wGh/V/xf/Meeu8NEFTDh6MMQb99AWxlMlg0zpJL4dpvVnm45BupxxWfI0n006tq79lshspHv15NSi+gPBQ5auuv2DWDAH2kvAxV8MJP8qTzhCP/FiHxwlkTaf859F1fYZvUoZjxEABRm8nwYZIODglrLhI1JbPsQOD1tNFJZmSjGGAeaAvU00j024WmNFq7VfuHsxmR5FsYd6zCu0J4dngYpeBgpfrJRhVzGf3B2F7hJHYfpXvd7Q1VcDdFeTg8cVrYBHJ73BT5oCdr6cmeOuGWOIP1q6JRxyDwcaH8r9dcqQZFSfbJBHrHKLpoS2/ILhz4xkq+pj8VhIK/VUS7Xmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com (2603:1096:101:df::13)
 by TYUPR06MB5977.apcprd06.prod.outlook.com (2603:1096:400:355::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 06:38:49 +0000
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364]) by SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364%5]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 06:38:49 +0000
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
Subject: RE: [PATCH v4 0/5] Add Cix Sky1 AUDSS clock and reset support
Thread-Topic: [PATCH v4 0/5] Add Cix Sky1 AUDSS clock and reset support
Thread-Index: AQHc/h81tIF89r3H202GW+SLijASs7ZCSwYw
Date: Wed, 17 Jun 2026 06:38:49 +0000
Message-ID:
 <SEYPR06MB622679D0E4A78883085C8A1B82E42@SEYPR06MB6226.apcprd06.prod.outlook.com>
References: <20260617060437.1474816-1-joakim.zhang@cixtech.com>
In-Reply-To: <20260617060437.1474816-1-joakim.zhang@cixtech.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB6226:EE_|TYUPR06MB5977:EE_
x-ms-office365-filtering-correlation-id: 37edd888-fb70-4b98-388f-08decc3b1728
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|56012099006|6133799003|3023799007|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 FrcKlgxE1XNqR0eT+eONjWAlRhjCexaM/AlnI30DtvDZ5gePZOgQkve7d1llBT18h6FzA6UlIE1d+30PDxAzqiY7v+J0/pFxpkcfuv8M8qRRdZyzU8Oo3TctlWf64dxfXTBY18Oljd+8eC8nilRdYEtUzNTj5/0klSoAwak2vK0gg+tEUCfkiVY6SV+KkcC/iVtyGNttk/AcGh6hhceJZHYo6nI7Yv9p6t2wjsf/DPgghJ8b7L0WSINvRRFcS1sIbG/b5Xi2s9H/4qy8I09RZu2iu7FtWVYwj93USmEdbLgqIxuAh3dQf0/vvtsYgAEvBRnKN/HMkvtFR6o7bo3BSGg1pC7DI0uxxiHO5S0hSKhGNFrmrab1qszVvEN6ndIOzyoyGxIh1rJAI0vPvLEbqbIBduv8NYgiVy2EYs5RFHA9PC2TB44qGi+BSzSsR6VYu4FlJtbnVpgvls+9K+VmzQLdWR4gQm4QUgdYR9/jRLq7YSTpcwjO98vwc0fV62BvCQILlJfOkUbbDN/xJCSmLVG/i7tWwSGOfBOZNcMVuOu3w4ONpzjKZMWZkQUN+xA6BNPwcMJfmpmAuJZR2X6twu93VmvY9LMfEJj9wjm6v/7Tw6gMSwgKlUlMD/9ZFdPsraMp5PPk+3FFqOitdu3bPSO5c/QgkzywLYpY42IgEKq2+xfirJvMjJ3AbweiVt+plHpFyjIXItbUAKuPjuwEkqTGvGM3w7L2DYXhQu0tOGH+8mp5wW2xg2I7qDWcjhzN
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB6226.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(6133799003)(3023799007)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?sgxtYRhxQvYEBatvclUpoWWKJxE8VgyTDzRpLGKigyc5F0GKoFrjewTkvvjp?=
 =?us-ascii?Q?EYQhBzPTbIGUkgfWvxRnOTdT6ZNXCc6nA1T7mIOUUuVmr3YFjHAnmoCzRzps?=
 =?us-ascii?Q?feONZ32PesWs4WSARwutvCZA4qm28MK5xzquTZsFnnA0fTWfuahWl5wlib6Y?=
 =?us-ascii?Q?aRMcZgz5RTqyxOC5ewQqe4pmdY7hraI60K4XoxurXuA5lqe8QW0aY96ZgQjo?=
 =?us-ascii?Q?WVivquTbFAj6bxkEkAzDeZ73GD1iVGfHyMO80YS0Sad1zt5Frze/pm428aZB?=
 =?us-ascii?Q?i6LuD/Cd5K9tw+LpgaH7NsMvJ6kqqN8/tqBjuhkpeZNdI0UKHZHL4j8AsYs1?=
 =?us-ascii?Q?KcYhNBlVckZX/dGOZL2sFlkfuwvp+M8DTyJ89xL6ElMXLyUzS0iMaLpoDV/p?=
 =?us-ascii?Q?arr07GU9CxzVSipQNjUT5TuTaeRUchQkQuxQ3rgowHtZ0Bh6dPNo1Ika239e?=
 =?us-ascii?Q?pzri2oNlMYrqkEsLEimis40iyVLIhdf2mDqM3Nid6W7L7NfJMMtTwUwWXFaK?=
 =?us-ascii?Q?P523vgISTtaejnwBJ006Rs0vUSwIsP62GG1x0atSaURb7WWfsA0UnXK+Hl0b?=
 =?us-ascii?Q?f4xTko/crxR0xZFFTcZobQpYN0fvgErqvqZNLEfYjc8udC7LimDfPv3SVP5X?=
 =?us-ascii?Q?YQyNilTgeNmRVH31KDWNWed9ZA75QhCGyLy0BTrSj5OtK2aYKVIsH67ot/F5?=
 =?us-ascii?Q?mfJZ68nyUpBLAtGDQO3iyf3Wm7sgL0XHVybhHU47lSqDVtkCm6q8/Z/sShBQ?=
 =?us-ascii?Q?J753ihp1O4hdCRf1eUHn0Jf4curdsDxLj+aIKjnvZ5kzOZwH44rquOCvZYc/?=
 =?us-ascii?Q?U8HTZuWKOozafpBxhXzjHZ/vk57xrmk9WHerhPRH6Hve5aabPqqQVY3h50+U?=
 =?us-ascii?Q?JSsh8+q4o6p/45e8v+ZzNp2Dolbmtd6iOau+z5ZZ7wH9uJfNudVb7Wk5ZtFf?=
 =?us-ascii?Q?vFIXVkIqzx8djl3vNkZtgMUr11Je3oihCoIq8koy+DYOIEJx2pW5VLEvGSjp?=
 =?us-ascii?Q?rWaiX+w3X6NhtAKp2ZNNsE9tZEnkGNtRnyECGn7XRLZyPr85GnT0JihxcaRE?=
 =?us-ascii?Q?2NXnmI3CMl+8/dF/GIGhLlbkc5skrGiiRVsZ2M227WYmsPeDsBHHSSZn3lu9?=
 =?us-ascii?Q?xskb8k8nZF4EWHs10hkF79JgPtkV+ZB2bcUSI/psYh/x0fsGokNd8fXEKj6G?=
 =?us-ascii?Q?SG5TSffstGxOWKAvanBUvdrajIybcKgmErQcy08AbbNs/abZWovbk/EILlJe?=
 =?us-ascii?Q?tKiBapLg7sEo4FcpXESSK9RGbKdbzUpVoSlXkvx1Fgi7MW45YtCvdP1uqeA3?=
 =?us-ascii?Q?RQQHDrkMXs534zKsImwm/d397iTbc24iuQIbL1jL8DRBExsT+CbxTvk/hpDf?=
 =?us-ascii?Q?Q+qbQSOAGGsubq1hHPXPa6r+zeZJX+gWVPAQO9VP12XCs5ZsETxS7PzvR4sS?=
 =?us-ascii?Q?/36WQWQqUM3bogrCWEb2B1IgfDnLtFHo1dIZdtpNn63aZnhWSMQCS/GaoVJn?=
 =?us-ascii?Q?/ygbvno8Cjsot9h6/BzDgge6RMAit8hqM+xdT3PRxcW3RrVBXpXL8Sm8NwgK?=
 =?us-ascii?Q?+oQbUuwLhgtigZPqExDj9bWQcoZuTsB01wzY30UwcdkFSxT41Nu4p/NoucqT?=
 =?us-ascii?Q?Zl+DM/YDrwewBftss5L5DGhOwmvifbrt2wwHX7PygS44KOnIXzthscRKWGcM?=
 =?us-ascii?Q?mrZvlFV87TBx6LBEjLDz0xygHMtYzhgqAZ9rNOO18f5/hRPOLLYFwZksW0NQ?=
 =?us-ascii?Q?iFlAmjcskA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 37edd888-fb70-4b98-388f-08decc3b1728
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2026 06:38:49.6175
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PpgVr11wl8wO18TWty/+Ul/xn54/7QNRry1MvEn0cHzOG0nkgogrhacu3GUxDpSz961ygvAULO+0/TYIh+nHzkZEZ6LgPhb9YNIhwlSig3E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB5977


Sorry for the disturb, I will resend the patch set to fix a typo.

Joakim

> -----Original Message-----
> From: joakim.zhang@cixtech.com <joakim.zhang@cixtech.com>
> Sent: Wednesday, June 17, 2026 2:05 PM
> To: mturquette@baylibre.com; sboyd@kernel.org; bmasney@redhat.com;
> robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> p.zabel@pengutronix.de; Gary Yang <gary.yang@cixtech.com>
> Cc: cix-kernel-upstream <cix-kernel-upstream@cixtech.com>; linux-
> clk@vger.kernel.org; devicetree@vger.kernel.org; linux-kernel@vger.kernel=
.org;
> linux-arm-kernel@lists.infradead.org; Joakim Zhang
> <joakim.zhang@cixtech.com>
> Subject: [PATCH v4 0/5] Add Cix Sky1 AUDSS clock and reset support
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
> ---
> ChangeLogs:
> v3->v4:
>   * move both power domain and resets into parset node (audss_cru)
>   * remove "simple-mfd", and change to populate the child node
>   * cix,sky1-audss.h -> cix,sky1-audss-clock.h
>=20
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
>  .../bindings/clock/cix,sky1-audss-clock.yaml  |   72 +
>  .../soc/cix/cix,sky1-system-control.yaml      |   48 +
>  arch/arm64/boot/dts/cix/sky1.dtsi             |   24 +
>  drivers/clk/Kconfig                           |    1 +
>  drivers/clk/Makefile                          |    1 +
>  drivers/clk/cix/Kconfig                       |   16 +
>  drivers/clk/cix/Makefile                      |    3 +
>  drivers/clk/cix/clk-sky1-audss.c              | 1167 +++++++++++++++++
>  drivers/reset/reset-sky1.c                    |   86 +-
>  .../dt-bindings/clock/cix,sky1-audss-clock.h  |   60 +
>  .../reset/cix,sky1-audss-system-control.h     |   25 +
>  11 files changed, 1500 insertions(+), 3 deletions(-)  create mode 100644
> Documentation/devicetree/bindings/clock/cix,sky1-audss-clock.yaml
>  create mode 100644 drivers/clk/cix/Kconfig  create mode 100644
> drivers/clk/cix/Makefile  create mode 100644 drivers/clk/cix/clk-sky1-aud=
ss.c
> create mode 100644 include/dt-bindings/clock/cix,sky1-audss-clock.h
>  create mode 100644 include/dt-bindings/reset/cix,sky1-audss-system-contr=
ol.h
>=20
> --
> 2.50.1
