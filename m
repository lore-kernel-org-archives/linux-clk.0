Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795428461;
	b=gO6hRqop9BKv2VfxX+wOH/jdaK4RMfNJctr3iLnImEOhcOKBzjNWXgQou0lSJlveTE4j
	 RLCrJ2jxwENYKE481QL/u4zvEiPvVlGni9GYuhU56LXo3K/DCRKv+KJJX0nDv0oRS5RB+
	 /gO6QGUi9wDwsISducuSnSp5E3reGfLmObu8UGOwjHbppJ3P2nQLKRM4EQRDzAJ+VcPkD
	 AESBxNb5M35G4un7o8JfaAlv2l+Dkpd+4JJu/tQ2t3xMxhfk6E7xPz8wywtbOtj3qBDag
	 886NWwABy9ENtxLhOpa8nyDJJs6QXYC8yKQTMNcL9Zi4IjJo3oHIFIWdlOY+UeAAh5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428461;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ld-processed:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
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
	bh=6PUpxEXte6p9jt4z+sRDDMobh2NtF3SnfUs9TH+dJv8=;
	b=jLXjOYpoPFpKexRfN1fICqmGNMjuFegYmRzEATxxpQbdXLLLR1A0WKCCJMA+xxI5VZG6
	 gaTINTrKHNQdjqC1Xcy81qxpZjn0upbu7MmAhVfgUrB2LqRue74td/ul+dmN37wnwDFvR
	 WxHxVSGaKQv16+k3MOlNKrlRMInerqB3XCcE/TZHCysr9Zu/IeLGlrprHcgsNBt869AIn
	 KQjozQbDiwVgF30tHDzJkl5Ugel1yAfISC+rgwCnVfrole7TxzjhialD6z60DIBbD0ASM
	 30AspEk+cgRzi4CWONkF9XyBzZcDdHDAzNtyYfaWzPGqrYTbKy2RJY1BujrzEEe2BEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=HsiUDvDp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.7
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011007.outbound.protection.outlook.com [40.107.74.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DF5606A32D;
	Mon, 23 Nov 2026 10:07:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4DF5606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=HsiUDvDp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qNgR48dGXJgVnJmdSiciLasQ2dqVA0XOjnRgCPmTPSJMKubl/13tm05gChaU7oxjP6zAzVMKowrR6lv6is4gvSZ8OV+daYjr+kry69a4VHUq16Fjl2hyNmRIlg1Cv8Uz/eLjBQarJEUfFN5s/gkm38t6XfeYL2WGK6H4xb9Xo42KVRSGSuoVi65ONNDhc6yP05gECqUDb5nNi110r+aWf4r7dUMZdgR0gVCrJPN2gcdIUT0voJl9rw5Z7RQV2av8AHDLC+Qymmwht2spqEMssVKSin26BJs2kEkAOrhQyAzjyfa7lWAxc2E3FIRe0LeeaVuwXmz6oFBASvzCZJKz6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6PUpxEXte6p9jt4z+sRDDMobh2NtF3SnfUs9TH+dJv8=;
 b=fzPidoN8rGpNn2SqX9AdASxgoiBVY0mE5P7TTtnRVrZ9E/L/zFXqfC8R2cmrOb7PRg0ZQHwl2C/pAaZXvTUKlaRldGqlW7FgxFXIK0oNxdktGWYNuOm3+jFIKCEED/4cuRPA2fq88kcBd4UbsZ9zdDOMerVSWcbAFxeaVOvkXnFHYX4We7C/D4yb3SRgTS8LZQIdiUy8qtbJpM80fv9E3ncCXodGxULqB7rWQtj3snm5Jh21glaxhPIGe/U/8Quz1yXAfbSyxUfu/gsw74vostaURn/7D9TGp2b2/uzNWRQCJLwamgmqLoT1cjZKolnE5GXe7AUoyrnbD3upnAkjwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6PUpxEXte6p9jt4z+sRDDMobh2NtF3SnfUs9TH+dJv8=;
 b=HsiUDvDph0WjCijcxLX8OG1i/qdzEMo5mN+Nu2VIGa30QzH6dRUVWJlbrxEMBCszZfa9aFlul4qJz60p1JN68TNt5MdnrkOxwyc9yrqTRxijfSA8AmzHPUSYR2v5IDN0dzpKDgjEQNp+f1VVJj0qyKbYXdRr7tiF+4VI+94v4NY=
Received: from TYYPR01MB6603.jpnprd01.prod.outlook.com (2603:1096:400:e0::9)
 by TYYPR01MB12940.jpnprd01.prod.outlook.com (2603:1096:405:15b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 10:07:36 +0000
Received: from TYYPR01MB6603.jpnprd01.prod.outlook.com
 ([fe80::145b:b854:162:2e7f]) by TYYPR01MB6603.jpnprd01.prod.outlook.com
 ([fe80::145b:b854:162:2e7f%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 10:07:36 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "Claudiu.Beznea" <claudiu.beznea@tuxon.dev>, Claudiu Beznea
	<claudiu.beznea@kernel.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"bmasney+clk@redhat.com" <bmasney+clk@redhat.com>, "jbrunet+clk@baylibre.com"
	<jbrunet+clk@baylibre.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] clk: renesas: rzg2l-cpg: Skip re-initializing MSTOPs and
 critical resets for s2idle
Thread-Topic: [PATCH] clk: renesas: rzg2l-cpg: Skip re-initializing MSTOPs and
 critical resets for s2idle
Thread-Index: AQHdX8Vug6f5sfX+VEyy26VSVdBrhbc7g86AgAAZsmCAAAXjgIAAAGhw
Date: Mon, 23 Nov 2026 10:07:36 +0000
Message-ID:
 <TYYPR01MB66035C00CCA93CA3481585A786452@TYYPR01MB6603.jpnprd01.prod.outlook.com>
References: <20261019122501.2423969-1-claudiu.beznea@kernel.org>
 <c1b91afc-5b9f-4ed4-bfa2-b202e552769f@tuxon.dev>
 <TYYPR01MB6603558B6F19CAC31748204486452@TYYPR01MB6603.jpnprd01.prod.outlook.com>
 <d1fbf535-62e3-49af-8eea-eaa5649f8977@tuxon.dev>
In-Reply-To: <d1fbf535-62e3-49af-8eea-eaa5649f8977@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYYPR01MB6603:EE_|TYYPR01MB12940:EE_
x-ms-office365-filtering-correlation-id: 220477a9-02f4-4ffd-3973-08df4949999a
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|22082099003|18002099003|6133799003|11063799006|56012099006|4143699003|261028144727099003|261102123227099003|261026121527099003|261026140227099003|261022075727099003|261021121427099003|261022105027099003|38070700021|10067099003;
x-microsoft-antispam-message-info:
 1BWmHDT0vJ6NjJK3S6LVhVNu2AMgTiLFRd9ywjZxyOGidfYFVbWtabC9dJao12mOtNdAWoRB1wHZL8H/GDy7gesRcugy0zXTwjKMvrHLInffL2iCL/JTpZpJovHuMyQWO4hMfmSuKIrFeaEopQUlKn7qSGnIlMCu+J80p47QjTShhlju+Y+4jH0o7A7f5Gh+qHezglQgYepGxoSSQmfLa1joaNuj0VNBetTbk8myilWZOz34a9FTsPR7XkPeXsp6FUsiae9EAddd44BNdNSh/dPZBED8aDdMxvnSHlZkbGcVyn9fVF53Wsf1cDKSSU526zB6JeyI4Dnei0q4WcsetdcpY0iKlphAbo91wTon62ZR843wKWCVN07XungYMJYihvuXB765N6ZZblNaev89To8euT3+PlT6fF2+i+p5JeOcuVeTuGjAdLbzuhF0G5xCHU1tccOB05K1avbyJ0MrD4d98BMK6nXuCo+aXx41nV3ElGfbvYOiA2N9MmINC17fSnu/PA6BQSLrw9GThxw5q3CiDYXVYNDWGbFg6JsKsGgr8TFKd3M+SdWUl8d9QAXYoMFXeiVkVqc43M0Dn2HNNVCU5t6k/PzkiYVK86OvH3q2OJdtXGZV8n6sD1UjgBwmSiLuOT+scCRTIesbWnTKzcezmz0z97J1ZBkRYm6/MKxVUExeeckqayukbKRTKk4CSzEHYeMCgBixP+YC1gTUYxECsFKh6XJxC97gMcDbYfA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB6603.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(6133799003)(11063799006)(56012099006)(4143699003)(261028144727099003)(261102123227099003)(261026121527099003)(261026140227099003)(261022075727099003)(261021121427099003)(261022105027099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aFZtTVBFNWpyenZsNFBHc2t4NURhZTNXZG1CMUt1YXlrcEE2QnIxYTZwWlFD?=
 =?utf-8?B?akFqTHBoMHlpQ2RQZzBQb3pCelVZNmQvdlMzMlZuV3ZSWnluU0FXTndKd1Zk?=
 =?utf-8?B?em5FSWNQSUZEaGNLSmRJbHZqV1NBZnF6aFN4Njk0UkRHRkhVb2d4Tnoya3hk?=
 =?utf-8?B?ak5UdmZLZWltbHRYMWxETmVUekQwK0gvQ0dWRWFHNXhzeDNiNmgyTmJhWFls?=
 =?utf-8?B?VjJKbWlRM2JkVSsweUNTVXloRGNSSCtBcGpHb1RVTGFZOWFSRlRpcHJYU2xO?=
 =?utf-8?B?WXR2c09GZnZHdmd6SkxmekFSRGhRSGpkZDV1YURpZ0MxQ1lkNHVuWlZwando?=
 =?utf-8?B?a21MSjd1MlVFQVJ2UUd0Uzk2TkRhV2N5Y2ZTTHBSSEswYSs5Qk1YNXk3cjZ3?=
 =?utf-8?B?TlNlc2xhaTY2T3A1RXFtaDFDYnZjaTJVbEZ2S1oyRU43Vkc3ZzlTMFB4NldM?=
 =?utf-8?B?YnZUU0thL2tPL0IrRFBWVFZEZU5EZ2RvYnRzVDJxSCtBRExUVlpYdUd2VHQy?=
 =?utf-8?B?d201Vyt2bWE1T2Vlb3l1aFNieWxqOVZnZ0R0bXVIYkVid2hCK3pVNnpkUmJa?=
 =?utf-8?B?SnBWTERPcE5LMUE3Y29qUnQ5OE5tSUg0ODJGcGNBQ2d1MGFRRUcrdGJETGxs?=
 =?utf-8?B?cGNIU09hbENjUEZTU3ltNlVZNXhBdFROMFJZK01xdTlUbzRDaldsVm5seWhr?=
 =?utf-8?B?RVBaa1Z2SW4xMDdHVXMyS3N0Mnk3Zzc3R2xSSVBOUmxPYW1mYjBGemtsZVJj?=
 =?utf-8?B?bmk4ZFBKYVNydWd2ODlUSG9ZMjNSL1QzbmZKWGg3amdPWVRKaFFUR0VoeVlk?=
 =?utf-8?B?bHJETFZ5cTNaQ2FlQWE2TjNTSWxucjg1eHQvWlNlV2pHRmFXUTVBL2FqWFFC?=
 =?utf-8?B?Mjd5ZHVTcE1XNWdoN2xUQWFKb1hLek96TXIzOEc3blNob1JFY1JnT0owV29n?=
 =?utf-8?B?ekZGa2N5TExJM2VWUk4yVkhNOEJnNWxpcmVHc0pKdHkxUGhiZS9pVUc2WjZO?=
 =?utf-8?B?dkVkNHVNTlB4L2FFZTNTVU02VjY5bnE3R2tZTndDVjkxY0t0ckJ5eGxPMitR?=
 =?utf-8?B?eTVtTUwzb3JoQlY5VVZiUnFQb1V5dFhSY3dGeW04dWE3QzZDc2xvUnBCaDBz?=
 =?utf-8?B?NERMV2V2YTlmc2VyR2FqdnRiYndTSFYvLzhGdnJRNjdmbEpoVng2bXJTckZ3?=
 =?utf-8?B?NzFVckppdlk4SmtYWnpJRUdLbHYvNGVZVnl1RnB0UWJTTVZVK2pmUkduNllr?=
 =?utf-8?B?dkVuaXNJRmFrVnNzeEZRMkpWVUhVU0RZa0cvMGEvT0hvVUZxS2I2MFdPQUVO?=
 =?utf-8?B?bVlEQTBYL2Y5RGoyL2p2RHY4dStuL3dNak95WHdudnM1UWpoaW9yV2N2Tysy?=
 =?utf-8?B?T1JzTkozcU1YclhYTVdUVXBvTDFLc0VzRS9LUFp2a0Rrak1OOWdSa3ZSUHJU?=
 =?utf-8?B?YmNhMnFPUysyVE03QkhSQXNPd0tpZVZ4S1pGTWppWEIxUGlOMTBKTXh2U3Ni?=
 =?utf-8?B?eXVJRDQxU0xMNmN0encyTG8rSEd1TFFMQVRqcU1IS0JnbkdxK0xwNmQzaUt5?=
 =?utf-8?B?a1ZJUGtFTGNUNEhaVEVqYzNDdWV2ek9idkVVV1Q0U0FhaTNBVTl1TFBacHNx?=
 =?utf-8?B?NS85ZitZRnVVZkYyWjBJNk9Bc0MzKzJLK1R5bExSbm4yaUxrVEo3N1ovOE9F?=
 =?utf-8?B?TXBSbmJUY3krSDVOWTVlTTBUOWpkTHVPWHVtL2pKd05FWTAwRzU3cmludFVU?=
 =?utf-8?B?d3FkZE43TmwyK0ExeHJLVmttbmtLS3NCTmZscE5aY2YyRUtYR2xUYytDVGdp?=
 =?utf-8?B?MHc1NzJ1aERrOWJCMDNXbXF5RWlCeVN3N0ttQW9IUWJIeXJhTmxEZXd3RkR6?=
 =?utf-8?B?RFUzbEkxY3NtM0hRL3FCVXZqMVo0azZjai9kRk9pUU5KKzhVK1NwU3ZVUVRT?=
 =?utf-8?B?SVpoMU0vOW42UTBKeHFuYno5Tk1ac1RDWHBaSG5jT2w1Nk53TzFDSDkwSXdn?=
 =?utf-8?B?a0lxSmx6TWpRTjV4cHBRZm1JbUY4d0NFRVVOaWNKNVR4eFFOM29jdzRHSm9M?=
 =?utf-8?B?Y1hqNEpkNFByUlNhVUt5RUZqWDlYVk9aUUEwSmZpZ3NaNkJxOU85QVJNeEVM?=
 =?utf-8?B?M3A4cG5UT3BwVmZPd0ErUlJ0U1MxdFRxbTlQQ05DK0o4eE1YT0MwR01VZWdm?=
 =?utf-8?B?TXRhL1hUbCtMSXg5M3ZnQyt0Z2VaOWhraEJDQjNSV3BrUS9jV0lQN2k2a1hQ?=
 =?utf-8?B?Z2Ryc3ZMRzk0SnFLNUpxRDZicjg3K2s0eEJmU3ZSRm5OMnpsRS94YWdvVXVm?=
 =?utf-8?B?S0dtVzVSaElnZ28rcS92VjJzWjd0ZWhJMFdIUUJzK3kwM3ZHaklnZz09?=
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
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB6603.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 220477a9-02f4-4ffd-3973-08df4949999a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 10:07:36.7897
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: soBZ0mapHC374i87JYa1A9iDpwlrW4j518rD93OxnZEJv6ipWayAgDkOuJ6il7YsLrnQkYzvJ8/al260qRlWZ3fsAyambHzD7VXRoRsb41g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12940

SGkgQ2xhdWRpdSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBjbGF1
ZGl1IGJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPiBTZW50OiAyMyBOb3ZlbWJl
ciAyMDI2IDEwOjAwDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGNsazogcmVuZXNhczogcnpnMmwt
Y3BnOiBTa2lwIHJlLWluaXRpYWxpemluZyBNU1RPUHMgYW5kIGNyaXRpY2FsIHJlc2V0cyBmb3IN
Cj4gczJpZGxlDQo+IA0KPiBIaSwgQmlqdSwNCj4gDQo+IE9uIDExLzIzLzI2IDExOjQ2LCBCaWp1
IERhcyB3cm90ZToNCj4gPiBIaSBDbGF1ZGl1LA0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+ID4+IEZyb206IGNsYXVkaXUgYmV6bmVhIDxjbGF1ZGl1LmJlem5lYUB0dXhv
bi5kZXY+DQo+ID4+IFNlbnQ6IDIzIE5vdmVtYmVyIDIwMjYgMDg6MDcNCj4gPj4gU3ViamVjdDog
UmU6IFtQQVRDSF0gY2xrOiByZW5lc2FzOiByemcybC1jcGc6IFNraXAgcmUtaW5pdGlhbGl6aW5n
DQo+ID4+IE1TVE9QcyBhbmQgY3JpdGljYWwgcmVzZXRzIGZvciBzMmlkbGUNCj4gPj4NCj4gPj4g
SGksIEdlZXJ0LA0KPiA+Pg0KPiA+PiBHZW50bGUgcGluZy4NCj4gPj4NCj4gPj4gVGhhbmsgeW91
LA0KPiA+PiBDbGF1ZGl1DQo+ID4+DQo+ID4+IE9uIDEwLzE5LzI2IDE1OjI1LCBDbGF1ZGl1IEJl
em5lYSB3cm90ZToNCj4gPj4+IEZyb206IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5lYS51
akBicC5yZW5lc2FzLmNvbT4NCj4gPj4+DQo+ID4+PiBXaGVuIHRoZSBzeXN0ZW0gc3VzcGVuZHMg
dG8gczJpZGxlLCBhbnkgb2YgdGhlIElQIGJsb2NrcyBtYXkgYmUgaW4NCj4gPj4+IHRoZSB3YWtl
dXAgcGF0aC4gRm9yIGEgZGV2aWNlIGluIHRoZSB3YWtldXAgcGF0aCwgdGhlIGdlbmVyaWMgUE0N
Cj4gPj4+IGRvbWFpbg0KPiA+Pj4gKGdlbnBkKSBkb2VzIG5vdCBkaXNhYmxlL2VuYWJsZSBpdHMg
Y2xvY2tzIGFjcm9zcyBzdXNwZW5kL3Jlc3VtZS4NCj4gPj4+IFJlLWluaXRpYWxpemluZyB0aGUg
TVNUT1AgYml0cyBmb3Igc3VjaCBhIGRldmljZSBsZWFkcyB0bw0KPiA+Pj4gc3luY2hyb25vdXMg
YWJvcnRzIHdoZW4gaXRzIHJlZ2lzdGVycyBhcmUgYWNjZXNzZWQgZm9yIHRoZSBmaXJzdCB0aW1l
IGFmdGVyIHJlc3VtZS4NCj4gPj4+DQo+ID4+PiBJbiBhIHN1c3BlbmQgbW9kZSB0aGF0IGlzIG5v
dCBjb250cm9sbGVkIGJ5IGZpcm13YXJlLCBwb3dlciB0byB0aGUNCj4gPj4+IFNvQyBpcyBub3Qg
bG9zdCwgc28gdGhlIE1TVE9QIGFuZCBjcml0aWNhbCByZXNldCBzdGF0ZSBpcyByZXRhaW5lZA0K
PiA+Pj4gYW5kIGRvZXMgbm90IG5lZWQgcmUtaW5pdGlhbGl6YXRpb24gaW4gdGhlIGZpcnN0IHBs
YWNlLiBTa2lwIGl0IHdoZW4NCj4gPj4+IHBtX3N1c3BlbmRfdmlhX2Zpcm13YXJlKCkgcmVwb3J0
cyBzdWNoIGEgbW9kZS4NCj4gPg0KPiA+DQo+ID4gTG9va3MgbGlrZSBhIGJ1ZyBpbiBjbGsgZHJp
dmVyLiBNU1RPUCBpcyBjb250cm9sbGVkIGJ5IGNsayByZWZlcmVuY2UgY291bnQuDQo+ID4gSWYg
Y2xrIHJlZiBjb3VudCBpcyAwLCB0aGVuIE1TVE9QIHR1cm5lZCBvZmYuDQo+IA0KPiBIYXZlIHlv
dSByZWFkIHRoZSBwYXRjaCBkZXNjcmlwdGlvbj8gSGVyZSBpdCBpczoNCj4gDQo+IFdoZW4gdGhl
IHN5c3RlbSBzdXNwZW5kcyB0byBzMmlkbGUsIGFueSBvZiB0aGUgSVAgYmxvY2tzIG1heSBiZSBp
biB0aGUgd2FrZXVwIHBhdGguIEZvciBhIGRldmljZSBpbg0KPiB0aGUgd2FrZXVwIHBhdGgsIHRo
ZSBnZW5lcmljIFBNIGRvbWFpbiAoZ2VucGQpIGRvZXMgbm90IGRpc2FibGUvZW5hYmxlIGl0cyBj
bG9ja3MgYWNyb3NzDQo+IHN1c3BlbmQvcmVzdW1lLiBSZS1pbml0aWFsaXppbmcgdGhlIE1TVE9Q
IGJpdHMgZm9yIHN1Y2ggYSBkZXZpY2UgbGVhZHMgdG8gc3luY2hyb25vdXMgYWJvcnRzIHdoZW4g
aXRzDQo+IHJlZ2lzdGVycyBhcmUgYWNjZXNzZWQgZm9yIHRoZSBmaXJzdCB0aW1lIGFmdGVyIHJl
c3VtZS4NCg0KSW4gc3VzcGVuZCB0byBpZGxlLCBkdXJpbmcgc3VzcGVuZCBzdGF0ZSB3aGljaCBj
cml0aWNhbCBjbGsgaXMgdHVybmluZyBNU1RPUCBpbnRvIHN0YW5kYnkgc3RhdGU/DQoNCklmIHN1
c3BlbmQgZG9lcyBub3QgdG91Y2ggY3JpdGljYWwgY2xrLCB0aGVuIE1TVE9QIHdpbGwgYmUgbm9y
bWFsIHN0YXRlLg0KDQpEdXJpbmcgcmVzdW1lLCBJZiBNU1RPUCBpcyBpbiBub3JtYWwgb3BlcmF0
aW9uLCB3aWxsIHNldHRpbmcgYWdhaW4gdG8gbm9ybWFsIHN0YXRlIHdpbGwNCkxlYWQgdG8gYWJv
cnQ/IEFtIEkgbWlzc2luZyBhbnl0aGluZyBoZXJlPw0KDQpDaGVlcnMsDQpCaWp1DQo=
