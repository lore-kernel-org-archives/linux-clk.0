Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010031.outbound.protection.outlook.com [52.101.56.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EC2263C8C;
	Mon,  3 Aug 2026 06:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785737298; cv=fail; b=qVuCyR1ucylMF1y2IcYHiCkQ4Bw/AREIbP0V0IPdkRjViJrEWu1WADogK2PKNSgrxBC4RNpLnR+K85C9zyZSZw6FrtTKBz2mdX02788q9tI8HasKKVKxH5i3i7TpGuc1Ewt4dGdO1CEk+CTiNVOeZD0xvwewPt0eph0ojVoOH1c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785737298; c=relaxed/simple;
	bh=ToLW4jkaoP0HfqXVWL69JIXv7Kcbx9v6asQn+a3nDJE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KkVTNUjfQzZrustPHqIp7j2tjgYRbFS6LDAucoSYBlCJcwSwDc3sGO0nxyWlw9fCrhugsbb/YLXgsvCzzwIFHo5v4UQJtQlPdvNJP+NM/dSh6yKclonPOeIsaATbAmV7V0reb5GtE0eGYhBcj2+CsRJOOLEI7RTsEWaM5KVtF4w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=kopECSWe; arc=fail smtp.client-ip=52.101.56.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="kopECSWe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KqLhbgVESufF9A/LgNcZyd/PxqabA7zsOOtmPZTVUGaZkXVenE+XZqK+VU4WG5myuZYJxSi+TgLGgFmPF8TgU6fIdegjtXruISfjxXGejTaE8H5py0px3x0xtG7rBATyyDhPl7xqA1S0+xYS9YQuF6D/fFJuwuwwi9YyQJQCHQ3yTuinC6cGEfIn4n81p7WZ+sNaP+KAXjqanb8ZubMQQKKNragsz7ner3oPD/g1jDPm8mTBBtZlt7YeItdYeOMPOSXXcnm1xiiskzdiaYXyHkaZ2IgM6oYWSF154Ubt6E/v3ZFqHTBrD29LOJPG40fkH3dK8s1TIBX3ZU8v5fuk1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ngwVYPDk5RKgGaw7LtefJKo8430PSR8oUF5uzkSYh8=;
 b=ivyYOXbPIeVEUL2kn1TutEi7d0D9Zoud1zPrXyvpeami7mXbsSKBe2WNz0ny/DKYW+eoSvr25+DG5JqUFSU2wkdNv0A3Y1qFMZgRXLIQ8rqjy+p2h+O+lnKjTwyVMIDpXA3yNnMs32Bjy1EoFF/n/sVo5s80wY+2rtzu4vHkSLHoVoOAlO8POPCd93FgrjYai7WnxUrMDPYfXgehSUXKtBRvbkDOd4nQYo10Uq/cGfXJWvaI1FWbL648wrxiVP6PYnLjsU3ri9T0mfVCUks2gabX4a3DnTKqkwGnJYSLNL3IvAeDo4MVDHQpeA96JeOWemsZIQFbPpk8fEvdFF5fqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ngwVYPDk5RKgGaw7LtefJKo8430PSR8oUF5uzkSYh8=;
 b=kopECSWekGXroAalnjkPHpHaepp+UMBFr/Q2FvDzSasUjGk48hJsVpGBKHrF3ynjhqETrcB4ZaYQRBFt5zrTnsytXt6C95ebyH4+KcgBqm7XialDRxaf9/v/1vHrDYx9BVX2ccv4aUaXgoVL2sxEImXdo7lLaFxZiwDS0YEBq/o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by CH3PR12MB9454.namprd12.prod.outlook.com (2603:10b6:610:1c7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 06:08:14 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 06:08:14 +0000
Message-ID: <5c376cbb-9497-4f0a-8032-ba94758eed12@amd.com>
Date: Mon, 3 Aug 2026 08:07:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: zynq: pll: Fix kernel-doc after determine_rate()
 conversion
To: Babanpreet Singh <bbnpreetsingh@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260802013252.7-1-bbnpreetsingh@gmail.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 xsFNBFFuvDEBEAC9Amu3nk79+J+4xBOuM5XmDmljuukOc6mKB5bBYOa4SrWJZTjeGRf52VMc
 howHe8Y9nSbG92obZMqsdt+d/hmRu3fgwRYiiU97YJjUkCN5paHXyBb+3IdrLNGt8I7C9RMy
 svSoH4WcApYNqvB3rcMtJIna+HUhx8xOk+XCfyKJDnrSuKgx0Svj446qgM5fe7RyFOlGX/wF
 Ae63Hs0RkFo3I/+hLLJP6kwPnOEo3lkvzm3FMMy0D9VxT9e6Y3afe1UTQuhkg8PbABxhowzj
 SEnl0ICoqpBqqROV/w1fOlPrm4WSNlZJunYV4gTEustZf8j9FWncn3QzRhnQOSuzTPFbsbH5
 WVxwDvgHLRTmBuMw1sqvCc7CofjsD1XM9bP3HOBwCxKaTyOxbPJh3D4AdD1u+cF/lj9Fj255
 Es9aATHPvoDQmOzyyRNTQzupN8UtZ+/tB4mhgxWzorpbdItaSXWgdDPDtssJIC+d5+hskys8
 B3jbv86lyM+4jh2URpnL1gqOPwnaf1zm/7sqoN3r64cml94q68jfY4lNTwjA/SnaS1DE9XXa
 XQlkhHgjSLyRjjsMsz+2A4otRLrBbumEUtSMlPfhTi8xUsj9ZfPIUz3fji8vmxZG/Da6jx/c
 a0UQdFFCL4Ay/EMSoGbQouzhC69OQLWNH3rMQbBvrRbiMJbEZwARAQABzSlNaWNoYWwgU2lt
 ZWsgKEFNRCkgPG1pY2hhbC5zaW1la0BhbWQuY29tPsLBlAQTAQgAPgIbAwULCQgHAgYVCgkI
 CwIEFgIDAQIeAQIXgBYhBGc1DJv1zO6bU2Q1ajd8fyH+PR+RBQJn8lwDBQkaRgbLAAoJEDd8
 fyH+PR+RCNAP/iHkKbpP0XXfgfWqf8yyrFHjGPJSknERzxw0glxPztfC3UqeusQ0CPnbI85n
 uQdm5/zRgWr7wi8H2UMqFlfMW8/NH5Da7GOPc26NMTPA2ZG5S2SG2SGZj1Smq8mL4iueePiN
 x1qfWhVm7TfkDHUEmMAYq70sjFcvygyqHUCumpw36CMQSMyrxyEkbYm1NKORlnySAFHy2pOx
 nmXKSaL1yfof3JJLwNwtaBj76GKQILnlYx9QNnt6adCtrZLIhB3HGh4IRJyuiiM0aZi1G8ei
 2ILx2n2LxUw7X6aAD0sYHtNKUCQMCBGQHzJLDYjEyy0kfYoLXV2P6K+7WYnRP+uV8g77Gl9a
 IuGvxgEUITjMakX3e8RjyZ5jmc5ZAsegfJ669oZJOzQouw/W9Qneb820rhA2CKK8BnmlkHP+
 WB5yDks3gSHE/GlOWqRkVZ05sUjVmq/tZ1JEdOapWQovRQsueDjxXcMjgNo5e8ttCyMo44u1
 pKXRJpR5l7/hBYWeMlcKvLwByep+FOGtKsv0xadMKr1M6wPZXkV83jMKxxRE9HlqWJLLUE1Q
 0pDvn1EvlpDj9eED73iMBsrHu9cIk8aweTEbQ4bcKRGfGkXrCwle6xRiKSjXCdzWpOglNhjq
 1g8Ak+G+ZR6r7QarL01BkdE2/WUOLHdGHB1hJxARbP2E3l46zsFNBFFuvDEBEACXqiX5h4IA
 03fJOwh+82aQWeHVAEDpjDzK5hSSJZDE55KP8br1FZrgrjvQ9Ma7thSu1mbr+ydeIqoO1/iM
 fZA+DDPpvo6kscjep11bNhVa0JpHhwnMfHNTSHDMq9OXL9ZZpku/+OXtapISzIH336p4ZUUB
 5asad8Ux70g4gmI92eLWBzFFdlyR4g1Vis511Nn481lsDO9LZhKyWelbif7FKKv4p3FRPSbB
 vEgh71V3NDCPlJJoiHiYaS8IN3uasV/S1+cxVbwz2WcUEZCpeHcY2qsQAEqp4GM7PF2G6gtz
 IOBUMk7fjku1mzlx4zP7uj87LGJTOAxQUJ1HHlx3Li+xu2oF9Vv101/fsCmptAAUMo7KiJgP
 Lu8TsP1migoOoSbGUMR0jQpUcKF2L2jaNVS6updvNjbRmFojK2y6A/Bc6WAKhtdv8/e0/Zby
 iVA7/EN5phZ1GugMJxOLHJ1eqw7DQ5CHcSQ5bOx0Yjmhg4PT6pbW3mB1w+ClAnxhAbyMsfBn
 XxvvcjWIPnBVlB2Z0YH/gizMDdM0Sa/HIz+q7JR7XkGL4MYeAM15m6O7hkCJcoFV7LMzkNKk
 OiCZ3E0JYDsMXvmh3S4EVWAG+buA+9beElCmXDcXPI4PinMPqpwmLNcEhPVMQfvAYRqQp2fg
 1vTEyK58Ms+0a9L1k5MvvbFg9QARAQABwsF8BBgBCAAmAhsMFiEEZzUMm/XM7ptTZDVqN3x/
 If49H5EFAmfyXCkFCRpGBvgACgkQN3x/If49H5GY5xAAoKWHRO/OlI7eMA8VaUgFInmphBAj
 fAgQbW6Zxl9ULaCcNSoJc2D0zYWXftDOJeXyVk5Gb8cMbLA1tIMSM/BgSAnT7As2KfcZDTXQ
 DJSZYWgYKc/YywLgUlpv4slFv5tjmoUvHK9w2DuFLW254pnUuhrdyTEaknEM+qOmPscWOs0R
 dR6mMTN0vBjnLUeYdy0xbaoefjT+tWBybXkVwLDd3d/+mOa9ZiAB7ynuVWu2ow/uGJx0hnRI
 LGfLsiPu47YQrQXu79r7RtVeAYwRh3ul7wx5LABWI6n31oEHxDH+1czVjKsiozRstEaUxuDZ
 jWRHq+AEIq79BTTopj2dnW+sZAsnVpQmc+nod6xR907pzt/HZL0WoWwRVkbg7hqtzKOBoju3
 hftqVr0nx77oBZD6mSJsxM/QuJoaXaTX/a/QiB4Nwrja2jlM0lMUA/bGeM1tQwS7rJLaT3cT
 RBGSlJgyWtR8IQvX3rqHd6QrFi1poQ1/wpLummWO0adWes2U6I3GtD9vxO/cazWrWBDoQ8Da
 otYa9+7v0j0WOBTJaj16LFxdSRq/jZ1y/EIHs3Ysd85mUWXOB8xZ6h+WEMzqAvOt02oWJVbr
 ZLqxG/3ScDXZEUJ6EDJVoLAK50zMk87ece2+4GWGOKfFsiDfh7fnEMXQcykxuowBYUD0tMd2
 mpwx1d8=
In-Reply-To: <20260802013252.7-1-bbnpreetsingh@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0041.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59e::13) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|CH3PR12MB9454:EE_
X-MS-Office365-Filtering-Correlation-Id: d002754f-d8da-42e4-843e-08def1259aba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|56012099006|11063799006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	1gxb19l0RHixG8H0/40Zd0x825vQPiongiYdV363gJGm3RmpIVROhzN94jXAGGdnYndtQ+JzSpsLzMJe7cAKbUSehpSKSVX12xYLGSNAQ7z6L4fpR6u+GOu1ONPwq7vDDMjaO1Rim0qoRAUifdZymYsOjhs2E73xyNvO7mDN4UN++IsU1dH+3QqZ0VTy5fxdO/y+I83ZOPz52MgIl36BgXF/p/fEOX7E2uPGWffMjJzonIKE7lbm71VdvCPcgnQ0WZGCHzru08WfhzPnpU0mkjFUG1baWSXTQY0B3lru8egn0+jyJaKccZCTKi3FzdzRwbwdmS9LA2AmRVzrjDrQ7HlhLU/mJhsQ76XOquhTraJE0RM2yv20kpaehiPbriPLD9nDY6Gfu7lW9SALVANPMzfxzouu/gmh4EmwoXpdLXk9KVrItUB4PMybVJK6uhWNXQ2Wlx8NsiIvkpxYvNK9w2ImWkaceMbJkDfKQ9U/8XtNijs1EZmtWT5o8Yw2c0aLl6LVnc7dzuVIDt5ihl2BVJWWtmBjmqR/nOGMSbl4GyZHfMykMMS9AlTZaPLv7H4HWuaKeSmZ4JhRDbtufig+MHdvPxTKlmIZ8Yk6FYBJeiF1P0yRCXUOsqnuIO6cNcurKxB0bIgEBB+lELA1EQIpPhihOx2kGQ5G7ADXnMnE1wY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHlMYjBNdlVjZEJRM3l3MkNkZSt6ZFlDaVJNdTAwZXRZNGhaNGdTMXE3WGIw?=
 =?utf-8?B?dGhRcW9WemxCKzYwa3ZBSkE3OUo5N3VzamMxakhqYW1NTU43SGxRQWJoMkgw?=
 =?utf-8?B?eFJ4enNwTjk0aU9EYktYdUFwNnpXOUdxT0JRcW4yM1JtK0hhWFc5RWFuMUxP?=
 =?utf-8?B?V3YzdUFzNXdFK0dWMzI4U2duUWE4SndJRU9WTzY2TVhnUUkxMWIzL01odGkx?=
 =?utf-8?B?bGRwNzZiQjQzUW1RSWwzbm9ucE54aXU3Vkd5YWtTd3JyTHlpS3ovNTl5cG4v?=
 =?utf-8?B?VGtmVlFSZzNKc3lhYjJobXNuUzFuaFdNNUUyRjV1RVBFa1QxRk9JRWllaGQ0?=
 =?utf-8?B?QlFrOCtBSitYbVZtaVMrK1NYcEJnNFliRlZTUGoyOGFPdlhBSThxeTBTTk9C?=
 =?utf-8?B?eU1ob01rVjhWdzNralBuZi9nVTd2Tk5aY2FmUm41d2NyckZuN0s5cGxxTUNN?=
 =?utf-8?B?Ky9VRE1GTVlEbVMyR0JxR21wZkN0K29tWG40U0lzWG1LeHVUSm4xZmFOYmtC?=
 =?utf-8?B?N0t6czg5R0YxbFMrNnQzMExJYVFwVFZmc09hNk9NMzdEQVprSVN6TmJTMk1R?=
 =?utf-8?B?ZlBTUU0zamRVcXhuL2J5QU9hK2h5QnZkYUFTSTZHaldEQU8xV3JmOExiU1dz?=
 =?utf-8?B?N3VPNGRZS1Iwb2VrSUpVWDVSb3E4eU5nZlBBakpjZk5NcTlJdG55L0dOOFVM?=
 =?utf-8?B?UVpBak81OHA4T2hjcnJCcFMrSWhzUXFmNUh1Y21IQmEvdTc3L1lVWUI4d241?=
 =?utf-8?B?dTExT3JISW80b2h0aUplcUtmay80WHlXTVVLbWloM09PZUVadjdoZmdkcnJa?=
 =?utf-8?B?bnB4NDVoVlNhTDUyUEZieVJTM0YrQTREbWlYYzM3cUlmRG9qZE1jdmJFWUpX?=
 =?utf-8?B?aUN4ZjYyMXg1aUd0SGlJWENmMkJUQ0gvYkJ5WGl4dlI0b3FSNHhxY3Y4VmZs?=
 =?utf-8?B?a0VDcVN0RHRPdTh3bWZBcktpWG16dDlvc1V2NytxNVVoSGV3b1d5a0VLQnpo?=
 =?utf-8?B?OTNzN29YaHROc3YwNlNpdXpSK044c2JFVy9wc0JycktRdEFBSjZzcE1RbkI4?=
 =?utf-8?B?VER2VEZFV0tGRHNNcFFNOU5LbldyMmRYK0ZBTUx4YkxNZ2VHaUJzdElaU3gv?=
 =?utf-8?B?WkM3dnp2Wk5XNUtVWXkzdTVvUk0rV0pkMWJSUnlLUEdycXczNGcrVllUTElO?=
 =?utf-8?B?VHF3c1IwN09zRTdya0s0dWRlN1U0ejRLRHNQR3JxNmZvbzZZM2VWWWNOdmsv?=
 =?utf-8?B?VjlqRWlEbkg0eUxaQnVyTno0MTNwT1hkdTIwSDJsN0Z2YmVOdnd4LzJXcmMw?=
 =?utf-8?B?NGlIRSt1UW4zYVpRVHNxVGdCdVlVdzhldVdrZlkxd1VlTDYvYjRFTTIzRjRZ?=
 =?utf-8?B?SGloUVJ4VkpzTWFhQkdMdmw2UmlPMnhRNHFEb2dzeVp6R2tKbHk3RUd4SVFF?=
 =?utf-8?B?M1VXWmQrSVdZTWg1QWVuMlQzV3dWM25xVVpXVmRkNC9tRTdmYnBlN2NQeFZv?=
 =?utf-8?B?dHMxZDluajF0UVk0NXd0cWhWenFzUjhTRy9OaWJraTlIL2RvcjJRMzIyVzZh?=
 =?utf-8?B?cUJUR3NrVW5GUHltRGZkaVQzWFgyTll0a3lkaStxMGpRL2t0TzhXVFRBTHA4?=
 =?utf-8?B?eGFFL3Y5eDlqZ3hoaTFYVUt5OW9JZHdHMnRGajN6ckd6UTQ3WEZqaGJhOUZ4?=
 =?utf-8?B?RnZZMFdGMzRBUjlOdzBZM3UzRXdpekVDQ0hVNHdmR0NMbzMvLzBDdSs3UHE3?=
 =?utf-8?B?anZ0QWU1VFAwTkZpMGV5SGN4YTh0M1ZqbkY1U2VKeHZBblRCbFY0VDhJUkRs?=
 =?utf-8?B?Y3pHT292L0UzbWJCemo3cDl0a2NxOENyTWhPT1dWdlFCcEFpNHBON0MzNzF0?=
 =?utf-8?B?cWZNNytxZzhUZXNjb05JYWt2NjFnbTQxQUx4aTA0YjdzcTh2VmJYRWR6eTV0?=
 =?utf-8?B?MHQ5NEZMT1l3OS9URHhxVW9NMHAvUHF5QjYwSjQ2aU9PdmZDNUI3QjB0ZDdz?=
 =?utf-8?B?cEFoWTR4d2tzc3JLTTFHTDJCaTJXM3R6eDB1YXdNVUIycEdCRWJwZU5QWXRC?=
 =?utf-8?B?UGRtdS9reEZ3d2pwSkM4Njc0RFFCcjRiRzVXK1M2QWNlQjRWVnZhcktDRG1Z?=
 =?utf-8?B?a1RVMTRWbjluZ01uQytaK2I0MVZMQTIwZUVaSlJTa2Nkc2Y4cWhKcmZCT1Vz?=
 =?utf-8?B?UUxjanhWc2hUMmVYYkZEVFk1Qm4xc1NmQ0trdlpYQ3NDcFAvdGlrdW5XTGFB?=
 =?utf-8?B?cWVRQUlUYUc0VysrVVhXK0lnOXY3ME0zUVUwVVhwT3N6elZZbjdmNlpYTWRJ?=
 =?utf-8?Q?JgpYAGtY7LVeBral24?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d002754f-d8da-42e4-843e-08def1259aba
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 06:08:14.6488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BmRLFqKrufYAqCiLtfcmedz9DTOXbP7wFv1nVGsI13ugqkJDG6El8U5JUxHxujZ1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9454



On 8/2/26 03:32, Babanpreet Singh wrote:
> Commit 1547747b55d5 ("clk: zynq: pll: convert from round_rate() to
> determine_rate()") replaced zynq_pll_round_rate() with
> zynq_pll_determine_rate() but left its kernel-doc block behind, so the
> block still names the old function and documents the removed @rate and
> @prate parameters instead of @req.
> 
> Retitle the block and describe @req. The Return: line is updated as
> well: it described a frequency and referenced the removed @rate, while
> the function now returns 0 and reports the rounded rate in @req.
> 
> No functional changes.
> 
> Assisted-by: Claude:claude-opus-5 [kernel-doc]
> Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
> ---
>   drivers/clk/zynq/pll.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/zynq/pll.c b/drivers/clk/zynq/pll.c
> index 44c6093783641..500586f50d7c1 100644
> --- a/drivers/clk/zynq/pll.c
> +++ b/drivers/clk/zynq/pll.c
> @@ -42,11 +42,11 @@ struct zynq_pll {
>   #define PLL_FBDIV_MAX	66
>   
>   /**
> - * zynq_pll_round_rate() - Round a clock frequency
> + * zynq_pll_determine_rate() - Round a clock frequency
>    * @hw:		Handle between common and hardware-specific interfaces
> - * @rate:	Desired clock frequency
> - * @prate:	Clock frequency of parent clock
> - * Return:	frequency closest to @rate the hardware can generate.
> + * @req:	Clock rate request, updated with the frequency closest to the
> + *		requested one that the hardware can generate
> + * Return:	0 on success.

0 always. There is no success/failed here.

Thanks,
Michal
