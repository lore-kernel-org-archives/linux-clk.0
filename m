Return-Path: <SRS0=a4ME=TW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 841D0C282CE
	for <linux-clk@archiver.kernel.org>; Wed, 22 May 2019 10:56:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5AC1421479
	for <linux-clk@archiver.kernel.org>; Wed, 22 May 2019 10:56:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="kA6UFOl5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729171AbfEVK4d (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 22 May 2019 06:56:33 -0400
Received: from mail-eopbgr130072.outbound.protection.outlook.com ([40.107.13.72]:34222
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727464AbfEVK4c (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 22 May 2019 06:56:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZxQaY99ejy8a0zfxsotbMMlkUzenPno6vgiO1lOmMlU=;
 b=kA6UFOl5rmcSz1zJ8EUXgIL0a8ndND6r1fuNHi5jleAJKze+VKROtqGPoISG8X37wqyrn0jISLAiloja0xNV59MvXGE758YjtM5yrgLGp5S95GDe7M/0zdKqz283JW/QJ3moYfayY9ynI3GabJB2SxefhTdRGeMUNvvNJNhfFH8=
Received: from AM0PR04MB5779.eurprd04.prod.outlook.com (20.178.202.151) by
 AM0PR04MB4209.eurprd04.prod.outlook.com (52.134.126.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Wed, 22 May 2019 10:56:29 +0000
Received: from AM0PR04MB5779.eurprd04.prod.outlook.com
 ([fe80::c19b:5964:bfcb:96a8]) by AM0PR04MB5779.eurprd04.prod.outlook.com
 ([fe80::c19b:5964:bfcb:96a8%7]) with mapi id 15.20.1900.020; Wed, 22 May 2019
 10:56:29 +0000
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Leonard Crestez <leonard.crestez@nxp.com>
CC:     Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Anson Huang <anson.huang@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 0/2] clk: imx8m: Add GIC clock
Thread-Topic: [PATCH v2 0/2] clk: imx8m: Add GIC clock
Thread-Index: AQHVEIOCpLH3NHnZl0OVDpw6qRV786Z2+PqA
Date:   Wed, 22 May 2019 10:56:28 +0000
Message-ID: <20190522105627.nshnk5ih6r2swzr4@fsr-ub1664-175>
References: <cover.1558518323.git.leonard.crestez@nxp.com>
In-Reply-To: <cover.1558518323.git.leonard.crestez@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=abel.vesa@nxp.com; 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ed80387e-495f-4537-59de-08d6dea424fa
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:AM0PR04MB4209;
x-ms-traffictypediagnostic: AM0PR04MB4209:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <AM0PR04MB420982F98FA283F7195CC4DFF6000@AM0PR04MB4209.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1332;
x-forefront-prvs: 0045236D47
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(7916004)(366004)(199004)(189003)(91956017)(66446008)(66556008)(71190400001)(71200400001)(64756008)(66476007)(66946007)(476003)(446003)(11346002)(73956011)(76116006)(99286004)(76176011)(6116002)(3846002)(6512007)(9686003)(54906003)(6506007)(53546011)(6306002)(6436002)(4326008)(6246003)(25786009)(6486002)(186003)(102836004)(53936002)(68736007)(86362001)(26005)(6862004)(256004)(7736002)(4744005)(2906002)(966005)(14454004)(5660300002)(6636002)(1076003)(498600001)(486006)(66066001)(44832011)(229853002)(33716001)(8676002)(81166006)(81156014)(8936002)(305945005)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4209;H:AM0PR04MB5779.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7/QH5ax1bmACzWnUPkdoidwV9/61FirazZ+NUifC426xOXxA0Kz5EurvgzHBRPpRanw/WyHq/nZX3y1okv6pzmt3irERMxG++xsdFatfAF/Idy2aZ5Gp1SEtwUQGZz1/hBNZan00AnUr8EASpXR8kaxnU2Hx0GWdWkNAd3yaVO++3Rs/r1c5Poc6Kr1li3XhP9XAkiA8/ao6YBw5ikuL+rcgBX+P+fQ+h8t4NRhLC6hUWbLwQlShkq5XdthVltMbZKhsZzGvXlIdgUYXzdUwGuz6nld59u/YnOGU9U+Hw/KDFEHSxZlHSfmBjP6fRRZbhfh8pTZcfQD3r1f2jSNR8yEeysz6rvMxT3EmHk1sRjS1vWXzlopC5br1UjYou3494kIlEd1NP62ijiOKcJiQ33K42ghJYZnN5iv4ZG8UDQQ=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6A409CE82D50B94CBC334C2A645640EC@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed80387e-495f-4537-59de-08d6dea424fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2019 10:56:29.4404
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4209
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19-05-22 09:48:28, Leonard Crestez wrote:
> Add gic clk and mark it as critical so that parents are not turned off
> by accident.
>=20
> Changes since v1:
>  * Add imx8mq
>  * Split dt-bindings to separate patch
>  * Rebase on shawnguo/clk/imx
> Link to v1: https://patchwork.kernel.org/patch/10940303/
>

For the entire series.

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>=20

> Leonard Crestez (2):
>   dt-bindings: clock: imx8m: Add GIC clock
>   clk: imx8m: Add GIC clock
>=20
>  drivers/clk/imx/clk-imx8mm.c             | 4 ++++
>  drivers/clk/imx/clk-imx8mq.c             | 4 ++++
>  include/dt-bindings/clock/imx8mm-clock.h | 4 +++-
>  include/dt-bindings/clock/imx8mq-clock.h | 4 +++-
>  4 files changed, 14 insertions(+), 2 deletions(-)
>=20
> --=20
> 2.17.1
> =
