Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C795C433F5
	for <linux-clk@archiver.kernel.org>; Fri, 22 Apr 2022 06:26:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348260AbiDVG3N (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 22 Apr 2022 02:29:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377138AbiDVG3M (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 22 Apr 2022 02:29:12 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BC5E50B10
        for <linux-clk@vger.kernel.org>; Thu, 21 Apr 2022 23:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1650608780; x=1682144780;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Esh9f3CKp16dv8TEasYWPNEWPdi693e1FRg8izniT/o=;
  b=qM1Nh9aV+EA//II/XicBsXB5FzmPWBNMzqs3xpMbp0XZBE/13CasPCqm
   OOuCaeEvB01Eudn6B/9F1+2G/1KsSOEKgTX4kBOJCJ3Lt1+K1t9hCC6dP
   XSI+0v/Ov85qtU8Mvdbchxc104FqgIIWnKD/0aWv0b4YF+QsHUPEtzDD5
   7VyYmG7+zDjrgGzNcVHFdPEi2w8+Wbb0TsMs4TQN/Jlp372qteqpC3pHY
   IDkVBuHn20XrzLthdrC8jjLT1zIPyF/aLCfsMtxXOR49Wtr2pBE2Cl/pZ
   xSrZf0S35s5R3l9KxvM+Ljf+eCZ2F3AyFy8pnmwRVF+wgAazAJkjUw7YV
   A==;
X-IronPort-AV: E=Sophos;i="5.90,280,1643698800"; 
   d="scan'208";a="161360112"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Apr 2022 23:26:19 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 21 Apr 2022 23:26:19 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 21 Apr 2022 23:26:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mpu9PSHTIe9Am7hlIJmzZge2GLimrNnfSo9zmjFnbr8w4mkE4zzad1h4G+a6Dtc8DoQCLaTw/IAu9OhYybBWto89zO/sPL7MgesWEOr5eoHd1td4P5apF4mpiuqCpXB+EOjJ+DTzR2Yyt5Hioz6OyyNgm6h70bSEeTd8L3lmNbjvz0J5BsDZZUDB5LiUdyH9ZFmh67Imy4wZH9nILx4ERGkXE0FzRHrVc/WSuX5j6UkL3R8xKhtd98D69DKyTk1za5O42nROjdGo5r/2HNv9DAW54QSB23XnCFrKcJQTIBqWNb2p20jFqXU0w2BgdaNDJJI54t1i3LfkvSa+GARTcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Esh9f3CKp16dv8TEasYWPNEWPdi693e1FRg8izniT/o=;
 b=LsaYwsKPfAbsorUEcjr+4bOyeamZzaYh7IcOLSWdElStTmhp0Lx1VRM9v9ZNIkRbDUcUT5mbYggSYaY/6eyuglEI/5bDCy2EQgUK9hiBRnw+368qyqbT5QXEu5TqYl4/H0b4MJgmVQi8gTIi/W3OAkd/Tkl8p7/FTTPEscKPyY6K88KxrentzfXmJetaTWDLVzeMXv8ViQZ+DSrNrqX09RPDx3kNZxwl0rMmCaD3tTrEEf15MkMyEMBdTWTweOwYwAVBV0KSTlhgEv1oo8ghgQ1aJjaH3xxAiZIHzQVTX1K/9EbuQZUHSZOshMgdSzhNum84xhqY2aYiH1QLVGTvKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Esh9f3CKp16dv8TEasYWPNEWPdi693e1FRg8izniT/o=;
 b=mj8aEY/8iW9pHRbQbh9OifAhcoLpW/b/qyutlKt78va+P/GUTJAkn9HU1CThBh2rqh7BVsyQBwSa+frDF876lLw1bhsyZEuumKD1FjWG6aB3gfRWBFi96bh1q1gPoWxwR9GXoGqL9Wv1W60tZcvdlGmfTRFFk6DHIJy3Z544Cmw=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by DM4PR11MB5392.namprd11.prod.outlook.com (2603:10b6:5:397::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Fri, 22 Apr
 2022 06:26:17 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::fcd4:8f8a:f0e9:8b18]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::fcd4:8f8a:f0e9:8b18%7]) with mapi id 15.20.5186.014; Fri, 22 Apr 2022
 06:26:17 +0000
From:   <Conor.Dooley@microchip.com>
To:     <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <mturquette@baylibre.com>
CC:     <Daire.McNamara@microchip.com>, <linux-riscv@lists.infradead.org>,
        <palmer@rivosinc.com>, <andrew@lunn.ch>, <linux@armlinux.org.uk>
Subject: Re: [PATCH v2] clk: microchip: mpfs: don't reset disabled peripherals
Thread-Topic: [PATCH v2] clk: microchip: mpfs: don't reset disabled
 peripherals
Thread-Index: AQHYTXUqUwj85ug6GUGm/HR3eE1wGaz7SEEAgABAe4A=
Date:   Fri, 22 Apr 2022 06:26:17 +0000
Message-ID: <b22df610-f36f-5eed-d223-986cfd03e3ca@microchip.com>
References: <20220411072340.740981-1-conor.dooley@microchip.com>
 <20220422023512.C01EEC385A7@smtp.kernel.org>
In-Reply-To: <20220422023512.C01EEC385A7@smtp.kernel.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6e7d6bfe-27f9-4eb6-862b-08da24290210
x-ms-traffictypediagnostic: DM4PR11MB5392:EE_
x-microsoft-antispam-prvs: <DM4PR11MB5392F66D63404C48110EA87898F79@DM4PR11MB5392.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S2Dx9Daclu/Z5i2+9+eyR68fYnLXHnJrdd85/3JnbHE0giM/OWsGmxHhuem08qGad7cUOEwyL6yeQMxZQCFfu9pBSis9qut6Qfd8OUPQnoRcN0FsAD3Enwl7ohwKFp1R562zJivhUvwPmZy/QIHb7dq7oloMHO/c21RVTa1VR7xtL1awI/iVpuBglflAggbrgkuAr7Dor0L2wPWS44Ml6FDxzp23jLgIEf721KjCGzLUuw3QkY0xl+fVr3HLgt15GoaH08J2ezu5p4ixZunlXsargDO7w0cWrGXFBHJ1Y/ajbWRA8n+LPYGdLmcokABCTpSaslNpPTT8K1izEQ6M3stm/M7duwYZK/xTtUcRRQOIFzVdzyZ/tyPSZgc4pRZ2QpcuVknS0LHPn1n+ueYij1DiqCZTZHTW+Zymacjybrm7qcQENjIqThz4xmp+cxgp24eyaIoTtmxOug+9sqX4yy1zRWMe1g7bNLO0LqcfD7g9Y3T+tLzm324P/+Cem+MSxSoEH9nSx+EdnBC1ata4epXdAFq7dva9pIv1ADWVzyQlJmSlhTizUd1YrneSBTgBD+xi2YnP0vUl15gxQqr1kvHfDBfbRWUTbAD1oxq/RIj2Cns5vGpD+PshUQ3gnfMUW8vd1M2O+q1mXxlc1kYfidVYth6QE3lzQxwHNahAxf0ral/ZaBjqnePgUCjF3JKtRHUTQpBa26qAHTJzaCnOxP406aMPUcNVzdPktt5GrGMlH7PS2OvqIJlROhoQy/ZD0YY9sU1WoC8MiMqlJ1pYDcBlz4Zm1NJ0Y60zjSUmAy+4Q3+3gcZDq2+uH5v/2UdbLYWczZLZPZxXD85dtRORw4k+1dVLXYIRWVQz8EpaS1M=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38070700005)(26005)(6512007)(6506007)(71200400001)(53546011)(8676002)(8936002)(91956017)(316002)(4326008)(31686004)(122000001)(36756003)(66946007)(76116006)(38100700002)(64756008)(66476007)(66446008)(66556008)(110136005)(54906003)(4744005)(5660300002)(508600001)(2616005)(86362001)(31696002)(83380400001)(2906002)(186003)(6486002)(966005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U085L0F4S2IxdmpCNmVlaUlSVFlVOFBOaUxOUFJSSnpkODdpclhQMGdVT1VE?=
 =?utf-8?B?dm1tcmFOcHBlTWtNK3VvMlZuaUY5bGhOSFZ5ZHJTSTVYMVdjOWpaUnovWFZr?=
 =?utf-8?B?MkE0TUxFck5iaGxLUE9yc2tpOTU0MEN4NEtDQ3NrZXMyaUlUVy85QWlnQVJJ?=
 =?utf-8?B?bW0wdlFrclJ2TEJZUjEvNkhCT1BreTN4dFNRVWFCMnplT1l1NFZKTitKVFN1?=
 =?utf-8?B?a0VPaDFGL24yakpOc01ydlhwdHhLL3ZVcVpwOXlVTHFyeHFCK1lkZDFvQnZy?=
 =?utf-8?B?a3h0cDdwenh0WGQ0NTJTZFJLRm4xaGV5eW0wT1NDNy93WjlDeW1nSEVkQk5p?=
 =?utf-8?B?d2JucXFLcmdDZUVGTjJzUFBIM2dHcHhXZjNFeUh0aW1vRHA0VEJpQmJDNUpH?=
 =?utf-8?B?UG5idS94bE9UY2JDTThDYVU2WmdhT1ltUWR0N3o3KzQ4YlNMQVExVnJSZFRY?=
 =?utf-8?B?dUluTEFNWk54dTdqTlAvRnZEa1VXSHFKbTRncitNMFlWVmlWOFNqRjh2TUtl?=
 =?utf-8?B?aW5KUUdXRWJvME9hYjFId3lpUmhqY1MzOEdLcXJqQjZWeFcvekhJemJuZ1My?=
 =?utf-8?B?TVlXNi9OSmZMcDh1RUVURGt0aUxKVnBQbUMvam1UdFRUOTBxcmtGeEpEZ2hi?=
 =?utf-8?B?ZDlydU1HZkF4c3RkWTFvVW92QkZpakVVTHNCZVVmSVZBOVpTT05VYmo2ODFJ?=
 =?utf-8?B?ajBKYjVxUU1BWUptQmZTNEl1K2xhS1F4THp1bFBDNmdBVlpEOFBzYlVLeENO?=
 =?utf-8?B?emJuTFZZZ3VoT05wb1hONHNxQ2JUUlJwbU9ibE9nN2pRNURvNklyMDJSMjJV?=
 =?utf-8?B?UlpnZVNXdkUyUHgvVllzVEx3bEtaNlZ4R0hrUjYwSXNCN2VaUkRhWEJWYk1T?=
 =?utf-8?B?OURSMjNwY0RmckdPU3hzdGFrRkZ4TURiNkp5SGZiZkZ4TEVkbUVoVUJwY2Ez?=
 =?utf-8?B?b1FxWnpWUmdDNGtVSHJodnl0bG5FS2VIMDl5WG5WNEVHcW1zMVV1bEZoQzNX?=
 =?utf-8?B?YXJURjV3SS9qVFJNbVhGaG5Hd2Y2YlE2ZXNzdjFxdzVXQXRyZWljdFVPaldP?=
 =?utf-8?B?bVF2VmxaZFlLTFdob1FtMHUxa1Y4QXlJNDVrNzVXUXlNUGp0VkpoTmZadnRG?=
 =?utf-8?B?ODZEVE9vVmlXaDVpbURDTm5xZ3RBZUljYnlPKzVNdmxSbDJwdXlNVDFnYUFJ?=
 =?utf-8?B?UkxMZUtNZGZnNHJ3dGpRV1RFajRRMnZWSzFzUlBPZUJreTc3T05sTE01SlFM?=
 =?utf-8?B?K2Foc0JmUFN4OU1DWmUrcEFqVUkzM1F0VjNGMWZ1VGZJTzZwdE5wMndSdGpM?=
 =?utf-8?B?RWY4dkRIOGhRMEZxUXdkZkZ6bU9xTjNlZUNvRndCYzNtcHNiUUxTaHNPc0ll?=
 =?utf-8?B?aElpSmJ2NGdYQjJiOWVjRUxVSGtjRnlScHk1Q3JERGtocGVqdUZLendrQWJI?=
 =?utf-8?B?UjF1aXhGYmVzaG9WNUlMWG03cXZtbVVLNkdadUY4VnZaNmJIUVBRMGY3QTdF?=
 =?utf-8?B?QWJSbjc4TjNnRmRhT2JUWFFTMWdubHhSRXBPLzdpcTJMY0F4bHVDN3g4bGFm?=
 =?utf-8?B?ZG5xS0Q3N3Z0Qi9uY3FWNHNNOVErcDBGWWFLUkZPbnJFRnM2eWFrdGdlT2t3?=
 =?utf-8?B?WE5vZkFNSzlCUGx2WWxEUXRNQ29hVHdsTC9nQVdtcE5rcnhDWXRGVkt4OFpi?=
 =?utf-8?B?QTk0UzA2OWp3c25LN0YwRmpRczJVUmVBYWhmN0dmWUViSGQ5VjV2eXdWbVBO?=
 =?utf-8?B?LzJreVFyaXlpYzdMcytwbnN4VVdMd2RRQWsra1NRMDBZaG9PRGh2aWlMb0p5?=
 =?utf-8?B?MUIxUmlLSkl1RzhKM0dGUTNob0xmRHZnT2xnT1JYYXdTV3d0Q1poa01Wd1Js?=
 =?utf-8?B?dytZSHU3amFNS0RoaVduMEpSTFh6RWY3T3E2THorM1R5bTFCQTJ6aGRHUkJu?=
 =?utf-8?B?ZTcxVGtZZ0MweEZ2dnhLS0VsazZKK0pyUFBzR0c4WHoycS9SQm83bDNSc3Zs?=
 =?utf-8?B?N04rMW1mRTdLeXd2S09PeEVKaldQS1JjZGNlSm5QYm1QcUd1TlhrZFUyZFVU?=
 =?utf-8?B?WURzS0VBQm04Y1cxaGkyckxuMWlydWc0UGYrS1NtUDdSbVp3SGxqb1EvZzJl?=
 =?utf-8?B?TkliMy8yMlpKL3N4alZOYUc0Witwb0FMK2RSYVhSS1d2ZlVETVZZZk50TERn?=
 =?utf-8?B?bmFYaFhqN3IvMU1YWWhKT2g1MExCZWxudWdNeE5ibzlyWi9nRTR4S1c1KzV3?=
 =?utf-8?B?ZmpsSGErRE02cTVucTcwcnFDRngzTXlUbko1ZXdtRjJXYVVLeEVXNURWQWNz?=
 =?utf-8?B?Y0pmZ1EvZ3dUQUtsRWtVSHdoOGdlQnRNOEVXbUJBYndzOUtvbTdpd20xQlZ1?=
 =?utf-8?Q?M8/BzyW14hBi2v+s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <27E02CBDE66BE540AD217AB5A87923E7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e7d6bfe-27f9-4eb6-862b-08da24290210
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2022 06:26:17.2618
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lwt6v+WFSFhUs1Ku/Ef8CBlK9CgYYyDccX9dOIbyvNUAkBWWEV/aO79y0rEqeduNxTT0+G9AKTLXoVCVLEsn4T9YGWLz/WFz8el7POX2KIo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5392
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

T24gMjIvMDQvMjAyMiAwMjozNSwgU3RlcGhlbiBCb3lkIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IFF1b3RpbmcgQ29ub3IgRG9vbGV5ICgyMDIyLTA0
LTExIDAwOjIzOjQxKQ0KPj4gVGhlIGN1cnJlbnQgY2xvY2sgZHJpdmVyIGZvciBQb2xhckZpcmUg
U29DIHB1dHMgdGhlIGhhcmR3YXJlIGJlaGluZA0KPj4gInBlcmlwaCIgY2xvY2tzIGludG8gcmVz
ZXQgaWYgdGhlaXIgY2xvY2sgaXMgZGlzYWJsZWQuIENPTkZJR19QTSB3YXMNCj4+IHJlY2VudGx5
IGFkZGVkIHRvIHRoZSByaXNjdiBkZWZjb25maWcgYW5kIGV4cG9zZWQgaXNzdWVzIGNhdXNlZCBi
eSB0aGlzDQo+PiBiZWhhdmlvdXIsIHdoZXJlIHRoZSBDYWRlbmNlIEdFTSB3YXMgYmVpbmcgcHV0
IGludG8gcmVzZXQgYmV0d2VlbiBpdHMNCj4+IGJyaW5ndXAgJiB0aGUgUEhZIGJyaW5ndXA6DQo+
Pg0KPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvOWY0YjA1N2QtMTk4NS01
ZmQzLTY1YzAtZjk0NDE2MWM3NzkyQG1pY3JvY2hpcC5jb20vDQo+Pg0KPj4gRml4IHRoaXMgKGZv
ciBub3cpIGJ5IHJlbW92aW5nIHRoZSByZXNldCBmcm9tIG1wZnNfcGVyaXBoX2Nsa19kaXNhYmxl
Lg0KPj4NCj4+IEZpeGVzOiA2MzVlNWU3MzM3MGUgKCJjbGs6IG1pY3JvY2hpcDogQWRkIGRyaXZl
ciBmb3IgTWljcm9jaGlwIFBvbGFyRmlyZSBTb0MiKQ0KPj4gUmV2aWV3ZWQtYnk6IERhaXJlIE1j
TmFtYXJhIDxkYWlyZS5tY25hbWFyYUBtaWNyb2NoaXAuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTog
Q29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCj4+IC0tLQ0KPiANCj4g
QXBwbGllZCB0byBjbGstZml4ZXMNCg0KdGhhbmtzIQ0K
