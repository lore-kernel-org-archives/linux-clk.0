Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A9FC004D4
	for <linux-clk@archiver.kernel.org>; Thu, 19 Jan 2023 19:27:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbjAST1x (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Jan 2023 14:27:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229661AbjAST1v (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Jan 2023 14:27:51 -0500
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2051.outbound.protection.outlook.com [40.107.241.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 555378A4A;
        Thu, 19 Jan 2023 11:27:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XbqzWoUqCneGusoZE+vi2glhk3I18yaHbdfGBojgeS+XTSRLQDGd8bzOkW8DctdgeWFYHoGx2/ikJTvFWOhuEZCEtCiYoIsT7IwjWQL+T0CJubcnXwxukYYwR90LE4HO9ISV6UDy+XOauY4mkPvaALhGbkO3qZLdMlvA4Kxjef7rw9ZIPCEcoVO+T7SnfAg9Ccaw0Ige5gd4NiJgAyxDcuil20j3BJ4RrKYa1ZnRA4ijVkK9Qb3ACs+RXtRGJClVv795IIzZkmL8+Xu1IKyeRqe6xShghYS6eja6Tu6QwAC3e5YNw/VnapKH57J/7oYp65ihm9NwWgi84WortL/PCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5OfKwqg0GYMYlDS7Vfyzk/EXZquWMcPfijlX3BOtvHs=;
 b=SykwJ7gRyC3+VV/QtZGQ0oKNlUH4Sn2HqKd2V+hNYJP3h8kU5bTUPTgWiSF4ybg2w2qZxF0q45NExHv4phSqCfXcdnzsKb/trbTSQwkXfB3bLweVN+WMX8TTxOksWN8ch/qI+03SKxe/UmcRflZP4qGVCjStbSTdushpBHyXIWUgpuD53c62NooYflfgLohvE7krBL3ZKCJ4/JZzKVIhO0M5beZAtFFlKYd531sYWaKIpDx3z3evX2gFw+ARF+4miBtsIHYsIg8pkKH+cYcKSLJbiNWkwuptRj6mbPW3NlS2FuXnz0QEp3lZFUIGN7FStBdZIl3ItUeug5rNbhZUzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5OfKwqg0GYMYlDS7Vfyzk/EXZquWMcPfijlX3BOtvHs=;
 b=LiLgeePVO/K8qaKcamzlhw+kYDQaG7DxQADcuEeV/dSkX45kYuxBR8IXarDtW6JCIdPLKi6a0ds3dfUs+k2HsjYcYu8Z6mERRo4+VRyhmJrISN6hoPixPUgHfwUW538WcGhR48b4ydhaVVZh4Tv6G5yvlwz6L+s4aoWg8ydfLbBOl/RcLU8DiYSDE5qsQUDwg+4uzBuXhGr0c/Hsq8sO7J4AO2U/S8RcF3GJY5ZU1Pc1ejJIFatgw6bkucBq0JC/zoxWZ40kuSsKub7qcCksQWRLaY17KLQaCg10F97TenQhtSPrmGMgPnNxzOBl+Mc/qJJ9IdFeQT5PV9t7yPhSRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by DB8PR03MB6313.eurprd03.prod.outlook.com (2603:10a6:10:13a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.26; Thu, 19 Jan
 2023 19:27:47 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::6b03:ac16:24b5:9166]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::6b03:ac16:24b5:9166%2]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 19:27:47 +0000
Message-ID: <5da02a9b-3d42-a26f-0d18-29a6b5b181e5@seco.com>
Date:   Thu, 19 Jan 2023 14:27:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] dt-bindings: clk: vc5: Make SD/OE pin configuration
 properties not required
Content-Language: en-US
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Marek Vasut <marek.vasut@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-reneas-soc@vger.kernel.org
References: <68037ad181991fe0b792f6d003e3e9e538d5ffd7.1673452118.git.geert+renesas@glider.be>
From:   Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <68037ad181991fe0b792f6d003e3e9e538d5ffd7.1673452118.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1P222CA0006.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::11) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR03MB8847:EE_|DB8PR03MB6313:EE_
X-MS-Office365-Filtering-Correlation-Id: 81d4b583-f235-4059-2142-08dafa533f08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tVAFosSfxX1EA0C7gUGfBLQAN86zWACwyWfPUQK18T5NFXhPzDr1cEFGqUZ38UaHBZGu9PKSSmbjuZmJlM3zwlimvFQcPLw2+pcYYw436MEXvy2++UwFNksbEVYITt0pxtbxlwPOcH8zbw+X1zuNvCQ2ZzCU/hTICRorjlQkMFAVsyjv6voQff20M+FK/5/SFBBkijQD5f/PXbYF/m98kLO7wyqleslK8rLCrq2o3WukziZgy7U/aQ1pwf+Z4adVenlY0akB6tan8PxyiVh6313JyaNYOBOEf4uIXx5JHpwbTrAx2NFPXYLsyWS6H5Sg9gIae+KyJcxHJDOaypqTZRLrG3FJLRgJqZ6T+Ssp31JXEQ7aAqcnUNwWyb3fM/J9Cicftdu2j9lyy35zfVosHB7y3l8Ge8NdljCEgvgm6bhKYhQjYzrm8q37fMCX3JI0t72aHnF10I6/acV0VbSQEab58QMQ2zwG8Oph/Cd3QBCPoKBacRdTfWF+k6b4unnRNP/Jc4sSe1Uw8+P3sOMlagIo9TgVLpLPs0wDAUpUQ+snoUyBb3Lh+hYgi2bWA2nmQBLCnv7RGmI7HEdkQPYsf+WsLl5VOGroDpQvEwhoOGMibkgnECDDwlNF+joKN8PMAEDKMzyPKw/wFLT2P8u4oQClqveU19ZoviGJq3QCAFoeG+ZXfW0Qf9sj1abdUt57eRN1eMi05TqnffiysoV3mFMPtFJKHFb3UmolS7KDEWHt/tRs9qah6gzuL5GhUwJFg04rJPEnzI1SVZZJEIAXBg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39850400004)(376002)(366004)(396003)(136003)(451199015)(41300700001)(44832011)(36756003)(316002)(66476007)(66556008)(8676002)(66946007)(2906002)(4326008)(31696002)(110136005)(2616005)(86362001)(6666004)(31686004)(83380400001)(5660300002)(6506007)(53546011)(8936002)(52116002)(38350700002)(38100700002)(7416002)(26005)(478600001)(6486002)(186003)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkVoNlpPTEo1NVRWL3hjNkltYXdLR21rV1dCWVI0Sm1objAwWUJBUzJvTGRa?=
 =?utf-8?B?am04RTJINTUrbm04NGk5REZwYTNZd1FjWUNlYWtYYSs2VjUvdklUVkhhTFlt?=
 =?utf-8?B?R0djMG53dVJpd1YrVm5XcGc3MzdzdEtlTUFqa2c4OWN1MlNmVHdJQkFkNE4x?=
 =?utf-8?B?U01zMkpWTnpxQlUzS3pMZXRHZnFXYjZLSXNDVmFwSFhhaU5aS0hLQmc2WUZL?=
 =?utf-8?B?TjFBemVDbkJYY3dyaE1IOGN3R0kxQ3EwVWQzemFmZ1lhaTZONCtkTzlRT0JF?=
 =?utf-8?B?MjZxZ0EvenBxWVlEczlCNWt6NHV0VWhMbXlra2hBTXhDR2JvUU1WazZXRWU3?=
 =?utf-8?B?OVl6djZreUJ4d3J1SXBrdkN6WnlSUzRKMW54eTlLdFZMT2xxb0tSRVZkY3lv?=
 =?utf-8?B?MHhBU1VZdFkydTBKeGJBNkxRaElCRGx2MDZvY1hHM3piQ2VaRGdzcnBVUWxq?=
 =?utf-8?B?WWgvVDVnZGVJZHliYmw2M3NlQ05ScjFzNU9ic0xqSDRUeVJIdXFMbWE2R1Bl?=
 =?utf-8?B?dk1MbFJPOFR2OVd5dnVIT1VucGRuR3hqYnI3Uzg1TzJMVVdLTjR3cDlQOC9C?=
 =?utf-8?B?RXphZW00bXV2eE9yMVlYVFdyUFdQZ2xBcUxCTHM4MHZBUW14OVcxeFZPaWZ1?=
 =?utf-8?B?VWZNWkJvVmlsRFlHUHFvcmRiOE16MmJtWVl5ZWluZ01ldVZEYi9TcUdsN1FL?=
 =?utf-8?B?aFUzTHl4ekRadnh1NXdLUkVHSXd2TEZ2VVAvc2Y3WStuWjJTRlJjSHdDV1B4?=
 =?utf-8?B?TVpPM1k1RE9IWnJ4dXNmMFFyaFJPSGl3Zm5xV1hVRFV4VS9acit2bXlvKzF0?=
 =?utf-8?B?Wml0RDBheitCQ1RNb0lxY3M3eTR2K3JYNGJGTFg0SVM3Nys1L1pTaFQvSjBW?=
 =?utf-8?B?WEtpdUl6QjByMkxTdDRmSEFLb0d5ZjF5KzA4NnZ0OUljOW85YkpNMUJnZGlZ?=
 =?utf-8?B?WSs0bE9vZFJqNm5tRDdzM2k3UHh0OVA4aExuWk81TkZaeVc0YlNId29MTTVD?=
 =?utf-8?B?RGdIWDUxUHpDaUxxYXJiV0hTVkZnQlR2ZFpBbno5QXprV0M1SVBUY2ovcE1p?=
 =?utf-8?B?VTRxU3VseVNQU1k3WFd2Z1FMaVRGK01CMVZxNTZMREE4TzU4MFlPa0ZwNWtn?=
 =?utf-8?B?MnY4ZUZoVmpZK091U1VzckhuKy9oNTFQZEo1ZzRGenJxTkhsUEVxUlVEU2sw?=
 =?utf-8?B?Ykp3N29OSklOS2MxcE5GSnFrbTlhNWRHTHdjTytPaDBQS1BpSDNzdjkvbThu?=
 =?utf-8?B?bXVyRXBrZThrMlZCc1hqaUM4MGoyemVmWmdCaGZLZTd0Z2lUbDRZL1IrV1R5?=
 =?utf-8?B?ZUJFbVJGMGo3TEZWOXpyN2FNZW9nc1k1RFBXT3laQVN6N3NKS3FFQXloWEYy?=
 =?utf-8?B?M29seTZpVXdxMFo3bFFla0hweGplL0dFZVpaZzM4QkxXZEE1SFpNNDFhMjR2?=
 =?utf-8?B?d2tacGpROXErY21CZXpDWkRWTjNKRWVjb3BmeXNPNkhMNmFNaXYrcWgyNlMy?=
 =?utf-8?B?cDRtZHdTOHcybFFwQnk1L0M5WmM3aCttN3lLRXVkaEJhdE5IM1Z2OGVqWjVU?=
 =?utf-8?B?b1YzdzRSSTQwRTRqNjBLa3k2b2dTM2xKZml6REllTHdBSUJ2c05tVFlwc3lX?=
 =?utf-8?B?RXRmV0hJTnBwOGN4VHNqSXJqL2dGOWxOMGlEY3QvNk40UlNiTmJJdmcveXVy?=
 =?utf-8?B?eHM0WVRxR1Y3VGRZL0J0Z0tQNVNDL3E2djZyUXN4WjJ3Y1k2M2pORHhYdWU1?=
 =?utf-8?B?SWV1Tmx5dXhTM1Ewb2oza0JQeDNwUG5EQlNMeDlwTXhMOWVIeERTSWNrTDNn?=
 =?utf-8?B?ZGZ6WmNOeXRVcDArZjRvY0RFWS9NOWt2bzlVTTg1cDRqM1NxbkpXMU5Jako1?=
 =?utf-8?B?VnJ5by9FRDFjd3gweTRIT3dYcnM2TjQ3QzMvblpJbTY1eHFJRWlzWVc2bE8v?=
 =?utf-8?B?TlZRK3RCclBkQ3pEUS82MmZxYXBRdUNpN2RPbXQvaFo2Q3lQdEJrN3E5N0tX?=
 =?utf-8?B?clV1Szllc0dWMVNyRXp0cUI5Q1lzWWtWZEkxWk9MMHJJQTlqTlFsYklxMHVQ?=
 =?utf-8?B?cXRvbUtzdTJveG00NDVDdUR2WHlFRlVibUlYK1J0ZEcvVjZoc2NMYW11K0pN?=
 =?utf-8?B?eW9nKzhUNzNmYSt3eWN1V3pLV3dhdnU1M2pMYWR5MW9tSVdWeXRRSGpBaWFu?=
 =?utf-8?B?VEE9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81d4b583-f235-4059-2142-08dafa533f08
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB8847.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 19:27:47.4803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fYja0mjQSnVJwUoEwThzG83T3o1F/8Pusa8qMjs9ljNHFhXYgE5797SEmlr1ASrFewpCz2foffFfhTueA6VIKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB6313
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 1/11/23 10:55, Geert Uytterhoeven wrote:
> "make dtbs_check":
> 
>     arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dtb: clock-generator@6a: 'idt,shutdown' is a required property
> 	    From schema: Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
>     arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
> 	    From schema: Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> 
> Versaclock 5 clock generators can have their configuration stored in
> One-Time Programmable (OTP) memory.  Hence there is no need to specify
> DT properties for manual configuration if the OTP has been programmed
> before.  Likewise, the Linux driver does not touch the SD/OE bits if the
> corresponding properties are not specified, cfr. commit d83e561d43bc71e5
> ("clk: vc5: Add properties for configuring SD/OE behavior").
> 
> Reflect this in the bindings by making the "idt,shutdown" and
> "idt,output-enable-active" properties not required, just like the
> various "idt,*" properties in the per-output child nodes.

IMO we should set this stuff explicitly.

> Fixes: 275e4e2dc0411508 ("dt-bindings: clk: vc5: Add properties for configuring the SD/OE pin")

This was intentional... not a fix IMO.

--Sean

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/clock/idt,versaclock5.yaml | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> index 61b246cf5e72aa47..a5472bbfb8d1fdcc 100644
> --- a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> +++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> @@ -125,8 +125,6 @@ required:
>    - compatible
>    - reg
>    - '#clock-cells'
> -  - idt,shutdown
> -  - idt,output-enable-active
>  
>  allOf:
>    - if:

