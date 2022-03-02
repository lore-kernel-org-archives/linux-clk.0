Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2BEFC433F5
	for <linux-clk@archiver.kernel.org>; Wed,  2 Mar 2022 21:18:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244610AbiCBVTi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Mar 2022 16:19:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241687AbiCBVTf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Mar 2022 16:19:35 -0500
X-Greylist: delayed 1766 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 02 Mar 2022 13:18:47 PST
Received: from mx0b-00369f01.pphosted.com (mx0b-00369f01.pphosted.com [148.163.139.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3459F1E3ED
        for <linux-clk@vger.kernel.org>; Wed,  2 Mar 2022 13:18:47 -0800 (PST)
Received: from pps.filterd (m0167463.ppops.net [127.0.0.1])
        by mx0b-00369f01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222JJBn6027339;
        Wed, 2 Mar 2022 15:49:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mksinst.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to :
 content-transfer-encoding : mime-version : content-type; s=podFeb2021;
 bh=l9Kx22lcTGOvg6zZryVYm9Y9HRWYD2kE/FWPjoauDqU=;
 b=Cpho72UaKr1HALXT6Ok5h8YnUhfgDg/gflHqDnT+G4jtldxT9JyK0Ss3NYrJXf4i6tIV
 VTXnQ+7UL48gBb/NrrJ4MaQNlehDQP2AJkh4QiPGIBGIW56peJOARmrqSCxJtgBEwk4J
 CTvVLqBnCkC9Rl/H3UC+vavvza6Txl/gP2dzatGa2Czp1flmYx8UhXtfadDJ5/2DVQEa
 DYEFzyzZ3pgvKOuPkolf0NAx2DAG2KOISU/qgwupU0bnIdKJRtGIqtgB6i2/4r7FItdL
 aTiUzdZQ2NigN1WpJxd5NZw+mx97JtwfOqnmjELJzUF++FVTa2afr0jQlskVBk+mUBF1 fQ== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
        by mx0b-00369f01.pphosted.com with ESMTP id 3ej66w33bv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 02 Mar 2022 15:49:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jtfaG8Yz/ehiLu3kchXh14igRX8SEyf/dFNk2fRcLldi9JB9A75Q+PXeU7AgFlkp/SRXV7kMr17lbNpGhSFsvN6n5NY9bDrZp/Oh5vNDEbnChOi5KwQY6g/3ivtiwe30/OkUkppc7d8arqjTT1k5DkvS5j+rhigeSNEnZkSDBcbzogHPjqO+NjvGgILcr6PI8PrsY8awSn3k891WKCedEqnEowjuymcXzw6wfmh7sgANWzU6iXmXF31u7MUa6r1Xgr2KyK+gwmdZHykB4D8ZGvsT1sroobF5ypy9QeGFMAs9rISXOeZSmgkVBMoAnh2kNz8TUxod8rPkJV2yKWATWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X5x3WxN6CbM+hpKMm7klRa7LB8+47uW3p1YZs+HryAY=;
 b=BddPtaszttbweWtRY5ANvmyQ3kp7cheRJxBAk+trdZuEYQN2zop/Up6Q97K9dvfU+hof5WbL/0YYRRvPFAwZB9Ak/kbd1GhjIdp1YhDcNSWB0YMvJokm+I+1uC29WdE6EpLtLsZCDPrsmmqAT2dK0FkEtQ3xQ3mBJh0S5JdVy6NBP1HubhLJdFqBOBSpXgl/WC3Ax3gm17tfBdgBIaUC7+QlgPQdL9ZOSb3TVbjp7ESzJnHxiPO1geNPRThwLa+4TLT30tI8eQPpYoa6Bs1Ujpc1fsijaAGSUzNgr3hgWIXWkS05zMfSBUodz9bRNKKD5MvG/KUE8721XvF+abQFyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mksinst.com; dmarc=pass action=none header.from=mksinst.com;
 dkim=pass header.d=mksinst.com; arc=none
Received: from MN2PR03MB5008.namprd03.prod.outlook.com (2603:10b6:208:1ac::24)
 by BN6PR03MB2449.namprd03.prod.outlook.com (2603:10b6:404:15::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.23; Wed, 2 Mar
 2022 20:49:09 +0000
Received: from MN2PR03MB5008.namprd03.prod.outlook.com
 ([fe80::5d5c:2dd2:649d:6323]) by MN2PR03MB5008.namprd03.prod.outlook.com
 ([fe80::5d5c:2dd2:649d:6323%5]) with mapi id 15.20.5038.014; Wed, 2 Mar 2022
 20:49:09 +0000
From:   "Fillion, Claude" <Claude.Fillion@mksinst.com>
To:     Luca Ceresoli <luca@lucaceresoli.net>,
        Adam Ford <aford173@gmail.com>
CC:     Sean Anderson <sean.anderson@seco.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "Klein, Jesse" <Jesse.Klein@mksinst.com>
Subject: RE: [EXTERNAL] Re: Questions regarding regarding idt/renesas
 versaclock5 driver
Thread-Topic: [EXTERNAL] Re: Questions regarding regarding idt/renesas
 versaclock5 driver
Thread-Index: Adgsn5PPBaqTu/AxTlmRjOlUu8xbbwAHTV6AAAIztgAACrX3gAAgAxSwAAIUYgAAAPDp8AAHZO8AACleenAAAzsYAAADh08AAAYy0vA=
Date:   Wed, 2 Mar 2022 20:49:09 +0000
Message-ID: <MN2PR03MB500847D9F5BFF44F5E98ABA893039@MN2PR03MB5008.namprd03.prod.outlook.com>
References: <MN2PR03MB5008EB5F50B680C2A2E271D893019@MN2PR03MB5008.namprd03.prod.outlook.com>
 <9e4e542f-6f73-164e-581e-17369aada2f3@seco.com>
 <CAHCN7xKVMCC_Sgqp_Dgpwyi4X4rq4qKi2MheA_CK1vcrm3JjyA@mail.gmail.com>
 <b15f993b-d67b-b96a-904c-53025eda3aa3@lucaceresoli.net>
 <MN2PR03MB5008747FDF505CA30970ADE293029@MN2PR03MB5008.namprd03.prod.outlook.com>
 <CAHCN7x+kusPwHpkp+4zwvGN48oDUGfN2ueCn=8kt_54aiYwE9g@mail.gmail.com>
 <MN2PR03MB5008F4921D8484306505F8FB93029@MN2PR03MB5008.namprd03.prod.outlook.com>
 <CAHCN7xKbE9Rv3EsvFkS4Lk8nCwy1TK-xJQLk_h70PSVdeUHJcA@mail.gmail.com>
 <MN2PR03MB5008536F789B93337AF0BA6793039@MN2PR03MB5008.namprd03.prod.outlook.com>
 <CAHCN7xJFxtA=9GYkQ1dVig=sSRQY3yhjS9dO2GRtqn=zdc9w7g@mail.gmail.com>
 <fa9aa952-6560-7123-d095-32e88ecc5fb3@lucaceresoli.net>
In-Reply-To: <fa9aa952-6560-7123-d095-32e88ecc5fb3@lucaceresoli.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8b852f09-57b5-4df6-5c4a-08d9fc8e19c4
x-ms-traffictypediagnostic: BN6PR03MB2449:EE_
x-microsoft-antispam-prvs: <BN6PR03MB24496F88A7D889B7096D108493039@BN6PR03MB2449.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Lra6PHoJLTi6Op66zEGHOAfcB4Nk+/1drctcdBXDNLvXPgvDeHUPtJ+xHIxk3MjBMyI0fXr6Prs+Gq4UulN0JN7RhgYHMakoxoN+kONRFpuf31tKV1ukVsQ+OwXi4OIl+CbibNhCRgkxiatD30h9vuUZgdCXXatlz2hQ2UdTYanMwwBTLqc6+iXwr7Msi6jaexhfL+BIHRuMlcxrzzlOFX0MpnFNqoQbH8PIXk/d0TIvb0FnSUejYKkWX4AL/5SDySENmhVFr5lLpngQoWlc9+5YhAvz6Z0J80wgDaQsbkdFhYEq4JPVzOVq6D/zr6TWpOo6mltlHAkEqOCnIvK7DtG3iLKGQ9citmse79QiCqNk7NCDs9Mymo3AotKcLHKBS5xONhqV+Hg5B5d8vvUJWKGjT2aRVTIpGh93d7FWUj8Vqx+cVTuKKb1yrtoOa6Hv7v5cnyT3HDt2g6mcmSRQ7PBFSLg2XmrPMz4XTz6JuygMiQLjR++uBWm+IauHsQJFLnoTaIsJl/TAuCHTkLU91VxxGunTaIUc64p+MbKWztwcSRPadQEQ+QQUGagfrSoH+tnDgwDVClFYhkJV1au+gt3ko6Q2oTeYIog/Q8tVETRm7xalRzJIPjjrckwxKpStxLoiWM23EdVZHjwvI/V+0UrgK3FjOyXsz6zqyqIsqwCY7IVIB33SWRAhEvwAMyMOlrA91MunijWAIrCK9Z0MsXiPDnDowymhxkL+8mm9ULmVnsm0xMie1yScVjYA6C1ngBETEKdhhz9Njs4HH6BNHXTGVbFy6xfh1KKtxLH61iY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR03MB5008.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(966005)(66556008)(9686003)(26005)(2906002)(66946007)(4326008)(186003)(64756008)(33656002)(110136005)(38070700005)(54906003)(76116006)(6506007)(107886003)(122000001)(66476007)(38100700002)(53546011)(508600001)(316002)(66446008)(7696005)(8936002)(5660300002)(83380400001)(55016003)(71200400001)(86362001)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M05jU2g2VGh1em5UU1dlZFNJNGY4WHlKVy9VMTRGdzlHMFJiam4yUmhnTmpS?=
 =?utf-8?B?K20zTEd0dmsrb0dJQ3hBWHBsUEkyOUFTY1hPckFSdmxkb3QrRXhnU0JlY0Zj?=
 =?utf-8?B?WUVJZXFsT2h5UUk4cUhKdWNja3p3M1VtcTI5VFA4d0NtTiswTmpLRXdQdmtN?=
 =?utf-8?B?S0MrcDZKalEzNllvY01wVnZDU1hVTjBkeHFDNWpLMlU0ampQT3h3L3p2MzFP?=
 =?utf-8?B?d29WZk4zTGhBaGlzNmNQZEd3MVIzL2owa1FMRWtLejhBN3BoWWZYMFpoYVBW?=
 =?utf-8?B?UmVVbkcwVXZRWGZCdUQ4VlJyL0Z1U3ova21wMkhYQ0pvZTlNdnc5M3k0NE9Q?=
 =?utf-8?B?NjFPZW5naVJlNkxFMkJQMEI3MllGbkZaMzBEVkpVYUpjWXYrSFZNbFBxVjF3?=
 =?utf-8?B?T0JyM0xFcjR2MXBwNHJUcWZyN1FpZEJibXBtZ09RMGpmR1ZodGFiOXJBcEs1?=
 =?utf-8?B?YlM4RWJoN01ESFhUbGo2L3VuQ0gvWSt6dVorQ01vU2M1ekZHQytDSnJjbG9V?=
 =?utf-8?B?M1BEWWs0SkVBUUJyNFRzMmVsUzFsMDBNSExkbW83cE0yV01HSElseHN1RTdw?=
 =?utf-8?B?Uk42Q1NUeVVlc3BQYTUyR1BtNTNobG0xRGRFT292dTJMT09DcXZHT2ZyMUUx?=
 =?utf-8?B?S0dabUI3ek16MG9HTm5ISVhmRlVKSUlXaWY5b01UcG9hZ0VZbzJFUGZaTkVU?=
 =?utf-8?B?TW1wTnI5Y0R5NWh1L0pRaGRYSUQyWGFRM0RVbVhVQUh2N3k2cFBlU0pmSzVS?=
 =?utf-8?B?TTFoZFI2NGk5R01NK0hNS2JXVmViaGYyVjQwcHNZbVpEMS9TMjlRS3Yyc0JS?=
 =?utf-8?B?NzFpNjRkQjhvbGpidXl3NzhKZmUwQnhZQzdHbFQrUDM3S254LzFkZkJpNzNn?=
 =?utf-8?B?YzIvTFVoMmx4TVA5RWNnSk11a1puOEdmc2tIc0xEbFVzTkZoMnNCVWJDdjhD?=
 =?utf-8?B?bG94SzQ3dzhTaU13ZkY0cUNDeDhaNjdDdUI3UndhU1dQZ0ZxcXBrM1Rtd3VR?=
 =?utf-8?B?YTEyQ2tPM1BubnFsR1RpMURmbHdHV25PMXdwNEs3ZFEvdkZDUnYxWTRZSUhP?=
 =?utf-8?B?N1pxV2phcDFHZzJVdnhmcEhNaCtpUW56bUZmKytLMTF5Q1Q2RWM2SU81Qk91?=
 =?utf-8?B?MHJDZlBZdllmMGpIRFBWdGVCbk9pdHl4bnRNSUhUZWNJbWFYZnRoYVcyR2I5?=
 =?utf-8?B?SWt0elhQbDdoZ1VvcDc4aVVGRDVzU0tBVDQwWDdnRndKVHMxUlVrM2p1VkI2?=
 =?utf-8?B?dGM0TE5kdXpoMUF5Y1RPTHR0OFlIV1J6ZmhlQkhsYXF1U0tFRXB5NXZnMTM2?=
 =?utf-8?B?dTY5b1BxTUZtVjRYOWg5K0pJTHpoUkFPU2JZTWV5dFRwUzU4MVBpMFZvditR?=
 =?utf-8?B?Q2M3eFJCOGV1a0Vnc1NJTEhBVHgxd09xWFVCZWR1b3JHZmZ0MGxZWkpXSXc1?=
 =?utf-8?B?Y0ZSNG05UEVvQWtOTTVNRWR6SDZXU2hZZExERjJwTi9YZHNsaWJBZmNqTVF5?=
 =?utf-8?B?UkMwOGtXaExQZWJVd0lKOHdMWW4xeTBUcmRjcjVkUDVtMmRlYzJmVmx3NUQ2?=
 =?utf-8?B?bEpFRWhMdmlCd0NPQmFvaWNvbER6eG9oWURQTUZUaExPYzFIVFlwcEZsVEc4?=
 =?utf-8?B?dTR5KzZHbmx2dldkL0ZTWUppa3hPTXhsVVVqSGlxaWpHZi9tUm1wWjVncG8w?=
 =?utf-8?B?emExTlVsanJkVDMzVFN1VVlUUXdkdmRmUGV5RFJKaWJuK1o4SlNkKzhlWjFP?=
 =?utf-8?B?S1ljNUJCZEh6Q2VNZHlRVWFqRlYzWGRyQkZJTkQyVUhpNHRMMUhiVnhEOE1i?=
 =?utf-8?B?OXdCZEFVTXBnZUJyekhkQnJvU3d1WEtwbFRQVzUrNlo4eE9aS0lpcW1TR3dP?=
 =?utf-8?B?aEpDTnFDRk9UUElYQ1M4K2l5SnZZSEQ1bFhHVjZSWHNYK2tDTlpGQmxJYXE2?=
 =?utf-8?B?YnRpMmZobmRTQXE4YzE0VCtOQlk0ZWdsOENNdzlxU29UOHRrYmVOa0NKTUkv?=
 =?utf-8?B?RGlDc0pidk15NmthZi8velh1aW1EdmliRTQ4MXRNeUpwRGpmemNBSnNOSWh0?=
 =?utf-8?B?TFdDRXJXSUFIUGFlbllNZGpPK1NTSk9sTW9UZjgzdkg1OG1qd1J4TGpNWkFp?=
 =?utf-8?B?TXp4TWhkYkwzQ2hGaHNoWWlJTnV4UkNta20rTkJzNURRQWVSVE1yS0QvWlZq?=
 =?utf-8?B?NUZ3ZVBzQ3lTNTU1cFF5Mlh2Uk1QTzZrd0ZKUHdkWXRTMzR6Q1lEcGRXdnR1?=
 =?utf-8?B?dFhac3MyZUx5VFI3dGw0bEJWQ3B3PT0=?=
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mksinst.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR03MB5008.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b852f09-57b5-4df6-5c4a-08d9fc8e19c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2022 20:49:09.7021
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34fc6b5f-c773-4cad-ae20-f226c36b7e65
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QaRoPU7jr9qee1PQVfJSxWU9hE3HlSZnicABBeWkt6YZndWpRZhVJlIVuuz8nX8qNtiFK63bNFqR9jfC9iCCh4eB9yNcbbeK6wrnBymIZ8c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2449
X-Proofpoint-ORIG-GUID: XYg_0BFbKQAEmcElMh962yNjgFvsplWW
X-Proofpoint-GUID: XYg_0BFbKQAEmcElMh962yNjgFvsplWW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_12,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020086
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTHVjYSBDZXJlc29saSA8
bHVjYUBsdWNhY2VyZXNvbGkubmV0Pg0KPiBTZW50OiBXZWRuZXNkYXksIE1hcmNoIDIsIDIwMjIg
MTI6MjcgUE0NCj4gVG86IEFkYW0gRm9yZCA8YWZvcmQxNzNAZ21haWwuY29tPjsgRmlsbGlvbiwg
Q2xhdWRlDQo+IDxDbGF1ZGUuRmlsbGlvbkBta3NpbnN0LmNvbT4NCj4gQ2M6IFNlYW4gQW5kZXJz
b24gPHNlYW4uYW5kZXJzb25Ac2Vjby5jb20+OyBsaW51eC1jbGsgPGxpbnV4LQ0KPiBjbGtAdmdl
ci5rZXJuZWwub3JnPg0KPiBTdWJqZWN0OiBSZTogW0VYVEVSTkFMXSBSZTogUXVlc3Rpb25zIHJl
Z2FyZGluZyByZWdhcmRpbmcgaWR0L3JlbmVzYXMNCj4gdmVyc2FjbG9jazUgZHJpdmVyDQo+IA0K
PiBIaSwNCj4gDQo+IE9uIDAyLzAzLzIyIDE2OjQ1LCBBZGFtIEZvcmQgd3JvdGU6DQo+IC4uLg0K
PiA+Pj4+Pj4gICAgIHZlcnNhY2xvY2s2OiBjbG9jay1jb250cm9sbGVyQDZhIHsNCj4gPj4+Pj4+
DQo+ID4+Pj4+PiAgICAgICAgIC8qIENsb2NrIENvbnN1bWVyICovDQo+ID4+Pj4+Pg0KPiA+Pj4+
Pj4gICAgICAgICBjb21wYXRpYmxlID0gImlkdCw1cDQ5djY5NjUiOw0KPiA+Pj4+Pj4NCj4gPj4+
Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4NmE+Ow0KPiA+Pj4+
Pj4NCj4gPj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgI2Nsb2NrLWNlbGxz
ID0gPDE+Ow0KPiA+Pj4+Pj4NCj4gPj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgY2xvY2tzID0gPCZ4MzA0X2Nsaz47DQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBjbG9jay1uYW1lcyA9ICJ4aW4iOw0KPiA+Pj4+Pj4NCj4gPj4+
Pj4+DQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gICAgICAgICBhc3NpZ25lZF9jbG9ja3MgPSA8JnZlcnNh
Y2xvY2s2IDE+LA0KPiA+Pj4+Pj4NCj4gPj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
PCZ2ZXJzYWNsb2NrNiAyPiwNCj4gPj4+Pj4+DQo+ID4+Pj4+PiAgICAgICAgICAgICAgICAgICAg
ICAgICAgIDwmdmVyc2FjbG9jazYgMz4sDQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICA8JnZlcnNhY2xvY2s2IDQ+Ow0KPiA+Pj4+Pj4NCj4gPj4+Pj4+ICAgICAg
ICAgYXNzaWduZWRfY2xvY2tfcmF0ZXMgPSA8NDY4MDAwMDA+LCA8MjUwMDAwMDAwPiwNCj4gPj4+
Pj4+IDwxMDAwMDAwPiwgPDEzMDAwMDAwPjsNCj4gPj4+Pj4NCj4gPj4+Pj4NCj4gPj4+Pj4gQXNz
aWduZWQgY2xvY2tzIGFuZCBhc3NpZ25lZCBjbG9jayByYXRlcyBzaG91bGQgYmUgaHlwaGVucyBh
bmQgbm90DQo+ID4+Pj4+IHVuZGVyc2NvcmVzLg0KPiA+Pj4+Pg0KPiA+Pj4+PiBhc3NpZ25lZC1j
bG9ja3MgPSAgPCZ2ZXJzYWNsb2NrNiAxPiwgICA8JnZlcnNhY2xvY2s2IDI+LA0KPiA+Pj4+PiA8
JnZlcnNhY2xvY2s2IDM+LCA8JnZlcnNhY2xvY2s2IDQ+Ow0KPiA+Pj4+Pg0KPiA+Pj4+PiBhc3Np
Z25lZC1jbG9jay1yYXRlcyA9ICA8NDY4MDAwMDA+LCA8MjUwMDAwMDAwPiwgPDEwMDAwMDA+LA0K
PiA+Pj4+PiA8MTMwMDAwMDA+Ow0KPiA+Pj4+Pg0KPiA+Pj4+PiBBbm90aGVyIHRoaW5nIHRvIGNo
ZWNrIGlzIHRvIG1ha2Ugc3VyZSB0aGUgY29uc3VtZXJzIG9mIHRoZXNlDQo+ID4+Pj4+IGNsb2Nr
cyBpcyBlbmFibGluZyB0aGVtLiAgVGhleSBkbyBub3QgbmVjZXNzYXJpbHkgZ2V0IGVuYWJsZWQg
YnkNCj4gZGVmYXVsdC4NCj4gPj4+Pj4NCj4gPj4+Pj4gYWRhbQ0KPiA+Pj4+DQo+ID4+Pj4gRG9o
IC0gdGhhbmtzLiAgSSBsb29rZWQgYXQgaXQgYSBtaWxsaW9uIHRpbWVzIPCfmIogLg0KPiA+Pj4+
DQo+ID4+Pj4gTm93IGdldHRpbmcgZGVzaXJlZCBvdXQxIGZyZXF1ZW5jeSBidXQgbm90aGluZyBv
biBvdGhlciBvdXRwdXRzLg0KPiA+Pj4+IEZyb20NCj4gPj4+IHRoZSBjb2RlIGl0IHNlZW1zIHZj
NV9jbGtfb3V0X3ByZXBhcmUoKSBpcyB0aGUgbWV0aG9kIHRoYXQgZW5hYmxlcw0KPiA+Pj4gb3V0
cHV0cyBidXQgdGhpcyBtZXRob2QgaXMgbm90IGJlaW5nIGNhbGxlZCBJIGFtIG5vdCBjbGVhciBo
b3cgdG8NCj4gPj4+IG1ha2UgdGhlICdjb25zdW1lciBlbmFibGUgdGhlbS4nDQo+ID4+Pj4NCj4g
Pj4+PiBJIGhhdmUgYWRkZWQgdGhpcyB0byBteSBkdHNpIHRvIG5vIGF2YWlsLg0KPiA+Pj4+DQo+
ID4+Pj4gICAgICAgICAgLyogQ29uc3VtZXIgcmVmZXJlbmNpbmcgNVA0OVY1OTY1IHBpbiBPVVQx
IGFuZCBPVVQyICovDQo+ID4+Pj4gICAgICAgICBjb25zdW1lciB7DQo+ID4+Pj4gICAgICAgICAg
ICAgY2xvY2tzID0gPCZ2ZXJzYWNsb2NrNiAxPiwgPCZ2ZXJzYWNsb2NrNiAyPjsNCj4gPj4+PiAg
ICAgICAgICAgICAvKiAuLi4gKi8NCj4gPj4+PiAgICAgICAgICB9Ow0KPiA+Pj4+DQo+ID4+Pj4g
TG9va2luZyB0aHJvdWdoIGRldmljZSB0cmVlIGRvY3VtZW50YXRpb24uDQo+ID4+Pg0KPiA+Pj4g
SXQncyBsaWtlbHkgZ29pbmcgdG8gYmUgaW4gdGhlIGNvbnN1bWVyJ3MgZHJpdmVyLiAgQ2hlY2sg
dGhlDQo+ID4+PiBjb25zdW1lciBkZXZpY2UgdHJlZSBiaW5kaW5nIHRvIG1ha2Ugc3VyZSB5b3Un
dmUgY29ycmVjdGx5DQo+ID4+PiBhc3NvY2lhdGVkIHRoZSBjbG9jay4gIElmIHRoZSBiaW5kaW5n
IGRvZXNudCd0IHNob3cgYSBjbG9jayBpcw0KPiA+Pj4gcmVxdWlyZWQsIGl0IG1pZ2h0IG5vdCBr
bm93IHRoYXQgeW91IHVzaW5nIGEgcHJvZ3JhbW1hYmxlIGNsb2NrLg0KPiA+Pj4NCj4gPj4+IEhl
cmUgaXMgYSBwYXRjaCB0aGF0IEkgbmVlZGVkIHRvIGFwcGx5IHRvIGFuIEV0aGVybmV0IGRyaXZl
ciB3aGljaA0KPiA+Pj4gd2Fzbid0IGV4cGVjdGluZyBhIHByb2dyYW1tYWJsZSBjbG9jayB0byBk
cml2ZSBhIHJlZmVyZW5jZSBjbG9jaywgc28NCj4gPj4+IHRoZSBjbG9jayB3YXNuJ3QgYmVpbmcg
ZW5hYmxlZC4NCj4gPj4+DQo+ID4+PiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcg0KPiA+Pj4gbmVsL2cNCj4gPj4+IGl0
L3RvcnZhbGRzL2xpbnV4LmdpdC9jb21taXQvZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVuZXNhcy9y
YXZiX21haW4uDQo+ID4+PiBjP2lkPQ0KPiA+Pj4gOGVmN2FkYzZiZWIyZWYwYmNlODM1MTNkYzll
NDUwNWU3YjIxZThjMl9fOyEhS25KNC1ycDchMVFiMTdxLQ0KPiA+Pj4NCj4gVFdyVjYyQWVRdFRO
TlZERXJWYnloYlhCMXN1a3lUMmdndkZQVWx0SUJJNW5JS3pObmpWT2NxbHc4cUp5eSQNCj4gPj4+
DQo+ID4+PiBMb29rIGF0IHRoZSB1c2Ugb2YgZGV2bV9jbGtfZ2V0X29wdGlvbmFsIGFuZCBjbGtf
cHJlcGFyZV9lbmFibGUgZnJvbQ0KPiA+Pj4gdGhhdCBwYXRjaC4gICh5ZXMsIHRoZXJlIGlzIGEg
c3Vic2VxdWVudCBwYXRjaCB0aGF0IGZpeGVzIHNvbWV0aGluZw0KPiA+Pj4gSSBkaWRuJ3QgcXVp
dGUgZG8gcmlnaHQsIGJ1dCB0aGUgYmFzaWNzIGFyZSBoZXJlKQ0KPiA+Pj4NCj4gPj4+IFRoZSBj
b25zdW1lciBkcml2ZXJzIG5lZWQgdG8gJ2dldCcgdGhlIGNsb2NrIHNvIGl0IGNhbiBhc3NvY2lh
dGUNCj4gPj4+IGl0c2VsZiB0byB0aGUgY2xvY2sgaW4gcXVlc3Rpb24uICBPbmNlIHRoZSByZWxh
dGlvbnNoaXAgaXMNCj4gPj4+IGVzdGFibGlzaGVkLCB0aGUgY29uc3VtZXIgbmVlZHMgdG8gY2Fs
bCBjbGtfcHJlcGFyZV9lbmFibGUoKSB3aGljaA0KPiB1c2VzIHRoZSBjbG9jayBzeXN0ZW0gdG8g
dHVybiB0aGUgY2xvY2sgb24uDQo+ID4+PiBXaXRob3V0IHRoaXMgc3RlcCwgaXQncyBsaWtlbHkg
dGhlIFZlcnNhY2xvY2sgd29uJ3QgZ2VuZXJhdGUgYQ0KPiA+Pj4gc2lnbmFsLCBiZWNhdXNlIGl0
IGRvZXNuJ3Qga25vdyBpdCBuZWVkcyB0byB0dXJuIGl0IG9uLg0KPiA+Pj4NCj4gPj4+IGFkYW0N
Cj4gPj4NCj4gPj4gTm90IHN1cmUgSSBmdWxseSBmb2xsb3cuICBJIHNlZSB0aGF0IGNsayBvdXQx
IGlzIGVuYWJsZWQgYnV0IHRoZSBvdGhlcg0KPiBjaGFubmVscyBhcmUgbm90IHNvIGl0IHdvdWxk
IHNlZW0gbXkgZGlmZmljdWx0eSBpcyB3aXRoIGluZGl2aWR1YWwgY2hhbm5lbHMuDQo+ID4NCj4g
PiBEbyB0aGUgZGV2aWNlcyB0aGF0IG5lZWQgdGhlIGNsb2NrIGZyb20gdGhlIHZlcnNhY2xvY2sg
cmVmZXJlbmNlIHRoZQ0KPiA+IHZlcnNhY2xvY2s/ICBJZiBzbywgdG8gdGhvc2UgZHJpdmVycyB1
c2UgdGhlIGdldCBhbmQgZW5hYmxlPyAgSWYgbm90LA0KPiA+IHRoZSB2ZXJzYWNsb2NrIHdpbGwg
c3RheSBvZmYuICBJbiB0aGUgcGF0Y2ggZXhhbXBsZSBJIHNob3dlZCwgSSBoYWQgdG8NCj4gPiBt
b2RpZnkgdGhlIEV0aGVybmV0IGRyaXZlciBvbiBhIHByb2Nlc3NvciwgYmVjYXVzZSBpdCBkaWRu
J3QNCj4gPiBleHBsaWNpdGx5IGVuYWJsZSB0aGUgcmVmZXJlbmNlIGNsb2NrLiAgVGhhdCBFdGhl
cm5ldCBkcml2ZXIgZXhwZWN0ZWQNCj4gPiB0aGUgcmVmY2xrIHdhcyBhbHdheXMgcHJlc2VudCB3
aGljaCB3YXMgYSBmYWxzZSBhc3N1bXB0aW9uLiAgT25jZSBJDQo+ID4gZ290IHRoZSBjb25zdW1l
ciBkZXZpY2UgKGluIHRoaXMgY2FzZSwgRXRoZXJuZXQpIHRvIHJlcXVlc3QgYW5kIGVuYWJsZQ0K
PiA+IHRoZSBjbG9jaywgdGhlIGNsb2NrIHN1YnN5c3RlbSBlbmFibGVkIHRoZSBjb3JyZXNwb25k
aW5nIG91dHB1dCBvbiB0aGUNCj4gPiB2ZXJzYWNsb2NrLg0KPiA+DQo+ID4gRm9yIHRoZSBFdGhl
cm5ldCBleGFtcGxlIEkgY2l0ZWQgYWJvdmUsIHRoZSBjb3JyZXNwb25kaW5nIGRldmljZSB0cmVl
DQo+ID4gbG9va3MgbGlrZToNCj4gPg0KPiA+ICZhdmIgew0KPiA+ICAgICAgY2xvY2tzID0gPCZj
cGcgQ1BHX01PRCA4MTI+LCA8JnZlcnNhY2xvY2s1IDQ+Ow0KPiA+ICAgICAgY2xvY2stbmFtZXMg
PSAiZmNrIiwgInJlZmNsayI7DQo+ID4gICAgICBzdGF0dXMgPSAib2theSI7DQo+ID4gfTsNCj4g
Pg0KPiA+IFdpdGggdGhpcyBkZXZpY2UgdHJlZSByZWZlcmVuY2UsIHRoZSAncmVmY2xrJyBnZXRz
IGFzc29jaWF0ZWQgdG8NCj4gPiB2ZXJzYWNsb2NrIG91cHV0IDQuICBXaGVuIHRoZSBFdGhlcm5l
dCBuZWVkcyB0aGUgY2xvY2ssIGl0IGNhbGxzDQo+ID4gY2xrX3ByZXBhcmVfZW5hYmxlIG9uIHRo
YXQgY2xvY2sgcmVmZXJlbmNlLCBhbmQgdGhlIGNsb2NrIHN5c3RlbSBjYWxscw0KPiA+IG9uIHRo
ZSB2ZXJzYWNsb2NrIGRyaXZlciB0byBlbmFibGUgdGhlIG91dHB1dC4gIFRoZSByZWFzb24gSSBu
ZWVkZWQgdG8NCj4gPiBzdWJtaXQgdGhhdCBwYXRjaCB3YXMgdGhhdCB0aGUgY29uc3VtZXIgZHJp
dmVyICh0aGUgRXRoZXJuZXQgaW4gdGhpcw0KPiA+IGNhc2UpIHdhc24ndCBjYWxsaW5nIHRoZSBj
bGtfcHJlcGFyZV9lbmFibGUsIHNvIHRoZSBjbG9jayByZW1haW5lZA0KPiA+IG9mZi4gIEl0J3Mg
bGlrZWx5IHRoYXQgd2hhdGV2ZXIgZGV2aWNlcyB0aGF0IG5lZWQgdGhlIGNsb2NrIGZyb20gdGhl
DQo+ID4gdmVyc2FjbG9jayB3aWxsIG5lZWQgYm90aCBhIGRldmljZSB0cmVlIHJlZmVyZW5jZSB0
byBpdCBhcyB3ZWxsIGFzIGENCj4gPiBjYWxsIHRvIGNsa19wcmVwYXJlX2VuYWJsZS4NCj4gPg0K
PiA+Pg0KPiA+PiBJbiBteSBzaW1wbGUgYXBwbGljYXRpb24gSSB3b3VsZCBsaWtlIHRvIGVuYWJs
ZSBvdXRwdXRzLCBvbiBhIHBlciBjaGFubmVsDQo+IGJhc2lzLCBmcm9tIHRoZSBkZXZpY2UgdHJl
ZS4gIFdvdWxkIGl0IG1ha2Ugc2Vuc2UgIHRvIGFkZCAgYW4gJ2lkdCxlbmFibGUnDQo+IHByb3Bl
cnR5IGluIHNpbWlsYXIgZmFzaGlvbiB0byB0aGUgZXhpc3RpbmcgaWR0LG1vZGUsIGlkdCx2b2x0
YWdlLW1pY3Jvdm9sdCwNCj4gYW5kIGlkdCxzbGV3LXBlcmNlbnQgcHJvcGVydGllcz8gIFRoZW4g
dmM1X2dldF9vdXRwdXRfY29uZmlnKCkgY291bGQgYmUNCj4gbW9kaWZpZWQgdG8gYWxzbyBjYWxs
IHZjNV9jbGtfb3V0X3ByZXBhcmUoKSAob3IgY2xrX3ByZXBhcmVfZW5hYmxlKCksIHdoaWNoDQo+
IGluIHR1cm4gd291bGQgY2FsbCB2YzVfY2xrX291dF9wcmVwYXJlKCkpLg0KPiA+DQo+ID4gSSBj
YW4ndCBzcGVhayBmb3IgdGhlIGxpbnV4IGNsb2NrIGdyb3VwLCBidXQgdGhlIGFkdmFudGFnZSBv
ZiBwYXRjaGluZw0KPiA+IHRoZSBkcml2ZXJzIHRoYXQgbmVlZCB0aGUgY2xvY2tzIGdlbmVyYXRl
ZCBmcm9tIHRoZSB2ZXJzYWNsb2NrIGlzIHRoZQ0KPiA+IGFiaWxpdHkgdG8gc3RvcCB0aGVzZSBj
bG9ja3Mgd2hlbiB0aGUgZHJpdmVycyBhcmUgaGFsdGVkIGFuZC9vcg0KPiA+IHN1c3BlbmRlZC4N
Cj4gDQo+IEhhdmluZyB0aGUgY29uc3VtZXIgZHJpdmVyIGdldCwgcHJlcGFyZSBhbmQgZW5hYmxl
IHRoZSBjbG9jayBpcyBvZiBjb3Vyc2UNCj4gdGhlIGJlc3QgYXMgQWRhbSBleHBsYWluZWQuDQo+
IA0KPiBIb3dldmVyIEkgdGhpbmsgdXNpbmcgYXNzaWduZWQtY2xvY2tzIGFuZCBhc3NpZ25lZC1j
bG9jay1yYXRlcyBzaG91bGQNCj4gZW5hYmxlIHRoZSBjbG9ja3MgdW5jb25kaXRpb25hbGx5IGV2
ZW4gaWYgdGhlIGNvbnN1bWVyIGRyaXZlciBkb2VzIG5vdCBkbw0KPiBhbnkgY2xrXyooKSBjYWxs
cy4gTWlnaHQgYmUgd29ydGggZG91YmxlIGNoZWNraW5nIHRoYXQuDQo+IA0KPiAtLQ0KPiBMdWNh
DQoNCkluIG91ciBhcHBsaWNhdGlvbiB3ZSBwbGFuIHRvIHVzZSB0aGUgNjk2NS82OTAxIHRvIHJl
cGxhY2UgYSBwYXJ0IHRoYXQgZG9lcyBub3QgdXNlIGEgY29uc3VtZXIgZHJpdmVyLiAgV2UganVz
dCBzZXQgY2xvY2sgb3B0aW9ucyBpbiBvdXIgZGV2aWNlIHRyZWUuICBJZGVhbGx5IHRoYXQgaXMg
aG93IHdlIHdvdWxkIGxpa2UgdG8gdXNlIHRoZSBSZW5lc2FzIHBhcnQgYXMgd2VsbC4gDQoNCklu
IHRoZSBsaW1pdGVkIHRlc3RpbmcgSSBoYXZlIGRvbmUgdGh1cyBmYXIgYmVoYXZpb3IgaXMgYSBi
aXQgcHV6emxpbmcuICBGcm9tIHRoZSBkZXZpY2UgdHJlZSBJIGFtIGFibGUgdG8gY2hhbmdlIHRo
ZSBjbG9jayBmcmVxdWVuY3kgZm9yIG91dDEgKHdoaWNoIGlzIGVuYWJsZWQgYnkgZGVmYXVsdCkg
YW5kIEkgY2FuIGRpc2FibGUgb3V0cHV0cyB1c2luZyAnaWR0LHNodXRkb3duJywgYnV0IEkgY2Fu
bm90IGNoYW5nZSB0aGUgbG9naWMgbGV2ZWxzIGZvciBvdXQxIHVzaW5nIHRoZSAnaWR0LG1vZGUn
IHBhcmFtZXRlci4gIENsb2NrIG91dHB1dHMgZm9yIG91dDItNCBhcmUgZGlzYWJsZWQgYnkgZGVm
YXVsdCBzbyBoYXZlbid0IHRlc3RlZCB0aG9zZSB5ZXQuDQoNCkVuYWJsaW5nIHRoZSBjbG9ja3Mg
dW5jb25kaXRpb25hbGx5IHdvdWxkIGhlbHAgaW4gb3VyIHVzZSBjYXNlLCBidXQgaW5kaXZpZHVh
bGx5IGVuYWJsaW5nL2Rpc2FibGluZyB2aWEgZGV2aWNlIHRyZWUgd291bGQgYmUgbW9yZSBoZWxw
ZnVsLg0KDQotQ2xhdWRlDQoKPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQpUaGlzIG1lc3NhZ2UgYW5kIGFueSBhdHRh
Y2htZW50cyBhcmUgaW50ZW5kZWQgb25seSBmb3IgdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMp
IGFuZCBtYXkgY29udGFpbiBjb25maWRlbnRpYWwgb3IgcHJvcHJpZXRhcnkgaW5mb3JtYXRpb24g
YW5kIGJlIHN1YmplY3QgdG8gdGhlIGF0dG9ybmV5LWNsaWVudCBwcml2aWxlZ2Ugb3Igb3RoZXIg
Y29uZmlkZW50aWFsaXR5IHByb3RlY3Rpb25zLiAgSWYgeW91IGFyZSBub3QgYSBkZXNpZ25hdGVk
IHJlY2lwaWVudCwgeW91IG1heSBub3QgcmV2aWV3LCB1c2UsIGNvcHkgb3IgZGlzdHJpYnV0ZSB0
aGlzIG1lc3NhZ2Ugb3IgYW55IGF0dGFjaG1lbnRzLiAgSWYgeW91IHJlY2VpdmVkIHRoaXMgZW1h
aWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBieSByZXBseSBlLW1haWwgYW5k
IHBlcm1hbmVudGx5IGRlbGV0ZSB0aGUgb3JpZ2luYWwgYW5kIGFueSBjb3BpZXMgb2YgdGhpcyBt
ZXNzYWdlIGFuZCBhbnkgYXR0YWNobWVudHMgdGhlcmV0by4gIFRoYW5rIHlvdS4K
