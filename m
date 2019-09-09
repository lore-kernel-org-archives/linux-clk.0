Return-Path: <SRS0=VG/9=XE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5880C433EF
	for <linux-clk@archiver.kernel.org>; Mon,  9 Sep 2019 12:21:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 91617218DE
	for <linux-clk@archiver.kernel.org>; Mon,  9 Sep 2019 12:21:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=KoCoConnector.onmicrosoft.com header.i=@KoCoConnector.onmicrosoft.com header.b="MMWBRd+d"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726860AbfIIMV3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Sep 2019 08:21:29 -0400
Received: from mail-eopbgr150082.outbound.protection.outlook.com ([40.107.15.82]:65188
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726008AbfIIMV3 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 9 Sep 2019 08:21:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LGgKaM6M6XD0HmE8eDCFbcn4dkqUvrldCU0ajV7LJmEOGd4dbFJ87BysdExsoFfBHQj6T7Br6dD80q2GRBGiO2AAlFZCtGXj5L+jem0TTjt4mPkllasej2X5DiWqSS9t/gl1MEsvbnT5xqKGQfsLT5b+/UbNI1HuKCA3NGKqsH2yREZbT7F2SWl7BGgGqxxZL1WDkSFMKxJ9/n634KC5i906NP3kBlvjCKjXHEb6xVslQ47uCgf0ofvglW2NK1p1bJFHm1kpPAP+mVoqepxhCkOICgC8bNy8+17Zfi+ul/FiKISSvxQJYldiu/Wx5mnlyfcpqg+sv4k99j/ixmiekA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Ths7aw49Dz7G71x/+Yt2nUTGsa3JQBSWY7SDM++IFo=;
 b=gzxlbUbsot/do7GGLhyg1O++rdwYK5WWDkQ9VSmIUDmk0YzWpRrEtteZheH25SxjIVzdcQ5N94RUXHj+vXtISD6tvZthFlOr/MsHPyoq4r6jnpiTfSr3Vj4Kzbfg5X2GJIGaWLmel74sgeGgACy2KUWWInKvrEFGlbC3wphT3xYJleC+siw5nveKAaxSRk7wOIow152XcVf8cc7zcrfLifij+N9HJIvamiXQDtPK455dYbtqO9cdMw+wfUxVY64PPP/BvXpp7UDAyIae+Q72euKeFsoyqdwP5endY6pJiuBdezl3VA/9CrPyLFT/+mlIPcHPrNQ4C8ze7rA3j+NImg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kococonnector.com; dmarc=pass action=none
 header.from=kococonnector.com; dkim=pass header.d=kococonnector.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=KoCoConnector.onmicrosoft.com; s=selector2-KoCoConnector-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Ths7aw49Dz7G71x/+Yt2nUTGsa3JQBSWY7SDM++IFo=;
 b=MMWBRd+d0MHyLDPKluehIensgWOBjxNAoXV1xtY/rmCyHrYbKPyWp2WyC057uWObbFoIi//cZ3YGl04Q+WlS2Z132KDtSgETza1mGZSQIe5f6t7TzeJh0fDw3SQJqQx12Kto7G7inT7iTpivwo0vd5h70uaf/V5/v0PdX+8LQHo=
Received: from DB6PR0902MB2072.eurprd09.prod.outlook.com (10.170.212.23) by
 DB6PR0902MB2135.eurprd09.prod.outlook.com (10.170.212.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.19; Mon, 9 Sep 2019 12:21:25 +0000
Received: from DB6PR0902MB2072.eurprd09.prod.outlook.com
 ([fe80::19cd:2f16:89cd:67cb]) by DB6PR0902MB2072.eurprd09.prod.outlook.com
 ([fe80::19cd:2f16:89cd:67cb%3]) with mapi id 15.20.2241.018; Mon, 9 Sep 2019
 12:21:25 +0000
From:   Oliver Graute <oliver.graute@kococonnector.com>
To:     Dong Aisheng <aisheng.dong@nxp.com>
CC:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "linux-imx@nxp.com" <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "fabio.estevam@nxp.com" <fabio.estevam@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH V4 00/11] clk: imx8: add new clock binding for better pm
 support
Thread-Topic: [PATCH V4 00/11] clk: imx8: add new clock binding for better pm
 support
Thread-Index: AQHVZwkY6bbdexqsRUit6qY6RV3jGA==
Date:   Mon, 9 Sep 2019 12:21:24 +0000
Message-ID: <20190909121451.GA16292@optiplex>
References: <1566299605-15641-1-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1566299605-15641-1-git-send-email-aisheng.dong@nxp.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM3PR05CA0129.eurprd05.prod.outlook.com
 (2603:10a6:207:2::31) To DB6PR0902MB2072.eurprd09.prod.outlook.com
 (2603:10a6:6:8::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oliver.graute@kococonnector.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [193.47.161.132]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 58d2419f-2cf5-40df-0d6d-08d735203b3c
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DB6PR0902MB2135;
x-ms-traffictypediagnostic: DB6PR0902MB2135:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <DB6PR0902MB2135CD879DD79094CEA02E29EBB70@DB6PR0902MB2135.eurprd09.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-forefront-prvs: 01559F388D
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(7916004)(346002)(376002)(366004)(39840400004)(396003)(136003)(199004)(189003)(446003)(25786009)(11346002)(14454004)(305945005)(99286004)(4744005)(53936002)(44832011)(5660300002)(33656002)(1076003)(486006)(66066001)(6306002)(102836004)(386003)(6506007)(476003)(33716001)(316002)(256004)(54906003)(26005)(6116002)(3846002)(66946007)(2906002)(966005)(71190400001)(508600001)(4326008)(6512007)(186003)(8936002)(76176011)(9686003)(8676002)(81156014)(71200400001)(52116002)(6436002)(229853002)(6916009)(6246003)(66446008)(64756008)(66556008)(66476007)(6486002)(7736002)(86362001)(81166006);DIR:OUT;SFP:1101;SCL:1;SRVR:DB6PR0902MB2135;H:DB6PR0902MB2072.eurprd09.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: kococonnector.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IVLbJrridZoCZTS9vbfVydDQoaw8/39moJwjvJQ9lhZsq7N2252SkHwZ9CM8mGq9MavO8HTCYCnbhbLkzPUn4KQsRKXAp+S6CSplOmSjjnkqyCfpZN4iIir2lmvHTn+Au577l/Lqwm0cQkMODyY9omtPzkvJjmQ6gaZyrKoQ/2p2DdkaASf+6cDH4+PO9VdJvN1E+2Lh3WSd4esf+bd86z4F1kYt4GUBoDsslmc9G0hT0zp3V8kOonNMeY0Ng1Rbs7a0m8u4WPClq1TyfJKkmbJdOGZp1A5CSqdg/5RzMQacsKCWBxnMxXxseiHWEea4jg4hQx/eR/81zL0s5FJ8Ul9x8T5YQWjLU0atOPONcZ7nWIJ55DqXq1VTafxsE7O36Y+C6NDo8NhbL+B/1sFONoQcqfWP1aMvBZtoMowlYLI=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A672A91056B5264A9BD51966A07075AC@eurprd09.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: kococonnector.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58d2419f-2cf5-40df-0d6d-08d735203b3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2019 12:21:24.9199
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 59845429-0644-4099-bd7e-17fba65a2f2b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2TxH0vIoad5i+yqCVFBWryGbwBCXMirHv4SMYZsmHiN/ma8MSvjHximwXC9iywl3+ky8I3tzWYueqJ3iJZS5ArjhggNlmORorSKzusrNG7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0902MB2135
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 20/08/19, Dong Aisheng wrote:
> This is a follow up of this patch series.
> https://patchwork.kernel.org/cover/10924029/
> [V2,0/2] clk: imx: scu: add parsing clocks from device tree support

I would like to test this version (v4) of your series on my imx8qm
board. Last time (v3) I need this patch series ontop:

https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=3D146521

Is there an updated version too? On which linux-next branch should I
apply your changes?

Best Regards,

Oliver
