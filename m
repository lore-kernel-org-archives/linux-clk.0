Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794317159;
	b=zYxkoFx2uqGSqlBPOOjUDQZ64suzKPW+q7hEhZjMtZfLJpPZCxRC6CfJKNqRIgrJvlL+
	 wsexDQwU/0E4kCQT37lpAj3lSwdx8DIMFpOWUtJbqUHfOI8GExVnZr6eEy+DsOHb5Us7v
	 YevBk4gQZbwfoE6fRPi48Xw48ksjsHtVncVMs2K1OXdtG4QGsFxFCx0nm6Jt6JjRiCYkh
	 sAzcBnIh7aCBzbVcQ7sQ7WBUY1N7p70lCSUhILPzdqMxtKhrpfnPtxwfgUcOyEXz+Gufp
	 y1Xtkp6GrfGJmhrOdCcgViRRkFo6dRQPcPjzbLh5tQX9ki2Kn7deQl1o4BVvjyKCTYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794317159;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=vbS46dAJ/uqHrp3BmF6rmBx672avasRMYb1GvCbzH4k=;
	b=CKsOZAAsQgRyYXDXR0mjr1FF5MDlTHpiJFRjc0VxXBqsy8s4rY6W/eDMvUGQsI9MYEVe
	 ddIJ2eSiLObx6d8mnC5I8UpjrVmC5QTf4/B4MLvolyipeEEr7qZYkHW/qzex6+efetxBp
	 dOMv4h9NA+nCyIir2ZQIgGGbsLB17wf8GTi90dCwKL7RHD1fa9rTm2cI99+awFt5Agu0V
	 QD5CX61Bwts1bwHAHLcZfpNSEifhzgAk7keHmhmNNQ/MtRbPrXp2eocexNjBaDCarhfAx
	 C3LsZ52YX3Wk+YCYIeBExH5N5JycWwUnbWpu9Dp1291+3WEyfogxxara+Xp1guNXPDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=b6tXKnP5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.10
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010010.outbound.protection.outlook.com [40.93.198.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9818E606A339;
	Tue, 10 Nov 2026 13:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9818E606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=b6tXKnP5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DD2AoQn1HPAo8zasIwSeScmKUJbZRgHLoNCkfAJwLCkugOLPg4Ma7S3Da7vc+x6hK4VZc161Y6pOFmWWhG8W0Mno9orekOf/YrEwgqqrGIdds0fOgDBJWobCKRy7E9NRA4GiwrrkE9ZHOXeZPnWn9pTJehT2p5Wi5J3FEQDmM0OxOdF2qKaXyy0CBGq+URpCa4Uz1VZ56qG1yiShi/2BcI7RrT3/jYy6DaZA2NtESoHD8rgmp2Qv8WXvsN2NmZN3CpUcGHaNJ1yyMHameoxbR2JPoK23MUhz0hGG35163skDbEWrSX7iMhFQKc8ermauNm3n8b48m0fUa8mm2gGabQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vbS46dAJ/uqHrp3BmF6rmBx672avasRMYb1GvCbzH4k=;
 b=XdQJAR1d+T6zeNQF1BCq8WzZgxd91XFf0w6X5+SzZTfhOZC2KqZHS/DnBq9eCKpKCpXGNqor22Q08geZpy8Lmx2VwZDAWuHcirylQQQ/ZGEcOTxLWOoKxdKem7NsJtPd3n/T1xriL8c7yDCx4g/8NKfANpQ4sl80rKOLOHB3Vs5jnkhNjTTxJEngFijP1IzcrvCM2QKDsedqCR/qj/Jhhnm5lG/P5P+QKTGTrhUrEDVjCEc5uAedGSfHJlyIuVeWpbHZOouEVn5ohVmHD3qGL8lt/NSW76KLq2jNBB7HCDROSZJQMSlZZHhEBURRcJzKal3PJHgoYQwxQS+MqWqsVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vbS46dAJ/uqHrp3BmF6rmBx672avasRMYb1GvCbzH4k=;
 b=b6tXKnP5MDpUCbl8ABSeIFRVJSSJQiU6dzvxnSQrRYmdJ/70HEVTDkzfdbSYt7bsX+XY3SqFZqO6BPvbyKOfa50XA9lRfUiWBvk3OjzniSr5kHsiWrSMhualVCpLZEvOgH35tpGyPcxOFuMJr0r8XSGohdTyU+puuyRefRy8Szw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by CY8PR12MB7364.namprd12.prod.outlook.com (2603:10b6:930:50::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 13:21:52 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 13:21:52 +0000
Message-ID: <7abc747f-a9c7-41cd-9dc5-710caf739cf0@amd.com>
Date: Tue, 10 Nov 2026 14:21:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: zynq: return -ETIMEDOUT if the PLL never locks
To: Linkai Gong <gonglinkai@kylinos.cn>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Mike Turquette <mturquette@linaro.org>,
 Soren Brinkmann <soren.brinkmann@xilinx.com>, Kees Cook <kees@kernel.org>,
 Babanpreet Singh <bbnpreetsingh@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260901125323.1556551-1-gonglinkai@kylinos.cn>
 <20260908084727.1552042-1-gonglinkai@kylinos.cn>
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
In-Reply-To: <20260908084727.1552042-1-gonglinkai@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P190CA0010.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::23) To IA4PR12MB9788.namprd12.prod.outlook.com
 (2603:10b6:208:5d5::11)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|CY8PR12MB7364:EE_
X-MS-Office365-Filtering-Correlation-Id: ea4750ee-266b-492c-44f5-08df3f2d956b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|11063799006|4143699003|56012099006|18002099003|22082099003|10067099003|261009223027099003|261102123227099003|261026121527099003|261026140227099003|261021123027099003|261021121427099003|261022105027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	Sgr9RpsFizt3vzSLo2wcNRP8mI12DZxt2jNn6Pin6uFFN6ijDHFAhQNmv5QdvuBSqVzk2WjcwYKFR7fcBtcmPgavkjK+lgB6IvfRgbfxByXwVsGVgNy+OM/5tR/PjgHVLnlZ3vgc/o5k4drgmc0MHscTxLgmEoGGKR7XkcI7YIWr9axsZBAsVXnVBg9SffCk/hGpMixJXfl3ufSU4QQ2OAbSuTKa4pjQzMmT6wUWQVQ+XU52AbLoZw6EyCRUxiECDP7ogQ+z76QxAk65Mib0wia4blAjzboPzZ36alTkahpJimY3ige68MbHGvgVtMZ4nZ2JZGijCCG48sk4aBPANEScP0Jl0u+98DasOfHyHzzDMjJHw+3Im9C8MVOX11x8/gwtmAUujNr2z/DGeiunWdImZkNZaWZKovEWkUDqvQrbLNz6LvX3ybLCAERhBj24RqUxXmQ/t7h7zL8Uv97mo2CC2MQN0vGtgyEJnS9lguzw/ZTi3KaBoyUNoEKTWsY11sUOzZe6RonrK/V5rJtGBGxWbN0W7/ZnZabsH3wTo29Ka0mQpRF9tJIdXV+x/HoOBoVlJCmM2495gpnYYKXulmh38IPS/tsTtX9Ybm67EAt/UXKZnUUVW/48HdEenDE9hNS7+eS0EAH+1uI656tA31OfbEuQLh76sal5rUABUFo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003)(10067099003)(261009223027099003)(261102123227099003)(261026121527099003)(261026140227099003)(261021123027099003)(261021121427099003)(261022105027099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGpTTDFmcmdMWVZWQ3BsaVVqdnlNZTlpOGErRWtGeXQ5eUpLOEVGVWV1Zmdz?=
 =?utf-8?B?dWg5cmhacWk4alJMN3B0UkNLWVU2VEFJMjcyWjFRZTNkeVI2OVdkRDkzRFVV?=
 =?utf-8?B?SjJiYk9JVVIyOWNUb2sxWjBSS214cXZ5eXJIbk1yTm1VS0Z3dHR5VExZVVZu?=
 =?utf-8?B?L29mUm1Mclc4WHdSekVhN3JrbUhNcnhKTmtsZHpsUTVEMDdjWHozU2UwWmRH?=
 =?utf-8?B?U0lPN3VOTXgwU2ltblNlb00ycEtTU1pYdHhIUmZOYzUzK3BVTUVaL2Via3BB?=
 =?utf-8?B?a2k2RE5FK1FNTUJKNHZKcTdzaUZ2eVlEbzNuTmJmdHVZTHArRjd5TmU5T1RW?=
 =?utf-8?B?enhPVHpqTDgxeVF0UktnQ2Z1b1RCUytZL05HNGZYU3JmeTB6RXVqLzR1VWpH?=
 =?utf-8?B?UGwrUHo0b0hKNmhyb2IrVW5LdEE4eVNqdExURlFmb0hiN2FUeTFxVENKQlgx?=
 =?utf-8?B?aFpFZkg3eENLaUg0emdBVEYwMzZrVHFZbmVnZEFGcU1oVldVOVRwWGNBT0pB?=
 =?utf-8?B?bSt3RjB6SS91blVBakk1YzZCNGtJNlBOZ1BQUFFzOERneHY2a2s2Mzl2Nkx4?=
 =?utf-8?B?VFdaanVFdTYrRzFvbWorVmVvL1RIZDZiUGsyR0NUclZ3R0h5L3ZPZmlSZGpM?=
 =?utf-8?B?UEovTGVsWUlpb0dPbHo1dzZ3Z2dWWVFZWjJldTN2bDlXV0FiQ1dwUUpUQTND?=
 =?utf-8?B?bjFQVE5mejFwZ1pGeVdGUTRzQU91WTFkdXMwUXhNNXpFcUkzWTNabENJeHhP?=
 =?utf-8?B?MWZJQlVmZnJzYzc0bGNBTElPcnd5Z0pFbHh1UWx4UFJJVHJtaDFKaTRZUlY1?=
 =?utf-8?B?KzkrY21ueGV1WW91bmphc3NqNDh6TW40ajJTTWJteWN2MHNYajNpcGdZYlZS?=
 =?utf-8?B?cDZWbHlmU2NxMkQrcmMweGVvWUliTTFRUUx5WEdDOGRvbVJJUEVEN2xxZiti?=
 =?utf-8?B?VXNvTUw1Nk5ObHhFYWlWSDVMdUNRcXVtTWU0S0ZBZjNiM1VIbEx4YWkyMUVC?=
 =?utf-8?B?azE2RnowVThPTFB4YXYrbERaWWhkaFN4R2tYa3JhWFhyMXhVU1NQeHZ4ZnJV?=
 =?utf-8?B?cDNlcVNMOEMxdjlSYzVlSzNpMm9lZS9kOXczcWhYblBXSUYwNTRZQllIVFdQ?=
 =?utf-8?B?ZHA5c1JYNGpXa3d4LzlLMlA0djRDUWswbnB5NWQ1TG52cENqMzBiaE00L1FX?=
 =?utf-8?B?Q29tdzkzbHhDbTkvaDQxTmZ0Tkh0MVY5Q2xIOVJXUHpiajNDRzluWkdYeUZC?=
 =?utf-8?B?YytqYlFWMkxERVhUWlF3THRvcHJzeXR1dlpyL3VDUUNkajRpY1RrMjNUL24w?=
 =?utf-8?B?byt2SzNnMWZvaU9yNEJiVU5ZdmFFT1Y2ZmU5V3U1eis2c2JldzYwZE9maE04?=
 =?utf-8?B?RHVtbWFvWVpwSWVmc1ZSanRVNEJvSFFWRm1wMkROalpZZGc0UkdlWk1mVyt6?=
 =?utf-8?B?c25pakFsdTZzWGtVanRKMU1iemY1V2dRV0FKelU1ei84WWl3dWtQMmY3bkMr?=
 =?utf-8?B?M25KZDI4YWh3TjUwdE8rTjF6d1JHT1JGZkpxY0pacUkyQWk2UTBLbnVmQU1z?=
 =?utf-8?B?ZXZobU9CdFRtL1ZrQVRCTjhoSDFBRE0yc1dUTlJVVzllY3Z0ZHc5RW16MXNP?=
 =?utf-8?B?UVEzSjVENW5EVWRDL0orNDBoRUR4MGx5ckJzeE5oOWJEeUIrVEFLQjc4Tm01?=
 =?utf-8?B?UjUyQXdkeUg0c3gwWG0veVFRa1llNmJQTlBnQ3JPOVpYTnN2RGFDdzBiZVNW?=
 =?utf-8?B?bVlYSEFJYTZ6cjlzK3EzMUpFNFRGZFdzSko4ZXBITlpFUmN0ZmprS2YwSXl3?=
 =?utf-8?B?T3Juam5TU1VuYXc4dU96YzJmeGM4c0tSSWg4LzByb3JycEc3VlNHRmxHWEo1?=
 =?utf-8?B?ZGNuQ1pyc01EN0ZiYjZXUWNVTXlDd09jMWMrRmNUYUU4Z3l2dDdXQlNQNVFY?=
 =?utf-8?B?Q081N3RJUnFFV3hEUXlQa2FTL1NTckljL3ZGNGxFUDlIRjY4VXRZWGY0Wnds?=
 =?utf-8?B?VlREOU1SU2lOeEtCOW9sblhGRlNzZE5ZSGVuZGw3bHBobFUwdnZSM2NxbHpN?=
 =?utf-8?B?dkZ1MlB1OEQ2UmNOM3dIQ3R1MVhnbU5mNm5SS05FbzdMeGtLeCtPRGg5MkNn?=
 =?utf-8?B?Z3grZW5YdkR4LzJyNGtMRTZscnZFRXpSbEJXKzZPL1FPSHdjanpCUTdoTXdk?=
 =?utf-8?B?cDBCUHZ2TWYwZUY4MUNiaVh2NThwVWJjeGsyYThyTkFyaUMwZ0xIRWU2TkJN?=
 =?utf-8?B?bXJWam5NaDBNUFVNaHhxZnJGa1NWelppQk1iYXlFa2RNSlJPK21NbDV3TmRO?=
 =?utf-8?Q?o254qU4+jDechHagfd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea4750ee-266b-492c-44f5-08df3f2d956b
X-MS-Exchange-CrossTenant-AuthSource: IA4PR12MB9788.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 13:21:52.4341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ye+QCcajsR7AOf94Axkd/+LWdVKS81PUo24QNkI2nzj8sg+L8uqqppxDtN5MzWVB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7364



On 9/8/26 10:47, Linkai Gong wrote:
> zynq_pll_enable() waits for lock under a spinlock with no timeout.
> A stuck PLL would wedge the enable path with IRQs off.
> 
> Poll with readl_poll_timeout_atomic() and return -ETIMEDOUT on
> failure. The 1 ms upper bound is a software limit for a stuck PLL,
> not a TRM-derived value; Zynq PLL lock is still expected well
> within that window.
> 
> Changes in v2:
> - Use BIT(clk->lockbit)
> - Name the poll delay/timeout constants
> - Clarify the 1 ms bound in the commit message
> 
> Fixes: 3682af46d55f ("clk: zynq: Factor out PLL driver")
> Signed-off-by: Linkai Gong <gonglinkai@kylinos.cn>
> ---
>   drivers/clk/zynq/pll.c | 15 ++++++++++++---
>   1 file changed, 12 insertions(+), 3 deletions(-)
Tested-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal
