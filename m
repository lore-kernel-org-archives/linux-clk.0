Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.114
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795400981;
	b=mLnJVKcyhf36YLbBJBFW5FpRdeGvvmUmDua/ieVuQoSsodmz+FgWYE4KoYz4CF5WKHCT
	 qz6nw3P2uoybgCLDG61SOFHz0SH+9xbl4KQudTTIAhH7F5Z5scvk9NtIyjlcJn2PFuVQt
	 xWVITx3cU+ANCiO69qgtTeLnLfScUyMe8/zwCNNCjaGu7YqcoRpDahjF5ri+yAu8hdOy8
	 +uznhcsVB34w4yNKFVt47iOcK8Ws9fhkCE/+WtgNuID6X+8fVZG98Ar1oq7y9QKZA8R2z
	 BdR8h7Mf4p1c5fNK5IO0sLWFzm3/zSzcYE5G1Hd+mlMh0V5PA/OxwLWiI1Hlufortnw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795400981;
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
	bh=T7Ea8UbhPN0Dno6LPQF2R+dFWatd71Mn7WiRhWGl3FE=;
	b=t4hISY1PgenjO2Q4S1LEMPxVi0JhrfZOY7sCZMCXSiS8+hrFnYdWsP0uSUlCqVMl6oqZ
	 vOmHWLR/ddl+L4RIQ2NX+k6vCrr6CEAqKuPmUwmUhhJKtCe5E/1n6zc3QY2+JNJfHfAH0
	 rkRbbcMm+DCFthbKLfhagvUESwxwOifnFIPXXsRXQzQSIW/J6KzQKpd8LBUSdqmxqVqqe
	 MY9UVbIU2efDTYF6taQuHU3q/qHtvNMzpPm0C1eHBonag2c4CgWaemt3DT/Z3h10xKN3q
	 NAn4aV/53HPVToSbouWOQAqymACjs2H2abPduK0fw2QuCi6mX8Hwcqv+CER5uYsABPA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.114
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2114.outbound.protection.partner.outlook.cn [139.219.17.114])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39518606A331;
	Mon, 23 Nov 2026 02:29:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39518606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JSW19GlKTaXlhZyjBESyCC82e+Z9BN3zoffQSzRODfLt0wT03eJQWU8B/Pvp8JLUpPwDQ5N7EqSfZoN82gfxMsebWwvFAGUH++6S6H9GWP5A4iEYLps7igymLXV6EO3Nd0CG+wbUcB9adKSK7xRGnzEccAbVZBGkFe8YvX011IMSGISyuHolnhSfgMXu6jdRz8++mSvjucdFOFenkGUhnCUMnxRx0ZeVTue1kgJtnoRw/AQkhSwCaOlyM4IWu0ah5Jl2nks7ei28eWv/XIXZ37qCqRG71pD5ALi4HWig4bjKBwMj6rkbbR2Er5dln27FP+zqZBaxYzgptWCbq4VEGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7Ea8UbhPN0Dno6LPQF2R+dFWatd71Mn7WiRhWGl3FE=;
 b=CoebTQO8BhJXY8Ii+PHHNPvXWDyjT9SX8OCant9h35Azsk9+iXcwBOkmT7T0vVFMm8RN3yC+wo/qpOlgHEkWFruj/b8fKMv8U3pcXJ0J5wtbn6FX1gJ9+8tfdCRw3fXtcjsZeDW7D+frWLTHcwt+gV4JuRlJNdQP3X1zLRuOUytP5Xrby8gy/90ZPyqG8+MVMwOPd+3unvrX/0x5toVqpOHR43EpFAWgkQ/0unl0aXGbPB9iuEKZLt+4JZdS0RJtkfabX87uQxht4KcbR62PppXSlgC8UfTngMMnHdH4EgXSjjb7nbU8pbFyQt440b+q+6BiGv2bV8J4Zj+pPkIAfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1171.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.19; Mon, 23 Nov
 2026 02:29:27 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%6])
 with mapi id 15.21.0615.017; Mon, 23 Nov 2026 02:29:27 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Jerome Brunet <jbrunet@baylibre.com>
CC: Brian Masney <bmasney@redhat.com>, Jerome Brunet
	<jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v2 3/6] clk: starfive: jh71x0: Add generic CRG probe
 helper
Thread-Topic: [PATCH v2 3/6] clk: starfive: jh71x0: Add generic CRG probe
 helper
Thread-Index: AQHdd0RdMHcensPM2kK9n/gu2bk397c6QgUAgAC0XPA=
Date: Mon, 23 Nov 2026 02:29:27 +0000
Message-ID:
 <ZQ4PR01MB120278600373D94EA1F5E136F2452@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20261118100523.11395-1-changhuang.liang@starfivetech.com>
 <20261118100523.11395-4-changhuang.liang@starfivetech.com>
 <179536223421.2728475.4581137443338131034.b4-review@b4>
In-Reply-To: <179536223421.2728475.4581137443338131034.b4-review@b4>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1171:EE_
x-ms-office365-filtering-correlation-id: 5ac256b8-0bda-4562-64d7-08df490998ca
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|4143699003|6133799003|261009223027099003|22082099003|18002099003|10067099003|56012099006|261102123227099003|261022075727099003|261028144727099003|261022105027099003|261021121427099003|261022113327099003|261026121527099003|261026140227099003|38070700021;
x-microsoft-antispam-message-info:
 3PcF1rsw7vfmdOPLdUipWorCPeptSXoCrijIfRS/m9BOK7hZAenvyM6yOAzrjOzoG1lhZCsFfgIhi6wvjA6QvpW5Gek8apt5sb9PVd1VjVLZFZeSYgCmFv+3uR/YbAiA0eNc2ulAmmGOJ4dyf28bHtqwz1kNBbKBGwZghbZtBvYDFUx4hpj7dlHRP4VJpp4Agnbatte+i4JGVXJO/e+fwUD/k4UY7jg2HnRGWtdqFNJDv29q+edaggmorCnUlm8rXkNIPMNfZsXu/uWij1DVhtaYs5Sj9NWPLAkaC8EdVCOGtLoaSN+Yhwj2vzeV2bOTLC8gmQCIrHUz1ntxasCBjV90Ywp3XES0LOz9Yywlva7DNtpJWqNQcwztV05b2HHj9/XPIVhpj4DJ8afoB9dNX9eeJXyPM1m/QxOhzoVqe8qz+OeFDndxFwSDHDm3+a4p+nwMs/joc7O2aJ+kzDPbrSR/HezTKIQ1RV9PlG/O1XXB/ONnLDNNa/moz7YfSq6iI2alzQcEZREtt212O4z39bILxuW8eXlwLBW3SMzSRGSAPZTJ9WVXz2t3AP00g0LA
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(4143699003)(6133799003)(261009223027099003)(22082099003)(18002099003)(10067099003)(56012099006)(261102123227099003)(261022075727099003)(261028144727099003)(261022105027099003)(261021121427099003)(261022113327099003)(261026121527099003)(261026140227099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NE5yV1ZGSnB1Uzc5YnEzaDAwanNlaE1VM1lFMXV6NWJJZU82Z3kyUFd3ZERx?=
 =?utf-8?B?dWlpeURvRUFSQ1ZZd092VmtPeG9ydlFVOVpSdGVBTlgrN3M2VWxmeElyVnYy?=
 =?utf-8?B?NEtQU0luRTlhbVNLNDJ3Y1Z4VloxTTZ3Nisza2RvR2xHQW5kZkNaNlgzeStQ?=
 =?utf-8?B?bnB6WHJzRkxnWk9EOVhTK2ZQbmZmNmtxY0NTV0J4VWtDSW5Jd1NDWjUxWUNV?=
 =?utf-8?B?VG10dVY5RzNEWnFGNlZWMENCaEYxQXd2ZEt6T3lzYnpaSmNmRkdoMDMzOTJF?=
 =?utf-8?B?VDJIcUZZMWNkaFk0bTlLUFdEU3VxdldmVFR6RlB1Qk9sbDlGOG5TbFZ6U2F5?=
 =?utf-8?B?R29BUzU3ZDhvaTZwa2JpQmI3U0tBUi9lZ2lhUEI0eFdSNlFMWW1OWEFiSk12?=
 =?utf-8?B?Qkp2dW9nZWVqdHpFRytGekkrdTVadEFtYjlOelkrOHZid1dENU1Pc1hYVnlQ?=
 =?utf-8?B?cDhFSCtiT1JYakRJL2JkdWVBdXV2cHJpcWRxWXY4MTJpeHFROWxwZkxvcjJk?=
 =?utf-8?B?SmxNT2x4THczVnhiNjZpWXhnODRianplczNyc1QyeGlQWU5LRllRT09nTE5M?=
 =?utf-8?B?RjUxeTlCdHBoSkt5cTYzUHB6cWRuZDRyb1JUWGtzV2l5d0RLLzY3TUZkNSs4?=
 =?utf-8?B?NXE5cm1kbEFSdGZYeVNRbUJLU09XWHk0S1duWS8yNkNwWWJXU21abVdXaUls?=
 =?utf-8?B?VUNYNSs1QmRRNGFFMjZNZWNhMVRiU2tLUkF2LzI1Z1VkWTVtWEN1V3Uybkpp?=
 =?utf-8?B?SjdZWjlxWXlVY1hxSDk4elRDbHExSUhRNTFSSWNGVjArOWtXaE1LeGEzTDJX?=
 =?utf-8?B?cVhtOWNjNXh4RzhjSkdkUlhSL25wVGV5eUdLdVVDTnNGYzBocVJsaTdnWEVL?=
 =?utf-8?B?dytyMFBIS2syQVlCeEZleExITVV1THpjVEZjTXB0ME8wYS9YNCt1d0pOYk55?=
 =?utf-8?B?VUtxTSttQzZOU3I4ZFVCQmtlV1hPSFVuMEdEdGM5aVM1MlFMMktBcjlTU2Za?=
 =?utf-8?B?Vy9uSVBwUXNoRERiYTFxcUJTN1pKQklEdnJUelh1WHBsSzV0Z2NOSUFyWUJN?=
 =?utf-8?B?VmUxWTFZTXVaU1pGV3M1VStSeE1Mc2ROYm0yNW1ublgxUXJRRUoyQUdwN1ZZ?=
 =?utf-8?B?R1ovZVR4ZzFXTmxodHBGWWJEdW5YVnU0WXBOWlF0MnZjUUZ2dXJvRWp6ODJC?=
 =?utf-8?B?VnZpQUNFZHNJUW1CMjN2QmVwR0RzWk50YXpwOU1pR3lHd2RmUFNRa0pXQWtl?=
 =?utf-8?B?d09VN3JzcDd4ZHk3a1hORXQ1OVhlcWhoOGlPeVJBYi9FOSs0a0g0R05yUmxr?=
 =?utf-8?B?aEhZeGVpaUo3NVljMlNEanNTamszQ3hMQXRtOEZTUUpzMGo3enNHMG8vSTZu?=
 =?utf-8?B?czdpWFpkejRJY2lreDluYUJYMTJ1d0hpa0JuRCs5bVlDODhyT2lENDFVc2VW?=
 =?utf-8?B?S29wSlQwYVZHU21VNTdDNDA2NVNnZ21QMGYrdGRJTkpqRzNBenhDcjFzK3Rw?=
 =?utf-8?B?am5uLzhGamlERWppMllrSkttcUJGMFVhbzk3RTNmRkRZNXZzOURBZ0dueDJH?=
 =?utf-8?B?bERZek13ak9ySDV1VkpoTUxMVnRiK05UUDM3NUZJa0FHNUVTTnUwSDhuRHMv?=
 =?utf-8?B?dE5kSys0dkc2aktxZTZHMk9Ia3BoSTdaNldoYmVHU3JwTGpOSjI4dHMyVEZ4?=
 =?utf-8?B?eDJsU0JHUGVGYjRoQ01oL1hDa2Vzc1dONS84RDFIbDdBOFIzSWVyQUppR2FU?=
 =?utf-8?B?ZVYvYmNzL3FJTWRpL2VNNURPemFjcTI3UmFkRlBucWZHNjR4TUhIbzQzUUVX?=
 =?utf-8?B?M0QrQ253bnNNZ3ZaVTZEbkdYVDQvby9oNjJCUHh6VjBkYXZxZlozbUdqUWt0?=
 =?utf-8?B?V0tJeEpxYnJjY0lVeEdmSkYwOXlaZ3huSkVYemlwRDFEZjMrZkszcnhZYkY0?=
 =?utf-8?B?dVA0ZkRWZyt3diszY3E2aDkxM1g0bndwK1FBUmZiRVRJVVdMYVpjeXBGMFlo?=
 =?utf-8?B?MHM2bTZacnZvYXpqUWRHUHFHS1ludGNKRHFyK2syeXFDQXdXWUtYSzA4VDgz?=
 =?utf-8?B?OEFmU3RhYnkybzRtR21tRTVlYkYzZlhzQjIraU03aWxUY202UTJZSTFYU08y?=
 =?utf-8?B?VFFsKzhDYUtSWXEwcWNtS05vTW9EZHJRejlrcFEzaVFHeGhmMnEzU0RhbXdR?=
 =?utf-8?B?WUY4Wjg3clpPSForaUFsOW0xaFJnTmszRXFVMElpUDQrcEdMQ1FZTXJIVGhl?=
 =?utf-8?B?amRITXFiUkE1bEZmcEtTa01CR3JjcCsvR2twZUk1RFZDRGtGZWwrTk0rN0ha?=
 =?utf-8?B?ajJyTkFBSlN5TWhGQmJQcW5CM2pzalo1dHZKaEhXYUpqMzNmWFFpbWMwYlQ5?=
 =?utf-8?Q?fck62pCla+2fxobg=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ac256b8-0bda-4562-64d7-08df490998ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 02:29:27.6645
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YYUALX8c0mlOGldkJn7uOuh8roJlXTDQljrg21bbLXZIv/G9fEGMH9JlwFbS1oXYrmqZr+dT7AN5mD0xjzZVn3KBag9bUyIPgmeVhkL9GW+ceNRS6+9DGVFRNbL7opYT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1171

SGksIEplcm9tZQ0KDQo+ID4gVGhlIFN0YXJGaXZlIEpIQjEwMCBTb0MgaGFzIHNldmVyYWwgY2xv
Y2sgYW5kIHJlc2V0IGdlbmVyYXRvcnMgKENSR3MpDQo+ID4gd2hpY2ggc2hhcmUgdGhlIHNhbWUg
cHJvYmUgZmxvdzogbWFwIHRoZSByZWdpc3RlcnMsIHJlZ2lzdGVyIGFsbCB0aGUNCj4gPiBjbG9j
a3MgZGVzY3JpYmVkIGJ5IGEgdGFibGUsIGFkZCB0aGUgY2xvY2sgcHJvdmlkZXIgYW5kIHJlZ2lz
dGVyIHRoZQ0KPiA+IGF1eGlsaWFyeSByZXNldCBkZXZpY2UuDQo+ID4NCj4gPiBBZGQgamg3MXgw
X2NyZ19wcm9iZSgpIHRvZ2V0aGVyIHdpdGggc3RydWN0IGpoNzF4MF9jcmdfZG9tYWluX2luZm8g
c28NCj4gPiB0aGF0IGVhY2ggQ1JHIGRyaXZlciBvbmx5IG5lZWRzIHRvIHByb3ZpZGUgaXRzIGNs
b2NrIHRhYmxlIGFuZCByZXNldA0KPiA+IGF1eGlsaWFyeSBkZXZpY2UgbmFtZS4gVGhlIHJlc2V0
IGF1eGlsaWFyeSBkZXZpY2UgaXMgcmVnaXN0ZXJlZCB3aXRoDQo+ID4gamg3MXgwX3Jlc2V0X2Nv
bnRyb2xsZXJfcmVnaXN0ZXIoKS4NCj4gPg0KPiA+IFRoZSBjbG9jayB0YWJsZSBpcyBtYWRlIG9m
IHN0cnVjdCBqaDcxeDBfY3JnX2Nsa19kYXRhIGVudHJpZXMsIHdoZXJlDQo+ID4gZWFjaCBwYXJl
bnQgaXMgZGVzY3JpYmVkIGJ5IGEgc3RydWN0IGpoNzF4MF9wYXJlbnRfZGF0YTogZWl0aGVyIHRo
ZQ0KPiA+IG5hbWUgb2YgYW4gZXh0ZXJuYWwgY2xvY2sgb3IgdGhlIGluZGV4IG9mIGFub3RoZXIg
Y2xvY2sgb2YgdGhlIENSRy4NCj4gPiBUaGlzIHdheSB0aGUgZXh0ZXJuYWwgY2xvY2tzIG5lZWQg
bm8gaW5kZXggb2YgdGhlaXIgb3duLCBhbmQgdGhlDQo+ID4gbnVtYmVyIG9mIGNsb2NrcyBhIENS
RyBjYW4gcHJvdmlkZSBpcyBub3QgbGltaXRlZCBieSB0aGUgd2lkdGggb2YgYQ0KPiA+IHBhcmVu
dCBpbmRleC4gVGhlIGV4aXN0aW5nIEpINzFYMF9HQVRFKCksIEpINzFYMF9fRElWKCksIC4uLiBt
YWNyb3MNCj4gPiBjYW4gYmUgdXNlZCB0byBmaWxsIHRoZSB0YWJsZS4NCj4gPg0KPiA+IFRoZSBK
SDcxMDAgYW5kIEpINzExMCBkcml2ZXJzIGtlZXAgdGhlaXIgb3duIHByb2JlIGZ1bmN0aW9ucyBh
bmQgdGhlDQo+ID4gaW5kZXggYmFzZWQgc3RydWN0IGpoNzF4MF9jbGtfZGF0YSBmb3Igbm93Lg0K
PiANCj4gSSB0cnVzdCB5b3UnbGwgZm9sbG93IHVwIG9uIHRoaXMuDQoNCk9LLg0KDQpCZXN0IFJl
Z2FyZHMsDQpDaGFuZ2h1YW5nDQoNCg==
