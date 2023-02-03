Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDE6AC636D3
	for <linux-clk@archiver.kernel.org>; Fri,  3 Feb 2023 01:34:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231903AbjBCBen (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 2 Feb 2023 20:34:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231438AbjBCBel (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 2 Feb 2023 20:34:41 -0500
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2071.outbound.protection.outlook.com [40.107.8.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1FBA6B00E;
        Thu,  2 Feb 2023 17:34:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oeH5IM/Z93z+4rBte0n3fZfIYwrG74BAIz5ufPYm8fvjfuHnq743LirXEBRu1hQIu4I1IIz94eqKb8m8hQyWhEnJtTl3rNeh323Sjga1rD3gPDvLErTfZgBgX35Kddh+rt/X0vgOnVzjaU8z6CQ5ixMVrLvAF86LK4gjRTsxJwuqEclf5WKkr9owgDqx0Jfc8k5z5I57or7rM/lCDDyptHIWrRP4tL0gnhWsVsaSoV7u3Ta0lkmO+EHuzDqHFDDWRRHAW/7v0EW4xQsAkFIvCetVVJLm1c7gXG48UVAjliEsuunOZu84tk+dX3oRe8m/ebdcafWGtpsvX1Tlufh3pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a2FQ+/EaAvO5CCOR0IsobEk03Mg07AjpJsyaEweAKjs=;
 b=R7RIFz066emYr0bJ4hQOjN3kohcFzm5wLnJfmzzpIr5EFsttgMXU/xCKM2lm5upjPb1zqob1CG3tiOcdepeoatEPxhr7DgyiIXqoEmUQ+XVYSdKHPXPDNAqAwnTNVmOckWMvedaFgCszJqUuMUWmmey7cQa+iE6otgs8UaREztgykBCRDL63m+x+WM/ZARsgsEoFEUU6O+CxYU3b8KW7MbVSWvBVkVyD84tHwulKcP5pR+x8fF395DnbvtjTajaZ3vCpKqDlpbf9CdeoskEAkaDux6dy5plYvZbzgQe5V4rT+9tb2Q56qUsLutlNk+9YP7g9rd/9lvt+GKDwbQaTEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a2FQ+/EaAvO5CCOR0IsobEk03Mg07AjpJsyaEweAKjs=;
 b=myt8gC80QetMwfXfSeF0DUP63LJJEbcfuyhRpAKcL+TkSi1zY0woTXRBpClXGHzMJphaJUKVssPGlBKoFY8A66geSHVVDaPFzkj64dntg3G4IStUys3fsYU248SvRP/5IiZ9G5apbVKMHB8Ua7JpHFwLdGFWMiEj2fqqyxcFB2vsfF/ZgaonqrDtQiP8VWaCQ4J9D2cg4x3zYBnP0snxzs99janC16798dDwTxIIuzaZddER6cp93bnAJ+siX0KVVw7A6xSSgjKBTNETYG8W3gGzfkhIkwLT15Qq9kuKyV3yHsezzW2mHF6KO4ogm+QdH/h7JuUYiwGs6Jx8pLr9SQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from AS8PR04MB8465.eurprd04.prod.outlook.com (2603:10a6:20b:348::19)
 by DBBPR04MB7740.eurprd04.prod.outlook.com (2603:10a6:10:1ee::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.27; Fri, 3 Feb
 2023 01:34:19 +0000
Received: from AS8PR04MB8465.eurprd04.prod.outlook.com
 ([fe80::5c50:6906:e9a4:5b9f]) by AS8PR04MB8465.eurprd04.prod.outlook.com
 ([fe80::5c50:6906:e9a4:5b9f%9]) with mapi id 15.20.6064.028; Fri, 3 Feb 2023
 01:34:19 +0000
Message-ID: <ed92063b-bb4f-f726-e4a5-16a503226957@suse.com>
Date:   Fri, 3 Feb 2023 09:34:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Content-Language: en-US
From:   Qu Wenruo <wqu@suse.com>
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
 <f3415e9d-ae8d-201b-a9d7-07d3e9bd3bf3@suse.com>
Subject: Re: [PATCHv3 0/9] RK3588 Clock and Reset Support
In-Reply-To: <f3415e9d-ae8d-201b-a9d7-07d3e9bd3bf3@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::23) To AS8PR04MB8465.eurprd04.prod.outlook.com
 (2603:10a6:20b:348::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8465:EE_|DBBPR04MB7740:EE_
X-MS-Office365-Filtering-Correlation-Id: c43f5ee3-5917-4177-2563-08db0586c4bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xRZJ7YBuJUBSHFKGK+JSfmnfLsEoL7XDl7K2od6RlDlU3Uq/W8wNcdRXn2vsGp1CRckXRke9aVvRW2u7rnJ7AmO+Qt6YrOUWFHqjwdo0HXPbcJVIYrtLeS9Wfnn+ZQHjEC/ZphlSpjJfgVZ4i2vUq393anh6gKWsv+jinMq6jVhnjByMgI82oh8FLc75eoLIAP7BvRKIkIPkllouSzn8YNN+zZpQ+rifT4LX6EcdefAxIsstQJ58jwLzBT4b/SBDLV8IJrAPQFycyeIzOdYznQUJPqHN6gmQwKzDoK9QkpGExhx9IrwiiAG6XvJjEQF8SF9y0RmXhW1YBWZA1Am77asBDOGzRWFG+jo3Wir34QnLUiS4Qdsva/+JXTPXvx0uwl1tIPOcMRJGTkaUZQQh7UqMP6PQGgKA8ARue2eRCbhNXpseTYV0kfhtBxYRxFbfMaAkBlahKtFp2UeE2c+5YmelXnCcULUNFbyUALyWy1NgZm0w18UHn+x4gnlnMxrcEG2O25JIboO5XjRlB7ZxrFn1orBFx5N9+jj1adt+6bh4Gie8VX0ehUdBIXYvdzNYDRv0O6mSyrAQwB0MOPykLhaSbkyYqcHnHl4tF2NtADUiRnMnBnY0YIIOIVGQQ4/Fot6bECF8pp0TtmC2ClUAqVNqYYw3DD9/OIBbm41ElQO6TIOo/EqOJWv5kAdpWDVB70aAy0345MVtHOEUVCKi9va/RKXJuHh5i+NDNh5pc+P1LtAT/UML4hjkt/viDpAk4omwmJINe1slKQUlcLtnxXA+L1+iUNQrxYXZPHWb8WRSb0XjCYDnJLPE69sx168y
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8465.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(396003)(136003)(366004)(376002)(39860400002)(451199018)(36756003)(478600001)(66476007)(66556008)(83380400001)(6916009)(66946007)(4326008)(38100700002)(8676002)(54906003)(316002)(186003)(6512007)(966005)(6666004)(6486002)(6506007)(53546011)(7416002)(5660300002)(41300700001)(2616005)(86362001)(8936002)(31696002)(66899018)(31686004)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlFSWm9SZlUzZ1hIOHdIK2tPNTcrbjJWNWkvTXFsemdlMXZoSFNQSFNWaEpj?=
 =?utf-8?B?U0FRbnhvUUJsZjBTeURWY0dYTmRsZnlMQmJITjZBS3JyKzFSU1J5S0NQUUp4?=
 =?utf-8?B?aHk4dTBBeFV6MUVRT3VFSDhTUmJVcklES285M2pOVWE2dzJ1SHIvOHJQbVh3?=
 =?utf-8?B?UzFwZmZNSU9kaGFXQTB0ZndoUjlqWmlrV1J4ckhVaFcvdnZWdE9scnhnQXcv?=
 =?utf-8?B?QmRtUVpPRVU4YkZxb1dnaDJ2bFZBMGNmNnVMQ0NPSE9CZVU4ZVV5THVpUGE0?=
 =?utf-8?B?bFJ1dkQwSlQrN012cVdPWmR4ZXhIZHJKanFvT0F0dUc4R2xJNTA2WGRQMjVJ?=
 =?utf-8?B?cndQd09GRlVnTFFpaG10WEJZV0dsRGRoN0w0VUcrZkQ4YmxtaUhTK04zZXZI?=
 =?utf-8?B?OEpnQm8xbk1Zcm1vT2NLRTNyb3hZOUVJMXh5L2JhWDRUWTUvaDkyK2QrOHd5?=
 =?utf-8?B?YW5KeWxFd3c4LzFHc0kyUzh3U0g0alRoeDhtUm5hSExJT0wxUnhzVENLZGZ1?=
 =?utf-8?B?SGFYeWF3VmN6elppdEU0ZmJzSS9DVXhybUdkb2Y5M2QwNnFYNTZES2EvM2RQ?=
 =?utf-8?B?ZERhbUM5c1Frc1JOQU5MdUI4b1pkbWwrYnRKRGg2WitHNE5UNEFuTnNCekla?=
 =?utf-8?B?dnMrZy9pYkljbm1xeHdmaHVhR2lMNmpZMnAwa0p3aGEwOW1LOEFTemNsR0Vl?=
 =?utf-8?B?ZGlTaW5nRDdvamdCWU00aTJFa2NXczVyZEhramZrVEg5V3pJbDlJZWpRYk9S?=
 =?utf-8?B?czQzM29XbWM0L21rRzYyUnZnWnkzSkowZGtiVUFMSWRGQVl2OW1Kdis2Uytl?=
 =?utf-8?B?VXhsMzc3ZDhGdTRac3p5cXd2U014SWVVWEFOZ29BNUxlakw5QkpiMkJxODcx?=
 =?utf-8?B?ZVZJY1VaZm9NWVcxcnNESmJ2QldLYTVZdWEyZGRmSzUzZitQR0pGZWNvZjJt?=
 =?utf-8?B?Q29JVmZCZFl2UHlKZnkvZ3lWK215UnVXci81bmI1d2hrWTBVVG5VU0l6TW1x?=
 =?utf-8?B?YU1weTJBUXBLaHZlOUtpNzNENnNwRGdnZnFCeGU5aGk2T1paZXhPZGJhR0Vn?=
 =?utf-8?B?NlFvRFl4NnJKNWF6Ui9qN2NrUFh4MzhrOHJmVkdTQ29QVFpzRUZHMERtZzhn?=
 =?utf-8?B?UnM1VXE1ZFFQdFdQck5PUUtvNFo4SU56WWlOdG5UZHR5RzdudnBjZGRYV2Iz?=
 =?utf-8?B?YkREUnhkRERXcnFROXRkWVZkVlgrZVZHOGVQM2g0alcyc2R1MVNnVmJJZy9t?=
 =?utf-8?B?YWZFVVhiSDJ1RzZkQlpxZlc3RUNuVW5icDhxbVRUM0VnQVRhNVVoSHA2ZGNF?=
 =?utf-8?B?OE9Jc2gxQXhmTG1yeHh0N2M1QnZGRHBlTWZVMjM4NXI5MldaOFhIVFluNGNF?=
 =?utf-8?B?cXdMd1JkTW95cnNkZndGanNZVUUzRm9nRWlhUE84Z3VuUFl0NUdYZCtnSzIw?=
 =?utf-8?B?QjN2L1c2K2l0c05CTmZZR1ZPMjI2ODJJUjVmVVRlekFiTHdMd2RQNFk0VnZh?=
 =?utf-8?B?V2VvazY5VUdLRUIxM0dnU3dzcGt2dExyTnZvejR6bWFMS2haSlZsekp3WkVH?=
 =?utf-8?B?TzdJWURiY1R2aUd4dEZUQzl1N1cvcUcrWm80QUtPY2RVZ1hNaHJOLzVFZ3hG?=
 =?utf-8?B?MzVDWVpOTnlteFdXenAwWFpiZVFGRjkzT3l4cVo5WldONXVRVkkyUHdkNUw0?=
 =?utf-8?B?ZUR0cm5jYkQ4Nk9MNFUwRnlqWmNHR3FZSTR2YVYvVXdhNGE0TmFCNDF3cmwr?=
 =?utf-8?B?TXFScERwM0xRL1pSMzBYbzIwZk5FelNiTzcwZk56SXpmTUd3YjJTdzJudGsx?=
 =?utf-8?B?bEU3Z1dFdTRzR241cDJocC9EekhUc2pxRDZ4L0JZOE5JdFFjamQwRktJR0NC?=
 =?utf-8?B?bXJuYmpzS2o4VzVCU2luRlBaVlk3emJHRjFGS1VpMFpBTjRVR1Y0OTBTQ3Zi?=
 =?utf-8?B?d3RJOGVZeS90bGQ5T3dwS2JrSUdwSitjSzNPL0YvYllRZFBmbmYyeWY1d0Ex?=
 =?utf-8?B?eEpUY3gyZWM1eGd3VGVFR0xRMnhqOGNUM1RpVSs4K29mNnlhcEhBSzlhQWJu?=
 =?utf-8?B?V1k4Vjk3L1VmZFpOaWNsUDloaG5BOHFyN091cE0xNlcxdzhXbytIQzVNWE1w?=
 =?utf-8?B?MkQrZndUbklueUE3a0Mwb29lVDNLZ3lKOFM2bWMwYzVkTUZsY2NYYU5RVXBj?=
 =?utf-8?Q?/q7o27w9L4TopH4niffF+W4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c43f5ee3-5917-4177-2563-08db0586c4bc
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8465.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 01:34:18.9509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GO/k1V7VD0Bnym9+O01WxBvfifjLia0hjZ3hT4gcpuV9f99ewncJo04y/SCmoO/l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7740
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 2023/2/2 14:10, Qu Wenruo wrote:
> 
> 
> On 2022/11/22 02:28, Sebastian Reichel wrote:
>> Hi Qu,
>>
>> On Mon, Nov 21, 2022 at 04:52:22PM +0800, Qu Wenruo wrote:
>>> On 2022/10/18 23:13, Sebastian Reichel wrote:
>>>> This has been part of a bigger patchset adding basic rk3588 support.
>>>> Since that gets more and more out of hand, I'm now sending patches
>>>> for each subsystem as individual patchset.
>>>
>>> Awesome work! Thanks for the work to bring upstream support for RK3588.
>>>
>>> This upstream work is especially important since the vendor kernel 
>>> has so
>>> many weird things and is never properly tested using newer tool chains.
>>>
>>> But considering the support has been split into different patchset, 
>>> is there
>>> a git repo that I can fetch all the patches and test it on my Rock5B 
>>> board?
>>
>> try linux-next + 
>> https://lore.kernel.org/all/20221121175814.68927-1-sebastian.reichel@collabora.com/
>>
>> It should boot, but that's about it. For Rock 5B there is not even
>> ethernet support, since that needs PCIe. Ideally the DT series makes
>> it in time for the 6.2 merge window.
>>
>> Alternatively my working branch (I rebase that!) is available here:
>> https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git/log/?h=rk3588
>> It adds PMIC, thermal and cpufrequency support.
> 
> Sorry for the late reply, finally got my extra rock5b to do experiments.
> (The existing one is now a VM host for 24x7 fstests runs)
> 
> [TEST REPORT]
> Yes, I got the expected-to-work parts working:
> 
> - ttyS2 (serial@feb50000)
>    Both earlycon and later initialized console.
> 
> - eMMC (mmc@fe2e0000)
>    The rootfs read write seems fine.
> 
>    The latest code seems to have sdmmc, but ironically I don't have
>    any sdcard at hand right now...
> 
> [PCIE ENABLEMENT]
> Personally speaking, I can not care less about things like GMAC (Rock5B 
> uses r8125), nor USB (PCIE rules them all) nor graphics (serial is good 
> neough).
> 
> Thus I'm trying to see if I can re-use the rk3568 pcie drivers.

It looks like the current code (in the repo) still lacks the dt-bindings 
for the resets. Like SRST_PCIE*_POWER_UP and SRST_P_PCIE*.

Otherwise a quick glance into the vendor driver doesn't show much 
difference in the 3568 and 3588 pcie driver.
(Except the extra bifurcation part, which is not utilized by any RK3588 
boards yet)

Thanks,
Qu

> 
> It looks like unlike RK3399, this time we need PHY for PCIE, and it is 
> already done in rk3568 pcie controller, and the core AIX->PCIE is done 
> by the designware core, thus it looks feasible to reuse the driver?
> 
> But I can be totally wrong, since I'm really just a newbie in arm world.
> 
> Any hint on the PCIE bus bringup? Or what I can help for the PCIE bringup?
> 
> I know RK3588S seems to cut the PCIE3 lanes completely, and droped one 
> PCIE2.0 lane, but I don't know the address for the cut one...
> 
> [VENDOR KERNEL PCIE BUG]
> Another thing I noticed with vendor (5.10.x) kernel is, the PCIE link up 
> is unreliable, causing random reset.
> Maybe the incoming upstream bring up can fix it?
> 
> Thanks,
> Qu
> 
>>
>> -- Sebastian
