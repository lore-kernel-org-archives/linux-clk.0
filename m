Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6833C433F5
	for <linux-clk@archiver.kernel.org>; Mon, 28 Feb 2022 09:29:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234319AbiB1J3k (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Feb 2022 04:29:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233521AbiB1J3d (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Feb 2022 04:29:33 -0500
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140088.outbound.protection.outlook.com [40.107.14.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26554522D0;
        Mon, 28 Feb 2022 01:28:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F5ArMImhtpUl2bs6XvQ7k84XV2NKQAETLNgU5PVmYVTPHBD3lpUcfGqpvM4Rmc+QdFKjpsazW0jlldCNF8lt9BBbhA8mrTeIkhTHyx8GxqpI3+6Dv2ORUIoy1pN9vI9KeWaegVi7iZZQw9VwuKrotqPvIqpPfLjfoJdQJHAED7lJg+5Ss9u98nHNwyuRz+nfVWj8HKeMQdm3JLOhJQSkTK7c3W+pzbK5bPU/88zEdbexeK/0QJz5GF/HgdWWTrpAsCXkfc+POsji/DJcuxBlym8bOapR9yi5aOMi3ux6kXrQyz1Tb5IN1Dz8fMmpvbBUDy8FabADbaMYFemICXJQbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cy86RC0b4XZkImki17YX5O36Jaktukqrx2UbbuoytxM=;
 b=IUm9VWU+ApCufFjBQDqc0iudxgVhBDSBZTGLSVuShNmjZETD8pAKuKginquaATIE2wVhe1fdaAwtPQRURFwRa6IGym2DK4j261lKRC9eemYSfHad4pTDoJh9yMPLuIASr3MGohwlAjvEv5fP8BuuWgTbBAtwNN//2ydzZCVnRXJaCAO/a3Q7w2be40rZ4ui6f2Kzy2eMINxAj+DnU+81KS8GQwt0nyF93zfjSwE3JYqRLFiWOUsK+poPwBv/+nvJ+/ebBzOYmEUPi7oWKpyateXF9izALY8WFS9a2B/zfuproTBBz6h3l8qTIHxVieZhcHipodu4SY/Q5QwXpuBU1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cy86RC0b4XZkImki17YX5O36Jaktukqrx2UbbuoytxM=;
 b=Yty/+G9slecEqTVXbyaJD6k+BfBzvbaewrModCEaWGq2OvDpyueK1pzh0L4Uk+yBplj5TWs7Alau7/0WRfVTcChHWkJoAmit3TwqGEJzgeh/B8ITGItdvtj8ujJzOyXjJUICLEZ/j4jVhAunjmJUcqEd4VkMZrhz1/DoSilMGQ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com (2603:10a6:803:6a::30)
 by HE1PR04MB3243.eurprd04.prod.outlook.com (2603:10a6:7:21::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Mon, 28 Feb
 2022 09:28:51 +0000
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::98a7:fbac:5cec:776e]) by VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::98a7:fbac:5cec:776e%5]) with mapi id 15.20.5017.026; Mon, 28 Feb 2022
 09:28:51 +0000
Date:   Mon, 28 Feb 2022 11:28:49 +0200
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] clk: imx: off by one in imx_lpcg_parse_clks_from_dt()
Message-ID: <YhyV0R0ELePn2o0N@abelvesa>
References: <20220228075014.GD13685@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220228075014.GD13685@kili>
X-ClientProxiedBy: VI1P195CA0075.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::28) To VI1PR04MB4688.eurprd04.prod.outlook.com
 (2603:10a6:803:6a::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2cf2477-a1c9-4160-d853-08d9fa9cbb1d
X-MS-TrafficTypeDiagnostic: HE1PR04MB3243:EE_
X-Microsoft-Antispam-PRVS: <HE1PR04MB3243F99B8A1BD7B720AC790AF6019@HE1PR04MB3243.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0RcYoKDzvuKLVWxhbtp1slqO1hZvhW9fDPRg4pR/OZNCr9iBANuSD9eOEHdqbYOsBzDMDOo2qfyfte/5joN+x78YNFFpCqSEPriuL66G3+GXv3ZlmJEwd1ToTGx5Oiugr00rDmsBkw0J5+0HRBVS7iggMG4Ml+FFCEJFSo4Y8tVUdjIF7tcbPshyM10wHoP0Euaw+DBTFISp1PD6rdi111YLeMn1FfJVW2c/FIM9VV3+r7iWuABPdF57Ctujs0XG/LXyIVZ6ckPz5uvBZ42++wt/YK49lbqrSLIsJvWqUiPD3bclkBGIcW0UL8Ntjuv7+B25O6PAJ8fxVkXRkaGPOn5uG9+5DJPg+7ONoVXgkWJiOVb9w1aaSrYLr1gNABz7NUqnrzPEvWWXA37kNTu8Lq7am76GlaGFqfhThkD/JKJqctPavjy8zDQx8AbjhIdMguuhu4ndW3gGTMotbIZHIBjqikUhKz4gYa9E8RRMoxLIDQDT86vU4+SqRAurBHyk3AsD0AUx2bZwKYqwOsWTmBqOPY3ogDYjUCsmdYjb9460nOD92MUFbNgQYxQ/sJdUifKtsjr+W1MO/zy37gYYSfT+kqoU34I6Qzf6r6dgeyMm3GloAO/8cLc0C2Irxu7rKOxnGSCVA4Bq9UWUCD6FJIEuZ4cgPpBuxbSpBrTmXwz+h42fZFjpnTFIQ4TKAGNYn8vXHLVzOmkQAnp+sQTgNOMufgsQWeF2JT+3hX0eqmWKfPul2Bb/t9mbYno/Ah7R
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4688.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(4326008)(6512007)(66556008)(8676002)(2906002)(33716001)(38100700002)(508600001)(66476007)(52116002)(38350700002)(9686003)(6506007)(53546011)(6486002)(86362001)(316002)(54906003)(6916009)(83380400001)(26005)(186003)(5660300002)(8936002)(4744005)(44832011)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ux41hnJ4+PoFh9YLuvnLcrsZYIpuvuWksRmYmEPd0vkiHlV3b31oWsJ9XEq1?=
 =?us-ascii?Q?Tqo045iCnEdQfI5dxq1Z6KndZJ7ZGsW4urM1wWonUvFz62WAoh+CIwxACKVL?=
 =?us-ascii?Q?BNgXejYlVJ2bhtnWC9H6JTsn/zQi5fqt9Lj95zRoHZqz9GOVMF8kjaN7cnDu?=
 =?us-ascii?Q?vlQZ8lO0PmUmGkVOaK1BTySNpRWSw71qm6alI0DKfxQU+WkRPvQdw318/f69?=
 =?us-ascii?Q?xa8iLcB+PtrqiQLcxLgFO8Zctp9zN9ZUimJcfhjVAcsio58vFTYvLt5NuH3A?=
 =?us-ascii?Q?ofKqqkLCOU6zWwtSPUdEd5W09dGho9nZs+CR6qeY1+gkCz/gqBrRRhDdlvkN?=
 =?us-ascii?Q?a1nWcaTYK76SRC5c34l3S36cnZn1PKX+8RCQASpyyYm/UYTg5LrDfvmEHpij?=
 =?us-ascii?Q?XjvUO93suwKzCkVmPgcmBKVR+EA7rYUeEE/GrtOcz4YePrKkJr08pRSJjctN?=
 =?us-ascii?Q?51fjNbmRMLzSW8AmqNnchR+bT/bbnm+a92/LDW/3hcpxPv9tHJBcH1P0rs7Z?=
 =?us-ascii?Q?6vfCSUTrIpOSiCuQZOvpw9nNTf02d0hThDpNBe9N5Go4tUIRJkCfjTHJHByo?=
 =?us-ascii?Q?rG3vl7pqyFNntNeRONNtWhS9cvPxvFNOt6v+Bq99Ao3cY54vfwUP404MDeJy?=
 =?us-ascii?Q?a7pv8EJyT3eJpgYTKb/qqUoEw8L3W3HbD8y9/E+rpeyO+jSW4ymcJLvveE5u?=
 =?us-ascii?Q?uy6sjXEEDJPBLNWq8Dkn7MZecdKNNTZ5eKDN0HAopMabUWOXNZeeP8gFCW0w?=
 =?us-ascii?Q?bIGtXvA49QnQYTY99y0kGJ5HUIcBzglYjyZD/1XH85Kq2zlA9ynOLv8/q7Hj?=
 =?us-ascii?Q?guvw2ZZTWTvgNvhl6Ydt+IAa46c+edPqi2bj9TKGiZPyjSp56bNPh1s6QtK5?=
 =?us-ascii?Q?pR9GV5BMa6nYCPs5hCPf9LAzbQ/p+BO0ALo/qpqgHd3DalWa2SOHlqtsvxIC?=
 =?us-ascii?Q?jvEJZ5f7/lx2Ehn8THqYwcEtkLH2QhijV0qJAu4jpCykQOiZGNO+thmISUJA?=
 =?us-ascii?Q?q+SEUo0Z62P3bzhxxe93onRuNlRo3Hjo1eLblK25lrQJLGFkLlSn9zweLLvh?=
 =?us-ascii?Q?WAdJM4cRU01JRXamhIgIgWbc+c9WTozsVSphHVGyUidfVdLGD+l8IYE70RVW?=
 =?us-ascii?Q?5aTe//OTuhEtsuMPPGs9WLkQ584Li7KWxU+KctW7XAu22xwZwxo78yT5sjrD?=
 =?us-ascii?Q?X7Rn5uYfLpMJCUDyjM7KxDky4XenwVHCbImmJT1Bw+Ajc4nSJeCoTOz+qaUe?=
 =?us-ascii?Q?RlvapDMKM1b+Fpj45sBpvh2G0Fp6W7rYkfafNosyOwx+1TTF8GqlzYpy2+pK?=
 =?us-ascii?Q?iRArA0GxgClJ8NcBzjOCg++Jtny0O5toVP9QQO3iJ/DmMIXI9gqvzss7uAEa?=
 =?us-ascii?Q?z6IoDrb7hbrtuFJrEbu6e+Hys50Mc5Qr/VCq5g0Ip/q4K83OXyvkEFFq/qJg?=
 =?us-ascii?Q?bpnARh/RvbN0ChMMvDaRO+4I7k8o+hZ10ujuTMQWt2gq85/PcoR7ZGnmxUK/?=
 =?us-ascii?Q?cijzm8VLzg1vfu+PxMghWVM7NO/rOLiCQI3cuDvnOynsIQebMLRzQxkuxRSd?=
 =?us-ascii?Q?CWvgq2GYBmnX0+33OQtC0cr2c/0r8CPmlO2jJDiivlG3LKGnU/Mb+Z4sjDfN?=
 =?us-ascii?Q?98jvkqbfy6XSBRC01TshkIk=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2cf2477-a1c9-4160-d853-08d9fa9cbb1d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4688.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 09:28:51.2648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 15tl2Py4wl2hD/kAXZf6qZZZ5+C3e/EsenLlzZxlYlJ+awm5/R957dz9mkqVnsx7Jg+kt2d+Y8sHXxPzBS0t4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3243
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-02-28 10:50:14, Dan Carpenter wrote:
> The > needs to be >= to prevent an off by one access.
> 
> Fixes: d5f1e6a2bb61 ("clk: imx: imx8qxp-lpcg: add parsing clocks from device tree")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Makes sense.

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

> ---
>  drivers/clk/imx/clk-imx8qxp-lpcg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
> index b23758083ce5..5e31a6a24b3a 100644
> --- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
> +++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
> @@ -248,7 +248,7 @@ static int imx_lpcg_parse_clks_from_dt(struct platform_device *pdev,
>  
>  	for (i = 0; i < count; i++) {
>  		idx = bit_offset[i] / 4;
> -		if (idx > IMX_LPCG_MAX_CLKS) {
> +		if (idx >= IMX_LPCG_MAX_CLKS) {
>  			dev_warn(&pdev->dev, "invalid bit offset of clock %d\n",
>  				 i);
>  			ret = -EINVAL;
> -- 
> 2.20.1
>
