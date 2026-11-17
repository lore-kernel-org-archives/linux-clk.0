Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.99
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794878652;
	b=cf26Hcie93deaXeJTEQQescvw6/R51i1gu3ImjSn4w9BqSmJbkjrah2vlILyt7VdUnGF
	 l7kThiekPLKjpOWtDRH8YFr3zGknDwIn9T/oR0B0Xv4haSn8sB+QNnQvMlYZh+66JI0y5
	 Z7z7XTCdTpXLqnoFb36VgLNOWoydr6+S9h5/C+IfxaRtDL3MpF5DOu3KVvqWq8Q9752/s
	 S7KYou6RYt66xcHJlm1gyR6zvpEEi8yeRC1dsyqAlhzI92Od0BXW1pyshZduR7bzYyt6f
	 p8kRTRcauhmIN+lzjYlIAQNwUF3HmwpNsdR1TihceBaINnxadO18ft4BhtUtmTh1TnQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794878652;
	h=DMARC-Filter:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=hXlF77/f5ozgL0FiNHDnugdW3Zkr4fiJ0Nec7/LAck0=;
	b=rn3UeZLzxPWvt1/lOOal2WNrvhh1ZC2WHTPFCyJpDl5rk9FLOS9KlQRqQlNNQI1wtgXN
	 Sy3irtTLzdRBeNzHDAKGaF2xZVWG88bmdGbSXJr09HJj4rfsOaJRBxlJ4pqcO6gfhXsE8
	 6Nf25iEYFL8lh6Z8awcxVVMfoPLzB8opg/8ZQn9SYhk1eqBKr/w/ZxaKsImwni80pZTEa
	 2+qPfvV4MtS7w2TNGUxuluNMyrShw5KWhAzrcq1HMkzDJ32uJr9BdNFAqlsz1qm38XsCt
	 IkgWi/nHnQTnmbpayKNPs68JO6C5nUBcmNRkJ+fs825DoEdq/EAFvNpmzEh3XbxMRAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.99
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2099.outbound.protection.partner.outlook.cn [139.219.17.99])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB90606A31C;
	Tue, 17 Nov 2026 01:24:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FB90606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=boxx0S8fMVjK4oQB+WK/U5ZnSSsZMKis3dpEK2XDTp+LppKpGhlsZGLJFrQpoaryVyffEeTj+GQUHmlIis7L+kX4F3YNb++oNvqz0+1JlpwzK8jn+5tpRF3+4uxDTMxqsZqbOHDRjLUak/E7ydOlcIu6I+LbKjp5E3vCxuBooln50Ftp2aVhkVS86MFDj4i17HHc7eWy+qZkYO/FH5mE92QpIwZpYe/4iURl1bmL1Nifd3HPVX+oobebJyr8wVeMYLkdeeTXYo0OwlT1RBaecpU1pe0mrkW/dnrbDwDAYW89sYH1wvxT385L/abc8QLIxQUGx8TKTADLtEXXw2LBAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXlF77/f5ozgL0FiNHDnugdW3Zkr4fiJ0Nec7/LAck0=;
 b=m2ICutZURO8PcYPlypvIqj7VN+D6gTXmXoSCwva2utOK0sqlN0VwbljZ0txTpwkKbJvNjdmAORPK8LPh+TaB9gbDLHNM0zg97ZaKrNE/PEGLl0ckXMYlvU+nSUBA7p1HjyDKZeLOBQUMkro94kpSuaKC2p8/xXEDvvNwsxeYby8GpcY08YDgA3DROfhZ078AQ6ceVP5s6oKOmRd7TKZndQZeGFDQPAFv50mvfOTWw5uDjRflv0faPPvsHkfyV2k+iEHrzLfbCy7OWcwr+/bN2mIGS6onQ4Ps/2SiBHIE/XeFQWb23bvsrypiFk42pa8EqxFoYM5GWBhTCAdtFdA4fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1331.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Tue, 17 Nov
 2026 01:23:58 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0615.009; Tue, 17 Nov 2026 01:23:58 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
CC: Brian Masney <bmasney@redhat.com>, Jerome Brunet
	<jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Emil Renner
 Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Hal Feng
	<hal.feng@starfivetech.com>, Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v1 2/6] clk: starfive: jh71x0: Move reset controller
 registration to jh71x0 common code
Thread-Topic: [PATCH v1 2/6] clk: starfive: jh71x0: Move reset controller
 registration to jh71x0 common code
Thread-Index: AQHdWv1uA4scW39GXUGR8HsEG5hmTrcvYmMAgAJMQ3A=
Date: Tue, 17 Nov 2026 01:23:57 +0000
Message-ID:
 <ZQ4PR01MB12027C86A7EC92969661032CF27B2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20261013102707.9207-1-changhuang.liang@starfivetech.com>
 <20261013102707.9207-3-changhuang.liang@starfivetech.com>
 <179475230833.3873592.13070196353304136001.b4-review@b4>
In-Reply-To: <179475230833.3873592.13070196353304136001.b4-review@b4>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1331:EE_
x-ms-office365-filtering-correlation-id: 9b024f0c-e8c2-4f80-3bd9-08df4449741f
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|18002099003|22082099003|261009223027099003|4143699003|261102123227099003|261021123027099003|261022075727099003|261021121427099003|38070700021|56012099006|10067099003;
x-microsoft-antispam-message-info:
 fU5mc3TUQq9QOkTVW1VZ9HPdMVt1ANYsPfYMDAXt39iD3kof8rR9j9iMziEOcqAvHH2zzSDIM6JTVfbhEayQLL0N4LT+0eVwXIkPD32LPKMcYpx74yRa0LLIV9bC0UGSNvRGyZugEeCepXiJrC5Dpm8EmrXDroFRQ9nZmZvo1N9ylPsgfLH2HUjuCF80Cp1Wkw01jIdawZBfmz/eUxb1PnRRtbEuSaXu357tjKuQ2Pb1Kb7JuEj/p1iNU47x9sLl5fnCG7ludlDYAFXgX0TV5E7hqnIB0UtI7jiPure77daUYYpGr3f03Y00BCIJWxNJADk87lehBQQYdOG0MrRCV6ILr6yct8rdVFCVbsPpJXZILXriBnwZ2Kr3uOxpU03aYV4WbaAOXF5gi5ajOkYrwbYGJkf2XorJ/v+Gc3ZYxZGqMAFyt9fVtpmYfGWdlYG6iM2amAiTJHR6e5hI3cLsTa1nXXSb1Eo4t8QvTpWkF2/EG0DAta23T5sKL2rlEh3GrMrL3aM6d7poQ4v85t14EjXVNRdVWkjp8LfCUy5XnQH+WHzuchH8TdDx2gOa485K
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(18002099003)(22082099003)(261009223027099003)(4143699003)(261102123227099003)(261021123027099003)(261022075727099003)(261021121427099003)(38070700021)(56012099006)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T2lwRWZGcjdnbTdJUkJ3QUIwWUVGSlNRVVJjMEo2N0Q4c2NuZnl6THgwY1or?=
 =?utf-8?B?Q2loVC90TTQvRFM2dHdKdm9QWFIyQllQZTcvZDhMaFhuQmppbHdhRFFEZnNT?=
 =?utf-8?B?ZWpOUS9MYjJRclRVNlh4NUhWdHFMTUI4Vm1rUzIwYStuRWx1NG1SZFd5R2h6?=
 =?utf-8?B?bXRkemJTNncxN2Uvd1o3TXpGSEpmZlg0R2loUTJqM29oeGpZa2pXLzZrUjl2?=
 =?utf-8?B?MUU3R09XdFJFTVhIcXk0VG8zbVF4cmhiTW1Nc3FSdnphZFFMdWJOWjlRQTM5?=
 =?utf-8?B?OVNjeDBtZ0s4Rk50bi9XNnY0WEVyejFDbHlQNTQ5OGhUOFZiUjdoS3dmdkdy?=
 =?utf-8?B?QXd6Uno5eG9ob0djZ2pjb0pMYWhsUmp3aDQyQ0FuVFlWYkhTVlJ4L0Z5NFVI?=
 =?utf-8?B?S2hGV3haanhZWDdFTkg5UFpXai9lbjEzczlFMlZ1SlVNT1dlaGd0TEVKckt3?=
 =?utf-8?B?aUxUNi9vbmM2eEdJVEdyY0dLa3dnTUR0Y3BROHN1Wk1uZ3pPVmQ2Zmh3bXpS?=
 =?utf-8?B?Qk15RzIxYUllU1pEYStlRXg4Sk9PVmZOQUNyalJza2VMbE9EWmQwNk8vcXdv?=
 =?utf-8?B?c2lJdXNZNGRZZlJyRUtZLytKZ2t4a0k4aUJxS1dBcGN5clVFeWU0TXEzdTk5?=
 =?utf-8?B?elIrWldOUlFIV0Y2aUVwTGg5dFByZ0dHaWRaT2Nhd0h0cXNDWmR2KzhNSktW?=
 =?utf-8?B?RU85OGZCRWd6aFp1M1E1MXk4MFZLbENjTWVvVlUyMmt1bnNGYk8vazRCbk05?=
 =?utf-8?B?WTdqV24zcDVJV2FVcFhuNTJ6Mmp5RmZlWUNwelpqVlFlYUxnY2djWnErZlJG?=
 =?utf-8?B?dW5VMzZxR0t3Q0ZCOUlrSWhubHFYQ0FUcmtxMFVhYVhTU0hrK3ZYMHMxMkgz?=
 =?utf-8?B?dEE4a0hJd2V5ajJZN2hkNm95MUZKcVBOS3FlSXZMVlhWeHRXQkplaWw2Z1ZP?=
 =?utf-8?B?RXptNTVmTUVjamhLSVY2QWMvSjFWWmhDeWlXVWEyRUdPTW0xR1lhcm9WTDdv?=
 =?utf-8?B?WWl3UkhGcEhYazFFaTdwb1dqbnlGZ1ZNcUk0cTVUSVBRdWhoWW9uN015bFE1?=
 =?utf-8?B?T2FwMXFJeWhxQWhPSHVpNmNPRVF1YUxXbEhOenpBT2o0NGM2aVkwZTFuMStq?=
 =?utf-8?B?U1h6Lzd3SSt4SU5Ua3JjTHlWMXlncnZPdTNIMFpRT0hrOURidUwvV0tuUEZk?=
 =?utf-8?B?amRnRXRYRGNxMUIva1c5TzJKWGlDWmovc3lwNnVwNjZTYk11VDZjZy9MdGc3?=
 =?utf-8?B?RzZYbTRlSmtDU0FzZWZiTTBBenhaa3lYMkdPNEo3ZmdCcTZnSXhDY3hNM1NW?=
 =?utf-8?B?TkJLTWg1ZXdDU3dreFF3ZE5UbjZ0ejU5TTMvNzlTaGtaZE1kckY3LzVMMm1D?=
 =?utf-8?B?VUI4djF1K1M0Y2RqZndRUzAvdFBYUGIwbFFzZVRLZWU2RWpoM0JLRUNtcTFw?=
 =?utf-8?B?MGd6VXk4L1B0YitsNXhQTTdDMW9MVm9xUzVBRVhLQi9JYzRuQkNBL2ptSG9D?=
 =?utf-8?B?dzdMNmNVQXpuNjB5Ukc5OStnZG0yYjFhSExLSys4UzU0VS92VFZidkxKMjl4?=
 =?utf-8?B?bjUxaEhHZ0xFQXNNby9mUFRsYmsrdEFlWllaZmc0TFNvVkg4MEVaLzJiT3dJ?=
 =?utf-8?B?K1Jrd0piL0NLM1VpVU1lY0NCbTNZVGJIY0xmSG1VTDVZa29uV0s5L1Nla051?=
 =?utf-8?B?MXppUFk0bjRPM05lQjl2RVRURWsvSXd0L0d1a3NUWkFJUFcwWkNyWnE2YXEw?=
 =?utf-8?B?SVFVeVgzbER4SHkxTXdDdXpwYm56bU5xcDZEemtSSUJYczdia1FTTEZFOGpS?=
 =?utf-8?B?TlFNTkVUSkRabzdEcWF0K1hKQlRabTFYcTBxRGZMVTdacUZyRi81L1FjTnZE?=
 =?utf-8?B?STFVenVudTl3N3A0RlNjeDEvaVdRSERBZ0VpKytsTVVMQ0EyY01BSVdiV3hz?=
 =?utf-8?B?cmZsak8zcWZPdjRTbEJhTXhaek9zbjNjdjhNTVpxTUREVEhDU2s4UlpoeHUv?=
 =?utf-8?B?RldyQ3NJejMrcHlxZXQrNURHQ2s3M2hLOUJrUS81UytTOTZEdzFITEdXTk5k?=
 =?utf-8?B?VHFTNjFzNUlmY21mdjJ6enA3Q2hkWnNNN2M5dDRvT3d0VjNzdUZEc0ZLdnZG?=
 =?utf-8?B?TUppQWdKYjRIS0JXcklKYjhzVTJzaytsQ0VwdXg3dFMrdkVlMlFORDgzMEVV?=
 =?utf-8?B?Y3JhQ1g3VmFZVW1NYy94ek5pcEZ1NEpNK0h1YlU4VW5RK1RaYzdGaHljdU0x?=
 =?utf-8?B?eVVoT1h1ajBYbmd5QTNrUVUwUDhXazEvclk3WFAyRk9lLzc3WnZIWTJteUlB?=
 =?utf-8?B?aU5pQ2NOZVlaaTdJV0lkVldEcW4rZ0Y3bDRnN2RlR1hSb0JjSEx4dFNQeVY4?=
 =?utf-8?Q?dxHzIaS3oZUvj1Gk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b024f0c-e8c2-4f80-3bd9-08df4449741f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2026 01:23:58.0552
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 077CqIDor/xf9pCa5IMXqhnN76S1NFLvdXPXH8SYxl20oRSRX4z3dLbMz1hREj/nhTCsNvRbEj6rUsrtbX3LHhSFuhDx0yv7ruQ7UkapOH+ONuA36DdARA7Qtqe02w8B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1331

SGksIFBoaWxpcHANCg0KPiA+IGpoNzExMF9yZXNldF9jb250cm9sbGVyX3JlZ2lzdGVyKCkgaXMg
b25seSB0aWVkIHRvIHRoZSBKSDcxMTAgc3lzdGVtDQo+ID4gY2xvY2sgZHJpdmVyIGJ5IGl0cyBs
b2NhdGlvbi4gSXRzIGxvZ2ljIGlzIGdlbmVyaWM6IGhhbmQgdGhlIENSRw0KPiA+IHJlZ2lzdGVy
IGJhc2UgdG8gdGhlIHJlc2V0IGRyaXZlciB0aHJvdWdoIGFuIGF1eGlsaWFyeSBkZXZpY2UuDQo+
ID4NCj4gPiBNb3ZlIGl0IHRvIGNsay1zdGFyZml2ZS1qaDcxeDAuYyBhcyBqaDcxeDBfcmVzZXRf
Y29udHJvbGxlcl9yZWdpc3RlcigpDQo+ID4gc28gdGhhdCB0aGUgY2xvY2sgZHJpdmVycyBvZiBv
dGhlciBTdGFyRml2ZSBTb0NzIGNhbiByZXVzZSBpdCwgYW5kDQo+ID4gbWFrZQ0KPiA+IENMS19T
VEFSRklWRV9KSDcxWDAgc2VsZWN0IEFVWElMSUFSWV9CVVMgYWNjb3JkaW5nbHkuDQo+ID4NCj4g
PiBXaGlsZSBhdCBpdCwgcmVwbGFjZSB0aGUgb3Blbi1jb2RlZCBhdXhpbGlhcnkgZGV2aWNlIGFs
bG9jYXRpb24sIGluaXQsDQo+ID4gYWRkIGFuZCByZWxlYXNlIGhhbmRsaW5nIHdpdGggZGV2bV9h
dXhpbGlhcnlfZGV2aWNlX2NyZWF0ZSgpLCB3aGljaA0KPiA+IGFscmVhZHkgaW1wbGVtZW50cyBh
bGwgb2YgaXQuIFRoZSByZWdpc3RlciBiYXNlIGlzIG5vdyBwYXNzZWQgdG8gdGhlDQo+ID4gcmVz
ZXQgZHJpdmVyIGFzIHBsYXRmb3JtIGRhdGEgb2YgdGhlIGF1eGlsaWFyeSBkZXZpY2UsIHNvIHN0
cnVjdA0KPiA+IGpoNzF4MF9yZXNldF9hZGV2IGFuZCB0aGUgZW1iZWRkZWQgYXV4aWxpYXJ5IGRl
dmljZSBnbyBhd2F5Lg0KPiA+DQo+ID4gVGhlIGF1eGlsaWFyeSBkZXZpY2UgSUQgaXMgZHJvcHBl
ZDogZXZlcnkgQ1JHIGFscmVhZHkgdXNlcyBhIGRpc3RpbmN0DQo+ID4gYXV4aWxpYXJ5IGRldmlj
ZSBuYW1lLCBzbyB0aGUgSUQgaXMgbm90IG5lZWRlZCB0byBrZWVwIHRoZSBkZXZpY2UNCj4gPiBu
YW1lcyB1bmlxdWUsIGFuZCBpdCBpcyBhbHdheXMgMCBub3cuDQo+ID4NCj4gPiBTaW5jZSB0aGUg
aGVscGVyIG5vdyBsaXZlcyBpbiBjbGstc3RhcmZpdmUtamg3MXgwLmMsIHRoZSBhdXhpbGlhcnkN
Cj4gPiBkZXZpY2UgbmFtZXMgYXJlIHByZWZpeGVkIHdpdGggImNsa19zdGFyZml2ZV9qaDcxeDAi
IGluc3RlYWQgb2YNCj4gPiAiY2xrX3N0YXJmaXZlX2poNzExMF9zeXMiLiBVcGRhdGUgdGhlIGF1
eGlsaWFyeV9kZXZpY2VfaWQgdGFibGUgb2YgdGhlDQo+ID4gSkg3MTEwIHJlc2V0IGRyaXZlciBp
biB0aGUgc2FtZSBwYXRjaCB0byBrZWVwIHRoZSB0cmVlIGJpc2VjdGFibGUuDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBDaGFuZ2h1YW5nIExpYW5nIDxjaGFuZ2h1YW5nLmxpYW5nQHN0YXJmaXZl
dGVjaC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvY2xrL3N0YXJmaXZlL0tjb25maWcgICAg
ICAgICAgICAgICAgICB8ICAyICstDQo+ID4gIC4uLi9jbGsvc3RhcmZpdmUvY2xrLXN0YXJmaXZl
LWpoNzExMC1hb24uYyAgICB8ICAyICstDQo+ID4gIC4uLi9jbGsvc3RhcmZpdmUvY2xrLXN0YXJm
aXZlLWpoNzExMC1pc3AuYyAgICB8ICAyICstDQo+ID4gIC4uLi9jbGsvc3RhcmZpdmUvY2xrLXN0
YXJmaXZlLWpoNzExMC1zdGcuYyAgICB8ICAyICstDQo+ID4gIC4uLi9jbGsvc3RhcmZpdmUvY2xr
LXN0YXJmaXZlLWpoNzExMC1zeXMuYyAgICB8IDU5ICstLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiAg
Li4uL2Nsay9zdGFyZml2ZS9jbGstc3RhcmZpdmUtamg3MTEwLXZvdXQuYyAgIHwgIDIgKy0NCj4g
PiAgZHJpdmVycy9jbGsvc3RhcmZpdmUvY2xrLXN0YXJmaXZlLWpoNzExMC5oICAgIHwgIDQgLS0N
Cj4gPiAgZHJpdmVycy9jbGsvc3RhcmZpdmUvY2xrLXN0YXJmaXZlLWpoNzF4MC5jICAgIHwgMjQg
KysrKysrKysNCj4gPiAgZHJpdmVycy9jbGsvc3RhcmZpdmUvY2xrLXN0YXJmaXZlLWpoNzF4MC5o
ICAgIHwgIDIgKw0KPiA+ICAuLi4vcmVzZXQvc3RhcmZpdmUvcmVzZXQtc3RhcmZpdmUtamg3MTEw
LmMgICAgfCAxOSArKystLS0NCj4gPiAgaW5jbHVkZS9zb2Mvc3RhcmZpdmUvcmVzZXQtc3RhcmZp
dmUtamg3MXgwLmggIHwgMTAgKystLQ0KPiA+ICAxMSBmaWxlcyBjaGFuZ2VkLCA0NSBpbnNlcnRp
b25zKCspLCA4MyBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Ns
ay9zdGFyZml2ZS9LY29uZmlnDQo+ID4gYi9kcml2ZXJzL2Nsay9zdGFyZml2ZS9LY29uZmlnIGlu
ZGV4IGJkMjkzNThmZmVlYy4uNTE3MTY2NTU1NTRmIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMv
Y2xrL3N0YXJmaXZlL0tjb25maWcNCj4gPiArKysgYi9kcml2ZXJzL2Nsay9zdGFyZml2ZS9LY29u
ZmlnDQo+ID4gQEAgLTIsNiArMiw3IEBADQo+ID4NCj4gPiAgY29uZmlnIENMS19TVEFSRklWRV9K
SDcxWDANCj4gPiAgCWJvb2wNCj4gPiArCXNlbGVjdCBBVVhJTElBUllfQlVTDQo+ID4NCj4gPiAg
Y29uZmlnIENMS19TVEFSRklWRV9KSDcxMDANCj4gPiAgCWJvb2wgIlN0YXJGaXZlIEpINzEwMCBj
bG9jayBzdXBwb3J0Ig0KPiA+IEBAIC0zMiw3ICszMyw2IEBAIGNvbmZpZyBDTEtfU1RBUkZJVkVf
Skg3MTEwX1BMTCAgY29uZmlnDQo+ID4gQ0xLX1NUQVJGSVZFX0pINzExMF9TWVMNCj4gPiAgCWJv
b2wgIlN0YXJGaXZlIEpINzExMCBzeXN0ZW0gY2xvY2sgc3VwcG9ydCINCj4gPiAgCWRlcGVuZHMg
b24gQVJDSF9TVEFSRklWRSB8fCBDT01QSUxFX1RFU1QNCj4gPiAtCXNlbGVjdCBBVVhJTElBUllf
QlVTDQo+ID4gIAlzZWxlY3QgQ0xLX1NUQVJGSVZFX0pINzFYMA0KPiA+ICAJc2VsZWN0IFJFU0VU
X1NUQVJGSVZFX0pINzExMCBpZiBSRVNFVF9DT05UUk9MTEVSDQo+IA0KPiBZb3UndmUgc3dpdGNo
ZWQgdG8gaW1wbHkgZm9yIHRoZSBuZXcgY29udHJvbGxlciB5b3UgYXJlIGludHJvZHVjaW5nIGxh
dGVyIGluDQo+IHRoaXMgc2VyaWVzLg0KPiBZb3Ugc2hvdWxkIHByb2JhYmx5IGJlIGNvbnNpc3Rl
bnQgYW5kIGFsaWduIHRoaXMgb25lIHRvby4gTm90IGluIHRoaXMgY2hhbmdlDQo+IHRob3VnaCwg
aXQgd291bGQgYmUgdW5yZWxhdGVkLg0KPiANCj4gVGhpcyBjaGFuZ2Ugb3RoZXJ3aXNlIGxvb2tz
IGdvb2QgdG8gbWUuIEl0IHJlcXVpcmVzIFBoaWxpcHAncyBvcGluaW9uIGFzIGl0IGlzDQo+IHRv
dWNoaW5nIHJlc2V0IHRvby4NCg0KVGhpcyBwYXRjaCB0b3VjaGVzIHRoZSByZXNldCBzdWJzeXN0
ZW0uIENvdWxkIHlvdSBwbGVhc2UgdGFrZSBhIGxvb2sNCmFuZCBnaXZlIHlvdXIgb3Bpbmlvbj8N
Cg0KSSB3aWxsIHNlbmQgYSB2ZXJzaW9uIGFsb25nIHdpdGggeW91ciBzdWdnZXN0aW9ucyBmcm9t
IHY2Lg0KDQpCZXN0IFJlZ2FyZHMsDQpDaGFuZ2h1YW5nDQoNCg==
