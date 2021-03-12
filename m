Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4059EC4332D
	for <linux-clk@archiver.kernel.org>; Fri, 12 Mar 2021 15:40:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 252E465016
	for <linux-clk@archiver.kernel.org>; Fri, 12 Mar 2021 15:40:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232223AbhCLPjq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Mar 2021 10:39:46 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:43105 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232164AbhCLPjm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 Mar 2021 10:39:42 -0500
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12CFWqeo010837;
        Fri, 12 Mar 2021 10:39:32 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2052.outbound.protection.outlook.com [104.47.61.52])
        by mx0c-0054df01.pphosted.com with ESMTP id 375yymhgnf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 12 Mar 2021 10:39:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cxp/sd4QWTM4JyHyhhLs2N3AhyrrE08FXKU0Nx3ik+L7KMaK2aUGN3B3vprKG9Do7jlRWQKpoOJu+g4fXJULehIilmMqLVxbvZaDtrg80vyrCWxIu1tAmX2sm4Jwo+/BztLBY7WIAvzu3Tduf9uOgOqWrceLE4r1dq38a5HSxFBr+kUvGk1Gu5K3Jowtm65P11CNmL3PThh5KPhgnNLH3GUew3MunVTN56wU7rh7srLKCQETXunJ5NaDTDDGbROxiPfReKumQcZd+amtHLz7dbHznGCXu53zJYyXHmKnhD9kcBg0CqATjeITwThB740uHaeMWOI5lVUSDltaw2TPfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aisvMazx0DyBfHWbJYblDaMa+6ZcJQ8Gfq7A2JhuwG4=;
 b=iB95WyVlqDp8ilTMU48rfXG6HIsxCudRGNCuO1d50T3iFgSytvbad1hfQ/Qr7EoBGdO4ODfbxyfesD73KUq8I0Fpy3Y6tXAZuN1vWn5EFutsROqRmt8fs4MfoL/gJ5gu0x7AV25FAh12SKL60YInBzVeamrD3jHA+bZtwxIS3ljHo2QFBSQQBvp2kkG0hZ/MnmyEKzJ4299ZdWSvX39zhXyeS2o1IHVDL8tL57Ev9ijKb8pVplbJOBz6Fu4jwMQKiVz6suS+JaUzoKWgw0xxpkEmo1hugP+4N6/NAgJttj8bOat+XT5tu6jXVuXcrCBff1YAB7YCkIF7CyO8B+RuyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aisvMazx0DyBfHWbJYblDaMa+6ZcJQ8Gfq7A2JhuwG4=;
 b=wZJhSDyGia+s0NkhtYgJZYBa13fQTxXz/riexylGOp09bScOWgHfM28EFwIH5AfzNXFkG3M2oifdyMbN8SF13q+zgKvkGs5JSM4vlRO2tcPDnOD8AyQUycNfBKfI0oY0x3pE1uZuECRT7Qb/KL9UcIl2nCz03aUwja/bfYGGCJM=
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f::20)
 by YT1PR01MB4409.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26; Fri, 12 Mar
 2021 15:39:31 +0000
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb]) by YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb%7]) with mapi id 15.20.3912.031; Fri, 12 Mar 2021
 15:39:31 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     "mike.looijmans@topic.nl" <mike.looijmans@topic.nl>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 8/9] clk: si5341: Add silabs,iovdd-33 property
Thread-Topic: [PATCH 8/9] clk: si5341: Add silabs,iovdd-33 property
Thread-Index: AQHXFsVrhMk+w+ALHUepWwCk0snyX6p/6MKAgACVewA=
Date:   Fri, 12 Mar 2021 15:39:31 +0000
Message-ID: <c49900a1b9179e081be4a36e605abc61d2ac6bf7.camel@calian.com>
References: <20210311222436.3826800-1-robert.hancock@calian.com>
         <20210311222436.3826800-9-robert.hancock@calian.com>
         <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.a5c64a18-101d-4705-9716-1c41c644d43a@emailsignatures365.codetwo.com>
         <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.be185266-2f1c-4483-b746-841259f81420@emailsignatures365.codetwo.com>
         <81e8670c-d302-ff20-1767-4a6befe34a0e@topic.nl>
In-Reply-To: <81e8670c-d302-ff20-1767-4a6befe34a0e@topic.nl>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5 (3.28.5-16.el8) 
authentication-results: topic.nl; dkim=none (message not signed)
 header.d=none;topic.nl; dmarc=none action=none header.from=calian.com;
x-originating-ip: [204.83.154.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e9737bdc-b9df-443b-90e1-08d8e56d078b
x-ms-traffictypediagnostic: YT1PR01MB4409:
x-microsoft-antispam-prvs: <YT1PR01MB44096EBAFEE2DB7B4D50EC6EEC6F9@YT1PR01MB4409.CANPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0WDpVLrWHuISMSEqnxvATzl8Z1mngOOvr06NztrHiifdWQCBGv9rbxVbwV7dLqPEejHWaGbU1g9jzjQOlAepDDfpHRF6zeVuDyBfOkBOtK0jpbSMvt5aVDjsPItAF7JATmGxpMBckStcsmRjQi5Vuxs4OkEbu6Iw+Jhaz7RRhzeXswAWXU86VbmBYYhDSiy3wmTyEzI5uhhnWtZUV54s0IHU5/njfXOACvygEf5ye1LlhHbjMx4mIPJJCPhzfASwxDi5FfZNrgOSNNiQ7oc4ckMANSel7egkMQ446bCGmlRk80L3gXruZOTGjSH3FzkV9UTW+MiHsvqIeCzdscKDtNLLrmGwqdjocLKGyZWGU/otZDsLCxoKfF3POCBeohuirlLyHg4ElbF0VDkrrlb2QVrQmkbaVgPHWg6NMVbcqG6SMVLArKOsKQYxv7mgd4pSWbGZd94oyz2uk9hQH39c6IuM2ccHDwcOF94Twl3uCs+FnSlv2tgG99Bkq4Ilmd0fiU5CwxiFHCWSvQXsc2RZ7LU2JkmmXcJNVS5RFgRx4rx+QWX8pddhbQPGYaqL1rZglaAZMsBOrOpfDZm+Sq9TF/OqbrEoPmLhGzukN6m7XFeuy7QNXW+O/L7NfCHq4i8M0j88GHya9hjskgZTGnEwcw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(396003)(136003)(39850400004)(71200400001)(186003)(66446008)(44832011)(64756008)(91956017)(76116006)(26005)(478600001)(966005)(53546011)(6506007)(4326008)(66476007)(83380400001)(66556008)(8936002)(316002)(2616005)(66946007)(5660300002)(8676002)(110136005)(36756003)(86362001)(54906003)(6486002)(2906002)(6512007)(99106002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?Y3lVS3pSd0NmelZLVERLeG9nMlE4NFkyd25UdWpHbVZ5OWF2ZHMyUVhrMWlo?=
 =?utf-8?B?ZGJZTzZnZThlQUNJb0FWa0xyYk0vT1BiWnR3SE82T2tSUEpRNDA0WFBrUWp0?=
 =?utf-8?B?dFZSV1FWc3pBdXgzTWIzRG55Z0UwbUlJcldFR2lKV0JxemVBeVpOR0VORitn?=
 =?utf-8?B?VTdlbkF0RHlEODVzb2IzYUc0ajE3azVkVUFTRXJCbmczUG5yemw1NzVYSEo0?=
 =?utf-8?B?ak9iZWplQmk4V0xFWEM3aTZwOWI0UGNWbUlteFM1TmlQMTFzZmFWYlFZRVd4?=
 =?utf-8?B?ZGx6cGVIZnlERy9kTzQ4RFJRbmt4VnVlTmppaG1MbklrTW9vejlZaUwxOU5w?=
 =?utf-8?B?cmZPQWxwQ24zc2E5c0VRTXdGU1ZZOUU2QkZzWU1vWkZWTkc5SllLNWJiK2RS?=
 =?utf-8?B?eHFKWmVIMStSK093VHIzeSs5U01MNDdzZGJKcGJQcWMwVGdXbTA3V2pRSnVY?=
 =?utf-8?B?ckw1aWdnWjRVNUhGMjBvV0UwU3dBdHdhcXJha3YrRE1ZcDhZMVkxcUc5WUhm?=
 =?utf-8?B?NnFqcnBYYTdLeW5hMXd4TUhVWnAwMklTZ3RBaVZ1QzJzY1dxUzM4UENFS3VK?=
 =?utf-8?B?SXNpS0I3K2JaYy9pR0NmU1BIMlNZdjZJLzFTY0pQc3FPYzFnWHJQVjNDY3pi?=
 =?utf-8?B?bkc3bGQrSWhmVW1lNE5DRjQ2LzVTV1BDd1RhNk1wcnJmYkM0dzdTSzlhTmhE?=
 =?utf-8?B?Ym5KZTlxSm1UeTY1TmdkaGlCVGp4U0ovTlVRd3krZDQ1aEZJaHlCcmRiTGJq?=
 =?utf-8?B?bGtwTEVJSDZzNFFSOTZGMDVzcmdpNHpvQ2VMZDRxSWZ6dWtacTBtUlk0akx4?=
 =?utf-8?B?aGY0L3F1Lzl0bHIvYnVHZUp6SVdkUFZGVkdFeThNK2QxRm5SaFFRbzNjZ2U0?=
 =?utf-8?B?UzhJZXQrOUVicWZ1RnpGeHVSTXJSN21HYVZLRmdWOGxmUzgwT0ZVZndyajlY?=
 =?utf-8?B?d3paVEkxaFZQSW5VbnVnL1RVNVUyR1FWK2pkbEc2ZzJJa2R0Q0NKN0c1c1Nz?=
 =?utf-8?B?YmdiYTgxaGNnSVF6eEIzQTdZRUlCNW9RN1dIS1FyWTRoRjltN2RpMHNwQmpl?=
 =?utf-8?B?ck5renFrbnFYblVDSUtmUDd1a0NpcURMZ2JDY3NpSE1oMUE0Z3JiZkExUXlF?=
 =?utf-8?B?dmp5enI4UzlyTkFOeGxOUUpqTVdRakRaZ0lSSTh0d0dDK2NMTVk3TDRiYlhP?=
 =?utf-8?B?MGN3Qk9OSllqUGFSUU5uUnNPUG96WDBYaFVKQnNIN3NZUitIRHlVSHB0Z21w?=
 =?utf-8?B?V1dsK2pTL0twSjhEUHY4ZGxKdFB5RXhjdzhzSXo1cHlqVjF0d0JhS3BGVE0r?=
 =?utf-8?B?MmI4bkwxY25tNzE0VG5rVVplNHBZK0tyeElaajZ5M2MrcTZzWFJhVU54aTJo?=
 =?utf-8?B?NFk1SmhZa2NrV1FmV2xYN1BVSEE2RE8wR01hM2RZcmwrQVpNM1hXZlVrV0ZI?=
 =?utf-8?B?VmJ5azVjMmlkbU4rMXNzTkdWQnBXMVdEcGFGVDg3TGg3QU11Y2RmeDJFaXJn?=
 =?utf-8?B?Y1IyczMybWZKVVNoZnRDTHVkZ1g2MXB5RERVZTVWQ1dWS1Y5anRKcHJpeTFj?=
 =?utf-8?B?QUZLQ201cTZjZHdZZi9yb0h0S1M2dTU0aXhXOUtiN1I1ZkRTK1BEMU5ibEpU?=
 =?utf-8?B?L2I3ZWtaejVXTWlKOGthcWRQNERWOVJqZVF1Z1k3M0pBaTJRZUVTREczY0Rp?=
 =?utf-8?B?a0pOcWRjamxkR3h6eEZMeTN0SW1tTHFDY3UwdXFUUTFDMGNiT0J5UHRlZ0dE?=
 =?utf-8?B?eUJFM2Q2aXpHTzF1NGpxNStLOFl6bitrclRqVmhWWmc2M3pxdnNZMitXdTV6?=
 =?utf-8?B?ZzM1UFlrd3N5dHJKUzNFdz09?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <68D6D0565D3C504893D8735C64404C5C@CANPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e9737bdc-b9df-443b-90e1-08d8e56d078b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2021 15:39:31.3348
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jJ4M5m0ggPuJBVbija+2qbk7ETxZlei7N1qfdn8C8cD9E3j0pAvNCk+A+GvN1FT5+aIIFoj7WCT205/iO362W9RKzW9oTLh352g4vPs5d/4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT1PR01MB4409
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-12_03:2021-03-10,2021-03-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 spamscore=0 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103120112
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

T24gRnJpLCAyMDIxLTAzLTEyIGF0IDA3OjQ0ICswMTAwLCBNaWtlIExvb2lqbWFucyB3cm90ZToN
Cj4gTWV0IHZyaWVuZGVsaWprZSBncm9ldCAvIGtpbmQgcmVnYXJkcywNCj4gDQo+IE1pa2UgTG9v
aWptYW5zDQo+IFN5c3RlbSBFeHBlcnQNCj4gDQo+IA0KPiBUT1BJQyBFbWJlZGRlZCBQcm9kdWN0
cyBCLlYuDQo+IE1hdGVyaWFhbHdlZyA0LCA1NjgxIFJKIEJlc3QNCj4gVGhlIE5ldGhlcmxhbmRz
DQo+IA0KPiBUOiArMzEgKDApIDQ5OSAzMyA2OSA2OQ0KPiBFOiBtaWtlLmxvb2lqbWFuc0B0b3Bp
Y3Byb2R1Y3RzLmNvbQ0KPiBXOiANCj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHA6
Ly93d3cudG9waWNwcm9kdWN0cy5jb21fXzshIUlPR29zMGshMVpLb1dWd3YwOWZEQy1vNGpSdzky
Tlp2SEJsXzNNT2NCSVBsOERMTEROMHN6SmxvOUlIMEdDLTZxSDAtUHExVy1QQSQNCj4gIA0KPiAN
Cj4gUGxlYXNlIGNvbnNpZGVyIHRoZSBlbnZpcm9ubWVudCBiZWZvcmUgcHJpbnRpbmcgdGhpcyBl
LW1haWwNCj4gT24gMTEtMDMtMjAyMSAyMzoyNCwgUm9iZXJ0IEhhbmNvY2sgd3JvdGU6DQo+ID4g
QWRkIGEgcHJvcGVydHkgdG8gYWxsb3cgc3BlY2lmeWluZyB0aGF0IHRoZSBleHRlcm5hbCBJMkMg
SU8gcGlucyBhcmUgdXNpbmcNCj4gPiAzLjNWIHZvbHRhZ2UgdGhyZXNob2xkcyByYXRoZXIgdGhh
biAxLjhWLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFJvYmVydCBIYW5jb2NrIDxyb2JlcnQu
aGFuY29ja0BjYWxpYW4uY29tPg0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy9jbGsvY2xrLXNpNTM0
MS5jIHwgMTAgKysrKysrKysrLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9jbGst
c2k1MzQxLmMgYi9kcml2ZXJzL2Nsay9jbGstc2k1MzQxLmMNCj4gPiBpbmRleCAxMTc0MDg1NWJj
ZGUuLjRjZDgwZWYzODlkMiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2Nsay9jbGstc2k1MzQx
LmMNCj4gPiArKysgYi9kcml2ZXJzL2Nsay9jbGstc2k1MzQxLmMNCj4gPiBAQCAtODEsNiArODEs
NyBAQCBzdHJ1Y3QgY2xrX3NpNTM0MSB7DQo+ID4gICAJdTggbnVtX3N5bnRoOw0KPiA+ICAgCXUx
NiBjaGlwX2lkOw0KPiA+ICAgCWJvb2wgeGF4Yl9leHRfY2xrOw0KPiA+ICsJYm9vbCBpb3ZkZF8z
MzsNCj4gPiAgIH07DQo+ID4gICAjZGVmaW5lIHRvX2Nsa19zaTUzNDEoX2h3KQljb250YWluZXJf
b2YoX2h3LCBzdHJ1Y3QgY2xrX3NpNTM0MSwNCj4gPiBodykNCj4gPiAgIA0KPiA+IEBAIC0xMDMs
NiArMTA0LDcgQEAgc3RydWN0IGNsa19zaTUzNDFfb3V0cHV0X2NvbmZpZyB7DQo+ID4gICAjZGVm
aW5lIFNJNTM0MV9JTl9TRUwJCTB4MDAyMQ0KPiA+ICAgI2RlZmluZSBTSTUzNDFfREVWSUNFX1JF
QURZCTB4MDBGRQ0KPiA+ICAgI2RlZmluZSBTSTUzNDFfWEFYQl9DRkcJCTB4MDkwRQ0KPiA+ICsj
ZGVmaW5lIFNJNTM0MV9JT19WRERfU0VMCTB4MDk0Mw0KPiA+ICAgI2RlZmluZSBTSTUzNDFfSU5f
RU4JCTB4MDk0OQ0KPiA+ICAgI2RlZmluZSBTSTUzNDFfSU5YX1RPX1BGRF9FTgkweDA5NEENCj4g
PiAgIA0KPiA+IEBAIC0zNTEsNyArMzUzLDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzaTUzNDFf
cmVnX2RlZmF1bHQNCj4gPiBzaTUzNDFfcmVnX2RlZmF1bHRzW10gPSB7DQo+ID4gICAJeyAweDA4
MDQsIDB4MDAgfSwgLyogTm90IGluIGRhdGFzaGVldCAqLw0KPiA+ICAgCXsgMHgwOTBFLCAweDAy
IH0sIC8qIFhBWEJfRVhUQ0xLX0VOPTAgWEFYQl9QRE5CPTEgKHVzZSBYVEFMKSAqLw0KPiA+ICAg
CXsgMHgwOTFDLCAweDA0IH0sIC8qIFpETV9FTj00IChOb3JtYWwgbW9kZSkgKi8NCj4gPiAtCXsg
MHgwOTQzLCAweDAwIH0sIC8qIElPX1ZERF9TRUw9MCAoMD0xdjgsIHVzZSAxPTN2MykgKi8NCj4g
PiAgIAl7IDB4MDk0OSwgMHgwMCB9LCAvKiBJTl9FTiAoZGlzYWJsZSBpbnB1dCBjbG9ja3MpICov
DQo+ID4gICAJeyAweDA5NEEsIDB4MDAgfSwgLyogSU54X1RPX1BGRF9FTiAoZGlzYWJsZWQpICov
DQo+ID4gICAJeyAweDBBMDIsIDB4MDAgfSwgLyogTm90IGluIGRhdGFzaGVldCAqLw0KPiA+IEBA
IC0xMTYwLDYgKzExNjEsMTEgQEAgc3RhdGljIGludCBzaTUzNDFfZmluYWxpemVfZGVmYXVsdHMo
c3RydWN0DQo+ID4gY2xrX3NpNTM0MSAqZGF0YSkNCj4gPiAgIAlpbnQgcmVzOw0KPiA+ICAgCXUz
MiByZXZpc2lvbjsNCj4gPiAgIA0KPiA+ICsJcmVzID0gcmVnbWFwX3dyaXRlKGRhdGEtPnJlZ21h
cCwgU0k1MzQxX0lPX1ZERF9TRUwsDQo+ID4gKwkJCSAgIGRhdGEtPmlvdmRkXzMzID8gMSA6IDAp
Ow0KPiA+ICsJaWYgKHJlcyA8IDApDQo+ID4gKwkJcmV0dXJuIHJlczsNCj4gPiArDQo+ID4gICAJ
cmVzID0gcmVnbWFwX3JlYWQoZGF0YS0+cmVnbWFwLCBTSTUzNDFfREVWSUNFX1JFViwgJnJldmlz
aW9uKTsNCj4gPiAgIAlpZiAocmVzIDwgMCkNCj4gPiAgIAkJcmV0dXJuIHJlczsNCj4gPiBAQCAt
MTU2NSw2ICsxNTcxLDggQEAgc3RhdGljIGludCBzaTUzNDFfcHJvYmUoc3RydWN0IGkyY19jbGll
bnQgKmNsaWVudCwNCj4gPiAgIAl9DQo+ID4gICAJZGF0YS0+eGF4Yl9leHRfY2xrID0gb2ZfcHJv
cGVydHlfcmVhZF9ib29sKGNsaWVudC0+ZGV2Lm9mX25vZGUsDQo+ID4gICAJCQkJCQkgICAic2ls
YWJzLHhheGItZXh0LWNsayIpOw0KPiA+ICsJZGF0YS0+aW92ZGRfMzMgPSBvZl9wcm9wZXJ0eV9y
ZWFkX2Jvb2woY2xpZW50LT5kZXYub2Zfbm9kZSwNCj4gPiArCQkJCQkgICAgICAgInNpbGFicyxp
b3ZkZC0zMyIpOw0KPiA+ICAgDQo+IA0KPiBTZWVtcyBhIHdhc3RlIHRvIG1lIHRvIHN0b3JlIHRo
aXMgaW4gdGhlICdkYXRhJyBvYmplY3QgZm9yZXZlciB3aGlsZSBpdCANCj4gaXMgdG8gYmUgdXNl
ZCBvbmx5IG9uY2UgZHVyaW5nIGluaXQgYW5kIG5ldmVyIGFnYWluIGFmdGVyIHRoYXQuDQoNClRo
YXQgaXMgdHJ1ZSwgYnV0IGl0IHdvdWxkIHRoZW4gaGF2ZSB0byBiZSBwYXNzZWQgZG93biBpbnRv
IHRoZQ0Kc2k1MzQxX2ZpbmFsaXplX2RlZmF1bHRzIGZ1bmN0aW9uIHNlcGFyYXRlbHkgYW5kIGl0
IHdvdWxkIGJlIGluY29uc2lzdGVudCB3aXRoDQpob3cgYWxsIG9mIHRoZSBvdGhlciBjb25maWd1
cmF0aW9uIGlzIGhhbmRsZWQuIFNvIEknbSBub3Qgc3VyZSBpdCdzIHdvcnRoDQpzYXZpbmcgfiAx
IGJ5dGUgaW4gdGhlIGRhdGEgb2JqZWN0Li4NCg0KPiANCj4gDQo+ID4gICAJaWYgKGluaXRpYWxp
emF0aW9uX3JlcXVpcmVkKSB7DQo+ID4gICAJCS8qIFBvcHVsYXRlIHRoZSByZWdtYXAgY2FjaGUg
aW4gcHJlcGFyYXRpb24gZm9yICJjYWNoZSBvbmx5IiAqLw0KPiANCj4gDQo=
