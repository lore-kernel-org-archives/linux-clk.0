Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023132.outbound.protection.outlook.com [40.107.44.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E81439182B;
	Fri, 20 Mar 2026 10:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774003344; cv=fail; b=rbTlP7h9TbazPBdV0dDfoMdX5PwJT3mPeB/oxeL/WwV/oRAc1mUfo/6IGcfU++/rmoZ7oMmAfdRCeyQ0jox1ip+BQsEtYuyGgV3A6811GS2DxK9naY8UjSqM3YdbR2nrC/RlKHrAZVX7GkTUbeT1oNmsbOVi4IE0eeO7ieqs4bs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774003344; c=relaxed/simple;
	bh=AcuBKYbSuXz4CkzBmfQZcP7majfQ1hHrhSaQ9uncF18=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oTEaHivp40QVW9cIs9Kf3n8k+Pht+xXvdNye1JD1MjOCYbqgiNrS+UwoG/NQhp/n7LwicbDdnCnOLjqH95c31Xz9FG3dIiixDONiUMZFKD6RxyC/WdcKSZ8SbsAf9DW9K2yRlMgh1wRtkLPEWyjPhZwjFAYkCihdCpwT3oCSz+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=JWxHvtpv; arc=fail smtp.client-ip=40.107.44.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="JWxHvtpv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KVIyd4EgmgBTMPpKQ1IMftMSxxQd3p2MGxAhSFcuKoziSD/w2qa6fHru0C+ydMOB62rjTtsjpKa9+lLPqKv87a/GXB0+1nsxww2Yl1v2ifGKIXIPBUhxvJ1rGszmMkryVJTeNpJVh52SWK2+et8Bn0Cnk9jQw7JIvFBlIiYVzuZZkrBbllI2nYBCgXnKPsMOBDGDYuu/am5Ak7Vo8De2vL8JJwhpTDCJLkKHT9p3dwgkHhJN7NXTz5e+pOXZlmL5Wkc34Jnfqqvql7ThpuSjtDs+hbI2KRG0Lh1h+VYZ5PLd37WykaIqadXMZc1i2Y58CS9WEQMLiwvZc/qqWIP60A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z6XuWjcI3nmt56P4Z/OlHY2F06Tk6ESEFAsK10+/ZxY=;
 b=lFSPadsiba/YU2X2LTWRJfQPDOp8q7kLGb+cHhkSFQUzTLln0Bth10dKlA7ce0C6C9qZ/xsxwed+5l0Ogh4zRvlrPN/kE3K9aeMntSy7AcepHwpk6MUshS3fW3Kloi+hHQB4CUwmdsP/hK/sfk996EnLlnQ1/t2zJJQbzHOxh6hmOEobtx6Fd9SJLJbLpzrGB5yA4sUAxDuUVpd8CuuBGIxSxkXfzqcAqlJUX5BWnzZ0yeg8rXaYk4gOZvm2WW7XjbZcBmxjxalmWjRyn99X2+Kq5BwEr0nDhSd/qMmxYtQZapdFsL0/1HZjYdKetGN6Dg1UHghkfJeQGMfFS8tNyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z6XuWjcI3nmt56P4Z/OlHY2F06Tk6ESEFAsK10+/ZxY=;
 b=JWxHvtpvsd6pYnr/HIbBYcT51mtBSywvXNIsHsBL1XIXe/r7Mj4JBgqfVr+LPFFnG39B5Uv0zbcI99XRvGIaHyO0bXvIbRXo4YhGQbT6vlRTZ6UCE3jE+cwyfpEFmgyQ31Y0n6iuR5BJVeJKLkofK7gp6tJjRa/2BNaEhEJ4LgqaPARLgon3l3Ii2JQPK2PDc38XlgfVNZ5J2W8tMvqkGak2/0SJW7CsZGQfJVv+Cow9Q8ZLfIIPQKghNX2GHnj0esd9O2pOl1UK8eqB66uMWY9XVPfr8Lwkudb2o0P2nBAdKQ14M5sBrijXL/mPvGBpEvdPqE546jkqMBWOcgZu0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by SEYPR03MB9756.apcprd03.prod.outlook.com (2603:1096:101:304::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Fri, 20 Mar
 2026 10:42:19 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%5]) with mapi id 15.20.9723.019; Fri, 20 Mar 2026
 10:42:19 +0000
Message-ID: <86e2c106-1e58-4e1d-bdc0-ab1252f70489@amlogic.com>
Date: Fri, 20 Mar 2026 18:42:23 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/8] clk: amlogic: Add A5 clock peripherals controller
 driver
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Kevin Hilman
 <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260108-a5-clk-v5-0-9a69fc1ef00a@amlogic.com>
 <20260108-a5-clk-v5-5-9a69fc1ef00a@amlogic.com>
 <1jecnsr1eg.fsf@starbuckisacylon.baylibre.com>
 <ea7e209d-cd30-4d93-9deb-104aaf7c92eb@amlogic.com>
 <1jbjipviky.fsf@starbuckisacylon.baylibre.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <1jbjipviky.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0154.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::34) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|SEYPR03MB9756:EE_
X-MS-Office365-Filtering-Correlation-Id: 20c4b0a4-7485-4b85-404c-08de866d5c6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	p8mH9a8twS/csM4B/46hzPyfSnOsYao0NTrrqhRp+HAsXGIGqZ/YUmLeWyAPlAgJXNZFYAnwQz1uT+Ko0C1Yjf4nRF5LLkqTEn8PHOtoEltb7ClBiWpXw2zs8238qwpYqSU/XGShl6glWbvmnEAmu3sGuEGhqtsyoDQj2pfQ7IUUeOi3DRandOevdRO3LgSX1L0Lmtw5jIjflHrACd/Z/PY4drOP6MvO9cV4v+vqMNMeJcazeHD99+0kWw23Q6DOby8wfvbcNJQVP3I45D9TY5uKwhOPI4J5JOZensvwFtYh5gKzeZAHr5oPIJRxETNQuRB6whE2/F/2Q5Ktmj747LmcJncq8NEbmppMYyU0BmLKNH12PVpMSAj3e7gdYhjOLJtHEpSR2l934FH7imdZ6GfwJy+m7Cvu0dZdpJ/hhz9nEUg8d8DwBhGB36hkWD0klhIR1e0AkCo0x1QG98FAM7c+Y831TM3Nr5SsVvcvhE91cI96ohgM450uI9v1cJN3CF+Ojx3T0KRHDfBvGHWCywb0FeDrgGRqLdIGrqI5EbIvCsyXwsmyyVDT1/ak22K2wMHqsXoW+myGIWx2e++ScbKvHewhk2Kx7zL34+Va2rVS8j4voLjJD2l9sB/uoWvRxSIq0XklvVO2AcZXDYY+BOzr2AFAmch9aGnlrIhaIswQIOySTUUBQS804h0g0ZgEGEUJ/LC2h/g4xzMMKSCixa6aqQ2pmfJ8S/RmMPL6ZVkVerzZMqV3Tumjy1b1jHWf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmRsV2NNVXBETUE4RWpLcDFrNGIvci9oNUx5bmZvaG4yTkk2UzFVZUtNVUxU?=
 =?utf-8?B?eDIyZzhya1ZnUjJVOExBVnYyczVyaDN4bUVZVEVHZ3RiSUV3RXdLYUxQODJR?=
 =?utf-8?B?cjhFUWlEWVBkajlqV0NtWi90UDhmSEw5WlhVNzRLNXFDR2xsRnBxL2t0eHN3?=
 =?utf-8?B?TjdZZS9nOUdDSVVrcnVJYkwrMm45dHo5anQvWUVTTHFHUmJ0U2hzcnRFR0ls?=
 =?utf-8?B?eFFZWXIzUGx5S21mNnhtN1pUbzAxWDQremlid292SU54cE5WWGExODE4aXNU?=
 =?utf-8?B?U2dxaURteU9oSmMrSlJQL0JkVXMzc2VrWlY3RzF6Nno1bGpkOVl0dEtQN0ly?=
 =?utf-8?B?UE5JSEpsY2cvVytOT1QvclJGN2pLRjFFSmQyNWt6OWF1NFF4OFZFZEt2LzNp?=
 =?utf-8?B?Uk9GWGt4WWhrcGZ1dHhXc1RrQmlsaXBRWUlFaXVUWU1WNXFZcWNMd24vWDBN?=
 =?utf-8?B?T3dBUUw2c0krdXlNemdrMWNBdVdDNU9FZW1sakdlQ3k1azFWc2hNTkoyT3lX?=
 =?utf-8?B?aUVLcU9DZllHYVlFV1dIek9ERW9WWnBNZ2ZzWFBpL2o2ZWJ1NzYzZ004MklF?=
 =?utf-8?B?NGNQdFBTM2VaOXg2M0lwYWV1QkRXaGh6WGZwRFRadDBrcFRGUmVYV2hsK0Mr?=
 =?utf-8?B?VFdIK0lXNWx0MmxudTE0ZUpqMTAvSDlLU0RWRFlTS09LamREcTFBN3orejBq?=
 =?utf-8?B?LzQ0NUpMZ2laS2hIb0M3Njhuc21IWHZleHRxaWxlSmJIUjQwaXNjRVVVUVRD?=
 =?utf-8?B?ZjhqZGNqZU1kUFB6djQ2dk1JRzM3Y2tSKzBpbmYvRTZaT1BEMlhLeXgrN3M5?=
 =?utf-8?B?anVZMHJRKzN1ZENUSTdIVmZLUG5Oczk4Z2tvemlCVVpVQm5iRmJ6bHVyeUdW?=
 =?utf-8?B?UTdhSDlKd3d2OGt3WUNTREdyWFRUZW5yK1FyT1liUlVpYUV3K3gvOEFEeUxR?=
 =?utf-8?B?clhBYmV3YWNwbEtRV2VYN3ozWksvbUNyQ3JNOEp0VXd6Vk1LeXBqbFZMMUw0?=
 =?utf-8?B?Z2Y5TGNSODlYMVg0d2dKZ1pBTTdXS3BsV3pCN1JROERjTGxyWnJmdGlWM284?=
 =?utf-8?B?ZUZaOUVmUjRNQXdlY2hYT2o4elI3WFBqY1VPWGpyQUU3MDFvaktqdHZTWC9a?=
 =?utf-8?B?OWdrbklzYUxKY1NKUzFWUW9sSCtjYVl2VzJwZ3RNL1JVN1ZMNStGSmlqNGVG?=
 =?utf-8?B?WjQ4RUgyRUh6bDZwSnBTRFhXOEJ0djdPQytFV0UwOTNrQW9XZTNWMlBkakgz?=
 =?utf-8?B?Mm05dk5nQmJUMTEyeTN4dk1WYUZWSTd0NG0wd056UFNXN2FSQlptVXVEdDlz?=
 =?utf-8?B?ZjFzUW8zTHZ3aDltK1pRb0dIRTErNWc2K1RpUnkvRHlKN3hHM2R2c2NaRXNB?=
 =?utf-8?B?d3dlSHlPN0VBYkc1TitEcFNwZmRvQmVsVTdNTjZtZ0ZGU2QwQmdocWM5RlNt?=
 =?utf-8?B?VHBoa3dEM1lnd3gxSmJvMzROWGhjcnN3TWFKOEtTcEs5WWZpb051SzJaT3Fp?=
 =?utf-8?B?SGUvQlU2YlUzS0ZFd0VqdldZbEZTQVlSOG9YdHF1NUJwUlo5M080RkkzWlIv?=
 =?utf-8?B?L3A4aVJhcUIwODdLRC9kT2hrNVNSemF0QVRoYytDR3VnelRtc05DcGxHKzFq?=
 =?utf-8?B?enA0RE02Qm9QMFZza1FOcmMwdHJsaGlDMVdqUEVvaU5ia0V4ZGNjOTZzb2hm?=
 =?utf-8?B?Wk5Ta0VuZUZrelFLMTkxQkQ5SVIzalFVS3BNUGlPM2dSeXBWV0JraWEzZHRF?=
 =?utf-8?B?VEM0N1RCbUtNaEJGcGZqbElTMXY5V2tLK0JLRlRVREcvbzFUdHo5dlp1YitY?=
 =?utf-8?B?UTNUMFUrUnJINXZETlZoSWYySjVrYzVWeTBIckVibGE0cDRtcko3VVBxR3Y2?=
 =?utf-8?B?QUFETXd6akEvZWxYN0tXRGNjeFJIUGtPOTVsWXJTN01uZjdSK1VGQ2diN2tW?=
 =?utf-8?B?Y1RWRmFpQmxFSWYzZC84bjJoeCtWZjNpR0lobWNQTTFUZGVXV3h3eU5jMTZV?=
 =?utf-8?B?RW02SXdLYkgyY01HcWV0UE9QSnNBdjRET0FaYzNyOHI1eGVsVisrbVh1UTRQ?=
 =?utf-8?B?c1JsWmVFMVhEQkRtZ3d6MkNKdHpyL3dTT082RVdFb2pqNjNFSkFxY0V1cmlW?=
 =?utf-8?B?TXYzNk9GMHgxaEtHZkpNcEVJcmR2VmtqanFOQU9hMnM3MFBkeTlSeDJVeUMy?=
 =?utf-8?B?NWk0SDJSSkY4a1pKamQ4QXJjSUhEZTQxUnliZDV3aGpxM1dNYXhxWGNTNjdu?=
 =?utf-8?B?R3ZzK2ZkOGh6ZjBjV0hEVWZLZWJKRVBJWnJNaTE0bk1Ybk5seTdMcWRwWVF2?=
 =?utf-8?B?ZndNZklBbDVHNkFydkUxbzJtSW9pUlhIYndSbGp3YUdLYkxtcDg0QT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20c4b0a4-7485-4b85-404c-08de866d5c6b
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 10:42:19.4588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xkHo5XNznPg9+sFo2ILbA2/L7UyA8iCtW1iASQRAwctE8ccZnKLvtrbD0H1ejYlYw+W7k4JuTXvU+LHEvqo8DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB9756

Hi Jerome,


>>>> +#define A5_COMP_SEL(_name, _reg, _shift, _mask, _pdata, _table) \
>>>> +     MESON_COMP_SEL(a5_, _name, _reg, _shift, _mask, _pdata, _table, 0, 0)
>>>> +
>>>> +#define A5_COMP_DIV(_name, _reg, _shift, _width) \
>>>> +     MESON_COMP_DIV(a5_, _name, _reg, _shift, _width, 0, CLK_SET_RATE_PARENT)
>>>> +
>>>> +#define A5_COMP_GATE(_name, _reg, _bit, _iflags) \
>>>> +     MESON_COMP_GATE(a5_, _name, _reg, _bit, CLK_SET_RATE_PARENT | (_iflags))
>>>> +
>>> At the top. like C3 and T7
>>
>> Except for A5_COMP_SEL, which differs slightly from T7 due to the
>> additional "_table" parameter, the other macros are consistent with T7.
>>
>> I also asked for your feedback on this in V4 and received your
>> confirmation. Is there anything here that still needs to be updated?
> 
> Reviewing these long patches takes time. I tend to stop reviewing when I
> noticed some feedback was ignored, especially when it is recurrent
> problem. I've told you that already. It is up to you to make sure you are
> not missing anything before re-submitting if you don't want to waste time.
> 

It has been nearly two months since I sent out the V6 version [1], and I 
haven't received your feedback. I'm not sure whether this is because you 
still have concerns about this part of the change?

This approach was already confirmed by you in V4 [2], and I also 
explained it there. There has been no change to this part in V6 compared 
to V5.

This email is not intended to rush you, but just to confirm. If there 
are no objections, please feel free to ignore this message. If you do 
have any concerns, please let me know.

[1] 
https://lore.kernel.org/all/20260123-a5-clk-v6-0-6d3bbf0ec1ea@amlogic.com/
[2] 
https://lore.kernel.org/all/1jldice808.fsf@starbuckisacylon.baylibre.com/

>>
>> [...]
> 
> --
> Jerome

