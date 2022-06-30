Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F336CC433EF
	for <linux-clk@archiver.kernel.org>; Thu, 30 Jun 2022 14:34:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233902AbiF3Oeg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 Jun 2022 10:34:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237145AbiF3OeY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Jun 2022 10:34:24 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D09DD65D76
        for <linux-clk@vger.kernel.org>; Thu, 30 Jun 2022 07:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656598791; x=1688134791;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=pY+VsxzS7zLmjmPjiTtjcd7Pw8BSpOyTM8hP73hl2Wk=;
  b=IkblpMjkiQ316JPJVUyCBnOtGtBH6AFMLiIDpkOEC0I868cIu5F3vZ+/
   qpV+YwUXIPFkEex9EeiRGZdYgV/MFVVdttDXPwLW3Z5mIoW+kUywUipgA
   qA/lo7BTJ23jxIGJ6WBabms/ZHM0NTOdcAXdeytbEg/bJffiAyq2BwIte
   LCiT0TgfL9fooFZ3o7xwDK8/+4Fm91xol9J3NsiFOdZsTFHl8LxdZRMWl
   +tPkMjEo1vMeJyyPmMffySXsdBd/8a+Po0uDEvW3rcUmnn1nOLiY4PuuK
   qBLqDynz5/i917Ke5hLPFYkAPWo9812aenwhML94TCa9Mx7x/jzPEy15W
   w==;
X-IronPort-AV: E=Sophos;i="5.92,234,1650956400"; 
   d="scan'208";a="165843895"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Jun 2022 07:19:50 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 30 Jun 2022 07:19:50 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 30 Jun 2022 07:19:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TSLm74ANzbkqLmtFIlyy1AHDIglt7Q7WS99GkBJVPfS6lJ9RgKCSO0AzRtMlNJVn+WR1wb1vgF4EAsWbLHfmYsDIHzlgHAKhiBLFB9lxGv+XZYSpxH8o9cIq81HgZRFU/44hjs00be7NyUJQsBAqdz5bTMqFXvxFTIZN+cNUJEY6lstFtDIBaR3hXIl06HrS2FvvjXjlRQoqo+NCVdrVhxVFMHtU0zJbVgZglrkCwnH8qsNYrHxZ7fOFvf5slvvGUMhtDq8+PyEhWT17lXMuyc8Puh2NcVR51sFifq+apqY3RCBDjEy3dEyxElX1mloSQKNNEtuEaO73W5bFmmIYAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pY+VsxzS7zLmjmPjiTtjcd7Pw8BSpOyTM8hP73hl2Wk=;
 b=l1HQpU68EqFRPIvdRunktLWlnif4s5MtCKSmhLJGUGFQeLKf91oAN6JUmqMOnsUqvpi7YU1ZqHdf6T+i/j6ua9tO34W1faXFXtoR7ovep4msVrOVfBxPlbJODji9dfu+4PfiDUn8dEzXOK/BinxzDCXfQKnnnC1vfcz54DAKVfQfpD5/kz0k9TxOwGoLO58NzpeWxjCRhz3uQEV4QKjYPEufznx2oqXXQlplirrqG1+DyAUm0OF1x7wO3bY5Pegp06jOcVrNyBpk6lgG7KsaABHNiuPAZ4AgqBO9YYyh3YGMbhwZ7SDwvnt1ZNr3pPvlhN3kk2D6qfUl+vRrkxHujw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pY+VsxzS7zLmjmPjiTtjcd7Pw8BSpOyTM8hP73hl2Wk=;
 b=nn/qKvNxHsrogEytAstmde4gfllcGBvGJI26oyVFJrPdEv41V5NYkJ3a5lKDGJX4N5F8x25MHX0nLgfGBhq/gtI61Yt4aGcIs+uUaSTcGqgGOZp5P4urV/9pJGBUF5b8Q6AO2CCfTqVZeHkabbV1ahFKqgP7bpDBQG5GcgO86Io=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by PH0PR11MB5784.namprd11.prod.outlook.com (2603:10b6:510:129::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Thu, 30 Jun
 2022 14:19:46 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::5c8c:c31f:454d:824c]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::5c8c:c31f:454d:824c%8]) with mapi id 15.20.5395.015; Thu, 30 Jun 2022
 14:19:46 +0000
From:   <Claudiu.Beznea@microchip.com>
To:     <windhl@126.com>
CC:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v2] clk: at91: dt-compat: Hold reference returned by
 of_get_parent()
Thread-Topic: [PATCH v2] clk: at91: dt-compat: Hold reference returned by
 of_get_parent()
Thread-Index: AQHYjFzo/ku4AZSEw0W4Nptdly+4qQ==
Date:   Thu, 30 Jun 2022 14:19:45 +0000
Message-ID: <11362da4-69d2-0ba0-594a-a1ce1025c572@microchip.com>
References: <20220628132256.164120-1-windhl@126.com>
 <6a78dca9-96d6-08c3-7cb2-6773b4bc3883@microchip.com>
 <1e2ee2fe.6513.181b3d6580c.Coremail.windhl@126.com>
 <b026e219-48f6-f12d-2c91-7b64372fc178@microchip.com>
 <2bd293a2.7c0d.181b4b15961.Coremail.windhl@126.com>
In-Reply-To: <2bd293a2.7c0d.181b4b15961.Coremail.windhl@126.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b8c004a-9307-4b74-386e-08da5aa39589
x-ms-traffictypediagnostic: PH0PR11MB5784:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /9EWcJGiohCLqG8h54XA0uybcoi/xJRqafNeuqLlPaNgyI8Gfwvqcz16/Kym1FiXBO7NqxC/DqkFVglWuLAbgmRtQR2Ak99FyBXUxYiXQrQdZDZ9J5FI25Vm/ovNPhnIyRw6zOv8VZvn9l8oSCNiXxppTDFAbYSZz5TTQF5grPSvEXnde4WIefGv9c+ABKqCr7oMiWtpQQZupha73tIoPhnd4xUAkIIdnXCIaowe6jZ0363FsDMKFTI4ml3mlPe1qqoMG+uR7vLBhbYqcYgMNGB/XLtSemRUkpDGqt0gzGo/nvDCzXuZtImlySv3RXbZ+E542iLa/LWBcTZEKpyMYIl9D+2k/hMWRI8QJIGYTzrM6+Y/aLKfB1T9jQqkRFJL0A5pZHEE4xcWK82EwnZWDyUbTitj6ONYIorBbB6NNY2AH4U7qWwtuZj6YnRLSksHfUlrWxnNOfhpYsa0d5uz29iTpcPULPAP7K1t4Puf/Ymcqf8OnncDBI5ybcSX9mq7Qa2II7hJWpmvZQ5gKtWld7Cp7BYJ/1KkZx76zzSs7wEFWtLUWIJkCOfqmbjatL0KZ+rD0Ef9d9HKxuV2GwFisJLwsbIGRuMxQ4j8Jp3OCG9TIGiFvtnMa/0Lx86SuyQHXEP75nS9N0LuoUB5aszX8pPbbt5eO2E5ubf1SGbcjqlB8eIVdzFk7o+d2V+83BH3g48jjLy+vP2701wcyAc+HyoTOWKQ7IOSgru5cydUPjiOCcuWuh8q72FmGfZNb2cheMdhx2iIyLu8N73bXq+nNqt0UqtYUsx0sV39IR35+JeT+snTysKv+mCMO4Pyw9Uiz8AeANWt71XtrylO911FY7qtiT/2oCygId1pk+5+DksdIHdsY2uVKFgDNaD+2teE
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1953.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(346002)(39860400002)(376002)(396003)(4326008)(76116006)(2616005)(91956017)(478600001)(2906002)(66556008)(66946007)(31696002)(8676002)(26005)(66476007)(64756008)(66446008)(86362001)(5660300002)(41300700001)(8936002)(53546011)(6512007)(71200400001)(54906003)(6506007)(6486002)(6916009)(38070700005)(83380400001)(316002)(38100700002)(36756003)(31686004)(122000001)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MVJWSVcwZkJ2ZktHWmFQa3UvOWJWblR3VjFaMUlQYVRhL3NwWEUxdmZYMEJt?=
 =?utf-8?B?b3J1NmUySVJaMzhEQ2cvN1pwY3RnV0JpWmNzM2d4emlZaU9HQkw4U1lHZVoy?=
 =?utf-8?B?T1lyODRVRXh0QXVBV1hFWEhWYitLalpFTk15TGtCQzFocGtzVW83dkJManNH?=
 =?utf-8?B?a2xoSzlDNEtvRDFBUHBMNm12b3U0UnQrQVFoNUVaOXlad3RscjZUUUdTdFJa?=
 =?utf-8?B?TG54bUFFOStmYjRZZHhLMXJxY1FQNTgxNEhVYVlLaUFRcUpwQzlyQkFXQkxz?=
 =?utf-8?B?Z0FHemd5c3JIYTVEZXFoUmtDUmRQdmFQdmlKQzhjZlRvSndIM0EyQzVxelEw?=
 =?utf-8?B?K1I1RUI3TTZ4RUVrRHRPdklqc1Q5VXFIbFl6bm40ZytzbENZdWNpNml6bTQv?=
 =?utf-8?B?VUFCRCtmOWQ0OFh1SlZuV0NNaVJKZFBjVWZWOUttdEFpWWFnYXVHTE9GdXdC?=
 =?utf-8?B?MWFrZFcrS09oWHhQbncwWFV5dlJBTDc3TXNwUEt2Si9qNzN6ekl2d0IxK0Yw?=
 =?utf-8?B?Q1gybmRBRVZIaXU2SmhFR0Irdm5La21CK3piQ2dJQkhmTGN2MUtzajU3T0lU?=
 =?utf-8?B?Z2hLdzlDYVBIeVhKL0lNbFZnSjdmdHVlZE93QWlaT3FqQWFBWWxIRnlZV0dN?=
 =?utf-8?B?ZW9WdkErQXdUQnJTRnovZW9sdnQ3TGF1S1FzdGR5RXZMaGF4MENVV3dLYzNZ?=
 =?utf-8?B?azk3N0ZBZkFrWm8zZ05sR01uVmFWYmx3ZFpuazVVWEV1THlFY0psUUtCdkFS?=
 =?utf-8?B?NUJZSE04a0Q1UkxpanBuNmVEbDMvaEt4U0xlUVo1dWovc1F2T05BZnlBazRL?=
 =?utf-8?B?S0hxOFFZTytTdGdvQ0EzMm1MODFEMHlieDBvZVhFaGV3RFRHdjBidzl2Y1dp?=
 =?utf-8?B?VFA1RzcvUTljL0Nldjd3aTBobkdTbVlVS1oxMWgrVVlTOWZHaWRvajc0OFRz?=
 =?utf-8?B?R01LYU1lSkRHMk43UXQrMElpQkovNEoyUUxwRWtWZXhvZnJOWFVmdjMyMGxU?=
 =?utf-8?B?WHRnalY0U2pYWTZxbEQ3eTFwZUsySGpFWC9NZUJQb2wvT25QSWM1QmphTE5t?=
 =?utf-8?B?UWZEU0dZTTAvT0E3Q2h0WVpuek9EQWhzeVRFUzhvcEhFZkNiOTltL3gwQmJq?=
 =?utf-8?B?UDl6RDNOSkk3NE9WZ2krNW5aeExPWjBGRkVOK0gzdWFjd3ppSHlOcDFNNzJ5?=
 =?utf-8?B?eGJtQU1YVTAyMmZzWGhnMFV2cDhranJ6UUhCZTRsU2w2dTIzdWdPTVRvS045?=
 =?utf-8?B?MWNLVUpHTnhkdEZkZEI1K1ZQUHg5Y0lrQlF6c0RPeW8xeHJMb1FBRkxqNmU2?=
 =?utf-8?B?bDYzZ2pXNXo0U3J3VFBiVjAzaC8rTkc2VkJaNnR2ZTl5YlJ0M0M0b2lYQzZw?=
 =?utf-8?B?Z0t4TnhaRndnMzI2cnVnSURxeVd3NmNFWk0vOVBjQWU4WGsxYlRBejloWWJt?=
 =?utf-8?B?Zi9JbUFlak1XUGR0b1FrOGI1RDBBTXozL2ZBRFpBRjJjanBxUG84Si9oc29a?=
 =?utf-8?B?YnRmdHJRM0ZqY1RYSXV3bXlOVlBiVnFnckxRNGxDa1VPU1VYV0ZGbXZoT2l3?=
 =?utf-8?B?UE1UQUJPSDB5eGo5amg0NkJPL3NsN2Y4SWg2L2JDSnZYejVhdXpzcU05VmE5?=
 =?utf-8?B?UjFUQ3JhRWkzM20wenVxdWdEei9rRXVraEFUVWtueFIzTzVuNzlxWmRkOGll?=
 =?utf-8?B?b05QRnJnVkc2UllpbVg0MFQzREl4bXlWVFhXNXZYYThZWjhZT0ZYaWpnOEpj?=
 =?utf-8?B?RWh0UDhqQS9Yb1BXbFdxRUF4M255VFhJbmpzOE1hbCszTFNFbElONlIyQ1Vy?=
 =?utf-8?B?bEZrMXY4cHNPZ3kvWjJXMG16SmNlVjY1SjRBakhpdGQwNzJIZ3hlZHVjNzhy?=
 =?utf-8?B?N0tNRk9WZlpNUGVLYUFBc0xZSFhweGRnZGwxY2MwQzJkOXQ5YUtIMWcwT0tZ?=
 =?utf-8?B?S3ZFclJHMFlsK3F5RWZET1I1aWwyTzkxdzZ6RGdCZjdvOVU0c21sdndBc3lF?=
 =?utf-8?B?Q2t6RWs0ZzlDc2RNMWpSandyYXRhb1I1anRnUWFwRktsSkErajF4T0Jlckc5?=
 =?utf-8?B?WjhwMHp3MWFlZVlSZVZPSVkxTTNxU3AxQktKRWhXcFFWclE1Y1BUUGRlUUdM?=
 =?utf-8?B?VHM3akt6a2Rod3NaWVQ0VG9FTmc0SnlxN01xbFgwWjNmdzVOZXJTem5IUnFP?=
 =?utf-8?B?MkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <70F5CB121D239E4C9B6A521D33FD9094@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b8c004a-9307-4b74-386e-08da5aa39589
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2022 14:19:46.1001
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: erMUmxICpcxhO7Ap/azYoaN3BJc45gdTjg4xygCTze5qJZn7cnOgbVmuiTsKy03QWNGoB5Hpdsq2ErmCyOhv+3+6a42CC2FqmFXgy3/jwL8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5784
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

T24gMzAuMDYuMjAyMiAxNTo1OCwgTGlhbmcgSGUgd3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlMOiBE
byBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cgdGhl
IGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gQXQgMjAyMi0wNi0zMCAxODoyMDozNiwgQ2xhdWRpdS5C
ZXpuZWFAbWljcm9jaGlwLmNvbSB3cm90ZToNCj4+IE9uIDMwLjA2LjIwMjIgMTE6NTksIExpYW5n
IEhlIHdyb3RlOg0KPj4+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPj4+DQo+
Pj4gSGksICBDbGF1ZGl1LkJlem5lYSwNCj4+Pg0KPj4+IEF0IDIwMjItMDYtMzAgMTY6Mzk6MjYs
IENsYXVkaXUuQmV6bmVhQG1pY3JvY2hpcC5jb20gd3JvdGU6DQo+Pj4+IE9uIDI4LjA2LjIwMjIg
MTY6MjIsIExpYW5nIEhlIHdyb3RlOg0KPj4+Pj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGlj
ayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBp
cyBzYWZlDQo+Pj4+PiBbLi4uXQ0KPj4+Pj4gQEAgLTY5NCw4ICs3MzIsOCBAQCBvZl9hdDkxX2Ns
a19wcm9nX3NldHVwKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsDQo+Pj4+PiAgICAgICAgIHVuc2ln
bmVkIGludCBudW1fcGFyZW50czsNCj4+Pj4+ICAgICAgICAgY29uc3QgY2hhciAqcGFyZW50X25h
bWVzW1BST0dfU09VUkNFX01BWF07DQo+Pj4+PiAgICAgICAgIGNvbnN0IGNoYXIgKm5hbWU7DQo+
Pj4+PiAtICAgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqcHJvZ2Nsa25wOw0KPj4+Pj4gICAgICAg
ICBzdHJ1Y3QgcmVnbWFwICpyZWdtYXA7DQo+Pj4+PiArICAgICAgIHN0cnVjdCBkZXZpY2Vfbm9k
ZSAqcHJvZ2Nsa25wLCAqcGFyZW50X25wOw0KPj4+Pg0KPj4+PiBJcyB0aGVyZSBhIHJlYXNvbiB5
b3UgY2hvc2VkIHRvIG1vdmUgdGhpcyBvbiBhIG5ldyBsaW5lPw0KPj4+DQo+Pj4+DQo+Pj4NCj4+
PiBJbiBmYWN0LCBJIGp1c3Qgd2FudCB0byBrZWVwIGxvbmcgZGVjbGFyYXRpb24gb24gYm90dG9t
Lg0KPj4+DQo+Pj4gSG93ZXZlciwgdGhpcyBtb2RpZmljYXRpb24gbWF5YmUgdXNlbGVzcy4NCj4+
Pg0KPj4+DQo+Pj4+PiBbLi4uXQ0KPj4+Pj4gICAgICAgICBzdHJ1Y3QgY2xrX2h3ICpodzsNCj4+
Pj4+ICAgICAgICAgY29uc3QgY2hhciAqbmFtZTsNCj4+Pj4+IC0gICAgICAgc3RydWN0IGRldmlj
ZV9ub2RlICpzeXNjbGtucDsNCj4+Pj4+ICAgICAgICAgY29uc3QgY2hhciAqcGFyZW50X25hbWU7
DQo+Pj4+PiAgICAgICAgIHN0cnVjdCByZWdtYXAgKnJlZ21hcDsNCj4+Pj4+ICsgICAgICAgc3Ry
dWN0IGRldmljZV9ub2RlICpzeXNjbGtucCwgKnBhcmVudF9ucDsNCj4+Pj4NCj4+Pj4gU2FtZSBo
ZXJlLg0KPj4+DQo+Pj4+DQo+Pj4NCj4+Pg0KPj4+IFNhbWUgcmVhc29uIGFzIGFib3ZlLg0KPj4+
DQo+Pj4+Pg0KPj4+Pj4gICAgICAgICBudW0gPSBvZl9nZXRfY2hpbGRfY291bnQobnApOw0KPj4+
Pj4gICAgICAgICBpZiAobnVtID4gKFNZU1RFTV9NQVhfSUQgKyAxKSkNCj4+Pg0KPj4+Pj4gQEAg
LTg4NSw5ICs5MzYsMTAgQEAgQ0xLX09GX0RFQ0xBUkUoYXQ5MXNhbTl4NV9jbGtfdXNiLCAiYXRt
ZWwsYXQ5MXNhbTl4NS1jbGstdXNiIiwNCj4+Pj4+ICBzdGF0aWMgdm9pZCBfX2luaXQgb2ZfYXQ5
MXNhbTluMTJfY2xrX3VzYl9zZXR1cChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wKQ0KPj4+Pj4gIHsN
Cj4+Pj4+ICAgICAgICAgc3RydWN0IGNsa19odyAqaHc7DQo+Pj4+PiArICAgICAgIHN0cnVjdCBy
ZWdtYXAgKnJlZ21hcDsNCj4+Pj4+ICAgICAgICAgY29uc3QgY2hhciAqcGFyZW50X25hbWU7DQo+
Pj4+PiAgICAgICAgIGNvbnN0IGNoYXIgKm5hbWUgPSBucC0+bmFtZTsNCj4+Pj4+IC0gICAgICAg
c3RydWN0IHJlZ21hcCAqcmVnbWFwOw0KPj4+Pj4gKyAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUg
KnBhcmVudF9ucDsNCj4+Pj4NCj4+Pj4gWW91IG1vdmVkIGFyb3VuZCB0aGUgZGVjbGFyYXRpb25z
Lg0KPj4+DQo+Pj4+DQo+Pj4NCj4+Pg0KPj4+IFNvcnJ5LCBJIGhhdmUgYmVlbiB0b2xkIHRvIGtl
ZXAgcmV2ZXJzZSBjaHJpc3RtYXMgdHJlZS4NCj4+DQo+PiBJIHRob3VnaHQgdGhpcyBydWxlIGlz
IG9ubHkgZm9yIG5ldHdvcmtpbmcgc3Vic3lzdGVtLg0KPj4NCj4gDQo+IE9LLCB0aGFua3MsIEkg
d2lsbCBrZWVwIHRoZSBydWxlIG9ubHkgd2hlbiBJIGZpeCBidWdzIGluIG5ldHdvcmtpbmcgc3Vi
c3lzdGVtLg0KPiANCj4gU28gIGl0IG5lZWRzIHRvIHNlbmQgYSB2MyB0byByZXN0b3JlIHRoZSBv
cmRlciBvZiB0aGUgZGVjbGFyYXRpb25zPw0KDQpZZXMsIHBsZWFzZS4NCg0KPiANCj4gSWYgeWVz
LCBJIHdpbGwgcmVzZW5kIGl0IHNvb24uDQo+IA0KPiBUaGFua3MuDQo+IA0KPiBMaWFuZw0KPiAN
Cj4gDQo+Pj4NCj4+Pg0KPj4+IFNvIHRoaXMgbG9vayBsaWtlIGEgbm9ybWFsIGNocmlzdG1hcyB0
cmVlPw0KPj4+DQo+Pj4NCj4+Pj4+Pj4gICAgICAgICBwYXJlbnRfbmFtZSA9IG9mX2Nsa19nZXRf
cGFyZW50X25hbWUobnAsIDApOw0KPj4+IFsuLi5dDQo+Pj4+PiArICAgICAgIHN0cnVjdCByZWdt
YXAgKnJlZ21hcDsNCj4+Pj4+ICAgICAgICAgY29uc3QgY2hhciAqcGFyZW50X25hbWU7DQo+Pj4+
PiAgICAgICAgIGNvbnN0IGNoYXIgKm5hbWUgPSBucC0+bmFtZTsNCj4+Pj4+ICsgICAgICAgc3Ry
dWN0IGRldmljZV9ub2RlICpwYXJlbnRfbnA7DQo+Pj4+PiAgICAgICAgIHUzMiBkaXZpc29yc1s0
XSA9IHswLCAwLCAwLCAwfTsNCj4+Pj4+IC0gICAgICAgc3RydWN0IHJlZ21hcCAqcmVnbWFwOw0K
Pj4+Pg0KPj4+PiBTYW1lIGhlcmUuDQo+Pj4NCj4+Pj4NCj4+Pg0KPj4+DQo+Pj4gU2FtZSByZWFz
b24gYXMgYWJvdmUuDQo+Pj4NCj4+Pj4+DQo+Pj4+PiAgICAgICAgIHBhcmVudF9uYW1lID0gb2Zf
Y2xrX2dldF9wYXJlbnRfbmFtZShucCwgMCk7DQo+Pj4+PiAgICAgICAgIGlmICghcGFyZW50X25h
bWUpDQo+Pj4+PiBAQCAtOTI2LDcgKzk4MSw5IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBvZl9hdDkx
cm05MjAwX2Nsa191c2Jfc2V0dXAoc3RydWN0IGRldmljZV9ub2RlICpucCkNCj4+Pg0KPj4+Pj4N
Cj4+Pg0KPj4+DQo+Pj4gSWYgdGhlc2UgZGVjbGFyYXRpb24gY2hhZ2VzIGFyZSBub3QgbmVlZGVk
LCBJIGNhbiByZXNlbmQgYSBuZXcgcGF0Y2gga2VlcGluZyB0aGUgb3JpZ2luYWwgb3JkZXIgb2Yg
ZGVjbGFyYXRpb25zLg0KPj4+DQo+Pj4NCj4+PiBUaGFua3MuDQo+Pj4NCj4+Pg0KPj4+IExpYW5n
DQo+Pg0KDQo=
