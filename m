Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 104C0C433F5
	for <linux-clk@archiver.kernel.org>; Mon,  3 Oct 2022 10:38:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbiJCKiN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Oct 2022 06:38:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbiJCKiM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Oct 2022 06:38:12 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2046.outbound.protection.outlook.com [40.107.244.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 256AE34993;
        Mon,  3 Oct 2022 03:38:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GDTdNq2xvOzEWVXuv5J+euLG66XD+T6s14tDrHiM1oDdM/J20CGlpkuvL03GwVC+FQKs30jR06VlwIHAi8mw+lWqPxO3JpbhK79EQH6YY1htLyJsp6611UelYnpGfIeHFCSocZx/MnSt2lfu8uE3a1ouOVjvXikdTODUmNBwY6mygH2KiMcUEfpopLcV4ap/MWrCggGiD2jeOPuNE0Do3tR1bvdajn8OTF0ZbqEqHQdLhZm7SDY0hvqBRNRSCtrGuJ3WxNyb0ZklqQzIB0O0Vf2y3ndO83ldZzs9n46lojnCMvPTI/WFY3ZNQqQtalhkfUfTLoI7O7OwifzpVF1Pdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zfjt8Py+qu/2V09OzhXcoj+XN2J6Obf+QlzlgtfZzWo=;
 b=JLwDnaE3tvMwekra3vrADZoxLH2O/as0LlKUm+90aAUrDM9CvwTjvJYljDqZvbzuvbqE1L4q6DK1WDi3+8kV0dcuI8fqJZL+A6Fzwh6pXVrRz7JKav236csIgKEczGeizMK2ed9GhSuzKlqhNhn1wjQaFUE6RIkEL2KWuKejDiXxsCD0UgUucjRbXBA3Qv0lZ2epsWor0iAg+JndrR5sqjhSAAgDCqRo4MUiCAY1mWlxRhp7o7YTS/kVYWlkDyd3af/A3UDgiV+27fjb3oWBsMSqPGNIBieT9628KI4J4PGzknmUVOtUBfDb5zaNHHeROg0xNFJ4A+hbxVUGd9zqsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zfjt8Py+qu/2V09OzhXcoj+XN2J6Obf+QlzlgtfZzWo=;
 b=3veQTUgIE4plvvO/txcyXNH8G9pT/fq7vHAXQlHNeKa8P3X3yXXH7YIU/emm2o8nUWUElmL31wc0R42nXGl25La1i9VIBw3ujR4DcE8nYwcQzUKicPyMOFye7MtDbTZ/t+Trq3AkQ1XgMbyscFTrhFxEHJgYOxvfs/If2VrHaTM=
Received: from DM6PR06CA0040.namprd06.prod.outlook.com (2603:10b6:5:54::17) by
 PH7PR12MB5781.namprd12.prod.outlook.com (2603:10b6:510:1d0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Mon, 3 Oct
 2022 10:38:07 +0000
Received: from CY4PEPF0000B8E9.namprd05.prod.outlook.com
 (2603:10b6:5:54:cafe::ba) by DM6PR06CA0040.outlook.office365.com
 (2603:10b6:5:54::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24 via Frontend
 Transport; Mon, 3 Oct 2022 10:38:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000B8E9.mail.protection.outlook.com (10.167.241.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5676.13 via Frontend Transport; Mon, 3 Oct 2022 10:38:06 +0000
Received: from [10.254.241.52] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 3 Oct
 2022 05:37:30 -0500
Message-ID: <e8507b3c-3dd5-9a65-8058-200b5a410da3@amd.com>
Date:   Mon, 3 Oct 2022 12:37:28 +0200
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
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <f611237f-0401-9e3c-3a21-79b33141bb51@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000B8E9:EE_|PH7PR12MB5781:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ad9576b-b27c-4110-5903-08daa52b5be7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WKjUCpu2lQ1NqSDRy7Se6azHhQYGHw4PjXOdTLhGrF52NpnUhGaBOhYEmIu7F+wz0H6JJCcxMqPOYUsS7eJQHUdcMCCC13nHzEaEKsK3kjkef0OxZMvZBdjM0JzOHMjBvmnyvY6voga/vsYwy8kLWMVXTebFWGwYRardmhdLjz8Qlbsz+umPqOLx8nwNWeBEt2pB8XPydIj1u3WFxiofvk1lvquo3p1AZ93EFgzCps9iX1Ec/Z4MKw8aG3PLkK4HRQy+IK+m4GkE+7mvieAkijcyzmLUFhEym9+N5JnCFwmaK8R1UMHHGrUklp7aGSa+IlschkaaHhTduJ6dQKSe1rYBAH7cOnVbDoOf5QCiDeAIhUa2NbWEGFB21/M64qJVe2vH17OJKZUiHoCLswfLrmhQrYMjBqL0n7if53Rw/p3VUehT4REku8M2b9DmBn7ABS9sMsA9v1Yoi6FNJ0++XGfb7rrsW9WDYs21PdPFn3lMnFM87ynMN19mAKA02W4vL58zb189pyVwVhWFDxnpHx04Kgtke7pBfuEjzo89ItT3Z0PmA7AqCzUMtJxmoK+1w4I2LKdacFlQb/IFZCNL46Y7s9q314zr1KjfSJ4T6UF/t0b3yhjswhUi9/fZ7sUjwQyh8Vv6LAr2MHrM3lwE5JFeVy5RX1PGjUSnC38YSG+AS15obLq3LwfMlb0JErVQc+zpQNXbKQhupdQJzRULeBRLKP+dAE8yiT4RWNDdQ3AmoyuYXziqzIwYpPa/XwRQmulLR9AjD4O1f0bMeGsesyZGcX/FwoAFri3J38mcAAwp3cApZmq3L9r8IitaBMDkdcUFOakyNyg6Mlcf6+GLlnrvX7F8PpOKtjIvSx33lRcIxwM5RdBd6eLGDGqHyQQLGcuHuJmWSSxj5R6P/pwWYg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(39860400002)(396003)(376002)(451199015)(40470700004)(36840700001)(46966006)(66899015)(31686004)(53546011)(70586007)(478600001)(70206006)(82740400003)(40460700003)(54906003)(82310400005)(4326008)(40480700001)(36860700001)(966005)(31696002)(86362001)(81166007)(356005)(36756003)(2616005)(47076005)(8676002)(26005)(83380400001)(186003)(16576012)(336012)(16526019)(316002)(110136005)(5660300002)(426003)(2906002)(44832011)(41300700001)(8936002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2022 10:38:06.9161
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ad9576b-b27c-4110-5903-08daa52b5be7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000B8E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5781
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 10/3/22 10:10, Krzysztof Kozlowski wrote:
> On 03/10/2022 09:58, Michal Simek wrote:
>>
>>
>> On 10/3/22 09:23, Krzysztof Kozlowski wrote:
>>> On 03/10/2022 09:15, Michal Simek wrote:
>>>>>> And this is new IP. Not sure who has chosen similar name but this targets
>>>>>> Xilinx Versal SOCs. Origin one was targeting previous families.
>>>>>
>>>>> Do we need a whole new schema doc?
>>>>
>>>> It is completely new IP with different logic compare to origin one.
>>>>
>>>>>
>>>>> It is not ideal to define the same property, xlnx,nr-outputs, more than
>>>>> once. And it's only a new compatible string.
>>>>
>>>> I can't see any issue with using dt binding for xlnx,clocking-wizard.yaml
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
>>>
>>> So we already have out of staging document:
>>> devicetree/bindings/clock/xlnx,clocking-wizard.yaml
>>
>> in 6.1 yes.
>>
>>>
>>> and author wants to add one more:
>>> devicetree/bindings/clock/xlnx,clk-wizard.yaml
>>
>> as I said it is completely different IP which requires complete different driver
>> but IP designers choose similar name which is out of developer control.
>>
>>>
>>> Shall we expect in two years, a third document like:
>>> devicetree/bindings/clock/xlnx,clk-wzrd.yaml
>>> ?
>>
>> Developer definitely doesn't know. If new SoC requires for the same purpose
>> different IP with completely different driver is something out of developer
>> control. As of today I am not aware about such a requirement and need and
>> personally I can just hope that if they need to do such a change they will be
>> able to keep current SW driver compatible with new HW IP.
> 
> Then please start naming them reasonable, not two (and in future
> x-times) the same names for entirely different blocks. And by name I
> mean compatible, filename and device name.
> 
>>>> also for this IP if that's fine with you.
>>>> Only xlnx,speed-grade can be defined for previous IP which is easy to mark.
>>>
>>> That old binding also explained nr-outputs as "Number of outputs".
>>> Perfect... :(
>>
>> Anyway if description should be improved let's just do it. I just want to get
>> guidance if we should update current dt binding for similar IP or just create
>> new one as this one is trying to do.
> 
> IMHO, new binding is extremely confusing. We already have support for
> devices named "xlnx,clocking-wizard" and now you add exactly the same
> (clk=clocking) with almost the same properties, named
> "xlnx,clk-wizard-1.0". For a different IP?
> 
> How anyone (even Xilinx' customer) can understand which block is for
> what if they have exactly the same name and (almost) the same
> properties, but as you said - these are entirely different IP?

Let me start from last one. Xilinx has IP catalog in design tools called Vivado. 
You choose device you have and then you will find clk wizard and you get an IP.
It means depends on SOC you have ZynqMP or Versal and based on that one or 
another is taken.
And because this is fpga world none is really describing programmable logic by 
hand because it would take a look a lot of time. That's why I created long time 
ago device-tree generator (DTG) which gets design data and based on it generate 
device tree description. Newest version is available for example here.
https://github.com/Xilinx/device-tree-xlnx
There is also newer version called system device tree generato
https://github.com/Xilinx/system-device-tree-xlnx

Because of this infrastructure user will all the time get proper compatible 
string which is aligned with IP catalog.

If you think that we should use the name which is more closer to ZynqMP clocking 
wizard driver we can try to take a look at it.
We can also update description in dt binding to explain this better.

I understand that it is confusing but we just got this name from IP catalog 
which is created by HW guys and we won't be able to change it. We can't also 
enforce that they will rename existing IP.
But we can use different compatible string and wire it up in DTG that we will 
start to generate.
We tend to use IP name and also IP version for compatible string generation 
because HW guys are IP owner and when any change happen they should bump IP 
version.

Thanks,
Michal

