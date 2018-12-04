Return-Path: <SRS0=3Y/e=ON=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D19A5C04EBF
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 01:53:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8C45F20850
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 01:53:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="pAiS25Nf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C45F20850
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725940AbeLDBxn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Dec 2018 20:53:43 -0500
Received: from mail-eopbgr00044.outbound.protection.outlook.com ([40.107.0.44]:36065
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725947AbeLDBxn (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 3 Dec 2018 20:53:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/y0uyFptNbUHRIVDSJhISjL/4/7kUDXxZNAepkrL0Cc=;
 b=pAiS25NfgseOstzPHYbEnb/8uCcLg1ZPy37DeJLTR2INcWbTjlJwKfJNDSVuBaz+9JtOjXE03nDmVAfP3jLCa+O46/KojsYwZrCOVhNkSee0CzXWdBZdpBQpULIAUIiYVL9Q+PyfprxSTWgwzKSILszUnlG55UdAmhGCSXCyxWc=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4035.eurprd04.prod.outlook.com (52.134.125.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1382.18; Tue, 4 Dec 2018 01:53:39 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927%2]) with mapi id 15.20.1382.020; Tue, 4 Dec 2018
 01:53:39 +0000
From:   Aisheng DONG <aisheng.dong@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH V8 0/7] clk: imx: add imx8qxp clock support
Thread-Topic: [PATCH V8 0/7] clk: imx: add imx8qxp clock support
Thread-Index: AQHUgaQ07UOrlEn65UOyxxVfjCE+w6VleWoQgAfyF4CAAHjrwA==
Date:   Tue, 4 Dec 2018 01:53:39 +0000
Message-ID: <AM0PR04MB4211EC7E0BCF9AA0FCE57A2B80AF0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1542809234-539-1-git-send-email-aisheng.dong@nxp.com>
 <AM0PR04MB42110579601320F59219CB9E80D10@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <154386231357.88331.6991254616792618686@swboyd.mtv.corp.google.com>
In-Reply-To: <154386231357.88331.6991254616792618686@swboyd.mtv.corp.google.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [101.93.238.110]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4035;6:VS3doNxQyShffn4elUPBBXh3sEuDkLkNjMklaxBHqp37NeYNVczJItl5zjQ/6DUB484ymMpiC+rF4NiSTYNkGXt7fDIWpdIseFAukTZ7cf8TFdYAdV7zzbZ3Vxe5AygGWlXCnjyzeWNv50cfrYm3kZg40OjwIk9f6YB8/t7oSjd40MhR8pLbHzhRdwmbtGDvxImUHIAqOp0lxQUg5cld63HaWo203RXPZfH4M4xTGY0Bhudbn0qWkLoRGelwTK8XsCKnTxPwphzVMtiXVPlAHGUuRHOQw4rUEy+VHKFCNrf4iCBxzs/w5gVTzvtJXPQAD9vaxK7jXPvoFdaOu1roux4wYunB16Xhi16kK9j+TVcpTE7URfsTo7wU0FfPUBMnfxEsU5wRUZ/zpxgepuFf8onWxblHQoS+l94+kkxrqlJj+/IRp9p+WdYyYqpSmOhjjmYPDos/B8R2Ki4n/czD/g==;5:F7l0Fmr4a/ICIR1fWsG5/EB3YV5BS5ll/B8BmIRJoe8HqFnkn4I58E42Q98RXnL47b4ku5xBFZ1sW4YZYb/0jm2iIzUnghVlG18lLIVEJ+gB1sYoqCIt+qg/i6PesXWKYD+28blzOlm0FA3prnNMgJZA41TF1iMl7RmY3ZKpg3M=;7:J10A+Q/rEQ2JYTo9YBk4S3OpAwJ64sLfLK6QplfOhsS3EXWVWSGCQ5EoIf3I+pMeFtBdF4itPwWwvzIBSdBZxPOE2NqrlQiOfmGSzLrwIvSK+Khjh5xjDGHT2S5MU+GeE6H4IxNhUZSUM3I1trgeRQ==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 34433717-e420-4923-aae0-08d6598b5024
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4035;
x-ms-traffictypediagnostic: AM0PR04MB4035:
x-microsoft-antispam-prvs: <AM0PR04MB40354CA60E7893CC2C72E38080AF0@AM0PR04MB4035.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231455)(999002)(944501493)(52105112)(3002001)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123558120)(20161123560045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB4035;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4035;
x-forefront-prvs: 0876988AF0
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(396003)(366004)(346002)(39860400002)(376002)(199004)(189003)(69234005)(13464003)(5660300001)(8936002)(256004)(81166006)(81156014)(8676002)(97736004)(2906002)(6436002)(71200400001)(6246003)(71190400001)(229853002)(486006)(25786009)(11346002)(4001150100001)(68736007)(26005)(478600001)(186003)(102836004)(53546011)(6506007)(54906003)(316002)(55016002)(110136005)(4326008)(476003)(2501003)(7696005)(53936002)(9686003)(3846002)(6116002)(99286004)(86362001)(105586002)(106356001)(66066001)(33656002)(305945005)(7736002)(76176011)(446003)(74316002)(14454004)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4035;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: AZ92WCsHois7SF9+94M9D2aBJonNvsGcSakeLARY9cCLC2MUh0I8JCPtnjBJef1oKIHt7tkAxKV3KoH+HE1QzhXpWuTkeuxbbRW9iIx8Fd5TpyJCM/T1ihXm5JhS9ZqUFx+Yn7eJR3iwj5QTfUF6yu1sQ9909F8zi/Pf7dO/FLrYbnslT1G0cKO4ibIKU4J4v9xknASEtolifxZQK2HtIC5Hu1ArMp92DV0ACLrP8SvayGnVi2nESnEay7jfb47JxY5NN5oycxnj/MCbErVPRK7zetlc1y2M0VCCLzl9B7a1vc3n7HeYvSqn0LsetOr4qhj8HggC22bd3FmBb4dA5kW65SIuvpvzv89vAsj2lSQ=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34433717-e420-4923-aae0-08d6598b5024
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2018 01:53:39.8289
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4035
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVwaGVuIEJveWQgW21haWx0
bzpzYm95ZEBrZXJuZWwub3JnXQ0KPiBTZW50OiBUdWVzZGF5LCBEZWNlbWJlciA0LCAyMDE4IDI6
MzkgQU0NCj4gVG86IGxpbnV4LWNsa0B2Z2VyLmtlcm5lbC5vcmc7IEFpc2hlbmcgRE9ORyA8YWlz
aGVuZy5kb25nQG54cC5jb20+DQo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVh
ZC5vcmc7IG10dXJxdWV0dGVAYmF5bGlicmUuY29tOw0KPiBzaGF3bmd1b0BrZXJuZWwub3JnOyBG
YWJpbyBFc3RldmFtIDxmYWJpby5lc3RldmFtQG54cC5jb20+OyBkbC1saW51eC1pbXgNCj4gPGxp
bnV4LWlteEBueHAuY29tPjsga2VybmVsQHBlbmd1dHJvbml4LmRlDQo+IFN1YmplY3Q6IFJFOiBb
UEFUQ0ggVjggMC83XSBjbGs6IGlteDogYWRkIGlteDhxeHAgY2xvY2sgc3VwcG9ydA0KPiANCj4g
UXVvdGluZyBBaXNoZW5nIERPTkcgKDIwMTgtMTEtMjggMDk6MTg6NDcpDQo+ID4gR2VudGx5IFBp
bmcuLi4NCj4gPg0KPiANCj4gRllJLCB3aGVuIHlvdSBwaW5nIHRoZSB0aHJlYWQsIGl0IGZsb2F0
cyB0byB0aGUgZW5kIG9mIHRoZSBxdWV1ZSBmb3IgbWUsIGFuZA0KPiB0aGVuIEkgZG9uJ3QgcmV2
aWV3IGl0IGZvciBzb21lIHRpbWUuIFNvcnJ5LCB0aGlzIGlzIGhvdyBpdCBtb3N0bHkgd29ya3Mu
IFRoZQ0KPiBiaWdnZXIgdG9waWNzIGNvbWUgdG8gdGhlIGZyb250IHF1ZXVlIGFuZCB0aGVuIEkg
dHJ5IHRvIGdldCB0byB0aG9zZSBzb29uZXIgYW5kDQo+IGxldCB0aGUgc3R1ZmYgY2h1cm5pbmcg
YXMgbmV3ZXN0IGluIHRoZSBxdWV1ZSBiZWNvbWUgbG93ZXIgcHJpb3JpdHkgYmVjYXVzZQ0KPiAi
c29tZW9uZSBlbHNlIGlzIGRvaW5nIHNvbWV0aGluZyIuIEkgZG8gc3dlZXBzIG92ZXIgdGhlIG5l
dyBzdHVmZiBldmVyeSBkYXkNCj4gb3IgdHdvIHRvIHBpY2sgb3V0IHRoZSBlYXN5IG9uZSBsaW5l
cnMgYW5kIHNpbXBsZSB0aGluZ3MgYmVjYXVzZSB0aGV5IG1heSBiZQ0KPiBjcml0aWNhbCwgZXRj
Lg0KDQpJIGZ1bGx5IHVuZGVyc3Rvb2QuIFRoYW5rcyBmb3IgeW91ciBlZmZvcnQgYW5kIGhlbHAu
DQoNClJlZ2FyZHMNCkRvbmcgQWlzaGVuZw0KDQo=
