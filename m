Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010066.outbound.protection.outlook.com [52.101.193.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076E8223708;
	Mon, 16 Mar 2026 06:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773642972; cv=fail; b=p4ccJUZhTBqd9NMGIQKwtELvcKIdiZHkJbOq4dLQ8dGRx789I0EHXZyZG+ICYcDXrolJBefXyrPHAvUoCbP9o8SK4oWupDANe1rxGHELztCAzMFNkvKOudZjbSlOv4CPQDfEnOYnCxemG7PtqiCyLfL/gY/W5vOkP7zhdgBJ3Ps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773642972; c=relaxed/simple;
	bh=L10Wdsmo0DEYCRC8dETb0o2wdRS42Gt5q8bKZF4nfoA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iVu7ITiG2lJh+2/jjz+0iZ8eutuahX1kkfuOZbkZjUCbNRyjB8wSu1REWWFn93KOfxP/quJ4Fl55xQeOAUaSupV5pUnnG+y04H+20ZTqrxyyfEfwmYvB3/vXkodxIrOkFLNbmYwA0/2Yk24OvJPaovAu5a1gac29hzghZ8+uQEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=dDw8T/Rb; arc=fail smtp.client-ip=52.101.193.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="dDw8T/Rb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k4E1a/IWh7LdfQDeAuETjRRUHNtBKgaXvVS/aNluGogaYdmmJSpMYf5SpEgBsGEo0Mdm6rp1/4IYULAxTBcXeH4dwYKIO970ry+wXuu2yyL564lZ+VZbzcsEQc5a0EpOvMKmZXWQyndiVOiAj7wBG1Dx8Zv2nFz5+YB8/3//oepq2YlyfQhDfLHiaXBWM6i7b6O0g4qNWinM7yYdbHLfrwocu+SXcwQgwQvxgkIRMUk+/8f1CNMaH5XRUjC5x8ixVsOiq+R8T1Z09X6g+Rb/VhutIjAf202m0v5ThXvH1oeg27KkaeXL8zZIwSyDa507+nGTfDvS6N86vPYA0NAVRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L10Wdsmo0DEYCRC8dETb0o2wdRS42Gt5q8bKZF4nfoA=;
 b=CigrhzBTAIIV7evJZpJbGX6juqI0S6m8GiF6B66XrNKBkKlcUAZiRtyuY+O1X5aVVbztte0E20Kd2UcmYBBxUiejw5elmB7D87gwAdH7tHRKjs3LuhfxPxYx4EPAVkkpNOq9ZoZmAU6OlrNk5YPDJCwr4ERk7KTb9ZOxRM0bOX9Lr6szA7A9ylKXlgaj8Z9kECQRZq2KBEMYlaDYCCHiypp+VKq2/2vMeM/Cn7Ed5a3haku/Y+lcocum044XPfYTNxcgsvUElKjOUrV0EUa1IHvm9yLfTuKlvC16RwKO313+Zq2NMyLzKEyAqFLmxQWDuYLgatJ/fdUkRBQj72GVxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L10Wdsmo0DEYCRC8dETb0o2wdRS42Gt5q8bKZF4nfoA=;
 b=dDw8T/Rb+ytSWxIOioOrLwSE92lhYFWlSP3KUnjVfc9G2cQ/g5Go6LSBiW7pdxIXi15bLIBDuEx7owfYizE5dVdMps74xS2xs8NBpDl9LXHPaLlYaonG63+OBexMBo7XUkuQKWb4wL8TxAHA6/1bb3LRi/16Q93L1PibePj7kOw7sANnqJkQiB8zKwk5655bxqNQVm6puLDKCSFBESIEBrcsqQFPjT0AMMSEMnZGBxW+NVQSBJHFObUoV871+U4SlL49JssNiNFJuH8gbB1+x4uX1ahGLaFNJ2NS1luHLmiaHpt3QCvVfMN2L9LChfQj00NGVqjd+pDUigWbHJ35aw==
Received: from DM3PPF9623118BD.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f3a) by LV3PR11MB8673.namprd11.prod.outlook.com
 (2603:10b6:408:21c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.17; Mon, 16 Mar
 2026 06:36:06 +0000
Received: from DM3PPF9623118BD.namprd11.prod.outlook.com
 ([fe80::bf22:8190:4af0:3def]) by DM3PPF9623118BD.namprd11.prod.outlook.com
 ([fe80::bf22:8190:4af0:3def%6]) with mapi id 15.20.9723.004; Mon, 16 Mar 2026
 06:36:06 +0000
From: <Manikandan.M@microchip.com>
To: <conor@kernel.org>, <adrian.hunter@intel.com>
CC: <alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <Nicolas.Ferre@microchip.com>,
	<claudiu.beznea@tuxon.dev>, <linux@armlinux.org.uk>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <ardb@kernel.org>,
	<ebiggers@google.com>, <martin.petersen@oracle.com>, <tytso@mit.edu>,
	<Cristian.Birsan@microchip.com>, <jarkko.nikula@linux.intel.com>,
	<kees@kernel.org>, <npitre@baylibre.com>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v3 3/5] i3c: mipi-i3c-hci: add microchip sama7d65 SoC
 compatible with the appropriate quirk
Thread-Topic: [PATCH v3 3/5] i3c: mipi-i3c-hci: add microchip sama7d65 SoC
 compatible with the appropriate quirk
Thread-Index: AQHcsde/Oxq3mcmH9k+EacVRoLYMMLWqob+AgACMlgCABYxOAA==
Date: Mon, 16 Mar 2026 06:36:06 +0000
Message-ID: <a7cbdcdd-330a-457a-b2d9-b822bbd2d725@microchip.com>
References: <20260312042056.309237-1-manikandan.m@microchip.com>
 <20260312042056.309237-4-manikandan.m@microchip.com>
 <a41378a0-d2f1-4fa4-ac6d-1d0916590b47@intel.com>
 <20260312-ricotta-unusable-44c25a03eff8@spud>
In-Reply-To: <20260312-ricotta-unusable-44c25a03eff8@spud>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF9623118BD:EE_|LV3PR11MB8673:EE_
x-ms-office365-filtering-correlation-id: f0cb3d26-acc7-4d54-5d8d-08de83264d63
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 TSqh3YKHfWIRNBkqoFI/zJjtIH0JldRAfdhMH35qHdDfwKEwgPkAPSixa92tW9tzSXkQEFIyfEPuFF1BdiJllzs44S0lYP45Kx/eKzqua3+t6UaiQSlHMezm8+02OKSBo7/XvjMmjlLh4ceHnnDNS3Ni/Y+7bJ7uICwBYS4rQTSoGTuP1DysiB14RPUz2i5NBGt/VfcpXyDUcSD5WB6A6t8mw+2OEEPFxptSKD/iqAZwObE+IX3NpvbhKv75RCZbZWjjA45xc8bRxRreMkmFM39yP3L/Y+B9wQTfSG6+oER8TSkBN7h3tKLUt2S3/nJ1YDlJsgljhF0Lf+jNnv3lZmMenoS0QpeHTkD8hZj10XbLe6NeyuzNelTexY3E+Jj2zIpSWxuJ+hCDJn5dWupmKTs4O6uHpD9fXU+3jEVqwxws9ursVmzd2lbOqqEsXdThScRNINFJGlGE1EejSgjch5nB5aJWHNSeuqXgHAbXdmugDtlP4S5raGPcDGvLdrz2Ttq0mSJTgVrDLkrSzR3x9mO39ltc83YJPN4NOEjF34o14ZDlPgq/Dc/DpoFdQS0n9jvT+SanmjWOY+EqudpyXq0xwBYn25ksWlEWDDAFJDMgUbBARKLitJ+oWij5yDeIKtBxcY6wbZsPdW9GZXdLCgXcCgB/d9uuHd4ExcaK3DmR5WBbyrP+aFU/7zifVEHG/USn0e5w23o1AAuXazzb0i1HuAvcjPQibEbjCbLMLHP866xYtUxd6V/WdvcV7U+gNjFQJYrnSQSAC+DaFYtzKooeBsM0dPphJaaDjrqrbuU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF9623118BD.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Zk85RzdVdUZBdndkWU5kSDYwNzQ1SlB2UGJZOEZldzRtRFdDdXRuMDhXanRj?=
 =?utf-8?B?RjdqRmgrSnFreXhWQldCQlZaTUMxSUlpL3lvQ2NqajNRU05Dekp1VXl4S1gz?=
 =?utf-8?B?MjRIaHBvTU9QamFLOXU0bnljeGYySFFya1I1dDdqOVJyNzEwK01ndElxQStM?=
 =?utf-8?B?NmQ1dHRuTzQ4MUFHM25DQmxzVGZiUVJyd0ExS3MydGxxdGNtaHh0SmpQZTNt?=
 =?utf-8?B?MXBPcndKbHdwN28wdXB0Vjg2ZjlmRGZSZ0E5V2hndys1NkxvYks1QTBSUmlB?=
 =?utf-8?B?Y0ttaHF2RXU0R1FNdStkZ2JuaUY1WUpMdENkZlJXWU5hdFhQSnNzenZ2enhM?=
 =?utf-8?B?Ui9lbkpibUMzYVZIOEJTcWZqTVNIOW9GRmxlaWtkYjBpZ1ZhS0ozVXFhVXJY?=
 =?utf-8?B?UDZaeGFuMmZLVGZQcWQyOXpUOXRoWlprNkF6OUVEUlc0SEhnemkzZkVKa25a?=
 =?utf-8?B?RUlyVll3RG05MDdSK0lya1JxTXpiTCtKYm1scmgrM0tYNVkzS0NEck5aaW1Q?=
 =?utf-8?B?dVgxbWgwb0xJeThsWlM0aFBZTnRJc2ZsZis4TjdQTDlvZmlJdENWK0RVeEFl?=
 =?utf-8?B?TEdKSzFYQWZKUnVjRjMwVUFVM0lodkFhbzdnbytDdUtXTEQzcC8xb2l0bjhW?=
 =?utf-8?B?R1l2RDFTdXJyTWNnckJ1S0FydzgwYlZHelhINGlVNjRJMEdIU2EyNWw2Mno5?=
 =?utf-8?B?bkNIYi8vYmk5QnlQUVJlNGJhdFphalFoQlpVeWlsNWdqdkFrcFRoKzgwZmVW?=
 =?utf-8?B?QUZtbEZkOTVNdEpFenBZeXlnRWdUbW1PZDVpaER4UDVuVEFpZk1jQ3JVS1Z5?=
 =?utf-8?B?ODVpZHhJSHVFTEFuMW92cDJnVU9veUdGU1pwNTZ5R2g5MnUyMnJmL0hyMllk?=
 =?utf-8?B?SmlGRGVnRkdGUVhqUE5wbWMwZ3lUS3Q1Q0JmOWhrZm5neHVGWkFrcGIyMitq?=
 =?utf-8?B?QTBsTXptR29kN04rSVhHcy9tU1d2VlQxcTY2dTBWRU5nb3A1SWw2alRHa1pr?=
 =?utf-8?B?ZEVJdzl4dlQ0aHA0YU50N0YzUWZsRkRPSCs0eUMwUWwwaGRsYkowbzNaWUcy?=
 =?utf-8?B?NTRONU92djBKczVIeXhGMWpqejVxUDFtSmFHWHFtTGMydXlteDNna1E3SFJw?=
 =?utf-8?B?UEhGVzRXUk9tbnk2MFNpSktmV012aFd4akN2UXJTQWJDOWw2a3g2RUJRRkJP?=
 =?utf-8?B?cEtFdFF3eFFsdzhVcjJybkZmUHlMbjBqdEZxckZZWXFXaXJ6Y2I5bWpwTUVJ?=
 =?utf-8?B?eEhMcUY2MjB6dmtWazRkeGNtV3NxWUNsamc0c3c2Wm40ZXZCY1p6MG1Db3dx?=
 =?utf-8?B?YzZsYnByV0htYWNtNFp2c3NBemVUMm1KSndZWm1RaTZTUHZGa05pSEh1ODNh?=
 =?utf-8?B?Q3pmc1ZoS3FwZXUvcC9OcmQzMWp2YUNmc1VPRHZDOFcyMnNmcjNYYUZYWVc2?=
 =?utf-8?B?QUp5ZWIrVnBrV0hKeU9Md0ZSQnJ1Y0o1cGhqbThQYm1Ed09EOWdFOWlIcUpY?=
 =?utf-8?B?dzRtYjlnZWNhR05EU2hSL3ptbW51SERJa1hKTlBiTXNHa0ZYSnZ1bFpEOVlk?=
 =?utf-8?B?TVlOSCs4Y0EwR2hhL2JpbmlnS3FyY0taVXllbTF2RFcxek9KZmNwelBjRnVD?=
 =?utf-8?B?Ym43V2JIelVvNHhQekdFZWtDVTJxSXVGSUdjd1RlREs4QXZHUEFwZ2JLa0dP?=
 =?utf-8?B?N0ZyRkF1d2VTNVJiVmU2aXBxV1U2YjJBb1R4Zm9FWXR1UStEVFhWQ1l5TGdt?=
 =?utf-8?B?dWVNR0IveWhzN0dDYW1GYU8ybTl6clRrL0hYY1o2ZHhCZ2VpUmh4MnhOT2FL?=
 =?utf-8?B?UmZwampBQUF4MFNFdXRzMXN2NCtRUUdVSkVkb0tFYlVSYzUvQUUwZVhQelBz?=
 =?utf-8?B?cURMRi9nR2hDQm1aekVHSi94d25sbnRueE1oZHFoOWJweHZ3WnZsWTlyang3?=
 =?utf-8?B?U2ZPWWl6UGNoVlhKdWRKR29pZU1uSEhOOFZmU0l6Y2YxUnNVa00wVjVZczdN?=
 =?utf-8?B?WU9qSXZNUlZ6QktqR1BuWmlqNkNaMFo0dk9MYXhrem1yTDgwNEVyZndsemRN?=
 =?utf-8?B?TmNXelJGYjAxV2JTWkF6UjJxdHQ1L09oQUtXdXZyME1aQm9WSkZYQjkrNDJB?=
 =?utf-8?B?U1EvTmpHQjBxWDh4KzNyV0Y0KzRJODRtWTE0NFlTSmdYdHdFSDFWNktEaHg5?=
 =?utf-8?B?SFd2WkFRaUJYUzVqQ2hyamdlbkJYUW9aeGVwaWFtUTlnMEpyU20rU2E0enZo?=
 =?utf-8?B?SUk4VUZaTUVpc010bVozUDJuR2tVN01lbU5abHhzeHRuMHhQdWFoM0R4ZmQv?=
 =?utf-8?B?bi85cVpDQlQvME4xV0pOU3FXV1dXTGt5OENmdDdubm9GZ3dmUFAvZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <36F6E191ED46DD4B81892C9BB5B7B27D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF9623118BD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0cb3d26-acc7-4d54-5d8d-08de83264d63
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2026 06:36:06.3053
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eXrBqv4LdLkjP07v4FtDhkyGWb5h8f135c5Be+A+/LUXUD00sV9kaRRPByA+zo18aCPG4A8z2Rp6zv1GTYLr4+mQ/3RQJN+4PtKJ4GYgz6w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8673

T24gMTIvMDMvMjYgMTE6MjIgcG0sIENvbm9yIERvb2xleSB3cm90ZToNCj4gT24gVGh1LCBNYXIg
MTIsIDIwMjYgYXQgMTE6Mjk6MjVBTSArMDIwMCwgQWRyaWFuIEh1bnRlciB3cm90ZToNCj4+IE9u
IDEyLzAzLzIwMjYgMDY6MjAsIE1hbmlrYW5kYW4gTXVyYWxpZGhhcmFuIHdyb3RlOg0KPj4+IEFk
ZCBzdXBwb3J0IGZvciBtaWNyb2NoaXAgc2FtYTdkNjUgU29DIEkzQyBIQ0kgbWFzdGVyIG9ubHkg
SVANCj4+PiB3aXRoIGFkZGl0aW9uYWwgY2xvY2sgc3VwcG9ydCB0byBlbmFibGUgYnVsayBjbG9j
ayBhY3F1aXNpdGlvbg0KPj4+IGZvciBNaWNyb2NoaXAgcGxhdGZvcm1zIHVzaW5nIEhDSV9RVUlS
S19DTEtfU1VQUE9SVCBxdWlyay4NCj4+PiBJbnRyb2R1Y2UgTUNIUF9JM0NfQ0xLX0lEWCB0byBk
ZWZpbmUgdGhlIG1heGltdW0gcGVyaXBoZXJhbA0KPj4+IGNsb2NrIGluZGV4DQo+Pj4NCj4+PiBT
aWduZWQtb2ZmLWJ5OiBNYW5pa2FuZGFuIE11cmFsaWRoYXJhbiA8bWFuaWthbmRhbi5tQG1pY3Jv
Y2hpcC5jb20+DQo+Pj4gLS0tDQo+Pj4gQ2hhbmdlcyBpbiB2MzoNCj4+PiAtIE1ha2UgdXNlIG9m
IGV4aXN0aW5nIEhDSV9RVUlSS18qIGNvZGUgYmFzZQ0KPj4+IC0gSW50cm9kdWNlIEhDSV9RVUlS
S19DTEtfU1VQUE9SVCB0byBoYW5kbGUvZW5hYmxlIHRoZSByZXF1aXJlZCBQZXJpcGhlcmFsDQo+
Pj4gYW5kIHN5c3RlbSBnZW5lcmljIGNsayBpbiBidWxrDQo+Pj4NCj4+PiBDaGFuZ2VzIGluIHYy
Og0KPj4+IC0gUGxhdGZvcm0gc3BlY2lmaWMgY2hhbmdlcyBhcmUgaW50ZWdyYXRlZCBpbiB0aGUg
ZXhpc3RpbmcgbWlwaS1pM2MtaGNpDQo+Pj4gZHJpdmVyIGJ5IGludHJvZHVjaW5nIHNlcGFyYXRl
IE1DSFBfSENJX1FVSVJLXyogcXVpcmtzIGFuZCB2ZW5kb3INCj4+PiBzcGVjaWZpYyBxdWlyayBm
aWxlcw0KPj4+DQo+Pj4gLS0tDQo+Pj4gICBkcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNp
L2NvcmUuYyB8IDEyICsrKysrKysrKysrKw0KPj4+ICAgZHJpdmVycy9pM2MvbWFzdGVyL21pcGkt
aTNjLWhjaS9oY2kuaCAgfCAgNCArKysrDQo+Pj4gICAyIGZpbGVzIGNoYW5nZWQsIDE2IGluc2Vy
dGlvbnMoKykNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1p
M2MtaGNpL2NvcmUuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvY29yZS5jDQo+
Pj4gaW5kZXggNTg3OWJiYTc4MTY0Li42Yjc3MTZiZDUxN2UgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJp
dmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9jb3JlLmMNCj4+PiArKysgYi9kcml2ZXJzL2kz
Yy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2NvcmUuYw0KPj4+IEBAIC04LDYgKzgsNyBAQA0KPj4+ICAg
ICovDQo+Pj4gICANCj4+PiAgICNpbmNsdWRlIDxsaW51eC9iaXRmaWVsZC5oPg0KPj4+ICsjaW5j
bHVkZSA8bGludXgvY2xrLmg+DQo+Pj4gICAjaW5jbHVkZSA8bGludXgvZGV2aWNlLmg+DQo+Pj4g
ICAjaW5jbHVkZSA8bGludXgvZXJybm8uaD4NCj4+PiAgICNpbmNsdWRlIDxsaW51eC9pM2MvbWFz
dGVyLmg+DQo+Pj4gQEAgLTkxOCw2ICs5MTksNyBAQCBzdGF0aWMgaW50IGkzY19oY2lfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4+PiAgIHsNCj4+PiAgIAljb25zdCBzdHJ1
Y3QgbWlwaV9pM2NfaGNpX3BsYXRmb3JtX2RhdGEgKnBkYXRhID0gcGRldi0+ZGV2LnBsYXRmb3Jt
X2RhdGE7DQo+Pj4gICAJc3RydWN0IGkzY19oY2kgKmhjaTsNCj4+PiArCXN0cnVjdCBjbGtfYnVs
a19kYXRhICpjbGtzOw0KPj4+ICAgCWludCBpcnEsIHJldDsNCj4+PiAgIA0KPj4+ICAgCWhjaSA9
IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKmhjaSksIEdGUF9LRVJORUwpOw0KPj4+
IEBAIC05NDYsNiArOTQ4LDEzIEBAIHN0YXRpYyBpbnQgaTNjX2hjaV9wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQ0KPj4+ICAgCWlmICghaGNpLT5xdWlya3MgJiYgcGxhdGZvcm1f
Z2V0X2RldmljZV9pZChwZGV2KSkNCj4+PiAgIAkJaGNpLT5xdWlya3MgPSBwbGF0Zm9ybV9nZXRf
ZGV2aWNlX2lkKHBkZXYpLT5kcml2ZXJfZGF0YTsNCj4+PiAgIA0KPj4+ICsJaWYgKGhjaS0+cXVp
cmtzICYgSENJX1FVSVJLX0NMS19TVVBQT1JUKSB7DQo+Pj4gKwkJcmV0ID0gZGV2bV9jbGtfYnVs
a19nZXRfYWxsX2VuYWJsZWQoJnBkZXYtPmRldiwgJmNsa3MpOw0KPj4+ICsJCWlmIChyZXQgPCBN
Q0hQX0kzQ19DTEtfSURYKQ0KPj4NCj4+IElzIE1DSFBfSTNDX0NMS19JRFggcmVhbGx5IG5lZWRl
ZD8gIFdoeSBub3QganVzdDoNCj4+DQo+PiAJCWlmIChyZXQgPD0gMCkNCj4+DQo+PiBpLmUuIGRv
bid0IHlvdSBhbnl3YXkgaGF2ZSB0byBhc3N1bWUgRFQgaGFzIHRoZSBjbG9ja3MgZGVmaW5lZA0K
Pj4gY29ycmVjdGx5Lg0KPiANCj4gWWUsIEkgdGhpbmsgdGhpcyBpcyBraW5kYSBzaWxseS4gVHJ1
c3QgZHRic19jaGVjayB0byBoYXZlIHRoZSBjb3JyZWN0DQo+IG51bWJlciBmb3IgeW91ciBwbGF0
Zm9ybSBzZXQsIGFuZCBsZXQgdGhpcyBiZSBzcGVjaWZpYy4NCg0KVGhhbmsgeW91IEFkcmlhbiBh
bmQgQ29ub3INCkkgd2lsbCBkcm9wIE1DSFBfSTNDX0NMS19JRFggaW4gdGhlIG5leHQgdmVyc2lv
bi4NCg0KLS0gDQpUaGFua3MgYW5kIFJlZ2FyZHMsDQpNYW5pa2FuZGFuIE0uDQoNCg==
