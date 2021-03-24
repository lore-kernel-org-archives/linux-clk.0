Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C75CAC433E1
	for <linux-clk@archiver.kernel.org>; Wed, 24 Mar 2021 17:17:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 954EC61A24
	for <linux-clk@archiver.kernel.org>; Wed, 24 Mar 2021 17:17:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236700AbhCXRQj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 24 Mar 2021 13:16:39 -0400
Received: from mx0c-0054df01.pphosted.com ([67.231.159.91]:1470 "EHLO
        mx0c-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236526AbhCXRQZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 24 Mar 2021 13:16:25 -0400
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12OHCtvW016474;
        Wed, 24 Mar 2021 13:16:14 -0400
Received: from can01-qb1-obe.outbound.protection.outlook.com (mail-qb1can01lp2056.outbound.protection.outlook.com [104.47.60.56])
        by mx0c-0054df01.pphosted.com with ESMTP id 37dc5xakns-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 24 Mar 2021 13:16:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MQF5FNRzBu8mbtKJ5caG41nyb2+9cthpdovaB9nRDpEwgomXCN4YsUK2iuvuGdFNacua4WqMzZDcS7zdfmxHBABD9iu4+ngziwtJKWsUQVjT73Lnu0icacv/wLJ+8tLUuLEEtp/dDiMTYrs/aFRyXSGMak4GFNLIZ5N+W2dHVbHtvc/lAreDQBzNezD7a2hUnD3H/52uvFU/nEVaE4INis7llPou0sfCrjTsNoGHluNpJZjtvahDVvaieh37QTbykvq4XBCm4EE18fFyX8gbRlwsnSDnakqOvazf8F7bLWohipb3kaKlt3+R4xa8yD3LI3hI6iAQcqKurIzG0bu6AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4VQWcXIMt0eMyIjqYqeTNXteiU68nR8rGjvIVugtQbs=;
 b=a/tog5f437HKDkdOu5SlHFppoA1uwnT8EczUXWhCTkUF9AIpAdVnsJ0B+QMdfCxI2GpjPf0MTqZFO+BLOBO/+1qi1X/UrYfRQOU3Fov/YLvWxYq6QhGolxY/QvcHUssEWD86GfwD1ufjIfWd+WADqNqt6uWY/na3wO/9Yt3iMmgHr7ImtAqWlPLGWLfQdgyR2BW4/tVefJImBMws5B6ReX+CKtX7tm+1f5WLHxd8qZoeSmI3jm2bOXFjD8B6J9B5u8Ifno2ds3FimhWGvy5BcM7UT1ZMH0ENUCJGI7xPL0LwPajL6sYWxFty7WTr9v8YYsjKmelwl4VQtCwQ55F5eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4VQWcXIMt0eMyIjqYqeTNXteiU68nR8rGjvIVugtQbs=;
 b=xewXbwPjHadrFP12+90BXYIuA4DvhvJ9Ik9ne8yo+q/GgQXYRnHwdZE4UJ4vr67k+1ncRb77Vx2PerwaHOSqpdNa9akNK6OfqFwSDQRO3+wFAgvOgmiFeJOloplzNDWOdF6jH2vQbfzxerEThc6ljdDQQG1uU7fRO++uXWsopQM=
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f::20)
 by YT1PR01MB2858.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:1::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.25; Wed, 24 Mar
 2021 17:16:12 +0000
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb]) by YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb%7]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 17:16:12 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     "robh@kernel.org" <robh@kernel.org>
CC:     "mike.looijmans@topic.nl" <mike.looijmans@topic.nl>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v2 1/9] dt-bindings: clock: clk-si5341: Add new attributes
Thread-Topic: [PATCH v2 1/9] dt-bindings: clock: clk-si5341: Add new
 attributes
Thread-Index: AQHXF2v8Vu8bmustWkyx/oLFU+nVG6qTcMsAgAADIwA=
Date:   Wed, 24 Mar 2021 17:16:12 +0000
Message-ID: <8158ff34354412577ae4da2416a7cfb1db9bfc24.camel@calian.com>
References: <20210312181710.3998978-1-robert.hancock@calian.com>
         <20210312181710.3998978-2-robert.hancock@calian.com>
         <20210324170458.GA3177057@robh.at.kernel.org>
In-Reply-To: <20210324170458.GA3177057@robh.at.kernel.org>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5 (3.28.5-16.el8) 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=calian.com;
x-originating-ip: [204.83.154.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aebdfcd2-5545-4867-4fbc-08d8eee88672
x-ms-traffictypediagnostic: YT1PR01MB2858:
x-microsoft-antispam-prvs: <YT1PR01MB28587C864A0733E37CE37CC8EC639@YT1PR01MB2858.CANPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UMa+cqWqqIhKVKuDzsZRzKCTgRTaaC4GDJa1wQpLnNBz42c1qf2U+94n8irfU0DIc+uQEgAge99CpNuA08uim29ZHrEt/gEbDZEuELnkZUjOB3uxbb949kWRA2sTGhMElHx3FszT8EkzqY0PeL63kFxAFo+T5gGA6j7WoCUfWk1+rW9Ylfh3NoyZoL1rbdYZai6VfLXd1vMUGtBblbZndNL70hmSYt79yGdKUcXzVBhuf/5C7lFO3BUcjo5v4H6AA6xj4Hml94Nf88MVKD1D2Yz+A8zISxcbqu6UTWrnc+4T/sDM0pEPZ4rfLzZweYKAQkg+69gh+vg4KtLQDc2aJa8lf0UwDsGSJalS+TsTXHtt9xCQolN6h52Vg2scXOpY+xcdsoOHWnUXCebNCsBEwKz87k7cqlzoXxnUKwkIs0GRUEySZmgX1t+379+N/UNxrqYeIW61AJyLbrVT6LP8buNReSUlVhASU2iXVtewbpCvik6TqAxPaC04NXV62+8atA52yOQ5W5L+a6jWg2/XYu4S2QOm84Nmwe3dyfUmCPihQHZo57Ykkl0g+7oY5mkD+Nx1kxmVWbt/05tuwNdTVVvOkIPZ29O9VxwRDGmUTXcCaArjnp10aygGWqp22uwxvzEyJnOmOhcvWVieH1ee3gIpkHtYBLIgPb/ctuw/a3iQxDH1QuvQDh4hBffRs9k3waO8b591eWfiXojnqwJYDTjYJQWaguE8xnZ61tZjgEfCkbblT/RFkiON+hJgiTJZXqg3LZVOvRR+Fo0tZgqDVzvYhzVJdiRIO+DsLJquD9M=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(39850400004)(346002)(366004)(71200400001)(83380400001)(478600001)(86362001)(15974865002)(38100700001)(6506007)(2906002)(6486002)(6916009)(2616005)(4326008)(8676002)(186003)(26005)(5660300002)(6512007)(36756003)(66556008)(66476007)(66946007)(64756008)(44832011)(76116006)(316002)(8936002)(66446008)(54906003)(91956017)(99106002)(18886075002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?ZmdYWWRXZW5ZbkFPT0tObVRJMmhZZWQ4VlJmVVh2dmEzY21JZWJZMlNFV2Zq?=
 =?utf-8?B?SVRPV2M5cDhJNnQ0ZCtDOGE3eHVlVVV5YmxxZmx1aHREY0poejFuM1pFNDBx?=
 =?utf-8?B?MVZieCtjeGM5ajJkN3J1cVlkQmZzaXBJVHlGMHI2Zjdla1E2QVFJRENGRmt1?=
 =?utf-8?B?aUFZL2t5L1UwQUhRNU5hYmNKajN1RjRLR0FQeHpHV1ZtcDFnM3duek0zU0Nu?=
 =?utf-8?B?UldMSnp5WUsyNjhLZHE2NVU4SG84aUFEbXdsWlB0NXpuZkNXbDZEVlBuNjhp?=
 =?utf-8?B?TngzeC92R1BUQmdwZ20rWHhsdzZObGdTSDFOcnd4SFl1em1pRFhlRGR6NzRm?=
 =?utf-8?B?S2x5cnRTZmhHeHN3WGFaclZvQWJDWERZaVVuVmt0S0Ywc0MzTy9ZVjQzTkor?=
 =?utf-8?B?RGNGdXJvTWYyS1NROVM0UFRxZlpzTHBUUUdxdmFBMnpWSlhqQVNUTElrdkhH?=
 =?utf-8?B?cFJYQXRtdk1wZjhpQUFwU3UxWlJiZG9SMG1PeDY3SHp5RC9Iby9VRDl0UXBU?=
 =?utf-8?B?WjkxL3IwbFZEUHU0VUhWMDFnbXd2UUtjOGFVUjhQb0lUYjlldmI2WkpjbFQ1?=
 =?utf-8?B?UnBnN091KzhDeVRrbk1sZmlhRTlXV0V1L2dscWJHSC8yVkZkdllLMTFvd3Vk?=
 =?utf-8?B?ZzEvZDBPYlh2VlI0WUtmcjR1d3FiMTdwYjk1a0lhOWx4S1cxL3hvQllpaTVn?=
 =?utf-8?B?RDJUdTQ2V2JvQU9FcWdRWDJ4aVZNRzdtTGVjWXZ1NXJzY0kySzhKR2RCd0FM?=
 =?utf-8?B?N29uNWFZS1lOYkkyUEdqdlo0Q2syTDRyTUFCMGl4dWZLNkNGejh1QUxvR2JV?=
 =?utf-8?B?RXhQb0RYaXpSSnBISjNXUE1BQ1A3aUpmbUlQYjUwR1YyYk9CaEIxa0NUVXV0?=
 =?utf-8?B?dlhHTUt4VGdCbWZJMGNESU51VGIyZUdxV3hKV1I1ZWkyOWhPSkgwNGE5bzY3?=
 =?utf-8?B?S1FRWGtJdGtocldoVzFQMWZMejltZ3pxeHJURzNiUzR2aVBOWnVBT05CNDJW?=
 =?utf-8?B?S1A5R3MvMmx0am4xakMwWktJcVFBQ21oaEFYRnlOUVlrT0huMStxRzRqL2lQ?=
 =?utf-8?B?Q2lDWTkxQTlxaWppQkFaVTNEWVg4TFJteG9sekxUeFpBSGlrSzdzeHNVYWFX?=
 =?utf-8?B?eTNuODVoSmxwSFJGckRLSG0vVGtLMEhpemRxa0k4c08veDBjU05tTEhQdyt0?=
 =?utf-8?B?eER6Z2pUbmJIaFpzRDF6dE9sOTNSY2hscDc5dld4MWg5YkdvakNMeHhXSlVr?=
 =?utf-8?B?TGJsbTBxMXNoSENTMjllYzlhNUNqNHU2TW1LNGZURk5BZ3c2WmY2Y0U2Vmsv?=
 =?utf-8?B?U2NPQ3VEWmRtL1dNY3d5T0FsNVZndzZUaTU4clJYZXdVR2gzYWZoaHA5bFRv?=
 =?utf-8?B?ZW1HMTYzeFozenZVaGdPWTVxUUgyZDlHRU00R2cvRWdDVFZkOWxzc0xZN201?=
 =?utf-8?B?cjhKVGV3eFBNOHBmc3BNM0VaVkJ0ZldPMkFKN0pSNlZiY0RSMHpTUlZGbjJW?=
 =?utf-8?B?ZFMvR3dVR3pFSTE2dE9ncFJBQlovK3BuMVNJODQzbVVKcnRqVGI2OW1aZkVs?=
 =?utf-8?B?YzNDUWhDa0xZMHJpcDJxRm10YzhBN05jSVdBQ1YwWDFHQ0p6Uks2OW9CdDVT?=
 =?utf-8?B?ay9GK3ljRzlWQ2tvR3ducHA0YksvZVM2U1VnMWNZZVBZWHpPTWJUYnhPS1Fv?=
 =?utf-8?B?RFc3Vjl5cXZsS3FYOE4xVW13UXJoRTJFUkJNcWlXNjI0NC82NVJ5czBydU1a?=
 =?utf-8?B?ZTJDWStFOC9tMGFNNjBXdTh6OG9jdWRsUkdoMEhnbjZRWDVFTTFnQy9SS0dP?=
 =?utf-8?B?QjdEbUZTNXlmZFBqQmRtQT09?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <0343877C00A46B41BA282533A1CB71F4@CANPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: aebdfcd2-5545-4867-4fbc-08d8eee88672
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2021 17:16:12.7357
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r9FbhMzPxjn6K/NlfESPwvjJzrNgNgyc/oW0dV+qWn+sWlma6/b7N+sftPUQtt59DDrfgObgCjnWkuuQ0FAH3CXvloPRBpHAr3o67AEaR6I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT1PR01MB2858
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-24_13:2021-03-24,2021-03-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0
 suspectscore=0 mlxscore=0 clxscore=1011 mlxlogscore=999 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103240125
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

T24gV2VkLCAyMDIxLTAzLTI0IGF0IDExOjA0IC0wNjAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4g
T24gRnJpLCBNYXIgMTIsIDIwMjEgYXQgMTI6MTc6MDJQTSAtMDYwMCwgUm9iZXJ0IEhhbmNvY2sg
d3JvdGU6DQo+ID4gQWRkIG5ldyBzaWxhYnMseGF4Yi1leHQtY2xrIGFuZCBzaWxhYnMsaW92ZGQt
MzMgcHJvcGVydGllcy4NCj4gPiANCj4gPiBDaGFuZ2VkIHZkZC1zdXBwbHkgb24gdG9wLWxldmVs
IG5vZGUgdG8gb3B0aW9uYWwgc2luY2UgaXQgaXMgbm90IGFjdHVhbGx5DQo+ID4gdXNlZCBieSB0
aGUgZHJpdmVyLg0KPiA+IA0KPiA+IFJlbW92ZWQgdmRkLXN1cHBseSBmcm9tIG91dHB1dCBzdWIt
bm9kZXMsIGFzIGl0IHdhcyBub3Qgc3VwcG9ydGVkIGJ5IHRoZQ0KPiA+IGRyaXZlciBhbmQgaXQg
aXMgbm90IGVhc2lseSBwb3NzaWJsZSB0byBzdXBwb3J0IHRoaXMgaW4gdGhhdCBsb2NhdGlvbiB3
aXRoDQo+ID4gdGhlIGtlcm5lbCByZWd1bGF0b3IgaW5mcmFzdHJ1Y3R1cmUuIENoYW5nZWQgdG8g
aGF2ZSB2ZGRYLXN1cHBseQ0KPiA+IGF0dHJpYnV0ZXMgZm9yIGVhY2ggb3V0cHV0IG9uIHRoZSB0
b3AtbGV2ZWwgZGV2aWNlIG5vZGUuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogUm9iZXJ0IEhh
bmNvY2sgPHJvYmVydC5oYW5jb2NrQGNhbGlhbi5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Nsb2NrL3NpbGFicyxzaTUzNDEudHh0ICB8IDE2ICsrKysrKysrKyst
LS0tLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25z
KC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9jbG9jay9zaWxhYnMsc2k1MzQxLnR4dA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Nsb2NrL3NpbGFicyxzaTUzNDEudHh0DQo+ID4gaW5kZXggNTA0Y2NlM2Fi
ZTQ2Li4xY2Y3ZTAwMmNiMTYgMTAwNjQ0DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Nsb2NrL3NpbGFicyxzaTUzNDEudHh0DQo+ID4gKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL3NpbGFicyxzaTUzNDEudHh0DQo+ID4gQEAg
LTI0LDkgKzI0LDggQEAgaXQuDQo+ID4gIA0KPiA+ICBUaGUgZGV2aWNlIHR5cGUsIHNwZWVkIGdy
YWRlIGFuZCByZXZpc2lvbiBhcmUgZGV0ZXJtaW5lZCBydW50aW1lIGJ5DQo+ID4gcHJvYmluZy4N
Cj4gPiAgDQo+ID4gLVRoZSBkcml2ZXIgY3VycmVudGx5IG9ubHkgc3VwcG9ydHMgWFRBTCBpbnB1
dCBtb2RlLCBhbmQgZG9lcyBub3Qgc3VwcG9ydA0KPiA+IGFueQ0KPiA+IC1mYW5jeSBpbnB1dCBj
b25maWd1cmF0aW9ucy4gVGhleSBjYW4gc3RpbGwgYmUgcHJvZ3JhbW1lZCBpbnRvIHRoZSBjaGlw
IGFuZA0KPiA+IC10aGUgZHJpdmVyIHdpbGwgbGVhdmUgdGhlbSAiYXMgaXMiLg0KPiA+ICtUaGUg
ZHJpdmVyIGN1cnJlbnRseSBkb2VzIG5vdCBzdXBwb3J0IGFueSBmYW5jeSBpbnB1dCBjb25maWd1
cmF0aW9ucy4gVGhleQ0KPiA+IGNhbg0KPiA+ICtzdGlsbCBiZSBwcm9ncmFtbWVkIGludG8gdGhl
IGNoaXAgYW5kIHRoZSBkcml2ZXIgd2lsbCBsZWF2ZSB0aGVtICJhcyBpcyIuDQo+ID4gIA0KPiA+
ICA9PUkyQyBkZXZpY2Ugbm9kZT09DQo+ID4gIA0KPiA+IEBAIC00NSw5ICs0NCw5IEBAIFJlcXVp
cmVkIHByb3BlcnRpZXM6DQo+ID4gIAljb3JyZXNwb25kaW5nIHRvIGlucHV0cy4gVXNlIGEgZml4
ZWQgY2xvY2sgZm9yIHRoZSAieHRhbCIgaW5wdXQuDQo+ID4gIAlBdCBsZWFzdCBvbmUgbXVzdCBi
ZSBwcmVzZW50Lg0KPiA+ICAtIGNsb2NrLW5hbWVzOiBPbmUgb2Y6ICJ4dGFsIiwgImluMCIsICJp
bjEiLCAiaW4yIg0KPiA+IC0tIHZkZC1zdXBwbHk6IFJlZ3VsYXRvciBub2RlIGZvciBWREQNCj4g
PiAgDQo+ID4gIE9wdGlvbmFsIHByb3BlcnRpZXM6DQo+ID4gKy0gdmRkLXN1cHBseTogUmVndWxh
dG9yIG5vZGUgZm9yIFZERA0KPiA+ICAtIHZkZGEtc3VwcGx5OiBSZWd1bGF0b3Igbm9kZSBmb3Ig
VkREQQ0KPiA+ICAtIHZkZHMtc3VwcGx5OiBSZWd1bGF0b3Igbm9kZSBmb3IgVkREUw0KPiA+ICAt
IHNpbGFicyxwbGwtbS1udW0sIHNpbGFicyxwbGwtbS1kZW46IE51bWVyYXRvciBhbmQgZGVub21p
bmF0b3IgZm9yIFBMTA0KPiA+IEBAIC02MCw3ICs1OSwxNCBAQCBPcHRpb25hbCBwcm9wZXJ0aWVz
Og0KPiA+ICAgIGJlIGluaXRpYWxpemVkLCBhbmQgYWx3YXlzIHBlcmZvcm1zIHRoZSBzb2Z0LXJl
c2V0IHJvdXRpbmUuIFNpbmNlIHRoaXMNCj4gPiB3aWxsDQo+ID4gICAgdGVtcG9yYXJpbHkgc3Rv
cCBhbGwgb3V0cHV0IGNsb2NrcywgZG9uJ3QgZG8gdGhpcyBpZiB0aGUgY2hpcCBpcw0KPiA+IGdl
bmVyYXRpbmcNCj4gPiAgICB0aGUgQ1BVIGNsb2NrIGZvciBleGFtcGxlLg0KPiA+ICstIHNpbGFi
cyx4YXhiLWV4dC1jbGs6IFdoZW4gcHJlc2VudCwgaW5kaWNhdGVzIHRoYXQgdGhlIFhBL1hCIHBp
bnMgYXJlDQo+ID4gdXNlZA0KPiA+ICsgIGluIEVYVENMSyAoZXh0ZXJuYWwgcmVmZXJlbmNlIGNs
b2NrKSByYXRoZXIgdGhhbiBYVEFMIChjcnlzdGFsKSBtb2RlLg0KPiA+ICAtIGludGVycnVwdHM6
IEludGVycnVwdCBmb3IgSU5UUmIgcGluLg0KPiA+ICstIHNpbGFicyxpb3ZkZC0zMzogV2hlbiBw
cmVzZW50LCBpbmRpY2F0ZXMgdGhhdCB0aGUgSTJDIGxpbmVzIGFyZSB1c2luZw0KPiA+IDMuM1YN
Cj4gPiArICByYXRoZXIgdGhhbiAxLjhWIHRocmVzaG9sZHMuDQo+IA0KPiBIb3cgZG9lcyBjb21t
dW5pY2F0aW9uIG92ZXIgSTJDIHRvIHNldCB0aGUgcmVnaXN0ZXIgZm9yIHRoaXMgd29yayBpZiB0
aGUgDQo+IHJlZ2lzdGVyIHNldHRpbmcgaXMgd3Jvbmc/IEkgZ3Vlc3MgaXQncyBqdXN0IGxlYWth
Z2UgY3VycmVudC4uLg0KDQpJdCBhcHBlYXJzIHRoZSBjb21tdW5pY2F0aW9uIHN0aWxsIHdvcmtz
LCBqdXN0IGxlc3Mgb3B0aW1hbGx5PyBGcm9tIHRoZQ0KcmVmZXJlbmNlIG1hbnVhbDoNCg0KIlRo
ZSBJT19WRERfU0VMIGNvbmZpZ3VyYXRpb24gYml0IG9wdGltaXplcyB0aGUgVklMLCBWSUgsIFZP
TCxhbmQgVk9IDQp0aHJlc2hvbGRzIHRvIG1hdGNoIHRoZSBWRERTIHZvbHRhZ2UuIEJ5IGRlZmF1
bHQgdGhlIElPX1ZERF9TRUwgYml0IGlzIHNldCB0bw0KdGhlIFZERCBvcHRpb24uIFRoZSBzZXJp
YWwgaW50ZXJmYWNlIHBpbnMgYXJlIGFsd2F5cyAzLjMgViB0b2xlcmFudCBldmVuIHdoZW4NCnRo
ZSBkZXZpY2UncyBWREQgcGluIGlzIHN1cHBsaWVkIGZyb20gYSAxLjggViBzb3VyY2UuIFdoZW4g
dGhlIEkyQyBvciBTUEkgaG9zdA0KaXMgb3BlcmF0aW5nIGF0IDMuMyBWIGFuZCB0aGUgU2k1MzQw
LzQxIGF0IFZERCA9IDEuOCBWLCB0aGUgaG9zdCBtdXN0IHdyaXRlIHRoZQ0KSU9fVkREX1NFTCBj
b25maWd1cmF0aW9uIGJpdCB0byB0aGUgVkREQSBvcHRpb24uIFRoaXMgd2lsbCBlbnN1cmUgdGhh
dCBib3RoIHRoZQ0KaG9zdCBhbmQgdGhlIHNlcmlhbCBpbnRlcmZhY2UgYXJlIG9wZXJhdGluZyBh
dCB0aGUgb3B0aW11bSB2b2x0YWdlIHRocmVzaG9sZHMuIg0KDQo+IA0KPiA+ICstIHZkZFgtc3Vw
cGx5ICh3aGVyZSBYIGlzIGFuIG91dHB1dCBpbmRleCk6IFJlZ3VsYXRvciBub2RlIGZvciBWREQg
Zm9yIHRoZQ0KPiA+ICsgIHNwZWNpZmllZCBvdXRwdXQuIFRoZSBkcml2ZXIgc2VsZWN0cyB0aGUg
b3V0cHV0IFZERF9TRUwgc2V0dGluZyBiYXNlZCBvbg0KPiA+IHRoaXMNCj4gPiArICB2b2x0YWdl
Lg0KPiANCj4gVGhpcyBpcyBjYWxsZWQgdmRkb1ggaW4gdGhlIGRhdGFzaGVldC4NCg0KSW5kZWVk
LCB0aGF0IHdvdWxkIGxpa2VseSBtYWtlIG1vcmUgc2Vuc2UuIFdpbGwgdXBkYXRlIGZvciB2My4N
Cg0KPiANCj4gPiAgLSAjYWRkcmVzcy1jZWxsczogc2hhbGwgYmUgc2V0IHRvIDEuDQo+ID4gIC0g
I3NpemUtY2VsbHM6IHNoYWxsIGJlIHNldCB0byAwLg0KPiA+ICANCj4gPiBAQCAtNzcsOCArODMs
NiBAQCBSZXF1aXJlZCBjaGlsZCBub2RlIHByb3BlcnRpZXM6DQo+ID4gIC0gcmVnOiBudW1iZXIg
b2YgY2xvY2sgb3V0cHV0Lg0KPiA+ICANCj4gPiAgT3B0aW9uYWwgY2hpbGQgbm9kZSBwcm9wZXJ0
aWVzOg0KPiA+IC0tIHZkZC1zdXBwbHk6IFJlZ3VsYXRvciBub2RlIGZvciBWREQgZm9yIHRoaXMg
b3V0cHV0LiBUaGUgZHJpdmVyIHNlbGVjdHMNCj4gPiBkZWZhdWx0DQo+ID4gLQl2YWx1ZXMgZm9y
IGNvbW1vbi1tb2RlIGFuZCBhbXBsaXR1ZGUgYmFzZWQgb24gdGhlIHZvbHRhZ2UuDQo+ID4gIC0g
c2lsYWJzLGZvcm1hdDogT3V0cHV0IGZvcm1hdCwgb25lIG9mOg0KPiA+ICAJMSA9IGRpZmZlcmVu
dGlhbCAoZGVmYXVsdHMgdG8gTFZEUyBsZXZlbHMpDQo+ID4gIAkyID0gbG93LXBvd2VyIChkZWZh
dWx0cyB0byBIQ1NMIGxldmVscykNCj4gPiAtLSANCj4gPiAyLjI3LjANCj4gPiANCi0tIA0KUm9i
ZXJ0IEhhbmNvY2sNClNlbmlvciBIYXJkd2FyZSBEZXNpZ25lciwgQ2FsaWFuIEFkdmFuY2VkIFRl
Y2hub2xvZ2llcw0Kd3d3LmNhbGlhbi5jb20NCg==
