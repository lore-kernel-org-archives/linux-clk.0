Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2136.outbound.protection.outlook.com [40.107.117.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4D91F8AC1;
	Wed,  8 Jan 2025 09:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736327429; cv=fail; b=IbLK4plS/58Zg71fBDNyJ/NghxS3uqZNIuduHy0K4hKX1CnS0MkOly/CQ1mxk3hV2LWVxy0cJ9ozSHqhOH0jNQclL6lLyZJhUG9ptrH8R3yQ31ZJh9ZbG9iBdeHcm5Lrs/MPwdMYNuioEc3NCw8HbIHDFSrcMou7+4dAZns8uUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736327429; c=relaxed/simple;
	bh=CmTOE1Xbv6vQJkOnJc+KLHCt+7+MqXtfQK0jKP3/oHQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VaQPOf/loalZasB7L7RuO2iTpEKOWmMdfE+cJsMP5kahE0NLUh0Io1layvuT8vb/nnS5qITdPZX9Q1u1o9QeQ7hcZPCRkSmNOJLnW2gtW13+SIETMXTARSZmPUZqZyRCHrOTeswh+oeIMIrLM2tJQ0NDCSiHNJemG6q4oYfvYQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=rLMJuTbi; arc=fail smtp.client-ip=40.107.117.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="rLMJuTbi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uEuJfrIES5aK2HW5GKwqePD64TEm7JT+0uP3WCUI9aF4o3ktx27V3q5ufABywAJiPgSO+AWdckg/Mv83UGRWEwK52UNrUla48TKt2tIKKf6Oxy39VYv+Pt1L58f2uBfrD4qEfC9XQKa8eVu1xSi1mR18rVY9jbKFhSpZ/0RA9zQjm7pg5KG8orVIz22LhkqzoMtcMsQy2V0VVNLkFPZkUlG0GgHAoFNVq8CVp0Py7GT76DDnxZjcVCHQkqthQfTt5VuQGUvkDNe7H+74944IR1jQFY3Gd/9zChnitttC9Ad2AMcHKT+4xfBr3T/+AtFERlkLtsu2IRHDsJ667eKkNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QkQ+aXPns5LC0BJ6ErZSQKVf0f0YBvb/ccItL73NQp4=;
 b=I52YAJ1fhuHw10AKcGvYBHUSS7yLuBwK0OCstzYH9fZ74IzF1Fyb7JzwUGv265VTInVJ5USw2o21bgsLTyCXBQcXqhhIRyOGtmohUYLbpedKvMWOfZnpuRsER9xiCWez1yOV11ZPPBucwWSKUt/lvh2CdPm1DI1C04RruAus5wV8yskTTH0XkaP8/1apcqfJ24OnWs0G575IzSM6kepkUk4D4kcfyDCjUqY47lm0xkHr7vJ5hVNHGUoT4j+cmD1NhNHgQJBD2TuaYrd23q1eXtz1pNZn902pD7oCk8gFh8NURtUlp4IDg0UoyMmwZHed/Tc13PuyVTbOG7/h8NvD/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QkQ+aXPns5LC0BJ6ErZSQKVf0f0YBvb/ccItL73NQp4=;
 b=rLMJuTbi71WOmjKz+UQZWYstz/P/+Sp9y0Xix6IAH/2cOPFjsHKXg3Tq0QkAC1M+j2J3f+4vpWIfBFSpbbfc+QeeZIXvfyGu9t6zUxkSiS2UFumGNZv9rsFNP0/SDY2NT+YWwdxq9R4ffYz7OUYUVtRkUiDSApEJmyMerZpKCfdLtOyX3zmeHTVd5OuvkAPAN/g01yYKW58+VJBKKJWbi4EOKxy2f37le5teID7t9O/9sO8u3Eui4q31Na3pF+N0DjwNGm/2iL25PPeNgbqQDeYg+IjDxEIs+UmHAfcu94lHj8dE3t5p+vyCX+TtqugmBDX7HC6A027d24HGRR1g7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by SEZPR03MB7267.apcprd03.prod.outlook.com (2603:1096:101:73::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Wed, 8 Jan
 2025 09:10:20 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::a311:33f6:519d:73bf]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::a311:33f6:519d:73bf%6]) with mapi id 15.20.8335.010; Wed, 8 Jan 2025
 09:10:20 +0000
Message-ID: <9f5f2c5f-2a32-44a4-add0-4a6205635884@amlogic.com>
Date: Wed, 8 Jan 2025 17:10:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: clock: add Amlogic T7 PLL clock
 controller
To: Rob Herring <robh@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>,
 devicetree <devicetree@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20241231060047.2298871-1-jian.hu@amlogic.com>
 <20241231060047.2298871-2-jian.hu@amlogic.com>
 <20250103185535.GA2552898-robh@kernel.org>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <20250103185535.GA2552898-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0217.apcprd06.prod.outlook.com
 (2603:1096:4:68::25) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|SEZPR03MB7267:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dbac94f-d349-4247-929f-08dd2fc44691
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K1RzMEtHalRGUGxvSkFZT1NHYXhUdHp5bFdvMGdFZFM5RTNYSllPUmhoTjZC?=
 =?utf-8?B?TGNDeWQ2ZmxSVjBCTVdleUpzL1NyNnlOVlJ4SjhRYlYyQ3ZueVphS2FLSE1Z?=
 =?utf-8?B?K2RKS3pIWVUvdUFBNmQySG1JcFJBa2R3MGwyZnBRWWk2aVpyaDF2b2grQldX?=
 =?utf-8?B?TkROaUZzT2xHc0JvQXpnOTJJQVp4aDY4WG5jU1IvcEsvR2h5SGR6UXcvdVVo?=
 =?utf-8?B?YUNmMERTUFZhM2N6YjNRU0NLUjFocitUbWlYTXZENmZQekpNNWxHejBMUXhH?=
 =?utf-8?B?OU9aTzNIMXlCQlN5QUhJN010c0JBUkNFNXhJUUVXVXVPTmxYY3grNk5tcnRO?=
 =?utf-8?B?bUpSM1Uycll4aWxZdTUxMDRGaVBLWkNtV2RxMk1kNllaVTBqVFkyclhqUjY0?=
 =?utf-8?B?ZUwreW1ZeklUdUdNQXRHSjJTZkRpUXlzODZrcWZzbGQ1QmNxY1NnSjN2RHda?=
 =?utf-8?B?c00xYVJtSnNiYmJERUcvTDBQUHBaWmJrL3JOcDJEekp3b3l4NFpUTWgwN1J1?=
 =?utf-8?B?eEZ5aC9BTGp5TjAzRGhoN3VpTlhjTWZqL2xNRTU1U253ZHpEUmxJMzhzUUV5?=
 =?utf-8?B?Q0dKVm5rVVRLQXRxWS9jNkEzckJqVy9KRnlrRno1TXlONGxTQldPdXovMWRO?=
 =?utf-8?B?UzJHbGJCbGo0RWZaUFdrNnJIL1RuUThrOVlodUpDbkJ6Tm5nVmMxd2xYNnpa?=
 =?utf-8?B?TlpuS2NZQ2tJYlV6RWQ2OHN1NE1WNWlGZ3hpVldoK2F2SXN1ZXZMNi81eGl6?=
 =?utf-8?B?VG9zVFAyODRQNjB3b1NjWGpCT1kvTVBSbC96TWl6R2M0cURJR201cEN5eVk5?=
 =?utf-8?B?K201Q2VZMVJEbzVaVUkzMnZpZnJqZjRWYWlUNHZWTngvaDZvWnBjeWxXK21p?=
 =?utf-8?B?dW1FU3loU1BiY3craVZpYW9pZFlFckV4QXRILzZzaUI0djNRQnI5SzdKcHkw?=
 =?utf-8?B?ZDZKczN5QVp4ZHBONG5QK1ZPMTJTZHdjb1JDMkxYVTFFcDgwcEdCSFZBbTdW?=
 =?utf-8?B?cjRETnlLNWpKZE1mRFowalp4a3hPRklBNWdQaDNsZVZZcEhGV2VmMHMvcmdm?=
 =?utf-8?B?eCtWRzF4Rm53UHkwUGpKOUxBTGlOTmY3L21UWDFLemI0SjlTOVk4a2ZnVmhX?=
 =?utf-8?B?WHVHbHorMmNqelRheUpueVdKNVE2S250TXpHa3hRTUVOZDBzekZlMGQ0dk9w?=
 =?utf-8?B?MHJWOElnU3BnWXJpaW9iNGVWRGQyRzhLUHZlMmZxRThaWHdHQ1o2Y0xKU0lS?=
 =?utf-8?B?QzZldmdtbnZmclgwZkNsdHNGSmtSbE9tL20yTVFocHZSbUZUT3l4OUQ5eEt0?=
 =?utf-8?B?R0ZaNm9obWlsOHJDQVBNTURVU3FOV1B0eFJvVmR4YzlqeXIxTGp5VHBhK05p?=
 =?utf-8?B?NGxzbG5vdURZdE1yNG5Oemw4K2t1NzVRT0Fsd2gxVk13VlNTTXJSN3pXdno4?=
 =?utf-8?B?VDMzRFo1NXVXRk9RR0IrQ0d4NjdEZnBNTUZNNGlBZmpUMlJiRUR5S3cxOFgr?=
 =?utf-8?B?OWMxZVBJQ3k5Z3JIdDU1VWlpOUg3TTE0RnlYcll1TkpMWmxmWi9sWE9GTWp0?=
 =?utf-8?B?NEJNQXpXc0VKWEc3VjNmNWNpVzVIZFJkV2s4UnNodldWaWVxL0tySUViN3JN?=
 =?utf-8?B?ZlFMVU1vOEM3ZytkOW9BMHJ5VktleUxsWWZuN1lXUTBpdTFPWUJGNU02UnNO?=
 =?utf-8?B?RHlXL2YzQVl3OXdnaGwrK1FTNmo4dnJKYzRHb2VzQlprQ2tVcDZjU0R3NHJH?=
 =?utf-8?B?L0lEQkFnU1YxbUV2QWVMMmlaZkNwenNnVWZ5SjE3Q0VMTk5TQm5JYWJtOXJC?=
 =?utf-8?B?Tlg3U0Q2NWROTnhtSHdVdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjdlS21YaGduUWFqK2sxTThHdXZNR1JnSW5xem4vMUY5aUZ2TldKa1VTa0JN?=
 =?utf-8?B?dzhndVNhUmlnKzVQM2dYTEVBWXJ2N3ZyRGx6eEZTK2dab1lxelJ5NFViRHpk?=
 =?utf-8?B?VkNCb0JhVFltdEE5NDFMNUpTTFMyei9LbUZqSE1vajNkSVVpbFc0QU1HSG5C?=
 =?utf-8?B?elA2blVmR3lyVEhJRU1EVVZJcU90MWtZTnBmOWNrR3Jmbmc0NkRKdVpiMjF0?=
 =?utf-8?B?QS9rK0VPZTFhS0hNMkd5bnJmc0REVERvN3FpOFJqUmwyN1NMa3JZTWg0ZldB?=
 =?utf-8?B?R3ZkbGlqTEV3TlNvbUx4aUdJbTlSOXQrNjNhTzJEbVlqdVUxcHdMeW5jQkNX?=
 =?utf-8?B?R3c3VDU2aWVvSE9hYzlPYmxMSWZZSlpDSEJ1aDE2TmMzcTVVZHY4NzNuUXpj?=
 =?utf-8?B?dWJBYWFwOHREeDQvVk5PdWNDL0c3czRib1FMTm51M0wvZE5DWEM4MlRzVVky?=
 =?utf-8?B?SndtZ3RTenNHZFlmMGF4eEI4SjdUUDE0aUd2SzdpdWN6ZDBjVFhicHRxSi8x?=
 =?utf-8?B?dXpwRkFDNnhlZ1AxS1BDeG9DcExZWTN2Y0pYWDE4VnluSzFGbk9lSlZTZGF2?=
 =?utf-8?B?N0gyRHNDQTNJSGtWT1NDNmdidTdaMlVvdVFPYVV6cnQzMTVRaXZOaHduUStu?=
 =?utf-8?B?VmxPdGEyU2RwT2dkZy9oL0UwbmZOM2FibktWSWlacGhCWWFVNEo0bU5IYjAw?=
 =?utf-8?B?L3dDdnUzOXNCV1FydXR6UTJ6MFBSdDdQNHpMd2h2NmQxUjBvM0VzSDdwVU5x?=
 =?utf-8?B?NzVtallwZ0haUXVtRG9WUWdPcHpZZ3MvdG1zejVTOGRpMWE0Y0FyOTcvZDNE?=
 =?utf-8?B?VWJMZEQ3d0ZKVnJ5bUJ1T3VGcEQ4NWROclk5aHYvcnJFUHI0b1ZJcDROSnpo?=
 =?utf-8?B?RGlpYzZmbDA5bFJTVjRCVGN5UWZ5WFZjWmtNbVdtSWw4aklEZ1RQcENqUmow?=
 =?utf-8?B?a3YwdjJHNEs3NVF3dkRmeVJOV3B6Uks1VDFQUkRVaGdwUkpEV2J3MEUvUWtG?=
 =?utf-8?B?Wk5OK3VjS3Q3aDl0L0JFdW1LL2NIQW44UlQzZW1KOGZUVzhUTzEvRk95RUZz?=
 =?utf-8?B?ZEl5TDNBK0RsMXdvZnFtUmord0JGNTZLb3JGL2VkK1FHV2tRRmlBakp2OGtv?=
 =?utf-8?B?eURaQkh6TmNhR3U0WENZNWJ4NUhHNHBYRmpuRFNYdWw5ZXoyZnBTWUhhc3pL?=
 =?utf-8?B?NHJqQXlMeXA0NnJGM012bWxUaFZSOGgrelR3SUlEZmJBNWFSS0hsVzd3Ulhw?=
 =?utf-8?B?UDFIcFVkK3B4MWlGMGhRSGc0bVREOUZ4YVZTbnM3cE1vZWtSdUU1R2dIU3Nz?=
 =?utf-8?B?RFNzeFB4YmF0bGUyNEU2NnJHRXp0eFlIa3dwWHFFTkU4V3FRMlEwSWNrVU5H?=
 =?utf-8?B?bFdHbDRTa0dFV3VIMWh2cGNMaXpaM2JiWnRrNXdRZko5VTh1SjFNUktXTlFF?=
 =?utf-8?B?ME5Ed2tHQXY5SVlBYmdQOFNTUUpzNUxrdHd0dTJVeE1oYjdncUYvYWRoTUg3?=
 =?utf-8?B?cGZrVWZ5OVNxSllVcHpRUWltUFNxNDc0SXdIcm83ZEltdVJMNTV3OWg4OEFV?=
 =?utf-8?B?NnVBYktJV3B2SllsclppNk54dStORkpuS2E4d3d3TFhLUFRWNkh1emlrUDNP?=
 =?utf-8?B?OG1PckY1QXI3V3k1M0ZhNFVTWE0vdnUrSWV2VWVGeHBqaXJHaXZlaHdDVlN6?=
 =?utf-8?B?cDZOVGxoYWk4Z2hZRmtqVUlrMnNla1RZeGJDSjhYQ1ZRUTJiWEZ6NUZhY2cz?=
 =?utf-8?B?a0FWT1dLSUFyOGxiNHBxR0dJOFVyZTRUS0xJbktKNGNTQlMwdEtZdHQzTXo3?=
 =?utf-8?B?eVNkTit5YWR5LytCNUdhOWVWVzRRc0Rud0ozRDJGN0JKOEFOYXNJMTd2SmhU?=
 =?utf-8?B?Qi8xeWRUVkpmRW1yeFk2TEU3RVBvVk4ySHhINUltdHBjS0ZZZUc2OWQzNXJ3?=
 =?utf-8?B?eWhMMGc5anNlcE9pUjFoVEgrcHp6K3BYOHc1KzZ0MkF4TWNOUmRuc3hzLzdo?=
 =?utf-8?B?Uk9IK1hBUm9SWStmUGNoUytvR0laRHlxc2d2cVhwNnJZaTBlQlFSU2lObk1L?=
 =?utf-8?B?bEpldXQ1bmRXak9xWG5ieVl1cTMvQ0ZXQTc0dTYyY3I1QkQ5MkpoYzZ1c1J1?=
 =?utf-8?Q?WadTd9cnXeoOf0gFrki3wR2Xz?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dbac94f-d349-4247-929f-08dd2fc44691
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 09:10:20.1922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ox0A6UxyqnR+EHWn18lBs0DWPfMVLoFG2cE8TskxwuEnbs3HgMlsb5/IHZtuMxE/8pSry5Fr176RzRaW7cDAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7267

Hi, Rob

Thanks for your review.

On 2025/1/4 2:55, Rob Herring wrote:
> [ EXTERNAL EMAIL ]
>
> On Tue, Dec 31, 2024 at 02:00:43PM +0800, Jian Hu wrote:
>> Add DT bindings for the PLL clock controller of the Amlogic T7 SoC family.
>>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> ---
>>   .../bindings/clock/amlogic,t7-pll-clkc.yaml   | 115 ++++++++++++++++++
>>   .../dt-bindings/clock/amlogic,t7-pll-clkc.h   |  57 +++++++++
>>   2 files changed, 172 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
>>   create mode 100644 include/dt-bindings/clock/amlogic,t7-pll-clkc.h
>>
>> diff --git a/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
>> new file mode 100644
>> index 000000000000..f90e6021d298
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
>> @@ -0,0 +1,115 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +# Copyright (C) 2024 Amlogic, Inc. All rights reserved
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/amlogic,t7-pll-clkc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Amlogic T7 PLL Clock Control Controller
>> +
>> +maintainers:
>> +  - Neil Armstrong <neil.armstrong@linaro.org>
>> +  - Jerome Brunet <jbrunet@baylibre.com>
>> +  - Jian Hu <jian.hu@amlogic.com>
>> +  - Xianwei Zhao <xianwei.zhao@amlogic.com>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - amlogic,t7-pll-gp0
>> +      - amlogic,t7-pll-gp1
>> +      - amlogic,t7-pll-hifi
>> +      - amlogic,t7-pll-pcie
>> +      - amlogic,t7-mpll
>> +      - amlogic,t7-pll-hdmi
>> +      - amlogic,t7-pll-mclk
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  '#clock-cells':
>> +    const: 1
>> +
>> +  clocks:
>> +    minItems: 1
>> +    maxItems: 3
>> +
>> +  clock-names:
>> +    minItems: 1
>> +    maxItems: 3
>> +
>> +required:
>> +  - compatible
>> +  - '#clock-cells'
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - amlogic,t7-pll-gp0
>> +              - amlogic,t7-pll-gp1
>> +              - amlogic,t7-pll-hifi
>> +              - amlogic,t7-pll-pcie
>> +              - amlogic,t7-mpll
>> +              - amlogic,t7-pll-hdmi
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: pll input oscillator gate
>> +
>> +        clock-names:
>> +          items:
>> +            - const: input
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - amlogic,t7-pll-mclk
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: mclk pll input oscillator gate
>> +            - description: 24M oscillator input clock source for mclk_sel_0
>> +            - description: fix 50Mhz input clock source for mclk_sel_0
>> +
>> +        clock-names:
>> +          items:
>> +            - const: input
>> +            - const: mclk_in0
>> +            - const: mclk_in1
> Define the names and descriptions at the top level. Then here just say
> 'minItems: 3'


ok , I will refer to 
Documentation/devicetree/bindings/clock/baikal,bt1-ccu-div.yaml and 
update T7 PLL yaml for it.

>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    apb {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        gp0:clock-controller@8080 {
> Drop unused labels.


ok, I will remove the two labels in v2 patch.

>
>> +            compatible = "amlogic,t7-pll-gp0";
>> +            reg = <0 0x8080 0 0x20>;
>> +            clocks = <&scmi_clk 2>;
>> +            clock-names = "input";
>> +            #clock-cells = <1>;
>> +        };
>> +
>> +        mclk:clock-controller@8300 {
>> +            compatible = "amlogic,t7-pll-mclk";
>> +            reg = <0 0x8300 0 0x18>;
>> +            clocks = <&scmi_clk 2>,
>> +                     <&xtal>,
>> +                     <&scmi_clk 31>;
>> +            clock-names = "input", "mclk_in0", "mclk_in1";
>> +            #clock-cells = <1>;
>> +        };
>> +    };
>> --
>> 2.47.1
>>
