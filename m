Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022093.outbound.protection.outlook.com [52.101.126.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA61934F275;
	Fri, 16 Jan 2026 09:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768556008; cv=fail; b=Hon6FcXElN1+T17Dp29fPPF+1XPdSX7rRBSGXutzWo09JFD+smHHufrEFCEB4ZOTgExWhgwZG8PupETzR+jVwjnxT2DmgH9bOxwcpd7XHVlfAUwYxI4rt7kWIpW/yarzmachFfyNrs1vqy/HPMKZtbEL0JMDpDqZHwfE875UN9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768556008; c=relaxed/simple;
	bh=7wALSyZNBZh4cl8wJkvpJFfoSkouhIMbOd+8Pm8fr48=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ibz2UDN/aRDOBpi6JskNyh6vNio7NxwE75VVcbqMrg4LPsSTrAnS82d7+BchnQeYXHQa2XXtJw2dCxK/NkTJZUeVl3p91UpClQNNruvd3KgpfWuee19qLXv4y9AgIe8Uj5xcV1waicHyhHgM1296OypcyaVqSoC/iqI9LA0ZFT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=qzErPo/c; arc=fail smtp.client-ip=52.101.126.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="qzErPo/c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PgxOEjP7eiVjZ0O833i9bOigyeDfrE9Qjly6VrKa3JhsDRGqGcaYEMSYpIt/fs4LXH8mymw1Dm+tUjY/C52QN/ZXg4+dRe7syyhgPZV+FPIKhd7QExW94MhaCHMOQyYIRvxPdO2PlUv9fvecu+eOIi2l/D2k/eO09zqhjIpRUcev/S7WqhypeamwAepVr+6DdPIz7W4obqp8En+jV7thvjtSWo7otXdYLVrKtVvhPPfuIHAeGF0PearxztpzTkM/Vl3yz6oA5MvF9Tm46dkA4FS8GQvtAZZWHE4QZRdBCVhSZMxnd21stoxqdxOcVFsoVzgBQDHhnklRBYImBOD4Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tbIXW70Il/wYuy+wwQJq/ZLKfXzZgLhDXVzuABpPfcA=;
 b=v2zXIBYtbo3alZaFHq5Vr5nTktgQ9xlwYxlTrKYalDbshXrCglkiN1M8mO971HBh4+fQQk+0v1Qlqn2i4ZxOXRDsRq2HcZjQViYrJs5zfrbCgucVPy9ueS9bG1zsqLT6SyxXhFE2kPOi/Hfnnz/k22LGZPtPT2l4w72JRQKfW6vKqUhcGuGfNUxOp1QlXXPF3f6f/VGgVBhEyDxLreFkjiZJyeaJUX3uv0fqkwKl9tBsOWLt6HbSY2ZPAdGImQ3Oc9ocHm36Pfr8k8DMnUfb28bFgDo7JZ2wYm9ldvN1eYUQ4TzCTWcwPUm5OfBsVjqvo2IP60wWGpRlBWmzq8BGFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tbIXW70Il/wYuy+wwQJq/ZLKfXzZgLhDXVzuABpPfcA=;
 b=qzErPo/ce1TyzpmVSDoXaENkTqD3T+GvzBoZSts96EizFUcPuMP6wUDmetnkAWWThNG8ZTIbwlekuoOjGFbvhqMvPonVKQwq4OZLAZHZPCsEeRlz7JrQLlTg0pnreGpRqZftvVhs42LHy65VyDl8gj2dxZ2h3oz1xqSb/pV+r0Qavx0/Ha4dRpuLTlWV+vna1sZUtPjks51EhdwKVehjePM4d8hLgrDUajBjWQMvb3qOy0ffhilfCDP6x9M3YeNPVL/dmBFrPNTk0NiqlywaGUMbphqmjpxlEdtkNtDn1nOLf5Dk2O8pUqkjfPN0joeKd5VBGUPlp1eGh4bcvb+Vfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by TYZPR03MB8103.apcprd03.prod.outlook.com (2603:1096:400:45d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Fri, 16 Jan
 2026 09:33:23 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%5]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 09:33:23 +0000
Message-ID: <6a66f0f8-3fbf-46b7-9370-5768b1acd96b@amlogic.com>
Date: Fri, 16 Jan 2026 17:32:39 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: Ensure correct consumer's rate boundaries
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260109-fix_error_setting_clk_rate_range-v1-1-bae0b40e870f@amlogic.com>
 <aWhDLNFtaoU7A-AN@redhat.com>
 <fe437139-4c33-489f-90f9-44e3dd3b0f9e@amlogic.com>
 <aWjlMrlCEbprgKg5@redhat.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <aWjlMrlCEbprgKg5@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR06CA0226.apcprd06.prod.outlook.com
 (2603:1096:4:68::34) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|TYZPR03MB8103:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d0f654c-b943-40ea-038a-08de54e24b3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dUlyRDEzVGtWMEM2c3dMaWRPK0RTUzgwMS9xZkZIcVU5Sy9INlJoa0g0d3I5?=
 =?utf-8?B?TXpQRENsVXlyMWpHZ1QzV2JOTjYvNDRxd2w0QlppM2FQdUVQRFBYcWQrZmlz?=
 =?utf-8?B?YW1XYVg2LzBzTldmSFMzdzNaa3FrbEhBVGNPc3FSM1gxdUh2VXB4b04xTEI5?=
 =?utf-8?B?am1MNUdEQlV4ZHVMd1RJNDVuQlpYYXk4QUJmM1dYdVc2V1VzdEthaW5iUkl2?=
 =?utf-8?B?MWRoQm91S1BGemRTbXdFR3Y5UTVWUkErMkErSWRwODI3Y05vVno3QWNDTmM1?=
 =?utf-8?B?WUl3d0RzT1N5UW53Q3NNT2ppR2xjUmc4K2EwOWJEVVhNTDFWUUdLRXZLS1h0?=
 =?utf-8?B?YmZFMFo3RCszZGMzelF3d3QvV2pBcWIzc0pOQS8raHdFVDRVY2c4K2w3TFh5?=
 =?utf-8?B?bFRwcGZJbk5qamJJUStWeUpXSFNCdFA5WUZ6bGlKaE5wdm96WVJKU2hvY256?=
 =?utf-8?B?My8ySGN6ajBpL2hmOUpCZ0NiajdvSk5EN25CUFF5eTRzTHlHakZiSEh3a2Yz?=
 =?utf-8?B?VllacHRzVkJ1OEsxNmp5N2g3WG1DNTBzVkM0TGpQQ2NmUXJhMTFZbXlabDZY?=
 =?utf-8?B?d3loWXprL1czRUhYV1MvWmlUc1I1Q1FqRjRVRzlvUVNqZ3BrVDZyay9wdnpF?=
 =?utf-8?B?U1hVMmdURGtlSUI3L2JIOTRSMjdQNDk4Q1ZOWUhialhtV0pHRG9IZzB0Q3RK?=
 =?utf-8?B?b2J4ckpvc1JyS2FqMkFoWFlpYTNod2NycHF4b3oyWC9keEl3clM5S2hRamlp?=
 =?utf-8?B?MUhXYTMwQUlKWEFua3ErZGlUV2F0MUIwSWVDZmZ0RGM1cUJJaFdLaEtHY29V?=
 =?utf-8?B?dGNWRytmQURRZGdSelp1L0d3RmMyc0ExSXRXZzAvYmsxS3VxakVBbjdCM1B2?=
 =?utf-8?B?VjFnSFJaNHI5UVl5Q2I2czBtTGZqRzVoZzdzelZPYUxwcUZkUEQySldmNXR6?=
 =?utf-8?B?WUdUdWFQMXY1NW9pUnBUZmJPeWdjYjZFWHE1NjNPV1R2SWZZKzNhYkdldERk?=
 =?utf-8?B?VlY0N0NwRTUraU12NE5RcW1mbm54dkdaOUsvZGUzSUtWTlBneHZyV0R2YmZ0?=
 =?utf-8?B?QmFsMUpkZHpzOE9icHdzNDV4MEhsVUZlaUNlOG13YzBobS9qZm1nQitnd0VY?=
 =?utf-8?B?ZXQ0Nm5RYjJPU3h0N3EwYTVZTWQ1MS8wMmIzMkdiTjQzUWdXdHlRSzdiSlNP?=
 =?utf-8?B?R3pKNzBwZ3BKZGJDMWRmREo1MGFxYjZpRUxxV2s2SG5HT0ZHeENZN1I0MTNz?=
 =?utf-8?B?UXlDdlZaY1Q2RXBraTh0NWI3TDJLcGRMWFdEZUtZYmxsZEJqUGs4RDdnM2R5?=
 =?utf-8?B?RDUzSENUME1CanlGVzdXTUd2SzNab0U4ZUJmdW0xckJsNTdIMk9ZK3kwOUhK?=
 =?utf-8?B?N0NuY3VFVjdLaWVlS21BaVBSRXpIcVhmbFFHRFVxbWtxZU40Q0xPMEpuMWhM?=
 =?utf-8?B?T21MUjVPYjBkZWZDWEVDU29mNUE3dHo5TnM1VTQwU1Zpb0p2VlNUQ29qTksv?=
 =?utf-8?B?V3FSMmx5em5MQi9qRWlnQmsxTzUrSXVuZ2V1YUtjUCthcTk5OVN6d0h3Z3FV?=
 =?utf-8?B?dXFJOWV3V1IxbDBkMmFZbndLRkhieW8rcjRhbEFwOU1hdVhCcFpUY2pTUjdn?=
 =?utf-8?B?QlAzb0pJaUwwRnhJbVN3Y2J6dy9Oc3A5RDlaRmFIdEZnVXpKZ2FheU1td2Vn?=
 =?utf-8?B?RENrVlc5UFVzcU1TS3RXMHREbGdJdm1LTlUyb2xRa0cxUDVzc3ZCZmp3OWpF?=
 =?utf-8?B?WC9PMjZ5M0FFRnJvVmVIcUhWWUpacVJsZjM5bDIxRlhYSGRIRituWGhxb0k2?=
 =?utf-8?B?UkVEL0JFazVHRC9oTnRYeW8vcERjUU52cXVmdHdEYWRyNUlEblRuajA0Rkdn?=
 =?utf-8?B?bFl2RVovZFk4cHN0cmg0NzcweEpsT2pueHFOWkRRWTE2K0ducFFXTG9mMjJs?=
 =?utf-8?B?VG9WL2VZTVNiOHMzNDJJVmM0cUQzWTRWZ0FZTmFyS0tFK2tIQ0pPclU5YldB?=
 =?utf-8?B?bzhhWGcxSW5YNDNmR2F0Wi9aY3ZDcnFWaFAzaU5pdlFESFhqVjA2SWVNMGs4?=
 =?utf-8?B?Q2JzV0t3cEY5amEwNXVZNlVTeUFnR2Q1QUNsSGRnWjE0RVZHbHBVQnNzQSts?=
 =?utf-8?Q?oH7U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bE1xdEVVcUxncGRxeElQeGhXaE5tKzllejZMbVgwcjgySVJ6MXdRT0U5YU5P?=
 =?utf-8?B?REp4akNvZTBLRWEwSXRWZ0NxT3FQYmROUUhyZFlJU0kvcCs3SGxqNnR5QXlV?=
 =?utf-8?B?SG1qc3V4dm5YVFdwbEUzcHFVYW9pU242WTRxa0tKNlAwSWlIQ20wdU4xYVhE?=
 =?utf-8?B?bXlGeVRYOUtMT2M0b3JOOWJnL05heUcrVlN6TnZTTEdGMWVjUklhcVFva3h0?=
 =?utf-8?B?V1VTMHA3cVpweXhySnkvUW9yTWV1bmx1UExVY1FsTlp1bHdoY01Mbys1b2tH?=
 =?utf-8?B?ekRQaUR4eWZOSERISHRkdWlnRXE4TWZVb1pidkJkMTlWRGl5QndOR3YyVmx3?=
 =?utf-8?B?eWNUSkczYXR2V01aV3gwV3dVZ3cvN1NNbnlhWWlNSmtjUmROZzdjK0l5aXUz?=
 =?utf-8?B?QUIwSE96RzgzRXFJcUtkcVE0OGc5RUJ5WGJVbWx6SXFQSkNhVkFjZTlweVRr?=
 =?utf-8?B?bXJZTmlQa3EzQjVyK2RqVGlWYzBEdG1McWRBK0xwU1VuamgvNG9hQ2p2aExo?=
 =?utf-8?B?cnY3eTljS2RzbG9STU96KzBLOE5GMjVpY2lCK0VJazZUdE9DSkhDQjZJSnho?=
 =?utf-8?B?ZVpwYk52MkoxVHlLVWw3V1k1Sm9sUy9nYUx1WHFFWHN3d1BaVzI0YTFlWU45?=
 =?utf-8?B?VlhaaHBJZ1RTR2Fxam1ieE0wQUZJMFBhTnpxVGV0YmFhWGxhUzU1MkI2UjNO?=
 =?utf-8?B?Z2pwSTZRUEJpWVI3dUxyRSswVS9QZWhmZHJ3UTRrTTBTZzkwaTZTcUxVL25Z?=
 =?utf-8?B?OElBRlNqWXlLMFQwV25xUU4zQkRLVGxPMFlXSFl2dTZtVVRpcTQ2ZlAxUGFn?=
 =?utf-8?B?dnUvb1ZJUEwzTjk0RVo4L3d4NGdpV2RUVGVtZUMvWUFtMSt1RHVqbTA4c05n?=
 =?utf-8?B?VVllSFpDQzVscEd1R1lXMmdwN215UjJPNk5DTlhLUWM1aGRja3ZqTkhlZG9l?=
 =?utf-8?B?ZEpsWkduN1RVZTR5eWdZclk0dWRaSTcyTHNDRm9zOFcrd1N6dzlJTE8zUnk0?=
 =?utf-8?B?c1ZSWTlIRHh6YkxYY3FjYi94aytONTFKbXI4WFB0WmZyL1JMV0lORlFOaEoz?=
 =?utf-8?B?MFp2VjI3OEJKcHlNRVcxRjZ0T3FUNEx3MnJrSmM0eVRNU3NieDRPSmNUclUv?=
 =?utf-8?B?b1M4RHVtQXJYSjZIdTlROFZ3blBaUEdqVzREME9aS0N1RDJ0ZlR2eFpLU2Nj?=
 =?utf-8?B?Ujh2eGYvWXE4THRqYThsdEJ4ekMxTGZOUjlsamVpT3pGSEpYZjRPRVNsTW54?=
 =?utf-8?B?UXJUdzhUc2tzY2dTZElheVRQWVhhaVd3eTk2Y0ZkNUpoYkpxUjlHSnFOK1c3?=
 =?utf-8?B?Q0c2ZXRsMC9VU0Urd2t6WEZkM1QyOTZGbUM1RURvZyszRWVTRXhWWVJTdC94?=
 =?utf-8?B?TkdKVytkaDE0Vzk1Yzh6Q1JXYlJRMGFYL1dzWFRYY3EzME9PaVRjeDlHdS92?=
 =?utf-8?B?TDkxYThxTisrZWFRbEZJNW95ZngvYStReTQ0amlVeHpodWdPV3RiQ0V2Tkcw?=
 =?utf-8?B?cUt4VHhzb3huMlVZZXhvM1k5cjlPc095K3FRcDJZcHlTd0JrRkNxTklnRkV2?=
 =?utf-8?B?VHZvMmo2NDFuTC9wbVFwNTk4Um51MVZNTDFST05YNkhKUVRXcHVnVThaSHZt?=
 =?utf-8?B?enpTTjNPeUxJSXV0eGlSZ0FpaVltNnByTHZmSHlkQ3JoSm1RSjBnb28xZGtE?=
 =?utf-8?B?Tit1TkVIb1VtSmhoNjlkbk9pZ1FQdDBCZTZUK2Fpa0lMU2xuVnM5Z2czN1Rs?=
 =?utf-8?B?MEltRzBNY1hvRFdESG1UU1h5UHFvSHM3d2hiUVhlR0RkM2tBVzQrMDlmbytO?=
 =?utf-8?B?a05ZQkRtVGNPMzV6eUVLenp5WjVYeU4vNXJTb3NqaGVNOU9BNHFRUVpnNmlu?=
 =?utf-8?B?VTVIbVZKeGVuSDJyQllMc1ZhREh1RmFTMVE0ZTJSd051K0xWMDltQkljdC9s?=
 =?utf-8?B?KzhsT1pxdzdDWUhGbHhCRjJTeVhjMmdnRTQxbE1HakRhVDBRbXg4ZCtSdk95?=
 =?utf-8?B?SHkwZmtqZE9ZREs2elBsNE9LVzJxY2xkcGt3MkRYditKVzI0ZW1oaFhtbzRi?=
 =?utf-8?B?REJWZituTkpHTk50M3Q2RFFGYzF6aVNIUmRsM2E5ZDYwVDdvRHFEYXZZeTBQ?=
 =?utf-8?B?ZVo5THllbEtBb2s4SmZ2amRXSkhDMzNrd25Ia0w4ZE5pT0lKMUVaYTVNZHFN?=
 =?utf-8?B?azNqNzkrWThsVDlpRDZRU3RkaGFhUGFwUDRPNnpSd3hXbVZEd3NJdDk5Qm9p?=
 =?utf-8?B?L1JVNG9pVndYVjMxU3JmTEJncTExbmYrZFVxR05sVXgrVGZMeXlFVXc1L3pm?=
 =?utf-8?B?TEtrU1FJSkJzTjcxMUVKeU5UVUZKTXVUTUJtUklWTXZvcDJtWlgvUT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d0f654c-b943-40ea-038a-08de54e24b3d
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 09:33:23.6214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PhOqbfgFrux6+gGDzI8aL4uEDO60I/Zph8kndHoJ0xzfsrkKSiClCbzoRSbVe74BvXEkU9+Rplz18ASxszZHig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8103

Hi Brian,

On 1/15/2026 9:01 PM, Brian Masney wrote:
> [ EXTERNAL EMAIL ]
> 
> Hi Chuan,
> 
> On Thu, Jan 15, 2026 at 10:37:55AM +0800, Chuan Liu wrote:
>> On 1/15/2026 9:30 AM, Brian Masney wrote:
>>> On Fri, Jan 09, 2026 at 11:24:22AM +0800, Chuan Liu via B4 Relay wrote:
>>>> From: Chuan Liu <chuan.liu@amlogic.com>
>>>>
>>>> If we were to have two users of the same clock, doing something like:
>>>>
>>>> clk_set_rate_range(user1, 1000, 2000);
>>>> clk_set_rate_range(user2, 3000, 4000);
>>>>
>>>> Even when user2's call returns -EINVAL, the min_rate and max_rate of
>>>> user2 are still incorrectly updated. This causes subsequent calls by
>>>> user1 to fail when setting the clock rate, as clk_core_get_boundaries()
>>>> returns corrupted boundaries (min_rate = 3000, max_rate = 2000).
>>>>
>>>> To prevent this, clk_core_check_boundaries() now rollback to the old
>>>> boundaries when the check fails.
>>>>
>>>> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
>>>> ---
>>>>    drivers/clk/clk.c | 8 ++++++--
>>>>    1 file changed, 6 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>>>> index 85d2f2481acf..0dfb16bf3f31 100644
>>>> --- a/drivers/clk/clk.c
>>>> +++ b/drivers/clk/clk.c
>>>> @@ -2710,13 +2710,17 @@ static int clk_set_rate_range_nolock(struct clk *clk,
>>>>          */
>>>>         rate = clamp(rate, min, max);
>>>>         ret = clk_core_set_rate_nolock(clk->core, rate);
>>>> +
>>>> +out:
>>>>         if (ret) {
>>>> -             /* rollback the changes */
>>>> +             /*
>>>> +              * Rollback the consumer’s old boundaries if check_boundaries or
>>>> +              * set_rate fails.
>>>> +              */
>>>>                 clk->min_rate = old_min;
>>>>                 clk->max_rate = old_max;
>>>>         }
>>>>
>>>> -out:
>>>>         if (clk->exclusive_count)
>>>>                 clk_core_rate_protect(clk->core);
>>>
>>> This looks correct to me. Just a quick question though to possibly
>>> simplify this further. Currently clk_set_rate_range_nolock() has the
>>> following code:
>>>
>>>           /* Save the current values in case we need to rollback the change */
>>>           old_min = clk->min_rate;
>>>           old_max = clk->max_rate;
>>>           clk->min_rate = min;
>>>           clk->max_rate = max;
>>>
>>>           if (!clk_core_check_boundaries(clk->core, min, max)) {
>>>                   ret = -EINVAL;
>>>                   goto out;
>>>           }
>>>
>>> Since clk_core_check_boundaries() is a readonly operation, what do you
>>> think about moving clk_core_check_boundaries above the code that saves the
>>> previous values? That way we only need to rollback in the case where
>>> set_rate() fails.
>>>
>>
>> Perhaps it would be more appropriate to move the clk_core_check_boundaries()
>> check before saving the previous values, like this:
>>
>>        if (!clk_core_check_boundaries(clk->core, min, max)) {
>>                ret = -EINVAL;
>>                goto out;
>>        }
>>
>>        /* Save the current values in case we need to rollback the change */
>>        old_min = clk->min_rate;
>>        old_max = clk->max_rate;
>>        clk->min_rate = min;
>>        clk->max_rate = max;
> 
> Yes, that's what I had in mind.
> 
>> The changes in this patch are intended to avoid altering the original driver
>> execution flow, while making the minimal modification to fix the issue where
>> the range is incorrectly assigned.
> 
> It's ultimately up to Stephen what he wants to take. I personally have a
> slight preference to the approach above, however I don't have a strong
> opinion about it. I'm just calling this out to help with reviews.
> 
> The one thing that Stephen will want though is kunit tests for this
> since it changes the clk core. There's already a bunch of kunit tests in
> drivers/clk/clk_test.c. Feel free to reach out to me if you need help
> writing a new test.
> 

Thank you for the reminder. Stephen previously pointed out the need to 
improve the kunit tests, and I will take this into account in future 
submissions.

I would greatly appreciate it if you could help enhance the kunit tests 
for this particular test case.:)

> Brian
> 

