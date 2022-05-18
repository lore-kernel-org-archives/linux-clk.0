Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA14DC433F5
	for <linux-clk@archiver.kernel.org>; Wed, 18 May 2022 19:05:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241750AbiERTFb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 May 2022 15:05:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241749AbiERTF3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 May 2022 15:05:29 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2104.outbound.protection.outlook.com [40.107.113.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6526F3DDC2
        for <linux-clk@vger.kernel.org>; Wed, 18 May 2022 12:05:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fWtoPVUE+39aDpoi8R8UB6zJYDZ88xO3sOmfa361xrY0FKMdN0fq1rF3L3xcDIi7uK6TwIkNYxXHJYaUeI9DHyqZxc4GLj5g6Gv/UfpVQegO7IOBUpFvXbi16auRYdWX0RvzYzxZenRG+E+elxjqVZcvBBuGHCkU5nSRXp0EbWNbUwdhfsFLC8Rj73jzUv9NGz34ZVlleDJ0SS91kPit8RraUylcueUvMTOU7a2bkSc/8UXjR6bMqZZByUAGpq9uo3NLvRzionDO2HNsF1k8lP+ttZ0suasKrPzDVFYFirIpq3/Gie6aqzc7Ti5U2vxmhJQDr/VBdZ0GYb9zxCWXmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tVrZUI4dFazHlUR+5H9yZhna6HF0bdc5vJqOk88u2Cc=;
 b=gM2CbwTz9Euc4svT/6z4kjp7TuOvUYcmFC0LcbGUzrAzsASiV+Zm95e7S2TVBmWTa5AVjLrlAujmPCyfWpelBk2DV4Ogr3pG5fdg1xv3cTWYa4j5Ic+CDBsEyJmF/pqytGQSTJfEH5/hDpBb9jWp+Ig6hZvV8VjoXIQSFJ8tYeBO4fYjojxiP5iAnNONpFJVymp/b+dfTvpxFzB4oHwSuFsqax2HvXoxXjgpZ5ID1n926HLPyAFRF7cPFRFzPlwLzzwrHf1ojpq46SJIvNRcDtZn8lO7r7QTmYoxmun4G9+xvQSrjOhFa0nTaZEl1qXYd2SDvY6TJUfVw0wwoJ1VGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tVrZUI4dFazHlUR+5H9yZhna6HF0bdc5vJqOk88u2Cc=;
 b=UWWBmPyNWF20kiqbnDkKheeCqn3Uh9pgfnJfZhuTM1x2Wq/JnjkE912xF416qAXWysRQCjS/SToi2fw/z9nhmbjUGQjzHwqFEtNjraekkYyh6poD6u2zs2Uolg785UVdJWiHZ+ehpPvXjQOfqFKoRorksEk2Y2r9Q3w2bMr6fYQ=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by TY3PR01MB10287.jpnprd01.prod.outlook.com (2603:1096:400:1aa::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15; Wed, 18 May
 2022 19:05:25 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244%7]) with mapi id 15.20.5250.019; Wed, 18 May 2022
 19:05:25 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Julia Lawall <Julia.Lawall@inria.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>
CC:     Michael Turquette <mturquette@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "cocci@inria.fr" <cocci@inria.fr>
Subject: RE: [RFC] coccinelle: Add test for unnecessary check before calling
 clk_disable_unprepare()
Thread-Topic: [RFC] coccinelle: Add test for unnecessary check before calling
 clk_disable_unprepare()
Thread-Index: AQHYafMQ1GqDaGPIYUKMw5zLbxeQC60k948AgAAF9KA=
Date:   Wed, 18 May 2022 19:05:25 +0000
Message-ID: <TYYPR01MB7086FB249443BFFB382BE006F5D19@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220517133556.6934-1-phil.edworthy@renesas.com>
 <20220518183314.112E7C385A9@smtp.kernel.org>
In-Reply-To: <20220518183314.112E7C385A9@smtp.kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e9dc93a3-a123-4bec-d51b-08da39015d7d
x-ms-traffictypediagnostic: TY3PR01MB10287:EE_
x-microsoft-antispam-prvs: <TY3PR01MB10287DAAA04005371CD869551F5D19@TY3PR01MB10287.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5Ij55QiHS7np4cZ6Y5PLlVkr5Jp2CspPXe3jMGB8Ae1evJ9y0Rh2u9davJduTPlmohiv52I4BEhyxvPR1pMiJF37y4h44KqKTyZsDYdwkajDyUdNoPkuS+lfjvMqycb6wjSpa2UGoRdBExejxWKgYm83nh012F/AckV6kauZzwPlGRms81n5X26Yv7Q+n/BkXJgaFQlvTWcZDoXBlmi1D0m2syzdKuTpylYAVX10+nZ9bQt8DR3SJWFU7rBf4LIpLTnE7/gSA1skauiAzN0iihgoJ3BIuxnT75W+4RvOmFt9SeZFs6k8hjF/GMEsWrf46VFiPz+TcrzR73K13fzppaJSFaTcDNZ7pgNd6bWImPDEHUlYFrUE0pUljbhkAZPna4aCarIL0LHSlDpXMCQKe4JP8m7Oto6pTccpyxkSnQfymaEr3uArqvQKKhc3c7/juow7zBfBMg+K3khj8nIpRFX6H1lgGej095fpIgZvWBGXUVpWbSyV1960t/nYJFwiGikIu//kc2il/0Ghk87pkAnSJP38p1poMJXc/9EjzNJ7vmqbvyEAP/D3kzY3kGNqjXH/pIc/xQlCOp3EiaeoD+DPMqqp/HK7LWEGK9q4gDS8JYGfYiE2aoHCmFSI3/wIr1rhpc8tT7gVwhxTG3dPBNrT6hhCZsKOaUnWo1jIr+GbPXqAB9D+3s102Ufbpc2Puqe1xH8+OYm7oJ6iTs+q8Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(38100700002)(38070700005)(122000001)(5660300002)(52536014)(8936002)(44832011)(64756008)(55016003)(8676002)(4326008)(66446008)(66556008)(508600001)(2906002)(26005)(9686003)(53546011)(7696005)(6506007)(316002)(66946007)(76116006)(66476007)(54906003)(71200400001)(110136005)(33656002)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b1ZJS2l6NXF5RFU4SXRHS2ZQWExlOEtudEMwL0hySnhHWG15SlJYYTFZcFpy?=
 =?utf-8?B?OGdpTmgwNGo2WVlzWWE3NThiYnpQVHozM1h6ODMzV3V5WVB6dVdadkFIR01Q?=
 =?utf-8?B?NkFVYWdrYnRvOTVWR0VqanI5YURLZzlYOHgyNmhwVmVCQlRHOUJnSEVva2Zm?=
 =?utf-8?B?d1RGakwvKzd1U2hRMk00QXNLYlV3TXpMTTFZVHhNL2RNYmJEUWFOOERONUUw?=
 =?utf-8?B?ZTdSd1BLd2crVnRpQ1YrMlRBZkQ4RnhnTEhFeGlSYXJ2OG1iYjdXZ0U0KzRa?=
 =?utf-8?B?MFpndEc4Z2pzWnVKTm5ndHovVTlNdFhPMG83QVpianBkVFllcGUrVWRnZGZB?=
 =?utf-8?B?VnNzUlFDdExhQlBwa296c3lTUXpUYzRzQUtBOWJCdU5aSWlhMG45ODV3L29v?=
 =?utf-8?B?MmFka0VTenI4TVZyVDcvYktobDB4ejhOamJtbDdaM3VUZXNqYVJVaWNNZGtB?=
 =?utf-8?B?OWhhbDBzLzAzanNzeWJqSTFsYzNpelErSG1PNzkzcnNaSTYxaW0xbW5hcElH?=
 =?utf-8?B?bnZrRnppSy9ZRWNzbG93ZWs4RllERGRWejRaaDNRRWtzYkNhTk5PZGhmbWVz?=
 =?utf-8?B?dVgrV2ZOQTN4Z0x0OUZNWU1TaEdPUjlxN0U4Nm83YkkvZHdFZ3RxbldFQXNi?=
 =?utf-8?B?azRJbjJPTU9Ba0Z4ZXI0YW5nbVdhY0V0QXRNY1NmZ3lTU1JGWUtJK2RaSGNQ?=
 =?utf-8?B?bUJDWmwxUGh4emVWNFRPZTZ5blUwVklvOXo3Vlo4cHd5U2NKN1pyU2NYZ2Zi?=
 =?utf-8?B?TGYyOHVFRFp0T3FCR0tOeUZkbmhuMFhJc0RiUytxeVVWb2xBM0JieHRzVjcz?=
 =?utf-8?B?ZlI3TFJxVTc0MEQydldNOTlPNjJxdHE1VG8zTENkeFRWUHBYMngxdG5nUHJX?=
 =?utf-8?B?aUpvVzJBTXpqVmx0TEFnUzFtbWQrOG1lN2czM0o0emU4dTRTVDFHeGNqeks2?=
 =?utf-8?B?aVIvSlVJMzZhVG9ZcStQNG85VTlkcmZIOUdjUk1hT0FKVlVvQ0YyNXptcXRa?=
 =?utf-8?B?UTVjNzVaQ0pmVkFiQWF6QjNlWXZBbFBCelNLMnJmS3hqb3pTQ2M2bmg2WFlF?=
 =?utf-8?B?RnVxZmp4V1Y1a0ovMmplTXQvQ0dWQnp5bXcrUWNGSC9LRXE3L0x6MXN1Yy9C?=
 =?utf-8?B?MWhyT1YybmYvd3JQclo4OUFmR3cvNld0MURnMkJqUUdEdThPUlZQZTZvd2Vx?=
 =?utf-8?B?YUl3bnNzQXZuNDhmYTQvUEEzNHdGeCtVSUFuMVZpMEQyblZGK3pSUVg0SVR1?=
 =?utf-8?B?TlJxa0lwOEt6Q1FOTk0xZU1xNENCSzNlaDZXbkVsQ0ZJUGVZbXpteGZkdENR?=
 =?utf-8?B?aFZtdDN5ek8vM0ZVWE04VUlycjlrMmNyR2tEeWtOd3NXcFRoOTVSRmdyWkxv?=
 =?utf-8?B?VnRNeTJTRGk3NVhMQnVaTXA5THE2aklZeGxYT2MxNCt4Unk0bXBpT3p1Vmx6?=
 =?utf-8?B?UHh2ZW5UN2FqZ3RMUHZaZVU2d3lBRXhDK0ttdDJ3bDc3RmM5S0FhYzhvWW9y?=
 =?utf-8?B?YnliWlRneWtSZG14Q3laemtqZHVxcEN5ZmFBNUo3V21TRW1uMnJ2TENHTnFi?=
 =?utf-8?B?TnovaEhQdDI3VmlFSGVFU2lCV0ZwMWFhNkxWbnB2VlhyUmNYNFJNUEhZYStW?=
 =?utf-8?B?Y3N4ZmVYeU4zSnZpZEhZbU8yRnpyY2Mxcm5PWFg3NlZRMUNNeFVpaE9nR0ox?=
 =?utf-8?B?ZUxyMmZ6NmV1V0duMTd5YTFNY3ByUHNSeGovVHMzQ3hYUmVqMFFhOUN1cWx3?=
 =?utf-8?B?eVJzQzVVRUZyMmFSaGJKOW9rd0kyUy94NFhHZ01JMXRTMEluSFNCMUo2UCtJ?=
 =?utf-8?B?QThOaFpYMHVQSTV1cDZ2b3MrV2JvZmNDT0tLRWZubFJ3YTRSS2IzVENaMEF1?=
 =?utf-8?B?M042Sk5HWVhKdndIL3V2dmFzRmxtdFU4RGxTeHhzaGJiMHlNbUtmdC9DMTY4?=
 =?utf-8?B?MFBLWGQ1d2NpaVZJWUVhR05oUlRFSXJvV3JzOHM5RjNXT3kvblhtZGtOcjdR?=
 =?utf-8?B?ckJKcUxjS1JiYXg1UG9SNXJiZmltcXk4YzBVeEFEaEJBWmw1SE82cVVGbnhJ?=
 =?utf-8?B?a0h0QVl6Qlc2MGxPbnVWckRTL01WamZyR1o3VGJEZmd2Qy9iMUk2ZkR3RHJv?=
 =?utf-8?B?aU1uQkZxMnFIWXVWaG9LeGdLZUd1WEZvM0ZHVnh2emRRUFZtMWxYREh3NmU1?=
 =?utf-8?B?Q3A2ckhOTElPZUhwOGhCb21rNXZSOWN2VVJKNXdmNnhHOG9LTFlwbUU0TGlh?=
 =?utf-8?B?YVlXejY3MmN5U0UzQmhkalk3bmVXVWpUb1VpQWxweTNhTmlzbkZOM1lBMnVR?=
 =?utf-8?B?dXNvM1ZsaWljYTEyb1J1RlJTRkYrU3RJTHFMdHRQWHIwOTZ3Wm9nTXZ1TFVx?=
 =?utf-8?Q?GMyJ42mzHMkKulWc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9dc93a3-a123-4bec-d51b-08da39015d7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2022 19:05:25.2468
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +OXnBxBEL9XOhPIGG5cae+8x5Sycss0RZyC6pufhTz0q0yNn55wZPW62bdbNnTyaeKVxRZWpnr7wWES7xtrzwhp6aKlBZColNFOdhvbiPh0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10287
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SGkgU3RlcGhlbiwNCg0KT24gMTggTWF5IDIwMjIgMTk6MzMgU3RlcGhlbiBCb3lkIHdyb3RlOg0K
PiBRdW90aW5nIFBoaWwgRWR3b3J0aHkgKDIwMjItMDUtMTcgMDY6MzU6NTYpDQo+ID4gVGhlIGNs
a19kaXNhYmxlX3VucHJlcGFyZSgpIGZ1bmN0aW9uIG9ubHkgY2FsbHMgY2xrX2Rpc2FibGUoKSBh
bmQNCj4gPiBjbGtfdW5wcmVwYXJlKCkuIEJvdGggb2YgdGhlc2UgZnVuY3Rpb25zIGFscmVhZHkg
Y2hlY2sgdGhlIGNsayBwdHINCj4gPiBwYXNzZWQgaW4gdXNpbmcgdGhlIElTX0VSUl9PUl9OVUxM
IG1hY3JvLiBNYW55IGRyaXZlcnMgYWxyZWFkeSBvbWl0DQo+ID4gYW55IGNoZWNrcyBvbiB0aGUg
Y2xrIHB0ciwgc28gaXQgaXMgc2FmZSB0byBhc3N1bWUgdGhpcyBpcyB0cnVlIGZvcg0KPiA+IGFs
bCBjYWxsIHNpdGVzLg0KPiANCj4gU2tpcHBpbmcgdGhlIGNoZWNrIGZvciBOVUxMIG1ha2VzIHNl
bnNlIHRvIG1lIGJlY2F1c2UgYSBOVUxMIGNsayBwb2ludGVyDQo+IGlzIHN0aWxsIGEgdmFsaWQg
Y2xrLiBJJ20gbm90IHNvIHN1cmUgYWJvdXQgSVNfRVJSKCkgdGhvdWdoLiBEbyB0aGUNCj4gdmFy
aW91cyBpbXBsZW1lbnRhdGlvbnMgb2YgY2xrX2Rpc2FibGUoKSBhbmQgY2xrX3VucHJlcGFyZSgp
IGNoZWNrIGZvcg0KPiBJU19FUlIoKSB0aGVyZT8NCg0KY2xrX2Rpc2FibGVfdW5wcmVwYXJlKCkg
anVzdCBjYWxscyBjbGtfZGlzYWJsZSgpIGFuZCB0aGVuIGNsa191bnByZXBhcmUoKS4NClRoaXMg
Y29uc2lzdHMgb2Y6DQoNCnZvaWQgY2xrX2Rpc2FibGUoc3RydWN0IGNsayAqY2xrKQ0Kew0KCWlm
IChJU19FUlJfT1JfTlVMTChjbGspKQ0KCQlyZXR1cm47DQogICAgICAuLi4NCg0KYW5kOg0Kdm9p
ZCBjbGtfdW5wcmVwYXJlKHN0cnVjdCBjbGsgKmNsaykNCnsNCglpZiAoSVNfRVJSX09SX05VTEwo
Y2xrKSkNCgkJcmV0dXJuOw0KICAgICAgLi4uDQoNCmkuZS4gdGhlcmUgaXMgbm8gcG9pbnQgaW4g
Y2hlY2tpbmcgdGhlIGNsayBwdHIgYmVmb3JlIGNhbGxpbmcNCmNsa19kaXNhYmxlX3VucHJlcGFy
ZSgpIGxpa2UgdGhpczoNCg0KaWYgKCFjbGspDQogICAgIGNsa19kaXNhYmxlX3VucHJlcGFyZShj
bGspOw0KDQpvciBhbnkgb2YgdGhlc2UgdmFyaWF0aW9uczoNCmlmIChjbGsgIT0gTlVMTCkNCmlm
ICghSVNfRVJSKGNsaykpDQppZiAoIUlTX0VSUl9PUl9OVUxMKGNsaykpDQoNCkkndmUgaGFkIHJl
dmlldyBjb21tZW50cyBiZWZvcmUgc2F5aW5nIHRoYXQgdGhlIGNoZWNrIGlzIHVubmVjZXNzYXJ5
LCBzbw0KdGhvdWdodCBpdCB3b3VsZCBiZSBnb29kIHRvIGNhdGNoIGl0IHdpdGggY29jY2luZWxs
ZS4NCg0KVGhhbmtzDQpQaGlsDQo=
