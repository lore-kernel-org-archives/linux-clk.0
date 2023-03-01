Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A21C64EC7
	for <linux-clk@archiver.kernel.org>; Wed,  1 Mar 2023 02:35:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbjCACfy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Feb 2023 21:35:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229868AbjCACfx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Feb 2023 21:35:53 -0500
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2074.outbound.protection.outlook.com [40.107.20.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7291732CDE;
        Tue, 28 Feb 2023 18:35:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kzVptaG+ovJiGEXgvjc5MEzMrfzSwCHhTT6Jh6ydElogqpMCQ+hqN2YflNp2fBvJ3eAtqIMr7Bl+ceouBDyiObkzmTtyhyv7Tnk7Oa95xKg9oTmjQ4YQn+uiqZMpyHUAwlhaFjqkgamXXk5vRePNyLVmksgKoCdbc+AIbsupoAUSBCvWUOubCHugwitmIElN8XbHIXGv8F+Y626wFUQYpOKcWCgBauDkQ9JlIykEUzP5Renph2z44q7hybZ1ZSE2XtXCF0WiwgN7QHbijGiumGZdTrduY6atwDPgBGmpaCwWqUQ0Q5+XMU45JV7hUIthByVBqRSEJPWxzMzaLtJ5lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hw9zveW9osUuDIUUSF7fQpbs3kxW2dETH51QHqg9kC8=;
 b=KsaDQuA/V4cQkny2OMYmRhikXOZvcB7XOZtYiOWRG50zDQDmh8PauwFbXfjcka4yiz9pImZwZWsOkhaS9WtJ3gGUYZsw52OJQWxHe0oSTOEcaVWDZKa1m4LHLvHSoHjPAkqYSEyTbCdyzIMBzmo6DtJ+ziDA83R/S+QP2EOzh7HcLZ46acpbehDbqp1TdIpuC3Fgut6hMt2q0AifpVJtPmtRg2f9K6RyW83UPuWAVSRL95i7pluez9nMYxZu8oV1TuSzXmti8C8Re8JOje12bZoztXkPmhkT3OovXXBwuR9TWb9QVnzNPg7b7uJgRfSNK6bkIwugdHy7H89ZEy9X9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB9PR04MB8316.eurprd04.prod.outlook.com (2603:10a6:10:246::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.17; Wed, 1 Mar
 2023 02:35:45 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::f55a:cf12:da08:6d2a]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::f55a:cf12:da08:6d2a%3]) with mapi id 15.20.6134.027; Wed, 1 Mar 2023
 02:35:45 +0000
Message-ID: <e9e3c316-a162-1934-4294-50cd4d28ce6f@oss.nxp.com>
Date:   Wed, 1 Mar 2023 10:35:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0
Subject: Re: [PATCH v6 3/5] dt-bindings: clock: imx8mp: Add audiomix block
 control
Content-Language: en-US
To:     Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org
Cc:     Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
        Adam Ford <aford173@gmail.com>,
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
 <20230228215739.171071-3-marex@denx.de>
From:   Peng Fan <peng.fan@oss.nxp.com>
In-Reply-To: <20230228215739.171071-3-marex@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR04CA0002.apcprd04.prod.outlook.com
 (2603:1096:4:197::17) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9417:EE_|DB9PR04MB8316:EE_
X-MS-Office365-Filtering-Correlation-Id: f8e2b918-8001-4edc-700b-08db19fda861
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I6/uLWCFNs6J5kkXJcTeBgtMqSRkuD+YkZRqo9sTRsK1n8f06DkLskzeBgWtQm2UTxqm/PW5wsLEVxYy7j5wjKwalaimW2dGZ1Jp1zKXjQz8BXRiwrvuJLzldiBrIktHfCiMJITPmd5T+M9PO5PQrT9b5W8RfxvaWVTdKPUhS0ul+uarATnAJvC5qbvTFHHyVKN0Fl5+vRJ8XyLzHOWMjiDw7Dm9TSnlGJdhpK5PZeE8huV3zx0EXaYTcCx7DQSFMariVzFbq4QtyzRfFj5ctZ21aK1xNVG7KYPe7CT5zJShQuCbP+LNI967rgvYThAR9rjCAAAW0w1ZmhF0GDzkX2wy1LnDgwlgnc82Ze4i7HXaUT9ZoWvfdGTiKtpLCiFbgILAPBNwQhx+ZcivANYFLFagDL05Z1HrwH3wn9tVNnrddim7PpZv2n9UCPPt/mdc5MzFVX80YmU9TdBmrcxV2NDlQb5H8UGR+liZ8FMqrOO+WfGYiZD/PuHy3cOX1UcZyWAT6iRqRXNxZtf/nj8OGbM0iyIr8eUIi+GpZl57aameZNOZApX9wmi5PCcwny1DJAKGngJYROdkOu+NC8kgV2q+vtQtbRcxxdBwiJAEtkQg1CmH+GZStqAJK5w3WGq+y5rl3iam3GLLLNE4EgsRKEWYLS0B/otlFSvMwHIr7m3MACipAa117xxPDyLfHinhfOt0wBHNMKRFUArgiIizLYjhdJMxaffLfHXz6EvLiy25QVgUqkWUEG/MrOCATv6ztaPZIXwrYGpWUsRdk16v2fZdf7hmq6/lPJqB+KQ9T9HS7fPLm+w7i442RemYVsZ/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(366004)(396003)(346002)(39860400002)(451199018)(54906003)(316002)(478600001)(83380400001)(6666004)(52116002)(6486002)(966005)(2616005)(6506007)(53546011)(6512007)(186003)(26005)(8936002)(41300700001)(86362001)(2906002)(31696002)(5660300002)(7416002)(44832011)(66946007)(66556008)(38350700002)(38100700002)(4326008)(8676002)(66476007)(31686004)(32563001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXk0SHAwRGF1cGhxdmlrZThIelRSdmtBR05XSVZGOHVJM3ZMenArTHo4K0lK?=
 =?utf-8?B?NmZtUk9xUE9XUVNzeERiU0g4b2hZUDZPeDJ3bG5PZTVsenV3cmtocW5HSFVF?=
 =?utf-8?B?NGVzWEJ6cGJEN3VSYnowU0xBNThVYm8vLzN4aXlqd1NVMXNEV2ZNbE41WXNy?=
 =?utf-8?B?SFFVSlVDWFZFOVJiamhGa25tVURzd0p1eC9mTjhkeE9yMGhXTS9IekdCZlIx?=
 =?utf-8?B?R3BXMWluNDdNUVFNUkpaSUJZWk12MWNRamhxMU16RHpzT1N3c1hYckk5SThL?=
 =?utf-8?B?OXZxY2pQb0dtZVBLVDFXc0Z6d2hnbGRkVVhMSFFRL3BFb0wweVluOXR0QWlq?=
 =?utf-8?B?MXpHM2duTG1MM3c1VDZHNHo5VEU1dFYyVUhvbmZTWGwzdkY0TU93Q0lEY293?=
 =?utf-8?B?RXorQktlRFZpZ3Z4KzgralpTNlFqamVmRVExZisxbGYwcVFXWWEycE5RRUVM?=
 =?utf-8?B?TkIrTFNqYmxKN2l1Yk5BN0RJUHNhQ0hxejZBb3MraGF2MUpKd0tSUFFrdVY5?=
 =?utf-8?B?WHpmOEV6RUNhb080VVUweGxNM3p0TDQ1MlZvdExkYVduKzRhLzN3TEk0aTFl?=
 =?utf-8?B?bE5VTmVzcnlGOHJhaGdBdEpXYVBnaHJiOXYyVkFaTEpudEVFdFNoZG9qQ2lY?=
 =?utf-8?B?M3JucC9OWE5mTW0xcVdUTVlnZkUxK2tycE1QWWorYktMMlovUUhRSUdpTi9x?=
 =?utf-8?B?dk83UFpkbnVzdm1IZ0tpTzJQbEZXN2RDNEpRcTJzQythTlhseE1pYXpiN09L?=
 =?utf-8?B?RWdSQUNROEF5dFM0UGk4VU55OUc1RUFVZWYxOFM5V2R0T2RxYVZLTkdKemJR?=
 =?utf-8?B?WkVIR3JLd0dLYUYrYU01SW1wTkt3L3RUdEZqRUF3Ky9JdGtNMUNoeUtqSDR4?=
 =?utf-8?B?SUlzeHpHenNWQUhUTFVsVnZVa0JBUzdBekZsMFpScHBDYXI5T1ZnMnErWE5Z?=
 =?utf-8?B?b3dJcDFEeEVVRjFwZURSbXlJeU1lQ3p0T3pJVDRmSEo1R25KYU5jWGNiT2Fk?=
 =?utf-8?B?VU15VE5iS3RiTEthMXlObXZyaU9pclhCQ0JXelU3WnBWd2N0ZkoxRUhIMmdU?=
 =?utf-8?B?L1ZZbk1nMUxoaGlIenI2WG95d3JGbm05Qjh1VkxmblZlRmRwQXRVS252Y3Q3?=
 =?utf-8?B?WnoyWDIzRVhOdnZnT01nc3VtYzZPTE8vaXZHRGpFcm1LTEZGNjJmeXhGUldI?=
 =?utf-8?B?ZVVwUjk1dVFUbDFZcUNZelM2aG5hSmp5RmxINHhPelRxcS93Ykd1VUhsK0Fx?=
 =?utf-8?B?Vm96YnJhOXBVZEQ4b2N4OUEza3ZEU0lzWXVLTWtDL28vcURGVE9UcXpTSGZh?=
 =?utf-8?B?QVUwSWI2bzRVMlhYcUFjOGpMRzFlK3RUcG0vYlBZZ2lkYmY0ZExSblZFNXNw?=
 =?utf-8?B?ZWJQaVFpZ0VqMExVaUM5ek9ZZXVLRGxCUjh4NjZvdVhNS2o5QU1mQURQd1da?=
 =?utf-8?B?M2N0Umg0MFJjRGdGdldpUHlhcUI0Z0lVY0tGY3Q2TFNsSDNweHhwMWtHM1Za?=
 =?utf-8?B?ejI2MFQ4MktlbnpSWklEMlVUU1RGSnNDTVhWZ2ZRbTQ1TVhIcDBHNDEyMTRk?=
 =?utf-8?B?dGdrcG1EMlhIRkpIbjRvTldvKzNQS1ltdVY3RlgwSUUrQXkrcTNia3llTWRR?=
 =?utf-8?B?T1FBa2lERTZyblpKd0tqd2xoK1F3YWIzL2NnMVl0bFNZL21CaXV5VG1HR2p3?=
 =?utf-8?B?RXJ2cC9NU3BPdy9DK1J6U2hRY0dZZnV5ZzFzaWZ4cWpTd2tkRFBGZkNWMk12?=
 =?utf-8?B?WTdxVUNqb05NTEF1eTNxUUJVNXYzeEFJazVpYkFLM3R2Z01xd3FCdVQwbmdS?=
 =?utf-8?B?clZpaFI1eW5IeGoxenBIenQzZHArSVRDSUloMmVNVFp1QVRjZ0VKODlINENa?=
 =?utf-8?B?VWJTdWN4UTY1L1NQZHhDb0V5eHZOdGFQQ0RadW0vRCtHMjNEaDlwWktmTHNZ?=
 =?utf-8?B?dUpGTmt0T1lCV0lNMTFtVGc4SGJDWk5zbk81Tm84SVk4SjJMN1hrVDFubDVX?=
 =?utf-8?B?VHRtT1FZL3IvaE55ZUR0dEZpalYzQURDYWMrbmJKYXRKeE9mZERPWXVheGZj?=
 =?utf-8?B?RHM4OE5tbFFJalh5YjJEVGV2MEJOODMyVjVqM0VtblVaRStqVUNOYnBLcERV?=
 =?utf-8?Q?G4PByNksKP23FPvI7wUvKJzUA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8e2b918-8001-4edc-700b-08db19fda861
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 02:35:44.8403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fVj2Ic4krEknnSo3pFkfoYRC4niMwffOxf6lHfDCR1B1SjZxybQ3Nifo4xsg5AoBbFi/Cbdu7YhcOYhzJqyuDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8316
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 3/1/2023 5:57 AM, Marek Vasut wrote:
> Unlike the other block control IPs in i.MX8M, the audiomix is mostly a
> series of clock gates and muxes. Add DT bindings for this IP.
> 
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
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
> V2: No change
> V3: - Add missed RB from Rob from V1
>      - Rename audio_ahb to plain ahb
> V4: - Rebase on next 20230223
> V5: Add TB from Adam and Alexander
> V6: - Add RB from Fabio
>      - Drop power-domain-names
>      - Move reg below compatible property
> ---
>   .../bindings/clock/imx8mp-audiomix.yaml       | 79 +++++++++++++++++++
>   1 file changed, 79 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml b/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
> new file mode 100644
> index 0000000000000..ca0bdd0c551b8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP i.MX8MP AudioMIX Block Control Binding
> +
> +maintainers:
> +  - Marek Vasut <marex@denx.de>
> +
> +description: |
> +  NXP i.MX8M Plus AudioMIX is dedicated clock muxing and gating IP
> +  used to control Audio related clock on the SoC.
> +
> +properties:
> +  compatible:
> +    const: fsl,imx8mp-audio-blk-ctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 7
> +    maxItems: 7
> +
> +  clock-names:
> +    items:
> +      - const: ahb
> +      - const: sai1
> +      - const: sai2
> +      - const: sai3
> +      - const: sai5
> +      - const: sai6
> +      - const: sai7
> +
> +  '#clock-cells':
> +    const: 1
> +    description:
> +      The clock consumer should specify the desired clock by having the clock
> +      ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx8mp-clock.h
> +      for the full list of i.MX8MP IMX8MP_CLK_AUDIOMIX_ clock IDs.
> +
> +required:
> +  - compatible
> +  - reg
> +  - power-domains
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  # Clock Control Module node:
> +  - |
> +    #include <dt-bindings/clock/imx8mp-clock.h>
> +
> +    clock-controller@30e20000 {
> +        #clock-cells = <1>;
> +        compatible = "fsl,imx8mp-audio-blk-ctrl";
> +        reg = <0x30e20000 0x10000>;
> +        clocks = <&clk IMX8MP_CLK_AUDIO_ROOT>,
> +                 <&clk IMX8MP_CLK_SAI1>,
> +                 <&clk IMX8MP_CLK_SAI2>,
> +                 <&clk IMX8MP_CLK_SAI3>,
> +                 <&clk IMX8MP_CLK_SAI5>,
> +                 <&clk IMX8MP_CLK_SAI6>,
> +                 <&clk IMX8MP_CLK_SAI7>;
> +        clock-names = "ahb",
> +                      "sai1", "sai2", "sai3",
> +                      "sai5", "sai6", "sai7";
> +        power-domains = <&pgc_audio>;
> +    };
> +
> +...
