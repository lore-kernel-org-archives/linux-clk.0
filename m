Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23180C761AF
	for <linux-clk@archiver.kernel.org>; Thu, 30 Mar 2023 13:50:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232130AbjC3NuD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 Mar 2023 09:50:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230466AbjC3NuB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Mar 2023 09:50:01 -0400
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2041.outbound.protection.outlook.com [40.107.101.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4411A4EDE;
        Thu, 30 Mar 2023 06:50:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jSnCgt93yzMUFaWt/ru6o8dtLXmtE3Q70+WnG17spBNN49/sU9LmyN6YFX7uNT1fXIWsJ3T4aDDC8T++14Us5AbvMuadC6FKMXRdrw5IDI7laUgQIppkn/UkShvizt3QTcPp4S36MtObmCGuu0gkvILqdu1JgN5m3P2vGzygYDGybxXGuEn11vo/a0V3pKpOG0qaiCaBsnGrAHIa7vpaGn73ghBs8PY/nRVEoK3/37afPsarpSGhKENMwGGRab8NcGb8ScKAMcY/Ukc7fsbf7Y5iuav0W/nnk2AbIvWdYbgBYYFna2rLYqqDGcIY4jYqJEWORQUZTLKYE28dpNyIJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ws7exnZPx4M1WpnfWPizB/VciTHEpOUtm09V/ikOKEg=;
 b=T1Ewo+OtpDFxab2GeSF06BNCMn/H+G8iKCqGv9f/GTP+I8AdTd2lIdHQX2dx6MqKuY+skrvOOfUjhSU3I8PowirheBjC9yhCbim0Ck9wQOtd/nptsR+BgZCBq96aXrYfuenUqstO8jcbtgST2EAMHCl6B+4lVVqjTPNIGzvYXKWR8CeqLkd4g2e4xIJ9Jg0O8wCoJ0tynP2lNDk5x4crZAxQDRR8vC9qq82AuhqzEeKmMga7SZQapwH7HHBGuHfa7xGg45BvHsayMoUVWtDbQEte/phWZWrmbHoPN77lcbukycfuT0FMUWLzi3CCUmJEvCT7rskxyYzyr7DPbaVoaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ws7exnZPx4M1WpnfWPizB/VciTHEpOUtm09V/ikOKEg=;
 b=1nYAwJ3olbHuAKmwobHquESTmQk5hs0QVNO5IjUXMMpllXO7vgEffyg/5JcsG/2Wsak3KdCX+HV+6xqJL+/nae9BW+bD2r20FQrXe2N7tTHc8DOwmJUobSBbbE7BgOfztTkL3Ar8Taj+cN1om+lfKAGHDGRgQpiXZ5h4UG0TN+4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4758.namprd12.prod.outlook.com (2603:10b6:a03:a5::28)
 by PH7PR12MB7257.namprd12.prod.outlook.com (2603:10b6:510:205::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22; Thu, 30 Mar
 2023 13:49:57 +0000
Received: from BYAPR12MB4758.namprd12.prod.outlook.com
 ([fe80::4d07:7f52:c833:9603]) by BYAPR12MB4758.namprd12.prod.outlook.com
 ([fe80::4d07:7f52:c833:9603%6]) with mapi id 15.20.6222.035; Thu, 30 Mar 2023
 13:49:57 +0000
Message-ID: <6aacc168-330b-0c59-c76e-542781b3acd7@amd.com>
Date:   Thu, 30 Mar 2023 15:49:44 +0200
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
 <fc324a64-111d-c7e4-6af4-74e025c4fe10@amd.com>
 <87820723-0ab5-0c11-148a-b9db3b05bebf@linaro.org>
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <87820723-0ab5-0c11-148a-b9db3b05bebf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::17) To BYAPR12MB4758.namprd12.prod.outlook.com
 (2603:10b6:a03:a5::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4758:EE_|PH7PR12MB7257:EE_
X-MS-Office365-Filtering-Correlation-Id: d7c8c2a9-f9be-4f8f-e237-08db3125a5d1
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cYAvY0BgCh3NUYnjBWYPTjo6iNXh1kWamZEPGgdYP3z28z/+MjZzekB+VfO0pYEJ574AzzVg5rzO+s6WOy2ouPlbGoF41HRfz2kbQ+blK0d6tFzDS1nXXx0gamweql6m7LqZMRldIJAePhq9UxrEDzuX40KNCVRXvAIFOW15ZHE5rlvn5gBBr67Udu/J71lvtjwvAWJWfyjsI+C0ANwo+9D8on8Dt0C9sGA7CxZEIDQ0B7U8o0eDodI8M+wb9vN3De/sJmR7xxhtGHpJ+tuFcdBEDS8TdH7oOuCpbg38YL83+IqYMDCBNxQ1mLi0p+sbGh+DJUXX/veDdmOtv/4dSLTfSXrZiyUz7b442C8SM1gPMgwTHJM3ifTUdH5bRjFQ4A8mBUnWYlueGp/b/qTOBjJHveAZic6WElMGzAus/SLdFUSzuopKNlXDMvEUruQLovLTUQJu6iilOH6JbRGL3Yk8vEL5tSP6JcYbuMj1J6bzydXFf9aNXhFVe1ystQd4V5Ph0OrXjLErI/tawFM1Ehzf8/jqszbAEv9gyLAGCuzdQfAaqlG+AVR91SISyEuPvbvqD6NZFiWX9f6BCjaH/lST35UtbqFo1hU4oTpKmXKeFLcwLkDEQvxPUVSLSCciKqKyqJbEaINaCU24DzzBlA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4758.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(376002)(136003)(39860400002)(451199021)(6486002)(83380400001)(31686004)(2906002)(44832011)(5660300002)(38100700002)(36756003)(8936002)(2616005)(41300700001)(4326008)(86362001)(8676002)(478600001)(66556008)(66476007)(186003)(66946007)(31696002)(6666004)(53546011)(26005)(6512007)(6506007)(316002)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1VkR21xOVZMRHhobE52U2xJNzlKb1E2OWE3ZmdacFByQy9XTUpuTTJMbGhS?=
 =?utf-8?B?YVNSUGEzcGFMRXNsc3lKQms5SXh0NEpmbm1oZ3A5ckhESmQ2SCs2VzMrek0r?=
 =?utf-8?B?VmVMM3pZMkdDa0JmOHFZaEUvTVdDMDVDT3dzSklUMVJKRGhmTmJYU2xZMzdW?=
 =?utf-8?B?RmZFU0N3RFRJUFZUQVJGUUhsenAvNUttaFo2T2pTNTROOTQ0MnV2ekpiRWFT?=
 =?utf-8?B?cjJ1WEEzVUl4ZFl3L2F2THdFd0Y0MTRNa3Y3d2pTNlZabFRzK3dZVG03TlFG?=
 =?utf-8?B?dndUNmNkYldQaXM4Y0Uva1pFVXJMQTBZQ1RjWlNYQXRBNnFZa0Z4ZFdFYkhB?=
 =?utf-8?B?NmVTVE5vSXNzN0MvQktPTE5VVmNSTW93VUZaRGZxaEV4dkFRdk1OKzh0Qmt2?=
 =?utf-8?B?VWtvKzRHc2tlUDVGZ0ljSG5Wd2pTNHREOFBvUU9wb01vNmVJZGMrRUdjNFJp?=
 =?utf-8?B?a0w5QU5UOHNGbjUwdU1yc0ZGMFdsTi9sNnpsb0ZjWGZLWWFOUEh5b00rTjFJ?=
 =?utf-8?B?aG1zcUVJNnl4V3M3SVNIcHVhMGlqUDlrT3poWXZrNVNlc1d2UXNqMkVhQXpn?=
 =?utf-8?B?aXIyY3FIa2JGQjBuZFZmelNoT1IxNFg0cW1zZURGamNQckVwT1BGN0R1cEpB?=
 =?utf-8?B?RklDU2xLYkYyRzNhRWF1ZkYvVmFxWnAvdVVjMzNZUS9uM0JyUGZiU0VZUEVx?=
 =?utf-8?B?Y2ZKQ0ZkSytSeGI1dTVtQ29PN0VwOUVMWTZMQXBJTDlXL1M1RkVjUkdYeUxY?=
 =?utf-8?B?UzJXTE5EWDlDaU56MHRKbEQ0K3hEMWNQTWpEM2l1WUIzVVk3ZjJ5NlpvSnFW?=
 =?utf-8?B?VFFyaTBwSVFvWHFmZUNZcTNMcFd5QTd1T2ppQUNrTU9HcTBsL0I5QkpSa1Jm?=
 =?utf-8?B?U2RuZWZ5R1lZakpqYk01dWQyYkNPcHl1cnJKWlRrSXVhWU5nV1BQMTRGUDIw?=
 =?utf-8?B?OVRjRVZyS0ZDdXhvdS9OYllkNEExZ1dTaVNEZmVBaHBpUVdmZGgxdzIyaCsw?=
 =?utf-8?B?bWduZzcyKzBodjMvNTZLVldTcW04UmpNTFk3RWFCeVA4NEd1QXVMYkVZV0Fp?=
 =?utf-8?B?ZEFSQVRaRUxuTlpCT2w3eTA2N09POWlyWkd6LytqcFcwSkp2algvWitkdkl5?=
 =?utf-8?B?QnRYTklxaDM1WXF6U2RYZWhESk9QUSs1Qkg2OXRDbmZMTnpRWnhIUTdjRzhB?=
 =?utf-8?B?cDhvZUNNMWU0UnRvWHQveXB0aElxeFdzc1hXSUFkMWVGTzB6bVJSSUp2UVhS?=
 =?utf-8?B?clB0dmtFczN3SGx2YmZoNmdxWXgyeE5FTk9hYlNza25EY2N2WE1WTUIyamRr?=
 =?utf-8?B?cVlBTkZIdGxJVWR4b0FiQkc3UDA5YVRqL284c0ZPTG9zS3hjY2VTYjBTc3l1?=
 =?utf-8?B?YU5sOUxlc1hUWi9zLzlPdlduZXQ0V3AvN2ZlU3NUaVhTVUExeHZNT0w4TVBO?=
 =?utf-8?B?YmFjN0htY3Y0Z2s0aE5KQ1Q3WHd1OHVJOHpvNnM5VTJlNzJmTGFpSVdackpi?=
 =?utf-8?B?WmJRUzlZaExuUjVsT1puc0RWOHZvWVJBbkpjOWpMWlNxOUNPbzhneEI2dHlu?=
 =?utf-8?B?U0pkRXZuaXhhREgzd05sRUp2YmdWVTVIbFMvdnlrTHpsU0Y4OUZhWHRWc2pK?=
 =?utf-8?B?TGQxdXdON2llcjlaUjRlZ3ltNk9qeG45VmplbDVKeEJXZDh2b2dmMDV5aEdX?=
 =?utf-8?B?ZXMrZ2MxNmQvYTF1V3I5MjB3N0F4eHBGRjBKSmZ4b0xBZk9ydExpV3dMckVB?=
 =?utf-8?B?V2d3azR3NW9aSHRJdEVFUzJlU2NTODZNclhhWEZobDJMbC9QT2ZjWjI4OS9L?=
 =?utf-8?B?N0h0TFl3YXJ1RFpuMTVBNHZ4YThPV0NOdWdQbE5oNUVtaElUTDdiRGo5MVBB?=
 =?utf-8?B?djdxK2Y3WXQ5dnhhSW83RmQ3MVNjYnBYbU12c2Z3cDJYcElrOHo1Y2Q0TGJu?=
 =?utf-8?B?ZUtmekNnQUhjcTBFVGU4ZklLdXgwSXFKMGpjSmRha1V3Y1QrTFZENktibGlQ?=
 =?utf-8?B?dy9jOXV2dy93MGhEWW9HcTNtamdKNUQ1VEpTdER0Nk5aVjk3Y0VwRjBPZGxn?=
 =?utf-8?B?dkNXN0pVRWR2Sk0wQ2taTndJaU1FL21teGJqTXh0bFExclFwV3ZqaEQyendo?=
 =?utf-8?Q?Z05y95hTIiWVqVHQdSKUdNW0l?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7c8c2a9-f9be-4f8f-e237-08db3125a5d1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4758.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 13:49:56.9964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sosx9CFnnH9PU/XsC/tdFZ+5y6tf6c9PWUAVd5ZBY8VmgY1WQYIgTec/1QOqa1oj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7257
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 3/30/23 15:32, Krzysztof Kozlowski wrote:
> On 30/03/2023 14:00, Michal Simek wrote:
>>
>>
>> On 3/30/23 13:08, Krzysztof Kozlowski wrote:
>>> On 30/03/2023 11:13, Shubhrajyoti Datta wrote:
>>>> From: Jay Buddhabhatti <jay.buddhabhatti@xilinx.com>
>>>>
>>>> Add compatible string for versal-net.
>>>>
>>>> Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@xilinx.com>
>>>> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
>>>> ---
>>>>
>>>>    drivers/clk/zynqmp/clkc.c | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/clk/zynqmp/clkc.c b/drivers/clk/zynqmp/clkc.c
>>>> index 5636ff1ce552..1ea5fba20d91 100644
>>>> --- a/drivers/clk/zynqmp/clkc.c
>>>> +++ b/drivers/clk/zynqmp/clkc.c
>>>> @@ -789,6 +789,7 @@ static int zynqmp_clock_probe(struct platform_device *pdev)
>>>>    static const struct of_device_id zynqmp_clock_of_match[] = {
>>>>    	{.compatible = "xlnx,zynqmp-clk"},
>>>>    	{.compatible = "xlnx,versal-clk"},
>>>> +	{.compatible = "xlnx,versal-net-clk"},
>>>
>>> Why no driver data? Why do you create new driver matchings if devices
>>> are compatible?
>>
>> It is the same discussion as we had recently in connection to emmc.
>> versal-net is new SOC and if any issue happens we would apply workaround based
>> on DT compatible string. And by using special compatible string directly from
>> beginning will allow us to do changes without change DT.
> 
> None of these arguments require growing match data. My comment was not
> about bindings. My comment was why do you need to grow of_device_id
> needlessly?

Right.
Shubhrajyoti: Please update only dt binding and for versal-net we will use
new compatible string followed by old one.

Thanks,
Michal


