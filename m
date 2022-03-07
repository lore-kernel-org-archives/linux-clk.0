Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31514C433EF
	for <linux-clk@archiver.kernel.org>; Mon,  7 Mar 2022 20:39:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245297AbiCGUkn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 7 Mar 2022 15:40:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245342AbiCGUkj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 7 Mar 2022 15:40:39 -0500
Received: from mx0a-00369f01.pphosted.com (mx0a-00369f01.pphosted.com [148.163.135.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8E9E7521A
        for <linux-clk@vger.kernel.org>; Mon,  7 Mar 2022 12:39:44 -0800 (PST)
Received: from pps.filterd (m0167462.ppops.net [127.0.0.1])
        by mx0a-00369f01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 227JmCna011079;
        Mon, 7 Mar 2022 15:39:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mksinst.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to :
 content-transfer-encoding : mime-version : content-type; s=podFeb2021;
 bh=oeTpKG2FgRn/7VtFlzHuhYLTZd8NkGL2IoGWp40KWn8=;
 b=nnHOB5m8HtRFU5EjIxcusSO9IPlYcDXzge7y/EXoZpA0yBW6gJUKB1CBIdcOih/65K4F
 Wm3Gt/gnNhPncGyv+xlAL/FXHWFtJ2Pai54JJVd+vleJIz8WFcpCD4LhJf9RCblO5Ozr
 arKC+KX4mA2Bx42cnLyIZ3UAFGGTwtHVN5XcTGSe7ca3hw7CRP2yhZhFYy9Qsx2Yfqui
 UV2A3hS0VINafmYxSG5uahVwqCK5TBOxI/z7Omf07NjiX1t/oMTST8cnNrSyRZmFc2cU
 IWhhbEZCui7JhyQQvwHnSZKQQEbjPn3i8fuP73pwr0jcSsc5mSru5WxgcQ8aKdVlygzc 5w== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
        by mx0a-00369f01.pphosted.com with ESMTP id 3enrhdr5xx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 07 Mar 2022 15:39:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZMLiMj5Y6l8AzEJiiuz/kJLyWxvMA1lOdVWDW1ic44MqyJwDuIQAPf5fMXx7xSOs8oiS1YiG1XeAFNx1KDXGpGqnoFeNtVDeXOz4JZbM3qw9/jBNgtr3CL4b467kjrHInYQ3HJGvPOgzCYDfiWijAaup0NMjDR/hZ0hTtj3gMnui3Xeqo47dSODqiMX8ZNzmjJ7tCMStQNBNadhw0A4GtWan9bDLYcMsaOnxSwk4M/eqAV3+1F0dkFmMRFZgzWI0V98DXYuCy6TegBNfRJukb8SFaDyQfBPjleGYx7RrsZ8EQwIdE0STD86khYDQ0ZkeEn6ZcTMEC+S2R/ixDxsDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vRPZbteD28rWSPNJh05IJM/AL6uZVzlVFLzoxGQF7CU=;
 b=KPaSo/zI8jmTUJdugZqB9aZO5Q0yyqYutavNLpyEV0aegvbXHvYJupC5rHoqOFqHx7sClJlEV+iZ16EN0WF6WfSlSviJ+awmUDP+Qt0v4V3dWRzsoiHzSEswTVX7WNK9yajX47DNajgytlP4/vQ+RX4OJEybMyuk1Ea2Rk6HxuRSD/1kAc4619mmEmyRm4bULpPjNZEEUrSGJyU/0RODWzMKPzqDXyFTrLS8jnq3daW68pFNXj7JV1+ItG9bJmZgT+iZMAzzeOXPj+qWOeYXODOBK/TQ+7rlwAltwU9dzqgIR8pLM4pPEM9JoHr98woMu1/NnrCODmSFjrpnHN6Gfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mksinst.com; dmarc=pass action=none header.from=mksinst.com;
 dkim=pass header.d=mksinst.com; arc=none
Received: from MN2PR03MB5008.namprd03.prod.outlook.com (2603:10b6:208:1ac::24)
 by BN7PR03MB3923.namprd03.prod.outlook.com (2603:10b6:408:24::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 20:39:30 +0000
Received: from MN2PR03MB5008.namprd03.prod.outlook.com
 ([fe80::5d5c:2dd2:649d:6323]) by MN2PR03MB5008.namprd03.prod.outlook.com
 ([fe80::5d5c:2dd2:649d:6323%5]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 20:39:30 +0000
From:   "Fillion, Claude" <Claude.Fillion@mksinst.com>
To:     Sean Anderson <sean.anderson@seco.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Adam Ford <aford173@gmail.com>
CC:     linux-clk <linux-clk@vger.kernel.org>,
        "Klein, Jesse" <Jesse.Klein@mksinst.com>
Subject: RE: [EXTERNAL] Re: Questions regarding regarding idt/renesas
 versaclock5 driver
Thread-Topic: [EXTERNAL] Re: Questions regarding regarding idt/renesas
 versaclock5 driver
Thread-Index: Adgsn5PPBaqTu/AxTlmRjOlUu8xbbwAHTV6AAAIztgAACrX3gAAgAxSwAAIUYgAAAPDp8AAHZO8AACleenAAAzsYAAADh08AAAYy0vAAJlUEgAAEcw7wADrYUQAAj2dv8A==
Date:   Mon, 7 Mar 2022 20:39:30 +0000
Message-ID: <MN2PR03MB500830AC4A68B15BF6B2602793089@MN2PR03MB5008.namprd03.prod.outlook.com>
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
 <MN2PR03MB500847D9F5BFF44F5E98ABA893039@MN2PR03MB5008.namprd03.prod.outlook.com>
 <59a74714-ae45-897e-57b9-7346998442cb@lucaceresoli.net>
 <MN2PR03MB5008DB1C7B0B5A4D2ECBB88E93049@MN2PR03MB5008.namprd03.prod.outlook.com>
 <a93e4fef-3001-0a41-1e3c-c23438e14799@seco.com>
In-Reply-To: <a93e4fef-3001-0a41-1e3c-c23438e14799@seco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8955da47-e6cb-479d-66cf-08da007a94c8
x-ms-traffictypediagnostic: BN7PR03MB3923:EE_
x-microsoft-antispam-prvs: <BN7PR03MB3923F7093E39BB4D66D6126093089@BN7PR03MB3923.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GZI1gsD0Q5opyapF2sDS+9FjADw8TfZk7ZxrWR6UOEeB5pGri8PApL800mWckB/0lvtF3uVHTUnIm+lcW9OvsQhSvhIbjh5cm/0xg02Yx8rKEoHh26IWlewaOx8MswXmLzpsMyZoJ++yDiMWIBGKN4Re+Dkc7BakZ6S3JyvSDPgFyeAaeYcu1ThCVNg1+P+71lQ6Q1eILsYhshVFp8UxNcPAEAmA92PIK4eIQBuGOW6Oa+vTPaXjOUHFlEUcB8J5f43ZydMxahviS3CMlVGN7X9Z5Xh0xP8TcaMC8oTenM7R6DUR2/iXT4fky9dYD+TDTSDsR2h5TtL2KWRlGRPT3KWRCkxgVOT1b/n/AHXo/xmtsh3LumwrwLd0UJp4vGpZmaeXrS/RXoUEMFcMqANYE27LLoicWWAOZTKCnW+Uw1WsVZES9Ii9fMg03QcH+Vra+OQuSUcizPNh6QqcovbHQrOzF57HxzYp9q3typlw7FoV3ofBxicA8ciTniceywP9a1Kr2jx2rftbYQpL9T85y87sBVdYKsrfvH75sQC/tghD5aURPamTtyTM3+ucPoyYxbbmlXHj/xw8njGoiRmuoKmmqtbdBim/xh60N6y8g9HHegCxJwf6wtswFPc1bJOtgkMQTMnZktimkXKLJMiWWcI/w1pDISuSP+kc9RUbQh/p0270fcVFl8Bl3GWhpWD3yo61cOHJUfeQOo13nqwMOeBUuOB9hn0L1fuM8il0yY8C0O8OE0zegWpaSE0VbGX7+mqW5T8oAnT2rJqOAUp6KyFtyTzNlEKLsUuKKrXNWrQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR03MB5008.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(76116006)(66446008)(66476007)(66556008)(64756008)(66946007)(86362001)(316002)(6506007)(7696005)(5660300002)(54906003)(508600001)(9686003)(122000001)(52536014)(53546011)(4326008)(8676002)(8936002)(19627235002)(966005)(71200400001)(2906002)(38100700002)(83380400001)(107886003)(186003)(26005)(38070700005)(110136005)(33656002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UHRVN3RPREtMTVlnZnVFU1U3RWxGcXpJRGQ3Nm03KyswalNXd0NqNzF1UEtC?=
 =?utf-8?B?bXZLMkVxUTJFUC9LdzhWNDV5YUtFRU85VXRWMFFpRzFUVDVMT3I5OGxNY2s4?=
 =?utf-8?B?NnU0S0tXNy8zV1NNbDhZZm14SmR4N0tBend0dnU4ek9yQzc1bFhaZzRFdEk2?=
 =?utf-8?B?MHFqTmtpSldqdlo1Rk11Q2gxVHQ0NWRVV204NnhUVkJ2NjBsTDdlYVU0b1Qv?=
 =?utf-8?B?TXJTcFBFaG5ZZis1S0VNRkdybkIwb21FbGVER2V1ZzFXQm9oTVlScUhXeVNw?=
 =?utf-8?B?RjdFUUxmdzlZL3lvdVJEVEpFUXdDdSsvc2dSNTQxeVJoZ0ZiRStDOEkzSUpz?=
 =?utf-8?B?ZjkxYWtnTytkRVZNeit1QUV0NFBYRDN0K3AzTWRSU0RhTHRuZ0NmdGlPSEwz?=
 =?utf-8?B?cmZlVVpaZyt3WVJ3MzBxR01lNGtXbWxpMnBNNEVNT0FLRWpiKzZhbU90dUpm?=
 =?utf-8?B?eUpLbzc2SzUrMGtpK2k2SU9BOWJqb3AreHZSdGxpKzRsbGRFN2xJYWszY1Nn?=
 =?utf-8?B?cU9RWSs4Z0NqeWVGOHRkV2xSN29vbkdKeWxqVFNFZlRMWXBYZUptWExrRXI5?=
 =?utf-8?B?enQ2eHFBcDJYRmNQaHhuNklOMUw3M1M2V294RWJtMlR6VEhsOW9jR1dsSGdJ?=
 =?utf-8?B?WVkvYit4UzQ4cUpoWHpLOXVpa3RKV1lPN2ZKTHlWamMzd2xQaGpRd0ZHTHRx?=
 =?utf-8?B?Ylg1LzdnczFCTm8zQ1hJVzhpTkt5VDNqc0hjRDlRQWVzWk9zS090c01tcWtr?=
 =?utf-8?B?TmIzNktnL3ViSUxUZVRpb2hHd2JnV3Y1Q0ViZ2VTZFZ6UGI1dTVKbEt1ak1I?=
 =?utf-8?B?UDgrSTVwZndQN0M0VW50dndjVmt1ZHZJTXJDQ1g2S1VNSWJGQmhMRHh2TVp5?=
 =?utf-8?B?UDVSS2FveHNkOVZZR1dTTnFsYWVaNmtZMzJDazQ4R0U3YjdrcE9USG5yZXJD?=
 =?utf-8?B?TE1kZnpQN2JzOCthdUd1cTZrM1pZazJCYXVaQWhKMXNEVG1wdlFGVGtXL2sz?=
 =?utf-8?B?QW1STGZLaFR4WktmaTBONlpxOG1EY3IrNDd3RmloTlpJNWdZVFlucmgwUVcz?=
 =?utf-8?B?amQ2UmpYbVk0ZlJGZ1NpaDdvWXh6SHRaZkVzZzlLYVd4UFdZTmRWSHJDL2ZH?=
 =?utf-8?B?Sjk1Q0xucitENnhBbFdTRm1QRUNKa3pOTFpiK3BHVXFEa09xeW4vQXVseGlU?=
 =?utf-8?B?UUhzWmxYRy9xL0trUW12Y094Q0daVzE3akxtYWF1UE1oOS93a3JBUVdMUmN4?=
 =?utf-8?B?UjVTOE51ekdEVElXSFYxdGRjU29NNVVaQjRzRGZWSjZ3NXF1UDVBeVNsNzJs?=
 =?utf-8?B?OHVMVStvS1lodUVzelU4MWh0T3JxSVVlWVZNZ3Vhb0lpazVmaGxWWnYzQkhK?=
 =?utf-8?B?ZU83Sm92aTFSb2NrV1NNamhtM0ZHc2dqSzZLU0YwVVB3aUJVZ1hiaGc1SnJ0?=
 =?utf-8?B?MkFXdk8raWd4QnVMTllHK1RJa3pKcGVhazZLQUlmeHNLbFpucThXajlweGlS?=
 =?utf-8?B?RDNuZVF0Z0VwWTUwSHEzb25ndHgxa211eUl2MkJpRXNDdEZHMkg2ZnJLYlMw?=
 =?utf-8?B?aUN5U1d2OXVsUm55bWI0d1FrNEpiSHZoQTlHeGdhanZQaDZ4dVV2a3diLzdC?=
 =?utf-8?B?dVFZUHFPR2hKMkNGL2FidlllT2N4SHRYOVZqYVhQN0xSRTRGaG9DdnhpRlZt?=
 =?utf-8?B?RXA0TkZSUHppUk9yd2drYm44cnk0c0ZZN1pQVTUwWllZb2xDd0FPRHlRdmx3?=
 =?utf-8?B?MVR3eU1hY01MTUphWWd0emgwcTJsMVVnbUxDOEJ5VzBnTjRYQlQ3czg0TzhP?=
 =?utf-8?B?eEt3bS9xZzROTlI3TEZSdWkrL1FoZWtPZmtabWNrSVEra3dnblhXU1E4VlVP?=
 =?utf-8?B?Q3hYVjRkekdMQjUxNCsyWGRXU01Ba1M1cSswSlBUd0hLQnNIaEx3WDNtM3Zq?=
 =?utf-8?B?UUZmUVdmUis2ajdOeUVjZ3RFRnJBQmc1QS85Sno0Vjc5NFZiaGovWUk3MHYx?=
 =?utf-8?B?U3RFdFY4NW1RRXhIZXhac0pTNllJSnZXM0J4a3M1WFBqVnpPQTdrcVBtaFRM?=
 =?utf-8?B?Y1FDMmswM3FhMmw3S3RTbXArb0NwUVR6SitnN1E0SVNybW9hcThSS1YwNWZq?=
 =?utf-8?B?enhjV0VRdW5hUXlVWk1sZHhiMUFNeE8wQVdicE52MjJFZG5FL1lTUWhVQ3NH?=
 =?utf-8?B?cTg0SGoxcmlEcGZielQ4SG5weUR2QTRKeUFVVk5mZU1DRlhRVWh0NEhTZ1pt?=
 =?utf-8?B?VXRPakNoOExBVlgwR2NabFVvbGdBPT0=?=
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mksinst.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR03MB5008.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8955da47-e6cb-479d-66cf-08da007a94c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2022 20:39:30.6643
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34fc6b5f-c773-4cad-ae20-f226c36b7e65
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F9i0cCsldvq1UEaV/xxHJ5wkoqkvHqiWGEoQPX76XOBwXJV8c/f/D72xIi9bpayJ2vl9MUhePmLT5ZYpLE6boy037SuUCTGMLbElvARTd6M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3923
X-Proofpoint-GUID: ubIY00oRLzlPpgB-JtxSorPx90YshNTF
X-Proofpoint-ORIG-GUID: ubIY00oRLzlPpgB-JtxSorPx90YshNTF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-07_11,2022-03-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203070110
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SGVsbG8gU2VhbiwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTZWFu
IEFuZGVyc29uIDxzZWFuLmFuZGVyc29uQHNlY28uY29tPg0KPiBTZW50OiBGcmlkYXksIE1hcmNo
IDQsIDIwMjIgMzo1NCBQTQ0KPiBUbzogRmlsbGlvbiwgQ2xhdWRlIDxDbGF1ZGUuRmlsbGlvbkBt
a3NpbnN0LmNvbT47IEx1Y2EgQ2VyZXNvbGkNCj4gPGx1Y2FAbHVjYWNlcmVzb2xpLm5ldD47IEFk
YW0gRm9yZCA8YWZvcmQxNzNAZ21haWwuY29tPg0KPiBDYzogbGludXgtY2xrIDxsaW51eC1jbGtA
dmdlci5rZXJuZWwub3JnPjsgS2xlaW4sIEplc3NlDQo+IDxKZXNzZS5LbGVpbkBta3NpbnN0LmNv
bT4NCj4gU3ViamVjdDogUmU6IFtFWFRFUk5BTF0gUmU6IFF1ZXN0aW9ucyByZWdhcmRpbmcgcmVn
YXJkaW5nIGlkdC9yZW5lc2FzDQo+IHZlcnNhY2xvY2s1IGRyaXZlcg0KPiANCj4gSGkgRmlsbGlv
biwNCj4gDQo+IE9uIDMvMy8yMiAxOjE1IFBNLCBGaWxsaW9uLCBDbGF1ZGUgd3JvdGU6DQo+ID4N
Cj4gPiBIZXJlIGlzIHRoZSByZWxldmFudCBwb3J0aW9ucyBvZiBteSBkZXZpY2UgdHJlZS4gIE9u
IHRoZSBzY29wZSBJIHNlZSB0aGUNCj4gZGVmYXVsdCAnQ01PU0QnIHZvbHRhZ2VzIGFuZCBhIG1v
ZGlmaWVkIGZyZXF1ZW5jeSBvZiA0Ni44TUh6Lg0KPiA+DQo+ID4gSSBoYXZlIGFsc28gbW9kaWZp
ZWQgbXkgbG9jYWwgY29weSBvZiB0aGUgZHJpdmVyIHRvIGFjY2VwdCBhbiAnaWR0LGVuYWJsZScN
Cj4gcGF0dGVybiBwcm9wZXJ0eSB0aGF0IGFsbG93cyBtZSB0byBlbmFibGUgb3V0cHV0cyBmcm9t
IHRoZSBkZXZpY2UgdHJlZS4gSXQNCj4gbmVlZHMgc29tZSByZWZpbmVtZW50IGJ1dCBJIGNhbiBw
YXNzIGl0IGFsb25nIGlmIHRoZXJlIGlzIGludGVyZXN0Lg0KPiA+DQo+ID4gLUNsYXVkZQ0KPiA+
DQo+ID4gPT09PT09PT09PT09PT09PT09DQo+ID4gVG9wIG9mIGRldmljZSB0cmVlIGZpbGU6DQo+
ID4gPT09PT09PT09PT09PT09PT09DQo+ID4gLyoNCj4gPiBUaGlzIGlzIGEgbWVzc2FnZSBmb3Ig
c3lzdGVtLXVzZXIuZHRzaS4gSWYgeW91IGFyZSByZWFkaW5nIGZyb20NCj4gPiBzeXN0ZW0tdXNl
ci5kdHNpLmdlbnh4eHgsIHBsZWFzZSBub3RlIHRoYXQgdGhpcyBtZXNzYWdlIGlzIGZvciBleHBs
YWluaW5nDQo+IHRoZSBwdXJwb3NlIG9mIHN5c3RlbS11c2VyLmRpc3QgaW4gcmVsYXRpb24gdG8g
c3lzdGVtLXVzZXIuZHRzaS5nZW54eHguDQo+ID4NCj4gPiBzeXN0ZW0tdXNlci5kdHNpIGlzIG1l
cmVseSBhIHdyaXRhYmxlIGZpbGUgaGFuZGxlZCBieQ0KPiA+IC4vaHR0cHM6Ly91cmxkZWZlbnNl
LmNvbS92My9fX2h0dHA6Ly9idWlsZFBldGFMaW51eC5zaF9fOyEhS25KNC0NCj4gcnA3ITFuV1Y0
bzFaMmExWW9zUm5INEdvNDJab2lkZmtvQVZ3UjA5Rkl4NF8tDQo+IDgxM0hvVXBBaHZzeGVTT3Zq
S1RReUk0QjJiZiQgIHRvIGNvcHkgdGhlIGFwcHJvcHJpYXRlIHN5c3RlbS0NCj4gdXNlci5kdHNp
Lmdlbnh4eHggdG8gdGhpcyBmaWxlbmFtZSBmb3IgdXNlIGluIHRoZSBidWlsZCBpbWFnZS4gRG8g
bm90IHB1dCB5b3VyDQo+IGRldmljZSB0cmVlIGhlcmUuIFRoZXkgYmVsb25nIHRvIHRoZSBzeXN0
ZW0tdXNlci5kdHNpLmdlbnh4eHguDQo+ID4NCj4gPiBJZiB5b3UgYWRkIGEgbmV3IGR0c2ksIHBs
ZWFzZSBjcmVhdGUgYW4gYXBwcm9wcmlhdGUgZGV2aWNlIHRyZWUgZmlsZQ0KPiA+IGFuZCBtb2Rp
ZnkgdGhlDQo+ID4gLi9odHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cDovL2J1aWxkUGV0
YUxpbnV4LnNoX187ISFLbko0LXJwNyExbg0KPiA+IFdWNG8xWjJhMVlvc1JuSDRHbzQyWm9pZGZr
b0FWd1IwOUZJeDRfLQ0KPiA4MTNIb1VwQWh2c3hlU092aktUUXlJNEIyYmYkDQo+ID4gdG8gaGFu
ZGxlIGl0ICovDQo+ID4NCj4gPiAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xrL3ZlcnNhY2xvY2su
aD4NCj4gPg0KPiA+IC9pbmNsdWRlLyAic3lzdGVtLWNvbmYuZHRzaSINCj4gPiAvIHsNCj4gPg0K
PiA+ICAgLyogQ2xvY2sgUHJvdmlkZXIgKi8NCj4gPiAgIHgzMDRfY2xrOiB4MzA0LWNsb2NrIHsN
Cj4gPiAgICAgY29tcGF0aWJsZSA9ICJmaXhlZC1jbG9jayI7DQo+ID4gICAgICNjbG9jay1jZWxs
cyA9IDwwPjsNCj4gPiAgICAgY2xvY2stZnJlcXVlbmN5ID0gPDI1MDAwMDAwPjsNCj4gPiAgIH07
DQo+ID4NCj4gPiAuLi4NCj4gPg0KPiA+ID09PT09PT09PT09PT09PT09PQ0KPiA+IERldmljZSBU
cmVlIE5vZGU6DQo+ID4gPT09PT09PT09PT09PT09PT09DQo+ID4gJmkyYzEgew0KPiA+ICAgICBj
bG9jay1mcmVxdWVuY3kgPSA8MTAwMDAwPjsNCj4gPg0KPiA+ICAgICAvLyBVc2UgcGF0Y2guICBV
cGRhdGVkIGRyaXZlciBmb3IgNXA0OXY2OTY1IGF2YWlsYWJsZSAgYXQNCj4gaHR0cHM6Ly91cmxk
ZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vZ2l0aHViLmNvbS9YaWxpbngvbGludXgtDQo+IHhsbngv
YmxvYi9tYXN0ZXIvZHJpdmVycy9jbGsvY2xrLXZlcnNhY2xvY2s1LmNfXzshIUtuSjQtDQo+IHJw
NyExbldWNG8xWjJhMVlvc1JuSDRHbzQyWm9pZGZrb0FWd1IwOUZJeDRfLQ0KPiA4MTNIb1VwQWh2
c3hlU092aktUUXg5dVFyaGwkDQo+ID4gICAgIC8vIERldmljZSBUcmVlIFNldHVwIC0+DQo+IGh0
dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2dpdGh1Yi5jb20vWGlsaW54L2xpbnV4
LQ0KPiB4bG54L2Jsb2IvbWFzdGVyL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9j
bG9jay9pZHQqMkN2ZXJzYWNsbw0KPiBjazUueWFtbF9fO0pRISFLbko0LXJwNyExbldWNG8xWjJh
MVlvc1JuSDRHbzQyWm9pZGZrb0FWd1IwOUZJeDRfLQ0KPiA4MTNIb1VwQWh2c3hlU092aktUUTMy
a1ZaYUIkDQo+ID4gICAgIHZlcnNhY2xvY2s2OiBjbG9jay1jb250cm9sbGVyQDZhIHsNCj4gPiAg
ICAgICAgIC8qIENsb2NrIENvbnN1bWVyICovDQo+ID4gICAgICAgICBjb21wYXRpYmxlID0gImlk
dCw1cDQ5djY5NjUiOw0KPiA+IAkJcmVnID0gPDB4NmE+Ow0KPiA+IAkJI2Nsb2NrLWNlbGxzID0g
PDE+Ow0KPiA+IAkJY2xvY2tzID0gPCZ4MzA0X2Nsaz47DQo+ID4gCQljbG9jay1uYW1lcyA9ICJ4
aW4iOw0KPiA+DQo+ID4gICAgICAgICBhc3NpZ25lZC1jbG9ja3MgPSA8JnZlcnNhY2xvY2s2IDE+
LA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZ2ZXJzYWNsb2NrNiAyPiwNCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgIDwmdmVyc2FjbG9jazYgMz4sDQo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICA8JnZlcnNhY2xvY2s2IDQ+Ow0KPiA+ICAgICAgICAgLy8gYXNzaWdu
ZWQtY2xvY2stcmF0ZXMgPSA8NDY4MDAwMDA+LCA8MjUwMDAwMDAwPiwgPDEwMDAwMDA+LA0KPiA8
MTMwMDAwMDA+Ow0KPiA+ICAgICAgICAgYXNzaWduZWQtY2xvY2stcmF0ZXMgPSA8NDY4MDAwMDA+
LCA8MjUwMDAwMDAwPiwgPDEwMDAwMDA+LA0KPiA8MTMwMDAwMDA+Ow0KPiA+ICAgICAgICAgLyog
U2V0IHRoZSBTRC9PRSBwaW4ncyBzZXR0aW5ncyAqLw0KPiA+ICAgICAgICAgaWR0LHNodXRkb3du
ID0gPDA+Ow0KPiA+ICAgICAgICAgaWR0LG91dHB1dC1lbmFibGUtYWN0aXZlID0gPDA+Ow0KPiAN
Cj4gSGF2ZSB5b3UgdmVyaWZpZWQgdGhhdCB0aGVzZSBhcmUgY29ycmVjdD8gRS5nLiBvbiBteSBi
b2FyZCBJIGhhZCB0byBzZXQNCj4gDQo+IGlkdCxvdXRwdXQtZW5hYmxlLWFjdGl2ZSA9IDwxPjsN
Cj4gDQo+IFlvdSBjYW4gYWxzbyByZW1vdmUgdGhlc2UgcHJvcGVydGllcyB0byB1c2UgdGhlIGRl
ZmF1bHQgdmFsdWVzIGZyb20gdGhlDQo+IE9UUC4NCj4gDQo+IC0tU2Vhbg0KDQpJIGhhdmUgcmVt
b3ZlZCBib3RoIHByb3BlcnRpZXMgYW5kIG9ic2VydmUgdGhlIHNhbWUgYmVoYXZpb3IoZGlmZmVy
ZW50aWFsIGNtb3Mgb24gb3V0cHV0IDEgYW5kIDQ2LjhNSHosIG5vIGNsb2NrIG9uIG91dHB1dCAy
KS4NCg0KLUNsYXVkZQ0KDQo+IA0KPiA+ICAgICAgICAgT1VUMSB7DQo+ID4gICAgICAgICAgICAg
aWR0LG1vZGUgPSA8VkM1X0NNT1M+Ow0KPiA+ICAgICAgICAgICAgIGlkdCx2b2x0YWdlLW1pY3Jv
dm9sdCA9IDwzMzAwMDAwPjsNCj4gPiAgICAgICAgICAgICBpZHQsc2xldy1wZXJjZW50ID0gPDEw
MD47DQo+ID4gICAgICAgICB9Ow0KPiA+ICAgICAgICAgT1VUMiB7DQo+ID4gICAgICAgICAgICAg
aWR0LG1vZGUgPSA8VkM1X0NNT1M+Ow0KPiA+ICAgICAgICAgICAgIGlkdCx2b2x0YWdlLW1pY3Jv
dm9sdCA9IDwzMzAwMDAwPjsNCj4gPiAgICAgICAgICAgICBpZHQsc2xldy1wZXJjZW50ID0gPDEw
MD47DQo+ID4gICAgICAgICB9Ow0KPiA+ICAgICAgICAgT1VUMyB7DQo+ID4gICAgICAgICAgICAg
aWR0LG1vZGUgPSA8VkM1X0NNT1NEPjsNCj4gPiAgICAgICAgICAgICBpZHQsdm9sdGFnZS1taWNy
b3ZvbHQgPSA8MzMwMDAwMD47DQo+ID4gICAgICAgICAgICAgaWR0LHNsZXctcGVyY2VudCA9IDwx
MDA+Ow0KPiA+ICAgICAgICAgfTsNCj4gPiAgICAgICAgIE9VVDQgew0KPiA+ICAgICAgICAgICAg
IGlkdCxtb2RlID0gPFZDNV9DTU9TPjsNCj4gPiAgICAgICAgICAgICBpZHQsdm9sdGFnZS1taWNy
b3ZvbHQgPSA8MzMwMDAwMD47DQo+ID4gICAgICAgICAgICAgaWR0LHNsZXctcGVyY2VudCA9IDwx
MDA+Ow0KPiA+ICAgICAgICAgfTsNCj4gPiAgICAgfTsNCgo9PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09ClRoaXMgbWVz
c2FnZSBhbmQgYW55IGF0dGFjaG1lbnRzIGFyZSBpbnRlbmRlZCBvbmx5IGZvciB0aGUgZGVzaWdu
YXRlZCByZWNpcGllbnQocykgYW5kIG1heSBjb250YWluIGNvbmZpZGVudGlhbCBvciBwcm9wcmll
dGFyeSBpbmZvcm1hdGlvbiBhbmQgYmUgc3ViamVjdCB0byB0aGUgYXR0b3JuZXktY2xpZW50IHBy
aXZpbGVnZSBvciBvdGhlciBjb25maWRlbnRpYWxpdHkgcHJvdGVjdGlvbnMuICBJZiB5b3UgYXJl
IG5vdCBhIGRlc2lnbmF0ZWQgcmVjaXBpZW50LCB5b3UgbWF5IG5vdCByZXZpZXcsIHVzZSwgY29w
eSBvciBkaXN0cmlidXRlIHRoaXMgbWVzc2FnZSBvciBhbnkgYXR0YWNobWVudHMuICBJZiB5b3Ug
cmVjZWl2ZWQgdGhpcyBlbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGJ5
IHJlcGx5IGUtbWFpbCBhbmQgcGVybWFuZW50bHkgZGVsZXRlIHRoZSBvcmlnaW5hbCBhbmQgYW55
IGNvcGllcyBvZiB0aGlzIG1lc3NhZ2UgYW5kIGFueSBhdHRhY2htZW50cyB0aGVyZXRvLiAgVGhh
bmsgeW91Lgo=
