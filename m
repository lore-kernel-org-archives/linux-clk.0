Return-Path: <SRS0=zQoE=SW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F179C282DD
	for <linux-clk@archiver.kernel.org>; Sat, 20 Apr 2019 15:30:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D9E682087F
	for <linux-clk@archiver.kernel.org>; Sat, 20 Apr 2019 15:30:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="EXtzYrrD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbfDTPax (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 20 Apr 2019 11:30:53 -0400
Received: from mail-eopbgr00041.outbound.protection.outlook.com ([40.107.0.41]:38274
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725920AbfDTPax (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 20 Apr 2019 11:30:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zo+P+yQ43tT2k+oyvZ5snpR7AkbefSB3lYxS6t6Ukis=;
 b=EXtzYrrDikFgS4zDhxmBB+2mPSSut5jY7h7dezjkr3ZzpDlBX1hEc30zRu9fTE3SY6PGSHr3sE3ji9Lxlhz9IPJhPvgd7llBRewcxpvyHdPjhY3+buAgFIrAjJg5kzst0KOWQTsGGrjwxNrNtCMAAVSI6Gt3RW/BkmChyQu3v9Y=
Received: from AM0PR04MB5522.eurprd04.prod.outlook.com (20.178.113.211) by
 AM0PR04MB6547.eurprd04.prod.outlook.com (20.179.254.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.12; Sat, 20 Apr 2019 15:30:45 +0000
Received: from AM0PR04MB5522.eurprd04.prod.outlook.com
 ([fe80::fc4f:10ca:976e:4cee]) by AM0PR04MB5522.eurprd04.prod.outlook.com
 ([fe80::fc4f:10ca:976e:4cee%4]) with mapi id 15.20.1813.017; Sat, 20 Apr 2019
 15:30:45 +0000
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     Aisheng Dong <aisheng.dong@nxp.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>
CC:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Anson Huang <anson.huang@nxp.com>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/1] Revert "clk: imx: use
 devm_platform_ioremap_resource() to simplify code"
Thread-Topic: [PATCH 1/1] Revert "clk: imx: use
 devm_platform_ioremap_resource() to simplify code"
Thread-Index: AQHU9pyjuGc/37hQDkmX93reiiRIug==
Date:   Sat, 20 Apr 2019 15:30:45 +0000
Message-ID: <AM0PR04MB55229389A9796A101D92F044EE200@AM0PR04MB5522.eurprd04.prod.outlook.com>
References: <1555670144-24220-1-git-send-email-aisheng.dong@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leonard.crestez@nxp.com; 
x-originating-ip: [2a04:241e:504:3000:b93e:c95e:6b6f:c447]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a80c958f-3cbc-4fbe-4061-08d6c5a52849
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:AM0PR04MB6547;
x-ms-traffictypediagnostic: AM0PR04MB6547:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <AM0PR04MB6547C127395163681F43C703EE200@AM0PR04MB6547.eurprd04.prod.outlook.com>
x-forefront-prvs: 0013079544
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(39860400002)(396003)(366004)(136003)(346002)(199004)(189003)(6436002)(8936002)(2501003)(52536014)(86362001)(25786009)(2201001)(55016002)(9686003)(316002)(6306002)(54906003)(76116006)(91956017)(66476007)(66556008)(64756008)(66446008)(53936002)(66946007)(6116002)(73956011)(229853002)(68736007)(8676002)(81156014)(81166006)(110136005)(44832011)(14444005)(256004)(102836004)(4326008)(2906002)(74316002)(186003)(478600001)(53546011)(5660300002)(6506007)(71190400001)(76176011)(46003)(7696005)(6246003)(486006)(99286004)(97736004)(14454004)(446003)(7736002)(33656002)(476003)(305945005)(71200400001)(966005);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB6547;H:AM0PR04MB5522.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: isKZ6wChaepuqoH9uy9PeU3aFa/+SZ6i59Xbu6bUz2mMPDpkA7Of6aRFRDXs269jxObspLjb9nTcpeTcJGWZobJFvgH8faxv4qY3TDurdR+jlMR1tfOS5xNGCsu3+LJqoMKThf/EQa8PeOYGM9ilyseWG0hc+5DNWIbKZ0hTVj9NERgxJ9Eh9ZLykXMG6YhaRn+yFNmDnwXLfhxD5lKeTG7OR1OIeee1x1GvjkLWi4w0YJhkWAL2qmEmIRlhJCv1eBG1obA7tszUzsY3+EsKah9yQry5GloyWz8zGf9nHg857nkCm/Wzp8NI8ARFbPs8c69uQDjm4hcLVSe0pKf7B76tm/wEXN1r7uGLT9m58ir9SOXYDj6av2A1FEPIX2Jj44sZAQiZgJaTTL9/E3IRu1zz/7V0cqEBWY8FQ3kMxcI=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a80c958f-3cbc-4fbe-4061-08d6c5a52849
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2019 15:30:45.3487
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6547
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 4/19/19 1:42 PM, Aisheng Dong wrote:=0A=
> This reverts commit 612d5b65894b5b1607a004bd9bc60d5963b58ef6.=0A=
> =0A=
> Originally we use devm_ioremap() specifically because we want to bypass=
=0A=
> the devm_request_mem_region due to LPCG address space are shared with=0A=
> some other modules within the same SS (subsystem).=0A=
> =0A=
> The patch in question occasionally added the request_me_region back=0A=
> by calling devm_platform_ioremap_resource which results in all the device=
s=0A=
> with overlappded IO space failed to be probed as follows:=0A=
> =0A=
> [    1.062996] fsl-lpuart 5a060000.serial: can't request region for resou=
rce [mem 0x5a060000-0x5a060fff]=0A=
> [    1.071923] fsl-lpuart: probe of 5a060000.serial failed with error -16=
=0A=
> =0A=
> Cc: Anson Huang <Anson.Huang@nxp.com>=0A=
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>=0A=
=0A=
Tested-by: Leonard Crestez <leonard.crestez@nxp.com>=0A=
This revert fixes the main console on imx8qxp-mek=0A=
=0A=
Instead of having imx8qxp-lpcg-adma map the whole ADMA subsystem a much =0A=
better approach is to split LPCG into 64k areas each with their own DT =0A=
node. Having so many clk provider nodes is unusual but it's an accurate =0A=
description of 8qxp/8qm hardware.=0A=
=0A=
The LPCG blocks were deliberately split in the SOC address space so that =
=0A=
access to clk gating for individual peripherals can be controlled using =0A=
the same kind of coarse-grained memory access control mechanisms used =0A=
for the peripherals themselves.=0A=
=0A=
Unfortunately this series has been hung for quite a while:=0A=
https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=3D83525=
=0A=
