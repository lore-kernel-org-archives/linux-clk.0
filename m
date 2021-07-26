Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F326C4338F
	for <linux-clk@archiver.kernel.org>; Mon, 26 Jul 2021 16:42:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E5B160F57
	for <linux-clk@archiver.kernel.org>; Mon, 26 Jul 2021 16:42:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239532AbhGZQCM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Jul 2021 12:02:12 -0400
Received: from mail-eopbgr80087.outbound.protection.outlook.com ([40.107.8.87]:14722
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237911AbhGZQBn (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 26 Jul 2021 12:01:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IVkDb61x/+zsYvorpTm0kQUt70kyjBDYW3pkYpVI3oeFRfHbsQyLBP42iyOb+3/+EID0fRBZz63fxIFenyukwSwBBcfAdOv2CbNe/3GDiBSWfB/W9bk7Z6nvZgDOiarD3OoanXJ/ExSr88IS6vyp4ScObcOnQehEc39n15HDUTYvMjAhNOxsdGcp0GafM0W3otinGl9gcMjy99j56iInyhP81N2goYLILFXzdiD3RXTsBCuN90X9rkbIMdADDWfe7ngEhCwui5Kg0hX2qQiqupYOvy0u0Goxnngg6UHpf38Yd/l4N5Vpclc3+zx5ISc5yCCx6YeLVEI5XNgJQLLlaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=beGbvGY2HopHZ4vGFa7vbtmuVlYjCK9VtJW/8MMZwzE=;
 b=hSKOkhw175eNV5O2zKGYS6VnDcGyg011ZAvISiJ7fEfYIt8cfppZVBJVbj6ykJ0jQA/tj672Xh03UdrVPpwox9IDHchxrZsVnjodaoTou2Ls0JYrJuRyy08HCCv61uNzyrUtcUuLNukcaELIsNj9kXNoHi+QxeDQ0qiMAdOwbHGh4gSBKoNuah1s9Y+fnRRI1+YEMcQfflnaM0vZiyPYrWEsw0YJw7lmzNQBlXYUnHRE6sOloluq9psy/MSdi3NhQRhitZBcsreiwVKVgCYRTCGKbj6IDUW9iu/zlnUtyTUbTCDlG7pHGRU0QglteDCGIcxhQFKmVaJHcn3pwaLvdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=secospa.onmicrosoft.com; s=selector2-secospa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=beGbvGY2HopHZ4vGFa7vbtmuVlYjCK9VtJW/8MMZwzE=;
 b=n5a9rnY/Fy5/VQ8dx3tDtJ8e74GY10/b6gjKDONDYULIl2nz66QjvNybvpqtrzDceDiPRjnHyqRcWpdS9NBbNB4yLjROsI4NHB+8U6CI0P5IrLFfktJBhqCnJcRsRWHAebssXvnig4OvPd/beDJ/2g6Qj4b4dmilmibCDAy7XzA=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
 by DB7PR03MB4521.eurprd03.prod.outlook.com (2603:10a6:10:18::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Mon, 26 Jul
 2021 16:42:08 +0000
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::dc6c:815b:2062:d1f1]) by DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::dc6c:815b:2062:d1f1%7]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 16:42:08 +0000
Subject: Re: [PATCH v6 3/3] clk: vc5: Add properties for configuring SD/OE
 behavior
To:     linux-clk@vger.kernel.org, Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Stephen Boyd <sboyd@kernel.org>, Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Turquette <mturquette@baylibre.com>
References: <20210723231306.674310-1-sean.anderson@seco.com>
 <20210723231306.674310-3-sean.anderson@seco.com>
From:   Sean Anderson <sean.anderson@seco.com>
Message-ID: <83dfac41-a314-1a9f-d975-2ee18b6985ba@seco.com>
Date:   Mon, 26 Jul 2021 12:42:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210723231306.674310-3-sean.anderson@seco.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:208:32b::11) To DB7PR03MB4523.eurprd03.prod.outlook.com
 (2603:10a6:10:19::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.1.65] (50.195.82.171) by BLAPR03CA0006.namprd03.prod.outlook.com (2603:10b6:208:32b::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24 via Frontend Transport; Mon, 26 Jul 2021 16:42:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40e5b5c3-0dea-4f86-7732-08d950544ed6
X-MS-TrafficTypeDiagnostic: DB7PR03MB4521:
X-Microsoft-Antispam-PRVS: <DB7PR03MB452167260EFF318F6120CBAF96E89@DB7PR03MB4521.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OrNNoey5a3vObe++lH31Od36jB5ueTWTY5x9nxvi7m+0V0YlswrMoj2ZxIUlQc1dE7tNvVbYZThQ/7V5M0bTypH/V9qnwubGHMgx4gv+CEuGxPlyWoDles7vpkdAX9iQsU+aim/m0vRM0i+vROClpIGFd0g+HyoJheGKcOm3Z8vpzS+cR8oudTmuBDsNSSniM0F2fMb2WFtQ+qVQiBNZ4Ool3wQH7KMq2rFBAJECKAWFTsgDAWK5Q6rni9sfKH6D8H7i680Ks8uNuClg6qFoGVQPrQedepo3yst/s+CkDjI8u2bxTXfx2vC20fIVXytayGoDyFtuE3l34U5s+uFIS2R+qIRI0PpMIXkdUNPFQOwYolZPEJe1ftPaqjF674SYGCYoWPIYMSLUUmeuil9F3/1jOfejfVxEuLhRrNmS74oOMj7bl0vNTkjh+ROXHiINEzDq7FrsQ947uNz5hUaoJLEHAO2fIERT2cBANXxq2HP8lQFGbyDSYvnJdUC0++5ZFl7mpiMe/Z7y4ivSTK2xDX+2KhINYn4lwpbXHuWYsQMyWHLyO3Ghh1IoTXYwqwAEMLxzayh0hfRKMeSi7gIoYL8DEp6cIx0GjiNs5mO+X+Dmea2AGVXukNZ1xW8IY69r+KE2QBhkz32JXpiJb3vWQvWvDDL8dDzfrRX1KFzhddfefTFfEp9TOzC4riO8IaKpbH0Ltffg0WC7V3ltoRMCqGItpJV+j3sSFBL2iEvpOBW7qy1aVZCAeh6M9Cxn6jeZG4zGZ8a2z0QX5R+cXuIy/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4523.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(136003)(396003)(39840400004)(366004)(36756003)(186003)(6666004)(83380400001)(86362001)(31686004)(8676002)(5660300002)(8936002)(31696002)(38350700002)(38100700002)(4326008)(478600001)(26005)(6486002)(2906002)(66476007)(66946007)(66556008)(44832011)(6916009)(52116002)(2616005)(956004)(16576012)(316002)(54906003)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1J2SXgzV3AyWnptaXcxTVJ4K3p5d1RkVkpVbWJ3bU5HSnlnT2RLUkdWS3Rq?=
 =?utf-8?B?RmRPbmpTR2R1OC9SOWhRQzdRYXZOSHNSNGZoT0h0SXdLMEU3TW1oNFdIRFR1?=
 =?utf-8?B?dUsybGpRZDRvQXlabnJ3a2ZHbzNaSGtuVkZpZm8ydmhIWHhaTElhemNWZS9D?=
 =?utf-8?B?WHFaT3pibHhUUjdhdjNnQzRaNDBPeERWOExpaHFOTHpYZmJLalhheU91UUdh?=
 =?utf-8?B?RHFPL05HK2cxclcwUkxHUFhQR3FQc0pURE5IblhmYWpMQnFiQTkxbDYreWts?=
 =?utf-8?B?Rk5LVmdlQ3plVWJnWmN6SHcvbjFGWlRVUS9uU0JyZlBRSFR1N2V3b2RBY0NZ?=
 =?utf-8?B?cG5RZU9DVTVrN1d1eE45azNBUFVsT1hGeGlpOE5mZFRBSnd6b2RPUWM4ZUJs?=
 =?utf-8?B?TEVKUDFjNTFNSHE5NTRNbmdMa0pHWTZJWnFZVmVvOThmdFR5VGVoK2Z0NDB5?=
 =?utf-8?B?TDl0ajltL3I3VTlEaDIwSDFpMzFzN0ZkYkdqZkRVNHZEWTNIRkJFL2ZBYjYy?=
 =?utf-8?B?QXpDWHMzV1Y2N3d5RFZZRDFVcEJEeGJpU1owUTRuOTlXRGQxcVRkaTI0MTFT?=
 =?utf-8?B?RVByRitldWkzaENyVktLVDhqT2F2aDBmL1U2WFM1SW5QcTRoaURMbnF4TUUw?=
 =?utf-8?B?OFdJNVVBdlU1WU9VSUhWeE9CdXBQb1U2SGNPY2dPakEvd1V4L2plcGpuN3ds?=
 =?utf-8?B?YTlJUDZLT1hHb041alQ5VXRZNzFsb1lISFRLczlFRjFmR0VmZHQxTE90ZmR2?=
 =?utf-8?B?SE11S0dVeGQ5OG55bzJNZXQ3UFpEYUllZDNXUC9lZWRjV2xvVk94dTArVGdq?=
 =?utf-8?B?aDJsV0FqNCt6K2R4SjY5dFhqSCtDV1BSTU1tUE55bURxcG55dXpxQ1VZRnI1?=
 =?utf-8?B?UFBoa0pWYkJtZFBYQkcya1p5NHMvb2x3MkhrSzEyMXlLdk5BaG9jVUVmRHNV?=
 =?utf-8?B?aE9zcW1sYVluQkFRbjhMaVNDVUpBaDZxUVloMFMwdEU1M01vM1RMekRLUjBI?=
 =?utf-8?B?TTlHejdreUZqUmhUVjg5ajltZjVYd1VqbTBvQ3RJTFVRMWNLejVVbzdEcGcw?=
 =?utf-8?B?QTVXdFFyd2M3K3Z0YUt0YWNRN1VkTGJVWkJndjhTQ0czS0lYWjkzaWtUODRY?=
 =?utf-8?B?NmRhckVTMjRwWlk0THA2THBjRi9qbyt3UTBOYUdyMHR2ZG5LTHV5NjFkNzZh?=
 =?utf-8?B?d1VzcHgzSmpVWS9CZjNRd3Flc2FkMHJCUE9yNFdaczJZMVRpTEdJcG4yK0NI?=
 =?utf-8?B?ZmpQMytYKzNxY2VQUWgzOXFscXEvdkhuVHA1TzU0bHFuR2xKWFFyL2tWc1dy?=
 =?utf-8?B?MlBaRUVIT3l6YVhzS1MwYnJORUVqTzNMNFAraC9LeVNVVDNQRStPQjZvWUZD?=
 =?utf-8?B?dW43cW80S2FFQm9ROXpRd0I0WUU2NHlNMFNTMjRGL1AvbnoxZk1aeXpBSkcw?=
 =?utf-8?B?UDZkYlBmRG4vOHA2b1VQOWwrZUZ0R0ZvYzM0eWFEb3JCc1hRS0FVdFNva1FS?=
 =?utf-8?B?em0wYXI5MzZpeGEycTArdlo5bnpCa0I3c3ZNUHg4VVhmVkRyeTlvc0t5QWRY?=
 =?utf-8?B?RVZOaW8vRUNwdzJZaWg0RWtWR0N4YzVhbUI4OERsQmFGUDhZay9vWnUvdjRP?=
 =?utf-8?B?QWlRUkdUUjZQSkhoQUNHbDhNaWNvUHN6T0hPRkx4V0t3NU5MTS9rTENjdHd6?=
 =?utf-8?B?dlZsZkNydGsycnBPdTRrb0hGTmpULzE3VFhrMHRqT1NQcjdReFJFQ3hNQVlV?=
 =?utf-8?Q?UOkm+fveZRqtNkP4AXE0sywJOpVCW9gf55PpYYM?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40e5b5c3-0dea-4f86-7732-08d950544ed6
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4523.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2021 16:42:08.1018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hlFN30SLyfeOu0DDWU7GMBJ7ahzVPqhgB0Wx5aBeXx4KWEI3mFI4YDEwAeqjblaXV4qot6z1835ZfHL53SKtQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR03MB4521
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 7/23/21 7:13 PM, Sean Anderson wrote:
> The SD/OE pin may be configured to enable output when high or low, and
> to shutdown the device when high. This behavior is controller by the SH
> and SP bits of the Primary Source and Shutdown Register (and to a lesser
> extent the OS and OE bits). By default, both bits are 0 (unless set by
> OTP memory), but they may need to be configured differently, depending
> on the external circuitry controlling the SD/OE pin.
> 
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> ---
> 
> Changes in v6:
> - Use tri-state properties
> - Drop Reviewed-bys
> 
> Changes in v5:
> - Use if (...) mask |= ...; instead of mask = ... ? ... : 0;
> 
> Changes in v4:
> - Use dev_err_probe over dev_err
> - Put new variables on their own line
> 
> Changes in v3:
> - Default to not changing SH or SP unless there is a property affecting
>    them.
> 
> Changes in v2:
> - Set SH as well as SP
> 
>   drivers/clk/clk-versaclock5.c | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
> index bfbb51191c8d..5b986894bd3b 100644
> --- a/drivers/clk/clk-versaclock5.c
> +++ b/drivers/clk/clk-versaclock5.c
> @@ -886,6 +886,7 @@ static const struct of_device_id clk_vc5_of_match[];
>   
>   static int vc5_probe(struct i2c_client *client, const struct i2c_device_id *id)
>   {
> +	unsigned int oe, sd, src_mask = 0, src_val = 0;
>   	struct vc5_driver_data *vc5;
>   	struct clk_init_data init;
>   	const char *parent_names[2];
> @@ -913,6 +914,29 @@ static int vc5_probe(struct i2c_client *client, const struct i2c_device_id *id)
>   		return dev_err_probe(&client->dev, PTR_ERR(vc5->regmap),
>   				     "failed to allocate register map\n");
>   
> +	ret = of_property_read_u32(client->dev.of_node, "idt,shutdown", &sd);
> +	if (ret > 0) {

Ugh, looks like this should be >=. I guess that's what I get for only compile-testing changes.

--Sean

> +		src_mask |= VC5_PRIM_SRC_SHDN_EN_GBL_SHDN;
> +		if (sd)
> +			src_val |= VC5_PRIM_SRC_SHDN_EN_GBL_SHDN;
> +	} else if (ret != -EINVAL) {
> +		return dev_err_probe(&client->dev, ret,
> +				     "could not read idt,shutdown\n");
> +	}
> +
> +	ret = of_property_read_u32(client->dev.of_node,
> +				   "idt,output-enable-active", &oe);
> +	if (ret > 0) {
> +		src_mask |= VC5_PRIM_SRC_SHDN_SP;
> +		if (oe)
> +			src_val |= VC5_PRIM_SRC_SHDN_SP;
> +	} else if (ret != -EINVAL) {
> +		return dev_err_probe(&client->dev, ret,
> +				     "could not read idt,output-enable-active\n");
> +	}
> +
> +	regmap_update_bits(vc5->regmap, VC5_PRIM_SRC_SHDN, src_mask, src_val);
> +
>   	/* Register clock input mux */
>   	memset(&init, 0, sizeof(init));
>   
> 
