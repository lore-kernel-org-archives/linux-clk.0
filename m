Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDFD5C433DB
	for <linux-clk@archiver.kernel.org>; Fri, 12 Mar 2021 15:23:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ABB8164FDC
	for <linux-clk@archiver.kernel.org>; Fri, 12 Mar 2021 15:23:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231597AbhCLPXW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Mar 2021 10:23:22 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:55674 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231745AbhCLPXR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 Mar 2021 10:23:17 -0500
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12CFD4Ck021961;
        Fri, 12 Mar 2021 10:23:03 -0500
Received: from can01-qb1-obe.outbound.protection.outlook.com (mail-qb1can01lp2058.outbound.protection.outlook.com [104.47.60.58])
        by mx0c-0054df01.pphosted.com with ESMTP id 375yymhgcn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 12 Mar 2021 10:23:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P7uZEkwp6IICNS230slXeFOZ0GMxhm23sAjJ5BaTXkOPfN4kHVNNqIHTG3pOZJW+NVpO5NaPmDnns68V4arLeEZ2slZAHxse4YZkmq9PRAnPtI7NvDbGB53XBux5/vNN8DzZod2PWSXxitlrW4fpdvSpfcxCkn2vMX7GPZuMbtl3CQRSOuhJcpjDVC5wwHuTfn0zCGarbmg57jwXmaF5mSF4nx3hsV6JFPSSGkCRsQR2iXndarmEtrzwi6VjDR9EvbCUxFmUkxB8gsmbnieZJ2AvL1N57aSdKXLDKOEMsYd6RxBb0pvPkTunIk2K+F9Rfq9HJt/tKq2W1W+15L2lIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGREFnT/WjXEtDLrfBHM4oyDWWmjeJvnN/Q4FfiRv+I=;
 b=eCiDk2pz0WcFnqDBfGDgWsFTorwS/5JWhysE4A9DaBDQQwDCknUPkgMuUG5TgnP15nJSJc02/z4KfKLu5xLnfbE4gTcVZKdp+IhdZu5C24NCkxyPJKJYALQvkIVtgGkc0DR4dXh369GBxCdP+IpzCzRWhJOqG6x+eUF6hbdE2KtsSQGW8/eA1R+Il0u2w9sO442VckXlCquOW3bnE3OuzBl0+VZpsvIp+kKjHEp3OBq4mzbb+5pGzPr0rBLz14nStaByZUgMLiiE7UhpOExdLCEw6xquL4EzeBMscOHRe/CqTHd5jBqCuQZGVJtuCKNEqXnp3j6c7XXNv3FHgd6D4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGREFnT/WjXEtDLrfBHM4oyDWWmjeJvnN/Q4FfiRv+I=;
 b=i0BuGNa3Rx5uPIrngXQjfHI4/FY6R5mknxxT3VnI/qw/XlwQqsLgndC3g7KHxVEMSs7JwEstLGnNyx+r1WQlaIHoMJJwCIJTydxS1Esp6Tx+M4KMgAtAdzflvNXcTrJy5bWZuaLjvVYgLtdRueLVTyRIcWp/30rvxRdLFQY4+YU=
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f::20)
 by YT2PR01MB4480.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:3f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.2; Fri, 12 Mar
 2021 15:23:02 +0000
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb]) by YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb%7]) with mapi id 15.20.3912.031; Fri, 12 Mar 2021
 15:23:02 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     "mike.looijmans@topic.nl" <mike.looijmans@topic.nl>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 2/9] clk: si5341: Wait for DEVICE_READY on startup
Thread-Topic: [PATCH 2/9] clk: si5341: Wait for DEVICE_READY on startup
Thread-Index: AQHXFsVm0KEWbaaVjUam/RKpy1E5map/52UAgACSPYA=
Date:   Fri, 12 Mar 2021 15:23:01 +0000
Message-ID: <11d658aa2b5ec88e20400b1da3b298e7932cd260.camel@calian.com>
References: <20210311222436.3826800-1-robert.hancock@calian.com>
         <20210311222436.3826800-3-robert.hancock@calian.com>
         <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.b1dc66c0-d7df-44f1-9f1a-e729e77f49c2@emailsignatures365.codetwo.com>
         <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.b83fe2f2-a0e4-4df3-9cc5-fc8594d38aac@emailsignatures365.codetwo.com>
         <6ac7a45b-4e68-0c96-92a0-52ecdf2c97fc@topic.nl>
In-Reply-To: <6ac7a45b-4e68-0c96-92a0-52ecdf2c97fc@topic.nl>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5 (3.28.5-16.el8) 
authentication-results: topic.nl; dkim=none (message not signed)
 header.d=none;topic.nl; dmarc=none action=none header.from=calian.com;
x-originating-ip: [204.83.154.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f6a0bba1-6f76-48c1-17f8-08d8e56ab9d9
x-ms-traffictypediagnostic: YT2PR01MB4480:
x-microsoft-antispam-prvs: <YT2PR01MB44809FDF7B4BC25E52A66F73EC6F9@YT2PR01MB4480.CANPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O5X3ELKNw7+Vu/BNPmbP9mAQKyKzI5nHYurodoENPuA4zxmVZYW/pabiI8A8SkVqk8FuogvH3RM08hmzZj8vXC8pc/j+h3qKqv9H2Z5CRTJ2m8FeEkaPytUcUaFL8pp6smjJW1pKgXvZp2zOGfHcR1s7SfP2slZfFYfsNabsnjHNcBJ4r1qp67EL107X+yRKyUfwLynNowHomHBz9J8YNqDl1Jxv2Lvrjhahv3olhK03kIcRmCgHsoe2JEjwklCCdRpNE3gotSXh1TJUFmz80wQexCbN1Bh2XAQd0lWlP6hZB7AgpeVNhHL/8ZVDA+E8SOKMl80s0ChSn8lThDIXBQoKDJUycIZU8dPYLbiSHdNM+b+y9CWeuT+yQDbC/hUCzQ+or4DZYhW9lgfMyN1oXSbXoWupW8r9dbtlXVTUN69+YtFzYz7vv8AM7ZXR3KuzklluV+nrhmEqrYixJz2WimOvSfUzGdHekqRpF8fBqkVbn4w/nYnqYFo21f3n9KhzMP7caHCjWNdSveMZZoP/tC4+9tee1qnTe1k6CRQ5Z2DLtZOCWoFb4Hlyq0pab8innjejm6asyPtSakb35aC8wOEpG6U5kiZf7uYPfWLQLghcoJoEqdDx2KqUs2soLu0w7u07GrQgQVuvFpI7Gsir9+GaRfEl8u2s6JGVIH5Ew1IZi4gH/MmCwe5uHoc+huNb
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(376002)(346002)(136003)(366004)(66946007)(54906003)(15974865002)(6512007)(478600001)(6506007)(316002)(86362001)(91956017)(76116006)(6486002)(110136005)(2906002)(66476007)(66556008)(66446008)(64756008)(83380400001)(44832011)(71200400001)(186003)(36756003)(2616005)(4326008)(26005)(8676002)(8936002)(53546011)(966005)(5660300002)(99106002)(18886075002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?QS9UakNERWc3Y0NZeWNpMnNoY2RPZDRqTjh1cjYzQTFOTFZjT1dyckFtMUV1?=
 =?utf-8?B?MFBQWE1OM1JWOWFQYk1LbTV5MlNjc2l3cXNza0hxZ2x6UlU0MHZmME1ZRFRY?=
 =?utf-8?B?NCt0MU5xVGtnOFEwMWg1V0dkeFpvWnNsZE53U1ZGcDlKd3lLYUdSV0crQVdC?=
 =?utf-8?B?dzU0OXErN1FNWWF3TmpNS3FJQUh2Q3haY0lkL1hmVWlNUEVXNVlZVnFCdnFo?=
 =?utf-8?B?dXFMK3hKVk5JK0dzRytiZWUrN3NzT004K09nRmxOWEhYczdXeU03VUh0ZUVa?=
 =?utf-8?B?cGppUkE5TVZQWG4wUnlpM3J2MjBOejMydy9Ga0hLS05zTWhZVEdldWUrYWFo?=
 =?utf-8?B?dlh2SHZaUXU4Z20yd2FMKzlPeXNMLzhUdlRLZTdGVkVhZDREQ2hQenlQUk82?=
 =?utf-8?B?U2YxTFBsSWlmRG1rTlpiSGxBU3hjKzJsT3lmT2xQVlBBWEM5Z0NZYlh3amYz?=
 =?utf-8?B?cHhpWEQraW1lMzRJczhsM2ozRjAwTVpSUjhGeUVQWXA4TDB0TWtHVnJYMXhx?=
 =?utf-8?B?SkF1UnM0WWhmZ2VlZEFTVFE4N0Faa1Z2eGlyVzhoNjNicTJ2emZQR3B4eXRW?=
 =?utf-8?B?RWNoemJBRVVMbktvUFQ3ejJaNW42M0lTbUh1blpLd054Y2ZhdlJNTTVGVWRn?=
 =?utf-8?B?RFNRTjB6YkF6eTFhMCt6QlFrdVdFbG96a0hrZTRjdTJqWnhSRnlkSDF3d09o?=
 =?utf-8?B?YmluYTBSRDg3V2RvZnNPanZzbnZlZG9tN2xqUC9QOTJUbytJNGhxQnpVZEh2?=
 =?utf-8?B?RWMybG1pNkhYN0N0ODVMS0lMZVNBdXVkVVgrREV6ditpM01NN3ExLzlDTFVt?=
 =?utf-8?B?dUJ5T1cwSmY2d2E2WjRNczhBSkF3T0Jpd0lxbzVMU1VnRDNHNU84T09KUlEy?=
 =?utf-8?B?SXFsMnJTeUI0NkFXZkcxWlpzai9RYUpuRmRWWnRReUcxWDBURkpNci93Z2dG?=
 =?utf-8?B?QnBpTFdNUHBzWFA2WnV0WS9KUGxzOE1GZ3ZJZE1USGJuRGJRQnhaZUU2Nk96?=
 =?utf-8?B?S09lNnBWZERwMkxla0loVnEwQ1FvdlZybCtkT0UwNUhKTEIvSkRkR09QY3Qx?=
 =?utf-8?B?RTgyY1hrcWE4ZnBzcUpuN0tNV2xXNG9UMUE1Q2JTTGtTMUQ2RDMwdkRhaDNE?=
 =?utf-8?B?elZJU2RDOS9KbmFUWER5Y0JzTzZjeWtZelhLajBIQkJIUTNJdll4czM5M2Rx?=
 =?utf-8?B?RjRDL1dvQ2RjUnA4SHVhbDRtV1NFZnBhV1hqVW91ZitTZEI2M0svd2VRaDJo?=
 =?utf-8?B?WGhlV2p5WUh6cjRWend1bnV4QnFVdVV5QjhmaHdGcWlsREEyWUdRRDdYMFpZ?=
 =?utf-8?B?eUU3SDl2RkVyaUdXdktxaGtHZmo0YlFFdEdLL214dGR3Q0RvM0hDdkVrV2hi?=
 =?utf-8?B?RmZ3TzRLL2p0QjdYRm0xOXgrVDlvV1pBLzZOYUEvVm1OUi9mc1lyWjFzYVBC?=
 =?utf-8?B?bkNTTEdmUDNNRW90bFFxcmJ6R1IvZHJDZHN2WEpZYUhLUUd6djkyVVgzV3JR?=
 =?utf-8?B?UVp1UWc5S3hCUnduZXVTLzZyV1M5SmNrWW5PSmdqWktvUlp2cVNoM1dKbVZw?=
 =?utf-8?B?cW9NUlJ2V1BRcGdic2p5eElVN3cxdU9sdC9NbUxYcmV1YjdGamxlWE94UzJZ?=
 =?utf-8?B?RmVZQkhuRmtnZFBydWthaWl6VnRpaGZiY3g1TTBFK21HMnJIWVdJK1FZN2lI?=
 =?utf-8?B?QmhTVzlpQThmSXZBKzdydndrR0ZCaUFiZ3dMZjlYVGNhM0dhdmwvVmdSZk9F?=
 =?utf-8?Q?xXZvMHu1NLQbpxy40vfHdvkjRaypZ0NCov1/4U3?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <90CA23EB3380514DB3CFB51570B5A58E@CANPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f6a0bba1-6f76-48c1-17f8-08d8e56ab9d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2021 15:23:01.9472
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sKHSAkO36oxm4pyveLO0Eh5e2z0bM1aplLXsXkTSYCpVL5O/PHei1EQnuU6DYIJs/3c6m1uASCbN1MbdJdOfBWeOKM49mIn134vVavWdqO8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB4480
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-12_03:2021-03-10,2021-03-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 spamscore=0 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103120111
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

T24gRnJpLCAyMDIxLTAzLTEyIGF0IDA3OjM5ICswMTAwLCBNaWtlIExvb2lqbWFucyB3cm90ZToN
Cj4gT25lIHJlbWFyayBiZWxvdy4NCj4gDQo+IA0KPiBNZXQgdnJpZW5kZWxpamtlIGdyb2V0IC8g
a2luZCByZWdhcmRzLA0KPiANCj4gTWlrZSBMb29pam1hbnMNCj4gU3lzdGVtIEV4cGVydA0KPiAN
Cj4gDQo+IFRPUElDIEVtYmVkZGVkIFByb2R1Y3RzIEIuVi4NCj4gTWF0ZXJpYWFsd2VnIDQsIDU2
ODEgUkogQmVzdA0KPiBUaGUgTmV0aGVybGFuZHMNCj4gDQo+IFQ6ICszMSAoMCkgNDk5IDMzIDY5
IDY5DQo+IEU6IG1pa2UubG9vaWptYW5zQHRvcGljcHJvZHVjdHMuY29tDQo+IFc6IA0KPiBodHRw
czovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cDovL3d3dy50b3BpY3Byb2R1Y3RzLmNvbV9fOyEh
SU9Hb3MwayEyYUJMVUphLTVrYW96ZXN5VnpueElmeG4ySG41TDRpMFJkaEVMbm5IVTFXSjg1Rkl6
bUd5UkNSbVhXNS1rWGJjc2kwJA0KPiAgDQo+IA0KPiBQbGVhc2UgY29uc2lkZXIgdGhlIGVudmly
b25tZW50IGJlZm9yZSBwcmludGluZyB0aGlzIGUtbWFpbA0KPiBPbiAxMS0wMy0yMDIxIDIzOjI0
LCBSb2JlcnQgSGFuY29jayB3cm90ZToNCj4gPiBUaGUgU2k1MzQxIGRhdGFzaGVldCB3YXJucyB0
aGF0IGJlZm9yZSBhY2Nlc3NpbmcgYW55IG90aGVyIHJlZ2lzdGVycywNCj4gPiBpbmNsdWRpbmcg
dGhlIFBBR0UgcmVnaXN0ZXIsIHdlIG5lZWQgdG8gd2FpdCBmb3IgdGhlIERFVklDRV9SRUFEWSBy
ZWdpc3Rlcg0KPiA+IHRvIGluZGljYXRlIHRoZSBkZXZpY2UgaXMgcmVhZHksIG9yIHRoZSBwcm9j
ZXNzIG9mIHRoZSBkZXZpY2UgbG9hZGluZyBpdHMNCj4gPiBzdGF0ZSBmcm9tIE5WTSBjYW4gYmUg
Y29ycnVwdGVkLiBXYWl0IGZvciBERVZJQ0VfUkVBRFkgb24gc3RhcnR1cCBiZWZvcmUNCj4gPiBj
b250aW51aW5nIGluaXRpYWxpemF0aW9uLiBUaGlzIGlzIGRvbmUgdXNpbmcgYSByYXcgSTJDIHJl
Z2lzdGVyIHJlYWQNCj4gPiBwcmlvciB0byBzZXR0aW5nIHVwIHJlZ21hcCB0byBhdm9pZCBhbnkg
cG90ZW50aWFsIHVud2FudGVkIGF1dG9tYXRpYyBQQUdFDQo+ID4gcmVnaXN0ZXIgYWNjZXNzZXMg
ZnJvbSByZWdtYXAgYXQgdGhpcyBzdGFnZS4NCj4gPiANCj4gPiBGaXhlczogMzA0NGE4NjBmZCAo
ImNsazogQWRkIFNpNTM0MS9TaTUzNDAgZHJpdmVyIikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2Jl
cnQgSGFuY29jayA8cm9iZXJ0LmhhbmNvY2tAY2FsaWFuLmNvbT4NCj4gPiAtLS0NCj4gPiAgIGRy
aXZlcnMvY2xrL2Nsay1zaTUzNDEuYyB8IDMxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysNCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvY2xrL2Nsay1zaTUzNDEuYyBiL2RyaXZlcnMvY2xrL2Nsay1zaTUz
NDEuYw0KPiA+IGluZGV4IGUwNDQ2ZTY2ZmE2NC4uZjIxMDg2MGZiOTZlIDEwMDY0NA0KPiA+IC0t
LSBhL2RyaXZlcnMvY2xrL2Nsay1zaTUzNDEuYw0KPiA+ICsrKyBiL2RyaXZlcnMvY2xrL2Nsay1z
aTUzNDEuYw0KPiA+IEBAIC05NCw2ICs5NCw3IEBAIHN0cnVjdCBjbGtfc2k1MzQxX291dHB1dF9j
b25maWcgew0KPiA+ICAgI2RlZmluZSBTSTUzNDFfU1RBVFVTCQkweDAwMEMNCj4gPiAgICNkZWZp
bmUgU0k1MzQxX1NPRlRfUlNUCQkweDAwMUMNCj4gPiAgICNkZWZpbmUgU0k1MzQxX0lOX1NFTAkJ
MHgwMDIxDQo+ID4gKyNkZWZpbmUgU0k1MzQxX0RFVklDRV9SRUFEWQkweDAwRkUNCj4gPiAgICNk
ZWZpbmUgU0k1MzQxX1hBWEJfQ0ZHCQkweDA5MEUNCj4gPiAgICNkZWZpbmUgU0k1MzQxX0lOX0VO
CQkweDA5NDkNCj4gPiAgICNkZWZpbmUgU0k1MzQxX0lOWF9UT19QRkRfRU4JMHgwOTRBDQo+ID4g
QEAgLTExODksNiArMTE5MCwzMSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHJlZ21hcF9yYW5nZV9j
ZmcNCj4gPiBzaTUzNDFfcmVnbWFwX3Jhbmdlc1tdID0gew0KPiA+ICAgCX0sDQo+ID4gICB9Ow0K
PiA+ICAgDQo+ID4gK3N0YXRpYyBpbnQgc2k1MzQxX3dhaXRfZGV2aWNlX3JlYWR5KHN0cnVjdCBp
MmNfY2xpZW50ICpjbGllbnQpDQo+ID4gK3sNCj4gPiArCWludCBjb3VudDsNCj4gPiArDQo+ID4g
KwkvKiBEYXRhc2hlZXQgd2FybnM6IEFueSBhdHRlbXB0IHRvIHJlYWQgb3Igd3JpdGUgYW55IHJl
Z2lzdGVyIG90aGVyDQo+ID4gKwkgKiB0aGFuIERFVklDRV9SRUFEWSBiZWZvcmUgREVWSUNFX1JF
QURZIHJlYWRzIGFzIDB4MEYgbWF5IGNvcnJ1cHQgdGhlDQo+ID4gKwkgKiBOVk0gcHJvZ3JhbW1p
bmcgYW5kIG1heSBjb3JydXB0IHRoZSByZWdpc3RlciBjb250ZW50cywgYXMgdGhleSBhcmUNCj4g
PiArCSAqIHJlYWQgZnJvbSBOVk0uIE5vdGUgdGhhdCB0aGlzIGluY2x1ZGVzIGFjY2Vzc2VzIHRv
IHRoZSBQQUdFDQo+ID4gcmVnaXN0ZXIuDQo+ID4gKwkgKiBBbHNvOiBERVZJQ0VfUkVBRFkgaXMg
YXZhaWxhYmxlIG9uIGV2ZXJ5IHJlZ2lzdGVyIHBhZ2UsIHNvIG5vIHBhZ2UNCj4gPiArCSAqIGNo
YW5nZSBpcyBuZWVkZWQgdG8gcmVhZCBpdC4NCj4gPiArCSAqIERvIHRoaXMgb3V0c2lkZSByZWdt
YXAgdG8gYXZvaWQgYXV0b21hdGljIFBBR0UgcmVnaXN0ZXIgYWNjZXNzLg0KPiA+ICsJICovDQo+
ID4gKwlmb3IgKGNvdW50ID0gMDsgY291bnQgPCAxMDsgKytjb3VudCkgew0KPiA+ICsJCXMzMiBy
ZXN1bHQgPSBpMmNfc21idXNfcmVhZF9ieXRlX2RhdGEoY2xpZW50LA0KPiA+ICsJCQkJCQkgICAg
ICBTSTUzNDFfREVWSUNFX1JFQURZKTsNCj4gPiArCQlpZiAocmVzdWx0IDwgMCkNCj4gPiArCQkJ
cmV0dXJuIHJlc3VsdDsNCj4gPiArCQlpZiAocmVzdWx0ID09IDB4MEYpDQo+ID4gKwkJCXJldHVy
biAwOw0KPiA+ICsJCXVzbGVlcF9yYW5nZSgxMDAwLCAyMDAwMCk7DQo+ID4gKwl9DQo+ID4gKwlk
ZXZfZXJyKCZjbGllbnQtPmRldiwgInRpbWVvdXQgd2FpdGluZyBmb3IgREVWSUNFX1JFQURZXG4i
KTsNCj4gDQo+IFRoZSAidGltZW91dCIgaGVyZSBpcyByYW5kb20gYmV0d2VlbiAxMCBhbmQgMjAw
IG1pbGxpc2Vjb25kcy4NCj4gDQo+IFRoZSBkYXRhc2hlZXQgc2F5cyB0aGF0IHRoZSBkZXZpY2Ug
bWF5IHRha2UgMzAwbXMgdG8gaW5pdGlhbGl6ZSwgc28gSSANCj4gZ3Vlc3MgMzAwIG1pbGxpc2Vj
b25kcyB3b3VsZCBiZSBhIGdvb2QgdGltZW91dC4NCg0KSSB0aGluayBJIG1pc3NlZCB0aGUgMzAw
bXMgZmlndXJlLiBXZSBzaG91bGQgZGVmaW5pdGVseSBhbGxvdyBhdCBsZWFzdCB0aGF0DQptdWNo
IHRpbWUgdGhlbi4gV2lsbCBhZGRyZXNzIGluIHYyLg0KDQo+IA0KPiBJJ20gYWxzbyBwcmV0dHkg
c3VyZSB0aGVyZSdzIGEgYnVpbHQtaW4ga2VybmVsIGZ1bmN0aW9uIHRvIHBvbGwgYSANCj4gcmVn
aXN0ZXIgd2l0aCB0aW1lb3V0IHRoYXQgeW91IHNob3VsZCB1c2UgaGVyZS4NCg0KVGhlcmUgaXMg
YSByZWdtYXBfcmVhZF9wb2xsX3RpbWVvdXQgZnVuY3Rpb24sIGJ1dCB3ZSdyZSB0cnlpbmcgdG8g
c3BlY2lmaWNhbGx5DQpub3QgdXNlIHJlZ21hcCBoZXJlIGJlY2F1c2UgaXQgbWF5IGFjY2VzcyBv
dGhlciByZWdpc3RlcnMgYmVoaW5kIG91ciBiYWNrLiBJJ20NCm5vdCBhd2FyZSBvZiBzb21ldGhp
bmcgYmV0dGVyIHRoYXQgb3BlcmF0ZXMgYXQgdGhlIEkyQyBsYXllci4uDQoNCj4gDQo+IA0KPiA+
ICsJcmV0dXJuIC1FSU87DQo+ID4gK30NCj4gPiArDQo+ID4gICBzdGF0aWMgY29uc3Qgc3RydWN0
IHJlZ21hcF9jb25maWcgc2k1MzQxX3JlZ21hcF9jb25maWcgPSB7DQo+ID4gICAJLnJlZ19iaXRz
ID0gOCwNCj4gPiAgIAkudmFsX2JpdHMgPSA4LA0KPiA+IEBAIC0xMzg1LDYgKzE0MTEsMTEgQEAg
c3RhdGljIGludCBzaTUzNDFfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwNCj4gPiAg
IA0KPiA+ICAgCWRhdGEtPmkyY19jbGllbnQgPSBjbGllbnQ7DQo+ID4gICANCj4gPiArCS8qIE11
c3QgYmUgZG9uZSBiZWZvcmUgb3RoZXJ3aXNlIHRvdWNoaW5nIGhhcmR3YXJlICovDQo+ID4gKwll
cnIgPSBzaTUzNDFfd2FpdF9kZXZpY2VfcmVhZHkoY2xpZW50KTsNCj4gPiArCWlmIChlcnIpDQo+
ID4gKwkJcmV0dXJuIGVycjsNCj4gPiArDQo+ID4gICAJZm9yIChpID0gMDsgaSA8IFNJNTM0MV9O
VU1fSU5QVVRTOyArK2kpIHsNCj4gPiAgIAkJaW5wdXQgPSBkZXZtX2Nsa19nZXQoJmNsaWVudC0+
ZGV2LA0KPiA+IHNpNTM0MV9pbnB1dF9jbG9ja19uYW1lc1tpXSk7DQo+ID4gICAJCWlmIChJU19F
UlIoaW5wdXQpKSB7DQo+IA0KPiANCi0tIA0KUm9iZXJ0IEhhbmNvY2sNClNlbmlvciBIYXJkd2Fy
ZSBEZXNpZ25lciwgQ2FsaWFuIEFkdmFuY2VkIFRlY2hub2xvZ2llcw0Kd3d3LmNhbGlhbi5jb20N
Cg==
