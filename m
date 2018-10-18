Return-Path: <SRS0=Y0Ip=M6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82A8EC5ACCC
	for <linux-clk@archiver.kernel.org>; Thu, 18 Oct 2018 18:13:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 40E25204FD
	for <linux-clk@archiver.kernel.org>; Thu, 18 Oct 2018 18:13:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="HPN2Bf50"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40E25204FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727745AbeJSCPx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Oct 2018 22:15:53 -0400
Received: from mail-ve1eur01on0068.outbound.protection.outlook.com ([104.47.1.68]:25600
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728499AbeJSCPw (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 18 Oct 2018 22:15:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZO6ZgT1mWeU1ukT98K6NgoR7if+huVQ2+GPKGYEaSpQ=;
 b=HPN2Bf50ZzRMo+6vXYvB1hGrFLsPIyTDAE+r5zI6AtsUS4iBqdvh+9vFC6yOZ7eRctmeaAnHynrz0SDlyl/H6yYyGY9G9E6StJ29QUhfjfw8m9YiwtUQ+RQAQR9xATUblTXDAIIkJkG8LsFCYXOqWIJTfUVlyZ6VLY6Q5vKfO6s=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB5122.eurprd04.prod.outlook.com (20.177.40.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1250.21; Thu, 18 Oct 2018 18:13:39 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1%3]) with mapi id 15.20.1228.033; Thu, 18 Oct 2018
 18:13:39 +0000
From:   "A.s. Dong" <aisheng.dong@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH V5 9/9] clk: imx: add imx8qxp clk driver
Thread-Topic: [PATCH V5 9/9] clk: imx: add imx8qxp clk driver
Thread-Index: AQHUZwMzoA17UBIsSkGVKzG2jHXioaUlRLCAgAAIYRA=
Date:   Thu, 18 Oct 2018 18:13:39 +0000
Message-ID: <AM0PR04MB42112CB1324B0994A26AB15D80F80@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1539881347-20871-1-git-send-email-aisheng.dong@nxp.com>
 <1539881347-20871-10-git-send-email-aisheng.dong@nxp.com>
 <153988429912.5275.13469659599335212731@swboyd.mtv.corp.google.com>
In-Reply-To: <153988429912.5275.13469659599335212731@swboyd.mtv.corp.google.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB5122;6:sei2CaupZbMoPL0dM4ipoRNjSEFeDnYWJrqsAFp1W2hmML9ET2UbvFph8oHIIHt9Juh56n9s5nyV0Mfm307I59uQUBI7QZ3il1C/20W+DCXHmEkI0ByBnuBeUuAc6RFyKU3VF88tVChKJANKyBXhQGelFq/h+l82Wk4JhmxPx6PooJZYDCwGp6cv4RsWYrxmSTMSMloIGjZSscZt7L13Uh0SG6BdCDQDSRwoNbtdrDtIPx0UAlw2NtVaArsmWQ54rC4KrstfIRB54cBQNC2cFqjYPlmVjNQUSdDDeLpjUrdAPcCQ12EO8Ix/xMj9KRN0LKYAGdxRLvq947Y++OryHGBTtaNv2mnCN/XQ6Sw5w7rVWKL3m6ty6No/bI8HZkPktVqFCdlG9T/5Q7S5aNJgaLfMhzAqqTD8bg2GPwQxvKovCsCdpiri/UHndJE946i99G8ixmKW9hi0QyUuqdyyrw==;5:baf1eVdaWxYe7kIs+YfEFkKB8CLjDrvfr3bXcdaxXw+We2+5UoAKmclFK6nmlGX4KbQ3LKQZPIef+tKGKUFvz2iEB794As5BNS1AOjiH9y9InCqXcfsTEG+81Kpx/0FTNIHmknkOnqRFJL1impdLaxglcEhYmOeEbMYDDPx8L2g=;7:jPuaXAqQY8I1Z11txBYvexRPfNVuPUt8lyScgrS8NcwvVjoWP9ktNn69bszkMBYrYtMgz5FCFoTzx0Vr6IkPa2rUabnH3kj+WKBnkNEez2f0y2o8T3vnkzNlRFRSnPU44t9xwt0OgrS9xFoZlWMOPaibgcg6iHumtQtH54M5bYWZq2tZq2RyyrSQ1XxDPucjDKU9+9/qeFDTl8WTHw1BQDMcOPpQb/UHMojLQwJ/KftREWKI7JLcQjlCYsABUwiR
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 06e6484d-b563-4769-b505-08d635256dd3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB5122;
x-ms-traffictypediagnostic: AM0PR04MB5122:
x-microsoft-antispam-prvs: <AM0PR04MB5122C0B4C922B3BA8370E8F180F80@AM0PR04MB5122.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(9452136761055)(258649278758335)(185117386973197);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231355)(944501410)(52105095)(3002001)(10201501046)(93006095)(93001095)(6055026)(149066)(150057)(6041310)(20161123560045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(20161123564045)(20161123562045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB5122;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB5122;
x-forefront-prvs: 08296C9B35
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(39860400002)(136003)(346002)(396003)(366004)(13464003)(189003)(52084003)(199004)(86362001)(2501003)(8676002)(26005)(71200400001)(76176011)(7696005)(8936002)(6506007)(81156014)(5660300001)(102836004)(66066001)(53546011)(99286004)(33656002)(105586002)(71190400001)(186003)(81166006)(4326008)(508600001)(106356001)(25786009)(74316002)(54906003)(7736002)(110136005)(966005)(68736007)(14454004)(305945005)(14444005)(53936002)(97736004)(6116002)(6246003)(256004)(5250100002)(55016002)(6306002)(6436002)(9686003)(4001150100001)(3846002)(476003)(316002)(2900100001)(486006)(11346002)(2906002)(446003)(229853002)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5122;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: ozrMgkWFQzq0FHUeZt7AmnSWxU2DymSUDLWpeesEtvK/0hiQDyUlU0LMTpoZkGCziXTafJKdY9is8xFXnRigzh83Z7/V0d8DbHSez58/4+BmN14izKeLDh5mWaeM4ouDnigyZI2W0Rs7YuQ9oSLVq752WESRmT3RMbjNelM9f7qDFxTQkoD9f+PWS8DZjMiclkmi2OaSbzovjHrEZ3xToF01MtosF3pVTCuLUxQ31LdxCfHavapQ1hqGii2qJKjRS9sdAVxL+D8KZ4+jUOng622oyz4PxPqnGBGoEPYqXnp3Q2TmnAMwCDdy4BRTz1uutP3H+zw/GjDW75vDXn7LFzKal/EDy9z6A09eOMKy9hg=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06e6484d-b563-4769-b505-08d635256dd3
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2018 18:13:39.0555
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5122
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVwaGVuIEJveWQgW21haWx0
bzpzYm95ZEBrZXJuZWwub3JnXQ0KPiBTZW50OiBGcmlkYXksIE9jdG9iZXIgMTksIDIwMTggMToz
OCBBTQ0KPiBUbzogQS5zLiBEb25nIDxhaXNoZW5nLmRvbmdAbnhwLmNvbT47IGxpbnV4LWNsa0B2
Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9y
ZzsgbXR1cnF1ZXR0ZUBiYXlsaWJyZS5jb207DQo+IHNoYXduZ3VvQGtlcm5lbC5vcmc7IEZhYmlv
IEVzdGV2YW0gPGZhYmlvLmVzdGV2YW1AbnhwLmNvbT47IGRsLWxpbnV4LWlteA0KPiA8bGludXgt
aW14QG54cC5jb20+OyBrZXJuZWxAcGVuZ3V0cm9uaXguZGU7IEEucy4gRG9uZw0KPiA8YWlzaGVu
Zy5kb25nQG54cC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggVjUgOS85XSBjbGs6IGlteDog
YWRkIGlteDhxeHAgY2xrIGRyaXZlcg0KPiANCj4gUXVvdGluZyBBLnMuIERvbmcgKDIwMTgtMTAt
MTggMDk6NTQ6MTUpDQo+ID4gKw0KPiA+ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svaW14
OHF4cC1jbG9jay5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvY2xrLmg+DQo+ID4gKyNpbmNsdWRl
IDxsaW51eC9lcnIuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L2lvLmg+DQo+ID4gKyNpbmNsdWRl
IDxsaW51eC9vZi5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvb2ZfYWRkcmVzcy5oPg0KPiA+ICsj
aW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9z
bGFiLmg+DQo+ID4gKw0KPiA+ICsjaW5jbHVkZSA8c29jL2lteC9pbXg4cXhwL2xwY2cuaD4NCj4g
PiArDQo+ID4gKyNpbmNsdWRlICJjbGstc2N1LmgiDQo+ID4gKw0KPiA+ICtzdGF0aWMgc3RydWN0
IGNsa19od19vbmVjZWxsX2RhdGEgKmlteDhxeHBfY2xrX2RhdGE7DQo+ID4gKw0KPiA+ICtzdGF0
aWMgY29uc3QgY2hhciAqIGNvbnN0IGVuZXRfc2Vsc1tdID0geyAiZW5ldF8yNU1IeiIsDQo+ID4g
KyJlbmV0XzEyNU1IeiIsIH07IHN0YXRpYyBjb25zdCBjaGFyICogY29uc3QgZW5ldDBfcm1paV90
eF9zZWxzW10gPSB7DQo+ID4gKyJlbmV0MF9yZWZfZGl2IiwgImR1bW15IiwgfTsgc3RhdGljIGNv
bnN0IGNoYXIgKiBjb25zdA0KPiA+ICtlbmV0MV9ybWlpX3R4X3NlbHNbXSA9IHsgImVuZXQxX3Jl
Zl9kaXYiLCAiZHVtbXkiLCB9Ow0KPiA+ICsNCj4gPiArc3RhdGljIGludCBpbXg4cXhwX2Nsa19w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KSB7DQo+ID4gKyAgICAgICBzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKmNjbV9ub2RlID0gcGRldi0+ZGV2Lm9mX25vZGU7DQo+IA0KPiBXaGVyZSdz
IHRoZSBEVCBiaW5kaW5nIGZvciB0aGlzIGRldmljZT8NCg0KU29ycnkgZm9yIG1pc3NlZCB0byBt
ZW50aW9uIHRoaXMuDQpJdCdzIGJlZW4gbWVyZ2VkIGludG8gc2N1IGJpbmRpbmcgZG9jIHBlciBS
b2IncyByZXF1ZXN0IHdoaWNoIGhhcyBhbHJlYWR5DQpiZWVuIGluIFNoYXduJ3MgdHJlZS4NCg0K
UGxlYXNlIHRha2UgYSBsb29rIGF0IGhlcmU6DQpodHRwczovL3BhdGNod29yay5rZXJuZWwub3Jn
L3BhdGNoLzEwNjI5NjIzLw0KDQpSZWdhcmRzDQpEb25nIEFpc2hlbmcNCg0KPiANCj4gPiArICAg
ICAgIHN0cnVjdCBjbGtfaHcgKipjbGtzOw0KPiA+ICsgICAgICAgaW50IHJldCwgaTsNCj4gPiAr
DQo+ID4gKyAgICAgICByZXQgPSBpbXhfY2xrX3NjdV9pbml0KCk7DQo=
