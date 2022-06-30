Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20AE2C43334
	for <linux-clk@archiver.kernel.org>; Thu, 30 Jun 2022 10:20:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234812AbiF3KUn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 Jun 2022 06:20:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234370AbiF3KUm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Jun 2022 06:20:42 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5157345074
        for <linux-clk@vger.kernel.org>; Thu, 30 Jun 2022 03:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656584442; x=1688120442;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=nFHhCXXToWSHZlrdp1lIa9X9ERZmeSqTBuTDWN1QZS8=;
  b=d3j11SNOBi1O44dU6ANckSu4t4ZA48GOxZRDxBBpzZ0q0rpWCSBR885y
   ke0Ixf8+cSbnks3OMccP1CxS6ejZVYX48pyaOizb3lIXGXQMS75EddNWU
   sdSeaPE4fDzpbRjVRwerObnPuw1uOldfTbRnSk1X9WacojVks1AngcfQq
   9lWmE2+O4a1UpThc8bc/HzxV8AY4Zgp9Ibs7FcSC/gZSnTtjy6S04Ohdy
   04qXfNQK+seK1AuM3nbIRR6nx2aL8G4u1y4hA22bNP6smC8+Jz7dJxpio
   zBterHrlPiTUcG8XozahR03UeTjd2Xpne5wEzgD0D6tblgrDUZusPLw7P
   g==;
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; 
   d="scan'208";a="170231231"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Jun 2022 03:20:41 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 30 Jun 2022 03:20:40 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 30 Jun 2022 03:20:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EkH/5m/YpShqGiw8UZtHyAr0/Ch9tKhYzlH6Jm61Qg7sH7DhrAYjQ75DTaOo5fF5TIozm0qCdvLHwstIuHZ/MOYapJgIx62jujmeIUCa1LwPHi1Et6zpRbWZcwHBkW2GYsvElRqrFNspfUG2GIF5Y9lVbRswdjw2Jh/M9IKARfWeVSzCVi1ZKzH1yOR4GTzAtoz9zhMv4m/AgFh4Tg9N0630M9E9gvhvqLTD9w/T6twpNbllrZNG4QPHZaNwHhDQ7NEcgSRzXl7FtwBa36UcaxukPQruf6Gs0Cq9I//S6ZD38ejf1eUfxhlUV0Lf7uetDqJ2bISnCUkzVrUv6R0WZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nFHhCXXToWSHZlrdp1lIa9X9ERZmeSqTBuTDWN1QZS8=;
 b=KbFhh1gzUwdi8vTsTLLGDU7pGfT+vcmF6egKPO6rAR5YAE3zwSfNaGIYGffPDiVcyj75axrZcy/EIy+Er3YFaffcoMwxMcFLRVol0DstLhAgrCmq6vzjM3w4mMEUR8phmQbgmCsqPurIFB1UZGx19Z3grBKSBirc2h2j84GthNoMFd1EIsvFH7T3qVD5We2IsmoUL+V4LIhVjUEdlOYeVpbLAhGECQrxzLgTfwfDp9RDPwlMCtFgaO/xeilLyUC++WwkO70Ecj4YmuMo1ecZSB0+Jg0m3TyJVEfB0EvBARNNdltun33dbWwDexnfmiGW7q0O9Kx2aMSzXqI/eOUq2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFHhCXXToWSHZlrdp1lIa9X9ERZmeSqTBuTDWN1QZS8=;
 b=vmeC546KCMZ2ydN5UcLbgjvetTTfcSh78I+yN2VBWOw1IL/8GPXatmZinj41Hyk7yBXyQda4iRVktuHKgd3aEiIRmHRYmpEL7VGQh5J288Mr41k1KKCRIu5w/NCL9oz5GOjAdaPFH+Wqy6RexYiTIDhdP8x9m4j9sg/gXrKPWPo=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Thu, 30 Jun
 2022 10:20:36 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::5c8c:c31f:454d:824c]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::5c8c:c31f:454d:824c%8]) with mapi id 15.20.5395.015; Thu, 30 Jun 2022
 10:20:36 +0000
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
Date:   Thu, 30 Jun 2022 10:20:36 +0000
Message-ID: <b026e219-48f6-f12d-2c91-7b64372fc178@microchip.com>
References: <20220628132256.164120-1-windhl@126.com>
 <6a78dca9-96d6-08c3-7cb2-6773b4bc3883@microchip.com>
 <1e2ee2fe.6513.181b3d6580c.Coremail.windhl@126.com>
In-Reply-To: <1e2ee2fe.6513.181b3d6580c.Coremail.windhl@126.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 46870119-5054-4bda-e90d-08da5a822c56
x-ms-traffictypediagnostic: DM4PR11MB5536:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TXtc5Hfsraeyk44QMIkt2JW6WxiVE133OsEGJqwBAQgOOuXWbbzwMv7QwPHVBUdrbszqZKo43zdr4Y1y+hENqV/agTaSUtN/EAvytlj+JeovyTAszzvsOzuFQBEFVa3S3lEqJGix9FnLU7ilVwa4uZnXPP41wGel3BNciyH3fMCr79KVWJrjp/sODsOCDFCaucvVmM1kltrFMLgfqNGxuQ2u1qxK9eAbSgvQxRUf3miiP0ni2RCuG6rww0IijnBB89zTXqsLQ5YqjZUu5p8TpVp/Ddlvni0ZWXF6r09eby3fNaqenKZLIdZcQgINTAkyPqSWIDdjj9b1w7ZFKW5jJk70pZDWwLolKCPkgylaL5fHQ+eCJPz9CbgBqUNPY8omDJhawGlLs4GrPkv5/dflepideZCUg1Vf2OvDODFk02iG+oOGdazimGvUMuEGfHiNmQIUxEypFrDxdBBBpPLBRlp77ZgaaLxEFGYQJGVltmZUy2RIi9BoW5o5K7fq5u8udSkWe9KebLcMk2wqwjDkh9QNyj7vKphDHXemh3yrNFvtbSVRB4dUbnVzPul0Ec/vrSfeYv9CaJx0o24Co+66thOU0M7w7x9XY0bHnSaM+C4C6OJVKFbUGNfIxHxPdWmtL6L490GKtIkW0vjd3NL3+ayi+r/OuCOJYIbX1+k9sRgSEwSGIZBS9EIQTryoUB/u6w/hZqp+ZNrFg0MEs6TqwUutpZIVNZ4cCL1Wg/BVkgMarz5kR+iogPNscpUw3LFS1hCbPYs3Fd0Bdz1IyiVpfXnfUllhnOYGPYao5yTpDz057Lb09rZDKAXps7hlRwRj4Y3PjSrobYCidktOlwTzjkq/I7rP0RvaY1v7NPmBfpd75gGeMB4kDipLH8rjBAen
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1953.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(396003)(136003)(366004)(346002)(39860400002)(71200400001)(83380400001)(36756003)(54906003)(186003)(6916009)(316002)(2616005)(478600001)(38100700002)(31686004)(26005)(8936002)(6486002)(31696002)(76116006)(86362001)(66476007)(66556008)(8676002)(64756008)(66446008)(91956017)(6512007)(4326008)(122000001)(5660300002)(41300700001)(6506007)(38070700005)(2906002)(66946007)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cHd2K0VUbEZtclB5ZmhlaGVxUkpiYU8reXR0R0lRMkFlMXZFK3IvRXdZSjhz?=
 =?utf-8?B?aUpCS2VhWUZCME1DWHhteUlBTkFXdGhDRWJxeDNVazJyVFJVVmhXTklJaS9N?=
 =?utf-8?B?dGtvaWlKQStucER6VWlJUVJiZHUxeGtqYnhOYmlCNkFKVEZ3K1BLc3E3QjQr?=
 =?utf-8?B?M1Nib25FakFXSEQ1RjNQK2xSdVg0ek1FWDJOTm13b1hjYllCbGVpNEJoYjV3?=
 =?utf-8?B?MGxYMS9DMnV5T2pNTEwzcWorT0FjYS83OW9YRmNnc0ExNlhtTkd1V05HYjl4?=
 =?utf-8?B?dThYTkw2Y3NMKzNNMXEwSWJpZWJPUnpSanBNUmpnbmFKRUNrVmUwUVZRWEVC?=
 =?utf-8?B?TDRTaVZmUjg5UXI1Tm5qSnBGU3NTSUxhV3B6aFhZYXYyN1FzWVcxNzNzMlh3?=
 =?utf-8?B?WWFoejJLSGwwZWlhaEpTSGZYTDNLYjB6allqVS9WZFRjd3JtbmFDNzRKZ0pv?=
 =?utf-8?B?RkEwNUVBcEpJZlFROFJIeVluR2N4VXBuL253Z3dRRUJGU0xHMFdZRjN1WmFp?=
 =?utf-8?B?TEFka0xCVGxRZjZOVFRremZMekVZU1hROWRIdFFJZXZDamlnS1BpdFFXK2Vo?=
 =?utf-8?B?eWRFV0JoeVJHZG5GTWNpOEJJUytUZzVsVGdMOCt3TGFPUWlhekwza1IvQXo2?=
 =?utf-8?B?WGw4aGpybndkT3hYOVFCdWMxczV4akNTMlY4K0hXMExjY2Q1NlNkYjcyZmVO?=
 =?utf-8?B?cXhTM0Y0TGJtblRndlNHcmdYK3VxYS8wUDdKaFJHOGFvZnlUaGJkc1ZvSWMy?=
 =?utf-8?B?cGFaNDFlTm11VDRTLzhMb0JLY1EwRVV5ZDViOGdnSUkxWXBRVVJEdWdjUmVR?=
 =?utf-8?B?S3BKRURUTFVHTlphWkx2WjFpYXpyYXRDNlg2VEtOOXhjeWtDZDVLSVY4ZStk?=
 =?utf-8?B?OWJicEJQTGlqcThFdzJsazhmK0o1b095U3o2NjRmN3FYSHIwcnA1ZG5SWFNo?=
 =?utf-8?B?SGdWUmx4czF5Y3lKZ2dHYWY5VHV5Rzg3TEY0WG5idEI4eUUvSk1iL3dqeVVW?=
 =?utf-8?B?QTRteEJVS29pZk0wRDhYMUxiVzNBd21FNU4rdVFkZ3NiNXhoRkppZUlhbmhF?=
 =?utf-8?B?MDF0VDlDTUJLaW15bit0dStlY0ZlQVl6Wnh2a3RPcDFHVmd3dFltb2xCd2I3?=
 =?utf-8?B?QkVTWWx1M0VGTmpCYllFZnFkN3AwWFQwcjlRZTROaHBOOGlYYUE3YXRQYWMv?=
 =?utf-8?B?OWd2VnhEWWU4YkVVb0xSVjgvalFhYzFjTnY5U3hsOWY2S3pwcTI5aUNiaE11?=
 =?utf-8?B?dUhnSDd6ZGZYcU1GWDdWZkVQM3V1OHlXdnpGNHFLVFhRMzA2TjUwei95NVNo?=
 =?utf-8?B?SjJIN0VOdStxQnlpUFNKRURCU1M4OXFGOHo4R2hPMG96NUtsMGxRM3U0TW1w?=
 =?utf-8?B?RE1yS2J0MktGa3JjY3VSOWp5T0cyNE54cWczbVlYWGZTNUUrTWZEUUlVTHBN?=
 =?utf-8?B?M0RwTXo3dXE5aTQ2VjZvVnpiUnJlSDhQZ1o4ZTNYYTMvbzBXMjNwbU1IY2Nz?=
 =?utf-8?B?V211bDBMNnFrSlR2MVZLS3l1SlhReU1rVTJUdTM3RFJMeVZacVZJNCtRL3Ba?=
 =?utf-8?B?bk9OVDZHdWkydDYzaVM2QkZQNTFEeE52RUF2V3BqWk50c0J2RnZsaUxKeFJi?=
 =?utf-8?B?RC8yYllIbGRZbG1sR2xvUklRclVSS1QvaHUrQVhxd01wREo1ZjBKaDJMMzRo?=
 =?utf-8?B?d3FwMGZHcXpjamVVdnlxdWtJSnJNSFg1aHp0bnBVcnlSazFkOXV1RjVhSGlE?=
 =?utf-8?B?MTZLV0ZHU0JDSThrTkRnTWUrYWd5YzMxclg2amt5WkdQa1dRWkswTHR3RkpY?=
 =?utf-8?B?ZGZVT2tvNkhhMy9mTkRSVEJRc0U2blNybHMrOGdLNjBCSDFqU0piUTR4djRZ?=
 =?utf-8?B?MTB1NVk0cklLejJzcEU5bFJJRDMxc0RyNnFtZ2tGTjBEMTk2SUJxek5vVUl4?=
 =?utf-8?B?WVg5a05hL2NiMHVpR25pRlk0VWhpekw3dVY4ajlEaGdla2hvRXJCbUhXb0xI?=
 =?utf-8?B?VnFxNkZ4WllJN0M3QkFERzM4T1BEVGRFS2VobXEvSkhrSVNUYmtOOThuVGlV?=
 =?utf-8?B?SFpTdDE0VVBqcnU3eVNKYWNBUUhuVjBuUVJCcmFQaDhEbmVjc2RNdEJPZ25K?=
 =?utf-8?B?Y0JPakM5eDZoeGI2VVIwemlUVHN6NmZvREhLRjFKUk41Y3NsaE5IVnhMMlpx?=
 =?utf-8?B?L3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3A9DEC8820C2C94BAE64504E59DD1957@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46870119-5054-4bda-e90d-08da5a822c56
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2022 10:20:36.2331
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qWhN50jX1lJZpPi4vP7srEJqRj/GD61Fp8A86/B6eEuhX3qeJhH+HBa/wJmFCjqp3oUmjvPLXPd3o6+d87UyfmRRLUD3du+fm/9tNDnDuHM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5536
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

T24gMzAuMDYuMjAyMiAxMTo1OSwgTGlhbmcgSGUgd3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlMOiBE
byBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cgdGhl
IGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gSGksICBDbGF1ZGl1LkJlem5lYSwNCj4gDQo+IEF0IDIw
MjItMDYtMzAgMTY6Mzk6MjYsIENsYXVkaXUuQmV6bmVhQG1pY3JvY2hpcC5jb20gd3JvdGU6DQo+
PiBPbiAyOC4wNi4yMDIyIDE2OjIyLCBMaWFuZyBIZSB3cm90ZToNCj4+PiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUNCj4+PiBbLi4uXQ0KPj4+IEBAIC02OTQsOCArNzMyLDggQEAg
b2ZfYXQ5MV9jbGtfcHJvZ19zZXR1cChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLA0KPj4+ICAgICAg
ICAgdW5zaWduZWQgaW50IG51bV9wYXJlbnRzOw0KPj4+ICAgICAgICAgY29uc3QgY2hhciAqcGFy
ZW50X25hbWVzW1BST0dfU09VUkNFX01BWF07DQo+Pj4gICAgICAgICBjb25zdCBjaGFyICpuYW1l
Ow0KPj4+IC0gICAgICAgc3RydWN0IGRldmljZV9ub2RlICpwcm9nY2xrbnA7DQo+Pj4gICAgICAg
ICBzdHJ1Y3QgcmVnbWFwICpyZWdtYXA7DQo+Pj4gKyAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUg
KnByb2djbGtucCwgKnBhcmVudF9ucDsNCj4+DQo+PiBJcyB0aGVyZSBhIHJlYXNvbiB5b3UgY2hv
c2VkIHRvIG1vdmUgdGhpcyBvbiBhIG5ldyBsaW5lPw0KPiANCj4+DQo+IA0KPiBJbiBmYWN0LCBJ
IGp1c3Qgd2FudCB0byBrZWVwIGxvbmcgZGVjbGFyYXRpb24gb24gYm90dG9tLg0KPiANCj4gSG93
ZXZlciwgdGhpcyBtb2RpZmljYXRpb24gbWF5YmUgdXNlbGVzcy4NCj4gDQo+IA0KPj4+IFsuLi5d
DQo+Pj4gICAgICAgICBzdHJ1Y3QgY2xrX2h3ICpodzsNCj4+PiAgICAgICAgIGNvbnN0IGNoYXIg
Km5hbWU7DQo+Pj4gLSAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKnN5c2Nsa25wOw0KPj4+ICAg
ICAgICAgY29uc3QgY2hhciAqcGFyZW50X25hbWU7DQo+Pj4gICAgICAgICBzdHJ1Y3QgcmVnbWFw
ICpyZWdtYXA7DQo+Pj4gKyAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKnN5c2Nsa25wLCAqcGFy
ZW50X25wOw0KPj4NCj4+IFNhbWUgaGVyZS4NCj4gDQo+Pg0KPiANCj4gDQo+IFNhbWUgcmVhc29u
IGFzIGFib3ZlLg0KPiANCj4+Pg0KPj4+ICAgICAgICAgbnVtID0gb2ZfZ2V0X2NoaWxkX2NvdW50
KG5wKTsNCj4+PiAgICAgICAgIGlmIChudW0gPiAoU1lTVEVNX01BWF9JRCArIDEpKQ0KPiANCj4+
PiBAQCAtODg1LDkgKzkzNiwxMCBAQCBDTEtfT0ZfREVDTEFSRShhdDkxc2FtOXg1X2Nsa191c2Is
ICJhdG1lbCxhdDkxc2FtOXg1LWNsay11c2IiLA0KPj4+ICBzdGF0aWMgdm9pZCBfX2luaXQgb2Zf
YXQ5MXNhbTluMTJfY2xrX3VzYl9zZXR1cChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wKQ0KPj4+ICB7
DQo+Pj4gICAgICAgICBzdHJ1Y3QgY2xrX2h3ICpodzsNCj4+PiArICAgICAgIHN0cnVjdCByZWdt
YXAgKnJlZ21hcDsNCj4+PiAgICAgICAgIGNvbnN0IGNoYXIgKnBhcmVudF9uYW1lOw0KPj4+ICAg
ICAgICAgY29uc3QgY2hhciAqbmFtZSA9IG5wLT5uYW1lOw0KPj4+IC0gICAgICAgc3RydWN0IHJl
Z21hcCAqcmVnbWFwOw0KPj4+ICsgICAgICAgc3RydWN0IGRldmljZV9ub2RlICpwYXJlbnRfbnA7
DQo+Pg0KPj4gWW91IG1vdmVkIGFyb3VuZCB0aGUgZGVjbGFyYXRpb25zLg0KPiANCj4+DQo+IA0K
PiANCj4gU29ycnksIEkgaGF2ZSBiZWVuIHRvbGQgdG8ga2VlcCByZXZlcnNlIGNocmlzdG1hcyB0
cmVlLg0KDQpJIHRob3VnaHQgdGhpcyBydWxlIGlzIG9ubHkgZm9yIG5ldHdvcmtpbmcgc3Vic3lz
dGVtLg0KDQo+IA0KPiANCj4gU28gdGhpcyBsb29rIGxpa2UgYSBub3JtYWwgY2hyaXN0bWFzIHRy
ZWU/DQo+IA0KPiANCj4+Pj4+ICAgICAgICAgcGFyZW50X25hbWUgPSBvZl9jbGtfZ2V0X3BhcmVu
dF9uYW1lKG5wLCAwKTsNCj4gWy4uLl0NCj4+PiArICAgICAgIHN0cnVjdCByZWdtYXAgKnJlZ21h
cDsNCj4+PiAgICAgICAgIGNvbnN0IGNoYXIgKnBhcmVudF9uYW1lOw0KPj4+ICAgICAgICAgY29u
c3QgY2hhciAqbmFtZSA9IG5wLT5uYW1lOw0KPj4+ICsgICAgICAgc3RydWN0IGRldmljZV9ub2Rl
ICpwYXJlbnRfbnA7DQo+Pj4gICAgICAgICB1MzIgZGl2aXNvcnNbNF0gPSB7MCwgMCwgMCwgMH07
DQo+Pj4gLSAgICAgICBzdHJ1Y3QgcmVnbWFwICpyZWdtYXA7DQo+Pg0KPj4gU2FtZSBoZXJlLg0K
PiANCj4+DQo+IA0KPiANCj4gU2FtZSByZWFzb24gYXMgYWJvdmUuDQo+IA0KPj4+DQo+Pj4gICAg
ICAgICBwYXJlbnRfbmFtZSA9IG9mX2Nsa19nZXRfcGFyZW50X25hbWUobnAsIDApOw0KPj4+ICAg
ICAgICAgaWYgKCFwYXJlbnRfbmFtZSkNCj4+PiBAQCAtOTI2LDcgKzk4MSw5IEBAIHN0YXRpYyB2
b2lkIF9faW5pdCBvZl9hdDkxcm05MjAwX2Nsa191c2Jfc2V0dXAoc3RydWN0IGRldmljZV9ub2Rl
ICpucCkNCj4gDQo+Pj4NCj4gDQo+IA0KPiBJZiB0aGVzZSBkZWNsYXJhdGlvbiBjaGFnZXMgYXJl
IG5vdCBuZWVkZWQsIEkgY2FuIHJlc2VuZCBhIG5ldyBwYXRjaCBrZWVwaW5nIHRoZSBvcmlnaW5h
bCBvcmRlciBvZiBkZWNsYXJhdGlvbnMuDQo+IA0KPiANCj4gVGhhbmtzLg0KPiANCj4gDQo+IExp
YW5nDQoNCg==
