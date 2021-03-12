Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	URI_NOVOWEL,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 040D0C433DB
	for <linux-clk@archiver.kernel.org>; Fri, 12 Mar 2021 15:24:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C078C64FDD
	for <linux-clk@archiver.kernel.org>; Fri, 12 Mar 2021 15:24:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231876AbhCLPXy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Mar 2021 10:23:54 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:7872 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231733AbhCLPXr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 Mar 2021 10:23:47 -0500
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12CFDATo021971;
        Fri, 12 Mar 2021 10:23:41 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2054.outbound.protection.outlook.com [104.47.61.54])
        by mx0c-0054df01.pphosted.com with ESMTP id 375yymhgcx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 12 Mar 2021 10:23:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oExeFPppvNRdqAQyYuIxD1/q2muBZciohMknMAnboxvkbSjZ278qO/Wzy3cEZgvXLNOqyWm448Dx2VuUYQ+kj9MwqRO/Xcx3R/YkAuxsq15JVKDXFNWvc+Z8rhhyaCbtIypi4qbvpitv9wFtEHsQRw3XNNSff33ytaWs86AeOMIihBzuFNfrnXQR1er5W6pgx9NALyEPbnxcFTCBWBuUtJN+Lp8aoOtApPpk3iTDLCz2e0HJc/mGGqw3IbN8Bk2A7kHwdHurFagy/5V7O5n21v3YTUhERUbUF6GwmHyc89xUXm5QFxCRgGzXLIltIx+QTAC87NCXGme3/X2zjxRDhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uTVKvMDCAaoWbozizm6Ld9iHDHhlmDwCbXWHfQKvTZc=;
 b=AraByAm2FtA3Ju9ipZgcdZ6tLO1iCuFoawqj4SQBTC5mDkeRkf1qar619tE+CBJZ1+jbAUwxoNVUeb5hv0FfBQ6r/Luk8Ex23Du2GW2qORYwKKE9bqJhRsNxXMsO5pY1qNo6K9lDRojDUZvKWqmAxq/VCFtfNpHRT5fBN11PShOh3HJjhWA2D7WBPngbXQc7NkLh5ITaf1fx6kyM7bt3nIc9syowALfFywJsKFTr3Xh1IpW8na1FaTC2D3VcgVCz0fwBjH5pytzkJzW3qJGc+V/d5bRl2df+A7wiudAAN6RumaPm/MPCVdpjRarNpmT1Y1NR0NOSFusznMx3L48/QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uTVKvMDCAaoWbozizm6Ld9iHDHhlmDwCbXWHfQKvTZc=;
 b=WlZwPzaFqG3YJBOD8RjwR6D451VQxZQgnaHnE/O0c7cBNH3RIyd4Ylo/WcKAPrMUJNDW1R1+2Ii+oNYju8FJGDn+EeMOhthSVaqhk5jsy1w7Lg93fg+siydshyjlO8zyGtMngD6tf1EaDOmclMBx3Eh0ZOyr87sOOJsa9rfWYDE=
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f::20)
 by YT1PR01MB3849.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:1::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Fri, 12 Mar
 2021 15:23:39 +0000
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb]) by YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb%7]) with mapi id 15.20.3912.031; Fri, 12 Mar 2021
 15:23:39 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     "mike.looijmans@topic.nl" <mike.looijmans@topic.nl>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 4/9] clk: si5341: Check for input clock presence and PLL
 lock on startup
Thread-Topic: [PATCH 4/9] clk: si5341: Check for input clock presence and PLL
 lock on startup
Thread-Index: AQHXFsVn/V6Bwyh/bE6VmVV6rWeWcqp/6bYAgACQGAA=
Date:   Fri, 12 Mar 2021 15:23:39 +0000
Message-ID: <677cd14a487bd1f90472f8d9ab91acf9004c9313.camel@calian.com>
References: <20210311222436.3826800-1-robert.hancock@calian.com>
         <20210311222436.3826800-5-robert.hancock@calian.com>
         <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.9334a909-9494-43d0-954a-ed0ddcbb7b5d@emailsignatures365.codetwo.com>
         <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.65c76637-8114-4fae-8c6a-53980ec7e70b@emailsignatures365.codetwo.com>
         <4e81437e-da75-bc76-2b5b-4b7c78ba927a@topic.nl>
In-Reply-To: <4e81437e-da75-bc76-2b5b-4b7c78ba927a@topic.nl>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5 (3.28.5-16.el8) 
authentication-results: topic.nl; dkim=none (message not signed)
 header.d=none;topic.nl; dmarc=none action=none header.from=calian.com;
x-originating-ip: [204.83.154.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5907dc9e-4092-499d-15db-08d8e56ad028
x-ms-traffictypediagnostic: YT1PR01MB3849:
x-microsoft-antispam-prvs: <YT1PR01MB3849CDA61C609DEFEA7A57A3EC6F9@YT1PR01MB3849.CANPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AalQsAIlC+ekrI3oUq6XPV8wih4nO/lKsD9unCzDYaaDgFWSEqYN5uZf91LkE9t6if46LQprbtn1FPZeSdNtl+PN7A3rC/l89AeYXEnosN68Fvv1qAR5wKkfbp3ndX1JcIQP7LDeTvKU/rghKEft9G2Tz/XqbIx/XEhi6msQSwXiQKgMpmtJvj2KXLLv5r/9HVw2XN0Yko62AA0FRIsP/u2ukp6hstcK3Wu6OO5lt0hyZCF5/CaTLeP1I+EGpJS93pB06IP10hgPSd5d60eY/SbcbGxEUU9GGfa94LID4xMIczNrzEwgO4F8AGVt/UeZphFbK9vazh48exfLpAbn0ADHXAY+nq/dfXQ/k9G4fFz+mouslmmbPm/KgxtJDn2htj/t3XrU8x6pWoBCMFKgaU/dEwRzsorRj2FdqoYPO2fOyATw3V3eLU8NQ1FqvlwefC28CnYX27gkbRE5zRNMZaDXpjn0rr5fdbpT+JG1xCZv0kOoKblmWwlxT+TdPxBKV89ZuQrXHD6fPqnRDkgevU0jHPy3+oh19es5tDkoMSFvO6DdT5J1+DNh5saXmUcQUx9d/zNSYXQxq5mEPBmkNMOjh6o2QwZh54v60kgxgvxO1w54MNXrxWOXI7DvNKo8GrQcORFNCV8l0NWgyAivkw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(346002)(136003)(396003)(366004)(8936002)(66446008)(966005)(71200400001)(478600001)(26005)(66476007)(91956017)(76116006)(8676002)(64756008)(83380400001)(66556008)(44832011)(66946007)(86362001)(186003)(2616005)(5660300002)(36756003)(6486002)(316002)(4326008)(6512007)(6506007)(2906002)(54906003)(53546011)(110136005)(99106002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?Z2ttWXRVWkNlU2p4YVJqMTAzMGZ3ekV3VTF3RzVxQ0twQy85UzBzdmp4WS91?=
 =?utf-8?B?MUFlVkVjbXZXTnZ6QzNYY3FPaGJ4VS9xWk1pck9TNVh3UHdzeEZ1WkVlSW1y?=
 =?utf-8?B?aUVwUmM2ZzFpOHpPVGhjZlU5UDFIcWxxYmtJcGZYOHN6VFlVb3Z5SG1WSXB5?=
 =?utf-8?B?WnNJUEFMRytYV01XaDgyVU9QRFFyczRKbXBocmg2UGtseTJiUVBzVkd2eGJr?=
 =?utf-8?B?OGtxeE5YVkdHQ3Ixa0xxcS9GRzJhSjRZRWx5dlNnLzNqeDVJUEwvdXNzYUpQ?=
 =?utf-8?B?azk0d1ZDNXNHM3piUmZPR0MrWGt3RVhEZWRLT09ad3lXWmM2L1YxRU8rZlJh?=
 =?utf-8?B?SlB4eTdJS01VQTFDRktSczg3Q3dKRUF3Q0xrUjl5L1FlU0dnWTltSlMxeVor?=
 =?utf-8?B?M2pPUHhISUQ3ajZDb09KalV3amF0QitrVTBqM1ptQ1NzT2Znc0NyN2pESzZR?=
 =?utf-8?B?WDJ1WnZXdXhzTHhHdmdZTStOVkE3QzdZT0dVRnlYVElUZ1d6eUVVblo0V1ZW?=
 =?utf-8?B?OHVNbW1vcGxSWDk3VWRlMzQwc3FsZEZWVThhVVF0cnNKNEd2am11WXRmUlFr?=
 =?utf-8?B?YjRmY1k5dXUzNVRGUVdWL0Z6ZytwRklVMXpWQ29TYnB4bTVxODcrKzRrZHlB?=
 =?utf-8?B?eXgzQ1Q5YkJWb1RGM0gyTU91aS8ydHpMVmRvYnlmV1lsTTJHWU9KK2dQcXR5?=
 =?utf-8?B?NldtYVA5Z3pHS0RlVVlzSm91aEZ6Vk1EaU9hcTBWTUM3dk1nN3dTZ0xtUVFW?=
 =?utf-8?B?Q1M5VzRzcTRqM1ZFL1V2RC9FOGlaVkpXUVJwc3gvT3U4cDRwRzZlRzJRYUpZ?=
 =?utf-8?B?ci9DNFYxZmdRMmhsL21vVWVRRkdBQlUraS9McE1RNlZ0cEE2aFdldFk0Z3Q2?=
 =?utf-8?B?SWp1RTFESVdISG5lb0RtcGk0bDZ2SUFXWDdMc1hieWNNNkIwOEs4c29qQ2Zv?=
 =?utf-8?B?M3JqZCtMUnhIMmNmclNiTzlnS3pQUHhKN3hMVEwreVo3cGxnZGZEMUt5bjZD?=
 =?utf-8?B?NFJuS3g2NDVwdW9nVzcyejdUTGZyMU1kNFdVUHFXYitwRVRVSk5vRGhLdTdr?=
 =?utf-8?B?U2Z1dmpiS2VKQ0IyelVHS2RQazhhZVplelpjSktvVHVyWC9BTC9QNlQwTUQ3?=
 =?utf-8?B?RHlMZ1ozRGhubUtpNUZTYmZpOUk0YjN0QjllOEx4RHppSFpYMzlDOXhiOVVF?=
 =?utf-8?B?T1ZWTVFTc1JMMzZHTUlFWEVjeGRQNjN6N3FtTnExMzZBc2h4T0taeEFIQllM?=
 =?utf-8?B?T3F4bFAyeXNsN1BsZEFiY2trOTJvUGx3aFhHOFB0QmEreFhZMGRqL2Jmc25T?=
 =?utf-8?B?OTk3SytoWDVFY3hGTmgrdzAwb05UanVZVVNmWkNuTWdHcWo1WTZJUWhxTkw3?=
 =?utf-8?B?T2FyTHJtejNDVE03cHpHYXllR2ZFZHZUZXNrVUVzVXpXeUNUcTJCU1pVdCtj?=
 =?utf-8?B?TG05ekRobEh3cmM0bWtNT2tMYyszQlJCL1h6SU5DSGNVK0dqK3V2VWdmMDJQ?=
 =?utf-8?B?TzlNclpCeDk5UUxOMnVuVy9NYTlDb1djS0lnWUFhYkJEc0J6bU9mMWZUTXF6?=
 =?utf-8?B?VVlEVnRzV01lQ3hEeHI1VTBYWGxwaHNWM0VSWU1kNE5TQURPRmkyNmhHMVRl?=
 =?utf-8?B?cEQ5MjlNZE55RENxaFpQUmRONUlhSGx1alc5WkIvVXlNcmpJQnlmUHRxblNv?=
 =?utf-8?B?UmJqOUZoODVRU0Y1SUhnSEZMSTBFL3ZQdW9pT3U4VkV6eTd2TFNWTUZEN0sx?=
 =?utf-8?Q?H7NaInvyjYp0MPGkDBJubXVAkRz70aXoSUWeM0G?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <7B867EADC557A944BDBC3AE56F15003B@CANPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5907dc9e-4092-499d-15db-08d8e56ad028
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2021 15:23:39.4097
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A8OMpwh5g5M4+fPfGCFw5gxJcbux//IEt9L37Woh+l1/GF+ttXo7bnTaQvQh08w0ru8IbBxN9HbOIjqvAd+CyHelRl10N8tvBjohWT67/6I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT1PR01MB3849
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

T24gRnJpLCAyMDIxLTAzLTEyIGF0IDA3OjQ3ICswMTAwLCBNaWtlIExvb2lqbWFucyB3cm90ZToN
Cj4gTWV0IHZyaWVuZGVsaWprZSBncm9ldCAvIGtpbmQgcmVnYXJkcywNCj4gDQo+IE1pa2UgTG9v
aWptYW5zDQo+IFN5c3RlbSBFeHBlcnQNCj4gDQo+IA0KPiBUT1BJQyBFbWJlZGRlZCBQcm9kdWN0
cyBCLlYuDQo+IE1hdGVyaWFhbHdlZyA0LCA1NjgxIFJKIEJlc3QNCj4gVGhlIE5ldGhlcmxhbmRz
DQo+IA0KPiBUOiArMzEgKDApIDQ5OSAzMyA2OSA2OQ0KPiBFOiBtaWtlLmxvb2lqbWFuc0B0b3Bp
Y3Byb2R1Y3RzLmNvbQ0KPiBXOiANCj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHA6
Ly93d3cudG9waWNwcm9kdWN0cy5jb21fXzshIUlPR29zMGshd2lXdEhHUnh4YTQ1OWU0Y0RrZTFl
MUxOb205azU1aDVheUh0NnQwQ2JvRi10TXhZOGJnWVdpUnNwbGJ6eHo2c045NCQNCj4gIA0KPiAN
Cj4gUGxlYXNlIGNvbnNpZGVyIHRoZSBlbnZpcm9ubWVudCBiZWZvcmUgcHJpbnRpbmcgdGhpcyBl
LW1haWwNCj4gT24gMTEtMDMtMjAyMSAyMzoyNCwgUm9iZXJ0IEhhbmNvY2sgd3JvdGU6DQo+ID4g
QWZ0ZXIgaW5pdGlhbGl6aW5nIHRoZSBkZXZpY2UsIGFsbG93IHN1ZmZpY2llbnQgdGltZSBmb3Ig
dGhlIFBMTCB0byBsb2NrDQo+ID4gKGlmIHdlIHJlY29uZmlndXJlZCBpdCkgYW5kIHZlcmlmeSB0
aGF0IHRoZSBpbnB1dCBjbG9jayBpcyBwcmVzZW50IGFuZCB0aGUNCj4gPiBQTEwgaGFzIGxvY2tl
ZCBiZWZvcmUgZGVjbGFyaW5nIHN1Y2Nlc3MuDQo+ID4gDQo+ID4gRml4ZXM6IDMwNDRhODYwZmQg
KCJjbGs6IEFkZCBTaTUzNDEvU2k1MzQwIGRyaXZlciIpDQo+ID4gU2lnbmVkLW9mZi1ieTogUm9i
ZXJ0IEhhbmNvY2sgPHJvYmVydC5oYW5jb2NrQGNhbGlhbi5jb20+DQo+ID4gLS0tDQo+ID4gICBk
cml2ZXJzL2Nsay9jbGstc2k1MzQxLmMgfCA0NiArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKQ0KPiA+
IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9jbGstc2k1MzQxLmMgYi9kcml2ZXJzL2Ns
ay9jbGstc2k1MzQxLmMNCj4gPiBpbmRleCAyZDY5YjIxNDRhY2YuLjUyMjFlNDMxZjZjYiAxMDA2
NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2Nsay9jbGstc2k1MzQxLmMNCj4gPiArKysgYi9kcml2ZXJz
L2Nsay9jbGstc2k1MzQxLmMNCj4gPiBAQCAtOTIsNiArOTIsOSBAQCBzdHJ1Y3QgY2xrX3NpNTM0
MV9vdXRwdXRfY29uZmlnIHsNCj4gPiAgICNkZWZpbmUgU0k1MzQxX1BOX0JBU0UJCTB4MDAwMg0K
PiA+ICAgI2RlZmluZSBTSTUzNDFfREVWSUNFX1JFVgkweDAwMDUNCj4gPiAgICNkZWZpbmUgU0k1
MzQxX1NUQVRVUwkJMHgwMDBDDQo+ID4gKyNkZWZpbmUgU0k1MzQxX0xPUwkJMHgwMDBEDQo+ID4g
KyNkZWZpbmUgU0k1MzQxX1NUQVRVU19TVElDS1kJMHgwMDExDQo+ID4gKyNkZWZpbmUgU0k1MzQx
X0xPU19TVElDS1kJMHgwMDEyDQo+ID4gICAjZGVmaW5lIFNJNTM0MV9TT0ZUX1JTVAkJMHgwMDFD
DQo+ID4gICAjZGVmaW5lIFNJNTM0MV9JTl9TRUwJCTB4MDAyMQ0KPiA+ICAgI2RlZmluZSBTSTUz
NDFfREVWSUNFX1JFQURZCTB4MDBGRQ0KPiA+IEBAIC05OSw2ICsxMDIsMTIgQEAgc3RydWN0IGNs
a19zaTUzNDFfb3V0cHV0X2NvbmZpZyB7DQo+ID4gICAjZGVmaW5lIFNJNTM0MV9JTl9FTgkJMHgw
OTQ5DQo+ID4gICAjZGVmaW5lIFNJNTM0MV9JTlhfVE9fUEZEX0VOCTB4MDk0QQ0KPiA+ICAgDQo+
ID4gKy8qIFN0YXR1cyBiaXRzICovDQo+ID4gKyNkZWZpbmUgU0k1MzQxX1NUQVRVU19TWVNJTkNB
TAlCSVQoMCkNCj4gPiArI2RlZmluZSBTSTUzNDFfU1RBVFVTX0xPU1hBWEIJQklUKDEpDQo+ID4g
KyNkZWZpbmUgU0k1MzQxX1NUQVRVU19MT1NSRUYJQklUKDIpDQo+ID4gKyNkZWZpbmUgU0k1MzQx
X1NUQVRVU19MT0wJQklUKDMpDQo+ID4gKw0KPiA+ICAgLyogSW5wdXQgc2VsZWN0aW9uICovDQo+
ID4gICAjZGVmaW5lIFNJNTM0MV9JTl9TRUxfTUFTSwkweDA2DQo+ID4gICAjZGVmaW5lIFNJNTM0
MV9JTl9TRUxfU0hJRlQJMQ0KPiA+IEBAIC0xNDAzLDYgKzE0MTIsMjkgQEAgc3RhdGljIGludCBz
aTUzNDFfY2xrX3NlbGVjdF9hY3RpdmVfaW5wdXQoc3RydWN0DQo+ID4gY2xrX3NpNTM0MSAqZGF0
YSkNCj4gPiAgIAlyZXR1cm4gcmVzOw0KPiA+ICAgfQ0KPiA+ICAgDQo+ID4gK3N0YXRpYyBpbnQg
c2k1MzQxX2NoZWNrX2hlYWx0aHkoc3RydWN0IGNsa19zaTUzNDEgKmRhdGEpDQo+ID4gK3sNCj4g
PiArCXUzMiBzdGF0dXM7DQo+ID4gKwlpbnQgcmVzID0gcmVnbWFwX3JlYWQoZGF0YS0+cmVnbWFw
LCBTSTUzNDFfU1RBVFVTLCAmc3RhdHVzKTsNCj4gPiArDQo+ID4gKwlpZiAocmVzIDwgMCkgew0K
PiA+ICsJCWRldl9lcnIoJmRhdGEtPmkyY19jbGllbnQtPmRldiwgImZhaWxlZCB0byByZWFkIHN0
YXR1c1xuIik7DQo+ID4gKwkJcmV0dXJuIHJlczsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwlpZiAo
KHN0YXR1cyAmIFNJNTM0MV9TVEFUVVNfTE9TUkVGKSkgew0KPiA+ICsJCWRldl9lcnIoJmRhdGEt
PmkyY19jbGllbnQtPmRldiwgImlucHV0IGNsb2NrIG5vdCBwcmVzZW50XG4iKTsNCj4gPiArCQly
ZXR1cm4gLUVJTzsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwlpZiAoKHN0YXR1cyAmIFNJNTM0MV9T
VEFUVVNfTE9MKSkgew0KPiA+ICsJCWRldl9lcnIoJmRhdGEtPmkyY19jbGllbnQtPmRldiwgIlBM
TCBub3QgbG9ja2VkXG4iKTsNCj4gPiArCQlyZXR1cm4gLUVJTzsNCj4gPiArCX0NCj4gPiArDQo+
ID4gKwlyZXR1cm4gMDsNCj4gPiArfQ0KPiA+ICsNCj4gPiAgIHN0YXRpYyBpbnQgc2k1MzQxX3By
b2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQsDQo+ID4gICAJCWNvbnN0IHN0cnVjdCBpMmNf
ZGV2aWNlX2lkICppZCkNCj4gPiAgIHsNCj4gPiBAQCAtMTU4MCw2ICsxNjEyLDIwIEBAIHN0YXRp
YyBpbnQgc2k1MzQxX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQsDQo+ID4gICAJCWVy
ciA9IHNpNTM0MV9maW5hbGl6ZV9kZWZhdWx0cyhkYXRhKTsNCj4gPiAgIAkJaWYgKGVyciA8IDAp
DQo+ID4gICAJCQlyZXR1cm4gZXJyOw0KPiA+ICsNCj4gPiArCQkvKiBhbGxvdyB0aW1lIGZvciBQ
TEwgdG8gbG9jayAqLw0KPiA+ICsJCW1zbGVlcCgyNTApOw0KPiANCj4gQ2FuJ3QgdGhpcyBiZSBh
IHBvbGwgbG9vcCB3aXRoIHRpbWVvdXQ/IFNlZW1zIHJhdGhlciBoYXJzaCB0byBqdXN0IHNsZWVw
IA0KPiBoZXJlLg0KDQpJbmRlZWQsIHJlZ21hcF9yZWFkX3BvbGxfdGltZW91dCB3b3VsZCBsaWtl
bHkgd29yayBoZXJlLiBXaWxsIGFkZHJlc3MgaW4gdjIuDQoNCj4gDQo+ID4gKwl9DQo+ID4gKw0K
PiA+ICsJZXJyID0gc2k1MzQxX2NoZWNrX2hlYWx0aHkoZGF0YSk7DQo+ID4gKwlpZiAoZXJyKQ0K
PiA+ICsJCXJldHVybiBlcnI7DQo+ID4gKw0KPiA+ICsJLyogY2xlYXIgc3RpY2t5IGFsYXJtIGJp
dHMgZnJvbSBpbml0aWFsaXphdGlvbiAqLw0KPiA+ICsJZXJyID0gcmVnbWFwX3dyaXRlKGRhdGEt
PnJlZ21hcCwgU0k1MzQxX1NUQVRVU19TVElDS1ksIDApOw0KPiA+ICsJaWYgKGVycikgew0KPiA+
ICsJCWRldl9lcnIoJmNsaWVudC0+ZGV2LCAidW5hYmxlIHRvIGNsZWFyIHN0aWNreSBzdGF0dXNc
biIpOw0KPiA+ICsJCXJldHVybiBlcnI7DQo+ID4gICAJfQ0KPiA+ICAgDQo+ID4gICAJLyogRnJl
ZSB0aGUgbmFtZXMsIGNsayBmcmFtZXdvcmsgbWFrZXMgY29waWVzICovDQo+IA0KPiANCg==
