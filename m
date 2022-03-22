Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CEC1C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 22 Mar 2022 20:09:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbiCVULF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Mar 2022 16:11:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232727AbiCVULE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Mar 2022 16:11:04 -0400
Received: from mx0b-00369f01.pphosted.com (mx0b-00369f01.pphosted.com [148.163.139.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ED4F60D0
        for <linux-clk@vger.kernel.org>; Tue, 22 Mar 2022 13:09:36 -0700 (PDT)
Received: from pps.filterd (m0167463.ppops.net [127.0.0.1])
        by mx0b-00369f01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22MDItpG031304;
        Tue, 22 Mar 2022 16:09:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mksinst.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to :
 content-transfer-encoding : mime-version : content-type; s=podFeb2021;
 bh=w1pC58MZKMp8Kkcn+BQYLKPmK1m477kwzf0ufMy1AH8=;
 b=FTNsjI+rtfRCMf+WOyXrG7g76Z7mQXz6JZzue1Zi5/FPZMpcln7BmGXLjUvM5/vgy4Wv
 bvMY/DOgidfyNmf9jWW4DzEN0TEP+ubkcKHHozjbFh6H8Xk65YYGkKBrWADMt9THyQBN
 QfYuBmSlkbQ7kJ5GMLqvNzu/OOZbkd8JD3dOs6R4UNQWcZo2HDnEhbCVeG7enA//sL/I
 Bs1iEpSZQqwuRcfaIcq722VryEPAfLmA+31RYjj6m19c8yNxjl0PW6tKGTzBHxmy65Eh
 wXtJqXQQU7/vctywRN30Hg7jZ7e1/6xlzyDD8DyRTP0gJzJtHo3VEqcy0W5P3yl1FAYU fg== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
        by mx0b-00369f01.pphosted.com with ESMTP id 3ey0t1w5ax-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 22 Mar 2022 16:09:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WEa/y7pkaijvpnrRvuEBPHZ/v2cTS78yBk5tc6PWFnYHevYovdcECzdre3oFM8HizTJgRr4h91mrizwGWsh6a/+q+SWQ0YVk7IIKj/DMY/UI+MNgssFR7JNpxiT4rg72r4ukzpsCSy3Q2a9MjfMFldWuteh26GR+DqffXC6BXSriKT/7zMJWKvDaFJiOur6VUyLoowp9c7otCSFk0SweOqOJZqfEcGyUGR+rLjdlt/EgxrBPRt5B+4u54t+lXLvLtBS2E1TrFhXLXQg02GWwsRn7W0ojTDY1wUJY2ocGPLwy7jll1MB2uq7x4WChFUrFtZTglWSH4v41Y/cL014GPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bA9miXW8a0q3yYXu7S8FvvpsPeYSDB2xi5AUdpXIQYk=;
 b=DXyzKRvs06j3pWLXfNTTSeUrT1BqgqOtgLpJDuwG8cYOp4wYr9CX4Ru/jB+cWs28OO9udx3hkfECOey+pQWCOUtXmFgqRrq4p8zFbw9K6fZiMHXuaVNe2J3/Eh1wczNP22yHGvUKBZDga4GYi2nBKbCF6m06qMfcTDfFQFh/qEs50Ur4JrAvmymspNscpQJzTdKXHEKQmGbATYrRev1tK/QEFTQKgIqPEjk3JFdflLXUNYNdkBBCM7LIR+roOm9j8Wec6Md1taCmn07I84zMCgCUt9IpQOmZe7HPh0m31qRleVchZ2RpMYuh0lEJt6lqyN6J2ocYlfzMl0znuMuZEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mksinst.com; dmarc=pass action=none header.from=mksinst.com;
 dkim=pass header.d=mksinst.com; arc=none
Received: from MN2PR03MB5008.namprd03.prod.outlook.com (2603:10b6:208:1ac::24)
 by BYAPR03MB4727.namprd03.prod.outlook.com (2603:10b6:a03:12d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Tue, 22 Mar
 2022 20:09:24 +0000
Received: from MN2PR03MB5008.namprd03.prod.outlook.com
 ([fe80::8d29:bd4b:20cf:ee41]) by MN2PR03MB5008.namprd03.prod.outlook.com
 ([fe80::8d29:bd4b:20cf:ee41%9]) with mapi id 15.20.5081.023; Tue, 22 Mar 2022
 20:09:24 +0000
From:   "Fillion, Claude" <Claude.Fillion@mksinst.com>
To:     Luca Ceresoli <luca@lucaceresoli.net>,
        Adam Ford <aford173@gmail.com>
CC:     Sean Anderson <sean.anderson@seco.com>,
        linux-clk <linux-clk@vger.kernel.org>
Subject: RE: [EXTERNAL] Re: Questions regarding regarding idt/renesas
 versaclock5 driver
Thread-Topic: [EXTERNAL] Re: Questions regarding regarding idt/renesas
 versaclock5 driver
Thread-Index: Adgsn5PPBaqTu/AxTlmRjOlUu8xbbwAHTV6AAAIztgAACrX3gAAgAxSwAAIUYgAAAPDp8AAHZO8AACleenAAAzsYAAPG+cYQACdYpwAACKJjkA==
Date:   Tue, 22 Mar 2022 20:09:24 +0000
Message-ID: <MN2PR03MB50085D86CF1C1CC89FD74E0993179@MN2PR03MB5008.namprd03.prod.outlook.com>
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
 <MN2PR03MB500831D1691CE0416BE22C1593169@MN2PR03MB5008.namprd03.prod.outlook.com>
 <158a5b3e-7ed0-c545-99d7-8890583facdb@lucaceresoli.net>
In-Reply-To: <158a5b3e-7ed0-c545-99d7-8890583facdb@lucaceresoli.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d0cf294b-9d3b-4983-15c9-08da0c3fdc61
x-ms-traffictypediagnostic: BYAPR03MB4727:EE_
x-microsoft-antispam-prvs: <BYAPR03MB472748807B107A0BD2F5D8E993179@BYAPR03MB4727.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ojXUa/14qjeDMQhX7xe34oam86OshqVONdXpctbc0y/g3H/nbjiFg1qut+vx/eBtyoY/dZ/POochI2EAHJe6Zn+7rst2r7XnY7kkTolqGv3shmbc5KN5lb4GA5bG0TkjIUwjWKSIN46t/aZTCujtK1Od8cZdDMeEEqIqjd20MyGbS6XUtLpUtUw8i76hu1CiNdrcK4VV11lwVcMOfx+lPdbMnRdpt3dqKwUDVc8/GW50QlFCWq9oFJ25Qp2g8sy9eVRXYop4gyU5W5uh5GwJGD8D+j0sdzz7DGbjs2mIne4s13wJdQFmceCq3GE2K2NOLej9ShIZONl38kvsXxT37O9dA5goXk0VxUISkqNvwPMQRJM2MpmSx62kA0s0qa+HpgYKWScufdFMfao+uemleQpkDbP1p4K+tNI4v4Gm86SzY/nxmXaMmv/RQ5N3rx4eicuUoHlUToDPjS1RbnB1/GjGKNvRGO0NApAbuaPzeChn01AYL2ivMZPVF6tkBHsBw5hmdNrWaqs7kBsdorFwPUQWnNYaUXuC/VPe5kvyeVbtdhOnXK+T0zjIuSv6pRI9erQScpSRaRbbjqNlUgG9QXnha0Xq6YXLHJLenDa+/fCm16Pt27iv7ZQPcfPdihYGKUzfcFln0I8lwkiDA5tYO32mfXBWlXlhxHWSXuejhFRzPJBmJLTFFPEGidbCM8EvXjZ91AfBMAvm/OMB5XDubg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR03MB5008.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(186003)(26005)(54906003)(110136005)(55016003)(508600001)(33656002)(316002)(9686003)(53546011)(38070700005)(6506007)(7696005)(122000001)(71200400001)(86362001)(38100700002)(66946007)(76116006)(8936002)(8676002)(83380400001)(64756008)(66476007)(66556008)(66446008)(52536014)(4326008)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vzl2WmtVUU5kQU1LdW9sOFExeldvYXJSTXl0RTZ4UTRRb0dOZDB6bUFmQnE4?=
 =?utf-8?B?NFB0eUY2Ly9VOXZ3NENFZFRFRlZsVW5wOWdDcG5lVHlwdGlkd2dZTFRYWEVu?=
 =?utf-8?B?Q0tabVphZDZWVi9kWmFBQVlyOEF6WXhkZ1B3d1VhN1pnYlhFZVdocVNqY2ti?=
 =?utf-8?B?TnBET3A3ZDRIZ0kvK1FmdzJkS24vUWRUWFEvRkdXYjRnc01oS2dUSFpNdzE1?=
 =?utf-8?B?Z3UzdG1IV3dFR1g4QVRKZFlIZUNZM3ZOWHB5WHJrOHhwVzF3MlorZU5uaHNU?=
 =?utf-8?B?N21SelBOeVNzZmJoZjh1V3VGSHBlYVliRDBjRVVtOEFJSS94K00zcXdxdlFu?=
 =?utf-8?B?blF0VWluZjVsbHAzTjVzTXpTNms0Z1ZhS0FsTU9iMWowQXlyUVdrd2x4NnRn?=
 =?utf-8?B?TlhGdUFmNFhFaDU2Z1MyMmdaVEN5WGZ0SUd1Z0JiY0FrTDdDZmYzaGkrMzdZ?=
 =?utf-8?B?NU8rZGZkUmMzenQyRDB2SjQvTlo5cjQyUGxhV3BDV01uMXN1VlFoY1dML1cw?=
 =?utf-8?B?KzRFdnlRMEtOWGpaUnlDaGdPNS93NVc1OGhmUlF4djkyeUQzU01mVlowcldW?=
 =?utf-8?B?SElWbnllcm14cUZDUTRDaHhhaXJHNUdXZTNPM3BCWUZRaDZPNFhoUHBPT21H?=
 =?utf-8?B?aGZjeURWU1VmU3MzaDh4d2M4ZzBIK0c0bUN6bnplaXJxcUZKQkxFM2J5QnFi?=
 =?utf-8?B?V29uWVlwTlFJMHA1NkxicDI3KzYxalhjY1VEazUyRG8wM2drd1IzazdCbXlX?=
 =?utf-8?B?a3NERyszMmQ0eFRuNStabnZUTHFCSVZGSmViRDFtandTV2xzZHZlNFFKeVhi?=
 =?utf-8?B?Nk5keFJPMmNKaUM1WWVxRGJuWU5WbUE1TnRwSTJrNFNFTTUrYmhYTllFN3Mw?=
 =?utf-8?B?eWVta1FTUFIzeFRLeFk3MGtoc2RUa21OL3JQTmUvOWMzKzQrRTJLSEdVcHBM?=
 =?utf-8?B?ZkRibnFESmRXNzdLWXI1Q1lGTmttQzlYQUFTaHVpVlRhZmZsekJVY1Rsb2FH?=
 =?utf-8?B?VjlIL3d1VVY5VnV6T2xEYjJGNGpmeFJVRVEzS0hxeGZSek94dGdaMkVZZzNv?=
 =?utf-8?B?Z1UxNWp3dWtTRk1paGRGZE9QMWJXTVMvRXgyaWNKYm5SRkl3RW45WVoyRFU0?=
 =?utf-8?B?MldUR2NVaFc0YTV3bVNQbDF6alNlcUpjazBZQk5UaFZwZm90cll4aGJEckt6?=
 =?utf-8?B?WExRNCthZDhNRUFGTjZpdjIxQ2o4cG92VnMzSlFqQmczS3pBSmZrRUQxb2Fm?=
 =?utf-8?B?M0o3Wkk5ejdQUkRKbUNlRjNGV2VENjlhYVRiS1Z1WEtaQUxBVUxTd1RPZDMz?=
 =?utf-8?B?b3JndnFTTkN1M3BzNXJpc0FMQ0hzMEZyb1hldlFrYU9qZVNsQWdnV3JUbEhU?=
 =?utf-8?B?aWMxc0RlYW1mejByREVDemErbU1aOWdvcWxOTDN5ckYyaXNnVUtkVHRCRnM2?=
 =?utf-8?B?WUpKdEJibWllLzM0cHIvQ1d5RFE3Q0hGc2h3QVB4Vk16RWhFRUdnM0xEWmFB?=
 =?utf-8?B?bTl2UWtmNXVpZWgwSWpCOG5xQVdSY1dLWlhRZ3BIeVQ4cUhrRnY5dXI2SVhU?=
 =?utf-8?B?NnV6akZxcWU2YmF2YUROQmdlQ3RhZFBwQWJZd01ZQXFydXlqR0JUczlvZW9w?=
 =?utf-8?B?RmpDUDVIbTEwakRVcnZVS3NFcWlqNjFUOXUwanlOYzNnODhrRWg4S3pWT1gx?=
 =?utf-8?B?MThIczFveGd0bFBpdE1LNzViUk1jSHRjNFBFREhGbzE3SGcvVUx6cEZ2ektE?=
 =?utf-8?B?KzZIOXhjdHEwRzF1ZGZTMHpYOTRDd0luNWZvcktzazVwKzQxRithM2FTbXdB?=
 =?utf-8?B?VHlXaGZKZzlQWEUxS2dzWUdWLzZQUkwvOG5hQmRGZlJNb2RSdWN6T3JxTkJs?=
 =?utf-8?B?d3RDdUFQWUYxclhXS014Q2J3T1RyZkZ2WnY0WWRuVTdBUUtmRitNZlMrdGxl?=
 =?utf-8?Q?jjFVRmdXu+zEzlj408F2+uWIEnanbc3J?=
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mksinst.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR03MB5008.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0cf294b-9d3b-4983-15c9-08da0c3fdc61
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2022 20:09:24.4294
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34fc6b5f-c773-4cad-ae20-f226c36b7e65
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MYbuqDrsq6QGp5aWVTZq75FSEp9qGvLuDzaeIeomk5ApteXpqg2dk5FOJcIHXwkaLJ0O9APoEhQB6I7YGuO0tLRIVSTi2CEUDMSpSIZP3s0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4727
X-Proofpoint-GUID: uDMHyAnvu7BWLQTVyf1S0FQ8fHm9vB6U
X-Proofpoint-ORIG-GUID: uDMHyAnvu7BWLQTVyf1S0FQ8fHm9vB6U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-22_07,2022-03-22_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203220104
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SGVsbG8gTHVjYSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMdWNh
IENlcmVzb2xpIDxsdWNhQGx1Y2FjZXJlc29saS5uZXQ+DQo+IFNlbnQ6IFR1ZXNkYXksIE1hcmNo
IDIyLCAyMDIyIDEyOjAwIFBNDQo+IFRvOiBGaWxsaW9uLCBDbGF1ZGUgPENsYXVkZS5GaWxsaW9u
QG1rc2luc3QuY29tPjsgQWRhbSBGb3JkDQo+IDxhZm9yZDE3M0BnbWFpbC5jb20+DQo+IENjOiBT
ZWFuIEFuZGVyc29uIDxzZWFuLmFuZGVyc29uQHNlY28uY29tPjsgbGludXgtY2xrIDxsaW51eC0N
Cj4gY2xrQHZnZXIua2VybmVsLm9yZz4NCj4gU3ViamVjdDogUmU6IFtFWFRFUk5BTF0gUmU6IFF1
ZXN0aW9ucyByZWdhcmRpbmcgcmVnYXJkaW5nIGlkdC9yZW5lc2FzDQo+IHZlcnNhY2xvY2s1IGRy
aXZlcg0KPiANCj4gSGkgQ2xhdWRlLA0KPiANCj4gT24gMjEvMDMvMjIgMjI6MjEsIEZpbGxpb24s
IENsYXVkZSB3cm90ZToNCj4gWy4uLl0NCj4gPj4+PiBMb29rIGF0IHRoZSB1c2Ugb2YgZGV2bV9j
bGtfZ2V0X29wdGlvbmFsIGFuZCBjbGtfcHJlcGFyZV9lbmFibGUNCj4gPj4+PiBmcm9tIHRoYXQg
cGF0Y2guICAoeWVzLCB0aGVyZSBpcyBhIHN1YnNlcXVlbnQgcGF0Y2ggdGhhdCBmaXhlcw0KPiA+
Pj4+IHNvbWV0aGluZyBJIGRpZG4ndCBxdWl0ZSBkbyByaWdodCwgYnV0IHRoZSBiYXNpY3MgYXJl
IGhlcmUpDQo+ID4+Pj4NCj4gPj4+PiBUaGUgY29uc3VtZXIgZHJpdmVycyBuZWVkIHRvICdnZXQn
IHRoZSBjbG9jayBzbyBpdCBjYW4gYXNzb2NpYXRlDQo+ID4+Pj4gaXRzZWxmIHRvIHRoZSBjbG9j
ayBpbiBxdWVzdGlvbi4gIE9uY2UgdGhlIHJlbGF0aW9uc2hpcCBpcw0KPiA+Pj4+IGVzdGFibGlz
aGVkLCB0aGUgY29uc3VtZXIgbmVlZHMgdG8gY2FsbCBjbGtfcHJlcGFyZV9lbmFibGUoKSB3aGlj
aA0KPiA+Pj4+IHVzZXMNCj4gPj4gdGhlIGNsb2NrIHN5c3RlbSB0byB0dXJuIHRoZSBjbG9jayBv
bi4NCj4gPj4+PiBXaXRob3V0IHRoaXMgc3RlcCwgaXQncyBsaWtlbHkgdGhlIFZlcnNhY2xvY2sg
d29uJ3QgZ2VuZXJhdGUgYQ0KPiA+Pj4+IHNpZ25hbCwgYmVjYXVzZSBpdCBkb2Vzbid0IGtub3cg
aXQgbmVlZHMgdG8gdHVybiBpdCBvbi4NCj4gPj4+Pg0KPiA+Pj4+IGFkYW0NCj4gPj4+DQo+ID4+
PiBOb3Qgc3VyZSBJIGZ1bGx5IGZvbGxvdy4gIEkgc2VlIHRoYXQgY2xrIG91dDEgaXMgZW5hYmxl
ZCBidXQgdGhlDQo+ID4+PiBvdGhlciBjaGFubmVscw0KPiA+PiBhcmUgbm90IHNvIGl0IHdvdWxk
IHNlZW0gbXkgZGlmZmljdWx0eSBpcyB3aXRoIGluZGl2aWR1YWwgY2hhbm5lbHMuDQo+ID4+DQo+
ID4+IERvIHRoZSBkZXZpY2VzIHRoYXQgbmVlZCB0aGUgY2xvY2sgZnJvbSB0aGUgdmVyc2FjbG9j
ayByZWZlcmVuY2UgdGhlDQo+ID4+IHZlcnNhY2xvY2s/ICBJZiBzbywgdG8gdGhvc2UgZHJpdmVy
cyB1c2UgdGhlIGdldCBhbmQgZW5hYmxlPyAgSWYgbm90LA0KPiA+PiB0aGUgdmVyc2FjbG9jayB3
aWxsIHN0YXkgb2ZmLiAgSW4gdGhlIHBhdGNoIGV4YW1wbGUgSSBzaG93ZWQsIEkgaGFkDQo+ID4+
IHRvIG1vZGlmeSB0aGUgRXRoZXJuZXQgZHJpdmVyIG9uIGEgcHJvY2Vzc29yLCBiZWNhdXNlIGl0
IGRpZG4ndA0KPiA+PiBleHBsaWNpdGx5IGVuYWJsZSB0aGUgcmVmZXJlbmNlIGNsb2NrLiAgVGhh
dCBFdGhlcm5ldCBkcml2ZXIgZXhwZWN0ZWQNCj4gPj4gdGhlIHJlZmNsayB3YXMgYWx3YXlzIHBy
ZXNlbnQgd2hpY2ggd2FzIGEgZmFsc2UgYXNzdW1wdGlvbi4gIE9uY2UgSQ0KPiA+PiBnb3QgdGhl
IGNvbnN1bWVyIGRldmljZSAoaW4gdGhpcyBjYXNlLCBFdGhlcm5ldCkgdG8gcmVxdWVzdCBhbmQN
Cj4gPj4gZW5hYmxlIHRoZSBjbG9jaywgdGhlIGNsb2NrIHN1YnN5c3RlbSBlbmFibGVkIHRoZSBj
b3JyZXNwb25kaW5nIG91dHB1dA0KPiBvbiB0aGUgdmVyc2FjbG9jay4NCj4gPj4NCj4gPj4gRm9y
IHRoZSBFdGhlcm5ldCBleGFtcGxlIEkgY2l0ZWQgYWJvdmUsIHRoZSBjb3JyZXNwb25kaW5nIGRl
dmljZSB0cmVlDQo+ID4+IGxvb2tzDQo+ID4+IGxpa2U6DQo+ID4+DQo+ID4+ICZhdmIgew0KPiA+
PiAgICAgIGNsb2NrcyA9IDwmY3BnIENQR19NT0QgODEyPiwgPCZ2ZXJzYWNsb2NrNSA0PjsNCj4g
Pj4gICAgICBjbG9jay1uYW1lcyA9ICJmY2siLCAicmVmY2xrIjsNCj4gPj4gICAgICBzdGF0dXMg
PSAib2theSI7DQo+ID4+IH07DQo+ID4+DQo+ID4+IFdpdGggdGhpcyBkZXZpY2UgdHJlZSByZWZl
cmVuY2UsIHRoZSAncmVmY2xrJyBnZXRzIGFzc29jaWF0ZWQgdG8NCj4gPj4gdmVyc2FjbG9jayBv
dXB1dCA0LiAgV2hlbiB0aGUgRXRoZXJuZXQgbmVlZHMgdGhlIGNsb2NrLCBpdCBjYWxscw0KPiA+
PiBjbGtfcHJlcGFyZV9lbmFibGUgb24gdGhhdCBjbG9jayByZWZlcmVuY2UsIGFuZCB0aGUgY2xv
Y2sgc3lzdGVtDQo+ID4+IGNhbGxzIG9uIHRoZSB2ZXJzYWNsb2NrIGRyaXZlciB0byBlbmFibGUg
dGhlIG91dHB1dC4gIFRoZSByZWFzb24gSQ0KPiA+PiBuZWVkZWQgdG8gc3VibWl0IHRoYXQgcGF0
Y2ggd2FzIHRoYXQgdGhlIGNvbnN1bWVyIGRyaXZlciAodGhlDQo+ID4+IEV0aGVybmV0IGluIHRo
aXMNCj4gPj4gY2FzZSkgd2Fzbid0IGNhbGxpbmcgdGhlIGNsa19wcmVwYXJlX2VuYWJsZSwgc28g
dGhlIGNsb2NrIHJlbWFpbmVkDQo+ID4+IG9mZi4gIEl0J3MgbGlrZWx5IHRoYXQgd2hhdGV2ZXIg
ZGV2aWNlcyB0aGF0IG5lZWQgdGhlIGNsb2NrIGZyb20gdGhlDQo+ID4+IHZlcnNhY2xvY2sgd2ls
bCBuZWVkIGJvdGggYSBkZXZpY2UgdHJlZSByZWZlcmVuY2UgdG8gaXQgYXMgd2VsbCBhcyBhDQo+
ID4+IGNhbGwgdG8gY2xrX3ByZXBhcmVfZW5hYmxlLg0KPiA+DQo+ID4gRm9yIG15IGFwcGxpY2F0
aW9uIEkgd291bGQgbGlrZSB0aGUgYWJpbGl0eSB0byBzZXQgY2xvY2sgZnJlcXVlbmNpZXMgYWNj
b3JkaW5nDQo+IHRvIHZhbHVlcyB0aGF0IGFyZSBzdG9yZWQgaW4gYSBqc29uIGZvcm1hdHRlZCBj
b25maWcgZmlsZS4gSXMgdGhlcmUgYSB3YXkgdG8NCj4gY2hhbmdlIHRoZXNlIHZhbHVlcyBmcm9t
IHVzZXIgc3BhY2UgYXBwIGNvZGU/ICBJZiBub3QsIHdvdWxkIGl0IGJlIG9rIHRvIGFkZA0KPiBj
b2RlIHRvIG15IGNvbnN1bWVyIGRyaXZlciAoc2F5IGluIHRoZSBwcm9iZSBtZXRob2QpIHRoYXQg
d291bGQgcmVhZCB0aGUNCj4gdmFsdWVzIGZyb20gdGhlIGpzb24gYW5kIHRoZW4gY2FsbCBzZXRf
cmF0ZSgpIGFuZCBwcmVwYXJlX2VuYWJsZSgpKSA/DQo+IA0KPiBUaGlzIGlzIGFic29sdXRlbHkg
bm90IGEgc3RhbmRhcmQgcHJhY3RpY2UgaW4gdGhlIGtlcm5lbC4gSWYgZHJpdmVycyBhcmUgd2Vs
bA0KPiB3cml0dGVuIHRoZW4gYSBjb25zdW1lciBkcml2ZXIga25vd3Mgd2hpY2ggY2xvY2sgaXQg
bmVlZHMsIGl0IHdpbGwgYXNrIHRoZQ0KPiBwcm9kdWNlZCB0aGF0IGZyZXF1ZW5jeSBhbmQgY29u
ZmlndXJlIHRoZSBjb25zdW1lciBkZXZpY2UgYWNjb3JkaW5nbHkuDQo+IA0KPiBFLmcuIGlmIHRo
ZSBjb25zdW1lciBkZXZpY2UgaXMgYW4gYXVkaW8gY29kZWMgdGhlbiB1c2VyIHNwYWNlIHdpbGwg
bmV2ZXIgc2F5ICJJDQo+IHdhbnQgeW91IHRvIGFzayBmb3IgYSAxIE1IeiBjbG9jayIgYnV0IHJh
dGhlciAiSSB3YW50IHRvIHBsYXliYWNrIGF0IDQ4IGtIeiIsDQo+IHRoZW4gdGhlIGRyaXZlciB3
aWxsIGFzayBmb3IgYSBnaXZlbiBjbG9jayBmcmVxdWVuY3kgYW5kIGNvbmZpZ3VyZSB0aGUgY29k
ZWMgdG8NCj4gdXNlIGl0LCBwZXJoYXBzIHNldHRpbmcgZGl2aXNvci9tdWx0aXBsaWVyIHJlZ2lz
dGVycyBldGMuDQo+IA0KPiBTbyBJIHJlYWxseSBzdWdnZXN0IHlvdSB0byB1bmRlcnN0YW5kIHdo
YXQgdGhlIGNvcnJlY3Qga2VybmVsLXVzZXJzcGFjZQ0KPiBpbnRlcmZhY2Ugd291bGQgYmUgZm9y
IHlvdXIgY29uc3VtZXIgZHJpdmVyLiBJZiB5b3Ugd2FudCB5b3UgY2FuIHNoYXJlIHdoYXQNCj4g
dGhlIGNvbnN1bWVyIGRldmljZSBpcyBzbyB3ZSBjYW4gYmUgZ2l2ZSBzb21lIHN1Z2dlc3Rpb25z
Lg0KPiANCj4gVGhhdCBzYWlkLCBpZiB5b3UgZG9uJ3Qgd2FudCB0byBtYWlubGluZSB5b3VyIGNv
bnN1bWVyIGRyaXZlciBub2JvZHkgd2lsbA0KPiBwcmV2ZW50IHlvdSBmcm9tIGRvaW5nIGFueXRo
aW5nICJzdHJhbmdlIi4gQnV0IGtlZXAgaXQgbGltaXRlZCB0byB5b3VyIGRyaXZlciwNCj4geW91
IGRvbid0IHdhbnQgdG8gaGF2ZSBjb25mbGljdHMgaW4gdGhlIHZlcnNhY2xvY2sgY29kZSB3aGVu
IHlvdSB1cGdyYWRlIHRvDQo+IGEgbW9yZSByZWNlbnQga2VybmVsLg0KPiANCj4gQWxzbywgSSBk
b24ndCB0aGluayBqc29uIGlzIGV4cGVjdGVkIHRvIGJlIGluIHRoZSBrZXJuZWwuIElmIHlvdSB3
YW50IHRvIGRvDQo+IHNvbWV0aGluZyBsaWtlIHRoYXQgdGhlbiBtYXliZSBwYXJzZSBqc29uIGF0
IHVzZXJzcGFjZSBsZXZlbCBhbmQgdGhlbiBzZW5kDQo+IGp1c3QgdGhlIGZyZXF1ZW5jeSBpbiBI
eiB2aWEgYSBzeXNmcyBlbnRyeS4NCj4gDQo+IC0tDQo+IEx1Y2ENCg0KSGVsbG8gTHVjYSwNClRo
YW5rIHlvdSBmb3IgcmVzcG9uZGluZy4gIEkgd2lsbCBhdHRlbXB0IHRvIHByb3ZpZGUgYSBsaXR0
bGUgbW9yZSBkZXRhaWwgb24gb3VyIHVzZSBjYXNlLiAgT3VyIHByb2R1Y3RzIGRvIGEgZmFpciBh
bW91bnQgb2Ygc2lnbmFsIHByb2Nlc3NpbmcsIGJvdGggaW4gdHJhbnNtaXR0aW5nIGFuZCByZWNl
aXZpbmcgY2hhaW5zLiBUaGUgY2xvY2tzIHdlIHdvdWxkIGxpa2UgdG8gYWRqdXN0IGNvbnRyb2wg
QURDIGFuZCBEQUMgc2FtcGxlIHJhdGVzLiAgVGhlc2UgcmF0ZXMgZG8gbm90IGNoYW5nZSBmcmVx
dWVudGx5LCBidXQgZGVwZW5kaW5nIG9uIHBhcnRpY3VsYXIgZmVhdHVyZXMgd2UgZW5hYmxlIG9y
IG9uIGNvbmRpdGlvbnMgdGhhdCBhcmUgc3BlY2lmaWMgdG8gYSBjZXJ0YWluIGN1c3RvbWVyIHRo
ZXJlIHdpbGwgYmUgdGltZXMgd2hlcmUgd2Ugd2lsbCBuZWVkIHRvIGNoYW5nZSBzYW1wbGUgcmF0
ZXMuIE91ciBwcm9kdWN0cyBoYXZlIGFuIGV4dGVuc2l2ZSBzZXQgb2YgY29uZmlndXJhdGlvbiBw
YXJhbWV0ZXJzIGNvbnRhaW5lZCBpbiBqc29uIGZpbGVzIHRoYXQgY29udHJvbCBtYW55IGRldGFp
bHMgb2Ygb3VyIHNpZ25hbCBwcm9jZXNzaW5nIGNoYWlucy4gIElkZWFsbHkgd2Ugd291bGQgbGlr
ZSB0byBhZGQgdGhlIGFiaWxpdHkgdG8gZ2V0L3NldCBjbG9jayByYXRlcyB0aHJvdWdoIHRoaXMg
bWVjaGFuaXNtLg0KDQpXaGVuIGNoYW5naW5nIGZyZXF1ZW5jeSB3ZSBleHBlY3QgdG8gcmVib290
IHRoZSBkZXZpY2UsIGJ1dCB3b3VsZCBsaWtlIHRvIGF2b2lkIHJlYnVpbGRpbmcvZGlzdHJpYnV0
aW5nIG5ldyBjb2RlLiAgRXNzZW50aWFsbHkgIDEgY29kZSBwYWNrYWdlLCBjb25maWd1cmVkIG11
bHRpcGxlIGRpZmZlcmVudCB3YXlzLg0KDQpUaGUgaWRlYSBvZiBwYXJzaW5nIGpzb24gYXQgdXNl
cnNwYWNlIGFuZCBqdXN0IHNlbmRpbmcgdGhlIGZyZXF1ZW5jeSBpbiBIeiB2aWEgYSBzeXNmcyBl
bnRyeSBzZWVtcyBhcHBlYWxpbmcuIEkgdGhvdWdodCBJIHdvdWxkIG5lZWQgdG8gY2FsbCB0aGUg
c2V0X3JhdGUoKSBtZXRob2Qgb2YgdGhlIGRyaXZlciBpbiBvcmRlciB0byBjaGFuZ2UgZnJlcXVl
bmN5LiAgSWYgaXQgaXMgbm90IHRvbyBtdWNoIHRyb3VibGUgY2FuIHlvdSBleHBsYWluIGhvdyBJ
IGNvdWxkIGNoYW5nZSBmcmVxdWVuY3kgdmlhIHN5c2ZzIGNhbGw/DQoNClRoaXMgaXMgd2hhdCBJ
IHNlZSBvbiB0aGUgZGV2aWNlIGluIC9zeXM6DQogICAgICByb290QENMQVVERTovc3lzL2NsYXNz
L2kyYy1kZXYvaTJjLTEvZGV2aWNlLzEtMDA2YSMgbHMNCiAgICAgIGRyaXZlciAgICAgbW9kYWxp
YXMgICBuYW1lICAgICAgIG9mX25vZGUgICAgcG93ZXIgICAgICBzdWJzeXN0ZW0gIHVldmVudA0K
DQpGcm9tIHRoaXMgSSBhbSBub3QgY2xlYXIgb24gaG93IHRvIHNldCBmcmVxdWVuY3kuDQoNClJl
Z2FyZHMsDQpDbGF1ZGUNCgo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09ClRoaXMgbWVzc2FnZSBhbmQgYW55IGF0dGFj
aG1lbnRzIGFyZSBpbnRlbmRlZCBvbmx5IGZvciB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykg
YW5kIG1heSBjb250YWluIGNvbmZpZGVudGlhbCBvciBwcm9wcmlldGFyeSBpbmZvcm1hdGlvbiBh
bmQgYmUgc3ViamVjdCB0byB0aGUgYXR0b3JuZXktY2xpZW50IHByaXZpbGVnZSBvciBvdGhlciBj
b25maWRlbnRpYWxpdHkgcHJvdGVjdGlvbnMuICBJZiB5b3UgYXJlIG5vdCBhIGRlc2lnbmF0ZWQg
cmVjaXBpZW50LCB5b3UgbWF5IG5vdCByZXZpZXcsIHVzZSwgY29weSBvciBkaXN0cmlidXRlIHRo
aXMgbWVzc2FnZSBvciBhbnkgYXR0YWNobWVudHMuICBJZiB5b3UgcmVjZWl2ZWQgdGhpcyBlbWFp
bCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGJ5IHJlcGx5IGUtbWFpbCBhbmQg
cGVybWFuZW50bHkgZGVsZXRlIHRoZSBvcmlnaW5hbCBhbmQgYW55IGNvcGllcyBvZiB0aGlzIG1l
c3NhZ2UgYW5kIGFueSBhdHRhY2htZW50cyB0aGVyZXRvLiAgVGhhbmsgeW91Lgo=
