Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B17C4332F
	for <linux-clk@archiver.kernel.org>; Mon, 21 Nov 2022 08:54:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbiKUIyI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Nov 2022 03:54:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230220AbiKUIxp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Nov 2022 03:53:45 -0500
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2053.outbound.protection.outlook.com [40.107.20.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 107428CF0A;
        Mon, 21 Nov 2022 00:52:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l3gLXvsm9CHpwTQdWKz3Nl2ebpFudCSA1da2Ctm9iJPuzMCZPJzHUBC5HpMMz128tjx8Jn4H79QZqSQeWmWZKP1XhsP1sMk1T/9IeKDat7Vf1Xjs5z6yxNX/qfgv1laKjE73a3jckLPTu4TUTeoTBruTkJX/jCsDmTRh1cADw8Ro3oKSN0EdQkz2z7wd3+g2PklRVpLDtAE2wfirD+Yg6ePBqJ7M3hVUEM/zYhC9RRIc8d5P1aknQM9XeOovO+FRnzaCpxESAB1zh1Tt13NBXGq2pgPU5pFkXrni1CUff8gf0k21a7eSmUdSWm6TutlZN1baDC80RnarQO9osvhTmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tTreSJLnDtuxkFWE6wItd9FdizMoYZBW497AjB5uhgs=;
 b=WR6mfAa1q2uYyJFTgx1tYwTFH8fdO065HYP726lQnxjSo1dA3abeef6YAhKJxQhMhh1lH7V9PdHMUdDV3gyMqOJ0479UKLGGQEPyIP28Y1J9fsqW34p6Hv3LWAq5+QgWm6mGUubjoQxuAGg29u2JvEE8UXisyt3FM8ymd6HC4Kp5XLOCJ004kD1giQrY62z/E6C6EwqV6SlI5nR3MJ/UuZ3MF+RfSCnxmXO355StuPQW0AivfiUPi7ejVICIeInVlxRA7kLaZBEOj5+oLd4E6uHUU/gMda8PflHiyeu78yWuShpptiyFHjMhHQ1tMhO5m6mq6ipxyelT8xilZonE4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tTreSJLnDtuxkFWE6wItd9FdizMoYZBW497AjB5uhgs=;
 b=203OR6CoH9sdEisvwfQ7FoZoS06znIoYnsRQz5qTjFF8wL1LsIBij7P65J0tfvtzqJ02K4SExbRllSE3KSc//xwnxEJfQ+qxWpw30teTuQNQd7SsJqbw5DuCMR94I4waOOtAi9wuAT/1U2SqCkxOuIYGudQb74kHsFw+042WXQZTpnRuM7/Ng9l7XVLj4blES/+mDvS4qxyHu4DhIem3GntfJYzUvWrTtwazYPDK4NaBXZS+3Gy5KOVewhMid4NToU5iHv0t6QBQcyQMxHvlyWJ71J6cTLICyr00GrrRpLzS9r0Vn2ZLBnwRRpeU6Xm9Hmjg9y86RXwhckuaHeh71g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from AS8PR04MB8465.eurprd04.prod.outlook.com (2603:10a6:20b:348::19)
 by DU2PR04MB8775.eurprd04.prod.outlook.com (2603:10a6:10:2e2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Mon, 21 Nov
 2022 08:52:35 +0000
Received: from AS8PR04MB8465.eurprd04.prod.outlook.com
 ([fe80::b69e:7eea:21cc:54ab]) by AS8PR04MB8465.eurprd04.prod.outlook.com
 ([fe80::b69e:7eea:21cc:54ab%9]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 08:52:35 +0000
Message-ID: <c119bd9c-0b90-4096-a988-9d0312c3dbcd@suse.com>
Date:   Mon, 21 Nov 2022 16:52:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCHv3 0/9] RK3588 Clock and Reset Support
Content-Language: en-US
To:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        kernel@collabora.com
References: <20221018151407.63395-1-sebastian.reichel@collabora.com>
From:   Qu Wenruo <wqu@suse.com>
In-Reply-To: <20221018151407.63395-1-sebastian.reichel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0044.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::19) To AS8PR04MB8465.eurprd04.prod.outlook.com
 (2603:10a6:20b:348::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8465:EE_|DU2PR04MB8775:EE_
X-MS-Office365-Filtering-Correlation-Id: a19f0338-ecac-49c8-5de3-08dacb9dbc43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EOU2XLsW1jMv+OlE8Ht40gD7yPQZeTTFUwDDGGtR5Gxu9Wh2+gdLiPOdbIgT6C7qKPuodS94hSyISZ1IwcuDrEis6xNsyKuEpJQkiBt9tQKWyK4B38wPYiUmmzbt8tSKfs9YMGSEd0Owna947um00gLk4CivtmAkA4fK5DYOm+EO88VOCU1zwM4OV4FMMIvqmBRRSikW5uvoJZqq7rVn8gAb5ULJWdVvV7WjQLnb443hX2lb6WGYFbN3Se8BPrnkyftNgmgW8ftT8bOnn9XkfZpVWNewNmEIMtC1JgEHV8MfnqnWRESbYY+cnBkEp3Kcl/mdphENCMpCqPUIRmKRQRDXURKF727mLqw+gqSRGKnZNfZSVQ6Q/bLsqwb1xku4brBhnhvGu9QlLVLvm323DAfe4srMutCemVtOczM4oSQ747na0gcL1M0Dy2j1j61Zzc+AT7vtWgfzHnFb2b8yKd8Sq7THPeM5JFFmAFaznCq3H1uUEHXqu/34sRvacWGVYO0xXV5tj297GkkAKXO2q+l2rS4rkTRhcs/PHy+VGtVKQDsOjJ5wheDeqera+sHUSFVIyOYEs6uh7tLO5/Qfe4cgCWD+UaXDplPZ9PDRGESd+C+oM/VOyOWiTexVJvWdTLOd68YtQf+CQy72Nz4MRC035TcHfc7Mr+qZW8wJBOp5HhAoJVHsWpI7E7/9JaE/Fi4CDmS0Lfo2QEFFRV9knAu9I5P8fnqBOpOP4LB/VQvKF7U+MmOkCaER3sl028t08UZXNk3+OA0yYgva/vZm3LW1dc3fK/7O8bIpg/tLENE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8465.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(366004)(376002)(346002)(396003)(451199015)(6512007)(8936002)(2616005)(53546011)(186003)(4326008)(7416002)(5660300002)(38100700002)(36756003)(316002)(31696002)(86362001)(6486002)(966005)(6506007)(478600001)(110136005)(54906003)(41300700001)(6666004)(66556008)(66946007)(66476007)(8676002)(31686004)(83380400001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1FHbG9BdEs1YmZRRXl1SEhWVzQwTi8rbWxHOXVZWjZWelU0S3VmV1JyTlBm?=
 =?utf-8?B?bDFpbXlOblVnU2xOWnllTXVPV3dhcHQwVnV4aW1zK2JtY0s0SFhqSndQK2ox?=
 =?utf-8?B?V0F5a0N6OTIyeUJnQUNteS8xRW94bUw5LytsUVpCQXZRbmZRQWpqamFXZlFD?=
 =?utf-8?B?eFZmNVdOd0NENUFMV1diV1k2bm9jQXdydTAxeWFxSEt1Zjd1WnlPY3dINnJH?=
 =?utf-8?B?L2NOWlR2VGhJeURObWlVdHZXVVgvNldOM1R5UE54a3M3R1ZQSzhqYWtsSU1C?=
 =?utf-8?B?aFRJZytVYVJweE9jU2pJdHRsTlJkUkZnZFdEZnp6dHovQnQzMUVwcEg4eWNV?=
 =?utf-8?B?R3E3aDRDNEFlcG1NVnlKTDdzZEFqcW41c095ajZ4VmpaakI5L3RmL3RKaGwr?=
 =?utf-8?B?S25jdTUzZjVRd3Q2TnB1ZmUyMGgyaHJmZXJMQVU2MmRTSnZWb0VsbGJoVkJr?=
 =?utf-8?B?ekpLWjhFQ3JhQUZHeklpb0ZMQldNOGxxVmI0WEtvTzROenB3Z2l6bjhDcmNH?=
 =?utf-8?B?VEhMYnQycG1UNGF1dFB4YWROWldXdW5KRW9UQXNPU05RN1kzN0ZCUFNCeU4w?=
 =?utf-8?B?ZlFQTzJDQUc5ODVYQnNkSmdZTkVzOFdqTnExU1ZBVGRqNFJLOUhnWmU2dVNh?=
 =?utf-8?B?RXM0WThFakZaVWtDNjRQSkNxRGMrOHlhWWNudnNNM1V0TkhiZjJYL1FtYi9x?=
 =?utf-8?B?MkhmSWZpRlpNS2trdXZpbGtrWUlvc2ZleGhVTldSQ2RwSHZoWUc5cGRKc3d4?=
 =?utf-8?B?QS94czA5OGc5ZmtIUlFrN25hdnV0cVBvemJmSjVlVEhWcklFd010Z3pFSEVr?=
 =?utf-8?B?YjJUSlBGYmgxSWpDUENmMFVuU2EvMFBDZ0ZyTWlMMm9sajVoWWRXZ2VqQ3dp?=
 =?utf-8?B?c0xqVU5yTFo4Zm8yc0xJRTJmQVlBTFZHejJqSVJLUEd2NG8zQmpwd2hsQU1E?=
 =?utf-8?B?b0wwV3UzRGU2TFQwaWRQWm9vcFVQNkdTdVRoTnFCNWx0OXFITVFoOU4xNjBZ?=
 =?utf-8?B?bEJ0TEU3VjZFQ2ZzRjR0aWpROWFJZGovS2VVT1dvK3gxS1NNcEJScmdSa1E1?=
 =?utf-8?B?UytTbWJlSGM2MUJSSlU5S2s0Q21CZmN5c092cmlBZEdpcVJpRVFkKzNIOWc5?=
 =?utf-8?B?TGVRbXJiMzNvVjF2WmlrK3IvdjFjNTkrbnI1MDFEeU00N0gzNTBOdkFqWk1F?=
 =?utf-8?B?bVBPOWxaVmVDVitwRlNiVmdlR2dGbHE0UDRSeWxneUtyRGZ0RDVnYWlNZUtS?=
 =?utf-8?B?N2Mva2lXM2NzS2ZuYVg0V2ZDRVJKTC93Ykt4QVA3c1QvcXJnSHJLNGJGdWht?=
 =?utf-8?B?Z0pJM3RCTExFQS9hUkZzc0xTcVBlR1NsOE5YT0wvaTVIemRXaFI3bG1OMmxY?=
 =?utf-8?B?ZXc0Tkhpd21vNThsQm8xT0hVZWs5bE8razFkZnNYeDhpN1Z5ZnVFZk9KNHBi?=
 =?utf-8?B?VzdTdWlFR3hZdXVyc09uSUZHQlhxeVdOL1VrbXRFb2JJSUE3NVhjVGRPZVBN?=
 =?utf-8?B?YnlqL09nMGRORHBFSnFNcXlyMXVVbFUyOXZFa2tJTytGeW54cVlPK3JuTDhn?=
 =?utf-8?B?a1J2WmRYSTBPaklCSEhBZGNOY3A0UWRXdEtheFMwN3psVStYNnBEUUtld25x?=
 =?utf-8?B?LzVvcGxaSTBGT1lneGZBbUxmaVVSaFhPd3RJeVJCY3NJSUpKbDUwOTArUWc5?=
 =?utf-8?B?YWhWUnp1M3lvTUZnbW9hVkU1S2lTTWJLWHFjajZ1Q24xVWFBNzA0TUtKU25F?=
 =?utf-8?B?WFNtek1NM01NRk4wN2JRSGl5U3JCTGxkL2Foam1VL3NqbDVJMHNmWnJtbHpv?=
 =?utf-8?B?RE0xdkVzWWlJbVNmZ0VSRFEydzV0NWhqaE1PSXJNdnBBRjJLaDRIWnIzOHli?=
 =?utf-8?B?Q3pDVlVNSlNKVlFSMDRsR0RxelM2QXl1c2tXUXpFZkl2Q1IxYWRIcXExd3BZ?=
 =?utf-8?B?eGNXZk5aNDlnTXpla2FUdmV3Q3VXVHJ4RFUyT0JnMlk3N0dDS281SzhyTG0x?=
 =?utf-8?B?bVdRblhnNTdEM2x1WDA1UG1tWDV2VjlndHBZaWdMZkx5QVdwT3BEbm03SGxq?=
 =?utf-8?B?b3N0V2Z6NmZ0Vmp3TGhXemFUSUkwemNudU5ObmhpVStpTUp0ZEtPdzNHVk81?=
 =?utf-8?B?UHQ1UXliZ1dOZ1l5R0tadEp4VlhMOFJlaGJvaHI5K2s1RnVqMzg0SHlXdVRz?=
 =?utf-8?Q?snESoxfWI9FzhouqCpF9lic=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a19f0338-ecac-49c8-5de3-08dacb9dbc43
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8465.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 08:52:35.6589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3xnTy7mxnneeSWu+Ewa4/wcnbLSF32IVEL9XB5cv/Vt1BoLTVej0kocWdgJjevKA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8775
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 2022/10/18 23:13, Sebastian Reichel wrote:
> Hi,
> 
> This has been part of a bigger patchset adding basic rk3588 support.
> Since that gets more and more out of hand, I'm now sending patches
> for each subsystem as individual patchset.

Awesome work! Thanks for the work to bring upstream support for RK3588.

This upstream work is especially important since the vendor kernel has 
so many weird things and is never properly tested using newer tool chains.

But considering the support has been split into different patchset, is 
there a git repo that I can fetch all the patches and test it on my 
Rock5B board?

Thanks,
Qu
> 
> Changes since PATCHv2:
>   * https://lore.kernel.org/all/20220930153857.299396-1-sebastian.reichel@collabora.com/
>   * rebased to v6.1-rc1
>   * define rk3588_rst_init() in clk.h to fix build warning
>   * add input clocks to the binding
>   * add some more rates from the rate table (merged downstream fix)
>   * fix input of mux_700m_400m_200m_24m_p clock (merged downstream fix)
> 
> Changes since PATCHv1:
>   * https://lore.kernel.org/all/20220623160329.239501-1-sebastian.reichel@collabora.com/
>   * split dt-binding header addition into its own patch (requested by Heiko)
>   * split dt-binding header into clock and reset one (requested by Krzysztof)
>   * use reset identifier instead of register offset (requested by Krzysztof)
>    * (involves adding lookup table support to rockchip CRU reset code)
>   * use linear, gapless clock identifier (requested by Krzysztof)
>   * reword the DT binding description
> 
> Changes since PATCHv0:
>   * https://lore.kernel.org/all/20220504213251.264819-1-sebastian.reichel@collabora.com/
>   * Sync'd with latest downstream changes
>   * Update bindings according to Rob's comments, except for license
>     (no feedback from Rockchip)
> 
> -- Sebastian
> 
> Elaine Zhang (5):
>    dt-bindings: clock: add rk3588 cru bindings
>    clk: rockchip: add register offset of the cores select parent
>    clk: rockchip: add pll type for RK3588
>    clk: rockchip: clk-cpu: add mux setting for cpu change frequency
>    clk: rockchip: add clock controller for the RK3588
> 
> Sebastian Reichel (4):
>    dt-bindings: clock: add rk3588 clock definitions
>    dt-bindings: reset: add rk3588 reset definitions
>    clk: rockchip: simplify rockchip_clk_add_lookup
>    clk: rockchip: add lookup table support
> 
>   .../bindings/clock/rockchip,rk3588-cru.yaml   |   71 +
>   drivers/clk/rockchip/Kconfig                  |    8 +
>   drivers/clk/rockchip/Makefile                 |    1 +
>   drivers/clk/rockchip/clk-cpu.c                |   69 +-
>   drivers/clk/rockchip/clk-pll.c                |  218 +-
>   drivers/clk/rockchip/clk-rk3588.c             | 2538 +++++++++++++++++
>   drivers/clk/rockchip/clk.c                    |   14 +-
>   drivers/clk/rockchip/clk.h                    |   95 +-
>   drivers/clk/rockchip/rst-rk3588.c             |  857 ++++++
>   drivers/clk/rockchip/softrst.c                |   34 +-
>   .../dt-bindings/clock/rockchip,rk3588-cru.h   |  766 +++++
>   .../dt-bindings/reset/rockchip,rk3588-cru.h   |  754 +++++
>   12 files changed, 5390 insertions(+), 35 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3588-cru.yaml
>   create mode 100644 drivers/clk/rockchip/clk-rk3588.c
>   create mode 100644 drivers/clk/rockchip/rst-rk3588.c
>   create mode 100644 include/dt-bindings/clock/rockchip,rk3588-cru.h
>   create mode 100644 include/dt-bindings/reset/rockchip,rk3588-cru.h
> 
