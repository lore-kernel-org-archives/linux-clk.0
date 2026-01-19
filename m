Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013018.outbound.protection.outlook.com [40.107.159.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1221328136C;
	Mon, 19 Jan 2026 19:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768850596; cv=fail; b=C+aM7FlqE35Z0CBMJsXwHp2ZcAwJer9kT7Cfi1POoJMX/H8Ogaikk/mPk3VC6qiO+DO3IUGdOHRKBGp0fsBo0EQIFFv7l0fsK6CXd/WapypKcBnBC7OSbpDvZ+CzD024ABO2Hh6XuJ5NlTfNzFsNEaBs8wjHWKpJGjiy4FH8ZVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768850596; c=relaxed/simple;
	bh=x6husQekcpXhosQxH0CHMl9jLy+fxC8r9A+JFy3GzPo=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=DdhC8IAqQ6rxx/EuP6zvSOCuLEtehlfna+aKBq/fC4S/ukcvviT3wLrT4S0mG2dB8YHeCdAjlOFrH4JWwqxk+nBGh3FyeQoY+WbSQPxGLo9J5L45Rh2NITWPbXQsSRLVYQA3uU8SsM4BghvJSlB6URPGm+SNcuSvfSzkj4md6n8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CqGZi31Y; arc=fail smtp.client-ip=40.107.159.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CqGZi31Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AiZLE6ZQ2hDZ/JALWAdmhvN0dRMPtjgx3sHRIMm7nZJNh6GPi6KLbzOePcc+K+d9rLrNws8MWdkcWZh239j99wQ/hPmW4wp9md5t8XK1MW4Dhx8uVumaC8i9CyTjIid1yjuReY8T77jMveG2ukj3Xo6XaHMV/n0Ce5r7WN852Jg3AHNlhY6MKEJRAatFNtP448nGwd82vpN8j83YMV+3ZXXhGP3O1+EI8G79DisaUAEy0GBYforYj1tPysFGWPrH+duguJSNt40v4hw5xufAVrsTyeO3915+XxzouBfU0uqqDemEKuYCRep3274Yp8GKyy79mfLuYC7mc35gQFM91Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0dvSu5ccU1F4Z9nQL+zQkeOxm1ryjb0GT3i/t3vBeJY=;
 b=R7IWzhFt8OAQmQpaT56rhodaJJn5CyI8Q4YqcDGEQ3mX1Vr/bjtIrgTY50KVqu7L4vhgsErqa0o0XgYs/bAWK3WYQsXWD/fMl5MMQUadGmw5HKgopXN6F01d1BZ0Dli6uyeJPbF5knXwKSDYkXzvVZcVoDsjR8fyT2whaHlVZla8ZnajA5adUkMcZL9d47MPi+J6SIP2IrM+sZ0K+yVGBgeWCs4mX/05+pJLVLsZyxZwdKwtc05/qKo+MzLL1aux6MUvPIiM1xcHXAZEeUDbVyKjbyohejLk2oZ+hqF0Mt8uQFZpJ7w2PoTvD9BBWvjGwvIIci3dI9OKzjlRwIBMig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0dvSu5ccU1F4Z9nQL+zQkeOxm1ryjb0GT3i/t3vBeJY=;
 b=CqGZi31Yq+M+1aMddqBMaaDFOdBnW5nsB04Bvy4JLqrA3SbB6ZmIHq/xEdd8fXNBeGhrzU52cjSVedUQDXqKLS1gbc9Th7FeNjSjUfX1GrEB8ojXBBhwu8OoJhgm7hhq6NkxPONubEgaxfw8wkuXi6VEfQHTA861Z+AYO4+ulkCWNjkHoWQreZ7jyZ+PmeifkFr56fqEBkI1qyqYo6SbXRAVjTdYbNHrR8DUkoHc7uBCMop/DlzWQfGsaq7jQku3YLAhONV3VS4mZa0BNwUJT621wUuIgEmC611nqHkxdxHdnmExW2fpP4scbN4AVLpECB/UdAKwPhDQBKGz9X53aA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PAXPR04MB8733.eurprd04.prod.outlook.com (2603:10a6:102:21d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 19:23:11 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9520.006; Mon, 19 Jan 2026
 19:23:11 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH RESEND v2 0/3] ARM: dts: imx6: cleanup imx6/7 CCM related
 CHECK_DTBS warnings
Date: Mon, 19 Jan 2026 14:22:55 -0500
Message-Id: <20260119-ccm_dts-v2-0-efcf9155941a@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768850586; l=1616;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=x6husQekcpXhosQxH0CHMl9jLy+fxC8r9A+JFy3GzPo=;
 b=G02U8wetsDqzcIjDRKVoZ586ElYJTeiu5dm8/p37M3aumYmr/dfLRQm68UGjjiXTW2dsu3LPO
 baOnKU52G3tDTTFdJcUW9cst6v74HF0E9haLdpX0YPNHSVdYB+CMUiV
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR05CA0135.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::20) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PAXPR04MB8733:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e7705f1-6ad9-40b5-43e0-08de57902ef0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|52116014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VUp3QVFqbXdHSnBtQWp5Y1dtTUltblcwdTZsL1RFMjgyWlV0TlFabjNVWHZX?=
 =?utf-8?B?eU5za1l6eW9rdFF3T0YyRkhPQ3ROL1kyZTFWUUJxcjJOdzlDeU1JTEhrR0hs?=
 =?utf-8?B?VjYwSmx4NjVKVENrdytyYjdkMjEvVCt2WlhYVGxyMVhXUGhlWkNiU3pjb1Fx?=
 =?utf-8?B?N1psbzk1SnhwVDRvUTVyalNSUUppQzJmTUgwV1BNdFo2YWJhSmJTQ01Uamto?=
 =?utf-8?B?TzltSGNRZWhxRll2Q1ZWeGZiRVJYRlhqOVg5NTgya20zRXBNY2lRTGRxZ0lx?=
 =?utf-8?B?NU43Y2htTmRodzUxajJVQWI5bXpLd21Dbnlza3VyTEhIdlpVSVNEYTVIeVVD?=
 =?utf-8?B?eUpiZGV5RmluZTBEbWVRQlJjSEMrUnhPcEVWT2FNd0tRU0EreVlRbnVQckFM?=
 =?utf-8?B?ajBkcTkra251eVgvT0lDRFdESm81VG1qU05majlQakJDdXFldk5pMEpRY2lt?=
 =?utf-8?B?SVBzM2FYVHA2MkJNaWw3R1VIYmRITFRLelRqZjlDQXZwR3NtU3lRUEo4dUhF?=
 =?utf-8?B?WktmbVM2NjFFRkF3S3FTZWd4MHFoTUR0R0lUYjU2WFJzUzY2K2JUdUtSMlps?=
 =?utf-8?B?U1dHSDRxUEZaNDdFZ2x1cEhWdkxKMTk3VzQrTnd3UWVaVC9xeFAwYms5cTFU?=
 =?utf-8?B?d0w4MnU5Q1p6Q3VvNlFPSzNQc1VvVWtwWVZqNjh6OG1lUExPZkhwVHNlQXhC?=
 =?utf-8?B?Wk9uZzdjaU1sRHdEc0ZMSUZqc2N1UkpLbFk4dC9KWnJBOFBCL21CclJlbWR4?=
 =?utf-8?B?NGtucDR5NENLcEhNQS90a0YrU2hGVEJVTkM2dE5xNFFOZkg0RzlxR1daTm4x?=
 =?utf-8?B?WDZMOUdiTTQvZWRZL3JiVUxjS0t6ck9FdndycGkrU3g0TUl4ZWxoTiszaGVj?=
 =?utf-8?B?WnZkNlhEK1BNRHZJMUhIOEEwZEZuMGdHQnVLdW1WYVpyUTBoS0RuRE1ZcnFX?=
 =?utf-8?B?ME1hbFFOb2czZDAwOVEzSHdwT1RjdHowUEl3azVXR3RZeTl2aG1sNXFidDZy?=
 =?utf-8?B?RkxCanpjYUJoNCtwR0lwZ21BWVh2RXdpbDhQUWt2RTdWaEZIRkUyUHA1UmpU?=
 =?utf-8?B?djBDanFKUHhTRStjUHFjMTI5QndmdWl5Rk9YTVZTVXpydTJ0RXhLcmRhR2h2?=
 =?utf-8?B?LzdCTGhvUVFPdEpjU2FjSTBHdE9uSjBxVkdmOENuZDBUYWlCZGx0UFN3OExK?=
 =?utf-8?B?RWRRbEFsY3ozeGcwMGJYRjlKeHo1V1RVaEswZjJhaEZlbU9VNFMzMDJrTmdJ?=
 =?utf-8?B?Z0ZLN1E1YmdsOUFXSHlKVVRCUDkreEI0cVQ3Rjg0RWMvL3BHMWVtWURWRVR4?=
 =?utf-8?B?TVNtRVVZMHhzTFR6L3RZVTRXQnhiY3c5MStENUN2anNCckZoM2Zkc0VmZnhL?=
 =?utf-8?B?bVE0K2Y4ZVNjdWlYVXBlaDdzNFR3bGI1bThsbmJoOXJIcW1pUFVIdHhIYzVq?=
 =?utf-8?B?OXd0U0VxZjVERk41NzJBZGhzSkR3MEJBSWF4SndxUGtadWpMUm0rdU9vL3dC?=
 =?utf-8?B?aldFNFNsanhiMFpZak5hUlE4ZlF4ekZHR2djZFJsd1hSVVUwU2dmL1NINS9n?=
 =?utf-8?B?c3dmd3FqdEFydWVmT2c3cXRiUDVkZW82K1V2N2Z5b0JnN200RmpoNkxyb2ZE?=
 =?utf-8?B?SC8wYkR1WGhoSzZhTm1nSFFXcWJrWUJqaS8rNlJHRndLejZzWU42SFZ5Tzlw?=
 =?utf-8?B?UzdYdEwxbEp4UVNhQnoydG52QUwzWmNlM2Q5eWc0NkhVQjhLQmhJeGUrNGFR?=
 =?utf-8?B?SHNWVzZnVVVndmRWcGZGSk4rS3pxMWY1QlJ1eDh5NFlXV2pUd2U3VU93RTJU?=
 =?utf-8?B?ZEZ4NEJoYXVEcVBFM1NaRHFDYlZtNk1iZVV0OC9YNXoxeUxSbkg2dGFrYmFQ?=
 =?utf-8?B?eW9VRkwvT0FTWDYzVkwvWlA4SVJVWWN0MFkvQXFSc2JmTUdVR2Rqb3krdkg5?=
 =?utf-8?B?S2I2czR1VjBodjN1dlZGMi9iSVdxUno2bWFhdndzVXBXMXhXalJINVhzN2pP?=
 =?utf-8?B?OEF6eHIyNVpHY2YrdjhiTm5QdE1JT05GY1Q0L2pRM2kxUXZ5UCtORFgvQnh4?=
 =?utf-8?B?eUZVQ2hsempZY280VzJ4L2ZJdVgvTC90MVhiL1ZPbHZYckFmdkRqSWdNY2pm?=
 =?utf-8?B?Vitqb2RNY1Q5SUFyWnBYY2plNDJ0dUVNYzB1RkJVdlFydmVha0I5dE45VDVo?=
 =?utf-8?Q?filtQ59RyoqxiLwaGplNiYwp1pwC8wIjrXwNnHaJS4dt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(52116014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2RuQUhCY0JVMTF5ZmRjdlphbERrWkpheFdHNVEwNk5UNnJQYUxDTTczdFlZ?=
 =?utf-8?B?UytLY0k5cFJZSk9QQy9XNVp0RXBrbkFjcWxVZkt6M3VnNTlOKzhTekJRdUJV?=
 =?utf-8?B?c1JJeHlnNXFibUdGajYxb0F1QjhrMkEvVEowVXhmamtDb29xSDdIVXE5b1o4?=
 =?utf-8?B?ck90RDBhOHQ4ZUhWRG5MUnFyNEIrbGZMWkF6cnNpQTZrNnhTOUhoSnJ6UHI3?=
 =?utf-8?B?cjYyQ2ozVWY2dUFibHdPNlU4YjJ2WkpOS1IyamFIMldsRWs5RjhjcUJ2aEFV?=
 =?utf-8?B?YmRrSlZtdy9iZmZSdUJJbjZnTkNLdExlQVBPWDZlWkZQNDZWTUJZdGZkdmtx?=
 =?utf-8?B?eVlLQnBTdkprYWZqdm9OVVA4UTRhSHowT2VucUpPUDUyaEZqTEhYUFVCQnda?=
 =?utf-8?B?R2xreXoyQkN6eGN5KzVPUXNVS0ZRKzUrQnk2ZFhWRVFEZTJlS2JXcDFaTm9o?=
 =?utf-8?B?YWpaaGszMmpxVjlqOTB3blZaY1ovSUpUNis1YXZtRWxlTTJMNUltQlhLUHFt?=
 =?utf-8?B?eUtpWUdrSG5zMU5hMVhCUXBqOHlKYStqZ0lOaWhKMzQ3bzN1QlRRRk9iNEJW?=
 =?utf-8?B?R2RqQjFYeUZyUVYrRDJSQ1NIWHJDajA3UEpmQ2RHazdqdkU2K216RU9SYWl4?=
 =?utf-8?B?R1dJQ2Z4V1p6SUYrU1RpYmtsTFRyZjFoblo0RDlQRlZ6QzVKTEppTUIvWW04?=
 =?utf-8?B?enI3aklZUC9IN21vT2RYdFpEUFdBVzNVSUNPZDZ5alBPcm9xVi9mRGh1SWYr?=
 =?utf-8?B?aVExM3IzSCtIZXhJbXZPUXNTMXJ3bEREM3plRXRFZjBHK2hyZFQ1R1BnQWZM?=
 =?utf-8?B?bXBpZmdMZTMwci91RDhIZk9aV2xpeUlQSjNmODBmVjdlYlo3VGhZZ1VtRVhN?=
 =?utf-8?B?U1pIMHhZQXRZL1RFVFRMMk9GZy9BMWRnNGZlNEtPc0xtWE5BbzBrQnFzSFFI?=
 =?utf-8?B?bVV4SE5WWFkwRm9NRXkycHBVOTgxV3RaUTQrVVErMWplaWhLSVBoMHd2OHJq?=
 =?utf-8?B?TEJFcWtzbW9WZXF1cFBRVjRHc0ozRitJc1h3L3ovL1U0ekR6dFBqRE5XVTI1?=
 =?utf-8?B?cnZLSmNXVVhzdlVFd0hJN3dRTWpxSHpVV1V0UmRtK2F0S0R1Y3Vza0phV2di?=
 =?utf-8?B?dnl0T25zSnFNT013MHFDci9GY0crMGZPdlByMDNKRWVLSmx1R1FKaFFFZUlw?=
 =?utf-8?B?aFVNWjFWZXF2YWR0VmZrbnh2dDdXOXhPRTFwcm0rZlAvT3EvYm10OU5OaXlp?=
 =?utf-8?B?VWhUQVBWTW9IRWpYNlBPMUJHd2VrZzJNM1BRN2swbW1FclZ3VDZOcklCUXl6?=
 =?utf-8?B?dkRUV2lDVllWSXFKc3hCa1d1c3NaUTJtKzlBSHg5UGlGK25SeEJxWWdnYnUv?=
 =?utf-8?B?SnFrc1gxUHU4TDJNcUZEZ0JzK3JMQkR3d0VkNVhEY0l1WmV6eUczMFZqL29H?=
 =?utf-8?B?SjBTMVYwSlVMYzBLaG9tUSt4WjcrOWEvYXovNGZWRThicVJpSUFYWDgyY3lJ?=
 =?utf-8?B?cGlOT3RxRHRBYTZMOVlIclBTVk4rc0dIeVcyWFptZHhvUjNwdXhzeHd2TEdO?=
 =?utf-8?B?eFBFU3NoZzRqUGdUL0tzcFovUEJzMi91YUk3cXByaVB1Nm9oM2xDU0h3YVNq?=
 =?utf-8?B?RnVvVSsvRUs2Z2o0dlV0Qi9kdWhuMS9oK0s1NGR5QWtQS0I3UjNEaFFqR1I0?=
 =?utf-8?B?bUY3cXZ1d0F2ZUN2MDVvSFlBVTVBdHl6SEo2RzFmdlhLUGZVbi9wNHcwdzR0?=
 =?utf-8?B?WjhyT21PaEk5OTRmYWNoOVFlSUN6ZjhqaS9IL2s4SEF4QXlZdFpaTkx1Nk5s?=
 =?utf-8?B?cXo3bDVXclpBSWd3WHZ2ZkpaRSttQlFiUmdxcDNMQThvRXJXWkFZY0lzOU03?=
 =?utf-8?B?OWI2aWljU2h2TW1JNGIwNkw5eFhJQXd6M1ZTdG43cExvNzFiT1VTWW9Ra213?=
 =?utf-8?B?bUJXcFE2MTg1MlFKVFNDVjB2VWxNc3JxMFh2d0dLRjhGQnVRTW1HRUpIMDdu?=
 =?utf-8?B?SDd6VjNKU01zNURIOHVVT1E5ZFBudFBKbXpzRW1qOG5sYkhFZzNIUjVXeEEy?=
 =?utf-8?B?UFJ2b0E0VkFPT0pDbkIzWlR5eVBTWG1FWkZ5Z2lhMHUxWnNsVVQrcVFHR1kw?=
 =?utf-8?B?d28zMm9hVUV0bUd5MUZHaEIwS0xBRDlhL25iL3VkNHRaT29ZakN4VDFiK3Bn?=
 =?utf-8?B?Wnk2U2M0bURDekZBV3V5M2Q5Yi9ZUUcvM0EvUWo2WlZWUkZENkRUQmRFRDQw?=
 =?utf-8?B?OHA5Wk5xRWVZMnhjUXRoUmVQRDR0a0pxL1NNenVmVTBVZFFCTHZoZmtZRzNT?=
 =?utf-8?Q?RjEBNMcPZXuOiApm/X?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e7705f1-6ad9-40b5-43e0-08de57902ef0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 19:23:10.9242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v3bhaFUxFpPXJqJMZ8CkPPAfp9frvlzVkHpxEtmN6Y7/L35lxMt8oFiwosaxYhY8zyXZ13LLQ3sk1b6FU+TlwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8733

cleanup imx6/7 CCM related CHECK_DTBS warnings

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2:
- rename enet_ref_pad from enet1_ref_pad (only 6ul use this name).
- Link to v1: https://lore.kernel.org/r/20251105-ccm_dts-v1-0-6aadcdf97cb8@nxp.com

---
Frank Li (3):
      dt-bindings: clock: imx6q[ul]-clock: add optional clock enet[1]_ref_pad
      ARM: dts: imx6qdl: add label for system clocks
      ARM: dts: imx: add required clocks and clock-names for ccm

 .../devicetree/bindings/clock/imx6q-clock.yaml         |  4 ++++
 .../devicetree/bindings/clock/imx6ul-clock.yaml        |  4 ++++
 arch/arm/boot/dts/nxp/imx/imx6dl-alti6p.dts            |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts  |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6dl-lanmcu.dts            |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6dl-plybas.dts            |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dts            |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dts            |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi             |  5 +++--
 arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dts            |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6q-prtwd2.dts             |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi        |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi                 | 18 +++++++++++++++---
 13 files changed, 44 insertions(+), 23 deletions(-)
---
base-commit: d1d799fccb5002df8cd355c0a849cf4efcda4ac1
change-id: 20251104-ccm_dts-504ea501251b

Best regards,
--
Frank Li <Frank.Li@nxp.com>
-- 
Frank Li <Frank.Li@nxp.com>

