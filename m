Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8A82C433DB
	for <linux-clk@archiver.kernel.org>; Wed, 10 Feb 2021 03:16:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7CB8D64DD8
	for <linux-clk@archiver.kernel.org>; Wed, 10 Feb 2021 03:16:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229761AbhBJDQq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 Feb 2021 22:16:46 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:35550 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229703AbhBJDQq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 9 Feb 2021 22:16:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1612927003; x=1644463003;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=kw9QCcZ/M6ipzT0gc8Kr9cvPS3S2CDHNcC3RgRFkYqc=;
  b=Fx9NKxb3eoo+LpxQJd5X8H7jfayvpFBt6OL1Wl/u1BK31zWTMq3x4jb3
   KvaNIEpvrWok8jAF4ZFr5Rm+Rgs4Yvkj857DJQpODblNdVA6jTQ5px/p+
   Grg6i8N9irdq2aO7P2DQFUbBCmihd4AbM1Pe2GNfaVyMFLMGgyBzLMlWI
   RdIk7dgLHLjqujoEUEfzkygZWEiiaArmsKqqsrVmRiFFzWLRXE7sIPO8R
   3FGjMb0Mu8m3e2XMhMrkmM37c6oV5i63/7/XCGPJiVukMkeNVTQ+GFeaM
   sLYTNwjzGlGU8zEzQMhU0gwT0iDU8qReOW1ZrSHeEpvQOYe/e5uz3bx97
   g==;
IronPort-SDR: DIc+zRCw0EXAIETYsyrnuK98Q4PZ9DmbQ27bouIkBM8JbsUI4kHZZt+a6eJvLsy8ZpeBnP7zX5
 9zbasfrCB8O8lF5wYA05Qy0hH3nwFnhVW3ZoADAak3HSUB6kYe3j+5TBQHfvl/xpRfvsFJYyr1
 jjH7AkwPPag17A5P7e0Kv0TsEVonU6Grby+jtZkJwjjCbR5nGV3ygyAxWbfaj6qsZ5bX0E/R+y
 iFWwUjryJnZLXGBo0ov8y2B1dIttXNOrNw+k09aJ2dJT+0oMzBvc7QrrK8L2kWWBXavn4163b/
 43U=
X-IronPort-AV: E=Sophos;i="5.81,166,1610380800"; 
   d="scan'208";a="160769533"
Received: from mail-cys01nam02lp2053.outbound.protection.outlook.com (HELO NAM02-CY1-obe.outbound.protection.outlook.com) ([104.47.37.53])
  by ob1.hgst.iphmx.com with ESMTP; 10 Feb 2021 11:15:37 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gRx6PdWSzWATMvuRcSHWs6AdrGn5Kej96t0WS8/oRPBEWNSL1D/Q3XtBcw+5i/VGNa5/sbutF/868gTFoYbTUAJj9czBBqQlGoBGiHXKdph+SANSywSpy/YLyo8QeZ6in+x6m7VF1OnWov/Xa12H6nvmbNflse15EYMMkmw/vWRrv7vLpm3G9KIzI7LmIiGbhsVSymB20n4BiQj24uQk3TJibYPBpnsdGcsEJN0MLZdM1KdKWLx4G5txBAQFAX+veQmiJPZbvbwd5qPP6F4cWJ5GSkBwDf+v6GvLe0VjKsgR4JmzhzPthxXDa6RT8rqXJaPvuN/5luLLWAk+yDg6AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bbrsFY9pnG4lzkp3qwLwI3g5oCZat0NkVd4XXYi9jZQ=;
 b=VcF01gLVn6yy2zNpsoYtTLPn1ZdVYeaQPxU/RmP4V/fo7v3e2bpfeH1btUffTg6K3Pm6FCePl41aoc8vdbfa2oiZNz44igF52y/5EvVahqmpLEYz0Sl7yLtCulUAl2tcrRoHmGpV7OlEft9ksXfUsIe51ee3y3HrGOU/hN76RXttuf7Bw3VT3yfvXyCOAMvONNuDeDHexgylJkI+jQ5wQ3Ho1ZUpbL1lqqxCs0xbeIEXxXmkvno5Q92IXvbkNvJOdPrN6rBJPz2fLnrzUnttrDUnM1fx9Y9klEKjVGhORd8/5B5pr6V0swkXXCOmNBNtjLNakAi5qr/XRNFjLFYBdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bbrsFY9pnG4lzkp3qwLwI3g5oCZat0NkVd4XXYi9jZQ=;
 b=s9NDpJzvWYyf2FI5HmJaA9FDizblwH/6RLElhiFujOke5mkZy5BgYgRdwUgqGDLpsMuD+lwbZWl+PO9iidxQGPgL8HqrhEjozIo+CHOaQ83WDltuka+N9Zr+K/Uy20pPNjT8H5O5LbvZ4+s5JoWq4IezCL6vHyoXYYaT8/j2/KY=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by BL0PR04MB6484.namprd04.prod.outlook.com (2603:10b6:208:1c1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Wed, 10 Feb
 2021 03:15:36 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d%7]) with mapi id 15.20.3825.030; Wed, 10 Feb 2021
 03:15:36 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
CC:     Atish Patra <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>,
        Sean Anderson <seanga2@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v18 01/16] clk: Add RISC-V Canaan Kendryte K210 clock
 driver
Thread-Topic: [PATCH v18 01/16] clk: Add RISC-V Canaan Kendryte K210 clock
 driver
Thread-Index: AQHW/t9XApJD7mlFuEyRKf7oQMzIIQ==
Date:   Wed, 10 Feb 2021 03:15:36 +0000
Message-ID: <BL0PR04MB6514E2ED802BAE7E6350E304E78D9@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20210209123014.165928-1-damien.lemoal@wdc.com>
 <20210209123014.165928-2-damien.lemoal@wdc.com>
 <161292028178.418021.10953574123293354986@swboyd.mtv.corp.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:f420:fabe:ea5e:e152]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3daf937d-a70b-4c92-c115-08d8cd72229b
x-ms-traffictypediagnostic: BL0PR04MB6484:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR04MB64847516FAF8EE1B8BCB385EE78D9@BL0PR04MB6484.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l+dKE0Z06WHdg+vlxKKGcoMzKOlqD9pULFbm5KE3E4F1DgNoJVBX/AKj6Kb7GmarxNJy8+PvS+VJjS7+tQxT/Fzpi+VEJj5qCSgcpyQcrKKU2NOmKUNh7y+qPYpFYVroMOvZifVkKSzOD6WIcdF62lnhfwEX2uB7VTB8s8/eLVtUV3N6UeP4QXwLF5zmhay6hIi7DHiH54KgFaS8MY4ymyhBcd3VKFHmbk6534/fVHWpUK88y8s0w5rYUZixXKvDbbNO9FOqoAghYo54RUGYFTwvXKDzKqhQL5FhmCpFZgApDESCu1rkp1FqOw0hsIQ2BQM3IVi2539FKZC2zlthNyCZfneg9n60Bh2MjWHZWHyq/dAh9aR4++EiIMUb/bszQKwZl5jK35mtKly1ZSdgQa5i5vy9OdCowyeLSZDRsFD2GxOUxVWTPEvB+ol339kj5/GUpiGmGOK5kBVb+PAVeTpVa3m3X7pjDB+hj8H6UuxQXU/y4HILD9CxXspybwtbD/y5NUWvJJGerBuMuOUncw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR04MB6514.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6506007)(53546011)(33656002)(71200400001)(186003)(86362001)(9686003)(8676002)(110136005)(55016002)(83380400001)(4326008)(54906003)(498600001)(5660300002)(52536014)(2906002)(7696005)(66476007)(66556008)(64756008)(66446008)(76116006)(66946007)(91956017)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?53AyIxBU++y1v5jgbGWkPREqsTLu6BTAA18D/YORf9TI5GTrHQBcFL4jdtyY?=
 =?us-ascii?Q?ZI2T9gXNA0KcWzKogm8VIx13TdxrLWwxWkIpYPR/YjnnhSOneudKHpH+84gx?=
 =?us-ascii?Q?gaDAXcyr3eh1dru9yGYdfyAELY4XD5sImrapjpG/DGHnMv5gxZcTF7H1wzRq?=
 =?us-ascii?Q?EJZLFm/d9nojoIvOBy2dyQ+DXtcLNUv201TeOqz5r5nKhXvaWFOQ63dztpbH?=
 =?us-ascii?Q?VrpbG9aF1LG/5/sScQZVy4sEorBNJjjy8geqRYmdI6aTXUxGOH/Z9axwh6YE?=
 =?us-ascii?Q?eUgx7WCMtTa88OUy2VG4Txm6W5GhVBc78v8daxByNGN92Dr+FQjwSu3FjMaR?=
 =?us-ascii?Q?8Dmx9ffJUdGA6mzMcm7esAa2yqXVQqROdKRGpphFhH7W0FOBCCIC7hpa/AiH?=
 =?us-ascii?Q?4LW5WHefmkYHRBHzKeM+KXycDgUXgKc3v/7oSbVr6gTdPZWPMkbPeUNP7bJG?=
 =?us-ascii?Q?/+mYU34jiA+cJXe301cNmDOdiA29eurzD8fdlMEPctFMI0xBHyVw325l/M18?=
 =?us-ascii?Q?/r8w1xlDbSmTfzCKiFNUgY/UPH/AEqIhpgZmn1Jpj85Zz3BrSvBkExx0KbkS?=
 =?us-ascii?Q?oDBGKc1cX7cPF5miJvq96DkklA8WFBLW6AMvUTn+vYbZMM8simyT1sY5uct9?=
 =?us-ascii?Q?XB65W3ozyjL+BhifmyFz/oytnMgpaB+eWaCX5Ra5dyIFSgYqUZjgGmi24Ttf?=
 =?us-ascii?Q?TxJqXTbr4+Ycaq7gyzH8jD4Kpin8r9izyF0Ggt5yodW/OaXsabQtNsBW6ou4?=
 =?us-ascii?Q?W7LdugrFoD8Vg10ikNg/w86Q+IK40Ef8nXhiOZSiiWoXrasOaWZcQeYRNjGh?=
 =?us-ascii?Q?MdEQgxSAaPI2RHWVji4MivbaJgT9WvAakcjwavs0yYwPX38EHKudP3Wog0O6?=
 =?us-ascii?Q?2qQvS6SENZ8SsUqOj+Ejz9jrtG2H1QBVosoII5KjkP7KKBqapEgXOWxpAgJp?=
 =?us-ascii?Q?S5iFAvG5i6ISxI9+j0GgtubkILvNpd3kWiu243x1bQPWQkLuYEjwfUeFbbZ2?=
 =?us-ascii?Q?IHgJLSmT28+YJ1Aim0xKwOTd8TO41XdPVZokA3taLPixgW4kCSiICEKMqyzw?=
 =?us-ascii?Q?wBKDuMoB08uAM8LP3ifm9Enm7L7Evpp96qPo2KtXmgagQ9jziPBJBkk5E4/V?=
 =?us-ascii?Q?4DH713aa+B7l+6jIjsx75DhhfIXHdeNLTI7MkC3670LU+ebpwRIFON6G5X/t?=
 =?us-ascii?Q?H/9mK5ieVeOkneISNg4PHlKiUZi12hZ4MqJeueb7UFJxHmxgECxwYz27qTqs?=
 =?us-ascii?Q?eJ/QHy/7HXrh2NNYHyh2FeSytTXwmeCWMoFRuURY4MkosVwS1G4O4idRbwWF?=
 =?us-ascii?Q?8zowkRPROIZctyvWxINNYIBvdy2ssk6y6QsNoL5rQdcGiyrY6jn1e/+BuvLv?=
 =?us-ascii?Q?Kj/Eq3crc/m6DzYUQkfuv8T5Mc6vA0+UfP3Lo1BXZHnFprDfxQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3daf937d-a70b-4c92-c115-08d8cd72229b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2021 03:15:36.2349
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cg5DR8nJC9Kco0qAOEeBassTjxv2DTj/Y7PwBQnr7aOGm1OObfoR+EjU+lgCY1Ht9G44bcjKmmM5hESISqd+kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB6484
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2021/02/10 10:24, Stephen Boyd wrote:=0A=
> Quoting Damien Le Moal (2021-02-09 04:29:59)=0A=
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
>> populating its child nodes. The sysctl driver retains the SOC early=0A=
>> initialization code, but the implementation now relies on the new=0A=
>> function k210_clk_early_init() provided by the new clk-k210 driver.=0A=
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
>> Reviewed-by: Anup Patel <anup@brainfault.org>=0A=
>> ---=0A=
> =0A=
> My inbox has this one patch multiple times and no changelog here. I also=
=0A=
> don't see the cover letter, so I guess I wasn't Cced? Can you please add=
=0A=
> a changelog so I know if anything has changed?=0A=
=0A=
My apologies about this. I forgot to CC you on the cover letter. Will do fo=
r the=0A=
next version.=0A=
=0A=
[...]=0A=
>> +static const struct clk_ops k210_clk_ops =3D {=0A=
>> +       .enable         =3D k210_clk_enable,=0A=
>> +       .disable        =3D k210_clk_disable,=0A=
>> +       .recalc_rate    =3D k210_clk_get_rate,=0A=
>> +};=0A=
> =0A=
> From here...=0A=
> =0A=
>> +=0A=
>> +static void k210_register_clk(struct k210_sysclk *ksc, int id,=0A=
>> +                             const struct clk_parent_data *parent_data,=
=0A=
>> +                             int num_parents, unsigned long flags)=0A=
>> +{=0A=
>> +       struct k210_clk *kclk =3D &ksc->clks[id];=0A=
>> +       struct clk_init_data init =3D {};=0A=
>> +       int ret;=0A=
>> +=0A=
>> +       init.name =3D k210_clk_cfgs[id].name;=0A=
>> +       init.flags =3D flags;=0A=
>> +       init.parent_data =3D parent_data;=0A=
>> +       init.num_parents =3D num_parents;=0A=
>> +       if (num_parents > 1)=0A=
>> +               init.ops =3D &k210_clk_mux_ops;=0A=
>> +       else=0A=
>> +               init.ops =3D &k210_clk_ops;=0A=
>> +=0A=
>> +       kclk->id =3D id;=0A=
>> +       kclk->ksc =3D ksc;=0A=
>> +       kclk->hw.init =3D &init;=0A=
>> +=0A=
>> +       ret =3D clk_hw_register(NULL, &kclk->hw);=0A=
>> +       if (ret) {=0A=
>> +               pr_err("%pOFP: register clock %s failed\n",=0A=
>> +                      ksc->node, k210_clk_cfgs[id].name);=0A=
>> +               kclk->id =3D -1;=0A=
>> +       }=0A=
>> +}=0A=
>> +=0A=
>> +/*=0A=
>> + * All muxed clocks have IN0 and PLL0 as parents.=0A=
>> + */=0A=
>> +static inline void k210_register_mux_clk(struct k210_sysclk *ksc,=0A=
>> +                                        const char *in0, int id)=0A=
>> +{=0A=
>> +       const struct clk_parent_data parent_data[2] =3D {=0A=
>> +               { .name =3D in0 },=0A=
>> +               { .hw =3D &ksc->plls[K210_PLL0].hw },=0A=
>> +       };=0A=
>> +=0A=
>> +       k210_register_clk(ksc, id, parent_data, 2, 0);=0A=
>> +}=0A=
>> +=0A=
>> +static inline void k210_register_in0_child(struct k210_sysclk *ksc,=0A=
>> +                                          const char *in0, int id)=0A=
>> +{=0A=
>> +       const struct clk_parent_data parent_data =3D {=0A=
>> +               .name =3D in0,=0A=
>> +       };=0A=
>> +=0A=
>> +       k210_register_clk(ksc, id, &parent_data, 1, 0);=0A=
>> +}=0A=
>> +=0A=
>> +static inline void k210_register_pll_child(struct k210_sysclk *ksc, int=
 id,=0A=
>> +                                          enum k210_pll_id pllid,=0A=
>> +                                          unsigned long flags)=0A=
>> +{=0A=
>> +       const struct clk_parent_data parent_data =3D {=0A=
>> +               .hw =3D &ksc->plls[pllid].hw,=0A=
>> +       };=0A=
>> +=0A=
>> +       k210_register_clk(ksc, id, &parent_data, 1, flags);=0A=
>> +}=0A=
>> +=0A=
>> +static inline void k210_register_aclk_child(struct k210_sysclk *ksc, in=
t id,=0A=
>> +                                           unsigned long flags)=0A=
>> +{=0A=
>> +       const struct clk_parent_data parent_data =3D {=0A=
>> +               .hw =3D &ksc->aclk,=0A=
>> +       };=0A=
>> +=0A=
>> +       k210_register_clk(ksc, id, &parent_data, 1, flags);=0A=
>> +}=0A=
>> +=0A=
>> +static inline void k210_register_clk_child(struct k210_sysclk *ksc, int=
 id,=0A=
>> +                                          int parent_id)=0A=
>> +{=0A=
>> +       const struct clk_parent_data parent_data =3D {=0A=
>> +               .hw =3D &ksc->clks[parent_id].hw,=0A=
>> +       };=0A=
>> +=0A=
>> +       k210_register_clk(ksc, id, &parent_data, 1, 0);=0A=
>> +}=0A=
> =0A=
> .. to here, shouldn't these all gain __init?=0A=
=0A=
Yes indeed, they can. Fixed that.=0A=
=0A=
>> +=0A=
>> +static struct clk_hw *k210_clk_hw_onecell_get(struct of_phandle_args *c=
lkspec,=0A=
>> +                                             void *data)=0A=
>> +{=0A=
>> +       struct k210_sysclk *ksc =3D data;=0A=
>> +       unsigned int idx =3D clkspec->args[0];=0A=
>> +=0A=
>> +       if (idx >=3D K210_NUM_CLKS)=0A=
>> +               return ERR_PTR(-EINVAL);=0A=
>> +=0A=
>> +       return &ksc->clks[idx].hw;=0A=
>> +}=0A=
>> +=0A=
>> +static void __init k210_clk_init(struct device_node *np)=0A=
>> +{=0A=
>> +       struct device_node *sysctl_np;=0A=
>> +       struct k210_sysclk *ksc;=0A=
>> +       const char *in0;=0A=
>> +       int i, ret;=0A=
>> +=0A=
>> +       ksc =3D kzalloc(sizeof(*ksc), GFP_KERNEL);=0A=
>> +       if (!ksc)=0A=
>> +               return;=0A=
>> +=0A=
>> +       ksc->node =3D np;=0A=
>> +       spin_lock_init(&ksc->clk_lock);=0A=
>> +       sysctl_np =3D of_get_parent(np);=0A=
>> +       ksc->regs =3D of_iomap(sysctl_np, 0);=0A=
>> +       of_node_put(sysctl_np);=0A=
>> +       if (!ksc->regs) {=0A=
>> +               pr_err("%pOFP: failed to map registers\n", np);=0A=
>> +               return;=0A=
>> +       }=0A=
>> +=0A=
>> +       in0 =3D of_clk_get_parent_name(np, 0);=0A=
> =0A=
> I'm still lost why we need to get the clk parent name here vs. using the=
=0A=
> index approach and using clk_parent_data. There were some comments about=
=0A=
> #clock-cells which didn't make sense to me. The fixed rate clk in DT=0A=
> should have #clock-cells as it is a clk.=0A=
=0A=
It is like this because I could not get your suggested approach to work. I =
am=0A=
using clk_parent_data[]->hw for specifying the parents of the clocks regist=
ered=0A=
by this driver. But using this data structure, I failed to figure out how t=
o=0A=
specify the "in0" clock as a parent without using the clock name itself. Th=
e=0A=
other option I see is using fw_name (I do not understand that one) and hw, =
but I=0A=
do not have that pointer since the clock is registered by the common framew=
ork.=0A=
What am I missing here ?=0A=
=0A=
>> +       if (!in0) {=0A=
>> +               pr_err("%pOFP: undefined fixed-rate oscillator clock\n",=
 np);=0A=
>> +               return;=0A=
>> +       }=0A=
>> +=0A=
>> +       ret =3D k210_register_plls(ksc, in0);=0A=
> =0A=
> I suspect the 'np' should be passed to these functions instead, and then=
=0A=
> use of_clk_hw_register().=0A=
=0A=
Done.=0A=
I also addressed all your nits. Thanks for the comments.=0A=
=0A=
=0A=
-- =0A=
Damien Le Moal=0A=
Western Digital Research=0A=
