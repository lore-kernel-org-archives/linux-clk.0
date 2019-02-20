Return-Path: <SRS0=cs+B=Q3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95CB5C43381
	for <linux-clk@archiver.kernel.org>; Wed, 20 Feb 2019 07:14:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4AE3C2146E
	for <linux-clk@archiver.kernel.org>; Wed, 20 Feb 2019 07:14:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="u4BqGJR6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725869AbfBTHOR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 20 Feb 2019 02:14:17 -0500
Received: from mail-eopbgr140044.outbound.protection.outlook.com ([40.107.14.44]:58366
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725857AbfBTHOR (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 20 Feb 2019 02:14:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=92+nlmtOPYVEF7DPl1jCkqK+n6Q3ip6R+75nG4wEcKU=;
 b=u4BqGJR6OVexfMZVlMoyMer7X+iGnKRC6P2phEqQOG9yVwJ1ATGsj2HVaCVxKHk7vddL6N4kGzGS4ehrWIf3+hcjtPDBptq9cjqledF1raiZZkOzzbu8cWGQ7I8CatOjyNSslq8/3HICCbzLttuf+Oh+JHX2vqdoYKPd1osMVek=
Received: from AM6PR04MB4215.eurprd04.prod.outlook.com (52.135.168.141) by
 AM6PR04MB4888.eurprd04.prod.outlook.com (20.177.33.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1622.19; Wed, 20 Feb 2019 07:14:13 +0000
Received: from AM6PR04MB4215.eurprd04.prod.outlook.com
 ([fe80::e944:6749:3ee6:4e08]) by AM6PR04MB4215.eurprd04.prod.outlook.com
 ([fe80::e944:6749:3ee6:4e08%5]) with mapi id 15.20.1622.020; Wed, 20 Feb 2019
 07:14:13 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH 1/1] clk: imx: scu: add set parent support
Thread-Topic: [PATCH 1/1] clk: imx: scu: add set parent support
Thread-Index: AQHUuKEx5wW/zvLIHEGxAAYc3mdDGaXoZj/g
Date:   Wed, 20 Feb 2019 07:14:12 +0000
Message-ID: <AM6PR04MB4215F04E5D9CFF45AA7B3054807D0@AM6PR04MB4215.eurprd04.prod.outlook.com>
References: <1548855205-12249-1-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1548855205-12249-1-git-send-email-aisheng.dong@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f9bbd3eb-28a7-4589-183d-08d697030432
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM6PR04MB4888;
x-ms-traffictypediagnostic: AM6PR04MB4888:
x-microsoft-exchange-diagnostics: =?us-ascii?Q?1;AM6PR04MB4888;23:+6cl4slSnZVmqkkhsHF8kF+wdqWYbdsswAgjKR6yD?=
 =?us-ascii?Q?GdQdRK08ExuowV9r3u/IfyfVvm1XL23SG+qee0VKLIZp3ZltJqJBM8SCl/mU?=
 =?us-ascii?Q?Xak5RWqtbwmE70aNizDqGFzc9OgH8jwADpRh/AGonsqIefcuzLvlGmh97zXm?=
 =?us-ascii?Q?+qUFw0k869M1/6ldXuq1UK/5UuguoAVh3rpwPHJxlovogttGOb3xaHkmBmWX?=
 =?us-ascii?Q?JT0+eOhv5BTeOQNH/SWL6SFKipSUIp+oUjQT7aPOniA8eEO2HhGeRREstgEp?=
 =?us-ascii?Q?U1Fer4l9PASt+z75qVQmhIw9TCK4IkPJfaN3NLjvKoW1+Gw/NoKYptRlnsm2?=
 =?us-ascii?Q?HJF8SXyKB1sHibM7S/OUMI7CwFlFs1RWupfvYmgoUXhBMWHSzCg9rKsnKCW6?=
 =?us-ascii?Q?FNu4TpbIK8GTs872HZEAhGQXhRmieartmY4WywbX3E+I6wXqRwE6MF4ApV0E?=
 =?us-ascii?Q?2zTNZ50c0L5IKGy3zD27OP6w6gH03oDXHtDeTZLhZ0623fCgcpBtX6wm3S2V?=
 =?us-ascii?Q?SEtGetY8eyABzu3hD1cnAjJttx08iddgzj4eTbcJqGOtAP3W4YfmjihRifM7?=
 =?us-ascii?Q?+8MPGnS/ydWzz8h0dg75jb/Ef3W41VmXyfY/scOnyK3M8Khqq4lwucksJe4M?=
 =?us-ascii?Q?HQqKPEHSacMlEB6LllF4LYKOElcLGr7aBEXrzPMopL2Bm+hlU/7MWW1ne04Q?=
 =?us-ascii?Q?vStB0vGAg2DFc1cqPf8A54qxhUNFTg/d54YJU10Gpl6bcaIoEHcMBTwr7nb0?=
 =?us-ascii?Q?Y0zKTj/56jCgKY+5If6mTPkEMxpfn/JWetdH8W4Ms0CrBFOuacOZkIIeGSlN?=
 =?us-ascii?Q?7Sr3mtM7ySFPQ5bsCkoSdk9ihqqswO4Q5VYbs4XyYwPZsrf8xhBA2YTj3No6?=
 =?us-ascii?Q?mg1shDNARHMwz5M4KY6ZCQapao8URUKwmV5e5JaWiLvlmCk0AqTxNWmsNtzT?=
 =?us-ascii?Q?7sIiF5MBZ2gwlzXWTt7j34OCr8kDDAzudiwxcHVsFZ+0N/qWMlJ4KxuCyLCx?=
 =?us-ascii?Q?EvPU+lwkcwFnCVuNKG9626j2V0+2Fy0zAn8Ikr7a/32ZPiqzkS7ZmjQmt4xc?=
 =?us-ascii?Q?0EZEony7h7nE2UCQTbEM++cREVeQiM9hSuP1d7d1Eo6IruqegIWpYUloSoQA?=
 =?us-ascii?Q?uybm5mu2eCtogWwhma8w6jqS2trGdEWkKdEAbxmVNkNLaTabRxI6YFSaeWl4?=
 =?us-ascii?Q?is4H2vKPS90iGx0ActdDlHde/5q661Qh/Nl3R1/2oggohc7OPit2PGQJ4ALM?=
 =?us-ascii?Q?JIFc+xQwSczwsUgv18=3D?=
x-microsoft-antispam-prvs: <AM6PR04MB4888EA9DF7A53A9025079F8E807D0@AM6PR04MB4888.eurprd04.prod.outlook.com>
x-forefront-prvs: 0954EE4910
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(366004)(376002)(346002)(136003)(396003)(189003)(199004)(476003)(110136005)(11346002)(446003)(316002)(44832011)(102836004)(6506007)(26005)(186003)(4326008)(54906003)(486006)(229853002)(68736007)(105586002)(106356001)(2501003)(86362001)(2906002)(8676002)(9686003)(8936002)(6436002)(7736002)(97736004)(74316002)(53936002)(66066001)(25786009)(81166006)(81156014)(6246003)(14444005)(256004)(305945005)(71200400001)(71190400001)(478600001)(33656002)(3846002)(6116002)(14454004)(76176011)(55016002)(99286004)(5660300002)(7696005);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR04MB4888;H:AM6PR04MB4215.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4ryxiy0Q8c20+Gws6d2ABq4yigx6TnE8kRzAKCCNAWVQ4wF7Uf+hdMhACOfn8Nu8SvrKM5SSX/WjE3b9ymeCTnF7znKhvTJoR2Vf280MfHMqOUzZN2AZ//Kms0cMGr/jDthEfETORZ/jg9/wxP9qbnowvskQa0Fmomst+cDNpAhZ6erXnRTM2j1piNKy22Nj7sgGqGUuZTK3xWsQ8wDcYKoaTKsQO/CzdD+ET0Dkv/lj6XKeN7Y1WKCzHzQQZGMBQoatIQvAcXG1HX8+oU6IBkvsMxC1bVl/qLf3mgADkJBHLlnBcXLpquOoXMqtZPibqAJ9nQZRkdR+Dmn/F2KGhMFqjhTE4F5FXA9wiCrDeuHWR/Kvs4se43qkmjs4nQSyd9ApET3anBoRbJNT2tpnOjfDSja8N6diUQ0xeNtAW2Y=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9bbd3eb-28a7-4589-183d-08d697030432
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2019 07:14:12.9841
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4888
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Ping

> From: Aisheng Dong
> Sent: Wednesday, January 30, 2019 9:39 PM
>
> Add clk scu set parents support.
>=20
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
>  drivers/clk/imx/clk-scu.c | 87
> +++++++++++++++++++++++++++++++++++++++++++++--
>  drivers/clk/imx/clk-scu.h | 16 ++++++++-
>  2 files changed, 100 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c index
> 7ccf7ed..3c13c41 100644
> --- a/drivers/clk/imx/clk-scu.c
> +++ b/drivers/clk/imx/clk-scu.c
> @@ -66,6 +66,41 @@ struct imx_sc_msg_get_clock_rate {  };
>=20
>  /*
> + * struct imx_sc_msg_get_clock_parent - clock get parent protocol
> + * @hdr: SCU protocol header
> + * @req: get parent request protocol
> + * @resp: get parent response protocol
> + *
> + * This structure describes the SCU protocol of clock get parent  */
> +struct imx_sc_msg_get_clock_parent {
> +	struct imx_sc_rpc_msg hdr;
> +	union {
> +		struct req_get_clock_parent {
> +			__le16 resource;
> +			u8 clk;
> +		} __packed req;
> +		struct resp_get_clock_parent {
> +			u8 parent;
> +		} resp;
> +	} data;
> +};
> +
> +/*
> + * struct imx_sc_msg_set_clock_parent - clock set parent protocol
> + * @hdr: SCU protocol header
> + * @req: set parent request protocol
> + *
> + * This structure describes the SCU protocol of clock set parent  */
> +struct imx_sc_msg_set_clock_parent {
> +	struct imx_sc_rpc_msg hdr;
> +	__le16 resource;
> +	u8 clk;
> +	u8 parent;
> +} __packed;
> +
> +/*
>   * struct imx_sc_msg_req_clock_enable - clock gate protocol
>   * @hdr: SCU protocol header
>   * @resource: clock resource to gate
> @@ -173,6 +208,49 @@ static int clk_scu_set_rate(struct clk_hw *hw,
> unsigned long rate,
>  	return imx_scu_call_rpc(ccm_ipc_handle, &msg, true);  }
>=20
> +static u8 clk_scu_get_parent(struct clk_hw *hw) {
> +	struct clk_scu *clk =3D to_clk_scu(hw);
> +	struct imx_sc_msg_get_clock_parent msg;
> +	struct imx_sc_rpc_msg *hdr =3D &msg.hdr;
> +	int ret;
> +
> +	hdr->ver =3D IMX_SC_RPC_VERSION;
> +	hdr->svc =3D IMX_SC_RPC_SVC_PM;
> +	hdr->func =3D IMX_SC_PM_FUNC_GET_CLOCK_PARENT;
> +	hdr->size =3D 2;
> +
> +	msg.data.req.resource =3D cpu_to_le16(clk->rsrc_id);
> +	msg.data.req.clk =3D clk->clk_type;
> +
> +	ret =3D imx_scu_call_rpc(ccm_ipc_handle, &msg, true);
> +	if (ret) {
> +		pr_err("%s: failed to get clock parent %d\n",
> +		       clk_hw_get_name(hw), ret);
> +		return 0;
> +	}
> +
> +	return le32_to_cpu(msg.data.resp.parent);
> +}
> +
> +static int clk_scu_set_parent(struct clk_hw *hw, u8 index) {
> +	struct clk_scu *clk =3D to_clk_scu(hw);
> +	struct imx_sc_msg_set_clock_parent msg;
> +	struct imx_sc_rpc_msg *hdr =3D &msg.hdr;
> +
> +	hdr->ver =3D IMX_SC_RPC_VERSION;
> +	hdr->svc =3D IMX_SC_RPC_SVC_PM;
> +	hdr->func =3D IMX_SC_PM_FUNC_SET_CLOCK_PARENT;
> +	hdr->size =3D 2;
> +
> +	msg.resource =3D cpu_to_le16(clk->rsrc_id);
> +	msg.clk =3D clk->clk_type;
> +	msg.parent =3D index;
> +
> +	return imx_scu_call_rpc(ccm_ipc_handle, &msg, true); }
> +
>  static int sc_pm_clock_enable(struct imx_sc_ipc *ipc, u16 resource,
>  			      u8 clk, bool enable, bool autog)  { @@ -228,11 +306,14
> @@ static const struct clk_ops clk_scu_ops =3D {
>  	.recalc_rate =3D clk_scu_recalc_rate,
>  	.round_rate =3D clk_scu_round_rate,
>  	.set_rate =3D clk_scu_set_rate,
> +	.get_parent =3D clk_scu_get_parent,
> +	.set_parent =3D clk_scu_set_parent,
>  	.prepare =3D clk_scu_prepare,
>  	.unprepare =3D clk_scu_unprepare,
>  };
>=20
> -struct clk_hw *imx_clk_scu(const char *name, u32 rsrc_id, u8 clk_type)
> +struct clk_hw *__imx_clk_scu(const char *name, const char * const *paren=
ts,
> +			     int num_parents, u32 rsrc_id, u8 clk_type)
>  {
>  	struct clk_init_data init;
>  	struct clk_scu *clk;
> @@ -248,7 +329,9 @@ struct clk_hw *imx_clk_scu(const char *name, u32
> rsrc_id, u8 clk_type)
>=20
>  	init.name =3D name;
>  	init.ops =3D &clk_scu_ops;
> -	init.num_parents =3D 0;
> +	init.parent_names =3D parents;
> +	init.num_parents =3D num_parents;
> +
>  	/*
>  	 * Note on MX8, the clocks are tightly coupled with power domain
>  	 * that once the power domain is off, the clock status may be diff --gi=
t
> a/drivers/clk/imx/clk-scu.h b/drivers/clk/imx/clk-scu.h index 52c1746..2b=
cfaf0
> 100644
> --- a/drivers/clk/imx/clk-scu.h
> +++ b/drivers/clk/imx/clk-scu.h
> @@ -10,7 +10,21 @@
>  #include <linux/firmware/imx/sci.h>
>=20
>  int imx_clk_scu_init(void);
> -struct clk_hw *imx_clk_scu(const char *name, u32 rsrc_id, u8 clk_type);
> +
> +struct clk_hw *__imx_clk_scu(const char *name, const char * const *paren=
ts,
> +			     int num_parents, u32 rsrc_id, u8 clk_type);
> +
> +static inline struct clk_hw *imx_clk_scu(const char *name, u32 rsrc_id,
> +					 u8 clk_type)
> +{
> +	return __imx_clk_scu(name, NULL, 0, rsrc_id, clk_type); }
> +
> +static inline struct clk_hw *imx_clk_scu2(const char *name, const char *
> const *parents,
> +					  int num_parents, u32 rsrc_id, u8 clk_type) {
> +	return __imx_clk_scu(name, parents, num_parents, rsrc_id, clk_type); }
>=20
>  struct clk_hw *imx_clk_lpcg_scu(const char *name, const char
> *parent_name,
>  				unsigned long flags, void __iomem *reg,
> --
> 2.7.4

