Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D79EB64D7
	for <linux-clk@archiver.kernel.org>; Fri, 30 Jun 2023 06:56:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231593AbjF3G4F (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Jun 2023 02:56:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbjF3G4E (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Jun 2023 02:56:04 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2065.outbound.protection.outlook.com [40.107.21.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5195E2D4A;
        Thu, 29 Jun 2023 23:56:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dkywAwivI50CI4WIGNEriqpGogysvXyFU4ZnO9pEyokC+Khb8Gsg/P5vW+FdUkZgZhSiiWcF/mXyaW9gD1es4L/6ZXXu/wHCcEkJTR/zgIJmvNOpMj3Mfa5B7e4euN4fo9IiHXvREd0FiKAODC/gwhieEw61pIruniaMYQ3ucq2MUqbJksrGaIXwn2FzyklAvmtCBLajYUOGP/0F+AXAN4rqaKhjVK6N2z1ULQs1+Aax9rHdw1q1n554d6ovQvVVAgSub5T0ZoNNOAyDlskwATzOXlgL06YDrj9Msht7hB6q0eSl9+vxIIuNlfTtJod/27KCBkozFzgW25rto1T75Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=axHy3gkBS2ODk75Vn+73CjWznSMpAMfBBmFs5ofcOQA=;
 b=b8jGNolrk15wwTHWaUYYzT0aRVZXem1zNNzNsK0UZA5ytE2w8K5pQdX8cLf0WX6fqyMngIdtB7cD1k14G6+fiE8HNXomzXO85FyC6KANutO+dW8FsBsBs6q5rqXBjGij3r+Jzkj7NBMRNxreygSO4fR7tAD/7821VutcNhatm1Eb1WWire/Qm5xVp9+do9Nt0Ut9+n78cv0uPvRnoke2NZvy8MQfN5zCrNBlMWQjGmYJCkq6gbYjcZtGx9cL14wBXFG/LDksEEE1RkifLj5myOOFZDN7vhNoRg1Dz8hzkdEUzvdihpSDXEPkSNoW1BL/uDUpx1mir3ShiN85fmiVBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=axHy3gkBS2ODk75Vn+73CjWznSMpAMfBBmFs5ofcOQA=;
 b=DB79DY1nXnG3QBN0F83G7uT3qmZlRFr+mmH/Da3R4P5YnVq3wkUoiMAAMkhExDSbDsq7fpW2mWB0tIiobsm3NI9UAJ7IUbTlLrYGaIEe6OG9mZ/G0MmpcRwcAf8lE5glbMI6dLqXpRxW+Me8lRIj21IwF7Z+KXwIEV3Sd+wcuZ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AS8PR04MB9510.eurprd04.prod.outlook.com (2603:10a6:20b:44a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Fri, 30 Jun
 2023 06:56:00 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::efff:43d6:6f46:eea]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::efff:43d6:6f46:eea%7]) with mapi id 15.20.6521.026; Fri, 30 Jun 2023
 06:56:00 +0000
Message-ID: <e81f1e3e-2988-4986-dc94-18776cc46628@oss.nxp.com>
Date:   Fri, 30 Jun 2023 14:55:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 3/3] clk: imx: Add 519.75MHz frequency support for imx9
 pll
To:     Jacky Bai <ping.bai@nxp.com>, abelvesa@kernel.org,
        peng.fan@nxp.com, sboyd@kernel.org, shawnguo@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <20230628061724.2056520-1-ping.bai@nxp.com>
 <20230628061724.2056520-3-ping.bai@nxp.com>
From:   Peng Fan <peng.fan@oss.nxp.com>
In-Reply-To: <20230628061724.2056520-3-ping.bai@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::11) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9417:EE_|AS8PR04MB9510:EE_
X-MS-Office365-Filtering-Correlation-Id: d77b1840-b27a-4a72-69ae-08db79370fcd
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g8Zu8Zp0Ybe3XIhu+r8VzOItIpGUD0olWX7+if113dXUHDnl3xaodFlRo7ABfSxhi6m7AcoNjaTAcrYKH/KCYXe+Sqhl1bX3+wI1RqE+vMvXYp8x/Vz9JUM0ByV7Eza+bpjBMRtPth83jnJDKB32nLZCnTyH3yHE2TTq1Y3Lz4xRXLvLeIi57+7jtWIQmWEWYmdZUqWB97eTG/Ph/xsEjlufKYfDXy+mMAlh5HicE0ArTzvCC3xwrlO2l0A9yUxuqHadeaxlvE2D0OAsONCkWcbPW5PfvHjbzKvhINmM0Z1HlzfqpcZHJhNs1kGJnx1gPW9l88JqdNq98Ki8u/h5Ha/jS9zH1dvvS+LrHDdoZbGv9vuHKvsK1Ctbu6BImxIfKCYrh4BGq8sZRhtsYC1g2o2MT6tvUfM/8K4urfXD8pwoQEVDqQM38tQzXGZUjdNcZYjGut6qdZQwwkX2I6yyzNkuoF3bWhrYMg3BlRAvnbUmYrY4XImZU+1UqAArrQaxQzkGq4iKCpvQXzVJT0l0N9VvetpJyFYDYZ+VHpQur3mRJIKa0W9CVhr3g8KG/0Ij7pydcEyiV2jGLA3AF70wisJYJG3b+B1HR9bXSznYdQYQUxHenOGScNqjFgSR8VuRe6UPm37RhKjL9pXK2dz2og==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(136003)(376002)(396003)(366004)(451199021)(31686004)(6666004)(8676002)(8936002)(5660300002)(478600001)(6486002)(66946007)(66476007)(66556008)(4326008)(316002)(6512007)(41300700001)(38100700002)(186003)(44832011)(2616005)(6506007)(26005)(31696002)(86362001)(83380400001)(53546011)(558084003)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjJiY2JlK3JrdGE1UWZ6UzU2VGMxOWlBc2NrTXhPZ2lsYkdJUXFVMWsxdG8r?=
 =?utf-8?B?R242bG13UWs5UGEzUFR4YlZETFhNaGNDV0NkcDg5cHJ1MG1kN1dwU3lja0w0?=
 =?utf-8?B?M2dIak1FZGpSTU00SHg3ZWxxcS91cWUyeGRuWjE4dmsvV2ZVUkxQcGt2eFZ0?=
 =?utf-8?B?Q2RZSjBjWHMzNHZrS2FJZWlqSTRrZ0Q5RVpLVGs1M3ZlQTAxUE1HNk9IVFQx?=
 =?utf-8?B?OUhMSFMvcHM1ZytFZFY2RHRJUWs4L1F1MGNoMTF2RFFkWnV0UlRROURNdDh3?=
 =?utf-8?B?aTdzWUJ2M2VPL2k3aXd2S0JVQm5uckVVYnZvdXJwSm9HYUU4aHV6aUwyNlR3?=
 =?utf-8?B?RlN4dDhIdGZhMDVDekF2Tm5XaitrUVRoU3Q2bDM1YXhNRUJMT0lOdUZxdE9x?=
 =?utf-8?B?THg1d1VXUDkwYUNzM1E2bm9FUSs5YkdyOGxIZmVIZVZvcEdvTkFEOHU3S2NG?=
 =?utf-8?B?bWEvY2xWR3B2UVZNMi9NSEJGcHVUV3ZjdWExV241WDZCUVQvZ1J6Qmw4VVlD?=
 =?utf-8?B?Y0s3S0Q2VS9oM0RVRTkyUGtsV1dCcFQ0OVdWaWYwM0F2bWR5UWY3MEw4WE5p?=
 =?utf-8?B?QTEwK2I3NURnSHd2K2ZvYlR0RWZ6NlhJOWc3UGt5OUVhTkJLSUpkbzRrNFNS?=
 =?utf-8?B?bTRnZ2huM3psck43K2VtUTQzTWpySVVoaS9DR1I5Q1VJY3FiZitXaVNrQTU3?=
 =?utf-8?B?MkFDNWJiUGxramloOEpzVmNGN1puQy9jcXB6eUplNzFvTjY4WHRTSFVKbnFM?=
 =?utf-8?B?dGE3MEJyenFOU2tsZ1lvcWxBWXg4S0ZKTStNNHd6WXdhTTlTZ1BVaklPei82?=
 =?utf-8?B?dE5USjdRbjhBVHdUb2JSQUU1eVY4dkRlS2IrKzJDbGtzaTNWdUdYWUlCMDNX?=
 =?utf-8?B?Mm16S2kzVmxFeFVHajhhN3hJVUk3S3JVeVRHckNCci9jT21icGNmQ2FDMWkv?=
 =?utf-8?B?aktkTDB0VlBxR1lHd05aQ0NNeXZwZmpkUDBtSm5QSStKeWptMEUxN1ZXUzBn?=
 =?utf-8?B?QVFXRzFaL0dIMmpBeEVmTEprcnpuc01vQVdWQlZ5c29xZGpmU0RhMmFkOTcw?=
 =?utf-8?B?aHV5NlBBWFpLdHhZa3JDbGNCdCthRkwwQUNyQ0hHVm9VTS9rWTFWTFlZa1Fn?=
 =?utf-8?B?VW1wbGtoVmdzRFJpVXpuejVYYUdjbzlCdHpSTWRGejFpeURVOUZvODMzT1RP?=
 =?utf-8?B?ejRrM2lRVE9DWmY3OGhFVXdySFluMzVnWFhHQXd0d2JXSXRKd2FhdkVDR29J?=
 =?utf-8?B?cy8vNjNGdFZuMmdUay91NlpZL2VUUTRNRzFieE5HN2FMcmcwVWVvU1h2Nnls?=
 =?utf-8?B?VmI4aFFjeFpFd2N0OEZHdnprSWtObUYzS0t3ZFpacURRZXNIdFh0WTJ3SXM3?=
 =?utf-8?B?Qk1xNFV6dHMydjJ0YmEwcnl1cHNURnJBTlhXd0pXeFRvSmx6Z2IvWUowTmlG?=
 =?utf-8?B?ZUVLS2k5TGlpbTlmQlhXWWVhOW5hdHhKbW8yRnQyQTNPTmZsNXBjVXNOOGxi?=
 =?utf-8?B?a255MmlJWW0rckJjRkxwbjBLWWFRellRVDcxd2dwSVp1Y3diaVhZQXYwRDFV?=
 =?utf-8?B?TWtJWmhERnIrZS9iZU5sUGlyMkNxeGVUcFR6TU9sVGdCWkVDQWk3S0pOTjBt?=
 =?utf-8?B?aEw5Q3c2K2ZEZEtaOGNJSmJ3cHZud3pFQmxETDU3bWxlTVVGSmZuTkFoMWFQ?=
 =?utf-8?B?UGRpaXA0cUREYm9rUHFxaForc1U0UkpSNVpqZ3lSWHE3Mnh3Vm9xU0kxY2c3?=
 =?utf-8?B?Y1ltOEE2a2hGU2NvNSt3eVpxYXN1blVRWE1NWFJpdU1aVjcrUUNlc0FyQzNQ?=
 =?utf-8?B?VUlmQm85MCtKVlNUZW54NitsNWZmdzZwK1pPc1V4cExMa1hPQ1cvZ215ZEww?=
 =?utf-8?B?T3BsVU5tYWQzZlF6MHg2dnNYaWQwY0xrc2lwUndRaVpuREhQYzJ4K3FYWHFX?=
 =?utf-8?B?ZGo5czJTU2ZvWlN3UHJUdUQ5alFjUlB0c3ZFUU9nYmp5UnBVSC90QXcwblBB?=
 =?utf-8?B?aENxbC90a1MwNlpGV09wNVZUK2ZMY3hpdmRaZjFhNTVDemRZZ0xlbmR2VE11?=
 =?utf-8?B?UUVFbDBLdWdtWFg0MmNsRHBlcm1RWElZemgwSDZlT3hydTQ4bEUyck0wNUkv?=
 =?utf-8?Q?EL2sz2/3D2Zsxc2VEvQp/ZJ8H?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d77b1840-b27a-4a72-69ae-08db79370fcd
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 06:56:00.3124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4R8rBA9ekLQFvmQIW5+0c7iR8mFbMjrCzFroeOPXXc0JD7WHQtgsrZan5Hc3aE36Nu6LWPNaU4b/WB+PYUVUPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9510
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 6/28/2023 2:17 PM, Jacky Bai wrote:
> For video pll, it may need 519.75MHz clock frequency for
> the LVDS display usage. So add 519.75MHz frequency config
> support for video pll.
> 
> Signed-off-by: Jacky Bai<ping.bai@nxp.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
