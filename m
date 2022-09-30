Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 565A8C433FE
	for <linux-clk@archiver.kernel.org>; Fri, 30 Sep 2022 13:00:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230236AbiI3NAl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Sep 2022 09:00:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230174AbiI3NAj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Sep 2022 09:00:39 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2057.outbound.protection.outlook.com [40.107.92.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9C0C91D17;
        Fri, 30 Sep 2022 06:00:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YtR82fVa4zvnZ0ovOmMszUYXtU9i9nRNMGDq2DMgv6/Q6IuJLFIutlMt47tebk74ml5b9t6h/scQEddx4f/PL0Mp7oLSJjRlqNT7NxauJC+Z2pG9bz2rzjWdnkQHKpgOkD8nA2+r8W6K9TtCrd2k9oRrbiEO67OycGkoM4XeZIjezjjt0rrm08HYPwlhw4dK7ghZK/PVx624ZWk4PEZMq0sXz2FN5QRsKLEWiKUO6KR6UPFZfl+ZoUAxuJ7x0o1zjjVuvUHgm3nq8PdWMng3q6arzkv6BS04MfEu3bLrep17kcHzFnexsGZU2n4C87IEZlXlwQVfVR2o6+Z5GI9/zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qmtKM0VwTnGGmvGzAOUB/bn+JT9gVDnPhnTd8SHuL5E=;
 b=gDmRuvza6kHZkJ8R+JTRhe868EL6UdYLs9FbpSYOXL+B+z2J7F3kyQFBxmPR7X0YxmUq+lmnfHERGhXXnUwEtYUNi7yXmFr3KnbTVQ5im8oTXZ+K8hS21C608JU25VV4WxaSLJzYfOvR7bY3/4ZUzeJvOW2uXZze49XEtX4v0mqonPwR1NAhFILjtNl8KCVe+kGsLLJ2DxKfn7cENjJc1sLu3TymiTg8ZM+HDIamhiNbhSHni8XYAVNSe2Ey1A7AtBqj/L6d/g9GBeJBzBXoPbDBGAUzRTWeT+wol9YXgphbaIX3DaRBbXW6ga921D7mAmJ6BJ7eIwH9UhOe1D2+bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qmtKM0VwTnGGmvGzAOUB/bn+JT9gVDnPhnTd8SHuL5E=;
 b=IHx/fF+O2zXgj4IJCFtB7KLpAwsTRQKDRHXVIphs/KlFLRyUROGF2cgwLUbH8sPZV7HlIsjG4MZatx3ifhdJDj+jyoSB5qE6zG0WoO91ARORh57Kj1HyuEZ0sCBZ7xcmiRU0q5paOsULc0Pl47/rN8BrJDzkIX5+Qaj9/ZeA5DQ=
Received: from MW3PR06CA0004.namprd06.prod.outlook.com (2603:10b6:303:2a::9)
 by SN7PR12MB6791.namprd12.prod.outlook.com (2603:10b6:806:268::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Fri, 30 Sep
 2022 13:00:36 +0000
Received: from CO1NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2a:cafe::af) by MW3PR06CA0004.outlook.office365.com
 (2603:10b6:303:2a::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23 via Frontend
 Transport; Fri, 30 Sep 2022 13:00:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT031.mail.protection.outlook.com (10.13.174.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5676.17 via Frontend Transport; Fri, 30 Sep 2022 13:00:35 +0000
Received: from [10.254.241.52] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 30 Sep
 2022 08:00:31 -0500
Message-ID: <afb3f19f-eb40-5453-a82b-295e06861f86@amd.com>
Date:   Fri, 30 Sep 2022 15:00:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH 1/2] dt-bindings: clk: Add binding for versal clocking
 wizard
Content-Language: en-US
To:     Rob Herring <robh+dt@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
CC:     <linux-clk@vger.kernel.org>, <git@amd.com>,
        <devicetree@vger.kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <sboyd@kernel.org>, <mturquette@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220930080400.15619-1-shubhrajyoti.datta@amd.com>
 <20220930080400.15619-2-shubhrajyoti.datta@amd.com>
 <CAL_JsqLaqjZeZd3c-fd9f5m-4OCXgOZcOu+paik9FV_eno5sLg@mail.gmail.com>
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <CAL_JsqLaqjZeZd3c-fd9f5m-4OCXgOZcOu+paik9FV_eno5sLg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT031:EE_|SN7PR12MB6791:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b20f87e-19c0-4c8d-614a-08daa2e3c45a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HKTJy4thurQOaly3+qln9txCok0vMOeF3BX1b1uBAZCF0AJo1Q7MA0Wv8lAiE9PpfrpHelEbPh2rww6qyVG8FQpanJeGGb5kirS4VshYVKoY6/hzBmgl2H0uXRkdRz818ulqPFa4Sg5aOesNZFM2ck9iJ9KCWlAWnM8QHboHdBlHGS6/XxPUN5p7lq5UvzJCOZ0d1kl52iVCPVBkVIMOOuoDKDp4D4b1xSRFxlv38KEV/q38anAbZLVjyC3XctoLYe0lg2UCsIe/huNs0KfurhqRo8HShB8kK/0/D6oIABoxk1yZLkmM/UI1c/gDrbhhFaHDJx83ZM0V1mf233kVw3sd+tTzUnUusPArjL5TBo/BCshZqAG9XyeDWP0aeKLYHd1qU454F7mPGUymWnAmwWTthxl/Xv3nRUCHLPGgNDBtcAitTOTuMbV5NSM1Ap62POp1rKt+Qr0cjTBSEDcl/SqzyosbWI3O+O9etlQ5XzElN1DTAPDLJEoQ9LFrMF/RVP7XwBRMeoGSeHjH5o61SfSu0FvMZ/DufWpWyNcYRLTT+2MpxVmtVdrEULETz9Buq5+12r3ZyE+OnEPE/dn5zArC7Q8C7I6RidoCvbdMboRcVwFEqvHxpOdSut0GyEnkmvsqi0zSCAN/xnn3npf8Igxv9HNYLBJswCEcqoXc/lwIn+Sz2th2y90CWqAHrsxbtxR1E/QVVDxBxHF3/sDjaM/pOGal5V1BIl8e++Xmt5oIrZq9koeFSQQ5FeEi4n96VGT3d8AK1CkjjHwJR3IbBcxF5hkmQutsDojHQ8gkERSRDtSvCS8LLY+nUuIAqsM90iuS9QgT6/HhKiIEnET1m1wY1nKY36yKOSfZmngZZR6yxxJP4eCz+RF5ZEIkUcKqVVvQ4YY86lt8fZxbCKAq8w==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(346002)(396003)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(36860700001)(186003)(356005)(2906002)(426003)(16526019)(81166007)(2616005)(83380400001)(36756003)(82310400005)(47076005)(40480700001)(86362001)(40460700003)(82740400003)(31696002)(336012)(478600001)(70206006)(316002)(54906003)(16576012)(110136005)(8676002)(6636002)(4326008)(53546011)(5660300002)(70586007)(966005)(26005)(6666004)(44832011)(31686004)(41300700001)(8936002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 13:00:35.9848
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b20f87e-19c0-4c8d-614a-08daa2e3c45a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6791
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Rob,

On 9/30/22 14:25, Rob Herring wrote:
> On Fri, Sep 30, 2022 at 3:04 AM Shubhrajyoti Datta
> <shubhrajyoti.datta@amd.com> wrote:
>>
>> The Clocking Wizard for Versal adaptive compute acceleration platforms
>> generates multiple configurable number of clock outputs.
>> Add device tree binding for Versal clocking wizard support.
> 
> Really v1? I'm sure I heard of this wizard before.
> 
> What about this?:
> 
> drivers/staging/clocking-wizard/dt-binding.txt
> 
> That needs to be moved out of staging rather than adding a 2nd one.


Let me clarify this. This is IP which is already moved out of staging. 
Linux-next has these changes and waiting for MW to happen (already in clock tree).

And this is new IP. Not sure who has chosen similar name but this targets Xilinx 
Versal SOCs. Origin one was targeting previous families.


> 
>>
>> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
>> ---
>>
>>   .../bindings/clock/xlnx,clk-wizard.yaml       | 66 +++++++++++++++++++
>>   1 file changed, 66 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/clock/xlnx,clk-wizard.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/clock/xlnx,clk-wizard.yaml b/Documentation/devicetree/bindings/clock/xlnx,clk-wizard.yaml
>> new file mode 100644
>> index 000000000000..41a6f4bcaccd
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/xlnx,clk-wizard.yaml
>> @@ -0,0 +1,66 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/xlnx,clk-wizard.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Xilinx Versal clocking wizard
>> +
>> +maintainers:
>> +  - Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
>> +
>> +description:
>> +  The clocking wizard is a soft ip clocking block of Xilinx versal. The IP
>> +  uses the input clock frequencies and generates the requested
>> +  clock output.
>> +
>> +properties:
>> +  compatible:
>> +    const: xlnx,clk-wizard-1.0
> 
> Where does 1.0 come from? A 1.0 always feels made up. This should be
> based on some IP versioning that's documented somewhere.

Soft IP catalog name with version:
xilinx.com:ip:clk_wizard:1.0

https://docs.xilinx.com/r/en-US/pg321-clocking-wizard/Introduction


Thanks,
Michal
