Return-Path: <SRS0=VG/9=XE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 743C0C4740C
	for <linux-clk@archiver.kernel.org>; Mon,  9 Sep 2019 14:19:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 413D62086D
	for <linux-clk@archiver.kernel.org>; Mon,  9 Sep 2019 14:19:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="hloubgVG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732441AbfIIOT2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Sep 2019 10:19:28 -0400
Received: from mail-eopbgr40048.outbound.protection.outlook.com ([40.107.4.48]:16516
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732118AbfIIOTY (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 9 Sep 2019 10:19:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SlQcNrffZ1ee5/f/dikoqAwsI7FM3wdOBuIRofUmQjHzcfDR7ta5YPnWqueBcsddrkEJ+fiY36r6rXZbskHCVrJFhTjw8K6XBN9uZwUH+vsCuMot8sHLQhYZ6/RriPFpEVAEqBTe7aVXR7Ds/lNOv7kLALWNnYWzNenhfw//XJGkJDCw7JoS9z+du8z6DI5NCRNmxcm609FcQ1cNPf1ZG3t4z6B69o+MvnMLJbGHQzf6Yxw0RX+/bdzreqzIjrbKDf7BwTWtnYPl/Q5iEqoN7Xk7i22qWHHmwHwIlUpb6thAZ9OxWvgrSPWjFyxWg+8Bwm7KvrdDRea0U3OA/ESZbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EZCfqoilOU2Ix4sTkB2GC5Zm2E54oQLcN/LGn5jm57M=;
 b=lo9o0DL6dP/1TDv5BzlOo3a78imcljDNU0z84cXgk27x6PSzc91g0pjdY34QC4UETHVra7Jjbo+de9jA4LyaODszuQ1KZC6w6oIpl4s0nlZ/HcqGR99Yg0ZDCOuwOdza6hqSLebBwctZQAOv07OGcsfS67lbJKs+IJGl1U5rQYdUv2/mLKl1yu/QpZ8SZsSdVAW2G86ivMC6oioJyHYoPG3drcZKs1S4HvPi+5vqU/rOZxELgjx4sosIndS4MvIJpmTabqidapUjyCsuGHCHK2BsqCk/6VLyLo848eqmd90CZ1ZtDM1I/9hn57CfwRLuKkqSklH6QX6nguYLF3GVZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EZCfqoilOU2Ix4sTkB2GC5Zm2E54oQLcN/LGn5jm57M=;
 b=hloubgVG2WQELRN/tyCSUWexqlL69Cz3EqcUEVQZJBAlk4sAsd/S72UbSSe7UTgIG89PANMo6+MCocGL7uYzUzlNPBhxXO+aIpJ3mPqyF9ZFeF87iwiGvstsZyrWXd6OlJtlJO+5vrWFD23Zga2oFw8Q6vkw1TxhzWFoM2cIdO8=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.92.158) by
 AM0PR04MB4514.eurprd04.prod.outlook.com (52.135.147.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.15; Mon, 9 Sep 2019 14:19:21 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::44b4:2932:8e73:d707]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::44b4:2932:8e73:d707%7]) with mapi id 15.20.2241.018; Mon, 9 Sep 2019
 14:19:21 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Aisheng Dong <aisheng.dong@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Oliver Graute <oliver.graute@gmail.com>
Subject: RE: [PATCH V5 00/11] clk: imx8: add new clock binding for better pm
 support
Thread-Topic: [PATCH V5 00/11] clk: imx8: add new clock binding for better pm
 support
Thread-Index: AQHVZxh4CwAuQ1bbOkqOOgTWL5D2TacjZBog
Date:   Mon, 9 Sep 2019 14:19:20 +0000
Message-ID: <AM0PR04MB421173A9599B92EABC88823780B70@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1568081408-26800-1-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1568081408-26800-1-git-send-email-aisheng.dong@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 36b2e3bc-7727-4ef5-9855-08d73530b544
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:AM0PR04MB4514;
x-ms-traffictypediagnostic: AM0PR04MB4514:|AM0PR04MB4514:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB45142C74C17AAB62A8C3134C80B70@AM0PR04MB4514.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01559F388D
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(199004)(189003)(81166006)(81156014)(71200400001)(11346002)(446003)(256004)(2906002)(476003)(52536014)(66066001)(6506007)(14444005)(5024004)(229853002)(6246003)(44832011)(66946007)(66476007)(3846002)(76116006)(66556008)(66446008)(64756008)(6436002)(2501003)(7736002)(54906003)(33656002)(8676002)(186003)(14454004)(7696005)(102836004)(110136005)(71190400001)(486006)(86362001)(25786009)(316002)(55016002)(305945005)(9686003)(478600001)(53936002)(8936002)(76176011)(4326008)(74316002)(26005)(5660300002)(6116002)(99286004);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4514;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: aQjE4VJBOvkKsPFSFWE1IVlcLmPmz3TnRa3PbzoUIi6x+8iAXW+Pjx99KNJwYIOrN4jtQlhPuJDY61cm5ibfEZ7Bdxwby312J24Z62qvYZPJLo9qcdCZ8eTrCHa49nuV2iYkY1SL2CbI3ZA8Tm8ASvRqgWqCV4rDfK0vX/34zWICrh//suV+WJGVnbfLSxmsW61hjEHX8HHCklic9QAIFZoASMsfdpOkhgiyun1VKkOm+2UHvz5e3NrY4IicqoeBf22C4O8+pfaVl/nR/vN3xB0VWtxg80WUk36gDw5KiqHZq5A9aYpjUzlnC0YU86cQXuvx0RjzMC1CfPShlp+SqDS1kXPdPVjRC3iaRbXfCMwWY/7Tu6Fw4gQ738qRNwTQGNe8XFbeZ1aDXmeHR/2gL1gDCpCnyc04yEPPyyUDtR4=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36b2e3bc-7727-4ef5-9855-08d73530b544
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2019 14:19:21.0349
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RU4mpgWoGtMnYhtVZAYxwdXBkd7jXdg0MhjSeyNkE1Vo24/dvsD1UKPYOxxSR8sPcXKFks5XLVCSAdFFH0mQoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4514
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiBUaGlzIHBhdGNoIHNlcmllcyBpcyBhIHByZXBhcmF0aW9uIGZvciB0aGUgTVg4IEFyY2hpdGVj
dHVyZSBpbXByb3ZlbWVudC4NCj4gQXMgZm9yIElNWCBTQ1UgYmFzZWQgcGxhdGZvcm1zIGxpa2Ug
TVg4UU0gYW5kIE1YOFFYUCwgdGhleSBhcmUgY29tcHJpc2VkDQo+IG9mIGEgY291cGxlIG9mIFNT
KFN1YnN5c3RlbXMpIHdoaWxlIG1vc3Qgb2YgdGhlbSB3aXRoaW4gdGhlIHNhbWUgU1MgY2FuIGJl
DQo+IHNoYXJlZC4gZS5nLiBDbG9ja3MsIERldmljZXMgYW5kIGV0Yy4NCj4gDQo+IEhvd2V2ZXIs
IGN1cnJlbnQgY2xvY2sgYmluZGluZyBpcyB1c2luZyBTVyBJRHMgZm9yIGRldmljZSB0cmVlIHRv
IHVzZSB3aGljaCBjYW4NCj4gY2F1c2UgdHJvdWJsZXMgaW4gd3JpdGluZyB0aGUgY29tbW9uIDxz
b2M+LXNzLXh4LmR0c2kgZmlsZSBmb3IgZGlmZmVyZW50IFNvQ3MuDQo+IA0KPiBUaGlzIHBhdGNo
IHNlcmllcyBhaW1zIHRvIGludHJvZHVjZSBhIG5ldyBiaW5kaW5nIHdoaWNoIGlzIG1vcmUgY2xv
c2UgdG8NCj4gaGFyZHdhcmUgYW5kIHBsYXRmb3JtIGluZGVwZW5kZW50IGFuZCBjYW4gbWFrZXMg
dXMgd3JpdGUgYSBtb3JlIGdlbmVyYWwNCj4gZHJpdmVycyBmb3IgZGlmZmVyZW50IFNDVSBiYXNl
ZCBTb0NzLg0KPiANCj4gQW5vdGhlciBpbXBvcnRhbnQgdGhpbmcgaXMgdGhhdCBvbiBNWDgsIGVh
Y2ggQ2xvY2sgcmVzb3VyY2UgaXMgYXNzb2NpYXRlZCB3aXRoDQo+IGEgcG93ZXIgZG9tYWluLiBT
byB3ZSBoYXZlIHRvIGF0dGFjaCB0aGF0IGNsb2NrIGRldmljZSB0byB0aGUgcG93ZXIgZG9tYWlu
DQo+IGluIG9yZGVyIHRvIG1ha2UgaXQgd29yayBwcm9wZXJseS4gRnVydGhlciBtb3JlLCB0aGUg
Y2xvY2sgc3RhdGUgd2lsbCBiZSBsb3N0DQo+IHdoZW4gaXRzIHBvd2VyIGRvbWFpbiBpcyBjb21w
bGV0ZWx5IG9mZiBkdXJpbmcgc3VzcGVuZC9yZXN1bWUsIHNvIHdlIGFsc28NCj4gaW50cm9kdWNl
IHRoZSBjbG9jayBzdGF0ZSBzYXZlJnJlc3RvcmUgbWVjaGFuaXNtLg0KPiANCg0KRm9yIHRoaXMg
cGF0Y2ggc2VyaWVzLCBtaXNzZWQgdG8gYWRkIE9saXZlcidzIGZvcm1lciB0YWc6DQpUZXN0ZWQt
Ynk6IE9saXZlciBHcmF1dGUgPG9saXZlci5ncmF1dGVAa29jb2Nvbm5lY3Rvci5jb20+DQoNClJl
Z2FyZHMNCkFpc2hlbmcNCg==
