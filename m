Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9664C761A6
	for <linux-clk@archiver.kernel.org>; Thu, 30 Mar 2023 09:13:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230409AbjC3JNp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 Mar 2023 05:13:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230410AbjC3JNW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Mar 2023 05:13:22 -0400
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on20627.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8d::627])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68B0F7A83;
        Thu, 30 Mar 2023 02:13:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j50v9vlU+c83tS9c0r/44AOuAUe3o6h53mYgSSh65Sitrkxuw7vOPa5m3SqNlXO5dSLsBjOEIG0otJX//jZoAwzYRAkUBwfF2bI7uh7lNmQ5C3CK0U7mESEwJb17GGvgfbANjIeIcaPgFO3luiiGXNNAe7BhKvt/GZgEyMycEcCaK/mKSr0GbgdeqjGIpIW8bBg2QyZmLrirBD+kWdNNBKrYmIFgHDrLSCmXBcv0cpeVy+8PS9XZpov5DDE2VRLjwah2OWL/wXS6RTU0euX14KTqTxaWTPobPKQb7+BtdXoAzddhXH4rO/RwWCiDfOMwNIQqGzuTGCiIlSXlTFF7Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=74zoSyRT1FGu3OH/LCCJYij77SLP36mTPrSGm/5803k=;
 b=XUu2xLW7UsdkGMQcWa2iMd1USNnlwrTua2xH0u9I2dzDqsVmKd5+7/mtN69c9LQkX3DIfpSR1W447Y8hNVBoIHMR5Mcvr+utB9hQUA8EGgIAlkNysHgdsuVh8PC+NNJ78JBR3P85pJahpvpa0+ppJAA2Cu+nKzF+m7idQgQv0t7ucl/XbvaLG2bvl7Nz0gU2XMQBYKMz1aEU4IfmsaLKmWLqn2wbbUP1YK4Rd5FRBepWkQajDgvjlM060T+EQPzP3KYt7anxkjkkZH7HI0eMasbXACSGCHlV/GZ9s+YBBZjJJ1bNXk8nzc/WfEx6OvcNDg2Gy4LnHlbDns19bJJORg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=74zoSyRT1FGu3OH/LCCJYij77SLP36mTPrSGm/5803k=;
 b=LocTHCKr7Gc3HOHMdhYEvzW8b3Ocn0KSJ03bBWs0NaVn+GzSpyxMa9VzKTNAo9OZcuHnISCYJicZL3RAoFKSZaS0F0JEvL/q21pKBZOf9kE3yKv2wG7wIl4Ek1EZrE2HWEoFUE3C/m5S5OuTlzwCEhE+ptybnk0iIUz9hG8ClXU=
Received: from MW2PR16CA0050.namprd16.prod.outlook.com (2603:10b6:907:1::27)
 by SJ0PR12MB7081.namprd12.prod.outlook.com (2603:10b6:a03:4ae::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Thu, 30 Mar
 2023 09:13:13 +0000
Received: from CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:1:cafe::9) by MW2PR16CA0050.outlook.office365.com
 (2603:10b6:907:1::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22 via Frontend
 Transport; Thu, 30 Mar 2023 09:13:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT003.mail.protection.outlook.com (10.13.175.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6222.22 via Frontend Transport; Thu, 30 Mar 2023 09:13:13 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 30 Mar
 2023 04:13:12 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 30 Mar 2023 04:13:10 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <devicetree@vger.kernel.org>
CC:     <git@amd.com>, <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <michal.simek@xilinx.com>
Subject: [PATCH v1 0/2] clk: zynqmp: Add versal-net compatible string
Date:   Thu, 30 Mar 2023 14:43:07 +0530
Message-ID: <20230330091309.16215-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT003:EE_|SJ0PR12MB7081:EE_
X-MS-Office365-Filtering-Correlation-Id: 73641f7e-2334-4ff0-bbfb-08db30fefd9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m/klHxEJu10VuvCZQSkNgGp3vCU4iFyBApRnwPeTREs5sqd+tuOVzMDAlZYyaNGBp2MEqVxyn9Zb0G/RGKa1gpqkoYTAvzxYR9nvLGYNSVt+kTcpV+BFyciRhZTgXNHazgwIH26XnVcHugKA/K31Bv1kUb13Mpd2GcEl+FevvgF/3xTcOv86h6OIM8IZ1jYUvjXJUprD1g6BKKurfJTBUJMJm4aaBbY5x0VNneHT0to0Cn7PYD2hRV42T5IE2YvTnpb6CUBgWTqX+y/nN7CAi/NDp+um/DGQ0ZQfP0lbVmAksmUY5/qJrpdn8x6XsPwL0Spri+jdK5k4ZaczUab+VeZ+G70vwrHQQTCL9CIGDGOuxnpXe/zxXV4lQDrGawcOx/oDYslWlSC69EPcJXcMVVNSto4osY2+tvf6Zfe+zGRFKIkkcLl0D2PYJ871Nc7WX5Btavz2WyP5KeorngbCmFTxT+ng4dbe8C2tDaMUqrNGRccqLaY1Gyni2jxgpVgdUeI0i/EEm+vwtQZhIdBbp5FTF9CY0jLME4THHi0jXo69Nxkb9t55xHhm6jzgVSxJVKzdtKlFdHJNESdSIU1fB9YAgPiZt8EevjMzdApHN7NgkLAQlPMYIK3dkq1s3CrQu467pcXhiDqdc701b4bk4M6f9F+q0zHG0ToKAggPXyXIG+8zm2BIYfaZmrwjrPy+BuXqctGlGT2HSrDTFJ5HRHAZC/qJtzTGxvkDmK0up0M=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(396003)(346002)(451199021)(46966006)(36840700001)(40470700004)(83380400001)(36756003)(356005)(81166007)(82740400003)(1076003)(26005)(6666004)(54906003)(316002)(478600001)(8676002)(82310400005)(6916009)(4326008)(70206006)(70586007)(40480700001)(41300700001)(86362001)(47076005)(336012)(4744005)(2906002)(2616005)(426003)(40460700003)(5660300002)(36860700001)(44832011)(8936002)(186003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 09:13:13.5200
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73641f7e-2334-4ff0-bbfb-08db30fefd9d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7081
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add a compatible string for versal-net.

Jay Buddhabhatti (2):
  dt-bindings: clock: versal: Add versal-net compatible string
  drivers: clk: zynqmp: Add versal-net compatible string

 .../devicetree/bindings/clock/xlnx,versal-clk.yaml         | 7 ++++++-
 drivers/clk/zynqmp/clkc.c                                  | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.17.1

