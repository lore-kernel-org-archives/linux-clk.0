Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26B96C433E0
	for <linux-clk@archiver.kernel.org>; Wed, 13 Jan 2021 09:16:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A9828233A1
	for <linux-clk@archiver.kernel.org>; Wed, 13 Jan 2021 09:16:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727470AbhAMJQI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Jan 2021 04:16:08 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:58484 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727450AbhAMJQH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 13 Jan 2021 04:16:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1610529549; x=1642065549;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=9FhE8JNsmXq5EDImfxgB1V9KUXRS1iGU3wyVDx3JeKQ=;
  b=pBzgn1Ndj9oq08hQ5iwyXCfKTv7722/8N1No+6xgZ4hFzgUTdpuXWXmP
   uWp4uNDBsffj1bYU0WES9zzbG9dO+yPSstcJyJHLvoC6TXCQZyopHe4ph
   FKLAFsxsFBrNKLYwIZU+RxRYfn+bw1n4cPIAScHnunxDV4HEqPj5McGQe
   S1/HBE6PC10doKdvtI2KkaIuJR/m3W69KerhI5KQel1Yc33wrm3w+lIpS
   XDau6pxxa68y93d7EqsvwpEcoOXEXT+ISS5DpzQP80CJ1OhULntgN37af
   GWWXwI+ahQm/8MkxE2aaHbgWDaZj22RrJf86hXFW4/pT/s4LICsFbkBgQ
   A==;
IronPort-SDR: 2x0Jhdf3ECkAYpWKPqMOYazYQ0aPvzccKmgnQOSbdVPansciSF5LoIA1ghF3sNsBi6kWpW/iz9
 yapAApZFcBiDfrp4UOfCNNgIe6okKtbid3BP/t/1QayNYIy0EA4JeHu2C07wIBWF3ZxbydJCkj
 +n4wMoI19C7DCDLwsQ2qAt4l5/B/PqO4piKHoH++6c/EODuYlQxQZ/ss/1zzFwdV8N62JKzrRu
 SerFVwDubu9Yakst7QP8iLkZX2ksFqsNerH8fp5k30XQ4qaeFbsRF0LeM0ywd0nxBH1DzetO+y
 lQY=
X-IronPort-AV: E=Sophos;i="5.79,344,1602518400"; 
   d="scan'208";a="261227395"
Received: from mail-dm6nam10lp2100.outbound.protection.outlook.com (HELO NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.100])
  by ob1.hgst.iphmx.com with ESMTP; 13 Jan 2021 17:17:25 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jbrqVbghJ0OOtw+ISyfN3w6rBlUxTb/2kw4F8D3pTkPG5Th8MHqdXCV9c1TesCzMQu98fTFoc9l68j5HRLE8B31Mz9yd8oNDC3HCXp+9VoPukluaPjwlISHp7KfZ1OEkPgnvFZIA7oniGFioASzM/GlgrRchhqfLeKgBMdKDe5FicxcP9M5dD087iOJ7uXKOdyyAmCNJLfStV4Hgla5cGFmAEQbFOrzN1AqgWl3aNa6nkaaYcVcpF2Olqiuj3fPxu0uhc8dQh79R3NzaGjT0+p+hnftOSoXQLcP/foLZU3PQUryiDCNT8KdebqhDqPgegd/2jbphcpS5jBAhflA5ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CajsuMRQgfglv5tw0rwGhejvu9Px0m87/eP4X6EsakY=;
 b=INAZ3b4MJXt4LM/zBPOCZrtFb+0HYNmR8Xb8KH0X6jdCPXMyTd0RffnFc4vSN3X/Udf9l8UvCrjQ720h1pQpYK7i3M6ekrfUhGePElB0Zb/yOHBrUzDhjNIhENGmhiL1XjwEZFKn/DuXjlDukphZGBs/2VDsoTaS07xCqounZZUkWDk2VmZfu2vUvwAItcX4GE4SI6pwduNrnPOS8pkFiAl1FkCUlOF35WMxBVyP9Kqvorhldugo4Bl7AdyEnFE6FAdP17w0ayJ/ToawCfaA66fWvgguY1e/eM+ODmI55XQ8JqRXNw9A5Qro3eiO+xIdtminzdvenqBiycTBOUTWIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CajsuMRQgfglv5tw0rwGhejvu9Px0m87/eP4X6EsakY=;
 b=a6pe1LoNMwK7qLF2WKg5n2m/gIpY2rHD71PWc4WPv6zi6qPB3hemJoXVOodgbRQ03Zkgm/HfrMUzeskyH3Mnf8imE1xbockoehkfUuOhHOez0J9Oe/cXauQ9D/x3YS84+qROt5g9BuL4sVJ9iIjGgghFCceCBVRYY6Wyw/PkwO4=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB7015.namprd04.prod.outlook.com (2603:10b6:610:95::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.11; Wed, 13 Jan
 2021 09:14:56 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a%8]) with mapi id 15.20.3742.012; Wed, 13 Jan 2021
 09:14:56 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
CC:     Sean Anderson <seanga2@gmail.com>
Subject: Re: [PATCH v11 01/10] clk: Add RISC-V Canaan Kendryte K210 clock
 driver
Thread-Topic: [PATCH v11 01/10] clk: Add RISC-V Canaan Kendryte K210 clock
 driver
Thread-Index: AQHW6H6jBxZahSfnlkqtd1vCx2d05w==
Date:   Wed, 13 Jan 2021 09:14:56 +0000
Message-ID: <CH2PR04MB6522338950B5E95650374431E7A90@CH2PR04MB6522.namprd04.prod.outlook.com>
References: <20210112010238.200241-1-damien.lemoal@wdc.com>
 <161052632885.3661239.353622418812249041@swboyd.mtv.corp.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:e53d:bea0:4863:19b6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fbb2ca3a-9cf3-45be-b503-08d8b7a3b1ee
x-ms-traffictypediagnostic: CH2PR04MB7015:
x-microsoft-antispam-prvs: <CH2PR04MB7015EF04D375226D4EC040DEE7A90@CH2PR04MB7015.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xuU6M87jxcwMLlYEni6hoIQDQ7+FtDyFeFGXZpoDQUjrrCB8eXam0ZnC/IfrsUZkRr4IWGZZm7y8On/Shk8RhVDMa/7unNS6d8Tz2aTlyB/gSj1M2qzFPVE6mVdRrxZTA6ZWsYy+kII1uE1cTLiDulZVsZMVcHYqT06hIczYO/zGz6CHoIaaBR4/cOdyytOtIZMmrkVKSxksQP6Hr6i+V/8KBNh6zj9qH0mO6ki01uAY5pBEufKBKDpHvoHiakWgHTWL9eXYehF2WaB57+43FSVAuivIcWdQ5/qWTFFkkmXmBWCkZfqw1eI1qJBsOTADNFMHquOAV8Via94dzQF+fDgfdoqdijFfW2u3uTr4wnOO5FuvJh3XUq19tO48x8x7O1pT+X0w/2zm9+NYqqS6ZQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR04MB6522.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(346002)(366004)(39860400002)(71200400001)(7696005)(8676002)(30864003)(5660300002)(33656002)(86362001)(91956017)(66946007)(110136005)(55016002)(478600001)(2906002)(8936002)(66556008)(9686003)(6506007)(53546011)(83380400001)(66446008)(4326008)(316002)(64756008)(186003)(52536014)(66476007)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?iIJgMXOXRMKxf9l1B2+uLQ9hTcSiHhRqL8qrCpSc1mYPwnkdHlDN+kZDP+mN?=
 =?us-ascii?Q?85klP4zokWt5HEMo5Jt+2AQ63xeIrJ2FRKffadsdNelT3h7QkxdPimMY14wU?=
 =?us-ascii?Q?YSpXP6Zc+s1Bh2veHzrhKktME4meXILR5JQ701Pkleowrx6W88snCOhNNMOD?=
 =?us-ascii?Q?DlxnhtFfm4/quq7/fdv8tOTSYpSEIno7pQZ/7+oYXAByIrRTSu/VuMaQK6TG?=
 =?us-ascii?Q?K+1wSu9O5vSmjNZJxPYP3brL6sVeYjeZoybWoPU/Ap0UQsv2iGROruKcaG7l?=
 =?us-ascii?Q?KFdmcHJNcteXMQCFIDqja8dlHlipxKMK4cyYpULlNi98Cz5AC5gjopbeeiIX?=
 =?us-ascii?Q?UyOvKDsamyvvEODQSsqq7WhBavOdX36oiJFiPKwpNeSPhSx15NM59pTAGF9z?=
 =?us-ascii?Q?NcD/F1MUWLzllsLJWKQavfSey2mQmRUJyJqTVZd7HoyVf4WosTU/uC86E4ae?=
 =?us-ascii?Q?bdbGHTZUBc/ffkDLt81FFGJ2zMKR/34w4YIsSYkSnMC9nfOhDYBdRn/eOCSW?=
 =?us-ascii?Q?Sa4O9bcSO4/fEtvB5NN5rR+jmnoOT3Olc+kPdgeE6xQLAQdmtAiXIyMBZit9?=
 =?us-ascii?Q?i9P21oC5rGuj/n+mK4QW4xMxbZh7BTnNHkQQDKpE9unHn7hylBeDUm7Vge91?=
 =?us-ascii?Q?4S7rmGpjkPtqB81xjxPGVIlSgNs2ZNYXtIlWvbJ3idCBmbfF9QGhxSi1CVoy?=
 =?us-ascii?Q?/ZaddoFsLM1gCTCEJWBuVXEiRIfomlsLCtNNCXoNztbPZadyBSzMZHTc9m+6?=
 =?us-ascii?Q?3OoOU+Bl9nJ3umNirH06WBK/t96XSkWGN4cGqJAREEqJ1BsZ3lQSE0705MiP?=
 =?us-ascii?Q?w/mSPlRkpfYG6ax4yGotHk8p5z7Zrz5NHhhPWSox77OTPq81cwS8dE3htpiY?=
 =?us-ascii?Q?S/g41uTJiVuXFm+2QdRrq3xNAqY10cpFrW1N67X9M8I7LEv8S3+YWm3+ibxC?=
 =?us-ascii?Q?ZfjINQnXFUEYGbYc8+jykNrRlhwhKdYQeMy9LHBjoPn7I6PoQy8xeAoZKbEk?=
 =?us-ascii?Q?xLjI2S6u0b474IwYYiDPn+1bx/K4d2ha2qp13YRu9FJGp7d4sDCQa79EgsKl?=
 =?us-ascii?Q?9HXIAFiM?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbb2ca3a-9cf3-45be-b503-08d8b7a3b1ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2021 09:14:56.4692
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7IeZKLudEWkH3cUaEAywuHo6pwbuB9YySRe7lY3bUcn3cePSn8Egol/yeqH++LAMmQWsVGY8mCjA+JHpIAHSSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB7015
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2021/01/13 17:25, Stephen Boyd wrote:=0A=
> Quoting Damien Le Moal (2021-01-11 17:02:38)=0A=
>> Add a clock provider driver for the Canaan Kendryte K210 RISC-V SoC.=0A=
>> This new driver with the compatible string "canaan,k210-clk" implements=
=0A=
>> support for the full clock structure of the K210 SoC. Since it is=0A=
>> required for the correct operation of the SoC, this driver is=0A=
>> selected by default for compilation when the SOC_CANAAN option is=0A=
>> selected.=0A=
>>=0A=
>> With this change, the k210-sysctl driver is turned into a simple=0A=
>> platform driver which enables its power bus clock and triggers=0A=
>> populating its child nodes. This driver is also automatically selected=
=0A=
>> for compilation with the selection of SOC_CANAAN.=0A=
> =0A=
> That's stated twice.=0A=
> =0A=
>> The sysctl driver=0A=
>> retains the SOC early initialization code, but the implementation now=0A=
>> relies on the new function k210_clk_early_init() provided by the new=0A=
>> clk-k210 driver.=0A=
>>=0A=
>> The clock structure implemented and many of the coding ideas for the=0A=
>> driver come from the work by Sean Anderson on the K210 support for the=
=0A=
>> U-Boot project.=0A=
>>=0A=
>> Cc: Stephen Boyd <sboyd@kernel.org>=0A=
>> Cc: Michael Turquette <mturquette@baylibre.com>=0A=
>> Cc: linux-clk@vger.kernel.org=0A=
>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>=0A=
>> ---=0A=
>>  MAINTAINERS                      |    1 +=0A=
>>  drivers/clk/Kconfig              |    8 +=0A=
>>  drivers/clk/Makefile             |    1 +=0A=
>>  drivers/clk/clk-k210.c           | 1005 ++++++++++++++++++++++++++++++=
=0A=
>>  drivers/soc/canaan/Kconfig       |   18 +-=0A=
>>  drivers/soc/canaan/Makefile      |    2 +-=0A=
>>  drivers/soc/canaan/k210-sysctl.c |  205 ++----=0A=
>>  include/soc/canaan/k210-sysctl.h |    2 +=0A=
>>  8 files changed, 1064 insertions(+), 178 deletions(-)=0A=
>>  create mode 100644 drivers/clk/clk-k210.c=0A=
> =0A=
> I'm not sure how/if this can be merged through clk tree given that it=0A=
> deletes code from drivers/soc/=0A=
> =0A=
> What's the merge strategy?=0A=
=0A=
There is a patch preceding this one that renames drivers/soc/kendryte to=0A=
drivers/soc/canaan, so I don't think the patch will apply to your clock tre=
e. Is=0A=
it OK if Palmer takes this one in the riscv tree ?=0A=
=0A=
[...]=0A=
>> +/**=0A=
>> + * struct k210_clk - Driver data=0A=
>> + * @regs: system controller registers start address=0A=
>> + * @clk_lock: clock setting spinlock=0A=
>> + * @plls: SoC PLLs descriptors=0A=
>> + * @aclk: ACLK clock=0A=
>> + * @clks: All other clocks=0A=
>> + * @parents: array of pointers to clocks used as parents for muxed cloc=
ks.=0A=
>> + * @clk_data: clock specifier translation for all clocks=0A=
>> + */=0A=
>> +struct k210_clk {=0A=
>> +       void __iomem                    *regs;=0A=
>> +       spinlock_t                      clk_lock;=0A=
>> +       struct k210_pll                 plls[K210_PLL_NUM];=0A=
>> +       struct clk_hw                   aclk;=0A=
>> +       struct clk_hw                   clks[K210_NUM_CLKS];=0A=
>> +       const struct clk_hw             *parents[K210_PARENT_NUM_CLKS];=
=0A=
>> +       struct clk_hw_onecell_data      *clk_data;=0A=
>> +};=0A=
>> +=0A=
>> +static struct k210_clk *kcl;=0A=
> =0A=
> Please remove this and get to it from the clk hw structure.=0A=
=0A=
OK.=0A=
=0A=
> =0A=
>> +=0A=
>> +/*=0A=
>> + * Set ACLK parent selector: 0 for IN0, 1 for PLL0.=0A=
>> + */=0A=
>> +static void k210_aclk_set_selector(u8 sel)=0A=
>> +{=0A=
>> +       u32 reg =3D readl(kcl->regs + K210_SYSCTL_SEL0);=0A=
>> +=0A=
>> +       if (sel)=0A=
>> +               reg |=3D K210_ACLK_SEL;=0A=
>> +       else=0A=
>> +               reg &=3D K210_ACLK_SEL;=0A=
>> +       writel(reg, kcl->regs + K210_SYSCTL_SEL0);=0A=
>> +}=0A=
>> +=0A=
>> +static void k210_init_pll(struct k210_pll *pll, enum k210_pll_id id,=0A=
>> +                         void __iomem *base)=0A=
>> +{=0A=
>> +       pll->id =3D id;=0A=
>> +       pll->lock =3D base + K210_SYSCTL_PLL_LOCK;=0A=
>> +       pll->reg =3D base + k210_plls_cfg[id].reg;=0A=
>> +       pll->lock_shift =3D k210_plls_cfg[id].lock_shift;=0A=
>> +       pll->lock_width =3D k210_plls_cfg[id].lock_width;=0A=
>> +}=0A=
>> +=0A=
>> +static void k210_pll_wait_for_lock(struct k210_pll *pll)=0A=
>> +{=0A=
>> +       u32 reg, mask =3D GENMASK(pll->lock_shift + pll->lock_width - 1,=
=0A=
>> +                               pll->lock_shift);=0A=
>> +=0A=
>> +       while (true) {=0A=
> =0A=
> Any timeout here? Otherwise this is an infinite loop if the hardware=0A=
> misbehaves.=0A=
=0A=
No timeout from the hardware for sure. I can add one in the loop here. Howe=
ver,=0A=
since this is used super early in the code when there is no possibility yet=
 of=0A=
getting real time, the timeout needs to be a limit on the number of iterati=
on=0A=
for the loop. That limit will be super arbitrary at best... But definitely,=
 that=0A=
will avoid an infinite loop.=0A=
=0A=
> =0A=
>> +               reg =3D readl(pll->lock);=0A=
>> +               if ((reg & mask) =3D=3D mask)=0A=
>> +                       break;=0A=
>> +=0A=
>> +               reg |=3D BIT(pll->lock_shift + K210_PLL_CLEAR_SLIP);=0A=
>> +               writel(reg, pll->lock);=0A=
>> +       }=0A=
>> +}=0A=
>> +=0A=
>> +static bool k210_pll_hw_is_enabled(struct k210_pll *pll)=0A=
>> +{=0A=
>> +       u32 reg =3D readl(pll->reg);=0A=
>> +       u32 mask =3D K210_PLL_PWRD | K210_PLL_EN;=0A=
>> +=0A=
>> +       if (reg & K210_PLL_RESET)=0A=
>> +               return false;=0A=
>> +=0A=
>> +       return (reg & mask) =3D=3D mask;=0A=
>> +}=0A=
>> +=0A=
>> +static void k210_pll_enable_hw(struct k210_pll *pll)=0A=
>> +{=0A=
>> +       struct k210_pll_cfg *pll_cfg =3D &k210_plls_cfg[pll->id];=0A=
>> +       unsigned long flags;=0A=
>> +       u32 reg;=0A=
>> +=0A=
>> +       spin_lock_irqsave(&kcl->clk_lock, flags);=0A=
>> +=0A=
>> +       if (k210_pll_hw_is_enabled(pll))=0A=
>> +               goto unlock;=0A=
>> +=0A=
>> +       /*=0A=
>> +        * For PLL0, we need to re-parent ACLK to IN0 to keep the CPU co=
res and=0A=
>> +        * SRAM running.=0A=
>> +        */=0A=
>> +       if (pll->id =3D=3D K210_PLL0)=0A=
>> +               k210_aclk_set_selector(0);=0A=
>> +=0A=
>> +       /* Set PLL factors */=0A=
>> +       reg =3D readl(pll->reg);=0A=
>> +       reg &=3D ~GENMASK(19, 0);=0A=
>> +       reg |=3D FIELD_PREP(K210_PLL_CLKR, pll_cfg->r);=0A=
>> +       reg |=3D FIELD_PREP(K210_PLL_CLKF, pll_cfg->f);=0A=
>> +       reg |=3D FIELD_PREP(K210_PLL_CLKOD, pll_cfg->od);=0A=
>> +       reg |=3D FIELD_PREP(K210_PLL_BWADJ, pll_cfg->bwadj);=0A=
>> +       reg |=3D K210_PLL_PWRD;=0A=
>> +       writel(reg, pll->reg);=0A=
>> +=0A=
>> +       /*=0A=
>> +        * Reset the PLL: ensure reset is low before asserting it.=0A=
>> +        * The magic NOPs come from the Kendryte reference SDK.=0A=
>> +        */=0A=
>> +       reg &=3D ~K210_PLL_RESET;=0A=
>> +       writel(reg, pll->reg);=0A=
>> +       reg |=3D K210_PLL_RESET;=0A=
>> +       writel(reg, pll->reg);=0A=
>> +       nop();=0A=
>> +       nop();=0A=
>> +       reg &=3D ~K210_PLL_RESET;=0A=
>> +       writel(reg, pll->reg);=0A=
>> +=0A=
>> +       k210_pll_wait_for_lock(pll);=0A=
>> +=0A=
>> +       reg &=3D ~K210_PLL_BYPASS;=0A=
>> +       reg |=3D K210_PLL_EN;=0A=
>> +       writel(reg, pll->reg);=0A=
>> +=0A=
>> +       if (pll->id =3D=3D K210_PLL0)=0A=
>> +               k210_aclk_set_selector(1);=0A=
>> +=0A=
>> +unlock:=0A=
>> +       spin_unlock_irqrestore(&kcl->clk_lock, flags);=0A=
>> +}=0A=
>> +=0A=
>> +static void k210_pll_disable_hw(struct k210_pll *pll)=0A=
>> +{=0A=
>> +       unsigned long flags;=0A=
>> +       u32 reg;=0A=
>> +=0A=
>> +       /*=0A=
>> +        * Bypassing before powering off is important so child clocks do=
 not=0A=
>> +        * stop working. This is especially important for pll0, the indi=
rect=0A=
>> +        * parent of the cpu clock.=0A=
>> +        */=0A=
>> +       spin_lock_irqsave(&kcl->clk_lock, flags);=0A=
>> +       reg =3D readl(pll->reg);=0A=
>> +       reg |=3D K210_PLL_BYPASS;=0A=
>> +       writel(reg, pll->reg);=0A=
>> +=0A=
>> +       reg &=3D ~K210_PLL_PWRD;=0A=
>> +       reg &=3D ~K210_PLL_EN;=0A=
>> +       writel(reg, pll->reg);=0A=
>> +       spin_unlock_irqrestore(&kcl->clk_lock, flags);=0A=
>> +}=0A=
>> +=0A=
>> +static int k210_pll_enable(struct clk_hw *hw)=0A=
>> +{=0A=
>> +       k210_pll_enable_hw(to_k210_pll(hw));=0A=
>> +=0A=
>> +       return 0;=0A=
>> +}=0A=
>> +=0A=
>> +static void k210_pll_disable(struct clk_hw *hw)=0A=
>> +{=0A=
>> +       k210_pll_disable_hw(to_k210_pll(hw));=0A=
> =0A=
> Why the extra wrapper? Inline k210_pll_disable_hw() here? Same for=0A=
> enable.=0A=
=0A=
k210_pll_disable_hw() is used in k210_clk_early_init() when there is not ye=
t any=0A=
clk_hw struct available (only the reg iomap). Hence this lower level functi=
on to=0A=
avoid repeating the code.=0A=
=0A=
> =0A=
>> +}=0A=
>> +=0A=
>> +static int k210_pll_is_enabled(struct clk_hw *hw)=0A=
>> +{=0A=
>> +       return k210_pll_hw_is_enabled(to_k210_pll(hw));=0A=
> =0A=
> Same comment.=0A=
=0A=
k210_pll_hw_is_enabled() is also used in k210_pll_enable_hw(). I can remove=
=0A=
k210_pll_enable_hw() and code it as k210_pll_enable(). I wanted to be symme=
tric=0A=
with the enable/disable/is_enabled ops though, so I added k210_pll_enable_h=
w()=0A=
despite it not being really needed. I can remove it.=0A=
=0A=
[...]=0A=
>> +static int k210_clk_set_parent(struct clk_hw *hw, u8 index)=0A=
>> +{=0A=
>> +       struct k210_clk_cfg *kclk =3D to_k210_clk_cfg(hw);=0A=
>> +       unsigned long flags;=0A=
>> +       u32 reg;=0A=
>> +=0A=
>> +       if (!kclk->mux_reg) {=0A=
>> +               if (WARN_ON(index !=3D 0))=0A=
> =0A=
> Why would this ever happen? Seems like we don't want to allow different=
=0A=
> parents? But then why allow set_parent to be called?=0A=
=0A=
Arg. Yes. If mux_reg is not set, then this is not a muxed clock. So we don'=
t=0A=
need set_parent(). Will fix that.=0A=
=0A=
[...]=0A=
>> +static inline struct clk_hw *k210_register_critical_clk(int id,=0A=
>> +                                       enum k210_parent_idx parent_idx)=
=0A=
>> +{=0A=
>> +       return k210_register_clk(id, parent_idx, 1, CLK_IS_CRITICAL);=0A=
> =0A=
> Why critical? Please add a comment. Or that is lower down? Maybe move=0A=
> that comment up to this inline function instead.=0A=
=0A=
There is a comment in k210_clk_init() where all calls to=0A=
k210_register_critical_clk() are grouped together. It says:=0A=
=0A=
/*=0A=
 * Critical clocks: there are no consumers of the SRAM clocks,=0A=
 * including the AI clock for the third SRAM bank. The CPU clock=0A=
 * is only referenced by the uarths serial device and so would be=0A=
 * disabled if the serial console is disabled. Mark all these clocks=0A=
 * as critical so that they are never disabled by the core clock=0A=
 * management.=0A=
 */=0A=
=0A=
I could remove the SRAM and AI clocks controlling the 3 memory banks, howev=
er,=0A=
they are handy to have around since the CPU clock can be changed on this bo=
ard=0A=
but doing so requires that the SRAM and AI clocks also be reconfigured to h=
ave a=0A=
frequency that is a divisor of the CPU clock. Otherwise, the board hangs...=
=0A=
The CPU clock frequency adjustment is not in yet and is for later.=0A=
=0A=
> =0A=
>> +}=0A=
>> +=0A=
>> +static inline struct clk_hw *k210_register_child(int id,=0A=
>> +                                       enum k210_parent_idx parent_idx)=
=0A=
>> +{=0A=
>> +       return k210_register_clk(id, parent_idx, 1, 0);=0A=
>> +}=0A=
>> +=0A=
>> +static inline struct clk_hw *k210_register_in0_child(int id)=0A=
>> +{=0A=
>> +       return k210_register_child(id, K210_PARENT_IN0);=0A=
>> +}=0A=
>> +=0A=
>> +static inline struct clk_hw *k210_register_pll0_child(int id)=0A=
>> +{=0A=
>> +       return k210_register_child(id, K210_PARENT_PLL0);=0A=
>> +}=0A=
>> +=0A=
>> +static inline struct clk_hw *k210_register_pll2_child(int id)=0A=
>> +{=0A=
>> +       return k210_register_child(id, K210_PARENT_PLL2);=0A=
>> +}=0A=
>> +=0A=
>> +static inline struct clk_hw *k210_register_aclk_child(int id)=0A=
>> +{=0A=
>> +       return k210_register_child(id, K210_PARENT_ACLK);=0A=
>> +}=0A=
>> +=0A=
>> +static inline struct clk_hw *k210_register_apb0_child(int id)=0A=
>> +{=0A=
>> +       return k210_register_child(id, K210_PARENT_APB0);=0A=
>> +}=0A=
>> +=0A=
>> +static inline struct clk_hw *k210_register_apb1_child(int id)=0A=
>> +{=0A=
>> +       return k210_register_child(id, K210_PARENT_APB1);=0A=
>> +}=0A=
>> +=0A=
>> +static void __init k210_clk_init(struct device_node *np)=0A=
>> +{=0A=
>> +       struct device_node *sysctl_np;=0A=
>> +       struct clk_hw **hws;=0A=
>> +       struct clk *in0;=0A=
>> +       int i, ret;=0A=
>> +=0A=
>> +       kcl =3D kzalloc(sizeof(*kcl), GFP_KERNEL);=0A=
>> +       if (!kcl)=0A=
>> +               return;=0A=
>> +=0A=
>> +       kcl->clk_data =3D kzalloc(struct_size(kcl->clk_data, hws, K210_N=
UM_CLKS),=0A=
>> +                               GFP_KERNEL);=0A=
>> +       if (!kcl->clk_data)=0A=
>> +               return;=0A=
>> +=0A=
>> +       sysctl_np =3D of_get_parent(np);=0A=
>> +       kcl->regs =3D of_iomap(sysctl_np, 0);=0A=
>> +       of_node_put(sysctl_np);=0A=
>> +       if (!kcl->regs) {=0A=
>> +               pr_err("%pOFP: failed to map registers\n", np);=0A=
>> +               return;=0A=
>> +       }=0A=
>> +=0A=
>> +       spin_lock_init(&kcl->clk_lock);=0A=
>> +       kcl->clk_data->num =3D K210_NUM_CLKS;=0A=
>> +       hws =3D kcl->clk_data->hws;=0A=
>> +       for (i =3D 0; i < K210_NUM_CLKS; i++)=0A=
>> +               hws[i] =3D ERR_PTR(-EPROBE_DEFER);=0A=
>> +=0A=
>> +       /* Get the system base fixed-rate 26MHz oscillator clock */=0A=
>> +       in0 =3D of_clk_get(np, 0);=0A=
>> +       if (IS_ERR(in0)) {=0A=
>> +               pr_err("%pOFP: failed to get base fixed-rate oscillator\=
n", np);=0A=
>> +               return;=0A=
>> +       }=0A=
>> +       kcl->parents[K210_PARENT_IN0] =3D __clk_get_hw(in0);=0A=
> =0A=
> This shouldn't be necessary. Specify the DT node index in the=0A=
> parent_data structure instead.=0A=
=0A=
I am not sure I understand what you mean here. There are multiple possible=
=0A=
parents. And only IN0 has a DT node. The parents array is used for all muxe=
d=0A=
clocks since they all have the same first 2 parents (IN0 and PLL0). See the=
=0A=
comment in k210_register_mux_clk(). I thought this was a clean way of setti=
ng=0A=
things up without a parent array for each mux clock.=0A=
=0A=
> =0A=
>> +=0A=
>> +       ret =3D k210_register_plls(np);=0A=
>> +       if (ret)=0A=
>> +               return;=0A=
>> +=0A=
>> +       ret =3D k210_register_aclk(np);=0A=
>> +       if (ret)=0A=
>> +               return;=0A=
>> +=0A=
>> +       /*=0A=
>> +        * Critical clocks: there are no consumers of the SRAM clocks,=
=0A=
>> +        * including the AI clock for the third SRAM bank. The CPU clock=
=0A=
>> +        * is only referenced by the uarths serial device and so would b=
e=0A=
>> +        * disabled if the serial console is disabled. Mark all these cl=
ocks=0A=
>> +        * as critical so that they are never disabled by the core clock=
=0A=
>> +        * management.=0A=
>> +        */=0A=
>> +       hws[K210_CLK_CPU] =3D=0A=
>> +               k210_register_critical_clk(K210_CLK_CPU, K210_PARENT_ACL=
K);=0A=
>> +       hws[K210_CLK_SRAM0] =3D=0A=
>> +               k210_register_critical_clk(K210_CLK_SRAM0, K210_PARENT_A=
CLK);=0A=
>> +       hws[K210_CLK_SRAM1] =3D=0A=
>> +               k210_register_critical_clk(K210_CLK_SRAM1, K210_PARENT_A=
CLK);=0A=
>> +       hws[K210_CLK_AI] =3D=0A=
>> +                k210_register_critical_clk(K210_CLK_AI, K210_PARENT_PLL=
1);=0A=
>> +=0A=
>> +       /* Clocks with aclk as source */=0A=
>> +       hws[K210_CLK_DMA] =3D k210_register_aclk_child(K210_CLK_DMA);=0A=
>> +       hws[K210_CLK_FFT] =3D k210_register_aclk_child(K210_CLK_FFT);=0A=
>> +       hws[K210_CLK_ROM] =3D k210_register_aclk_child(K210_CLK_ROM);=0A=
>> +       hws[K210_CLK_DVP] =3D k210_register_aclk_child(K210_CLK_DVP);=0A=
>> +       hws[K210_CLK_APB0] =3D k210_register_aclk_child(K210_CLK_APB0);=
=0A=
>> +       hws[K210_CLK_APB1] =3D k210_register_aclk_child(K210_CLK_APB1);=
=0A=
>> +       hws[K210_CLK_APB2] =3D k210_register_aclk_child(K210_CLK_APB2);=
=0A=
>> +=0A=
>> +       /* Clocks with PLL0 as source */=0A=
>> +       hws[K210_CLK_SPI0] =3D k210_register_pll0_child(K210_CLK_SPI0);=
=0A=
>> +       hws[K210_CLK_SPI1] =3D k210_register_pll0_child(K210_CLK_SPI1);=
=0A=
>> +       hws[K210_CLK_SPI2] =3D k210_register_pll0_child(K210_CLK_SPI2);=
=0A=
>> +       hws[K210_CLK_I2C0] =3D k210_register_pll0_child(K210_CLK_I2C0);=
=0A=
>> +       hws[K210_CLK_I2C1] =3D k210_register_pll0_child(K210_CLK_I2C1);=
=0A=
>> +       hws[K210_CLK_I2C2] =3D k210_register_pll0_child(K210_CLK_I2C2);=
=0A=
>> +=0A=
>> +       /* Clocks with PLL2 as source */=0A=
>> +       hws[K210_CLK_I2S0] =3D k210_register_pll2_child(K210_CLK_I2S0);=
=0A=
>> +       hws[K210_CLK_I2S1] =3D k210_register_pll2_child(K210_CLK_I2S1);=
=0A=
>> +       hws[K210_CLK_I2S2] =3D k210_register_pll2_child(K210_CLK_I2S2);=
=0A=
>> +       hws[K210_CLK_I2S0_M] =3D k210_register_pll2_child(K210_CLK_I2S0_=
M);=0A=
>> +       hws[K210_CLK_I2S1_M] =3D k210_register_pll2_child(K210_CLK_I2S1_=
M);=0A=
>> +       hws[K210_CLK_I2S2_M] =3D k210_register_pll2_child(K210_CLK_I2S2_=
M);=0A=
>> +=0A=
>> +       /* Clocks with IN0 as source */=0A=
>> +       hws[K210_CLK_WDT0] =3D k210_register_in0_child(K210_CLK_WDT0);=
=0A=
>> +       hws[K210_CLK_WDT1] =3D k210_register_in0_child(K210_CLK_WDT1);=
=0A=
>> +       hws[K210_CLK_RTC] =3D k210_register_in0_child(K210_CLK_RTC);=0A=
>> +=0A=
>> +       /* Clocks with APB0 as source */=0A=
>> +       kcl->parents[K210_PARENT_APB0] =3D hws[K210_CLK_APB0];=0A=
>> +       hws[K210_CLK_GPIO] =3D k210_register_apb0_child(K210_CLK_GPIO);=
=0A=
>> +       hws[K210_CLK_UART1] =3D k210_register_apb0_child(K210_CLK_UART1)=
;=0A=
>> +       hws[K210_CLK_UART2] =3D k210_register_apb0_child(K210_CLK_UART2)=
;=0A=
>> +       hws[K210_CLK_UART3] =3D k210_register_apb0_child(K210_CLK_UART3)=
;=0A=
>> +       hws[K210_CLK_FPIOA] =3D k210_register_apb0_child(K210_CLK_FPIOA)=
;=0A=
>> +       hws[K210_CLK_SHA] =3D k210_register_apb0_child(K210_CLK_SHA);=0A=
>> +=0A=
>> +       /* Clocks with APB1 as source */=0A=
>> +       kcl->parents[K210_PARENT_APB1] =3D hws[K210_CLK_APB1];=0A=
>> +       hws[K210_CLK_AES] =3D k210_register_apb1_child(K210_CLK_AES);=0A=
>> +       hws[K210_CLK_OTP] =3D k210_register_apb1_child(K210_CLK_OTP);=0A=
>> +=0A=
>> +       /* Mux clocks with in0 or pll0 as source */=0A=
>> +       hws[K210_CLK_SPI3] =3D k210_register_mux_clk(K210_CLK_SPI3);=0A=
>> +       hws[K210_CLK_TIMER0] =3D k210_register_mux_clk(K210_CLK_TIMER0);=
=0A=
>> +       hws[K210_CLK_TIMER1] =3D k210_register_mux_clk(K210_CLK_TIMER1);=
=0A=
>> +       hws[K210_CLK_TIMER2] =3D k210_register_mux_clk(K210_CLK_TIMER2);=
=0A=
>> +=0A=
>> +       for (i =3D 0; i < K210_NUM_CLKS; i++) {=0A=
>> +               if (IS_ERR(hws[i])) {=0A=
>> +                       pr_err("%pOFP: register clock %s failed %ld\n",=
=0A=
>> +                              np, k210_clks[i].name, PTR_ERR(hws[i]));=
=0A=
>> +                       return;=0A=
>> +               }=0A=
>> +       }=0A=
>> +=0A=
>> +       ret =3D of_clk_add_hw_provider(np, of_clk_hw_onecell_get, kcl->c=
lk_data);=0A=
>> +       if (ret) {=0A=
>> +               pr_err("%pOFP: add clock provider failed %d\n", np, ret)=
;=0A=
>> +               return;=0A=
>> +       }=0A=
>> +=0A=
>> +       pr_info("%pOFP: CPU running at %lu MHz\n",=0A=
>> +               np, clk_hw_get_rate(hws[K210_CLK_CPU]) / 1000000);=0A=
>> +}=0A=
>> +=0A=
>> +CLK_OF_DECLARE(k210_clk, "canaan,k210-clk", k210_clk_init);=0A=
>> +=0A=
>> +/*=0A=
>> + * Enable PLL1 to be able to use the AI SRAM.=0A=
>> + */=0A=
>> +void __init k210_clk_early_init(void __iomem *regs)=0A=
> =0A=
> Is it impossible to put this into the bootloader? Does riscv have some=0A=
> boot constraints or requirements that say memory should be working=0A=
> before the kernel starts? Otherwise this is depressing that we have to=0A=
> enable clks to get memory to work early like this.=0A=
=0A=
Given the very low amount of memory on this board (8MB total), booting it=
=0A=
without a boot loader, with the board startup directly jumping to kernel st=
art=0A=
at address 0x800000000, is more efficient. Sean added U-boot support but us=
ing=0A=
the board without it with a builtin DTB is far easier and does not mandate =
using=0A=
the SD card.=0A=
=0A=
For this particular phase of the initialization, this has nothing to do wit=
h=0A=
RISC-V. This is specific to this board where the third 2MB SRAM bank is by=
=0A=
default off when the board powers-up. This bank is by default reserved for =
the=0A=
SoC KPU which is an AI acceleration engine. This memory can however be=0A=
referenced and used as general purpose by the CPU, but it has to be turned =
on=0A=
first using PLL1. Turning it on super early is needed as the DT is moved to=
ward=0A=
the end of the address space when it is parsed early in the startup code.=
=0A=
=0A=
> =0A=
>> +{=0A=
>> +       struct k210_pll pll1;=0A=
>> +=0A=
>> +       /* Make sure ACLK selector is set to PLL0 */=0A=
>> +       k210_aclk_set_selector(1);=0A=
>> +=0A=
>> +       /* Startup PLL1 to enable the aisram bank for general memory use=
 */=0A=
>> +       k210_init_pll(&pll1, K210_PLL1, regs);=0A=
>> +       k210_pll_enable_hw(&pll1);=0A=
>> +}=0A=
> =0A=
=0A=
=0A=
-- =0A=
Damien Le Moal=0A=
Western Digital Research=0A=
