Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70AA4C433ED
	for <linux-clk@archiver.kernel.org>; Sat,  8 May 2021 00:45:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 41236611F1
	for <linux-clk@archiver.kernel.org>; Sat,  8 May 2021 00:45:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230249AbhEHAqm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 May 2021 20:46:42 -0400
Received: from mail-eopbgr20067.outbound.protection.outlook.com ([40.107.2.67]:43842
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229812AbhEHAql (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 7 May 2021 20:46:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QUegWmf9VPmjAdiwlZK5B7P5aDPXKmaP2vMGw32ZsHJ1Cf4d+sdlEVoTkvDpvZ0mKq6nKXraCcnipo3BrWAFMGzGVFQpKvrjkPCMgHTjKXCUmyGtUMR3qPkJn64Vx9webPSMVYi9oe1RXGkQsYm4o3EzFUFjzCZg7qk4sLlw5uOYtLNq6ExfuRs6jyzuq566meVN/3GbEB/Vo638/V+L8frknavkwmQ9WOYn/BmrIUo+QOcDfMeAOazh30Q4QL96rc6PWAOZpMDvNn8vqYg0McKIxgZr0dclUIL47dJqSg5IkT46PmeIQ5TbV8Ek008mY3Mb9PW87qdKtKKtj536Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=09PM0zO/daSGIO7YkI+qyleF5g72AObJNef1OKlJkxo=;
 b=EWSrU/wRAqYGe3hpkPMqHgSjrY0j7L5gnNWw21V64KbceTLvqbrCbKXYsu85HjNlhwWUT0CrEKdBldIcO8/EzrBcgAKtHXZ/sA0d1ihDo3+E/yrAFT52I8meABWQRfCkeQScbOMRsmKjKfYlLha6UDuK9IzLgnmbMdYuOFmGwKiLXxkJYctS3VDyim1U+bW45+jad9luVWBAc/ZHK7esOLxB7cuXGM3EcKkDhwhIyXpnrWnhXrr7W5ChJb6gunD4Oz95gJhfFV/Yiu22LVxDTfwB5EWH7lc3791+40kHk3Go365iSfS5PTHNOEvlAn+L4EpqIZ/vDv7D22KMCizUtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=09PM0zO/daSGIO7YkI+qyleF5g72AObJNef1OKlJkxo=;
 b=Z4PwdX72Ja590QSk98YcPunCjrCDEdfCcehZkT/F0PgB2ssIhTOcsAfKDZhDW/2uJcODH8Q9x2vDEF5KFrokDhzqjR81qX3il0sEukT2GDf7/6ifoCutbjMIG5zbT4xUlRF/nhv+Qnuhm1J3WWFXPxeqQ/JkTB7e/iARkMY1Dt4=
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com (2603:10a6:10:1ea::12)
 by DB6PR04MB3128.eurprd04.prod.outlook.com (2603:10a6:6:10::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.24; Sat, 8 May
 2021 00:45:36 +0000
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::ddbd:8680:c613:2274]) by DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::ddbd:8680:c613:2274%5]) with mapi id 15.20.4108.030; Sat, 8 May 2021
 00:45:36 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     Lucas Stach <l.stach@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>
CC:     Abel Vesa <abel.vesa@nxp.com>, dl-linux-imx <linux-imx@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "patchwork-lst@pengutronix.de" <patchwork-lst@pengutronix.de>
Subject: RE: [PATCH] clk: imx8mq: prevent sys1_pll_266m gating
Thread-Topic: [PATCH] clk: imx8mq: prevent sys1_pll_266m gating
Thread-Index: AQHXQ2PjNoBX8XCumUaYwsJMp96f9arYvWkQ
Date:   Sat, 8 May 2021 00:45:36 +0000
Message-ID: <DBBPR04MB7930F380B82AB65B81EACD9887569@DBBPR04MB7930.eurprd04.prod.outlook.com>
References: <20210507171028.157728-1-l.stach@pengutronix.de>
In-Reply-To: <20210507171028.157728-1-l.stach@pengutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c12a38e8-f2f9-4575-5bdd-08d911ba9861
x-ms-traffictypediagnostic: DB6PR04MB3128:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR04MB31285EAA6572C7B85053891B87569@DB6PR04MB3128.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L5uyTxVXRGKyFlA6RRITFi1GRZn1r1I6AixxE4hPnvSO3zMPg2EArTt8g8/SEvzt2+FaoKhtPaKttZysbffHjTq9x25AYZz24UmQCK7KxVx2YTu2qEcZIfpBRoM2DgAupYNO1MLSsn28QnCIJazqdBCh3yKOGbbZdp6pYb7+y7sk3JdQAMoW4Jzl3Kv9QmoLHFK0QU7XoukEUub2C/wy/TBn2sgExFWq5kKYDxpcTsk0M6ozpyPFIXzZFiXP4S/rtMMjRsB9Gu+Ztrqd9mbfp28RCD1bP9+99/xTdNw7MIpUjnT0SmUDmlobixyhr4pNEn5NRMk6XPdFzLLSYD8ILGo3EE6/6wYC0usOM0VkHE74/z8fUSYgnTe5WcMsBYG52b9ZOLzLxOX3qeKGp0WJh9j+WxTN0IDK0qTl/DMwOpz1Y67ITKofOTw6HUUN+VuSFj+428rpLyWrEbMlgWs0dKCFjuYgbNjzk7uCCnQYGEb3Hxm/ArIrjkRbM6ZYJr3VmAUrjwz4a23M1c1Gi133M5fjGs8n/lMPG5smavD7y11soq9muMAqYx3kJnC52Mz+AQ+ZUy1RfB2pWNF2LIi3Use78HW4IIA0DmTBLMO1S7EBSR5mCVaCc/HfYR5LafCMDV7+IIFlHpcpZlCeOG7mOw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7930.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(366004)(346002)(396003)(376002)(76116006)(83380400001)(66446008)(9686003)(6506007)(71200400001)(316002)(478600001)(66476007)(64756008)(26005)(66556008)(186003)(8676002)(4326008)(66946007)(8936002)(86362001)(110136005)(33656002)(7696005)(2906002)(122000001)(55016002)(5660300002)(54906003)(38100700002)(52536014)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: HT6CDStBjUg7J/GyYsMboKx7huMhV28SVr4lyyOcHhb1hpr2wvYKEqgXQciiNWd7S8ptEzPo+NWE/nnmLgdF+8F9Ftl5uCIUV1Qqze2B61Eukf0HBNNhl53hllTbH4IafTYiy5mGhwIWwPhbTXqGv2eOFIKk29cDyHK1tCDr1HFtrDTdjVhyezaVNkoQaxf51ieiUauBJbfFKr9t92k4M9XLEHRTxo2WYj+7ioh1gZWLfOJxVL0isug7FOWQ81huBK8xXtCxjfzuePCsAGRBBC72BP5x+LcNuYL+nzO4dCHzZPQElkSKg5jMC3duJ0l7ZFnoYO+BBbQblGyPGdcoY4VDMrUm4zxGrhq6CsZ612CwSv+Nqz4RRHU0kzUnBgSZy4qLVi0n8c0JkECo2Dc+fqtu2MoWHmkIpHTZortozFcuQAXhE/uYOv8gCd4whT5W6pigkdNSXAMA6P9S7oTfHUK6GWajGE49P9GkNkQ4+OEeyaZoWJiXZNP4FnV4KdzA76crX+0FL7uRQSuCv/yRY0S7qwI0vvAT3BSLQYxX63r96y9rmvWw4vun73S56Isn2g9mGq1iOfzmx7lgq25h5xW7nUgsSZW0pI2w/pl/joYx8BIfdKWqB8L7qigUuvX1HKVSqCP5XXprQPk0yliYPj5REB2z/h8gmXEybhMjhB9oWUAdkRfAG0iRPS9ANR6jnSNgUrBHtyfN0iOeaV5FhCIVLjN71+8ktLBrbqwbyYk=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7930.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c12a38e8-f2f9-4575-5bdd-08d911ba9861
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2021 00:45:36.6497
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eOqQ4gTTVrSLe6hG7zwCsA4bG7JHEcwO3Xo70ILezNBfj7tNMKy8a8hWuBI479qC0r5AhSU5F/CpKPugPBvXEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3128
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiBTdWJqZWN0OiBbUEFUQ0hdIGNsazogaW14OG1xOiBwcmV2ZW50IHN5czFfcGxsXzI2Nm0gZ2F0
aW5nDQo+IA0KPiBHYXRpbmcgc3lzMV9wbGxfMjY2bSB3aGlsZSB0aGUgdXNkaGNfbmFuZF9idXMg
Y2xvY2sgaXMgc3RpbGwgYWN0aXZlIChkdWUgdG8NCj4gYmVpbmcgZW5hYmxlZCBpbiB0byBib290
bG9hZGVyKSBsZWFkcyB0byBzcHVyaW91cyBmYWlsdXJlcyBvZiB0aGUgdVNESEMNCj4gbW9kdWxl
Lg0KPiANCj4gYjA0MzgzYjZhNTU4ICgiY2xrOiBpbXg4bXE6IERlZmluZSBnYXRlcyBmb3IgcGxs
MS8yIGZpeGVkIGRpdmlkZXJzIikNCj4gU2lnbmVkLW9mZi1ieTogTHVjYXMgU3RhY2ggPGwuc3Rh
Y2hAcGVuZ3V0cm9uaXguZGU+DQo+IC0tLQ0KPiBXZSBwcm9iYWJseSBuZWVkIHNvbWUgc29sdXRp
b24gdG8ga2VlcCBwYXJlbnQgY2xvY2tzIGFjdGl2ZSBvbiB0aGUgaS5NWDhNDQo+IGNsb2NrIGFy
Y2hpdGVjdHVyZSwgYXMgbG9uZyBhcyBhbnkgY29uc3VtZXJzIGFyZSBhY3RpdmUsIGFzIHRoZSBy
ZWZlcmVuY2UNCj4gbWFudWFsIHN0YXRlcyB0aGF0IGRpc2FibGluZyBhIHBhcmVudCBjbG9jayBt
YXkgbGVhZCB0byB1bmRlZmluZWQgYmVoYXZpb3IuDQoNCk5vIHN1Y2ggbGltaXRhdGlvbiwgc2hv
dWxkIGJlIERvYyBpc3N1ZS4NCg0KPiBUaGlzIG5lZWRzIG1vcmUgd29yayBpbiB0aGUgY2xvY2sg
ZnJhbWV3b3JrIGFuZC9vciBkcml2ZXIuIFRoaXMgcGF0Y2ggZml4ZXMNCj4gdGhlIG9idmlvdXMg
cmVncmVzc2lvbiB1bnRpbCB3ZSBoYXZlIHN1Y2ggYSBzb2x1dGlvbi4NCg0KUGVyc29uYWxseSwg
SSBwcmVmZXIgdG8gcmV2ZXJ0ZWQgdGhlIHdob2xlIHBhdGNoIGIwNDM4M2I2YTU1OCAoImNsazog
aW14OG1xOiBEZWZpbmUgZ2F0ZXMgZm9yIHBsbDEvMiBmaXhlZCBkaXZpZGVycyIpLg0KQXMgaW5z
dGFuY2luZyB0aG9zZSBnYXRlcyBpbmNyZWFzaW5nIHRoZSBjb21wbGV4aXR5IG9mIEFNUCBzeXN0
ZW0gY2xvY2sgbWFuYWdlbWVudCwgbm8gb3RoZXIgb2J2aW91cyBiZW5lZml0Lg0KDQpCUg0KSmFj
a3kgQmFpDQoNCj4gLS0tDQo+ICBkcml2ZXJzL2Nsay9pbXgvY2xrLWlteDhtcS5jIHwgMyArLS0N
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9pbXgvY2xrLWlteDhtcS5jIGIvZHJpdmVycy9jbGsv
aW14L2Nsay1pbXg4bXEuYw0KPiBpbmRleCA0ZGQ0YWU5ZDAyMmIuLmZjZTk4M2FkZDFmYyAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9jbGsvaW14L2Nsay1pbXg4bXEuYw0KPiArKysgYi9kcml2ZXJz
L2Nsay9pbXgvY2xrLWlteDhtcS5jDQo+IEBAIC0zNzIsNyArMzcyLDYgQEAgc3RhdGljIGludCBp
bXg4bXFfY2xvY2tzX3Byb2JlKHN0cnVjdA0KPiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAJ
aHdzW0lNWDhNUV9TWVMxX1BMTF8xMzNNX0NHXSA9DQo+IGlteF9jbGtfaHdfZ2F0ZSgic3lzMV9w
bGxfMTMzbV9jZyIsICJzeXMxX3BsbF9vdXQiLCBiYXNlICsgMHgzMCwgMTUpOw0KPiAgCWh3c1tJ
TVg4TVFfU1lTMV9QTExfMTYwTV9DR10gPQ0KPiBpbXhfY2xrX2h3X2dhdGUoInN5czFfcGxsXzE2
MG1fY2ciLCAic3lzMV9wbGxfb3V0IiwgYmFzZSArIDB4MzAsIDE3KTsNCj4gIAlod3NbSU1YOE1R
X1NZUzFfUExMXzIwME1fQ0ddID0NCj4gaW14X2Nsa19od19nYXRlKCJzeXMxX3BsbF8yMDBtX2Nn
IiwgInN5czFfcGxsX291dCIsIGJhc2UgKyAweDMwLCAxOSk7DQo+IC0JaHdzW0lNWDhNUV9TWVMx
X1BMTF8yNjZNX0NHXSA9DQo+IGlteF9jbGtfaHdfZ2F0ZSgic3lzMV9wbGxfMjY2bV9jZyIsICJz
eXMxX3BsbF9vdXQiLCBiYXNlICsgMHgzMCwgMjEpOw0KPiAgCWh3c1tJTVg4TVFfU1lTMV9QTExf
NDAwTV9DR10gPQ0KPiBpbXhfY2xrX2h3X2dhdGUoInN5czFfcGxsXzQwMG1fY2ciLCAic3lzMV9w
bGxfb3V0IiwgYmFzZSArIDB4MzAsIDIzKTsNCj4gIAlod3NbSU1YOE1RX1NZUzFfUExMXzgwME1f
Q0ddID0NCj4gaW14X2Nsa19od19nYXRlKCJzeXMxX3BsbF84MDBtX2NnIiwgInN5czFfcGxsX291
dCIsIGJhc2UgKyAweDMwLCAyNSk7DQo+IA0KPiBAQCAtMzgyLDcgKzM4MSw3IEBAIHN0YXRpYyBp
bnQgaW14OG1xX2Nsb2Nrc19wcm9iZShzdHJ1Y3QNCj4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0K
PiAgCWh3c1tJTVg4TVFfU1lTMV9QTExfMTMzTV0gPQ0KPiBpbXhfY2xrX2h3X2ZpeGVkX2ZhY3Rv
cigic3lzMV9wbGxfMTMzbSIsICJzeXMxX3BsbF8xMzNtX2NnIiwgMSwgNik7DQo+ICAJaHdzW0lN
WDhNUV9TWVMxX1BMTF8xNjBNXSA9DQo+IGlteF9jbGtfaHdfZml4ZWRfZmFjdG9yKCJzeXMxX3Bs
bF8xNjBtIiwgInN5czFfcGxsXzE2MG1fY2ciLCAxLCA1KTsNCj4gIAlod3NbSU1YOE1RX1NZUzFf
UExMXzIwME1dID0NCj4gaW14X2Nsa19od19maXhlZF9mYWN0b3IoInN5czFfcGxsXzIwMG0iLCAi
c3lzMV9wbGxfMjAwbV9jZyIsIDEsIDQpOw0KPiAtCWh3c1tJTVg4TVFfU1lTMV9QTExfMjY2TV0g
PQ0KPiBpbXhfY2xrX2h3X2ZpeGVkX2ZhY3Rvcigic3lzMV9wbGxfMjY2bSIsICJzeXMxX3BsbF8y
NjZtX2NnIiwgMSwgMyk7DQo+ICsJaHdzW0lNWDhNUV9TWVMxX1BMTF8yNjZNXSA9DQo+IGlteF9j
bGtfaHdfZml4ZWRfZmFjdG9yKCJzeXMxX3BsbF8yNjZtIiwNCj4gKyJzeXMxX3BsbF9vdXQiLCAx
LCAzKTsNCj4gIAlod3NbSU1YOE1RX1NZUzFfUExMXzQwME1dID0NCj4gaW14X2Nsa19od19maXhl
ZF9mYWN0b3IoInN5czFfcGxsXzQwMG0iLCAic3lzMV9wbGxfNDAwbV9jZyIsIDEsIDIpOw0KPiAg
CWh3c1tJTVg4TVFfU1lTMV9QTExfODAwTV0gPQ0KPiBpbXhfY2xrX2h3X2ZpeGVkX2ZhY3Rvcigi
c3lzMV9wbGxfODAwbSIsICJzeXMxX3BsbF84MDBtX2NnIiwgMSwgMSk7DQo+IA0KPiAtLQ0KPiAy
LjI5LjINCg0K
