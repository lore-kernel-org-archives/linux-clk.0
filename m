Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 715CEC11F64
	for <linux-clk@archiver.kernel.org>; Thu,  1 Jul 2021 15:52:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 415006141C
	for <linux-clk@archiver.kernel.org>; Thu,  1 Jul 2021 15:52:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233444AbhGAPyg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Jul 2021 11:54:36 -0400
Received: from mail-eopbgr140053.outbound.protection.outlook.com ([40.107.14.53]:31394
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233239AbhGAPyf (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 1 Jul 2021 11:54:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TobeeG45Qjvi9A2UVlN4GCfRYoatH5Z6jI43StkBcguGixY66+ZrJrIt7BVwAVtHwi+RQQ/fV9LmVYyrcf0KG3wzxhtlk7yIi2AHvIeU3mMTvm/+c32Vx4acsoL7BY7YeAwQCgnK+r9dHpilkbwZQkM8sTvjBodyo3wQB1KY2PwNGjeskeOySxu9pAd7qM/xX5wg3gFnogk95vOWaeN4/2ywNrTJJUCDZp8pZSmqraH5WV12I/gn40wop4lKXcN+cbzlRyAm8LMRPEVFzuDs+iOYkvoX1jCSciudxc553l5R0DyBHOjVnE8q2W5FqOn19G99EB36kP4g1JrIwkdVdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6zulPRghAhhs39H2qAncX7y4k6Y3253eMoKzkS995Sg=;
 b=SutkzFQ2ibK9zGQj38dPDm9Yv+UvNQjuUhkBauoBhm7hbDC0KIXJvurZs/8IHXS/ysD9g2qzVVq2NkSnexRyJ+WmTkDbeZPRP1Ms140NGB4Gu4UEk3Uamz0mJ1dUXA7n9TV1yQUZ/VQAr9ceS9we82e83io7ktPoQJKsZDJmjN8oQUb/PkKCw+wljQ2OLW2zrxzyy/MQ49J9BLaG8RdXl/gUsKQ5nYYFLZLsv0RKLBS5e1pKNdl1eUuGa1cKJLtxyzRQv9sMTtziMt6AEeAvocLnHJKJSC5USrSarKWOPyb5V2DtgthGvQiyUcdhDJ0Qs58K2Ts1bHhmFcfgUgLBRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=secospa.onmicrosoft.com; s=selector2-secospa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6zulPRghAhhs39H2qAncX7y4k6Y3253eMoKzkS995Sg=;
 b=KVLHUgQW/qfBA/JXWHJMTTN4ZDPgNtEqPCIDkqpzgiQsvOlHI7TpnrTswhL+LCG+4y97HOODRyCjWtllGYE7V4hm7HuSHXl37ZmvyxwTH/2wc23kbHYhYsxomN0i5KXEhzkTwR67sAchCmor0Lv2b5T5FeAtrUUeKP1dPOnZO3o=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
 by DBBPR03MB6857.eurprd03.prod.outlook.com (2603:10a6:10:202::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Thu, 1 Jul
 2021 15:52:02 +0000
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b]) by DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b%5]) with mapi id 15.20.4264.026; Thu, 1 Jul 2021
 15:52:02 +0000
From:   Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: clk: vc5: Add properties for
 configuring the SD/OE pin
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Adam Ford <aford173@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
References: <20210629154740.3091884-1-sean.anderson@seco.com>
 <9edd6194-3a71-4f31-dd39-ba831e00b9d8@lucaceresoli.net>
 <3feea852-cd59-520a-ec60-5dd1c1c7a824@seco.com>
 <b546c671-2bec-4db7-2f5d-63c97c3a3258@lucaceresoli.net>
 <CAMuHMdWau7XH_Krpws6U_n1GeX-AFh139PsrmOux-5oO2DwNuA@mail.gmail.com>
Message-ID: <af422b9e-8820-5c43-527a-ca1d9ee413f6@seco.com>
Date:   Thu, 1 Jul 2021 11:51:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAMuHMdWau7XH_Krpws6U_n1GeX-AFh139PsrmOux-5oO2DwNuA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [50.195.82.171]
X-ClientProxiedBy: BL0PR02CA0086.namprd02.prod.outlook.com
 (2603:10b6:208:51::27) To DB7PR03MB4523.eurprd03.prod.outlook.com
 (2603:10a6:10:19::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.1.65] (50.195.82.171) by BL0PR02CA0086.namprd02.prod.outlook.com (2603:10b6:208:51::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23 via Frontend Transport; Thu, 1 Jul 2021 15:52:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86016bfb-9f86-4db6-f3b0-08d93ca82ae6
X-MS-TrafficTypeDiagnostic: DBBPR03MB6857:
X-Microsoft-Antispam-PRVS: <DBBPR03MB685737DDB90C547E9C76EE6C96009@DBBPR03MB6857.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /mbbXYi97marp7LEOLTtlosUMcErn5xo4LSs1c7ppoZoXigHMn4euBIIRUCZfnNt+HB4byypEM25O9ELhGUpQDyVo1vXbJYfrvHx3wbkzHzdJ0zXJqRsC/NQAKWuAxxvm3CV4kCYhUaN6FfbVaycwnuTggvo687kpEH5Qb7UboAp/OtBaUHlGlzHUzKlL4EOA4wQwnqovuoWw/VzOGTdfNeVF0ASAnLjvgBQYxrYjpWu6isCK9u9oSNznpva9qQw98HNGlquGH36Ov9Xvzari384e0uTJG7gICXXUiVxYynu/XFBGCtkGb9ZGqPOjpBXjhydqUNoWEd/YnpXRsRFHCBzQ/DPems79yR4Un5ccJl5dqpYcwkoBPm9sMjTKC3kMA+B7DMGRkmA0zW0vf1gHaUUv0xwsPFAVypUfjwyCK9KzZQ9bSWc2/Lmeq1c8ZvjLK4k64r+PBIDO7eD0nYk7WDT4rjoKzzq0kJVyEe23zmOT7czU5s8tlCQ6hMc6/32ggJOEdz8CqLKVDLOa8isKU/vYU+micmk2VvT+dWEcEn491bgVOUFU+Oz8y/Iiqd2WPkveDg+jgPIj+IfTUl7n/8Gt6jHhE8ta33jf0YnD5OrpHIEdr+nOb+WYYQVgzX/E3GxvNlAXbw/2L3LNna+n+dC5BmCm1DO47os8Sa1xOMvtSFrqA4B9927daSnCMGC1e0inyS/8WzNlYTDHL+EhBog6oQ687pwy0CuivQR1ProfEtWnrq84gR0+UVPsL7cS2Gj1z7uqTCSgt+NhZ6vZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4523.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(39830400003)(366004)(136003)(396003)(376002)(346002)(36756003)(4326008)(53546011)(2906002)(6486002)(478600001)(66556008)(44832011)(86362001)(83380400001)(16576012)(956004)(2616005)(316002)(52116002)(110136005)(31696002)(186003)(66476007)(38100700002)(8676002)(38350700002)(5660300002)(66946007)(8936002)(26005)(6666004)(54906003)(16526019)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmIrV3VPZzl5S3VLRUR3N0x3amtHS3N2djVXUzNVRmdjZTZaV1B1dG9qcGpD?=
 =?utf-8?B?S3B5MWZEalFGaHJtaUhtT3JiM29PRUljV1N6azJjdWZiRHFGQy9LLzZLYXgw?=
 =?utf-8?B?czkwd1VML0VYZTNjTEZJWEdSM3pOWFNaWndZY0JiRCtmNlJ1eUtsbExJcEFo?=
 =?utf-8?B?eDJyR2tBWFU3VjR2cDJ0VHlmOTkxNFFKNkMzdWZ4K1ZYMURXRU9zSHVnUFVi?=
 =?utf-8?B?ejByL3cwSXcwbzRIbEhWeUZvd05JTVdxbEcvcEFZTlU2dVZNT3FYYTJ3Ry9L?=
 =?utf-8?B?aktuMDVjOUl6cUdQc1hUME41ZUlFdEpPRVg2cktPWlpIQThUaTRDVDRWZHVk?=
 =?utf-8?B?Uzdwd3Rkb2h0eGZnUm5Ga2tOeU1ML2M3Ri9kSEQ5SnpGMkxaOGpWWnUxeGRG?=
 =?utf-8?B?QjZKa1lDOFVkbmpXSUVOdHI3MWNvaExhWE5TM1VuRWNWWmhSUlpqUElEZ3RD?=
 =?utf-8?B?bW9jU0N2STdidUVmbEg0UnlMK0dRek0ySWlzdGYvTzNyRVI1Zmk1ejM5Y0N4?=
 =?utf-8?B?YXU3VExmaVcxVEhOZ2pYRnZEMGpMdDl1djNJUks2MVpRMG4xQzFWajlUbm1k?=
 =?utf-8?B?dDEvRzdHYWZPYUpwajRQN0tmbjJDVzNIdEQxMXlxdDFiWDA0Y3RkbG5KeWdJ?=
 =?utf-8?B?dFBqWE5ZUlkzd0NPVzh5S1Zua3AwMkJpKzl0d1owQ3psbjRxSmhaS2xBVlhG?=
 =?utf-8?B?MGYxVHNhZ1I4Njg4STZkN2YrOVlSNXl1dmE0ZWk0ZlVvT0srWlJYV3JsK01m?=
 =?utf-8?B?cmxEVXFFZ0dYYUhHMjJYUmV2Y1VsZ1hRdkNDYzZnc0tuUzlRdUFTa2RvTGVm?=
 =?utf-8?B?YnpFUVN2cEZUYkFsT1B0cjR4VTNUMGxQL1J3Z25TcFBRRzVGVGtZYUVaTndF?=
 =?utf-8?B?a0xsUFBBa3dxTFV4eEVjVUMrSDd3YTFPZ28yNWc4ZU5wTUU3dlNQZ1h1YTNN?=
 =?utf-8?B?ZmRHSFFEeHNqaFg5WVlrdHBIUkRDV3JlN09SSXRUVm9Ya3luSVdXV0I2anBu?=
 =?utf-8?B?SEtVV1pLR2tXNU9PR3dUd3l4R21HZ1grS0VFVmt4QXU5R0xrbUZXY0ZDdmRF?=
 =?utf-8?B?ZnZiNFZ3M0hrOVBBaGlibVRTSUNQK3VhdlhML01HaWFVM0hkLzN6TzZ1dlZE?=
 =?utf-8?B?Rk1rZXdhZHAvR3lrekQyMk91M1NYaVZicVRWbzF3Q2dMSEc3T0psUzBqYmEx?=
 =?utf-8?B?RlhzdHN3V3BvaFBOLzh6VEJYblRSeFJMSEc0ak1UeS9OTDluRzdtSElrYXlm?=
 =?utf-8?B?MHNQeGFnTUVlZlQ2VVR4aUJzUWE3Q0NuV3Z2SnhOV0lmT2ZZalFtODZ5a3JX?=
 =?utf-8?B?cjdYa25DUVMwRFpHaWJwcGRvVm15N0xVS1R5Yy9EWG1FNEhaUThQOCt5N2du?=
 =?utf-8?B?Y1QxaFV0TTJBZy9hcjlkQkhnd3QwYVgyWFZUWVNrSWNmYTlqd3F2Ny81b1Rl?=
 =?utf-8?B?WnVQRThRR1pGc3c2S1NpWGFDd3loaCtuVWpTeFNQRDlHbDBUYUt0Z2NsblpG?=
 =?utf-8?B?S0hRNk12bGRWUmUyV3g4TEt6UHVia2pKWEwwbGw1MHFHQjV2enRxSVBrcmdD?=
 =?utf-8?B?UTBLZC8vNDhNVFFPQ3lIOHZJaURDempUYU9NY29XaHdvM1VET0MyY3hBejVl?=
 =?utf-8?B?N0JzYnc2dEpJblFaTmNNMzA0dmFOR1RTcFlYeUNBZEI5V2pSV1NCT2tJRVFo?=
 =?utf-8?B?SjUzZVlwNkVYMVJyWUo1bjNhb3F4MjQ2blN6TE4zdWZVRHp4MTNEQS9NT0Q1?=
 =?utf-8?Q?/aREpeD/FExeZOGsbbuw5xklk4O6uIzzw5gTWvD?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86016bfb-9f86-4db6-f3b0-08d93ca82ae6
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4523.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2021 15:52:02.2906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SfvVoRPbmqQf8I7Q21xz95hspF2dwaw1/OF7wLceTViSqtKdBK8d3e0+ubdnBxGzwZSiP1pWaQZR2Yxf0JSZjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB6857
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 6/30/21 5:12 AM, Geert Uytterhoeven wrote:
> Hi Luca,
>
> On Wed, Jun 30, 2021 at 9:57 AM Luca Ceresoli <luca@lucaceresoli.net> wrote:
>> On 29/06/21 23:41, Sean Anderson wrote:
>> > On 6/29/21 5:23 PM, Luca Ceresoli wrote:
>> >> On 29/06/21 17:47, Sean Anderson wrote:
>> >>> These properties allow configuring the SD/OE pin as described in the
>> >>> datasheet.
>> >>
>> >> *Many* thanks for addressing this issue so quickly!
>> >>
>> >>> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
>
>> >>> a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
>> >>> b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
>> >>> index 28675b0b80f1..51f0f78cc3f4 100644
>> >>> --- a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
>> >>> +++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
>> >>> @@ -30,6 +30,22 @@ description: |
>> >>>      3 -- OUT3
>> >>>      4 -- OUT4
>> >>>
>> >>> +  The idt,(en|dis)able-shutdown and idt,output-enable-active-(high|low)
>> >>> +  properties control the SH (en_global_shutdown) and SP bits of the
>> >>> +  Primary Source and Shutdown Register, respectively. Their behavior is
>> >>> +  summarized by the following table:
>> >>> +
>> >>> +  SH SP Output when the SD/OE pin is Low/High
>> >>> +  == == =====================================
>> >>> +   0  0 Active/Inactive
>> >>> +   0  1 Inactive/Active
>> >>> +   1  0 Active/Shutdown
>> >>> +   1  1 Inactive/Shutdown
>> >>> +
>> >>> +  If no properties related to these bits are specified, then they will
>> >>> +  be left in their default state. This may be useful if the SH and SP
>> >>> +  bits are set to a default value using the OTP memory.
>> >>
>> >> This paragraph looks more an implementation description than a hardware
>> >> description.
>> >
>> > It of course *is* an implementation description. As Geert found out, it
>> > is important to keep the defaults if none of these properties are
>> > specified.
>>
>> DT should describe hardware, not implementation. The difference is
>> subtle at times, but it is important. Other OSes, bootloaders,
>> firmwares, whatever can have a totally different implementation but use
>> the same DT.
>
> In general, it's best for a driver not to rely on any preprogramming
> done by e.g. the bootloader before.

This is part of the reason I wanted to add these properties in the first
place. I'm working on a board where one version has had the OTP
programmed, and one version has not. But of course, if we set these bits
in software then I do not have to worry about whether the OTP has set up
something sane.

>
> The concept of "One-Time Programming (OTP) bits" adds yet another
> dimension to the already complicated boot chain of dependencies.
> But due to the one-time feature I consider that more stable than
> other firmware, which can be upgraded, causing changed behavior,
> unlike OTP bits.
>
>> Perhaps these properties might be made mandatory later, after upgrading
>> all DTs (at least those in mainline Linux). and a grace period.
>
> Yes, they should be marked as required.

I don't think I can do that without going through all existing users and
defining these properties for them. Otherwise, dt_bindings_check will
complain. I believe (but please correct me if I'm wrong) that patches
are not to introduce new warnings.

However, setting these propreties is not possible for me to do; I would
need someone familiar with their board to determine how the SD/OE pin is
used, and what the correct setting is.

> But the driver can keep on not touching the bits if none of
> the new properties is specified.
>
> BTW, I didn't check the datasheet, but is there a way to read the OTP
> bits from software?  If yes, the driver could use these values if the
> new properties are not present.  That would make the system more
> robust, as it would reset the values (if ever changed) to a sane
> state in case of a soft reboot.

AIUI the OTP bits are automatically loaded into RAM when the device
powers up. So I don't think we need to do anything other than leave
these bits alone if we don't have any related properties.

--Sean
