Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B48F0C433ED
	for <linux-clk@archiver.kernel.org>; Wed,  7 Apr 2021 16:50:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8DF306103D
	for <linux-clk@archiver.kernel.org>; Wed,  7 Apr 2021 16:50:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354362AbhDGQux (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Apr 2021 12:50:53 -0400
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:27278 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235801AbhDGQuw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 7 Apr 2021 12:50:52 -0400
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 137Gm7F2007944;
        Wed, 7 Apr 2021 12:50:36 -0400
Received: from can01-qb1-obe.outbound.protection.outlook.com (mail-qb1can01lp2052.outbound.protection.outlook.com [104.47.60.52])
        by mx0c-0054df01.pphosted.com with ESMTP id 37rvch8edu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 07 Apr 2021 12:50:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IzV+9BjAJEe4L1pC/WJNaTw4zfxpZiErvgJMJ9yc1WsheE7119fjh+5Qkx3p8nHZv1rVsQGX/GTUg8xQx7b03kji9eKb/WEDaL02QUcbqDbZXQN/+6hgxEroaPS8pv6/1gFhM1Mu7fq9Hw2it8Lr2Fop8GIiM+i3q/pmJEK13CO89hCmfV+jDuymXrUcy3vnxANls03NnvKC46+GYhEWtRo9AQZrhWURJUAFv7GzdY3azM6t1ee+3ms7yRovcETl8+wBAOXkGGCqGnU+6VQRfE11JfKSrpR2cX30PmqlTQQsqxK47VFJhxEjZwxgQt7aPsxEyMj2bVLijsClOe2WvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oxt8/0QXUy4febP1sOXMiCFW2dCx0q84DZ9rCMpJEc4=;
 b=QC+hJE8oHyePlTljyBsDfRULuqHe5WCwUmWKP73uQvJIykUU6/Ykn76BzKyoMPqphPiTBrUsnz3glfEGc/WpUDY5u5Z7+/eklxOD9COVRCS3qp9IPvnZRCQ1zqR6peDON0AlMzuaxXyjOXiYCAJK0Itj7QfRhaFy5Mc+4imGmASLOrLcFNB1u0ahVglMGgz5LtPqpoYxI+caHkmGJ9MMlTl/lm16R/FsQMS3TzECZ5TLD6nGuJNtOs/2TLMZ/II2m8qZDWh4I4aOH3a52lXRGIFKQiMfNlZu4arS48G+t4vhUoKXdbUsI2oXzLShDnNLJN80B7dNbKqLaQPnQWmv8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oxt8/0QXUy4febP1sOXMiCFW2dCx0q84DZ9rCMpJEc4=;
 b=OlQ0vPUEa11XKLhfTGdKVq6jGH/c2qVWyUSRhTcEB81QQD1yGg2tCNuD/T2Z+hPbRbufOsHEM4Ozdk2cAHF1YlwN9U/IF70SmckPoAVFMEoOUVOagoqwM99nKj95DQ3q3/c5Tanu0p6fSkOep5af2TgHwk8+RkQ2GN3zKPeuloY=
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f::20)
 by YT1PR01MB2361.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Wed, 7 Apr
 2021 16:50:35 +0000
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb]) by YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb%7]) with mapi id 15.20.3999.033; Wed, 7 Apr 2021
 16:50:35 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>
CC:     "mike.looijmans@topic.nl" <mike.looijmans@topic.nl>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 0/9] Si5341 driver updates
Thread-Topic: [PATCH v3 0/9] Si5341 driver updates
Thread-Index: AQHXIazwEctzqmbg9EWgbhrLzFh296qpWOcA
Date:   Wed, 7 Apr 2021 16:50:35 +0000
Message-ID: <5c2e1cdbf699e0e3abf6e0bdf013e66a4f72cbbf.camel@calian.com>
References: <20210325192643.2190069-1-robert.hancock@calian.com>
In-Reply-To: <20210325192643.2190069-1-robert.hancock@calian.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5 (3.28.5-16.el8) 
authentication-results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=calian.com;
x-originating-ip: [204.83.154.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 166c059f-3324-4dea-d0d4-08d8f9e543ad
x-ms-traffictypediagnostic: YT1PR01MB2361:
x-microsoft-antispam-prvs: <YT1PR01MB23616123CDAA07ECEC14B5C4EC759@YT1PR01MB2361.CANPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7IfD6MriMvdNGuvIj7jQoZ0zVtiSNqI2vj98rEoXaWQegpOmnr2UzTxiHhdyH1yfq17FsMJAr8zuuD2aIQmDWu5SLG+1Q6R6S/Af93CLaF/6SMjpiYhCfA0IVmGJWmi/c6p0iYHiHjLt89dXX2C8JR7r05iX/tze1tvElYFJXM7qF5fqOJ37OwXeyl5jDCLOQSLS07Zn37vVN0FnnUy5Vi1ARQAOLFKkgxVtwXc5a6TXJrjLe9GafxZUA867MqaELx8mg8oJHzaq12uXk1XwDaNFEagGhun9CKM9m7E9itzvx3d7HGbGXcBnWWD8FIZ53x/tDZCq+9INovqFm8DndQKgDiC4b9wdWQ9Hj+OvfAYeldncplxvJw2CTaBCQUqiYz26P5idZG9+tJbcPxc4qHKShencU0nDfpV9mPMGKOlE4LTTLZiCCcz7drN5AMec9r/v7jCpe2k0vVhGJs7dMyhAzsz9VEKS5cR+2W3P/WTXrv9i5XUQvh/JREeosiY8jgJ/8EGevtHwFjVUdxqMYGoa8ZHGZ8bjZr5Ieyce2noy/Onj0RO29sF8cR27giPqOaGQoi4wejvlSesjPysjxV+OapWDQ+xPCGh2vkxUn5b/GE7mwRP+UdPBdaCRyTC41vUO3hTY4x1pegEhn1gIUIbmN6heRXMAYQGyuyV9ZnpB3BlAsOnjO3gV83t49n3O75xBiX4MaVzwYpzY6dbB8S9FWouc2E9jmgzK2ExetyQn4Z7nWdwKFgHAMoR11/1O3GX9DMY3mpCDAVIxIjjc9BAnidsTn4o6rVzGW8fnEMs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(39850400004)(396003)(376002)(44832011)(2616005)(5660300002)(86362001)(36756003)(83380400001)(91956017)(15650500001)(76116006)(2906002)(316002)(66446008)(66476007)(66556008)(66946007)(64756008)(15974865002)(6486002)(110136005)(54906003)(26005)(4326008)(8936002)(6512007)(38100700001)(71200400001)(478600001)(8676002)(186003)(6506007)(99106002)(18886075002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?Rmh1RjZucWtwbkloeFA0M0phZElNSGIxcTFyT0M2Y1B2VTJpbGQvQWl1UkYw?=
 =?utf-8?B?WjlBMjZqL1dOM2NaNXhRVnlZYjN6QWVuQ0kvZmxYbkN4SmlGbWFmR09IdWRu?=
 =?utf-8?B?VWlNR0JtamNsQVJRQWZ2U0VxWFU3LzN2a2pwcllUYmk2b09GNDNvdENBR1U0?=
 =?utf-8?B?ZEt1UVVmbTF4amoxYXloRjUvRWZPbkw2aEk0L1U0aHFMWkwzdjliWVRkeTdt?=
 =?utf-8?B?VnV1Q0J1bStVTFBZbU04MStFNHdnNkdVZGpaNW5jeE1mWU5DWDJ3V0pXN0Fs?=
 =?utf-8?B?dTJZdFVuNno3S3JIdkNXbGhrVjdnMURvQVREd0FFeGR1cnYxU2FWSUpPYS9z?=
 =?utf-8?B?UWVVL3VGemtIdkMrcndkbnlGOHdiQndwYVVxeWZueFJkaDNkckhBTFQwRzR4?=
 =?utf-8?B?MW9RRVRHQ1J1OXhXeUtVT3FGTUtnUytLYmJ3Ykx4ZVd4MzZlYlpZbnBlOGlM?=
 =?utf-8?B?Z3FIVlJMWGRlWUI1cXlyZG9Vby9KWmxOdElZSnZRWnRNa0RoZlpsTUdQR3JN?=
 =?utf-8?B?cmlWUkZwVndyMk9FVHpLRDdZUTg1eVZFeVprOXF3OVdBZlp6SCs2R3NsTytY?=
 =?utf-8?B?UUZMSUlzZW9keXN4clk5RHVsaHExOW9keWkwNnJJc3pwNFZuZG1waW9uUzVH?=
 =?utf-8?B?SklDQWxUaHAzcEl2RUVHS1Y0N3Rva0lCUUdBdVNORDZmUkgzSmVIQ0Z6UVZ1?=
 =?utf-8?B?dHZ1SSt5dUNqQ3M2QXBSMFdKczIyS1JPNkRYb2I3TnNjdVFzU05FSSt3NVlh?=
 =?utf-8?B?UXo4OW5DemF1cU5UKzRKWEdjc2NEajU0dWdQQzFMOG1WRFpVZXF1Zi9mRnE5?=
 =?utf-8?B?RnE0bzVGL2VhTFdtcVJhSVRqdVVKMUMrQ3IwVnc2Y1lHVHJPRWUrTkFxdEor?=
 =?utf-8?B?SHhWZ0tORndxKy8wUms0UzdPdkFPRVlkeGZnV01Ld0tJSzhGZTFxYWllK3JI?=
 =?utf-8?B?WXIxZHJmelZZTktWMmxqZmNDOTJsMzdMOFlQQ2lUQStSWXlPR1V2cFkrOHFL?=
 =?utf-8?B?dzlLSi9mTURaa2JKc2hXTndIZ0FKNGFOdzZoTjIrYjVKNVZsTStqVTJVc0M5?=
 =?utf-8?B?K0kvc1JURjRmQThXV3RsNHIxQWR1NHN4RDJjN1k1QTRMdkpWTTFpaWRiRDY2?=
 =?utf-8?B?QVQxbUg2UkxoUk8wdTYvVEM1RlZDdmJlMjV2WDVTSU9mVUNZN2Z3TnNLMjcw?=
 =?utf-8?B?QlpEUG9LVGcxSzd4SWd6Q1V6STlPNjNMQ3IrOW1ZWEhrS0RYL3lLb2Y5dHkz?=
 =?utf-8?B?UGdnL1Npckt2aVB4YktlZkswTkk3Rm5XWllPY0prdUJkei9teFVrWkFkZ1BQ?=
 =?utf-8?B?dVlEcW1lN3ZYckJrcCtVa0VTRlJKcnN1T2RtZWxqRmgvODFudXYwby9OZlgy?=
 =?utf-8?B?Z1l0bnBxSkF5UE5yck5PdE90SmM2dWYxSmxBNWRxazNIdStnQ29naVFtaUZl?=
 =?utf-8?B?cGZpMlBTNlNnSGdEdnptbTJiNWdTRXNMOW9xMThUbmxKQzU5b0VnK1pZS3o3?=
 =?utf-8?B?Tno3SzA4TkhiYytIcGpsNkp2S1JvdW4vTklvbkhLNTJZSjNWZVMvRmdoS1g1?=
 =?utf-8?B?M2Nkd1haRzlGTytSbzdyc0tWZDFqbVhKMFU1RkYwOUFqYUFjVCttcGx3dStD?=
 =?utf-8?B?VGNYTjdQNHBjT2V3Q2U1eW1ZRHVlOEU2SytHeEpuR3lBNlZhMVFyaEM4WHhS?=
 =?utf-8?B?a001ZjYzWnlEb1R4NzA3NkFKRCtuRzNhK0xiQWo2Yy9MYmR6UElmOXQyRnRw?=
 =?utf-8?B?K0JycWszL1RUd254SFRHV29zSlUwN0dBY3I5Z3VjanZubkwzVU0yTERScjM2?=
 =?utf-8?B?elpsTlQ1ZFkrdy9vaGFrdz09?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <F5EBCCDCDC9CDC47A53BA8AC301CFAE2@CANPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 166c059f-3324-4dea-d0d4-08d8f9e543ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2021 16:50:35.0567
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5NbJn5R4mi8XgDeYvLwhSjHERmMO4ZnQllefx77L55mMvFlh3JUULRqUg5YNw3hvS3LBRTQaqBxWoka2ZDthgxK6T/9DZK3bafjewTRR+0U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT1PR01MB2361
X-Proofpoint-GUID: ruYtDlfez3UqztSyrWtOfpWZqqu6Yxa3
X-Proofpoint-ORIG-GUID: ruYtDlfez3UqztSyrWtOfpWZqqu6Yxa3
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-07_09:2021-04-07,2021-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 adultscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104070113
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

T24gVGh1LCAyMDIxLTAzLTI1IGF0IDEzOjI2IC0wNjAwLCBSb2JlcnQgSGFuY29jayB3cm90ZToN
Cj4gVmFyaW91cyBmaXhlcyBhbmQgZW5oYW5jZW1lbnRzIHRvIHRoZSBTaTUzNDEgZHJpdmVyLg0K
PiANCj4gQ2hhbmdlZCBzaW5jZSB2MjoNCj4gLWNoYW5nZWQgcmVndWxhdG9yIHJlZmVyZW5jZSBm
b3Igb3V0cHV0IHN1cHBseSBmcm9tIHZkZCB0byB2ZGRvIHRvIG1hdGNoDQo+IGRhdGEgc2hlZXQN
Cj4gDQo+IENoYW5nZWQgc2luY2UgdjE6DQo+IC13YWl0IHVwIHRvIDMwMG1zIGZvciBERVZJQ0Vf
UkVBRFkNCj4gLXVzZSByZWdtYXBfcmVhZF9wb2xsX3RpbWVvdXQgcmF0aGVyIHRoYW4gZml4ZWQg
d2FpdCB3aGVuIHdhaXRpbmcgZm9yIFBMTA0KPiBsb2NrIGFuZCBpbnB1dCBwcmVzZW5jZQ0KPiAt
bWFrZSBzaTUzNDFfcmVtb3ZlIHN0YXRpYw0KPiANCj4gUm9iZXJ0IEhhbmNvY2sgKDkpOg0KPiAg
IGR0LWJpbmRpbmdzOiBjbG9jazogY2xrLXNpNTM0MTogQWRkIG5ldyBhdHRyaWJ1dGVzDQo+ICAg
Y2xrOiBzaTUzNDE6IFdhaXQgZm9yIERFVklDRV9SRUFEWSBvbiBzdGFydHVwDQo+ICAgY2xrOiBz
aTUzNDE6IEF2b2lkIGRpdmlkZSBlcnJvcnMgZHVlIHRvIGJvZ3VzIHJlZ2lzdGVyIGNvbnRlbnRz
DQo+ICAgY2xrOiBzaTUzNDE6IENoZWNrIGZvciBpbnB1dCBjbG9jayBwcmVzZW5jZSBhbmQgUExM
IGxvY2sgb24gc3RhcnR1cA0KPiAgIGNsazogc2k1MzQxOiBVcGRhdGUgaW5pdGlhbGl6YXRpb24g
bWFnaWMNCj4gICBjbGs6IHNpNTM0MTogQWxsb3cgZGlmZmVyZW50IG91dHB1dCBWRERfU0VMIHZh
bHVlcw0KPiAgIGNsazogc2k1MzQxOiBBZGQgc2lsYWJzLHhheGItZXh0LWNsayBwcm9wZXJ0eQ0K
PiAgIGNsazogc2k1MzQxOiBBZGQgc2lsYWJzLGlvdmRkLTMzIHByb3BlcnR5DQo+ICAgY2xrOiBz
aTUzNDE6IEFkZCBzeXNmcyBwcm9wZXJ0aWVzIHRvIGFsbG93IGNoZWNraW5nL3Jlc2V0dGluZyBk
ZXZpY2UNCj4gICAgIGZhdWx0cw0KPiANCj4gIC4uLi9iaW5kaW5ncy9jbG9jay9zaWxhYnMsc2k1
MzQxLnR4dCAgICAgICAgICB8ICAxNiArLQ0KPiAgZHJpdmVycy9jbGsvY2xrLXNpNTM0MS5jICAg
ICAgICAgICAgICAgICAgICAgIHwgMzI0ICsrKysrKysrKysrKysrKystLQ0KPiAgMiBmaWxlcyBj
aGFuZ2VkLCAzMDQgaW5zZXJ0aW9ucygrKSwgMzYgZGVsZXRpb25zKC0pDQo+IA0KDQpQaW5nLi4g
YW55IGZlZWRiYWNrIG9uIHRoaXMgcGF0Y2ggc2V0PyAoQXNpZGUgZnJvbSBvbmUgYWNrIG9uIHBh
dGNoIDEuLikNCg0KLS0gDQpSb2JlcnQgSGFuY29jaw0KU2VuaW9yIEhhcmR3YXJlIERlc2lnbmVy
LCBDYWxpYW4gQWR2YW5jZWQgVGVjaG5vbG9naWVzDQp3d3cuY2FsaWFuLmNvbQ0K
