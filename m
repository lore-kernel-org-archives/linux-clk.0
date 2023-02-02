Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 865E6C61DA4
	for <linux-clk@archiver.kernel.org>; Thu,  2 Feb 2023 06:10:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbjBBGKa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 2 Feb 2023 01:10:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbjBBGK3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 2 Feb 2023 01:10:29 -0500
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2042.outbound.protection.outlook.com [40.107.241.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C620879087;
        Wed,  1 Feb 2023 22:10:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PBikKJlulQQ3hCN46KbuW9efSopr2jAKNfAbNE6Qm+/uQ4Dy0Ryrt9ysksZ6kVD1Efi0oJc70fNEKFEVC5vF28RXg9rBE3rARjvAFCUngP/z1SkvdEDHML5pRi6MnNSRnfxtp/qMOq5sdxJpFTtOyCjLuqSIvVnHUMR6WkXucde0jh0oXsItnxQdQESP0x2pElYMmggHpVCUiG/1xg+UDVwO00FpEA+y2Y237dAfs+T2v2lyqqeVPJL3DrzWz7739JpTcPT98uSS/q6odEpZZxpLpR2xDHngHrjlu6Dq0VOeTjhheL9FDGDnPrD/ayX08ebwPRGTe5Jxg/oTfHHEkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8YhrngJHKy8/Y5LDhKkCR9UwbpbCVFNP7MS2Cqj5kY=;
 b=OBQW3CboQgFeoGZbUvXFVi4y3ep8CTpd2plRvqM3XWyq8i1TrqPY3tZF7VJigFYQF/8IzldmXpqDk9/GKCnBGwKcplQrN7nF99uERiOZ5k9TWlsRNiAyVJ19bpksrfUxfcggqqVqinhl1Nai0AQBXWaphB3DHA0PjLYCCrPnREQ1GnHrNHDu7dnfXHZISILImL7w6UqGXcXJCkACIG8t0sizd52uQt3ZLvRxJiwPUWjCS7HHk49YCsaAebKwtlRz87nE73264noKV2vXMkajmz2SChap9bLK2EJ4lViwxnzWahaT+2w2vNrggVJy+IMG7l3qAmWwgVEdxDwcd44GhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8YhrngJHKy8/Y5LDhKkCR9UwbpbCVFNP7MS2Cqj5kY=;
 b=RqyQ85afuL9shprzKhUinVRci+yEYiPAUIXTdNqfgJDHd2fEZA+lQHYuNvBnjBmLalzGLoeA/1dWiNxan7YlhUSITGajqwsrZD4EM7VrKG2sDrag/eF1ls5pNjcLnOTeAbDUnaGbat2oHgsOQWVNIO4OkTII+Y/FJCrCzAdbAZm4Y7Obw/tknF3isOM37ENSAQjTTJ+akYVqlBqnLuuxt+PBFP3B8y2GRQtnMDdeSF4LEBZu9Buf+l01I5ly0ZDjx16Ec+cNkOxuu/Q7OLO1QUIas3N0rrV18rCqSPNCHOK+StPfMjKC/FLLyQJQk/78S6j9iMRl+9+LtVUDRPtaVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from AS8PR04MB8465.eurprd04.prod.outlook.com (2603:10a6:20b:348::19)
 by AS8PR04MB8993.eurprd04.prod.outlook.com (2603:10a6:20b:42c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Thu, 2 Feb
 2023 06:10:24 +0000
Received: from AS8PR04MB8465.eurprd04.prod.outlook.com
 ([fe80::5c50:6906:e9a4:5b9f]) by AS8PR04MB8465.eurprd04.prod.outlook.com
 ([fe80::5c50:6906:e9a4:5b9f%9]) with mapi id 15.20.6064.022; Thu, 2 Feb 2023
 06:10:24 +0000
Message-ID: <f3415e9d-ae8d-201b-a9d7-07d3e9bd3bf3@suse.com>
Date:   Thu, 2 Feb 2023 14:10:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Content-Language: en-US
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        kernel@collabora.com
References: <20221018151407.63395-1-sebastian.reichel@collabora.com>
 <c119bd9c-0b90-4096-a988-9d0312c3dbcd@suse.com>
 <20221121182836.kwkbnonulcwfzbg4@mercury.elektranox.org>
From:   Qu Wenruo <wqu@suse.com>
Subject: Re: [PATCHv3 0/9] RK3588 Clock and Reset Support
In-Reply-To: <20221121182836.kwkbnonulcwfzbg4@mercury.elektranox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0186.namprd05.prod.outlook.com
 (2603:10b6:a03:330::11) To AS8PR04MB8465.eurprd04.prod.outlook.com
 (2603:10a6:20b:348::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8465:EE_|AS8PR04MB8993:EE_
X-MS-Office365-Filtering-Correlation-Id: d1ba741c-0ed3-4a50-6f0c-08db04e42bcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3eNZHmrGgLDZKlvxWpq89uhbpcJbsphqK5S8cXd25BxPNC2urWvta0Cl1I17LvvtzqKRzqseF+XeaZ5rCOdAAKLJI+3ySp4J2xl1lUIFOPI388xvGHfE52M7EhkC5g37AfdLhGIV5gbUiiC3RRfXynO4LWGHT8UMOFJuRVk/ck9Dh+ZW0/wdabeiZUq0w7AjeA+49pGoD6iF4Ca7PYmnn6YhS3QRq1pqnB5jlpsPKNa67CdKQTFiWQDgnnw6mikM0md7qVyRouVPmAxuUlbItmB/UCLhTGvhnJMfYjylbAJbkWXtF9P1QpHymZKOKckQPPquueudr+0c9ckRg6GlxUQOrH0hNeKOQOww0us4LI2m5a5HKJiW1yfxwn1oie7HlUAg5GEN3zEJKVLEg9B/OuZbTlIz8Zxy+R4tONY0LIj8XKie+hDGxgxuLm1thOX7GyrunbOlQQopud2irLbp8rZmWx9uTXfEDmC8qV8bEVzL5unjjQnbcUjjj/wSgcmkttmlAcjXV2cI1RTVD27Ku7HnB+JQpBOxmTJjmrAAgyXexhsRzv74E9mPmeOOleeEPLQ3lGt65+RT1fvVkZzVfjNbGrROhVVNdPE3QdLgN1RNYws6tZGjwi+v4EOkmnwRq9fohXTyX6/mJSVeT+zaXHRqvEMrPJxXV/AYXvIWcbcVle/kCqKx2EU0pwFVUFSRYCBDYrscGXAeyNCsPMA8iu3JMEcJ9SsZEPblODwow4RoxgWhEtuRfSm9IciPpHrWznVmMl/30KJJPhgy0TNrnlDoC15hsb0F4wpvc4LfED9140b+tgoGnndzJ2rYSe8G
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8465.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(346002)(366004)(136003)(396003)(39860400002)(451199018)(7416002)(31686004)(2906002)(66899018)(41300700001)(8936002)(5660300002)(31696002)(4326008)(316002)(2616005)(83380400001)(66556008)(66476007)(6916009)(8676002)(66946007)(54906003)(86362001)(38100700002)(36756003)(6512007)(6486002)(6506007)(478600001)(186003)(966005)(53546011)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejJ4UHA0dnZkcDY0eGxSKzZ2LzFhOW55ekdFOG9OcGNBbDFhMW05RzgvNlZL?=
 =?utf-8?B?cHBKQ0twb2NpdkFCUkluZ1NXTG1WNitnUzFqa093OVkrYmVXRVdRRGZRWlV5?=
 =?utf-8?B?QkI5enZDTGlYREowTFp1TjgvblBocVN6OEg3QUtSM3VKRUMyUnhzSElDejBH?=
 =?utf-8?B?Zy9WMURCODlDdzFldkhBb1RQK1A0eElIZUNlVFh1YjhXMlIxdG12d0ZjQmZD?=
 =?utf-8?B?M1owWmFORXdKNTZOYi9mSDQzUGN3aGFQNGdJQlE5OVV6UkE2ZEJGMTEwb0R4?=
 =?utf-8?B?SXpHMlM5VUdHeUFHSmg1N1drYlBCc1k3cFkxTko5emIrWGNsUGJiMGRmS1V5?=
 =?utf-8?B?LzFCMm5acWVwcTJDWitrV2c0SXlFSjM2Um8vLzMyTGg5MnVyWEdSV1NmMXdp?=
 =?utf-8?B?aFo3T0JwcGYwZ0V4Y2txZktKd0k3VU5rL3gzWko0eEYrZWgwcWlYTCtuNnJG?=
 =?utf-8?B?TnNyRmdveHpqdHBGdnR3eVRQdTJ2MHFkZlZDUThUQkdwbnVwVmRsSHhsTHZN?=
 =?utf-8?B?cHhSQmJ0QW4xZ0hmVzhQU1c3VE9Rc1BRVHVoYVRTY2FpLzUwZ2NFaE5XbzB4?=
 =?utf-8?B?NzNiRTBWWnJnQ1Q5by9iRmxjcWQwdDQrZlhMZlJxR2lneVFrcTEyMmpORCtN?=
 =?utf-8?B?ak4vWFJKcWFuZDZqbWRtWkJGSEorQzV2a0J4ZVU3RVNReXFFQW1FV0w1K2ZY?=
 =?utf-8?B?ZG1mUEdxUUlXL1Nsc2ZiRGd6V2hyYVNjc1QyekZvQUlzb2RQdHJIaEdsYzB0?=
 =?utf-8?B?RzQ2YmdYbXpma2pYTVJqT2VhSjB4QVNIU0oweXNMZzdiK2pVOHo4UG1ZbWZX?=
 =?utf-8?B?ZUdZNmlkb1ZZVEVXL2h4b1V6cWNSWDlOeEhJamdxWTRocGVlcG03WTFjTjNY?=
 =?utf-8?B?WXJjdnh1R2tSWDdjdTJFYW9MVUZLaVRtV3Byb2tVWTgxdjB4cEhQU2V3ejJ5?=
 =?utf-8?B?Tm10T0tqTmdUaWVIeEQxSnpRS042SHpHOW4xVlZ5ZnJxSmtZNVVCZFhVajBv?=
 =?utf-8?B?eUJSYm12N2RlUkRoMzBEaDg5NTBCRCs2a2c1TzFvM0U3WVV3cjhtZTRkdHJu?=
 =?utf-8?B?R0pGbVhKSC8rODQ3Wi9KcDFaZHBqeHQ2S1RUZnBuL1QxZCsvNHh5VGpicER6?=
 =?utf-8?B?THp2UEVvY2Z0d3A2WWtraFozeWZYV21SOTZpblBDWEUzcnVKNTJmZGx6QzE2?=
 =?utf-8?B?TE8vdTZRSUtzSjBQYUtjSnQ5SDVFYW9jZHpiSkVBYzBETGcxOHRidHJRMVlq?=
 =?utf-8?B?eUcrcDBjOUIwOU5MSmU3NXBJYWRRdW9kRlN5TDhmNzViSy8rTDFQSlhCeW9s?=
 =?utf-8?B?Tks3aUhxckRVczhKdUhMcHV1bjB5SG9TaDJwV2ZsRXFFOW9NaGZOU202R2Iv?=
 =?utf-8?B?Vk1Da01yeVA3NHFhTVRERzVrZzRrUjRacmQxalkxeW5EemJFdkF0a1FEMDkz?=
 =?utf-8?B?dTZRc3Rva2RwSEZVWG96aFJkYldLSmRuWmIrT05XbWFDSU5uZzBqWXhRYnFC?=
 =?utf-8?B?RlhjRWRJd2UzMmZNRFJnaEZxRjhHUTc1aG9TSjBET1l4OW9Hd00rTUgybkli?=
 =?utf-8?B?VUJvZGhSTVFuK2VLenBKaXlnMnUvTDhDemZXVmNUUzNXSVNmWnI3eHFEWEVT?=
 =?utf-8?B?UWdGOC9UU3VzWEtvV2dXY0ppemltektwK1UycVUxMDRpV2FOMnpIc29kd1lU?=
 =?utf-8?B?YmJSTHZ1M0pIRGVJZEhIM05wS1ZkTXRGZlA1akZNdEpCVVIxdUtaQjh2SHhy?=
 =?utf-8?B?VFRtUGthWm9GOU4vYlp3aEg0Z0NaUkRUSXgwajIxa1pteExvK0RyTmhVQkJM?=
 =?utf-8?B?eHlKaXpubi9LMkVrUGdGNE9OTG1XWTFsU21OemlhUHphbXo4azF2WFNwVEVW?=
 =?utf-8?B?eEV6YnJnMkk4VDU5TCtYRHpsMldoTHc0VWlSOGZsT2IxQkFJQ3psSnVUSzA0?=
 =?utf-8?B?QjVIWHpIZHlmcU8rWnFud3NzL3pTZE5BTXMyVkNVVVRjbERFVVRwdktiYzFo?=
 =?utf-8?B?UENiMGRzbXhXdGdwNlM5eVB4V01mRkhsU29aL2ZoK24xTGZyZXVSa0RkM0JP?=
 =?utf-8?B?MVVUS1dxOVBiL3RWeXdpdVllMjROcFlGTSt4TTBHNTVJTmRGOElqYTQxM0Fk?=
 =?utf-8?B?NVI0SHJnWERtdzRXeVgrY24zeEFHQkM5ZXo0a29CNmN3STJsTjFVUmZPQ2R0?=
 =?utf-8?Q?yAG71DDSMl5YQKyIEQ++4lc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1ba741c-0ed3-4a50-6f0c-08db04e42bcf
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8465.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 06:10:24.3858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HQIe/XDlalhri9w62sUQqv+cWKIEDa2RuqKyFpPOr/rTFo6lze8pm7pvPiHhrTKj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8993
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 2022/11/22 02:28, Sebastian Reichel wrote:
> Hi Qu,
> 
> On Mon, Nov 21, 2022 at 04:52:22PM +0800, Qu Wenruo wrote:
>> On 2022/10/18 23:13, Sebastian Reichel wrote:
>>> This has been part of a bigger patchset adding basic rk3588 support.
>>> Since that gets more and more out of hand, I'm now sending patches
>>> for each subsystem as individual patchset.
>>
>> Awesome work! Thanks for the work to bring upstream support for RK3588.
>>
>> This upstream work is especially important since the vendor kernel has so
>> many weird things and is never properly tested using newer tool chains.
>>
>> But considering the support has been split into different patchset, is there
>> a git repo that I can fetch all the patches and test it on my Rock5B board?
> 
> try linux-next + https://lore.kernel.org/all/20221121175814.68927-1-sebastian.reichel@collabora.com/
> 
> It should boot, but that's about it. For Rock 5B there is not even
> ethernet support, since that needs PCIe. Ideally the DT series makes
> it in time for the 6.2 merge window.
> 
> Alternatively my working branch (I rebase that!) is available here:
> https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git/log/?h=rk3588
> It adds PMIC, thermal and cpufrequency support.

Sorry for the late reply, finally got my extra rock5b to do experiments.
(The existing one is now a VM host for 24x7 fstests runs)

[TEST REPORT]
Yes, I got the expected-to-work parts working:

- ttyS2 (serial@feb50000)
   Both earlycon and later initialized console.

- eMMC (mmc@fe2e0000)
   The rootfs read write seems fine.

   The latest code seems to have sdmmc, but ironically I don't have
   any sdcard at hand right now...

[PCIE ENABLEMENT]
Personally speaking, I can not care less about things like GMAC (Rock5B 
uses r8125), nor USB (PCIE rules them all) nor graphics (serial is good 
neough).

Thus I'm trying to see if I can re-use the rk3568 pcie drivers.

It looks like unlike RK3399, this time we need PHY for PCIE, and it is 
already done in rk3568 pcie controller, and the core AIX->PCIE is done 
by the designware core, thus it looks feasible to reuse the driver?

But I can be totally wrong, since I'm really just a newbie in arm world.

Any hint on the PCIE bus bringup? Or what I can help for the PCIE bringup?

I know RK3588S seems to cut the PCIE3 lanes completely, and droped one 
PCIE2.0 lane, but I don't know the address for the cut one...

[VENDOR KERNEL PCIE BUG]
Another thing I noticed with vendor (5.10.x) kernel is, the PCIE link up 
is unreliable, causing random reset.
Maybe the incoming upstream bring up can fix it?

Thanks,
Qu

> 
> -- Sebastian
