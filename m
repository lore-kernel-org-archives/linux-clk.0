Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D6C6C433E0
	for <linux-clk@archiver.kernel.org>; Sat, 23 Jan 2021 06:26:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D73A723B00
	for <linux-clk@archiver.kernel.org>; Sat, 23 Jan 2021 06:26:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726063AbhAWGZr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 23 Jan 2021 01:25:47 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:26478 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725939AbhAWGZq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 23 Jan 2021 01:25:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611383145; x=1642919145;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=VYD81CnJx+3mTZtJ6wuYnbNgH9queBlDI7V8HZvtW+U=;
  b=rjsbgeIrkB5ZFidNSfgJxl46MYod/9c0z28k8Ppu55GgTQR9zaCVnBIL
   CC7bga6XuRjjlU+itbz0cyz8AxNn4GJtw47WFczs5ZFPJGCk8LL3qDOAU
   9PgpH2F73DrjZMsTwdk89JTPpqU7fLy7P9fWclcFll58u1lIKprutuqjI
   /Kggwzk+GSTjR9qm5asFPDaQEHUh8SA4AftwJnlJ00r4ObcYcYjiVK4yJ
   naV+052akdTrgsvolmlCD7AuE99otae+QmHTxUiipKzbG/tZH1PMtGXgv
   gooaYNCzEDvJtS7l1gnW5XJ22qebwA0mpkjOgXaqOaOxATIXd7+qzVxdy
   w==;
IronPort-SDR: rtdMB0X1vt9yFnIG+S+NgOtYkUvkeYkkptOaXaJ0XuTi16iy/M/TwVVQFZ4PA1HwQauyYJKJT9
 VqpZ293Szx+xbqRE67wyLKGxdTyKx9YNgJBogKwiROFth3mGDxgY+HPX+0wBvsyH4xBECD8VSX
 aEfpHkppuK7YfsGIP5Dc6KkLWzMvwI/ImETnrnVK5Yad/Y0xlZWWvVILNhKLyyHZ4XTXz7uOvH
 iGcKLKcjB5HkeCv1yYG4WggTdL0JrqFAC7IBtsW15yeT+iFMhaRjeG8/bPlx6cdwcwpsgmX4qY
 kJo=
X-IronPort-AV: E=Sophos;i="5.79,368,1602518400"; 
   d="scan'208";a="268489252"
Received: from mail-co1nam11lp2177.outbound.protection.outlook.com (HELO NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.177])
  by ob1.hgst.iphmx.com with ESMTP; 23 Jan 2021 14:24:37 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LMz3lddF3Xlfht7bSUuZpwlsr8A9vHiOQptZyp1QXJMmPPzuOIR1EKfS3vW655PLGTgkb6yLNQsFH2GgilN1BskAzJ0zgB/dlo3/f+rJ8urzrG99AcG6PFFFXBS2ZWi1QJ74+kuoSIDV3SRUqqzQUP0QG1rKgGd4ehqd6+BgSpVXBvUaQmEGWjLwEI3ojLmmTtibl5nFqYvUzryFrl93Ao/fm0r5buHh+Rst5F3+7s2AhukZmw4Ib6L03lPsx08IqtqlXpMgbU3NDBM6LcjJNFRr5J9sDhCMRpgaX21gJyaSWGFA3mZoSgqwFsVVv0oQJIHYjT6t8ek5LeDjwDk/2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QIy8w/35uARKW0JN1PwYhjpHEUd0pGsIJwN50Fu/ZvU=;
 b=UfpfP+m+Yok774XeULE4OPdTHT51+xThwKOrCFHr47SWT4lwJRXhNieCt5WbzQYQQ/1Uxkcjvwvd5ZLJlocWBuH+rpOjzA52MSuqFMUPAr1y30EQMa4sZgPiZHrrTVIq3VFNHxgsCWYTkytmKBh/mvU5foLY1gHw1y5FYKNeG1C54H7vQ9WMZU2UpYanauUUIuycHpvveqOFcxbqXQ0zMLspipxAKeWNJkAxt87KDziqzQ8C2hZYhA3ofa+W2rrss4IHqrYEHSyFo3KuqPK2QR+7EJF9RQU2b9r9sDPEbCdSHjl9cDt+4l2xvFBEFXFzj7SOzbLFRDdaxmH+d3sc1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QIy8w/35uARKW0JN1PwYhjpHEUd0pGsIJwN50Fu/ZvU=;
 b=ZMygGjXfzUpbl+zLLC3oBt6P6BWZwJAXl0SAOcmEI2RDYm2OOLVQWt6/p4MLqHvSuB2vUItSOJ+j9Xabn7JiIeNyysQRoteXnydbX5/vfSnwI05KgFurj3gxmCfqtr+gvJ68bk+YR8GWQAn4NeY0fX3xt8CZjn+1N/0EJLCHEqs=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by BL0PR04MB6596.namprd04.prod.outlook.com (2603:10b6:208:1cf::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Sat, 23 Jan
 2021 06:24:34 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d%8]) with mapi id 15.20.3763.014; Sat, 23 Jan 2021
 06:24:34 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
CC:     Sean Anderson <seanga2@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v13 01/17] clk: Add RISC-V Canaan Kendryte K210 clock
 driver
Thread-Topic: [PATCH v13 01/17] clk: Add RISC-V Canaan Kendryte K210 clock
 driver
Thread-Index: AQHW7T4M5lVOShVlf0aMYmOIexNLQQ==
Date:   Sat, 23 Jan 2021 06:24:34 +0000
Message-ID: <BL0PR04MB6514572B007BE53072B63146E7BF0@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20210118020244.103451-1-damien.lemoal@wdc.com>
 <20210118020244.103451-2-damien.lemoal@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:2db5:5c10:5640:816d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1ee1cd4c-0cc0-441b-6273-08d8bf678d6f
x-ms-traffictypediagnostic: BL0PR04MB6596:
x-microsoft-antispam-prvs: <BL0PR04MB6596B8DFBFDEEFA1BC871D7FE7BF9@BL0PR04MB6596.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8ja71RLcDD13vdRbuLrs96UkQcyS/M1ix6vAMJcWRxckcjxiShmvdBA7Agi0qHpP67i3HuVMFmwHU6B2YpBcRTUbnXFgkJpBg8BI1/qekzJLhl6s8EVJTCeuo9gqSkDmBeGFB3Jqfo4PiChZiHE5wGQICsE5ChHDn5tZwah8pZBrjQfyCm3/Gb35ZZYngSOCeuQ23y0GTi+vLo1yh2WTqVLTFT/d0UX9GxPLe+pMhRtS2zmh4vf/ttgfkT3lTyDgqNLPYXgi3xN6R18TIzoxhoMyMZOW48EKsc6Bxzl8YIElHRVyD1s2WdoAvTegYtW9dyA0MQ2pioDjnrzY3W8m9UIJ0qZPdLOQMIb4PLASocuOKshma/oSpCLIx6CKhQa7FQWguYKUJpkjflkUt6l1ZQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR04MB6514.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(346002)(376002)(366004)(316002)(2906002)(7696005)(83380400001)(110136005)(186003)(53546011)(6506007)(8936002)(54906003)(55016002)(52536014)(91956017)(76116006)(8676002)(86362001)(66946007)(66476007)(66556008)(64756008)(66446008)(4326008)(478600001)(9686003)(5660300002)(33656002)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?xezMukQIjuQFO6hmh7aBF5Q266oyIx5eed4o5qAU5Scrtbd/qMpjFKAbDy42?=
 =?us-ascii?Q?ZMzVL522essjVMG4Z60U3XSbhtrSAW7yqXTU3xtESmOWWqUWQRQANm+mA9wd?=
 =?us-ascii?Q?Z+x578y2NjX7VMs4dr3s9cgujl/ZiVscyEpLCibF5aJTIqBlu5U3v+6WOZLY?=
 =?us-ascii?Q?hvbNck/UVTBfSl9bH7IscX5p61+a7l2dEDrPhiLgxrczXmTIvIoOdp3oXzBd?=
 =?us-ascii?Q?tocZj8lLlWuqQyYAeBKbscaiuQUHuAkCQFFGYXfn2VAp4kUK4qbrpb/ynwF8?=
 =?us-ascii?Q?/+45ed0DGDyo4uJG1Juk+fK80VrCM3rTzyUzQBePdwpnymQxcKNZqePGdInH?=
 =?us-ascii?Q?9LOWMI36WV5pmro4y3nWcvm6q4sWofRjyjZ6uKRd4rEb2rnl1Vv3ffhOHFLu?=
 =?us-ascii?Q?T4k2AxhmQIFZZyI6i86Veur2Uj8dBZAcqbX2ErKrCBTpuHY3KhJmTtbQNa3p?=
 =?us-ascii?Q?e0RyJbV1Jaf+/oeuTsG31VA7V5Z7XMF3EEKVqD73btvNwRixPcYqpE7/ysMn?=
 =?us-ascii?Q?S7UJpQYcAx864ZoDX4VNj+W1tr8XspOcUhIEzXjfJDAQUPhQu+zp9ehSV3Xz?=
 =?us-ascii?Q?gy8A5ni9pwk4HBNrPAqzsedpspfPKCMKM+c1N722sMneFhbhXuzDww01rQXo?=
 =?us-ascii?Q?YDFcVtrnmfy4F9ZiAOX20a1Hc4g9pfGNVlH/tmZSoTEREMMdSXQzFiblPjbR?=
 =?us-ascii?Q?dtTxUeH8fdCod38XVTpmNLc1+9ioL1z6q9K101gzMHi7f6P5j1TPwTjpwpJh?=
 =?us-ascii?Q?79B5ufV0vmfR2Lh5C+rM8QPkxIzqNYzCyO1QncyLTorJC3dMGLZfhBgftRrD?=
 =?us-ascii?Q?VNxT+h5bN9607x7J135mWVpG9sMrykDr0JGWHtLEjavZpdwtYf3x/g/jkPal?=
 =?us-ascii?Q?h4U5DAgWPvM84z/z0zOEwXgBK9ktSe5SX/j7PyB0tWr1fgma2rXCiHO5J2uI?=
 =?us-ascii?Q?rKbAFXt51NC6q8s+9NTf/PuAr9HMSS9bVvNBHLkZ90A7pNdf8bDcuihStgQD?=
 =?us-ascii?Q?0+D4mu+T7CVR5+J/aAr66WEV9uRwoUvayQjHlnxvq+AhAIsGOtvpRHLceRxc?=
 =?us-ascii?Q?IH22/wS8Ik3DMdU+glX6vQQJ8jXZKI7NtK6Tb4dcI4Ioh74M9a4rsG+4GIDT?=
 =?us-ascii?Q?yiQkVPCf40ju6JrdSiAPEQF6FFSRxSgzyg=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ee1cd4c-0cc0-441b-6273-08d8bf678d6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2021 06:24:34.7283
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MvPXHpAU0NEv/PS8KsvsSiRdV+dG8pY2SwkzfJ80RHtPppAcHtCPbhBHtKghaOB86X/KQSeQ5kUSolI9X6SpNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB6596
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2021/01/18 11:03, Damien Le Moal wrote:=0A=
> Add a clock provider driver for the Canaan Kendryte K210 RISC-V SoC.=0A=
> This new driver with the compatible string "canaan,k210-clk" implements=
=0A=
> support for the full clock structure of the K210 SoC. Since it is=0A=
> required for the correct operation of the SoC, this driver is=0A=
> selected by default for compilation when the SOC_CANAAN option is=0A=
> selected.=0A=
> =0A=
> With this change, the k210-sysctl driver is turned into a simple=0A=
> platform driver which enables its power bus clock and triggers=0A=
> populating its child nodes. The sysctl driver retains the SOC early=0A=
> initialization code, but the implementation now relies on the new=0A=
> function k210_clk_early_init() provided by the new clk-k210 driver.=0A=
> =0A=
> The clock structure implemented and many of the coding ideas for the=0A=
> driver come from the work by Sean Anderson on the K210 support for the=0A=
> U-Boot project.=0A=
> =0A=
> Cc: Stephen Boyd <sboyd@kernel.org>=0A=
> Cc: Michael Turquette <mturquette@baylibre.com>=0A=
> Cc: linux-clk@vger.kernel.org=0A=
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>=0A=
> ---=0A=
>  MAINTAINERS                      |    1 +=0A=
>  drivers/clk/Kconfig              |    8 +=0A=
>  drivers/clk/Makefile             |    1 +=0A=
>  drivers/clk/clk-k210.c           | 1012 ++++++++++++++++++++++++++++++=
=0A=
>  drivers/soc/canaan/Kconfig       |   18 +-=0A=
>  drivers/soc/canaan/Makefile      |    2 +-=0A=
>  drivers/soc/canaan/k210-sysctl.c |  205 ++----=0A=
>  include/soc/canaan/k210-sysctl.h |    2 +=0A=
>  8 files changed, 1071 insertions(+), 178 deletions(-)=0A=
>  create mode 100644 drivers/clk/clk-k210.c=0A=
=0A=
Stephen,=0A=
=0A=
Ping ? Could you review this version please ?=0A=
=0A=
I addressed all your comments, except the addition of a timeout in the pll =
lock=0A=
wait loop. The reason is that if the hardware misbehave there, the CPU and/=
or=0A=
third SRAM bank are likely to not work either and the board will not even b=
oot=0A=
(it will hang in the early soc init code). So I do not think adding a timeo=
ut is=0A=
useful.=0A=
=0A=
-- =0A=
Damien Le Moal=0A=
Western Digital Research=0A=
