Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011046.outbound.protection.outlook.com [52.101.125.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE5D409637;
	Wed, 19 Aug 2026 08:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787126422; cv=fail; b=H32LDJsAnp6ptIlJ4irT3PuYYQi4R2khnjtDTv8robXiOVSvW47sFIldGufKyLtqdkVEGcXzIX/MNBfXKGJ6TOCoKH+onf6LanCPd6g4Szo7r9vag9qccD9dgN0xzXZaEuxVbf4M7aVyQRbORrx92hgsOcVFBJFuqqV3remsJ/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787126422; c=relaxed/simple;
	bh=+IKL2uZ3Y2fVFmME9JYKCZDe+1xSK71QTWx4LsstpuI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Uibgkb/YIZqbvjrwa/Af+x3hY/6C5k8LlqgzuS0NofziGC8Lp460Yjg8XlmB2SD+DLPW+tG+mVzyBcbb7du1qxegQDGwpXtgB0bgKiM03zdUpwU4UoidbmaGITDuNH1OIhW7fERE4T+hZglzKVOGrruv1iCW14GTRFVJ0WItlcM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=riOh+FTT; arc=fail smtp.client-ip=52.101.125.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="riOh+FTT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BWGQJUyIb6pXjkV4U8yKbLDJzIehbXBFf3QQSv9v5ytbcFvOoKTL1Kz8tF7HKE6iMoTyBIHU7SkxGv9zd+aM2QQfcEDnq7VqAR29PuGMvf9pvCcNJo+fmIRtT14+uzsjZlPDtr+SejKcDtJKbTsx3Pudr3IQAP6I0AjPUDNsfaszPp9ftAmHdCUQilWe82SmnsaM045lb0fpTwVjqVvCrTyU7+0WvvKVi0wjniZiRN6yNObbft4GBiNpFLXRsOlXVdLdcWoZb+4lueAYE+EH4WowSk90wyKdpyFbDzQ+q1T8QkHesPksgVcfArQorxltwo8qKo6tRRUfI0yMlh4KUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+IKL2uZ3Y2fVFmME9JYKCZDe+1xSK71QTWx4LsstpuI=;
 b=gTzQivLiuoJ1M1B1LH4oEG74BazsUaLYnlPCna7rGfzjq0AvT2q0i+C5N0/HeAU3GmoKAHgGmvnDJypH7q1eJGodNWumuEgtYrK/fuiWdl7OzKoaKlU1WnsN7hEiVCJNLhqelmO2QF4yko1mVS7i9aMQQuFw329jGn3xCPSPZ9w6TfPdrtXdwxmvVu2kNAz/pjlyaf8ooF64RLxL2bgqL5GdwC89svlqr3xjZ7+4RARkyIOdbr8uuaWYoP2FTRETJFxjmYWHBvKftp01VLPlnSzzwq1fJb2edS4FvXMpRn1PwnXWJqiaAxEiWQ8tOlEGWXmU4aH8CUfjYFfF3VVdPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+IKL2uZ3Y2fVFmME9JYKCZDe+1xSK71QTWx4LsstpuI=;
 b=riOh+FTTjFGlx+wNNhzHaejUfmKI6iU3VpLhq3IgseWaRKY4FDXx2Qo2FwM1flcO2uF5FV4c2Q6BNW6KvwR53fosvWy1d3YNsS+e7xuNKyqaKhKoVhVuw79XXb2mXcjqXu8Tlr3obEr+lgH5bSNMPGbRo9Zz6erX4XR3HEOual0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB13095.jpnprd01.prod.outlook.com (2603:1096:405:1dc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 08:00:15 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 08:00:15 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, "biju.das.au" <biju.das.au@gmail.com>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 5/9] clk: renesas: rzg2l: Add support for LVDS
 fixed-factor divider with 4:7 duty cycle
Thread-Topic: [PATCH v2 5/9] clk: renesas: rzg2l: Add support for LVDS
 fixed-factor divider with 4:7 duty cycle
Thread-Index: AQHdKb8ZUFdTWJjxEEiKygc4NqPsqbadfyWAgAeOgoA=
Date: Wed, 19 Aug 2026 08:00:15 +0000
Message-ID:
 <TY3PR01MB11346BFA92757F6A186F3096A86A52@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260811182729.360959-1-biju.das.jz@bp.renesas.com>
 <20260811182729.360959-6-biju.das.jz@bp.renesas.com>
 <CAMuHMdV115FmUP6tiNi1YjEfOevuDvuLib7pLd1da=7JwnsNdg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdV115FmUP6tiNi1YjEfOevuDvuLib7pLd1da=7JwnsNdg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB13095:EE_
x-ms-office365-filtering-correlation-id: 601dcd33-4d75-4054-1022-08defdc7e78f
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|3023799007|56012099006|11063799006|4143699003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 arSoW0lo4XU+uZWbcizPPnT5U+vZwAi5rg9MyVO1MPjDFuFYak0TdmGTZdpq6TmOwBGQItLe7/mQh3NaqSwF6bOEDuJOgzm8FgzX/qPF5vbvClrZWSWrTthuVoGez6+6jW75bySv975663+ItwX5Vx7l59+MDScJVmtToQRb3Nnyt2Wb1zmmAGaPu7loAinDQ+AY6VGCOAMW6FUutVYRCM7Fe9Ua765YpoeHlBsYR43zNGL7QoGbx6Niqk76MsYqPoReaw9gmZS8aLovvCMYPAHBTdjHjee9fdjzvm1l9IklidK22eRGT4IDpLeiNTfnVtBDGkIbJsMglLRkeapa+ZqSOWkhqaDe0cTHC+tkQpb9p97z5z0nrg3lu2FV6MBkrKZ2kLuCDJMc03iGktGwfVDJ1mNMPUoi1/leuDRpQyjjK3GEGN17y/7ARfQS/fJnNbpdIElpwbCGlmwGtcxeXtc11NTw/6y9LZjpM12IQpHJ9AGMyELH54RKR2Xj50uh9luvQPBqEreDGvi8X+YEBz1Yuw4ChW36gtBp//+ZpJh7/tlaV7pzU+vKAFSdkzFNbOEGgiPgg1pANgrvcpoDALRmh4Wqgi+SNM1QIpP+efKHjm/smXkoPoHmyMlJPF2aH9u2XgTSpIyDXYo37gp1ER30R0afvfU99nhUudZNeRd5whx+YNax4T0xOh0+HKxSEDgslM7CyQiTI1FwAMSEVl5LF46E26ZGcNSJE84WQsI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(3023799007)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bnR6cy8wOXBKcUdWekZDL2ZYRzNvTHBtU3lBdVhqVTlPUTFvZjB6dzMwNUo0?=
 =?utf-8?B?T3VPZkVkYkptbUdIWlJCN0xPV1ljRGVaRHZ6OTkxR2Nkb1ZtaVQ4QWtNNXpF?=
 =?utf-8?B?SGN0WmN2VUdwZmIyOW1JZVRxc2FSZUtBZTd5Y0lDUmY0dmdrL2dER0VLcTdX?=
 =?utf-8?B?Z3k0dkw0eG9TMWcwN0Rmb05yOWFWMEk5cjV4ZFVZYmlsSHBDWThzdXJjbmh1?=
 =?utf-8?B?WGFqTVFCb0VOWHpzN00waGVDb3VnbUN1ZXVHSnZweXRNdHZLOUhCQ2EvcFNn?=
 =?utf-8?B?R21xTEFEQ2wxemhqMmk4OEVIMk1GTUxoTVZubmhuZ1FZUXVnTG5lSWpZQkZC?=
 =?utf-8?B?cXJEZ0xzWVFTRXdmM0Z4VFRidWxFVWNnaWFPcTFnZnZJbU5URnFwNEQ3WTJU?=
 =?utf-8?B?SWVEdzQ2aHV4bnl3VW9kZFR2OHpyTGpxZDBTNmFqWU5QeHVNelplcmM0OExr?=
 =?utf-8?B?UE5SZ3hoaERlZmdESmQ2UU9tRVJvTVVOVkg4cFhBRlc4WjA3MGFUMkJVcDdR?=
 =?utf-8?B?U2lraUNKTmxNQ3Ztd0NWSnYzYnNYb3RnWk5tMFFrK3JtcVJYUnVualZrcERB?=
 =?utf-8?B?NE9hRDdDaTJNZjBOa1VQUFFtRUVSTi83eWpMNmJ1dVB6OW8wNENvMTNxaUpO?=
 =?utf-8?B?VnlTZmYxUEdZd2EwdnFPZ1dqcHh1WjRjcm04V1VPL0NKSVNZR1V5clRkdDVq?=
 =?utf-8?B?b3R0MWxrRmp5bnQ1MFliZ20wYnVsRWdOLzM0b2Z5SVRrcThjNWRwVWpnQ2R4?=
 =?utf-8?B?K1FXbmlXR2UxK2RhNUh2cmlIUkl5eUllVmcxNkVzdUczQXN4NHBwL3lzTWtQ?=
 =?utf-8?B?NG90c2ljM0hXclhieW8zUWx2OFlDZnFpM0JBTTFzNmRhMFYwVXM4TGJQY3k4?=
 =?utf-8?B?YWJrRGVsWVdZZlcrcW9jaDVGMUJvR1lKTXMrUFBsTHJXSlNUUUkyTndlZEFN?=
 =?utf-8?B?YlAzNUZWV3o4VGVCMi84WW9lMEV0bGtxa3lVNkNnMnQ1NyswNktZbW9abVVv?=
 =?utf-8?B?aHdodjd2S3F2NkIzbnZLQlFFN044d2c3OXd4QkNubEVUMFAwZE5YTXRLSXAx?=
 =?utf-8?B?K3lQcWxWM1I2ZFNQTlpEYWhkK2h4RE1DSDVCS2VwaDlVbzFZWWNWdlBIanNB?=
 =?utf-8?B?QmtwaEZVQWs3V2xpQ1VTV2crTlZCM2E3N3lqOWhKTm5yMkdYazBZcURXb3J0?=
 =?utf-8?B?RlFDRHNGalJLZlZqRDFCV3lhRnpjNmlLaFlXWCtqcWtHQmVmdm9vd0MzYXVD?=
 =?utf-8?B?UUxFQlpCamtGVjRsdncvN2Y4NnByVnhjYWh1WE85TUhITS9Wc0g4emZtVWYx?=
 =?utf-8?B?ZFpSakQybVZydFVQMis2Unk5T3A0RzdoajNlQWQzSUQ2Q1VOaWNwczV3Tk9C?=
 =?utf-8?B?TTN4Vlg1ZkxBZlhTOTgrUk9lRzkxdisrWXg1MnhTUVYwNmxmaGd0THBxdXFq?=
 =?utf-8?B?cVJReS9HbFZxS3JlVHM5NWJXelEyV0ZsQzZSQ0hRR0VKakNQb242YlhMMkNu?=
 =?utf-8?B?RWxZRUdCUEhnN3kwOWZwZVlKdjZDc0pPY044SGJwdjZLTG83ZDhibWdNbjZW?=
 =?utf-8?B?aGp0MUJiT1F5aGRIazNsaUI5cHVIdW9yVXEyWktrMHhGZjhlTGk1ZVdScGU3?=
 =?utf-8?B?YXRtbGdZeVZ1RFN0a1hFMUVKM2FtSFdPdVhLK2d4SUlPaDhQZUREVTZDMWVy?=
 =?utf-8?B?OWplaVoxWlVMd0tPNUNUZDlITU16ODE4Y1liR055UUc4M2VkZ1hDOE1OVEU4?=
 =?utf-8?B?ck9wckwrUUxtMmpJbzRScGMrb2IwK0NudFAwbWxXRE9ZK2p3aGRCanMwRXhI?=
 =?utf-8?B?VVQxaTdzR3pxWHd5RGR4a1hZOVZEdDU4d092cXppVURKenNBOWRsUEFaVkY2?=
 =?utf-8?B?NTArdmlPeXlwS0MvRnJOemdDRmw3aGhsSjJrWWtKekozME1ONjNtZGNJVU1S?=
 =?utf-8?B?cGM3YTRtanVWQ1kxSG91NG9nR1BmakpZYWlrbThnaDlJYUtFdE0yeDk5SXhG?=
 =?utf-8?B?NnlzL0Zod0FNQXJCMi9hQ1dSYnVlS0ZBNHlDYlg1UXZVOThMMFVJVG1Dc1A3?=
 =?utf-8?B?aEM4bDgxaklvZEcxTWRxcnVIZWh3T2M2OUFwazAzbEVmRGkxSXpUOWh0UFhM?=
 =?utf-8?B?dUN3Yy9iMGpYd0JMN2RMZVFMYVl4U3hxR21JYTZqU1NXYSt6ZG1uVnYvM0Yz?=
 =?utf-8?B?NmFtRS9kNWxxVHN0ZG8xdGxrWTRTeEZrcndNRXdNWmwvb0I4NDRXWjhmdTBX?=
 =?utf-8?B?SjVmNHdMNFlFU3VPNGZuZ1NoU2dmTmpEL0FOWk5qSHZqVVNsaWgvUnFTT2NY?=
 =?utf-8?B?OWV2QzI4UlZ0cVdPZEFac0paTlR1QVlqc0w4Yi8yUHQ5YTQvYUF3UT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 601dcd33-4d75-4054-1022-08defdc7e78f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2026 08:00:15.7856
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zHUYJvOITEl9pWybfjzpfsukcRmDBE+C665mdwNjO+Y5VZfo50fMqcGdLhLF3VHgVOOiGfmpWOvZonObm+IdaVwtu0eJAAXhs6/V20aowcI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13095

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDE0IEF1Z3VzdCAyMDI2IDEzOjM1DQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjIgNS85XSBjbGs6IHJlbmVzYXM6IHJ6ZzJsOiBBZGQgc3VwcG9ydCBmb3IgTFZEUyBmaXhl
ZC1mYWN0b3IgZGl2aWRlciB3aXRoIDQ6NyBkdXR5DQo+IGN5Y2xlDQo+IA0KPiBIaSBCaWp1LA0K
PiANCj4gT24gVHVlLCAxMSBBdWcgMjAyNiBhdCAyMDoyNywgQmlqdSA8YmlqdS5kYXMuYXVAZ21h
aWwuY29tPiB3cm90ZToNCj4gPg0KPiA+IEZyb206IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5y
ZW5lc2FzLmNvbT4NCj4gPg0KPiA+IEFkZCBhIG5ldyBDTEtfVFlQRV9HM0xfTFZEU19ESVYgY2xv
Y2sgdHlwZSBhbmQgcmVnaXN0ZXIgZnVuY3Rpb24gZm9yIGENCj4gPiBmaXhlZC1mYWN0b3IgZGl2
aWRlciB1c2VkIGJ5IHRoZSBMVkRTIGNsb2NrLCB3aGljaCBjYW5ub3QgcHJvZHVjZSBhDQo+ID4g
NTAlIGR1dHkgY3ljbGUgZm9yIG9kZCBkaXZpZGVyIHZhbHVlcy4gSW1wbGVtZW50IGEgY3VzdG9t
DQo+ID4gZ2V0X2R1dHlfY3ljbGUoKSBjYWxsYmFjayB0aGF0IHJlcG9ydHMgdGhlIGFjdHVhbCAo
ZGl2ICsgMSkgLyAyIDogZGl2DQo+ID4gZHV0eSBjeWNsZSwgYW5kIGFkZCB0aGUgREVGX0czTF9M
VkRTX0RJVigpIG1hY3JvIHRvIGRlZmluZSBzdWNoDQo+ID4gY2xvY2tzLg0KPiA+DQo+ID4gU2ln
bmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiANCj4g
VGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gPiArc3RhdGljIGludCByemczbF9jcGdfbHZk
c19kaXZfZ2V0X2R1dHlfY3ljbGUoc3RydWN0IGNsa19odyAqaHcsDQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGNsa19kdXR5ICpkdXR5KSB7
DQo+ID4gKyAgICAgICBzdHJ1Y3QgY2xrX2ZpeGVkX2ZhY3RvciAqZml4ID0gdG9fY2xrX2ZpeGVk
X2ZhY3Rvcihodyk7DQo+ID4gKw0KPiA+ICsgICAgICAgLyoNCj4gPiArICAgICAgICAqIEFuIG9k
ZCBkaXZpZGVyIGNhbm5vdCBnZW5lcmF0ZSBhIDUwJSBkdXR5IGN5Y2xlOiB0aGUgb3V0cHV0IHN0
YXlzDQo+ID4gKyAgICAgICAgKiBoaWdoIGZvciAoZGl2ICsgMSkgLyAyIGlucHV0IGNsb2NrIGN5
Y2xlcyBvdXQgb2YgZGl2LCBlLmcuIGEgZGl2aWRlcg0KPiA+ICsgICAgICAgICogb2YgNyBnaXZl
cyBhIGR1dHkgY3ljbGUgb2YgNC83Lg0KPiA+ICsgICAgICAgICovDQo+ID4gKyAgICAgICBkdXR5
LT5udW0gPSAoZml4LT5kaXYgKyAxKSAvIDI7DQo+IA0KPiBESVZfUk9VTkRfVVAoKQ0KDQpPay4N
Cg0KPiANCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0Bn
bGlkZXIuYmU+IGkuZS4gd2lsbCBxdWV1ZSBpbiByZW5lc2FzLWNsayBmb3IgdjcuNCwgd2l0aA0K
PiB0aGUgYWJvdmUgZml4ZWQuDQoNClRoYW5rIHlvdSwNCg0KQ2hlZXJzLA0KQmlqdQ0K
