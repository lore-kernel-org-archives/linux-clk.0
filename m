Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2041.outbound.protection.outlook.com [40.107.92.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E483B4431;
	Thu,  2 Jan 2025 07:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735801283; cv=fail; b=g5PzwMfZ3lR0giwvMm+GHcddbDDSzJxSEM6NOr9x8pIU6AyC5ta8c41jKDa+NqDQD8dgMb9g/YXDKscamjGt5XRofZckemVuUiEFSZPp51mY8KHMWEYzqvQu9SdEOcZ0U3uJWOnUo7MWITpfXRczHHAfYkMGVpWAkUQQynWt9a0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735801283; c=relaxed/simple;
	bh=EncdopaC4DMeKkQT4cP16F89TjVW/J6rozyL4JdtlVQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=S3X+3k/9CqLCiRsS3QUPmuU57Tcwk49HBrlq/9SGRB6/rf/dp7aM5Yo1nl+m5MQMkUxiamd9Xggh2b/Rb9LpCFTQuRB7DR1HmX4oboqjR+Ih8A2+oXlyU/d8sIwNAu8xFQcfrJy1ZAkm1yiD8CMyjyUWlaMdbq+s+NBmi3bkSFk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=koCQ5J7c; arc=fail smtp.client-ip=40.107.92.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="koCQ5J7c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aeatgcQ/A8zcRYKS57i40nK64QfbO7p3JHqEbONTFcP6XOalfEkItUG+wmHjo/B9Ds8uyXbGFm1ielXNDCTT6vczusS/qrRnwwO89TTpbkmLRmf88hicDX8dmKniJ65dFsoXuY8EGH5C8foKRX4R4GeNwpyIatTCFTqgMnMXyPBmGWmpetCwkbkFbyPdmlaQNp8s0+uxJ4AGhcUUPnz7sZjOulEgb8aJhhwdSPoJhjSI252+GF/2dj0O5EKC/KzUYjIN9scBSKrtlN0Qd9ikkInXPcuisN2vtbbCTVK1ezOlwyL97jHv2IO5AdCfyUOlzq506I5oT5CQC2koN0hvjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EncdopaC4DMeKkQT4cP16F89TjVW/J6rozyL4JdtlVQ=;
 b=TMhpIyKmYJ0Tmcxaia+gX6WH2oRsPd9PqFBB3bmvdA752BV/oqvCge18dvloWKrlnTzUEvyVn5CpfnZfVxa9afd2XtiX0I1ZUC6Y73WgHNgetEVaZh0Rmx8kaM0m6N4eZJq/s2m00PxsZW/ALTUP07o8pftsUGv3Cd+cO0jAy94mjd0k/JpBoOCVOIp/tGpIJT67J6a1IFK/MS+vDGqG8VOI4FPKhcUYnWUqlZ8aoG7YcLK7e1InZCQaU/FKiMotTBYYGmmmL593JtVZ6nSnJlyV3ESN1znyHY3k+zNCSxXcIrx8H0zMmNFzM+OfKAIH4VJYxbhWf6EXoYgUxv9fNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EncdopaC4DMeKkQT4cP16F89TjVW/J6rozyL4JdtlVQ=;
 b=koCQ5J7cCU2FFHsq/fjR8P3GIe5CpwT6a9HydEiouJpc1bH2loyxTlIiAljZgdxslgmffaR1IDIu6UTpRFPxOxYHOb4DpEHjX2GYJ8GT0pDO8BYhwOWxiE3wdUQMGXh9RgnQQ5PDFWhLFTFPlO3qoASLMOS6jRxDZWEFqMLsJEk=
Received: from CH2PR12MB4875.namprd12.prod.outlook.com (2603:10b6:610:35::24)
 by BL4PR12MB9477.namprd12.prod.outlook.com (2603:10b6:208:58d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.20; Thu, 2 Jan
 2025 07:01:15 +0000
Received: from CH2PR12MB4875.namprd12.prod.outlook.com
 ([fe80::ff88:6c6f:c187:6511]) by CH2PR12MB4875.namprd12.prod.outlook.com
 ([fe80::ff88:6c6f:c187:6511%4]) with mapi id 15.20.8314.012; Thu, 2 Jan 2025
 07:01:14 +0000
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
Thread-Index: AQHbV5CXxTy713kYnUeLr9qhPC6Cz7L/ib6AgADGbWCAACCPgIACoIJA
Date: Thu, 2 Jan 2025 07:01:14 +0000
Message-ID:
 <CH2PR12MB487534FB01A540F33ECF96E4E5142@CH2PR12MB4875.namprd12.prod.outlook.com>
References: <20241226122023.3439559-1-rohit.visavalia@amd.com>
 <20241226122023.3439559-2-rohit.visavalia@amd.com>
 <5227cdd506bcb0239657216bd36de12f.sboyd@kernel.org>
 <CH2PR12MB48751A8B003E9E30A9A4CDE8E50A2@CH2PR12MB4875.namprd12.prod.outlook.com>
 <CAMuHMdX57SvuVsRhisF1RDtP+TgQsa2i+hBg334yQUxTMsqDPw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdX57SvuVsRhisF1RDtP+TgQsa2i+hBg334yQUxTMsqDPw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB4875:EE_|BL4PR12MB9477:EE_
x-ms-office365-filtering-correlation-id: 11409fc9-0323-473d-c0d7-08dd2afb3f32
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?THBOOXRwR2pCUHBKMUVod1o2WWpIWTdNRTh1cjZqcHdsOHJaV081cFo1Wnlx?=
 =?utf-8?B?WldNNGx2L2s5dGpXUWFJMHRNZUl5UHppVUhOMFRROGlOckdad3VjYTRyRnV4?=
 =?utf-8?B?ekp4cWs4Q1hydzN3eEdXUDJWR0xtVG5YMTJDRC9pcExDeXpYMTlPd3hsOWxy?=
 =?utf-8?B?REkxVmZoQVlTaU9WZThyMG82MmVPS0k1ZFAwYUdyeUU2VWZwWnJYTWluQ1Vj?=
 =?utf-8?B?VkdtcXh0MGZwQWdxbE5nZlZRQ1BqbVEzbkdqeDhTbnBhdE8rRDBvYmczZHJr?=
 =?utf-8?B?TEk4UitmcXQ0WXRBdnFvWXV3alc2d0grOXRuRFdMekRBNHRhYy9palRXbGN2?=
 =?utf-8?B?MlU3eTlVZkw4cE1EM0FMSDVpNHcrclREUEovWjJsOFkrT3AzUFJZemw0OHdE?=
 =?utf-8?B?dWUxcnJ6RU1abTdiTXBpOHhpK3haeURwdUhVd05yOEJiRWNxSmg3bUNhN240?=
 =?utf-8?B?czM4WnNNakFMUUllMXBxN1EzdjBaQ3Y3aEJlOXNQdjJ3cmdMTTZ1MkNBMjFU?=
 =?utf-8?B?L1Bsd05lWDNYV2lyMXc3QkVESkJCZTQyNWZQTms0dm10T01qNnNEaXI1cDZD?=
 =?utf-8?B?b3pVdWF5eUhiUXlMT1hZUXI3R1A5ZW5pTWM5ZHovbXd2bVFQOFV6amV2RDlJ?=
 =?utf-8?B?R3pPRDRzZXBQR3Z2bVB0VnlkSWYzSHR3VEJoT3FKR0J4ejdmR3lXckhvS09a?=
 =?utf-8?B?ZVkwckxaU21YYUdKSlFYdHNEWU5ZSi8rL3BDZFphKzk4K0c1WjR6UTJteVNX?=
 =?utf-8?B?d2pjQnQ5bFp6WTdVbEhrcmpUZFdBNU1qcFVjYmpYdlNPeFFzYVE3WG4zK3Rs?=
 =?utf-8?B?MHMrd1B1UHU5WnN2R2pvUlFFd3NZWHU0YnAyNU5KTkplVUFlYzZDOFdQV3hZ?=
 =?utf-8?B?SGJuelRLekh3OHpHNmZKM0lWTFV3alhpMFRvSnlzeC9TeDduNkRmSkg0WEN0?=
 =?utf-8?B?VnZJUTFRQVlMU29oQ1ZLaVlxK2pERUVWTldJaU93RTUyaWw0alRWajNYWTZJ?=
 =?utf-8?B?aXVUWWFPM1RHdi81UFlXRlEyalk4em5Qd1pra1ErQU5vZ2FzdkZtbm00RHZP?=
 =?utf-8?B?ZDdWRWg3d2ZhelI5L1o2MkdjR0tiV3pvbTRaM2pLNlRsbWhJMWpDKzZlcDdD?=
 =?utf-8?B?MlBxRVJTWC9GTjIzdlpRUzNMbzYzU2VaSnBrdHZqcDFXTTRNTXJKbHdidkZ2?=
 =?utf-8?B?M2RQeUxsb3FrTG1xRXJmSzVmeDFjdDZXM2RyZUp5TGd4RDJkYkVXVEZVNkhS?=
 =?utf-8?B?V3lESXR3YlJXNzdsaXF5RFN6ZDlTZVoxNmdvTFNnMFg4WE43cmM4VkROallU?=
 =?utf-8?B?bDFnUVBoRlBnWFBJWnVzZWNTN0ROZHhLNjBMY0NXdkpxQ0Fqdkt0U3hqS0Zk?=
 =?utf-8?B?N2MwUlpJNEFRY2RieVVOS0V5a3ZoSW4vZWVoa24yN2FmeTNTQWFUaVNjSlZK?=
 =?utf-8?B?cDFQYktDVEw2YjJBcktzU1hJeUFYM2FqZ2tNeWpuUnBpV0tIY1hkcDNnbFRr?=
 =?utf-8?B?bkVFUjFrOEhGZEEvS3JDTGRwZHNZeTFtNWR1UGpMMkFvQ2U5M0RTd3l2TkxR?=
 =?utf-8?B?djJnRml0emVtV1ZyOHhTQzdoV3k5dGJEdGQya2paNjQ5dTZIcFFsOUptU3J4?=
 =?utf-8?B?eVZPNVZLUllMUDdraFJ5bzNwZmx0SlFUSDNvUWUwWjFkS0xvSFpTNTdwbnli?=
 =?utf-8?B?TndhTTYwZmF5UlNaNHYyMlJMY3FoZnAya1ZzZUFESDMxc2QrOHBnSHR6T3Zj?=
 =?utf-8?B?Zm0yZUNrOTJLZGhuZk0zVXJNNjE0MjV6UjNKK3cyN29EM3VUTDU0aHRpM3FP?=
 =?utf-8?B?QlhSTjB4KzA2T3VpSXpLLzlCTzFoMFF3SXFoVG81VVBHRmc1eW0ySEVPWmU0?=
 =?utf-8?B?REJXdTZkbTJ5RWswRzdPOUtSRHovaENFWDdwNjMySVpyTHFBSTRqWEhwWGZF?=
 =?utf-8?Q?pMvL3nvUyADz7sFOo5Cb4WDyi/54niwe?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4875.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RlIvcUkvN0pqVmFEYnR1djFtb3FXS3J0dU9EUGF1UFV1Ykd2aWRtaTMzS3hY?=
 =?utf-8?B?cFp6MjhVSnp6clozSFlaeUVLSTVJU1EwN1V5Nk9UNmlPZnlJeGFoVERWd0h5?=
 =?utf-8?B?aGhRYi9oZjNuU2JEVi8xSTVCeCtYbXdGSE1qOGdMZmUxWkkyK0cxSEloOWlH?=
 =?utf-8?B?QkNYU1Y3dDc1RDFNTFc5QVFTTUsyejBZUWJ6SEZpQTNJRWFnOGExa1hRWWRj?=
 =?utf-8?B?R2VpbWhRN2p1b0hSa05CL3kyanFUck5PcDBka3FVY2F1NkMwSW5LMTZxMzk2?=
 =?utf-8?B?K21ldXpPaUF3RGJDd09nT2pKREhOUUZDdmdGcVVtcjhTNUFLY3lKVngzczJv?=
 =?utf-8?B?SmcwaFNHRzFPMzVNN2wzNi9kWHhTYzQzWUJXMUU5N2RQdTNmWWdUakVxWU4x?=
 =?utf-8?B?VEI5RVR2RnMzU3FxdFFlWGVGdXFXdmIrU28ydFNBUUtYb1FNR2hKc0RGd1pz?=
 =?utf-8?B?YnRaSk5Sem5Nb01neTluekdhU2wrcDU4aDVIOHNjQktXVXcxOTRRZGtoT0ll?=
 =?utf-8?B?cWdRcGpHeVpuUVJBT3ZWQ0RnazU5aUpIbXlJckJ2bFpsdllBMnc2UzU2bmIv?=
 =?utf-8?B?RlVMczZBcDRnclJxaUJEMGY4QkN4Mmd1S1E1RDhrYWZ5a2ZSbHAwMmNJWC9J?=
 =?utf-8?B?dll2MmxHc3hFdHNwNW13MXoyUEk4Y1lDU0RvR3NyT0dIT1NsWFhIN3lXL3ZM?=
 =?utf-8?B?WXBCaC9ZR09aODFWSm9ZVmVRcFRTczY5NUtVeXl3cHhjeThIR2FFdHhLN3dx?=
 =?utf-8?B?dmg4bmowZUwyMFFrZmdKeWV1K2RIWWJHQWZOY25nK3JXQ0JYVWtkblE3bUhE?=
 =?utf-8?B?ZzlKbzM0N0xLcEFZT0NFbUpqVFFvNHVqYTBBaFRPSGFlTHRPaVp1OTNXdHFK?=
 =?utf-8?B?cERHZmJISENKUUh0c1dTV0FFWjZEcW11b296VEVLTjFiSitUNVdDdmNYUWd1?=
 =?utf-8?B?bjRtOSttcm02Y0tHZE45WHA0Wi9CdUsvUkgwcXhtc1dlQlZVbWVSTWdGdzZv?=
 =?utf-8?B?MVdMaE0zS1phODJsdnQ0YkVEMGU2SDk5YVQybS9yckhBdkh1UTlLNElhdmx4?=
 =?utf-8?B?Ry9sdkIrMDJmTkRIamtsV3dYVDhkV0ZzcUIySVU0MDVLamYrRHZDRzEvR0R5?=
 =?utf-8?B?SGM0bTl1UE5DdUh2Rjh3d2h5dVNJQk5hNHY2ZmVXM1VmSm1zUFJQS3V3SEk0?=
 =?utf-8?B?WS92dkZITmppUjVMNVRpWHdyRk5GZDdGK0hqblhCL3J0V0FQZXA3OXA3NEQ2?=
 =?utf-8?B?bCsxNU5RRlBoUGlQZVZrb2xlM3VKOFpVRDdRRFZ0NTRzVVhjVkxnSEx2YnhF?=
 =?utf-8?B?aTlSN3FBNm5yU1hpZStIcEcwSVVSWEhkcUNpeFFZcXRMSFh1NnM3SFNEd2U3?=
 =?utf-8?B?c1V4cW1vd1l5YURaci9KNFcycjB0dW5PNjBzZHFoaE40NWVGYlp2N1F0WGoy?=
 =?utf-8?B?MEc0MUxvQWMwZFpkSE5JTzZ4b2pWOHZyWDAySzgwL1JGY1lMaUpwNkFjVjJv?=
 =?utf-8?B?RkRmRyt3UmJ3aGRKSWNoKzJpM2xDK3JxdmpURDVicEdSK1o1YnpsSjZQTndm?=
 =?utf-8?B?aS9qL2JxejZVWGl1QTFwSk5PbUtURHNWWUthNktJdDNBRTdQd0k4eFZFQWlV?=
 =?utf-8?B?Z0VUR2t4MXdDT1RGcUhUeDJ3TGpSWThHMk1IY0V6d0wxb0FRMzByZHZJRHFO?=
 =?utf-8?B?amUzOGh4L3hXU0ZlcnZnb0VnZ0tWMTcyaGVmbFpMZDRLbkNXZG0wSW9uOHhF?=
 =?utf-8?B?eXc0NkJVOFVJdjZHZHVTWEgreCtqa3oyVmJjc2VNNzVpMDgrU0lhZXNnOWlu?=
 =?utf-8?B?VXJnOEpTbTZ5Uk9PS2ZZQnU4ZEVxNlROcFBsUjFaZXlCVFFxdXhNOEtYL3pt?=
 =?utf-8?B?aXAvMGpZSkl4NlNjdE0rWVhSS09WaU5HWHdHVGZ2UXBQd3MwanE0NGx1NXpV?=
 =?utf-8?B?b1J0ZnljbFVIN3YxdXZtUFgweFJNL2ZhWDJ2dG9lSjBhVTZUKzNhQUhMSkVG?=
 =?utf-8?B?UG1lbnUwL1NCaFpKUW1NanIyNFdvSW5rRTFKMVZwZFNsVGZtK1NtdklGeHVP?=
 =?utf-8?B?Yjl2U3laVi9GVjNmOVJkdllyU05HVmU5bXYvR2dGTUx6WWxHWDdTV0pMbWZN?=
 =?utf-8?Q?pYoQ=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 11409fc9-0323-473d-c0d7-08dd2afb3f32
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2025 07:01:14.1400
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +M6+tHmm/aEo5RXst9dg7DFtV6mY3+YCLcVInpnqh+QPPa2Rs/uWry7X95yXFhv6/OSPihcBk7Fleznpm300zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9477

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIHJldmlldy4NCg0KPi0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+RnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9y
Zz4NCj5TZW50OiBUdWVzZGF5LCBEZWNlbWJlciAzMSwgMjAyNCA3OjU2IFBNDQo+VG86IFZpc2F2
YWxpYSwgUm9oaXQgPHJvaGl0LnZpc2F2YWxpYUBhbWQuY29tPg0KPkNjOiBTdGVwaGVuIEJveWQg
PHNib3lkQGtlcm5lbC5vcmc+OyBTaW1laywgTWljaGFsIDxtaWNoYWwuc2ltZWtAYW1kLmNvbT47
DQo+bXR1cnF1ZXR0ZUBiYXlsaWJyZS5jb207IFNhZ2FyLCBWaXNoYWwgPHZpc2hhbC5zYWdhckBh
bWQuY29tPjsNCj5qYXZpZXIuY2FycmFzY28uY3J1ekBnbWFpbC5jb207IGdlZXJ0K3JlbmVzYXNA
Z2xpZGVyLmJlOyB1LmtsZWluZS0NCj5rb2VuaWdAYmF5bGlicmUuY29tOyBsaW51eC1jbGtAdmdl
ci5rZXJuZWwub3JnOyBsaW51eC1hcm0tDQo+a2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxp
bnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj5TdWJqZWN0OiBSZTogW1BBVENIIDEvM10gY2xr
OiB4aWxpbng6IHZjdTogVXBkYXRlIHZjdSBpbml0L3Jlc2V0IHNlcXVlbmNlDQo+DQo+SGkgUm9o
aXQsDQo+DQo+T24gVHVlLCBEZWMgMzEsIDIwMjQgYXQgMzoxNuKAr1BNIFZpc2F2YWxpYSwgUm9o
aXQgPHJvaGl0LnZpc2F2YWxpYUBhbWQuY29tPg0KPndyb3RlOg0KPj4gPlN1YmplY3Q6IFJlOiBb
UEFUQ0ggMS8zXSBjbGs6IHhpbGlueDogdmN1OiBVcGRhdGUgdmN1IGluaXQvcmVzZXQNCj4+ID5z
ZXF1ZW5jZSBRdW90aW5nIFJvaGl0IFZpc2F2YWxpYSAoMjAyNC0xMi0yNiAwNDoyMDoyMSkNCj4+
ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay94aWxpbngveGxueF92Y3UuYw0KPj4gPj4gYi9k
cml2ZXJzL2Nsay94aWxpbngveGxueF92Y3UuYyBpbmRleCA4MTUwMWI0ODQxMmUuLmYyOTRhMjM5
OGNiNA0KPj4gPj4gMTAwNjQ0DQo+PiA+PiAtLS0gYS9kcml2ZXJzL2Nsay94aWxpbngveGxueF92
Y3UuYw0KPj4gPj4gKysrIGIvZHJpdmVycy9jbGsveGlsaW54L3hsbnhfdmN1LmMNCj4+ID4+IEBA
IC02NzYsNiArNjc5LDI0IEBAIHN0YXRpYyBpbnQgeHZjdV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQ0KPj4gPj4gICAgICAgICAgKiBCaXQgMCA6IEdhc2tldCBpc29sYXRpb24N
Cj4+ID4+ICAgICAgICAgICogQml0IDEgOiBwdXQgVkNVIG91dCBvZiByZXNldA0KPj4gPj4gICAg
ICAgICAgKi8NCj4+ID4+ICsgICAgICAgeHZjdS0+cmVzZXRfZ3BpbyA9IGRldm1fZ3Bpb2RfZ2V0
X29wdGlvbmFsKCZwZGV2LT5kZXYsICJyZXNldCIsDQo+PiA+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBHUElPRF9PVVRfTE9XKTsNCj4+ID4+ICsg
ICAgICAgaWYgKElTX0VSUih4dmN1LT5yZXNldF9ncGlvKSkgew0KPj4gPj4gKyAgICAgICAgICAg
ICAgIHJldCA9IFBUUl9FUlIoeHZjdS0+cmVzZXRfZ3Bpbyk7DQo+PiA+PiArICAgICAgICAgICAg
ICAgZGV2X2VycigmcGRldi0+ZGV2LCAiZmFpbGVkIHRvIGdldCByZXNldCBncGlvIGZvcg0KPj4g
Pj4gKyB2Y3UuXG4iKTsNCj4+ID4NCj4+ID5Vc2UgZGV2X2Vycl9wcm9iZSgpIGFuZCBmcmllbmRz
Lg0KPj4gSSB3aWxsIHRha2UgY2FyZSBpbiB2MiBwYXRjaCBzZXJpZXMuDQo+Pg0KPj4gPg0KPj4g
Pj4gKyAgICAgICAgICAgICAgIGdvdG8gZXJyb3JfZ2V0X2dwaW87DQo+PiA+PiArICAgICAgIH0N
Cj4+ID4+ICsNCj4+ID4+ICsgICAgICAgaWYgKHh2Y3UtPnJlc2V0X2dwaW8pIHsNCj4+ID4+ICsg
ICAgICAgICAgICAgICBncGlvZF9zZXRfdmFsdWUoeHZjdS0+cmVzZXRfZ3BpbywgMCk7DQo+PiA+
PiArICAgICAgICAgICAgICAgLyogbWluIDIgY2xvY2sgY3ljbGUgb2YgdmN1IHBsbF9yZWYsIHNs
b3dlc3QgZnJlcSBpcyAzMy4zM0tIeiAqLw0KPj4gPj4gKyAgICAgICAgICAgICAgIHVzbGVlcF9y
YW5nZSg2MCwgMTIwKTsNCj4+ID4+ICsgICAgICAgICAgICAgICBncGlvZF9zZXRfdmFsdWUoeHZj
dS0+cmVzZXRfZ3BpbywgMSk7DQo+PiA+PiArICAgICAgICAgICAgICAgdXNsZWVwX3JhbmdlKDYw
LCAxMjApOw0KPj4gPj4gKyAgICAgICB9IGVsc2Ugew0KPj4gPj4gKyAgICAgICAgICAgICAgIGRl
dl93YXJuKCZwZGV2LT5kZXYsICJObyByZXNldCBncGlvIGluZm8gZnJvbSBkdHMNCj4+ID4+ICsg
Zm9yIHZjdS4gVGhpcyBtYXkgbGVhZCB0byBpbmNvcnJlY3QgZnVuY3Rpb25hbGl0eSBpZiBWQ1UN
Cj4+ID4+ICsgaXNvbGF0aW9uIGlzIHJlbW92ZWQgcG9zdCBpbml0aWFsaXphdGlvbi5cbiIpOw0K
Pj4gPg0KPj4gPklzIGl0ICd2Y3UnIG9yICdWQ1UnPyBQaWNrIG9uZSBwbGVhc2UuIEFsc28sIHRo
aXMgaXMgZ29pbmcgdG8gYmUgYW4NCj4+ID51bmZpeGFibGUgd2FybmluZyBtZXNzYWdlIGlmIHRo
ZSByZXNldCBpc24ndCB0aGVyZS4gV2h5IGhhdmUgdGhpcyB3YXJuaW5nIGF0IGFsbD8NCj4+IEkg
d2lsbCB1c2UgJ1ZDVScgaW4gbmV4dCh2MikgcGF0Y2ggc2VyaWVzLg0KPj4gQWRkZWQgd2Fybmlu
ZyBqdXN0IHRvIGluZm9ybSB1c2VyIHRoYXQgaWYgZGVzaWduIGhhcyB0aGUgcmVzZXQgZ3BpbyBh
bmQgaXQgaXMNCj5taXNzaW5nIGluIGR0IG5vZGUgdGhlbiBpdCBjb3VsZCBsZWFkIHRvIGlzc3Vl
Lg0KPg0KPklmIGl0IGNvdWxkIGxlYWQgdG8gaXNzdWVzLCBzaG91bGRuJ3QgdGhlIHJlc2V0IEdQ
SU8gYmUgcmVxdWlyZWQgaW5zdGVhZCBvZiBvcHRpb25hbD8NCkl0IGlzIG1hcmtlZCBhcyBvcHRp
b25hbCBhcyBmZXcgb2YgdGhlIFp5bnFtcCBkZXNpZ25zIGFyZSBoYXZpbmcgdmN1X3Jlc2V0KHJl
c2V0IHBpbiBvZiBWQ1UgSVApIGlzIGRyaXZlbiBieSBwcm9jX3N5c19yZXNldC4gcHJvY19zeXNf
cmVzZXQgaXMgYW5vdGhlciBQTCBJUCBkcml2ZW4gYnkgdGhlIFBTIHBsX3Jlc2V0LiAgU28gaGVy
ZSB0aGUgVkNVIHJlc2V0IGlzIG5vdCBkcml2ZW4gYnkgYXhpX2dwaW8gb3IgUFMgZ3BpbyBzbyB0
aGVyZSB3aWxsIGJlIG5vIGdwaW8gZW50cnkuDQo+DQo+UmVnYXJkbGVzcywgdGhlIHJlc2V0IEdQ
SU8gc2hvdWxkIGJlIGRvY3VtZW50ZWQgaW4gdGhlIERUIGJpbmRpbmdzLg0KWWVzLCBJIHdpbGwg
YmUgc2VuZGluZyBwYXRjaCBmb3IgdGhlIHNhbWUuDQoNCj5BbmQgcGVyaGFwcyBtYXJrZWQgcmVx
dWlyZWQsIHNvICJtYWtlIGR0YnNfY2hlY2siIHdpbGwgZmxhZyBpdCB3aGVuIGl0J3MgbWlzc2lu
Zz8NCkkgYmVsaWV2ZSByZXBocmFzaW5nIHRoZSB3YXJuaW5nIHRvICJObyByZXNldCBncGlvIGlu
Zm8gZm91bmQgaW4gZHRzIGZvciBWQ1UuIFRoaXMgbWF5IHJlc3VsdCBpbiBpbmNvcnJlY3QgZnVu
Y3Rpb25hbGl0eSBpZiBWQ1UgaXNvbGF0aW9uIGlzIHJlbW92ZWQgYWZ0ZXIgaW5pdGlhbGl6YXRp
b24gaW4gZGVzaWducyB3aGVyZSB0aGUgVkNVIHJlc2V0IGlzIGRyaXZlbiBieSBncGlvLiIgd291
bGQgbWFrZSBpdCBjbGVhcmVyLiBMZXQgbWUga25vdyB5b3VyIHRob3VnaHRzLg0KDQpUaGFua3MN
ClJvaGl0DQo=
