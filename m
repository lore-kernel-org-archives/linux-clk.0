Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5715EC433FE
	for <linux-clk@archiver.kernel.org>; Wed,  9 Nov 2022 11:57:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbiKIL5X (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Nov 2022 06:57:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbiKIL5W (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 9 Nov 2022 06:57:22 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C4CD1C907
        for <linux-clk@vger.kernel.org>; Wed,  9 Nov 2022 03:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1667995041; x=1699531041;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=OQ5bUa4xn8nsrghMMTsPA3tRJMarFL8PgB2ZDhZLDC4=;
  b=u5VkvUyADdNDuuGz79Jh2txUqS/Tn1gnXZH8Zly36Lg9/3tpBTG+/nzp
   AWF3w75HnpZNsstvHhZ+cHtV3GgqQ79nTlFBqTNHwKLE+ZNcpkpHodbO4
   KuJQqsAahBSbF09lAuu/wFuolFss5VSw2Ul3HwsmrBOhF3TwGOZaJVVso
   tr+nzT7JtWA0kcb5wJ2+PVzZqMcrjHC1Kr0fBZxTjuz2JT/pf0iS/9a9Y
   sH8F15qlMZ5ia21iCS7WeVbQNubDJFmlmOlqvN3ggmnqdfp/zd+IT7UOI
   jvNv6nK/MjrAkDR4BHRjhZW21A/gX6Yd9huf0E2T7/z81vEm3Bh1Utvbi
   A==;
X-IronPort-AV: E=Sophos;i="5.96,150,1665471600"; 
   d="scan'208";a="186101002"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Nov 2022 04:57:20 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 9 Nov 2022 04:57:19 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Wed, 9 Nov 2022 04:57:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UgMKqRyWxN/u97P+K/e1Kqwnwy1O4VH7nRLfqm89ajLRNGJmy62ToDSZomaPgcWAJh2V8up+RrXDfoGqhg8M5OW0jC/eVMMLkw9EHy4CmoeoTOvUrtoggo5auhKESMsmOWR1mGhhOvrGWiWFdzcGXxs4mnKUT8T0d/FzAhWpyCEOJanPIDZD9yosf+zzyZwgg3Z9TGE3KG3u6iSTBEGcZVNK+oYeV3khsfbb43j5LIkRJ05JIlzZittWTwTd8LJtCbxNQfzMu1SwsKYKfEeY7OZE9bWKmrk/iMXJcI8/6jXRsX2KVNpxk2BqgnmY2SGbEPzCvePaL2oAwVqSVfVE3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OQ5bUa4xn8nsrghMMTsPA3tRJMarFL8PgB2ZDhZLDC4=;
 b=KeP9YJl23Pj0E9KQzDAFJ9eIAiq/sot1CsCRdCVfM9xTvBBX3b/zZjtEJe4oapZHyFXZll0+yeDTMElyEZPNNY6SoRiJ6NsAFFM9S9WlsqNuAZvqs6ugFpg151QQzfr/hzrBRIIpNK5GNsPO6SIOAdTQJB6D9kfcvrHa5uFQRKtlUmM3D5ABjD66IBvPbbFT6W79eT5ze+6Q1UgE9G2C3L1WWCd8QrWW8XDM6JLlB6oxMg0XWbwXOmxpBp795MdMn1aFZWySs9twLx8Uqn+HVjFNv1lBz3UTAk0QcvsYvTBEgaWIZVb732eOtGIkSnzkGVDyrV4uVBng6h+22/8eAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQ5bUa4xn8nsrghMMTsPA3tRJMarFL8PgB2ZDhZLDC4=;
 b=DUfJRAvfVR0Nr29A4ZR5qINcN/pSIOdL8xt8n+ZkqNDpzpwpcSdF8EJDTIpo01x8wzvi0josbNnNTlrwcSEcgwTjjIlZMxPRHJWcyIaHnlkKUED4g6NViCEwqQDXIFetY2zI9xk4xsiuwM1wjH6LEGlh1/7iuGccWagwM5rdVDQ=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by BL1PR11MB5400.namprd11.prod.outlook.com (2603:10b6:208:311::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Wed, 9 Nov
 2022 11:57:15 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::51f:528c:5fde:40a2]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::51f:528c:5fde:40a2%3]) with mapi id 15.20.5813.012; Wed, 9 Nov 2022
 11:57:15 +0000
From:   <Claudiu.Beznea@microchip.com>
To:     <m.grzeschik@pengutronix.de>,
        <linux-arm-kernel@lists.infradead.org>
CC:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <Ludovic.Desroches@microchip.com>, <linux-clk@vger.kernel.org>,
        <kernel@pengutronix.de>
Subject: Re: [PATCH v2 2/4] clk: at91: rm9200: fix usb device clock id
Thread-Topic: [PATCH v2 2/4] clk: at91: rm9200: fix usb device clock id
Thread-Index: AQHY9DJoGZRMPqJVFEK1e7hGeaFdhA==
Date:   Wed, 9 Nov 2022 11:57:15 +0000
Message-ID: <53a4b30b-36c9-32b8-b41c-6d52fa5030f0@microchip.com>
References: <20221104215516.2874922-1-m.grzeschik@pengutronix.de>
 <20221104215516.2874922-3-m.grzeschik@pengutronix.de>
In-Reply-To: <20221104215516.2874922-3-m.grzeschik@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR11MB1953:EE_|BL1PR11MB5400:EE_
x-ms-office365-filtering-correlation-id: 62a33a67-1460-49ba-a4a4-08dac2498b42
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1MZ0rIPphMVIQGnKmReFJKELmo3892EQ/KppITJWki4npauqODJvbbfPn2pzu2nsAiavlHdRiFynpIs8/pTJdReBRM/Pgg0HJ34TldlzlhA6t/nlEfW/lajhTv1hLRRv5g2b6USczyL3XRHwiCNZXcFgB7LxcvAfxd70tvkp79CYBRPPAoNh8xpVfkw0VXdQfA4jBb8PtDyaQ406DD6L+Bklo3iP8ISmCvNNM15DzCtMLRr/29Tn/oiIOErwlSHhAtqy/XdWV2vSptIwEuU0v9baXWu/LZONwV2iPsncFqFr5uQRoAt7a5teBQ+sSC+bIxpVk53qOG9nA5jaNApVE4TEaUyRE0QyUEOp4tuNsAVSlFJ/WifSnv+UmdotY+OoQ1L3WURDRQQW5C0wYeaEo312oWIPnZ83Z8INVnUztzibaECmzoLrz5EzabJaGWGe3f8IUd4gyR76hslKCSB0W1tDrgIGzesSfth4v59rq7KTbXzgk7VJy186qSwUuDd2E++pitte3rjSEn1r3v8jX8WImKqHSGYFqwww8CW7TgEfQ61ZvCtyVz89KyAR6aBp9JxHLcoZg97paVl++HFXdaI/lk7JxeAWjUykacAoCHOhltfk1ZF89IIkEHK/UL8dQsXgcGufWB8QZRRAuxy3tf0eiDA0ofuCo0M3S+Qyn4N37D5h7HUNm28chUJ2Gvor3LbUyir7dzJ+xGYjPygt22sT+Q0VUMXF2/RSEPAbGBY5I+d11k32XUwRpMfqYPNKMg7GGZT/YQXXcbtROaLPmOtm8KTdA6NiObAVvwN/nczvSkwbKqwwxFnkPGt7hNWf2cj7dbSEaPELSocWR1VU/A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1953.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(136003)(366004)(376002)(39860400002)(396003)(451199015)(31696002)(38070700005)(66946007)(86362001)(8936002)(6512007)(54906003)(66446008)(76116006)(66556008)(66476007)(64756008)(26005)(8676002)(4326008)(41300700001)(5660300002)(91956017)(186003)(71200400001)(53546011)(6486002)(110136005)(6506007)(2616005)(478600001)(316002)(122000001)(38100700002)(83380400001)(36756003)(31686004)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dUxlUFNXbC9HRGd6OXdNUlJDM3UzT1dWMmpCRnJpTXFNYXZub0VqNTZoVTBn?=
 =?utf-8?B?N0FqaHQzL1pXTWhGUmJkUzIwdis5K0N0SXFWMGt6Z29xbmtuWFBJTm8xbFRk?=
 =?utf-8?B?aGVibmQ5bngyeXBvNTMyNWh1blovZTlNbkY0VnM5U2RKZWtud3hReWQwOWpU?=
 =?utf-8?B?NUtONXFQanl6cnU2UG9XYWJxRmhiUUFNMlJuem1KbDRUVmt2OHhMMmUySkpu?=
 =?utf-8?B?clljUkhxMDMwTUlSaTZFMC9YNEUvZWoxZ3dWMVZDbTRFblFnazdTcTN4TXNF?=
 =?utf-8?B?RXY5WVA5V1E1ak04cWt3WDVBR2VyMDhVZFR3T1J6OXNJQU40aThTMDk3RFp6?=
 =?utf-8?B?Tk91SkFPUjlWMHpOczJTczVBZVRzVWlwcVhlMndqSVFvaXZLU3RIVnJLRXdZ?=
 =?utf-8?B?U1ZwNUw0OTdtcTI1MU5ta3dWSHVuaDdYczlkN21OS1I5UWJSc3BuZUVTWGow?=
 =?utf-8?B?aHVlRDBBbm5uN3B5ck5xRENoc2NSRU5BTzNobWxueFlDV3cvZ245OEk5ajNW?=
 =?utf-8?B?a2wrcHVUaFFCTlF3OThZNms5UVZhM3gxK0NBc0hZMWhFL3ZseEZ6RmU1bW5B?=
 =?utf-8?B?WXJVMXJYdHpLUUdMYWh0MFJtVE81b1dBWnk0M1UycmdMMFJOZEQ3WE10WnFO?=
 =?utf-8?B?eHRNUnRscCtUOGlwQTZKR3ZMMmx2MmliWVVLclFsR1cvcU45cW1jejdNQU9P?=
 =?utf-8?B?Q0lyWGI1UkVYNk83b3VIU0s1THZ2VFlIWis4Szh2QTJPT3V4WGwvZHEwMVlW?=
 =?utf-8?B?dG1udTFwT0RQVG5aZlUwaE01eW40bEtRbEZIVnFNeEI4Z2RGRCtOSHJiTTlz?=
 =?utf-8?B?clBSMTBERU1wbFNsWjIyVWNxbFYvRUYrOXBhckgwaTZoV0JDaXVXckdTL0kx?=
 =?utf-8?B?dTdkak96VDk0WmN5VmhZU2I0eldKajlrWWg3RU1FK0dLNTc2Mzk3QlhibTg1?=
 =?utf-8?B?WjM4Z3pkRGllRWtyc0x6OW5TRnlKQkVFb3VPMlphR01UZ2doN1N5aVdjYUxs?=
 =?utf-8?B?bWpSU2lUdjA3cnlKU0gxbWdJNy9Ua3pTc1diZkpSTU50bWZZMEdzdGFxV3RO?=
 =?utf-8?B?Qm1tNnRITlFsNjQzVGozVUNrNkJvTmxGOU5LdnIxb2hTY0NZMXRYdmxRU0dL?=
 =?utf-8?B?dTJjZyt3Rk0ybTQvS2l1U1kwMUlSUXNPZk5xbjdCS0RjVklJbmlEVDl1aWhY?=
 =?utf-8?B?aTdkQnppckhwaHdhaTdHRmJocU53K1BpdDRoN0ZLdzB4NW9lblRFUFprVysy?=
 =?utf-8?B?ejR4UjZXLy96eDVSYkNzNDBRTGpGcXdDS3hIdVA5eVNlL0liZTVzQ1JsdERu?=
 =?utf-8?B?VzZUbmRUVUlJdU9MVk1VWHlOOGJJWTVVNHlOK1NBT1hXeW5vYjlwVnR1Q2Iz?=
 =?utf-8?B?ajJUM3JPT0Zla2NVUWVSQ3NKZ25kYmo5clRGSjNHZ0JvN1cxVzJQVlgwZW9C?=
 =?utf-8?B?ckNQNU5VL0JNSEs2RXhkcE81SklwVGM3eS9vZFlUWTRDaVNwTFNmVlVtQnVQ?=
 =?utf-8?B?SG5IWDFUM2srM3lqNUhiS0k1Q1R1MjBiOXk4UWtqV2tKSXBsR21JWHRJdVlp?=
 =?utf-8?B?bWpwc1pYQytnMXo0d0ZiTGk4VjVBemE1RGtNdnJtUFlkcUxlWmI3WTIxRFdo?=
 =?utf-8?B?SW12b2RZMDUzVmt2UE43OEQvK0hQVmM1ZWZySzd1OUw3WW5wbHp5V0hyblNY?=
 =?utf-8?B?Nk9KRm5LdTlsTHNUR1VsQ1BZL3A2M1lXY0ZSalhjNTlMWmtmeVgyL2dEZURN?=
 =?utf-8?B?RGhueERFOUNtRnF0eVd1MFJmMVB6TmxNTG9lS3lyVlp1MG1yeENnUENLYmZE?=
 =?utf-8?B?YmxOelc3a0hPRlJ1WlV2VnFhalFsTnFlNW9ZdWRLcWFNU015ekR6OWR6TzI5?=
 =?utf-8?B?THpURGVVMzlCT0NJek4wQi9WM0VhQURZZlNTaCtPMFlPNUluME5lclhFaC9n?=
 =?utf-8?B?ZEt6M1hLSlhhQ2NmWTB3dFdIemFwb0dsM244bXozdTlJRWZHdWNkS3hBeW9T?=
 =?utf-8?B?dU9lMDA5Y3M0Um1YcTc4cmNIMk02TTJKNlJkKzM4aExKWUthMUdIZ2hubHhU?=
 =?utf-8?B?ekxhMUFlODFoQkVLblBJUGd3U2xlcC9ZYy85TlNmamVkU3paTnBTbm9LUi85?=
 =?utf-8?B?empMbWJjdjEza1MzbGk0MXA4cGRSQnZXWVVNcVcrUXU5dUtWVk1YZ2lGdG9Q?=
 =?utf-8?B?Mnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <425E3EA8364616489BB039388AFEE2EB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62a33a67-1460-49ba-a4a4-08dac2498b42
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2022 11:57:15.0991
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kUFh9srBkPrQVdeS0rot9KLa0+f1XqxVbAeylrH6bXPhEcSTjZAuoZ+CUY4K3hZgxlH9aTnk/eQDfvxOowiQwCswnPVEi8q5YTTIJLk+AVo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5400
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

T24gMDQuMTEuMjAyMiAyMzo1NSwgTWljaGFlbCBHcnplc2NoaWsgd3JvdGU6DQo+IEVYVEVSTkFM
IEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91
IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gUmVmZXJyaW5nIHRvIHRoZSBkYXRhc2hl
ZXQgdGhlIGluZGV4IDIgaXMgdGhlIE1DS1VEUC4gV2hlbiBlbmFibGVkLCBpdA0KPiAiRW5hYmxl
cyB0aGUgYXV0b21hdGljIGRpc2FibGUgb2YgdGhlIE1hc3RlciBDbG9jayBvZiB0aGUgVVNCIERl
dmljZQ0KPiBQb3J0IHdoZW4gYSBzdXNwZW5kIGNvbmRpdGlvbiBvY2N1cnMiLiBXZSBmaXggdGhl
IGluZGV4IHRvIHRoZSByZWFsIFVEUA0KPiBpZCB3aGljaCAiRW5hYmxlcyB0aGUgNDggTUh6IGNs
b2NrIG9mIHRoZSBVU0IgRGV2aWNlIFBvcnQiLg0KPiANCj4gQ2M6IG10dXJxdWV0dGVAYmF5bGli
cmUuY29tDQo+IENjOiBzYm95ZEBrZXJuZWwub3JnDQo+IENjOiBuaWNvbGFzLmZlcnJlQG1pY3Jv
Y2hpcC5jb20NCj4gQ2M6IGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tDQo+IENjOiBsdWRv
dmljLmRlc3JvY2hlc0BtaWNyb2NoaXAuY29tDQo+IENjOiBjbGF1ZGl1LmJlem5lYUBtaWNyb2No
aXAuY29tDQo+IENjOiBsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnDQo+IENjOiBsaW51eC1hcm0t
a2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gQ2M6IGtlcm5lbEBwZW5ndXRyb25peC5kZQ0K
PiBGaXhlczogMDJmZjQ4ZTRkN2Y3IChjbGs6IGF0OTE6IGFkZCBhdDkxcm05MjAwIHBtYyBkcml2
ZXIpDQoNCkZpeGVzIHRhZyBzaG91bGQgYmUgaW4gZm9ybWF0Og0KDQo8c2hhLWlkPiAoImNvbW1p
dCBkZXNjcmlwdGlvbiIpDQoNCj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBHcnplc2NoaWsgPG0u
Z3J6ZXNjaGlrQHBlbmd1dHJvbml4LmRlPg0KPiANCj4gLS0tDQo+IHYxIC0+IHYyOiAtIHJlbW92
ZWQgOyBmcm9tIHBhdGNoIGRlc2NyaXB0aW9uDQo+ICAgICAgICAgICAtIGFkZGVkIGZpeGVzIHRh
Zw0KPiANCj4gIGRyaXZlcnMvY2xrL2F0OTEvYXQ5MXJtOTIwMC5jIHwgMiArLQ0KPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9jbGsvYXQ5MS9hdDkxcm05MjAwLmMgYi9kcml2ZXJzL2Nsay9hdDkxL2F0OTFy
bTkyMDAuYw0KPiBpbmRleCBiMTc0ZjcyN2E4ZWY4ZC4uMTY4NzA5NDNhMTNlNTQgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvY2xrL2F0OTEvYXQ5MXJtOTIwMC5jDQo+ICsrKyBiL2RyaXZlcnMvY2xr
L2F0OTEvYXQ5MXJtOTIwMC5jDQo+IEBAIC00MCw3ICs0MCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgY2xrX3BsbF9jaGFyYWN0ZXJpc3RpY3Mgcm05MjAwX3BsbF9jaGFyYWN0ZXJpc3RpY3MgPSB7
DQo+ICB9Ow0KPiANCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc2NrIGF0OTFybTkyMDBfc3lzdGVt
Y2tbXSA9IHsNCj4gLSAgICAgICB7IC5uID0gInVkcGNrIiwgLnAgPSAidXNiY2siLCAgICAuaWQg
PSAyIH0sDQo+ICsgICAgICAgeyAubiA9ICJ1ZHBjayIsIC5wID0gInVzYmNrIiwgICAgLmlkID0g
MSB9LA0KPiAgICAgICAgIHsgLm4gPSAidWhwY2siLCAucCA9ICJ1c2JjayIsICAgIC5pZCA9IDQg
fSwNCj4gICAgICAgICB7IC5uID0gInBjazAiLCAgLnAgPSAicHJvZzAiLCAgICAuaWQgPSA4IH0s
DQo+ICAgICAgICAgeyAubiA9ICJwY2sxIiwgIC5wID0gInByb2cxIiwgICAgLmlkID0gOSB9LA0K
PiAtLQ0KPiAyLjMwLjINCj4gDQoNCg==
