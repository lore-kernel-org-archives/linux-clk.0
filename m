Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5411FC433E0
	for <linux-clk@archiver.kernel.org>; Fri,  5 Feb 2021 00:33:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2077564F8C
	for <linux-clk@archiver.kernel.org>; Fri,  5 Feb 2021 00:33:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231810AbhBEAdY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Feb 2021 19:33:24 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:54356 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231721AbhBEAdY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 Feb 2021 19:33:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1612485204; x=1644021204;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=qVfMN1PtsdNCVs7s91A6Icf71NXX3ErgRo0d5+mZpX4=;
  b=cjohPK7JiX1GeUz8xA+YlJFg+oOjNxd1CjYg0iwUdfSPv5mie/rlpkZF
   R28M6PY/+pT3fOfH4kP4V4ZZlhUtaI4ZterWmOPqDJhN906PnkXAjJjX/
   0cBrC2nUResKchrbCtHNIuWceHQ9gz6sCrzju+JTi32kXHM/3lih1/d2E
   hR9Tya7LaYwiqCU7GOQnniywzQZkXzmf7Zq4C1+Zhc+j+x+Oi9N0/WiDt
   AomTw/YbNtLA0VQdT+L5cYVBrC6SPU8MprIE0YC2ZgjZrPx6WzMh02Gy0
   BWFifBYoMEvf85DZb2NbXmIetJ/LNb31i5UcG0juajVXhYSqWY9sNsSdZ
   A==;
IronPort-SDR: ElBRJtruQi84xAgHyYA2Ku9CUWydeNh3gmhhxPeZRQE9CqQDPEQ50n1xCuvJpvGSziXZ7kDIxQ
 oDRelijbLCETBSCQbNjaEEFg+PNr48B3xtfQHOnALhSfj+3QiL2N0Nqr01e+KMt+zxfvyhrSL0
 NhPJ6fFYIl3WwCJAtqvc+DrINy5dxJyzzdi1n/xsCWvJiPxYdUSpgFdlrGXqyYxfYKNfNh8yST
 itROFApw18YgVgLttHiF+iwY1zSJHhIF8azYoa3m8VqTzT/8U108wZYSOGHKBEPAXK8JUOdVlH
 Zc0=
X-IronPort-AV: E=Sophos;i="5.81,153,1610380800"; 
   d="scan'208";a="160373177"
Received: from mail-co1nam11lp2169.outbound.protection.outlook.com (HELO NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.169])
  by ob1.hgst.iphmx.com with ESMTP; 05 Feb 2021 08:32:17 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y3W09KsiDT01+++XMy6aHEWx1C6v4VDUDwd6dOV9ZKqkx8aHnARY+xxPyCUJ+C/x43QC8pJKS2FKhcrGDq4VYfSjAnN8fibksT+aQkIxS1LDJuYxMiNcnLTXlzh95EDbq3fXPxow/8xsqdQjL8t3nJ8tP4h3qDlvFLXZ2N1E0E4H1Kn0ZHG72lunq5xQz+E90MoJIyEEYM+kOuDVgPJlBk6VFantSU//M1MewFar3XsvL2sHUAF2OiDROYscqCV7bXl91MOE4iM/MA3NRxw8I7ZHaZjXhnX+/Xazl9M9h1AMWz33uQ3xzaDE5v28A5eXiSDxOhGxPjA90O4gX1LFVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ZYJEexwELW2AL+5pcwVTBT70wBflErR39V2VhgCTYI=;
 b=Fan15erOKVmz753GN0ZKTLzNWS+yV18Vb75wSvveZZrvUODX3Z/qjmVjxLT83bMz1WVrMLDCz15KSKu/onLzwl8B60gxUKbrn09/6laMGuB8oJgE3Yoctt8Gb1bJnJZvBnRdIFSgr6j98D6aJ+bdjT/kdIuxiidwt10IK243CQ9LBrh1awa+ljxPzTBgi6HKQ1JcqGXs4Xfna85KUMUi9q+ku9ORgPt9QYX4a6k/L2FLDZr5YN7CvEDULxK20fo7Ve3O0Ag5CVnUvxovSkAqbQ2JEfPOXakW3dAYtyGLmsnVOrP8Br3GDBsrOpAUFLKGgO+MbB/GS8LvNk7HT7QBPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ZYJEexwELW2AL+5pcwVTBT70wBflErR39V2VhgCTYI=;
 b=CrEqICksuxu17IoG5RbSgUjKRKy7+UbBnAdenPmCasyqwieEDE80ac4IN66hF9HpfnYBXkMLt9sGGiuxcHUpnHVUTuz4SsoEsm/V3mKN7zJe/X0cujHPyo8uKpVZ2SBOxYasWfIi1RgKFGNbTARJZ1PpvMJBw4PGsuolXTIW8XY=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by MN2PR04MB7008.namprd04.prod.outlook.com (2603:10b6:208:1ed::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Fri, 5 Feb
 2021 00:32:15 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d%8]) with mapi id 15.20.3805.024; Fri, 5 Feb 2021
 00:32:15 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
CC:     Atish Patra <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>,
        Sean Anderson <seanga2@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v15 01/16] clk: Add RISC-V Canaan Kendryte K210 clock
 driver
Thread-Topic: [PATCH v15 01/16] clk: Add RISC-V Canaan Kendryte K210 clock
 driver
Thread-Index: AQHW+ixnrVrGuegnqUKy6Yzo4ke4+w==
Date:   Fri, 5 Feb 2021 00:32:15 +0000
Message-ID: <BL0PR04MB6514D9B463E8DE7F9D3C410AE7B29@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20210203125913.390949-1-damien.lemoal@wdc.com>
 <20210203125913.390949-2-damien.lemoal@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:50f7:ee01:712b:bf92]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 013929d9-86be-4b17-09af-08d8c96d7cd9
x-ms-traffictypediagnostic: MN2PR04MB7008:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR04MB70088EC2A4EA699863E98DFAE7B29@MN2PR04MB7008.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BCpWl+Y7v0Llgsw469rt8bof6U4O8JjAorfH+gVCa2V6XQHMv918Wpq/Wy6b4BcGb86tQzzgOoEkJQ0EQNprDmER9bpHoklRbPBbvGIYnc5/8Cwm5nQ27iWguV+VCobWoqdfR7eXHG1JCRkYlaGv7CosBPrmOGfrf1NqAlQf2LSz4NcbgoDpVrdFFRzqUQ6m2IXGQAUGGCtqe5lqi1sxKwQlIeEmESXcVwRKT9Az9gRrGyF1Jx70sSHADQNM1rmdAAxlz5jGKJ3WUApdoS+E4UhHIzVKIinz0C9NdaqAIIsWY/lDeLoPdVuH40G3A6fidT21HUSeK/gXBlNJS/OzBHxx6uLYoWzqQa03qwEulzlj69D+V8Y2cdZRHrkmPj9WtRlr6aClA2HRF/ONPjsQYJrQ2NBekD+564aX+j4RoIIf9vZuE6G3PZAMYZBSarqcOrhfi9gyJC4jol7+YlZgV416G9ED8Cnh45yoWGhclFYKEqlTQSyB3m6cxe2zVS4u4GOGp6KwlLO6b/G5mkUkMA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR04MB6514.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(5660300002)(9686003)(86362001)(52536014)(66946007)(91956017)(7696005)(66476007)(8676002)(4326008)(8936002)(316002)(54906003)(2906002)(186003)(110136005)(6506007)(66446008)(55016002)(64756008)(33656002)(53546011)(478600001)(76116006)(66556008)(71200400001)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?v8qGkquCzc2hy1EwAZMIQqUQr6Oe4A8k6mwjgSR6oImEsxoVUFsY/Ghi9A3U?=
 =?us-ascii?Q?lwADjYdLf4DGY60FlS2rtucbUEp+SaTf0uFgbigc1TqasER1cwE20/6lynV8?=
 =?us-ascii?Q?BmwfLB3xsZtcNlboRGDjYwgSnSoV3GobW1uS/ARqhUymiWL4STs0ctacFxF6?=
 =?us-ascii?Q?iy3swPAI1+xShwStz7uS2t64Gq6IEL5OSU+Mzgr2TIEboxAdsp7Z5IQP7P+x?=
 =?us-ascii?Q?cNUUGuHayM1VfnKc1mzNglzNu1khZnUPFJWEzIBovQ/fRdh90UrXv1VeGTh+?=
 =?us-ascii?Q?M9bd29HUPKcGReUdsYbhXFkBLwgDgKwhGqKWgug3VarXURmcGDRLTqZhemB3?=
 =?us-ascii?Q?fL4wAG6dWzn1zJ5CzkxnMQqvo3hD8qml/YGnLVLnURQUngR1AZhPNnAowV6i?=
 =?us-ascii?Q?TVNau5Xy2o3Dd3nx27mULXhsu4AmdD7MBoiMFX2T4dPcEXn8W/rgUXWuayr1?=
 =?us-ascii?Q?hWpDzsBsAHnj+2LHPFd6gyug82dpSlTsRpL8sH+mR3M5Oi7sRPbrFYpTUqSs?=
 =?us-ascii?Q?NuNTHweE3l+qwRNAcuXhJR41HDTrVcSWL7Y1AcZoiOIjVCq7otOsceukzGym?=
 =?us-ascii?Q?FrFG8niMDqzX8T0X3VlRU3JllpqghBSeRmtSLCX2jS1Dnoe0bn1m9SgcOZQe?=
 =?us-ascii?Q?FaAjeYkEu68IgsxGPsFhepri6xcMUMi0IVMBWS2bRy1gUc1KXoI6f+qP/ViU?=
 =?us-ascii?Q?NCkc8EmK2egbK6GRwAe/l9/adTA0Fv8SD+1eNXXFgobVrkgGeg0cR+pCAt0+?=
 =?us-ascii?Q?LdlAHN0tF0YBR22TdKVxd3VnycYU0e386erN433/bdpMw/manSxv3GYz9bSq?=
 =?us-ascii?Q?JmI7MFyTvk98iwD4GxVSU2aTnCzECRdH6N2oDC/Jwr8Z6zMJ032NyFy1Mv/k?=
 =?us-ascii?Q?bfxd4WtrwYNge0Z9gJFryGRFlUGLJzX7FLn8/kMGsNDk22zDKTTsjj/rCrAU?=
 =?us-ascii?Q?ZuqR50mnjidcKd5OdzkZDYX0czgJQRPYl+uV+xYIXMrxDooWntFPPb/hNZle?=
 =?us-ascii?Q?xjHYvA5lFdyPSDQ6hXjmvbI7EfXqxlQ4QH5u7x0Gs+p0G0sjTrGuA35INMhT?=
 =?us-ascii?Q?UGqpK67xuBlYZB6LZ8gv9KRp1IrrrSB9yVU/d8bc5K1YTLe15M/YFq8SJ0bO?=
 =?us-ascii?Q?nRznNOoibSivF66dg3Frxbh2z4NA2nDZk5snBNZOhvCC5esiU0YI33l4Zwed?=
 =?us-ascii?Q?Z/udOPtOHGzMgyHJnnrUqvZOyJXVUuq2k6D3DUSmg0tZo1T2n8Bjt4DoxpId?=
 =?us-ascii?Q?ArmAEQbuMC4YcJrQZj3sv6KUtXxR4DhMEbOsH+12quu4+SJOuHAgHsp2bu62?=
 =?us-ascii?Q?gkwJ6//CtXZHp3CsLFaugL5acwu36tr/V3eOwU5qk0WOITahciOmC14wxLAy?=
 =?us-ascii?Q?PvYWZzeA+aLaU1nzyuF6STC1gTa+1A/EBSdWsuaUDnC/3bNGng=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 013929d9-86be-4b17-09af-08d8c96d7cd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2021 00:32:15.5166
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7JvpQDqxZAvRAhXOO37deDk2E8o7IE5SzBEtbC3C4yuImiWM4aBZaXtPN+bePMWzS7hgGKLWJ186US81Z7MFKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB7008
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2021/02/03 21:59, Damien Le Moal wrote:=0A=
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
Stephen, Michael,=0A=
=0A=
Could you please review/ack this patch please ?=0A=
This is now blocking the remaining of the series.=0A=
=0A=
=0A=
-- =0A=
Damien Le Moal=0A=
Western Digital Research=0A=
