Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55496C77B7C
	for <linux-clk@archiver.kernel.org>; Fri, 12 May 2023 06:26:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239869AbjELG0V (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 May 2023 02:26:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231393AbjELG0U (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 May 2023 02:26:20 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2073.outbound.protection.outlook.com [40.107.94.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C08113C11;
        Thu, 11 May 2023 23:26:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gEmtPegvC6V3dLmf99xV5LHzXRIhpUFXt267YVq2lFBluDRFvB0yeEesnoqet6pJ1xzwCjnNQBaCtMrT2KpXSX/zUyPJduAn3nizI+S02x/KKXTeCqZ1Q/hH0VIeB9hWBJlKynEO1jRxkpI6nBruqxG4oIDNLSa33RCbMkItiPWIm8Wmzqy8YBViliC7pY/ZlXNnF7GGZIHEMMdRKe48SCeF1s3y+xuUFFa4LWs7RUF1fCkUwaYqt5L6Kyw59UmKvMZNXJ98/tGUTYEgylwzktqeRdmdW5HiKGBqcZV3EtfHVpuiVRgCmmFCF2+KKIaDu21uDEA91xR6BgYp8AJ0YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PTZrKJjUqM1atM1ZfxpxqzxSNV6ZNYWYiIqP6S9P8rM=;
 b=gGTWzkZ63uhK9jHKDBCIUqMaPmbK9fvWT/WTywOpfQA0lYg0/Pnr5FkMSM2qC95CUe9N/GG5DxukurATDqceFPtdHr4tJJhK5B184UeRC/5QonlC8Ma5G6p6jT+qXLc6BdNQ5HmvrLa5N4bJrCwlySXGEEIHlQ6uz2dttbnIb9jktFfBbXTnD3IUvOrGqlbSgSvWjf/Oh+8Fj37+YXhZNLmd0auXlw4fuRZrp2+IL3q2lZNqE9JhJIPvhwZkauakKO09LSvpB1KDySI8ZvF1nLwPoVxa+6zGlDy2ts17FahRQWYfvYTsRePGcZcP2PNMOYLNTbYwi9jTaAfSktRyKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PTZrKJjUqM1atM1ZfxpxqzxSNV6ZNYWYiIqP6S9P8rM=;
 b=15CecplfSCFTSTHFS1RBad+4eMAH1a3/4GdPybeQsdbiYA4LIm2d3IgBxwG3CTTqSqZxqFv5xPT6XAQyNHU2e6l4bN4kF6mh4ZVwrU7vQL6BGk6021/8l1wjf4pMDqPlNjxZ4hjPlVPf8xtyZbKgJrPzBv+LMQT7iyLu7PNCAXM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4758.namprd12.prod.outlook.com (2603:10b6:a03:a5::28)
 by BL3PR12MB9050.namprd12.prod.outlook.com (2603:10b6:208:3b9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.29; Fri, 12 May
 2023 06:26:16 +0000
Received: from BYAPR12MB4758.namprd12.prod.outlook.com
 ([fe80::e78e:b7da:7b9a:a578]) by BYAPR12MB4758.namprd12.prod.outlook.com
 ([fe80::e78e:b7da:7b9a:a578%4]) with mapi id 15.20.6387.022; Fri, 12 May 2023
 06:26:16 +0000
Message-ID: <13a15a42-5d69-5041-3210-8df86670bf8d@amd.com>
Date:   Fri, 12 May 2023 08:26:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] clk: clocking-wizard: Fix Oops in
 clk_wzrd_register_divider()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yang Yingliang <yangyingliang@huawei.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <f0e39b5c-4554-41e0-80d9-54ca3fabd060@kili.mountain>
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <f0e39b5c-4554-41e0-80d9-54ca3fabd060@kili.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0127.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::13) To BYAPR12MB4758.namprd12.prod.outlook.com
 (2603:10b6:a03:a5::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4758:EE_|BL3PR12MB9050:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ca6216d-db4c-4abb-f19b-08db52b1ca53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TYpoAsJoR02XHOhNNPfnTd55M228JxuquOxo15yggTDq7JlCeM866eJ6h5mhiGGpCq1Bg9wlMm5Z+kcGiwMtUVJQj/vHqAOSqbhx/H6ltYYYcMAa0zxbROGVTMuSV9TAutvfyXWajVx5MspEKCTU9SH7O9jYQk8nVF18HvTQQJqMtPu+juIPzi6OD5sp/KsDQpeAmY+hQMpdQPUzrE9eiy4x4ifTDs0hZoMghPTMchIwkoqBtHR28TaupFbxxgZjQ1dkMUZ84cdG6mYrBBUge122VC4LUIT1kFhHSjE3HAQP8oVz571KP6tEV1peXDwpxLzuHdV+YlqRjU7tdbvaKusRZS5TFb+ZH7G3obNpNWqqo+vAoy14PNh9AAZIBkogKCzwUVU+UfuiRWF43fIxCCLb1HGmph3rv8kDrLvdbdxOmZCl9c9WpqRVQKlJkaMXUBwj0GSMNOjYjQpzP6XI3AZmO/WKdJdoVFMWQ/6UC203kGRbrgdjxuDn3XZSt/26Offz/spHnWhV7Id/coYyGZA7M1pnlBjNjHDHHz36KgWPKAdyNAF0DFeODT1whMhsl4U8PwpZ3Jttd/braHLcO8FxohqnaJwk/uVQNVyJtcsg/MXresB3dzmCdlHLa1HpKiojT/GJu6oe8GjF2x5eIg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4758.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(39860400002)(346002)(136003)(376002)(451199021)(41300700001)(8936002)(5660300002)(44832011)(31686004)(110136005)(8676002)(54906003)(4326008)(2906002)(66476007)(66556008)(316002)(66946007)(478600001)(83380400001)(6666004)(53546011)(6512007)(6506007)(6486002)(31696002)(86362001)(36756003)(2616005)(26005)(186003)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXU3S3B6cEFmdEp6YVkyN2dOZndNTUtBdlBlc1ppdFN3OHRzTHFnSnZnL3hq?=
 =?utf-8?B?Unc4VjdEdTZtcTFZUGxBTlBwKzNWemd4WG5GaURoeDVpc0pMOUh4VmtQRzdP?=
 =?utf-8?B?aGVkR1pqOFNrN0NaSkZuZTZtZ2g3bUFtSjhQNVNjRWp6VUFldWJEQ2pGMFg4?=
 =?utf-8?B?dzdaQ1JiaWtlcHpVeDJKZEt3MW13TmkyQmhUclBHd1htMmpZdzIza1IwSm5C?=
 =?utf-8?B?RWxWcjBoek1UOE55Y1pld295YTc1cGp6OHRaSTQzaHhwRURXSlhHQnBJNENR?=
 =?utf-8?B?MmsrR3Ixanl4SE45d2tzMlUzU09icC81UWgwQ3pMNjNwSnk4cVl5TmZJSmdE?=
 =?utf-8?B?MDJFZ1A5STJIcHZMUHY4RTM3clpEMG83Y0hxMXlBbVFCdW1Zd2dRa3VhUXBH?=
 =?utf-8?B?SWdDeFZ2YUZqdjc3QmFXSUJqaTJzRjZKMEZLT1R4RWttTmMyb2k4a2ViaTJ0?=
 =?utf-8?B?Z2d1T2YzcGVVTFN2aENMMVF3WldPMzNqTkVmaitNUzFoTGVwOHRaMFB5U0tm?=
 =?utf-8?B?Q0tRTzAxelpSRGN5WlhVYzBMenpLWlBUVnQwdWNoRGpqZGR4Y1JhanZwMWhu?=
 =?utf-8?B?dXoyQ096U3lTYUZFeHpLQmJGL3ZnVTIrSHhvNXdRS2gwYWlpZEQwYmt4Z0Jt?=
 =?utf-8?B?TGhxR3dNeU1QV2Y0NGVmUitySFJJY0J5MFhhTUdEbjB1U3FKN0duM3poL00w?=
 =?utf-8?B?cG9OZ1VRU3ZYanp4VCs5ZFFIdS9LYlU3MmkrL2UxejhaaSswTzZCZTJoRmdE?=
 =?utf-8?B?TFpSMWJmRThScHRxeXBBZU9tVk96QjBTWVdybWNtRVpOWjBIZU4zcGVyaGhM?=
 =?utf-8?B?Vk9YQzk2aEZJL245WEUxMWdmU2JDMmRJUDB2Mm1lLytWTzNGa2JDR1FvWFF4?=
 =?utf-8?B?UWYrUitMazJxdWJ4aFZETnJPendJRlhKVndwN3BjNFJGdzVSSlBhbG1PNWUz?=
 =?utf-8?B?SS9UVzFPWEpaOUQ4YlpUY3Fhc1N5SXdMMTBHaUc2c1hsdmd3RXZtYjg5am5G?=
 =?utf-8?B?ODhiRWtVSHAxMHZnOXdYZ0FjOFJtZHhFRWJXblZ6SlU2eUJGQXVqNlV2MmdW?=
 =?utf-8?B?L2tCMk52dmVzZUZPejFNZnlDcm1kNndSN1ozNzUzYTdxTnZvY2hzblVvUmsz?=
 =?utf-8?B?SmdzZSszYU82UWovMzhnc2F0aWlpZkZUZFBTTWdwcERSV3k2elBzeFROVi9p?=
 =?utf-8?B?Q2IzSEhqd0ozZ05GNzVGT3J5ZGUydm5mUHExbGJGR1d6ZkpRM2lFbVg0QjhR?=
 =?utf-8?B?bUZyblNxNEswVHJlRlFKRWE4UTlsbGZvYVMyNytYZDU2K2dySU1pbFJrRDRY?=
 =?utf-8?B?bXFFTHNNUGNjSkp5SS8xUmZ3THRPZ0djWkdHdEZYUVlUR2h1ZzBXSkwyZGNi?=
 =?utf-8?B?aFJOSk1EWDYzQk5rbWJTdEpPTE41SWZoZEtIOEx6bFc2OVJFTndCbTJxYUZ5?=
 =?utf-8?B?VHFzclM5SWJuZFREdXRDS1d3L0Q0SjRzTm9JVDIwVTUwNW1Oa2ZpL1hrRXE1?=
 =?utf-8?B?ZmFRQWNDSU9DSHFuVzRMeEs5d3JDaHVIcEx0QVc4QU0wc2VoTkZNTW5PMG1w?=
 =?utf-8?B?a0Y5aTdSbi90MHpDK2EvS21RYzRMWGhPTEV2azhoaUplWGdXUzQyYUJ6TmFx?=
 =?utf-8?B?d0FDRWxqdnVxLys4M1RjcUdQbDBIdEhPZHc0d1BoY2RjdHN5Vm1IdlgydUpt?=
 =?utf-8?B?cHRGcUtERHNoYkFucy9ucmNwWFRlYnF5cGR3ZGh4OFJwN0J4aGM3OXBFd0E0?=
 =?utf-8?B?TmlLTUxKV3l1bDlsTkxLZGJ6ZDJNMGE1ZzFXb1BQZ2FPam9yTTFGRXRXT1JX?=
 =?utf-8?B?NTk0cFF0STZEUWgrYnJIUzQ5ekpjRzRJNnQ1emNOYWl0Y1pUWVRUdTBMVy9p?=
 =?utf-8?B?VWQrZEMrRFhwY0Z1bVR4MGpwVDk0bGpNRHU5azZwbnYwWml6TVNUMXdvZzFZ?=
 =?utf-8?B?dGNkTzZWNktWdXN0ZEpOSzVKZjgyYzdyK2E4SU5sY1VhSHZlam9hNUk4RHdW?=
 =?utf-8?B?NDlSeGpBMjY5bWVSYVAzNE1IMldob2ZTTVMzNGdCZDVSQ2RwcWdDSXJIYkFF?=
 =?utf-8?B?dzN3ek1xRWkya01GSzVNdTBEeFM4alFDTktZRGM2Q29uS2l2NTNlaGlCSVNr?=
 =?utf-8?Q?ImklgfF8DZY/FjnDzvvhOHP+Z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ca6216d-db4c-4abb-f19b-08db52b1ca53
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4758.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 06:26:16.2700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6tTS2HMiUgtA0HHOFlepuZDufrX3UGB/TULvBXQrESYbKS9bGok/okr4e7gNF2cO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB9050
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 5/11/23 19:01, Dan Carpenter wrote:
> Smatch detected this potential error pointer dereference
> clk_wzrd_register_divider().  If devm_clk_hw_register() fails then
> it sets "hw" to an error pointer and then dereferences it on the
> next line.  Return the error directly instead.
> 
> Fixes: 5a853722eb32 ("staging: clocking-wizard: Add support for dynamic reconfiguration")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> index e83f104fad02..16df34f46280 100644
> --- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> +++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> @@ -525,7 +525,7 @@ static struct clk *clk_wzrd_register_divider(struct device *dev,
>   	hw = &div->hw;
>   	ret = devm_clk_hw_register(dev, hw);
>   	if (ret)
> -		hw = ERR_PTR(ret);
> +		return ERR_PTR(ret);
>   
>   	return hw->clk;
>   }

Reviewed-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal
