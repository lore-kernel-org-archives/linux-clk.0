Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9411D63F6;
	Mon,  6 Jan 2025 10:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736157867; cv=fail; b=rKhQZEaYjIOTpj22RbvFSVI4H+RDwiG2kuhPGwC8Ka0WUqqkK7Nl1b5YXHqSXJfYJQnSzgNwH4BFXFESO6rcAvDlZFSSvjD5nIWPCXc8NCnoUt0xVs/DiNBT1MsDqCu/2WW8M/phnK0nsNnKjcpjCLVxT5ZwXIE6vlVRjHUrbpI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736157867; c=relaxed/simple;
	bh=x88b8nudKSwrsPahOcIrlzkyUFBBX5cmub33KqH5ihk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=heSubjKiFkZGuCfYgD3ZaoYOt8Lt5OuCLrLh3+0+vTyfKLv3X5NPZ10RqzORFpqZFWsrbCzSZQjEV3ICYUWOgjsjOj1t9am5I1M34gvkgX1yqfdPC+z4BvL6qVc0Ri1ATxOgBPSADa4ycf61XnvTHAPpzPK65TfnggHagQsKt2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=sl0BwBoD; arc=fail smtp.client-ip=40.107.243.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="sl0BwBoD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AzQddAku/uPw+80+5WVtt2i0evXhDt5AF2fTpvvTmWqzZs3LIxcCuIomDO1T2y5v0kSUVciY4imwcqLxhO0hq2LcVoHo43OMxTewjUnJDAa+YwPe0SxbJeogb5zXLzvUauJNa1RlJx+zp4kAAH17eOXcB45SbZeHiQhC1BIAXV52vqSzrdJnaniMh7whqRlYo85mq7N5hHLFEmKXp+N+5PIYHeKRHOIcInbQgVV6PuUWXTvy3+U2+ajtjX5B/BW8UnZDzFUoYLlEH0YN6STrVBosFsOzrlIDtcmuBkEzMj+pErFpRZ11CRq7FRwLn4WS5qa9G0MIS7RpvckgZQh3CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x88b8nudKSwrsPahOcIrlzkyUFBBX5cmub33KqH5ihk=;
 b=Ca7JqHW59Ef1sBOzl53wDlh574sgERhXKgkvcAfUci4vtuTE/GIOZdRez6PN1vcU8oPuXcH96JbJeuTrBZ924F2jLFm/RjjBqn/LsVLjNZ87HHp0bkuzhEW/PTyMxa2VKT7D/P1QCYXYTY9iPg3CkPCMkMC7DIZZcD8mIDaVBkGBGyxaiAbitns4cgGEFA89PDjKLECZevdpHA+EYZbOIwHec/55MkmjjdMffMRL+Hs6+CdHMpQyFxRT8//kThIQp3W8IaJCJe0gVOIBP/FxtNfTxW30d9ey5WgmnqLulZrPauysbJUBSa5SF4PcKW/jFCz/16sa1feXGnaSRUHz7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x88b8nudKSwrsPahOcIrlzkyUFBBX5cmub33KqH5ihk=;
 b=sl0BwBoDEWR0iYiHOIBlo+8i4J4/6fKEg/zMFwjloCKCwUf9DuLQvJfrhh8hNvYVXtEPfWU8XEGQvu6juWIXPyjq31BAc3dbR/1Rh9bZzf7L1JhXLenpmxDW0UcI6TJN0FteTSISpo9MU4eaEQ6y2JFmY6jnyBNY+kikpcuz/Xw=
Received: from CH2PR12MB4875.namprd12.prod.outlook.com (2603:10b6:610:35::24)
 by PH7PR12MB6668.namprd12.prod.outlook.com (2603:10b6:510:1aa::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 10:04:18 +0000
Received: from CH2PR12MB4875.namprd12.prod.outlook.com
 ([fe80::ff88:6c6f:c187:6511]) by CH2PR12MB4875.namprd12.prod.outlook.com
 ([fe80::ff88:6c6f:c187:6511%4]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 10:04:18 +0000
From: "Visavalia, Rohit" <rohit.visavalia@amd.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "Simek, Michal" <michal.simek@amd.com>, "Sagar, Vishal"
	<vishal.sagar@amd.com>, "javier.carrasco.cruz@gmail.com"
	<javier.carrasco.cruz@gmail.com>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "u.kleine-koenig@baylibre.com"
	<u.kleine-koenig@baylibre.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 3/3] clk: xilinx: vcu: Update vcu init/reset sequence
Thread-Topic: [PATCH v2 3/3] clk: xilinx: vcu: Update vcu init/reset sequence
Thread-Index: AQHbXTh17SjsqjjND0GtrzXXK5AGDLMD3y2AgAWoLfA=
Date: Mon, 6 Jan 2025 10:04:18 +0000
Message-ID:
 <CH2PR12MB48754A75EE4D050A2559F572E5102@CH2PR12MB4875.namprd12.prod.outlook.com>
References: <20250102170359.761670-1-rohit.visavalia@amd.com>
 <20250102170359.761670-4-rohit.visavalia@amd.com>
 <CAMuHMdVxOg3Yh1JxsJuga_qz=98kp5kv8JGg_yk0=HiKop8o5Q@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVxOg3Yh1JxsJuga_qz=98kp5kv8JGg_yk0=HiKop8o5Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB4875:EE_|PH7PR12MB6668:EE_
x-ms-office365-filtering-correlation-id: 237d57ae-8147-4bfa-7742-08dd2e397bd6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?czBVMWQ5dlNaZnptSzhqdis4RWFVUU5nUXhqemZ2Q2dpME9Rd0FVMEI3M3Z0?=
 =?utf-8?B?Wk1JS3o1L2NmYVU0dzBrOFJCd1E5TGNLcG1oMHpyQkcwb0ZuMVpGSzBMMUNG?=
 =?utf-8?B?OFkxV3JkN0cyTFZWaVBoNmk5UWJHbXhTWUlQWXNsY0VFOEVhMEcxMEROa1lr?=
 =?utf-8?B?REJRWEZhZUdSdEh3allGUHd5UnMzaWI3NUt4dmxDZlJOVjNnODZOZ2dEeFZG?=
 =?utf-8?B?WXU5U3lDN09SWWpOM0dZMTkxZlErSzNLbU5Ba2tPTFVQWU5KUEk0RDQ0Tlly?=
 =?utf-8?B?MHU5TEd3K2NucHQ4RW45akllOWhKRXEwaC9tQkpDb3V4alc0Z3AyT1pJZUho?=
 =?utf-8?B?RENva2ZYWjI0dE1XaFh4V0RTS01FN25OR2RHbkEzR21EdEY4Ni9aenZtYzFR?=
 =?utf-8?B?NzFYZXJoZXVrS3ArSlRkYU1Cd2thUVFmc1JWWnBhdHlRWVYzcDBVME5nNTM2?=
 =?utf-8?B?djM1bjVCYlh4T0M2cDdjZmdKWVdjOUh6eHFRMHE0TE9sZGI4Sy9HUmtrOUky?=
 =?utf-8?B?aDVmWXo5OTdZbFFuNC9TOFcwTlppRmNOWTJRcEdBMWF6SHJHUVJQclA3MURw?=
 =?utf-8?B?eUN1ZDNqV1VpVUxFbnNWWXFrblFYUEREQk9ZRXZPb2JhMmNoUkdrQ2dQbCty?=
 =?utf-8?B?WWpxRkoyU0I2UTBsS1dqZWN1dWR5bW1kNTRZUEJqQ29pSHlrRjVHWW44Ri9n?=
 =?utf-8?B?QjJlcFpKV3VlZXh0SlRySUVlYXRaQTRjVUVhYjNIb1BMYk5TekhYMGc1ZGtv?=
 =?utf-8?B?dDVsak53WkhRUVRoSUY0Wmdoc0lxbmNuM05WcEFGV3dDYmViRUNDc0l0VFhh?=
 =?utf-8?B?VHhpVTNTOVFqTTZsYkx0MEJqdlJ3NEJyelZKUHdFUVgybW84b0tFR3d2RnJu?=
 =?utf-8?B?UkltSnZFTDZiQmJUbDJqdm9BYUlNUG93ZGxWMC9PSnQvNkN2M2FNYXQ4S1ox?=
 =?utf-8?B?RXhkbUs5cjhkTm5FY3RVRkp5N2E4Qmo4VmlyVkdtVWFBMHJSOG1OczNmNXFE?=
 =?utf-8?B?Qm84RHRJNWNjUC9oSGNObUZxUzd0bnRvNmk3ODNxUTA2SlFpSm5VSS9WSksv?=
 =?utf-8?B?UlpLbk0xSEQ5K20zMEhIbjJtZEpDRENEZFF3b3plQUFDNjB6ZzFwNnRLYzFw?=
 =?utf-8?B?TUdaM2pSMmZVWm1GZi9ROEcxSUlseGZod3hINUtZQWlhdGtDY0ZPSVpvR2Fj?=
 =?utf-8?B?M3ZURDNWVUl4UjNjSFNia2h1WUhMcjRyVTA2UVcybmF5TzdkbzNrMzF5ZE5I?=
 =?utf-8?B?ajFEM3hLNXZxQ2hBdW1sT0U0M3pNRlQ1S2thY1dwY21UclBNKzdBUUwxYXpl?=
 =?utf-8?B?YkovaFpRTStuaEJqUW5CMU83WDcyYWNVZG04aGkwT0wwYk42RjhOdWMxS0Jx?=
 =?utf-8?B?MkZOM3Zsc29LNnREa25EMG9qSEFTaFpEd1RnMUtuUDRoWjM3bFlwSytLRzMw?=
 =?utf-8?B?WHZ0UXkydEFsVVVrTlJ2ZXlBQUxaTTl3K1oyTC9wY3VhUE5xREFTTHg0Ukdj?=
 =?utf-8?B?N2RWL3ZEWHpodU1QNkRPOWM4WmxaUm1Fa2dUcVF5Z2xadkVtM2g2RlUydktS?=
 =?utf-8?B?bnl1WVNiMnBxSSt1dkZ3bDBtK3I5VnhLTHpveHplK1Zxckh5QVVTZTFWcSsx?=
 =?utf-8?B?Wmp2NXVXZERuYTdtNFNJRGtWanF6bkxVR0dybS82RGlZbzBxeFlvU0ZQVW02?=
 =?utf-8?B?VkxWVUpiN0phYzVkY1FDRnUxWkdQaVdpaGt1L3l6WEJZSCtPNE1INnM3L0lX?=
 =?utf-8?B?M2tXcEg3Rlh1S2txWnJYZVozM0Z1QnhKTXZtZklKV0VEbDJVeEZhNUJ6M3J2?=
 =?utf-8?B?MDE5cU1jSWpqQWFXeWRKVUV3Q2dzL0lDT0ExZ0x1UFZEaWxWK0VPQWQvZUor?=
 =?utf-8?B?SUNEM203d0dKd1MxQXozNXVnWWhRRHZ6MTAzVnJHdDFIVDBFTXNLR0R2Wnc4?=
 =?utf-8?Q?PaUfG8zm0zD6sh57sKpVh6Ii8lyx29Lb?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4875.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YVVpZ2xHY3AvcHFNSythNW1vZytyd21RRUFUNHVrRWRJVGZSYkpnSmdPVWdJ?=
 =?utf-8?B?bjNLVDZpUmxyVmZpRE53ZjlVWFFsUmY3UGFUNm1PSUtBc3ZWTGo3Qm4xZTla?=
 =?utf-8?B?MG9oRFRqdnVPNk55d3R6TGRuZ25pUTV0RnNFMnRRSmdpaE1KZll0TWNGMlRk?=
 =?utf-8?B?VithaE41QThDOWthZmVWc1RDNzFnQWY4TGI1blc3VnVyTGwvSFhoOE1oSWF6?=
 =?utf-8?B?YlF3aTAyV0NPcnJQR2V2N00waCtScE1oMkFOT05mQTB4MHVhVTkzd1J3bUR6?=
 =?utf-8?B?Y1l3L3BVakJzejFxSTRhRW8xc0Q4Y1czS0E4UnMxOVdNeEJ3WkdVdGdIUFVk?=
 =?utf-8?B?V2FEU3AyQ1lKUVd4ayt4WGF6bEd1S1VIKzRLdkc1bVFXaDRYYlVXVzZielFz?=
 =?utf-8?B?cDhqNjRTYjJPRUZRdnVtUTF0TUF0eHZja0lmNGU0eTl3a3FON3ZWZXhleGp3?=
 =?utf-8?B?eHBhQXRsUFhGV1pSdWVOSjZNQk9FVjR3M0RBdUIyNjVNazRhR2xoTXI1QS9N?=
 =?utf-8?B?YmMraVBCV2pKc1JtUFZ5eU5FQTVkMDJBZkNycFVscm8zMGhHdytyUDRlZ2d4?=
 =?utf-8?B?clVkMm10MTFpMmU3eFpuZ0ZqQ2Z3SmVyY1NCU1A4Mm16QzVmaVlwUTdpQWFU?=
 =?utf-8?B?ZTBEWXlHNlg5MTBnR3RmUFY0dWFCbUZjRXNLYXpzbEVxUFhlaUs4elNhOXpl?=
 =?utf-8?B?dkRhUEhzdDVWLzZXdlBpcEpwV0JDTzNtSCtVWUFITUtIeko4Nk4zTm9WeE0z?=
 =?utf-8?B?b2ZXSnUrcG9zck05eFVYUW43WmJyNy84VUVaUmNrVnRDbGJyVGVUSDVLcmdS?=
 =?utf-8?B?TTFQb0hKOGRGTkV2QUhiWlpra3ZVaWtPRXFXRnRmSmRZcE9FK0hQRDdZM2c3?=
 =?utf-8?B?SzFSWnE1Z0phL1FCODVXaFovTjBCaVNRMmJ4N0ZIL1NIY3NMa3NKWkgra0N4?=
 =?utf-8?B?dGJKUFFzVXRYYmU2ZTYxNTZ2dDdyNlh1T2ljdHVVWlRZRGZxbHFXZUdmOVJu?=
 =?utf-8?B?R2dsTjVrVm9tWW80OEdmSFkxaUZSMElIMmxvOUp6ZEQwZFg4YmovMHFJc0FT?=
 =?utf-8?B?M1pHK1IzOFNEZWZLWTNteFNpMUhjMEl6akwwSU03TlN4UWxJNU1RVkFqbzhl?=
 =?utf-8?B?U1hlV3YvbXRES1JZTndONHY5K0U5ZGpkY0lXQjJSc3ZhOHVQbUVZZy94bTlr?=
 =?utf-8?B?OVNIdDJqR3kwd0NNNS9ma3NpYjVjYTRDN3R1eitRRzZYLzNiMllwRjh5enlh?=
 =?utf-8?B?azcxSWo0VjBXUE42cWdURVk3cjI5TXBadUVLK3B5N0RXenYrTUhIdFZVNlVx?=
 =?utf-8?B?bzZBeE5YcDhlVXU2Z2Vhd0g0SzN5RGsrREM5MVNCOFdrOGFMZy93N0FXZ1ky?=
 =?utf-8?B?ays4NmUyQzRQajVrcTBxTU5rNFZRUTBHNzREMWJvd2ZFbDg1LzZPWXdPOWZ4?=
 =?utf-8?B?cDRmbTBIcGg5ZFdIRGpDN1JJU2lRRW1sTDJSRno0SHJpTzFpQ3IrOSs1MHZI?=
 =?utf-8?B?K0htRW9DaFR4Vy9KRUNabGFnZnVMSmk2WTl5SXRXMFFIdlNRdit3ZmoxUUth?=
 =?utf-8?B?MGZWSW5WVGRvZmtkaGU1UTlLNWdWemlxWTZVcUkwV0drUmlwMHNKZmhVOWtU?=
 =?utf-8?B?elJYNE9JZHFQWHBGUzgzU2VlWmVvd29ndVVTTTNvLzdHMkxjUzRRQStaNi9w?=
 =?utf-8?B?NnRLMFpaNG9zd0xWVTRzS2tjL2d4L2MzKy9zWHpPalJqSTkrZHFyRmJVNUVj?=
 =?utf-8?B?SExzQWIrOHZJd0llaFA0VGl0Q1R3eUdYb25Zei8zSkN1azY3Zng2RjVLS2dG?=
 =?utf-8?B?Q1dQSW1qb3VWTm1GQmJhb2dTV0xzK2F2azFmWkpxZkxrdVNKSEwwL1d1aG9p?=
 =?utf-8?B?WmRCZ3pwbjRxSTh2ZFF2WGJxZE03RkIyb3EranAvNitiTnJsUHNWU0o2OWcr?=
 =?utf-8?B?VVk4dVVmS0JjWVI3WjhGbVpaV1dSMXBQVVFTWGhWM2NlR2R4cnJwUlk1M2o3?=
 =?utf-8?B?c0p0MEJZaVdtOXdiTDZsOW0xelFCRFduaE8rd3FLWWVPZUpXM2NGWlU2djNC?=
 =?utf-8?B?TVh3cEJCYTR1cUFyTUVwRGYzcHhVUXNwSzJUUGVDdVJrOFpDdlU4SFFkTEkz?=
 =?utf-8?Q?/BKY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4875.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 237d57ae-8147-4bfa-7742-08dd2e397bd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2025 10:04:18.1938
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DEZOJA+Hyn3aA7SSc3HEiePSdq7fLzleWNmkdpIiY9j3MyofFsC/FOBm/RUb9ZEpd3jRaC9XSYiSIZCjnr0SaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6668

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIHJldmlldy4NCg0KPi0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+RnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9y
Zz4NCj5TZW50OiBGcmlkYXksIEphbnVhcnkgMywgMjAyNSAxOjAxIEFNDQo+VG86IFZpc2F2YWxp
YSwgUm9oaXQgPHJvaGl0LnZpc2F2YWxpYUBhbWQuY29tPg0KPkNjOiBtdHVycXVldHRlQGJheWxp
YnJlLmNvbTsgc2JveWRAa2VybmVsLm9yZzsgU2ltZWssIE1pY2hhbA0KPjxtaWNoYWwuc2ltZWtA
YW1kLmNvbT47IFNhZ2FyLCBWaXNoYWwgPHZpc2hhbC5zYWdhckBhbWQuY29tPjsNCj5qYXZpZXIu
Y2FycmFzY28uY3J1ekBnbWFpbC5jb207IGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlOyB1LmtsZWlu
ZS0NCj5rb2VuaWdAYmF5bGlicmUuY29tOyBsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnOyBsaW51
eC1hcm0tDQo+a2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmcNCj5TdWJqZWN0OiBSZTogW1BBVENIIHYyIDMvM10gY2xrOiB4aWxpbng6IHZjdTog
VXBkYXRlIHZjdSBpbml0L3Jlc2V0IHNlcXVlbmNlDQo+DQo+SGkgUm9oaXQsDQo+DQo+T24gVGh1
LCBKYW4gMiwgMjAyNSBhdCA2OjA04oCvUE0gUm9oaXQgVmlzYXZhbGlhIDxyb2hpdC52aXNhdmFs
aWFAYW1kLmNvbT4gd3JvdGU6DQo+PiBVcGRhdGVkIHZjdSBpbml0L3Jlc2V0IHNlcXVlbmNlIGFz
IHBlciBkZXNpZ24gY2hhbmdlcy4NCj4+IElmIFZDVSByZXNldCBHUElPIGlzIGF2YWlsYWJsZSB0
aGVuIGRvIGFzc2VydCBhbmQgZGUtYXNzZXJ0IGl0IGJlZm9yZQ0KPj4gZW5hYmxpbmcvZGlzYWJs
aW5nIGdhc2tldCBpc29sYXRpb24uDQo+PiBUaGlzIEdQSU8gaXMgYWRkZWQgYmVjYXVzZSBnYXNr
ZXQgaXNvbGF0aW9uIHdpbGwgYmUgcmVtb3ZlZCBkdXJpbmcNCj4+IHN0YXJ0dXAgdGhhdCByZXF1
aXJlcyBhY2Nlc3MgdG8gU0xDUiByZWdpc3RlciBzcGFjZS4gUG9zdCBzdGFydHVwLCB0aGUNCj4+
IG93bmVyc2hpcCBvZiB0aGUgcmVnaXN0ZXIgaW50ZXJmYWNlIGxpZXMgd2l0aCBsb2dpQ09SRSBJ
UC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBSb2hpdCBWaXNhdmFsaWEgPHJvaGl0LnZpc2F2YWxp
YUBhbWQuY29tPg0KPj4gLS0tDQo+PiBDaGFuZ2VzIGluIHYyOg0KPj4gICAtIENoYW5nZWQgcGF0
Y2hlcyBzZXF1ZW5jZSB0byBoYXZlIHBhdGNoZXMgd2l0aCAiRml4ZXMiIGFzIHByZWNlZGluZyBp
biBvcmRlcg0KPj4gICAtIFVzZWQgZGV2X2Vycl9wcm9iZSgpDQo+PiAgIC0gTW92ZWQgd2Fybmlu
ZyB0byBkZXZfZGJnKCkgYW5kIHVwZGF0ZWQgcHJpbnQgd2l0aCBtb3JlIGRldGFpbA0KPg0KPlRo
YW5rcyBmb3IgdGhlIHVwZGF0ZSENCj4NCj4+IC0tLSBhL2RyaXZlcnMvY2xrL3hpbGlueC94bG54
X3ZjdS5jDQo+PiArKysgYi9kcml2ZXJzL2Nsay94aWxpbngveGxueF92Y3UuYw0KPj4gQEAgLTY3
Niw2ICs2NzksMjQgQEAgc3RhdGljIGludCB4dmN1X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpDQo+PiAgICAgICAgICAqIEJpdCAwIDogR2Fza2V0IGlzb2xhdGlvbg0KPj4gICAg
ICAgICAgKiBCaXQgMSA6IHB1dCBWQ1Ugb3V0IG9mIHJlc2V0DQo+PiAgICAgICAgICAqLw0KPj4g
KyAgICAgICB4dmN1LT5yZXNldF9ncGlvID0gZGV2bV9ncGlvZF9nZXRfb3B0aW9uYWwoJnBkZXYt
PmRldiwgInJlc2V0IiwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIEdQSU9EX09VVF9MT1cpOw0KPg0KPlRoaXMgcmVxdWlyZXMgdXBkYXRpbmcg
dGhlIERUIGJpbmRpbmdzIF9maXJzdF8uDQoNClllcywgc2hhcmVkIHBhdGNoIGZvciB0aGUgc2Ft
ZS4NCkxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWNsay8yMDI1MDEwMjE2Mzcw
MC43NTk3MTItMS1yb2hpdC52aXNhdmFsaWFAYW1kLmNvbS8NCg0KPg0KPj4gKyAgICAgICBpZiAo
SVNfRVJSKHh2Y3UtPnJlc2V0X2dwaW8pKSB7DQo+PiArICAgICAgICAgICAgICAgcmV0ID0gUFRS
X0VSUih4dmN1LT5yZXNldF9ncGlvKTsNCj4+ICsgICAgICAgICAgICAgICBkZXZfZXJyX3Byb2Jl
KCZwZGV2LT5kZXYsIHJldCwgImZhaWxlZCB0byBnZXQgcmVzZXQgZ3BpbyBmb3IgdmN1LlxuIik7
DQo+PiArICAgICAgICAgICAgICAgZ290byBlcnJvcl9nZXRfZ3BpbzsNCj4+ICsgICAgICAgfQ0K
Pj4gKw0KPj4gKyAgICAgICBpZiAoeHZjdS0+cmVzZXRfZ3Bpbykgew0KPj4gKyAgICAgICAgICAg
ICAgIGdwaW9kX3NldF92YWx1ZSh4dmN1LT5yZXNldF9ncGlvLCAwKTsNCj4+ICsgICAgICAgICAg
ICAgICAvKiBtaW4gMiBjbG9jayBjeWNsZSBvZiB2Y3UgcGxsX3JlZiwgc2xvd2VzdCBmcmVxIGlz
IDMzLjMzS0h6ICovDQo+PiArICAgICAgICAgICAgICAgdXNsZWVwX3JhbmdlKDYwLCAxMjApOw0K
Pj4gKyAgICAgICAgICAgICAgIGdwaW9kX3NldF92YWx1ZSh4dmN1LT5yZXNldF9ncGlvLCAxKTsN
Cj4+ICsgICAgICAgICAgICAgICB1c2xlZXBfcmFuZ2UoNjAsIDEyMCk7DQo+PiArICAgICAgIH0g
ZWxzZSB7DQo+PiArICAgICAgICAgICAgICAgZGV2X2RiZygmcGRldi0+ZGV2LCAiTm8gcmVzZXQg
Z3BpbyBpbmZvIGZvdW5kIGluIGR0cyBmb3IgVkNVLiBUaGlzIG1heQ0KPnJlc3VsdCBpbiBpbmNv
cnJlY3QgZnVuY3Rpb25hbGl0eSBpZiBWQ1UgaXNvbGF0aW9uIGlzIHJlbW92ZWQgYWZ0ZXIgaW5p
dGlhbGl6YXRpb24gaW4NCj5kZXNpZ25zIHdoZXJlIHRoZSBWQ1UgcmVzZXQgaXMgZHJpdmVuIGJ5
IGdwaW8uXG4iKTsNCj4+ICsgICAgICAgfQ0KPj4gKw0KPj4gICAgICAgICByZWdtYXBfd3JpdGUo
eHZjdS0+bG9naWNvcmVfcmVnX2JhLCBWQ1VfR0FTS0VUX0lOSVQsDQo+PiBWQ1VfR0FTS0VUX1ZB
TFVFKTsNCj4+DQo+PiAgICAgICAgIHJldCA9IHh2Y3VfcmVnaXN0ZXJfY2xvY2tfcHJvdmlkZXIo
eHZjdSk7DQo+DQo+R3J7b2V0amUsZWV0aW5nfXMsDQo+DQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgR2VlcnQNCj4NCj4tLQ0KPkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2Yg
TGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcNCj4NCj5JbiBwZXJzb25h
bCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhh
Y2tlci4gQnV0IHdoZW4NCj5JJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJw
cm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg0KVGhhbmtzDQpSb2hpdA0K
