Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1B7EC7EE29
	for <linux-clk@archiver.kernel.org>; Thu,  8 Jun 2023 09:58:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232606AbjFHJ6l (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Jun 2023 05:58:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231439AbjFHJ6l (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Jun 2023 05:58:41 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2060c.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaa::60c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9010526B9;
        Thu,  8 Jun 2023 02:58:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IMBzYMKMkp/iXEWBqvDCMnlUAHAEq/A9hQ+IaY8ANIuzLZHEvFs0u7lhTnWXQMbH+4Eox3i8W2BiOKSJznZOLwQyxAiGMkz9BIecnw44xuqqZMGjfa3lpDmW+LcYQ8Q7hLacpWKBgVXqIbGCY7hfSDh74iz82oNl+ndNbvJKpBOg5CbydJz1Dp99XVOVf5l7Kb4iMEPE8niJcWRFbnQHpaVs/pY1srnDpmP75jGJwTxo99VHTO7zonqRhbeBwLxZbC7eykqa0t1z47LIML7zdqKajDRlXe/goc0RYMITqXcJrXj0HATa0Q8umz9zXlzfTgBf20mrc6QMxdWH5HvEBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZnkWejEqCIVkFavTQNfegkPO1AE7S/V3bF+itNbf+AU=;
 b=K7NKQ5FJ1/fpC+qhlYfuiDP0JymYJct6oPy/aONfLhlAJB8NsUONauF3B//Gqk+wcXGWIgEadcoXiMV0Aouw9Xnm4+l0e9VECxEZnVh/xL8ALlbUs4jT7VX1b+I+jk7eoEJHQ5UhFQqrIHKVemPgNjrNGjw1jmM2oQqwMom49u6YNT5S9x+s65FyCJByomJ5yICe4O+KsU6A9CiI7Px5GtSoXM+dOI6MZlvaxBvmfx8UjNyJxBdYlia8RiG+Ey4KZIKz6oGcxz0v+FlGgejohNnkklJMDsx0mUG9hsDbmMP7h4ISeYNfzUo4u9QuMY1u6BHo5DK2hyt9e0qdXmE8Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZnkWejEqCIVkFavTQNfegkPO1AE7S/V3bF+itNbf+AU=;
 b=ag/k3ni52YHHW3h02m7DLAWiRGzzhoTZPQWiB8N9vQIXoqPkLYRKtAkzUwZiHyKPu+rb4zedDOqLpThxhlXM/jMWVfySWlzXzKHu4vc5l3pTxavzxgP+vx33AyUwIl2svxKOinzWKbqulL/R/PkXVqsQHxruo/Ke8lGkyQRcfNs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4758.namprd12.prod.outlook.com (2603:10b6:a03:a5::28)
 by DS7PR12MB5766.namprd12.prod.outlook.com (2603:10b6:8:75::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19; Thu, 8 Jun
 2023 09:58:36 +0000
Received: from BYAPR12MB4758.namprd12.prod.outlook.com
 ([fe80::6ad5:3607:d622:669]) by BYAPR12MB4758.namprd12.prod.outlook.com
 ([fe80::6ad5:3607:d622:669%3]) with mapi id 15.20.6477.016; Thu, 8 Jun 2023
 09:58:36 +0000
Message-ID: <8e486ee0-12ae-f24c-014f-c43f1f4dfed0@amd.com>
Date:   Thu, 8 Jun 2023 11:58:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3] dt-bindings: clock: versal: Add versal-net compatible
 string
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        linux-clk@vger.kernel.org
Cc:     git@amd.com, devicetree@vger.kernel.org, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, mturquette@baylibre.com
References: <20230608092526.6462-1-shubhrajyoti.datta@amd.com>
 <5242c754-0546-fbd9-141a-b4632c24ee50@linaro.org>
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <5242c754-0546-fbd9-141a-b4632c24ee50@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0154.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::9) To BYAPR12MB4758.namprd12.prod.outlook.com
 (2603:10b6:a03:a5::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4758:EE_|DS7PR12MB5766:EE_
X-MS-Office365-Filtering-Correlation-Id: 67d90a23-5de6-4719-632b-08db6806ed2d
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vkzjGUC96Zb1W9HMXFtqe80vOH2oQysyKjMOd/p2LCcUo/jNCaaUSXwLahwzB2JtNYGd3UoxbZ4f/rNt7G53dXQIB406StE2DjxRugOLwYnSxZ6Eb6p8ppghCBJx4gkAUNpHqmkDjVcXri3tz7pHsEGYqFg6lat3J2IbSeeEuMejVhhvBtq4gqnCB7xMssbfkpPqjn89wDLEAXfTn/3plE7kh7SAKNJj0L/zDTuNk7lVOjmJsMgXp5BwhnlLJEWUGxMSrnfMUW8zS6/pDVMA1Z1dNcggeTyi6p+grkwRQzE4Rxf1PIwr1sj89CVkwktT5V/q7R2FX4oukAOCckg9PgIIyOlPjSFS8XjnvuxmUClRdhWDpwu4Gn7YmjWwBrqMjjoaX0vsGft5aYNCYs+smpcK8kLDJ73Ssk3c6Ns26mHi5Ng3YyN4rLdzaazykjgSpibxruPhPeefj0C1Wq2YSdmpSWMWGlA+W6u6lzbfl1ThUMYPDnUhH/WSALuqYt8r0kptkyk0U2JewaMI4X+6z9Zvx2M5lkGv/lSatV7LRDKBHb7awlwwMXyc2hSvNdnkzv1OHSCkHap01vkqnwTN4qw7GJYgZiqOoVfVCVad/w0w4bFG/doDyFnJweV46BIkBHTbzj3AWfOePcAq+m8irw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4758.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(136003)(346002)(39860400002)(366004)(451199021)(44832011)(186003)(31686004)(478600001)(53546011)(6512007)(26005)(83380400001)(2616005)(6666004)(6506007)(6486002)(316002)(8936002)(8676002)(86362001)(41300700001)(558084003)(38100700002)(31696002)(66946007)(66556008)(36756003)(2906002)(4326008)(5660300002)(66476007)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clU5M1NLZ3R0eHpnU2VvSU5MNDNtcVU0K0NUeFRTcnlGWThXdi9GQ04wZWFN?=
 =?utf-8?B?UVU0bC8wN1ZuRnZEL1BQMWVLQmhzSCtGTjRJbTUzUnJ6TmxaTmxYdVdJRllw?=
 =?utf-8?B?bEdXN2R3QjV1MVd0R0g0SUdtbnJkdUcwU05IK3MvY0k1cnlteStjZTJpbmZn?=
 =?utf-8?B?aVYxYWNoby9ESjlhak4zMnlyYkFzMDI3bWM2d3V4aWFKY0dRVHk1THN3Tng3?=
 =?utf-8?B?cFlxRTNNL3cvVmo4RUhXZ25mYWs3ekU1YzBRUU1CYnIxWG1memwvNHdidXhT?=
 =?utf-8?B?LzljVVhBQk91Um44SUpVc0p5NER3Q25sem41V2oxUWFzaDV1VjArVHJXdXpI?=
 =?utf-8?B?Wmg0aXJXcWVUdWN3WE1zMXpJY0NMY0x4OGwva09ZNlR2cDJnYXErc3dwL29l?=
 =?utf-8?B?WHRmdENITy9jT0xpK3dQWVRTbkUyL1J3M1BmcHU3M3BIYVZjQXBscURCZmZD?=
 =?utf-8?B?K1FYanBpV09pREFUcm5iek5FOERaTW1hd21aZGgwSTNRK1NFWi9ZM3U4L2Ro?=
 =?utf-8?B?eXUxYXprL1YxK2k4K1JEWTVZQnU2OE56WmcyRzVwNFRNN2JwM09vN01neGh0?=
 =?utf-8?B?QnFGZ2NLRFQ2MTZHMVVlRkFrOG5VLzVpT2hKZWlxeW5IbjhDWDRlcHJaZlVH?=
 =?utf-8?B?WGxBa3JkL0NpNHVOVkM4bHVLQi8yQjBIQzdEc1Ayb1JFeVFRR01TOWZGbjI0?=
 =?utf-8?B?VlprQXFZRXBidkZHQUVLclRTaFlRWnFpT20zOFdkaDdTOTZtNTZTa2JoWE16?=
 =?utf-8?B?Z3dsamFYWXY4cWVXUDZpb2lTYVVoYUVBYVl4SVRIUkE3V1k5TlhvTWNWaU5U?=
 =?utf-8?B?V2llZ0JuMlpBdXdVZ2d1Mnd4L0hWYVMvUmVuUnd1STdkajlFbFNhUEVQSks2?=
 =?utf-8?B?MkJlRHFhN25aWTMrZjUzS2hZQVV3VmcvY1hOcjJhOXM0R1NIeDBDcmtqbHpN?=
 =?utf-8?B?S3BLWlc0Ry95TjhidXpaWjg3VWpBWm9NTjVmMEhZdk4vOUh3SzJZaHEzbFdy?=
 =?utf-8?B?azFPL1FSYVo0NTRiL25IY1oxQjJ2cUNCcmV3T1BTSy9wbzdpYjJ5NEd0c3VP?=
 =?utf-8?B?NUx0em1JbThlaEJGOVkyOE8vcDQ5QnVrQlRpaUtrTUMyVzFTTllTa1d2ZnRY?=
 =?utf-8?B?dm16c0JWL09wTXFqNTdVdDRObHl0d2JPaU9SZmQ4VGw0OEFlNFFZb3pxc3hy?=
 =?utf-8?B?Sld5OTlHWWpmV0xraWg0UjQwbi93aDRnRkx1VXZCRkRMZloydFkvMTNqVGtE?=
 =?utf-8?B?RnJoVEgxWHFyMDRyaTRLT3I4SHhqNEFMaEN1cU02WDNvT1V5WDZ3MUEwRnFr?=
 =?utf-8?B?eTErckdHK045OXhvWEFYQVFGdUVUem81WW05MXY0cU9za0F5Ni8xVUJzY29S?=
 =?utf-8?B?RE5VdVJBYlJZdCtaaXhKOHRBa2FIdjVwTDhiUnYyRDhua2Uwa0FjbkRxbHJO?=
 =?utf-8?B?RzFFVW9mQTRycUtHR1ZsdFVLUmxiRjNFZVk4RDdkcGc1Uk9BZ1loNkdPazNK?=
 =?utf-8?B?VXgveVczVEZ3OUVnQTNDeVl5UVcwb0pnMTFaMEd5ZFQ5UGhBQnJpQUY5S2NK?=
 =?utf-8?B?YzRaWmxoZE4rUHNLL2t3KzNJdGxId3VCYjBCaXNTTlFRVkhuTnJ4SmdXWklH?=
 =?utf-8?B?ekNGMnEvRnNWaGlFcjRROENsaFVkRkZ5VzVBS0xqRHdTQ3hGZWlwd2ZkdTBD?=
 =?utf-8?B?MkR1SG84bkpmMTlZOTZsR2JkT2VETWxjYnhEcUVjczhXMmlydzB6VEZNWm5Y?=
 =?utf-8?B?QStPaXNXM3BweVNSdkEvYzNxZ0lVZ3RDb0N1V2owREgrK2krWk1Hbm5DaVJ6?=
 =?utf-8?B?NTlzVWZUUzZNMlByV3hGUnZaZ0VOcnd1cnY4V21Wcm1xY25vZTZ3djNGN3NM?=
 =?utf-8?B?MFZ0ck14V2ZmTFVJNDZCN0FsT09uVVZWc1NIMTRob3V3Nk83encxeUNCMVVW?=
 =?utf-8?B?ZWppUXBMSzBWcFprejNadWNORk0vNUpvY0cvTXBsaGFPekIyNWdIUTdjZzNJ?=
 =?utf-8?B?WlNhN0dTdzFaUm9Sc3VtYk5yQVNYVjJwK0pQSlZmS3FOYlVZdXJIME5VRnl6?=
 =?utf-8?B?Z1Vpc0dNaDBMSWd5Tnc4UXRuUDAzbUtuUTZINlJJVFQ2SHBZY0Z4ZDJSVHRS?=
 =?utf-8?Q?+e6/Ylrlb5vMw9CXOxqLlRZLz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67d90a23-5de6-4719-632b-08db6806ed2d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4758.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 09:58:36.2391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V+keWlEnM77Z9O+bBH6uByhksRTfWdUKf+7u1B/QOWjzPTiA8Im8jDnT6bn44577
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5766
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 6/8/23 11:46, Krzysztof Kozlowski wrote:
> On 08/06/2023 11:25, Shubhrajyoti Datta wrote:
>> Add dt-binding documentation for Versal NET platforms.
> 
> What are versal net platforms? It's different SoC? You have entire
> commit msg to explain it...

It is another/new Xilinx SOC.

Thanks,
Michal
