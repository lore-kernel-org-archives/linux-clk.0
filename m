Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E08BC433FE
	for <linux-clk@archiver.kernel.org>; Mon,  3 Oct 2022 09:59:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbiJCJ7k (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Oct 2022 05:59:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbiJCJ7i (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Oct 2022 05:59:38 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2045.outbound.protection.outlook.com [40.107.220.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD63D326CD;
        Mon,  3 Oct 2022 02:59:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HqpFl/fdmJIXJ4e9Ajjp4PL/qUawnSmYBLKNuM2sAN/yDFlPtN7mBJtF4HnDNf2o4LeUQ8dJEJbV7immMS3xLKuZPBwlqp4QQLkRmxdq3M/NvlZyXx2+UIhFXHsB1Os6o8OXRb03p2trt+D8DuylgFLyc8z7/TAWCZtqLTfh6duAaKMPkwVe439TlhPYAEYXG6RCVWrqAARQI1/4Ndtj52i32Ruy0Exe1ElAeIVne7WW7c56HDoZmvK2TCzeHzVVZ3KTDkQmaDlQPzZMawTuSjDRGxHn6UOQf7aDtdL1ngB3PixRY43xGhmSCk58teijlnbmHzcdwzXnzK0WWdo3PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L6RkPMLrpyILbwU1WD/eUQjrpcvhtlTSrHAg/ktvV2Y=;
 b=NnUhJkTPRyeLAxHidoi5C6NG1Sur2nzu3EpFzz1/tSVbzgyQmXjVao9Xm24LFdkD+VTvcW3QPwvL+x2HQfrJks9UKhM6ggIm+5iHMI9euFQS+44Xkbn8vL0V0GU/WI4aymylW3aAtN7gd9/igtgtv4ldBFTw64ekvbh5lc6F5XM1SOh9gCsziRopZYwtxCxgckqo6CDdHQ+QUvBGL1FoEkt3JuWYL197GibCSgb3qwT24CCExAyCU2eLK4nb9h6Wb0IDw9J14sHN6JyqPVl9vjgxiSL7MOfPNbz15P/cILfUx6hxGiXvETwpfYEyxSInDM7yyJoizAtjXSUKrKyOew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6RkPMLrpyILbwU1WD/eUQjrpcvhtlTSrHAg/ktvV2Y=;
 b=Gug5uRiCTvTqJuIp6Aiz2nqwDYL+sALjKQJaD+h+encwP4WSVHaEX3yg57vgnI7KbsWQnZ8vaGZdwa3JBKHJbqWllWNARujVZtWKjDqXGCxTcov9HaopCIkGztfLtorGqCinecxKd2lcALszOcN2d7MhYp93atEmlA+YHUZiT9A=
Received: from DM6PR03CA0020.namprd03.prod.outlook.com (2603:10b6:5:40::33) by
 DM4PR12MB6397.namprd12.prod.outlook.com (2603:10b6:8:b4::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17; Mon, 3 Oct 2022 09:59:30 +0000
Received: from DM6NAM11FT111.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:40:cafe::c0) by DM6PR03CA0020.outlook.office365.com
 (2603:10b6:5:40::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23 via Frontend
 Transport; Mon, 3 Oct 2022 09:59:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT111.mail.protection.outlook.com (10.13.173.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5676.17 via Frontend Transport; Mon, 3 Oct 2022 09:59:30 +0000
Received: from [10.254.241.52] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 3 Oct
 2022 04:59:25 -0500
Message-ID: <a8576f0e-b5ab-33d1-40d4-5f25c66616c7@amd.com>
Date:   Mon, 3 Oct 2022 11:59:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH 1/2] dt-bindings: clk: Add binding for versal clocking
 wizard
Content-Language: en-US
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC:     Rob Herring <robh@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        <linux-clk@vger.kernel.org>, <git@amd.com>,
        <devicetree@vger.kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <sboyd@kernel.org>, <mturquette@baylibre.com>
References: <20220930080400.15619-1-shubhrajyoti.datta@amd.com>
 <20220930080400.15619-2-shubhrajyoti.datta@amd.com>
 <CAL_JsqLaqjZeZd3c-fd9f5m-4OCXgOZcOu+paik9FV_eno5sLg@mail.gmail.com>
 <afb3f19f-eb40-5453-a82b-295e06861f86@amd.com>
 <20220930213924.GA1079711-robh@kernel.org>
 <6e58837e-896c-7069-7913-2afb90af5e95@amd.com>
 <b495804c-cf04-4512-ac05-424eded46468@linaro.org>
 <57989d3e-a186-1d67-cff9-6a059f94ebd3@amd.com>
 <f611237f-0401-9e3c-3a21-79b33141bb51@linaro.org>
 <YzqaXthSLBbwU+5V@kroah.com>
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <YzqaXthSLBbwU+5V@kroah.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT111:EE_|DM4PR12MB6397:EE_
X-MS-Office365-Filtering-Correlation-Id: 173c1661-0cfe-47f1-bc3d-08daa525f6f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /hgm4wWmbxMBnQMWLqwVI3nnRpAzcSE4YM0yL25cBremCUtdL9ZKYcjki0MQR7B66DQkoEGSI9z0+NmTcRij6mkNBDMvhISeaecNlM0pL+Xh0znAPg/sCugzS4y+2kXMoybdKRG9xtUCM/k/2XBdFRUHdvcy3dPWL080RSmS3I16TjKDFst6Q8zvJl9s8BiWEmA2EH9gdf5ZRV6Z0EsTQ5KNW2AmzrbeVeNDg0YmqMBuMAU7e0iUVEDeG2wxqOHWu3DAT9wgGa/mLUFsstcOQJlC39eETfCvlCcAAnykQiyiVbBHCuC+bgoGyQyhsZpmJWKG+lRZYAKmVlE3eGRe6/5U/qdkvgls8OCzpvjlsdN3pdpXp4WInbjs4Q/sE8IxFqj5SbsCQaS+Y6SIbfTmJVuNP0wVbcjS1p2mVdDM04Aa/wVYTdjeXwsJS3HGsQS7dGG7BRblwEuiz0D88UkKZQ+3l4JLAEe/bdorCcDCrTmIvR/Zx4dx0D475wLoCCCSsxjXPP0ZHARKfNzSc5l8ftWd4VGZ74pQBjtQQkcsWV1RgUUfZ2sITDWfNwOHQX+WrGT2Axob8H3ieULw4cHNJEPIAlGr0aoCBj/TbxDSqSKG0AH5ivvOrZuoX+1n1iW3SEvMAbHdBgTROk6dpt/gEKwVOP4I3wtF4uc+iBqMigpfe9vvGC70fXb1TIwbss//3xyNRnKbFtOGzMEci2KY8ziEfFeFXPWuY/9wFCPaX4EuSqk/WprhgV5n/7Qq1E2exnCFmCgrBGE7/kw0q+BrN19DtZMzJ59RTEexZ1J3PiYObvGpiHkZOG1e7VKVaami38XdSRyeRVo8i6CDvz+92OYDE89Gz9AuASOqCciQKuY=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(39860400002)(396003)(376002)(451199015)(40470700004)(36840700001)(46966006)(5660300002)(478600001)(8936002)(36860700001)(2906002)(81166007)(53546011)(82740400003)(36756003)(70206006)(966005)(54906003)(16576012)(86362001)(31696002)(41300700001)(356005)(4326008)(316002)(82310400005)(8676002)(44832011)(110136005)(83380400001)(40460700003)(40480700001)(16526019)(31686004)(336012)(426003)(66899015)(6666004)(2616005)(186003)(70586007)(47076005)(26005)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2022 09:59:30.1278
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 173c1661-0cfe-47f1-bc3d-08daa525f6f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT111.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6397
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Greg,

On 10/3/22 10:16, Greg Kroah-Hartman wrote:
> On Mon, Oct 03, 2022 at 10:10:38AM +0200, Krzysztof Kozlowski wrote:
>> On 03/10/2022 09:58, Michal Simek wrote:
>>>
>>>
>>> On 10/3/22 09:23, Krzysztof Kozlowski wrote:
>>>> On 03/10/2022 09:15, Michal Simek wrote:
>>>>>>> And this is new IP. Not sure who has chosen similar name but this targets
>>>>>>> Xilinx Versal SOCs. Origin one was targeting previous families.
>>>>>>
>>>>>> Do we need a whole new schema doc?
>>>>>
>>>>> It is completely new IP with different logic compare to origin one.
>>>>>
>>>>>>
>>>>>> It is not ideal to define the same property, xlnx,nr-outputs, more than
>>>>>> once. And it's only a new compatible string.
>>>>>
>>>>> I can't see any issue with using dt binding for xlnx,clocking-wizard.yaml
>>>>>
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
>>>>
>>>> So we already have out of staging document:
>>>> devicetree/bindings/clock/xlnx,clocking-wizard.yaml
>>>
>>> in 6.1 yes.
>>>
>>>>
>>>> and author wants to add one more:
>>>> devicetree/bindings/clock/xlnx,clk-wizard.yaml
>>>
>>> as I said it is completely different IP which requires complete different driver
>>> but IP designers choose similar name which is out of developer control.
>>>
>>>>
>>>> Shall we expect in two years, a third document like:
>>>> devicetree/bindings/clock/xlnx,clk-wzrd.yaml
>>>> ?
>>>
>>> Developer definitely doesn't know. If new SoC requires for the same purpose
>>> different IP with completely different driver is something out of developer
>>> control. As of today I am not aware about such a requirement and need and
>>> personally I can just hope that if they need to do such a change they will be
>>> able to keep current SW driver compatible with new HW IP.
>>
>> Then please start naming them reasonable, not two (and in future
>> x-times) the same names for entirely different blocks. And by name I
>> mean compatible, filename and device name.
>>
>>>>> also for this IP if that's fine with you.
>>>>> Only xlnx,speed-grade can be defined for previous IP which is easy to mark.
>>>>
>>>> That old binding also explained nr-outputs as "Number of outputs".
>>>> Perfect... :(
>>>
>>> Anyway if description should be improved let's just do it. I just want to get
>>> guidance if we should update current dt binding for similar IP or just create
>>> new one as this one is trying to do.
>>
>> IMHO, new binding is extremely confusing. We already have support for
>> devices named "xlnx,clocking-wizard" and now you add exactly the same
>> (clk=clocking) with almost the same properties, named
>> "xlnx,clk-wizard-1.0". For a different IP?
>>
>> How anyone (even Xilinx' customer) can understand which block is for
>> what if they have exactly the same name and (almost) the same
>> properties, but as you said - these are entirely different IP?
> 
> Maybe we should just delete the staging one (and the staging driver),
> and start over?  No one has taken the time to get the staging driver out
> of there, so I have no objection to dropping it for 6.1.

As I said it is be out of staging in linux-next. When CLK tree is merged in 
these 2 weeks we are done at least with this driver.

Thanks,
Michal



