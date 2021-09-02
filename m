Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B168FC4320E
	for <linux-clk@archiver.kernel.org>; Thu,  2 Sep 2021 09:10:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8AA6160FE6
	for <linux-clk@archiver.kernel.org>; Thu,  2 Sep 2021 09:10:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244937AbhIBJLg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 2 Sep 2021 05:11:36 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:24709 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233656AbhIBJLg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 2 Sep 2021 05:11:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1630573838; x=1662109838;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=cz0IW0v5G8OCdXmDOZn68BRa4Vvq/na1AeTCFbHjzqo=;
  b=YCF/GwHvqs5vzyrtMNr04LxuZjVaUHzNXWN7ZkWq6FpVaAP/NCpS4yOu
   mKVAdXtos2817jssuPPSk1UveWOZanukgDH0fIEirJX8Le+cG0CY3k6rY
   n7AijvvzyKjK2jK64xd9SMBdcn7Sx2olsFADTyzi4Q4mc15jTgMKTt3u9
   EemhOv3BKXUUbiM8qjp7Qf0d5WpPuBUv0Yke6hRyE+YSrtD2e5CBi7TeK
   567yQxFz0+t0oGoSrBNU7I6ns1BVa7PXTW4Dpqs6r9gXFIJ6aWnygv0xu
   HwV6bPucVNKzlwpysU70kYHUfs12jmyhVCFXUsSwVs8LQEOVbNg7qjkNE
   Q==;
IronPort-SDR: L5txWYf2K7V5ProYz7kJaWnk9D4Kh/Yi6+akkSbHnKSgn0/AXNQjO5pHspCdw1r+A9jcsj31rN
 lSDlBohDQ591DmiwBJEyIfQfjl/chEMFjpribTXXg9P4ZwKPRTPjlOx5X7lyyDFDOTt6WF3hiF
 /WHkzgzIF3QRFwdE+2ybVT6AV1dkuQ6ufKwOl7ZkaJzGmicjLWxS2BcNXgW6McU/LUkBMvpgBD
 Ty6f/lL8xJmJ27wBLM2SFa0x4BFiBzrKlTT/IeAj9ygwfbUXs/uvlSTipa2POiG/FyP4vKODiZ
 b+Rtq5XoIa06U9a2G0NdwbUI
X-IronPort-AV: E=Sophos;i="5.84,371,1620716400"; 
   d="scan'208";a="135118767"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Sep 2021 02:10:34 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 2 Sep 2021 02:10:34 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Thu, 2 Sep 2021 02:10:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PNwF5khOzvA9X1iDf9QQhK86q51jxsxRLxfzTHHn9KXTBhrfKlyfXfzxyXPBSWOIF6sYvYpNwO1sklKSh/tG/3qpI4xqtcgQ7OSGQSbZM52btznCK51KAh6gP6w6S4+WgsiyVDkcexJsIhla/7Q56QFoWIdiCDfUsx3iC8125Y8hSAFDzF/YZVep+qyJn0O19PgkWWwJuyKtHq5OvM2/GAnXaT+vHjtC+7scBn6d2lhLBLmKnIb1VSrSZrhMFqyA0aYcRUFJP9XLPiTHJUgnZOrQqwUXlSIxPcGZdIpeHmTAgOioxzVmcug+sVCcBTOVCI9E1BSgkwgwLyB606KLOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cz0IW0v5G8OCdXmDOZn68BRa4Vvq/na1AeTCFbHjzqo=;
 b=oLgXZk9nlzfPjb93FxfkxvzYFZvy4dPonM0h5vMKJlt/p2zSkceVWjPo7kZmvcnuxl8aecZqySe5MXEXHv5gKAZDhj8/rDOTdRGMz5diq62S0fZwoUMgx14itEVRhKdQd1QkSOpo45M1AH6Jht8cQu5ClUSEK4+aQeJh34ifwazmWXNU2wZeg3Hv3mudW9bAMYIZZEFXoj4S4pepg1JquImTeQpeCjWZN2IfzrcYHuy82UzeCA4g2y2TTondZoAEM9W4aEoweKCbYj5Gy7rRIhF6is2vb1WSz/SBJC+575tZaDagn8OG76eAZ5M4qSAhXDR2UgRfY2S6K0AGtsdVcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cz0IW0v5G8OCdXmDOZn68BRa4Vvq/na1AeTCFbHjzqo=;
 b=TQHlmde4ALkX6dvPcJ8nqJtKaWRSugy5znJZtF7ocmBKdzpD7VZrUVc7ZrOOntGXC1SD45zcQd8yFCpVCy8TpPv3xTy+XB6JJQ9Wv+Uz+PTnvGHgMHGk2urNZJbaxbbPbqsTpqtZtlPG3EkNyujsTnhAvQADjecBp9bgLIL8HDU=
Received: from DM6PR11MB3420.namprd11.prod.outlook.com (2603:10b6:5:69::31) by
 DM6PR11MB3993.namprd11.prod.outlook.com (2603:10b6:5:19c::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.23; Thu, 2 Sep 2021 09:10:32 +0000
Received: from DM6PR11MB3420.namprd11.prod.outlook.com
 ([fe80::e155:7e54:f51f:ff5c]) by DM6PR11MB3420.namprd11.prod.outlook.com
 ([fe80::e155:7e54:f51f:ff5c%7]) with mapi id 15.20.4436.029; Thu, 2 Sep 2021
 09:10:32 +0000
From:   <Claudiu.Beznea@microchip.com>
To:     <daniel@zonque.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC:     <robh+dt@kernel.org>, <kuninori.morimoto.gx@renesas.com>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>
Subject: Re: [PATCH v5 3/9] dt-bindings: clock: cs2000-cp: document
 cirrus,clock-skip flag
Thread-Topic: [PATCH v5 3/9] dt-bindings: clock: cs2000-cp: document
 cirrus,clock-skip flag
Thread-Index: AQHXn9ph2XZfiIb4t0a9FZUS77YCzA==
Date:   Thu, 2 Sep 2021 09:10:31 +0000
Message-ID: <c0961c25-abe1-b3d8-6ca6-5094a3745d1d@microchip.com>
References: <20210901093631.1403278-1-daniel@zonque.org>
 <20210901093631.1403278-4-daniel@zonque.org>
In-Reply-To: <20210901093631.1403278-4-daniel@zonque.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: zonque.org; dkim=none (message not signed)
 header.d=none;zonque.org; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d535226b-b14d-4bf1-3196-08d96df18418
x-ms-traffictypediagnostic: DM6PR11MB3993:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB39937C170E778CBF9F4B997C87CE9@DM6PR11MB3993.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4hGZlsVvfPNcxMeLSxgD9ji1MoFOYm3+nERjlBvxvw5YonXNTRdYZVqXoSlSCQnera/qL68iAf6w6LHVJNbpZIpmVjw0CXavsWebAa9ZJ+Qez/mzd/6DYkuZGBIC9WK8ddWhgcIZF3Q1hILVNw7ecoxr9E0MEeASKA9E9fn94eKMdsW0Npe+ioGtvBDEc2H854O4rcc6kq8zke2Me/Se7i19DVhxTph8sATbglLu0mebRj6NpfjgbwWu1/tEWCMH1duKGBAH3DU0nSinGLfMJGEkKis5Vh1K3/uCzTP2lm2UB44mxfwAwcBqruOMAvp1f1CzOfy136QPBnb/y9Gt/V+CBYylRVy9YrCkRbspdbs0ss9KthKrlHvE47nUMJkVr1FhiY1O6X1OKpDWKbZnfNe3doiHBB3lkkaZ6aGf74MPNnhGE35pylgnweYToWZ3XtK3v+6JYse95SYlImVrBAR3H1JORPNgtVzvoogy5tAAdPVt34z2f1J+Xha6+Fo4V7rre4mDXropsYJSEE8/itKTMoN2Og6oNHI1tcKQFYtmjnlPtmXGzr6qQRJTZfyu/jC7GPPuAW6fjR3ttpqNDH9fKZq8kHI4a1CvcZ/IFTfTfFA0IP2xxiC1ZdLkcILshXWASc0HSkDMl6FaUpQb8qVupCuLkT/n3ixOOZvSSY/Aa0YhApOwVpsxG7HuUVYdaTwi7Czj4SSVhtWzKX8G1kNw7me28w0RVWHcZWSi4yr9gKq0KD0TbqhN26ueTnGmHmSUFHFzmuuzRUAiDrrHkA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3420.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39860400002)(376002)(366004)(396003)(136003)(4744005)(478600001)(110136005)(2906002)(6512007)(71200400001)(91956017)(26005)(186003)(54906003)(31696002)(83380400001)(38100700002)(86362001)(53546011)(6486002)(31686004)(4326008)(36756003)(66946007)(122000001)(316002)(6506007)(8676002)(66556008)(66476007)(64756008)(2616005)(5660300002)(76116006)(66446008)(38070700005)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SlhXQ3RrRzFCRkFVbnRFTTRXSUpjUzF5RGltemMxL0N5cVh1MFg2bVh4bmVE?=
 =?utf-8?B?Z1NMQzNXQmZPN2xCZW5NdGhvNGlzdU04ZFlYOTk4KzZUOFBhSkJ3NW1BRWFk?=
 =?utf-8?B?WmR3TXJ6WnBNUjRSKzA4MVZxbmlsTWxNS2dWb3BSZXlUSGVPZDVjZ2ZqdUZC?=
 =?utf-8?B?WG1xR0RsYTI2Zks5ZXBuVi9UOG9aNlN0cVNiWHpSSURMR2l0TmhwL3BPZE1U?=
 =?utf-8?B?YXNGcXpTdG1WQjUxcVpuV0wrWUJXcFVZQUlHdDFnRmp4dnJkL3hXbHRXcHdL?=
 =?utf-8?B?WVNUYTNMTXY2RFQ2SVhSUFRQZDJvS3Jtd3NPVjNUNU95d09GY2MyUEZ6UDRI?=
 =?utf-8?B?NGppZGoveUdDRzQzR2FrTWM4LzFUUzJveEpWanpGTjR6VE9jWjVqSmMvZGky?=
 =?utf-8?B?UTUwUkNHSVg4cWFlT1FtMW1DeGc2V0twR2xaT3F4TnprOTBBWlZWWFF5ZGR5?=
 =?utf-8?B?Snp3RU5LZUZ5VzZycUxKTjU1WUpuZnA1L3FmMUtJOENNdDRlU0dWWFptbGN5?=
 =?utf-8?B?a045bS9UckNwZDFCUG5SNTlxekR2bUlHdjErc1pDLytuWkNONENtSU95Z3Ja?=
 =?utf-8?B?VjkvZGp6cWdyMXpmVFlwWWNQdEZhT202cFNRQkpicFNodzRCUnpIVE5QVVhh?=
 =?utf-8?B?UlcrSDFId3NSMHNuRElhcUttbDBJMFVTdytiOWVtMnZQS3FHanlxN2N0cjlo?=
 =?utf-8?B?UVhIekx6MFJSb09tTWZjMEhsMXl4QlpZVVBWS3dRVU5UQXByaUZDVlRIOEE0?=
 =?utf-8?B?aks4STRna3UyTTU5UEw2enY2bzI5UXZJQ3FvNHMraHQ5ZkNPb1luNUJ5SzUy?=
 =?utf-8?B?WVJNU3lVajFPQnBEMTJtOWgvLzVqNDRtdklBUTNBM3lRVys5NEpCY2VSdUNI?=
 =?utf-8?B?TTY4dS9ueEx0dzlTZC9mRmRvYkE5K0RRY0ZXYUtKcDFCNTlydjg4Y1pXU3Iv?=
 =?utf-8?B?N0FOcWhUYWJGUmJpYVYrMjlOTEROWWF0Wm5NLzdQYXV0elk5ZXRNQXU3OXdN?=
 =?utf-8?B?TDFvTjVBWVJINGFOdSt5VWs5WUZsZkN2OFFBSDYrK09KRGFMdEVWRFE0UnFz?=
 =?utf-8?B?ZmVaWFdDdHlnZXJ0ZitHdW5lR2l0RW0yTUI3K3UzeldIbmZFQjcwazRyMEFI?=
 =?utf-8?B?UVZuWHdoQ0poNzlGUGtsSDcxMXdqa1FBQlhDTEd2d0hyaE1qdW9DRGJBK1F1?=
 =?utf-8?B?Q0p6d2xaQVZsbGNXaDdWdVBMREVYU2l3ZXlaLzdEZ1lSbFVPL3V0RU1LY3hF?=
 =?utf-8?B?QmpmdEpjVFBuRWxLbUdnektjSzcwUmwxUTJCVGxlRlFhb1FyR0dEbnFrM2du?=
 =?utf-8?B?QlJzV3ZVRndldGw0V1pBZ0ZWYndRVW9DOW9JaHdxMEhabHBhQnhOaUhldG9w?=
 =?utf-8?B?RUttQ0RIdXl6SFpCcXhObE5GeWNaOHpqdXR3bklpOFl1THBwYm9QcDlOZGEw?=
 =?utf-8?B?RVJHSmVwR0xEbWw1YnRHSC8vRHVQUDRvamRKWDhCZS85d0s3c3hObjZ0WjA2?=
 =?utf-8?B?ekgwbVM1QmFGUEsyUmlZc0R2YjFyUEFyZFlWRksyQTdXekpCbXg3MWNMT2Vj?=
 =?utf-8?B?WU41SkFJTXYvcWJDMU5MQVNYY1hnUTBYcGdNOGtDdllpK05ocWt1ZXlNc0hx?=
 =?utf-8?B?WVE3L3l1cUNoUElSME1zZ2t1VlRidVFZaFhCWHdOSDJTa3VRdDNrN3RBWDlJ?=
 =?utf-8?B?MTlzbGhYZ2RzSnMvLzNCTDdQQS9KcERTRUZORSs1TjE5U0loS1M1VVRBMXdt?=
 =?utf-8?Q?DYvt9bN+PfYQ058QIM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <45FA226943A2E746AA10A5333565EAA7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3420.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d535226b-b14d-4bf1-3196-08d96df18418
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2021 09:10:31.9150
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MvNNwf41f391tuBvKFbGQgCngj3AYGCRGaw+gYr7DWKPB8zoFwVj8DrM16gxgtZfC9uVVNdhHuernkgUcrEib5YertnhyXlBYQJfxY+hLbI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3993
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

T24gMDEuMDkuMjAyMSAxMjozNiwgRGFuaWVsIE1hY2sgd3JvdGU6DQo+IA0KDQpJIGRvbid0IGtu
b3cgaWYgdGhpcyBpcyByZXF1ZXN0ZWQgYnkgUm9iIG9yIG5vdCBidXQgeW91J3JlIG1pc3Npbmcg
YQ0KZGVzY3JpcHRpb24gaGVyZS4NCg0KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgTWFjayA8ZGFu
aWVsQHpvbnF1ZS5vcmc+DQo+IEFja2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3Jn
Pg0KPiAtLS0NCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2NpcnJ1cyxjczIwMDAt
Y3AueWFtbCAgICAgICAgIHwgNiArKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlv
bnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvY2xvY2svY2lycnVzLGNzMjAwMC1jcC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Nsb2NrL2NpcnJ1cyxjczIwMDAtY3AueWFtbA0KPiBpbmRleCA3OWI5MDUwMGY2
YWMuLjkwNDdkOGEyNGEwOCAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Nsb2NrL2NpcnJ1cyxjczIwMDAtY3AueWFtbA0KPiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svY2lycnVzLGNzMjAwMC1jcC55YW1sDQo+IEBA
IC00OCw2ICs0OCwxMiBAQCBwcm9wZXJ0aWVzOg0KPiAgICAgICAgLSAzICMgQ1MyMDAwQ1BfQVVY
X09VVFBVVF9QTExfTE9DSzogcGxsIGxvY2sgc3RhdHVzDQo+ICAgICAgZGVmYXVsdDogMA0KPiAN
Cj4gKyAgY2lycnVzLGNsb2NrLXNraXA6DQo+ICsgICAgZGVzY3JpcHRpb246DQo+ICsgICAgICBU
aGlzIG1vZGUgYWxsb3dzIHRoZSBQTEwgdG8gbWFpbnRhaW4gbG9jayBldmVuIHdoZW4gQ0xLX0lO
DQo+ICsgICAgICBoYXMgbWlzc2luZyBwdWxzZXMgZm9yIHVwIHRvIDIwIG1zLg0KPiArICAgICRy
ZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL2ZsYWcNCj4gKw0KPiAgcmVxdWly
ZWQ6DQo+ICAgIC0gY29tcGF0aWJsZQ0KPiAgICAtIHJlZw0KPiAtLQ0KPiAyLjMxLjENCj4gDQoN
Cg==
