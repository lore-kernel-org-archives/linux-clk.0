Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEF68C433FE
	for <linux-clk@archiver.kernel.org>; Wed,  8 Dec 2021 15:29:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236087AbhLHPd1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Dec 2021 10:33:27 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:56327 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236065AbhLHPdY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Dec 2021 10:33:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1638977393; x=1670513393;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=UxiAGq+yedpyxrFFh2+XTa59T9sYjn29RbXOg4KA0zY=;
  b=PA4EPmoPPFooH8pyh2vvNbPTAfMJs3uwkwIik/gcPNNE2UpefM0FUhCl
   Qz2oG9ySo54IQXRtWXX+twtNFLJ8zczjr+Qnn83vYQg7DEEZuwzgJ9Sdw
   azWze9ZIEV8LV1pLl8kqFR7mrutmOipc+FDWU/kCQv0uzFZO+jUYvENUl
   nYlP0D/bWA0kJ/Hmm7GH4eXb8sSWvg0YolpAWX43kr50um350E/xh1Kua
   u70StvnnoiDBvRTJI78vw6Iv7g2woqHCo4d1XzInta7bsWvJokzLEKbHB
   F7Y3cHjhBjHhxmatXVTyIX0wPo4kbv3tSeSMImicWC7O+CtSwYOKW1+YD
   g==;
IronPort-SDR: 9cCsv2vJ3Av+tv9OXUloH1QvK97Ed8jr4yJr5k535fSoPwtuOoToetkwQI7XyzGjDYRC01PonW
 FBm9bzCzJD1SViHv+ku8YlMnlqzxU1f5+kqM6fbPlyqI4ib33UHcGSsIKfQvTJCQZ2ipVd6x/f
 JMz7/wKDO860fqtJMDKaKTyGkViMPHvsCnh0XL8Cy/ryx2CJkUm7+bjDF50rV4mhYpT9eIOmV0
 av+VmfxD7dh5doC0SrD3eaqEuv3TgC/aGM3dNCIgMnbbZ+jNoRwGuPFhiNqybxZtSPZOK3lszv
 dqn7HUkZl9ysD23YLi7cS1i3
X-IronPort-AV: E=Sophos;i="5.88,189,1635231600"; 
   d="scan'208";a="145952143"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Dec 2021 08:29:52 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 8 Dec 2021 08:29:50 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Wed, 8 Dec 2021 08:29:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gRjA4G7m+5KfS1eLIsufXgxLnhriRQbzhGYQo/uNDxPl4ZZhtNnIgOxiqNsMCJLQSfjTIHXwdg3caJfxFp9xfbfKr8TunFY613odbUSYRwqrOuBoz2IreC/RNVTTQCzIQgbLQYQufjfTItjcfmtHZK2Y2uHLr0HtvmM64AdTzQzL3guE2CEsBuHt0Pa/A7HLdKe4JZSBV/RGKbwoyBAyWMLKmKvlKxpRz4i8niOIUJ1S8LjnmEVIWUQyF4ayO63LHghsQrV2bDKkMGvPBmbX4foyqeqgu+fCRZA+0vsCPTBW1/mxj+vVmlfsQUJG5DdIExCyJXuDq8atYOzoA1414Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UxiAGq+yedpyxrFFh2+XTa59T9sYjn29RbXOg4KA0zY=;
 b=bLPXysUzqddU57+9ZjH0ckeCFweiJYHRaMR46sgoMFCqWMWYNPNp6XrSok6fpOh3ekbTg+Co3G1ClCVUDX8xTEj5LIWz50G/ngkg4Sl2N8VWv0HUU71sLFaVGbtjr6/FQVAh/fsqssFq+OL9zZK/ioIuByRfrPApiINVUNtxst4lmH6lu8PrYUNjfEXQffqqOrVeJTP/t6QD6JRQLqudFGX6nthdoGSGNHFfjCazSjrS9eWtVQNzVjSPDsyongLFNHLIu6JA+6FrCB5w3xvU2nAYTKssQBrpgZgOPL2khqaDbDl0mzOcwdU09ZeL09GAFn/3CQHS0F8wcx3wwqBDQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UxiAGq+yedpyxrFFh2+XTa59T9sYjn29RbXOg4KA0zY=;
 b=Q03xKLhYMB6DUzRETFd6sWka3hPHqvfZGhAH556hsU4fOR/PQoi9ySFsTQy4ridshLs865IVZXQ3FzqyfeMBsQxM8fV3gNd0YcCw8j9giQdFnhSp7+rntQ2uEvEG6mN6DZgnooeRIJoTXPXRr/iy6p1lwA80SQSuas+BeOsxJH0=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MWHPR11MB1518.namprd11.prod.outlook.com (2603:10b6:301:c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13; Wed, 8 Dec
 2021 15:29:35 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::b9b5:7a56:16e9:8f2f]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::b9b5:7a56:16e9:8f2f%5]) with mapi id 15.20.4755.024; Wed, 8 Dec 2021
 15:29:35 +0000
From:   <Conor.Dooley@microchip.com>
To:     <geert@linux-m68k.org>, <Daire.McNamara@microchip.com>
CC:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linux-clk@vger.kernel.org>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <krzysztof.kozlowski@canonical.com>,
        <david.abdurachmanov@gmail.com>, <palmer@dabbelt.com>,
        <Cyril.Jean@microchip.com>
Subject: Re: [PATCH v6 2/2] clk: microchip: Add driver for Microchip PolarFire
 SoC
Thread-Topic: [PATCH v6 2/2] clk: microchip: Add driver for Microchip
 PolarFire SoC
Thread-Index: AQHX5fN6HlyL/iYcOUCEuV93zQ7Pw6wlpu8AgAMeX4A=
Date:   Wed, 8 Dec 2021 15:29:35 +0000
Message-ID: <3e2a08f5-d1b0-e2d3-c418-4b5b352f0800@microchip.com>
References: <20211130140724.10750-1-conor.dooley@microchip.com>
 <20211130140724.10750-3-conor.dooley@microchip.com>
 <CAMuHMdV=QNtz0rRLQv+=k+GGuSyKANFjGQ1YTKaKwcmzsvf5RA@mail.gmail.com>
In-Reply-To: <CAMuHMdV=QNtz0rRLQv+=k+GGuSyKANFjGQ1YTKaKwcmzsvf5RA@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 440a1001-f94d-4619-e624-08d9ba5f8a75
x-ms-traffictypediagnostic: MWHPR11MB1518:EE_
x-microsoft-antispam-prvs: <MWHPR11MB1518F3E225D56859A9DFFD8D986F9@MWHPR11MB1518.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0xGG0pxeGJegitMDII0///dytVpU5iOuvd3Dsa5kfk3ot6bdcDw/kGmnE944zUXQYyR0P/yxXnKHO11WuBov+WsX2NjxtyPWE/BJbK/e59r/0ypestMvQg2IHG3xiWl9I0KtQHTXMdumfrYsl078bTPJPJyo1KSSLFFfAORV3rwiSqCdber5qbORXyNM/8WHd8o8UBxe9MghnwBovM3KESdR9IboA2bou2MiXP/MH8NbPqvshErG+pWdCLK30O3Ge5KLaZ1VbCnvxJADvn6GsXMocQjN5IxhkgF1T9JWiudaPcTVNgFP1XfWEVWk0YcGxqIdcb3+HcK4wKA2H63jRj+v2WsBPh1lYeNYpL7FQg7ZfgMKDYAoqEVn5eKbkBg/x2EltkUlh6jXC4qGPGgC7nYjFTgKtzzWp+QydTotq4ARs9WgGN+zYvU1aCnXpaTLeLcXsqkN2d/XniIgibjwSO2+0s1vsfKwy9EaMbfqJakKB08Fj4XxQ5t84mlaxlYEWLigqrs+j33pdEl6qkBxutBAuU46cB6r5flbKj29EPsiACNkxsFIOkFXXvl9ZelSgIQm3LaTGVlm53YSNQhfoYF+0cv11YhF6bydAfi6+53pVznbKdwLfp7bGcqFv+yEsnxrbZCQveSVXmW+VSVcNIwMylcTx7iGFDziewOLYVAotxCKY6VkTHoLr7q0BJZmXYuRWXOaVVFvf1IT2KfehuffKr7G9u5kQifC8Feq22fw62mcIDK/y1Idu2WP0OnzcEYj/ud5UhLBX78vW9c2RQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(8676002)(6506007)(53546011)(91956017)(38070700005)(186003)(26005)(2616005)(66476007)(38100700002)(122000001)(66556008)(66446008)(64756008)(66946007)(2906002)(5660300002)(76116006)(31696002)(71200400001)(6512007)(83380400001)(6636002)(54906003)(36756003)(4326008)(110136005)(107886003)(31686004)(508600001)(86362001)(6486002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UFBSZUloWUMvbWlEZG9mcEJKRm83MWthc0pFS29tNjlKakQ3RkJiUzNnbm85?=
 =?utf-8?B?OWZPUytVY3RldjRxd3QvNlFsYUY4QVNCOWxqSWxZZlF1cm11L0RZcko3OVR5?=
 =?utf-8?B?cFpPQXpOTnQvQVBNUFhERVJCa1YzMjdKNkw0V2duZ3QweWxyb0F5UVJFcmZ4?=
 =?utf-8?B?Y3E5aGN5RGt3R0hNdmFhdE5VYzFrSW10WUIxbFFURFdkMFRFbmlXckRhNTlI?=
 =?utf-8?B?OUtxK0NZOHkwZkNnbEx3eDdOVGo4WXNlSUR4R1M2Z2JSVENxaWRnLzFuS1Rk?=
 =?utf-8?B?RUQ3VVExZVJuWkIxWnlhRkhHSjQ5aWNNRjZwYzRneVdNa0hhbmRMRngrb2Q2?=
 =?utf-8?B?aCtTemc4cUtXUmdqWWRlcVFoUS85cTg4alByN29VVGdUcmlZcGJybFhaTWQ4?=
 =?utf-8?B?ZGhqVlBGZTVjUER3bXZlZWgrUnB0NnlRNUpJYkk0OG9kUjM0bTRQS1Q0SC8y?=
 =?utf-8?B?WGpSR25ZL3V6RW4rcDZETTFNVklYNlVnNXlZK2F1ZTZreE45MXhsVTRwMTZh?=
 =?utf-8?B?eXB3aEVqYVNSdk1jK05UN0ROeWI5RElDSCtwbGVqRG55WjQzNWVmcDlGanlX?=
 =?utf-8?B?NFdDZGFSUllYWmJxeGd3TmtiY3VQQ3gzTXRCdDRIWkRYNXJ0VllOczZqeDly?=
 =?utf-8?B?dS96UmFWMWFhU1d0V1orWS9jaDNGS2VaUWJ2czRTaWxvaHAwRTlnbmRYVXJn?=
 =?utf-8?B?dnBVQ1RqT2lHQ3prUFFUanpDbHE1WWpLdS9xdzhrR0g5RWJMTXhBcG5tWmR0?=
 =?utf-8?B?a3lyMHJadXNuQ3k1dCtZTWpQRVJjSmN5ckdMRjRPOGduakZ4RFFnM0llUjV1?=
 =?utf-8?B?UUp2R0tNaHk1N3Z1cWViQm9EbTVlR003L3V0bkV1Zk5KNHZZc2hlN1hwem80?=
 =?utf-8?B?QTk3S2JNK3pDQU12K0tJZ25hb1hnaTFkZ3d0TVpkd2MyWGF0MmdKZ2ZCSHJq?=
 =?utf-8?B?c1VYSFdaZ1VZaVQxYXpRVGZGRlpxakZLS2x1R205UkUvbHNyRmw3OVJMaVFw?=
 =?utf-8?B?Mmhod3pDeFVkengzYm1kamxMd1FGSVNkeGYySEFVZkhZSU5LcC9EQW9JdUgw?=
 =?utf-8?B?ampGRVQzSW1Ub3p1eTRzcHk3UHVsbTJpdkI0dmd4U0FMRzV6Tk5sYnc2VVlJ?=
 =?utf-8?B?czh5WDZSK3V5Uk9WN1RmanJhNmM3TE5BbjdkekxxZnhCUnVrN0w2dTFMWGhT?=
 =?utf-8?B?UVZXOUJHeFAzRTgxSnBWNjU1dG9aQ211cXVHRm9tUmhaOTIxS0E3a1crSEIx?=
 =?utf-8?B?MlJlVkhyN0NIVFkyK3VuM0J2K2J0RXNqb1J4QVBla2FaeGtkVUg5U1BNZmt5?=
 =?utf-8?B?a1FzazlRejk0NWQvQXBlVFdta09DZ2VyTXhWUlN1UHlGNHVxY2lNbGE0aTNJ?=
 =?utf-8?B?dklEQjBUUkMrRy9PY0dSOVdqSmx2cENiR2k2TjFkZERjN1ZEYngrQ1ZzbXlz?=
 =?utf-8?B?TTFJVldlYnBJdUIvaWhkTFBIdFhZM3I1U1hJM0poZmh2L2M0dUNDSHQvVTZy?=
 =?utf-8?B?UHdEWmFySy9rMEw4Q1RWcS83ZUJ6dW1YcDhuVk85OEFmRXhaK3R3NitDVnZs?=
 =?utf-8?B?dUM4OTYycGJlOFpWTkllTTg4TVljaTdOUlZjOW9BaEM1RDJucW85ZEIxVTlV?=
 =?utf-8?B?ZHhac1dQQTZmNjRpdHJlV05kaFZzWUpyY0RsWC8zRVlmNXZUMGxNbjQvSnI0?=
 =?utf-8?B?OFpoT0Z1cU5peGNZRlZqYnppQysrNkhTNjJobVJoTXlnWWdkQmh4ZDBvYXB6?=
 =?utf-8?B?ek9NeEFoUHhHVnE3S2U5bitQaWxkN21Lcjk2emRJRXdGVThXeml4Nm56dmIr?=
 =?utf-8?B?UjdjQVBMcDcxTjZ0eS9tZTNIWGJ4WEpmY2s2WTdZTXRyNUdycXNSZWhKNW93?=
 =?utf-8?B?RzRWMXNQZjcwamNMckg0VzdESCsrUlJpdHcxdzRSL3JFaEIxd0dYb1RrWjg1?=
 =?utf-8?B?N3dnb2J4cGVncXN6SXhtSzZlZ3JyWGVGbXJ2ZnZvdmhtZUQ5RGdpSitlT0U5?=
 =?utf-8?B?VjBhTlFFVGI0Rndyb1E5YXRZVXdEK3JBbExBTGVTbVJNc0FDSkQ0WWpCaFBC?=
 =?utf-8?B?K0ZhRU85YitBY2ZGVmRqaE54bU5MNDQ2Q2tETjJjRFNXQjNaVHlHSmNmWCtB?=
 =?utf-8?B?MnRBSnRyei9vbWRyWWFrdlpRNzExUWUvQ2FtNStuQkdmQmYzNGRQMFV0eXZs?=
 =?utf-8?B?aFZ2eTRqNm5QUUtEYmtRYmJaeW1Lb2hrUkJ5cVdHU2NrOWNsOG45OXVpdWwz?=
 =?utf-8?B?Z09jaUV0YlNjdkkvNGpnUEZLR09nPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F4A42CA9D429944DBFB374EE0C4DC57E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 440a1001-f94d-4619-e624-08d9ba5f8a75
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2021 15:29:35.6652
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: knEUbsAgHyz+DiF30W+jD/V/Lt6Y6KFw7DlnmJb31kvHUHcmtZe4MvAhCIFMlQez+02iDcy6RG4uMmu0ZXHu4X97kWXSHejI468XZBZlqYc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1518
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SGkgR2VlcnQsDQpKdXN0IGdvaW5nIHRvIGFjayB0aGUgb3RoZXIgaXRlbXMgeW91IHJhaXNlZCBm
b3Igbm93LCBidXQgY3VyaW91cyBhYm91dCANCnRoaXMgb25lOg0KT24gMDYvMTIvMjAyMSAxNTo1
MywgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNs
aWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50
IGlzIHNhZmUNCj4+ICtzdGF0aWMgdm9pZCBtcGZzX2Nsa191bnJlZ2lzdGVyX2NmZyhzdHJ1Y3Qg
ZGV2aWNlICpkZXYsIHN0cnVjdCBjbGtfaHcgKmh3KQ0KPj4gK3sNCj4+ICsgICAgICAgc3RydWN0
IG1wZnNfY2ZnX2h3X2Nsb2NrICpjZmdfaHcgPSB0b19tcGZzX2NmZ19jbGsoaHcpOw0KPj4gKw0K
Pj4gKyAgICAgICBkZXZtX2Nsa19od191bnJlZ2lzdGVyKGRldiwgaHcpOw0KPj4gKyAgICAgICBr
ZnJlZShjZmdfaHcpOw0KPiANCj4gVGhpcyBpcyBmcmVlaW5nIGEgcGFydCBvZiB0aGUgYmlnIGFy
cmF5IGFsbG9jYXRlZCB3aXRoIGRldm1fa3phbGxvYygpPw0KSSB0b29rIGEgbG9vayBhdCB0aGlz
LCBhbmQgSSBkb24ndCB0aGluayBpdCBpcyBmcmVlaW5nIHRoZSBkZXZtIA0KYWxsb2NhdGVkIGFy
cmF5Lg0KDQpUbyBtZSwgd2hhdCBpcyBhY3R1YWxseSBiZWluZyBmcmVlZCBpcyBhbiBlbGVtZW50
IGluIHRoZSBhcnJheSBvZiANCnN0cnVjdHMgcGFzc2VkIHRvIG1wZnNfY2xrX3JlZ2lzdGVyX2Nm
Z3MgaW4gdGhlIHByb2JlIGZ1bmN0aW9uLg0KSG93ZXZlciwgdGhpcyBzdHJ1Y3QgaXMgc3RhdGlj
YWxseSBkZWZpbmVkIC0gc28gaXRzIGVsZW1lbnRzIHNob3VsZG4ndCANCmJlIGZyZWVkIGF0IGFs
bD8NCg0KZHJpdmVycy9jbGsvY2xrLWJtMTg4MC5jIGhhcyB0aGUgc2FtZSBiZWhhdmlvdXIgaW4g
dGhlIHVucmVnaXN0ZXIgDQpmdW5jdGlvbiwgd2hlcmUgaXQgY2FsbHMga2ZyZWUgb24gdGhlIGVs
ZW1lbnRzIG9mIGEgc3RhdGljIGFycmF5IG9mIGNsayANCnN0cnVjdHMuIFNvIGlmIG15IHVuZGVy
c3RhbmRpbmcgaXMgY29ycmVjdCBpdCB3b3VsZCBuZWVkIGZpeGluZyB0aGVyZSB0b28uDQoNCkNo
ZWVycywNCkNvbm9yLg0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgc3RydWN0IGNsa19odyAqbXBm
c19jbGtfcmVnaXN0ZXJfY2ZnKHN0cnVjdCBkZXZpY2UgKmRldiwNCj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IG1wZnNfY2ZnX2h3X2Nsb2NrICpj
ZmdfaHcsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZv
aWQgX19pb21lbSAqc3lzX2Jhc2UpDQo+PiArew0KPj4gKyAgICAgICBzdHJ1Y3QgY2xrX2h3ICpo
dzsNCj4+ICsgICAgICAgaW50IGVycjsNCj4+ICsNCj4+ICsgICAgICAgY2ZnX2h3LT5zeXNfYmFz
ZSA9IHN5c19iYXNlOw0KPj4gKyAgICAgICBjZmdfaHctPmxvY2sgPSAmbXBmc19jbGtfbG9jazsN
Cj4+ICsNCj4+ICsgICAgICAgaHcgPSAmY2ZnX2h3LT5odzsNCj4+ICsgICAgICAgZXJyID0gZGV2
bV9jbGtfaHdfcmVnaXN0ZXIoZGV2LCBodyk7DQo+PiArICAgICAgIGlmIChlcnIpDQo+PiArICAg
ICAgICAgICAgICAgcmV0dXJuIEVSUl9QVFIoZXJyKTsNCj4+ICsNCj4+ICsgICAgICAgcmV0dXJu
IGh3Ow0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgaW50IG1wZnNfY2xrX3JlZ2lzdGVyX2NmZ3Mo
c3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgbXBmc19jZmdfaHdfY2xvY2sgKmNmZ19od3MsDQo+
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50IG51bV9jbGtzLCBzdHJ1Y3Qg
bXBmc19jbG9ja19kYXRhICpkYXRhKQ0KPiANCj4gdW5zaWduZWQgaW50IG51bV9jbGtzDQo+IA0K
Pj4gK3sNCj4+ICsgICAgICAgc3RydWN0IGNsa19odyAqaHc7DQo+PiArICAgICAgIHZvaWQgX19p
b21lbSAqc3lzX2Jhc2UgPSBkYXRhLT5iYXNlOw0KPj4gKyAgICAgICB1bnNpZ25lZCBpbnQgaSwg
aWQ7DQo+PiArDQo+PiArICAgICAgIGZvciAoaSA9IDA7IGkgPCBudW1fY2xrczsgaSsrKSB7DQo+
PiArICAgICAgICAgICAgICAgc3RydWN0IG1wZnNfY2ZnX2h3X2Nsb2NrICpjZmdfaHcgPSAmY2Zn
X2h3c1tpXTsNCj4+ICsNCj4+ICsgICAgICAgICAgICAgICBodyA9IG1wZnNfY2xrX3JlZ2lzdGVy
X2NmZyhkZXYsIGNmZ19odywgc3lzX2Jhc2UpOw0KPj4gKyAgICAgICAgICAgICAgIGlmIChJU19F
UlIoaHcpKSB7DQo+PiArICAgICAgICAgICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgIiVzOiBm
YWlsZWQgdG8gcmVnaXN0ZXIgY2xvY2sgJXNcbiIsIF9fZnVuY19fLA0KPiANCj4gSSBndWVzcyB0
aGUgX19mdW5jX18gY2FuIGJlIGRyb3BwZWQsIGFzIHRoZSBjbG9jayBuYW1lIGlzIHVuaXF1ZT8N
Cj4gDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNmZ19ody0+Y2ZnLm5hbWUp
Ow0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgZ290byBlcnJfY2xrOw0KPj4gKyAgICAgICAg
ICAgICAgIH0NCj4+ICsNCj4+ICsgICAgICAgICAgICAgICBpZCA9IGNmZ19od3NbaV0uY2ZnLmlk
Ow0KPj4gKyAgICAgICAgICAgICAgIGRhdGEtPmh3X2RhdGEuaHdzW2lkXSA9IGh3Ow0KPj4gKyAg
ICAgICB9DQo+PiArDQo+PiArICAgICAgIHJldHVybiAwOw0KPj4gKw0KPj4gK2Vycl9jbGs6DQo+
PiArICAgICAgIHdoaWxlIChpLS0pDQo+PiArICAgICAgICAgICAgICAgbXBmc19jbGtfdW5yZWdp
c3Rlcl9jZmcoZGV2LCBkYXRhLT5od19kYXRhLmh3c1tjZmdfaHdzW2ldLmNmZy5pZF0pOw0KPj4g
Kw0KPj4gKyAgICAgICByZXR1cm4gUFRSX0VSUihodyk7DQo+PiArfQ0K
