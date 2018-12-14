Return-Path: <SRS0=SiOT=OX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B89E5C67839
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 04:57:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6AB7E2080F
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 04:57:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Msq2Hn4g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AB7E2080F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbeLNE5v (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 23:57:51 -0500
Received: from mail-eopbgr150084.outbound.protection.outlook.com ([40.107.15.84]:2112
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726437AbeLNE5u (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 13 Dec 2018 23:57:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcH1tedHp4CZIxaXmx7+fgyRMCkM6SRCTJX/HIBDF2U=;
 b=Msq2Hn4gAohqTFDfC+17MPbg9KhtqmQsL6v2rJVAI+4VWsyJr7EdJlEVdm3mdsLCmPKkYpO4TCx5SaVyXVYPelmBHCa8TzN6IKaphiDB1Gt/ziPp5TCtJq25mt0bfOSZBVpxIzoHe+ulQPnBwA0KqdBN10MXsilodGCKNjBmm9E=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4289.eurprd04.prod.outlook.com (52.134.126.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1425.18; Fri, 14 Dec 2018 04:57:46 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927%2]) with mapi id 15.20.1404.026; Fri, 14 Dec 2018
 04:57:46 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Shawn Guo <shawnguo@kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>
CC:     "mturquette@baylibre.com" <mturquette@baylibre.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH V12 0/5] clk: imx: add imx8qxp clock support
Thread-Topic: [PATCH V12 0/5] clk: imx: add imx8qxp clock support
Thread-Index: AQHUkvp+2I/kA9Gq1kKYOSfh1d+quqV9fQkAgAABMXCAABN6AIAAA+qggAAGT4CAAA3/QA==
Date:   Fri, 14 Dec 2018 04:57:46 +0000
Message-ID: <AM0PR04MB4211CEFB586B7878BBB58FEB80A10@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1544715442-8902-1-git-send-email-aisheng.dong@nxp.com>
 <20181214020533.GC13243@dragon>
 <AM0PR04MB42114ACB1A55BB42D2C5523280A10@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <20181214031931.GD13243@dragon>
 <AM0PR04MB4211D692CBED348EF8C109A180A10@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <20181214035606.GE13243@dragon>
In-Reply-To: <20181214035606.GE13243@dragon>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4289;6:UK7DzoLmXPlsILXVxQcrLh2xW0Wyd6RuMneqYN5dQFkTtRIxYRGDeU+w1cn7ICXVHKQZD+KpveVuVgwMUOVbP+17ML57LzH2maMG9QpDZI539tiJ16QogZ2RBLIMbpfW8Nc+mqI0dalLw6cWkMdlRnxvZ7POHhCZPJPjDoacOLB4JF4qPVC5zm5IXGkr/wZSVWu0RUT8ZROd3F+G2ScycmIZq0M22fvllmHaACxD/zFqDP+gvyS0IRfBtiyeHRk3t0eXWwGRCZrdR2nPLMj67D7xDfrfgrA3dPWJV8AtSDvyXbJ2fWOyKVdNY3ZFmd8jftP/HhjQhmvluXYZFwADmycHjnzRPycpjxJshetSDeaFH/mjri8Lxtlr1IG7+rCmwNGtX0SJbAO1d60zkjtsTs16e/1kiPNpJaXaoudBYjzyzKTYk9V8lFPYa4hj7W7CeOPEa4PrnZsLRSElxCCAkA==;5:1GM1g9ZksbtIMBXSnrFzLP2pgHxyzcPJAOajxK7ghdiNSbYk6XEZVZ8jbG+C7skrVit4PBLpUKu607ha3/pNCd/z0OhyRrBhZC9UnAeU56hqrLrwxaP66tafS0DArVFC3rq5bkBbY5WzxWox41hOrii5MxNKiZKLxVWdpqEX4Fo=;7:Jj5rD3Hb4KLYf9eK71oj09hOPi9U/ng9w1b9Qxc9/eQfseptk4TvbxtzS4CYT0J20+owuYLQ9e4XmWj8p522Fss24vFQlW/ezxWyPtBir3721VEhqZQ6OXUg+JsVSe2bbZp4eQjDYqzp72q95voLCw==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: f2fcb45a-76c5-4c33-8b77-08d66180b0c5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4289;
x-ms-traffictypediagnostic: AM0PR04MB4289:
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-microsoft-antispam-prvs: <AM0PR04MB4289E5C072FD74396A67C81380A10@AM0PR04MB4289.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(5005006)(8121501046)(3231475)(944501520)(52105112)(10201501046)(3002001)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123558120)(20161123562045)(20161123564045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB4289;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4289;
x-forefront-prvs: 08864C38AC
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(346002)(396003)(366004)(136003)(376002)(13464003)(189003)(199004)(53936002)(2906002)(229853002)(446003)(106356001)(305945005)(74316002)(6246003)(6436002)(97736004)(86362001)(478600001)(110136005)(316002)(7736002)(93886005)(76176011)(4326008)(26005)(2501003)(54906003)(6506007)(102836004)(71190400001)(71200400001)(68736007)(186003)(99286004)(33656002)(81166006)(81156014)(8936002)(8676002)(66066001)(256004)(55016002)(3846002)(6116002)(476003)(11346002)(44832011)(105586002)(14454004)(5660300001)(7696005)(9686003)(25786009)(486006)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4289;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: zWCw9M7SToYWBQZK5crXwJs3g1g9baoVMzbFZugw22jpfo01+fzNdd+wkZy4OkKx9sBDOPDieVuA890n+89Rm/BWeauCZlXdxDcq8bpxUIlE9zeF3cfsht0yJf0GVmK9VVkcfemwTKzzFKkEO+qcwD9DIoRCx0yqLctD7QWSzKtZ0VJWdacjtnAfqY24VVhh1MKRyMm6iBUfjsmkUFDZM3pyc140J30kCzV4JaWvGune9QKVJD83J/+UHeLMKlZT3K63rPu28ThxOBpBtgPDwX6PyEkUNI2LuNK2ETC+GYexoetqwbz6GNaK7DljFd+E
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2fcb45a-76c5-4c33-8b77-08d66180b0c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2018 04:57:46.8417
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4289
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

> -----Original Message-----
> From: Shawn Guo [mailto:shawnguo@kernel.org]
> On Fri, Dec 14, 2018 at 03:37:47AM +0000, Aisheng Dong wrote:
> > > -----Original Message-----
> > > From: Shawn Guo [mailto:shawnguo@kernel.org] On Fri, Dec 14, 2018 at
> > > 02:17:04AM +0000, Aisheng Dong wrote:
> > > > [...]
> > > > > > Note: It depends on SCU driver which has already been merged
> > > > > > by
> > > Shawn.
> > > > > > So this patch series could go through Shawn's tree as well.
> > > > >
> > > > > To be clear, I'm not going to take this via my tree, and it
> > > > > definitely needs to go through clk tree.  If there is a
> > > > > dependency on my tree, you will likely need to wait for the
> > > > > dependency to land on
> > > mainline and then retry.
> > > > >
> > > >
> > > > Sorry, I should have corrected that comment.
> > > > It's not depend on SCU driver which is already in the Stephen's tre=
e.
> > > > It actually depends on the resource ID definitions[1] and the
> > > > centralized PM related service definitions headifle in in power
> > > > domain series which is already in your tree.
> > > >
> > > > [2] can be fixed by defining them in clock driver.
> > > > But [1] seems can't be fixed as resource ID is shared by power
> > > > domain and possible many other SCU client drivers.
> > > >
> > > > Any suggestion?
> > >
> > > After [1] and [2] land on v4.21-rc1, you rebase the series on that.
> > > The dependency will be gone, right?  This is what I suggested above.
> > >
> >
> > Okay, that may need a few more weeks.
> > BTW, after v4.21-rc1 is out, can the mx8qxp CLK and DTS hit the final v=
4.21
> release?
> > As I understand, usually we don't receive new feature patch after the
> > first RC, right?
>=20
> Yes, they will have to land on 4.22 then.

That's unfortunately and may need wait 3 more months.
I really wish we can hit v4.21-rc1, then other modules driver can start
their work based on it.

Stephen,
What's your option?

Can we try the same way as Shawn did for arch and dts part?

Regards
Dong Aisheng

>=20
> Shawn
