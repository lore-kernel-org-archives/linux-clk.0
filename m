Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011051.outbound.protection.outlook.com [40.107.130.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3892C3002A9;
	Thu,  3 Sep 2026 01:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788400285; cv=fail; b=QSSIaw4lo1RG5PnwKyBabcfnG6yEjiLeH4L9kcxTFSA8m0fprgjAiTzL7lqKYYFncad/Q/AGRRTDf+WETGQDNAoDuYBQFd0+IiGEkArBzhhNf4TdKqsPt2bW5gbUZ+hkV8bCsTAvliphAPimVIF5ldaXT71rLRao5ptD2ucOhjg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788400285; c=relaxed/simple;
	bh=QC82geR/vNbJ/jdrujDet8V6VPLj9KrgCFqAwd14v3E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=miVAInoNAbVRB+69StLmBqPrerzCkwHsPRbmwlE2pkfeA8/VnMqhHML58oMDEfzqkTzj3O4JZuXRAUiU4Vd+3y+k8KqhJViWIai4QkxEU3BF1wU1ppAo0Dnbdmw0FozwgKb59re+F0yw6z09vSsqNHeL6Pi2OkkT52Ypu57hG6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VfBU0R4z; arc=fail smtp.client-ip=40.107.130.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VfBU0R4z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q57yNRo6PijE2SuI+Ksdg1ccQ0oij5528qMKfrJx/vCtrYNJuJ8dSTlfmsDAOQ8FIQ02KX907LhS7fMnpOd7SqoxxxFHGqu1Y/e9kdxELKfOeM8oW4auo3weu2VAHK7hBxUVxTBTo5PRjfEVOaG3p5OqeU75ST9Vo3qI/Qw/P1m4DWpGF9fyfZdJymp2GRFc+uRuBM7Ugk/K0vwcWtNcUVOr9gfad6xqwPb41gaN1ft2W1XtTE1eVXTv3jN4w5t6X+WS8nrgW+eOrW3lhyS10fBb0XhB1eCvgFIqWey4NpD3UApJhVWX2fXdk0Cn6kD4PwhclGz3AQD+34AGAW742A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QC82geR/vNbJ/jdrujDet8V6VPLj9KrgCFqAwd14v3E=;
 b=h75sJQYzibnso4Dheqsh4jHWIP8wOXpTOW+npE0OIDFP2ByvVCfupirSmaIm+vbmPSNhCmLz43lDR3wPBo3gtsIHpPZN9paLte1x1MZlHFxaDbrX0tGQV66aJ2DW1dnMP1MB1XYEMOL7AmcB4fXiO0746iVo3Q2lW//F2nLxcOrehXry5ZVBGhrtqF91P7l+1w/JtrOd9Ddte+BNPc+ThfldnvhqamlUrRKQLAG3qiv/wneQXPunDMTiMwd49ErfU4g0PajWAI/0JSkNKEw70O48qKo2vl+z8WAys38jrEN874rGECDufDZ3q3j5pYmtNbOB6BoSIgqiSoHINILlYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QC82geR/vNbJ/jdrujDet8V6VPLj9KrgCFqAwd14v3E=;
 b=VfBU0R4zsrqi6QsKU80Ef4pVNHo9R+gP8DPp7NEOK5g4NQH3VGdCDEyLD+Rjxlizfz42vhx7SlRH3lOLGn6ccD6iYWEYYL4DUgQw59eWIHdYY193dAkZNjZyVNp0AUUJd3mtDtrcl5mfB9lA3Ag7NBmSeRUvJxjXAoPgEpJE5mF3Es9/2x4+K50/PEyFHVl7+kKuTfNXc+FcZmzFXXjg40hgi9W3tdQ4gmH5sEKhgojP1ij7M1QjWZMD0UrkXbiPRIyIE1HRESghvMfSwMGmcjjEgdX5T0KI30KVkUa+pNNp4bEMQay7QD7pve4mqQVKUy4xsOZUt8WerbsMTVL4JA==
Received: from ZR6PR04MB375776.eurprd04.prod.outlook.com
 (2603:10a6:910:dc::10) by DBBPR04MB8044.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 01:51:19 +0000
Received: from ZR6PR04MB375776.eurprd04.prod.outlook.com
 ([fe80::b83a:a0f5:2b29:50de]) by ZR6PR04MB375776.eurprd04.prod.outlook.com
 ([fe80::b83a:a0f5:2b29:50de%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 01:51:19 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-amarula@amarulasolutions.com" <linux-amarula@amarulasolutions.com>,
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
	<jbrunet+clk@baylibre.com>, Sebin Francis <sebin.francis@ti.com>, Stephen
 Boyd <sboyd@kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>
Subject: RE: [PATCH v11 1/2] clk: validate spread spectrum configuration
Thread-Topic: [PATCH v11 1/2] clk: validate spread spectrum configuration
Thread-Index: AQHdOfGbz1IX8hNX+Um8j6JCphsXGra6+NaAgAAbCACAAQNWQA==
Date: Thu, 3 Sep 2026 01:51:19 +0000
Message-ID:
 <ZR6PR04MB375776A27E98F140534E8F7FE488B62@ZR6PR04MB375776.eurprd04.prod.outlook.com>
References: <20260901090912.585681-1-dario.binacchi@amarulasolutions.com>
 <20260901090912.585681-2-dario.binacchi@amarulasolutions.com>
 <apfgacuyUC96x44N@shlinux89>
 <CABGWkvq+Fqn2AVG3UyUVuK=styz7F5bwu9zdZtAV0HTGES6vNA@mail.gmail.com>
In-Reply-To:
 <CABGWkvq+Fqn2AVG3UyUVuK=styz7F5bwu9zdZtAV0HTGES6vNA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Enabled=True;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SetDate=2026-09-03T01:42:57.0000000Z;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Name=NXP
 Confidential;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_ContentBits=3;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZR6PR04MB375776:EE_|DBBPR04MB8044:EE_
x-ms-office365-filtering-correlation-id: 55b35d8a-d058-4566-7e2c-08df095dd948
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|23010399003|22082099003|18002099003|38070700021|4143699003|56012099006|6133799003|11063799006|5023799004|10067099003;
x-microsoft-antispam-message-info:
 NeiFFlHodXFHx/yDHCZ3FXLApQjDUnxnQFHHiX1ck2ccIbAzKOAMGAeKaRcXZGw/bsezN04E/SEGHStsbFC1QZXFtV1kCld4lehOWfVwnkAU1AeYtZ961mOeTd91i/TV3V9trlNlrfxbDVvUOoMEfo+bFG1Fg11voJ+RKtSS3lmL3dYs2KkKGAY0QtnnQC1BSEPY2Oz5F9gPw0TYnuAk0wBqFtEK7Wx0kNkQYYrfRNQeW4ebqPyLDVcimmbUc5ojyGkkjnvL8SIEMilF/c/z/aDriAs98L8Dxq0a+v6MU6siUYBHUW4sJmn18W4M5lzStQiWPwX88gLsUVE1CJYzNgvxtBaR/7jJwA9PmXtAAYinXZbgDju6hg62GRMoG+pfCoTqj0VFtCzghuUBPBrCJFikMGEKCWLyM7XNSOR/HjASE2WdlQVVk7PObzKPjZtN8UID0GrJ4RJKO9wMldfozn2yX3QKwFV17WxH+x8CEIPea6zMz4qUgYqzVcdfvc0OYZgvRPiRVCiF6Oyl6lQ+kxe+1b/05QQAs0m/Si7wkN6Ye6Gt0QDa+ylDZNrDSg/LdcaAXSXV0zYX4KS1ot/yh3LElNURwkmKSknhhDZ+PDyxPXTcukR16lTtGoBncZoxjjvzUqoQTNgSP3wbKv8LaSVLBPiGdzXFug9TVIQt2qI83EEubmoJe5/UB6Svw39pAfn1RlkLXt33M0LIhkMD3pjtZtxwLXciP1wqmXoCF2A=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR6PR04MB375776.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(23010399003)(22082099003)(18002099003)(38070700021)(4143699003)(56012099006)(6133799003)(11063799006)(5023799004)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OGpXdHNkUDh3RC9xUFhJSzVQd2JqSUIzQTg2VnYrSTN1V1pOM1Faam54RGk3?=
 =?utf-8?B?VVZ3Zy90KzZQU25xakhpRHdTbWE3cXFYMmlETGs4eVZnSGlZQklyelBiWHRn?=
 =?utf-8?B?QjlvZ2dkNlJCeEZLQk4rdVc0TElwSTc1bU5RdEZVZHI0VjVmdUZDYXFMOXVB?=
 =?utf-8?B?SkpDSEZxSXNmTUJXMjBoenRIVVNuU3hOYTFIVndHdzFwbDZuWkZIR0lrb0dz?=
 =?utf-8?B?T09tbkFyMzdFSVMvbXNiVU1zWGFqaDdlV0VjS2grL1d6Q25BbFY0QytaTy8r?=
 =?utf-8?B?T2ViaEFHaXhzRGJwQXdLY3c3NklkTC9YNjhCdzh5dHJ0T3JrUUtxKzZOZWsx?=
 =?utf-8?B?Y3c1NFg3MlRMRjZ5VEszeWNLakVsMmtONjRHMXJYZDFkL1pvRTFxNU11enN1?=
 =?utf-8?B?SHJDWnJINlZvM29GdFdKOTJWMk5WaEVTWnV3aWlwOHpFVytvODBPYm5lWUVZ?=
 =?utf-8?B?MlMyRDEzemJoNXNtejNBVTlwUGM0QThVeGdIRFdRamRqaEx4cE5zcStOc2Vx?=
 =?utf-8?B?aVZTTnN0enR2dDdCa1VET2RVL2xQYnhwZ2JTMlVpWWtYQ216NTZ4OTRGdWN6?=
 =?utf-8?B?dzJtalpYK096Z29lWU1Cc01kVmUyRWR2N1k1U0lXU2pUNlNIT09lMG54RG8y?=
 =?utf-8?B?bHYvUy9QaE1xRGNVcFlYT2p6U3U3SHpzSG1BOG1LMVBQdk5peGppQjJ2TE40?=
 =?utf-8?B?TkpycEZCdlpTUmhodmxkQzk5YXJPQmRVYjdteUFHcmFMZ2J2SndQdXZkVUF2?=
 =?utf-8?B?UFNmR2tjZVlMUmZIRHlHc3FwQ0pmdU41eDRQVjVqa29WNE54bXZzSnltWm5M?=
 =?utf-8?B?U1hBT2Y0SklFbTRHeDIzT0l0NzRYT0U0NVJKZjlmbVdxeGJ6UTNSTVc2bmRO?=
 =?utf-8?B?cnNROTU2STJJQkc4TlhCQ29hSE1jM1N3dkZiYnQxZ25nN1BZUVFxTi9BVnRE?=
 =?utf-8?B?dlpXVjlkSXdGVHd1c1Z2SjgyeTg0NUptQ2k3T2pVWHZtL0NxUTB6NzJGUVNJ?=
 =?utf-8?B?MzkwQUVwY2Mwa1I2ZzRvMG5ndWZvM2dzNmlsQnFwdy9UMEczVFBPR2hMU1lO?=
 =?utf-8?B?cnBNQ01UMzVyUzIzUEFGcUNSOTd3K242Q3RsUzlhOWJDckVBbG1IZmZCMTA3?=
 =?utf-8?B?OXdaUVlmeWQ4TTNrSzRoWEJmMlpFbzRzQ1Z3QUNVOW5tUzdvN2NZclFpWXFI?=
 =?utf-8?B?Q3BmQmdSUTR1VjVXV2t5eFpORFRIamQ0OXZCd3pJTkNZMm0rc0l0K0MyRGVB?=
 =?utf-8?B?NjREOTZicW5rRWg1Rnl4VC91U05SdFR0U3E2dkk0QVFqdUxrUC80SzgyTHNm?=
 =?utf-8?B?dGdMT2FQMXdCOVBybzl5TyttUUVBWTFxWHpnUnNQdFVUSHpnRlAweGlyUnhC?=
 =?utf-8?B?clUxUWQ0Y3A5dytHczVxZnQ5c3FQTXVhd1pra1FFbDlOY2RoNXh0MWhvRXdW?=
 =?utf-8?B?MEp6RVExUUtCUW1kR1NiT2h6Yk5FN0t1czJZNXFDQmZ0U0ZmNVlaM20xYndl?=
 =?utf-8?B?SUFicGQ0cWxScGNRVlAxL0huTkErelY4MGNxZDM2SXQ2SzdkeGpocVBGTGcy?=
 =?utf-8?B?VVAxNUdyOFQ1Rmk5dkt6aVVzWDJNaUkrYVgvbzVnVUs3UnppSGlXQ3ZUdGRY?=
 =?utf-8?B?cUU1SXNGY0NoYW9TMi9qYmZsSFdidHlzc3NpRzhwdXBlU1BxekJBSGNFV1Zk?=
 =?utf-8?B?L2o1UzdhMEVVVGFwRzJLYmZvTDJtNStUK2F3WmJNMjRDRCtNUUhjbnZoQXFh?=
 =?utf-8?B?Y2w3TWo2eVFvVEJPTXNnalZTck1TYk80RjVmQ0FKWkJYUU5pTFJ0SDRraTll?=
 =?utf-8?B?QzRCb1VmQW0rN3dNa1k2SEdQcmJVQ3M4UVpLemVpWWxpQm9lUi9wYVlrU1Nj?=
 =?utf-8?B?aFJ5OVpudlRERHBsNkNHajVhQnJ6S2Q3TnpiOUp4WnlyWjBHK2VSb0tNTDNU?=
 =?utf-8?B?L0NnOHYxQXcxekQ1V2NQQlhFM0JReVdhUUhqeCsyVkc1TDFGU1pQSVhrRTk5?=
 =?utf-8?B?OUF0c2RwSFpjeVprLzhOdzE1Q2tpazY0dHFEeTZSRG1sTnEzVnBIOHpWUG1w?=
 =?utf-8?B?bVhqcTBSSFIwNkIvVmp3ZHZLWnFKbnRnN2ZSakJycGxjR0JNeGdxamVDeUNQ?=
 =?utf-8?B?dE02Z0ZqelZkY0xuSk94dWQyQjFQTzM4UlFoZ2Jpcks0bDNvWGhjV05SUnZa?=
 =?utf-8?B?RWw4UXpML2VleU81T3ZMd1k3OEY2Nm00UFFCVVFQcldIcmpUMUY5dFVjY3d1?=
 =?utf-8?B?YVFmT0FieU5WY21WSjFpRUNkNWp1eFdtVlhINlhMMW9sKzU5bFYxRXpXYStv?=
 =?utf-8?Q?/blFn2E98uFvgZp1nZ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZR6PR04MB375776.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55b35d8a-d058-4566-7e2c-08df095dd948
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2026 01:51:19.1708
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c6odDHpLITnl9Ctr2F88OSw3i6tvxnciE5IBf/HJvpsavQfyK7OGuBJdnRmbiO/XmzIzvt/zNiCpSkMsJ5sufw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8044

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYxMSAxLzJdIGNsazogdmFsaWRhdGUgc3ByZWFkIHNwZWN0
cnVtDQo+IGNvbmZpZ3VyYXRpb24NCj4NCj4gSGkgUGVuZywNCj4NCg0KTlhQIENvbmZpZGVudGlh
bA0KPiBPbiBXZWQsIFNlcCAyLCAyMDI2IGF0IDEwOjMz4oCvQU0gUGVuZyBGYW4gPHBlbmcuZmFu
QG9zcy5ueHAuY29tPg0KPiB3cm90ZToNCj4gPg0KPiA+IE9uIFR1ZSwgU2VwIDAxLCAyMDI2IGF0
IDExOjA1OjE3QU0gKzAyMDAsIERhcmlvIEJpbmFjY2hpIHdyb3RlOg0KPiA+ID5UaGUgc3ByZWFk
IHNwZWN0cnVtIGNvbmZpZ3VyYXRpb24gaXMgcGFzc2VkIHRvIHRoZSBwcm92aWRlcidzDQo+ID4g
PnNldF9zcHJlYWRfc3BlY3RydW0oKSBjYWxsYmFjayB3aXRob3V0IGFueSB2YWxpZGF0aW9uLCBh
cyBjbGstY29uZi5jDQo+ID4gPm9ubHkgc2tpcHMgYWxsLXplcm8gdHJpcGxldHMgZnJvbSAiYXNz
aWduZWQtY2xvY2stc3NjcyIuIEFuIGludmFsaWQNCj4gPiA+ZGV2aWNlIHRyZWUgY2FuIGhhbmQg
cHJvdmlkZXJzIGEgemVybyBtb2R1bGF0aW9uIGZyZXF1ZW5jeSBvciBhDQo+ID4gPnNwcmVhZCBy
YXRpbyBhYm92ZSAxMDAlLCBhbmQgZWFjaCBwcm92aWRlciB3b3VsZCBoYXZlIHRvIGFkZCB0aGUN
Cj4gc2FtZQ0KPiA+ID5jaGVja3MgdG8gcHJvdGVjdCBlLmcuIGRpdmlzaW9ucyBpbiBpdHMgcmF0
ZSBjb21wdXRhdGlvbnMuDQo+ID4gPg0KPiA+ID5GaXhlczogYzg2ODE0ZTcwMzkwICgiY2xrOiBJ
bnRyb2R1Y2UgY2xrX2h3X3NldF9zcHJlYWRfc3BlY3RydW0iKQ0KPiA+ID5TaWduZWQtb2ZmLWJ5
OiBEYXJpbyBCaW5hY2NoaQ0KPiA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+
DQo+ID4gPi0tLQ0KPiA+ID4NCj4gPiA+KG5vIGNoYW5nZXMgc2luY2UgdjEpDQo+ID4gPg0KPiA+
ID4gZHJpdmVycy9jbGsvY2xrLmMgfCAxNCArKysrKysrKysrKysrKw0KPiA+ID4gMSBmaWxlIGNo
YW5nZWQsIDE0IGluc2VydGlvbnMoKykNCj4gPiA+DQo+ID4gPmRpZmYgLS1naXQgYS9kcml2ZXJz
L2Nsay9jbGsuYyBiL2RyaXZlcnMvY2xrL2Nsay5jIGluZGV4DQo+ID4gPmZlZjg3MTY3YTYwYi4u
MjA4Y2FmNjBlZWI1IDEwMDY0NA0KPiA+ID4tLS0gYS9kcml2ZXJzL2Nsay9jbGsuYw0KPiA+ID4r
KysgYi9kcml2ZXJzL2Nsay9jbGsuYw0KPiA+ID5AQCAtMjg1MSw2ICsyODUxLDIwIEBAIGludCBj
bGtfaHdfc2V0X3NwcmVhZF9zcGVjdHJ1bShzdHJ1Y3QNCj4gY2xrX2h3ICpodywgY29uc3Qgc3Ry
dWN0IGNsa19zcHJlYWRfc3BlY3RyDQo+ID4gPiAgICAgICBpZiAoIWh3KQ0KPiA+ID4gICAgICAg
ICAgICAgICByZXR1cm4gMDsNCj4gPiA+DQo+ID4gPisgICAgICBzd2l0Y2ggKHNzX2NvbmYtPm1l
dGhvZCkgew0KPiA+ID4rICAgICAgY2FzZSBDTEtfU1BSRUFEX05POg0KPiA+ID4rICAgICAgICAg
ICAgICBicmVhazsNCj4gPiA+KyAgICAgIGNhc2UgQ0xLX1NQUkVBRF9DRU5URVI6DQo+ID4gPisg
ICAgICBjYXNlIENMS19TUFJFQURfVVA6DQo+ID4gPisgICAgICBjYXNlIENMS19TUFJFQURfRE9X
TjoNCj4gPiA+KyAgICAgICAgICAgICAgaWYgKCFzc19jb25mLT5tb2RmcmVxX2h6IHx8ICFzc19j
b25mLT5zcHJlYWRfYnAgfHwNCj4gPiA+KyAgICAgICAgICAgICAgICAgIHNzX2NvbmYtPnNwcmVh
ZF9icCA+IDEwMDAwKQ0KPiA+ID4rICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFM
Ow0KPiA+DQo+ID4gSSB0aGluayBzYXNoaWtvIGNvbW1lbnQgaXMgd3JvbmcuDQo+ID4gSW4gWzFd
LCB3ZSByZWFjaGVkIGFuIGFncmVlbWVudCB0aGF0IHNwcmVhZCAiaW4gcGVybXlyaWFkLCBpLmUu
DQo+IDAuMDElIi4NCj4gPiBTbyB0aGUgaW5wdXQgdmFsdWUgbXVzdCBiZSB0aGUgcmVhbCB2YWx1
ZSAqIDEwMDAwLCBzYXlpbmcgMC4wMSUgKg0KPiA+IDEwMDAwDQo+DQo+IFRoZSBEVCBjZWxsIGlz
IGEgdTMyIGhvbGRpbmcgdGhlIGludGVnZXIgcGVybXlyaWFkIHZhbHVlLCBpLmUuIHRoZSByYXRp
byAqDQo+IDEwMDAwIGFzIGFncmVlZCBpbiBbMV06IDElIGlzIHdyaXR0ZW4gYXMgMTAwLCAxMDAl
IGFzIDEwMDAwLg0KPiBleHRDb25maWdWYWx1ZVs3OjBdIHRha2VzIGFuIGludGVnZXIgcGVyY2Vu
dGFnZSwgc28gdGhlIGNvbnZlcnNpb24gaXMgYQ0KPiBkaXZpc2lvbiBieSAxMDAsIG5vdCBieSAx
MDAwMDoNCj4NCj4gICBkZXB0aCAgIERUIHZhbHVlICAgLyAxMDAwMCAgIC8gMTAwDQo+ICAgMC4x
JSAgICAgICAgMTAgICAgICAgICAwICAgICAgICAwDQo+ICAgMSUgICAgICAgICAxMDAgICAgICAg
ICAwICAgICAgICAxDQo+ICAgMyUgICAgICAgICAzMDAgICAgICAgICAwICAgICAgICAzDQo+ICAg
MTAwJSAgICAgMTAwMDAgICAgICAgICAxICAgICAgMTAwDQo+DQo+IFdpdGggaW50ZWdlciBhcml0
aG1ldGljIHRoZSBjdXJyZW50IGNvZGUgcHJvZ3JhbXMgMCUgZm9yIGFueSBkZXB0aA0KPiBiZWxv
dyAxMDAlLiBJIGFtIHNlbmRpbmcgdGhlIGZpeCBhcyB0aGUgZmlyc3QgcGF0Y2ggb2YgdjEyLg0K
Pg0KDQpvaywgcGxlYXNlIGluY2x1ZGUgbW9yZSBwaWVjZXMgaW4geW91ciBwYXRjaC4NCg0KVGhl
IHNwcmVhZF9icCBmaWVsZCBpcyBkb2N1bWVudGVkIGFzICJNb2R1bGF0aW9uIHBlcmNlbnQgaW4g
cGVybXlyaWFkIg0KKGluY2x1ZGUvbGludXgvY2xrLXByb3ZpZGVyLmgpLCB3aGVyZSAxIHVuaXQg
PSAwLjAxJSwgaS5lLiAxMDAwMCA9IDEwMCUuDQpTbyB0aGUgPiAxMDAwMCBjaGVjayBoZXJlIGNv
cnJlY3RseSByZWplY3RzIHNwcmVhZHMgYWJvdmUgMTAwJS4NCkFjdHVhbGx5IDEwMDAgc2hvdWxk
IGJlIGVub3VnaC4NCg0KSG93ZXZlciwgdGhlIGV4aXN0aW5nIEtVbml0IHRlc3QgZGF0YSBpbiBr
dW5pdF9jbGtfYXNzaWduZWRfcmF0ZXMuaCB1c2VzOg0KDQogICNkZWZpbmUgQVNTSUdORURfU1ND
U18wX1NQUkVBRCAgICAzMDAwMCAgIC8qIDMwMCUgaW4gcGVybXlyaWFkICovDQogICNkZWZpbmUg
QVNTSUdORURfU1NDU18xX1NQUkVBRCAgICA0MDAwMCAgIC8qIDQwMCUgaW4gcGVybXlyaWFkICov
DQoNClRoZXNlIHZhbHVlcyBhcmUgYWJvdmUgMTAwMDAgYW5kIHdvdWxkIGJlIHJlamVjdGVkIGJ5
IHRoZSBuZXcNCnZhbGlkYXRpb24uIFdoZW4gY2xrX2h3X3NldF9zcHJlYWRfc3BlY3RydW0oKSBy
ZXR1cm5zIC1FSU5WQUwsIGNsay1jb25mLmMNCnByaW50cyBhbiBlcnJvciBidXQgc3dhbGxvd3Mg
aXQgKHJjID0gMCksIGFuZCB0aGUgZHVtbXkgcHJvdmlkZXIncw0Kc2V0X3NwcmVhZF9zcGVjdHJ1
bSBjYWxsYmFjayBpcyBuZXZlciBjYWxsZWQuIFNvIHRoZSB0ZXN0IGFzc2VydGlvbnMgbGlrZToN
Cg0KICBLVU5JVF9FWFBFQ1RfRVEodGVzdCwgY3R4LT5jbGswLnNzY3Muc3ByZWFkX2JwLCBBU1NJ
R05FRF9TU0NTXzBfU1BSRUFEKTsNCg0Kd2lsbCBmYWlsIGJlY2F1c2UgY3R4LT5jbGswLnNzY3Mu
c3ByZWFkX2JwIHJlbWFpbnMgYXQgaXRzIGluaXRpYWwgdmFsdWUuDQoNCkkgYmVsaWV2ZSB0aGUg
dGVzdCB2YWx1ZXMgd2VyZSBpbnRlbmRlZCB0byByZXByZXNlbnQgMyUgYW5kIDQlIHNwcmVhZA0K
KHJlYXNvbmFibGUgU1NDIHZhbHVlcyksIHdoaWNoIGluIHBlcm15cmlhZCBzaG91bGQgYmUgMzAw
IGFuZCA0MDAsDQpub3QgMzAwMDAgYW5kIDQwMDAwLg0KDQpTaW1pbGFybHksIHRoZSBkaXZpc29y
IGluIGNsay1zY21pLW9lbS5jOg0KDQogIHZhbCA9IEZJRUxEX1BSRVAoLi4uLCBzc19jb25mLT5z
cHJlYWRfYnAgLyAxMDAwMCk7DQoNCnNob3VsZCBiZSAvIDEwLiAgPT0+IEhlcmUgbm90IC8gMTAw
LCBiZWNhdXNlIGkuTVgNCnVzZSAxMCBhcyAlMSBpbiBTQ01JIGZpcm13YXJlLg0KDQpUaGUgc2tp
cCB0ZXN0IGRhdGEgYWxzbyBoYXMgdGhlIHNhbWUgaXNzdWU6DQoNCiAgLnNzY3MgPSB7NTAwMDAs
IDYwMDAwLCAzfSwNCg0Kd2hlcmUgNjAwMDAgc2hvdWxkIGJlIDYwMCAoNiUpIGluIHBlcm15cmlh
ZC4NCg0KQ291bGQgeW91IGZvbGQgYSBmaXggZm9yIHRoZSB0ZXN0IGRhdGEgYW5kIGNsay1zY21p
LW9lbS5jIGRpdmlzb3INCmludG8gdGhlIHNlcmllcz8gU3BlY2lmaWNhbGx5Og0KDQogIGRyaXZl
cnMvY2xrL2t1bml0X2Nsa19hc3NpZ25lZF9yYXRlcy5oOg0KICAgIEFTU0lHTkVEX1NTQ1NfMF9T
UFJFQUQ6IDMwMDAwIC0+IDMwMCAgKDMlKQ0KICAgIEFTU0lHTkVEX1NTQ1NfMV9TUFJFQUQ6IDQw
MDAwIC0+IDQwMCAgKDQlKQ0KDQogIGRyaXZlcnMvY2xrL2Nsa190ZXN0LmM6DQogICAgLnNzY3Mg
PSB7NTAwMDAsIDYwMDAwLCAzfSAtPiB7NTAwMDAsIDYwMCwgM30gIChhbGwgc2l4IGluc3RhbmNl
cykNCg0KICBkcml2ZXJzL2Nsay9jbGstc2NtaS1vZW0uYzoNCiAgICBzc19jb25mLT5zcHJlYWRf
YnAgLyAxMDAwMCAtPiBzc19jb25mLT5zcHJlYWRfYnAgLyAxMA0KDQpUaGFua3MsDQpQZW5nLg0K
