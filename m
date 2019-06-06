Return-Path: <SRS0=srpp=UF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00C40C04AB5
	for <linux-clk@archiver.kernel.org>; Thu,  6 Jun 2019 17:55:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C410A2083E
	for <linux-clk@archiver.kernel.org>; Thu,  6 Jun 2019 17:55:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="hHiAlWxu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729057AbfFFRzs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 6 Jun 2019 13:55:48 -0400
Received: from mail-eopbgr30081.outbound.protection.outlook.com ([40.107.3.81]:3751
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728762AbfFFRzs (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 6 Jun 2019 13:55:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vL6LEi+j7kRf+uqSbQGGm0o+TqDAFK2Ca/9cdcZL64E=;
 b=hHiAlWxuAufqq7dGeKlqjB5cCEnVlE94t0YExMp2onQZZRevJAaNs9WMsDpzc0Fytftov01nHA3odDTdx5nv1uX2XBDR+aZiq+hrNSwSCk+XV412r4CjooxHPNVLsIsMtIT87Wtk8S3owTZo0gLNQ+4+MSfOr1JLLvfXADVl3kc=
Received: from VI1PR04MB5055.eurprd04.prod.outlook.com (20.177.50.140) by
 VI1PR04MB5519.eurprd04.prod.outlook.com (20.178.122.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Thu, 6 Jun 2019 17:55:44 +0000
Received: from VI1PR04MB5055.eurprd04.prod.outlook.com
 ([fe80::9577:379c:2078:19a1]) by VI1PR04MB5055.eurprd04.prod.outlook.com
 ([fe80::9577:379c:2078:19a1%7]) with mapi id 15.20.1965.011; Thu, 6 Jun 2019
 17:55:44 +0000
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>
CC:     Fabio Estevam <festevam@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Anson Huang <anson.huang@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH] clk: imx8qxp: Use devm_platform_ioremap_resource()
Thread-Topic: [PATCH] clk: imx8qxp: Use devm_platform_ioremap_resource()
Thread-Index: AQHVHIcxHWmfkvAr/EuXpTcQK96tVA==
Date:   Thu, 6 Jun 2019 17:55:44 +0000
Message-ID: <VI1PR04MB5055663AF82B651E9E3E36AFEE170@VI1PR04MB5055.eurprd04.prod.outlook.com>
References: <20190606164443.6991-1-festevam@gmail.com>
 <20190606165546.6675520693@mail.kernel.org>
 <VI1PR04MB5055C4B288BC19F6E1EF9D65EE170@VI1PR04MB5055.eurprd04.prod.outlook.com>
 <20190606172210.7B3F82083E@mail.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leonard.crestez@nxp.com; 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bce64a41-53b8-4565-f79d-08d6eaa832ab
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB5519;
x-ms-traffictypediagnostic: VI1PR04MB5519:
x-microsoft-antispam-prvs: <VI1PR04MB5519BCBFFFE4317B1C6398D4EE170@VI1PR04MB5519.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 00603B7EEF
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(189003)(199004)(66476007)(66946007)(66556008)(86362001)(64756008)(6916009)(66446008)(2906002)(7736002)(305945005)(73956011)(6246003)(3846002)(54906003)(6116002)(76116006)(26005)(74316002)(186003)(66066001)(14454004)(4326008)(71190400001)(25786009)(71200400001)(498600001)(53936002)(256004)(52536014)(102836004)(44832011)(229853002)(486006)(76176011)(99286004)(81156014)(53546011)(7696005)(33656002)(6506007)(6436002)(55016002)(8936002)(476003)(446003)(81166006)(5660300002)(8676002)(9686003)(68736007)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5519;H:VI1PR04MB5055.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mM7mQYeLVaTCazFL5a6BeHiDT1W/EFL7bP8E6dBNIBD5/TO5I4IR5xMJa6ZpLUzsmJo079WYiRZzU86500ENBkLdtzv91f1YmQGQGGQHIAF9DTJHt37x578SVZEZBSJA9JovgATQrl1AscmuN+m40xzq+dXfekAz0Sj8ishvTBwHyLYOsm8m55cfQXl5i4iWKJ4LNN+GfLnolZKRTj0LrGS0XWTRdUf5BVg3w0O8kUiNDdjPOxv1lu7W7ZWptKsY4i4EYG+lkZwoWYJG6yuyK09hwaebltm6CZdOb9tTOho3MjBwukw4D/LeY62x0ZdPsGHUT2COcIvhUGwMOfm0rqohsNYdVPSWz7riB8h0Tcght2Dq7uSTYA98mE0u/M7d4UH0gVL2o8fM/bT2DU9dj8sY5mfSnFap9qYIvkmxfTQ=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bce64a41-53b8-4565-f79d-08d6eaa832ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2019 17:55:44.3410
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: leonard.crestez@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5519
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 06.06.2019 20:22, Stephen Boyd wrote:=0A=
> Quoting Leonard Crestez (2019-06-06 10:15:32)=0A=
>> On 06.06.2019 19:55, Stephen Boyd wrote:=0A=
>>> Quoting Fabio Estevam (2019-06-06 09:44:43)=0A=
>>>> Use devm_platform_ioremap_resource() to simplify the code a bit.=0A=
>>>>=0A=
>>>> Signed-off-by: Fabio Estevam <festevam@gmail.com>=0A=
>>>> ---=0A=
>>>=0A=
>>> Reviewed-by: Stephen Boyd <sboyd@kernel.org>=0A=
>>=0A=
>> An extremely similar patch was already submitted and then reverted=0A=
>> because it breaks boot:=0A=
>>=0A=
>> The current imx8 lpcg driver maps entire subsystems at once and if=0A=
>> devm_platform_ioremap_resource is used then devices inside the subsystem=
=0A=
>> will fail to probe, including lpuart!=0A=
>>=0A=
>> The hardware on imx8qxp and related parts (imx8qm) has multiple separate=
=0A=
>> LPCG blocks interspersed between devices. Some refactoring patches were=
=0A=
>> posted by Aisheng to split LPCG into multiple blocks but apparently got=
=0A=
>> stuck in review:=0A=
>>=0A=
>> There were some disagreements regarding DT bindings for split imx8=0A=
>> clocks, what would it take to move those patches forward?=0A=
> =0A=
> Don't know. I'll have to read those patches on the list and reply there.=
=0A=
=0A=
Some specific advice on how to refactor and split imx8qxp clk in a way =0A=
that is acceptable to upstream would be very helpful to us.=0A=
=0A=
--=0A=
Regards,=0A=
Leonard=0A=
