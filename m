Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF41AC433FE
	for <linux-clk@archiver.kernel.org>; Thu, 10 Nov 2022 10:41:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbiKJKlR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 10 Nov 2022 05:41:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiKJKlQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 10 Nov 2022 05:41:16 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E41EA767B
        for <linux-clk@vger.kernel.org>; Thu, 10 Nov 2022 02:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1668076873; x=1699612873;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=oc2ltBLCFi4hN0fwO7EP4/UobFxudpevJbP64Of/0Ks=;
  b=V8n9akHYYxiQWkc7VwRVpyPIcBJWOkz06aExCHV8Mw+BTlDCr6Sy8e19
   1GZ/qnqdiwSBqH5f0dhHfxjt8Lbie/23GDA2+pAo/jplurQo6XFlTtBPM
   Nk1U73tQKrMTBxE754ZYzqI+aDqznfELZsxBGIWrIQPELRAx2wlNErPpa
   MGot0xUXRorpCW4noLnaRUwUKUry8kE6c9E+TIAUzG5hL5yfGtbm5lDN7
   Cpn4dJmEHS2aoQpcKQJ7bJpvOBpXf8cNanuP6xLEfL17AchZa0ZD0nfgh
   QCfzhG1dxbRk63Woap0i0nEhEihUvrQxylaZb8nXycibMmrCKLr6jGBCl
   g==;
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; 
   d="scan'208";a="188465803"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Nov 2022 03:41:12 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 10 Nov 2022 03:41:12 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Thu, 10 Nov 2022 03:41:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X71xaJ4uXLVXGwkA13d5yh3r8wZYr85pzT6cR+DmDAAfD+L3gchY+YajLmubTatIVhBbcnhciDYZbkXRqFMVU3eDO46pNd4ljc3jS33+gz3r1zYl+g7X7YpGwjd7kWI8u8jMyA4up24Dd2vsFAh+Mn/AN2VXq4GaCkc8oJHxojuZecTKw7kWrSjlP6otolh9lmovdHKhv/2947FxeoO1pzS6ZhdHuQjKGfc3I0yOtqB+pCU3b+M+fa41RXjE5H8lIepW57iqHX6ngwrzev2MHmobsE9PEbdfZaz07bFEdh0XTJBfE7P58w+vwtr0+FhG5QC0BttNHnegwwiAgz8yRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oc2ltBLCFi4hN0fwO7EP4/UobFxudpevJbP64Of/0Ks=;
 b=gjgI/FJaaWEtZzJCKwzQXoDS9hbDPiWjFBYBlzIQVJvXK42ou+7Aw9yu9TssAYcAEcpLvE6KX9gxckB1efJ0JggTuYB1AiWQfUCiUgdT5rXLrn0ddQyc9KZCuyoMrpOqyDS+EZzJSHid9HdESbV28qCiJPREdcrgS9TgBBbNppH6JmezKVbV5RX7qQLm8lQbe13AtG0YhbB8wuhhPygE7f1iODtixlAPD2+xHRninvLm1UnXUwALCZPDH9Wp0g0yjmUTYUfdB76gyVRjB2xkk5I90y5ErRGPnSIvQyqgRA94KJh5uul1tv/+lp1dDda/9nDToZaMj3Av8iOONRpM4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oc2ltBLCFi4hN0fwO7EP4/UobFxudpevJbP64Of/0Ks=;
 b=hG7QjCHsbZysALmdetaNVMMTadGiGHVIUljDmrveS6vTfh8o99q2PRdGTmVHte1mld9KLqQPFAk6/6vKlrYxzBBw16/dOP1YgpYWchDyxSMeKvAGp2wid7umn2WfvHEVPtNMaAL+YijqsCW8fY0M9HG/sKRRS65BcHIbR80S+ZI=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by DM4PR11MB5294.namprd11.prod.outlook.com (2603:10b6:5:391::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12; Thu, 10 Nov
 2022 10:41:10 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::51f:528c:5fde:40a2]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::51f:528c:5fde:40a2%3]) with mapi id 15.20.5813.012; Thu, 10 Nov 2022
 10:41:10 +0000
From:   <Claudiu.Beznea@microchip.com>
To:     <m.grzeschik@pengutronix.de>,
        <linux-arm-kernel@lists.infradead.org>
CC:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <Ludovic.Desroches@microchip.com>, <linux-clk@vger.kernel.org>,
        <kernel@pengutronix.de>
Subject: Re: [PATCH v3 1/3] clk: at91: rm9200: fix usb device clock id
Thread-Topic: [PATCH v3 1/3] clk: at91: rm9200: fix usb device clock id
Thread-Index: AQHY9PDys13gvbfg8U6gnyIgtQbBIg==
Date:   Thu, 10 Nov 2022 10:41:10 +0000
Message-ID: <94c6679c-f518-aa74-5cda-f28f1dc3129a@microchip.com>
References: <20221109124638.147270-1-m.grzeschik@pengutronix.de>
 <20221109124638.147270-2-m.grzeschik@pengutronix.de>
In-Reply-To: <20221109124638.147270-2-m.grzeschik@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR11MB1953:EE_|DM4PR11MB5294:EE_
x-ms-office365-filtering-correlation-id: 33e12fe7-caea-41df-3a4d-08dac3081521
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gVYSBhQhBOiyFjQTypf/hTSxo11loPcdAf32kN0GQmRwYUHYJwwiGwgaGn1gosbv28F8NVbXWVZPIPuJBljXAdm3f/ROMleyoFc04uCVsTXZStaTWpO5wWdm/zTf0P+KAwV7e5GrutMvBuQn5sVj0wkuXz8gCrNn7b9yomHqt+ATa+MGebuWVbCx09Ucc10KQN9zAIz3iJSCeED8zwqWiixGbmAGgN5u/3pCuBORaojQNBkDom8du86MeE7cdLlUleED1v9JpUWa1kx5pP0JCdC4UPMI6YOcIr4/TKMPL0Y1xBTfNBNiCqo/PvX6Rxt8t++xynTUTT8jBMs9eo5seu7g51Tf7bKRV67jOfVp7hsfK8pS8WdX/d2yYtdKYhChB4UtHrZm3+EpJTeUG1CekccJQ0kjfKjWs/KAiN8tX65kO/iGiKPPgcMG8L7nSR1Mb0sXnaeCSSSQD+guOD3z1mE+ArdoGyNFpTk7lmycydUKo32PCnotCKl6q1V+Ph6673uvsfRnVbbLcLil+lsAEkQQsTcBNnTJZ9fG/i6Ps+462LMZhlkNqys6xGrzrODAFH/oAW2MVw+lkTNO2gsLIQV/vwqw5ztiyv3D84FREgzIylPWhaSFxea0uH1cNX43To63ncetHvWf2AwgSr2TZzBwM2VzrfjNvRO0fFCJZG5txba22vwiekxQDJ/2DMlCfnWf1zyJYV5R/HuuMIB8k0PPQHAJwH08Vbt3IrFNIR/u4MbvYNDel64BZ9qvRuU2Zhr7CVHCLopaSwdDP+s40Te5Wp9plbrxx0m6rT976nesj8rbc+7J/Wx6JORegtSxjZtMgm0sG50L5tcmif3HKw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1953.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(39860400002)(396003)(136003)(376002)(451199015)(54906003)(66946007)(86362001)(31696002)(110136005)(41300700001)(8936002)(5660300002)(71200400001)(38070700005)(2616005)(38100700002)(76116006)(478600001)(6486002)(2906002)(36756003)(53546011)(6512007)(6506007)(64756008)(91956017)(31686004)(8676002)(26005)(4326008)(66556008)(66476007)(66446008)(316002)(83380400001)(186003)(122000001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bDdpZ1ltRkRIUjIrT1VjMHpwRlZCaE91MStGdzk1RGFuTmRQYS9oS0M2VkJV?=
 =?utf-8?B?dVI0OGFqYWlsZkI3WWlVN2IveXlldVlYYjJUcXVSbnJKWTAwdmFKSXJVZGNE?=
 =?utf-8?B?S1l6WHZFL0xadGw4Ym5DbzNoaDFpSEV1Ymg3K1ZIcEh0VFhHL3ZObS90eFZs?=
 =?utf-8?B?YVEyV3RzdWh4L2E5bzY1Ry9ZN3BhRzU4TThTVHAyNWlscFJiVWNxRFVyM0o1?=
 =?utf-8?B?KzZBWXBHVXVKeHN0NnNpa21KODR4UEMzYytyM0xwaUdCNVJrRityU3RWVEZT?=
 =?utf-8?B?SU42NjI1azhqSkI3d1pDQml4ajBEYTlqNXpSNFBTYWI2S2ppMzdQL21uUlVx?=
 =?utf-8?B?NFQvaUdsc2J2b1owSWlna3dsdU91dmxUTzFEdDBJS1lVUTVQMUlFWmlQdGpY?=
 =?utf-8?B?cmhRYlN5U3NwR0dBMnF0QlFVRVJZK1FTanU3WFNUSDd2SE9TQStEM0k0S2NQ?=
 =?utf-8?B?cFZVbTlZSmNJdzZwUkxKTlk4V1EzTy93UGVjbFRuSXBrcDdzM3N1WUt1MTVV?=
 =?utf-8?B?UEdQM2dPQTZNYit1L2dMbXNVSjMyVlZaRWNzWFg5RjJSZTVUT2xJd1hYbTUr?=
 =?utf-8?B?M3MzOXZNb3p5bU82QXhLeWphckphNXZKeEVnWmVUR1d3OFU1QW05MTBZajI4?=
 =?utf-8?B?SDlOMHh5aWU0YU9qUWxmaG5xMkppMEJuZXRtTkRSN1BQeENvNkRra2IrVk1R?=
 =?utf-8?B?RmpVT3UrWnhnTlNhdTllVFJrdEZ5OGVLZW00Yi9FRllkcUtXYzAvR1p5ZkNq?=
 =?utf-8?B?c001R2FFVlZrQmZQekszNFNVaUd4STMvTVI2emZmbk1UV3JUbUhTT3lzUlRG?=
 =?utf-8?B?eklyRXp4UmRJaUFMMXIrZEJxR0hWMUhNVTFydUFXYkFNcWZJUnhBVTFNQnpX?=
 =?utf-8?B?NmVXU2RiRDZTK0toNCtQbnluWGh3YkdLQVg5UmFlTVByRDZiTGFiamlzU21V?=
 =?utf-8?B?ZXdKa28yTDlsUEhnN2l0dFFlS0FwVzZkbkkyc3gwc3cvK3ZXb1FYNStqVWgr?=
 =?utf-8?B?TGlKdDBsaVJOc0JkRU9XMkJkMDR1UUFBd0Z5NnNHRno5Rk9LRDQxZlVHWkZh?=
 =?utf-8?B?ZkdnVVB0Mlhhc2V6NXVGbFFMM0VBQllSenlDczZkb0ZaL2hRa0RmazgzV1F5?=
 =?utf-8?B?eTM0ckRCVk83dmxyYzZndjhwcGk5MVREdXFHRkFCODJjSjNyU0liOURYSERX?=
 =?utf-8?B?a1RPM1BON0hOOWJUUEJ5Sk44eEE3aW9RRFZKYUgrSjZNYXVSZFBKZnlSUEd2?=
 =?utf-8?B?NWxoSDVpclhSMEd1cUpCeWp3WWZKVlZETDNPa1J0dEJLMmRzRTZwRnVZS3dJ?=
 =?utf-8?B?c1hQMVFtdmdYTEpzblc3L3ZheWx3Y3FlSWsrODJxUmQwYUNjZW5oNmhPVU5R?=
 =?utf-8?B?Q3R4bW1vNWlvdTZHSnM3VkdNR2VocjlSZGJBUGl4MUxsV0tUSWZNdFM2UmFo?=
 =?utf-8?B?eTBUTmFmck1tVUV3ZU9xM2Rzb3pUVFdERC9YRWl5V1pUQlByMkpGV2hWaEFR?=
 =?utf-8?B?ckt0a3RWTEh5UER0YkNUY2ZJU1ZtSzR4U2llTWdld2JLcng1RnQ0cFk4REhG?=
 =?utf-8?B?T3dvN0lUTDlMaWZpWVZUSy9Damh1TEdNRWtTdUFsTWxCQ0pmcndoZ1ZWQm9I?=
 =?utf-8?B?S1crc0kxTTBHWHcyTDU2R3BoeStPdGhjb1hob0IzSTlrL0ZJMW0vOHljSE5T?=
 =?utf-8?B?aVA3UG5kS3RBOGNBSnYzcHdWdnh3aW9mS2xqSEhqd0xHNFovM1hoT0xLR0pl?=
 =?utf-8?B?WWZ5SnFsQ2UrZ1lCZkV5ZVZ6MUZ6NGpMTGV2SDhta0YzamFtbVhkQUVFSzNF?=
 =?utf-8?B?V1VPWkxKNnNXY3JRaDdoTjJLUStqaHIzbXRCd3h1eHFCZkYwU3h3eUZWVHNp?=
 =?utf-8?B?R2U4TUxZa1ZkaENZQjFIRzdDT0JjWURBOWdPYTlRMllrLzFpWUNZblNSSEJP?=
 =?utf-8?B?a215RS9qTUdtSk1qYlJtTWViVnVwM3BML1JPMHlnYng3WUJWWFhqSVdJUmpx?=
 =?utf-8?B?QkxEMFFCbGROWHlBd2Jrc29UTmsySjdpSXE5am5EejNxNFBxQnlKaVd6bjdR?=
 =?utf-8?B?R25hcnpSZE5GSEZ6eTlJYm5pVGVoOWsrWVZkNkgwOEloZnViYzZoZ1JLQmgz?=
 =?utf-8?B?WG9hSjVTWGhhWnlteGVKWVNvQU1YMWRXNGRYU3ZRdXNJMFN1VWlBYldOMFlV?=
 =?utf-8?B?M2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <861D6083232583469A63C26AEB08CFB9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e12fe7-caea-41df-3a4d-08dac3081521
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2022 10:41:10.7687
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I6aVaKw0dA+k+o3Pw2BrWEgYUrbTAAH+nxUUZcygxb82Fn5Y5xlGZ4zXT2TdWNrqaSztEX7GO8vRWnOUwxxcDUbUEdr1+8pD4jvRKLVmeus=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5294
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

T24gMDkuMTEuMjAyMiAxNDo0NiwgTWljaGFlbCBHcnplc2NoaWsgd3JvdGU6DQo+IEVYVEVSTkFM
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
PiBGaXhlczogMDJmZjQ4ZTRkN2Y3ICgiY2xrOiBhdDkxOiBhZGQgYXQ5MXJtOTIwMCBwbWMgZHJp
dmVyIikNCj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBHcnplc2NoaWsgPG0uZ3J6ZXNjaGlrQHBl
bmd1dHJvbml4LmRlPg0KDQpSZXZpZXdlZC1ieTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6
bmVhQG1pY3JvY2hpcC5jb20+DQoNCg0KPiANCj4gLS0tDQo+IHYxIC0+IHYyOiAtIHJlbW92ZWQg
OyBmcm9tIHBhdGNoIGRlc2NyaXB0aW9uDQo+ICAgICAgICAgICAtIGFkZGVkIGZpeGVzIHRhZw0K
PiB2MiAtPiB2MzogLSB1cGRhdGVkIHRoZSBmaXhlcyB0YWcNCj4gDQo+ICBkcml2ZXJzL2Nsay9h
dDkxL2F0OTFybTkyMDAuYyB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL2F0OTEvYXQ5
MXJtOTIwMC5jIGIvZHJpdmVycy9jbGsvYXQ5MS9hdDkxcm05MjAwLmMNCj4gaW5kZXggYjE3NGY3
MjdhOGVmOGQuLjE2ODcwOTQzYTEzZTU0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2Nsay9hdDkx
L2F0OTFybTkyMDAuYw0KPiArKysgYi9kcml2ZXJzL2Nsay9hdDkxL2F0OTFybTkyMDAuYw0KPiBA
QCAtNDAsNyArNDAsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGNsa19wbGxfY2hhcmFjdGVyaXN0
aWNzIHJtOTIwMF9wbGxfY2hhcmFjdGVyaXN0aWNzID0gew0KPiAgfTsNCj4gDQo+ICBzdGF0aWMg
Y29uc3Qgc3RydWN0IHNjayBhdDkxcm05MjAwX3N5c3RlbWNrW10gPSB7DQo+IC0gICAgICAgeyAu
biA9ICJ1ZHBjayIsIC5wID0gInVzYmNrIiwgICAgLmlkID0gMiB9LA0KPiArICAgICAgIHsgLm4g
PSAidWRwY2siLCAucCA9ICJ1c2JjayIsICAgIC5pZCA9IDEgfSwNCj4gICAgICAgICB7IC5uID0g
InVocGNrIiwgLnAgPSAidXNiY2siLCAgICAuaWQgPSA0IH0sDQo+ICAgICAgICAgeyAubiA9ICJw
Y2swIiwgIC5wID0gInByb2cwIiwgICAgLmlkID0gOCB9LA0KPiAgICAgICAgIHsgLm4gPSAicGNr
MSIsICAucCA9ICJwcm9nMSIsICAgIC5pZCA9IDkgfSwNCj4gLS0NCj4gMi4zMC4yDQo+IA0KDQo=
