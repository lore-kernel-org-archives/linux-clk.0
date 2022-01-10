Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FCA6C433EF
	for <linux-clk@archiver.kernel.org>; Mon, 10 Jan 2022 10:25:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243865AbiAJKYf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Jan 2022 05:24:35 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:44363 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239431AbiAJKYd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Jan 2022 05:24:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1641810274; x=1673346274;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=AK8dyP3u8QziJtNazKszONsAtiBa87oAdzkEe/kZhFo=;
  b=0nhP6GhtwrW7UrTcnvy6OizvhQ+RKmqQNAkGqd/qPxk4OXrCs2pw7PnY
   v7sexc4SMnkMP0+AzmVZqZR+gz47+whdE8UTQ6tpcWggSyhOVHtVkbubH
   qSbiUqcgAwQB4hECtwSBeT3Mx2OosKm8MnEjF2MH9F/HJoVRRPnCoXGGY
   3TKOKPnoDj07l/tR2wEk/nHxSpp4OxrGMRDkBcDCXQwbL8ES+Nblqh+JU
   ZiWpxMWn6pkFnksUchR8Y//h11O65EydYBn2NJTG9a19uzSz+fxNApiRF
   A++Hemz/PqA2r4dPrjMDLpwr8W606Zx6hh6o9yGKtkx4CsAUEJTSJbXkZ
   A==;
IronPort-SDR: 4y3z9EesZtKKvzU/bW4kbt6Ja8l9kQxJRS5kUVDzGT3to/o3AavGyMtIpww1L/DFVdEk9OIsw+
 lgEleh5MRP6mi+Ha0KkzzHoVpOpEqrOd8zi1r9ZDAUdLrL+5Gi6PxbC6dDq8BiC04vqX2DVFNA
 76AzqjeAfdtC7VGIAppCv43Wum5PD0HDydCVr5PHY1FzvdXRk9UBQH/3RMXJLYKTkw8JIC+yFy
 9xIwSrdqZaeUtDX5m6gAAwEXdS6vUMfARuDFsdNzu4ldWJdHAFUP+igBBUudLrPqxuzCJrGn1F
 XKLnboj3Oa2ZmUDYzpDxKZVT
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600"; 
   d="scan'208";a="149085857"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Jan 2022 03:24:33 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 10 Jan 2022 03:24:32 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 10 Jan 2022 03:24:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mmnSO1g3TgpopCa3Jrr1afwkVPFS5OJ+dj/RHTJC6woB7bCd1P89aDBbRaQUrfNlmR7KO43CZn9ydTS8SkvciPKpi5+3KrA6jY01xkzEos0156iEv3iPKCBi2MiYNxPtc6qocQeqGLrug83H9q5G+by9TGHksTf8bVGG6iJyM0Tnrt/bU+BuNMUxe/RBkF8TKmy2QhgzA4HRNHbHlzNKfYUetPmlU969Py/RuDhFXxms/JzYocszjeJhj1avL+F8SXZStE+TFtkE1+tnL/kXdA/14J6rEVHtM0htEfol0n8MA6NqKlVT0p27bD/eo13YvN/a41YP4Ubpn1d5L33EJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AK8dyP3u8QziJtNazKszONsAtiBa87oAdzkEe/kZhFo=;
 b=RxSyFJDY8orzLkSNl/eBLu4KKnOha9AUEl98NdGlwkUTzN0NpctfV1T6jIgSqLMwHwEdtwNr5faGXSYTLeuQuhSFk0QFB3gTRujoSy7Q2O6SMdI8AkQfvkYtQiloTrrIDOtVnHqFiGw4A2Fs4evEsQJI3ddAudUgowLYxFdW8nsgWDKu+CG+bxV0qASCFqUG5J/izH3TVf5dpTObuDPYpyRXU3ac87BG2XsIgxVc2CfOE3E2Wa/psbZRPDFqHBLQNGyfvC+fD2tSWGUOQrCM1x51qu2wj/AwUIq/tv1/CTgxGDudZtct73cc6K0XJYywQcUS71MAdcWd2//H5KKY7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AK8dyP3u8QziJtNazKszONsAtiBa87oAdzkEe/kZhFo=;
 b=QvD1xc5DqF6/U2+q7E4iYJ0HdNzPH9ZP2G3N0mDp1FizhL0NlCYJV15A0uN3DZphNpGEVzI0x9pph6A+THg61gD2KvSMjZtXcxG993NF/F2QNMRgr3ZqQJsqmJvxy3EWDaLibj/SmWUfgkMYT4/Jg6QpeBhm6jBfO5oC/yRCld0=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by CO1PR11MB5075.namprd11.prod.outlook.com (2603:10b6:303:9e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 10:24:27 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::6032:bbb2:b522:2ac3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::6032:bbb2:b522:2ac3%6]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 10:24:27 +0000
From:   <Conor.Dooley@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linux-clk@vger.kernel.org>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
CC:     <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
        <david.abdurachmanov@gmail.com>, <palmer@dabbelt.com>,
        <Daire.McNamara@microchip.com>, <Cyril.Jean@microchip.com>
Subject: Re: [PATCH v9 0/2] Add clkcfg driver for Microchip PolarFire SoC
Thread-Topic: [PATCH v9 0/2] Add clkcfg driver for Microchip PolarFire SoC
Thread-Index: AQHX8oUL0JiU4nLCTkCaurXB+XpCh6xcNCaA
Date:   Mon, 10 Jan 2022 10:24:27 +0000
Message-ID: <510ac826-e3a4-d813-4d93-e208a81f206b@microchip.com>
References: <20211216140022.16146-1-conor.dooley@microchip.com>
In-Reply-To: <20211216140022.16146-1-conor.dooley@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e073e51d-40c4-44cb-e498-08d9d4236166
x-ms-traffictypediagnostic: CO1PR11MB5075:EE_
x-microsoft-antispam-prvs: <CO1PR11MB50751B0E0DEEF32D6691654198509@CO1PR11MB5075.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sI8OqQl7CKW+xQiDsZAhjmk73DJ2NIwzYAJnDSHBzpN8YSyVsemDSOAfTe4Qsk2/7x062RLyK0uJolwJPzrWcf0OB9dG3hIyqN6of7mJU/NDxcGN1rRYpvMgWXP4kbJHPnMFt79TZE0hDPWzfnvhco87VreVGpCXxc2EWuVSGpQ8p/xNl+IXEB5F2Q7jqhR+ChlRJOklCVCI/TG/gGM2+7IroL4rYxLxNUw9PXo1x8YVfAHYJLyV/9OqGMEtQ47FryZJpGd7YKrWNoVTsBJT9gCBboEdDB7Enplbjt1p2rWtr71ni/pg+HUpTfcSmNWYEuXnwyubjPrKC1Ub7VH+JZsfieZW7UlFm6Hwl9lFDMFfmrpUi+5aaTVuySIgkitjeEtOwObY2Xuxmc/mw77Pd2O3njTd0Hjndkml5atVixMEiiTCqDnZ08KBzrFnQKPs9aB5RQLcbgBs48xTxEEEC2qTjE8Lu4hTycwmme401gdjjcKi0Crlc3UNBZ5HBr//csB1cC04Ls1kyP6WThrHZR8BO0natHLo+T6DGjYxjelEObrFAVznBjVAlKt9avFnhHFPopGADyRNDEhhboz51WWRpFyVriUhn/5PgV1Wv71HR3W3o9fKAJXUoKKQlLCtcS8x5InPoKBaENki95pj0v1e+2V/aWpYNnmMkbl3cQYwyHjFoeCkZjX+zwa+Mn0iMdI4rdPaqbVLNra9/aln3nQhGyI4vKzMvXtTy362J+83jAZVGX90roetl0UhDztvo4VulaxaB3GJrlXX1nUzLYoZQunuPgvP6WMxvMm1pP0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(110136005)(54906003)(508600001)(31686004)(26005)(6512007)(31696002)(4326008)(36756003)(8676002)(38070700005)(5660300002)(86362001)(83380400001)(2616005)(107886003)(66946007)(8936002)(186003)(316002)(76116006)(6486002)(91956017)(64756008)(66476007)(66446008)(53546011)(122000001)(66556008)(2906002)(38100700002)(6506007)(71200400001)(40753002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dDVTQWp3Rm84YWZtclZwYzdLeHZybjRBM0RtYjE5Z01Eam5EVzJGa0VQQ1B3?=
 =?utf-8?B?ciszSkxMSStEeHVlZ3FaU0Z3VEFXVHI3VDdWUytGSGlXMjNyUVRyRWNpQUpr?=
 =?utf-8?B?RmpsT2Fxc3JGSjFMK2VSTUMzLzZSYlpXcExYeTVyby9qTjJ6a2FBbW45UkRR?=
 =?utf-8?B?UXVWRWtlZjFzSFJiZlR1UmUyVVRuVklueWxTdSs2dEpaUHljdlpxU204TXp5?=
 =?utf-8?B?Ulk3WE5tdEEwWVZ0ZjVYU0tEQ1FuTDJ1dk5VVEdOeHRKOHpXa051VVJVeEVw?=
 =?utf-8?B?dVUyL05mOXgxYktJMnBhYkFKYTRrL3k2dXJLOVhYZW5rUkJ3MjBFTGY0ZG04?=
 =?utf-8?B?S20xMmVCRC96a3IwNXRQT0R1NHR5Z3Q2c2NyRUlZUnJHQlZ1TnY1bGdPV0lE?=
 =?utf-8?B?Y1UwaU8wUlhIVGpsMU9YbmpuRVNvNThTaFFNSnlPelR0NUsrZEUrcmY3SzUz?=
 =?utf-8?B?SzFvNXZyOUM4U3NwVStGOFlPbzQ1d1ZFUzN3OWxjUGNQcXdhdms3M1I0bk0r?=
 =?utf-8?B?RkNZUVNLMThBd2l4SHBtbEtMWVRqRTR4cmdUOHBoUjU4YU5TUW91cGxPdVpI?=
 =?utf-8?B?TmJ3Qk5ObmFyK1g3SFVYNTZCTDdnOVpWYlltZ3hJWHd3Mll0MzF6UHpqNkJS?=
 =?utf-8?B?SGptUzlsY0lMRFRjWVN2ZGlnZS9LdE45YUdEZFRHcXlWdE5LZ1cwZ0J1SGVK?=
 =?utf-8?B?SmJYL0dJU2lsM0ptY1VXUFByRlJSUmoxWmM5RzR2Zi91OS9pMFExMVlnTTMz?=
 =?utf-8?B?K0JVOVNoekZuR2RodFZ2L2NtVUZONXlSUnJ4S250TGVXcmE2a2tPTmI5dnYy?=
 =?utf-8?B?Wno3WlhiZEJmQkVGdGNtTE5FMENCbEVOdm5jWk53c3dJaTZGQzNLRGQyTkhS?=
 =?utf-8?B?THJOdGhkd04xR2d6V1d1THlyZzUxTmpuYWNkYytXbVVza2FZZGRlSDFCTGxX?=
 =?utf-8?B?VWhUQ3A0T2I0Qk92MzN5Sm90RlR5RlRKVnp3eG9Jb1gyUDB0K3FXV3d4L0dG?=
 =?utf-8?B?Tm1VaWtYNVJmT0ErUTZKSkxGaXdnNzdtUitxNGMyTThPdk96aTY4ZkN5cXBV?=
 =?utf-8?B?Mjh5RWNaN01WTDBmMnM5dWk3OXlEVy9raHJSbkFlTVBPT3FIRy9mb0JBeXEw?=
 =?utf-8?B?WEZBNzlVV3dObHZmZ1lwLy9FM2xlNWxSNDNTSDgrMVJHS2RVYmNxNlZhSUJm?=
 =?utf-8?B?ZnRhU0tweFpyMkNjWTNaRy9VaFR0SjBuY0NhVHVVcDBOSjFXbTJkWWV5M0cz?=
 =?utf-8?B?MTloUlFVWmRRdGhzdlNZRGlDQURRSDZxQ2htd2JodnN5aUhBWTV3cXhnbEor?=
 =?utf-8?B?ZkI3dmxhc1VFVlpvOC9uSUZ4UXowRHYwd0JUblgwTU9XS2tHalVKZjFkZU9O?=
 =?utf-8?B?alJFMElGYTRSNUhMaUFUTHR2bUEzTnBiOXlZYVRiVjJIdTdHTTdUT0RJaUkr?=
 =?utf-8?B?S1VJci9YMzdzYmtYNWFuNUlUYnhadzMwcWFwenVuN2RGaTlBSXUxOHR4T2pS?=
 =?utf-8?B?ejBvM2ZwTTBHSE5KTC9yV0RPbXlrZmh6cmczWVJSUm4wNk1hS3BFY001KzJX?=
 =?utf-8?B?dGx0bk1JZ2V6QktUR3JPR0N0aEJQVkNEc0Z1RjVqTVFvTytBNEJhMnlLV09p?=
 =?utf-8?B?TEtoYXArTVQ2V01BS29rSXhNbFZqU0ZOdWZNSG5jQ2hkL0FlZmhTNEtMai9N?=
 =?utf-8?B?eThDZ0cwcElESmxXd2ZIWWlFcEVBZEJMTVRXU0VrdzdWdE5tTVZFbUN4OVYx?=
 =?utf-8?B?RmhSdkRFRGxBUHhrdU9UUEM1RGV2THhIeW9LM1IwakNvT3BCTmxTb05nSm5x?=
 =?utf-8?B?M1A1UkRkaEw5SnRsSHNUREhxNWZnZGcwSWZBN1E2eU5zSUcySkJKTjFRZHRJ?=
 =?utf-8?B?cklpMzZVSjRPaWN6UDdZZjV3c083VFdWc2xlcTRad0Q1NFpUV1VmMldUMXNJ?=
 =?utf-8?B?cWZCMmtPbzVVamZyNFcwczN2MnJSQTl3TTZwNVV5MVZINGtXL1daWVJobzUv?=
 =?utf-8?B?Mzk3NkMrNGVvZWxNVTVTaEZmRytEMXlnZnA1Q2hTRFdPdE9GUjBMWURsRGNo?=
 =?utf-8?B?N0JWaVNWNS82aDNqYk9TMG9rQThHcGVyODZHNFF0Sml6N1o3NXN5RFpmU0R0?=
 =?utf-8?B?OVJFakY0S2R3T2dYeEoxWWxWbmw1NGVYWFliQVc2V0NzTHlqMlBTRWxac2l5?=
 =?utf-8?B?aEdLcWRJbU9xSkpzMlJ2bDR1Sy9FWUliOEVoWWlpbHJxUFk0bzhNZnV1NTI4?=
 =?utf-8?B?eHBQL2VkS21PRHZZTFFLbW1Ndy93PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FF6E1A58B8FD2F4687EFDD903C9D71F7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e073e51d-40c4-44cb-e498-08d9d4236166
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2022 10:24:27.1306
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GKWhLZrCoPEshoXgzCB8LPGLLAPmd/wQ7AepbIQZT0ZdQW3fOExvNuKn5VKBQl0QnpEixeZLsmaAo57qVaqM6zcbQE50W3jTHC6Ug/WBz/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5075
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SGkgU3RlcGhlbi9NaWNoYWVsLA0KSSd2ZSBpbXBsZW1lbnRlZCB0aGUgZmVlZGJhY2sgcmVjZWl2
ZWQgJiBoYXZlIFJCIHRhZ3MgZnJvbSBHZWVydCAmIFJvYi4NCkRvIHlvdSB0aGluayB0aGlzIGNv
dWxkIGJlIGluY2x1ZGVkIG9uIC1uZXh0Pw0KVGhhbmtzLA0KQ29ub3IuDQoNCk9uIDE2LzEyLzIw
MjEgMTQ6MDAsIGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tIHdyb3RlOg0KPiBGcm9tOiBDb25v
ciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPg0KPiANCj4gVGhpcyBwYXRjaHNl
dCBhZGRzIHN1cHBvcnQgZm9yIHRoZSBNaWNyb2NoaXAgUG9sYXJGaXJlIGNsa2NmZw0KPiBoYXJk
d2FyZSBibG9jay4NCj4gDQo+IENoYW5nZXMgc2luY2Ugdjg6DQo+ICogVXNlIGRldm1fY2xrX2h3
X3VucmVnaXN0ZXIgZGlyZWN0bHkNCj4gKiBHZXQgcGFyZW50IGNsayBpbiBwcm9iZSByYXRoZXIg
dGhhbiByZWdpc3RlciBmdW5jdGlvbg0KPiANCj4gQ2hhbmdlcyBzaW5jZSB2NzoNCj4gKiBEcm9w
cGVkIGNsb2NrLW91dHB1dC1uYW1lcyBhZ2FpbiAob29wcykNCj4gDQo+IENoYW5nZXMgc2luY2Ug
djY6DQo+ICogRHJvcHBlZCBjbG9jay1vdXRwdXQtbmFtZXMgKmFzIGEgcmVxdWlyZWQgcHJvcGVy
dHkqDQo+ICogRHJvcHBlZCBpZihsb2NrKSBjaGVjayBvbiBzcGlubG9ja3MsIGFkZGVkIHNwaW5s
b2NrcyB0byBhbGwNCj4gICAgcmVhZC1tb2RpZnktd3JpdGUgcmVnaXN0ZXIgYWNjZXNzDQo+ICog
UmVtb3ZlZCBrZnJlZSgpcyBvbiBub24tZHluYW1pY2FsbHkgYWxsb2NhdGVkIHZhcmlhYmxlcw0K
PiAqIFVzZSBkZXZtX2Nsa19nZXQgdG8gZ2V0IHRoZSByZWZlcmVuY2UgY2xvY2sNCj4gKiBBY2Nv
dW50IGZvciByZXNlcnZlZCBjbG9jayB3aGVuIGNhbGN1bGF0aW5nIHRoZSBzaXplIG9mIG51bV9j
bGtzDQo+IA0KPiBDaGFuZ2VzIHNpbmNlIHY1Og0KPiAqIERyb3BwZWQgY2xvY2stb3V0cHV0LW5h
bWVzIHByb3BlcnR5DQo+IA0KPiBNYWpvciBjaGFuZ2VzIHNpbmNlIHY0Og0KPiAqIEFkanVzdGVk
IGxpY2Vuc2UgZm9yIG1pY3JvY2hpcCxtcGZzLWNsb2NrLmggdG8gbWF0Y2ggbWljcm9jaGlwLG1w
ZnMueWFtbA0KPiAqIENvcnJlY3RlZCB0aGUgbnVtYmVyIG9mIGNsb2NrcyB0byAzMyBmcm9tIDMy
DQo+IA0KPiBNYWpvciBjaGFuZ2VzIHNpbmNlIHYzOg0KPiAqIFBhdGNoIHJlZm9ybWF0dGVkIHNv
IG1pY3JvY2hpcCxtcGZzLWNsb2NrLmggaXMgcGFydCBvZiBkZXZpY2UtdHJlZSBwYXRjaA0KPiAN
Cj4gTWFqb3IgY2hhbmdlcyBzaW5jZSB2MjoNCj4gKiBJbiBtcGZzX2NmZ19jbGtfc2V0X3JhdGUs
IHJldHVybiBpbW1lZGlhdGVseSBpZiBkaXZpZGVyX2dldF92YWwNCj4gICAgICByZXR1cm5zIDww
DQo+ICogcmViYXNlZCB0byB2NS4xMi1yYzENCj4gDQo+IE1ham9yIGNoYW5nZXMgc2luY2UgdjE6
DQo+ICAgKiBEZXBlbmRlbmN5IG9uIFNPQ19NSUNST0NISVBfUE9MQVJGSVJFDQo+ICAgKiBBbGwg
cmVmZXJlbmNlcyB0byBQRlNPQy9wZnNvYyBjaGFuZ2VkIHRvIE1QRlMvbXBmcw0KPiAgICogQ2xl
YW5lZCBlcnJvciBoYW5kbGluZyBpbiBfcHJvYmUNCj4gICAqIFJlLW9yZGVyZWQgY29kZSB0byBw
bGFjZSBzdHJ1Y3RzIGV0IGFsIGF0IHRvcA0KPiANCj4gRGFpcmUgTWNOYW1hcmEgKDIpOg0KPiAg
ICBkdC1iaW5kaW5nczogY2xrOiBtaWNyb2NoaXA6IEFkZCBNaWNyb2NoaXAgUG9sYXJGaXJlIGhv
c3QgYmluZGluZw0KPiAgICBjbGs6IG1pY3JvY2hpcDogQWRkIGRyaXZlciBmb3IgTWljcm9jaGlw
IFBvbGFyRmlyZSBTb0MNCj4gDQo+ICAgLi4uL2JpbmRpbmdzL2Nsb2NrL21pY3JvY2hpcCxtcGZz
LnlhbWwgICAgICAgIHwgIDU4ICsrKw0KPiAgIGRyaXZlcnMvY2xrL0tjb25maWcgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgMSArDQo+ICAgZHJpdmVycy9jbGsvTWFrZWZpbGUgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgICAyICstDQo+ICAgZHJpdmVycy9jbGsvbWljcm9jaGlwL0tj
b25maWcgICAgICAgICAgICAgICAgIHwgICA3ICsNCj4gICBkcml2ZXJzL2Nsay9taWNyb2NoaXAv
TWFrZWZpbGUgICAgICAgICAgICAgICAgfCAgIDYgKy0NCj4gICBkcml2ZXJzL2Nsay9taWNyb2No
aXAvY2xrLW1wZnMuYyAgICAgICAgICAgICAgfCA0MzkgKysrKysrKysrKysrKysrKysrDQo+ICAg
Li4uL2R0LWJpbmRpbmdzL2Nsb2NrL21pY3JvY2hpcCxtcGZzLWNsb2NrLmggIHwgIDQ1ICsrDQo+
ICAgNyBmaWxlcyBjaGFuZ2VkLCA1NTUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4g
ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Ns
b2NrL21pY3JvY2hpcCxtcGZzLnlhbWwNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9j
bGsvbWljcm9jaGlwL0tjb25maWcNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9jbGsv
bWljcm9jaGlwL2Nsay1tcGZzLmMNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9kdC1i
aW5kaW5ncy9jbG9jay9taWNyb2NoaXAsbXBmcy1jbG9jay5oDQo+IA0KDQo=
