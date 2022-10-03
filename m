Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6AA5C433F5
	for <linux-clk@archiver.kernel.org>; Mon,  3 Oct 2022 08:26:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbiJCI0S (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Oct 2022 04:26:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230203AbiJCIZy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Oct 2022 04:25:54 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20618.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::618])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98B9512AF0;
        Mon,  3 Oct 2022 00:59:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ewT1vH3Tkp+IezCgAbN3S07TLzTWiEV+HH02DHYy0f0O69rH1lPSUfG5pDBIUZRCUKY8fBaFjR+FX83wkqCcxFxf/C+w7G0AFA5yod6/6kVciChiKQgERen5Wx5iXv4d+PXKsDHma4H5OJrDXknJRBDYNSZ0BnFC3NPgIz3U3tA6GeKNSF+d4ugZtBEuo1pBH2TxZg5YYsMpmiFz0BT6I40kDb+RrkDB0eBbKT9aUVLj282MdO/YL+hOEXoWoqBKQiOuStAMMBAjxj71bsefrYHnAD1hvGFW5WuMlSdex9vNnGSYGHIh26KKgwgT5O8s46QDhjMQKplc0+QTCnyNNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aSg2EUavR+TIfx1BZ1mteLbkC1EOQjXuUDjCjH3QyWc=;
 b=XNQGmVHsm0gu9kT2FoWcHVWXZ3Y6phTSHVym0OxKqV4AhU2UUHP6S/8pnMd5Xh+CG+NgiM5RN7U6M6QnwKSa9AHwgftWbBoVZ91PXkS/Thx503lRkE8SUfo+VIdekVRr4OcejMb7xKhMbAXHkcufTeY/3LpOMYJ35kNaiTNZ7/sIQH+5JOpWZ1AZ+3DtKwz3Db7GaA2cMoiIognChTXlbBKkWR6m+r2segs1okSFgDTo7J3FLUS1fFiIpXvXa2R5i4MXAJSLqMp+MtuXDxwkFL0KJVdkvQC0IWllepYx+JLgtStl4Vu6WK1BJoVgxmeshM1ctjv7G095IdrdLrNi/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aSg2EUavR+TIfx1BZ1mteLbkC1EOQjXuUDjCjH3QyWc=;
 b=qLNmvD93Nhz0NvHxauZ0ZuO/Xd2FKEhSSogZ91desHN5mK2MejX4vZf66T8nZpEOMaveUJTpcVjmQldKQLP6IG0sSFRxr/hG6hsSpXHoQtuG6xdN3i4LA+a+UfcRZ9T9QSEqWcDysIqbXxqkV3CTiNC2Gb1YbwtA+uwHbArh2H8=
Received: from BN9PR03CA0767.namprd03.prod.outlook.com (2603:10b6:408:13a::22)
 by CY8PR12MB7756.namprd12.prod.outlook.com (2603:10b6:930:85::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.15; Mon, 3 Oct
 2022 07:58:39 +0000
Received: from BN8NAM11FT007.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13a:cafe::24) by BN9PR03CA0767.outlook.office365.com
 (2603:10b6:408:13a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.26 via Frontend
 Transport; Mon, 3 Oct 2022 07:58:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT007.mail.protection.outlook.com (10.13.177.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5676.17 via Frontend Transport; Mon, 3 Oct 2022 07:58:38 +0000
Received: from [10.254.241.52] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 3 Oct
 2022 02:58:34 -0500
Message-ID: <57989d3e-a186-1d67-cff9-6a059f94ebd3@amd.com>
Date:   Mon, 3 Oct 2022 09:58:09 +0200
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
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <b495804c-cf04-4512-ac05-424eded46468@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT007:EE_|CY8PR12MB7756:EE_
X-MS-Office365-Filtering-Correlation-Id: fe72d258-251a-4b5a-dca9-08daa51514d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E4jIXR7xksXfbPeu7xaDFM+FlwtbmGv2aWo7/zHWHxkXo63p7LqUV/yxVJWYdP+y7y3J2TfFKbJj3aT4xgplk1nZU9UQmcXlCeIY340aWZIDeINw/6kIsNoRXsm9Eyf7Id3sjkdDdpPFo+gX8ZEN24HscJPVDgAj0pKpDV3sXqYzuezqXwiInQQHKyrYg2mdTgiwsYCe+U/4dEnfaDqrHP+ptJNc9odhafHrMioFKErLs2wYmopexDP66eI8o7j8AofX4m5A/4guaJEvSG/xxDTyLWWBZA7VtJXGJcy6wZzDg3bFuF16PhF31UrsxX4u+lB6zq8Frr2lPeCeyEO3w/9luIjKvDW5Yh/ZL3JuIJfq+ccx4ilEJGHsGyA6XPC6tkB3lfh9pQQKbySwJxD93FGwQH8MMAczGcRlvYQUjTbxQ5ypWsmOgXKjsk6RZp67TjjTh6SRj+1DKHL9ziQ4qKs8mSGwo8zytcw/bXoRSNrPuVRVrb8XJ3AjlqHhK+b6puIeb+TFAe3AxW7yWCcvUwkklt6RETZkz58+2rt1WqkJ+3bJThUaYvWOW7w0RAGO99ZgwTqo335PbzcUHl261Fqh/sd4nBgJQo1r55TEoN43ZjB/8/85mdwMLMrX9+WoC4GTHR1hApqSt1bDPXp+VBKXBGlGg1j0u3NkdOusU2qMsJ6BCqFUfRE91uDOWDG7thYUNp6JJk849hff8XtDQmOs6V1j03sjLzWzwlqbAod1/I5i6ZmoHhH/raSNGyIGkUFwrIatBxD29I4XKcG2R+8FX4O121rOwZvLGSsSWXFKas33ZO0JKa5y9xw2EdYrItRZ6Bu9NrbhCXbWf7UWdaAoXStJQK2U3ZoZ2j/uyO4=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(396003)(376002)(136003)(451199015)(46966006)(36840700001)(40470700004)(31686004)(186003)(16526019)(66899015)(47076005)(83380400001)(426003)(40480700001)(336012)(36756003)(41300700001)(70586007)(70206006)(6666004)(86362001)(966005)(5660300002)(316002)(16576012)(44832011)(356005)(8936002)(31696002)(2616005)(53546011)(36860700001)(40460700003)(81166007)(26005)(4326008)(82740400003)(8676002)(54906003)(478600001)(110136005)(2906002)(82310400005)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2022 07:58:38.7693
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe72d258-251a-4b5a-dca9-08daa51514d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT007.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7756
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 10/3/22 09:23, Krzysztof Kozlowski wrote:
> On 03/10/2022 09:15, Michal Simek wrote:
>>>> And this is new IP. Not sure who has chosen similar name but this targets
>>>> Xilinx Versal SOCs. Origin one was targeting previous families.
>>>
>>> Do we need a whole new schema doc?
>>
>> It is completely new IP with different logic compare to origin one.
>>
>>>
>>> It is not ideal to define the same property, xlnx,nr-outputs, more than
>>> once. And it's only a new compatible string.
>>
>> I can't see any issue with using dt binding for xlnx,clocking-wizard.yaml
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> 
> So we already have out of staging document:
> devicetree/bindings/clock/xlnx,clocking-wizard.yaml

in 6.1 yes.

> 
> and author wants to add one more:
> devicetree/bindings/clock/xlnx,clk-wizard.yaml

as I said it is completely different IP which requires complete different driver 
but IP designers choose similar name which is out of developer control.

> 
> Shall we expect in two years, a third document like:
> devicetree/bindings/clock/xlnx,clk-wzrd.yaml
> ?

Developer definitely doesn't know. If new SoC requires for the same purpose 
different IP with completely different driver is something out of developer 
control. As of today I am not aware about such a requirement and need and 
personally I can just hope that if they need to do such a change they will be 
able to keep current SW driver compatible with new HW IP.

>>
>> also for this IP if that's fine with you.
>> Only xlnx,speed-grade can be defined for previous IP which is easy to mark.
> 
> That old binding also explained nr-outputs as "Number of outputs".
> Perfect... :(

Anyway if description should be improved let's just do it. I just want to get 
guidance if we should update current dt binding for similar IP or just create 
new one as this one is trying to do.

Thanks,
Michal

