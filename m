Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 255ECEB64D7
	for <linux-clk@archiver.kernel.org>; Wed, 21 Jun 2023 11:24:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232123AbjFULY1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Jun 2023 07:24:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232729AbjFULYZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 21 Jun 2023 07:24:25 -0400
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2103.outbound.protection.outlook.com [40.107.13.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C00A3E6C
        for <linux-clk@vger.kernel.org>; Wed, 21 Jun 2023 04:24:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e1Bj4U5KBVrDMHs5ktwwkGsa7NSIhalZd4eZlwsfa14OnJ2Zj3kyozLzwvSAG+tSmF/ZJH07wngcZoLociSyoc/BVowjFYlioAedvcPQbVENhnJ9j+LVNlLUc0lrzGUGxGtSfzqEYk2uRDE4o5VM+dFyw1+CfbY3mmAxK/9Tpmwxu65zlMPb3xl+2qqnC1GrC1hRLHWOVBiVMmDYYPqMkjNd75KOFq7WSnj76dfJuKM1Z54FJZCEEfXYshO2z1AREZqRpnygzosFmKQppmmi4ZKunkdRggq3bZ3hjGQOZOUtIcWZwtTLRcn/huwPDmcAxOf7D0OKfaVi4t8utAQxmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/f42+rLOYYqXgWth1V1tyHINgMj8ORNHyrYfPejNVgE=;
 b=M5zFxEaji8UDpVeTcJOE/rTSLgGfsrkPc7UAiSMr7neY76tSmjTfvBSIY5UjIReOtKgiJOyuzG0qya6dZM3mrp2VYgyViipr6kMDATldIyJP2jhABnglAlZTWIBV5R4LY3KOQNSvE5FyPXaFon2fnbzvIcJCK/VfQP6U+zSK1gEHKUuzyQyJFteJrYL98sHmCDPt+V7NukdsPSVkPh5krlzmOcoHjYYG9LoT3Hpt82rDJJNCBUK4lKQY6g1uWQd5ovg6is7Ynm4rK7engeIN9+SAQqt/tYUB6Rc9bnwwHd1S0j9OHERbuPqtysK7dkf/4eBvhYH0kREVHiXLKbHTRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/f42+rLOYYqXgWth1V1tyHINgMj8ORNHyrYfPejNVgE=;
 b=GjfrSEMk42JlU7ZJUKYoR4bza6MfPmMeOTJdLKj92LKs4YvMq70/pA5CRAtM1RbX06lfXNM11aoF+CgeCL7dPKV4QXBQlgWS/ZLTG5t6iTDAK+k8jquKNZyi8PUsZGzFepVaG4JOJyh4XN9IGCOst4sqNY4fZ5HZgQowP5Q5zQE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45a::14)
 by AS4PR10MB5248.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4b7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Wed, 21 Jun
 2023 11:24:15 +0000
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d66c:ec:aa54:f318]) by DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d66c:ec:aa54:f318%5]) with mapi id 15.20.6521.023; Wed, 21 Jun 2023
 11:24:14 +0000
Message-ID: <ca6b0f0b-3f0d-8e4d-c857-8c6515250782@prevas.dk>
Date:   Wed, 21 Jun 2023 13:24:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US, da
To:     Abel Vesa <abelvesa@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-clk <linux-clk@vger.kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>
From:   Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: bounds of pdiv in clk-pll14xx.c
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0071.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::25) To DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:45a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB7100:EE_|AS4PR10MB5248:EE_
X-MS-Office365-Filtering-Correlation-Id: b7e0903d-7014-44ee-5840-08db724a0b64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EPMOdZGa46hjl3Oj53JI+yMbSbfI/h1QaEZnMnF6bawDKTIHkp2nnK8KVaLHc/bg7Np1ocEtyGVge3FlMtZIAnONntF4BwiYXQCdXUYeeYPlLpBci+I0KynBtfRrghOwiPCOA2MNGOWerASqjrXMZJRH4sJGVsNkaUlaWyg/7xbryFFCbgPEe0rgc+QRjszszRhMxDSUVWc7P+alySbrGun1jEyus29G2L9oXh1i0zaGNPfyh6ZLWfRJ5pGsOg+UUp8FX1afW2Onw4pbF25GfzKRkcwRwhGDGmjGOZfa2WyRHgv6xzHsZDSiZpl1czpsQsZALlaylxYSZexMUzINEDg4MqPzxLddvXNuriV9Lq9IxaczSD21GOI08vAsQpZuriGG4/f1m296MtXqWmOaLg8sD8vlSiyCVWPdvi8OOCCm9avASigqOGLN8gOdPRrp1QYECP9J1XMJTVqNs62UJgWm3VwVGau5OL2sOEoJC7TzMi33odzme45hYPMvWlTBMy29O5ppUj9T/g25pZy+vWAoystDkUFegzL5UGSucplHccMQfuf6LL1QaB8yVR7taycTRVh8n3oZdDjPlTzX4SVr0as+MiiZojIkpcFeJKCo8RVdeERYwfEnEuzAkmrrpyMm20buH8tofJ7xuNSqAMlkJrVOWs7F10omLqBDS37DbpDZPonvjUQePxKxH1rx
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(366004)(39850400004)(376002)(136003)(451199021)(31686004)(44832011)(38100700002)(6506007)(26005)(6512007)(5660300002)(8676002)(8936002)(8976002)(38350700002)(186003)(316002)(110136005)(478600001)(54906003)(36756003)(66556008)(4326008)(66476007)(66946007)(2906002)(41300700001)(2616005)(6486002)(52116002)(31696002)(86362001)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cURWMkdFTndDTEVhcis0Qkd0L1g3RlRJT1YxeFo4aHdiUExzQ1duaC9XMGd6?=
 =?utf-8?B?bjFnczRScjVCQ3AwdjJUcW5zK0lNRDkvckJXbktPakZKWm5DZkJxNWdZcG5L?=
 =?utf-8?B?bXZlV2lrUEg4VmZCTGxyNFJGMEovQXlQbjZxaG5vNkpyUUUzd1VaVWpTUTdV?=
 =?utf-8?B?bjVzUVAzVWlmZFJ3U3lSNStVeUZyTHkyc1RFOFNxZFMyUWpDNzBBVk9JMU9s?=
 =?utf-8?B?TFh3ZEUzdnlocVFaSUxyVUxpT3pEakpOc3RUSXNnWEFIUTNsSnVwZFl2dmlL?=
 =?utf-8?B?MGN4Zm1GQWdaZTZMa3VUZDA3SFZlbVZaWTZXaHcxcVNlQkpDR0pBZjN1dGh6?=
 =?utf-8?B?b2UvRzRNRzhHbEdMbkUrUjh5SERoSTNhV2JaaTlaZ0JYRzJRcDQxTGVGaGJU?=
 =?utf-8?B?MnlJMTlxN0RKdTVBOWhGUFA5dlZvOWRiRlV0STZqcUxWeDgwZWs3M2UwbjFO?=
 =?utf-8?B?cWZ0Q3hjOFBzdk5YN1ovY2g3NnBTODNrU2NudGl2MEltNjg4UlZkL1RRU1ZR?=
 =?utf-8?B?YzFEQnlXeXVoRy9UYWlPaWdSMS9xSmRQVmx1WkxRa3hERWZOYkF1RjhRMzNT?=
 =?utf-8?B?d2pCTG5GSEZsTzh6N3phSVhYWldjS3BLWUlxUDlieW4rdkpFUis4UmVDVmN5?=
 =?utf-8?B?ME1xRExNV1QxdTZpT09uemdtKzRZeTF5b2ZDQzl3Zzc1aFpvaWpJNGR0Y0Nv?=
 =?utf-8?B?N3hycXlGVGtPTTBBZGIwdDh2bnFXRmpDQU1HSXR0eEdkZ1BwRmRsRFdPR1N1?=
 =?utf-8?B?U1R6MnJ5eW9UQWJtUnFTcjFmZkhBbXRTbFR2KzkyeWs2OVNTNWpaYUdVbysw?=
 =?utf-8?B?dlY2c3lhS1V6N1ZmdU9EcGwwUDAzVmplTGx3dFZBMUV0UE81SHdJd2lPMVJJ?=
 =?utf-8?B?emNMQmpCSStFUkxBc1YwK0RFYm1pRHc3TU5tQzBHd01Xa1gvdWxNRmpnVWFw?=
 =?utf-8?B?amtVbVJDQjZtL3RQM3RGbXRGWHJxTkRmVHdKR1FjRXZuZnIwaGlDOEhRNXpX?=
 =?utf-8?B?T1pDdkdPSERYeTIySWI5Y0lMdXhVMUZya2w2RjFmbTcySDlOblNFdmRQOXZR?=
 =?utf-8?B?ZXlaMjlOekVCdDNaU0NGam00aFJ6VEFKTE5uQVpsNGhCMG1rWm5qOU8raGdC?=
 =?utf-8?B?T2J0WVNOcDNsWHZFdms0NTJVSHkyQm5QVlNKeDV5MHB3VWxkWWJISkRQNWMy?=
 =?utf-8?B?eUlyRzJWSXBRU0kwMVRkL2x3Q2NqV1Z0K09EVWxkdnpENkVobTFrOStmdHov?=
 =?utf-8?B?eExCWW96UnM3VlJocDRudngraVc2SCtQOWY1Nk5nOE54V3FsT2JoYldKRWxF?=
 =?utf-8?B?SkdQZ3EwbFhXbDkyZE1zaHhvb0YyS1NobkRlc3hNYkRISGs4N1h3cjBqdG1D?=
 =?utf-8?B?RVFtNmxaZWc3bmNvY1FkTUF2ZlVEUHNaMHl1OWpva1V5WUtTeFFhbnFEVjd5?=
 =?utf-8?B?NnhKUW9ISlo1dUZabHZVUFNSajlhS3Q1M1VmMzMyajFuekZxbHYxQkFHSTcr?=
 =?utf-8?B?ZUJFVCs2R2UxeWhNUmVEM0lBbkExaDZoZ0RPQWtTTG11UTVqZmwxRzliWDN3?=
 =?utf-8?B?VmhsNmdnc2N0bWxXbGJxR1ZiQXBnU0gyTXhiQmVuMG9KU09YM2o4emwzUlZU?=
 =?utf-8?B?dFMvN2JXVnBOWklRajlpS0JrOGV0Tk1WZmNWMW5YOTRwcVZTODh4RG9BbXhz?=
 =?utf-8?B?Yk9jd085eTd3bm1MNW83Tlc0eC9iOHlGWDY5akFzVEpjWmpVOHZodzlOUzdk?=
 =?utf-8?B?UFRxbnVSQnQ4U1o5b2ZqSmdjK0Q3M1BvQmRsWlNuL0kzck9Ic1p0YTgyK1V4?=
 =?utf-8?B?NFVNWGVhczRFa1k4ZnhhYjVoRU9wdkNpUW8xZnNJTzM4Wk9SNjZvV25DQmdD?=
 =?utf-8?B?Nkc5c2R1U0dTaEh6VWFrcmp5RUtRdUZlSzFoNjRFN2JPaWlvejBBaHM4YmFu?=
 =?utf-8?B?N2g4WG5HM1dCU2ZjYVR2MEh6anMvdGhNdGF1U3hDY2RwRndERHJBcUtkd1I5?=
 =?utf-8?B?RGt3d3ZkYmdqSXVzWmZqZEk4VVYwM0h0blRjTU4rVE91SklkZy9kNjlEbWQw?=
 =?utf-8?B?YllOQ3A2c3dyUkwzRnpOZkkrN3o1UEYxdTdxV1dxR3JPam9jSFZrR0hnZFE4?=
 =?utf-8?B?QUhlZmFxdC9QSVRhd0RsWTZwVDJjZjM5RUpCQm5qejBsVmtEaXBrdWZxM3dB?=
 =?utf-8?B?b1E9PQ==?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: b7e0903d-7014-44ee-5840-08db724a0b64
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 11:24:14.8719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z41AXnvAXuuG8Xzy3e0TWMxBr1+gHzQrhI0spW7dtC2SYZuktTh/+vVl4NVIcZeNJojva/DrhwdJMx3GNdY7y+7d0y+ICOn9VdAZynXmPQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5248
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

I'm a bit confused by the range of pdiv used in
imx_pll14xx_calc_settings(), introduced in commit b09c68dc57c9 (clk:
imx: pll14xx: Support dynamic rates).

We have this comment

        /*
         * Fractional PLL constrains:
         *
         * a) 6MHz <= prate <= 25MHz
         * b) 1 <= p <= 63 (1 <= p <= 4 prate = 24MHz)
         * c) 64 <= m <= 1023
         * d) 0 <= s <= 6
         * e) -32768 <= k <= 32767

and those values match what I can find in the reference manuals for the
imx8mm, imx8mn and imx8mp SOCs. But the code then only loops over 1 <= p
<= 7. I also don't really understand what the parenthesis

   (1 <= p <= 4 prate = 24MHz)

is supposed to mean. Is p restricted to <= 4 when the parent rate is
24MHz? That doesn't seem to make any sense, and in any case the loop
does go up to p==7.

It also seems that the built-in entries for 393216000 and 361267200 are
suboptimal. Using m=655, p=5, s=3, k=23593 would give 393216000 exactly,
and that set would be found by the loop if it wasn't being preceded by
the table lookup.

Similarly, m=151, p=5, s=1, k=-30933 would be found and results in
361267199, while an exact match (well, at least within 1Hz) is possible
with the wider range of p values: m=497, p=33, s=0, k=-16882.

I could understand if the hardware also imposes some limits on e.g. the
value of intermediate expressions like (m + k/65536)*F_in, but I can't
find any restrictions beyond those in the above comment (disregarding
the mysterious parenthetical).

So, what's the reality here?

Rasmus
