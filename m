Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010025.outbound.protection.outlook.com [52.101.228.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B109A3BCD38;
	Mon, 27 Jul 2026 19:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785179217; cv=fail; b=db/YegIoy5Wk8LtU53rV63BbmZEOLfbc77AtVV10TetuFdZjeaoE1vh1R5DK7KK+r0MTgv/5FAeTaGZ71jlDMjW/HSjO67UkdUdW3qgg0k9Qbdi5M4hduXyvUBn6gyCf167buegfX6Tzo/9MjjBW6Jd56i4phyYFW+aMaBxxKD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785179217; c=relaxed/simple;
	bh=uf6mydS+BoiqNCTMvTfeQA4+tRIqxQ1hrcbZXJOv94s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CFYc/aXz1cYBR2EZp6LgoyIifhyTEprzMrMgb9nfrOUlc1EhVsUWmu6k/Z8eSa+9pqMA8S/ZVxu8QBOFqr437BHSPO31fGFIzu06Y+2+gs7CaF1PsXDFjuCu71aD5/hV3QHoUsQ7XLwhdYkhdo0klMY9GRDQB5ZaJje0jfD+WnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=jHI6dUpE; arc=fail smtp.client-ip=52.101.228.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="jHI6dUpE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QV3FAMgvDfXpNb7HQ1VWu7gp7EY+UpNBbobFjRLhetot9l6WQY6EJeBJp8d8tHOC+WzZur/QVLu9FCoiztzLh0TtuaTofYUkZj+l8cwm47OHBH1WkPyD3/lyfyCNb3wavhDTjRjUhxYWYUHoLkuumbah+dpmTgIMWdcWFaS88ZmjK0d8vjdFeWrlWryaZs6J5yzL7H7ePvlgT6c7gfNKobEZYFkI/0K+kats/rBlH3XAdygx1FAP/D8j+aWLEfzlGmwMZA1pcMZPT2arB6tqAWgpO6SJdlyC/v24CFanxHJinLiGsgUlt/P5/KIcyfYlQguEaz2MDZtz07DjzKxMEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uf6mydS+BoiqNCTMvTfeQA4+tRIqxQ1hrcbZXJOv94s=;
 b=oK4d8y+tOiP1rlKoMyvFAbkyTgEpWnHzO6SyCt06u3tm1kNNdEhUZVULxy2sFKSHwqR15+++S0KuQoKHcGWOaMUOSFTXmMbX3Qej+QkpU2cKs+HYnqaNPtSB35irr7L0/OJA9IJWqCZij3/v7ohzocLwzdEZnDXzHYs0r5vzhfb1sNl85Em92Qq9yRqxy0bVy/FNj/9Viy02qhlZH7Fn9Ggxi5O7i++nvNw4kYDBoye0Wl07P9rjDYBgZzGAfXAO+2CMs96WdoAJUHN83Nv6H+YlNr8M015P7pCF6PvN+xs2kf5DciIM37kYgMo8G/xVm1whi48kH3rY0JC8cZCqnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uf6mydS+BoiqNCTMvTfeQA4+tRIqxQ1hrcbZXJOv94s=;
 b=jHI6dUpEbmYTepDvPPpuSTzD+eIKus2mxz0V+iGOntw7lSrDSjVW9/72L4+Gwby0+s5zIHkBO74JpjXcAVcNvNYkpYUJfEZxFrhTDIZFPqoKgMOl7yGiWPFub/ZjwnNO3adKtidu4StIUhICsDetBuiPLlx1YBvsxcaGcgMVKAs=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB13318.jpnprd01.prod.outlook.com (2603:1096:405:169::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Mon, 27 Jul
 2026 19:06:53 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 19:06:53 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, "biju.das.au" <biju.das.au@gmail.com>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 3/6] clk: renesas: rzg2l: Add support for divider flags
Thread-Topic: [PATCH 3/6] clk: renesas: rzg2l: Add support for divider flags
Thread-Index: AQHdAApeqvEyQ1fgBUeVL2qD7OcCPrZnBQWAgBrwzFA=
Date: Mon, 27 Jul 2026 19:06:52 +0000
Message-ID:
 <TY3PR01MB11346DCB050BF2F5A72A5409D86CC2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260619164030.380098-1-biju.das.jz@bp.renesas.com>
 <20260619164030.380098-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdU9EtPKbhLB3rmH5SCpwxkuEM+1eFRHmUi+UBzDWQAPdA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdU9EtPKbhLB3rmH5SCpwxkuEM+1eFRHmUi+UBzDWQAPdA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB13318:EE_
x-ms-office365-filtering-correlation-id: c4b718c9-7645-4d51-fea1-08deec123837
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|38070700021|10067099003|22082099003|4143699003|11063799006|18002099003|56012099006;
x-microsoft-antispam-message-info:
 Bo8YmGta2yWABqKV4NcZI1YWeyN2Xae/9U+2bKXEMo0PZO50NdVr+NG/aNFsbFRcg+qXtp/LvdbqOkOH7jzpISvml2tPqxciC012H+58kiDlONIYbKyn8MWPZShDpIT1vaahgN+goEVQA+DDizGA++xh1eIHqPq3BUQjQv7BRuE5Ls/XJbOLDj3o3Gp12KtH4yH/Nt2YPrqM87TzIFrgOLP617rU/CWijvthV3YESnSbWQXmYYHKKTZpRcuyss4CbHtTNsuKoDADTJyRAATxzn30eoxIdrnh+KhldANCGMylS1Ft79IqP/G86vnNQfHqNtRk3YxvnPXQMqQwp5TBb2ZMVVbbnOVQUwQSwcNWkZTbBj/hOc8j1QgxxO6tjndHFuBmRrBI8eX+QipPHG1pK1TJOJ8RL+HLxgnnvC8IhIg0DTqZLbhhB15fys2cs/8+fzoeL5tha2U0jWhczPFtzZMFrbPAEKKlxRprA3KuP58XvQ5AOwFkYT92G2eNCYUv9ar2iAeQ/jf22wZI4JMNnZe/wdhpJbF8Iev38P0TeFGe61QB+BeNo+O/bKxNKvA6phuencvgDebCn3FEpC7YN+2pxoGk/R5wKO35u4q5nMCnxyDemzd4TEEf5INF/Yn4Gl5bLm2zX2PwilKEUAYP9hJTDh7pBLSa7Bwjjmd502QGkwhXm6okZUFEOiAUfMDQxiLyu8kd6B9vI+YMLPpfuJegZbBXfLLh6b7NwotxMzE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(10067099003)(22082099003)(4143699003)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?azdvMnJyVlQ4Y3Y4TXpHaGR2bngwSjlpRlI3U3V5V2FBRFQ0Z2xmVmNvWXRV?=
 =?utf-8?B?TjluL3d0NGRvN0xweVo2TGpEbEt0Q3VKT3RveWsvcFY4OEpMQXFKSGFsVllO?=
 =?utf-8?B?WmhmQnpNUVVGL3Y1bm1pQk00VUtCd1ByeStIR3dtRVZYd2JPY3NJcXJYOGV2?=
 =?utf-8?B?WGNsb1ZIUU8xcmxyNlVmbTRyVjY2dWJoS28yTzRBUklRYjRsdnZseVFUSDVP?=
 =?utf-8?B?TVYrMVo1Y3VYWEo2NnAwU1dhV2RWYWpOMHFmSFl5cEJOU0RXeHdibG5LUkh2?=
 =?utf-8?B?UkR2di9UenpVOHlINko2RFVBNi81czlwcHZSZk1pcGRQUmN5b2NVTDROVVh2?=
 =?utf-8?B?WitKaDJhY2Jnb0did2pFYm1MUU4vTkIxZEZBRFpKVG5DM0NtYnZpV29kZ2Nx?=
 =?utf-8?B?ZnFhK0xjMG5TdkZTVVNzSUE5MWRuVXlvcEMrc01JeENtZys5K1gySjE5YUpk?=
 =?utf-8?B?eWtvUU9pWUZ3M2ZFbnMrbTA4cjl5TWYranF5eUZaQnNpczBaYjVFK3hwTzBY?=
 =?utf-8?B?UllROXJmT0hkQU5XL05pcGFtVkJZY2pjeVlOTkY2bmhuQ250WWZ4MFFvWWMx?=
 =?utf-8?B?TEprY2EvNzBSU1kwNm0rckdnZzRHSjk2N2ZDY2Rac1JWZDcwYzZJTVJWaE05?=
 =?utf-8?B?b1dXaEZRbnNxajdnaGRhMGx4VnAweXZRZGxkb3NmSU56Y1pRK2p0eTN0SlRP?=
 =?utf-8?B?bFJrNFVIUGZkcm9CeTJDZkNhSWlHQXd0aExMTUtSMUZsYVhTbWFBR1YxWmVY?=
 =?utf-8?B?L295NFcyZmJGaEc4LzY5RUdXVHVQWnZvdWVhbDhmYVc4cFZNOFhodDNCS0pk?=
 =?utf-8?B?bDYrRDlkRStrMnJnNmFCaHVzejZtNkpOazB5UHZWbW5ZajJWcXVwZDJBVkxk?=
 =?utf-8?B?ZCtSeFZ5UjdSQk5LWFhvblpEVEpnRnEyb1pocTEvbXhES0lTOTh1bHJzT3Y5?=
 =?utf-8?B?OExYUnFoRnRLNE5xVHBsS01CYmw1ZDVsckhrbDVrOG8rYzNPMkp0bjBHZCtC?=
 =?utf-8?B?UDhnVHpsQ3AxU2ROcDhJb1FITFU2NnAxTVJ1SHpDd3RNZTNSUGxDTlN5U1Uy?=
 =?utf-8?B?ZlowSnF6ci9obUpveWV1ejV1VWpEb0YzeW5qMDlsOGZBVWxvREJUVFZ0ME9R?=
 =?utf-8?B?a1ZOd2ExUXNlaFFLdnpxeXczZzZBakRvdnNrOE5pZ0tqM29RcDJqM2tVS0RS?=
 =?utf-8?B?YzB6TndOUnhOK1ZGWEVMV2VNUFJYemJTaFc2WVdIQ2U4T1FxeW53bS9LWnE1?=
 =?utf-8?B?d3I3bks5NWMwOVcxVURoL2djTW5SYThreXpMZDI4K1lMQnMrNDBwbjZkLzM2?=
 =?utf-8?B?VmtFZ3BYNmJxNVRzUWw4ZC9jVFJLTlhpNVNIbTJiaENxWWRzdDRRN1ZaTXpl?=
 =?utf-8?B?bUlmMHQ5dS9tb0QwTVNrWW02MXlYWnNBcEFrbkZHK0tuS2Y2Y3ZCVkVuZ1Na?=
 =?utf-8?B?aklsNkc2Sm85Q1BCV2lJejREY1ZOVmozVW1rNXRXY2daR2s5NlpCT21BTjJH?=
 =?utf-8?B?Y0Y2dGRlZHpWZ2pKSUFNQlk3dFhuTXJLOVNRR2hSV25JblcxUzMyaTRtSVFK?=
 =?utf-8?B?c1FhN1hwcWFzaDNoaDJDU1NZY1VsZGwyTTQrdE5mNnhqYmtSZzZxYk1yT3ZR?=
 =?utf-8?B?YUhQL3RKVWtHR1V1WVBSRVJoMGVLMHJwQUVFa1liMUxDeDQrRHBsdnhhU2NV?=
 =?utf-8?B?eThWM0hRdjZtdHRzMEhoWlJncHo5ZDlVaFBEaW45ZmVJWi8rbW5zemlUQ3dy?=
 =?utf-8?B?dTFJOGxJc3lPNWFBQnIvSStpMnpUZFF4d0phdi8xTU5RaE80THBsTlBoTWJG?=
 =?utf-8?B?V3lxbDNLNU1TN0tHblRKUmpNTnV6V3NkeVJPdmVUMkhEWmVhTXZoZXk0VzZS?=
 =?utf-8?B?UGpXNXpYa01UTHFWb2tacmNhTWJHeHZzUUdCcUJXOThNT2VQeHR0Q3l5Y2Fs?=
 =?utf-8?B?a29ieExZSSsvTjRrdjY5eUZLeURDYVl0UUt3TDBWWU95ek9vMllzaG90em1o?=
 =?utf-8?B?SzVDNDFQS0pnb3Z2ajIzRFZ2ZWhiaG16bnFJWGhSTFpERHdhZmxvT1ZVdDZQ?=
 =?utf-8?B?VVFiWFhoT0NCV0srMFRwNDhzWk9VK0taZFF3Zll4SmRyL0lwZ2d2ekRXd2Jm?=
 =?utf-8?B?RHc5a2hUaE90VkZqeEcrWWxZQUsyWW5YOU04UUxpdHh4U1JiTG9hWG4xRzdJ?=
 =?utf-8?B?dGc2OHN4NUFSbWt6cU1VNnJsdUc5OXp5VWYrR0NBR3pRdStSdCtjU3BHelJL?=
 =?utf-8?B?MGVBbU96K0Nsc0dxNzlWWkZUWUM5S2xBTVV2bWdpZmlRM3hhSkx2SUVBelFs?=
 =?utf-8?B?aDV5MFdmTGRERG9vdEpWeFViK0hYSEtZY0NtcE1JdXlRdGtFNVNuZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4b718c9-7645-4d51-fea1-08deec123837
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2026 19:06:52.9713
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YiSjxhDuPG2qsiseiv+PcZJXoKVZ+/oStsIjLRO6TYfIH77ox4+w5Tq2oq1AwNLU2DdgNi5H9G1/GCxr5aJdZUm/k4aG32FzUONpuzxpm1U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13318

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDEwIEp1bHkgMjAyNiAxNjo0MQ0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IDMvNl0gY2xrOiByZW5lc2FzOiByemcybDogQWRkIHN1cHBvcnQgZm9yIGRpdmlkZXIgZmxhZ3MN
Cj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBGcmksIDE5IEp1biAyMDI2IGF0IDE4OjQwLCBCaWp1
IDxiaWp1LmRhcy5hdUBnbWFpbC5jb20+IHdyb3RlOg0KPiA+IEZyb206IEJpanUgRGFzIDxiaWp1
LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+IEFkZCBzdXBwb3J0IGZvciBwYXNzaW5n
IGRpdmlkZXIgZmxhZ3MgYXBhcnQgZnJvbSBjbG9jayBmbGFncyBmcm9tIHNvYw0KPiA+IHNwZWNp
ZmljIGNsb2NrIGRyaXZlcnMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8Ymlq
dS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+
IA0KPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRl
ci5iZT4gT25lIG5pdCBiZWxvdy4uLg0KPiANCj4gPiAtLS0gYS9kcml2ZXJzL2Nsay9yZW5lc2Fz
L3J6ZzJsLWNwZy5jDQo+ID4gKysrIGIvZHJpdmVycy9jbGsvcmVuZXNhcy9yemcybC1jcGcuYw0K
PiANCj4gPiAtLS0gYS9kcml2ZXJzL2Nsay9yZW5lc2FzL3J6ZzJsLWNwZy5oDQo+ID4gKysrIGIv
ZHJpdmVycy9jbGsvcmVuZXNhcy9yemcybC1jcGcuaA0KPiA+IEBAIC0xMTIsNiArMTEyLDcgQEAg
c3RydWN0IGNwZ19jb3JlX2NsayB7DQo+ID4gICAgICAgICBub3RpZmllcl9mbl90IG5vdGlmaWVy
Ow0KPiA+ICAgICAgICAgdTMyIGZsYWc7DQo+IA0KPiBJIHRoaW5rIHRoZSB0aW1lIGlzIHJpcGUg
dG8gcmVuYW1lIHRoaXMgdG8gY29yZV9mbGFncy4gT3IgYXQgbGVhc3QgYWRkIHRoZSBwbHVyYWwg
InMiIDstKQ0KDQpBZ3JlZWQuIFdpbGwgcmVuYW1lIHRoaXMgdG8gY29yZV9mbGFncy4NCg0KQ2hl
ZXJzLA0KQmlqdQ0KDQo=
