Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.66
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793950885;
	b=PIBFLLmxNVgwi5qu6+9jYAhnjLvOYL5gkb/9ORvBBqlyPi8K8uIdC6SMfHW+qYKXoO96
	 qUD35/EfFlDz8S1U99U2huSQNB//mkKxzmdNz5fjmmQrj6OKxMIV8HYlM5isbZq+tYRvD
	 3h0kshpBKAUfdmqwcbCK+uIlaEOOSFX3ppKGoEA8vlQZHvUmMA5FpH8aag7PQmoVroUav
	 0+QFm7a9MDZkZwNPrCfql+jn34kXi2Vtwr33oUi+7flVLYI6UeGiZ1o8tcgatmSKQBho4
	 majwfsrtCyCVQ9a7FMd9SRe+Yk7ow7v4lcsYD5rf9yIXS+8o3e8Ezo9IC7T9By/vTQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793950885;
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
	bh=NqW/QdfuaGuULAAh2YHKAToieXaCOMG22D0ci8oMt5s=;
	b=EhrWnWTeaC+lmxlKYKkOQWOxa494X2k4HUPoB4oeZxqwdASHUcsZFuBXRuDAMnxVJY2r
	 lDFW7UL8vJBPYwgS8Hp3L/AcbOc5nNUgO51aHSiR1vUMXV/ki7aoazdfMFWRvm2AzOGuG
	 7kgVmnMgMJ5O9pa3W/jbX7Yc7GyPwwwpqHZYWuSGGr+97JwIXmzDhulKnbgk8tFIzQfy/
	 rR5jYyua18vH/bIepAoupd4Vb3ORLvMg0H75l0GXi73uCO6Iiiguemqvt+M7EDezeYIPf
	 s/4B8vit07zeQq6sioxswlknXPLrwVuXZLoHraEZj0dNQUTh4KzAX/1kcrbjNP7NeUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=sJ6qV0jt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.66
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010066.outbound.protection.outlook.com [52.101.228.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4959D606A326;
	Fri,  6 Nov 2026 07:41:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4959D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=sJ6qV0jt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UdiEYIVNklYymS/eI6EsvxbNBHu1i0+FXswVTnPL5OYHAHQ8YXGimE1BdVQ/w+rufhkwXv6Acj1pEImhe2DSelY8pntvIXe1+CgIrQ0RkzDm4yijdYfm0fvtNt/dq93jLkiKXTluxIWn5F+v4Do8bCaYYlGEd4oYiQADJUVrxOhlF93haQ530PAHIF4UmtjzBAJPHfKC/FDqTbVA/R9cfoQFUAFBL4ucNeyFIixnvn8Gt97Sjw06RbchEwRHk0lM5eIH/DI2RZ3anmhA3tBOqGUTINK82VaAFX4C9JPnriedQdT0f0GjqhAf5t47gEpyKUg2MnrbmATsJrElJGeJQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NqW/QdfuaGuULAAh2YHKAToieXaCOMG22D0ci8oMt5s=;
 b=sITeG0d5+ofb5syZOFb6oE3/hwdzNFzpYghcoV1ymSkRV+0hgyGDMPIjWQji5XVAye+Zcc6kT/KN8sY5rclnz2I/h2W7Yofo1XaR3apkPeTDqgVhJpO169/H4QxTKsN14LNBedSh2fk8KGKCwzwJ3AsITsDg7yRy2uP9SvbE7OQ7EB702VG0WFadEQj51xuWZ6F+nHUlZhfDdA7uEFjxeKPKPEJ9c0YezGhDHd6ABpvIpc2wSAmwme2dhSueK1nWxf1H9VZS49Q7ZguxbP4SCUouVk5fHi6/+4CWG7QCuByKW9FN5tFZZJA0bE23Z3oxO0Wwx4qXWr9E8wwBEgrpqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NqW/QdfuaGuULAAh2YHKAToieXaCOMG22D0ci8oMt5s=;
 b=sJ6qV0jt/LNiHvFti+RogupX815qZjceU0TePCk/jQmFcPFpR4yH2A2piQUZhQnCani8s05LqoYm9U0DOZBUPCRv5rBY15w83DE6xgduEzzHp3WK6KFD0Vm20OeOBtXbma23Z7Dq0kOmb5KAEx/UXCebXUSfY6fHvJysODrZS5A=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB11990.jpnprd01.prod.outlook.com (2603:1096:400:37e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 07:41:21 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%6]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 07:41:21 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, Tommaso Merciai
	<tommaso.merciai.xr@bp.renesas.com>
CC: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Tommaso Merciai <tomm.merciai@gmail.com>
Subject: RE: [PATCH 2/2] clk: renesas: rzv2h: Report the DSI duty cycle from
 the LVDS divider
Thread-Topic: [PATCH 2/2] clk: renesas: rzv2h: Report the DSI duty cycle from
 the LVDS divider
Thread-Index: AQHdZ7F+/3azk1wJJUyXlP7FRQc1frca+42AgAW4eaA=
Date: Fri, 6 Nov 2026 07:41:21 +0000
Message-ID:
 <TY3PR01MB11346986F12DEE0E3370264C386762@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References:
 <20261029-tm-ssgrlpcsrc-2083-v5-clk-duty-fixes-v1-0-47f23de6bdb1@bp.renesas.com>
 <20261029-tm-ssgrlpcsrc-2083-v5-clk-duty-fixes-v1-2-47f23de6bdb1@bp.renesas.com>
 <CAMuHMdX5XuDpdmcUhPHU_uNggpXq_L=6DRSN3ftWEApubu+VMw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdX5XuDpdmcUhPHU_uNggpXq_L=6DRSN3ftWEApubu+VMw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB11990:EE_
x-ms-office365-filtering-correlation-id: fea29c64-aee4-4d24-2271-08df3bd95a18
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|56012099006|38070700021|4143699003|11063799006|261022105027099003|261102123227099003|261009223027099003|261026140227099003|261026121527099003|261022075727099003|261021121427099003|261028144727099003|10067099003|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info:
 7hbpOWpOgeYRSSMl7uCjurEupAP/KyA+oCvjQyW4G4BYpgWhoSiQ9WfUdXIorDQwgXxujruQJ7RV7UorT0Ed1xBQly1+Qf3PGBxvdddnb6PNnNsoQ8Dz7lvvFb6tnS2VRODIqhs3PTAHdgIopnsdqA42jyqFECLXgWfOGaUCnwPBaP2VAf4aJC47rj1smEyqtVRNKJZsUKfC8Y6f/m9HEn16+NnyvSqntQdMD6LrXEOhgowubgmZItq36OnsYYAHs8GhoqveF7+lHX3klccRULyAPwtaTlEzx/i5NM7e8rvk7se4czw7MYr2WiKqV6jdDrd+/vjLcegNc8PnY47HanKqMjoNErs5K8VLDsxn0WZEnCXcIJNZuLgZbEDrtZbGIhT/qFGJ6aXMLjPU3nWCaT9dueStNDzxEOIk35JyauviIebGweEV3MlpXQfzLi/UaciMVMbxcTRplhsKh9j1oBNs09FdZzub/EatgVisot5D2z59MdLYGWNWixQqhvApvm12uHLqlXuv6gu5llCeM89wGCLq9fR0SqGYHD2anq4NTZmHy9KhMMHrZh6gOoxha+uSauMq3dQxYfCP5dySU70pBuEgX0KzEjHtvIU4fmEI+psm2cY+T/qG3Z4lqAEkCJJwAFR2Y2Z35exAJfpW5ArGbHdeFAQBkpZJHsguo0zQXOVaYxN9xA5ETEIm48R/wx8EsE9W/RT5u8THEww+4o2X25WVx/2M1fRA/pxqf68=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(38070700021)(4143699003)(11063799006)(261022105027099003)(261102123227099003)(261009223027099003)(261026140227099003)(261026121527099003)(261022075727099003)(261021121427099003)(261028144727099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Qnhja28rbkFrdHpiNEtsQXVEM0x1YkwxT2FtOXFhUm5OUTNiQXBTUXFMNVZl?=
 =?utf-8?B?dTUwdkQrQ1VRZm90MVBNQ0xYc0hNaFA3djhPU3BTYm5sSlNWZndnNE5pTmRP?=
 =?utf-8?B?VnRlWHBUSlVYWWQ4WjkyK3RJS1R6eXk1aDdBMHcrZ0JqdlBTb2RGd0tiME1C?=
 =?utf-8?B?VXpDbnB1TnpueFp5OUJCYVYxbTZYL2VaaVpQNlV3SG9QdHc0U1NvUldCYlJn?=
 =?utf-8?B?a2dySlBvMGN5L3pKR3BiajNHWlB1VlBIeXlrS0lRbmRVRnNuaW1TWjR3L3Vl?=
 =?utf-8?B?SU9ORjJrcmcvd3BpcGRUL3cxcXlCRnNmdGp3Nk80UWF3SlpSeEVRSWZYQ003?=
 =?utf-8?B?N1p2Qi9Zczh4OGlNTHoydmkyMHJGVnlHdWRUN2NZdklTUlFUTXRMRVRiODdS?=
 =?utf-8?B?eUZYVU5UWVFhTzYzZjAwQU9zRWdCWkJwV0VQN3V4RnpXL0t1QnYvb1ZQUVNE?=
 =?utf-8?B?VVFzaFI1cStoQ0JlRk9uV0gxbUdCbmpsWnBnMlNiUC9TVENzaklaY1YvK0Zy?=
 =?utf-8?B?bGhaaEg5TUNUM3ZZVDB3RE84TE5tQUpSYmZkL2lOUm13bVBERHpzS1RjQWlH?=
 =?utf-8?B?ZlhtbVAyQnV4SW54M1pxVlplU0ExN3ZsY1RGbWdkL2tOdWp0eWhjdkRnNW5h?=
 =?utf-8?B?ZWNXZ0pzdDFuOEpwUlhMY2JMeGZocFpteDVTZUJGaDRRdzkxVjU2MFV6ZE9O?=
 =?utf-8?B?TFdGdm1iLzNIRlIrOFRvMGFxLzJnRkdqS1NVclZwQWZreVRKZDRaYzlVR04z?=
 =?utf-8?B?NTB6eHdUTDB6cXRtS1daa0QyeTEyU1NOTGRqMWhTMEVmUlhQbGM5ajNMSm9M?=
 =?utf-8?B?N3ZzQlpKazVGSW9hTndxOHlFR2FnUktCVnFkQmpnZ0pOS1JKK0t6Ym1VRG9Z?=
 =?utf-8?B?WmtNem0rVVhqbC9KekpwRHFKU1dqT0FIeEtCUGdTelhtd1dNbkNHQjNFVThu?=
 =?utf-8?B?bnhpRVJQSFU1cjY3elpLU3VCdFQ3Smc2QTE0K2Zid3NuUm9ST3U5eWpVR2h0?=
 =?utf-8?B?K1FZRjJPSXlnYmVSaWJFcThhTGxLc2NYVDhkTWEzM2YvaXB4V1BncnMwM2or?=
 =?utf-8?B?VkovV3JsRDgzWFdLZnFBMEM4RDFFVUdlQWlRV0FkVktPeGNmR0s4TmxOL2U4?=
 =?utf-8?B?ZmJBK2VBaDNBNlVVZE9majRqTjRkVHpQZUlMMWFJK1NuWXc1S09mSmpXOFJW?=
 =?utf-8?B?bHJnbGhTcnRIUFpDZlNmMUY5UXpGL2NaUXFiS0dvOVBzWkt6TkliRWZzWHlY?=
 =?utf-8?B?dUtyaU9KMFM1djhsNC9NMHYvV0pQaERabCtJZ0hndVkvR2hkRVJLc0xyNzFz?=
 =?utf-8?B?TXZMdU9iNk1uUXlJeFZnd3dQSG9POU94bGRoamRBTTlLVlY5ekhHR0sxYXdK?=
 =?utf-8?B?YmlLdDZDOGVWdHA1WkhXdW41T3NnYXU2bVBrd3ZtTmlTODJ3RTBjMVpwRFZs?=
 =?utf-8?B?OE0zUmVZSXVmOTBhT1VOVnlMZTFmOW9MaEx5eldPZFcxbStLeW1IY1N2NEow?=
 =?utf-8?B?VzdnKzJIa2lWc2tJY0dyNG5scml5YUpBa0I5ZkkwZlRTSlZMNXArbDBHQzhn?=
 =?utf-8?B?Y3V6aVd0NDVTVUxxRnplVDZIRGFiWkdvQ2lWQ2F0QkZIcEVPY1dUbFA4OFJV?=
 =?utf-8?B?YkZUem9EbUlESlh5bjdGbzc1NCtpeTJ4TlVOYWNUbDIvODI5VlRSL1B3WXBx?=
 =?utf-8?B?aG00R3VqSjBZUTNGNVBBSjBNQVVlVDFvVEhKVDk3L3piMUNqRDJ0OUVXT29B?=
 =?utf-8?B?Ly9lcXBCUWkrRVBSbkZyc2g3TFVIa1lPY29hblVoSWVEenpXS0c0REkzS2pF?=
 =?utf-8?B?V0w4TUlZVUloK2xycXY2RitFWTFtdlM2WTIyZGJXNGhVNGNaNU0yQTJyZ2NO?=
 =?utf-8?B?SGUvMzNRWkJMbzQ3K1RFVzBUMVFqMWNrU2N6MFNZM0p1UC9QVFJwZ1lzV2VU?=
 =?utf-8?B?dTY0UzZncjVoWWFMRWs3M0N4aVZNWFp0Ym8wQjl6YUxrdGplNS9rK2wyL0k3?=
 =?utf-8?B?cUdYY25DekhsS2tkdWowRU4xbnlML1FuUThXbTJVNHZQL2N1UWI1dEFJdm9D?=
 =?utf-8?B?SmNManoxdzdtZnd3b3FJU0VtbG9xcEdIQVR3Tmd1RmpUNUk3TzRUNDNXY3pv?=
 =?utf-8?B?eHJxeGFOYUU0SFdMaVdrREhiYTM5ZFlZL1p3ajN5bm80NHhrUGZTOEdKYng5?=
 =?utf-8?B?QTlMUEZzU3V5V1JhN3BiY1Y2dkZQYW0zS0xubHJlN2hUd0RrTXpNVVU2S29T?=
 =?utf-8?B?K0lXNGltclhLUGpHQk5NcHQvVUpmL1ZJU0ZzeVJ3NzhrSlVkdFJFU2c0TUVv?=
 =?utf-8?B?cXR0STFwUEMrcS85K3diNlNvbEFWRzQ0TlVYWGRzd2ZsdzE0WFozQT09?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fea29c64-aee4-4d24-2271-08df3bd95a18
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2026 07:41:21.4482
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kgdFa+yIvyUtw2M5jyaBIiFAzXU21CAgnplCmoszMxEhcnjTvv3mEsXq2pFDT3dOyMo08vzRIbCM9HiQwUBI7P8ktnHBMhKTDc/2AnOde2o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11990

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMDIgTm92ZW1iZXIg
MjAyNiAxNjoxNg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDIvMl0gY2xrOiByZW5lc2FzOiByenYy
aDogUmVwb3J0IHRoZSBEU0kgZHV0eSBjeWNsZSBmcm9tIHRoZSBMVkRTIGRpdmlkZXINCj4gDQo+
IEhpIFRvbW1hc28sDQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiBPbiBUaHUs
IDI5IE9jdCAyMDI2IGF0IDE1OjI2LCBUb21tYXNvIE1lcmNpYWkgPHRvbW1hc28ubWVyY2lhaS54
ckBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gVGhlIDQvNyBkdXR5IGN5Y2xlIG9mIHRoZSBM
VkRTIHBhdGggY29tZXMgZnJvbSB0aGUgZGl2aXNpb24gYnkgNywgbm90DQo+ID4gZnJvbSB0aGUg
UExMRFNJIG11eCwgYXMgYW4gb2RkIGRpdmlkZXIgY2Fubm90IHByb2R1Y2UgYSA1MCUgZHV0eSBj
eWNsZS4NCj4gDQo+IE5vdGUgdGhhdCB0aGUgbGF0dGVyIGlzIG5vdCB0cnVlIGluIGdlbmVyYWw6
IGlmIGFuIG9kZCBkaXZpZGVyIGxvb2tzIGF0IGJvdGggZWRnZXMgb2YgdGhlIHBhcmVudCBjbG9j
aw0KPiBzaWduYWwsIHRoZSBvdXRwdXQgd2lsbCBoYXZlIGEgNTAlIGR1dHkgY3ljbGUgKGFzc3Vt
ZWQgdGhlIHBhcmVudCBoYXMgYSA1MCUgZHV0eSBjeWNsZSkuDQo+IElmIGFuIG9kZCBkaXZpZGVy
IGxvb2tzIG9ubHkgYXQgcmlzaW5nIG9yIGZhbGxpbmcgZWRnZXMsIHRoZSBvdXRwdXQgd2lsbCBp
bmRlZWQgaGF2ZSBhIG5vbi01MCUgZHV0eQ0KPiBjeWNsZS4NCj4gDQo+ID4gUmVwb3J0IGl0IGZy
b20gYSBkZWRpY2F0ZWQgTFZEUyBkaXZpZGVyIGNsb2NrIHR5cGUgYW5kIGxldCB0aGUgY29yZQ0K
PiA+IHdhbGsgdXAgdG8gdGhlIHNlbGVjdGVkIHBhcmVudCB0aHJvdWdoIENMS19EVVRZX0NZQ0xF
X1BBUkVOVC4gVGhlDQo+ID4gcmVwb3J0ZWQgdmFsdWVzIGRvIG5vdCBjaGFuZ2UsIHRoZSBtdXgg
a2VlcHMgc2VsZWN0aW5nIHRoZSBwYXRoLCBhbmQNCj4gPiBpdHMgZHV0eSBjeWNsZSBjb25zdGFu
dHMgZ28gYXdheS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFRvbW1hc28gTWVyY2lhaSA8dG9t
bWFzby5tZXJjaWFpLnhyQGJwLnJlbmVzYXMuY29tPg0KPiANCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0
IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+IGkuZS4gd2lsbCBxdWV1ZSBp
biByZW5lc2FzLWNsayBmb3IgdjcuNS4NCj4gDQo+ID4gLS0tIGEvZHJpdmVycy9jbGsvcmVuZXNh
cy9yenYyaC1jcGcuYw0KPiA+ICsrKyBiL2RyaXZlcnMvY2xrL3JlbmVzYXMvcnp2MmgtY3BnLmMN
Cj4gDQo+ID4gQEAgLTg5MCw2ICs4NjMsOTQgQEAgcnp2MmhfY3BnX2ZpeGVkX21vZF9zdGF0dXNf
Y2xrX3JlZ2lzdGVyKGNvbnN0IHN0cnVjdCBjcGdfY29yZV9jbGsgKmNvcmUsDQo+ID4gICAgICAg
ICByZXR1cm4gJmNsa19od19kYXRhLT5maXguaHc7DQo+ID4gIH0NCj4gPg0KPiA+ICtzdGF0aWMg
aW50IHJ6djJoX2NwZ19wbGxkc2lfZGl2X2x2ZHNfZ2V0X2R1dHlfY3ljbGUoc3RydWN0IGNsa19o
dyAqaHcsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHN0cnVjdCBjbGtfZHV0eQ0KPiA+ICsqZHV0eSkgew0KPiA+ICsgICAgICAgc3RydWN0
IGNsa19maXhlZF9mYWN0b3IgKmZpeCA9IHRvX2Nsa19maXhlZF9mYWN0b3IoaHcpOw0KPiA+ICsN
Cj4gPiArICAgICAgIC8qDQo+ID4gKyAgICAgICAgKiBBbiBvZGQgZGl2aWRlciBjYW5ub3QgZ2Vu
ZXJhdGUgYSA1MCUgZHV0eSBjeWNsZTogdGhlIG91dHB1dCBzdGF5cw0KPiA+ICsgICAgICAgICog
aGlnaCBmb3IgKGRpdiArIDEpIC8gMiBpbnB1dCBjbG9jayBjeWNsZXMgb3V0IG9mIGRpdiwgZS5n
LiBhIGRpdmlkZXINCj4gPiArICAgICAgICAqIG9mIDcgZ2l2ZXMgYSBkdXR5IGN5Y2xlIG9mIDQv
Ny4NCj4gPiArICAgICAgICAqLw0KPiA+ICsgICAgICAgZHV0eS0+bnVtID0gRElWX1JPVU5EX1VQ
KGZpeC0+ZGl2LCAyKTsNCj4gPiArICAgICAgIGR1dHktPmRlbiA9IGZpeC0+ZGl2Ow0KPiA+ICsN
Cj4gPiArICAgICAgIHJldHVybiAwOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IHJ6
djJoX2NwZ19wbGxkc2lfZGl2X2x2ZHNfZGV0ZXJtaW5lX3JhdGUoc3RydWN0IGNsa19odyAqaHcs
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHN0cnVjdA0KPiA+ICtjbGtfcmF0ZV9yZXF1ZXN0ICpyZXEpIHsNCj4gPiArICAgICAgIHJldHVy
biBjbGtfZml4ZWRfZmFjdG9yX29wcy5kZXRlcm1pbmVfcmF0ZShodywgcmVxKTsgfQ0KPiA+ICsN
Cj4gPiArc3RhdGljIGludCByenYyaF9jcGdfcGxsZHNpX2Rpdl9sdmRzX3NldF9yYXRlKHN0cnVj
dCBjbGtfaHcgKmh3LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1bnNpZ25lZCBsb25nIHJhdGUsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcNCj4gPiArcGFyZW50X3JhdGUpIHsN
Cj4gPiArICAgICAgIHJldHVybiBjbGtfZml4ZWRfZmFjdG9yX29wcy5zZXRfcmF0ZShodywgcmF0
ZSwgcGFyZW50X3JhdGUpOyB9DQo+ID4gKw0KPiA+ICtzdGF0aWMgdW5zaWduZWQgbG9uZyByenYy
aF9jcGdfcGxsZHNpX2Rpdl9sdmRzX3JlY2FsY19yYXRlKHN0cnVjdCBjbGtfaHcgKmh3LA0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdW5zaWduZWQNCj4gPiArbG9uZyBwYXJlbnRfcmF0ZSkgew0KPiA+ICsgICAgICAgcmV0dXJu
IGNsa19maXhlZF9mYWN0b3Jfb3BzLnJlY2FsY19yYXRlKGh3LCBwYXJlbnRfcmF0ZSk7IH0NCj4g
PiArDQo+ID4gK3N0YXRpYyB1bnNpZ25lZCBsb25nDQo+ID4gK3J6djJoX2NwZ19wbGxkc2lfZGl2
X2x2ZHNfcmVjYWxjX2FjY3VyYWN5KHN0cnVjdCBjbGtfaHcgKmh3LA0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcNCj4gPiArcGFyZW50
X2FjY3VyYWN5KSB7DQo+ID4gKyAgICAgICByZXR1cm4gY2xrX2ZpeGVkX2ZhY3Rvcl9vcHMucmVj
YWxjX2FjY3VyYWN5KGh3LA0KPiA+ICtwYXJlbnRfYWNjdXJhY3kpOyB9DQo+ID4gKw0KPiA+ICtz
dGF0aWMgY29uc3Qgc3RydWN0IGNsa19vcHMgcnp2MmhfY3BnX3BsbGRzaV9kaXZfbHZkc19vcHMg
PSB7DQo+ID4gKyAgICAgICAuZGV0ZXJtaW5lX3JhdGUgPSByenYyaF9jcGdfcGxsZHNpX2Rpdl9s
dmRzX2RldGVybWluZV9yYXRlLA0KPiA+ICsgICAgICAgLnNldF9yYXRlID0gcnp2MmhfY3BnX3Bs
bGRzaV9kaXZfbHZkc19zZXRfcmF0ZSwNCj4gPiArICAgICAgIC5yZWNhbGNfcmF0ZSA9IHJ6djJo
X2NwZ19wbGxkc2lfZGl2X2x2ZHNfcmVjYWxjX3JhdGUsDQo+ID4gKyAgICAgICAucmVjYWxjX2Fj
Y3VyYWN5ID0gcnp2MmhfY3BnX3BsbGRzaV9kaXZfbHZkc19yZWNhbGNfYWNjdXJhY3ksDQo+ID4g
KyAgICAgICAuZ2V0X2R1dHlfY3ljbGUgPSByenYyaF9jcGdfcGxsZHNpX2Rpdl9sdmRzX2dldF9k
dXR5X2N5Y2xlLA0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArc3RhdGljIHN0cnVjdCBjbGtfaHcgKiBf
X2luaXQNCj4gPiArcnp2MmhfY3BnX3BsbGRzaV9kaXZfbHZkc19jbGtfcmVnaXN0ZXIoY29uc3Qg
c3RydWN0IGNwZ19jb3JlX2NsayAqY29yZSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzdHJ1Y3Qgcnp2MmhfY3BnX3ByaXYgKnByaXYpIHsNCj4gPiArICAgICAg
IHN0cnVjdCBjbGtfaW5pdF9kYXRhIGluaXQgPSB7IH07DQo+ID4gKyAgICAgICBzdHJ1Y3QgY2xr
X2ZpeGVkX2ZhY3RvciAqZml4Ow0KPiA+ICsgICAgICAgY29uc3Qgc3RydWN0IGNsa19odyAqcGFy
ZW50Ow0KPiA+ICsgICAgICAgY29uc3QgY2hhciAqcGFyZW50X25hbWU7DQo+ID4gKyAgICAgICBp
bnQgcmV0Ow0KPiA+ICsNCj4gPiArICAgICAgIFdBUk5fREVCVUcoY29yZS0+cGFyZW50ID49IHBy
aXYtPm51bV9jb3JlX2Nsa3MpOw0KPiA+ICsgICAgICAgcGFyZW50ID0gcHJpdi0+Y2xrc1tjb3Jl
LT5wYXJlbnRdOw0KPiA+ICsgICAgICAgaWYgKElTX0VSUihwYXJlbnQpKQ0KPiA+ICsgICAgICAg
ICAgICAgICByZXR1cm4gRVJSX0NBU1QocGFyZW50KTsNCj4gPiArDQo+ID4gKyAgICAgICBwYXJl
bnRfbmFtZSA9IGNsa19od19nZXRfbmFtZShwYXJlbnQpOw0KPiA+ICsNCj4gPiArICAgICAgIGZp
eCA9IGRldm1fa3phbGxvYyhwcml2LT5kZXYsIHNpemVvZigqZml4KSwgR0ZQX0tFUk5FTCk7DQo+
ID4gKyAgICAgICBpZiAoIWZpeCkNCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIEVSUl9QVFIo
LUVOT01FTSk7DQo+ID4gKw0KPiA+ICsgICAgICAgaW5pdC5uYW1lID0gY29yZS0+bmFtZTsNCj4g
PiArICAgICAgIGluaXQub3BzID0gJnJ6djJoX2NwZ19wbGxkc2lfZGl2X2x2ZHNfb3BzOw0KPiA+
ICsgICAgICAgaW5pdC5mbGFncyA9IENMS19TRVRfUkFURV9QQVJFTlQ7DQo+ID4gKyAgICAgICBp
bml0LnBhcmVudF9uYW1lcyA9ICZwYXJlbnRfbmFtZTsNCj4gPiArICAgICAgIGluaXQubnVtX3Bh
cmVudHMgPSAxOw0KPiA+ICsNCj4gPiArICAgICAgIGZpeC0+aHcuaW5pdCA9ICZpbml0Ow0KPiA+
ICsgICAgICAgZml4LT5tdWx0ID0gY29yZS0+bXVsdDsNCj4gPiArICAgICAgIGZpeC0+ZGl2ID0g
Y29yZS0+ZGl2Ow0KPiA+ICsNCj4gPiArICAgICAgIHJldCA9IGRldm1fY2xrX2h3X3JlZ2lzdGVy
KHByaXYtPmRldiwgJmZpeC0+aHcpOw0KPiA+ICsgICAgICAgaWYgKHJldCkNCj4gPiArICAgICAg
ICAgICAgICAgcmV0dXJuIEVSUl9QVFIocmV0KTsNCj4gPiArDQo+ID4gKyAgICAgICByZXR1cm4g
JmZpeC0+aHc7DQo+ID4gK30NCj4gPiArDQo+ID4gIHN0YXRpYyBzdHJ1Y3QgY2xrX2h3DQo+ID4g
ICpyenYyaF9jcGdfY2xrX3NyY190d29jZWxsX2dldChzdHJ1Y3Qgb2ZfcGhhbmRsZV9hcmdzICpj
bGtzcGVjLA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICpkYXRhKQ0K
PiANCj4gU2luY2UgdGhlcmUgYXJlIG5vdyB0d28gY29waWVzIG9mIHRoaXMgY29kZSAoc2VlIHJ6
ZzNsX2NwZ19sdmRzX2Rpdl8qKSwgcGVyaGFwcyB0aGUgdGltZSBpcyByaXBlIHRvDQo+IGFkZCBv
ZGQgZHV0eSBjeWNsZSBzdXBwb3J0IHRvIGNsa19maXhlZF9mYWN0b3I/ICBBcyBkdXR5LT5udW0g
Y2FuIGJlIHJvdW5kZWQgdXAgb3IgZG93biwgSSBhbQ0KPiBlbnZpc2lvbmluZyB0d28gbmV3IG11
dHVhbGx5LWV4Y2x1c2l2ZSBmaXhmbGFncyBwYXJhbWV0ZXJzLCBlLmcuOg0KPiANCj4gICAgIENM
S19GSVhFRF9GQUNUT1JfT0REX0RVVFlfRE9XTg0KPiAgICAgQ0xLX0ZJWEVEX0ZBQ1RPUl9PRERf
RFVUWV9VUA0KDQpGb3IgUmVuZXNhcyBpdCBpcyA0Lzcgb2RkIGRpdmlkZXINCg0KRm9yIG90aGVy
IHZlbmRvciBTb0NzIGl0IGNhbiBiZSAxLzcgLi4gNi83DQpTbyBub3Qgc3VyZSBDTEtfRklYRURf
RkFDVE9SX09ERF9EVVRZX3tVUCxET1dOfQ0KYXBwbGllcz8gSSBiZWxpZXZlIGlmIGl0IGlzIGdl
bmVyaWMgd2UgbmVlZCB0byBwYXNzDQpib3RoIE5yL0RyIGZvciB0aGUgZHV0eSBjeWNsZS4NCg0K
SSBtYXkgYmUgd3JvbmcuIFBsZWFzZSBjb3JyZWN0IG1lIGlmIGl0IGlzIHRoZSBjYXNlLg0KDQpD
aGVlcnMsDQpCaWp1DQoNCg0K
