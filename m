Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11020088.outbound.protection.outlook.com [52.101.128.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8C28F77;
	Mon, 13 Jan 2025 05:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736745903; cv=fail; b=BhHDZq3XOZW2hz4CqBCz3VqeYDu5N4ApersTPWRdydn/oni8P6dXHAdlv4Mksnr3UBQlyhQ4WHBhPcZIgsT2QkTJZ33fuQR8yUTsxVfN364KhDrGO2lntfPH6PGMrNI6cFjdNiE80Nvkax58AamTO/ldEmgAQrEJ3SAXgOjlcKk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736745903; c=relaxed/simple;
	bh=ZaUR/AsynsZH0G+NFfYrIF2wd1QG+meIaek9B3of/ek=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=F6gE37zERjuJpmj3MHh9534KpWtqtFDLEjCUaFkodDvmojxoPHSX+WB2xeH/Mqmo/AE8yIK9eSjJ38D6nH02y3b1Wrst4TrM9l+ymdV8dC3Kss6heITOgmvryejPYQL9idvkZvO18Rgx4F2GZ1bhewBqDRQhpMX0TJPVnyzN4mE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=BXe3bMJi; arc=fail smtp.client-ip=52.101.128.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="BXe3bMJi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=faDyGdjtsOm5g0wy/4Ph/TwhJFUH/PbunxZE5lVC+pJxLSDFxNDXlzu/vLXa+fguDHUxEGlGJmvKRZlMPda2QqJ2R6Vb+bYE+6c8+rMINlYIfTAO6ItMR9aa/7BR5sjMNSirY0znFKRz/TanPPUMDa65oXU8cbpmf5OH3s0uWMQyZY4T9Ck4t7eZhxt/oeYLUCY5W7FEebkmCFNRRVpqTWeofhZi+/8TM3J3vF0k3Eu166ExKs1BvA9BN11h0Cwm7VVjoF2Oi3dUZ27hQsGcEKIr7Nsz54nML0HB9E2xoFglC9C7b55hxJGmogcoEsQhckTepolbr98hQCIuqqZogg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/FtEINNO6A5Tk+s4Kcy/I7l4YRUi5WWY5d36HdKUKxg=;
 b=xoo/UhDu+MeTyL+AX98syVmUtjmBDVShBAO0LU01B2Xe52bUM6INHB0FzE7eyhwEd3Snk1DzlIvPAJjC2j+coenb6B4XNNALyQGud//i2bFKpBmU5XE+hk5qiRVI3NNj6c8SWdUcHAxeWs19Ly+IpYD7QSQTTR48+rv267IU6uu29h402NYSRAuOMX2Cy7WMrRdno6lBXgayijESYLyJDTTSRtQhTFrtgy+gA5YSgKTqzsNplXLwHUMawYd6QvpveuHlj3c8J2btnKbBcq1t3Bn0ntpkzToUts5h5GLf+ITKY4zQTaFVe/sFR3cFrhBiRPp/j3lhuCD0VpQ81VM3uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/FtEINNO6A5Tk+s4Kcy/I7l4YRUi5WWY5d36HdKUKxg=;
 b=BXe3bMJiGY+ceuI8AAO8lk16ZOEFa3Sr4Q612182Faq9jUxsus+ovdyY75KeUHwECPJeX8I7Y0z9TiLce3KyJjxeHF1peVx9zZatFy1anrjIAwFI63uI5JsEAzhDbkXyiC9Gl473BHIKVXcQVc4IhHejMj9xt/Usc1NGFNFQ6Hi6c3gUDGSwtu8BZhm5MEdbK40L4fgCnZjq5Z6Rhms04rSAr9ysgxoXPHYIi1rAKgNZnM65tfa3eZ1+F50fCF6Qr+uPGTcuH9Vj57DOfy0vdan1Ms63lCPQTJiM9M9fXLemrcLaZZeZ0pcZtHbdS7KrUq7rQHYIp7oM1wBLer7LTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by SEYPR03MB6603.apcprd03.prod.outlook.com (2603:1096:101:85::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Mon, 13 Jan
 2025 05:24:56 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca%7]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 05:24:54 +0000
Message-ID: <2578a79d-1e24-4336-9859-e384c8f69269@amlogic.com>
Date: Mon, 13 Jan 2025 13:24:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: amlogic: c3: Limit the rate boundaries of clk_hw
To: Jerome Brunet <jbrunet@baylibre.com>,
 Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20250110-limit-rate-range-of-clk-v1-0-dd618adc4aa8@amlogic.com>
 <20250110-limit-rate-range-of-clk-v1-2-dd618adc4aa8@amlogic.com>
 <1j34hqai39.fsf@starbuckisacylon.baylibre.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <1j34hqai39.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYAPR03CA0022.apcprd03.prod.outlook.com
 (2603:1096:404:14::34) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|SEYPR03MB6603:EE_
X-MS-Office365-Filtering-Correlation-Id: e9d33e99-dc36-484f-d408-08dd33929c3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SEVHZmVRcUcxRXpPdXJFRndOQjN2WkdXd0lLcGd6bFMvMTVPNDRqUjBFVEJV?=
 =?utf-8?B?M2Y5R3ZYNkRZclM2MHN3MEIyM2h3dGJuOWUrbEZpOEZMOG9lb1VnSDc1SkRW?=
 =?utf-8?B?aEVOenJQYWkyeEdWQ1RyVHcwMnJxWkxDeGh0NjFodmRDWkRCb3cxcXhkSlA0?=
 =?utf-8?B?L0JEeXNSQjBNNGZjR0ZTcXBGVVRMSUFUdG5kVXFmOG5hWXU1OXdkWHMxdTVB?=
 =?utf-8?B?bVppK1lxVm5aTzdxaHJYWTRDaXdCbGNKSVNCN05aS3FEZGV3MEkweVlJc0Mr?=
 =?utf-8?B?R215cU40QU9TNVhXOWRWKzZZbTFoa2FnMGVKeTNDQy9ySkNxTk13WG9VdW03?=
 =?utf-8?B?SGJTZUdvYnQzb1JaYnNXM21Rb2xxZ3hEajR6MGE3ZXJlaTJsSFFvUUhuV1Bp?=
 =?utf-8?B?RVlMRmoyWFJ4cHJWdUt3VGV6ZG8yOEdpL2FYSFBIZFlneUpWcWRaUTJxOXFx?=
 =?utf-8?B?YTRFWlpPZWZrUm9xeWhKY2xnRG5Ra09uTzYzaWJHaW9Sa0xQTXd3OHllcTJB?=
 =?utf-8?B?NzQzQ29YcFl5eVF3YkZad1IwSFl5Y0ZtZE41NnpoUGVwcHZyYWxvaXV5T0pT?=
 =?utf-8?B?N0l3WUQ2MnVWWTlrd2tsQ3dUVVh2K3BOT3MzcmJ3bmRMbCtDSnYzNWRIdWli?=
 =?utf-8?B?M0N3QWpONjNIdFR3STA3M0RGeUptNXcwbFVWby92bFVkNmprMzd5R2JYaFpD?=
 =?utf-8?B?QVZseTJjdTE4SVJiR3ZaZ25PcHdCa2FOYlc5WjhUczQrRjd2TUtMcE9rbjJr?=
 =?utf-8?B?MXZYTWNsWXlrTjI0ZzBEMHN2T1dtblFsRTNKQ2FiMVc4dWxpUC9pUUUrTk1G?=
 =?utf-8?B?eFJjWGE5STV6MFFXaGc0NzBLV1FSOEFSMlZ6V3FUdTE3S05HUURMRWxrU3Jv?=
 =?utf-8?B?RW5SQ1JvR3V4TnpHWE5SelZGbTJ4OCtIeWNTYjR2UTFnV1V2aUJna0gxLzhP?=
 =?utf-8?B?aFFxdjQ4Y3B3ZnI2am5CbW55M0llb0Q2M1ZWZ1gzeFZHcmNWeklNYXFSWnhy?=
 =?utf-8?B?TzdsbmNpa3VPZlFPU0pmditteVdMMTYybEFPUEl0V1Z6NkM2amhmYTFTejNP?=
 =?utf-8?B?Z3Nhd1lYMlFEWlNwaGpPS2Q1K0FRbEd6c3R3UWJCMkl0WVZpRmRFVStpclFT?=
 =?utf-8?B?aFpleGNGZ2xkL2JSNHByUklienkxQ1N0Yld3dzV3cjhnaTFNbndKdFE2QU4z?=
 =?utf-8?B?NWFyeDBWOGRhOUlzMm81WFZlRnA2YjhVVzdmbmpsZ3JUZi9ORGM0OVRxdy8r?=
 =?utf-8?B?ekZBcVczMXJqd3Y3ZnU4YnRQUDhxSS9NZTlkazBnVkdJQVcrVnZ4U25Famt0?=
 =?utf-8?B?a2xsYmxKejNxRzIzV04zZlBvTDAvSUwwY2hlWTY4bEZhSXJBczh1V1pPbWVp?=
 =?utf-8?B?c1BuVVVsNElDeEQ3K0ZhclJEWWhHcWI2cXllNnFzTmZPV25Sek95Y0RJdVA1?=
 =?utf-8?B?ak5GRTBUNDBHOHowQm5pNEtaVWlKdlRmenJaVXJwaGUxbnF4Nk1sNEhPejhM?=
 =?utf-8?B?aytLc0J1ZVAxOTBIMXhTeWh3dFNoVkFtT0tQSHcyZWdGaG8xQ25VWkV1cnpm?=
 =?utf-8?B?ZDJsV2c4MVNCQ1d2WFY2b1FqeFNlUFd5YUtoeTJrU3ExOEk0U2NudzNITjY2?=
 =?utf-8?B?MTRVRUxPRit6OUtyRTcwSVdQOHkyUGM3VEdxUXEzelRTaENrZ2RQQmJ2bUxL?=
 =?utf-8?B?WHNOaXdweGRsR3p1Z2lZNFB4WjY0WmRQNlFiNTlWbEN0N0YvV2Jib05KV3BP?=
 =?utf-8?B?cTBzVEtoNGFwTms1WExWSUkwZi9wdThzUWZGY1U3b2poSXp2czdvV0ErckYx?=
 =?utf-8?B?c0dJcVlPUWhscm5Jcy9WUmdRQ2FoMENINHpYSUx6aUFBK2NKY3pZZm1Cbnlo?=
 =?utf-8?Q?O8P4o8bGBZ6hn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0FYS0FlUllSOVBxQmZBem5PWXZsbXR1TlhRK2J1eWovWktLQ094N0M2Mkoy?=
 =?utf-8?B?Y3ZoRHJvT1VXWmtJNUcvZHFKdmpTM1VGQzBmdzdhMXlxeWtRZStJMzBqenpz?=
 =?utf-8?B?SHc3QmczZG8rN0xETkFlSnBpOERYWGtJdGEyWlVVZWNUL3hYWXNtSEk4dC9l?=
 =?utf-8?B?T0F2alFaVHhEbXlKVmtSanZJK1RpQzU4aWRkTUZYakhrVHBqNHpJSVdZSlJn?=
 =?utf-8?B?cUQ5U0lsNjdyTklhdjA5NDJpUTJkdGpjZnJLU3NUWENIVGZabGZ5d09LNFNa?=
 =?utf-8?B?dHYzTFZBVFlNdU5TbkhIRGlkL2lvbE5DSjdDY2RCUlFpUGtXZ0piVDRpL1R1?=
 =?utf-8?B?a3lPWXpwbnFQZy90NEFaNG03SmhjTktIeUMxOHRuWm1ncmNIVDZKUDVaUmY4?=
 =?utf-8?B?RjJXU0F4L2hta3lwOG8vWktoK25QSjNYS2N2RkhxM1pjWkp4Smlha1hYSEEw?=
 =?utf-8?B?YU5JbWpIYSs2T3lGRVkvbkYrb3FQbnV1UEoxN0MwY2pmb21ZclZ3VzU0a0VE?=
 =?utf-8?B?WG1aM3RYeHBkRVlnbVFDNG1SR01MMDVGallnNDRtWTEwUklLd2NtRjllaFMy?=
 =?utf-8?B?UTlXc0U5TWRVMmZyOWthMXI0Y1hybDYrbnlHZXZGWENNVmdqOUJseStXeUVG?=
 =?utf-8?B?TU9ONXkzTW9SaTc0Qy9QN3NTQURNWnVVMktnaTI3aXJscGlHcGNxd29wOE5s?=
 =?utf-8?B?Rm9zQzZwenVNZUdHN1A4L2ZOWWI0ZGFRd1RzZ2prV08yYk9DNGZ3VHVBYlF4?=
 =?utf-8?B?YWhDRnNvZDM2YTlRdmo5YXhDYlZiM0h3TmR4em5heEtmc2kwa1g3bmYzc01q?=
 =?utf-8?B?bngwSUtYNXA2MTkxSlRFbkNPdFdZRDdzRWJXQ01CYzd2QlJad2lXRlYvbTc3?=
 =?utf-8?B?MDhTMUcwSERWMDNXcUFqRkJMaXRxdFhWSlFpQ3lseVFYSE4xK0VBVzdMYkxx?=
 =?utf-8?B?VDVYeUoyMHkxcDBkU0ZnQnFucnowQW1QNDQyOGZSUWpUZnVrV1JhNDFETWdL?=
 =?utf-8?B?cElwdkFRVVBLdjloTU8vY1FVQkNqcURyakoyNnV5OFZGSEdER3NMUVZmOEdJ?=
 =?utf-8?B?S1hIS3NnMEkrWmdPVXVNc0tGVXVySit4Sm5jVkpuTHVHR1lIK2NtSWVXL0dF?=
 =?utf-8?B?SzY2SSs1TWpLSmFWV2ZNWWFSaFRxV3E1RnAwNWVFdTNTdVU1RncvV05ieWJs?=
 =?utf-8?B?aG9OSGtmRU1EYjM2WWRIMVNTNVFtcVNqNVdMZzhpaStTaS9LNUJNbHNzTjRJ?=
 =?utf-8?B?d3BJR3pZUWtrMytaZ3BVQ0VreHAwLzRtYmtIQWlnVTdaT2Y1dGZTQnlkM0Q5?=
 =?utf-8?B?NEZ3ejVCdW8yV1cvd3JUbTBhbStZMllWc1oyQ3RadHBZSjRSN1FNWGRCQUJP?=
 =?utf-8?B?dWMyRTVuejN4VHc4aEJ6Z2lFbnk4ZkRSYnd3SkI1cGZCUnk4cVUzanZGUWEy?=
 =?utf-8?B?akpEM0hIYlNGOURXOHJKeEU1Q1p0VlcvSXQrT1hWNXdFekpHcHBXdUN3dzBq?=
 =?utf-8?B?aTJlYWp4clZtUFl1aXErcWZOYXJMVGNMS3BQejJlME9FUHB2WHRKdlJURzVQ?=
 =?utf-8?B?R3F4Z3RaK2tNMVZxbGd0TUhBRDl3QVJiZ2dxZFpWNDlTYTJsZkwrRmxsdkNw?=
 =?utf-8?B?SmoyTVBxdmU5d3c5QlYwM3NPL0Q1T2YrWnJiNUpHQ01qdXBKR1lnZzMrZjFZ?=
 =?utf-8?B?QnNPY2FNR2dzYWIyWXY0TmdySDdUdUd4dzduV0pxcVJmaUJ0THVqc0FDamNy?=
 =?utf-8?B?dUp6R2dPc2szVnVRNXdnOTNadkk2TWZLV3ZHNUVKZndPN3NSRzJpMzY4cWsw?=
 =?utf-8?B?Z3h5alU1UnBHaXdzQWhKUU95SGVGUU5LaXI2ekUvRGFkK3dIUUNjdUI0ektm?=
 =?utf-8?B?bmJmQUp2OENCNERpZ2NxRzkyaUE0TStpZkJMcTh3bU1lc0l4QVFlMU0xVG9o?=
 =?utf-8?B?dlhuNnpCM0MybzRWNkZVT0hIRzJpV0tTZS9aRjFnZWVQQ3draU1uWDBsSWxS?=
 =?utf-8?B?d3VWMXpaRDhsbExZL2xSMEd3WjZxNnZQbG5KYlJ5R25sMmg0WWJ1K2RYNmR2?=
 =?utf-8?B?aFBYQnhiVWFQN0YrNWE5dVpwd3ZJRVpIYTBubXFyM0FGMjlYZW5YMmhIaXZY?=
 =?utf-8?Q?UesccBQHXUS9/eIllkF000/qb?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d33e99-dc36-484f-d408-08dd33929c3f
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 05:24:53.9398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /TYq6AGPF0ysytgt4VR/ZNdzK/66Eg6TFDZnmSvfZnMbB9HAMvp11XHJ4NcMF/Vqzu5+LHoDxzDNQinwYJ4qpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6603

hi Jerome,

Thanks for your prompt reply.


On 1/10/2025 9:55 PM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> On Fri 10 Jan 2025 at 19:47, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:
>
>> From: Chuan Liu <chuan.liu@amlogic.com>
>>
>> The PLL can only stably lock within a limited frequency range.
>>
>> Due to timing constraints, the maximum frequency of the peripheral clock
>> cannot exceed the design specifications.
>>
>> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
>> ---
>>   drivers/clk/meson/c3-peripherals.c | 21 +++++++++++++++++++++
>>   drivers/clk/meson/c3-pll.c         |  4 ++++
>>   2 files changed, 25 insertions(+)
>>
>> diff --git a/drivers/clk/meson/c3-peripherals.c b/drivers/clk/meson/c3-peripherals.c
>> index 7dcbf4ebee07..9f0a3990f0d6 100644
>> --- a/drivers/clk/meson/c3-peripherals.c
>> +++ b/drivers/clk/meson/c3-peripherals.c
>> @@ -568,6 +568,7 @@ static const struct clk_parent_data pwm_parent_data[] = {
>>                .ops = &clk_regmap_gate_ops,                    \
>>                .parent_names = (const char *[]) { #_name "_div" },\
>>                .num_parents = 1,                               \
>> +             .max_rate = 200000000,                          \
>>                .flags = CLK_SET_RATE_PARENT,                   \
>>        },                                                      \
>>   }
>> @@ -724,6 +725,7 @@ static struct clk_regmap spicc_a = {
>>                        &spicc_a_div.hw
>>                },
>>                .num_parents = 1,
>> +             .max_rate = 500000000,
> I'm sorry but the whole thing is completly wrong.
>
> All the clocks I'm seeing here are gates. This type of HW hardly cares
> what rates it handles. Same goes from mux, dividers, etc ...


The purpose of the patch is to constrain the clock network between
"clk_hw" and "clk_sonsumers". The output source of this clock network
may come from gate, mux, divider, etc.


>
> All you are doing here is trying enforce some made up "safety" / use-case
> defined limits that do not belong in the clock controller.


Yes, the purpose is also to ensure "safety". From a strict perspective,
this constraint indeed does not belong to the clock controller. However,
the source of the potential hazard comes from the clock driver, and we
have already identified this hazard. Therefore, I think it is better to
avoid it in the clock driver?


>
> The only piece of HW where limits could possibly make sense are PLL DCO,
> and even there, you've got multiplier range which is way better as an
> abstraction.


 From the perspective of HW, the timing constraints of the clock are for
the entire clock network with the same name. The output source of this
clock network may come from PLL, gate, mux, etc. The multiplier range
of the PLL can also achieve a similar effect. If this approach works,
we don't need to define the multiplier range for the PLL (PS: Our
current multiplier range is limited to the case where "n" is not divided).


>
> So it's a nack on the series.
>
> If devices are have particular requirement on rate range, have the
> related driver set it.


I think that the clock configuration exceeding the timing constraints
is a hidden danger that all chips have and face, but this hidden danger
is not easy to be exposed?

For instance, if the routing of a clock network is close to the clock
or data bus of other modules, and this clock network is wrongly
configured to a frequency beyond the constraints, causing crosstalk
that affects the normal operation of other modules. If such a situation
occurs, it will be very difficult to troubleshoot. How should this
situation be handled more reasonably?


>
>>                .flags = CLK_SET_RATE_PARENT,
>>        },
>>   };
>> @@ -771,6 +773,7 @@ static struct clk_regmap spicc_b = {
>>                        &spicc_b_div.hw
>>                },
>>                .num_parents = 1,
>> +             .max_rate = 500000000,
>>                .flags = CLK_SET_RATE_PARENT,
>>        },
>>   };
>> @@ -829,6 +832,7 @@ static struct clk_regmap spifc = {
>>                        &spifc_div.hw
>>                },
>>                .num_parents = 1,
>> +             .max_rate = 167000000,
>>                .flags = CLK_SET_RATE_PARENT,
>>        },
>>   };
>> @@ -887,6 +891,7 @@ static struct clk_regmap sd_emmc_a = {
>>                        &sd_emmc_a_div.hw
>>                },
>>                .num_parents = 1,
>> +             .max_rate = 250000000,
>>                .flags = CLK_SET_RATE_PARENT,
>>        },
>>   };
>> @@ -934,6 +939,7 @@ static struct clk_regmap sd_emmc_b = {
>>                        &sd_emmc_b_div.hw
>>                },
>>                .num_parents = 1,
>> +             .max_rate = 250000000,
>>                .flags = CLK_SET_RATE_PARENT,
>>        },
>>   };
>> @@ -981,6 +987,7 @@ static struct clk_regmap sd_emmc_c = {
>>                        &sd_emmc_c_div.hw
>>                },
>>                .num_parents = 1,
>> +             .max_rate = 1200000000,
>>                .flags = CLK_SET_RATE_PARENT,
>>        },
>>   };
>> @@ -1074,6 +1081,7 @@ static struct clk_regmap eth_rmii = {
>>                        &eth_rmii_div.hw
>>                },
>>                .num_parents = 1,
>> +             .max_rate = 50000000,
>>                .flags = CLK_SET_RATE_PARENT,
>>        },
>>   };
>> @@ -1132,6 +1140,7 @@ static struct clk_regmap mipi_dsi_meas = {
>>                        &mipi_dsi_meas_div.hw
>>                },
>>                .num_parents = 1,
>> +             .max_rate = 200000000,
>>                .flags = CLK_SET_RATE_PARENT,
>>        },
>>   };
>> @@ -1190,6 +1199,7 @@ static struct clk_regmap dsi_phy = {
>>                        &dsi_phy_div.hw
>>                },
>>                .num_parents = 1,
>> +             .max_rate = 1500000000,
>>                .flags = CLK_SET_RATE_PARENT,
>>        },
>>   };
>> @@ -1248,6 +1258,7 @@ static struct clk_regmap vout_mclk = {
>>                        &vout_mclk_div.hw
>>                },
>>                .num_parents = 1,
>> +             .max_rate = 334000000,
>>                .flags = CLK_SET_RATE_PARENT,
>>        },
>>   };
>> @@ -1306,6 +1317,7 @@ static struct clk_regmap vout_enc = {
>>                        &vout_enc_div.hw
>>                },
>>                .num_parents = 1,
>> +             .max_rate = 200000000,
>>                .flags = CLK_SET_RATE_PARENT,
>>        },
>>   };
>> @@ -1431,6 +1443,7 @@ static struct clk_regmap hcodec = {
>>                .ops = &clk_regmap_mux_ops,
>>                .parent_data = hcodec_parent_data,
>>                .num_parents = ARRAY_SIZE(hcodec_parent_data),
>> +             .max_rate = 667000000,
>>                .flags = CLK_SET_RATE_PARENT,
>>        },
>>   };
>> @@ -1489,6 +1502,7 @@ static struct clk_regmap vc9000e_aclk = {
>>                        &vc9000e_aclk_div.hw
>>                },
>>                .num_parents = 1,
>> +             .max_rate = 667000000,
>>                .flags = CLK_SET_RATE_PARENT,
>>        },
>>   };
>> @@ -1536,6 +1550,7 @@ static struct clk_regmap vc9000e_core = {
>>                        &vc9000e_core_div.hw
>>                },
>>                .num_parents = 1,
>> +             .max_rate = 400000000,
>>                .flags = CLK_SET_RATE_PARENT,
>>        },
>>   };
>> @@ -1594,6 +1609,7 @@ static struct clk_regmap csi_phy0 = {
>>                        &csi_phy0_div.hw
>>                },
>>                .num_parents = 1,
>> +             .max_rate = 200000000,
>>                .flags = CLK_SET_RATE_PARENT,
>>        },
>>   };
>> @@ -1652,6 +1668,7 @@ static struct clk_regmap dewarpa = {
>>                        &dewarpa_div.hw
>>                },
>>                .num_parents = 1,
>> +             .max_rate = 800000000,
>>                .flags = CLK_SET_RATE_PARENT,
>>        },
>>   };
>> @@ -1710,6 +1727,7 @@ static struct clk_regmap isp0 = {
>>                        &isp0_div.hw
>>                },
>>                .num_parents = 1,
>> +             .max_rate = 400000000,
>>                .flags = CLK_SET_RATE_PARENT,
>>        },
>>   };
>> @@ -1768,6 +1786,7 @@ static struct clk_regmap nna_core = {
>>                        &nna_core_div.hw
>>                },
>>                .num_parents = 1,
>> +             .max_rate = 800000000,
>>                .flags = CLK_SET_RATE_PARENT,
>>        },
>>   };
>> @@ -1826,6 +1845,7 @@ static struct clk_regmap ge2d = {
>>                        &ge2d_div.hw
>>                },
>>                .num_parents = 1,
>> +             .max_rate = 667000000,
>>                .flags = CLK_SET_RATE_PARENT,
>>        },
>>   };
>> @@ -1884,6 +1904,7 @@ static struct clk_regmap vapb = {
>>                        &vapb_div.hw
>>                },
>>                .num_parents = 1,
>> +             .max_rate = 400000000,
>>                .flags = CLK_SET_RATE_PARENT,
>>        },
>>   };
>> diff --git a/drivers/clk/meson/c3-pll.c b/drivers/clk/meson/c3-pll.c
>> index 35fda31a19e2..d80d6ee2409d 100644
>> --- a/drivers/clk/meson/c3-pll.c
>> +++ b/drivers/clk/meson/c3-pll.c
>> @@ -286,6 +286,8 @@ static struct clk_regmap gp0_pll_dco = {
>>                        .fw_name = "top",
>>                },
>>                .num_parents = 1,
>> +             .min_rate = 3000000000,
>> +             .max_rate = 6000000000,
>>        },
>>   };
>>
>> @@ -370,6 +372,8 @@ static struct clk_regmap hifi_pll_dco = {
>>                        .fw_name = "top",
>>                },
>>                .num_parents = 1,
>> +             .min_rate = 3000000000,
>> +             .max_rate = 6000000000,
>>        },
>>   };
> --
> Jerome
