Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60AB2C43334
	for <linux-clk@archiver.kernel.org>; Thu, 14 Jul 2022 12:32:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238968AbiGNMcf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 14 Jul 2022 08:32:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239235AbiGNMcd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 14 Jul 2022 08:32:33 -0400
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2061.outbound.protection.outlook.com [40.107.101.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C7E33CBCE
        for <linux-clk@vger.kernel.org>; Thu, 14 Jul 2022 05:32:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VTF80ByUFXD5i6oeLOhJfKgDm3E8MsVcwnDzbVrqWDS++PVdYWFyIkRGnZ2DQjGFAdewO7PSX7lZVTd4pUWhLPOAD1sfz/aNyfK7MBx1xbxlxNFBDruZVMonoC4TUdWIACtMee/0+YTf5o/s4GrR7TCXP7ajycaDrSqL23mD4pO27L1xKHBZoEzb2NINHEtP51I/Y/peciPRnd4gV59QvGeWVxLynZQgQV9GT2yhvYRnFyOCHx+o+yAZ2LN3K5/gEYduBtp+qFPKZjUNXowZXwSI6W+lG7ymYBlSPQqB/R7/YcAzZ00SV47onEcwLlQdueF/mVOqa/9kyqUt5Nar1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v9A4b/CGbdE8yDyQx6asZw4yh2Cri6kXSaDSkPYGfzQ=;
 b=OgviLWTKspW1kMSubS5tMkCW8IMZk17XRFqY+wvOia67sKDEvLh7Wr+AZRqvwDhDcdqd7yvvsVRlRG9D6Uhg4V+OqehTfzwbh1BF7Bs6M6ijBBc0VpgpW6VqKrbfAexSnzE24cDeaKX3CPE+P2dZzbG4lM9fD7B4tQOiF+1yzzCUXr4v27UJjRwqx9GTPZH7wMTWTLqIPsD/iL0F9zXtcixDmQqW62OxTGJOqM5ovK2wZO+qVjEDrW4eHDHLm9GYkpZMJ1RudcmAsBdRL12Lj6HwOSGSlwle8HsYzCK/WZ7euzTpb9S0QJerBYbIAsFrNpW76oIGF3wrEnsntJFUaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v9A4b/CGbdE8yDyQx6asZw4yh2Cri6kXSaDSkPYGfzQ=;
 b=MVhW/Hb1w4eB0Puoj7mQjBS2S3Nn0gXZXzUTpaWv9EgS2rzL3s2gtwZrK5J03VowbUhkHS///XnL8Yjc3HpdOMPtkW5vMiglvcYM4YxIHD46oO42DFwmFFupLcra/k0MT/JITCOk6HjHSD8Yj3WcnfDh96H5EftYyIWwK31dTf4=
Received: from BN8PR04CA0023.namprd04.prod.outlook.com (2603:10b6:408:70::36)
 by BN7PR02MB5122.namprd02.prod.outlook.com (2603:10b6:408:2f::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Thu, 14 Jul
 2022 12:32:30 +0000
Received: from BN1NAM02FT059.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:70:cafe::7c) by BN8PR04CA0023.outlook.office365.com
 (2603:10b6:408:70::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.22 via Frontend
 Transport; Thu, 14 Jul 2022 12:32:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT059.mail.protection.outlook.com (10.13.2.167) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5438.12 via Frontend Transport; Thu, 14 Jul 2022 12:32:29 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 14 Jul 2022 05:32:15 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 14 Jul 2022 05:32:15 -0700
Envelope-to: git@xilinx.com,
 linux-clk@vger.kernel.org,
 mturquette@baylibre.com
Received: from [10.254.241.52] (port=52744)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1oBy0t-0001JT-1d; Thu, 14 Jul 2022 05:32:15 -0700
Message-ID: <8ffefafd-cd94-f642-ef23-6313accd8b30@xilinx.com>
Date:   Thu, 14 Jul 2022 14:32:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] clk: zynqmp: Add a check for NULL pointer
Content-Language: en-US
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        <linux-clk@vger.kernel.org>
CC:     <mturquette@baylibre.com>, <michal.simek@xilinx.com>,
        <git@xilinx.com>
References: <20220518055314.2486-1-shubhrajyoti.datta@xilinx.com>
From:   Michal Simek <michal.simek@xilinx.com>
In-Reply-To: <20220518055314.2486-1-shubhrajyoti.datta@xilinx.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: effab4fa-00ed-4d7b-f826-08da6594eaef
X-MS-TrafficTypeDiagnostic: BN7PR02MB5122:EE_
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +RbEJt96a60sq1iA0Lapg7MYL4cKTbGe6g+ciIDmiBbm+rXB2vhTb0xESDf6gSDoIuSaD6vq+s3ljkPup/8ru5VdXs+NPBNrOP03BwihlqZ7URhadle4Av6eDLJHhkQZvSDDBc55jL+hRa6IdkNxzX1CSjbCPGGPkr6u4F313wDqAEeZwb042DobVqPwSVQKJ1j/OrLPBCEWobVrofpdj06kOLIXEmeRmMgW43rlLycjbGyHMgY9O88VNIEvzESM7/1si/0xg1MSf9HE5NAxgl2Gg4C65+LTWu3A9CCrbQgsQlhPoAg324Eeveb44eRdd5UhJaca6ImaZf7I7hgC6UoZpKd1fW43JU2axY3nQyRlM1NqQZknZMx0foHIg9d9qY31r3qi5PaBH6M5cq8csN96Gh31/VKzXt6dJr0MSSlw65M1H/mA1EryFnkX78qoh1mQpKefCW3CegpSYQ4Ridj9y2zb6Ki4Tg+exe0+BYJWRLb2rd5qx9WlEZKu9DcEUgfhp1M3qDOR6V+Ax23Mrwzq+IW7I7mkU4XksTdbJqyRVwVDcV31wV/wvGlOKznyhXtnACgk+xn7AHvHsyclxvKr1E/feAJ7WVGwQRBsgOOuvGsgqOa28Uu7wv+80cWV5KZn7ZPZJgmkyHrgGrQ5ITQWZofZYYMSln1/1Z7Vp29H7twALnPe5RmeHWRPTjgvlaY4SvM/r6QDTktS3GJirgw3olIS0u32m1DNtxt7BFSYXlpIqaDKZcpqv4+27NCpB2KdhDZPdGTkyCIVvgHuBG7aVgEOVD3pQqnGpPU/4ddVdl5kdob+N2SAjL5aiQZxT3sBzbAcP4ns1lcrhUcq2iAsF2xloI3qiBEaUPUlE7oQa89IPUo5/q0LJldILXgZ
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(396003)(39860400002)(376002)(40470700004)(46966006)(36840700001)(36860700001)(36756003)(31696002)(8936002)(9786002)(2616005)(186003)(107886003)(336012)(356005)(82740400003)(31686004)(47076005)(426003)(7636003)(83380400001)(53546011)(478600001)(54906003)(110136005)(41300700001)(26005)(316002)(40460700003)(70586007)(70206006)(4326008)(8676002)(44832011)(5660300002)(2906002)(40480700001)(82310400005)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 12:32:29.6100
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: effab4fa-00ed-4d7b-f826-08da6594eaef
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT059.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB5122
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 5/18/22 07:53, Shubhrajyoti Datta wrote:
> Add a NULL pointer check as clk_hw_get_parent can return NULL.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
>   drivers/clk/zynqmp/divider.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/zynqmp/divider.c b/drivers/clk/zynqmp/divider.c
> index 422ea79907dd..8d1a21214084 100644
> --- a/drivers/clk/zynqmp/divider.c
> +++ b/drivers/clk/zynqmp/divider.c
> @@ -120,10 +120,13 @@ static void zynqmp_get_divider2_val(struct clk_hw *hw,
>   	long error = LONG_MAX;
>   	unsigned long div1_prate;
>   	struct clk_hw *div1_parent_hw;
> +	struct zynqmp_clk_divider *pdivider;
>   	struct clk_hw *div2_parent_hw = clk_hw_get_parent(hw);
> -	struct zynqmp_clk_divider *pdivider =
> -				to_zynqmp_clk_divider(div2_parent_hw);
>   
> +	if (!div2_parent_hw)
> +		return;
> +
> +	pdivider = to_zynqmp_clk_divider(div2_parent_hw);
>   	if (!pdivider)
>   		return;
>   
> 

Acked-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal
