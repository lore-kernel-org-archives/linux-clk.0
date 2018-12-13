Return-Path: <SRS0=bPXJ=OW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30D98C67839
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 12:04:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C78ED2086D
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 12:04:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="GdKlhjA4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C78ED2086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728759AbeLMMEK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 07:04:10 -0500
Received: from mail-eopbgr60068.outbound.protection.outlook.com ([40.107.6.68]:41952
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728733AbeLMMEK (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 13 Dec 2018 07:04:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MLv3uEzSGLxujoUAmx62Er/9D/aPQ9Q7/RDBVN09x64=;
 b=GdKlhjA45ipuEFgp+lApkXfOtC7vdjFn8oJ2L4wsQc7lirZ9scw4ZQ8XyfJ4H+VEAwEOBj21qSignbpnzOIp9VFq9DWbZrhRRtFamPY5F/cfi8FkHjhU8SPz2n2RdTzipMSa2iDxt9AJpaDemdUmdI27EnnhrnHQDYdAKBnFmdI=
Received: from DB3PR0402MB3658.eurprd04.prod.outlook.com (52.134.65.28) by
 DB3PR0402MB3900.eurprd04.prod.outlook.com (52.134.71.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1425.19; Thu, 13 Dec 2018 12:04:04 +0000
Received: from DB3PR0402MB3658.eurprd04.prod.outlook.com
 ([fe80::ce5:fddb:6290:c5eb]) by DB3PR0402MB3658.eurprd04.prod.outlook.com
 ([fe80::ce5:fddb:6290:c5eb%5]) with mapi id 15.20.1425.016; Thu, 13 Dec 2018
 12:04:04 +0000
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Shawn Guo <shawnguo@kernel.org>
CC:     Olof Johansson <olof@lixom.net>, Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V11 1/7] clk: imx: add configuration option for mmio clks
Thread-Topic: [PATCH V11 1/7] clk: imx: add configuration option for mmio clks
Thread-Index: AQHUkoBGWd9Zb2oin0+2+ywtXpulbKV8TgAAgAABaACAAALTgIAAQJ6A
Date:   Thu, 13 Dec 2018 12:04:04 +0000
Message-ID: <20181213120357.uwwnxpb56zpb2mjd@fsr-ub1664-175>
References: <1544662938-5020-1-git-send-email-aisheng.dong@nxp.com>
 <1544662938-5020-2-git-send-email-aisheng.dong@nxp.com>
 <154468785263.19322.9529215687462426277@swboyd.mtv.corp.google.com>
 <CAOesGMhFtawJLpHmXbxvs=z+S1jVW8n2VQVv1gMcWicrOxDWdA@mail.gmail.com>
 <20181213081239.GB12458@dragon>
In-Reply-To: <20181213081239.GB12458@dragon>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=abel.vesa@nxp.com; 
x-originating-ip: [95.76.156.53]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;DB3PR0402MB3900;6:rJDF12yIgKpsKt8e4UsKZmWO94MfMJoF5v0kmiKKDCulO5StldyQYQOfG/DXWJLc3F+UaxhchkywFKmzagodK2EYJw1enp1Gxn/ZtpRYIqi2US6syrmidgwLqYo1QKCiK3MpMrFYy6RkrBxjuVOM0imPGwHnIbZup4juTctJ21uF1Oj9A1WuRuMRPcy0Pvq0nQ2mu7Cm68n9UDDlysYAc73LN8QUj0fwnYOcBKu9SUhbiVmBsk93WmGIylpl5B9R3S3ZSA8dNNr4SYUBqKxrS8L8qXmStWivQlkudRVoUdi4dSPDfE7Pgy2WP50Gaa6njH8+tgUGq0Yd9knXNlo/xzx0ZezBwXIJD44yQuOYpFHdgIypbrD52N6zMeC5Ku1ny4fu/OY5xvlP3KpNGg+CowMcIZ22A9jU983aKKO7pl2XMpBckU8KZUhErAVvtLHicjGgQe6ectrgPWLpNNRFDA==;5:YpmDwZLM3lGZbwCZVZz2g4Vcjat+Dew0XOAR9poQQZC10Vel0KAqWqyRlp8jJhHq7jRHUXN7QyvtY/B+SxqhU89KhDtoELcIeFhYENUj8vSNiOyq5B9SG/Tn8rNLpWYkB2FbZ6ZoAqih4N4xt220eUFZD71HzgG+VIejWK/OEco=;7:1mFPkj4j/n9pVwewEWkIY6lvnfUtAAGUZTnCpzsSGocuGprdR3W0uO2pfIl3rBKwZjW8uQfuPF0NAZ0t5aDdLMs3nWBA+fs6ainbfB3yNRE4VaHMpBVuoRxjPziEwLkmXFd7CpuWRgED94THtMBxww==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 334e2a2b-ab18-4a2d-89fa-08d660f313d2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:DB3PR0402MB3900;
x-ms-traffictypediagnostic: DB3PR0402MB3900:
x-microsoft-antispam-prvs: <DB3PR0402MB390038C4A2921E6DAE180502F6A00@DB3PR0402MB3900.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(5005006)(8121501046)(3231475)(944501520)(52105112)(3002001)(93006095)(93001095)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(201708071742011)(7699051)(76991095);SRVR:DB3PR0402MB3900;BCL:0;PCL:0;RULEID:;SRVR:DB3PR0402MB3900;
x-forefront-prvs: 088552DE73
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(7916004)(396003)(346002)(366004)(376002)(39860400002)(136003)(199004)(189003)(81166006)(93886005)(5660300001)(1076002)(8676002)(3846002)(305945005)(33896004)(9686003)(6916009)(6512007)(256004)(97736004)(81156014)(6116002)(8936002)(7736002)(54906003)(14444005)(316002)(33716001)(106356001)(446003)(11346002)(68736007)(476003)(105586002)(99286004)(486006)(86362001)(71200400001)(71190400001)(2906002)(53936002)(44832011)(575784001)(229853002)(6506007)(186003)(25786009)(76176011)(66066001)(53546011)(4326008)(14454004)(6486002)(26005)(6246003)(102836004)(6436002)(478600001);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3900;H:DB3PR0402MB3658.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: Vhxwhl1nKOngUKcMgEOTlXc8Uz6Eo9cOPPGvUKJnj2vufj5sAbjQyryFvHlken63081mgUxaCpE1UQSB4fyrS6XRz/gHPHg3DjK2QPamMuB45diMTndlAV6aUBDRkSCWONEsBYc1hZb6feH2kKScCu/ptJLMxkZBaaeFrsLV4yDG3Fy2GfPdX3a7hVXb6y1Xezuxl/IflxtR6vmsuegZkt8yHLbH9RKFZm3pE9hXWVeypytppZ0RNBc0B5HsbtMbJmAk2Rf0+bpZMbK1S+pOQH4DgKkYrvpGBTzZKWKQH+jIjFAIGFXwWqK9ne9qIMUI
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BB88826C423F25489F8A0934DEC2C3DB@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 334e2a2b-ab18-4a2d-89fa-08d660f313d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2018 12:04:04.3877
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3900
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18-12-13 16:12:41, Shawn Guo wrote:
> On Thu, Dec 13, 2018 at 04:02:34PM +0800, Olof Johansson wrote:
> ...
> > > > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > > > index a47430b..8a9440a 100644
> > > > --- a/drivers/clk/Makefile
> > > > +++ b/drivers/clk/Makefile
> > > > @@ -72,7 +72,7 @@ obj-$(CONFIG_ARCH_DAVINCI)            +=3D davinc=
i/
> > > >  obj-$(CONFIG_H8300)                    +=3D h8300/
> > > >  obj-$(CONFIG_ARCH_HISI)                        +=3D hisilicon/
> > > >  obj-y                                  +=3D imgtec/
> > > > -obj-$(CONFIG_ARCH_MXC)                 +=3D imx/
> > > > +obj-y                                  +=3D imx/
> > > >  obj-y                                  +=3D ingenic/
> > > >  obj-$(CONFIG_ARCH_K3)                  +=3D keystone/
> > > >  obj-$(CONFIG_ARCH_KEYSTONE)            +=3D keystone/
> > > > diff --git a/drivers/clk/imx/Kconfig b/drivers/clk/imx/Kconfig
> > > > new file mode 100644
> > > > index 0000000..37478ba
> > > > --- /dev/null
> > > > +++ b/drivers/clk/imx/Kconfig
> > > > @@ -0,0 +1,5 @@
> > > > +# SPDX-License-Identifier: GPL-2.0
> > > > +# common clock support for NXP i.MX SoC family.
> > > > +config MXC_CLK
> > > > +       bool
> > > > +       def_bool (ARCH_MXC && !ARM64) || (ARCH_MXC && ARM64 && SOC_=
IMX8MQ)
> > >
> > > Ok I looked closer, SOC_IMX8MQ is only being introduced now and has o=
nly
> > > been in linux-next for a few days. Having such a config symbol is hig=
hly
> > > unusual for arm64 code. Has that been accepted by arm-soc? I don't kn=
ow
> > > why it would be because we don't add SoC specific config options
> > > anymore. I imagine it will be rejected and we'll need to have this ne=
w
> > > MXC_CLK config be enabled in the defconfig instead of selected from t=
he
> > > arch layer.
> > >
> > > Given all that, is there any damage if this is just a def_bool ARCH_M=
XC
> > > right now? If it's enabled on the platforms that don't use it because
> > > they have SCU, does it actually matter? Or we just get some code bloa=
t?
> > > If it's just some extra code, then even more reason to make a user
> > > visible config option that can be selected in the configurations that
> > > care to save some space.
> >=20
> > On arm64 we generally add an ARCH_<family> and leave it at that. So,
> > ARCH_MXC would be suitable, but we shouldn't add more finegrained than
> > that.
>=20
> Olof,
>=20
> I'm just about to send pull request for i.MX8MQ support, which
> introduced SOC_IMX8MQ option.  It sounds like we should rework the
> patches to get SOC_IMX8MQ killed?
>=20

That was introduced because of the way the clock were introduced by prior I=
MXs.
What I suggest is to change the way the clocks are built a little bit.
Something like this:

diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
index 5c0b11e..fdea7d4 100644
--- a/drivers/clk/imx/Makefile
+++ b/drivers/clk/imx/Makefile
@@ -3,13 +3,11 @@
 obj-y +=3D \
        clk.o \
        clk-busy.o \
-       clk-composite-8m.o \
        clk-cpu.o \
        clk-composite-7ulp.o \
        clk-divider-gate.o \
        clk-fixup-div.o \
        clk-fixup-mux.o \
-       clk-frac-pll.o \
        clk-gate-exclusive.o \
        clk-gate2.o \
        clk-pfd.o \
@@ -18,7 +16,6 @@ obj-y +=3D \
        clk-pllv2.o \
        clk-pllv3.o \
        clk-pllv4.o \
-       clk-sccg-pll.o

 obj-$(CONFIG_SOC_IMX1)   +=3D clk-imx1.o
 obj-$(CONFIG_SOC_IMX21)  +=3D clk-imx21.o
@@ -34,5 +31,9 @@ obj-$(CONFIG_SOC_IMX6SX) +=3D clk-imx6sx.o
 obj-$(CONFIG_SOC_IMX6UL) +=3D clk-imx6ul.o
 obj-$(CONFIG_SOC_IMX7D)  +=3D clk-imx7d.o
 obj-$(CONFIG_SOC_IMX7ULP) +=3D clk-imx7ulp.o
-obj-$(CONFIG_SOC_IMX8MQ) +=3D clk-imx8mq.o
 obj-$(CONFIG_SOC_VF610)  +=3D clk-vf610.o
+
+obj-$(CONFIG_ARCH_MXC) +=3D clk-imx8mq.o \
+       clk-sccg-pll.o \
+       clk-composite-8m.o \
+       clk-frac-pll.o

This way the frac, composite-8m and the sccg will only be built for arm64,
and we also get rid of the SOC_IMX8MQ. But then, arm64 IMX clocks will not =
follow
the same pattern as the arm32 ones. If that's ok with everyone, I already h=
ave
a patch that solves this issue.

> Shawn=
