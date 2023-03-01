Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C8FFC64EC4
	for <linux-clk@archiver.kernel.org>; Wed,  1 Mar 2023 02:34:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229824AbjCACew (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Feb 2023 21:34:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjCACev (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Feb 2023 21:34:51 -0500
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2075.outbound.protection.outlook.com [40.107.20.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1C5832CD7;
        Tue, 28 Feb 2023 18:34:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XGyaNDgG3jONf8w5DQMWWG5GL2zKzPYQ4qPOgfrioOFLhGf8+hYDm1+qiQycxnkP05sy6+b7NCIo9QYzT38ipLlg8yjDY2d/u8+IXK+uY3ZsR2BpbS/ctK8t0vI4zmq2ToJgtWRWxZ0dYi7Z6E1Htp4gbS+3RHj3FZ/o7K6YfBvbLP5yWkk9ImYhK3BmCSV/GnZRdEW2fuIChJzE3E93LG+MxVD5wlz+bz49mw0lDy8NEZdUvnMxWFh3qhUf84BSvpzqD94gozW80BbldKKCkn3l8VWEv5ZjL6krhlMLHiz5BqrMcsXLScKskLYu9cR1x42COfk+jQ9CesuMZnXY5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e5vdvqELwNuh2BRsZl8AwBF45ZEagyqClp2j1syky78=;
 b=GDl+5oZ+ELvfsbqKjjgFNU6hvPIIipxpLL0JNG6wIL9lvGuQLFjNi1zVlCDlMrJQMQJVToGrapbh4zoX+WiN7lwtTxGf6GpuErppkynyP5++pry5EJBPOJbc3Pse5R1WWdJ6rnHEZQC+QFA85qzKiuKNJ+tERotOrbUbh6hrbMLdQ/s3Jfwt6Kx+doXmrnr80bAx7pfEFuhidD98Z4v/jjH6FOwggsDykIaluhrnfBNUoLkT43RlP5sYaZkX7eCZNZHCMj2i2gRspeQtxe1iexa8BelL80qgI62+6RrDZdCwg2oMlQZ0RiNtEc/f8c9ro/C56LatbLr3MTnoMXceYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB9PR04MB8316.eurprd04.prod.outlook.com (2603:10a6:10:246::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.17; Wed, 1 Mar
 2023 02:34:45 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::f55a:cf12:da08:6d2a]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::f55a:cf12:da08:6d2a%3]) with mapi id 15.20.6134.027; Wed, 1 Mar 2023
 02:34:45 +0000
Message-ID: <00b2d233-b618-e95f-d8c7-20be266443a8@oss.nxp.com>
Date:   Wed, 1 Mar 2023 10:34:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0
Subject: Re: [PATCH v6 1/5] clk: Introduce
 devm_clk_hw_register_gate_parent_data()
Content-Language: en-US
To:     Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org
Cc:     Fabio Estevam <festevam@gmail.com>, Adam Ford <aford173@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Abel Vesa <abelvesa@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230228215739.171071-1-marex@denx.de>
From:   Peng Fan <peng.fan@oss.nxp.com>
In-Reply-To: <20230228215739.171071-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR06CA0001.apcprd06.prod.outlook.com
 (2603:1096:4:186::21) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9417:EE_|DB9PR04MB8316:EE_
X-MS-Office365-Filtering-Correlation-Id: dd7b3cc9-4101-4cd4-3b94-08db19fd8511
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xcpSA1V/QBcgwRGtkfGNwV7OnkGBfoMkQRcQ3ZjWPifHfkNhqyhCtwJ6hJHYIZ5+6qhBoGI26DX+ZJLZSldes1egRtgmAzjI11sbpe8jNuRuiMAhqn7QI5EoU0mOGu9hjhm+O7/hvlMbY+/FdZR5kxBqRJ7vEQ2XHnBrVEBTi67T8JFEl1LlEbZ3/MgadgPpUsbbY4IPrialpjEigUp3LTR/tCBSlPbwACguuzXLz0q5gTdhfZpsxbYXVPnjjDD4Gcs/b90op2FYQWurJWvstUenG81i5wU7eJvwSNyb26ioK92WiQ156ecV94CdFiipf2pkR+/FiIszzee7XeznVQiT52o1dlaaYbhIZROjn51edNCqWKl3yIegb82vUZdI085v7BU4VmelfNz6L7Bl4xdfCFYurq1lR5WMENyvRPuOc/up/FDZOmP5+M5Mcl2j+zdzHOdWBYF3d5zLtXgZlwCSqqVvka1RIuzwoZ7EMwzY9mygBHESujB7sLwJRHFaH7qdFRRiWc+cy27mDfrgSTKQyQGg7iTMESntOrwy5fx1IxLb9Rc2Ai/37AueFeV9zq4f8RYS5JoWXksfOZ7GY9k3YKs16unIVEfh2ys/m7VmkAQ9U56He/m6Gixxme7E1eoGM1rAqw8g3Og3yfkOLRIuB4/pbrtX6D2hnxLTGnfYyH7mvH2VtbiVryyjo8Ixf1WeVn4DRcMM5krFaz0HVq9KQQdMeJuVMvwjFPWBk2togEZYV0oxv0zY/mWqknUDkSt9WhOc/v5kqR8zL8xKHw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(366004)(396003)(346002)(39860400002)(451199018)(54906003)(316002)(478600001)(83380400001)(6666004)(52116002)(6486002)(2616005)(6506007)(53546011)(6512007)(186003)(26005)(8936002)(41300700001)(86362001)(2906002)(31696002)(5660300002)(7416002)(44832011)(66946007)(66556008)(38350700002)(38100700002)(4326008)(8676002)(66476007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjVMT2lCeDlFMmI0OCtLYkphTUVZNHdWVkptS1lRcS94M0JZc0RoSHRSREd6?=
 =?utf-8?B?SEs3SS9iS2hhUDhyaVpGaEx0cDdqMlRRNW5kdTFZTHdncXNmR3FDNjZhLzl2?=
 =?utf-8?B?d0pzVHFTcTFOdXFEa3FhTnJWWE9iZ1IxcEJsSVdYM2tRVVBDNUZUQkpGK2tk?=
 =?utf-8?B?d293MjVGU0lEcFRHTzBZQXJ2K1Z5bDliMFNYRFBBYVpidjVrdFlQdWIzTm9T?=
 =?utf-8?B?b0pyaFFDQkpxRXpPUGJKZjI2MXRtVU5SMUdlWG1EcklldWRZVE9XWUFtRVFX?=
 =?utf-8?B?ZkVtVHRGeXJWQUlTS2xpRHdSQldNTjBuZzkwTzJCQkNIZ0VBdUpHVE5qUmNi?=
 =?utf-8?B?NVBBMFJnN3BydE5TSEJVOEVrdEo5Y2lBQ1dUKytDVk1PWk9nZlM5ZXh0SzVH?=
 =?utf-8?B?ZDB3cGNZZVFZK3k4YkNDNVNRNWVqdUR2elJxTDd5TlVWLzBqNGFyWTVuMzh0?=
 =?utf-8?B?SzZSZW10aWdwU2hRcEJZd0FiUExlLy9GTnRoUVRmTjVha3ZIY0VKOEowS1Nr?=
 =?utf-8?B?YlYzV3h1djdkN1hvR2tzT2xGZFFRT2tNdmwzY3Vsd2hrYWJ0bkR0a1FtUHF1?=
 =?utf-8?B?eXRxbHR5Z1NSclhydFhNRDBKSWNLK3RkY1ZhNWRrUVdWMjNjTzR1ZlJWQVBD?=
 =?utf-8?B?emlHNXBoQllFV3lvYkZIT2dyZlZYVWRUUnlrVm9FNWY0OUgyQVh0czdxalJJ?=
 =?utf-8?B?WnFvRk96QmJDQnhYN2lhdjBpNUlTUTRyd2JvSExOeElCVDhXYWdvSVp6MFh6?=
 =?utf-8?B?Z3VRWTU5RTJiRTRUcW0yYlB0RExjZEtOTnhYQVZzN2h0VHdUMVRkYXdtMUM4?=
 =?utf-8?B?ZEkxN3cwWUR5M2NrUXFnVmhMWTNtRndFTTRNRjhkZDNrZVRIUG0rMFRLanQx?=
 =?utf-8?B?aDBpZkZaVm9WY3ZJeCtURWJSZDZEYVRCVUR0dW9IbkUrbUdBc0JTSkpZUUVj?=
 =?utf-8?B?NnM4MDFieHh3RW45NzJ3MTBmc1o0cEZDVUJJZE9OYk53VDRwcGRUeXhPOXA1?=
 =?utf-8?B?RDZrUW1wVlBkd29wRElzWVlTUisvTFVrL3NVRGc1Y1NXSzROSXF3S2NUeDJY?=
 =?utf-8?B?OFhjUktoMXgxeVhwaWx6eUM4dUR1dDBQYThxZFdVbDdBaW5zMElEZ0trNXEy?=
 =?utf-8?B?UXV0SkRYUzRkeEUycFJHZUN2ZklwMmhsZDFXRmV2T1IxWGRGd3UzTTZuWGVM?=
 =?utf-8?B?RVdwYTRvVjdOL1p0MytuL25LRlpGd09DanVnV09RcUw3bndlMjYvOS9VOTQ2?=
 =?utf-8?B?WEtnUk9oUkZnVys0YnpQM3ozaUtoVFhyaHcwOEp2RzNYTDNQOU45QmlGWlV2?=
 =?utf-8?B?ZDQvZk1tZzF4Zkx1TEU0ZDVNcU5yMmRiRXQ4WFNHUERpL2xqRlVVTTM5MUlT?=
 =?utf-8?B?RXdTSEoxV3hzZEFrRE5NTi9GNEhESGxQL1VQTW5hK3hmSDhXRklqb0NtNlZu?=
 =?utf-8?B?b3VCd0RRYzRiQ0NsUGFoM1hCTjVUeXVPU1BvdnFHR0ErWVVVMWJXbVhEMkhB?=
 =?utf-8?B?cHRzNXU4Tk1XSE1pdSs1NXJwQUxNWlZ2RURuelFMeUxJN3drTFVkTHRVVE5S?=
 =?utf-8?B?YzA2cTZlUXd1TDZodGQvQUEvSkx1TkoxNkc3LzVERkdIM21VWFdBYmVCMmxt?=
 =?utf-8?B?V0xWMGh0L3pUUzl5RUxvd0toeDY0cnVIczZtOUVCRXc3NTF2bmFkbW1tYVdp?=
 =?utf-8?B?RStrOFowZko2aUh0bUIvTXVJYjhJOUJJa0s3OXpwNnRlazd1RGxGUUpkVE1j?=
 =?utf-8?B?T0NGaVJqcGFlVGNLR2QvL3hnSlE0SjNsTzFCZVhmOVZTNWIzM1g5TkxqdFhs?=
 =?utf-8?B?M2ZjL1VWRG56QnF5Ui9DaDcrRExZNzRDRkNkeTFqL0JnaXVvVEtUU3hIc2pK?=
 =?utf-8?B?WjRLMk9JS2ZEVWNOUEZlMlVTbzJFazJpWnh6WTdwMVc1V0p4RjA1SzJndkdv?=
 =?utf-8?B?aUUvVkc5dEpweEVuVEQ2K1ArOXE3L3grZnVyUlpDSnJvVGQwSWZuekxYUWFx?=
 =?utf-8?B?ajdaVk5zd3pDME9JSlV5K2hiZEt5R0RHYmVKQUhFemFNK0ZDVnYyaDRlZDJZ?=
 =?utf-8?B?bjU4di9YSmh4cU1XUCthZk8xRXBLcWp3WWdDUEpSYmdFblpkR2hTVHhuMW1k?=
 =?utf-8?Q?R0X2gyO8gr0EreWiTbNdpSlVD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd7b3cc9-4101-4cd4-3b94-08db19fd8511
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 02:34:45.6893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4BMBCPlcXLqvA3otHnQJL5cIeuTcuqQI/KgauLpWxlTV5ctcix78EDH4g0K34XyFwX2Gr2JAeVn50sQBmsewoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8316
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 3/1/2023 5:57 AM, Marek Vasut wrote:
> Add an API for clock gate that uses parent_data for the parent instead of
> a string parent_name.
> 
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> Tested-by: Adam Ford <aford173@gmail.com> #imx8mp-beacon-kit
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

> ---
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jacky Bai <ping.bai@nxp.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Marco Felsch <m.felsch@pengutronix.de>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Richard Cochran <richardcochran@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> ---
> V3: New patch
> V4: - Rebase on next 20230223
> V5: Add TB from Adam and Alexander
> V6: Add RB from Fabio
> ---
>   include/linux/clk-provider.h | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 842e72a5348fa..92b7c794c6272 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -608,6 +608,25 @@ struct clk *clk_register_gate(struct device *dev, const char *name,
>   	__devm_clk_hw_register_gate((dev), NULL, (name), (parent_name), NULL, \
>   			       NULL, (flags), (reg), (bit_idx),		      \
>   			       (clk_gate_flags), (lock))
> +
> +/**
> + * devm_clk_hw_register_gate - register a gate clock with the clock framework
> + * @dev: device that is registering this clock
> + * @name: name of this clock
> + * @parent_data: parent clk data
> + * @flags: framework-specific flags for this clock
> + * @reg: register address to control gating of this clock
> + * @bit_idx: which bit in the register controls gating of this clock
> + * @clk_gate_flags: gate-specific flags for this clock
> + * @lock: shared register lock for this clock
> + */
> +#define devm_clk_hw_register_gate_parent_data(dev, name, parent_data, flags,  \
> +					      reg, bit_idx, clk_gate_flags,   \
> +					      lock)			      \
> +	__devm_clk_hw_register_gate((dev), NULL, (name), NULL, NULL,	      \
> +				    (parent_data), (flags), (reg), (bit_idx), \
> +				    (clk_gate_flags), (lock))
> +
>   void clk_unregister_gate(struct clk *clk);
>   void clk_hw_unregister_gate(struct clk_hw *hw);
>   int clk_gate_is_enabled(struct clk_hw *hw);
