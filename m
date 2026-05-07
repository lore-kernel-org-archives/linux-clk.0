Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010062.outbound.protection.outlook.com [52.101.46.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7593ED5B6;
	Thu,  7 May 2026 11:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778155204; cv=fail; b=glrL1I5z0psdnWezszWeFcb81qvZRoI+3yiFcVd+I6L/fwmA4z56zimzEHEHjhMFgo7cPkqGwwgNVaOOiZ6dCP76kqxcn+e0hJ5i/v5gPTuEz7b1uv5J7ULl9fp/Bisgdbb5mZCFYG7YLw0+eHZ6y5JyBC1q/CumDVmwR1qUJ4g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778155204; c=relaxed/simple;
	bh=AoQ7whE8d4JvlIUpE9FHfHBYgjuuJAV1mXWC42OZ1nc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=p4WgFTPvANh5fud1rNhhomrIiizftRcjOeachQtSo+DYwU8d1s+ykugnvzJNiJtfW1f9InJzV4xLWFBBiisL5j/2vSUUdXPwWQopqLNW3Em2twLdO7TMsn8dT37foO9IwfXxQKBUog0M3/jlDikvTkz0Fwm93y0NNbWMLh5FEnE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=lSk3rQgN; arc=fail smtp.client-ip=52.101.46.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="lSk3rQgN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f0zL576hEcockyPZ+Ej4DjDbvct5Pf+E4E1E6qF72tNoOsJGVbAcPcJVtWsa+JxVNnScbbKZSpze9Egu+0iakBKGnoyCSh9zl1lN20zaUECPOozOC5ignq6LV3s71iTzXG7aX9+FTLXU3QFx4rIFvjjqrhLXaDnqiQtUonUHKzbaxlzSXiSOmFi65RcSbXJKudaHShN4XUvSHGFWO3D58wEAOWSRgOyZdAzb6voI0/RjDXDIi8SajIA2ebS6lCyNyrKMHZscQTJGfjnMlxa+H0YmFJ1gmf0qkx1O1utYrj6TARYuBr8RxKtspC9U4Gg0BYKKjoDdGrc2IGUpxMAtTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7nZ8iYuf/4X6QPXJrpjYGD/EEY3CUXQEEc1AjkoWNu8=;
 b=Y6p9y3C0qEI0WEYlvbtRio6GGhXvExAfaQBYVIRGSz/0tsg9uRQLa/2qKIwMGlscvWU+rfb/xCI8nytJofHOjhDxzX2ILRHe828ewbf7pCwbxJnpUuUrEjeFL2946OZ/EvgiMtXhCf3/IkM4pvhoWCqdhiUSk8hHB5O+F4bodonWVKY+zlWHnq/KtRCVwCmNRcxyVPPoLyy0EOFcyUR2RyilDJ0107MPvD522HY+b/vVWB0upMEHzL3Yeq3UeDEl08TmMz3v3U734V84nG6kL5Wd2fUZZWV4nQZaTj3YLeBXMM5iLtTZjP1razwXDZ3naiQmPo5cLA2h25k/oU1cbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7nZ8iYuf/4X6QPXJrpjYGD/EEY3CUXQEEc1AjkoWNu8=;
 b=lSk3rQgNFAWQwZv0QFq6iLKsuwt/05pcMtIOi1vrVHr7CTJr3IxxjTH6KeGZ6M3lCCFaqZYbUhvQfo1P+VLMlP9D25kf22TBBEqgNkVvmNOQ3X21+YYPgblAobjenFyjvQOdd618zN7oOqAqUDwuvNCMPwwvRrycKmjQ6UqYaZo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9828.namprd12.prod.outlook.com (2603:10b6:408:304::19)
 by PH7PR12MB6859.namprd12.prod.outlook.com (2603:10b6:510:1b5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 11:59:48 +0000
Received: from LV5PR12MB9828.namprd12.prod.outlook.com
 ([fe80::f132:7e75:fd38:8685]) by LV5PR12MB9828.namprd12.prod.outlook.com
 ([fe80::f132:7e75:fd38:8685%5]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 11:59:47 +0000
Message-ID: <65e8c879-fec5-4be9-8211-8e92cf1a0833@amd.com>
Date: Thu, 7 May 2026 17:29:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/3] clock-wizard fixups
To: Colin Foster <colin.foster@in-advantage.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Cc: Brian Masney <bmasney@redhat.com>,
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 Michal Simek <michal.simek@amd.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
References: <20260506200555.2558434-1-colin.foster@in-advantage.com>
Content-Language: en-US
From: "Datta, Shubhrajyoti" <shubhraj@amd.com>
In-Reply-To: <20260506200555.2558434-1-colin.foster@in-advantage.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0073.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::6) To LV5PR12MB9828.namprd12.prod.outlook.com
 (2603:10b6:408:304::19)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9828:EE_|PH7PR12MB6859:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d5b5f1a-e911-49ca-b6b5-08deac3022db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3Yrm5uq7I/R/drDWxmRXYTZcx4ZvixgZnOZJ+447WMnDohU9+POd6bKWRC/52Cb+oPJ7rCpVIxgueUi6QgarMt/qbfdOxzI2fZEmNe78R5yV5En4ND8e7or5jvPIuFE9/XhHtvtn8uESorkPH9kcQwDfthoDZQcZl3Wo0GoQAHpMJXXWm9251jwRSUXR9xa80zl6VBhgYOJnzu/hKN8TjgAeWOb7T8WU1svoavqhYOJRlJlzhtV7+e4S4MqQhtxkRMC0oHbpc8peP8SicvziCmsFarGxFiuH8tuNkxbeOsOmOCJmDombq7xuxx+kbLcZp2T8nuBR+je5Rfh1KMjNagppX/YlFa6IPEDCO3q118oMZmr8T+r9sAeAQzArpQ+z41GhuYhkosGFF8ikBWB3lCUbSxERcqhV2VWbAYKvsoKejMgW6H9Ub+PpP6aPOgy41O7ZNSmai/ca5x+PBUXpBQU/xGsG5gyKX7GjUpKrVGnNTk+L31m6CZ7JuUCriONdGBrxQax7Yb7geHOIXfQy6zMBh9UnhhQA1QSECSY0tW5Ni7xCGMnRMDCRwSJCMOnbz5HrMS75emBZXVGoyUKomPKNbBD/QWhGpx2R9EHM/oxwKBge6LpCGKP/NgjcLDTnjS2ImwAIOXVvwlHTbbpmYSYyZtBn2NoTOu70wXeNd5VpdlN9vuA4R5LvovBwqruc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9828.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmZZNG9nV3BQcldzdU82MVM2ejZLZyttd0FGbTZ4VjFWSHkzNHVwNzdZSnpl?=
 =?utf-8?B?KzMwNFFHZXBYRlEzemlHZ2VvTGdwaGdWYTkrQkJRcDdieDZRTmhXaXZKNkNW?=
 =?utf-8?B?SFVaVWZYVE8zUnVnRzM5Wm9DaWFhYkxreWt1TkZFamRydmdHLzliOUFOaXFC?=
 =?utf-8?B?R0djaENxOVNUbXQzcVpSc1JZRHNvRmhRVytQUFBIT0xqdWtDaG81WXpNZWd2?=
 =?utf-8?B?ZVdWdmNWMlY2VWlwWHh1NkpJeG83M21zeCszT2t3VERGT0lNaVJ0OUVzK1h2?=
 =?utf-8?B?dXdkM00rSythaHRYdjdLcGFNVFB5aWg1NkFLRGNnR0hZa0h6emR4ZTlySnVZ?=
 =?utf-8?B?Q0x1NHdrTWc3cUNwS1JFMnBDTUlDc01YWjFJR21ZWTJpT3drU3hISzYyNEdC?=
 =?utf-8?B?T0Zjb3A4MmRJS29IMThMRjBjdUhxZzZ5TFBOZFF2QUpVQVZJbVlOQTVmMUh1?=
 =?utf-8?B?UE53S25rdjlGam9WZmxiOEk1MU1TcFBuSUZYVWpGRC9oV29teTdnK0V0OHAv?=
 =?utf-8?B?cGJ1ZEZSRXd0anJxeFZSdS9wMThLSTFienlZM0pTcnV6Ykg5ZzBMa1NBdU1p?=
 =?utf-8?B?V0hJVi9UbWNqa3FncE94YWZpcXNNYngwY1hwWG5Cb1NETkRXVnRuajVra0xp?=
 =?utf-8?B?UUxQU3RJNWd0YW9NTU81aXVtZlk2eFpYdEhPOUZlMEZXQ0VaYWxXUjNkQS82?=
 =?utf-8?B?SXJMaGNIdC8xaXAyN0xqbExWU2lJdk5xYlFQSW5zc0YyUHVNN21BdmcxQStS?=
 =?utf-8?B?a3ZnaFJMaDNKMGNZbEZLWExRT2oxZEF5OXpkWDk2S2pVZHV5bEtMT0QvSHJw?=
 =?utf-8?B?YmM3TGhzMW1HZ2J5NEdUTjJBZkRCVE5RSWFuc05yNERiaVRKcGpZaG9HRGU3?=
 =?utf-8?B?NG9xcWJ0SktRMzN4K1g0dVhYQUhUcndlNTJDcmR1T2NOdDVOSTlOaXpRQjFJ?=
 =?utf-8?B?ODQ0K2JubXp0R1RNZXQ2MTJORlkvS3ViM0RRNm05eS9PMDJ5SXZKb3NOSmFz?=
 =?utf-8?B?U0ZrdnpWY2FGZGRuMHVUY0phZUJCMlEwbVhiWGZkWm5Od2tjWW56NzRXM1Bs?=
 =?utf-8?B?YjhPYUlCbDZUT0J6ci9TcU96Y3ErajhBTE00d0Z4QVZCaXdCSGtxSmVwd0oz?=
 =?utf-8?B?cm9JVWJYcjRGV0xXY1hFNDl4S3pNamZSWHBmRlBpUGtpL2M4TjZaSW9WaTd6?=
 =?utf-8?B?ZWl2eUxYbFd4V1hIR3VMTHJFSzZyK2hQa1FTZmxIOW9iQkVxaFNaWWFadEFL?=
 =?utf-8?B?WUF3WnRnQStzelpwRW9uclUrYVlPSGZkYmQwbmtaMTkrbFRDRjM3TGpzd041?=
 =?utf-8?B?cm55Q0RkUGhnMFZnaXBxckVzZFdublZpSTkra1h5bUFablBuWHRaNXNSblRJ?=
 =?utf-8?B?TGtuWlJSVjhSVDBXNUM4eUVKNmxLZ3dtV0RqTnN1YmZYc3dXTnF5Zkd5d2kz?=
 =?utf-8?B?RlJKNEk1S0VBc2VOV0lZTlBFNUlwQ2xscXdRTlFiS0ROYlpISlc2SkhaYzN4?=
 =?utf-8?B?R3lrQzM4NjlnOWJIOXVIZmxGQUJIZXpVOTl6bWltTitvQ1BQRHlwMkxoak9r?=
 =?utf-8?B?R1l5ZWw5S21uMzhFWUE5NHNqS09YZVJEcSszM0d3ZGVCNW1CZC9UMXJXMEJa?=
 =?utf-8?B?cWw5clJnN0diQ3FVWGdvTkRQdnZieVVZMElqMWgvM3RNYVl5NGtqWGhrc2gx?=
 =?utf-8?B?STFOcEg5ekM5Q0I0eU1aZUptR2JEY2ZhVWMyNGRrT0tqMWpZRlFXeUloS0pt?=
 =?utf-8?B?OEdnQjk2Vkx1cFJvYzRJQkFsenNUWGRjTit4TTQvTjZIUkx3VzhQdG9Cc3JE?=
 =?utf-8?B?bEF5T1k3MWFDNnMzOHdkUENZWitUQVRFYlB5VWppRTAwOXMyL0E4MFFKK2NT?=
 =?utf-8?B?ZkZXbDA4b0w5eXkyZnNvb2VDS0RqbmlyQ1B4QmRORlhsRFhHWGdMUVgyMkwy?=
 =?utf-8?B?TTR0OHNNOXlaNzA2ZmFoOWZ5SEtybU0wZjFyeUJRQ25uNFg1b0xNMmUrOTBO?=
 =?utf-8?B?NDVxelZybFBjQ3VyUnhMYjlvV3YxNllpbmV0ZnJTVmt1VG9wZmt3OHRFNnZy?=
 =?utf-8?B?NWFEaGgwQW1EU3JtaGJrUkhhWmdxTzBsL2txZ1pieUdVK1BzT3JPK0JFdFg3?=
 =?utf-8?B?V2tIdXJTQU5jNVdWM3k4TDBzSTZCSU0xbDUrYjNwVEVNeXM3azFleHlkM2k2?=
 =?utf-8?B?VkdVakdMOE1iQURDdWdRblpoTUlScTBWbmxpaTQ1MWVkbnlPWEFwVWFNTWlo?=
 =?utf-8?B?S29xYWRLTzErcno4Vkt2dWtZUS9JNzMwcGs0cGlFckxaYW8ydWdvQWRaaEJj?=
 =?utf-8?B?ZTc1RUVIYWNnZ3pmbXNtNlV0OTExQzRWUTZFOFJYaTh5d0xubWs0Zz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d5b5f1a-e911-49ca-b6b5-08deac3022db
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9828.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 11:59:47.9443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g5IFLCtvA9LUaHeyR/Aypr4hj3eiNUNSycxGlINREGon43kyjXPVM33NtZaSk8kE85UPsYg4LJnjuGBLaBpxBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6859


On 5/7/2026 1:35 AM, Colin Foster wrote:
> The clock-wizard driver had a hard-coded 20KHz minimum accuracy. This
> led to out-of-tree drivers silently failing to set clock rates instead
> of dealing with the best-effort.
>
> Remove this 20KHz restriction to match the Versal clock wizard driver.
> There also was a bug in the difference calculation that is addressed in
> the first patch.
>
> The second patch optimizes the search if an exact match is found.
>
> The third removes the restriction.

LGTM


Reviewed-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>


>
> Colin Foster (3):
>    clk: clocking-wizard: fix clock difference detection
>    clk: clocking-wizard: optimize clock search
>    clk: clocking-wizard: remove 20kHz restriction
>
>   drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>
> --
> 2.43.0
>
