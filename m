Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE1FCC6FD18
	for <linux-clk@archiver.kernel.org>; Mon, 24 Apr 2023 02:52:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230312AbjDXCwd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 23 Apr 2023 22:52:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjDXCwc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 23 Apr 2023 22:52:32 -0400
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2040.outbound.protection.outlook.com [40.107.241.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAD5910C8
        for <linux-clk@vger.kernel.org>; Sun, 23 Apr 2023 19:52:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CJZKw9e3Ps5hR7+QfAWlAElHVGxyHbbt/KApTPWMeoa+mZTZUMk/2R6Uafdz1TCo1GLO+etmX0hw176uTJv5uh/ItYZhrVjXJ5qp69l5fkvBXwRWMxkcTb+Wx/ROsHfVSwaDGMbPVPxuRaaNxWvZMLu1/7Q3o4w/aVG8XjyPeqWKQKqRhfvdlWOOowMTXwsahd0rvyJZo+anmQPGUYqhykL8dRq6mVWi+HIhfH4cWDJJKJz22mM6go9u9oqsMakNN0f4IAJDkDns6FM9nFe0fnKDufddB/fj7g2Qs/nenrqxf+EzB8MSkga/BSCa06reC+cUDxldvu2jFPvAJ02fzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AtYdO1CxVjWbkEtX3vPJGZ7rkNudeVMsPgM9oZMFOHk=;
 b=cu6x8XHi6IeK8fF2UZLcXDKIglN6kT7MzXsbfpVjdEWaXTcEcx1MryPbd4O/phXMZkmc3uHuqSBTuvS1/3y9WoOdkncp7T1zYZJLibXyC25k7jtvOGhV7UKz+Pj7wtkRmMBKthPu3TWjx4cX+7lnyMHlzmrR1WcRikFVx96VYsofXBO6Qh7+l01QdC6KCgs3kIuWdI6qebG/llphkevY6Ng8Z1KuZebsPCRpDV+YxKo+b8+q9oXLEF7c2RjhQFfJ6bah3Dk7tLqcy9HwtelV1S5hu4ShBeZsefhmESwzpwcEz7BjdkEwkY7xB4c+L154UlVI4+zVrUixvR6oJwjSGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AtYdO1CxVjWbkEtX3vPJGZ7rkNudeVMsPgM9oZMFOHk=;
 b=lYin4xQI5AQJ9z9aIy0xjCMyEDBxGHjAWG03KQ/GO1Bk8h39Y6SLOy2WD9lWDrlYtr3du5rowvqQodvV11S6lbpDKITKVLUkyGSV/BvdoVQf4C7qf0zhwthW2JOC2i7K/SplyY+bfL29+Ow582BITFzeg6fQ+CYZgWpP20P9vvQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM9PR04MB8955.eurprd04.prod.outlook.com (2603:10a6:20b:40a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 02:52:27 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::b999:f2c6:a8cc:7b4]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::b999:f2c6:a8cc:7b4%5]) with mapi id 15.20.6319.032; Mon, 24 Apr 2023
 02:52:26 +0000
Message-ID: <c1e552b3-2190-ce0b-360d-5362f0c70d5b@oss.nxp.com>
Date:   Mon, 24 Apr 2023 10:52:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 1/1] clk: imx6ul: retain early UART clocks during
 kernel init
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230421115517.1940990-1-alexander.stein@ew.tq-group.com>
From:   Peng Fan <peng.fan@oss.nxp.com>
In-Reply-To: <20230421115517.1940990-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGXP274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::14)
 To DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9417:EE_|AM9PR04MB8955:EE_
X-MS-Office365-Filtering-Correlation-Id: 4893d092-1638-4c5f-bd01-08db446eefdd
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RSACJWxkIs++Wf+sUjwlt6Cvw9TpGnz0XhzlbhWTbQDEc0NLGl/jIWI1HG5kfuuK0hfMF/s2ZOy8zc2FL3Wc2y1YZJzLl070LWsPJqOd2jx8GM/jDoDnoYqt2GgjxW0Jy9rUTMnU6E0s93Xn/NkCtkYtmQl7FWW6gJcwqxmWhlZ+c+feffw5k0v0l7Qyog94HUthvYq8ekSg1zK15xfivBGZEkTufYDVQrgQ1XDTraNJODwPELbhOijhC3WB0z1ZrhqOz3G4PuzpSX7OmbCCtAcN5i5E7zKErVJKajNzXbmL2fkyFkz8t5sUzrGNG7C1MqbL4E6CPYxxBkRK3mnJ+XanNUbL6EmrR6nBkEoQfQGIMdB6awq6Nz31bpkZPgqXicmxz0YZMZChnj8DkxixzCTRCDG0OHu5xm3rV47kBYX6HMyMnpqkqVp0Z4riD66xQJ2xduOIMf4g2HipMDu+9GDun71orYvNVpjFxi8vhsk29M7mACM5YOn9TdKqgftUuh6MsDNVUJ/6JohGX9cEhjfzNgo5UJhKsT5YKMNh9XBUS1oGCYITJIlrUpFZlmEqIEfyG3mIcH3Ibz7Q/um/p1o3DxPMbxblJBq6wmcKcxV65J1lKEcLrz7QNTLCxpdIMHahdUVrizTqMZBLr08miP12jfIRvmzYQkwW/aN31bw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(451199021)(478600001)(31696002)(110136005)(54906003)(86362001)(186003)(53546011)(6486002)(26005)(6506007)(6512007)(6666004)(4326008)(66476007)(66556008)(316002)(44832011)(83380400001)(66946007)(2906002)(38100700002)(41300700001)(8676002)(8936002)(31686004)(5660300002)(7416002)(2616005)(32563001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KytLMDZScmZNblAySHJ5WWllMjNwQ0c1d1JXdzlmOWRpbC9WMFZyL0JmYTgx?=
 =?utf-8?B?aVVPaGIrbG5aSkxZRW9kM0JGVFZMbmR5UldBcHJtLytvOUhvdkFRbzRmVlpi?=
 =?utf-8?B?WmJTZS8yN3pIcmZUaFJJOE1BcjRBZjJ3bCtFNXBrdlJhZW1Ta1JaZldyQXFD?=
 =?utf-8?B?ZSsxQXRQU3JPV3hzdU9MNVY1RU5HR1ZwQTZLaG1MSGtNL3g2VXdiMlNLaytD?=
 =?utf-8?B?WjlkaHhoZ1VOcU9wMW5CRS9Yekw2MjFiM1VRUWVXTnJWTUw5MFFOWStGc0Fx?=
 =?utf-8?B?YS8vSnhGdHp0NmxvSEVXbjhRLzYxbjRaR1hBVUZSTWs2NEUyVUY5MTFwT2hB?=
 =?utf-8?B?NFJTZkhuVGI0VW9KdE9OY2liUzA5Q2dxU056K2M5czU0ajRUeTdxTWhXK0VW?=
 =?utf-8?B?K0dOcGEwTXFJVDZyVXZCSjl5QXgxbDJXbU02QjVGQWhwNmdYYnNIVS9Dd3Qr?=
 =?utf-8?B?RFl3c2NWV3BwTjlNN1pyQk1Pc0taczRhQlEyL2JLNm5FMWdsc1pJT24vU202?=
 =?utf-8?B?Tnl0UWo1c1hGNnIwTFZDYzdseVN0STcwOS9PN0x5U091Z1ZRaTU3RFlGTStj?=
 =?utf-8?B?aC90Yk1LUHBpbURvVTRYMi9vVHpkRy9YWDN4N3VKdTdIL2s2RGRBWm1WdFB3?=
 =?utf-8?B?cmt2SFhOTkk1d0RXY1ZGK1h4UjJzL2UvcGxZNUdJRmVOaWFKdGt6L3BaZCth?=
 =?utf-8?B?TVFYVGhmU21JTys0aUlramM3dGRBb1NkakdoYlpmSUJjMjVVVi9YSU5BK2sx?=
 =?utf-8?B?RGJtdnEvZElzdlBGMnVpZjlQZjNpTzZ4SC9GS3phNklYRlk5YW9RMHhKdnlm?=
 =?utf-8?B?U3RadlhpUUJrblJHN2lBSjYrMm1Sc1VTcy93dFIrSFUrSmtidmFqYmtMTFRa?=
 =?utf-8?B?WHVZbWs2WXZQTDYrWlZlTklHYW03S2M4UVN3UHg4Wk1HZHVuU2VnWEYvajk2?=
 =?utf-8?B?aFVpM1U2Y0tObDdRTVRxTDh6VmNDa0ptRW5CQkhmUVQ4WnJMT2R0NDJVUE8w?=
 =?utf-8?B?a0taNVFtTmVxTGdscm43SmFlMlRlckZEemFzMHY1UkhKWW13Y1QveUZuQnBV?=
 =?utf-8?B?U0tmUExDUGVzNG13VGFrOFpFQ2JrTGRCUTR0bUxHQ2UweHhmL3RPQnhMMnNz?=
 =?utf-8?B?SjU1UjA2NmJLU0RCSG9FSWVCblZHekVtSzBHcFFHNHNsYVNRL1Z4Tk5XdmE3?=
 =?utf-8?B?UE8ydzZFNGdsU0tORVl4NVVxejlReHZITFZjMHFVSnFJSGNMWkdLekFIZ2Uz?=
 =?utf-8?B?bUI0SmpoZDlrcEVESHh2eEduTTFTdnpvZzhQRU4xUllqcm5FbHNraHRKTEt3?=
 =?utf-8?B?V2RpT0dOYnZaaTVEZmRmeFphMHc2eDZuTGZtaFpvTmE0VmFEdnc2enh2d0Ju?=
 =?utf-8?B?RUYwelV0M0NPK05OTUxiL3RrcXdCTkpTWWROUG8xSjYwL0ZORFFBZzNtWTdm?=
 =?utf-8?B?ZkJldEdLc1BVM1dubjBNQ0xLamxKZHBSenNkcGp4ditkbkJQbkU2NHQxMlZY?=
 =?utf-8?B?ejlLaXRBOGRkcnhTeW9CL3N0TDVsNTJYVTlBMm0xeE9NNnNvbWZITnlwbi9S?=
 =?utf-8?B?dndmOU1Qb3JhemY5RmRmV0U5cEZ6V0s1MDZ0dmRSbS9jT2J2bDN6MExkTXJR?=
 =?utf-8?B?OFl1VHFQTHBjWXpSYjlLSjJBVUtaNXJoeFBtWWRBaWREWFp5aWxhTnJLL0R4?=
 =?utf-8?B?b1FWa1NiajV0MTdIN0lSMVNlRmp0MGRjMFRsR2ZkQnRXM0dGUGVNL0NnNHBs?=
 =?utf-8?B?ZTJwYzNEaW9HbElXQnZNTXllanlDNkpPZWxoNXV5ZVlGUWtWMk9tMUJ0Y09M?=
 =?utf-8?B?ZHNmbUVieVBoSm9JRmNSeHV0ZXJIKzRBVEZLL2xXM25TWnIydjhjbkxyNUt6?=
 =?utf-8?B?OGtlY0FDTUZjZjlOcHRKOXVnMFgvMEdrbDlORmkzRHlJNDN3RXMwd1h6ZDZM?=
 =?utf-8?B?MnFjak5pRU9QT2src2VieG9tWmtwTCtyK1Z0NkVLVG10NXpidWhMTlZIMTlr?=
 =?utf-8?B?c1N6Y3JsaVNiWUI0YXprMzJUTG1JdHI1QURFSi9vbDJtWDlVZktVclJaMVRw?=
 =?utf-8?B?NlJVNGNKQ204dDhYSnNlcUxMWkxMUFI5bWNwaEx4dHBGVFU1bXlqenNRTDFU?=
 =?utf-8?Q?1j/lOneGTWAHyyRctPOeyJumg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4893d092-1638-4c5f-bd01-08db446eefdd
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 02:52:26.8947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N2MBoh3sF6+c96u5lCCnZ0UaaWFEza832pdlcsFd5EQZplAw9zFPkunRj1B15jRU+0c40BDQGJl1LrHnuEoJbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8955
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 4/21/2023 7:55 PM, Alexander Stein wrote:
> Make sure to keep UART clocks enabled during kernel init if
> earlyprintk or earlycon are active.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

> ---
> Changes in v2:
> * Rebased to next-20230420
> 
> Apparently i.MX6UL was missed in commit 0822f933735c ("clk: imx6: retain
> early UART clocks during kernel init"). But as commit 379c9a24cc23 ("clk:
> imx: Fix reparenting of UARTs not associated with stdout") changes the
> calling signature it's not warranting a Fixes for the old commit.
> 
>   drivers/clk/imx/clk-imx6ul.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/imx/clk-imx6ul.c b/drivers/clk/imx/clk-imx6ul.c
> index e3696a88b5a3..f9394e94f69d 100644
> --- a/drivers/clk/imx/clk-imx6ul.c
> +++ b/drivers/clk/imx/clk-imx6ul.c
> @@ -544,6 +544,8 @@ static void __init imx6ul_clocks_init(struct device_node *ccm_node)
>   
>   	clk_set_parent(hws[IMX6UL_CLK_ENET1_REF_SEL]->clk, hws[IMX6UL_CLK_ENET_REF]->clk);
>   	clk_set_parent(hws[IMX6UL_CLK_ENET2_REF_SEL]->clk, hws[IMX6UL_CLK_ENET2_REF]->clk);
> +
> +	imx_register_uart_clocks();
>   }
>   
>   CLK_OF_DECLARE(imx6ul, "fsl,imx6ul-ccm", imx6ul_clocks_init);
