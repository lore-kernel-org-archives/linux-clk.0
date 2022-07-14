Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AE57C43334
	for <linux-clk@archiver.kernel.org>; Thu, 14 Jul 2022 12:31:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239335AbiGNMbM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 14 Jul 2022 08:31:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239345AbiGNMa6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 14 Jul 2022 08:30:58 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5614360681
        for <linux-clk@vger.kernel.org>; Thu, 14 Jul 2022 05:30:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eit7jF1vtsljvCq90c1cGW7qKNHY0ZfKxXcVKruNGJ10J7eN+Qi/CCWuRMxP6vqSMljkmiC2li6cAW5rW+UoZStvlwMk27G5XEuLJBtLa8dYTC+xq9OEElkpRjgN+Q9nxAPzRYhDb3CDSugtOTJsO05RMRJ2M/K9skAzANFzQQdkBQB8o6emZV7P9FypNqgcrxHLkl/CHx7QhZpb0ofJY+0yiQaIFfeOoBkyWRHxWT9qsZCypJ7h3huglD9YTZ8DEBR1CUcfa57G9qcKl2SoajDwnvMD6VPMM0+PbVmuiqa+wMvB1Y/vAZ3Nd2zIirr0ubH89nHK6qmeEVW9nNvCJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QdC9akvegPZ5RB/9/dZiO+Ii7hRduMI8/GexyzF/i2g=;
 b=c4O36yjaFW6SLRwpxVMbfGzlNyZIg+JoeUlcgkWerkxj1XJI4OCIQmZg/4bbd8Of1HukBzTXQ+3S9NfSMRDwgcu27CKIfarB5zLKUFFrtqDOQlWRJEphfcS8FTQL74xz7xM3H7tXzr36NGDMA8bIFZ/GscYdelIe4slPXLLx8EFqQdfUd0l8GQ9nzNTjY1KyjEK+9rvRSKkKD47lVw3/STNhr0yNZde9p5YjBj0q55YKfJtoUmmNs64kf9pgP/sijvm0/nOIsG5ZTUtjMAJV9YJZPnoEbi5oRsLBv+M9o8nrw6aM5CkevGykyqPSjoc45hh4l0yoJ+UlRnjn6I+3rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QdC9akvegPZ5RB/9/dZiO+Ii7hRduMI8/GexyzF/i2g=;
 b=W2VVbfpnY7rfgXRS3EDR03NYpRoaHbW3IaybfkUB4mvfUsu7DqV9TEpVDiObfqmWxDBaQTf9GfbPSuJ5DO9ZBxdV+Q9X+/lhKVgVbhphghCGod3oN9V+Rq5KjvgXr9KFGvrLUvukY3YIJ5JflFZoK0fUHJqx53gOeJ/QR/YpaC0=
Received: from BN8PR16CA0018.namprd16.prod.outlook.com (2603:10b6:408:4c::31)
 by MN2PR02MB6800.namprd02.prod.outlook.com (2603:10b6:208:1d3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.23; Thu, 14 Jul
 2022 12:30:02 +0000
Received: from BN1NAM02FT044.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:4c:cafe::65) by BN8PR16CA0018.outlook.office365.com
 (2603:10b6:408:4c::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.27 via Frontend
 Transport; Thu, 14 Jul 2022 12:30:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT044.mail.protection.outlook.com (10.13.2.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5438.12 via Frontend Transport; Thu, 14 Jul 2022 12:30:02 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 14 Jul 2022 05:30:00 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 14 Jul 2022 05:30:00 -0700
Envelope-to: git@xilinx.com,
 linux-clk@vger.kernel.org,
 sboyd@kernel.org
Received: from [10.254.241.52] (port=52538)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1oBxyh-000Goc-U9; Thu, 14 Jul 2022 05:30:00 -0700
Message-ID: <02248029-633b-8bfb-7ab5-40419ca7f23f@xilinx.com>
Date:   Thu, 14 Jul 2022 14:29:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] clk: zynqmp: Check the return type
 zynqmp_pm_query_data
Content-Language: en-US
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        <linux-clk@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>
CC:     <git@xilinx.com>, <michal.simek@xilinx.com>
References: <20220406092211.19017-1-shubhrajyoti.datta@xilinx.com>
From:   Michal Simek <michal.simek@xilinx.com>
In-Reply-To: <20220406092211.19017-1-shubhrajyoti.datta@xilinx.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fdfda09e-66d2-47a9-1f3b-08da659492fa
X-MS-TrafficTypeDiagnostic: MN2PR02MB6800:EE_
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zrBHJeWgJwwCzMKLm+g2l/GDwq7GR182r/Nh/bWFUcdn/W8WaaGvBOkbvA1iA/qje59bSLvVUO3uHGWXzCWDuskxVG13jdfiT1MLZdw5MnqRzSsnt40RFI+C7TgGqjwp8YF2BQ6yNmGdpSSYcRNS6BCYgS7xOGtaUVnuKefjlA2mqBmpDW9iiZqs3FOfjvZGfaDtkJNSxl2UxzuV7eFb0QI3hTS20eD11PvDvTsCZgFH+gH5CcOc4VkFjm7KxNIU5Gvm2JxUscY4B0whzjgsYI35G76yXo+Ms4S/4tQdId1YqzJAWm8lGHQp6DfmXZCnrYS2s9sRUoUscgdFsrjTTY/folfZC3b8silqGQkpdkGhIiTUgArNu3fuy8qeOM7y3XbrcGA+RYqnV1yLusM5z9Ue92gdmqmz7emHGL1VAnU3WmkOUMdmb5ImFyS1Y2XnUPGxmdW531YSq8f7ZYpbGuIO3uPaTmqtDODgnXRx03HBGxAyz2MNLmy7MHW2SfX1m9WJAAscRBGfVubPUZvYu03Z26EP4dGuH2Wqh9Le0mS+ssd80eDfOJyolm1P6ZX7ioUXVbi0h6h7WytCy3NlJGbxzJJiuV6Du9h23kkVDQzwU0S3C/rgiGIRP2HeH/ZUBQCNds+iFsXftkYYAHorohmSQ5GFlzNwwSIB7aRz7oQD/7b2tVa41P3sSUnQyK3q+k4IuZqg8MAcZc1CmxBR4uozQ1s4TImjoRd28mRM3QIlCb/xjNMW2BXLiiCZwPTmTBnyV8QG64zbIpuP7A4MH0I+zUa0Ac+71IbiRrS83vLGwPaHPz/iPT2lWbkPqfDXZdAok4ZGOO/UEyXtWSYkXUhK60X72nfKL95U1Kr4eiBsXMhozluAGRH87o8yYHD9
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(136003)(39860400002)(396003)(46966006)(40470700004)(36840700001)(186003)(356005)(8936002)(9786002)(82740400003)(36860700001)(44832011)(8676002)(40480700001)(110136005)(107886003)(2616005)(5660300002)(26005)(7636003)(53546011)(426003)(2906002)(336012)(83380400001)(47076005)(36756003)(82310400005)(54906003)(4326008)(316002)(31686004)(478600001)(70586007)(70206006)(31696002)(40460700003)(41300700001)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 12:30:02.0527
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdfda09e-66d2-47a9-1f3b-08da659492fa
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT044.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6800
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 4/6/22 11:22, Shubhrajyoti Datta wrote:
> Check the return type of zynqmp_pm_query_data(qdata, ret_payload);
> 
> Addresses-Coverity: Event check_return
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
> v2:
> Update the documentation
> 
>   drivers/clk/zynqmp/clkc.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/zynqmp/clkc.c b/drivers/clk/zynqmp/clkc.c
> index 75d895be2d89..013464af0344 100644
> --- a/drivers/clk/zynqmp/clkc.c
> +++ b/drivers/clk/zynqmp/clkc.c
> @@ -220,18 +220,22 @@ static int zynqmp_pm_clock_get_num_clocks(u32 *nclocks)
>    * This function is used to get name of clock specified by given
>    * clock ID.
>    *
> - * Return: Returns 0
> + * Return: 0 on success else error+reason
>    */
>   static int zynqmp_pm_clock_get_name(u32 clock_id,
>   				    struct name_resp *response)
>   {
>   	struct zynqmp_pm_query_data qdata = {0};
>   	u32 ret_payload[PAYLOAD_ARG_CNT];
> +	int ret;
>   
>   	qdata.qid = PM_QID_CLOCK_GET_NAME;
>   	qdata.arg1 = clock_id;
>   
> -	zynqmp_pm_query_data(qdata, ret_payload);
> +	ret = zynqmp_pm_query_data(qdata, ret_payload);
> +	if (ret)
> +		return ret;
> +
>   	memcpy(response, ret_payload, sizeof(*response));
>   
>   	return 0;

Acked-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal
