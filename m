Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010032.outbound.protection.outlook.com [52.101.84.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9842F3C3E;
	Wed,  8 Apr 2026 13:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775656597; cv=fail; b=dw7dmWkJhBtMXWLnh6ktNnmoU2Z5Bk5kg2hEDKh0oWzA5PjYr2k68GhZrfTLl1+W1rtmTFewSjWYy7Lubjzwd4BDpoIn892hehT4QMDKkUlPcOtrtYto1elzfta3BUwm5IG4NgmRT1SyJiduW1VDvqiATmLY0f9S65fMhrEHjRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775656597; c=relaxed/simple;
	bh=2QrHBsNa49Dbs3kBhWgZb8dvG6GZNMGGJBA1K83ytz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PUtFNrj5Yx9lo/KDJmCklpuDsvFMxDIuxSVsFYLtG8W/CcyTo460HCEM7NDIvx70N0Mjx+YKzsojLdjeaarUx3zJVVg84c72FT26vEmkwhB7W2sCJo8yg65VJutKHC6xIceaByJdPqv59kgfN4zyuK4YJLgaPm0LidiqJ5dOATw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QeDGUcca; arc=fail smtp.client-ip=52.101.84.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QeDGUcca"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dnvqrQ6mGXQPz5dYr/6j99uSdNinKqqZrP6cgywcKfmbifKmld0RI84T/73jXd2jMoG3MixFy/N8I2O4JZOAAv61uJAXK+c7iuXER74pKl9UTPU80Sfmu8qCVo5JuyTyKCWguSbW95N3a83xYaK02SGrBwhp4EtycuJL8mpMKmZlwWPwXTp1BU3JeUiaVj36Y4o6O+qaaM38zKQfTXGCfwlJwc+fyieGI78IMhBr1vcQh+uxtf44mHh/bNOX41ivb5E1ZSG77WjG51Bi8U1wX4u+gHHDQOL8ZgCJV5tVPFkO9L8H+Yb7ihKLhXKxE3ro7SVucYn6AX4ngrcogpD8kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vk9ZtLgNzNKgPkpN2H7+uXyVHFrg5CXZcijqYXO4kL8=;
 b=cpP2QF0e+icmvL63Ficfb5fKTob7pCZiuK+vTl/uUFtm2yRRMlM2QUhu4cpJ4DJIvQUmeTKVRx1X/EIZfNoNUJtD6+X40hmgxM1obKfR9I5Dkg0EZzjuJkaea5f5Ph6dwf6SiZirHj/rhj3SZWFflckxdVQ+kXtmeRTRMRl5a2idk+0wYdHrvI5z+vcF4KouKQCR1R3+VuxxlxiFAyTf+hOY8JEJaqQcBcpF9IcYOKIFTOFPbjTnB/LhbR/ODLvQmMt4gGF7jgTEEEb8PcT3H+SOK58BAJ/mIbm+PU/lMv/2grSCcyDN9FRuQsXoxddzAVs4Kw7Apn6NyMr+rPbO0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vk9ZtLgNzNKgPkpN2H7+uXyVHFrg5CXZcijqYXO4kL8=;
 b=QeDGUcca4+0KA9pj38+Vzmcm6ecGhvEwZNQfPAvet9j5/NczU9qlkwrNIQlcCS5PmQBbvTrsyi8EAZP9VrFNYhiiTP0VrAwpCxIfxXwCx7iR08j0T5BieG+4Fu/fJbZrOuiFlGNG/zbDATN0snkUcl8Haco6EBiXxKdC9YsvH02FJyJsdRUKz7yZlCwv7JVxv9o36gJvgkVkBlG8zQEBrgBLN/zhcVVdVc2GD8Ef+D58ffKhDVxo+WNt8wJEhUtarnn1cclf+MHK8OM/lLMDSbsENSN12yc7/GyKe2Yoa7wDdWLZuuMQwKnXrzGZpG/snOJdWk8oLXgyvvLU42af5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI0PR04MB12008.eurprd04.prod.outlook.com (2603:10a6:800:317::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Wed, 8 Apr
 2026 13:56:30 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Wed, 8 Apr 2026
 13:56:30 +0000
Date: Wed, 8 Apr 2026 21:58:52 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH RFC 0/2] clk: scmi: =?utf-8?Q?D?=
 =?utf-8?Q?T_support_for_SCMI_clock_rate_rounding_modes_=28per=E2=80=91clo?=
 =?utf-8?Q?ck?= policy)
Message-ID: <adZfHF18dnuugYHL@shlinux89>
References: <20260306-scmi-clk-round-v1-0-61e2a5df9051@nxp.com>
 <adPTdg4RJpkjc4Cg@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <adPTdg4RJpkjc4Cg@redhat.com>
X-ClientProxiedBy: MA5P287CA0235.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI0PR04MB12008:EE_
X-MS-Office365-Filtering-Correlation-Id: 45b263f1-1fa9-4483-ac6e-08de9576a2e5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|366016|376014|1800799024|19092799006|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	8zezWLe8g0Al+gjVyGmswSobBz+OPDjCmskdYNcb75P8UcD+udD6TYC4C3bCsDeVkQWqvMu5cDB6oWCGOdZReXyVDhyT6RbVDE96YJrg/GGeOwzvP6S2Tpnt9VQ1UZq4HPgZ5MRtLKHfA/GHg8daBxZmdrdyJg0CRNl8wje+FjbHai4uBeW8ORlDK6KBpSuzSzFjQQ59Y4BEWz2aTstAC9vgJ8Y2jwu1+xEQ0zw0p5vlHP76Gu+KKBZZ9tMbBcO/FsBTpbfJPyRKki52sVipZNZmvW8lsUcpzJzSFG80BprzvHzuMh+cpEVP5ksxcGyPnYxDvAMZ65s6zflFw1lVjKc9GRs0fDZPVL2aYPn66fFoLYbTOrS93+fStn2ro1WFhZFpOmSyD0OWDyRaladyYuZXmlDUtG7m/th3IOMfjCxLeaHXNtm3pzMu7Ri//8vigZUk1hw7RzTziLXddnbt4ZwUZ0XRgtChNH1fd6LWwrNdLaYem3l7vynzpyv2a9E+RUJeokerKlkoTtnxmqhFJB9mjxDit/A818kfOkZOztKDFOV0mEnKQUImI+LxnfMF7QFTXfZYOIdwod6Ei6uA5OGkYRNchjswQquEfhn+Nm5h6C3jeSRH7vDUWhmFKKtmrLMsxth6yvkMi63cysfNdKDudHKRSTigpqSNurqzpqFRTX26HrUat/DH67JGSF+0BUuUbmkb3T3LQUYjoTzb5cMgX4V5VjTYUeT0qffNpAKcFU2OFjQGO/4HbeQeIfS3Ub+mNfXiCflhxdMmwXpWV1lbaiN3fqT7vM44R0gmDsA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(366016)(376014)(1800799024)(19092799006)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUNqTnhRQzBvcGRPSVY1ckpTRDlqQWFEa0VnS3M1TjZvaVN0R2I0ZlYvbTli?=
 =?utf-8?B?YlFXVUIrOTBROEFKWS9NY1hRYmJ0NWF1L2NsZzVaNnNROVdMTUpkMjc2bnRM?=
 =?utf-8?B?MmJqbmRRYUp4VE1MdzliMlk2MXBuZmwyNVBrK2FwenZKNWJCdlFDRW1LclJG?=
 =?utf-8?B?R0hlTkxKckhjWUl6Mml1QmVFLzBpTWZBVFpvWGF4NzJyOUxuM3RIWFJTUXZ5?=
 =?utf-8?B?b1hKUm5iZnJ1c2ZGTE9kc3A1aHVpc09MN01UQy9VQWlZSEJEaVJXVExMUTFI?=
 =?utf-8?B?Wjg0a1BWb0N6YlovQ20yYVIvanlxSFhlQjkzT290WGI2RzYxbWtqcjlNV1V5?=
 =?utf-8?B?UU1NWjFxZklBY2Z4OG5GTDVjakFQZ1NpSmhYS1JlOGNEK2RmM3JaL2duUFp3?=
 =?utf-8?B?cmV3RW9FMnY2T3UvQjJCejdmVVZweGQ4Z2hsVHB0RkU5YmkxNkpBRG03Qnps?=
 =?utf-8?B?dXJQcE9KS0d4dHBtWm8wVmNOWmdCVEl3WmdsTG4zVkd2TkpWTFRXZ2srVkFX?=
 =?utf-8?B?bkdUNmw0dVppS2JWRmE3bllZSlFMa3MzYzE4amRmcUt1L0p2b3NhQUFXenNl?=
 =?utf-8?B?VXEwWEw2d1RQZHZjVlRsb1N4RGdPWWxtcDYrUS9EeDlKMWdVVVltOS9XSzlT?=
 =?utf-8?B?K3FpUzZ0ZW1qb1VaaUdmODU0U0xMdDhJM3VaMkRlNlYyOTRqa04yYTdqY2Fz?=
 =?utf-8?B?UnJlMGRkRUhrK2ZhdnNSNmsrcnhvQnJoMkxTeUZuT3JBQ3BUUVpWVWRISzZW?=
 =?utf-8?B?QW5pNFpoRzdyZ0JFODdJV0txVXkyRmdyYmluUnlQN3JtbUpGTzhFTDRDUEUy?=
 =?utf-8?B?bW0xQmR3aW90Q0QzNnB4U053ZE1KQTZsWG1aRnNtM09zejdLVVpieHNhUStr?=
 =?utf-8?B?TVFPSEdtTXFSTVdkUlUzOTVNYVF0czRXQ0JoUkt4cmJ4dmljZnBGenBzYWI2?=
 =?utf-8?B?akxBV3pWN1lndjFmazk5TFV0a0tKaW5kYU5lTXVLbU5mM0V2M29wblJGTlNi?=
 =?utf-8?B?ZmhwV2M2MStkUlNaa0J5WjlsR2poV2hDdSt1OVBWMjk2NzRERkUyQlFtMkpt?=
 =?utf-8?B?VUZ4RHR2QUoyWmFaYmZZa0dxK25Jc0VqdkxEck9KeFZFMlRYSnc2SEw0OG0y?=
 =?utf-8?B?MFVORUU1WFZRMkFGSWNBK1RubEQ3SS9ZRGpXVk5KZjRSenpvRkt5dTBCVkQ1?=
 =?utf-8?B?TmRUSUJHTUdwQWZSc3BDYkw5ekJPNVNQYmljQ3VuT1hBdVBOWGZhS3g1eFJw?=
 =?utf-8?B?MkhkbWtnbi9VUzNySERpQUljQmtNdForTXA4VmxQV2tWVlQraWZiTjN2S05U?=
 =?utf-8?B?MlFQRERoQ3hJUEpsNVczRXk3REZNak1aOCs0RVlTYjlqcndtbE9vb1JOZVFI?=
 =?utf-8?B?UEJXeERsWE44czE5L0hsblhMWmJTTWtmUDJOZzVOT2RCSThjeDFYU3h6bWFh?=
 =?utf-8?B?S0JHSkMzM01ibGUvVHVHQ2ZFRytjczZYWUVVeEtXTjdDU1hZTjZlTWRZU3kr?=
 =?utf-8?B?YUZNUXJuN1BxRWpBL3JqN2o3OXk4Qzd5VW41S1Nid1dLYTRTZHJwUEJ5Y3gw?=
 =?utf-8?B?dGcrNDd1M1l3ZmU3Z3g5T1Q0eDUzZUZJRUszSThGYktwTGdNTldsK2pZNHNH?=
 =?utf-8?B?eWJ6OHZpWW1HR3oraFNkcE9nMURZbDRIbXlIekY4WTBKMi9BcVdubmR6MnVj?=
 =?utf-8?B?eWdaUXJBNzNpVVM2NVA2SEFnSVdqd3FRb1BKWC9WL1hURWp2QzA0cXRwK0dC?=
 =?utf-8?B?bWFUU0hNdnZvT0EzOHhJNlA2eXRJQWtHeHJEZG54OHc1SmVFQnY2V2NrQ2xu?=
 =?utf-8?B?NUU1VFdnNjBFdUVLTEI2WDNRU25vcUxFZENOZmpsZTRsN282WmMvejBwZTl6?=
 =?utf-8?B?dkxOS3poRHZ0UVdqTXQzS3lYdlZhSGxKcTVSV3JnRTk3WTVla0JnaStsVVVi?=
 =?utf-8?B?NUJZbGRNMnd1blFPWDZEQ1lDaEowYTRiZUNQT3huQVZBcktDSmNxdm94Tmh4?=
 =?utf-8?B?V0ZjNnJ1WjhOMzR5U09pNU5RZGF3MHB5ajg5N291VEhGRnl5dFJRS0xLWGNy?=
 =?utf-8?B?OWJSNFFJRFVjUXdZaDZmN2tUaDN0aVpxRGsxalNyUzRlVnJvM0pOeURmNEMr?=
 =?utf-8?B?Q3VTMDFRNlVTd25WaUFTZiswaGovSDlJSFl1ZUkzQXVLeXUxZWdsOFh1MzdJ?=
 =?utf-8?B?N1R3OXUyZ0t1Slg3Sno2K1gyTHBkZVZNT3gya0ZFSngyaWFEQTZieU5EN2Ja?=
 =?utf-8?B?dmtEcnd2bitEQ3NSNThlUlVRQ0pOZFFIZWJEWmlDWE5BODgvYWhuK2xXZ2FR?=
 =?utf-8?B?MytPb3R5T3g4ZitNZEdKR05vN2NicTZldGthb1RqblBHdGp1OXd5UT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45b263f1-1fa9-4483-ac6e-08de9576a2e5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 13:56:30.6529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vnyZlEwFj8apPd+XAeK0npfm2GQ5wfoM8rLY4aWT27sNWfcE08TSrWrLJ6g6O7c4fOBTd3mFHB+ga7sTi5OYKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12008

Hi Brian,
On Mon, Apr 06, 2026 at 11:38:30AM -0400, Brian Masney wrote:
>Hi Peng,
>
>On Fri, Mar 06, 2026 at 02:20:11PM +0800, Peng Fan (OSS) wrote:
>> The ARM SCMI specification (DEN0056E) defines rounding‑mode flags for the
>> CLOCK_RATE_SET command, allowing a client to request that the firmware
>> round a requested clock rate down, up, or autonomously choose the
>> closest achievable rate.
>> This series introduces DT support in the SCMI clock provider to carry a
>> per‑clock rounding policy from the device tree into the SCMI protocol.
>> 
>> Patch 1 adds dt‑bindings constants for rounding modes:
>> ROUND_DOWN, ROUND_UP, ROUND_AUTO.
>> 
>> Patch 2 extends the SCMI clock provider to optionally support
>> "#clock-cells = <2>", where the second cell encodes the rounding mode.
>> The first consumer that references a given clock latches the per‑clock
>> policy. Subsequent consumers of the same clock must specify the same
>> mode; otherwise, the request is rejected to avoid non‑deterministic
>> behavior. The selected mode is passed through to the SCMI Clock protocol
>> and mapped to the corresponding CLOCK_SET_* flag.
>> 
>> Patch 2 includes changes to drivers/clk/clk-scmi.c and drivers/firmware
>> arm_scmi/clock.c, it is hard to separate the changes without breaking,
>> so I put the changes in one patch.
>> 
>> This design adopts a per‑clock policy model, not per‑consumer. The rounding
>> mode is applied by the provider per clock (index).
>> All consumers of the same clock must agree on the rounding mode.
>> Conflicting per‑consumer requests for the same clock are invalid and
>> are rejected during phandle translation.
>> 
>> This avoids silent clobbering and preserves deterministic behavior.
>> 
>> Existing device trees using #clock-cells = <1> continue to work and
>> default to ROUND_DOWN, exactly as before.
>> 
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>
>My high level feedback about this:
>
>1) Since you are making changes to the DT schema for the clock-cells,
>   does the SCMI DT schema document also need to be updated to allow
>   clock-cells to be 1 or 2?

You are right.

>
>2) For the ROUND_XXX constants, I would prefix them with something
>   since the existing ROUND names are fairly generic sounding. Maybe
>   CLK_SCMI_?

sounds good.

I will wait a few more days to see if there are other comments, then
will post out next version.

Thanks,
Peng

>
>Brian
>
