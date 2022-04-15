Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23033C433EF
	for <linux-clk@archiver.kernel.org>; Fri, 15 Apr 2022 14:27:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354419AbiDOO3f (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Apr 2022 10:29:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351334AbiDOO3d (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Apr 2022 10:29:33 -0400
Received: from mx0b-00369f01.pphosted.com (mx0b-00369f01.pphosted.com [148.163.139.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 166AF193C2
        for <linux-clk@vger.kernel.org>; Fri, 15 Apr 2022 07:26:58 -0700 (PDT)
Received: from pps.filterd (m0167463.ppops.net [127.0.0.1])
        by mx0b-00369f01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23FAVjWi006635;
        Fri, 15 Apr 2022 10:26:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mksinst.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to :
 content-transfer-encoding : mime-version : content-type; s=podFeb2021;
 bh=KnhLQnoB9RumMHfxCa/7ssuhEadHz3LyJpehsAL+J4U=;
 b=QDqxT0zY4uEfT2me3vb8rJLLPtI641BX0edEVmAICxt6ghCioSuibLEhStuonwXsXW/h
 HISwvnyusmipYS172zgUBxAsv1u2MSsXmMCXw1ILfnHs9DbLD727qM+G2e1PmoVJwuNB
 53iF5r6fVDLItN4f4eYsiA1gY1ZNJ7W3x0LQqHVRMZCd31XN1fDPY68zKU/yr8iNkKKy
 eQhq5yvx4Ymq/++wP5UdfjA47wM5+rtzFzZ59JU+VoQFzDgH2j9QgNDZsIRg1c11Qj1Q
 4zeM75jTokKr7BWYbsRkD3J3Qi8m+Cz+ZWtgjcxB8BlUXNloVkc56MmSO6KnbCv11UgO +g== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
        by mx0b-00369f01.pphosted.com (PPS) with ESMTPS id 3ff2udhfpq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 15 Apr 2022 10:26:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UMTcKGVaYSMeDex4aWcvudj0bvMh6+N/85xex0qWIL99rqQkhfSLYnX7oUlCPhbgjaYdCzrEnpOg3UrkbhXzWKatxgjUeTEa0WNvyf3iDob4jbvePYpcN4xtSywEVF/cWfqxU9eq9XggrZDVfJlfX8xIqbWUkn6p7gT1PBSGaQ9GJ71+9MuZHL80k6OmkGqV0MI/XeltRXgAomw8GCSbbQg6o6Nh7i/tVAZuPAARyzPZ3h6rUST/dFpXLUOi93/DHugcyaCfF9qsJGEQhB57Tc/JBe2tGgv4xVHswiPeeVCihm3iVmi+kPEwS0a1pHSnvBoYMRnJXq7ZjcBrqjkRzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G/PDdzZx7wLW+KJkklZmIhB7JWEt/+QRTiap9DNokzA=;
 b=dn+txBoT6VaAsFIeeV4sBO8wsxiBAiBfSCYbq2GVS7R1uaidK7K7miYwjw1upJLWLfGSfWgHQ4Mx31/mz7sX3w/pRWybuvORMjCYxQaLJSo2T3acVCQvdpu6UHZWsczUMumjVXM1XhO8a3I6QRjRjQw7XWMiadH/9ZSaFGc5zQyrPl+AvnuRmwazkpXhs06pgTBFafedOP+bW8eVdz0ueFvK7PjhkklZzr2OOL/3YqsZAI98+Zwm0Q+7oUI7k83E7JTjwsXNQo3Dy1yYQb9QAx5CRyuTD/B8hD7O4DvUG9aVW7h/ztw8m842EuU3aaEb+inMYcxNUAYOyAQailR3wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mksinst.com; dmarc=pass action=none header.from=mksinst.com;
 dkim=pass header.d=mksinst.com; arc=none
Received: from MN2PR03MB5008.namprd03.prod.outlook.com (2603:10b6:208:1ac::24)
 by BYAPR03MB4117.namprd03.prod.outlook.com (2603:10b6:a03:7e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Fri, 15 Apr
 2022 14:26:45 +0000
Received: from MN2PR03MB5008.namprd03.prod.outlook.com
 ([fe80::5d5b:da70:341e:17af]) by MN2PR03MB5008.namprd03.prod.outlook.com
 ([fe80::5d5b:da70:341e:17af%4]) with mapi id 15.20.5164.020; Fri, 15 Apr 2022
 14:26:45 +0000
From:   "Fillion, Claude" <Claude.Fillion@mksinst.com>
To:     Luca Ceresoli <luca@lucaceresoli.net>,
        Adam Ford <aford173@gmail.com>
CC:     Sean Anderson <sean.anderson@seco.com>,
        linux-clk <linux-clk@vger.kernel.org>
Subject: RE: [EXTERNAL] Re: Questions regarding regarding idt/renesas
 versaclock5 driver
Thread-Topic: [EXTERNAL] Re: Questions regarding regarding idt/renesas
 versaclock5 driver
Thread-Index: Adgsn5PPBaqTu/AxTlmRjOlUu8xbbwAHTV6AAAIztgAACrX3gAAgAxSwAAIUYgAAAPDp8AAHZO8AACleenAAAzsYAAPG+cYQACdYpwAACKJjkASJ8x4AABvXxHA=
Date:   Fri, 15 Apr 2022 14:26:44 +0000
Message-ID: <MN2PR03MB5008D8635D692004D357E8C293EE9@MN2PR03MB5008.namprd03.prod.outlook.com>
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
 <MN2PR03MB50085D86CF1C1CC89FD74E0993179@MN2PR03MB5008.namprd03.prod.outlook.com>
 <732f0618-43a3-50cc-7afa-d3eb0c5466fd@lucaceresoli.net>
In-Reply-To: <732f0618-43a3-50cc-7afa-d3eb0c5466fd@lucaceresoli.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4c5aa4e4-31db-48cf-ce7a-08da1eebf7d6
x-ms-traffictypediagnostic: BYAPR03MB4117:EE_
x-microsoft-antispam-prvs: <BYAPR03MB411783FF9A01FD9BE5B118AE93EE9@BYAPR03MB4117.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SrHbxzNU3ZOyLQxX+7yXkDL9mDTaSRXvjuUbDVBS/il03Z4rBNFF+DFbrtRxzRsmznMQKCLfbKq4AzqglXGUrSNZ6+qB6ih9a1F1wFnZ0ly8V8cJoG8g2MSCsA2PLqe+gcH4IiBe9/c8jIV/0zPER8NZ6V6X6EaOEakp0eBPqClWYgwXrNQiHnQDYqdjiV90QZmK3vU0ZlQUeAvGeJs0VLQgK69IWH/ZhP3l6841j7YkfOfAvvpmIFnPre2SHzC6lXHcpHFvKJd8XC77PS6b4u3zA/56rHKzGUGhZIXP0GcteeWquMhwLPzM97NP70M82uBOHc4QPRBYCymtnKwsmi8YrqjoTJHCEl852phK9o7tkerdrFYpzpwC6209RcACYhDJgJMpfv2LKMCIOUXyFSxbb8AMCGfVeePcT9dRiJ9flbjuNaj2HFZ18o1RASfYZmuV/zDIiONlR6zVKTb/F1bOzEpbt+2xgnnyuMXCcp1QBttvS265hYg1U6/yKdsNNev7gL1R/gZb9KeTEGtP4EvZw5+n+viUZrGphuglMXK/7A6G+F/WCD3VT68gUKj6ObHnMPvkDvXTWnYq4rFiX88OOEFa/of0q33UQiXi/KIaMQ9tr5zrwmCpSWniE0kn3g7lCEgyzynJvbWSOtWj8qg98hybOrzCRMk8ICmP9A5GuoLiT9gMAWrhEJBq56Vs36pbBi9flXa+7orDGT0fkZRtpJifcQFiQVoNlJuSyUD0Lu9+cAWtH86JpZ30lp9zmTrR6KKCBpW/MbIEDhswEWfD0syNQk3TZhu8h7lu3ls=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR03MB5008.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(7696005)(6506007)(9686003)(966005)(53546011)(8676002)(508600001)(33656002)(122000001)(38100700002)(26005)(186003)(54906003)(52536014)(110136005)(83380400001)(66556008)(64756008)(66446008)(66946007)(66476007)(4326008)(8936002)(76116006)(2906002)(38070700005)(71200400001)(5660300002)(55016003)(86362001)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cFJEWW5YbkM2eGNvZGwyZDBsL2gzWXJ6d0E3WEYyam01clVUUlhuU1ZUaEZI?=
 =?utf-8?B?c2xSWG9MdmtPL3RUOWNNS1kxUS96Y3UxOCtGRndJSDNROEdPYnYwcXVrRHJu?=
 =?utf-8?B?RmR0YjdTWGdZSEdBOUl0elB3ejg5RFlTWlcvemdFTDN4SzNoVXZoNjZOU3FR?=
 =?utf-8?B?QWlKMmJubVEvSDhmdUx1aUcyQWRQVjM1OUNqWW9MOWhtb2lPSCtIV1RobW5F?=
 =?utf-8?B?Zyt3UlBMNkUyMTFFeEZ6NVRja2VmZFVwb3JmZWVsQW93RkZNaTJnMzh2bmJB?=
 =?utf-8?B?TFNjYVNENkdPaFpqL1JlTHpwbEVNeGZNUDU5WVh1UEJxOVZ3WFExbkxKMEVC?=
 =?utf-8?B?Z1VwVVlyWjY0OERYNFFPV2JrS28yYW9rUlpsUlNFUHFoWkZFU1JKRVJOazlR?=
 =?utf-8?B?akExeUZEclNUYWV0dGVkU2FZWk1yajdxay83L3VUSUxWWjlHNmRiOE9uV3Vn?=
 =?utf-8?B?WjFLOTRXL0VQVWhFUlBET3c3aXhXV2QweXptM3BjaWFRNjRycHQ1REJDRVR6?=
 =?utf-8?B?QmRhaWZKYmpROFBnZVprMjlxZWx6Z05uVHA2K1o2YWl6NFg4Z1J5aEVqd3hz?=
 =?utf-8?B?NlVxeDlPQW4yNVk0ZGlnTW9qVUxwVGVMc3IxSDdYa0dlMmFrc3RwUTRBdE9v?=
 =?utf-8?B?N0hVM3p4cnhMNVVKaXQrR1JRV2tEVkczQ25PK0puZmRrK2o3M2I5TjVaSitl?=
 =?utf-8?B?ZjJLd0hsTFhhM3plMVBoSEFYcEl0eGV4YUdPVHhOR2ZjS2dDMjNXUHNMeG9W?=
 =?utf-8?B?L0RXUUlXWng3dFM0Q0kwUi91T1haK1JMNGhBL0x0RmtzU2J5TDZkaHI2VmhL?=
 =?utf-8?B?SmsrU2h5UWluWnAvd08weUpTVlFQU2pUZFFsQVVnTENBY0hVNmx1K2crUDB1?=
 =?utf-8?B?dW10ZDFDNU14K3JqeFRwYm4wYjF0M3RzMFhmRDNUYlYwOCtvL1Z5aEFkRmY0?=
 =?utf-8?B?a0dRd0JiQW81QUJFaWxsVFJWclBlTmh3UjEyMEtoTldEb2xZYlZta29kc1Bn?=
 =?utf-8?B?TUJpVmZDcU5HL0FRY2loamJrSFBBL2Radk1OeEtYTFR1ZmlLYmF3ODR6RXps?=
 =?utf-8?B?RTV0Zjh5SENNUkhtbzJVdVFQalpOZG5EM3FhTWpodEdPdHhlY0FxZ3lGcDBI?=
 =?utf-8?B?QXlsQUVWZk9velhhd09JdnRMVDJMMHBxZVFLTkcxWDE4V1NNSkhqcDZSc1g3?=
 =?utf-8?B?Z1U2eWtiRHdMdEFXUlBvbG5kWm1LaGV4cEwrWDIxSFFMbXI0cDVPZTJpanpG?=
 =?utf-8?B?UlQ0eFJyOVhTN1dPa2Mwa2tBOE5BZWN6RXY4c0VaSDRVck8xRzlaNlhzVTNY?=
 =?utf-8?B?a3phT2tpSnZtOUx3TFd1N3Z0WFNHWkk1SnFRb1ZSdk4xbitPSlpIWldlajJl?=
 =?utf-8?B?VlZEWWZDNnJFZHdXZjY1MWtwMGJQRm5zOXo0RE5ydThoOHFjUytDSmV5Tnow?=
 =?utf-8?B?VUhMcnFibzdMOURzZTdoQk1HK3ExWWpjTGpWQXNqS0hhTUNYb3Y5UXFDSlpn?=
 =?utf-8?B?ZGl3K1BodEVuTkRxY0ZqYXNXM0dDaytQTjNkUTNEQ3NFS1dEcGlQTWdxdE5W?=
 =?utf-8?B?WW5iMnhEbTRuWWlmRE4wMTdHSk1wT3VSeUlQcWVGQTYzS284Mm84UmFvTUdC?=
 =?utf-8?B?cWNEN0dHMTNPdjVNMkRoSjYwYlpkQ3NZQzkyTWwrNy9XaVQyd2dKTHpxdXc3?=
 =?utf-8?B?U3c1eVZwMnhPV3F2Nm1sNWlwYzEzTkpJQnVsK3dreVhIN2RIempjSlVnbnF0?=
 =?utf-8?B?dkxwcmhVMkRYTmFtTzN0bG9OTk1ER3htK0J2UEVzaFE2ZGxCb29sZThFTFFi?=
 =?utf-8?B?SDhDaDZTWmZGdlpCWGpOdDEyejZYUEtpWEt5NDdzMVlwT0J4K1g5VGNueTJD?=
 =?utf-8?B?YTZQVzdTaWZVZVJySEZOY3piUGdTY0drbjhQZHkrc1VNVjl4am13b2c5d1Vw?=
 =?utf-8?B?bTU0azY0QVNnbUR4OW5rYVp6YlNVSFZTS245L3M5UC9tbDlSckdBODNnZjZF?=
 =?utf-8?B?ZWpKL1dNU215UVdia0xwUGNNZjhjZjhqdjNKSGJ2SE5LZnh0OVNDMTJid1VR?=
 =?utf-8?B?cFVaZjVSN0RTYXZ2Vkd1YUVoUWlSenBJVUZsNEMrLzd1b29iNG5aSlJGenlr?=
 =?utf-8?B?UjdKQ2pjVTlrdWQ4V2UwdCt1QllodmpBVTVLS25MR2hxb2tWdHpmNFZUdnk3?=
 =?utf-8?B?OTBLbk5NYnRTdEY2SEpnMXQ1ekVGK0JyU1UzMXdjNndhYVFMNmdhYUc5QmJu?=
 =?utf-8?B?OFpQWTUrcmZmSjdRSlpnM1NkZFRjRDdHU0c2cVpTeUJNQkdKYkZBRjlvNkth?=
 =?utf-8?B?cmdPZTZ2WlVOd0Q0TS9vTTM1VnQ0OW5ZNFFSL2pjcjhRRk40OVdHZz09?=
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mksinst.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR03MB5008.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c5aa4e4-31db-48cf-ce7a-08da1eebf7d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2022 14:26:44.9919
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34fc6b5f-c773-4cad-ae20-f226c36b7e65
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D5hlNJvFm15hh8TXtj6Qo80jgcWpRCuY0UyxshRAiiUaLctAQjEQda+tnF7XomxXbMJvfXcaxPXjwIxkyNcpYqp8yxPe223efSz40zXgg7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4117
X-Proofpoint-GUID: F_aaHXcd7XxyA2u1IxDY3ts2Wut2o5bL
X-Proofpoint-ORIG-GUID: F_aaHXcd7XxyA2u1IxDY3ts2Wut2o5bL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-15_05,2022-04-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 clxscore=1011
 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204150085
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SGVsbG8gTHVjYSwNCg0KTm8gcHJvYmxlbSBvbiB0aGUgZGVsYXllZCByZXNwb25zZS4gIEkgZW5k
ZWQgdXAgd29ya2luZyBmcm9tIHRoaXMgcGF0Y2goIGh0dHBzOi8vbGttbC5pdS5lZHUvaHlwZXJt
YWlsL2xpbnV4L2tlcm5lbC8xMzA1LjEvMDE4OTMuaHRtbCkgdGhhdCBwcm92aWRlcyB0aGUgdHlw
ZSBvZiB1c2Vyc3BhY2UgYWNjZXNzIHdlIHdlcmUgbG9va2luZyBmb3IuICBBbGxvd3MgdXMgdG8g
cmVhZCBhIGNvbmZpZyBmaWxlIGFuZCB1cGRhdGUgY2xvY2sgZnJlcXVlbmNpZXMgYXMgcGFydCBv
ZiBvdXIgYm9vdCBwcm9jZXNzLiAgIE5vdCBhY2Nlc3NpYmxlIHRvIHVzZXJzLCBzZWVtcyB0byBi
ZSB3b3JraW5nIHdlbGwgZm9yIG91ciBhcHBsaWNhdGlvbi4gIA0KDQpUaGFua3MgYWdhaW4gZm9y
IHlvdXIgaGVscCB0aHJvdWdob3V0IG15IGxlYXJuaW5nIHByb2Nlc3MuDQoNCi1DbGF1ZGUNCg0K
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMdWNhIENlcmVzb2xpIDxsdWNh
QGx1Y2FjZXJlc29saS5uZXQ+DQo+IFNlbnQ6IFRodXJzZGF5LCBBcHJpbCAxNCwgMjAyMiA2OjM3
IFBNDQo+IFRvOiBGaWxsaW9uLCBDbGF1ZGUgPENsYXVkZS5GaWxsaW9uQG1rc2luc3QuY29tPjsg
QWRhbSBGb3JkDQo+IDxhZm9yZDE3M0BnbWFpbC5jb20+DQo+IENjOiBTZWFuIEFuZGVyc29uIDxz
ZWFuLmFuZGVyc29uQHNlY28uY29tPjsgbGludXgtY2xrIDxsaW51eC0NCj4gY2xrQHZnZXIua2Vy
bmVsLm9yZz4NCj4gU3ViamVjdDogUmU6IFtFWFRFUk5BTF0gUmU6IFF1ZXN0aW9ucyByZWdhcmRp
bmcgcmVnYXJkaW5nIGlkdC9yZW5lc2FzDQo+IHZlcnNhY2xvY2s1IGRyaXZlcg0KPiANCj4gSGVs
bG8gQ2xhdWRlLA0KPiANCj4gYXBvbG9naWVzIGZvciB0aGUgZXh0cmVtZWx5IGRlbGF5ZWQgcmVw
bHkuLi4NCj4gDQo+IE9uIDIyLzAzLzIyIDIxOjA5LCBGaWxsaW9uLCBDbGF1ZGUgd3JvdGU6DQo+
ID4+PiBGb3IgbXkgYXBwbGljYXRpb24gSSB3b3VsZCBsaWtlIHRoZSBhYmlsaXR5IHRvIHNldCBj
bG9jayBmcmVxdWVuY2llcw0KPiA+Pj4gYWNjb3JkaW5nDQo+ID4+IHRvIHZhbHVlcyB0aGF0IGFy
ZSBzdG9yZWQgaW4gYSBqc29uIGZvcm1hdHRlZCBjb25maWcgZmlsZS4gSXMgdGhlcmUgYQ0KPiA+
PiB3YXkgdG8gY2hhbmdlIHRoZXNlIHZhbHVlcyBmcm9tIHVzZXIgc3BhY2UgYXBwIGNvZGU/ICBJ
ZiBub3QsIHdvdWxkDQo+ID4+IGl0IGJlIG9rIHRvIGFkZCBjb2RlIHRvIG15IGNvbnN1bWVyIGRy
aXZlciAoc2F5IGluIHRoZSBwcm9iZSBtZXRob2QpDQo+ID4+IHRoYXQgd291bGQgcmVhZCB0aGUg
dmFsdWVzIGZyb20gdGhlIGpzb24gYW5kIHRoZW4gY2FsbCBzZXRfcmF0ZSgpIGFuZA0KPiBwcmVw
YXJlX2VuYWJsZSgpKSA/DQo+ID4+DQo+ID4+IFRoaXMgaXMgYWJzb2x1dGVseSBub3QgYSBzdGFu
ZGFyZCBwcmFjdGljZSBpbiB0aGUga2VybmVsLiBJZiBkcml2ZXJzDQo+ID4+IGFyZSB3ZWxsIHdy
aXR0ZW4gdGhlbiBhIGNvbnN1bWVyIGRyaXZlciBrbm93cyB3aGljaCBjbG9jayBpdCBuZWVkcywN
Cj4gPj4gaXQgd2lsbCBhc2sgdGhlIHByb2R1Y2VkIHRoYXQgZnJlcXVlbmN5IGFuZCBjb25maWd1
cmUgdGhlIGNvbnN1bWVyDQo+IGRldmljZSBhY2NvcmRpbmdseS4NCj4gPj4NCj4gPj4gRS5nLiBp
ZiB0aGUgY29uc3VtZXIgZGV2aWNlIGlzIGFuIGF1ZGlvIGNvZGVjIHRoZW4gdXNlciBzcGFjZSB3
aWxsDQo+ID4+IG5ldmVyIHNheSAiSSB3YW50IHlvdSB0byBhc2sgZm9yIGEgMSBNSHogY2xvY2si
IGJ1dCByYXRoZXIgIkkgd2FudCB0bw0KPiA+PiBwbGF5YmFjayBhdCA0OCBrSHoiLCB0aGVuIHRo
ZSBkcml2ZXIgd2lsbCBhc2sgZm9yIGEgZ2l2ZW4gY2xvY2sNCj4gPj4gZnJlcXVlbmN5IGFuZCBj
b25maWd1cmUgdGhlIGNvZGVjIHRvIHVzZSBpdCwgcGVyaGFwcyBzZXR0aW5nDQo+IGRpdmlzb3Iv
bXVsdGlwbGllciByZWdpc3RlcnMgZXRjLg0KPiA+Pg0KPiA+PiBTbyBJIHJlYWxseSBzdWdnZXN0
IHlvdSB0byB1bmRlcnN0YW5kIHdoYXQgdGhlIGNvcnJlY3QNCj4gPj4ga2VybmVsLXVzZXJzcGFj
ZSBpbnRlcmZhY2Ugd291bGQgYmUgZm9yIHlvdXIgY29uc3VtZXIgZHJpdmVyLiBJZiB5b3UNCj4g
Pj4gd2FudCB5b3UgY2FuIHNoYXJlIHdoYXQgdGhlIGNvbnN1bWVyIGRldmljZSBpcyBzbyB3ZSBj
YW4gYmUgZ2l2ZSBzb21lDQo+IHN1Z2dlc3Rpb25zLg0KPiA+Pg0KPiA+PiBUaGF0IHNhaWQsIGlm
IHlvdSBkb24ndCB3YW50IHRvIG1haW5saW5lIHlvdXIgY29uc3VtZXIgZHJpdmVyIG5vYm9keQ0K
PiA+PiB3aWxsIHByZXZlbnQgeW91IGZyb20gZG9pbmcgYW55dGhpbmcgInN0cmFuZ2UiLiBCdXQg
a2VlcCBpdCBsaW1pdGVkDQo+ID4+IHRvIHlvdXIgZHJpdmVyLCB5b3UgZG9uJ3Qgd2FudCB0byBo
YXZlIGNvbmZsaWN0cyBpbiB0aGUgdmVyc2FjbG9jaw0KPiA+PiBjb2RlIHdoZW4geW91IHVwZ3Jh
ZGUgdG8gYSBtb3JlIHJlY2VudCBrZXJuZWwuDQo+ID4+DQo+ID4+IEFsc28sIEkgZG9uJ3QgdGhp
bmsganNvbiBpcyBleHBlY3RlZCB0byBiZSBpbiB0aGUga2VybmVsLiBJZiB5b3Ugd2FudA0KPiA+
PiB0byBkbyBzb21ldGhpbmcgbGlrZSB0aGF0IHRoZW4gbWF5YmUgcGFyc2UganNvbiBhdCB1c2Vy
c3BhY2UgbGV2ZWwNCj4gPj4gYW5kIHRoZW4gc2VuZCBqdXN0IHRoZSBmcmVxdWVuY3kgaW4gSHog
dmlhIGEgc3lzZnMgZW50cnkuDQo+ID4+DQo+ID4+IC0tDQo+ID4+IEx1Y2ENCj4gPg0KPiA+IEhl
bGxvIEx1Y2EsDQo+ID4gVGhhbmsgeW91IGZvciByZXNwb25kaW5nLiAgSSB3aWxsIGF0dGVtcHQg
dG8gcHJvdmlkZSBhIGxpdHRsZSBtb3JlIGRldGFpbCBvbg0KPiBvdXIgdXNlIGNhc2UuICBPdXIg
cHJvZHVjdHMgZG8gYSBmYWlyIGFtb3VudCBvZiBzaWduYWwgcHJvY2Vzc2luZywgYm90aCBpbg0K
PiB0cmFuc21pdHRpbmcgYW5kIHJlY2VpdmluZyBjaGFpbnMuIFRoZSBjbG9ja3Mgd2Ugd291bGQg
bGlrZSB0byBhZGp1c3QgY29udHJvbA0KPiBBREMgYW5kIERBQyBzYW1wbGUgcmF0ZXMuICBUaGVz
ZSByYXRlcyBkbyBub3QgY2hhbmdlIGZyZXF1ZW50bHksIGJ1dA0KPiBkZXBlbmRpbmcgb24gcGFy
dGljdWxhciBmZWF0dXJlcyB3ZSBlbmFibGUgb3Igb24gY29uZGl0aW9ucyB0aGF0IGFyZSBzcGVj
aWZpYw0KPiB0byBhIGNlcnRhaW4gY3VzdG9tZXIgdGhlcmUgd2lsbCBiZSB0aW1lcyB3aGVyZSB3
ZSB3aWxsIG5lZWQgdG8gY2hhbmdlDQo+IHNhbXBsZSByYXRlcy4gT3VyIHByb2R1Y3RzIGhhdmUg
YW4gZXh0ZW5zaXZlIHNldCBvZiBjb25maWd1cmF0aW9uDQo+IHBhcmFtZXRlcnMgY29udGFpbmVk
IGluIGpzb24gZmlsZXMgdGhhdCBjb250cm9sIG1hbnkgZGV0YWlscyBvZiBvdXIgc2lnbmFsDQo+
IHByb2Nlc3NpbmcgY2hhaW5zLiAgSWRlYWxseSB3ZSB3b3VsZCBsaWtlIHRvIGFkZCB0aGUgYWJp
bGl0eSB0byBnZXQvc2V0IGNsb2NrDQo+IHJhdGVzIHRocm91Z2ggdGhpcyBtZWNoYW5pc20uDQo+
ID4NCj4gPiBXaGVuIGNoYW5naW5nIGZyZXF1ZW5jeSB3ZSBleHBlY3QgdG8gcmVib290IHRoZSBk
ZXZpY2UsIGJ1dCB3b3VsZCBsaWtlDQo+IHRvIGF2b2lkIHJlYnVpbGRpbmcvZGlzdHJpYnV0aW5n
IG5ldyBjb2RlLiAgRXNzZW50aWFsbHkgIDEgY29kZSBwYWNrYWdlLA0KPiBjb25maWd1cmVkIG11
bHRpcGxlIGRpZmZlcmVudCB3YXlzLg0KPiA+DQo+ID4gVGhlIGlkZWEgb2YgcGFyc2luZyBqc29u
IGF0IHVzZXJzcGFjZSBhbmQganVzdCBzZW5kaW5nIHRoZSBmcmVxdWVuY3kgaW4gSHoNCj4gdmlh
IGEgc3lzZnMgZW50cnkgc2VlbXMgYXBwZWFsaW5nLiBJIHRob3VnaHQgSSB3b3VsZCBuZWVkIHRv
IGNhbGwgdGhlDQo+IHNldF9yYXRlKCkgbWV0aG9kIG9mIHRoZSBkcml2ZXIgaW4gb3JkZXIgdG8g
Y2hhbmdlIGZyZXF1ZW5jeS4gIElmIGl0IGlzIG5vdCB0b28NCj4gbXVjaCB0cm91YmxlIGNhbiB5
b3UgZXhwbGFpbiBob3cgSSBjb3VsZCBjaGFuZ2UgZnJlcXVlbmN5IHZpYSBzeXNmcyBjYWxsPw0K
PiA+DQo+ID4gVGhpcyBpcyB3aGF0IEkgc2VlIG9uIHRoZSBkZXZpY2UgaW4gL3N5czoNCj4gPiAg
ICAgICByb290QENMQVVERTovc3lzL2NsYXNzL2kyYy1kZXYvaTJjLTEvZGV2aWNlLzEtMDA2YSMg
bHMNCj4gPiAgICAgICBkcml2ZXIgICAgIG1vZGFsaWFzICAgbmFtZSAgICAgICBvZl9ub2RlICAg
IHBvd2VyICAgICAgc3Vic3lzdGVtICB1ZXZlbnQNCj4gPg0KPiA+IEZyb20gdGhpcyBJIGFtIG5v
dCBjbGVhciBvbiBob3cgdG8gc2V0IGZyZXF1ZW5jeS4NCj4gDQo+IFlvdSBjYW4ndCBjaGFuZ2Ug
dGhlIGZyZXF1ZW5jeSB1c2luZyB0aG9zZSBzeXNmcyBpbnRlcmZhY2VzLiBUaGlzIGlzIGJlY2F1
c2UNCj4geW91IGFyZSBub3Qgc3VwcG9zZWQgdG8gY2hhbmdlIGEgZnJlcXVlbmN5IGZyb20gdXNl
cnNwYWNlLg0KPiANCj4gVGhlIHJlYXNvbiBpcyB0aGF0IGEgY2xvY2sgaXMgbm90IGdlbmVyYWxs
eSBzdXBwb3NlZCB0byBiZSB1c2VkIHBlciBzZSwgYnV0DQo+IHJhdGhlciB0byBiZSBjb25zdW1l
ZCBieSBhbm90aGVyIGRldmljZSAoaGVuY2UgdGhlIG5hbWUgImNvbnN1bWVyDQo+IGRyaXZlciIp
LiBTZSBteSBleGFtcGxlIGFib3V0IGFuIGF1ZGlvIGNvZGVjLg0KPiANCj4gR2l2ZW4gdGhlIHVz
ZSBjYXNlIHRoYXQgeW91IGJyb2FkbHkgZGVzY3JpYmVkIGl0IGxvb2tzIGxpa2UgeW91IG5lZWQg
b25lIG9yDQo+IGFub3RoZXIgY2xvY2sgZnJlcXVlbmN5IGJhc2VkIG9uIHNvbWUgZmVhdHVyZXMg
dGhhdCB0aGUgY29uc3VtZXIgZGV2aWNlDQo+IGNhbiBvcHRpb25hbGx5IGRlbGl2ZXIuIEUuZy4g
aXMgeW91IGVuYWJsZSBmZWF0dXJlIGZvbyB0aGVuIGl0IHdpbGwgbmVlZCBhIGZhc3Rlcg0KPiBj
bG9jayBmb3IgdGhlIGV4dHJhIHByb2Nlc3NpbmcuIElmIGl0IGlzIHRoZSBjYXNlIHRoZW4gYSBw
cm9wZXIgd2F5IGlzIHByb2JhYmx5DQo+IHRvIHdyaXRlIHlvdXIgY29uc3VtZXIgZHJpdmVyIHRv
IHJlcXVlc3QgdGhlIGNsb2NrIGl0IG5lZWRzIGJhc2VkIG9uIHRoZQ0KPiBlbmFibGVkIGZlYXR1
cmVzOg0KPiANCj4gICBjbGtfc2V0X3JhdGUoY2xrLCBmZWF0dXJlX2Zvb19pc19lbmFibGVkID8g
MjAwMDAwMCA6IDEwMDAwMDApOw0KPiANCj4gRG9lcyBpdCBtYWtlIHNlbnNlPw0KPiANCj4gLS0N
Cj4gTHVjYQ0KCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT0KVGhpcyBtZXNzYWdlIGFuZCBhbnkgYXR0YWNobWVudHMg
YXJlIGludGVuZGVkIG9ubHkgZm9yIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKSBhbmQgbWF5
IGNvbnRhaW4gY29uZmlkZW50aWFsIG9yIHByb3ByaWV0YXJ5IGluZm9ybWF0aW9uIGFuZCBiZSBz
dWJqZWN0IHRvIHRoZSBhdHRvcm5leS1jbGllbnQgcHJpdmlsZWdlIG9yIG90aGVyIGNvbmZpZGVu
dGlhbGl0eSBwcm90ZWN0aW9ucy4gIElmIHlvdSBhcmUgbm90IGEgZGVzaWduYXRlZCByZWNpcGll
bnQsIHlvdSBtYXkgbm90IHJldmlldywgdXNlLCBjb3B5IG9yIGRpc3RyaWJ1dGUgdGhpcyBtZXNz
YWdlIG9yIGFueSBhdHRhY2htZW50cy4gIElmIHlvdSByZWNlaXZlZCB0aGlzIGVtYWlsIGluIGVy
cm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgYnkgcmVwbHkgZS1tYWlsIGFuZCBwZXJtYW5l
bnRseSBkZWxldGUgdGhlIG9yaWdpbmFsIGFuZCBhbnkgY29waWVzIG9mIHRoaXMgbWVzc2FnZSBh
bmQgYW55IGF0dGFjaG1lbnRzIHRoZXJldG8uICBUaGFuayB5b3UuCg==
