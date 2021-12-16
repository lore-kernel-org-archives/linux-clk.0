Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33043C4332F
	for <linux-clk@archiver.kernel.org>; Thu, 16 Dec 2021 12:07:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234954AbhLPMHK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Dec 2021 07:07:10 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:34420 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231468AbhLPMHJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Dec 2021 07:07:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1639656429; x=1671192429;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=dw86lbOCckF6WIub1lQXpd5Qt8iOeVd6j/PJRWeXRb0=;
  b=J1Wq3ZqHNYeJ7+4HMGPnwAvVuf9O6rUJLgIDvfHV8tHbtlNXkF/+JDya
   Q2EiZZAaUMWW09WajnJDruSJaMRSKYqueJediDJpM5DvHufBp0kiAnCPK
   XIbZ2O/6kzFY1oujioyo30Ud1Q1SAv6RxyMlQSUNSBOm2MpeIrCh+Zaz5
   28wLbsbwVh1YyLy28TLmgg7XHOg+TsYptJi6BGrTbMaLENBsSngKO1qXa
   gUWqnTjXgCzIsIyYcPgILfaOWHVro4RdtRw0ImZEBKLY3XlH6d0tGizgH
   SbNR/WSjmEKSxA8m2XSkmL8XWNPOTcRmMwmNyq0h5E0LPz1mmE3RkJJkW
   Q==;
IronPort-SDR: W0Ied8N6UzjC5z4igcNQjTBZjcpuiwZ1DxJE9CMsu4EzhZW9hWb4oOFlmuA67yKMPoF51FkuAf
 XP2w7oB/Tm1AjwqI9FP/YMJytyIVWf/b7/DZeUFfUfM2LlLZtS2ej9ixphHlqpJEqIY4Kof/UL
 H5hvhNvi9iFK7A/SE07GsKbZ9y/+mSOKqVDwYe9mRZz7Pnr13k6ojeuc2L80IAk1vAuCQxLU5w
 ViYcgBP6WrMQgvtZEMeLpuJgxNPq6H5CjKXrNa6o0gSmDnjaH6c0UnvQhDzblJrcMlw1CL9zH9
 Vd5FwiUcpCHGczKOTlLo/Oom
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; 
   d="scan'208";a="79770609"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Dec 2021 05:07:08 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 16 Dec 2021 05:07:08 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 16 Dec 2021 05:07:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dX5/xlyJdO2ApFdkLG4LlsgKlQEpwR9cL98ThIsrDx4xJj8LFAzY7/TU/ytmNz7h/rOEhu8k8NSbNYvZjhVLW1fuXwugy2y2k5bWF69YmoxOb6+caBUtmNsaKwfdVoPfuUB6lXRJFaE1LA0WuNi2BHLfwy0h13kCP5A55WCcxJbNNpp/0+ze8IwFn4CfZtMp2LFTC/sxiCGFaU6WEz6OEAQJgYpg3zRJSKNtDkTDQGChlFM7p9w4CW8vHZ+5dKdGH9OOKBjniQ9cfVtfEZ19jxqF8qhUyGouZ7shrMvC4l3tiohLGZ1eTD9Y5WO4l4c4YJ3PIrjL/r8IbTzcGgewgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dw86lbOCckF6WIub1lQXpd5Qt8iOeVd6j/PJRWeXRb0=;
 b=QAjI6RPSs+jp2TaaniEKKkzkLPncMHKUr201/N2Uputvac3wlBiTBhVNgg90JywpqQ1MpRYrbde6/5sXtM/dF9UQT5XKp+0YnBN7dBLYcitpsT9RGo7rrJbq381F3KUleAB8JmF848cGCTD0s37lGaxQZDdI1oOtPoaKVaoQ2jdbAT9+jI/yW08e6je6Uxj8zaaLTJdlRRzA4Watmc6mBQJRCQ1CFjQSHaftrrYyBFQ+wC9dzC7kK6wJhJHIqcz6IzCA2y3qiMUuHBmwTd6o43yfgAH6RDECf0qkdJxuE6AccZ2M+q6ye48s/fT2YRwNDAY6ZdTE2H8r5vHRiqDExQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dw86lbOCckF6WIub1lQXpd5Qt8iOeVd6j/PJRWeXRb0=;
 b=caYnaLDvP6k2iHbaJSbmDyIP6A8J1hswOPRTpuOp6ln1lRFQgXuto5SB7h92Z4kn6w+24salKcBlP2XIAC8dcmVm0EAiRQPXR+dVyHJjL5MV6wqR2kmOIwe5Pi7Ll30cGwHhTEPr4xnkJ6QddL5Hnx436brNj/+9ccNMyLbGZlg=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MWHPR11MB1406.namprd11.prod.outlook.com (2603:10b6:300:23::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Thu, 16 Dec
 2021 12:07:06 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::a192:c9ae:1f83:797b]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::a192:c9ae:1f83:797b%6]) with mapi id 15.20.4778.019; Thu, 16 Dec 2021
 12:07:06 +0000
From:   <Conor.Dooley@microchip.com>
To:     <geert@linux-m68k.org>
CC:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linux-clk@vger.kernel.org>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <krzysztof.kozlowski@canonical.com>,
        <david.abdurachmanov@gmail.com>, <palmer@dabbelt.com>,
        <Daire.McNamara@microchip.com>, <Cyril.Jean@microchip.com>,
        <Padmarao.Begari@microchip.com>
Subject: Re: [PATCH v8 2/2] clk: microchip: Add driver for Microchip PolarFire
 SoC
Thread-Topic: [PATCH v8 2/2] clk: microchip: Add driver for Microchip
 PolarFire SoC
Thread-Index: AQHX8mEn7iDdIuMCu0arBLcHpn41Naw05fSAgAAgs4A=
Date:   Thu, 16 Dec 2021 12:07:05 +0000
Message-ID: <d50fb404-4927-de43-ff96-b4bae21b3182@microchip.com>
References: <20211216094304.24461-1-conor.dooley@microchip.com>
 <20211216094304.24461-3-conor.dooley@microchip.com>
 <CAMuHMdWz+rrJ6b7uy8EhecT4vACtKSKv3GtkjtQdfG5K+nkxHg@mail.gmail.com>
In-Reply-To: <CAMuHMdWz+rrJ6b7uy8EhecT4vACtKSKv3GtkjtQdfG5K+nkxHg@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6ec7ca1f-09a6-4e6c-8c5e-08d9c08c9400
x-ms-traffictypediagnostic: MWHPR11MB1406:EE_
x-microsoft-antispam-prvs: <MWHPR11MB140690E2580ADC1CCDEE433D98779@MWHPR11MB1406.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yS65X1/epa3DqH7kZTUzzBuD1zyvDkp6waSQ/vWXKlUBo+ozk1f9kmaxjZ/FmLVEUvp8rQN2MfP7KxUKP3yPcfS0LRBBkK5P2ZBN6yrJ/KobNNyKBXGygPhsq36F13aQx6uiFJDoO9REL81IcvSlJ4Ow3HgSC074LrboyiarXYEdiiWgMmvlf6xHEFgqzS06Z41LX8qdj1yuBkYbg7y0qpDKIgDJDABQpiUgN5OApNaavRig6gyHMNue0W9CmwrMyoAxa6u+MKupgrN07h7xdpyQEmjCi93XIwo48v/FViGStODTGjyIPfPZSL5TAdLEpuLAgajDD4Yp+GIxz6f0sF8tHIH0TEl77tm/9lzsnYPV/mWUdfRl++vW3VT+N1rsWkNT0Cl8yKtUKCDIVVugtVjUJ7mxJ+eApbUkZH0xS0SvQi4AfWPKZDJZIzJVaQmejpQRqUDXPYSCer8RmOEWn/ITjefgakpkwXD/3qUjpPrMhnAPpC7R5PHr9QgAAlZ1926m1YSaCK8T+xpp1WUxOhiVD8Iaz0n+f92CPeGeQ+1ugrfTLtSijgmSobjd/AwzsiTQ/V6YZPwtXv0gLpllBgKKAtXgnE3KXStZwEcAJ6jZV9o//1dGhc2102EqOSKnhn6AmKIr3SEAU7+jMr+ThH/fkyvAMm5LrsEMUda1oGCV3DtkMzsFgqsLHzw8JCIolPatOYomSq/jB8gb/otl432SA5GhcBhwVgl2VmkFwwW9lBkeZDUXn9+P+6NMPOJLHPKeTF0alWy++GHWe0wTjQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(83380400001)(6486002)(508600001)(86362001)(38100700002)(36756003)(66446008)(64756008)(76116006)(66556008)(66946007)(107886003)(186003)(6916009)(31686004)(4326008)(6512007)(66476007)(91956017)(122000001)(5660300002)(71200400001)(31696002)(8676002)(316002)(8936002)(26005)(38070700005)(53546011)(6506007)(2906002)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WWJOOGtiT01sOUUvK1NOeWswZXlUUEVUTlN2amx2WS9PQ3YrcktoR29KZlJW?=
 =?utf-8?B?S2pZN0FCeGZ3M3AzUjljb2oyeFRYMDBrSDdNV0Rab2MzUFdMRHVNQ3RrZVht?=
 =?utf-8?B?MURxcmRpZTlHL1pMTTlPS2c5S0RaOHRoakdHeEVpeVVTR05SYzVoeEcvVk8z?=
 =?utf-8?B?L011aEp2dUQva2gvWkdUeXdhS0djVThSeFRJbDAxV3pIaTIyZ2dUZWJESjlo?=
 =?utf-8?B?TDRHQ3hFSERWcGZjZmtLczIzMlhJUWx6MWJhSEJuREJEcG55WlRvTkVZL0RK?=
 =?utf-8?B?Q0dDV2pPc2hlc2VHaGJocURBNzMvMVlIeGU5YVFoZ2M4bDBYZkx2cGd1SVRJ?=
 =?utf-8?B?RTgvMkIyeU9xTHlDMHR3U0VaajVwUDQvUnNVNEV1YUYvZnNSczUzUXJmZHN1?=
 =?utf-8?B?aWxNRUt4dWVRYnR5MmZUOEJuVG1Dak5nQmFscWR1UXBNenR5RldqdExMdlJM?=
 =?utf-8?B?TkhrNG12Q2JlZytVOWRVa3EyaXRZQ2Y3U3YraC9RSFRCQVhzMkdmSTdwWVla?=
 =?utf-8?B?VEtUY0ZwRjFZajEvNXU5Tmthd1ZROTBhL1dTeUpkMGJVbTczRStGeVB3eTc5?=
 =?utf-8?B?bEFlSnAxYW95Y3BxOVZKZkIwbFNUcFZld1JOeVFSMDJlM2NKMkpISVhNM3po?=
 =?utf-8?B?dDBIL09NcmVLbWhtbHBUUVp4R2JwbDh4Kzd0K3NhOUZOVk9FT2dWZzFad2tK?=
 =?utf-8?B?Q0J6a0t6Vlh5TzV2eWtDb0hWZVE4bE1DTmw4QzYyM3dKZTNtbzFqKy9NdTNm?=
 =?utf-8?B?SVhqOXdaQ0xqWWY1R2FlT2s5UGUwU1RGRUQvNllNT3hRc2lEUWw3dmtqSzFo?=
 =?utf-8?B?dUdVL1l3ejJSTVVMa2ptRmZONHl5aytjK1hSZkVLKzEvQm1LSE5YbXZiMHJX?=
 =?utf-8?B?TndIWFN5R3BkTVpjbE9UUVFjM1pUeHhoRExmZzZFdXFmQ2tOOWg2bUFlSzJP?=
 =?utf-8?B?OXJPcmRITk9zZlBUR1J5RVREcFRpY2ZEbTA4U3ZXY25ETytpMDZCMTRDVGZE?=
 =?utf-8?B?ZVJSQ1lZSDREMi93VWp1cjFPSnZnSmsxYUNLd2w4SzliQVVUU3VLOGV0ZU9a?=
 =?utf-8?B?eW1TU01KczNldExPMjV3YWdsdk04UVdZeFQ5V1JUWWFteWM3bDRjeUo4ZE0w?=
 =?utf-8?B?S3I1S3I1aFdsMWxRRlpoUkw1UUN3RmpaeGFJVXF3VCtUMWxpOVFBSVVYZGtj?=
 =?utf-8?B?cG5RZEc2RkRJVGJGQkk1czczNG56djQ5VWJpNmtDRlhpeXkrWEViUnFYR2Q2?=
 =?utf-8?B?QmJtd1hHdTdCU2pWU1JIODZlcHRqN1BOUkxMK0hkb2hDS1JZZERReFNPR2lq?=
 =?utf-8?B?ektYb0NoTkpiL0N2U0FVWEs4M1FBYlR2SmdnQlNVSE5SODNuSnd6MjlZbkJ5?=
 =?utf-8?B?U0JPeFRFVHFEOWExNk91bmI1aThwb2l3L2RhcElQTkhoNitDZzVaV3ZPWkU0?=
 =?utf-8?B?Zm0vWFkvbUpjaHl3SDRMVHNJNkxHSlJTckFBdmt4VjBGYmJPR1I2T0ZjRkJY?=
 =?utf-8?B?bUhyTHJlQnlEMm1xVk9STXZTNmlXeGZTek04T2YvcVRzN3FoUkNRaXp5M2Fn?=
 =?utf-8?B?cmZCcm5MQUNQL1JNTUZidk9NRlRKVHlNa04yNENXR2JSeGJKOGtMSDkyckJY?=
 =?utf-8?B?bjRCM1VTNWU0RVhvYU5uYjVlRWNpZVUrbENxZm5kUTdxZWYvVVpKRG1xSGho?=
 =?utf-8?B?SXJmRHBhVVhyWW9CcXBQOGRUTlN5c3JJRW9NSllJZXYvSkR1SkI1aGdlQ2tK?=
 =?utf-8?B?QklFRlV3LzdzdHFFUEdmUXB0YlNDZjF4QWZDV1g4bnV2M0U2NUdkc0FCUUlY?=
 =?utf-8?B?UmJDS2E0QnRGQTFoSU1CaXg3ZXU0RDQzbDhYVTRrYXRjTzlXUjY0QytaRGdm?=
 =?utf-8?B?OG9KNEovMmtxWTdNTjVWVTFYT0k3a3lMYU8vTE1ua0FyTVhYOWxLUUhaUWw1?=
 =?utf-8?B?Zmg5TXRDd1M0WXNDRnl1WURlV1hnd09aYlF3STNTb3hIa0VMSGVFVXFldnNu?=
 =?utf-8?B?NUR3SlNhTDZSVXNOcklhQ3N1cnRJTW1obHVZcGg3M3NjUjBET0psc1VmTGhU?=
 =?utf-8?B?aU10QjdqZGZIeFlZWDM5TndEV3p5a0oxMEpWWlVybzlFYnVJcGZCRDlNYk5Z?=
 =?utf-8?B?UlBnbDFydTJWbHFJVWxHWVpFQVNobGZveDlETExRTmxpaVNJMWZRN0RyRER5?=
 =?utf-8?B?UFlCMWlQcGpkbmJHaXZsMkx3ZEtxcUlYK3FkQ3NRQ1BIYmw5Z2F0MFhUdVBt?=
 =?utf-8?B?cTBvbGZZUkloYTBiMW43bENKVzl3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C794F741E020674F8382D665FC032B62@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ec7ca1f-09a6-4e6c-8c5e-08d9c08c9400
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2021 12:07:05.9560
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sIoocRtnl3JnwGbme3zWDHRyHZWdhfcVEsbuL1dWcFyClu2bdXGxKj/NMo49igTnUlkZunNOoimokszXwJ16s8XAWN4N8SUU2tpUPGBBdAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1406
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

T24gMTYvMTIvMjAyMSAxMDoxMSwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0KPiBFWFRFUk5B
TCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlv
dSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4+ICtzdGF0aWMgc3RydWN0IG1wZnNfcGVyaXBo
X2h3X2Nsb2NrIG1wZnNfcGVyaXBoX2Nsa3NbXSA9IHsNCj4+ICsgICAgICAgQ0xLX1BFUklQSChD
TEtfRU5WTSwgImNsa19wZXJpcGhfZW52bSIsIFBBUkVOVF9DTEsoQUhCKSwgMCwgQ0xLX0lTX0NS
SVRJQ0FMKSwNCj4+ICsgICAgICAgQ0xLX1BFUklQSChDTEtfTUFDMCwgImNsa19wZXJpcGhfbWFj
MCIsIFBBUkVOVF9DTEsoQUhCKSwgMSwgMCksDQo+PiArICAgICAgIENMS19QRVJJUEgoQ0xLX01B
QzEsICJjbGtfcGVyaXBoX21hYzEiLCBQQVJFTlRfQ0xLKEFIQiksIDIsIDApLA0KPj4gKyAgICAg
ICBDTEtfUEVSSVBIKENMS19NTUMsICJjbGtfcGVyaXBoX21tYyIsIFBBUkVOVF9DTEsoQUhCKSwg
MywgMCksDQo+PiArICAgICAgIENMS19QRVJJUEgoQ0xLX1RJTUVSLCAiY2xrX3BlcmlwaF90aW1l
ciIsIFBBUkVOVF9DTEsoQUhCKSwgNCwgMCksDQo+PiArICAgICAgIENMS19QRVJJUEgoQ0xLX01N
VUFSVDAsICJjbGtfcGVyaXBoX21tdWFydDAiLCBQQVJFTlRfQ0xLKEFIQiksIDUsIENMS19JU19D
UklUSUNBTCksDQo+PiArICAgICAgIENMS19QRVJJUEgoQ0xLX01NVUFSVDEsICJjbGtfcGVyaXBo
X21tdWFydDEiLCBQQVJFTlRfQ0xLKEFIQiksIDYsIDApLA0KPj4gKyAgICAgICBDTEtfUEVSSVBI
KENMS19NTVVBUlQyLCAiY2xrX3BlcmlwaF9tbXVhcnQyIiwgUEFSRU5UX0NMSyhBSEIpLCA3LCAw
KSwNCj4+ICsgICAgICAgQ0xLX1BFUklQSChDTEtfTU1VQVJUMywgImNsa19wZXJpcGhfbW11YXJ0
MyIsIFBBUkVOVF9DTEsoQUhCKSwgOCwgMCksDQo+PiArICAgICAgIENMS19QRVJJUEgoQ0xLX01N
VUFSVDQsICJjbGtfcGVyaXBoX21tdWFydDQiLCBQQVJFTlRfQ0xLKEFIQiksIDksIDApLA0KPj4g
KyAgICAgICBDTEtfUEVSSVBIKENMS19TUEkwLCAiY2xrX3BlcmlwaF9zcGkwIiwgUEFSRU5UX0NM
SyhBSEIpLCAxMCwgMCksDQo+PiArICAgICAgIENMS19QRVJJUEgoQ0xLX1NQSTEsICJjbGtfcGVy
aXBoX3NwaTEiLCBQQVJFTlRfQ0xLKEFIQiksIDExLCAwKSwNCj4+ICsgICAgICAgQ0xLX1BFUklQ
SChDTEtfSTJDMCwgImNsa19wZXJpcGhfaTJjMCIsIFBBUkVOVF9DTEsoQUhCKSwgMTIsIDApLA0K
Pj4gKyAgICAgICBDTEtfUEVSSVBIKENMS19JMkMxLCAiY2xrX3BlcmlwaF9pMmMxIiwgUEFSRU5U
X0NMSyhBSEIpLCAxMywgMCksDQo+PiArICAgICAgIENMS19QRVJJUEgoQ0xLX0NBTjAsICJjbGtf
cGVyaXBoX2NhbjAiLCBQQVJFTlRfQ0xLKEFIQiksIDE0LCAwKSwNCj4+ICsgICAgICAgQ0xLX1BF
UklQSChDTEtfQ0FOMSwgImNsa19wZXJpcGhfY2FuMSIsIFBBUkVOVF9DTEsoQUhCKSwgMTUsIDAp
LA0KPj4gKyAgICAgICBDTEtfUEVSSVBIKENMS19VU0IsICJjbGtfcGVyaXBoX3VzYiIsIFBBUkVO
VF9DTEsoQUhCKSwgMTYsIDApLA0KPj4gKyAgICAgICBDTEtfUEVSSVBIKENMS19SVEMsICJjbGtf
cGVyaXBoX3J0YyIsIFBBUkVOVF9DTEsoQUhCKSwgMTgsIDApLA0KPj4gKyAgICAgICBDTEtfUEVS
SVBIKENMS19RU1BJLCAiY2xrX3BlcmlwaF9xc3BpIiwgUEFSRU5UX0NMSyhBSEIpLCAxOSwgMCks
DQo+PiArICAgICAgIENMS19QRVJJUEgoQ0xLX0dQSU8wLCAiY2xrX3BlcmlwaF9ncGlvMCIsIFBB
UkVOVF9DTEsoQUhCKSwgMjAsIDApLA0KPj4gKyAgICAgICBDTEtfUEVSSVBIKENMS19HUElPMSwg
ImNsa19wZXJpcGhfZ3BpbzEiLCBQQVJFTlRfQ0xLKEFIQiksIDIxLCAwKSwNCj4+ICsgICAgICAg
Q0xLX1BFUklQSChDTEtfR1BJTzIsICJjbGtfcGVyaXBoX2dwaW8yIiwgUEFSRU5UX0NMSyhBSEIp
LCAyMiwgMCksDQo+PiArICAgICAgIENMS19QRVJJUEgoQ0xLX0REUkMsICJjbGtfcGVyaXBoX2Rk
cmMiLCBQQVJFTlRfQ0xLKEFIQiksIDIzLCBDTEtfSVNfQ1JJVElDQUwpLA0KPj4gKyAgICAgICBD
TEtfUEVSSVBIKENMS19GSUMwLCAiY2xrX3BlcmlwaF9maWMwIiwgUEFSRU5UX0NMSyhBSEIpLCAy
NCwgQ0xLX0lTX0NSSVRJQ0FMKSwNCj4+ICsgICAgICAgQ0xLX1BFUklQSChDTEtfRklDMSwgImNs
a19wZXJpcGhfZmljMSIsIFBBUkVOVF9DTEsoQUhCKSwgMjUsIENMS19JU19DUklUSUNBTCksDQo+
PiArICAgICAgIENMS19QRVJJUEgoQ0xLX0ZJQzIsICJjbGtfcGVyaXBoX2ZpYzIiLCBQQVJFTlRf
Q0xLKEFIQiksIDI2LCBDTEtfSVNfQ1JJVElDQUwpLA0KPj4gKyAgICAgICBDTEtfUEVSSVBIKENM
S19GSUMzLCAiY2xrX3BlcmlwaF9maWMzIiwgUEFSRU5UX0NMSyhBSEIpLCAyNywgQ0xLX0lTX0NS
SVRJQ0FMKSwNCj4gDQo+IFdoeSB3ZXJlIHRoZSBmaWNOIGNsb2NrcyBjaGFuZ2VkIHRvIGNyaXRp
Y2FsIGNsb2Nrcz8NCj4gaXQgc2VlbWVkIHRvIHdvcmsgZmluZSB3aXRob3V0IHRoYXQgYmVmb3Jl
Pw0KQWNraW5nIHRoZSBvdGhlciBjb21tZW50cy4gVGhlIGZpYyBjbG9ja3MgYXJlIHRoZSBmcGdh
IGZhYnJpYyBjbG9ja3MgJiANCndlIGZvdW5kIHRoYXQgZGlzYWJsaW5nIHRoZW0gY291bGQgY2F1
c2UgYSBoYXJ0IHRvIGxvY2sgdXAuDQo+IA0KPj4gKyAgICAgICBDTEtfUEVSSVBIKENMS19BVEhF
TkEsICJjbGtfcGVyaXBoX2F0aGVuYSIsIFBBUkVOVF9DTEsoQUhCKSwgMjgsIDApLA0KPj4gKyAg
ICAgICBDTEtfUEVSSVBIKENMS19DRk0sICJjbGtfcGVyaXBoX2NmbSIsIFBBUkVOVF9DTEsoQUhC
KSwgMjksIDApLA0KPj4gK307DQo+PiArDQo+PiArc3RhdGljIHZvaWQgbXBmc19jbGtfdW5yZWdp
c3Rlcl9wZXJpcGgoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgY2xrX2h3ICpodykNCj4+ICt7
DQo+PiArICAgICAgIGRldm1fY2xrX2h3X3VucmVnaXN0ZXIoZGV2LCBodyk7DQo+IA0KPiBKdXN0
IGNhbGwgZGV2bV9jbGtfaHdfdW5yZWdpc3RlcigpIGRpcmVjdGx5IGZyb20gdGhlIGNhbGxlcj8N
Cj4gDQo+PiArfQ0KPiANCj4gVGhlIGFib3ZlIGFyZSBtaW5vciBjb21tZW50cywgc28NCj4gUmV2
aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+DQo+IFRl
c3RlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCmNvb2ws
IHRoYW5rcyA6KQ0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVy
ZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcNCj4g
DQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNh
bGwgbXlzZWxmIGEgaGFja2VyLiBCdXQNCj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0
cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0KPiANCg0K
