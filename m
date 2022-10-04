Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 972F7C433FE
	for <linux-clk@archiver.kernel.org>; Tue,  4 Oct 2022 11:05:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229885AbiJDLFd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Oct 2022 07:05:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbiJDLFP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Oct 2022 07:05:15 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE53A15FC2;
        Tue,  4 Oct 2022 04:05:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T1NiQk7+6virCanqcIInnVUO1AMaNEiUheATaauR6hbnMr5dOSVgy9fd6zOHZZQYNgRRC4n2pxzd2aAPSSlTG/J7NozFFu2H/Tq/xCsIyVTs6I2AHmiGYM0+PXchIAMr8O+xrgrs7FYQS23N3dM1mqKnZRx2O3e8DCEFV3FMZKY2v9XfMlGRKx59aer3c2vknV609xUbgsrOh9zFDLqiU8nC2Pcbc80nw2xtDU8UcwDddlyENYxyfPgy8FCtckMVvJsnF9X7z3r+sXdkOdqevDoFZIIxkTbXX4HqCF+TfsOsKKoiHVjw2W/X92e+HrgnQjGhjNvwbG4k+kmKAZShDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ce2elyVrNaygebWwjV0uG+g2jU0X/bjtu9qLGmIXhNk=;
 b=AasyjWKpfhkq6y7dpq+ggYkgRmijAeACQPiahJuqx21tgg/VtzD7fjNfbE8jchTnTXugl89LVS0HuFzJXUA9C+N3y8eQ1oLUUJn2OPzMP7l1L/lxe4g4yhc6gU/sLwxF9MJfVgvCrQSxU9oumtVqv+knV0HCBFfGJNvtBw68PLQNUCBnFI8nExCThKA4oy4KdNkWhgGwHS8tqlYfxHdJI6R21Zv7ak+01Fkpog7q5XZIC9nCK9w9qKjaFTrCbLWrzEDsmV7SMl1Z6rqwU4FdcR9s55PeX4Moh2iZtKR2kcf9i0MQSbtKo9Eihahtd7M8glyVYFirtH8lBBeBQPFgMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ce2elyVrNaygebWwjV0uG+g2jU0X/bjtu9qLGmIXhNk=;
 b=YfbAxGSfkT5q4Abp+eDFBYSM1IUxPMjvDx8ZJhRmzOXdwMVhpYYODSgHZWL9akwXz3qw5qm2rXiVQ9l6DdWVsn+pnVfZBdh/VvkjQxWhqAxEaa3yZxiY63sorcIaIjO6Wz28sYYCtlWTKoGfnOhwU5a9+oE8yJDyZdIWkDA8jeE=
Received: from BN1PR14CA0008.namprd14.prod.outlook.com (2603:10b6:408:e3::13)
 by PH7PR12MB5781.namprd12.prod.outlook.com (2603:10b6:510:1d0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Tue, 4 Oct
 2022 11:05:00 +0000
Received: from BN8NAM11FT116.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e3:cafe::bc) by BN1PR14CA0008.outlook.office365.com
 (2603:10b6:408:e3::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23 via Frontend
 Transport; Tue, 4 Oct 2022 11:05:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT116.mail.protection.outlook.com (10.13.176.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5676.17 via Frontend Transport; Tue, 4 Oct 2022 11:05:00 +0000
Received: from [10.254.241.52] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 4 Oct
 2022 06:04:56 -0500
Message-ID: <e0615e11-3b89-9717-7e07-657cac1d429e@amd.com>
Date:   Tue, 4 Oct 2022 13:04:54 +0200
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
 <54652831-cdcc-7735-2b1b-66475ffce476@amd.com>
 <fcafff07-b526-bd3d-469f-0aebbb13c86c@linaro.org>
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <fcafff07-b526-bd3d-469f-0aebbb13c86c@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT116:EE_|PH7PR12MB5781:EE_
X-MS-Office365-Filtering-Correlation-Id: f5f594f4-c846-49a1-7a8b-08daa5f84809
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KLvNs3YUzxvMTlmPozwnna9Kw8el7ZiTETVxkW9VAiQ1UKdI9IJghjXvYvAmtb6BYLU7u9a/xqt1abLg/42yHj9WeJRo0cRv3F0R3vNV7acjlwVVspJ3Owf9vskgt3h6Dx3A+MRkmGTK/cgm9vsSRYpJkbyW7GykQxEKVA40YwEcAiKm90d99KDfEvszihgkkyj2JCqs8IEo05yWjnxB8UgvhQG3fuoS7IaLA4EKkiOv98nW8fIzb9u8D/0+yN7ETQI3z8EEO0WszeW75H86RvW77AqG5JFH2b9YZniFzj53br/bEHAK9UCqSXBe8yR9DLwUfK1ZRJ276IFSIoIhT3w3qvRZRwlOSTU1xzKrDcuu4NgO5ugu4Z0oPDwAL4TJIatEPPuA1hteH1n4Rv9XBlNIGEOMUoh0LqWXJFsJWA2c8uXDKfwMN9HPf8uPoTFhMDAAaEL+TJwQn0d4rz2Bh80Q/t8zD5AK/wA7lDIcxFlBXNbHSiViCw3aG9A/8RVfTdre58IABgsb9v3rFSStEF2VR3Stqm3iMVmvJdlj6fqGEAsXUorh+Gkwv1sKTYAPWMEou3S7bBc4UrrtHOh20kmDmmdW+DUNWeLw+tor1NadRF2M6ScJCy9FzqBU4GlhbwOZqsQtRSGJ27MAQifyZmRdBfDCeMHXic5JXO5l7hk7vw7WLxhbneZaeLuBumHVr4eM393pq5jNLAcxCWCLvMkKlPXh9kZIlURFocO2OaR1yoFqScXsQ6E/p+/jGPOPwhYRWk8rVoxqnzWk9y0GDBCTV5Tqh8OUVeUcA/dTZPQmce5iQEeO+WsJaOoStQRMPkR2pf3+OUWl6P0UsDsJn5Xbpy/FEDf7VXrPbQImFjHBCPEY2RKr0hu5aYWmfN4osTgJ7uDPnfWVzuwV/vZDyA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(136003)(346002)(376002)(451199015)(46966006)(36840700001)(40470700004)(966005)(31696002)(40480700001)(36860700001)(36756003)(356005)(81166007)(86362001)(82740400003)(40460700003)(478600001)(70586007)(70206006)(82310400005)(54906003)(4326008)(16526019)(110136005)(336012)(316002)(2906002)(41300700001)(8936002)(44832011)(426003)(5660300002)(2616005)(83380400001)(47076005)(186003)(8676002)(26005)(16576012)(31686004)(53546011)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 11:05:00.4774
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5f594f4-c846-49a1-7a8b-08daa5f84809
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT116.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5781
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 10/4/22 13:00, Krzysztof Kozlowski wrote:
> On 03/10/2022 17:27, Michal Simek wrote:
>>>
>>> Exactly. The names xlnx,clocking-wizard and xlnx,clk-wizard-1.0 are
>>> therefore not specific enough and mixing different devices.
>>
>> And just to be clear these IPs can be combined with systems where the main cpu
>> can be Microblaze. I have also seen some vendors mixing RISC-V with Xilinx IPs.
>>
>> Please look below.
>>>
>>>> And because this is fpga world none is really describing programmable logic by
>>>> hand because it would take a look a lot of time. That's why I created long time
>>>> ago device-tree generator (DTG) which gets design data and based on it generate
>>>> device tree description. Newest version is available for example here.
>>>> https://github.com/Xilinx/device-tree-xlnx
>>>> There is also newer version called system device tree generato
>>>> https://github.com/Xilinx/system-device-tree-xlnx
>>>>
>>>> Because of this infrastructure user will all the time get proper compatible
>>>> string which is aligned with IP catalog.
>>>
>>> I don't think so. Let's skip for now "clk" and "clocking" differences
>>> and assume both are "clocking". You have then compatibles:
>>>
>>> xlnx,clocking-wizard and xlnx,clocking-wizard-1.0
>>>
>>> and you said these are entirely different blocks.
>>>
>>> There is no way this creates readable DTS.
>>
>> And I really thank you for this discussion to do it properly and have proper
>> compatible string and description for this block.
>>
>> Shubhrajyoti: please correct me if I am wrong.
>>
>> All Xilinx SOCs have programmable logic aligned with FPGAs. Zynq is based 28nm,
>> ZynqMP (Ultrascale MPSOC) is based on 16nm and Versal is based on 7nm.
>>
>> I think these clocking IPs are using low level primitives available in PL logic.
>> Which means there is connection to fpga/pl technology instead of SOC family and
>> main cpu.
> 
> Then maybe the compatibles (and device names) should have that fpga/pl
> technology used to differentiate between them?

I am already trying to find out better generic description without mentioning 
sizes.


>> It can be of course said that if this is ZynqMP SOC that IP A is used. The same
>> for Versal SOC. But for soft cores this can't be said.
>>
>> Would it be better to reflect PL technology in compatible string?
> 
> Yes, although we might misunderstand what PL technology is. 28/16/7 nm
> is the size of transistor or the process. Even two different processes
> can use same type of technology, e.g. FinFET:
> https://en.wikipedia.org/wiki/14_nm_process
> https://en.wikipedia.org/wiki/10_nm_process
> 
> You could have very similar (or even the same) designs done in 28 nm and
> 16 nm. Does it mean these are entirely different devices? Not
> necessarily... Maybe they are, maybe not, but is the size of process
> differentiating? I actually don't know what's there in 28/16/7, I am
> just saying that number alone might not mean different technology.
> Programming API could be the same, inputs/outputs could be the same.
> Just the size of transistor is different...

I agree. Will try to come up with better name without nm inside to uniquely 
identify PL logic type.

Thanks,
Michal

