Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2052.outbound.protection.outlook.com [40.107.237.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02E1199938;
	Thu,  2 Jan 2025 10:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735812338; cv=fail; b=B1A7HIoUjEYkJKkXypsyCyfyWhjAeekojsSBmXzZ2HMDL3QMwB89cfKRCjqR8erRigDuQlXambiDZfwsVLwINYsLYlYnkFrHPkI2GoGvUpJVr/5IsWdTCvVVkbJW3ScJAnn1cmntinId5mSslt+9ThfT0o+zKc886/eGOBPoZA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735812338; c=relaxed/simple;
	bh=9kLt61K+rSzRNRvb7dzxtix3nSG8oD1D1u6z6U/NL70=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=O+6OteVK2yqsuAqNA5FPzJH2XDMRsLEyrG5AvWgoeV/ebvNK7pOUDKHrFLOk6jhXCr16yl7DbVtSCywHJlDpQzzprqM/R+63/C3a1mz5TjufiUcCFR9AfY3LiQ9kiXLxRgrSDkXCWaa9sQ5Q1MojVDnMmAeg9J3T3FPQzoxGTQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=W0Py2+4v; arc=fail smtp.client-ip=40.107.237.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="W0Py2+4v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VrhIJVuo0IWaUuJmcHueqnV/rlThV2f4L3GqAfpXwR37rzfeaebor/8VnOB3OUUbrT7LpFer+rdT7r76HCuLtPUn0bOiIzXr++1gy3LJ6C3/k724fgIuw8GldHGDLc8DxPjAIhIkThCNtsv6ygOpaQjb+qSAsC4GjLcOP7/3O4QQx5IvOUlN+G+UKJd5SOJAdUgfYDmoyszC+FqvpFBaHrbXwdvV62UzjjgGKrfAmIVVEUBKWB3wobwsd60zxOn0Jbi2w56gueX/vPpAjMrFd25Z5JbDZJlLNpqJgnGsHRYIDD35beqMYs6CGut2EX1aRSd+pAhDINYSAkzxhlUkBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9kLt61K+rSzRNRvb7dzxtix3nSG8oD1D1u6z6U/NL70=;
 b=Dr+9HwzM9csHnLZEEhlHLXD+TBjQcSCsn8daOT3W/eb9+yNCAq9v6CEvqo1pTuG+3BCm6fMehXVE7Pq0XG4V9DvTSkYOEgQkMtMDcHV2GR8iUZ22hQnHwQcsgQnFZ+9ejAcJd+dvL5LrN6Pk1/J/dlrtFRwarLtESNopKtNl+k2Pn5uudWUjmWFHhArSWAZUpRw9xdCS+76zVk+xVUjn4nLTtSlLmx3ubw8iRGZPdADym+LN9nLuxA28Omup3x8/3dxmbSxyFTrv78hrrK4UBMeUYdWktY7Z7xdAret4O5j1US7gU1AzTYB0aU9MSDnwz+kt8xL9fYRlT9kIS3qg0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9kLt61K+rSzRNRvb7dzxtix3nSG8oD1D1u6z6U/NL70=;
 b=W0Py2+4v8y3WNazQj4sTzP5ELT+ACezO3wk0dzMGu7ji7XOkh+WyX+zxBhl5K/TeyJooy+SA1qjowbmRNQw4dan1EdSXoYkvpl/gfNFaiVpBcuuhVPWVJaOxBOOxAkvMmw0y3B8eHx4eOjHdPU7kRghmFMy2Ur2tRp6r/PAVkoU=
Received: from CH2PR12MB4875.namprd12.prod.outlook.com (2603:10b6:610:35::24)
 by CY5PR12MB6204.namprd12.prod.outlook.com (2603:10b6:930:23::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.13; Thu, 2 Jan
 2025 10:05:29 +0000
Received: from CH2PR12MB4875.namprd12.prod.outlook.com
 ([fe80::ff88:6c6f:c187:6511]) by CH2PR12MB4875.namprd12.prod.outlook.com
 ([fe80::ff88:6c6f:c187:6511%4]) with mapi id 15.20.8314.012; Thu, 2 Jan 2025
 10:05:29 +0000
From: "Visavalia, Rohit" <rohit.visavalia@amd.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Stephen Boyd <sboyd@kernel.org>, "Simek, Michal" <michal.simek@amd.com>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "Sagar, Vishal"
	<vishal.sagar@amd.com>, "javier.carrasco.cruz@gmail.com"
	<javier.carrasco.cruz@gmail.com>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "u.kleine-koenig@baylibre.com"
	<u.kleine-koenig@baylibre.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/3] clk: xilinx: vcu: Update vcu init/reset sequence
Thread-Topic: [PATCH 1/3] clk: xilinx: vcu: Update vcu init/reset sequence
Thread-Index:
 AQHbV5CXxTy713kYnUeLr9qhPC6Cz7L/ib6AgADGbWCAACCPgIACoIJAgAA5dYCAAAD0UA==
Date: Thu, 2 Jan 2025 10:05:29 +0000
Message-ID:
 <CH2PR12MB487527EDE3C4EC2F5A675C34E5142@CH2PR12MB4875.namprd12.prod.outlook.com>
References: <20241226122023.3439559-1-rohit.visavalia@amd.com>
 <20241226122023.3439559-2-rohit.visavalia@amd.com>
 <5227cdd506bcb0239657216bd36de12f.sboyd@kernel.org>
 <CH2PR12MB48751A8B003E9E30A9A4CDE8E50A2@CH2PR12MB4875.namprd12.prod.outlook.com>
 <CAMuHMdX57SvuVsRhisF1RDtP+TgQsa2i+hBg334yQUxTMsqDPw@mail.gmail.com>
 <CH2PR12MB487534FB01A540F33ECF96E4E5142@CH2PR12MB4875.namprd12.prod.outlook.com>
 <CAMuHMdWZn0FLGXdGhQ-YYksewm8sJK8J5N=_-DQnE1a_xz41yw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWZn0FLGXdGhQ-YYksewm8sJK8J5N=_-DQnE1a_xz41yw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB4875:EE_|CY5PR12MB6204:EE_
x-ms-office365-filtering-correlation-id: dc8aeab6-9a5a-4c2b-580b-08dd2b14fcba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bStVc293b25Bc1FkWDN5TW1IRUtmT3A5K2NWMHZBS05qYzZDYS9TMVdTenpt?=
 =?utf-8?B?bllCZnhnUllLdkRDU0xuT2M2UWx1SzVMbGlGTmFTR0g1ci9HeHZMdDFuV3Zk?=
 =?utf-8?B?N2J3MGtLZWhnSURKNzU3QWs4QnRJeHB4SG9jNGN5ZnZMMXY1UGF3b1p2aE1M?=
 =?utf-8?B?Ym4zdDVTMWVzdm5sN29rd3luSkF0cDUxT0NkYjVKYTl4V092UFprWXFWek1L?=
 =?utf-8?B?RGhpQno4UzFFZFRPWFUyWmszaTEzVDcwdlFhVDdYS0kya1liR3VTK25LalEz?=
 =?utf-8?B?WGpWY0dpLzYyNW1FY1NmV2VyYUV1RVk2am5LMVhsV1hEWkNsVkczL2VGNzJt?=
 =?utf-8?B?eDZVYitQMGhsMkpXcHhGM1R0dWFxNWpxbSswZlYrd0VkTndpSE1BL0FrSnph?=
 =?utf-8?B?MmRtb0w0VDFGTyswRFI2eHJwSDNWYkgzc0pwUU1xK2lqRTRoQlhkQUV6ejhp?=
 =?utf-8?B?dGJZNUFrYWVuTHZLRWdkUFgwYzVXTDM0ejk4NnhMMUkwRXA4azNDcnVNaThS?=
 =?utf-8?B?L3ROaGIwWDZVTnVXUTJIZXF6L0pNRlVLajg4NFlqS1Zva0ZrSFd6NjJKbVVt?=
 =?utf-8?B?SWdYSjEzOGZJbzRnd0NpeStISDhjY28rak5LUzVMRGxaRWhHeVFkbzVtS3pt?=
 =?utf-8?B?UUczS3Vpdlp4YWxmQlE4SnhzZDlIcVMwVTRtYlhaYWM0WDBUZHZZdXhrblZz?=
 =?utf-8?B?NVpweFR0UVN5TEY5Yzd6V3JhRWJyNkpHQk1wNnR5OWRkVWNXaUlKZzl3ZTNk?=
 =?utf-8?B?N0FtRXlZN29sVE5JSTEwcmIzMEtkdFl4Y245UFNJOHNVaGFZYmMydVZDVUlQ?=
 =?utf-8?B?dElyelIwOTZuUmgvbzRraEtRK0tvakVmWVpwRXhsU2RKdHplcEh4WTZEenht?=
 =?utf-8?B?NlZBL1Q4OUlQWkQzMGNvT25GeXcyeGlYVms4M2dqeU9sK1pEQ0VQSkVwa3M0?=
 =?utf-8?B?SjU2dmd1SHg2TUJ0VFlTdW50dGZaVnpSejdLVW16cVdPK2NoWXJrWFZwaFF5?=
 =?utf-8?B?Vm1pby9TQ2dJRWtPU2tESXZ3ejlOZ0dOSjVEU2F1bXlwaGpCRUFudlZhV2ZZ?=
 =?utf-8?B?OGx0b3grdFJIZytDdnNwUisveW9wVjRaSVI3RENXZmJaYXRjUUpNRFR1UGpD?=
 =?utf-8?B?QkJkQ3RRNlpqQVJqdURmS2kzYmE4blVIaC83ZGNaZmd0TGlJUzNzVWkwYVBC?=
 =?utf-8?B?bWVQcG1GalVIQnVreGN6NWhCbjRtaFhNbFErVzJwRDYvL2pHMzdZYllpYmwr?=
 =?utf-8?B?MDZGWEEvNTcwT0ZiSDFRNk5uNUk0aVRERUVRRkZyZnVsWThZTjRFaTE3QjNW?=
 =?utf-8?B?L1o3QWMwQlFaOG56T2VMMzArTFkwQnR1Sm9nckVkck1sWURwQksvQURWQnZB?=
 =?utf-8?B?dnpoY3lKdkpqbmxtWU9VN09VOFRBU1pQSXdoRXZwUGxMVVR6MXZvZDVZaUVj?=
 =?utf-8?B?WXBmZ2hUWk52TGVuSk40TDlpVmdYdzdKTEkxc2hDYVNYZVFyWDdWUVpscXk5?=
 =?utf-8?B?VDIxSTdZWStPNTFRdmc2V05ZWncxNEdPNnNXSGNIVkc4Y0kxZkFINkRTNDJQ?=
 =?utf-8?B?OHhObFhIRjVGVGlQZEk0cU9rMmJqdS9aUDFSS3RITjZ5emM4NCtxdkg3cUln?=
 =?utf-8?B?ajA1cFFLelVDcjBMZ1IyZE43ZDUzUHkwVmhFN2tIUlBBSkdoOXVDRkR5dUZC?=
 =?utf-8?B?cERjTklmOEhOeDRVcGtBQVMvUzlpRjFXcWZjdHVGNWxDZlhzU1FrVzZRb1lj?=
 =?utf-8?B?ZmFqTmdPbUd0YVJmcnVUMEg0VGFIK1JLUnU1N0ptZERpRE82eWNuVEM0NUQ5?=
 =?utf-8?B?NjRxdWIxNk5uR09YenlNdlA5aWNUL3dtRW1TMDN5cGdCTE5sM05ZQXdhTzNR?=
 =?utf-8?B?azJnVmZKMVFLY2JNSGhMS09PNTd2Q3MvTk5WRWdGUDZiSk9nZTMxSUxrdmdW?=
 =?utf-8?Q?Igzuc03/Eo85JFLTETM4JB/iBEjstQx/?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4875.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OGg2RWRaU1NwMjV4QzZkY3orcE9yYThmWFh2aDJIOWQxdlBwZDFXWUtxUDhj?=
 =?utf-8?B?cnlJQlZDeFltQm8zODlQRUVadlVybGRYdEJMZ0Y4bVpydnVaOUhGV1hCdWFD?=
 =?utf-8?B?dm95Q0xQQnAxT0ZSZ3RnTW5IZUtpSHZVMHMzK2VwS3NnME1qSG5xZjNiZVNI?=
 =?utf-8?B?Y2srRTBQS0wxWnArcUd6N3NuangzZmpwR0VWRjgzRThDVGk2NE9SdlJrRTZx?=
 =?utf-8?B?cG9zZDU2eGowUDBEb0tBcUdlZEhyOU5BaHNvTkxBQ3RUUWUzUk1tbDVkbFdj?=
 =?utf-8?B?NklTTWxtYnJ5N3dKNzJDN3ZlenRrWVNod1hWVGtCc1RsRmpYeEFwOTJmQ2I0?=
 =?utf-8?B?K3NSZERnRW1FK3BqZGY4MnBNNkJsQzJQVnExUXFZZW9HVHZGWC9GSklyVE5F?=
 =?utf-8?B?Y3I0djRvZXNkQXVqQjJaaTZGUDZ3QnhnNHQvdnNJZHVsMkZXRFR0YjgxVndn?=
 =?utf-8?B?ZUtyN283di81U29WYUNhL3hkTlRhUU83NmtUWHRTWmxRcW1zUVpSOWVVSlVO?=
 =?utf-8?B?UWp0YUNuV0dqbnJPMWRWZVZkMFNtYndCZmJvSnM0WCs1TEFIZXBuM0VjWFk5?=
 =?utf-8?B?aXpxZGRlYXE1MkJiM3Y2N20yakN0ZE5CR04zSzBYYkxOYU9OSG04SGdReE8y?=
 =?utf-8?B?ekxxSlRKVVVGRVFhMmUvK3RyMkdZKzhuUFk3SSs0dEZuazBGY1ZvdC9mWm1Y?=
 =?utf-8?B?THpTdHpqMUlXcmUvRmc1MW4xYmU0VVRsTUMydXZ1RmV3aTZPZ1FLZnNRaUN0?=
 =?utf-8?B?N2dtMDZsRjM3V1dZRmRJS2o0eTFGMXhRbFgvZmNxYzZIKzhYaEd3WWR6b3VT?=
 =?utf-8?B?MjB4ZktzU1EzdXdrazRYdHhma1pPV1QvU0NkNjZ4UkgwTGhPellUcUIvclNo?=
 =?utf-8?B?clI1MlpkN21ucE8yN3ZLM1k5UzkrcnNRaWdtTkNuT3pCdVg2NVlTaXpEYzlt?=
 =?utf-8?B?aTFQS1MyWmJJM0s5YWkxdDMwd1hVVGo3c0V0Q2RxeGIyNHZpeHhkb2VzeWww?=
 =?utf-8?B?QVBUcEJiU0Q1ZkJKb0JBWEJ0SXlDcW1hcXE5TTRydXh3c1pyWUZIK1RuWUV1?=
 =?utf-8?B?TzVSOTZIeWNiSk9XUnFLTCt4U1ZBZEw4aHRoL0hxZmxXdWdBQi9PWGp2WEM3?=
 =?utf-8?B?Qk9xaGROSDdhT2d6bEVCUVNQSGJrUElVNFpJUUhIQzVXQ2ovYTRORyt6VDZN?=
 =?utf-8?B?UldkdHAvbVJuNVpDNXBacDRJZmRGUnJXYldYMnZlbU5pQklINDdaYWtuUEI0?=
 =?utf-8?B?bkxwWHQxZENlYmU5cTlCR2N6R3l5N2FUYk9aMUQrR3JTL3pLS2FtVWFsUldh?=
 =?utf-8?B?SWtkZEc1WGVCOGVjTHpkVVcyalpybTdsQzNZSUFqRnh4bEcyeGR3ZkMyYWhC?=
 =?utf-8?B?ZTB4VUIreDZqTkNYaEM0bFRLZXJYMTZuSFBBS3hES21WWmF6QndLaWRqQUUw?=
 =?utf-8?B?VHZBdytBMDUwVmpDbFNSNVBGcUhqWXVmOUJNK2ZobUl2T2J0bi9INWhqS0RN?=
 =?utf-8?B?OEkyS0pWaXVSVHpVYVplc2krT2loZjVTL3ROaVpDVVRPTzJUK3k4MFhwajRk?=
 =?utf-8?B?QUxFOXloT2FLb1ZUWGRqNER2QnFxU01RcnFFMUJGTHJzOWM5ZXo5QUlZZDFK?=
 =?utf-8?B?YXhXZStlVDgxSDliakJLd2VpZlBjdU5tQUlXSjV4c201bGtQQ0VWN3EwSG1m?=
 =?utf-8?B?QkRsdXQxVHZkRVgrcDFmeEdYTVZScDlLc3FucVFsRWxQYW9OWmtvZ012bGFS?=
 =?utf-8?B?TUFwZEFGc2o0U0hGRFFrbEIrNW96RFZ3cU9mUlVpVmFOVUQ5M1paaTVCTTZm?=
 =?utf-8?B?WkZRa0VXYy9nOGNMaHhjSDdxSFNVdUdXRDhGK29UTklKNTZ4bFBhY0V4Q0xl?=
 =?utf-8?B?TmttalJqZkk4d0lGNkkwenZhY1BlMGthMWpmUHY0dVY2TkZpaHNyeSt4WWQw?=
 =?utf-8?B?WXBxTDR1Wk9jS3ZySEl4cExkNGU2UmNKdC9pdlM4ckFQa2NFL1MyaE5GZ1dN?=
 =?utf-8?B?dXhCc0QwTmF2Mk45eFh4Nk5wa01aU3VZM3RYd1hITVJDbWJyYUVrZ09PWjln?=
 =?utf-8?B?akdsdVVZWEJKTXdPUk4xcENrdStnczJVa2U3b0FudGwyNEFDbmZRN2EyWG5J?=
 =?utf-8?Q?HhzQ=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: dc8aeab6-9a5a-4c2b-580b-08dd2b14fcba
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2025 10:05:29.5274
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zj52Thhm0pa95LQM01qmOwcMd6MZYs5RXNVx00Q1qjPro14OL+PEg/yG/VKL9oxtJE7t/2vFQ8mFQptewLSj6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6204

SGkgR2VlcnQsDQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEdlZXJ0IFV5
dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+DQo+U2VudDogVGh1cnNkYXksIEphbnVh
cnkgMiwgMjAyNSAzOjI5IFBNDQo+VG86IFZpc2F2YWxpYSwgUm9oaXQgPHJvaGl0LnZpc2F2YWxp
YUBhbWQuY29tPg0KPkNjOiBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+OyBTaW1laywg
TWljaGFsIDxtaWNoYWwuc2ltZWtAYW1kLmNvbT47DQo+bXR1cnF1ZXR0ZUBiYXlsaWJyZS5jb207
IFNhZ2FyLCBWaXNoYWwgPHZpc2hhbC5zYWdhckBhbWQuY29tPjsNCj5qYXZpZXIuY2FycmFzY28u
Y3J1ekBnbWFpbC5jb207IGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlOyB1LmtsZWluZS0NCj5rb2Vu
aWdAYmF5bGlicmUuY29tOyBsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnOyBsaW51eC1hcm0tDQo+
a2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcN
Cj5TdWJqZWN0OiBSZTogW1BBVENIIDEvM10gY2xrOiB4aWxpbng6IHZjdTogVXBkYXRlIHZjdSBp
bml0L3Jlc2V0IHNlcXVlbmNlDQo+DQo+SGkgUm9oaXQsDQo+DQo+T24gVGh1LCBKYW4gMiwgMjAy
NSBhdCA4OjAx4oCvQU0gVmlzYXZhbGlhLCBSb2hpdCA8cm9oaXQudmlzYXZhbGlhQGFtZC5jb20+
IHdyb3RlOg0KPj4gPkZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5v
cmc+IE9uIFR1ZSwgRGVjIDMxLCAyMDI0DQo+PiA+YXQgMzoxNuKAr1BNIFZpc2F2YWxpYSwgUm9o
aXQgPHJvaGl0LnZpc2F2YWxpYUBhbWQuY29tPg0KPj4gPndyb3RlOg0KPj4gPj4gPlN1YmplY3Q6
IFJlOiBbUEFUQ0ggMS8zXSBjbGs6IHhpbGlueDogdmN1OiBVcGRhdGUgdmN1IGluaXQvcmVzZXQN
Cj4+ID4+ID5zZXF1ZW5jZSBRdW90aW5nIFJvaGl0IFZpc2F2YWxpYSAoMjAyNC0xMi0yNiAwNDoy
MDoyMSkNCj4+ID4+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay94aWxpbngveGxueF92Y3Uu
Yw0KPj4gPj4gPj4gYi9kcml2ZXJzL2Nsay94aWxpbngveGxueF92Y3UuYyBpbmRleCA4MTUwMWI0
ODQxMmUuLmYyOTRhMjM5OGNiNA0KPj4gPj4gPj4gMTAwNjQ0DQo+PiA+PiA+PiAtLS0gYS9kcml2
ZXJzL2Nsay94aWxpbngveGxueF92Y3UuYw0KPj4gPj4gPj4gKysrIGIvZHJpdmVycy9jbGsveGls
aW54L3hsbnhfdmN1LmMNCj4+ID4+ID4+IEBAIC02NzYsNiArNjc5LDI0IEBAIHN0YXRpYyBpbnQg
eHZjdV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlDQo+KnBkZXYpDQo+PiA+PiA+PiAgICAg
ICAgICAqIEJpdCAwIDogR2Fza2V0IGlzb2xhdGlvbg0KPj4gPj4gPj4gICAgICAgICAgKiBCaXQg
MSA6IHB1dCBWQ1Ugb3V0IG9mIHJlc2V0DQo+PiA+PiA+PiAgICAgICAgICAqLw0KPj4gPj4gPj4g
KyAgICAgICB4dmN1LT5yZXNldF9ncGlvID0gZGV2bV9ncGlvZF9nZXRfb3B0aW9uYWwoJnBkZXYt
PmRldiwgInJlc2V0IiwNCj4+ID4+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIEdQSU9EX09VVF9MT1cpOw0KPj4gPj4gPj4gKyAgICAgICBpZiAo
SVNfRVJSKHh2Y3UtPnJlc2V0X2dwaW8pKSB7DQo+PiA+PiA+PiArICAgICAgICAgICAgICAgcmV0
ID0gUFRSX0VSUih4dmN1LT5yZXNldF9ncGlvKTsNCj4+ID4+ID4+ICsgICAgICAgICAgICAgICBk
ZXZfZXJyKCZwZGV2LT5kZXYsICJmYWlsZWQgdG8gZ2V0IHJlc2V0IGdwaW8NCj4+ID4+ID4+ICsg
Zm9yIHZjdS5cbiIpOw0KPj4gPj4gPg0KPj4gPj4gPlVzZSBkZXZfZXJyX3Byb2JlKCkgYW5kIGZy
aWVuZHMuDQo+PiA+PiBJIHdpbGwgdGFrZSBjYXJlIGluIHYyIHBhdGNoIHNlcmllcy4NCj4+ID4+
DQo+PiA+PiA+DQo+PiA+PiA+PiArICAgICAgICAgICAgICAgZ290byBlcnJvcl9nZXRfZ3BpbzsN
Cj4+ID4+ID4+ICsgICAgICAgfQ0KPj4gPj4gPj4gKw0KPj4gPj4gPj4gKyAgICAgICBpZiAoeHZj
dS0+cmVzZXRfZ3Bpbykgew0KPj4gPj4gPj4gKyAgICAgICAgICAgICAgIGdwaW9kX3NldF92YWx1
ZSh4dmN1LT5yZXNldF9ncGlvLCAwKTsNCj4+ID4+ID4+ICsgICAgICAgICAgICAgICAvKiBtaW4g
MiBjbG9jayBjeWNsZSBvZiB2Y3UgcGxsX3JlZiwgc2xvd2VzdCBmcmVxIGlzIDMzLjMzS0h6ICov
DQo+PiA+PiA+PiArICAgICAgICAgICAgICAgdXNsZWVwX3JhbmdlKDYwLCAxMjApOw0KPj4gPj4g
Pj4gKyAgICAgICAgICAgICAgIGdwaW9kX3NldF92YWx1ZSh4dmN1LT5yZXNldF9ncGlvLCAxKTsN
Cj4+ID4+ID4+ICsgICAgICAgICAgICAgICB1c2xlZXBfcmFuZ2UoNjAsIDEyMCk7DQo+PiA+PiA+
PiArICAgICAgIH0gZWxzZSB7DQo+PiA+PiA+PiArICAgICAgICAgICAgICAgZGV2X3dhcm4oJnBk
ZXYtPmRldiwgIk5vIHJlc2V0IGdwaW8gaW5mbyBmcm9tDQo+PiA+PiA+PiArIGR0cyBmb3IgdmN1
LiBUaGlzIG1heSBsZWFkIHRvIGluY29ycmVjdCBmdW5jdGlvbmFsaXR5IGlmIFZDVQ0KPj4gPj4g
Pj4gKyBpc29sYXRpb24gaXMgcmVtb3ZlZCBwb3N0IGluaXRpYWxpemF0aW9uLlxuIik7DQo+PiA+
PiA+DQo+PiA+PiA+SXMgaXQgJ3ZjdScgb3IgJ1ZDVSc/IFBpY2sgb25lIHBsZWFzZS4gQWxzbywg
dGhpcyBpcyBnb2luZyB0byBiZQ0KPj4gPj4gPmFuIHVuZml4YWJsZSB3YXJuaW5nIG1lc3NhZ2Ug
aWYgdGhlIHJlc2V0IGlzbid0IHRoZXJlLiBXaHkgaGF2ZSB0aGlzIHdhcm5pbmcNCj5hdCBhbGw/
DQo+PiA+Pg0KPj4gPj4gSSB3aWxsIHVzZSAnVkNVJyBpbiBuZXh0KHYyKSBwYXRjaCBzZXJpZXMu
DQo+PiA+Pg0KPj4gPj4gQWRkZWQgd2FybmluZyBqdXN0IHRvIGluZm9ybSB1c2VyIHRoYXQgaWYg
ZGVzaWduIGhhcyB0aGUgcmVzZXQgZ3Bpbw0KPj4gPj4gYW5kIGl0IGlzDQo+PiA+DQo+PiA+bWlz
c2luZyBpbiBkdCBub2RlIHRoZW4gaXQgY291bGQgbGVhZCB0byBpc3N1ZS4NCj4+ID4NCj4+ID5J
ZiBpdCBjb3VsZCBsZWFkIHRvIGlzc3Vlcywgc2hvdWxkbid0IHRoZSByZXNldCBHUElPIGJlIHJl
cXVpcmVkIGluc3RlYWQgb2YNCj5vcHRpb25hbD8NCj4+DQo+PiBJdCBpcyBtYXJrZWQgYXMgb3B0
aW9uYWwgYXMgZmV3IG9mIHRoZSBaeW5xbXAgZGVzaWducyBhcmUgaGF2aW5nIHZjdV9yZXNldChy
ZXNldA0KPnBpbiBvZiBWQ1UgSVApIGlzIGRyaXZlbiBieSBwcm9jX3N5c19yZXNldC4gcHJvY19z
eXNfcmVzZXQgaXMgYW5vdGhlciBQTCBJUCBkcml2ZW4NCj5ieSB0aGUgUFMgcGxfcmVzZXQuICBT
byBoZXJlIHRoZSBWQ1UgcmVzZXQgaXMgbm90IGRyaXZlbiBieSBheGlfZ3BpbyBvciBQUyBncGlv
IHNvDQo+dGhlcmUgd2lsbCBiZSBubyBncGlvIGVudHJ5Lg0KPg0KPk9LLCB0aGVuIG9wdGlvbmFs
IGlzIGZpbmUuDQo+DQo+PiA+UmVnYXJkbGVzcywgdGhlIHJlc2V0IEdQSU8gc2hvdWxkIGJlIGRv
Y3VtZW50ZWQgaW4gdGhlIERUIGJpbmRpbmdzLg0KPj4NCj4+IFllcywgSSB3aWxsIGJlIHNlbmRp
bmcgcGF0Y2ggZm9yIHRoZSBzYW1lLg0KPj4NCj4+ID5BbmQgcGVyaGFwcyBtYXJrZWQgcmVxdWly
ZWQsIHNvICJtYWtlIGR0YnNfY2hlY2siIHdpbGwgZmxhZyBpdCB3aGVuIGl0J3MNCj5taXNzaW5n
Pw0KPj4gSSBiZWxpZXZlIHJlcGhyYXNpbmcgdGhlIHdhcm5pbmcgdG8gIk5vIHJlc2V0IGdwaW8g
aW5mbyBmb3VuZCBpbiBkdHMgZm9yIFZDVS4gVGhpcw0KPm1heSByZXN1bHQgaW4gaW5jb3JyZWN0
IGZ1bmN0aW9uYWxpdHkgaWYgVkNVIGlzb2xhdGlvbiBpcyByZW1vdmVkIGFmdGVyIGluaXRpYWxp
emF0aW9uDQo+aW4gZGVzaWducyB3aGVyZSB0aGUgVkNVIHJlc2V0IGlzIGRyaXZlbiBieSBncGlv
LiIgd291bGQgbWFrZSBpdCBjbGVhcmVyLiBMZXQgbWUNCj5rbm93IHlvdXIgdGhvdWdodHMuDQo+
DQo+SWYgdGhlIHJlc2V0IGlzIG9wdGlvbmFsIG9uIHNvbWUgc3lzdGVtcyBhbmQgcmVxdWlyZWQg
b24gb3RoZXIgc3lzdGVtcywgdGhlcmUNCj5zaG91bGQgbm90IGJlIGEgd2FybmluZywgSU1ITywg
dW5sZXNzIHRoZSBkcml2ZXIgY2FuIGRldGVjdCBieSBzb21lIG90aGVyIG1lYW5zDQo+d2hlbiB0
aGUgcmVzZXQgaXMgYWN0dWFsbHkgcmVxdWlyZWQuDQpUaGVyZSBpcyBubyB3YXkgdGhhdCBkcml2
ZXIgY2FuIGRldGVjdCB0aGUgc3lzdGVtKGRlc2lnbikgY29ubmVjdGlvbiBmb3IgcmVzZXQgcGlu
LiBJIHdpbGwgbW92ZSB3YXJuaW5nIHRvIGRlYnVnIGkuZS4gZGV2X2RiZygpLg0KDQpUaGFua3MN
ClJvaGl0DQo+DQo+R3J7b2V0amUsZWV0aW5nfXMsDQo+DQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgR2VlcnQNCj4NCj4tLQ0KPkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2Yg
TGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcNCj4NCj5JbiBwZXJzb25h
bCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhh
Y2tlci4gQnV0IHdoZW4NCj5JJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJw
cm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==
