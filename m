Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 283A7C433FE
	for <linux-clk@archiver.kernel.org>; Tue, 10 May 2022 07:32:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238087AbiEJHgc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 10 May 2022 03:36:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238218AbiEJHGP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 10 May 2022 03:06:15 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2058.outbound.protection.outlook.com [40.107.244.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 232D789CD8
        for <linux-clk@vger.kernel.org>; Tue, 10 May 2022 00:02:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=hzdx0ESscX9p2MaWskRNdMYS4rOupKOpI0ETArL2d/ydCOAFQJtwpb9FQZBfQMv/lyxvKb0AgiT87uLWwCBKLO3EpsF5CVIxtex4fxZIOUFWOSEgSQaiNvnmnahehNfZ6dQ8FvjtuY4cRkYdB8Ab286CL36ORMx7PrRPi3sW17QKyz7Rt435m0gc/hxWvQdprLpH3yiQhJ+naEcRSWyBqgjK4tlud9n7rB1GuH/matuNCYrfWbf9iBgJYcdK9Eqz4ywhTfwEHURtIaVTtzTqINjIHOLQG1WL1fO5p5Lj1Lt8rBWaWnNkAalJ19F/mnoDcG3uTgKUAdWBRyKH8rwqqg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ehGJhZ0h7emvyesEV0v1lEdQNTIDx46+PUA9sGciXlU=;
 b=UqjnkLKMWkFTxtb+q82bTos7sjMsZhNYSvgXEvZDEa4CBIXR1gikbAtXTy+yFGQwipTQJEiekFSC0fzsYmjGGLKkAkdEPI3VoDWFBcuouKzcsNWTH6PTH0x8FSTarqz1iJVHlj6+AaMUodR/qRI1Q5tTShnVM2uMvZJj/ONEDhRKbnvfmVS2MQ8rL0/Y/z+poW91YYrSfusXuAJotG91ozxFn0hQ+Wt+jIjQDJkb3veOAhzCH/l3Ww0/BrenhEYy7/7h8g9U1Fz4LP7Axm61FEMWMSplmbcCR3NkRHsiUfiqExZDBpXWKhjD6hJ+oJzUIboIWSLArqTQlNaQ6P3d1Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 20.83.241.18) smtp.rcpttodomain=baylibre.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=xilinx.com] dmarc=[1,1,header.from=xilinx.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ehGJhZ0h7emvyesEV0v1lEdQNTIDx46+PUA9sGciXlU=;
 b=JmeWlC5AYlPU9TY2W8SD5vJ9RJsRst/aEVuXGVRAWmkjYqG1NFdv0J0Fct1M/3PslCNnODdMrizQLlDBMW7TygGSEl311RYGWfN+/nAm6wUPKWjDCHWT4Oz3+jrON1qznwHJfxqi7Il6GTpmI8IOTe2J5XBNOcCoDCIIrTnT9dM=
Received: from DS7PR05CA0070.namprd05.prod.outlook.com (2603:10b6:8:57::28) by
 DM6PR02MB5145.namprd02.prod.outlook.com (2603:10b6:5:42::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.25; Tue, 10 May 2022 07:02:17 +0000
Received: from DM3NAM02FT055.eop-nam02.prod.protection.outlook.com
 (2603:10b6:8:57:cafe::fa) by DS7PR05CA0070.outlook.office365.com
 (2603:10b6:8:57::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13 via Frontend
 Transport; Tue, 10 May 2022 07:02:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.83.241.18)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 20.83.241.18 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.83.241.18;
 helo=mailrelay000000.14r1f435wfvunndds3vy4cdalc.xx.internal.cloudapp.net;
Received: from
 mailrelay000000.14r1f435wfvunndds3vy4cdalc.xx.internal.cloudapp.net
 (20.83.241.18) by DM3NAM02FT055.mail.protection.outlook.com (10.13.5.136)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.15 via Frontend
 Transport; Tue, 10 May 2022 07:02:17 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
        by mailrelay000000.14r1f435wfvunndds3vy4cdalc.xx.internal.cloudapp.net (Postfix) with ESMTPS id C2E7F41D63;
        Tue, 10 May 2022 07:02:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ku9Ia/BxITVSJmU0WpefRRKdZxlwMGik71oE2iQFMj1vRtee+/WmqpTSawukMO8mvAMu6EnuZbcSy78k8Bq+XuA1y/ANFQqtCM7vwGzIoiz1G0qX64UQs9KCFhG42nTKmKbXpeiXbJAKzG0EcM5zJiC6WxrVfynG6MVt2WMb+TfKF+rHuOqLJWrvFI3Db/Uv7DTudOyUY/KKCE7Z8lABNndgIdYFA8c3XXWVWEktMfNagEkvUtzf3dIfXedxefdIJMFK1pwI6qr5AB2cOiz3qTx3V21YSBtbAxZbj2IGhL2ldIJA3xos6dFPUqHEVqu+Aeh1AmmCSITYEYyVq/0tbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ehGJhZ0h7emvyesEV0v1lEdQNTIDx46+PUA9sGciXlU=;
 b=WUjj8mNO3RaSGiiPWCFWHgmL20SYlAvoQfy5FmGUOgR98S/6Rc1LG1QvZcpOpBBLtLR9+kyaOv6RILyuDleisd6b4OQqA7Ch/NVoACmQQz4WL+6qNT4OL/8+73HmMbD8H4BTU8xwM4W3IZxQc1ctsFPDMR0vcnug9dMx6DJUCxjWt7XYIoSJeFh8L/v0UOz8kWw8t1/gYVqcnX62YfhqrogPrpQaXR31nIe8Clyb/uu5AzgtSButC7CMj0P2xjH6WWKDGKbuzIwk8JQtZyzbStuemRU6uU6b5WsXacwE9agmrJKlTLP7N1hkZdrG7FNUlS1rhSiYKfXjINIg8fP/Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
Received: from DS7PR03CA0023.namprd03.prod.outlook.com (2603:10b6:5:3b8::28)
 by BN0PR02MB8253.namprd02.prod.outlook.com (2603:10b6:408:154::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Tue, 10 May
 2022 07:02:14 +0000
Received: from DM3NAM02FT008.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:3b8:cafe::42) by DS7PR03CA0023.outlook.office365.com
 (2603:10b6:5:3b8::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23 via Frontend
 Transport; Tue, 10 May 2022 07:02:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT008.mail.protection.outlook.com (10.13.5.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5227.15 via Frontend Transport; Tue, 10 May 2022 07:02:14 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 10 May 2022 00:02:12 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 10 May 2022 00:02:12 -0700
Envelope-to: git@xilinx.com,
 linux-clk@vger.kernel.org,
 sboyd@kernel.org,
 mturquette@baylibre.com
Received: from [10.140.6.59] (port=57472 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1noJsh-00083z-1G; Tue, 10 May 2022 00:02:04 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>
CC:     <sboyd@kernel.org>, <mturquette@baylibre.com>, <git@xilinx.com>,
        Ian Nam <young.kwan.nam@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH 2/2] clk: zynqmp: Fix stack-out-of-bounds in strncpy`
Date:   Tue, 10 May 2022 12:31:54 +0530
Message-ID: <20220510070154.29528-3-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220510070154.29528-1-shubhrajyoti.datta@xilinx.com>
References: <20220510070154.29528-1-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 86fd80fb-e0e1-487a-2660-08da325304f4
X-MS-TrafficTypeDiagnostic: BN0PR02MB8253:EE_|DM3NAM02FT055:EE_|DM6PR02MB5145:EE_
X-Microsoft-Antispam-PRVS: <DM6PR02MB5145B8E050C6DDB339BC020AAAC99@DM6PR02MB5145.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: wYUiE3JvNNBoFM2dqstTwg+F1p4nmP/L6I8WAd3M0MrzBl/U1HyccywlDqjlLP5JIGFNwSdd8y+aEGoE1lqsHx+q55Sw7gfetUJz0yHgo0Dfl+vhb/EHGGE3xBiDtvzGskxqZxJPnIOnYIvp/QtC22enS5vP2KPQKDhsm92dtnxYCvrAbO8URr3girqky/ibUAlCbitm/m89EbDNBXgNH/H46gZr/5izBcBANHuZLK4Cxe7OfpM/yuQ5r3rt4vaxV9SiLHaAR8zJYvtVH67daHFEbEEgzD/ButvhikRRnIJZNk/MLF2nzw90gcjSPHKc0SWjTOvgqp5lLrQ7t2y9nAa6Y1U49S1t6bDFzj/cBZf8EYSfo789Y2u9wk3dpnWW8acu+Wg349v0/o8eisdz9UXGlh1qu3GD0pLVWZ6qoDsblZeAPqgj4Cs/lAhKW65djDOvQQrxK8TN8G6k/t9IdP3CZSJeHdA3p6l8MZTr+wRJMKM2EMRbll+Fbh8LwgVn4/nuhYjAn6F4pdVG6TecogLASuPl4YKvYlegK+Q+ui9VL4OiVVSN00YoN2NArygiruyPDi60KtsAprzcDu0jFaBh+WuYEFHZUnrVrzOdpVCrwsGSF21Dhz1rbnTh3A0UWd+GsdjpHcIbuRD2hMI3WWtSZWkWS9w0SF21c8Stx6R6PJqUag0DPCagTweZqll6S3HrK5xDY+VyZWUS8PNM5fh8UNKQWf6FFg6J1mGynWmgTySXvK0/N4+CIy0E0iFcl3Ruy+Uy59T2Xasry3FnOw==
X-Forefront-Antispam-Report-Untrusted: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(26005)(4326008)(8676002)(2616005)(44832011)(7696005)(2906002)(7636003)(8936002)(9786002)(6666004)(508600001)(1076003)(40460700003)(83380400001)(36756003)(36860700001)(54906003)(5660300002)(186003)(356005)(336012)(426003)(316002)(47076005)(107886003)(6916009)(70586007)(70206006)(82310400005)(102446001)(81973001)(505234007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR02MB8253
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DM3NAM02FT055.eop-nam02.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 401e83b0-24cc-44fc-40bf-08da32530325
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tc80LpxXxozEXTPwXiRJCvJrleO9u5/VKV0tbybJhWSZtVr8q3nqTq7xIEn6lzQkAd52XoxdmWVeM4jxH2VIv3Cc74dX2sQjbFR1qKWpzB9AAku3wI0v//ObfDp6gt+dIWTHRyXXm4dXIsGjRyECBYAZ9RgBkxbtdoJAwtiucW/VztpqvALRR9XVx+/KCtheIYQreRrWaH61CGWqziPrHYasXDe6piBEkoMpP+ZR5R9kgWaV7bqH4fY76uni7YeOEF5BstqeC/5dwJRu0IsYToSRbVwExwdt7pQvvJAZLtm6zCDMmW9/EE/PFyn9C/t25kEbe97cCoF34obCbjteddajTcgfJCm/g97ZPyEyE/Cx6o/46k5L7sSmBit+kX/YTzNZuRQs9UEwr5srlC9IWsg33qEj+AwCG0jG3qVeW3kJrgKiWllQbHXzS/koYH/L9aiiASlBkQYfLWA/SXr7WihcZSoW5V+oEEmryJbEllLlkrpoNX2IfIF3YumLiNIbEoQDC0BSlbWntaM2eBztZLMXMzPAfvlVyHfj4i98hQP/E0biXYFwsvo7kQrBtI1dlPb4ymQ5bHXx5bsQ6P5C4ikE3T4vN8rjSfcmXzqWt3i4MR/wQDSqA4MEGX9mng0KsoX75mY+I7uM6gfIev4iWfV+2GrHEAzrwSN0IDwsjpPRv2eON1PePFK0t0AdKDxfl0NoVz+tmnFXE+2rbJ7mCePuQLYeAsww3+5Yyhk+Q8Wz9UsmqxEV/d9MYXaV6sMS5YJqMjZCmB9gkAEkSJYjTaC5sNQeTYZhOGq8rl5BNWs=
X-Forefront-Antispam-Report: CIP:20.83.241.18;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mailrelay000000.14r1f435wfvunndds3vy4cdalc.xx.internal.cloudapp.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(82310400005)(81166007)(508600001)(5660300002)(54906003)(83380400001)(36860700001)(44832011)(316002)(9786002)(2906002)(36756003)(8936002)(6916009)(4326008)(70206006)(8676002)(336012)(26005)(2616005)(107886003)(47076005)(426003)(186003)(1076003)(7696005)(6666004)(40460700003)(102446001)(81973001)(36900700001)(505234007);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 07:02:17.2036
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86fd80fb-e0e1-487a-2660-08da325304f4
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[20.83.241.18];Helo=[mailrelay000000.14r1f435wfvunndds3vy4cdalc.xx.internal.cloudapp.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DM3NAM02FT055.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5145
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Ian Nam <young.kwan.nam@xilinx.com>

"BUG: KASAN: stack-out-of-bounds in strncpy+0x30/0x68"

Linux-ATF interface is using 16 bytes of SMC payload. In case clock name is
longer than 15 bytes, string terminated NULL character will not be received
by Linux. Add explicit NULL character at last byte to fix issues when clock
name is longer.

This fixes below bug reported by KASAN:

[    7.522474] ==================================================================
[    7.529795] BUG: KASAN: stack-out-of-bounds in strncpy+0x30/0x68
[    7.535871] Read of size 1 at addr ffff0008c89a7410 by task swapper/0/1
[    7.542557]
[    7.544065] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.4.0-00396-g81ef9e7-dirty #3
[    7.551809] Hardware name: Xilinx Versal vck190 Eval board revA (QSPI) (DT)
[    7.558847] Call trace:
[    7.561321]  dump_backtrace+0x0/0x1e8
[    7.565023]  show_stack+0x14/0x20
[    7.568374]  dump_stack+0xd4/0x108
[    7.571817]  print_address_description.isra.0+0xbc/0x37c
[    7.577189]  __kasan_report+0x144/0x198
[    7.581068]  kasan_report+0xc/0x18
[    7.584507]  __asan_load1+0x5c/0x68
[    7.588032]  strncpy+0x30/0x68
[    7.591120]  zynqmp_clock_probe+0x238/0x7b8
[    7.595350]  platform_drv_probe+0x6c/0xc8
[    7.599405]  really_probe+0x14c/0x418
[    7.603108]  driver_probe_device+0x74/0x130
[    7.607339]  __device_attach_driver+0xc4/0xe8
[    7.611744]  bus_for_each_drv+0xec/0x150
[    7.615711]  __device_attach+0x160/0x1d8
[    7.619678]  device_initial_probe+0x10/0x18
[    7.623907]  bus_probe_device+0xe0/0xf0
[    7.627785]  device_add+0x528/0x950
[    7.631312]  of_device_add+0x5c/0x80
[    7.634926]  of_platform_device_create_pdata+0x120/0x168
[    7.640299]  of_platform_bus_create+0x244/0x4e0
[    7.644880]  of_platform_populate+0x50/0xe8
[    7.649110]  zynqmp_firmware_probe+0x370/0x3a8
[    7.653602]  platform_drv_probe+0x6c/0xc8
[    7.657656]  really_probe+0x14c/0x418
[    7.661359]  driver_probe_device+0x74/0x130
[    7.665589]  device_driver_attach+0x94/0xa0
[    7.669820]  __driver_attach+0x70/0x108
[    7.673698]  bus_for_each_dev+0xe4/0x158
[    7.677664]  driver_attach+0x30/0x40
[    7.681278]  bus_add_driver+0x21c/0x2b8
[    7.685157]  driver_register+0xbc/0x1d0
[    7.689035]  __platform_driver_register+0x7c/0x88
[    7.693793]  zynqmp_firmware_driver_init+0x1c/0x24
[    7.698637]  do_one_initcall+0xa4/0x234
[    7.702518]  kernel_init_freeable+0x1b0/0x24c
[    7.706924]  kernel_init+0x10/0x110
[    7.710450]  ret_from_fork+0x10/0x18
[    7.714058]
[    7.715559] The buggy address belongs to the page:
[    7.720405] page:ffff0008f9be1c88 refcount:0 mapcount:0 mapping:0000000000000000 index:0x0
[    7.728772] raw: 0008d00000000000 ffff0008f9be1c90 ffff0008f9be1c90 0000000000000000
[    7.736606] raw: 0000000000000000 0000000000000000 00000000ffffffff
[    7.742942] page dumped because: kasan: bad access detected
[    7.748572]
[    7.750076] addr ffff0008c89a7410 is located in stack of task swapper/0/1 at offset 112 in frame:
[    7.759052]  zynqmp_clock_probe+0x0/0x7b8
[    7.763103]
[    7.764604] this frame has 3 objects:
[    7.768306]  [32, 44) 'response'
[    7.768312]  [64, 80) 'ret_payload'
[    7.771573]  [96, 112) 'name'
[    7.775095]
[    7.779585] Memory state around the buggy address:
[    7.784430]  ffff0008c89a7300: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[    7.791735]  ffff0008c89a7380: 00 00 00 00 f1 f1 f1 f1 00 04 f2 f2 00 00 f2 f2
[    7.799040] >ffff0008c89a7400: 00 00 f3 f3 00 00 00 00 00 00 00 00 00 00 00 00
[    7.806342]                          ^
[    7.810132]  ffff0008c89a7480: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[    7.817437]  ffff0008c89a7500: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[    7.824738] ==================================================================

Signed-off-by: Ian Nam <young.kwan.nam@xilinx.com>
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 drivers/clk/zynqmp/clkc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/zynqmp/clkc.c b/drivers/clk/zynqmp/clkc.c
index 3d406d2f0a35..57bdc2627b87 100644
--- a/drivers/clk/zynqmp/clkc.c
+++ b/drivers/clk/zynqmp/clkc.c
@@ -711,6 +711,13 @@ static void zynqmp_get_clock_info(void)
 				  FIELD_PREP(CLK_ATTR_NODE_INDEX, i);
 
 		zynqmp_pm_clock_get_name(clock[i].clk_id, &name);
+
+		/*
+		 * Terminate with NULL character in case name provided by firmware
+		 * is longer and truncated due to size limit.
+		 */
+		name.name[sizeof(name.name) - 1] = '\0';
+
 		if (!strcmp(name.name, RESERVED_CLK_NAME))
 			continue;
 		strscpy(clock[i].clk_name, name.name, MAX_NAME_LEN);
-- 
2.17.1

