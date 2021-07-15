Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B36CC07E96
	for <linux-clk@archiver.kernel.org>; Thu, 15 Jul 2021 15:05:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 17DCC61279
	for <linux-clk@archiver.kernel.org>; Thu, 15 Jul 2021 15:05:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235419AbhGOPHz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 15 Jul 2021 11:07:55 -0400
Received: from mail-eopbgr80051.outbound.protection.outlook.com ([40.107.8.51]:4481
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229937AbhGOPHz (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 15 Jul 2021 11:07:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQ4cQ58IRppAow+M2ZoqISY0BX9qWWwSgN7b1PxSPLf1eDjfzL5M4GBIm+tg0yxFrQhvTKp8l9dJpNZDGh4uBY659tlRoVBIQ/qNw++xDz+9Pv8U9EAZp9T7iCYHVjpi3rczXa9hWBd9/ObjXrglQzLkV2XsDlvKDzDoduLyCmoJFK3ufT0xopnNS3XDF7gmLBCe3PaSAB9Poxk7KdCyzXJK8BLUpBKU5oYxts5nHcfZGsrjhcof4lvNLxnNnrFE89aPWimtmWQ5c28RkwfhoPzIN4du8JcpY+6zwLqwj0hl+zrQqZUAXMWL96xFLH36lp9Lvbp5yaClCLPeepcWnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RtYbHwp8kRmWnhDLkbPb4ARqk4NfSap6UvWk/jPsymw=;
 b=h4nQ5ekrS2DvyIyXPWbtruyZbqPGqSq4Hc5SiPWK14QZmJrLmS6HWat87VKoSUhNKDQWAjqf1DX/Ko9SbBZUBTKmNvjAlMKRgSFz2JUHeddviOmfYNL0ShOM4yrsX0VeJFIvk1XTh8EnEACPs+z4wdU8mv7sH/fIHw9fXt2XVAILGkgplqMBBfAYG4f3y9fgItXX4FTBmFiP7w6mR75XSfd8QXwMRe7c+0GzrYxMHl6bvSvluw9mETwIY/oTb7jcJYuD4WziVM95RyhKNIcTu+zYRfeSsIFJrbIX0CNKuhL+qNCC2MlVHAYZ2djPh0dxCy4aHkYehGtZi4WB4+SWOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=secospa.onmicrosoft.com; s=selector2-secospa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RtYbHwp8kRmWnhDLkbPb4ARqk4NfSap6UvWk/jPsymw=;
 b=ij9/Wj5LqJRggZbQHtY5rD5S9QEMNTSAhX0D4YzurK2JO4Qn3maLM8oYLyr5QTfFQx4fOspBcxTDyROJCoWdPjx6shxKAwwbs4pI+aPObyABMu1fTGvVRtnxfEO3ae8qhRfAANSw0D5Y5A6wTzV1JBDfvTEiKTVJeQ7/UTmmzU0=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
 by DB9PR03MB7513.eurprd03.prod.outlook.com (2603:10a6:10:22a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Thu, 15 Jul
 2021 15:04:59 +0000
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::dc6c:815b:2062:d1f1]) by DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::dc6c:815b:2062:d1f1%7]) with mapi id 15.20.4331.021; Thu, 15 Jul 2021
 15:04:58 +0000
Subject: Re: [PATCH v4 1/3] dt-bindings: clk: vc5: Add properties for
 configuring the SD/OE pin
To:     Rob Herring <robh@kernel.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Adam Ford <aford173@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
References: <20210701182012.3421679-1-sean.anderson@seco.com>
 <CAMuHMdVfeWH9G3sh3REfqYp8v3KHmX712Ar8XRxZpg9NWoVfGQ@mail.gmail.com>
 <c1f93c0f-a155-a487-c168-b82e135d1781@seco.com>
 <20210702151805.GA439387@robh.at.kernel.org>
 <CAL_Jsq+akWGskGUxLp38cMRgr5uXiRbdhuZwxYEkouQhWNyL2g@mail.gmail.com>
From:   Sean Anderson <sean.anderson@seco.com>
Message-ID: <be1439d0-7dbd-3b79-f437-865dc2d91016@seco.com>
Date:   Thu, 15 Jul 2021 11:04:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAL_Jsq+akWGskGUxLp38cMRgr5uXiRbdhuZwxYEkouQhWNyL2g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR22CA0006.namprd22.prod.outlook.com
 (2603:10b6:208:238::11) To DB7PR03MB4523.eurprd03.prod.outlook.com
 (2603:10a6:10:19::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.1.65] (50.195.82.171) by MN2PR22CA0006.namprd22.prod.outlook.com (2603:10b6:208:238::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 15:04:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 395eea37-7499-4efe-fd5b-08d947a1e9b3
X-MS-TrafficTypeDiagnostic: DB9PR03MB7513:
X-Microsoft-Antispam-PRVS: <DB9PR03MB7513ED5B29737A987A04C54896129@DB9PR03MB7513.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kPIuV+m/y3ypkMTYT6T40jWntbiMR/6e7gRt3/LTLxx3mObFNShrMKuknrcETCFw7JoIEjwAX1UHEDQtqq3P44ywyUVRbDpPfMOhied7fsFrJ6joRWA+Ygsx0qy80YTcON1zdo4o7CBx2wSJxustBjw1xHgEA3ynmVtcgK8tn1vG6JZTMBKyEdHosqzlF6H0nmZmsup+4Ye0VQ+IKta9h6stbU6d4PlCI2esZLnhbtgdT9hMACytivla4nOfXY896lcC/CaibFbNcSC8kvpU9UITZXoh2+WR/9EGVgIfXd4hPaHCse+MY5NmPWcS3I7Nycx2qOlLpFTU73DWZ3cjU1iBeHkjuYwJIgegd3CIFcaTVJj1JlU8V6ptD1A13SSEXKV4S1iJt8dJ6oD1SRsAuCC/XQIRqY55b4MXDXAvc9GlmNTiawTuUanOt4sOJTt3QeHhIr87I97/vKkEH3W6Lor/ZnDKosvL4HTLjDodnJkFRkVdrGGjNvFyukT2hhNK1iX44A/JT/S8dAzvPR/NrHoUQ17szsXSMjUqLo4EC6y7GCjGG6aLv/1LfsNd6LZ1QgTW/LjxBwUR9DKUcuEyggd02hUeLYCERcy3F1VOFQ5AbMdrVqQdKwk2M38qJ/TfYhhT8gRobpwdeK2xBwpMgrL+83nq15Dy+S2KQ+e8/W0Znt+S1jNyAm50gsFLrYll7tMm9iljV4EE/uxruueGsLqmt46XnHi8/LIRlLYKDz+D6FlKGbCD0zzZ5hAJZ1oGmmvrQdYqYkq6gipvJxnqnQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4523.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(39840400004)(366004)(396003)(346002)(38350700002)(186003)(8936002)(5660300002)(316002)(83380400001)(2906002)(38100700002)(16576012)(36756003)(6916009)(31686004)(53546011)(2616005)(66946007)(4326008)(86362001)(66476007)(6486002)(66556008)(54906003)(44832011)(478600001)(8676002)(26005)(52116002)(6666004)(31696002)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WCtvaExwbmpOQ0JOWDFBZmYwOCtid1A5VzJhYXQ2azRsWWk0SXZPVkEwRy9M?=
 =?utf-8?B?bWplcE16SUdmdDBxOWVWN3FFQjFFcG1JVHcvTDgvcDdSb2o0cFlpOUlxV0Nw?=
 =?utf-8?B?dy8xNmptVnN4WmRpWVFSS3dPYUsxYjlCVm5YMnBBdGl2UFpIQVhkbm00NXc1?=
 =?utf-8?B?QnNrSkNaMGlYVTcvUUpJQkVsUFlDNWNSRnhlZGNIdHlWZ1NzSnVqWm5aVWJx?=
 =?utf-8?B?N25GK3N3bUlDc2x6cndQSHFLZlcvY2dXa3UzK1BpQ2w0WDdBSzlUUGRUTDUr?=
 =?utf-8?B?VENTdFErdEFHUXhJYjJBakNoejhrVFZOZm51dktXWmtFVEhEWWVwZVEzNnZ0?=
 =?utf-8?B?UUFsMCtJaXFIckh0ZnpXOFpycThHb2tDNzI1MXJuOEszUXVsK3Z5QVVOck5H?=
 =?utf-8?B?eXU2Q2pvdjdsMDJ0Y1BzMzZjcnZ1VG5wTUxtZzBsalhtWFRUZWp5T05LeVZj?=
 =?utf-8?B?QVV0MDJXLzJMczcvKzd0QUo3RC9LK0wza0tiRk9sOGVTT1VocldFUHVLSlpG?=
 =?utf-8?B?Wk5SRHU0RFAyRkJkTStET2ZYUkl1MmIrRW5mV3ptMjVadEVibU1vdHNjQWlQ?=
 =?utf-8?B?MW9hVFl6K1JJVWlJdnFrM2pEdmFteG40ZllCZEYzelUyeEFSS21YNUZrR1Nw?=
 =?utf-8?B?WEJxT29Hc0lXVnFMQU9QTFJGcGQ2TlVnMnM4T0NwSzVYYlBTWC9SMDI2b2cw?=
 =?utf-8?B?bVhoZFRwWS9Jb0tYMUNqcVZFV1F3L3hwbHFmdWw4R2NnalFQYlpvQVBiR1Q4?=
 =?utf-8?B?OENYbERmUVV5Z1JzZjh5bEpBUEhkb0Q4TmI5cnloK1QwdkhCaCtiU1diVlk0?=
 =?utf-8?B?bTI1VDdSak0vdnVzUUUyL0FqUytQZXlwNDcyMFArMWV6clZnVDZDc0Ira0hK?=
 =?utf-8?B?aEJ5S04yZEkvVmd3bmpZdnVIS0dWSU12MVFUZEJlelFGcTRDQ05hdlFHenY3?=
 =?utf-8?B?YWpsQktWdkNpMzhtSmtIakhIL2lBelZISkxzNTZtaVJHTUc0ZExVL1dISUVR?=
 =?utf-8?B?TlBVenY3d0tGdjhjeUtTNzM1Y1BZdXp0Q2t4RXNrVExXMkFtYkdNclVETFk1?=
 =?utf-8?B?R2N4dTQ5ZEtYZ1BsSmZialhmL0dEa3VuaUprNVlMTHNjK2V5b2NLay9EQi9s?=
 =?utf-8?B?Q1d1UXpNK1UyVmE4NVFZS21oR2x5eWtsT285dDZqQzd6bGxDck1lQzNiYS90?=
 =?utf-8?B?b0dqUi9nemM0dVhnb1k3anBYamk1L2xLcTlQd05TYkRWekYzUkZ0Zk9WRkVU?=
 =?utf-8?B?TmRrSWhULytwN0FHY3Z1R2NCeXQ0RzZnMjR1bXFsRHNpb3lZQWF2Q3lKbUcw?=
 =?utf-8?B?VjY1eG9EZVo2MEFuTVpFdzhBUU54N3RBQTJEZDRQTzZOeUtRVldCdnJOMCtP?=
 =?utf-8?B?eFJTb0RNUzA1OGlNRDQ1RTZEajZ0b0x0MmVXN0FIeVJ0UjFObEhKQlZqOCty?=
 =?utf-8?B?dnNPOEF0TEVCL1RrNmxKQkowTjF0ZjBPSnZpeXdRZEJCOGhuMS81QjJsZnRW?=
 =?utf-8?B?dmpXYU85KzBDSTVZdlJ2anBiWmw2TFROTVpVUTFsRkVyTkNoVWJKaVFXVEd2?=
 =?utf-8?B?YkZKR1NHTHRWMHpyRHM3OFhxVm1pb1IzTnYxSUVCdWtsZmNaN3VxZDR6Q1pr?=
 =?utf-8?B?Vm9HSHQrZmtNTmE4ZkhyVHBTNW1HOFJVYlVWS0hOaCtQNVl5b0ZrdytsOGd2?=
 =?utf-8?B?UUNEMjA2bUxkVVF6RFJoUW1wUWtaQk95QnA3TGNHUnpDSGZWMXRCdEVtOHV4?=
 =?utf-8?Q?k/7uaxu77uzSrTEw2HFQfU31cyG7pF1kSzZK5GA?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 395eea37-7499-4efe-fd5b-08d947a1e9b3
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4523.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 15:04:58.6989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j6oKujlCKrvRWVG+MLFpe1mX2xjDcVD2E2vrhI76DvmFZK4g2LUUb8vqO60x/tkG1WK4yzBW4dp9OpydwdBXEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7513
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 7/2/21 5:15 PM, Rob Herring wrote:
> On Fri, Jul 2, 2021 at 9:18 AM Rob Herring <robh@kernel.org> wrote:
>>
>> On Fri, Jul 02, 2021 at 11:07:57AM -0400, Sean Anderson wrote:
>> >
>> >
>> > On 7/2/21 3:14 AM, Geert Uytterhoeven wrote:
>> > > Hi Sean,
>> > >
>> > > On Thu, Jul 1, 2021 at 8:20 PM Sean Anderson <sean.anderson@seco.com> wrote:
>> > >> These properties allow configuring the SD/OE pin as described in the
>> > >> datasheet.
>> > >>
>> > >> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
>> > >> ---
>> > >>
>> > >> Changes in v4:
>> > >> - Specify that bindings should specify these properties, but don't make
>> > >>   any guarantees about the driver's behavior when they are not present.
>> > >> - Clarify description of idt,(en|dis)able-shutdown properties.
>> > >> - Make opposing properties mutually exclusive.
>> > >> - Add these properties to the example.
>> > >
>> > > Thanks for the update!
>> > >
>> > >> --- a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
>> > >> +++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
>> > >
>> > >> @@ -109,6 +152,22 @@ allOf:
>> > >>        required:
>> > >>          - clock-names
>> > >>          - clocks
>> > >> +  - if:
>> > >> +      true
>> > >> +    then:
>> > >> +      oneOf:
>> > >> +        - required:
>> > >> +            - idt,enable-shutdown
>> > >> +        - required:
>> > >> +            - idt,disable-shutdown
>> > >> +  - if:
>> > >> +      true
>> > >> +    then:
>> > >> +      oneOf:
>> > >> +        - required:
>> > >> +            - idt,output-enable-active-high
>> > >> +        - required:
>> > >> +            - idt,output-enable-active-low
>> > >
>> > > Do you really need the "if: true then:"?
>> > > Just the "oneOf: ..." worked fine for me in another binding, but then I
>> > > didn't have a surrounding "allOf" to interfere...
>> >
>> > Yes. If you want to have multiple oneOfs, they have to go under an
>> > allOf. And allOf *only* allows if statements. This is a pretty big
>> > deficiency, IMO, but not something I can address here.
>>
>> Humm, we should relax that, not work around it.
> 
> I've now relaxed this restriction in dt-schema master.
> 
> Rob
> 
> P.S. I probably broke something because it's Friday afternoon before
> going on holiday for a week (so I'll do a tagged release when back).

Will you be doing a release? I'm waiting on that before I send v5.

--Sean
