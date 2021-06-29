Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB2AC11F67
	for <linux-clk@archiver.kernel.org>; Tue, 29 Jun 2021 21:37:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 542DF61DA0
	for <linux-clk@archiver.kernel.org>; Tue, 29 Jun 2021 21:37:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234327AbhF2VkY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 29 Jun 2021 17:40:24 -0400
Received: from mail-eopbgr60071.outbound.protection.outlook.com ([40.107.6.71]:34382
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233744AbhF2VkX (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 29 Jun 2021 17:40:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V2o4koSN/sxezpAXJ76z5HkE8sx9Abur5UjD/ZDoo33KhE9aKiGCQACb13Dk89XrU5sN0KktAmThAjArCClG2DNvZZbUSKyW/w77W1gc0m3Un1SE3exO9uK0EVcsnEpj8Yy7TJ1Ab/7zDwBuPFkSRoxNC5sUuyRhQvSHR8F7XjRKaykm8aHzYipj4hNAG1KdcguixeO7emG2zNqGAtKhk3mbwZVbeFeBKxEdP4w56nKNSYk1aUeA5Qm4ncjOo/2pyUqVyfxd6SzynBKGxvVCh+2olYJLP3EWOvD2Yr+fdnJvSX3229oWyuTNRHl44LU7lYYHgyhD81Mi9FHFmq0/Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6a31OC9TdmHxjlwHEaHOWJ2YT71I26wk+EHQyn4prs=;
 b=GlldmpWPN86tpqa5xhsYmi683pS78POs5NMigJVxODyZywbtJFFfK7I7I8tMZKas5pLgUXckbhRnhTm+B8on924N+/yjVdj4g/qrP2cv1+AY6Evrb2sPzi1mA9OatH/cGaJ4hQSpgWJGHhedHDAI9peeWC/4BrxNqw5kSNbbkJh+2zK3pADI0bvOZMX1GbsnobAn6riqJ5EMj1sdZTTw04xHnEYfzDQA5IQpfUc7jZJftgv2QDQ4r9aG+CJ6WKRRlNEALd8lgJrdGhg1YQwvhj/r5knTguLlvEWngPu2/KIcaZhgdtvPNyW43/5VtryXr5Dx6Seqc/bcnOQIM3bmaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=secospa.onmicrosoft.com; s=selector2-secospa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6a31OC9TdmHxjlwHEaHOWJ2YT71I26wk+EHQyn4prs=;
 b=Wz+PCBKv+i9PjmrVp2rsBQa9KaW/yNr0qnUeABW65ioUd90aETXVhb7MNLPHzSUwzH+kQxu47XpoDmpe1zdttutIh7+JvWJPGp6z5gM/h+gIVL1IIFGbmYXQS1cRTCDBgDZiL0g7Ef8nm7iKX5MQu5yHshVHR3Yeanav4rDCtv0=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
 by DB6PR0301MB2437.eurprd03.prod.outlook.com (2603:10a6:4:59::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Tue, 29 Jun
 2021 21:37:53 +0000
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b]) by DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b%5]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 21:37:52 +0000
Subject: Re: [PATCH v3 2/2] clk: vc5: Add properties for configuring SD/OE
 behavior
To:     Luca Ceresoli <luca@lucaceresoli.net>, linux-clk@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Adam Ford <aford173@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
References: <20210629154740.3091884-1-sean.anderson@seco.com>
 <20210629154740.3091884-2-sean.anderson@seco.com>
 <1e720005-286a-c02c-88e8-3850dce8cae9@lucaceresoli.net>
From:   Sean Anderson <sean.anderson@seco.com>
Message-ID: <f82ff572-4b04-6c1c-00fe-0035a53d49fd@seco.com>
Date:   Tue, 29 Jun 2021 17:37:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <1e720005-286a-c02c-88e8-3850dce8cae9@lucaceresoli.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [50.195.82.171]
X-ClientProxiedBy: BL0PR02CA0057.namprd02.prod.outlook.com
 (2603:10b6:207:3d::34) To DB7PR03MB4523.eurprd03.prod.outlook.com
 (2603:10a6:10:19::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.1.65] (50.195.82.171) by BL0PR02CA0057.namprd02.prod.outlook.com (2603:10b6:207:3d::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.21 via Frontend Transport; Tue, 29 Jun 2021 21:37:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 230e4a51-21d2-4a43-de77-08d93b462660
X-MS-TrafficTypeDiagnostic: DB6PR0301MB2437:
X-Microsoft-Antispam-PRVS: <DB6PR0301MB2437672EA17F7E702067EBB396029@DB6PR0301MB2437.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DnkuqZM5WvyIc+d5xW0jrhJvINJfjECdaLZmp4FqhrzLwbWKM4PUpP/oq8MPdTIKVJtSXcIwVeWE7vhyg4M1pzDBcbBSUe9Svhro2DY9NONnloQFeg4JTzhUA5NyYdQ093DAPjRQPphOVrg2yvAI1YOvhQXN2Co//lczR8IPlUSENZw0Xk1w01YeLWBJcEPUOTo5KFuIBdCh2jwm1eVsqNaK3w9a0PfcFj6dlcgg+QH3DJKyNwtQ8EDhRj0LKnD07ogKTQ6I6nhcBcTdt1EuoOWoRsRNQeHvTrYu+nWorDThBSBwiACWxQMUbghtAsn2zfcdUPNaip7lQw/J6xxgaLV39Z+dypEtbWFPPIwjAa3RM/3cwJEjHMDYTTI1Inw7DFEu072RxZS3oTZwTIQn5lE6/cHLzsS5xSLEy9oHtClIwa1c/4K3ihrjazkF8pAYwSzyFUVIVpbDXntM0xKwNWlwhu744w8wuwRglGCPUSvmXlC/ewXIEeEwSR3mADo27ePUIch5LZguoeS+zEx6xT8p8zhQmFfqtHCdFDTomZ06AvnOCcK+QsiU0DfzmhHKGBhG+8y1ojKgPosLqLSWY3Nn/F9FOezgqwvJB9lNyGSvBvVu8PH6iLwAq+OJmaDjhJC0kNqFLwzQCmgHPAfpyLEWKEQAZwZRmjyPrj2h65C7ssGYintwbe5B1sgG4G1bkv/JMUCf16nRhrmAxwe+wZwnLyPGpshp1TVgfl1QTmGPjpSomPDP7EhWFECiL7EswHTa8UFGLxizXLO+arCpvg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4523.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(39830400003)(346002)(396003)(366004)(136003)(376002)(316002)(16576012)(2906002)(5660300002)(52116002)(83380400001)(6666004)(86362001)(54906003)(31696002)(36756003)(8936002)(26005)(4326008)(6486002)(478600001)(16526019)(53546011)(38100700002)(38350700002)(44832011)(2616005)(66946007)(186003)(31686004)(66476007)(66556008)(956004)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUtHeEo1cG9EaXVRTUFPb1FQUHVSeDA3Z3lTbjhyUmNDSllSdmsvalpRYzdO?=
 =?utf-8?B?cG9WRllvKzhEd2ROY1lFdlFWNVgyWTFRSFUvRXpyR3E1ZC92OVFIQVpIL29u?=
 =?utf-8?B?SDNGUjBKb1dwVmdOdXVpSU1mNXFTL3VCVnZTcUZDdDcyZmVLejM5dk1rM1Fq?=
 =?utf-8?B?eGwvVUxtaU1pcXZhZk5wcnp0ZFY2YXVsMFcyWTJHZXFSbDVPdFZmNERmZUJh?=
 =?utf-8?B?SnpJMEgyV0RmdlVuTVAvdnVibWNSSXJCRmxyT3UxSFNlbS9HbHYyRmVEWDk4?=
 =?utf-8?B?NjlsSEtXY3NGWm9vbjBRZEkrTndrclo4VWk4bjFYZmp2L1R2cm5PTVhKU3hQ?=
 =?utf-8?B?NGswK0VkT2VWajhzYUo5dnVlYjZ6TXVwRzdzUmFqY1ZRTmVvUDByUWRlVFlT?=
 =?utf-8?B?NVUxeEozSUpDdlQvUDJyMlVDdFJhM2RXVVZiQ0Y4RzFQNDRhK081VHhNS1dE?=
 =?utf-8?B?SDhRYWlwNU1meERvUlZoYWNaeTJOdTZHU1RhSXJkeTJsSnRCN29aTGllVS9F?=
 =?utf-8?B?N3ZKTDdZNWRLZEVzRXFiRlFvQllXemU0eDlHaFRnY0JtZUtSUjhqWFBhOEwx?=
 =?utf-8?B?cWFPS1pVMGhVRlFpWms1RGt6TFA5UDV1c3VCRE5LcGEwb3VrdDQ5Yk80SFJq?=
 =?utf-8?B?bTl6T1AySkZMVUJId1c5MVUxMVYxT2w2YTRIdzFFbGlOTkVSTFJWblJGU1lN?=
 =?utf-8?B?dGQyZmQyQTN0MS92MUllZXlUN1dnck5BLzRuRWtvQitWeVc0V2dnMnQvdm9N?=
 =?utf-8?B?Qk1yVDgwRGk4MFZwNllkL1FaUW83YjlldFBhTnJYL3B3NlB5djExK1M3Q3pN?=
 =?utf-8?B?NWF0aE9YaG1DeEFNZGVpaXU5aTA2Rm9IYUhOdGtpZ3JIdE9wQmdVangyMDky?=
 =?utf-8?B?MUd3azNWQkh6N1JubFJMSmM4UXg3dWxBaE1HcTJnb2ppK0NGTkt3ZjBYNDZx?=
 =?utf-8?B?VFN2djRxbzMrMmhlOEtZNis2UGd6dHZldjA1L1BuN2o2VW1XeUlBMEt4YUZ5?=
 =?utf-8?B?VUY0bEdmelJaaUpHd2V3TkZObTIvSmoxSzBiQmtyOS9DUmZWUlpJUGthZHU0?=
 =?utf-8?B?SVBYNXpQbzBFUEM4MlBjVDNZOTlrbFdsRmc3V2tWRUkvVnhoOEx2VGphTEZS?=
 =?utf-8?B?TTlaUGRTM1A5aFkvM0NTK3NpQXFqN1NjbUQ2YUl4THVYSXFndW1QWlZabTl6?=
 =?utf-8?B?eUxXRG9aS0lPVElWREJ3dWxCK25TWDB2RDduNW9saEs1MXNYcVVaNlhVQmlZ?=
 =?utf-8?B?UWx1dXk5TlRmNVE1bFppa1Q2TG82QWJOaXh3K2xxQUUvTStCVTB2cC94ZHZD?=
 =?utf-8?B?ckQwZmpUc05nbXVxL293YTZuNndJbnMxaEZ6RTgxM3J5U1AxOUF0RDlYMFdi?=
 =?utf-8?B?VHYxbDdiWWR2NytxS2I1Ujg1ZmF6QU00c0wwWmczZFdJS1JLMnRlcFBGcVZs?=
 =?utf-8?B?VHZSMzdLR0VuQjA2Nlh5SXhDaUNNa2JweVNNQ2FTcHNoeFRiVHV0YUJud09k?=
 =?utf-8?B?azNLSzVsalFKY1ZaMVdzZnhBZVVqSFQraXFhdkxXbmFlcnlGQVJpRDcwRld3?=
 =?utf-8?B?VXNEOW5lMFlNb3RIaUoyaXRELzUxenZDaW94MlE4ZUo1MDN4czFWQ3pXM2VB?=
 =?utf-8?B?SzFTTUhJWW9YYXdUd2tDRDZBdDhxWWlBNE8vVlVYeEpYWTIzbGlwbEZnMFNq?=
 =?utf-8?B?MU95K0tGcW4zMTNPdXRjUDZDR1VBc1BId0ZwUG9hWG0zVEk0MUNhYW94ZnRj?=
 =?utf-8?Q?y3D9ogdXvYxh78R16GA1RzFJ6fqDyODnT5s4vlL?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 230e4a51-21d2-4a43-de77-08d93b462660
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4523.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 21:37:52.8597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sdN+CaSwtIHmKj6OJgo0M4RRAp039O9JVGqpZpVR6CGHtickeF48BxDcQ/+QMDftMxB6hzq03eibP32mO8ciJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0301MB2437
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 6/29/21 5:23 PM, Luca Ceresoli wrote:
 > Hi Sean,
 >
 > On 29/06/21 17:47, Sean Anderson wrote:
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
 >> Changes in v3:
 >> - Default to not changing SH or SP unless there is a property affecting
 >>   them.
 >>
 >> Changes in v2:
 >> - Set SH as well as SP
 >>
 >>  drivers/clk/clk-versaclock5.c | 23 ++++++++++++++++++++++-
 >>  1 file changed, 22 insertions(+), 1 deletion(-)
 >>
 >> diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
 >> index 344cd6c61188..b5f6f5708c77 100644
 >> --- a/drivers/clk/clk-versaclock5.c
 >> +++ b/drivers/clk/clk-versaclock5.c
 >> @@ -886,10 +886,11 @@ static const struct of_device_id clk_vc5_of_match[];
 >>
 >>  static int vc5_probe(struct i2c_client *client, const struct i2c_device_id *id)
 >>  {
 >> +	bool oe_high, oe_low, sh_enable, sh_disable;
 >>  	struct vc5_driver_data *vc5;
 >>  	struct clk_init_data init;
 >>  	const char *parent_names[2];
 >> -	unsigned int n, idx = 0;
 >> +	unsigned int sp_mask, sh_mask, sp_val, sh_val, n, idx = 0;
 >
 > Very minor nitpicking, but for readability I'd put the new variables on
 > a line on their own, perhaps close the the new 'bool' line, and not mix
 > too many unrelated variables in the same line.

Ok.

 >
 >> @@ -914,6 +915,26 @@ static int vc5_probe(struct i2c_client *client, const struct i2c_device_id *id)
 >>  		return PTR_ERR(vc5->regmap);
 >>  	}
 >>
 >> +	oe_high = of_property_read_bool(client->dev.of_node,
 >> +					"idt,output-enable-active-high");
 >> +	oe_low = of_property_read_bool(client->dev.of_node,
 >> +					"idt,output-enable-active-low");
 >> +	sh_enable = of_property_read_bool(client->dev.of_node,
 >> +					  "idt,enable-shutdown");
 >> +	sh_disable = of_property_read_bool(client->dev.of_node,
 >> +					   "idt,disable-shutdown");
 >> +	if ((oe_high && oe_low) || (sh_enable && sh_disable)) {
 >> +		dev_err(&client->dev, "conflicting properties for SD/OE pin\n");
 >> +		return -EINVAL;
 >> +	}
 >
 > Use dev_err_probe() to simplify code.

The existing errors are all done this way. I can add another patch
converting them to dev_err_probe.

--Sean

 >
 > Overall LGTM.
 >
