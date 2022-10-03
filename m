Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE9E0C433FE
	for <linux-clk@archiver.kernel.org>; Mon,  3 Oct 2022 15:28:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230146AbiJCP2T (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Oct 2022 11:28:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229810AbiJCP2S (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Oct 2022 11:28:18 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2056.outbound.protection.outlook.com [40.107.244.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43AE126AD0;
        Mon,  3 Oct 2022 08:28:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fMUPNU548rYHIrJDko5E5LOWMv6k+lcxhBVvDAvRwTVkpkdpjcdqqs6Lo/CpqsGqPf2p+GA1AVqLqyJmUYYpgU6L/zDv51AnzZHDuSUz6WFiA6l4GX3j4uSSAh5kigvWb9AlDGxdVP6hXgVjAHM+IiP9SUgxxRdqU0SCjxdf3Tw9iD/MxMxcOWbZ36AF7iRl8QmWJvCABIufwkMpOPlKhut/lxxlYndGvoDW1uHnzL4aGuCH+zjXiI81G8Ye3bpxcX/KiVCkY9gUxEL7DLublMOXvHm9Ar72rjJaZppWy8EhWVu7HKRt0lO9Dj6WZvHZJM97/UoqSLWHxr4UJ0nLFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yQITYmr6WYmw0F82NOz32u+UW+YvmJQHwzpjzkWSxKg=;
 b=kp4WjnSfdaUFvvMB/WsqOqkoYqJEhp9MGn/jS4PNytOUFFkm8t+NDr2hfZD25Xuzcvj8m+EjC+0qHiQwdX//RbLlcu4eIcxNjouDs7NEARGvptTkdm+6/W1YM5pMqsy+NHG+5U1m+aBl3IDveZJ3RpwyMauzj1k3xS5GZn3vxV5JMbChXPhGWyXQHUXRAtZjP9HX3oGdLgEOlE+kU3QBgvzYtyOo2mI+/GEglrZxBIAV5WrIlhiDAUqD80f8xVHGaHCA+Ls5uUuqQBodmMCtq4CDzX/CvhZZT0JW2LXlzljCg4EjFbWbggvAh2SXK5YNcznODNJdVzgtcIkz+FuZ2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQITYmr6WYmw0F82NOz32u+UW+YvmJQHwzpjzkWSxKg=;
 b=AznRbPKYdxQ/7bXdsAAU7tW0RjnL8EkcpreAbx9u4R/Wv3/7ELmM6s/g5VaYdHkmUk8WAolavFUqmIm4bVAxG0hNA9U3zaMt37TH9jto/8ObG9YyDGwoqYTj0gm/BBRpXBMtFt4vqdtEL4ZfuUuwGaT4qopG0gAp9agjYr+cJ9o=
Received: from BN8PR12CA0001.namprd12.prod.outlook.com (2603:10b6:408:60::14)
 by DM4PR12MB5247.namprd12.prod.outlook.com (2603:10b6:5:39b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Mon, 3 Oct
 2022 15:28:15 +0000
Received: from BN8NAM11FT071.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:60:cafe::3b) by BN8PR12CA0001.outlook.office365.com
 (2603:10b6:408:60::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24 via Frontend
 Transport; Mon, 3 Oct 2022 15:28:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT071.mail.protection.outlook.com (10.13.177.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5676.17 via Frontend Transport; Mon, 3 Oct 2022 15:27:40 +0000
Received: from [10.254.241.52] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 3 Oct
 2022 10:27:20 -0500
Message-ID: <54652831-cdcc-7735-2b1b-66475ffce476@amd.com>
Date:   Mon, 3 Oct 2022 17:27:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH 1/2] dt-bindings: clk: Add binding for versal clocking
 wizard
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
CC:     Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        <linux-clk@vger.kernel.org>, <git@amd.com>,
        <devicetree@vger.kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <sboyd@kernel.org>, <mturquette@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220930080400.15619-1-shubhrajyoti.datta@amd.com>
 <20220930080400.15619-2-shubhrajyoti.datta@amd.com>
 <CAL_JsqLaqjZeZd3c-fd9f5m-4OCXgOZcOu+paik9FV_eno5sLg@mail.gmail.com>
 <afb3f19f-eb40-5453-a82b-295e06861f86@amd.com>
 <20220930213924.GA1079711-robh@kernel.org>
 <6e58837e-896c-7069-7913-2afb90af5e95@amd.com>
 <b495804c-cf04-4512-ac05-424eded46468@linaro.org>
 <57989d3e-a186-1d67-cff9-6a059f94ebd3@amd.com>
 <f611237f-0401-9e3c-3a21-79b33141bb51@linaro.org>
 <e8507b3c-3dd5-9a65-8058-200b5a410da3@amd.com>
 <19bbea63-41d4-1b35-591e-1776eee1b2aa@linaro.org>
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <19bbea63-41d4-1b35-591e-1776eee1b2aa@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT071:EE_|DM4PR12MB5247:EE_
X-MS-Office365-Filtering-Correlation-Id: f0f42da1-08c0-42bf-c4d4-08daa553e3c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RGUUazuhSn8qwU8GxTNxg8UrXOeiI1AxtA5dz1EUAFBt+ZxBXBQvnMEu0jWnzlB7PZM+09l1q5MkJtkWuy9BchmT5aTCY3awrR41e/PdqPQTTFVch4IkJEfdpOxOahs6DDHWxV8WEtBYeMj3QryoPuTPssb5zw00R4swUds2Ie+EJqkfHp++XlJJweJg6ejEeM7T+22tJBYJDaDfIzwZDV9hC3skmk5t1mqMqXkDxVknUbKgY/Xnss0nqJNJkdYts6dGlsa1VtUOY+0MszNOzIqAbz+vdX2nVbyMUYFfgwvysswfElUlFcqiLjjMd9begphZi9zeLAS4l7SnQfhrKv/Reqjy5KEv7rgUfF8Uu1wnYZLpC1aiiQja/kVGVVIolyA9V0II/Gewew7CECl5dYmcWHA5+gi9aX0nLQGaDmKPa05vvkz+N3TprC1hxhRxFgYe0Gstri5UGgIA2T17LEmSzhZ9LdS/qKR7OZ83Dc6bqxai+qa9JwjE7SuYtvtuvNjl9rSoFoQzBRl5ATLll6uKySxUswVBHP8EuDXEBU6wJKSZMLui+sLK97Ra9tMBAJlwtKF8L1TvyBN4WN1gQju4N09mbYLjeIz/u0f6+KHPvbHvBx4iVexvXg0uxeAL6YY4Ek30Cp6y3mwRPPTWO1cSyjQqDotKhfc6iZbfJ90ApxTsw7NjcPMo8br5n4HYhaffGRsdW2/aEyTSmZ52I4jkLjqPndLyGHLOKnAAlupw/oKtcefux9WsoJzVL1OXfGEvpqOs9nIgD1RI8g4F67MNkhqyOy186TLbIwGoa23xUb+8U/PUpNSJ+Uv5IHWUBpUvt2Bb+2t8fcTAA11399/luey9KKsQFnPFhhai6xwMQA3J5tNTPmXEBIda1zXcJGvyLuMo3UsIadJCSjWhdQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(136003)(396003)(376002)(451199015)(46966006)(40470700004)(36840700001)(36860700001)(70206006)(70586007)(4326008)(2906002)(2616005)(8676002)(186003)(16526019)(83380400001)(41300700001)(36756003)(26005)(82740400003)(966005)(81166007)(40480700001)(478600001)(356005)(53546011)(31696002)(86362001)(6666004)(110136005)(40460700003)(54906003)(316002)(16576012)(44832011)(31686004)(66899015)(82310400005)(336012)(8936002)(426003)(47076005)(5660300002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2022 15:27:40.6687
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0f42da1-08c0-42bf-c4d4-08daa553e3c4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT071.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5247
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 10/3/22 12:50, Krzysztof Kozlowski wrote:
> On 03/10/2022 12:37, Michal Simek wrote:
>>
>>
>> On 10/3/22 10:10, Krzysztof Kozlowski wrote:
>>> On 03/10/2022 09:58, Michal Simek wrote:
>>>>
>>>>
>>>> On 10/3/22 09:23, Krzysztof Kozlowski wrote:
>>>>> On 03/10/2022 09:15, Michal Simek wrote:
>>>>>>>> And this is new IP. Not sure who has chosen similar name but this targets
>>>>>>>> Xilinx Versal SOCs. Origin one was targeting previous families.
>>>>>>>
>>>>>>> Do we need a whole new schema doc?
>>>>>>
>>>>>> It is completely new IP with different logic compare to origin one.
>>>>>>
>>>>>>>
>>>>>>> It is not ideal to define the same property, xlnx,nr-outputs, more than
>>>>>>> once. And it's only a new compatible string.
>>>>>>
>>>>>> I can't see any issue with using dt binding for xlnx,clocking-wizard.yaml
>>>>>>
>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
>>>>>
>>>>> So we already have out of staging document:
>>>>> devicetree/bindings/clock/xlnx,clocking-wizard.yaml
>>>>
>>>> in 6.1 yes.
>>>>
>>>>>
>>>>> and author wants to add one more:
>>>>> devicetree/bindings/clock/xlnx,clk-wizard.yaml
>>>>
>>>> as I said it is completely different IP which requires complete different driver
>>>> but IP designers choose similar name which is out of developer control.
>>>>
>>>>>
>>>>> Shall we expect in two years, a third document like:
>>>>> devicetree/bindings/clock/xlnx,clk-wzrd.yaml
>>>>> ?
>>>>
>>>> Developer definitely doesn't know. If new SoC requires for the same purpose
>>>> different IP with completely different driver is something out of developer
>>>> control. As of today I am not aware about such a requirement and need and
>>>> personally I can just hope that if they need to do such a change they will be
>>>> able to keep current SW driver compatible with new HW IP.
>>>
>>> Then please start naming them reasonable, not two (and in future
>>> x-times) the same names for entirely different blocks. And by name I
>>> mean compatible, filename and device name.
>>>
>>>>>> also for this IP if that's fine with you.
>>>>>> Only xlnx,speed-grade can be defined for previous IP which is easy to mark.
>>>>>
>>>>> That old binding also explained nr-outputs as "Number of outputs".
>>>>> Perfect... :(
>>>>
>>>> Anyway if description should be improved let's just do it. I just want to get
>>>> guidance if we should update current dt binding for similar IP or just create
>>>> new one as this one is trying to do.
>>>
>>> IMHO, new binding is extremely confusing. We already have support for
>>> devices named "xlnx,clocking-wizard" and now you add exactly the same
>>> (clk=clocking) with almost the same properties, named
>>> "xlnx,clk-wizard-1.0". For a different IP?
>>>
>>> How anyone (even Xilinx' customer) can understand which block is for
>>> what if they have exactly the same name and (almost) the same
>>> properties, but as you said - these are entirely different IP?
>>
>> Let me start from last one. Xilinx has IP catalog in design tools called Vivado.
>> You choose device you have and then you will find clk wizard and you get an IP.
> 
> So you have a specific device? Why it is not part of name and compatible?
> 
>> It means depends on SOC you have ZynqMP or Versal and based on that one or
>> another is taken.
> 
> Exactly. The names xlnx,clocking-wizard and xlnx,clk-wizard-1.0 are
> therefore not specific enough and mixing different devices.

And just to be clear these IPs can be combined with systems where the main cpu 
can be Microblaze. I have also seen some vendors mixing RISC-V with Xilinx IPs.

Please look below.
> 
>> And because this is fpga world none is really describing programmable logic by
>> hand because it would take a look a lot of time. That's why I created long time
>> ago device-tree generator (DTG) which gets design data and based on it generate
>> device tree description. Newest version is available for example here.
>> https://github.com/Xilinx/device-tree-xlnx
>> There is also newer version called system device tree generato
>> https://github.com/Xilinx/system-device-tree-xlnx
>>
>> Because of this infrastructure user will all the time get proper compatible
>> string which is aligned with IP catalog.
> 
> I don't think so. Let's skip for now "clk" and "clocking" differences
> and assume both are "clocking". You have then compatibles:
> 
> xlnx,clocking-wizard and xlnx,clocking-wizard-1.0
> 
> and you said these are entirely different blocks.
> 
> There is no way this creates readable DTS.

And I really thank you for this discussion to do it properly and have proper 
compatible string and description for this block.

Shubhrajyoti: please correct me if I am wrong.

All Xilinx SOCs have programmable logic aligned with FPGAs. Zynq is based 28nm,
ZynqMP (Ultrascale MPSOC) is based on 16nm and Versal is based on 7nm.

I think these clocking IPs are using low level primitives available in PL logic.
Which means there is connection to fpga/pl technology instead of SOC family and 
main cpu.
It can be of course said that if this is ZynqMP SOC that IP A is used. The same 
for Versal SOC. But for soft cores this can't be said.

Would it be better to reflect PL technology in compatible string?

xlnx,clocking-wizard-vX.X (used now for ZynqMP and previous families)
xlnx,clocking-wizard-7nm-vX.X (or find better name names which reflect PL logic 
type)

Thanks,
Michal
