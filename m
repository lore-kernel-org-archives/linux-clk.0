Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2ECBC433DB
	for <linux-clk@archiver.kernel.org>; Fri, 12 Feb 2021 05:24:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8834464E70
	for <linux-clk@archiver.kernel.org>; Fri, 12 Feb 2021 05:24:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229464AbhBLFYg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Feb 2021 00:24:36 -0500
Received: from mail-eopbgr70075.outbound.protection.outlook.com ([40.107.7.75]:28994
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229651AbhBLFY1 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 12 Feb 2021 00:24:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PGwJqSAPTiI6z0Qdqf8rWrTjxRWqG8oLCXYVCJ9udnoDVUO2NswXNvAGlnjWQZH3XjVxaIC+8ox93K7Qxm3Wbp6qZrOtP2heUqyRfDicvEsLVkWBJ1V605zPxwyhWqO8smvwId2d5ZCeTL+HIHwi+z5DDj9yt2dstUcEJDCqbpAC2DhBRMzPofbgCb6ZN6jckmKt0xPyRbwT5xEBsxfdmIhD0XSS2KKFnkKbtlqWpR6BhFIJP9N9puKoPvLnc2XdYQTBgpkrZPggke57uGIU4tyrWim3cO8O5fK4rkOaIb+8MVVhGy32iSQfFdepU2t4GlbgpBEGUzZLBbUn3sNFhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TSWs6z3GgYuTYW9cDslvKKiBSlT++JRTdKN681sdg4A=;
 b=LWsQoFztlTWQgZYwE9+f++1TEjDpyrWsa2tLy4672UkTUYbshyaWx4EjS3DB/qrtB7ZSWvN93czgcxfJNF29Slxj0TiPnjr2TEYdq6Wj/lUZNi7sRoqWtlXEfDroAyhc2CRyT9pt8rBrr2M0xfl4PVCAifRLenyNcsZ6gKqzz25RqwXWEnEvAd4bRX3L7nT8wkQ1fBVtNaJK00FoK52IxrUFnmsteOT0rlj15mqL2lrZiny3o/OpNzSxLkTtGNCZC6fQ0jLxIX/USu7nXE7Vke+pyOASyCteOoo+rBGOa+0Nl8pWt4o64gvvSQI0pwZYnSvEASkpC08Xba6ap+3xDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TSWs6z3GgYuTYW9cDslvKKiBSlT++JRTdKN681sdg4A=;
 b=mrub5foimKfc3JWIOlbUSl6CgkamDDtccBMYzNCpEmgkTV0IPE1S+mdoryIz+lVBFIW0c91G/vRylRDBQOjdkDOh0dbI9oN972JFUg8rw9+a/m1C+AMgRa519MCMqEBHMdrprLHSTS6NicMyykFFVCmO3U+i1R3NyzFGRgH5UAg=
Received: from VE1PR04MB6702.eurprd04.prod.outlook.com (2603:10a6:803:123::13)
 by VI1PR04MB6016.eurprd04.prod.outlook.com (2603:10a6:803:d3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26; Fri, 12 Feb
 2021 05:23:36 +0000
Received: from VE1PR04MB6702.eurprd04.prod.outlook.com
 ([fe80::8da8:ad8f:e241:457b]) by VE1PR04MB6702.eurprd04.prod.outlook.com
 ([fe80::8da8:ad8f:e241:457b%3]) with mapi id 15.20.3846.026; Fri, 12 Feb 2021
 05:23:36 +0000
From:   "Wasim Khan (OSS)" <wasim.khan@oss.nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>, Varun Sethi <V.Sethi@nxp.com>,
        "Wasim Khan (OSS)" <wasim.khan@oss.nxp.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>
CC:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH] clk: qoriq: use macros to generate pll_mask
Thread-Topic: [PATCH] clk: qoriq: use macros to generate pll_mask
Thread-Index: AQHW8yXtCqcwmJSgWUOmwPrlAuDJzapT+RQAgAAcFVA=
Date:   Fri, 12 Feb 2021 05:23:36 +0000
Message-ID: <VE1PR04MB6702E532A1AD82E7B93EE5E3908B9@VE1PR04MB6702.eurprd04.prod.outlook.com>
References: <20210125142513.3919014-1-wasim.khan@oss.nxp.com>
 <161310074861.1254594.15086479842768097422@swboyd.mtv.corp.google.com>
In-Reply-To: <161310074861.1254594.15086479842768097422@swboyd.mtv.corp.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [223.189.174.146]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e9dd9a70-dee0-4643-1edc-08d8cf165904
x-ms-traffictypediagnostic: VI1PR04MB6016:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB60166BCDEA2B33D49901252CD18B9@VI1PR04MB6016.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KZm0fONTPO70lybxCwOUsQUxxEhDGkYaAQR2FA40MAFiD5GpQMf18HfHXt7nxUSiuGkvM9lduVprFXhD1LJh9I7jDzAWKE/oWtqc3W4LhmTGcJf5qAnYHLkw7PIYCnVZ7/AbiqIhGl2rC9mR+CpVOrTb9dkvt8oHwXdn2Qe9aigqudYyQ44N+7A4lXQHQ7VsBPXpxOmiHl6/B/c4+omkj3EbGPb4RN5IOPDChCnPZUyF4NnmPjIbZSV2suP07IsnO1aJ/rCgpnz7uI3sZE3wG7OGIvbnAXZY7hc3a/Kf0g4t4wJLGUwUK0csgJoJgJmHRXhhO7B13NxTsGfEvukfV59hLSd3Cl4r7IcnmQD7eFXV4Jo5FTnobzWbEXwxo4tgaBRrmbSpIeB5XkzVIBuBxbLE22f1fc4mGrUlrTczz9qsEzob7xxVO4SGVxOXbENr7mPRlpza7tqidq659n2f+f1qsE0yhTMARQmeBiD9hcHbp3PZR6P2Szm18lORt0edB5WzvvBRRRoAA4NXOiwxFQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6702.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(136003)(366004)(39860400002)(5660300002)(52536014)(66476007)(64756008)(66446008)(8676002)(66946007)(66556008)(4326008)(53546011)(76116006)(8936002)(33656002)(478600001)(83380400001)(316002)(110136005)(2906002)(86362001)(7696005)(9686003)(55016002)(6506007)(71200400001)(186003)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?N015U2tVWFQ0Q0wybkpuT0NxQklwdVBhaXU2NnNER1cvU3lMc0plSEkrOXpp?=
 =?utf-8?B?bGRUaG5pckw3QXRWaDYyd2JGL1oySitySWR2NjFIMi93ZzQvbElsOXdMTXk1?=
 =?utf-8?B?OTgrL2pGeGxZejErTHBwYnY1Q0VkaGZuNXN4RVMvNmxtN052RTQwOWM1UmxD?=
 =?utf-8?B?ZENVcVhNMzlxSGk1ZHZSZ3BhMHRoWTdqYlNMZE9rSHZOclp3bk95OURESVN4?=
 =?utf-8?B?YWNDbHY2UUZRYkVSZ0tXV2wyVEEzK3JNS0ZseHAvWEI1SHQ1T0d4eGVpY1U0?=
 =?utf-8?B?c0ErQ0tpUy83bEhxWUx4NHR1RUp3NnVhNG81YUF4UzZxMGZOWDRsdW9oT01u?=
 =?utf-8?B?NFJ6andzVnRaSEVVZ1ZQdjBWeEFNaG5UUGR4ZExWdGowb1I4WUxCT3FNalpN?=
 =?utf-8?B?cGVYUHliV1JXbDB2ZTBZWHcxS2RvQXVGNEwzUVhnOE4rRlpkeGtGWGpEVnFt?=
 =?utf-8?B?ZzhOMmlMd2NwWFJULzdQYzFUekpKUmtJMDZGNUdBdG8wNUtYdXVQaEpmTk1Z?=
 =?utf-8?B?Njh1cTB3em9VL3pEU1E5dEk4RDlmbHIwM1BNc3k1ZGxJaG1tbk5UZ1pJY0Ex?=
 =?utf-8?B?alN4TkRiTkZJWmhUMUxWUlNEOVpXWERMdERRZzhZb1kydDJPendJczdxZVps?=
 =?utf-8?B?QkQxMUhGZ3loOWE5TUx0dTA2aVExL2VrWmV0SldKQXdLbFk4R3FiWTRqaXhO?=
 =?utf-8?B?REc4NG1TSmNLb1U2Ly9WYy9SSlFGTElQQXVGYW5QTHJrNFFtZENVRjNyOEsw?=
 =?utf-8?B?bjBNWXZPaUFkUmlnTVBjbllITm56KzVVWDgybDRPallvSWJIN3UyNDQ2WHlV?=
 =?utf-8?B?Y2pyVlRJK1B1RmVlZ2ppMU9BNkVUZmdPU1R1OHp2L21iQ1QxVklWeEZ0TWJa?=
 =?utf-8?B?MTRvbFhYeDRQbC8rNVREd2cwM1cxUnZ5VjFqRGMwV093cjV1UEp5aldiUlF2?=
 =?utf-8?B?TzB5VGJ0SXZML1FsODJILzdhbmtoUmhXNzRGNFJzbDBMdE0yU1NtMHg3RVVQ?=
 =?utf-8?B?TFU5K2pVenQ0VkMzMkR6QVlLUDRGZ2doT2tNckg5cVR1NzJQTWdFQkxzbnVr?=
 =?utf-8?B?eExaYTdKVDlMUEgwQTNtVHlHSDhkSTVHTE4zUmNqZGtOa2FKMTRyWkczdEZ3?=
 =?utf-8?B?OWJuZlVLOXZrbHpOclJmV09LU1J4R0dneHF0UXhjcUpXc1I3aXlWM2pUdlhh?=
 =?utf-8?B?cDBidVZuUHhqaXorVFRNcDdMa3BOd3VtWHNLRWxCM2YyaTVIR3ovYmc0YjJp?=
 =?utf-8?B?SXR2em9pRXdUMS9TWE1EVXI3QXA0NmoxS2NlRThqTDdKYW5tb0xpZWpnUHRm?=
 =?utf-8?B?b1lHWWlXbDZ0OGxxeXZucUhFWnhEc0NPbndpTHZZQnZHUW1jV1grZ20xUXVh?=
 =?utf-8?B?cVlicXVOT2JQNGZUK0dyZzNnQytQcy9TL0d0MkJ0RDg4ekJhM3BuZG45NUhE?=
 =?utf-8?B?SUlWU01yQmg0RnYxckRGcE1LVmJyZyt2MjhVV2FTaEN5L21CZHphTVJPWnRu?=
 =?utf-8?B?UVhKdmMwOU9QbVJpWTZvSjdHOUVERWhGNStrMlpXeU8vaWtqamlCbWsxQVZF?=
 =?utf-8?B?YS9YQkx4T0ZlSFhFeGVyd0xPWEFvZlc0bkdQVURnNjY5TzEzT01DanJtZ2g2?=
 =?utf-8?B?N0o4NFdtUUxOenVEUnBIZTV5ZzVKZHlPai9Ma3pFV3BIa2FWY20xTHljckxZ?=
 =?utf-8?B?cysvTkRzc281Z2NJL0creExrRlpHYmF2ZDQ0TlRRR0VDSHlYMVY5UHdJZFg2?=
 =?utf-8?Q?aixXCL6oVLQT7yH4vkympajAVryxmA2j3honkNs?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6702.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9dd9a70-dee0-4643-1edc-08d8cf165904
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2021 05:23:36.1558
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K/VeCZ46QzXkE2KkiJcAUlIG+/8tQIPEY90yFqIJqRRX3AzkJFscp6L3wJLvkWXakHKvri/lDucb9dNFQS6AZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6016
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SGkgU3RlcGhlbiwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVw
aGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgRmVicnVhcnkgMTIs
IDIwMjEgOTowMiBBTQ0KPiBUbzogVmFydW4gU2V0aGkgPFYuU2V0aGlAbnhwLmNvbT47IFdhc2lt
IEtoYW4gKE9TUykNCj4gPHdhc2ltLmtoYW5Ab3NzLm54cC5jb20+OyBtdHVycXVldHRlQGJheWxp
YnJlLmNvbQ0KPiBDYzogbGludXgtY2xrQHZnZXIua2VybmVsLm9yZzsgV2FzaW0gS2hhbiA8d2Fz
aW0ua2hhbkBueHAuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBjbGs6IHFvcmlxOiB1c2Ug
bWFjcm9zIHRvIGdlbmVyYXRlIHBsbF9tYXNrDQo+IA0KPiBRdW90aW5nIFdhc2ltIEtoYW4gKDIw
MjEtMDEtMjUgMDY6MjU6MTMpDQo+ID4gRnJvbTogV2FzaW0gS2hhbiA8d2FzaW0ua2hhbkBueHAu
Y29tPg0KPiA+DQo+ID4gVXNlIG1hY3JvcyB0byBnZW5lcmF0ZSBwbGxfbWFzayB0byBtYWtlIGNv
ZGUgbW9yZSByZWFkYWJsZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFdhc2ltIEtoYW4gPHdh
c2ltLmtoYW5AbnhwLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9jbGsvY2xrLXFvcmlxLmMg
fCA2Mg0KPiA+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tDQo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCA0MyBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkNCj4gDQo+
IFRoZSBjb2RlIGFsc28gZ290IGxvbmdlci4gV2h5IGlzIHRoaXMgYmV0dGVyPw0KDQpUaGFuayB5
b3UgZm9yIHRoZSByZXZpZXcuDQpIYXJkY29kZWQgdmFsdWVzIG9mIHBsbF9tYXNrIHdlcmUgZGlm
ZmljdWx0IHRvIHVuZGVyc3RhbmQgdGhhdCB3aGF0IGFsbCBDR3ggYW5kIFBMTHkgYXJlIHVzZWQg
Zm9yIGEgZ2l2ZW4gcGxhdGZvcm0uIA0KQWxzbyB0aGUgYml0WzRdIGNhbiBiZSAxIGZvciBDR0Ff
UExMNCBvciBDQkdfUExMMSBib3RoICwgc28gdGhlIGhhcmRjb2RlZCB2YWx1ZSBkb2VzIG5vdCB0
ZWxsIHdoaWNoIFBMTCBpcyB1c2VkIChDR0FfUExMNCAgb3IgQ0JHX1BMTDEpIGFuZCBvbmx5IHdh
eSB0byBrbm93IHRoaXMgaXMgdG8gcmVmZXIgdGhlIFNvQyByZWZlcmVuY2UgbWFudWFsLg0KVG8g
YXZvaWQgdGhpcyBhbWJpZ3VpdHksIGxldCB1cyB1c2UgQ0d4X1BMTHkgbWFjcm9zIHRvIGNsZWFy
bHkga25vdyB0aGUgY2x1c3RlciBncm91cCBwbGxzIG1hcHBpbmcgZm9yIGEgZ2l2ZW4gcGxhdGZv
cm0uDQo=
