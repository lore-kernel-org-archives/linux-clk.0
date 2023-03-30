Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51F6CC6FD1D
	for <linux-clk@archiver.kernel.org>; Thu, 30 Mar 2023 12:00:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229694AbjC3MAy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 Mar 2023 08:00:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbjC3MAx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Mar 2023 08:00:53 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2040.outbound.protection.outlook.com [40.107.93.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 923082D4F;
        Thu, 30 Mar 2023 05:00:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kDjs39rw3svwaCc8Irefhtbt0BV5HIUmlLtNSHyq4MZjzjxXYCLbRj8CfpZW+F2RrmKDWhIYeAGyfdfDI+01EvaGAk/o5e81FnyYCRWSRs5b3+45HFHGHVMHY2dleV+DwHxpc3QZTkMME6wuRw3PkoI9ydztcjqzMu6bHH68m/hMMqmOnpWskJO5qvSLbDpiBZxot2JMc55KcHhKXE2dmB9BEanr2b7wOzGyJxnFx5VIlJACWyDQFeb+QNedk28DNm6MKF2B3a0zkURiQ9fTcBKHojc3goWIOadVslZ5xipigZHodGR/+xNJ0B+zOCItW0GiGOB8xE1wvZQ2MpFxYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WWRa6B0lsPSzr0HtiW4BWoWjgmpc4mnCbWQtDNyMX2w=;
 b=dTxzeGvxGju3ExVw708lkuB/czklWAG59ftq3ATXAtuJnsXA4fURxadEARTejl0QdRPbYcau2N8A/w6tlOcVuaLQi/vHenY1G5dNrOvz+vWJHddM+cGxTm6UwwZ21n70Wac7wFA0AGs8CcAhWBdlqrk5XSXjKWPIu9sHhdIDze9qX4ubKeftvk5olR5PSQ8VlH+RmwvKuarabj/+4nO6T4A+301ePMwUoAOJGR1IUVV1mB5UHh8BjustE56sd6ocDSscdLFkZIcwPIIWpG6aTatQVe8xB3xEJw+pzVx2aZ3KPITP3rRZ3CugA1BrMX78E3xe0zihK+zJUnrqtqTVmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WWRa6B0lsPSzr0HtiW4BWoWjgmpc4mnCbWQtDNyMX2w=;
 b=tDHa+GmDBnDquIDe8L+7nrPJyHkUS+A+pp8Qqt219SzHcim3VO21txwCR1GhgkzpQclKjta5/uO8/ciSjgol71PPEa0y+PvTzgLXTmypoGm+XoBBc+ZrGikdMIPDUIxpem8ZSuL6j7xfAZA2rHjY/yTN0lXnQBJCxxooclZfOoI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4758.namprd12.prod.outlook.com (2603:10b6:a03:a5::28)
 by MW4PR12MB7381.namprd12.prod.outlook.com (2603:10b6:303:219::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Thu, 30 Mar
 2023 12:00:49 +0000
Received: from BYAPR12MB4758.namprd12.prod.outlook.com
 ([fe80::4d07:7f52:c833:9603]) by BYAPR12MB4758.namprd12.prod.outlook.com
 ([fe80::4d07:7f52:c833:9603%6]) with mapi id 15.20.6222.035; Thu, 30 Mar 2023
 12:00:49 +0000
Message-ID: <fc324a64-111d-c7e4-6af4-74e025c4fe10@amd.com>
Date:   Thu, 30 Mar 2023 14:00:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v1 2/2] drivers: clk: zynqmp: Add versal-net compatible
 string
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        devicetree@vger.kernel.org
Cc:     git@amd.com, linux-clk@vger.kernel.org, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        michal.simek@xilinx.com
References: <20230330091309.16215-1-shubhrajyoti.datta@amd.com>
 <20230330091309.16215-3-shubhrajyoti.datta@amd.com>
 <910df994-637e-07df-c53c-06a1c0d8d83e@linaro.org>
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <910df994-637e-07df-c53c-06a1c0d8d83e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0046.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::35) To BYAPR12MB4758.namprd12.prod.outlook.com
 (2603:10b6:a03:a5::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4758:EE_|MW4PR12MB7381:EE_
X-MS-Office365-Filtering-Correlation-Id: 31ecdd42-6048-4688-06b2-08db31166711
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gJSt0IQGJz0EbSAFyEH6Fiq95NCFuH8qPlq/TEUhk9vhyRKhvnMWOzJ1c0lsrvz408IlAO36AtnOB3by+BP0ENyA4BmTkE2g039fGBqQO3zUAJo9iocahsmxntu4tDk9fmqeb2YWPV141QzjYajeM4XEtzdnGo6qgdyDhwtK1ul/lsSt9rYNzF/qF6aAPTjMThu3M6n2YJ+lVefsoZUdIW+x7XH29xg6LcPp319ygZFqygp2wLyl/xbrpaXUAcy4C9mYYnVvb4oUzzLR6qwyF9ZmnlL7KoYGvfXqG9i/LgYcPBQwH0WF1/ya5RqAKq84myrl2Q4Mv3BmINZ8ToIxjFcJkjuNBrdQzNrBcbcLR29d55nAIev/AOlI47Zhceglw/pGkcEg4fovXH2QklARSS9+TpP1DAlCWZ/iWU3ZTCRhNL6EmAuuOztgbiX/vIudkdGt5cZqkVEFjKhF4S1BpjFCJiFx5iNKJvijFkbmQGfn39KmYmkicAvNrntS5uHzFOsb5EYqBGJujWO8mO8ydBtTB6FewjZjge6z8sgq37cGGhJogMVglJ+buy0qBjKTZvuNOkyaPOA26YgKTVypEQ4uMV19v/5yjpYbAOJk5PJwVxz7iXVfizOdppmEcD/KIxmafutetHLq4e56lpGBuA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4758.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(376002)(366004)(39860400002)(451199021)(66476007)(6666004)(53546011)(6506007)(6512007)(26005)(6486002)(478600001)(31686004)(110136005)(316002)(186003)(66556008)(8676002)(83380400001)(66946007)(2616005)(41300700001)(8936002)(4326008)(5660300002)(44832011)(2906002)(38100700002)(31696002)(86362001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVBST3gzOEtsdVVmSVJOeG1hOUZsWndNT2lUcTBjamlsbmhTd3FIQm5TcHF4?=
 =?utf-8?B?MzhpRDVkWFJ1dDJpNmMrbmhVQTJ3RkhSeGVDTTdFRkk3T3I3YWY1TjBXMWMz?=
 =?utf-8?B?a05pSnpFNm93cVJJckNreTNlTDFaRWlQVEhyeDVGYXJYR21HRzdjRjR3V3p0?=
 =?utf-8?B?SkRMTGljblprZk81NVBjdk44a3Rqd2E0K05jdUdjQlBNK29uMnd0ZTNNV3VT?=
 =?utf-8?B?ZE53amlhblRma3hQWUJpb1dCWFpuQmZNMDNpclJ4TXkyVnp5SzlLSGx6ZURy?=
 =?utf-8?B?SUM4M0JvK3R2TnJ2cWtmak9VSW9WZnY0RERzeVZ6L3R3MXdVZnl3Nnd2RXkw?=
 =?utf-8?B?MWZWd29McEpBdTE3VG40MFQzOE42L2paam05ZE9TV2x2Y2txdENqNFVCdHJH?=
 =?utf-8?B?OGg0UTN6ZFFPOWV5ci9HOUU3Mzh5enFUQWR5ZEh2dWo0ZklpR2t3UXlrdDZB?=
 =?utf-8?B?eFVvL2diM1lKVHFRY1NjeEl1KzhzbmprblBpc2MyUkNEejRJNktmU0ZwU1U5?=
 =?utf-8?B?akpsTlp5elRiZG84TEloVG1PM3NWMVZKNmthQTB1eWk5YnBCblhFejR3Q0lK?=
 =?utf-8?B?d3pQVFVjd0tmV1BtMjd6RFM0TmJHdTlvVjVvQURaYVNmbE5oMDBtR2hqaHZs?=
 =?utf-8?B?UEhUMThVc2lua1dlb3duTnJWd1hIQk5zeW5ROWhKeUxxQVR6bmowMnVQVU1K?=
 =?utf-8?B?NzB3OTFPZVVPYXp1Q0VxaEFyVllxWjVhRmlxZzJ4dkg4R1hhNFBzTmpldWtZ?=
 =?utf-8?B?Y1VJOTZMS1VUWE5wcldXNFdYMVBxb0xFR2UzL0MvUHJUMFQ1aWlVemwvc05R?=
 =?utf-8?B?aytUY0hMazJLSlZNeGFJU29vUHNwYjN3czY0QUpuQ2R4UUY5aFFVSU1wbXNp?=
 =?utf-8?B?ZTN3NzgzdDJMUGFub3NnRlprOE1Nd0ttU1NYa1loVHpFY1lYelhWdmtrN3hP?=
 =?utf-8?B?TmFvNnR5NFBDM1ZIdmtFajF5NHBFSWhyYjZ4RnlIODNpaWFTK0J6ZzZ5dGFK?=
 =?utf-8?B?UzVQQ2xNMnlQRWhnUk1JSlNmNldQK0tLL2JxNHBwOER6QXRWK05pVzdFODAv?=
 =?utf-8?B?NnRtakY5NGRWcTB3QjVUOXpYbS9oVDVxeEVwTjdZMkZFSlV4ditPQzJYWXlZ?=
 =?utf-8?B?L0hXOHZMN2RJelZKZm5aUnpsdVhsZ0Z1ZE42SXNoT1lOeS9tZlJkTGZwY0lN?=
 =?utf-8?B?VkVyR1VlVE5pV2o3R244bmdqdmRUSUsrSDhWalVSTDVVVlBPdjFmMGh3NllS?=
 =?utf-8?B?R2VYQ25mdFptSWpKSXhkeTl5TzEwZnZNTEFuY0oyNHc1bXphY3Bxakdka1NZ?=
 =?utf-8?B?QTVPR2s1MlkxMStiSWdJRjFldVBtOWRjSHZEMW02NjBGY2Z5ZlUxbXhGUTdU?=
 =?utf-8?B?TEkva0hiWStTZHhjMkZTZlBmMS9CK0Rvdm1KRXVVcnpuSlVyOGtHMENZdmhh?=
 =?utf-8?B?NEZnZVFCTWp3L1BUOFhpOFFTd1ViMEFIcjBzUUt3Um5NdksxNzVSbzNBUDh0?=
 =?utf-8?B?dE42SnZGZGoyT0d2M2IwZGJoMzJHMStCVXhUeXVsRW13aVEzU3o1RnRLem1I?=
 =?utf-8?B?cmVKVFpSdGt6L1hISjlDYjFPTUdVdDFnQjRZaGRFRksxSjZDVE0xRnB4em9Z?=
 =?utf-8?B?Y0lpUkJYYWVSZEV6VjR1M3NaVnRxY05xekhrOFQzMGE2UFpjcDJNdU1YUWsw?=
 =?utf-8?B?cVlxN2hqZkN3eE45QjFCeTNwUVNmbUpKdVhEWU14bjBRRnV1c1JocjhzMkRG?=
 =?utf-8?B?V3JKaE1ralRzWFgxZkw0VFFnS3krSjJUV2NDbUZrR2M3RHhVWlQwd1Z5ZjF4?=
 =?utf-8?B?NDZQOCs4S09zVWUwT2YxMzdyYndtZW9IV2NzcU5PRGtaVFVEOVlpcmtwdEFh?=
 =?utf-8?B?K20xaW9YeTRLYTlvZ0tmSlJKdzNLeE5ZZ3NScHVxNHRzMDlCRURjOERyUEJy?=
 =?utf-8?B?NTFLUWp0dDNqUm4wSFlpUkVpZGQ4UW9JVngwS1lCTlFjM3JvQndBdXBvWkQ2?=
 =?utf-8?B?TlFPd0s3c1JlRGNFbGdGOEIvQUlPNlNGeEJIVDlFYnNiVmlIN25qbHhXYWNO?=
 =?utf-8?B?KzkyRTRaYis4Z09WQ0lOeXpDZXVCQ08reC9TL0l2TEsySFd0TlN6SWhjd1hu?=
 =?utf-8?Q?EBihmJffFYzqlg3CvgIRkmwXe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31ecdd42-6048-4688-06b2-08db31166711
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4758.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 12:00:49.4375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fTifGL9aFjktDrek+KHGq7YOla3r6vJ4ADn/PTrwBndB61F97JInXTU8BcAugvaU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7381
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 3/30/23 13:08, Krzysztof Kozlowski wrote:
> On 30/03/2023 11:13, Shubhrajyoti Datta wrote:
>> From: Jay Buddhabhatti <jay.buddhabhatti@xilinx.com>
>>
>> Add compatible string for versal-net.
>>
>> Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@xilinx.com>
>> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
>> ---
>>
>>   drivers/clk/zynqmp/clkc.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/clk/zynqmp/clkc.c b/drivers/clk/zynqmp/clkc.c
>> index 5636ff1ce552..1ea5fba20d91 100644
>> --- a/drivers/clk/zynqmp/clkc.c
>> +++ b/drivers/clk/zynqmp/clkc.c
>> @@ -789,6 +789,7 @@ static int zynqmp_clock_probe(struct platform_device *pdev)
>>   static const struct of_device_id zynqmp_clock_of_match[] = {
>>   	{.compatible = "xlnx,zynqmp-clk"},
>>   	{.compatible = "xlnx,versal-clk"},
>> +	{.compatible = "xlnx,versal-net-clk"},
> 
> Why no driver data? Why do you create new driver matchings if devices
> are compatible?

It is the same discussion as we had recently in connection to emmc.
versal-net is new SOC and if any issue happens we would apply workaround based 
on DT compatible string. And by using special compatible string directly from 
beginning will allow us to do changes without change DT.

We actually don't need to update the driver for this. We can just simply list 
new dt binding and use both compatible string in DT like this.
"xlnx,versal-net-clk", "xlnx,versal-clk"

Thanks,
Michal
