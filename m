Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3924C2B9F4
	for <linux-clk@archiver.kernel.org>; Fri, 25 Jun 2021 07:19:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9893161417
	for <linux-clk@archiver.kernel.org>; Fri, 25 Jun 2021 07:19:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229454AbhFYHWG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Jun 2021 03:22:06 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:6187 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229926AbhFYHWF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Jun 2021 03:22:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1624605585; x=1656141585;
  h=from:to:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=lONM/NmyKhVOb5Vgox5Z1+ieH2WGafeK4VO5bZ99gGA=;
  b=WpQ1UEjMaFudw2qEmptpwtuWl51V2WOE5NyDUnOCBDqzrFwA4ST2y0e0
   pmmjdlQF3PC9ZQhxawPMBxCeHIwSS5qXh5C21lLtMv4ldQBVdOK+HxTQE
   tijm3OJ0XKp9Famg+AbSx6Pc83eE9cnDo90/xvhXraagXrEJcM09CoTpn
   cw/KcGiFnEyzYd7IfPdYSUf1qPaYYxm1EDZs0D77yyHe99sQopn9Uo9KO
   ELV3meJwKF+Sc6gEn+c4JYJ6dZ5s/osFsga9nU0xQFgh1PnzrYY/tPd/m
   zJ/u0/3ZOx7BfVVw/elsIqkwtwKsKLL66zQrHtvHuYkeJ0+O22jHXyPDC
   w==;
IronPort-SDR: Q+BWf1etzdAzDQHgz1xvpXtT0g9ESEt2nzK+sdzjDzE3KArAPL4WCBCdYqszqKLO7XTInKK7uc
 GqtqE/VAc3H+3hEdYEkIvK9WP/E1ylamZFBb/uM9ZtizYayCBlP/V/HoqX3k/3xEoh86HwFGk0
 KtjJ3K/RSNdNHmHMuODbpLXfMDOOjO/1LwVR8VBv84kQDZhseDa41CT+KQxPUEPUVz+Ex5CMom
 kOiwjgilpPmP3q/jxC3VAlMFdKxaDrpTiLfdz6UoEgkppkbSTg6I3HOPjDKQlCVLUbYHtXSPLu
 7BU=
X-IronPort-AV: E=Sophos;i="5.83,298,1616428800"; 
   d="scan'208";a="173451011"
Received: from mail-dm6nam10lp2103.outbound.protection.outlook.com (HELO NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.103])
  by ob1.hgst.iphmx.com with ESMTP; 25 Jun 2021 15:19:45 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lAVn62BxPgNzyXsMblEbtw+WSAQ1HXKbtHXU9DrM1xBbDMDHk93BupAD4pyb4FiZa9KuNn+Bv54sRm6YuAnLivKLi5Dm8WBaU9RBDXirXUmNMfebbJ65Qn50x3onuPuEi9NWA/YuzFlh0mngoJQelR0nRGAMcf7sb1zvfxcj3SylLvX/cODW0BbCXfVpTpjsGYNOnwFLsF+Bm4wkEkOkJtOQk7L77tJvN9yg4eSVvogINBlwQF+R38ZL3o5dthWqL3NUpkeWWsZNckOtmZV1m2yx/uemrgHXGk3JexpYkZjo7tvGRLzx2UJh4yU6M0vrWS8V9a9YyvEHzeJv98el3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1l0/bWWV7gtR1DDGn6fezEIHRrIcfWZYAUA5aPzrHU=;
 b=cc3l9JhnQkbYcUS7+a7OH2Zo2eNJzA70dcbJJfR+TnxuMWdmLf7tVgu9c6QcafNMaNMgk1xJWwmF3si49qsJjZuE4f7pAYXODGk/rwmSJnRlYaJRUXsS/F1f9L9IjcH1kHnoGCHhgrsKG3nFsyE82aEizM5NyDdGRslGVmOIJYLS5bnKa+E17OOMMMBpbQPz9Uh8edxTKaFTlqkXbqsZagbGLg9MZVp+VWzcHRtflA4ChjjYD4pQ2QY2qdtcSGCfJIQyfmME4z4Wf3/b9UZZgjke9YyBWwAdT8TENLWjHmjFU+SF1ME5M9wv82uSeFLKy5rvYMKrbNkZWTb6D+JvaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1l0/bWWV7gtR1DDGn6fezEIHRrIcfWZYAUA5aPzrHU=;
 b=qJI9adbbDWheQ7eLxJYZ/MASDDK0ARMWq2xAbB67dY/BGqpLu1q2tzrLW8ZCNYxwllG0nFHv2FC/7fbDxP7R7LLzHMY0/nx8u/QkE0iY4GQAAClRNdjYerSZMSLa5SoZ8YLxFa86lSRN+QAydsV63D+8TkzppMqR5FobdaVinq8=
Received: from DM6PR04MB7081.namprd04.prod.outlook.com (2603:10b6:5:244::21)
 by DM6PR04MB4539.namprd04.prod.outlook.com (2603:10b6:5:2c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Fri, 25 Jun
 2021 07:19:43 +0000
Received: from DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::a043:568a:290e:18bd]) by DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::a043:568a:290e:18bd%9]) with mapi id 15.20.4264.023; Fri, 25 Jun 2021
 07:19:43 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH] clk: k210: Fix k210_clk_set_parent()
Thread-Topic: [PATCH] clk: k210: Fix k210_clk_set_parent()
Thread-Index: AQHXZzIpdClIMTuS/kmDAE9RTEDLFA==
Date:   Fri, 25 Jun 2021 07:19:43 +0000
Message-ID: <DM6PR04MB70813FE78708BE156ADEDBFAE7069@DM6PR04MB7081.namprd04.prod.outlook.com>
References: <20210622064502.14841-1-damien.lemoal@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:65d3:f5e5:127e:5146]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7c73a5c0-1856-4a61-f8ff-08d937a99ae5
x-ms-traffictypediagnostic: DM6PR04MB4539:
x-microsoft-antispam-prvs: <DM6PR04MB4539F6AE3221B141272B1DDEE7069@DM6PR04MB4539.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:655;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bgO1AN5p2sGVXWVFaQ4+FRpATTJvdcn20WOiH8M5bgMM81dlc1x4jrSdBTqR9KK7tz2/zjKl7lqPFpP9/wXmRjbfLGIa8WyuZy1lbLplaz76GSlc5JMNxr5Nv0Q+Ob+X4R4MrDBkdWWX3jTPMeYeVyMO6ocWpU6oKF+9y4NRWBewMMEV3P8vFM7tGHFGVo+PZ/OrWybSv13PNju6cWtWcWMAuG+zru4QNPuL+qhL33dCDux2a4DBviQV9vQ298wFKWyWsFtM023HxbqTyoZIxGTA1RZwzJecv9pme4YVnwoVnN9A51DHx/Fb0dl541igUESlKGvQCNds0Msh6Q2X4eT8+YedLq4qmtt4uDULdeQYhvrKJVWd5RSRl4npd8rTr2odnN2jV3iRVS2BIt3MzKBJNoIKyZacf46l/8JKdC3vh0JUi83xMsgSK2LGz/hnAf5tKODZUCiabGJXYyJplU5dPnNvaFuXBVDzB3njLvmBX+ky4tz4uVBEaCP3ArzWltiMDcmTeEFzJjTNCySDHXLbNZ8Lrf5rTFOQbF7tDa1BgfJuRyVvOzNVxNjWNuIJbASTdeCeVbRxaDaH1FW5HNu6HQZiNM9O31VOurtPzledmdA+VkSjH4OfMWc+zc3YHztZSVFVx4+XuLOKGJSTrw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB7081.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(39860400002)(346002)(366004)(33656002)(5660300002)(316002)(66446008)(66556008)(66476007)(64756008)(7696005)(52536014)(6506007)(53546011)(4744005)(66946007)(2906002)(91956017)(186003)(76116006)(38100700002)(71200400001)(110136005)(8676002)(478600001)(8936002)(122000001)(9686003)(83380400001)(86362001)(55016002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?j3wE6MbVV9hvtowo+PRGEJEc/Yl1kOVLCyZTv7YjAgi1VqN68Jzrcydg4K9q?=
 =?us-ascii?Q?HScRd4mG4JBbm9GPvUucv4cRzs0FYzGHBbaZeQ1hFrqZ3Jxngc1QGmQCrDBI?=
 =?us-ascii?Q?bipgbK7s6fcHalqt6AQTBU3WDgfGzlaHZ8wNQQ3iNJuCg8ibLELQSC+sVyTG?=
 =?us-ascii?Q?UnI/+LFb1BoWgmJ8wRkyi/dymorieIDjcseuKlxOXl3G4g0VkPToiwiWdVCB?=
 =?us-ascii?Q?P0i27GuxJBeznPTMPBc6rcSh1fPk8/bVr+SO0Fy07p1oG1i9FwQ3Y//AfIJC?=
 =?us-ascii?Q?m4lT+REtjmSE86jkxJHws3tqe52f2r7Lzx8fIWk1HoQ6HS3gJPLcmkIzqGHY?=
 =?us-ascii?Q?rqDb9JrOFfz7gNMN8RXAeRIay6qQeqo3kY/cxOAgmoZ4FPSAOEx2Dbw3EJ4t?=
 =?us-ascii?Q?dxy6iQ4a/PlhS2RtCrVA1I3bSIwJp4SunQOabmCfRySvbviK0pkC0VHzWa98?=
 =?us-ascii?Q?LhHsr558NprWFu7NgIwvMCRtFcR0vrkW2Poa95fmGVy4stbTz/B1wSWhisxD?=
 =?us-ascii?Q?4v+0z88J04EwsvbZcmHPK232GhA9VKs8R4DKEhee1N8rh7WsnZkD/++JNNJ9?=
 =?us-ascii?Q?fbqVBznopGp4Rpu+tzzSZOH7hyqYfLsJDyH35Dd22qFip2lJzZavXJT3vnJf?=
 =?us-ascii?Q?lpAPvKQS0C20w+hYBFsprzJznVgvZDZSaHf0ga+5ekVmfqZTgcWZujXd4QyZ?=
 =?us-ascii?Q?rhwW6+7BAP7YhUcNE2RUooshtEVUSehKTN+ZFk0f4+IJuEs7Z/YsnL4AF6Yq?=
 =?us-ascii?Q?2Uz5x+/Bqee1hiHBbOrEXbtRtKLdSPE8q6W8FVJ+kg/tKRtZ22rhOeDgZ5OS?=
 =?us-ascii?Q?4X3YjWUnJ8Gf3luveRSULTSmXLiBRZn4aSVXNAjUDqg0pT5hO+MZ5AOs4b8+?=
 =?us-ascii?Q?9vJ4D1GF3jGB5O3XEOOOe6qJsUvbsCkhgzeT9uPTQt+Wt+tn1z8KXax2+BGT?=
 =?us-ascii?Q?kdwQVm6Okl+sUWt+crAxjzSqohmVZkdAWbujg7PuNlSGmMSnAaTqh11rfNXz?=
 =?us-ascii?Q?GcbsbrhI2tSFBf8BVUmgjpFbzcYeH0Cd5/t0hjVaNiqQCNth4V7ojQfG/Pk4?=
 =?us-ascii?Q?8ERmvxLv5IAcKb62zy/WVqQy2bdLOkIgJY5KzwwH8rJzGNt0BVYUfLG+fz95?=
 =?us-ascii?Q?1XCLVJFiPD56/hCbeeNYdaLFr8HJVBtNBrPjkQmQJz72OqyXccCu0hVROchG?=
 =?us-ascii?Q?yOVsjF7xckfkwCwW7utTxFx+ZBNtDCBZrwJmBYiGnugJgMVZDy2wN0NZOGcX?=
 =?us-ascii?Q?h1m3yv/Z05MpTjOyOrKPJ/vA0pCprIXTRuzbP3Jhu6N9LzBbO6VLkhSr/A9A?=
 =?us-ascii?Q?KI3oLh9eDl8ot09w6jRFbzg3TOk3bfIBvJJLEhDmP5UTdS2K5rvhngMVMgc5?=
 =?us-ascii?Q?io+LBaP42WomUw8dNLclQOpb63n8gdvtl3yfDCxDhS9R3+7sdA=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB7081.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c73a5c0-1856-4a61-f8ff-08d937a99ae5
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2021 07:19:43.6702
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oQyFIFqU1U2wR8KJkkYWVwujSf05y6xReI04cX3BiUxGWHzNfv8ev08ZFITixzYCp+lju/53hVyqQGtrqqbtQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4539
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2021/06/22 15:45, Damien Le Moal wrote:=0A=
> In k210_clk_set_parent(), add missing writel() call to update the mux=0A=
> register of a clock to change its parent. This also fixes a compilation=
=0A=
> warning with clang when compiling with W=3D1.=0A=
> =0A=
> Fixes: c6ca7616f7d5 ("clk: Add RISC-V Canaan Kendryte K210 clock driver")=
=0A=
> Cc: stable@vger.kernel.org=0A=
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>=0A=
> ---=0A=
>  drivers/clk/clk-k210.c | 1 +=0A=
>  1 file changed, 1 insertion(+)=0A=
> =0A=
> diff --git a/drivers/clk/clk-k210.c b/drivers/clk/clk-k210.c=0A=
> index 6c84abf5b2e3..67a7cb3503c3 100644=0A=
> --- a/drivers/clk/clk-k210.c=0A=
> +++ b/drivers/clk/clk-k210.c=0A=
> @@ -722,6 +722,7 @@ static int k210_clk_set_parent(struct clk_hw *hw, u8 =
index)=0A=
>  		reg |=3D BIT(cfg->mux_bit);=0A=
>  	else=0A=
>  		reg &=3D ~BIT(cfg->mux_bit);=0A=
> +	writel(reg, ksc->regs + cfg->mux_reg);=0A=
>  	spin_unlock_irqrestore(&ksc->clk_lock, flags);=0A=
>  =0A=
>  	return 0;=0A=
> =0A=
=0A=
Stephen,=0A=
=0A=
Ping ?=0A=
=0A=
-- =0A=
Damien Le Moal=0A=
Western Digital Research=0A=
