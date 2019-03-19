Return-Path: <SRS0=gal5=RW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F373BC43381
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 00:48:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B963220989
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 00:48:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="jMmddeRj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbfCSAsQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 18 Mar 2019 20:48:16 -0400
Received: from mail-eopbgr820080.outbound.protection.outlook.com ([40.107.82.80]:58272
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726487AbfCSAsQ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 18 Mar 2019 20:48:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gBcyZvNeNDAxpRVddX99P5WgJS5JLFHygOQk3kN3luY=;
 b=jMmddeRjqpgbu2FXC37by6pdwXl9lGDUBBT5sWLgM3d5k5KJxtLvVzaNz6VwzaIh2fg2x4+FNRHcJlhTiQ5N6Wz/yh6+sKxNTy3IiKK8BfhJAPBOWzNhbQ6h7f1Ey6p/zd3X/dKzs5InowmxDxIdVALi13QL/NE3Z3Ow/zLQWg8=
Received: from BYAPR02MB5992.namprd02.prod.outlook.com (20.179.89.80) by
 BYAPR02MB4360.namprd02.prod.outlook.com (52.135.237.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.14; Tue, 19 Mar 2019 00:47:33 +0000
Received: from BYAPR02MB5992.namprd02.prod.outlook.com
 ([fe80::911c:eb9a:23e7:1da8]) by BYAPR02MB5992.namprd02.prod.outlook.com
 ([fe80::911c:eb9a:23e7:1da8%2]) with mapi id 15.20.1709.015; Tue, 19 Mar 2019
 00:47:33 +0000
From:   Jolly Shah <JOLLYS@xilinx.com>
To:     Michael Tretter <m.tretter@pengutronix.de>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
CC:     "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michal Simek <michals@xilinx.com>
Subject: RE: [PATCH 5/5] clk: zynqmp: make field definitions of query
 responses consistent
Thread-Topic: [PATCH 5/5] clk: zynqmp: make field definitions of query
 responses consistent
Thread-Index: AQHU2MLQDpZvsRAsJke/QGF+SpQty6YSKQlg
Date:   Tue, 19 Mar 2019 00:47:33 +0000
Message-ID: <BYAPR02MB5992A902674B5A2868A0BFC3B8400@BYAPR02MB5992.namprd02.prod.outlook.com>
References: <20190312110016.29174-1-m.tretter@pengutronix.de>
 <20190312110016.29174-6-m.tretter@pengutronix.de>
In-Reply-To: <20190312110016.29174-6-m.tretter@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JOLLYS@xilinx.com; 
x-originating-ip: [149.199.62.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e521a6cc-5d68-4fe9-b9e9-08d6ac04792b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);SRVR:BYAPR02MB4360;
x-ms-traffictypediagnostic: BYAPR02MB4360:
x-microsoft-antispam-prvs: <BYAPR02MB4360F7AD603681391719C8C1B8400@BYAPR02MB4360.namprd02.prod.outlook.com>
x-forefront-prvs: 0981815F2F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(39860400002)(136003)(376002)(396003)(346002)(13464003)(189003)(199004)(97736004)(86362001)(74316002)(2201001)(186003)(26005)(6506007)(102836004)(99286004)(7736002)(305945005)(53546011)(66066001)(316002)(11346002)(446003)(2906002)(256004)(6116002)(105586002)(106356001)(486006)(81156014)(476003)(3846002)(8676002)(68736007)(81166006)(8936002)(14444005)(7696005)(2501003)(5660300002)(55016002)(72206003)(53936002)(52536014)(478600001)(71190400001)(71200400001)(9686003)(76176011)(6436002)(54906003)(25786009)(110136005)(107886003)(33656002)(14454004)(6246003)(4326008)(229853002);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR02MB4360;H:BYAPR02MB5992.namprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: xilinx.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NPIsjLWYyFitquAph1XEgafrRsaUTInBjiAmb5A82UFYFfJFWEZJjEzgtd9Ot79ezahnsm7WB5LBvEXwThaBY5KiWe3xnPlJ9XFj6fpEBsbn6AK/m0YAkqfbtC1LdDrIXRyVE7Ex3fP4KAGwAFwu+9x1miuyWO9tYVQCLpm28+HPldX4g1a7TlZ6r/Zpc5k9KzlzdEdRGGOOpZVIluZVmMseYLdwWiS0CYkvO+wgUFd5xatnV41nKoyyJr9vO2JNYgotjzjlj4s0KX59Txwx50HsH7vPAyGU5dYcAu8wV8WcIAcwXi9clsJEAZJ72+hQreNR/R6z5A3hrr4Gor40XC12L5jReHHcXsy+ayPwo42nfPygK475scWGS7M7DdOFCx3lHmoz5lVezbw0JYfC5FzGEyDUVn48SJxy/bDINJ8=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e521a6cc-5d68-4fe9-b9e9-08d6ac04792b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2019 00:47:33.0578
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4360
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Michael,

> -----Original Message-----
> From: Michael Tretter <m.tretter@pengutronix.de>
> Sent: Tuesday, March 12, 2019 4:00 AM
> To: linux-clk@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> Cc: kernel@pengutronix.de; Michael Turquette <mturquette@baylibre.com>;
> Stephen Boyd <sboyd@kernel.org>; Michal Simek <michals@xilinx.com>; Jolly
> Shah <JOLLYS@xilinx.com>; Michael Tretter <m.tretter@pengutronix.de>
> Subject: [PATCH 5/5] clk: zynqmp: make field definitions of query respons=
es
> consistent
>=20
> The definition of the fields in the firmware responses to the queries is
> inconsistent. Some are specified as a mask, some as a shift, and some by
> the length of the previous field.
>=20
> Specify all of them as bit masks and access the fields using the
> FIELD_GET macro.
>=20
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
>  drivers/clk/zynqmp/clkc.c | 39 ++++++++++++++++++---------------------
>  1 file changed, 18 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/clk/zynqmp/clkc.c b/drivers/clk/zynqmp/clkc.c
> index 573c3c58dbbc..b4e13b8618b2 100644
> --- a/drivers/clk/zynqmp/clkc.c
> +++ b/drivers/clk/zynqmp/clkc.c
> @@ -21,20 +21,18 @@
>  #define MAX_NODES			6
>  #define MAX_NAME_LEN			50
>=20
> -#define CLK_TYPE_SHIFT			2
> -
>  #define NA_PARENT			0xFFFFFFFF
>  #define DUMMY_PARENT			0xFFFFFFFE
>=20
> -#define CLK_TYPE_FIELD_LEN		4
> -#define CLK_TOPOLOGY_NODE_OFFSET	16
> +#define CLK_TOPOLOGY_TYPE		GENMASK(3, 0)
> +#define CLK_TOPOLOGY_FLAGS		GENMASK(21, 8)
> +#define CLK_TOPOLOGY_TYPE_FLAGS		GENMASK(31, 24)
>=20
> -#define CLK_TYPE_FIELD_MASK		0xF
> -#define CLK_FLAG_FIELD_MASK		GENMASK(21, 8)

GENMASK(23,8) here.

Thanks,
Jolly Shah

> -#define CLK_TYPE_FLAG_FIELD_MASK	GENMASK(31, 24)
> +#define CLK_PARENTS_ID			GENMASK(15, 0)
> +#define CLK_PARENTS_FLAGS		GENMASK(31, 16)
>=20
> -#define CLK_PARENTS_ID_LEN		16
> -#define CLK_PARENTS_ID_MASK		0xFFFF
> +#define CLK_ATTR_VALID			BIT(0)
> +#define CLK_ATTR_TYPE			BIT(2)
>=20
>  /* Flags for parents */
>  #define PARENT_CLK_SELF			0
> @@ -49,8 +47,6 @@
>  #define END_OF_PARENTS			1
>  #define RESERVED_CLK_NAME		""
>=20
> -#define CLK_VALID_MASK			0x1
> -
>  #define CLK_GET_NAME_RESP_LEN		16
>  #define CLK_GET_TOPOLOGY_RESP_WORDS	3
>  #define CLK_GET_PARENTS_RESP_WORDS	3
> @@ -369,15 +365,16 @@ static int __zynqmp_clock_get_topology(struct
> clock_topology *topology,
>  				       u32 *data, u32 *nnodes)
>  {
>  	int i;
> +	u32 type;
>=20
>  	for (i =3D 0; i < CLK_GET_TOPOLOGY_RESP_WORDS; i++) {
> -		if (!(data[i] & CLK_TYPE_FIELD_MASK))
> +		type =3D FIELD_GET(CLK_TOPOLOGY_TYPE, data[i]);
> +		if (type =3D=3D TYPE_INVALID)
>  			return END_OF_TOPOLOGY_NODE;
> -		topology[*nnodes].type =3D data[i] & CLK_TYPE_FIELD_MASK;
> -		topology[*nnodes].flag =3D FIELD_GET(CLK_FLAG_FIELD_MASK,
> -						   data[i]);
> +		topology[*nnodes].type =3D type
> +		topology[*nnodes].flag =3D FIELD_GET(CLK_TOPOLOGY_FLAGS,
> data[i]);
>  		topology[*nnodes].type_flag =3D
> -				FIELD_GET(CLK_TYPE_FLAG_FIELD_MASK,
> data[i]);
> +				FIELD_GET(CLK_TOPOLOGY_TYPE_FLAGS,
> data[i]);
>  		(*nnodes)++;
>  	}
>=20
> @@ -433,12 +430,12 @@ static int __zynqmp_clock_get_parents(struct
> clock_parent *parents, u32 *data,
>  			return END_OF_PARENTS;
>=20
>  		parent =3D &parents[i];
> -		parent->id =3D data[i] & CLK_PARENTS_ID_MASK;
> +		parent->id =3D FIELD_GET(CLK_PARENTS_ID, data[i]);
>  		if (data[i] =3D=3D DUMMY_PARENT) {
>  			strcpy(parent->name, "dummy_name");
>  			parent->flag =3D 0;
>  		} else {
> -			parent->flag =3D data[i] >> CLK_PARENTS_ID_LEN;
> +			parent->flag =3D FIELD_GET(CLK_PARENTS_FLAGS,
> data[i]);
>  			if (zynqmp_get_clock_name(parent->id, parent-
> >name))
>  				continue;
>  		}
> @@ -638,9 +635,9 @@ static void zynqmp_get_clock_info(void)
>  		if (ret)
>  			continue;
>=20
> -		clock[i].valid =3D attr & CLK_VALID_MASK;
> -		clock[i].type =3D attr >> CLK_TYPE_SHIFT ? CLK_TYPE_EXTERNAL :
> -							CLK_TYPE_OUTPUT;
> +		clock[i].valid =3D FIELD_GET(CLK_ATTR_VALID, attr);
> +		clock[i].type =3D FIELD_GET(CLK_ATTR_TYPE) ?
> +			CLK_TYPE_EXTERNAL : CLK_TYPE_OUTPUT;
>  	}
>=20
>  	/* Get topology of all clock */
> --
> 2.20.1

