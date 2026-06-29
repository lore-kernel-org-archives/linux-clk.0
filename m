Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011032.outbound.protection.outlook.com [40.93.194.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0759D3B71DE;
	Mon, 29 Jun 2026 09:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727169; cv=fail; b=WAyCkyk44e9SGRtGNq7B8qBg5FH2LQRUv44DMDMXrELjEIZneTA+o5avHH1SU+cQ5h09KGjgbUjK1PKM1wFV0BtxMxZQrG2pm3v0I+Q5RM6lICApVA7EvsojlFG1I2iKCTu0nyTc0ikQkSA/w/jLtIlLO/lqZd5OQnc0wxit0Js=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727169; c=relaxed/simple;
	bh=CXPJ+TkGShM0nQPo/7Ut8boDu8biiy2MFwG+vaOV0nU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GWSQ3zorvAQ/nw28Py2lqIDB7rBLvWe7MDbFhskFrGQiiRtuLoadBvEE+SPpl+Uhk+Lpkk0Rw9oE05iDK/6KI/YBKzSn9jQcpV02Fr/em71f+0grGd7eKhQ0zX8hciTZcRLQh6jI71FLz4WIQR3H9Wmxr05QW40EOWx9qeFn1UE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=SJMvZGI+; arc=fail smtp.client-ip=40.93.194.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="SJMvZGI+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j6GjLhhsB0IkD3J77Zb+b3Pjus1hTfHfehsg9w7ENC3HPE/OM8odqXpEIBs+OCsbp+oKRLf8cvb/qwEPKIBaH0B4QzXeVHItDSVYDSrRNoFTyvxw+JIFPGbyJqaTqo3XxdfCt+CmXl1g8nMKFE/NN/20Z4cZ8feWUi4OOdw8uOq9x46mncUszEckkBVdhBvwhCGFurzMRFWCYBy7pPRwK9L2Fs/DJmqybzh6ZJN1QAQxmHT/JccQOsmi836lt1gJUXPs2ZqYbOmTHvJncHOz7PdnquuJ2CRyzSxpPJ9ceyv3SBzdykcFch2AjODpFSzbFmWpo0QU/YKGFmwUkWZzeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=an6IvaYorx4kfjhO0rfPbQ/C3Z1yU1fJXK7mjpH3E4A=;
 b=McppUxTLIHDs0le3HI1kxvLAPjcYDU46cdp4r7Lsu2S8i1TNlLqc/6cerMhLuNFsgW8jLhS8hkJcLoaaxP8NF8qm0Cx5zqw/a5S8Y3VdWnR3V8sYdH6HdLcgXvVs60YRjLWWktR3VmDFbrQsVjW+4nljNWS0jKuKpIq04seQAAeAe3KL9XOsudIpu0q9jSg5FEyqXXhhhAOsqjZWkbZvzCsBdrN6gttdo/NIxnda3QVud0C9XDBLer9GetMOdQDtNVVoy/m9YCyYPyuxJusKaXJShi9wcz8s34gW66g/Sg4SG4nBevw8a5XDXqtyxODNgPMTR3WFSlmtO61vc3FNdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=an6IvaYorx4kfjhO0rfPbQ/C3Z1yU1fJXK7mjpH3E4A=;
 b=SJMvZGI+WK8u7UtvyB0pfP/ZZGQb7YBZFSsJ48imT6U8euIKzb0NO2apvqbSiLYzB9gByL2/0sSJWUBa4zhLnMtNqN9FOKijRPJ4BDBkPMSmNu4a+zlOIlTNKp14q+rEOl9rZ9jTzILBJyzt2Mw49Cc9Le3Xjyj8YJPNtQ6c5Jg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Mon, 29 Jun
 2026 09:59:23 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 09:59:23 +0000
Message-ID: <bfc16eac-6a4a-425c-b460-449dc1d91558@amd.com>
Date: Mon, 29 Jun 2026 11:59:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] clock: versal-clk: Fix Versal NET clock binding
 and switch to CCF
To: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>,
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 Stephen Boyd <sboyd@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, kishore Manne <nava.kishore.manne@amd.com>,
 "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
References: <cover.1780499520.git.michal.simek@amd.com>
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
In-Reply-To: <cover.1780499520.git.michal.simek@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::34) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|BL1PR12MB5753:EE_
X-MS-Office365-Filtering-Correlation-Id: a5779989-c5d5-4baa-e023-08ded5c5187b
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|18002099003|22082099003|11063799006|56012099006|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	VaMgs4Zljj226yNBNk3B3cCp4FMMoJa48ibLOz3N/wX/y3yIqhbqCEwigKJybrbv221W2xUhjjluUQO7bgBNP1EhF21GCNbrLyoLnkdom//5CB/NjQzoOPrGXiIoQ3FB/Op8BRzn4swWRlJi31nT3aNlcprCQBHp0lCspIURbCnVlNJz8SEuGvrz8V7q2pqP+YBe961qQ+whI+bscOGXBNPg7PXMrDT7eCTDWWy9LKAlqkvOlLPjxRaiEBpl3gbrI8Y5ojxYzP7aE2JLImQD3Ww3+C0eTm1rAYN91viHZfha/9vPqCnePPI4ER1SLAtAKBU8jvELhApYrTVDEOhfdVEdy2zi0qxge/aVRI0IF1rb7ro8+UmhH2p/9ukFo6VagYUFaJvoIeYgHnuoMrjQqKXdTh0e1zZ6WWG1uPWSlkWu42iYxzptvmbY4u+WfvKBAZbO+/wiVGAtwbMg2iTKpJ+374lieFvj/nEWzQkvFf+rDiMTtT5lo1pQMNYJgK+9YXSKMUmE3CkrWTHfmNVmrZoJhxr9wzDl9ut4irB86dzTiwVlXIqJ2+SmAThRJRoH9XvV+1I6E8xSPd9FmrsHjxshYCoHWZqcxqEmWEuOU0tGvdMs0fn+s9e0XULEYcHLHw1TUJlvaKyu52BQb9B7f57CBqffjx5E2aRu4sPnx6c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1pqWjZIYmZsQ1hJVk1rVnltaGNKMlFHVVo4ZTBxUWVpakxvZDM0cW9iOE5I?=
 =?utf-8?B?bmJPNXEyNTU2aUs3MHJqUXllU1JlaUZBWG90S1hybVphSjhhQ3FEdDM2M0VI?=
 =?utf-8?B?VjdPSXdSNHpMMnNETXcxUkFCcnI5U2lYS3dvd1lKdHJ5QUZUZ2xLUmpzOFdH?=
 =?utf-8?B?eWwrM3dFMVlZMTdqUm9NbENQNk1VYS9FNlZiUnNjSE1vMWI0UXJzSEZhWm1K?=
 =?utf-8?B?TjZFMzJ6b1BTNGVjRXZFZXNyRzVjZktGcHV2RFRtcXpTaE0yQ1kwWVFXU2sw?=
 =?utf-8?B?SGxPZXhZSWVjNWFKNWxNcnRrQllJNGxUc0tzTTRwU1hiLzdjV1JONVZyYVA0?=
 =?utf-8?B?Q0M2RnBYRHBrS0ZQeXNhcDBsYjYyOEh2ejRNNW1GcURmWUozYUlvMjJaaWlN?=
 =?utf-8?B?N1c0UW5MSjlSVm9MeUdOY213K3RBV0h0b2d6ZGJhMjFOemE4UmduRE5LeVY4?=
 =?utf-8?B?bGI2T2x6eFkxR0RYK2pZdmJicWtocnNWQmNkTEQvbkJiNXNrQ1VvNmFoK2F6?=
 =?utf-8?B?dmhzbDJiRjBFZ2QxdmxmbjBPd1VlSlMyRlVQSUZwTEtocGNTUVpZUDVTYTc2?=
 =?utf-8?B?OGdFeXFuWUxxTTk4T2MrM21KdjB2MCtGU0swVjhHWWNqZm5YT0ZhRlE0dzdI?=
 =?utf-8?B?elU4SGJuRWxzSktpbEM2aEo2azlSajFzUnFvNTEwZEhBdEZacFlSa0sxQ0JQ?=
 =?utf-8?B?SFl2bFdrY3F0UHdHVWk3OWJRZjNkWHViRGl3bUZPcURjNFdmQitzNHF5VG5v?=
 =?utf-8?B?Sjd2RmJwaG0wd1lNZ240Rzh2TUVveWlaeFZnTUhUeXUvN3FnNFJoengxLzdm?=
 =?utf-8?B?Q2EvUkcvdEtmQ1ZzdlBtei90d1cwUWVyRWhNZU02dTVUMXh3K0dGRHZZcEdM?=
 =?utf-8?B?VGtyZUdNMGUyaDZMZGNQbWhxdFlPeFJkMXhabUNqY2Y0bER1M04wSytxZk5V?=
 =?utf-8?B?dmxDQ1BJcFcyTThuV1dJWkZ1aTBKQjh6K3VHdUIrYksyQzN0SlQ2Y2tWM2RJ?=
 =?utf-8?B?N3V4N0FWcHl2c2lBM0JnbW44bG14K0xMQmhzemdMMnBxYWdsQ2hsclZKMnFS?=
 =?utf-8?B?TUhpTEpVei9LbURZVEIzTWI4YWRWc3p4VndubzQ0WUUwOEZjbXVlNVdvTlY2?=
 =?utf-8?B?amNVSVNJR3R5ZzkzUy95Zk1aRWVuMkc4RFRCa0gxS3gxK2M5K29SOHQzNEZX?=
 =?utf-8?B?TnE0b2NoVEtKdUc4OUVZc2p1Um9IaTkxMFlBRi9kZTZQc2liajRkcktjbm1a?=
 =?utf-8?B?UUhYN0hnd1laY1k5MjArSWtLbkhPSDVhS20wZ0VIbUsyWFJpc2dydThBR0dV?=
 =?utf-8?B?bE84bXE0OXdvY0RuYS85MVNJRWJaUzA3YjRuUE9mZ2tvTEhjeU9TMnpEM3d6?=
 =?utf-8?B?R1ZQcURWbkdSeWNQakdIK1hub1VlNmdpTFBiaitpSGxHYS93T21EdC9OWGY4?=
 =?utf-8?B?cUJiSzVMUWxDcVM1YnlYK3plV1hjcnB2UFNsbzhWRnVZYVhpaXZIZncyV1No?=
 =?utf-8?B?aDhSTGdiZFY1U1JHL0QvL2hvQjJ5cTlrVk5RVjFKMXlGeVhXRHAwWDhNakF6?=
 =?utf-8?B?R3dXN1BJMmJxcWhOUGV6Qk5TWURpQ20yUWx6WFNRMGFsMVdGWTcwT0FyWnUw?=
 =?utf-8?B?VVNUUDB4alVESDVMcVl0UkhhdytqeGlvbitKVHZMUyt6VDRsTlNaRURucGIw?=
 =?utf-8?B?Z2hOUkQrVjFFWUpscldKaFBSNWMzM3lBQjE5dGlNZWRSalJUb2Q5V09FZnpj?=
 =?utf-8?B?OFd2VHl0b1JWVXVZOG41amJ3cUIveTRBWi84MFl5STVoOEt0Mi90Z3AwdGZR?=
 =?utf-8?B?cFZiYVMzQzNDNWFWMWlhZ3pMTnZDVm5IRTFtVUFTVFRLeWVpeCs3SllQU1d2?=
 =?utf-8?B?NjhHUzEvbHZPSlJSQmFsakFlK24vWjhkSGRLMVpRRHMydmQ0OFdhOHVMREkv?=
 =?utf-8?B?WFZmamZJa0lYVUhpR3NBRjJHYUVMK2JXVFZSNk80WlZCbmtVbVpXUDNWWllC?=
 =?utf-8?B?MTR2c3BUL1pROVlkSkE4d0d3ZUFmcldualFFYlV3dHVFNlcxRkNOUjRuYWVj?=
 =?utf-8?B?dWMwVHVzZ2VGbVA5aUszV0lBYjFLdDBmZURaelhGbTFYS25PbzNaNVFEUjAv?=
 =?utf-8?B?cGxET05sMW56MDRIK1VxTXpSOVNUd3RvMkRTNVFDNjJpODBqYTN0ZkFDaHJ4?=
 =?utf-8?B?bTJLSW1IU2VXTHVxaDZvUGZMZVVWUjlnVXpOSk50UlEwa3NMbkRTVDdmbWFp?=
 =?utf-8?B?VS8weVhuRjM0T3Q1SjVmL3BtWnF3eTlzUFF2ZTgvV1hRa2ZqUFE0YXJVNGJF?=
 =?utf-8?Q?uCQJSMtOBgTOzpIaNe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5779989-c5d5-4baa-e023-08ded5c5187b
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 09:59:23.0576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TpHE7ll3wPaDKQVY7nKh6/3sVg4aR5YTe5YqU7dI+YYPG4Ke+KTdAozbv9y+94Qm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5753



On 6/3/26 17:12, Michal Simek wrote:
> This series fixes the Versal NET clock controller DT binding validation
> and switches the platform to use the firmware-based CCF clock interface.
> 
> Patch 1 extracts zynqmp to own DT binding file.
> 
> Patch 2 restructures the if/then conditions in the versal-clk binding
> schema so that xlnx,versal-net-clk is matched first before falling back
> to xlnx,versal-clk. This fixes false "too long" validation errors caused
> by both conditions matching simultaneously when the fallback compatible
> is present. A dedicated example for the Versal NET 3-clock configuration
> is added and all examples are split into separate blocks for independent
> validation.
> 
> Patch 3 switches Versal NET from static fixed-clock definitions to the
> firmware-based clock interface, enabling proper clock management
> through platform firmware. DT macro headers for clocks, power domains
> and resets are added.
> 
> Thanks,
> Michal
> 
> Changes in v3:
> - new patch in series
> - New patch in series
> - Cover change in zynqmp-firmware.yaml
> - Move clock-cells to be the last in the example
> - Remove comment around (Optional clock) which is obvious from schema
>    itself
> - Move clock-cells to be the last property in the example
> - use 2 spaces for indentation in example to follow the same style which is
>    already used
> - Add fixed tag
> - Remove interrupt from zynqmp-power - Versal NET is using event framework
>    instead. No interrupt is required.
> - Remove unused GEM{0,1}_REF_{R,T}X macros
> - Update commit message
> - s/zynqmp/versal-net/ in subject
> - Update copyrights
> - Make all macro values lower case
> - Fix guarding macro names
> 
> Changes in v2:
> - New patch in series
> - Split zynqmp-clk from versal-clk
> - Update logic without ZynqMP part in this file and have if/else only
>    around min/maxItems
> - use clock-<HZ> node name for fixed clocks
> - Reuse existing versal-net-clk.dtsi file
> 
> Michal Simek (5):
>    dt-bindings: firmware: xilinx: Add missing example for ZynqMP
>    dt-bindings: clock: versal-clk: Fix mio_clk index range in clock-names
>      pattern
>    dt-bindings: clock: Move xlnx,zynqmp-clk to its own schema
>    dt-bindings: clock: versal-clk: Fix Versal NET clock validation
>    arm64: versal-net: Switch Versal NET to firmware clock interface
> 
>   .../bindings/clock/xlnx,versal-clk.yaml       |  89 +----
>   .../bindings/clock/xlnx,zynqmp-clk.yaml       |  68 ++++
>   .../firmware/xilinx/xlnx,zynqmp-firmware.yaml |  15 +-
>   .../arm64/boot/dts/xilinx/versal-net-clk.dtsi | 345 +++++++++++++-----
>   arch/arm64/boot/dts/xilinx/xlnx-versal-clk.h  | 123 +++++++
>   .../boot/dts/xilinx/xlnx-versal-net-clk.h     |  74 ++++
>   .../boot/dts/xilinx/xlnx-versal-net-power.h   |  38 ++
>   .../boot/dts/xilinx/xlnx-versal-net-resets.h  |  53 +++
>   .../arm64/boot/dts/xilinx/xlnx-versal-power.h |  55 +++
>   .../boot/dts/xilinx/xlnx-versal-resets.h      | 106 ++++++
>   10 files changed, 795 insertions(+), 171 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.yaml
>   create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-clk.h
>   create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-net-clk.h
>   create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-net-power.h
>   create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-net-resets.h
>   create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-power.h
>   create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-resets.h
> 

Applied.
M
