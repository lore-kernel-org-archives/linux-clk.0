Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D93CC11F68
	for <linux-clk@archiver.kernel.org>; Fri,  2 Jul 2021 15:08:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E60861423
	for <linux-clk@archiver.kernel.org>; Fri,  2 Jul 2021 15:08:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232226AbhGBPKj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Jul 2021 11:10:39 -0400
Received: from mail-am6eur05on2080.outbound.protection.outlook.com ([40.107.22.80]:39905
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232203AbhGBPKj (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 2 Jul 2021 11:10:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kPMruMr8Tu8nKfm7/UztFaAGvQ969XQ+1wRRICw6WezThrO2SXFwDbXkuZ3HRxA+TfqxUZ4KFwOnAFasozmY9Z8I3QT2zEhNcH6OvFx7FnKLdd5TfVYzSQqVC8hhHNSqbR1r+a/jkNJ3moXV7Hs2ZcPm82KMmiQDNi0zqvFc5Ji2ZNtIiyvDmi33kFaxiWXOsa7seb8esyKw/oR5K97V0RMMZ4Wm/WUqVZoN+VWjD0Fa6HDLEoVJcMoD33LiRnCPRW5luNI66XPgrMpogwjbiHvQ4xcISzldYiHkv9IQWdXV7h0hd+Pbse+CyFXbsoe3V7xlonoiESo+qsKZZrUFmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81btkbloTGK6Bc1nZDoHgiMcBpULlHdFqWEI3V9dUfQ=;
 b=gJefCXPKZitHMkulqaYz6S5Hu9e+fb9fdCv07zFoJiFIsOXD3/MCCuRPV6indomvGscjLwOWGGSfzKthqwErb6QVC4OUwS0iq7wRSTsqnJpdvWI4i9pL0NQ1gps7urJZvaSbcfmToU4VE6U2MEHL79MK0cy3+OeGuX19gBj/wgQ7D4rZmA+N9BOPcCpJp5wInPYRDx7rcmQkQMz66+Bk44bZ9uDyADh2c2uacWPC2Qy8pvjrK+GDFj1smT/PzzXP0aDs5X59WS9jZ83/VdWr8i9tbXhdFuCtyDKnLhNWE97Fu7CxjmU/6EO4CRn4KQnVLAVpNXHjVPs/MOt9e/X/FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=secospa.onmicrosoft.com; s=selector2-secospa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81btkbloTGK6Bc1nZDoHgiMcBpULlHdFqWEI3V9dUfQ=;
 b=TaW0vNDy8PsFMd0iVGZ+ZvWp3uGrZBULhZ+ymE/yW1sCzlXOnddKC3l9hMhG+s8B61NE7L9AfohNo1QY7LZhlBuR0ki0DmwbeLSR1PUxmOIgakJglC3yXCkEOM44PiEQVpfsAVkqdcWgkktjaYSFvddUJcsv0C/pvW4kue+0S5Y=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
 by DBBPR03MB5367.eurprd03.prod.outlook.com (2603:10a6:10:dd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.27; Fri, 2 Jul
 2021 15:08:03 +0000
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b]) by DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b%5]) with mapi id 15.20.4264.026; Fri, 2 Jul 2021
 15:08:03 +0000
Subject: Re: [PATCH v4 1/3] dt-bindings: clk: vc5: Add properties for
 configuring the SD/OE pin
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Adam Ford <aford173@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
References: <20210701182012.3421679-1-sean.anderson@seco.com>
 <CAMuHMdVfeWH9G3sh3REfqYp8v3KHmX712Ar8XRxZpg9NWoVfGQ@mail.gmail.com>
From:   Sean Anderson <sean.anderson@seco.com>
Message-ID: <c1f93c0f-a155-a487-c168-b82e135d1781@seco.com>
Date:   Fri, 2 Jul 2021 11:07:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAMuHMdVfeWH9G3sh3REfqYp8v3KHmX712Ar8XRxZpg9NWoVfGQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [50.195.82.171]
X-ClientProxiedBy: MN2PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:208:23a::9) To DB7PR03MB4523.eurprd03.prod.outlook.com
 (2603:10a6:10:19::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.1.65] (50.195.82.171) by MN2PR03CA0004.namprd03.prod.outlook.com (2603:10b6:208:23a::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend Transport; Fri, 2 Jul 2021 15:08:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f86bc9bc-0294-4789-c09f-08d93d6b3085
X-MS-TrafficTypeDiagnostic: DBBPR03MB5367:
X-Microsoft-Antispam-PRVS: <DBBPR03MB536779C659CF8EA413495F20961F9@DBBPR03MB5367.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IsIxuHhV4wmYBHReOOSWILFd9ca2EdT3XhlXurRKrUvlmS5u0veX7J4rW0LS3Zc/knquIpgIJ+0FrazaTUWomtA+yOmSZuQnwMefAJZkajHIbH8/3xwcdimnl4lfhx/n2erQDu5R29RSRK8680o8iSidVDY2fH0rGP+NRsUsUQwACcQXapmI06WU1UX0K61VLIWQXa4q7AzB657JL6MdcvpYabHMLyzRGw6dPMtcLybYmi9cKkMuEVfQfjyWko2ctcaP3O/Qvburztz6TRIpPfbDQejamqv5kb7weglbXxfxp4IWY8uSA5cHzwYBnvg0EueYLMuSwUKypJqEECKxYwwYuZd15hCQX0anhT5lHCtveN2QcZMbQMDhz59Byq/aXzpGwudzZzBQw+Mg7EMCaI5XFVl1NOCM5ZhDF+mcY+bqXwx8RW7TomFtZzgvwzIIIk+dRgsTU+Qn8kFKaop7vbOBgaTEnX2HY5GwiVF96gYFAPlQy1SEnxsdWuLcthoMLkYxH2pqwvGUx+2f+85foFuYuaYyqFeEH3bL7r8DGOavhjvR4hbMdkUcF7t2bcEG1ToZU9BrhiNGPNGGgGuJmxhqIJOHUyTDcUTft3p0TBze8u+4HO9N/aKDZOhZI4j/4yCE1i8Vd2AKOCKPFp/A8rfqikiCsD2tBpOGGsuB0rnIfVqpNrETuD3BOnPjAGcdv+cggC4gPb+yK9JdXTfiJMToXa+JS9T/bIgFih26SV6CiSYzfhsDqdVyWZyuSwEJ6QNgpEvjInaNoLHx+5OaGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4523.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(346002)(366004)(396003)(39840400004)(86362001)(66946007)(2616005)(54906003)(44832011)(26005)(31696002)(6486002)(5660300002)(6666004)(8676002)(956004)(6916009)(2906002)(316002)(16576012)(478600001)(66556008)(53546011)(38350700002)(83380400001)(8936002)(52116002)(36756003)(4326008)(66476007)(186003)(38100700002)(31686004)(16526019)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVhFUlY5cHhHS0pDWWwxMFBrcWZQWnhBRVlDUnpkZUN6Z2tzZHNXY0l3MnVq?=
 =?utf-8?B?R2NUMGNmV3c0a0VLTHV3Rmo0OHEzTDdLU3lSUW1rcElEN2lSeHBlUTl3V3ND?=
 =?utf-8?B?djduQWtiOXI1UGxUdTErcmRtYzZuei9QeGhDeDZTay9kTTVzcldOdk0wK2hD?=
 =?utf-8?B?Uk04aklRS1RWTWZCYjNMdXdCdVhNSkNoTXlxQjUxelNZcUZZYWRiWG9mRnJk?=
 =?utf-8?B?TUdSNjVqV1plTVZDL1hVdUxGcTduOTl6dWdHdXJyNnJwWXF3YVIyVTZKaXNo?=
 =?utf-8?B?RlNKRFVXVFQzKzhxNWROMzY3ZGlPV2xYcWc5dGsxQi9yMkV0WGU0alpQTTBI?=
 =?utf-8?B?RExIVzd2ck9VdG9mK083Q3N1V0craW1lN1dXOW9TZmw0dml1bktsZURQcFAx?=
 =?utf-8?B?U215a3BtUjNwZjNIRVB5bkpmVG9HUmxuL2xqU2NDZTlvS0daSVRyejN3Zmw3?=
 =?utf-8?B?aW1SU05rK0N2QjBwVlNHMXA5djlFSGhSYnQ3RVpOSUVSY0o3TkJaL25sMGR5?=
 =?utf-8?B?VEh0bFN6VUt3Tk11S1B5dU4rcDNpQnRnMnFNbERuSDJ1NUxDNlFBcGhucll4?=
 =?utf-8?B?YlUvQ1h4WHlodE52TDJUK25DR3d2Z216U3NmQ3B4RDJNbENTZVRvMVdFcU10?=
 =?utf-8?B?ZHZkY3hQa2FIWmFxVHdjRkx1MXIyMDdFSjZMamw4dlpsbmhUVmRGZlViYjJC?=
 =?utf-8?B?b29TaDNEcDBqaWN4eHFuZGowNzdRT2xBbGg2dlVkcVpGZDVwSUY5UnN0b09E?=
 =?utf-8?B?OGNWbEpXNnBDWmtvblZIWEd6TUlqalZ6VEhxTVRCTkppVzh2Q0RSK1NZeHdq?=
 =?utf-8?B?ZW80U1F5Wjg3S0dMQ1FWMUxIRzNCa3RNSUpUQWlZU0ZUdlVuYks4R2kvenNB?=
 =?utf-8?B?cHltRXBjYjJtVWdzRnJwZThva0ZBdXlqbDJqaHd6L0NGeWlkcFFMZDBiOGxL?=
 =?utf-8?B?UnFoTVpyZG9YMHU4azF2U1E4d2E1V1B6alZhQVduamV5bjIvbDVhdDk0eFRS?=
 =?utf-8?B?NU8xeTM2YVF5bVhlWHNBME5hcy8wUmkyQUppQy9xZnpSV1MxUWd6V00yejBV?=
 =?utf-8?B?WUtEZHlxYi93K0hYaWhZaXUxeERmZmRQWW1tL1hrUWRzY0p2RGdIc0RWRVg0?=
 =?utf-8?B?YXE3V09DNlF3b1pidkpKbENPYlg2SFpUSHFVZE9LTVB3Q2lCRk9JeHJGMW5K?=
 =?utf-8?B?QmJTbCtUazEvQmxQMHI2dnBaR0FyNGtGam9OU3d2UGd4T0xJRWlHaDgybXRN?=
 =?utf-8?B?bnI4dFNqTnVXN1V0Z2tQSzRYeGtieUdhL3dSQXlqamNDMjZWdzhHOU1aSTJJ?=
 =?utf-8?B?L0lmd0lDZXltUGpXSGhwdzdoRFY5cDZXOXFVaWtxNUJabkZ3M0ZnL2tZZlN2?=
 =?utf-8?B?aFVyVExKa3NHZVJ1QVUzZTA3VlF3VXlRcmtHVExiWjFiaEd5bDV5NUYxZUhO?=
 =?utf-8?B?MTBYR1hxZWt0QnhpaFFIQjBHWjlYbFFqODNQTWtBbXErY3h2MzN3MEVyRjhy?=
 =?utf-8?B?dXJpZTBPSngyaDJZV2laTHdwMDVTcDhXSFN6NjlFZFpsazFFcFRhTFh4azI5?=
 =?utf-8?B?TlpycThRNEhVaTdEelZjUk9rZ3JCYmgyb1Yvd3o4aTBwZHcwN3pYTEdLYThq?=
 =?utf-8?B?c3FEOVpmZ1Bpb05YL2hXSEI1SjlWZm80OUNCVmhmRjlyL0UrUGFMWlIwTEFK?=
 =?utf-8?B?a3puZDZFaG1jMzVGMzd5NVhUbGtxQWVYMzYxLzBMQ0l1Q0ZqK08xa2gzSzJZ?=
 =?utf-8?Q?T9ee0kIMYFUnfmpcI6WAQB6nfVOfVVvfjpcVHiM?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f86bc9bc-0294-4789-c09f-08d93d6b3085
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4523.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2021 15:08:03.7261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IkkBLeXQx+yXTd/im76zeFBj2TCV0KNb0DmLJFyytEMOA6rwDirC9dFnlYLduHa9LgT7W8wgOgcDd+Pezd9h0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB5367
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 7/2/21 3:14 AM, Geert Uytterhoeven wrote:
 > Hi Sean,
 >
 > On Thu, Jul 1, 2021 at 8:20 PM Sean Anderson <sean.anderson@seco.com> wrote:
 >> These properties allow configuring the SD/OE pin as described in the
 >> datasheet.
 >>
 >> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
 >> ---
 >>
 >> Changes in v4:
 >> - Specify that bindings should specify these properties, but don't make
 >>   any guarantees about the driver's behavior when they are not present.
 >> - Clarify description of idt,(en|dis)able-shutdown properties.
 >> - Make opposing properties mutually exclusive.
 >> - Add these properties to the example.
 >
 > Thanks for the update!
 >
 >> --- a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
 >> +++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
 >
 >> @@ -109,6 +152,22 @@ allOf:
 >>        required:
 >>          - clock-names
 >>          - clocks
 >> +  - if:
 >> +      true
 >> +    then:
 >> +      oneOf:
 >> +        - required:
 >> +            - idt,enable-shutdown
 >> +        - required:
 >> +            - idt,disable-shutdown
 >> +  - if:
 >> +      true
 >> +    then:
 >> +      oneOf:
 >> +        - required:
 >> +            - idt,output-enable-active-high
 >> +        - required:
 >> +            - idt,output-enable-active-low
 >
 > Do you really need the "if: true then:"?
 > Just the "oneOf: ..." worked fine for me in another binding, but then I
 > didn't have a surrounding "allOf" to interfere...

Yes. If you want to have multiple oneOfs, they have to go under an
allOf. And allOf *only* allows if statements. This is a pretty big
deficiency, IMO, but not something I can address here.

--Sean
