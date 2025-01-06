Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786BB1D9598;
	Mon,  6 Jan 2025 10:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736157869; cv=fail; b=hKmk7F7xW7FyAwmM262ZtL7+ssUaNDf8k/2qhKW+B+8IVu1+uyPMwPBOFHADynuoTkjbr4sXx5IgutIlMZntmna2gNN4/0otNY0i7+Gu4+6zmJP3LfTdUPH7E0O/B5ydMiR+u0boXOQx5PJSMLwv/dns1QoUlYAlhcp5ObyficY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736157869; c=relaxed/simple;
	bh=bL/SU2V9TcoIDMnxrkt/N7eauC29FVZi0Du56XmSjC8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FEJ+/HmbGuVIbd+jhTqeRB5+2TKygCQzWNYZrayKvHHu3bTW4A9uw+pWDvA7hgcQ1h1zhxSB+eK/M+HzzG1FATyfBk3F7mJFqk9mG+VXwFWevRm0ccrOLhXD4YIGCZzwpFvSRbu38HewHTqonRj91hOV1TNWeOGlfFXSRdcuuZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZQANw9Fr; arc=fail smtp.client-ip=40.107.243.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZQANw9Fr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uu7sn/2pLmBweWM7dXnrSiI63BWnwCafMD1mdt1dHCr0ZPK3xZfBLCrPKArLPeHzzuaXlAk8b21yLArRVUU5RjGn4uTUQn5uWC5kw6ndWBldDTUwwRmYlxC5Z5JDIxb91bJLhNDA8a8Ef70qYvHjapjr4MN2HRssVR88mtVBGFMk/jMUhmUyk4ll1WOstG3wKH+eFJDwGhHKNMq/nMckwIsk7/GGlrPLQVAj7yNrBJxT/7Ki/ACGxFmWGfNqrjuryVLOjde0JA0XI4OO0ARQNHFXkvzouso41ygB3fUGj89gtapwypfcLY3jGnwVSmnQn63UFFFzmtcMrL4U2+nJEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bL/SU2V9TcoIDMnxrkt/N7eauC29FVZi0Du56XmSjC8=;
 b=JGoTjmrfZtrQ3YOJqLtcmBCWbEVA+yY5qP4pnwKcAo7YIhv309p5At/TU1/saC7f93Vq0mlpN7/9lFwD+uaTjQrvxQ+Yi3qYYPkKiSeAfiW2n8mrRB+KjMA8iAbpLpXtGWyrO1KLXZX/RHE7HgFPLzUMRV+ipzex0lq1H7HOmM0zhOjXsvu2dt0NpypFyvQnT7tx46RGV2gGcUEuMlX8xfkjUKy+tAENqIkRmPmsRxGzX0VwgQR1qsSrmR+P3lDRJB21iwb5BBdlnuL+SMxZ9LcMe3qRccxbbflneF2ZXVyjXzCYD8G0/nAKU2CrA/XeYOIHXT8LrWCdGjjJYed0VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bL/SU2V9TcoIDMnxrkt/N7eauC29FVZi0Du56XmSjC8=;
 b=ZQANw9FrWssXIeeGFyOTY6i6frvc2BnkK43dNAG7CEGti8F2iMd2rFcSs3CCdk+ZDkXmS0EE5X+aaiGy5Km54hCnA/1cMFTUxmcMQ7rS146rWldzBF0cONHK3Z00rv/p44dMQ/jFEAwcz6ukZoGSK+CaCjmVXjvpWBguYFfq3uY=
Received: from CH2PR12MB4875.namprd12.prod.outlook.com (2603:10b6:610:35::24)
 by PH7PR12MB6668.namprd12.prod.outlook.com (2603:10b6:510:1aa::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 10:04:17 +0000
Received: from CH2PR12MB4875.namprd12.prod.outlook.com
 ([fe80::ff88:6c6f:c187:6511]) by CH2PR12MB4875.namprd12.prod.outlook.com
 ([fe80::ff88:6c6f:c187:6511%4]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 10:04:15 +0000
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
Subject: RE: [PATCH v2 2/3] clk: xilinx: vcu: don't set pll_ref as parent of
 VCU(enc/dec) clocks
Thread-Topic: [PATCH v2 2/3] clk: xilinx: vcu: don't set pll_ref as parent of
 VCU(enc/dec) clocks
Thread-Index: AQHbXThfxENiXuuPAkGTQeKoLPlpprMD3niAgAWomUA=
Date: Mon, 6 Jan 2025 10:04:15 +0000
Message-ID:
 <CH2PR12MB4875D93D5F91CEF9A99E4A45E5102@CH2PR12MB4875.namprd12.prod.outlook.com>
References: <20250102170359.761670-1-rohit.visavalia@amd.com>
 <20250102170359.761670-3-rohit.visavalia@amd.com>
 <CAMuHMdV9iZK3FOXhSmvvxK=HqBe3hUnNcZZ2aL1G--XHFgN07A@mail.gmail.com>
In-Reply-To:
 <CAMuHMdV9iZK3FOXhSmvvxK=HqBe3hUnNcZZ2aL1G--XHFgN07A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB4875:EE_|PH7PR12MB6668:EE_
x-ms-office365-filtering-correlation-id: 96b6bc61-5c0d-4d46-14e2-08dd2e397a3c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dC9IdmhSSjlOeHArM2lRWUsyL01Lak1DWlFrakt0RXJMd3pBNjVHQWt4RVU2?=
 =?utf-8?B?SThId2hHeCt3QzRZcG5jMS9BSXZyOTdiNTM5UUVZSjVsWmZ6eDlSSEpmOURD?=
 =?utf-8?B?VXlzdEM0djIrTUdJUTVUKzNHMXQrZnlxYzhaVHdpclYvT3Q3WnZsZ1hRdmdO?=
 =?utf-8?B?NUFFS0Zib05rYXFPaDU3ZHJ4U0prSFhOdW42Z3BVQjdYMTFiWXQvMlpyb2dr?=
 =?utf-8?B?SjZyMURWamNQb1c2TDhtTHJzNWFieHUwbldyU1kxcUxWbGVMN3RtUHFzeW80?=
 =?utf-8?B?UitFeG15NEhEMnNlUks0c3kzYlloZDNWUGpwYmxvZjc1MWlFRTNWTXFsQi9F?=
 =?utf-8?B?YXB0aGlJN3IwRGhrb2xvN0NEMzJ3R1hqbTRtMEhWQUZ5QkNCait6cm5jdkRW?=
 =?utf-8?B?Z0FiWEpPREljSHY1RnR6bmZLVFNtTjdMaGRvNE55VERDbUVTQ05SVXN1NlE2?=
 =?utf-8?B?bVV0dzVZamtEbVpRUGh1eWl0TkRqS0ZIUlRpRVZRcDk5bUZIcUYzWXRhSzVU?=
 =?utf-8?B?allwdjNNUU9DWW0wbkVQSTNiTmoybDQxR3lOOXlZdDA2dTV4TGdlZFJlT2Vq?=
 =?utf-8?B?ZHFtb0NNQ1VzQ05hb3FpQytDZHdjMmtMSVBydFNxTkhuSFBubmYzSWYxbkYx?=
 =?utf-8?B?VUszR3RsYlpsdElvQ2FSRklyUlJqT2JjTmhRTGV2c0dvbG03ZnpiZFV6c2RQ?=
 =?utf-8?B?YkJkTzY5dUo1clFmZnRiYTFxUkxxQTFNR3dlLzAxY0I0R0hYV1p2WEFUcC9k?=
 =?utf-8?B?aDNSUFZsbmhqQXVSVTVSMnZRZ1czcGtOaklNWnk5TDk2V0hoNzhGVDd3N21N?=
 =?utf-8?B?Smo1bE5LRFcyZWlXbGhxaFNqNnU4SmVvUzBFMWpUc200TWZCSUREWTdXUEZQ?=
 =?utf-8?B?SUozK2VQTGY0S3pxcVJPWlFPMDdNZ3FaSWRHVTZFSHQ4THBJVVZCWU9sdnVN?=
 =?utf-8?B?TjhEYldMRzJ0SndkayttdEU4VHRib2J4cWFSS1JrSDBqM2JNalo1K0tPZnVW?=
 =?utf-8?B?T3kzam1FQzBiRU9WMUJyYzlrK2xBMlduZWdpa0xaT0lweU9hVDVYSGZ0RXRt?=
 =?utf-8?B?VVVGbHdHcWJNOEZtYk5RNTZ6b2lPd3pocWN3VGR5SnlzTTlvQVBTdkVQcG9Z?=
 =?utf-8?B?c1FpQnZrVTZhT2N0K3JoSkNUa2U3QVJKZmdjVGR0VkNvRjNNdUN6VWpuSUVi?=
 =?utf-8?B?SVpwaXYzVUlpTGxYL0F1dFAzeHRBeEE1dmZYV3NLRndDcElTeFhVZmVSQjl3?=
 =?utf-8?B?S0tmSkFyTXdRTUVGSkgySDFmWnkySUR6THljMmp1RVZhV1kwME1LbENQZkhP?=
 =?utf-8?B?Mk45NFp3TExmcmYxejNJT2ZLQlo4WFNDRDJZTEtxSmkyaHRFWndYcVdISGp1?=
 =?utf-8?B?WDlmZGlRbmIya3hUMElMc2ZHZUpFZmpVckpYOUN1bTRhdmMwTnJ6emNqcGV6?=
 =?utf-8?B?SGdvN3RJVjM3SjJSVE5neFNMQjduQkdmcUtKV2JEc2l5T29STE5BMitNT2xz?=
 =?utf-8?B?WldPQVFQellWNitVc1ZnbGhJUkNic3JhaGk2QlRJRFhyUlpqZlBpemVJRTdw?=
 =?utf-8?B?dTNwemxGVzdoam9QMzc0eVdXRC9FY0E3TWxVdVFRZDd3OUJrMmpEVCtVTHBS?=
 =?utf-8?B?VEhiK0RFS0RMSUlJZWc0UmhwUDZSMnF6bWtnd2ZkanJVY1h3OW1DdkdiTTJH?=
 =?utf-8?B?d2tudnd1aUZjcWpvV2l3QWdMd25kMEFlUHVjTy9yZmd4K3NaU2dlM2JBYlZa?=
 =?utf-8?B?WXBsNUxWTjNEaDUwSG8xWTA3V25rZ0p3dVlyTlAzdjEvQkdBVGYyOWdQSUpw?=
 =?utf-8?B?UldiZ2pCVDAzZXpqMG1FLzFnVUlUUEE2RzBySytsK1NNZ2R6UFRsV3d5SUk4?=
 =?utf-8?B?djAyL2swVnZxWXMvUlhDQTRlVWFvVTZBM25zNDNZNUdBRlZFS0k3OEsvN1l4?=
 =?utf-8?Q?Ft38VhKQJ5CYfIAFXJsep6U0sD19p7RO?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4875.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c1AzQzRvSmJncmxmakQ1UG5WeXVXNzROZnpSb1hsODBOeWl5UnZHVVRCRlNT?=
 =?utf-8?B?UW5ramlFS2g1aXAxQ2N3N0c4Q0FjR0RiajRLT0s4dDFpVU1kalkwWi9rU0Nz?=
 =?utf-8?B?bEZpZFFjdmpreHpTNitUYVVNM3NDZmxTbThMSFJIR0pzSnBjeW0yMU5jRWhx?=
 =?utf-8?B?bFd5WjBsdUhPQVV2UXNaYTE4N0pNdmIzTE5FSG5LM214RnZSaDFNMUp5UGNN?=
 =?utf-8?B?bXlGRlN5SFE4WjJ5RnU2M1JrU21BSXFHSU5sNzBnQi9WNlN6d0NMazFKOXBs?=
 =?utf-8?B?dGl6QXJPdEdjdWJrK1U3SkhDMjBwaU4wbHZxYlRwNU4wa0U3TUdYU3hMWms1?=
 =?utf-8?B?WitlandLSng3N1BOd0QzUzFkVDJwNFVmM0x4c05rcE1vNHVzVUlXeEZMSFg2?=
 =?utf-8?B?NklyeFRDNmVSb0JEZm1xQUtydk9rUXd5VEVlWWQ1QmtTN1lhMzNCSGVFSWg0?=
 =?utf-8?B?YVB0VmN6UU1TbnRoWmd2Y0xoOEpXbUtYYUxXR2lzZXZTWW1JMC94WUxPOHZt?=
 =?utf-8?B?QUUrOWxGS0ZyaHRINTJoUE41Z05OYUJOQjMzbEgxclFFOXBURTNZL1lwQStn?=
 =?utf-8?B?Nm15MzU3d0tiU0E3UW5nVG1XSFI0V0dyaWJkK2RPd2J2NVZzNk9xalpFRkJW?=
 =?utf-8?B?c29aMkdCQ3QxME1QTXBkdDVaaU1VZmU3OHl0bjVvWVIvZ2xqYXRKTE9CMGRD?=
 =?utf-8?B?YmR5ajc1cHU2cE5DSFJJUmIyQ0RVSERhZ1ROTnZmSk43TUc4VWVFSzA5SVdU?=
 =?utf-8?B?N2VlZXdnK2hmeGNIY20wYVlZSGNyektZV0Y0QlMxOGxjV2hFdzFCSlk2Nm9p?=
 =?utf-8?B?L0R4dENZRzFLeGRmTlNZdmFicFcxQ1Y4STF5SkQxY3lXaVFxcXE3SFlLakFR?=
 =?utf-8?B?Uk8ydnBUbGFGYitiY0xHNmtTakdKd0NFaURFYURoWWxUSDEyZFN6UXBNUis4?=
 =?utf-8?B?K3I3QUxZRVRCYVEyeVBBemtGbWVlYjRITmVUc2FhYS84RndUWVh3TkpRZXRK?=
 =?utf-8?B?bXBvME5PRDJURGNpNVVBb0RlSzhOWlhxYjVMV2x4TXY5eUE5R2E0c0g5Sndv?=
 =?utf-8?B?NXFwVngxQnVhOVMrdXBRZ09CcXM5NmdaS1hkckthazZuVFBEa2NqL3dQRjI3?=
 =?utf-8?B?NHZwcHBPZlFPSU11SjIzczVVK3prK2dNY0k2aTduVUlrV0FwaVRUZ2xVME15?=
 =?utf-8?B?V29hWDZzU2x0V0FxNUpFd0FDNzBvb3YzVjk5QXBwa2g2aGF3RGZQZzNPOHlM?=
 =?utf-8?B?dkh2eG5iRTZaTUpPakw5OUwyWXRoRWNaRDRkeTlhWU5BVHo4OWdybGp5ZmdX?=
 =?utf-8?B?TmVpVlNnUXJyZ0VGVWZzV25GN05KRFU3RDM4eW9OYlBZSFlTMHJSaUNZd3VX?=
 =?utf-8?B?c3NoQTV0VXcxZXF2LzFGMmExV1BHYWVLWDRCbGpnTVZOd0JnVXJsVysvUU83?=
 =?utf-8?B?UGE0TWhRUjBDVUZlS0R4QlE3eVEyUzNTbGM1Q1lGWUtZOVJJdFBKOFJrUjB5?=
 =?utf-8?B?aU5YQkZkdmtyaFFLdlRIbGVjM2RYSVg1THQ1Mng2L0xGK25VejZOOFdOb3A5?=
 =?utf-8?B?Wk8wWVV5RjJpVGkwK0FYa3FobU1RREdmT0ZWUFJTWDB4S2x2bFhrMEhWSkV5?=
 =?utf-8?B?d29KdnhvRi81bmRTKzZSR0FoMmRkOTdFdk9iRE4xTXMxK0NuR3lwSGJhcFFN?=
 =?utf-8?B?RlJIUldadzh6cEhlNjVNVHZlWWJYWGdZaWt2RDVBYmJCYU1YWjdXOHN0MVU4?=
 =?utf-8?B?Tk1CQ2dUVHpvTSt1RHphemxHZGk2c2cxbFZhMjltNzZMV0dtVzRKL21uV0Zu?=
 =?utf-8?B?aE5odU43bUtray9RWmhuMCtvSlg0Ryt5NlJvRDhoMmlLUWhQbFJHMml0c1B5?=
 =?utf-8?B?SXF1KzMvdTh2VmFFTkJXQU15L1NXM2RyQVUrUndFdzlidkdGNEh2QklXckF3?=
 =?utf-8?B?MnA1ZzFtUWlYN0RzTWdUY21RbWFrSFNDaGpxYUlOTC9yeUcxc1FWeDZQbCsw?=
 =?utf-8?B?RGI2TjlGRXF4a1I0TTBvVHRTUUx6alBIYTZab0loQldpZEZ2T2xtZTRQOVFY?=
 =?utf-8?B?bCt4NG4zL2h4WXllRFMyOFk0bnZjcTdVYXZTUlhVTG1HSUp4SUhxak9wVERB?=
 =?utf-8?Q?t1Cc=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 96b6bc61-5c0d-4d46-14e2-08dd2e397a3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2025 10:04:15.5042
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j4J5cmReIUsGyT5bmsO7JLlyEuLCnT2EtcJ5wi4F/wv7p46MjdqyZWsnnx09TFtReZtTNr7P9kKFlBtu1rtbbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6668

SGkgR2VlcnQsDQoNClRoYW5rIGZvciB0aGUgcmV2aWV3Lg0KDQo+LS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj5Gcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3Jn
Pg0KPlNlbnQ6IEZyaWRheSwgSmFudWFyeSAzLCAyMDI1IDEyOjU4IEFNDQo+VG86IFZpc2F2YWxp
YSwgUm9oaXQgPHJvaGl0LnZpc2F2YWxpYUBhbWQuY29tPg0KPkNjOiBtdHVycXVldHRlQGJheWxp
YnJlLmNvbTsgc2JveWRAa2VybmVsLm9yZzsgU2ltZWssIE1pY2hhbA0KPjxtaWNoYWwuc2ltZWtA
YW1kLmNvbT47IFNhZ2FyLCBWaXNoYWwgPHZpc2hhbC5zYWdhckBhbWQuY29tPjsNCj5qYXZpZXIu
Y2FycmFzY28uY3J1ekBnbWFpbC5jb207IGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlOyB1LmtsZWlu
ZS0NCj5rb2VuaWdAYmF5bGlicmUuY29tOyBsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnOyBsaW51
eC1hcm0tDQo+a2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmcNCj5TdWJqZWN0OiBSZTogW1BBVENIIHYyIDIvM10gY2xrOiB4aWxpbng6IHZjdTog
ZG9uJ3Qgc2V0IHBsbF9yZWYgYXMgcGFyZW50IG9mDQo+VkNVKGVuYy9kZWMpIGNsb2Nrcw0KPg0K
PkhpIFJvaGl0LA0KPg0KPk9uIFRodSwgSmFuIDIsIDIwMjUgYXQgNjowNOKAr1BNIFJvaGl0IFZp
c2F2YWxpYSA8cm9oaXQudmlzYXZhbGlhQGFtZC5jb20+IHdyb3RlOg0KPj4gQ0NGIHdpbGwgdHJ5
IHRvIGFkanVzdCBwYXJlbnQgY2xvY2sgdG8gc2V0IGRlc2lyZSBjbG9jayBmcmVxdWVuY3kgb2YN
Cj4+IGNoaWxkIGNsb2NrLiBTbyBpZiBwbGxfcmVmIGlzIG5vdCBhIGZpeGVkLWNsb2NrIHRoZW4g
d2hpbGUgc2V0dGluZw0KPj4gcmF0ZSBvZiBlbmMvZGVjIGNsb2NrcyBwbGxfcmVmIG1heSBnZXQg
Y2hhbmdlLCB3aGljaCBtYXkgbWFrZSBWQ1UNCj5tYWxmdW5jdGlvbi4NCj4+DQo+PiBTaWduZWQt
b2ZmLWJ5OiBSb2hpdCBWaXNhdmFsaWEgPHJvaGl0LnZpc2F2YWxpYUBhbWQuY29tPg0KPj4gLS0t
DQo+PiBDaGFuZ2VzIGluIHYyOg0KPj4gICAtIG5vbmUNCj4+ICAgLSBMaW5rIHRvIHYxOg0KPj4g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtY2xrLzIwMjQxMjI2MTIyMDIzLjM0Mzk1NTkt
My1yb2hpdC52aXNhdg0KPj4gYWxpYUBhbWQuY29tDQo+PiAtLS0NCj4+ICBkcml2ZXJzL2Nsay94
aWxpbngveGxueF92Y3UuYyB8IDIgKy0NCj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsveGlsaW54
L3hsbnhfdmN1LmMNCj4+IGIvZHJpdmVycy9jbGsveGlsaW54L3hsbnhfdmN1LmMgaW5kZXggODhi
M2ZkODI1MGMyLi5jNTIwYWUxYmE2NWUNCj4+IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9jbGsv
eGlsaW54L3hsbnhfdmN1LmMNCj4+ICsrKyBiL2RyaXZlcnMvY2xrL3hpbGlueC94bG54X3ZjdS5j
DQo+PiBAQCAtNTQ3LDcgKzU0Nyw3IEBAIHN0YXRpYyBpbnQgeHZjdV9yZWdpc3Rlcl9jbG9ja19w
cm92aWRlcihzdHJ1Y3QNCj54dmN1X2RldmljZSAqeHZjdSkNCj4+ICAgICAgICAgICAgICAgICBy
ZXR1cm4gUFRSX0VSUihodyk7DQo+PiAgICAgICAgIHh2Y3UtPnBsbF9wb3N0ID0gaHc7DQo+Pg0K
Pj4gLSAgICAgICBwYXJlbnRfZGF0YVswXS5md19uYW1lID0gInBsbF9yZWYiOw0KPj4gKyAgICAg
ICBwYXJlbnRfZGF0YVswXS5md19uYW1lID0gImR1bW15X25hbWUiOw0KPj4gICAgICAgICBwYXJl
bnRfZGF0YVsxXS5odyA9IHh2Y3UtPnBsbF9wb3N0Ow0KPj4NCj4+ICAgICAgICAgaHdzW0NMS19Y
VkNVX0VOQ19DT1JFXSA9DQo+DQo+WW91IGNvbXBsZXRlbHkgaWdub3JlZCBTdGVwaGVuJ3MgY29t
bWVudCwgd2hpY2ggc3VnZ2VzdHMgdG8gbm90IHBhcw0KPkNMS19TRVRfUkFURV9QQVJFTlQgaW5z
dGVhZCAoc2VlIHh2Y3VfY2xrX2h3X3JlZ2lzdGVyX2xlYWYoKSkuDQoNClRoYW5rcyBmb3IgcG9p
bnRpbmcgdGhpcyBvdXQuIExldCBtZSB0YWtlIGNhcmUgdGhpcyBpbiB2MyBwYXRjaCBzZXJpZXMu
DQoNCj4NCj5HcntvZXRqZSxlZXRpbmd9cywNCj4NCj4gICAgICAgICAgICAgICAgICAgICAgICBH
ZWVydA0KPg0KPi0tDQo+R2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51
eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZw0KPg0KPkluIHBlcnNvbmFsIGNv
bnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2Vy
LiBCdXQgd2hlbg0KPkknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dy
YW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0KDQpUaGFua3MNClJvaGl0DQo=
