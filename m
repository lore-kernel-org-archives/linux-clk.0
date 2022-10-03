Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 490C3C433FE
	for <linux-clk@archiver.kernel.org>; Mon,  3 Oct 2022 10:41:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbiJCKls (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Oct 2022 06:41:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbiJCKlr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Oct 2022 06:41:47 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2079.outbound.protection.outlook.com [40.107.223.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F09E4BD38;
        Mon,  3 Oct 2022 03:41:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YYO77D8WtzO7SlhvZu7zfwJwSYHWKZTwAHQooJJyxiNHPJutayfjGvFjOPwFA4gE4VZma/R2aH5PM4fZkw61SIAECS1SROpQc4DqbqA8q/aVlMJTBfRHBDdAMuWgmOsHzU7qJHf0bXMVbJC/ErzUXZXux9pm5D2/QciIz+s/2ruo+jub7IuIYjmE4xkscDwd709BVo/3hY7vks5WXksrOfyvSnwnRTpfQ/IRQ14ybkYn9+cdWetSDBdaiTdmW/MjMGe/LpPFbHSnZBxoPkNeaHKkyrTgPBIF8eCvD83MU82bcpXdbyM8hzQf502qCO5ahfuj3Ewld9ARt+DeciP+gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zdm5cpXzEKUS8jeC7i5bsElJ16CKx0ps73mIuYYl4RA=;
 b=HOCnB0yUa7pSiRrVk21iWT9sYYGQPKU50tVhL0z4rNAyuEMQn7+Vy6eFe3eXG2ohqxLEIejepsj3V3CoYXxuyIF7zhXkrIkknRU2tqtuAWvpGedK1wQqxWXiAG1SSkHxWkth4E2crsERG0WocEn2it/599FEgG+I1IBEI+iUJNq49ArcyKPwjITlw3XQ+0JZkyMKWNfFnGXjeEiXzcnshhom6AYzo7mHEm30FbJDJzjYDKa3C6EJGhWB2+ySGpNe1epc3va64y3atYF3wlkqI8AAZ/rDXsegC2Uj1LJ97Kzf0IcGAnFzuA6bmCYHdVxPqUAlJ++KS3AkLWcu1gEOCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zdm5cpXzEKUS8jeC7i5bsElJ16CKx0ps73mIuYYl4RA=;
 b=gvVv+tF58qmkgzCf2L85A8fYkgoGsR49vHr9pjyO3130j8ea9v6rkYDg8dG/vDivAPabACnnBu3HUqDFSv58zBJlN5C3M0Pi5EeFx9QNrL2WJuojnySfoROCrfxRAQbKBlZxh9h/I0mLI4DAoXWB1EtXHONy5FZbng7nhppowjI=
Received: from BN9PR03CA0766.namprd03.prod.outlook.com (2603:10b6:408:13a::21)
 by MN0PR12MB6001.namprd12.prod.outlook.com (2603:10b6:208:37d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Mon, 3 Oct
 2022 10:41:41 +0000
Received: from BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13a:cafe::57) by BN9PR03CA0766.outlook.office365.com
 (2603:10b6:408:13a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28 via Frontend
 Transport; Mon, 3 Oct 2022 10:41:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT013.mail.protection.outlook.com (10.13.176.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5676.17 via Frontend Transport; Mon, 3 Oct 2022 10:41:41 +0000
Received: from [10.254.241.52] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 3 Oct
 2022 05:41:37 -0500
Message-ID: <053c0831-6bce-ff0c-a511-6f292127ca63@amd.com>
Date:   Mon, 3 Oct 2022 12:41:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH 1/2] dt-bindings: clk: Add binding for versal clocking
 wizard
Content-Language: en-US
From:   Michal Simek <michal.simek@amd.com>
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
 <YzqaXthSLBbwU+5V@kroah.com> <a8576f0e-b5ab-33d1-40d4-5f25c66616c7@amd.com>
In-Reply-To: <a8576f0e-b5ab-33d1-40d4-5f25c66616c7@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT013:EE_|MN0PR12MB6001:EE_
X-MS-Office365-Filtering-Correlation-Id: 97695606-ac31-43e0-a835-08daa52bdb8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: siO2yXFb5X40iDOwyGbFiwttDvedspgko2yhhZ/kAcqWx+FfcadtSSb3A4+veUtl01jcVRXZu+1jp9C8OQEDD77nm29fvrMmx6zGtdttMrFIRx1Vu3zodVGC9T48ICr0risfZjSTzDAG1f6fFY28zXAvenK9jjC/73C0U68bBJXmgSA5titNLxCtVdyN9paOc2cq549y6/VkhTrkpY/JKdMigkPRoiq39h5YDvKtTz3ut0KoENU/0ovPMF4T9wfY61aGH//nemsF/v/O0SJz7pGF9vIOiiNiZ/MKU/NsSy0oiCf4XH0Mfv0Hkqklp//p6vcA5YFikfJ09mFx22RiY3dTjNNKpw3ttveu6hHfE1ZJoJd4CyoVbsLP0MOHSF13ow3H+4uMk17ecLsspH5iuS4mzZ6Gbq1R/vCIyCW07cZ2DbzsbH2cm80z/tMw7yIVCeNcIm4rhYfLZv4NFcarUPacJLgtMoHkT9zP4tVLbSFhLg5pKeRawLjogOCnrBNMiUAZQ8kZ4hDn5//WhyJj016WcpjV0iLQSOuUc8TU9TQ6do7TKLzcnbyImXxvYW3iBsKWaRkS6iim1xcVTvZukMGow3+MyOcR8veVU/+PWOKtAESI6i4xx0joIJJjkc16MeKP807ItdzYW4AWbTUmfLzSwTCR8TLDS7Gk+KLKGGf6gRSt4AwX9IwB1Yhdv5lR9VmsoLtxdEKI+mAFnMFRVSRrz6DVbsRUF9As7gv9kVmjA8wVtZBGN5NW4cuzvCnALBWnuYikiWH59TP+i8edshYnndbsCzgLFxXGwuKupm9fWhbrt60RAE60jfuxTBceGYqQflQQNVBvqADSCvuG+fwGvBpJuyMq48sM0qSp4kUxPHFJwFgBICehKzpJqmBNXDFtyY8Snr1hltIDhmweSg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(39860400002)(376002)(451199015)(36840700001)(46966006)(40470700004)(81166007)(66899015)(356005)(31686004)(36860700001)(83380400001)(478600001)(426003)(966005)(2616005)(16526019)(47076005)(336012)(186003)(31696002)(26005)(82740400003)(53546011)(6666004)(86362001)(16576012)(110136005)(54906003)(41300700001)(5660300002)(36756003)(82310400005)(8676002)(70586007)(70206006)(4326008)(8936002)(2906002)(44832011)(316002)(40480700001)(40460700003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2022 10:41:41.1039
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97695606-ac31-43e0-a835-08daa52bdb8a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6001
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi again,

On 10/3/22 11:59, Michal Simek wrote:
> Hi Greg,
> 
> On 10/3/22 10:16, Greg Kroah-Hartman wrote:
>> On Mon, Oct 03, 2022 at 10:10:38AM +0200, Krzysztof Kozlowski wrote:
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
>>>>>>
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
>>>> as I said it is completely different IP which requires complete different 
>>>> driver
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
>> Maybe we should just delete the staging one (and the staging driver),
>> and start over?  No one has taken the time to get the staging driver out
>> of there, so I have no objection to dropping it for 6.1.
> 
> As I said it is be out of staging in linux-next. When CLK tree is merged in 
> these 2 weeks we are done at least with this driver.

FYI: Here is link where I asked you for your ACK to get the driver out of staging.
https://lore.kernel.org/all/Ys%2F%2FaPLkLGaooYYw@kroah.com/

Thanks,
Michal
