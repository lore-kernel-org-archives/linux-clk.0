Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010035.outbound.protection.outlook.com [52.101.69.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8456645DF45
	for <linux-clk@vger.kernel.org>; Thu, 10 Sep 2026 10:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789037405; cv=fail; b=lzhzv5lB84WaE2IauO2UP87XGD5Cg/vQuiXMu7GIz3C2C8n228pBG22y4T5ND34M9O5m3Q1LjIv6FIZObuMRJixuqMW2T180q//XSubbqeVE3sJ/hSlorwAi9uHTGch6Zfc3Zi6wULfAC4ateK9em0z+OooqwOibxUcztu4iW9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789037405; c=relaxed/simple;
	bh=jbudskY43BJxAirVc7RRXqvuVaBUzRoqMwWNcQzgxzI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=erpoku3InbSY5iPDhMrVb+dANyVx+aylY8WoHDYVJo+P46IWR9Z2brqVmEhA11z1RRCh9ZatWeqiYSl3O2YTa8wTfIHRMiN95QmoUNGLYjF3PnDLwjHuekbeWzYXeW24yOVctt7udz+7K6GS0os0YDHKN9gEqS4snqiC2F+vBj8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XOZcFqVG; arc=fail smtp.client-ip=52.101.69.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XOZcFqVG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RkwpbzMA4X4vxDKEnFZXpTIPZWNncoU0OhAHbtmD2ynHuzRO33jUMgpzEt+epSicgLpaDFP6Vtg9JVu4p8vEwGn5YZ2fqUiF/0LRTlrGkvUnC028WUhup5IGqesnY5WA4RjfhxnH36TEbQ/BDs5WePnXZAAUvUQyzsmXxURDgDgi8PyouyFWm5PuCk21eg9GhAf+62vLYdQ7Ynzof17Iv20xY+CpAYLvZt3/ww2aHLJ2V53M/UdunNfc6oMR25ejcrXX8wQQfyCj0HhSYF9JRPlMVVhFQN8kTZbvfz2wNOWSmN/ZvQPbZ+htQ61IJLVuqhSfze+K7xu7Zrdr0Zd06A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbudskY43BJxAirVc7RRXqvuVaBUzRoqMwWNcQzgxzI=;
 b=L/SxicyY1IejDJdYWOX4itUcJHvYktxG5Oqh61eqFV+phgdwcbFOVxs98CfH7sZiiLVoDW0hxC0m2geLGO8rcEm8B90bY6EaVfaVffFOYpwrAhjy/dAd8UAtTPYUezgJIvEXx/6NWGdCetrTI3t1RuV2ALZ52o9LXBylVvUlk0fwhGLmhpbchuTjNV6J1NZ+A33U7/4WVxwiTWA+hMr770SXzsBhrRE2eUdB9Dyv7vMndgK6V0jDhxYaFsGtAoaBz2P8omfWe8zqpr0UjToM8FAdO3cUnOOMPwQ8X/eUx8S9IroagcZVrcJpOOVndejYsANL4z/y5lgUiVLOxlfNdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jbudskY43BJxAirVc7RRXqvuVaBUzRoqMwWNcQzgxzI=;
 b=XOZcFqVG7nkPTtiEtN0nMIys6QohkhaS1Czv1Zs0DB0e9fWW4Nv44afWLLkTPnJ1b4UR2Y6OW6Q9zGNYVC7r8Ip//GZkkkVSEepBuIhiKq7d+X3oRkQmiVOBJMD81LN4Wwy7HnIBdQwTU16IaDCQYFBKEwZNisjU7FbfobTXCwvbTQhH/E7E+re9OhT7moQpZS5rQQCK7EBVF0naGqcyp1kscWE7/RmxVru7sFaRtljiJ0k8hFAMQyNNinodEEbhUmIM+wvWcmJHVI2WW6auSygU9Yf1rvXRGI4y/ScocvUpNpLd00vUvbCdjP5UU2/OtVi2HRpeO9D8Uu8uHoA2vA==
Received: from ZR6PR04MB375776.eurprd04.prod.outlook.com
 (2603:10a6:910:dc::10) by AMBPR04MB11786.eurprd04.prod.outlook.com
 (2603:10a6:20b:6ef::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 10 Sep
 2026 10:49:56 +0000
Received: from ZR6PR04MB375776.eurprd04.prod.outlook.com
 ([fe80::b83a:a0f5:2b29:50de]) by ZR6PR04MB375776.eurprd04.prod.outlook.com
 ([fe80::b83a:a0f5:2b29:50de%4]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 10:49:56 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Linkai Gong <gonglinkai@kylinos.cn>, Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
CC: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH v2] clk: imx: composite-93: return timeout from gate
 enable
Thread-Topic: [PATCH v2] clk: imx: composite-93: return timeout from gate
 enable
Thread-Index: AQHdPm+5Dm+HtrBT7kOm7qAQfmpwdrbHpzIQ
Date: Thu, 10 Sep 2026 10:49:56 +0000
Message-ID:
 <ZR6PR04MB375776542DE3B4EDE258846FAB88BF2@ZR6PR04MB375776.eurprd04.prod.outlook.com>
References: <20260821085616.1129333-1-gonglinkai@kylinos.cn>
 <20260907022214.1076402-1-gonglinkai@kylinos.cn>
In-Reply-To: <20260907022214.1076402-1-gonglinkai@kylinos.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Enabled=True;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SetDate=2026-09-10T10:49:20.0000000Z;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Name=NXP
 Confidential;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_ContentBits=3;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZR6PR04MB375776:EE_|AMBPR04MB11786:EE_
x-ms-office365-filtering-correlation-id: 9532a003-f9ce-4946-2458-08df0f294095
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|19092799006|38070700021|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 20ovkr9CGoFr/IEg03uLZN3eW7cXSiB1kM4zhOyS/XaXMchrZNuRCJaHdlYLmgf6LChqPXfHA2/b0isNtkSSlUrT5YvJKtfvNs34kj9BOqbv0RDOgkd51K0ptOEDfcTIsWCOvcnwhPxCzvlr+IexuCRd/jSFG0QdyHJSCiXK27pxW8dw7U0RxAPTWzNpXUjJRqqglblmVhv8QUl/SXTFDBnBkNeNNnqP1xtXKUHtnI9vglsZ901GhhP2SRn/NnHEM25PakRqBbaBEjeFKahMW/R3aw5ijSy6yMP2EQzMmzbIYbVBc5VnuQ/eHy6qlzUiYp6lzh+cY8kVrvP6HhiVxSFXh4rdhlir0/xp2tZEHWL8aylYf/IiRQPYgBZ0ZQhrQbUXNVclvH82ZLPsVc9acEEWosdtseYDOpP9as0Wv3Y6zDdgkaInUpXKoEKO9CI/o09RiUsNz81rxIp9KvOSL8S2wXGrRQqixVqAV2VAFqUX9Zmnl6NNJ+OUhJKIH0Pf4xt2OuDJbVTV+EOa3+CsCc7ZnUHWxSUKQd+JX+jgd21rm08leZ+LQ4m+qvfBEOtXViYRs0WKjUxBAG3Ekmq+QLAGdQwvTnl3EJFK94cffCaSNGvnZAoarzCK0UJSMhpy9pBGlcoiIEY7eL8tTxQYG+KyxFwQf9Nwp9Pp/4Nt+Sb3jcRNJsR1WuTbX+MJ/zt3HnyctquCnG4gFcI2J/ggYCEbN0upnFl0u9fXsPU/ZIE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR6PR04MB375776.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(19092799006)(38070700021)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?+wJhcLdc3Nedt/sveJD3r4SgIUG2IdXwV3Mj1ZhhA9Ru25UzIbSq+7JBIMaZ?=
 =?us-ascii?Q?zPyKUMbQFXDia1VnVEOYmXnFZ0cuh6uvgbXx/9fTMFS6l7GCX/gLUaevnoft?=
 =?us-ascii?Q?1E4Al1IzKenRDK39E3dK4Iy+u43Ra/b8/T7gkaxKXBBVrUVroV0nZSftXAnM?=
 =?us-ascii?Q?yDzE6FUSATIiXYhkod8A+Yd58klu4ULTRKLfirh/UcJbtolrapDDCA25k0IP?=
 =?us-ascii?Q?ObTwMSkpszSW+sKp2kqdAlizmMkraGHa1QjcXgpjAp92ifxG4cDppNObllPS?=
 =?us-ascii?Q?51pUnvXOqnJcxAlZiXXQ28c8djcUpK5nKcKo583p3Cjw3FQ1SF8VFMdRukHT?=
 =?us-ascii?Q?JfmQV3vCwPKO2UGN8FaWHdqRtH1/cn7RdBF1KHs0L2oTFziD7fv5h2IMKW5G?=
 =?us-ascii?Q?dAI95YcVDOoJ/wFPFrZNCRk13XVgYHMJzuiKkqYeZjJRrP5x7JTcY3D7dWrh?=
 =?us-ascii?Q?zSHnoQFjDY2QM6CHXijnIWFfgfACUJ/xCPa/OLhw6CjMwrmeFtJBhCMK0UEq?=
 =?us-ascii?Q?i6kxyyp36QuB83jg8X8lRqUxgsKC9p4Hkq8jcJ+61G7bwKpe9Y3ap/W2skzM?=
 =?us-ascii?Q?RqLTy+o4dXj112UHsJuoPWU+ap/MnoxzP5lKj5mHRSiJA2LaklzZA8Ei38i+?=
 =?us-ascii?Q?js+uASSLLrEIFrMMYPRZzs3+SfjbcXlJ1rPfQ+q5jFyLr9CV83qopqvfTvsc?=
 =?us-ascii?Q?Eha9lHqnZvJU/AXl01TwJw41QO8FjUX+Kyyth9J79Tnh5RXWBpXUeGV2WQvJ?=
 =?us-ascii?Q?bkvLwQX3q2fyLX/TVQUPsemY+THV0rjwc0XNBV5BQEMYSWzcj2PW4EIUDEbc?=
 =?us-ascii?Q?RDvCn4VlBbykTIJ1mkIAtvD3cH4g45wL9DxRdHiXti1NlOPIX7zuBsM/K9fL?=
 =?us-ascii?Q?OXcMtcyPkSTYo48fadTPgucXQOvDOse1Mz6yxTGIT5vnb8ZJbAfHaZFQQcOR?=
 =?us-ascii?Q?QCUIljuFiPbPGDMMKOk88/4oZJyeBpUzNPi46ERv0QumGfZxxIojRP+fk840?=
 =?us-ascii?Q?uDJgB15gP/QN20XlOWS6pFmMIvGe0Z1mcUIjIujeZCWPJ8nxODbddZwBCJC+?=
 =?us-ascii?Q?N1t682fz++cDFSUkscvxeIlDZYu31iXvqanTyDfModtqsuaOn+LWogNTWV/x?=
 =?us-ascii?Q?UKQO6KNGZR8Bg7nea1c4BbTqpTllRS2ONvcPF8PXJTX0zPVSZSxHUpmv/VCj?=
 =?us-ascii?Q?QTFGlozlgTLw7D/J4jSzLb6LwonFN6BAyTuaBoGVcIKxVIwFZypIezVA9WAd?=
 =?us-ascii?Q?QnEp1loT/eYKp3iFMG5E7K0PsqPqdx872rwa2v1cNg0RTx8jSwi1AsIiDObt?=
 =?us-ascii?Q?BhOebTUyM0R2xZPyVe/2ZK8PzGLLoloRpsKWMZYFHmd5Z3NkQj2cAmifNr+i?=
 =?us-ascii?Q?u7rA1o+DR7/VkxKJsNmhFTpcZ6oJwQF9dHMr8HntGT9XCNV2vZyGrnf5L5L9?=
 =?us-ascii?Q?qDRH+YEg0jZbmaPqwdWwBYt7vBXRJ//uA3G6VylKlOf2y91B7zmrr8aZy2Hz?=
 =?us-ascii?Q?QjydT0WxPJoJcpQaQv8G0ufNHpDPvY0JdRgAcgFJbzu+siVLW6BTQRpUlTMQ?=
 =?us-ascii?Q?rjwP0w5crYN0OzOt+30NMSDb+Lk6TwawHVoo+6aMtxawETrtx/HO9RE+X3Hq?=
 =?us-ascii?Q?pP124kPESCeGEflN+5TQVUHX9BmT3O3VGhRmTW1evo7CpA/XC5ewICcomIOa?=
 =?us-ascii?Q?Urxcb2a+hquzNiYej3K+9J/qSa03+vL69zMVuQrmLpag8IO6?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZR6PR04MB375776.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9532a003-f9ce-4946-2458-08df0f294095
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2026 10:49:56.0965
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UYKqSrp9sXlVrA2o+7sdv9TlcOwPVlf0CjLJXHdJdysZ5XK5GG7xwitAu0eolw2hrXaCYLVoXRR8lqV+QTRNBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB11786

> Subject: [PATCH v2] clk: imx: composite-93: return timeout from gate
> enable
>
> imx93_clk_composite_wait_ready() already reports a busy timeout, but
> imx93_clk_composite_gate_enable() ignores that and always returns 0.
> The clk framework then marks the clock enabled and lets consumers
> run while the CCM slice is still busy.
>
> Propagate the timeout so enable fails instead of looking successful.
>
> Fixes: 4a3de5aa7743 ("clk: imx: clk-composite-93: check slice busy")
> Signed-off-by: Linkai Gong <gonglinkai@kylinos.cn>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

NXP Confidential
