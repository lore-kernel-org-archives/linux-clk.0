Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55C1CC11F67
	for <linux-clk@archiver.kernel.org>; Tue, 29 Jun 2021 21:41:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 233CF61DA0
	for <linux-clk@archiver.kernel.org>; Tue, 29 Jun 2021 21:41:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235162AbhF2VoP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 29 Jun 2021 17:44:15 -0400
Received: from mail-eopbgr60070.outbound.protection.outlook.com ([40.107.6.70]:11158
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234343AbhF2VoO (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 29 Jun 2021 17:44:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YJprNxVAk7o47ChkDgfMwDuQmcR1jSTTk7izM08rQNmWne1YyIa/W6pzyjuO4hRNG+RgRfa7plDdDzsqxWaiQ7NPQDpZbbctLsHOTIdiasqlYqhCXI7AuMgNPKSQyN7YIk5Nw4hf47y75oOIBg3lki8H20Rv+z32GZ6q+PD/7IZWxz66GJpJSXpr+aKp3/ZdMt7AxYiDTGHT3bQQw1T4bmkcWtPoWaaBvTm/ykOdI1sDSg0Ubonw6puyA6/4adJGay9nUuyfwIf7yLdTYIF6aUmUpOv4scZu6zLJ5jZByjTm5ayhPEyTsNiADdju4DPewF0wMZcr52EuDZQ+Y685jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ke25K1tiiKuU3ySdewzaxNw9zWuTBPftH2RaRjIqyzs=;
 b=cU36QkL5dSzzDVlqFM/OtP3+Wt8x2+Jl1SPkmLlF+PZQeNQno1QQiYvw+z4fkru5e4FtBNgAk5AzC8JSeDNXzOb+OAMFPbqiCdZaUoOgAjYBnmt1dNd7fvrTbf/ev/SAqVT/Gyo581k1MKEpbqWDgHWd72A6buJSTlaSI2QI0LnNi1O2g43lTv8Wrzap+a4I2nwnb8HF4HSdW/irSj06lSMAbfD4ZA0RdSJszB8+m9hsmXgwaBMwaWCuDB0/F4nEUbv64IwvbUJv1SpdvsPRFkaeQSplZqXRmpqSTW3zcjGIUu9f4Z+yDbZJ8TMPuOeF1BIJO5YVqkgeC7rvxtlNug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=secospa.onmicrosoft.com; s=selector2-secospa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ke25K1tiiKuU3ySdewzaxNw9zWuTBPftH2RaRjIqyzs=;
 b=usXppLMcPnsbvCF9iX7WJNiWpobb2lX+95V0NLDYT6uauReuacnYF46laonPM0sEzj3VnxCsswWPQJOA5/ba4IJsE21OrwaAFn0S8d/hRfPGghuQowsdoPWRkxY/IgY6RnT13WlWVrx51BcZaBHRu5cMvlvPlBEIa837ySDo+pM=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
 by DB6PR0301MB2437.eurprd03.prod.outlook.com (2603:10a6:4:59::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Tue, 29 Jun
 2021 21:41:44 +0000
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b]) by DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b%5]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 21:41:44 +0000
From:   Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: clk: vc5: Add properties for
 configuring the SD/OE pin
To:     Luca Ceresoli <luca@lucaceresoli.net>, linux-clk@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Adam Ford <aford173@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
References: <20210629154740.3091884-1-sean.anderson@seco.com>
 <9edd6194-3a71-4f31-dd39-ba831e00b9d8@lucaceresoli.net>
Message-ID: <3feea852-cd59-520a-ec60-5dd1c1c7a824@seco.com>
Date:   Tue, 29 Jun 2021 17:41:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <9edd6194-3a71-4f31-dd39-ba831e00b9d8@lucaceresoli.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [50.195.82.171]
X-ClientProxiedBy: BL0PR01CA0005.prod.exchangelabs.com (2603:10b6:208:71::18)
 To DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.1.65] (50.195.82.171) by BL0PR01CA0005.prod.exchangelabs.com (2603:10b6:208:71::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend Transport; Tue, 29 Jun 2021 21:41:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 307e81b0-5489-444c-57a1-08d93b46b0a0
X-MS-TrafficTypeDiagnostic: DB6PR0301MB2437:
X-Microsoft-Antispam-PRVS: <DB6PR0301MB2437D2989DE191FA3F8F8BF596029@DB6PR0301MB2437.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1CmMrR8W3stfZS5V48n0pKnr1QSJ3ffgjAptLcMBVOZdieL7q0UDTNie3c6JGpnX3KQ0lb2cmVjDJkD7AKD8+JxfCs/o4umr7BZ6f6raKbZ45CQFZvJYvoZ5sqTvP9st/7wx2eO64wuRLRf1pWDhaBaH+KBawgdx4tBrdgRC6gWYh1k9gYqXilohCKVg2W3ffoslU1+NAe7Dx7KKCTPYfsVOgGyQ6u/OEQV7z7DJViwsSA0kos0khOEEZKSluhD6L25SmH2UHJ3cfzHO/uLy3gv7iYyFUaHX4ZzQmN1n367k3+Tc1WOPyAE3Nu6Fd8vhpLhs8NiGmnZy0WOeqD1An6VHp5ANbJ1wJz/WmPrd/mete9vlDIwuH5JFlBBLwpLQVC+vHbe5b3MHHuItRyWAIqtXrWz/2/e2bmWFkxt0ogV0tITNJD5l2xHkAqcP76nE7JR3w3hj2OMNb9q8rypTSjz47dh/hYqcwxMnLownRgCGA+JmV1mCmVcv3oMKatEJdmxOZn0ZRkV8rQZXn62oRMN0PAIvh4En8d1bVdKjML6lTQ/BQYLYtO/tvkVpZ84snOAXC8OwJ6ANwnJd0f2OKCZ1ucYt3L20w17+xTHxQvZ4GKX1MBfFiK0WibLjmaZSg04giBkk3sdYFNKu1+R+egmLLYuDxJdEcMw/J1nyn8wbys0KyJxJOf5kFMGsuxJEFNE7nkpHopQMPpEytCPMfLhibHTs4J+StZndvExnyKxMdEwEYc+6DInCYD3a/s6R
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4523.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(39830400003)(346002)(396003)(366004)(136003)(376002)(316002)(16576012)(2906002)(5660300002)(52116002)(83380400001)(86362001)(54906003)(31696002)(36756003)(8936002)(26005)(4326008)(6486002)(478600001)(16526019)(53546011)(38100700002)(38350700002)(44832011)(2616005)(66946007)(186003)(31686004)(66476007)(66556008)(956004)(8676002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHhDWGdodzdxWjFDSEdzbnZDN1JFS01UcUQ0aGxVa1RUVkQ2QWlnUm1JVFRY?=
 =?utf-8?B?TnRiVXArN3c0enpzZ2VNbmFKWEwvUUJkK3lGZXNySFVPNjVTYmdRK1VhNFVB?=
 =?utf-8?B?NzFwbE1sV0hrT2JOS2ROaFVrWWoxcUkxUjBKcWhPTVU0M3pCVlE4Z3I2L0Zq?=
 =?utf-8?B?VktFeUUrWVZLQnh4OS9haG5xcENQQjl0YUYwSGhDSGlyRld5dW1FZEp2Tjc5?=
 =?utf-8?B?d2dzSTdFRmtSUUZRdWliSDMxNHdrN1BjYkxNTkhzUFhMa0hnU2hJQ3pNQ2Rz?=
 =?utf-8?B?V2VzMXZYNlFUOWh3eHRQR2xiQ3JCTWg3NEZoazFLWTY2WExETGhOQzRSMEhV?=
 =?utf-8?B?WUZxNis3aHNCc1htMzZzcTdtY2pIVjMwMk9EOW92V1ZOS28wUkx5Y1FiTksw?=
 =?utf-8?B?MWMrekk3TisxMWJxRm5LMGxqTXh2dXRMa2l4YmZpUlF4cWRmaXgzUlhid0x5?=
 =?utf-8?B?VEE2bW42ZklSZTlxbnJBNWVTN2N5SFBDKy9BeWE0U2I5QWJaT2JIUkUzUEFu?=
 =?utf-8?B?ZFBNOTBqczkxZTdKbGhLMGRzYUtvUi9TSk1zMDFTOWRvMXRJOWhSOVh5VWd5?=
 =?utf-8?B?QkY5ajNSNW05WEJEQ050Tm1wVW9ZV1J5bTN5L2dzZEtidWxlVzhiWVRtNnRS?=
 =?utf-8?B?cmdqbS82VmxydzdvSWZuR0RrQ0RYZDYrK0w3QzlXVWI3aW5xTW5JMFJreDh5?=
 =?utf-8?B?YllvaE1Xdko2dGQ1Zy9hUjNTWFBTdEZBanRUV2VmRnV1d2xhL0U3V3BiNk1P?=
 =?utf-8?B?YTR1TjFER211WldYQnJEVWtUKzlEdXYvRndZd2RVemhNRi80S3ViWlU2OUdh?=
 =?utf-8?B?TWwxVkQxVkFTTHRvb1ZNQmw2REZHaEdJZW8ydDNBNklvSUhmcERVc1hkaGhq?=
 =?utf-8?B?SGhySk14Tk1aeGtJMWppdTRPaGJNWTNKZXNJQXRDTHU3RGdqSCtFTzNkYTky?=
 =?utf-8?B?TVhORm1hNzdkaE5MN1YvMmJzcE0vK0pQRVhkQUZ2VXNhbmlXcklqdVNSanAy?=
 =?utf-8?B?QnNyL25sOVUrU3VoUDNHOXVsT3BhTkk0UktSS3dmbU0vQkIxQStyQlZHODlp?=
 =?utf-8?B?dFpJUXF4VFFoekFmdWJodWhrMEJFeWw0OGlaSjFNQnY4aGxrK3BHMnBDL0p3?=
 =?utf-8?B?bGRsYVJkaUdFNTl2eXJhNEExekY1U2xGcURjYnltS281bGJlTTFlbWxOZ2wy?=
 =?utf-8?B?Nk9EUkRuVlYvWjN4YXZaN3ZlRHYzdmJwRWpPaTZuS2grVE5kcEZWMnkxOTNu?=
 =?utf-8?B?cytyNDZOQW96ZmVjd2RNUzdHTUFrZXErbmNZeTZsb2pFaDAvbmVJQ0pZUVA2?=
 =?utf-8?B?UzZzOEMyRHJDK2dYSlJGS2Y5TUk1WE5lUHZDcDBldzA5Nlg1eGQ4S0dWa2Np?=
 =?utf-8?B?b2NiSGQ0eVExWU54UStWdW9mdk1hbW5ScCt4MnlMWDdvS2pPanpMNFRBMVNr?=
 =?utf-8?B?U0lVU2U2T0c0TDJwUDM5OE1NbGo4cEJJY3BVSFlXWkw4amw5alhTeTVaOTYy?=
 =?utf-8?B?aDJpc1RhV2s4emxpalZCR2RiVDZhQTZnNm5RQlM4NTFwVUgzcFNjTGFORUdZ?=
 =?utf-8?B?dGxkbW1LN29HYjNiWGR0cmFuK201OGpqZU5SMFZLMFE4QlQzRWhEN1UxOC9G?=
 =?utf-8?B?WCttbnhyQXJMeEwrYkxBZTUzdFhlbm44ZzlYT1BBT3dRaW1nOWZHNnJacUdp?=
 =?utf-8?B?eVJSa1RmUGFlelZzektmSkVaK25sdHIrWTNNa0NPLzVLTlRhTUVOcDZqaGM5?=
 =?utf-8?Q?l7pyV3FHURKsOUqRF5gADY4pay5LSf68SRFrEVh?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 307e81b0-5489-444c-57a1-08d93b46b0a0
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4523.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 21:41:44.7583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mL/uGyQNqGupJMCAU/4GnMdULhezzkjB7RjpvD/3B9bN4Sh/tB2k9wtOBGoKcjkq1NLAIyPE+83kePfn8/0EPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0301MB2437
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 6/29/21 5:23 PM, Luca Ceresoli wrote:
> Hi Sean,
>
> On 29/06/21 17:47, Sean Anderson wrote:
>> These properties allow configuring the SD/OE pin as described in the
>> datasheet.
>
> *Many* thanks for addressing this issue so quickly!
>
>> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
>> Acked-by: Rob Herring <robh@kernel.org>
>
> I don't think Rob's ack should be present, he hasn't approved _this_
> version of the patch.

Sorry, I was unsure whether I should keep it or not.

>
>> ---
>>
>> Changes in v3:
>> - Add idt,disable-shutdown and idt,output-enable-active-low to allow for
>>   a default of not changing the SP/SH bits at all.
>>
>> Changes in v2:
>> - Rename idt,sd-active-high to idt,output-enable-active-high
>> - Add idt,enable-shutdown
>>
>>  .../bindings/clock/idt,versaclock5.yaml       | 44 +++++++++++++++++++
>>  1 file changed, 44 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
>> index 28675b0b80f1..51f0f78cc3f4 100644
>> --- a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
>> +++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
>> @@ -30,6 +30,22 @@ description: |
>>      3 -- OUT3
>>      4 -- OUT4
>>
>> +  The idt,(en|dis)able-shutdown and idt,output-enable-active-(high|low)
>> +  properties control the SH (en_global_shutdown) and SP bits of the
>> +  Primary Source and Shutdown Register, respectively. Their behavior is
>> +  summarized by the following table:
>> +
>> +  SH SP Output when the SD/OE pin is Low/High
>> +  == == =====================================
>> +   0  0 Active/Inactive
>> +   0  1 Inactive/Active
>> +   1  0 Active/Shutdown
>> +   1  1 Inactive/Shutdown
>> +
>> +  If no properties related to these bits are specified, then they will
>> +  be left in their default state. This may be useful if the SH and SP
>> +  bits are set to a default value using the OTP memory.
>
> This paragraph looks more an implementation description than a hardware
> description.

It of course *is* an implementation description. As Geert found out, it
is important to keep the defaults if none of these properties are
specified.

> I suggest something like (possibly better rephrased):
>
> It is recommended to specify the two properties that describe the
> hardware. The lack of them leaves the value unspecified and thus opens
> to the risk of future incompatibilities, depending on implementation
> details.

Ok, so if I understand correctly, you would like to deprecate existing
bindings which do not specify any of these properties.

>
>> @@ -64,6 +80,34 @@ properties:
>>      maximum: 22760
>>      description: Optional load capacitor for XTAL1 and XTAL2
>>
>> +  idt,enable-shutdown:
>> +    $ref: /schemas/types.yaml#/definitions/flag
>> +    description: |
>> +      Enable the shutdown function when the SD/OE pin is high. This
>> +      corresponds to setting the SH bit of the Primary Source and
>> +      Shutdown Register.
>> +
>> +  idt,disable-shutdown:
>> +    $ref: /schemas/types.yaml#/definitions/flag
>> +    description: |
>> +      Disable the shutdown function for the SD/OE pin. This corresponds
>> +      to clearing the SH bit of the Primary Source and Shutdown
>> +      Register.
>
> Saying "Disable the shutdown function" leaves a hole, it is not telling
> what gets enabled. I'd rephrase using positive logic:
>
>    Enable the OE (output enable) function for the SD/OE pin. This...
>
> But there are too many "enable" words in it now, it's confusing, so why not:
>
>    Choose the OE (output enable) function for the SD/OE pin. This...

The issue here is that the OE function is in some sense always enabled.
So perhaps a better wording would be

	Disable the shutdown functionality. The chip will never be
	shut down based on the value of the SD/OE pin.

And for enable-shutdown

	Enable the shutdown functionality. The chip will be shut down if
	the SD/OE pin is driven high.

> And change correspondingly the idt,enable-shutdown description:
> s/^Enable/Choose/.
>
> Also it would be nice to declare in DT that the two flags are mutually
> exclusive (same for idt,output-enable-active-*).

Ok, will fix in v4.

--Sean
