Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B9E5C4338F
	for <linux-clk@archiver.kernel.org>; Mon,  2 Aug 2021 15:38:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 35F35610FB
	for <linux-clk@archiver.kernel.org>; Mon,  2 Aug 2021 15:38:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234820AbhHBPit (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 2 Aug 2021 11:38:49 -0400
Received: from mail-db8eur05on2046.outbound.protection.outlook.com ([40.107.20.46]:10688
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234605AbhHBPis (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 2 Aug 2021 11:38:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BgnRFV5EPDupqPr6y6TYtCzQt5+fWjzK89aCDW/GWYr2T9XcdxGcps9JDVGjFxjOOq57D0DL0QUL7XmKQS1Pj5v29WcJZ+D8JLDM94AX3USGTHz+f9NoU6ObYa6t5NbcW3uM2F6fIUNsBcuSX/Yoo+dpIEb8HQEY2zpF7qUjvD+upaOV+gDqRGCmSo16kAIvxuULOYKaK9r7nTbWA4pb0DKSjwPk7TvlLBOLgdauk17KocuX3UJ8qTWfW13taG/uqLzGBhLiz5X2+aozf2VRgSAbeMyFMxMbs/IKU/dJMlcsyrDX0j1x9dJa6wDjMwC3Leu3vZWa9OKKteutDPI3IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fddfRZsdPxwfY4GDiBapc4hUdBYcZxrbHkyU2+drCgw=;
 b=GaBkQ4IYcXzadmAK13bL1TQ7ULLGopSDf900q671HpRUaot3n56zNxpTjmXihSXXk6wbPXCKbPrhQaJSCo3HbttcTdNIYLbKv4SMOdeS9xDv8AyKLYjay/TARGwvsQHi71SaD9bxG8XjVxH3I7B9OFf6VgRLQd1a9NiVRpeMOdJihEvsDFWsSuyTIvoEK2H2MsC0jVirmr6x1Dt2WMapu7GnbhMMKuue7sx4fRoMuHypsb3ur6ziIfi9jA0DaLDpcSts6FwI7EGze2KDHiobN/shlArEU+OA6h9KPJVfwXtM1PWgZzlvENqansxjVicPe7LRdhPZIHQ/znXD8AuDXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=secospa.onmicrosoft.com; s=selector2-secospa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fddfRZsdPxwfY4GDiBapc4hUdBYcZxrbHkyU2+drCgw=;
 b=EN5UHFDTAowmilGbYNNKt/kQ14vZpvb5Qh9dmaKbxC8al5qx7LyxeXNcF2E7S3JoRO45TnsGhL4KyDW/NlTyp4w3nfBv/FI1l19uEK3D+cQRCRO1rOQedGtsTJGb+8QwfXpUvpD2bQmIsTVxFy8eYIIEg8S0hbfzPBWHfyBArHk=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
 by DB7PR03MB4348.eurprd03.prod.outlook.com (2603:10a6:10:13::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.26; Mon, 2 Aug
 2021 15:38:37 +0000
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::dc6c:815b:2062:d1f1]) by DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::dc6c:815b:2062:d1f1%7]) with mapi id 15.20.4373.026; Mon, 2 Aug 2021
 15:38:37 +0000
Subject: Re: [PATCH v6 3/3] clk: vc5: Add properties for configuring SD/OE
 behavior
To:     Luca Ceresoli <luca@lucaceresoli.net>, linux-clk@vger.kernel.org
Cc:     Stephen Boyd <sboyd@kernel.org>, Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Turquette <mturquette@baylibre.com>
References: <20210723231306.674310-1-sean.anderson@seco.com>
 <20210723231306.674310-3-sean.anderson@seco.com>
 <87e03c94-f818-7b10-4ac2-11ab997d944c@lucaceresoli.net>
From:   Sean Anderson <sean.anderson@seco.com>
Message-ID: <4bbc2823-e160-dc45-9467-ade3fc475f05@seco.com>
Date:   Mon, 2 Aug 2021 11:38:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <87e03c94-f818-7b10-4ac2-11ab997d944c@lucaceresoli.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:208:2d::28) To DB7PR03MB4523.eurprd03.prod.outlook.com
 (2603:10a6:10:19::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.1.65] (50.195.82.171) by BL0PR03CA0015.namprd03.prod.outlook.com (2603:10b6:208:2d::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.17 via Frontend Transport; Mon, 2 Aug 2021 15:38:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d27b631c-74dc-4ac9-965a-08d955cb9824
X-MS-TrafficTypeDiagnostic: DB7PR03MB4348:
X-Microsoft-Antispam-PRVS: <DB7PR03MB43487A538CC7F566AE204A0B96EF9@DB7PR03MB4348.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0d4eyPXgp0ayvYYKjLFqkQtCy4KOXMTKZv0HFtx5J6D+7Z8xpOwamsGTwguNv1fn+CbneEJY1vyDuIu2Gnswguuvjk8KHKY3MgLfFi1/Njq4swhVtoiVJqTpLZtfU7n+RgmClPCyZHmqdD6Ikz2yuijHhGqesYNZ6qP6JjuW9TnVUGjaoW92S5IUyqQzRh7+P8GJLZ0l2WgnmlHVmwax/iBfRuChK5tpIB9+VD6WZ518eog9N9aPVUkVxy9alcXOXSbNJdNIdRLOCPakyXUJcK6/kxO60wyfbyujSdIKpVB8Rw0KrplnmFZpw1A9oLaarrW2YvpIsopYxNHBitSRPGUoTL6m1cuuwVQuzjbb7zE+8wmLez0PYNQByq31zdzxF4YD0ngmJalzpj0B7rHy8zzHxISIYpEepnyhkiEDitLeyzROVg1e1waqFMq6ylu+gOhe/LSIPomm+HqMoDdaJ/ip7uWYrFdJLhe+PdETp6v/KcUtPldY9LGQhWmjRqptHgxRJEQqhw6ndLSORLSa6dgJYnrrIedzS5MR4CvVMWBR3LYAjXIII+QuT6SMm7nebXZmFOz3dBJuF7+DB9ychAvu/lk69oqw/b69xui/uSXMWnoKv1CUKQEl9XbO2PyY71jg5JbZnnGTINB+j/KQzvWXHyX3P89fhSgNQXwuhhD8PLB5GXnCVrmF9xiD9r73ih7jBXE/k9hEFEF1oI1Vzo8ryGpgfnrPnLrgiucBJoz10y/C+WApK+vJy5WA6x6FjhIcZR6ZuUGEDNV19Fv3aA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4523.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(346002)(366004)(136003)(39830400003)(4326008)(2906002)(316002)(66556008)(66476007)(66946007)(6666004)(186003)(53546011)(26005)(8676002)(44832011)(8936002)(16576012)(31686004)(31696002)(86362001)(956004)(2616005)(54906003)(38100700002)(478600001)(38350700002)(5660300002)(52116002)(36756003)(6486002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFptQVAvMVgvM3BsNmpPd0NyeUNjNCtrTElYQUgrTTA4KzYvZUczTXVXc1RN?=
 =?utf-8?B?ald0YkR5TlVNMUw4QmdrUTAzSEpGSVA4WnF2U1pTYmlOTVI3YXZQQzRMY05H?=
 =?utf-8?B?cFFUeU16Wmg5UzJRTkVIQ0psT0tkb0MyUU9rdlVNN240ZGMyUklvYlhlR2U4?=
 =?utf-8?B?OHg3bm9SYVVZdVZVa3dmNDllV01LbzYzWTFhMDU0R0VSaEp2TTVtQ3JrRGNP?=
 =?utf-8?B?azFMOGtiaXVDTWQyMGUwR2o3TTNKQmhnc0ppMUVPNmlnMVgvRTkvRHlQVGc2?=
 =?utf-8?B?T1hLUk9xd2RkT2Ziek9MY25ac0x1MlM2ak1yV1dEMXZIYzhTVEFuUVZtTTFs?=
 =?utf-8?B?bVNuTDc0WS9KcllHR2kwdDdrMEpScFd4enoxNFpFSE9PQlNucGdTbm5SQkZ1?=
 =?utf-8?B?Q0p2WjFlTmFTbk1qTHFLMGdSUm83VGl3ek9ZOVBCVFpkL3NJa2R6M0ZqeUJV?=
 =?utf-8?B?SWRjb0k3bTMxbmlJK0x4S1dwLzYyc2d4OFFRZndRYmI0QS9Ma05ueVhNSXBH?=
 =?utf-8?B?eC9WSkxwY3M4SzRTcExsNVgrNENEcFJleVU4S0wrd280dmtqSFpPaTdtTEpL?=
 =?utf-8?B?K1VDWVdodTY4dlRKdkN6eUtQZzl6VjF0MjZuZWFUZktjbkNlK2hFV0xSbDFI?=
 =?utf-8?B?U1MwWnAwWEl5alhwU1VwOXVmWCtTYk1JUUJiT2t2ZnBBWTdocDVpYzRubURC?=
 =?utf-8?B?SzAzZnFrRi9ySUdjOStZRFRqZlNuclBaTjF5MVZlUjVlKzM0WEpZQ0p0Z0FI?=
 =?utf-8?B?K3R1VTh0eTFWTXJHdU1OWFQxRkNkMGtmSThoOTRyVW52cWVCSUxPWEk2dGV0?=
 =?utf-8?B?YnRWOCtyS3RFSXdyK0FwWElwT2o3NWw2V29yOGVXSnd6dktuNlk3enlnUCtD?=
 =?utf-8?B?eHlxTllqZDdGWjQxU0hsNmRWZTZRVEFzYTAvMUk1ZFNCdURXeFFvUTJsWmdh?=
 =?utf-8?B?ZDJPeEtLMDB2dlIrVWVWcGFyQkpKV0pWRWkyUyttUUJJTnFUWjYrRGRQcG1F?=
 =?utf-8?B?cFpIM1VaNjcrK3lKYS9ITGI2VE8rRVFwTmp4dE5zcDVKYkdqYWUrT09TWTNp?=
 =?utf-8?B?T21ReGhRYTZYZDBvbkNsRERlTjdlVkhUSGY5azNQR3AwSjJNa0ZIbGpyRU9E?=
 =?utf-8?B?YjBHazJiU1ViNHBIRXdLbHU2a3RPWjU1SjErQTZ0by9HY0FXNE9pWUV5YTdR?=
 =?utf-8?B?cFpHTDJDY1lsV3lQdGlpSWdJZU5pcXpOSXUwTjIzaW1pNy9tcjlua3BqdDl6?=
 =?utf-8?B?VllGQWNKZTQyYS9mS0gxZWZCbkgwa3hTbU1FMHU4ZzBDeitYeFh6MjhBakky?=
 =?utf-8?B?VkhrZHdGcThaMnZCSUczZjgyVTIxdFNJT1RGdHJ2ZW1RQWdhQnorZmRtWm9K?=
 =?utf-8?B?Y0Y4V3lCM2o2N1BQM1Q1VXJqWWI2ekgwRHJBNTJybTFHNGdIZGxNRmVveW1Z?=
 =?utf-8?B?ekdsM3dOLzVDbWxHbzk3SFRoWlY1blk3dFFjM0pYcUk3bSsxUnBtVVBRY1BN?=
 =?utf-8?B?ZDRtR0hrV21GTHJoWUU3R1B4Z0N2b2Y4Zi9JWlE4WXNkQm1zTHAxc0FiQm5i?=
 =?utf-8?B?dUV1c0tPRDZPQkRqRjVtSlg3TUtNSFdDcm9FQnFTVjlleDhhZHg0YzZpVTJR?=
 =?utf-8?B?L05PbmtTSi9PUmNZTnFMMUNlY1MzbDkrNzMwckpkWjBFM0owdjhRbVdSR2lJ?=
 =?utf-8?B?UHdaekdWNmpqWmREZGlKdjgyVXovYjFUcVhsaTJCeFFTVjE5dG41K0xKbTRX?=
 =?utf-8?Q?BNSakmHjZg5Do+dHNgUuu17e58jnZJ44JclO154?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d27b631c-74dc-4ac9-965a-08d955cb9824
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4523.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2021 15:38:37.0411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e0LmX7OkL6vv2q7LQ6smzTuhVb/3UzuziNg8Vykto5adml9pWmNZA27STH8Re3/WbPsWRVPGuC7TT9vQPABUzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR03MB4348
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 7/31/21 10:34 AM, Luca Ceresoli wrote:
> Hi Sean,
> 
> On 24/07/21 01:13, Sean Anderson wrote:
>> The SD/OE pin may be configured to enable output when high or low, and
>> to shutdown the device when high. This behavior is controller by the SH
>> and SP bits of the Primary Source and Shutdown Register (and to a lesser
>> extent the OS and OE bits). By default, both bits are 0 (unless set by
>> OTP memory), but they may need to be configured differently, depending
>> on the external circuitry controlling the SD/OE pin.
>> 
>> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
>> ---
>> 
>> Changes in v6:
>> - Use tri-state properties
>> - Drop Reviewed-bys
>> 
>> Changes in v5:
>> - Use if (...) mask |= ...; instead of mask = ... ? ... : 0;
>> 
>> Changes in v4:
>> - Use dev_err_probe over dev_err
>> - Put new variables on their own line
>> 
>> Changes in v3:
>> - Default to not changing SH or SP unless there is a property affecting
>>   them.
>> 
>> Changes in v2:
>> - Set SH as well as SP
>> 
>>  drivers/clk/clk-versaclock5.c | 24 ++++++++++++++++++++++++
>>  1 file changed, 24 insertions(+)
>> 
>> diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
>> index bfbb51191c8d..5b986894bd3b 100644
>> --- a/drivers/clk/clk-versaclock5.c
>> +++ b/drivers/clk/clk-versaclock5.c
>> @@ -886,6 +886,7 @@ static const struct of_device_id clk_vc5_of_match[];
>>  
>>  static int vc5_probe(struct i2c_client *client, const struct i2c_device_id *id)
>>  {
>> +	unsigned int oe, sd, src_mask = 0, src_val = 0;
>>  	struct vc5_driver_data *vc5;
>>  	struct clk_init_data init;
>>  	const char *parent_names[2];
>> @@ -913,6 +914,29 @@ static int vc5_probe(struct i2c_client *client, const struct i2c_device_id *id)
>>  		return dev_err_probe(&client->dev, PTR_ERR(vc5->regmap),
>>  				     "failed to allocate register map\n");
>>  
>> +	ret = of_property_read_u32(client->dev.of_node, "idt,shutdown", &sd);
>> +	if (ret > 0) {
>> +		src_mask |= VC5_PRIM_SRC_SHDN_EN_GBL_SHDN;
>> +		if (sd)
>> +			src_val |= VC5_PRIM_SRC_SHDN_EN_GBL_SHDN;
>> +	} else if (ret != -EINVAL) {
>> +		return dev_err_probe(&client->dev, ret,
>> +				     "could not read idt,shutdown\n");
> 
> Minor nit: "could not read" sounds like "property not found", i.e. the
> property is not present in DT, but if it's not present we do not enter
> here (which is OK). For clarity I'd rather say "error reading idt,...".

dev_err_probe adds to this message, so example output might be

	vc5 1-006a: error 61: could not read idt,shutdown

I think this makes this clearer that there was a problem doing the reading.

> 
>> +	}
>> +
>> +	ret = of_property_read_u32(client->dev.of_node,
>> +				   "idt,output-enable-active", &oe);
>> +	if (ret > 0) {
>> +		src_mask |= VC5_PRIM_SRC_SHDN_SP;
>> +		if (oe)
>> +			src_val |= VC5_PRIM_SRC_SHDN_SP;
>> +	} else if (ret != -EINVAL) {
>> +		return dev_err_probe(&client->dev, ret,
>> +				     "could not read idt,output-enable-active\n");
> 
> Ditto.
> 
> Otherwise LGTM.
> 
