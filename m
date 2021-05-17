Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1FC4C433B4
	for <linux-clk@archiver.kernel.org>; Mon, 17 May 2021 09:52:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B798B610FC
	for <linux-clk@archiver.kernel.org>; Mon, 17 May 2021 09:52:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231360AbhEQJxz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 May 2021 05:53:55 -0400
Received: from mail-eopbgr50068.outbound.protection.outlook.com ([40.107.5.68]:58350
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229474AbhEQJxy (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 17 May 2021 05:53:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ViParPoTKroK0N8AdJBhUBKINy0gTuLU9bh9e4/7gWPIYQIGIotPeXkPZ/Zn5fRAUdV+Zzb0b/5QQMZHdE6AUHwUrysxSjpy52q+An70AuSeHdGVOiFGK73gtU5/fuYQGjpsL41BklteOAX1aRdA0tMt1ASrFtOoTSW6vviF/b2slXFdxAKVY3TsVMeUZOzYv6TmFcwPmj4J43sb2DamupSg0YQF1G2lkO0inIZVOb++HI5xftARZlMGUhc1nCSnKTX1t5+zx28ImSV5XP7/KQD/nMybQwWNHnI2Jj0hE6sA2qv3GGmrv7tJU7IZ6A4FPsHJZfhGnEAY3SQa8lC4aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ZQFsSU27Hp7Q9UawavqlAHULkThcfNKQLHHkbDZ56Y=;
 b=Mt4VunU5T1v2gdCD4VxwE2B6fSOAjnriQxIPI5Dwu+YbVyYXPmVgdCMqnzoeY1JN5pWwkuJ2UeZW2KbQTFnrgthnB3iZ4gcB19QPQaGIUuiH1vMYU08G5APghOrqi2KGW6uJ/Bx04DiJDsfw/yawGRHAGQFJrtDHNaveIzmUs6lX77W9A+KOFYVm5vri/6J0+pyCGP/1IVUM+zM51TINBS721L4AD0ekXZGglO3PXNufTHS13QrAKB1Olwa7JHkhYcXE/4x0VMSwhzuTqKekXNQpabtkgXjqKx4Nvw1Tqu5R6dYYo3k2TUNjMXgNb1DYtJGod4Z1l2wH0p8Q7EPniw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ZQFsSU27Hp7Q9UawavqlAHULkThcfNKQLHHkbDZ56Y=;
 b=jBQeSGM2u8DZGXc6Ws/TUix85A+d56i9jAy5PHDtcfGlOcQZXYjHkvq7eUrr14w7cRuWmeh3C+6nntX8me9Fuc7cRuYhEXFxj40RDVQXC5kcrZaT09X7u5KVFjL7m4R+9TOPKa0KBAgLSw2n1ykzk6Hg2InZCvZAEtDfNF5Onjw=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com (2603:10a6:800:57::8)
 by VI1PR0402MB3614.eurprd04.prod.outlook.com (2603:10a6:803:b::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Mon, 17 May
 2021 09:52:33 +0000
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::49a5:9:d201:2382]) by VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::49a5:9:d201:2382%6]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 09:52:32 +0000
Date:   Mon, 17 May 2021 12:52:31 +0300
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Dong Aisheng <dongas86@gmail.com>
Cc:     Abel Vesa <abelvesa@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 4/6] clk: imx: scu: add gpr clocks support
Message-ID: <YKI836Pql7vFUVqO@ryzen.lan>
References: <20210423033334.3317992-1-aisheng.dong@nxp.com>
 <20210423033334.3317992-4-aisheng.dong@nxp.com>
 <YJzN/MLXf22E/OQd@ryzen.lan>
 <CAA+hA=S4Bvf_LFRMvKmC5VDWR_rgSZPyWCYO+cfU+X-2sN-xkQ@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA+hA=S4Bvf_LFRMvKmC5VDWR_rgSZPyWCYO+cfU+X-2sN-xkQ@mail.gmail.com>
X-Originating-IP: [188.27.175.31]
X-ClientProxiedBy: VI1P190CA0017.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::30) To VI1PR0401MB2559.eurprd04.prod.outlook.com
 (2603:10a6:800:57::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ryzen.lan (188.27.175.31) by VI1P190CA0017.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:2b::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.32 via Frontend Transport; Mon, 17 May 2021 09:52:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c11db1e-2073-467f-d136-08d919197ddd
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3614:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB36144A3D53BD026C90B85EABF62D9@VI1PR0402MB3614.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VDTqKvoJl7spQz1TrTZq+zjIRW6BFSayachXtNRgFO8r6lh9nvO9E8fvNQA9F5ZSu+Urm//CshJKEVoabgQdZ9PBUdzIhIXHnWx3pcLLzJt4s6axYUJNtNigvvAFUu9x4Bg4W0zJP8qWDSdZd8PbI+/gR663liqHCW55NMIjMHjTONwv4IghsFIhHnLj0Ue8UyaLBiDKRQSVV9u2Os5ZptR05bLSVlcllzmbbzN9p9WkZGPyW9eXP1TThhX3bElDOXjwR9YFbokYOzFLYc+0IJ5FZabCz7FfPC919PcHSUknGXIW+up16PzBJKRiE9WbpVMQlevKS/izZ1U3+rJuit5ULHpnmgseBoSn+jy4aQzDz2y0/BSisagDaIlfR3p9znFmiqCLRQojzadRaWoFlDph78F5TOfBQ7QUsyfshtoFVxJRHTtZlnZzhUma07PahiJ05IvNW+dQBegsFdINbICMUzlY5Cshe/usgrZ2/D+iIYle01TaIGTzg1ddN44P+WKP9LZNJCC+1q99s3MTan8kopBnRNnkJdvW5qyUdDUcPtoTKt+CACwqHDOdU5wj/iut8AMXXXyS785bD7Inx3bEXVokFoC2nZ6FKZLZB/MhNxTpchelWZbGxfyPe5nO9+f88pNAI+UXCpVI3qFKmGi165FK6o/uazyiT7AaQEg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2559.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(39850400004)(136003)(346002)(366004)(54906003)(44832011)(478600001)(66476007)(66556008)(6506007)(66946007)(8676002)(6916009)(36756003)(55016002)(7696005)(8886007)(8936002)(5660300002)(26005)(4326008)(38350700002)(38100700002)(16526019)(186003)(956004)(86362001)(9686003)(83380400001)(2906002)(52116002)(53546011)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?3fqcSNmrKmsGCMmILawlAhcNw7bfUUtcKa3z/Tw0lUPcPXgCXDS6zA8ucnpR?=
 =?us-ascii?Q?sMPhzBysdY3px0PbhoeEWoA7FM1/iNqoULcBas1HW7KIix/mXXrGWvz8oCQz?=
 =?us-ascii?Q?JL5yAGM7cnIatp6z/vJFwewJSNjP8+MDMXFVsdsxX2JVUKCwMxRrCbIvKG+5?=
 =?us-ascii?Q?Sbat20QtRDJ5rECYj7G01fJkVJWqqZLJKJz1JV6spR1i7Wkhwk9fyo7isDms?=
 =?us-ascii?Q?xYPzH8AVhY0fnqY7eQ9FtqKDVmHEmMpRAH4WwWBPCuhE5vtOhqgXdgzkj5Kw?=
 =?us-ascii?Q?d5Dhd4w+OoLqtklmMrFvRs6+kk94g0V3AIQaxHa1sqFEynXO35yAlvhVkhGQ?=
 =?us-ascii?Q?hI6ruCUhMx0iG2+TeGXZlUm6YFXs9Pn4owu+gJ+OPUbUsV5ZRj6s6CPUCWey?=
 =?us-ascii?Q?Rc7BnHaFnxeZkZIjtNoq/RPKlg0WZHCrkZjOK7vS0Zy5yn4ShKUsPl2J1eWa?=
 =?us-ascii?Q?wxFcAATMXHevotBF8UKKJ/z89sS4cdhalR+LiNJsHuJBGGzGBlUdVBozDR/2?=
 =?us-ascii?Q?uP7i1TCYgO4Gbd/87XlIDWE6+W5eA1ZAVJuU7Rusm11/T7VTWuTd7YLx+wvc?=
 =?us-ascii?Q?KBhnaGr15azESBhfoTvRr2UQGUcK/51kyl7ZyeA74Kg6p3tdj9iNpvTv3ff2?=
 =?us-ascii?Q?/Do4Y0X75Lri8LDMoKupKvQwtq2dwkh1WthX38hx8q1QvthM5E7GyCBZ1FHg?=
 =?us-ascii?Q?iLlBYf/uAOGBaldN4hmNtMU6LrDUdKSmiWiKhFhQ77ZmTAEQ6Nfbt2x52Wz+?=
 =?us-ascii?Q?0yG/DntoD6AzPuaHbJ51CU4hYiP4wrUQgdo/rOPnQtPR8kyjHM1raDqe5Vit?=
 =?us-ascii?Q?WcUqXTL3l5zHI6tjY9077XR02qUaEL07Ouftbx6wZR8upB+8nwLLy/LAYEiY?=
 =?us-ascii?Q?S2nouoxylXELVfIJaizF+V24vcnj0p8xI9I3f/uji8dThq7accFVdgMkjLf+?=
 =?us-ascii?Q?e5FJAR0eUAwEZ3CH4qDN1hpcXqjgK+AZ3NDqPGOm6OYUv9Dd6fvxBBFi6hIT?=
 =?us-ascii?Q?aQ1jbB0rUmgAFOY2sywCfJZApkB2bg5K/IEvKGIiLjZrM7dVzIAUxke7N1NG?=
 =?us-ascii?Q?7IzXfEGZCJKIgTymPAr+8LPV/p0yWr3vqiKjhujFZYaBJRAelzfDmKqJFDaA?=
 =?us-ascii?Q?8TBOT+ZuwRJUw75k/gv1mz4gTpvb7OzLmS5lujHni8sf1AQmfOZqE7MYkwbf?=
 =?us-ascii?Q?Y0r5IH8pZ3LMVK8JSGVo3NbspnAZYv2HAyBT1h/DwQsY4z+ZarECeA7fisXm?=
 =?us-ascii?Q?rs43ENlkD1GyMEcA5jIQZvfLbwaFbzgRJOie7t8hUTolnSH0Dbu1rCLgTPdN?=
 =?us-ascii?Q?c2qNJOBOmhxymUJJ1hwAHb4i?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c11db1e-2073-467f-d136-08d919197ddd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2559.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 09:52:32.7910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zMXG580pcNTJjDUTSEKygeJQ0eqZYa6GA1//G+ZBwR/E0/DvRzGQSjfFdKGJHgVV4wBFEXyJiSek9IytUBoRMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3614
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21-05-17 17:49:08, Dong Aisheng wrote:
> On Thu, May 13, 2021 at 2:58 PM Abel Vesa <abelvesa@kernel.org> wrote:
> >
> > On 21-04-23 11:33:32, Dong Aisheng wrote:
> > > SCU clock protocol supports a few clocks based on GPR controller
> > > registers including mux/divider/gate.
> > > And a general clock register API to support them all.
> >
> > You mean "Add a generic", right ?
> 
> Good catch.
> Please let me know if you want a resend.
> Thanks
> 

No need to resend. I'll reword it myself.

Thanks.

> Regards
> Aisheng
> 
> >
> > Otherwise, looks OK to me.
> >
> > Reviewed-by: Abel Vesa <abel.vesa@nxp.com>
> >
> > >
> > > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > > ---
> > >  drivers/clk/imx/clk-scu.c | 186 ++++++++++++++++++++++++++++++++++++++
> > >  drivers/clk/imx/clk-scu.h |  29 ++++++
> > >  2 files changed, 215 insertions(+)
> > >
> > > diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
> > > index 1f5518b7ab39..cff0e1bd7030 100644
> > > --- a/drivers/clk/imx/clk-scu.c
> > > +++ b/drivers/clk/imx/clk-scu.c
> > > @@ -52,6 +52,22 @@ struct clk_scu {
> > >       u32 rate;
> > >  };
> > >
> > > +/*
> > > + * struct clk_gpr_scu - Description of one SCU GPR clock
> > > + * @hw: the common clk_hw
> > > + * @rsrc_id: resource ID of this SCU clock
> > > + * @gpr_id: GPR ID index to control the divider
> > > + */
> > > +struct clk_gpr_scu {
> > > +     struct clk_hw hw;
> > > +     u16 rsrc_id;
> > > +     u8 gpr_id;
> > > +     u8 flags;
> > > +     bool gate_invert;
> > > +};
> > > +
> > > +#define to_clk_gpr_scu(_hw) container_of(_hw, struct clk_gpr_scu, hw)
> > > +
> > >  /*
> > >   * struct imx_sc_msg_req_set_clock_rate - clock set rate protocol
> > >   * @hdr: SCU protocol header
> > > @@ -604,3 +620,173 @@ void imx_clk_scu_unregister(void)
> > >               }
> > >       }
> > >  }
> > > +
> > > +static unsigned long clk_gpr_div_scu_recalc_rate(struct clk_hw *hw,
> > > +                                              unsigned long parent_rate)
> > > +{
> > > +     struct clk_gpr_scu *clk = to_clk_gpr_scu(hw);
> > > +     unsigned long rate = 0;
> > > +     u32 val;
> > > +     int err;
> > > +
> > > +     err = imx_sc_misc_get_control(ccm_ipc_handle, clk->rsrc_id,
> > > +                                   clk->gpr_id, &val);
> > > +
> > > +     rate  = val ? parent_rate / 2 : parent_rate;
> > > +
> > > +     return err ? 0 : rate;
> > > +}
> > > +
> > > +static long clk_gpr_div_scu_round_rate(struct clk_hw *hw, unsigned long rate,
> > > +                                unsigned long *prate)
> > > +{
> > > +     if (rate < *prate)
> > > +             rate = *prate / 2;
> > > +     else
> > > +             rate = *prate;
> > > +
> > > +     return rate;
> > > +}
> > > +
> > > +static int clk_gpr_div_scu_set_rate(struct clk_hw *hw, unsigned long rate,
> > > +                                 unsigned long parent_rate)
> > > +{
> > > +     struct clk_gpr_scu *clk = to_clk_gpr_scu(hw);
> > > +     uint32_t val;
> > > +     int err;
> > > +
> > > +     val = (rate < parent_rate) ? 1 : 0;
> > > +     err = imx_sc_misc_set_control(ccm_ipc_handle, clk->rsrc_id,
> > > +                                   clk->gpr_id, val);
> > > +
> > > +     return err ? -EINVAL : 0;
> > > +}
> > > +
> > > +static const struct clk_ops clk_gpr_div_scu_ops = {
> > > +     .recalc_rate = clk_gpr_div_scu_recalc_rate,
> > > +     .round_rate = clk_gpr_div_scu_round_rate,
> > > +     .set_rate = clk_gpr_div_scu_set_rate,
> > > +};
> > > +
> > > +static u8 clk_gpr_mux_scu_get_parent(struct clk_hw *hw)
> > > +{
> > > +     struct clk_gpr_scu *clk = to_clk_gpr_scu(hw);
> > > +     u32 val = 0;
> > > +
> > > +     imx_sc_misc_get_control(ccm_ipc_handle, clk->rsrc_id,
> > > +                             clk->gpr_id, &val);
> > > +
> > > +     return (u8)val;
> > > +}
> > > +
> > > +static int clk_gpr_mux_scu_set_parent(struct clk_hw *hw, u8 index)
> > > +{
> > > +     struct clk_gpr_scu *clk = to_clk_gpr_scu(hw);
> > > +
> > > +     return imx_sc_misc_set_control(ccm_ipc_handle, clk->rsrc_id,
> > > +                                    clk->gpr_id, index);
> > > +}
> > > +
> > > +static const struct clk_ops clk_gpr_mux_scu_ops = {
> > > +     .get_parent = clk_gpr_mux_scu_get_parent,
> > > +     .set_parent = clk_gpr_mux_scu_set_parent,
> > > +};
> > > +
> > > +static int clk_gpr_gate_scu_prepare(struct clk_hw *hw)
> > > +{
> > > +     struct clk_gpr_scu *clk = to_clk_gpr_scu(hw);
> > > +
> > > +     return imx_sc_misc_set_control(ccm_ipc_handle, clk->rsrc_id,
> > > +                                    clk->gpr_id, !clk->gate_invert);
> > > +}
> > > +
> > > +static void clk_gpr_gate_scu_unprepare(struct clk_hw *hw)
> > > +{
> > > +     struct clk_gpr_scu *clk = to_clk_gpr_scu(hw);
> > > +     int ret;
> > > +
> > > +     ret = imx_sc_misc_set_control(ccm_ipc_handle, clk->rsrc_id,
> > > +                                   clk->gpr_id, clk->gate_invert);
> > > +     if (ret)
> > > +             pr_err("%s: clk unprepare failed %d\n", clk_hw_get_name(hw),
> > > +                    ret);
> > > +}
> > > +
> > > +static int clk_gpr_gate_scu_is_prepared(struct clk_hw *hw)
> > > +{
> > > +     struct clk_gpr_scu *clk = to_clk_gpr_scu(hw);
> > > +     int ret;
> > > +     u32 val;
> > > +
> > > +     ret = imx_sc_misc_get_control(ccm_ipc_handle, clk->rsrc_id,
> > > +                                   clk->gpr_id, &val);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     return clk->gate_invert ? !val : val;
> > > +}
> > > +
> > > +static const struct clk_ops clk_gpr_gate_scu_ops = {
> > > +     .prepare = clk_gpr_gate_scu_prepare,
> > > +     .unprepare = clk_gpr_gate_scu_unprepare,
> > > +     .is_prepared = clk_gpr_gate_scu_is_prepared,
> > > +};
> > > +
> > > +struct clk_hw *__imx_clk_gpr_scu(const char *name, const char * const *parent_name,
> > > +                              int num_parents, u32 rsrc_id, u8 gpr_id, u8 flags,
> > > +                              bool invert)
> > > +{
> > > +     struct imx_scu_clk_node *clk_node;
> > > +     struct clk_gpr_scu *clk;
> > > +     struct clk_hw *hw;
> > > +     struct clk_init_data init;
> > > +     int ret;
> > > +
> > > +     if (rsrc_id >= IMX_SC_R_LAST || gpr_id >= IMX_SC_C_LAST)
> > > +             return ERR_PTR(-EINVAL);
> > > +
> > > +     clk_node = kzalloc(sizeof(*clk_node), GFP_KERNEL);
> > > +     if (!clk_node)
> > > +             return ERR_PTR(-ENOMEM);
> > > +
> > > +     clk = kzalloc(sizeof(*clk), GFP_KERNEL);
> > > +     if (!clk) {
> > > +             kfree(clk_node);
> > > +             return ERR_PTR(-ENOMEM);
> > > +     }
> > > +
> > > +     clk->rsrc_id = rsrc_id;
> > > +     clk->gpr_id = gpr_id;
> > > +     clk->flags = flags;
> > > +     clk->gate_invert = invert;
> > > +
> > > +     if (flags & IMX_SCU_GPR_CLK_GATE)
> > > +             init.ops = &clk_gpr_gate_scu_ops;
> > > +
> > > +     if (flags & IMX_SCU_GPR_CLK_DIV)
> > > +             init.ops = &clk_gpr_div_scu_ops;
> > > +
> > > +     if (flags & IMX_SCU_GPR_CLK_MUX)
> > > +             init.ops = &clk_gpr_mux_scu_ops;
> > > +
> > > +     init.flags = 0;
> > > +     init.name = name;
> > > +     init.parent_names = parent_name;
> > > +     init.num_parents = num_parents;
> > > +
> > > +     clk->hw.init = &init;
> > > +
> > > +     hw = &clk->hw;
> > > +     ret = clk_hw_register(NULL, hw);
> > > +     if (ret) {
> > > +             kfree(clk);
> > > +             kfree(clk_node);
> > > +             hw = ERR_PTR(ret);
> > > +     } else {
> > > +             clk_node->hw = hw;
> > > +             clk_node->clk_type = gpr_id;
> > > +             list_add_tail(&clk_node->node, &imx_scu_clks[rsrc_id]);
> > > +     }
> > > +
> > > +     return hw;
> > > +}
> > > diff --git a/drivers/clk/imx/clk-scu.h b/drivers/clk/imx/clk-scu.h
> > > index a6c6d3103e94..8ebee0cb0fe6 100644
> > > --- a/drivers/clk/imx/clk-scu.h
> > > +++ b/drivers/clk/imx/clk-scu.h
> > > @@ -10,6 +10,10 @@
> > >  #include <linux/firmware/imx/sci.h>
> > >  #include <linux/of.h>
> > >
> > > +#define IMX_SCU_GPR_CLK_GATE BIT(0)
> > > +#define IMX_SCU_GPR_CLK_DIV  BIT(1)
> > > +#define IMX_SCU_GPR_CLK_MUX  BIT(2)
> > > +
> > >  extern struct list_head imx_scu_clks[];
> > >  extern const struct dev_pm_ops imx_clk_lpcg_scu_pm_ops;
> > >
> > > @@ -31,6 +35,10 @@ struct clk_hw *__imx_clk_lpcg_scu(struct device *dev, const char *name,
> > >                                 void __iomem *reg, u8 bit_idx, bool hw_gate);
> > >  void imx_clk_lpcg_scu_unregister(struct clk_hw *hw);
> > >
> > > +struct clk_hw *__imx_clk_gpr_scu(const char *name, const char * const *parent_name,
> > > +                              int num_parents, u32 rsrc_id, u8 gpr_id, u8 flags,
> > > +                              bool invert);
> > > +
> > >  static inline struct clk_hw *imx_clk_scu(const char *name, u32 rsrc_id,
> > >                                        u8 clk_type)
> > >  {
> > > @@ -58,4 +66,25 @@ static inline struct clk_hw *imx_clk_lpcg_scu(const char *name, const char *pare
> > >       return __imx_clk_lpcg_scu(NULL, name, parent_name, flags, reg,
> > >                                 bit_idx, hw_gate);
> > >  }
> > > +
> > > +static inline struct clk_hw *imx_clk_gate_gpr_scu(const char *name, const char *parent_name,
> > > +                                               u32 rsrc_id, u8 gpr_id, bool invert)
> > > +{
> > > +     return __imx_clk_gpr_scu(name, &parent_name, 1, rsrc_id, gpr_id,
> > > +                              IMX_SCU_GPR_CLK_GATE, invert);
> > > +}
> > > +
> > > +static inline struct clk_hw *imx_clk_divider_gpr_scu(const char *name, const char *parent_name,
> > > +                                                  u32 rsrc_id, u8 gpr_id)
> > > +{
> > > +     return __imx_clk_gpr_scu(name, &parent_name, 1, rsrc_id, gpr_id,
> > > +                              IMX_SCU_GPR_CLK_DIV, 0);
> > > +}
> > > +
> > > +static inline struct clk_hw *imx_clk_mux_gpr_scu(const char *name, const char * const *parent_names,
> > > +                                              int num_parents, u32 rsrc_id, u8 gpr_id)
> > > +{
> > > +     return __imx_clk_gpr_scu(name, parent_names, num_parents, rsrc_id,
> > > +                              gpr_id, IMX_SCU_GPR_CLK_MUX, 0);
> > > +}
> > >  #endif
> > > --
> > > 2.25.1
> > >
