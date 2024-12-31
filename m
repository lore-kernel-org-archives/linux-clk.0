Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7778B18027;
	Tue, 31 Dec 2024 14:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735654599; cv=fail; b=fREct7XJKXLC+hZVhrLp77/FLhFXY3nfeMYtEOsM8lG4zIvzKd6SeIl5fhjRMhnONQLuaKWd8zQ+FR0gogCdCPOZaKJ5wz60pC+yfV0MHpo0KDWoElJujuPrzam+ks8L7ldpzjIkv+FksGPoMyI55iir8fVBy8YOUTetZW0n630=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735654599; c=relaxed/simple;
	bh=I32a36SKLvAFIk7gM2Uwsr8MYTepFAYKP9gXuqOyboE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FfpGqFlYKGATwgIvDkpt5b9Os1WKw56CG4lQeRv04MYoEWhqBB8xCZBowSeglNDkDb3ZwjP6SID7W7dv9qpx60UqxO2cF+Krb2aqXgkl72SEbRhogIggJsXYXpfXnubqKT65z307pYVDxsZW+v2mZZh6/yd1UMjpp6CJCnbciPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xQ+V6G5J; arc=fail smtp.client-ip=40.107.93.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xQ+V6G5J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=arktRb/ds8M7r2Dj5lNti8BFYTbzd8cgsR/U3WFqaVVYBLz1feBTcCrzbBuFLQq/Yl+OhIZRGVWSeIuxDuQvDeid0BmWI9iJxaERs13D3JryGuMHDxN14OUCmDI7+XezkzqVXRk8et9XwkXWUAOftK/N6p82JRL9W0VApZLz7MCevGk4BzYADeowGyI73+vILWBpb3ge9NUM2xHh/2IpD6gOOXXY6banGflcwMCoWdYev9aJ48mp9QwJYaJbpCPMjfmz2CYxQur/zia47pC/Bc/Hvutwm4qko0CzV/iUU3ysvwp5V9bHkFM/klmpdD9uXqL9ahpzGE0HiKnBI0e/0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jUVrcTmJjhp6UE/Dmbrp+ORiD9pp/UYTxox1LYYVUOA=;
 b=t6H4+3ECSXWB16sRngfpUU028mGcfHANlk8zjqp10Bbvw30JIj87Xq+sMzzIgkuisQgUJNwrAaUDNQFenziueeXGTXOEF55IX3Gl0bLmyRWXyulvxumeSJvWNNnr7zU6EYSGUGXUmvxEfydiKaIjoP61m2zPrQYlYj/gyNewDUsCktqwR7U1zNXKo2hXt3qAPUAnAqVKMzr/tYmqHd+9+Gmn1g83KSvhL4WxQER9U51e5uATWo5ZvrLUPYoFJFZWFhXUzO1qrdbPx/LHtqMs8wLEQzso1CUzHztPE8ECSigNLfDPE6Tq1UZRzyDZjePp3qmTVY3ah4FpvoaC/HX3/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jUVrcTmJjhp6UE/Dmbrp+ORiD9pp/UYTxox1LYYVUOA=;
 b=xQ+V6G5JqzPkGf7oad3/XesDw1QYlYg76fdV+DuejV3mWw5D3QqspvLGPz7LrXprK1pZIbsXzi+MVH3PJBEBhu6Os5H/9kZExPDrFBAMf4ZoMBEKISME4xz1qmtXcsV/Sn3Po34fcdwppGpyMQpW8jTMjzefkVJP38Y5M7EogDQ=
Received: from CH2PR12MB4875.namprd12.prod.outlook.com (2603:10b6:610:35::24)
 by SN7PR12MB8101.namprd12.prod.outlook.com (2603:10b6:806:321::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Tue, 31 Dec
 2024 14:16:29 +0000
Received: from CH2PR12MB4875.namprd12.prod.outlook.com
 ([fe80::ff88:6c6f:c187:6511]) by CH2PR12MB4875.namprd12.prod.outlook.com
 ([fe80::ff88:6c6f:c187:6511%5]) with mapi id 15.20.8293.020; Tue, 31 Dec 2024
 14:16:29 +0000
From: "Visavalia, Rohit" <rohit.visavalia@amd.com>
To: Stephen Boyd <sboyd@kernel.org>, "Simek, Michal" <michal.simek@amd.com>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "Sagar, Vishal"
	<vishal.sagar@amd.com>
CC: "javier.carrasco.cruz@gmail.com" <javier.carrasco.cruz@gmail.com>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>,
	"u.kleine-koenig@baylibre.com" <u.kleine-koenig@baylibre.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 3/3] clk: xilinx: vcu: unregister pll_post only if
 registered correctly
Thread-Topic: [PATCH 3/3] clk: xilinx: vcu: unregister pll_post only if
 registered correctly
Thread-Index: AQHbV5CYCeTF6WdQlEiXT9Q2Oh43YLL/iRMAgADQ6NA=
Date: Tue, 31 Dec 2024 14:16:29 +0000
Message-ID:
 <CH2PR12MB487569DF2CB4E5B62A221227E50A2@CH2PR12MB4875.namprd12.prod.outlook.com>
References: <20241226122023.3439559-1-rohit.visavalia@amd.com>
 <20241226122023.3439559-4-rohit.visavalia@amd.com>
 <c110a740502cda3fafa55828292ce34c.sboyd@kernel.org>
In-Reply-To: <c110a740502cda3fafa55828292ce34c.sboyd@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB4875:EE_|SN7PR12MB8101:EE_
x-ms-office365-filtering-correlation-id: 955d309e-bba0-4be3-3626-08dd29a5b870
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?eJZRetEwMkiFhtg3n4Hkk/xQxSmBeqqKSWfcu7CIaXYhPZpLCi7fHvVaTiX5?=
 =?us-ascii?Q?hJhAwEHUExpwF2DcdJdV21li0N6qcra0figmOQ5xV2TMP4tr9DAtIlneizyx?=
 =?us-ascii?Q?9EUMPDHF7QRiHE3cn+rCrFDZ1Jnp5yv+8SvLJ/VzQU/Ec8MNYORjmiuBTeCd?=
 =?us-ascii?Q?PUU7sg2T2IaUegN2AGxGmeDdzcuyl8sFA3A3ai65xXRqxIZgIyTBKkn6a7Rz?=
 =?us-ascii?Q?rapi+q6l0+AFJ4nHZdLCR0TAve2bF5K989XZ1OZTU10W/uKxr9u+RVAN4G3X?=
 =?us-ascii?Q?CcUvA2517VIk7jg98Ows20RqMHAPm4AiD1FBxK5qqsokvJ00n6LZqZ+rkj/8?=
 =?us-ascii?Q?BITu0iMi1cilck+b5kZ8lsPmrhTMekuTcxu+Udo+8rl6XyDoGlsuAuAXqAE9?=
 =?us-ascii?Q?3/YUwHNmVRylSQM0dbQvShi4IKZ6r2vimivCCKuKL0cGLQMX3lbWDnVoW8/D?=
 =?us-ascii?Q?sJrFjBpP5hSbmJ0S7Li7J6S15Nx+cxf0ksOWKFbuFiL9r84Aa/Moy4YayA2J?=
 =?us-ascii?Q?De1rIIeNIi3OI3vlDG4CQy/shB1JIV7ejSTycJhuZrGsDnbBWKjBsfrGpUbc?=
 =?us-ascii?Q?GljomL11ZaTrv+5VuEC30b+ir5/Y/6DG7th7SgPM9F4w4caFm1kXqc38sUBA?=
 =?us-ascii?Q?t33vTB3wyHUBwfknLqUpMjgsRczgfEnOHH+0MXVApGvLE9W7TishLxR1B1Bz?=
 =?us-ascii?Q?LYp4P3IfGrFg2hi+4xD6I3coWkMcGZ8Rx1OEzLxR+cYisufOdWC+7wyc8HLb?=
 =?us-ascii?Q?ojpxkrpg/To8R217haME7flXougvnHJZWhihGWZLC1JdLyQyPD6UdYAwMGFB?=
 =?us-ascii?Q?S9obPjpuZn1P4xpmd4OUOO5RabUv44aW+AyLqASpui7PGXR8Okr6cQUJmRgr?=
 =?us-ascii?Q?sHG10Go7OEz8qb+JSh1oF34KQBo76E/YWfUS2nsKDqnb2gAcAMWwtEp+YOAL?=
 =?us-ascii?Q?VzdJIeE10gHE7r0h28R03FwYlfkhg1jweY9NnMlKeGnjD8njg5UhYlazI/Ra?=
 =?us-ascii?Q?4LwHFepwMb15B+BWhV3dlsK4p3jHzoFT4l/wxHiWRaFATl5bOTxDnMZnMoXy?=
 =?us-ascii?Q?kTGWs0gzKB/LOSew61aY0QmTySXnOQ/B1Lk0ff2i0sKOSMkwaFBTKWl8Vwwj?=
 =?us-ascii?Q?L1gV+Jr37gX6CA6wXZH//fK445imIpHRAMILrei00f1aOORfhaNGI7bMBBBH?=
 =?us-ascii?Q?vCWoayDJoyoZAQF+awM1nUcATipc0/cytw+TujHo4M2Pd/YkOBy0l54MdzRP?=
 =?us-ascii?Q?3unrgS7LYT6fWRuCBsLOqHXyRNgK4FhOzF730b+h1c8qKzKRAbjW8Lr8LlGq?=
 =?us-ascii?Q?zaNYD3NhTx9b/sebZByUOY8sUbwkYiy9p16jfFOg2COYucy0fQKk/JmBiwm9?=
 =?us-ascii?Q?VnEZ5lyI6im4It6H1StTE8w1gXTU6SOBBiZeUxzzn6GzHym2SFOXg6Jc6SBo?=
 =?us-ascii?Q?1gwzlXUl8nNkAY+izpUg8PzPUmNbobRN?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4875.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?3xol9m0jUn3Km6w/ovwd/4LFPrsKdO7P8gnYnLapdsRmLBqfph151KVS817i?=
 =?us-ascii?Q?bk1ydzyALB2QRqe9kTVaoI0+BIygjS7diCU19FA7enjkfM89iZo44EIaBPsE?=
 =?us-ascii?Q?+64INeyP4Zd4rWXXQHtGZRPdFyhExqahOQpN9dpi1IhvvA/EN8S9fpijOH1W?=
 =?us-ascii?Q?5SY+u2M99e//szmZpA+nVNGuQNxESCnK7GFB5UGqlSCE3UIVN3ws2g6QWSUZ?=
 =?us-ascii?Q?zLckLfAxiaRP41jG4gJF2tVJQxIIUKAGPmItd/0hld3oGZRCSO5S+tfZaJH6?=
 =?us-ascii?Q?0GIciOU5n6zStu/P5Q1ucc23soqKMo5aIIMyGnF+QRl2HGj3HqlBLFWIiap8?=
 =?us-ascii?Q?X1ripQp/MZx0c1EW6gWq5EWqhNPkTC7WTPv6RRXfK9VZSNmgCznhi4BEmE5y?=
 =?us-ascii?Q?MWl/2zD9Z9jmOmfTr3w+V0sbocvplv6FJhtWU+Om6H0pORoBQtXZpvVEdt5W?=
 =?us-ascii?Q?mS0JcY0s6epehnJgMs4ZokuIe0fOuss1jnPGbrbKNSmr2EZuKqdNiqrzHmrz?=
 =?us-ascii?Q?ESYQ4x6qcm/KJu2ngLHZzgGnU2pE9eit9CTVAc1xAfhDJJawJQBtaQVTyYUm?=
 =?us-ascii?Q?8kwWBd6ucRImpFHz7Mr0TqTkiimwGN4rSKAODa4Rj3eMnN0xQeyfFUGtwJst?=
 =?us-ascii?Q?aO/9fdkNg5xNelVvzo9i7mU05/TRAgijqaVQtCZNpBXva9rhLfT3lq60DD2z?=
 =?us-ascii?Q?6DmmxQkXu5WLS89dB4Vt3/N4HqJPlOq6N2CD9pXPReT9NBdpM1l/Q7f11/RU?=
 =?us-ascii?Q?o5udWTHji96UEDyqR51AXu49G1edumasxvf9TcLaO/iePipy8fthodcJTlky?=
 =?us-ascii?Q?9t7l+SfXXf2An/3z07BZJY+fxCsP0aIhCgavu2DnRk5ND8C52QjUBvELypZK?=
 =?us-ascii?Q?9Qbi1HmIkZP4W8ruTqNdJ1Ihf1tteECoh/2Cx0P3OUJW+ClaNeSVYcmeWIir?=
 =?us-ascii?Q?TAh52Tyup6RdugkLo7RumWVedjJGywWPqDbHnTgnij55cKQn46xmkYipyKne?=
 =?us-ascii?Q?osK649QafM2luGWEGEQsfs/D43zeIMPtr3wm0wMZ0tDvrNayAPgpp0H+Yesx?=
 =?us-ascii?Q?UJJEfXN8+pqyZ7JMJ279dFDDf1lTz2kOwwDdYJW71s+KDMaE1fwtkibJJl8n?=
 =?us-ascii?Q?nZEjX82rKQ47Geq/rxMyO+S+vpWtMuG+XLubKKO9tLd5JXnIeEelxpZt0yuR?=
 =?us-ascii?Q?S32QLI5pi4NMGrhX6lhmSzRLlltZ/vqq3/3xfr2/bNLw36N4RvnS6d7mv4tj?=
 =?us-ascii?Q?xMixlnQLPKWCdlHP/lhhuxIA2S6pFjVaZ8+lfmMIrebZyqP9NoIBj5HxsGpD?=
 =?us-ascii?Q?z0qrNhd7uFnZRJ7LU/cPlhLYrb25KjNz1qZYT1ro0EB1Vdao47lA9KeaaFu5?=
 =?us-ascii?Q?NbteHic6EawhgCuX0Bm7xTGPwwQ8x+I1GUfdOXrm1f3GfU2iqrZfptPyVNSJ?=
 =?us-ascii?Q?/8Lxb8KWgTpmPiTLB1zGzyTZz9ky5FmcC6GaWqNzPDPGdKVDCIEtZd0ah4pf?=
 =?us-ascii?Q?B2jCx/p72HyHQPXhQ7ECpHMKgaZpcJBDT1tmvKAnKionfTHhwbeowVCiBPfE?=
 =?us-ascii?Q?CcNsBpxeO+elZoQUxu0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4875.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 955d309e-bba0-4be3-3626-08dd29a5b870
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Dec 2024 14:16:29.6738
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aVNQNsWh2cN9E47wk6+T1y0h1W+o/0/7a35MiT2sr7WNTj7v5Wy0WwPXLnOf51SAF8AA7SRJfyJXogXfkho3uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8101

Hi Stephen,

Thanks for the review.

>-----Original Message-----
>From: Stephen Boyd <sboyd@kernel.org>
>Sent: Tuesday, December 31, 2024 6:07 AM
>To: Visavalia, Rohit <rohit.visavalia@amd.com>; Simek, Michal
><michal.simek@amd.com>; mturquette@baylibre.com; Sagar, Vishal
><vishal.sagar@amd.com>
>Cc: javier.carrasco.cruz@gmail.com; geert+renesas@glider.be; u.kleine-
>koenig@baylibre.com; linux-clk@vger.kernel.org; linux-arm-
>kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Visavalia, Rohit
><rohit.visavalia@amd.com>
>Subject: Re: [PATCH 3/3] clk: xilinx: vcu: unregister pll_post only if reg=
istered
>correctly
>
>Quoting Rohit Visavalia (2024-12-26 04:20:23)
>> If registration of pll_post is failed, it will be set to NULL or ERR,
>> unregistering same will fail with following call trace:
>>
>> Unable to handle kernel NULL pointer dereference at virtual address
>> 008 pc : clk_hw_unregister+0xc/0x20 lr :
>> clk_hw_unregister_fixed_factor+0x18/0x30
>> sp : ffff800011923850
>> ...
>> Call trace:
>>  clk_hw_unregister+0xc/0x20
>>  clk_hw_unregister_fixed_factor+0x18/0x30
>>  xvcu_unregister_clock_provider+0xcc/0xf4 [xlnx_vcu]
>> xvcu_probe+0x2bc/0x53c [xlnx_vcu]
>>
>> Signed-off-by: Rohit Visavalia <rohit.visavalia@amd.com>
>
>Please add a Fixes tag, and put fixes earlier in the series so they can be=
 applied
>while other patches go through review.
I will take care in next patch series.

Thanks
Rohit
