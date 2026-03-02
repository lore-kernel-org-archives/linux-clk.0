Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012006.outbound.protection.outlook.com [52.101.66.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4F131E855;
	Mon,  2 Mar 2026 22:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772490774; cv=fail; b=kGkwsmWg7O+vrkECY/Rdmu8k07BunRrO0V6IyJiBgCiQPIxRJ/Hh5X8CN/xW2mCd36P5ddf5HOgzCfGuIfuPybp4uE0sjP0L0rd5PPcSUBztes/m1DgeB0VW7q+omhzpdyYjzeXwXbL7S7L6GxiF62wVkSa58p4Ro23hPfOMElk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772490774; c=relaxed/simple;
	bh=HFln3DI6kGPbOIZiI/b+6v8pVOs/XDufizOFKVWbm7I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=pcaPeTOzln0ChZx079pCbmfCbC4P9L2UhvNOmgobuEhLcwG/OULWbaSfNRMFO7Wplbh/qKaXUudgF2n/HDmqoxqUQA472RZlijnRWLG9XzizAvrcme+MRhOmdx5cV6787nAKuGkWKw+bEue71xyvedfjUSqveZiPCTTwF0GOf+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aISMIg8x; arc=fail smtp.client-ip=52.101.66.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aISMIg8x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RGHNxNp7sBwPgufgncJJ3Dy1gqM0t1qUGDmYpU7NEiYTbR+3vc8SLjQQQd8+kLXyHxAol5f4F1ABc65h8YAXrz3YyeA0ptFTzp2VHS+UYFdnAwFoc/J6kLaaPxLjGliGeLN4KQPcorbDg28EF54Mz0mO0THT1/leYeJLZLIOYJ56B6p5C+EB2qc2G5FevPdMYobvbWK2yZONBIdTVUpLh0F9pyXFFuTMTZioSg46EdFULn6KDes72B90Kwn3/QZHoQDUW0jE6/GvG4DcfszNa69VvpYdB29vagP46lFsVT3RY4rXTe5sNu9LnVipVOJqNl8tsdUqJ40UiVgOGf8iUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7bkNQBe03i7mSRMjIPXv2VdtQLJtscbe0mBI2W9fwGc=;
 b=FS1mLh3NkRliTPc+goum7NTbdBBMXNNLkdTZtrRxBOD9wz06PU0DMzXQ2+7zG98jfyWis6VRta9SqoAQ13Mzg+QojzqhNol6PbqjWp8pwH8vU/3yB6uyHngWd6qpdFb34/SGvJOOUPpV8gGc2dSJC9t/nj2CS7FD3bCQSTXTpm6d3boJVQoLw1Yr9d3TYZ2RLq6CQ8WRtyA/sPI2ORM/z/NdA3xnKlYWNRDanCUys4tub8P6ilYgcsFor2arZCVqW6PMYMS9j40ZcQ7ZXDkHRZtH8E0rMLXHXqvymDK7fywsqyiyYUXBeKJJX0bAjkpgiCvkLJedkFwg+I5MoKjpNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7bkNQBe03i7mSRMjIPXv2VdtQLJtscbe0mBI2W9fwGc=;
 b=aISMIg8xVEpZbbujkGe9v4kToJwXu2Mx8zU7fy54g+m5Pz8L4FnPZ5hPJ4t1dwu+k17P8P3E5GkOw06nndOZAkZSgrGHkqbMU6H51vMz5gZV9VX4nunrEI7UegMWJPAbdE4mrx+kzx0k2baEi7Fcdh/3swfX35084TmV09ERHu7w/CIUxKCxHsJU4WBFi3QMfnvkEymG2AwTAXJxUUGzmyLs6+1bOp+s40A/quwhGh89ZdrO+bYGx+NG7+wjUfKoWV4LnHq/mDg9t/kBNlJs52UfuzKSnPX7607vGcvMTDURi68q+UYjIRMTmi7iprHiw8YENOm3MtZmzSDxypAyPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV4PR04MB11942.eurprd04.prod.outlook.com (2603:10a6:150:2e7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 22:32:47 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 22:32:46 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, andrej.picej@norik.com, 
 primoz.fiser@norik.com, c.hemp@phytec.de, s.mueller-klieser@phytec.de, 
 n.wesp@phytec.de, c.stoidner@phytec.de, 
 Marco Felsch <m.felsch@pengutronix.de>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de
In-Reply-To: <20260113-v6-18-topic-imx93-phyboard-segin-av-02-display-v3-1-fcbb85b0fbe5@pengutronix.de>
References: <20260113-v6-18-topic-imx93-phyboard-segin-av-02-display-v3-1-fcbb85b0fbe5@pengutronix.de>
Subject: Re: [PATCH v3] arm64: dts: imx93-phyboard-segin: Add peb-av-02
 overlay
Message-Id: <177249076263.2433368.17060007551245101938.b4-ty@nxp.com>
Date: Mon, 02 Mar 2026 17:32:42 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: PH1PEPF000132E6.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:518:1::26) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV4PR04MB11942:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c0b6b98-a410-4ee3-6e2c-08de78aba0e5
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 FATrQs/c0DJ4yAvk4GG1Hb0C9bOyrD3s1TmbiW4waYM9AIWMMyptpKOxRM4s3fSLBAt9JXdiqS5YKzODG9TM5umqVXyDYZLlYJ2zIHU738BMHCgTRnAsflGGieIceKnHrcaTEhdW+Vmc5hX4lfrAGfuk5egl4qDx2HKviRYbzp+bUhnxooSdTkZBEaOiv651mRliOeWkzYcOaDlnl+ROoo2sMqlUMO5byzd9FWoRLl+O2T0+3kOn4MLVb+YeiK4OpiSSeREroRyfY5LniAH0rzYSd+mi/79xciHJkKvJie0c9fS5C/zQk3CBmKiqf32beN9CHkFxA5GXgFeEUeMEUwIwo3QyyE46YRDbVdjuXyPzMWD/fFYrzMEZbkjnS4VNDivuDgbO64K1PZYSaZunNK+JRGpa2XUEKxUBVxQrvbXHm2+ldau56XdqxfahE+gdBpseuSHtAKUmGHjoFLuNYwEqKgGvT4zubTdv2thf3YVXjZdLEQcQ9kNI3CIu34acYmTVUwNhB4PFpM7japFluI6eoFLWu9Dd/sKuSWTxmYhOXOBKi3ur5rF0TgkYopZdMWKt+rVzNwrCLXeSmyVVOQDcTeEClrwrcWWX6ZdMESHoG0YGPe1GLVvcLZRLIaeROSCatvTQSfrlec0cuCIspoMobjBC5u+4+uN4ae8jrccQEzLQ54J7Ziulv+kYMazX//SIgDgAGGMp+/3Ij7dqtF5l2JyDsMDcTAV7tjx8Uz8b8AVOAZezBlH7LLkhSWEKuKj3uVACmF8KAnLPhz1G0wiB4GvR7UIblF0y5zASE5isSFnbI+jBLT7yZND5533i
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?SUR0ejhweGxrNmJoL2dLd0RRbm5odFJDSWpadG5mWUlTK0xkeWlkT3kydEZs?=
 =?utf-8?B?bjVUYnR3TUg3NUUrQTRvWTBldmd6MStXQWtsZ3VTYzd0dkhsdGR3TVdmRHJt?=
 =?utf-8?B?d3M2V2lUNXMxSERRdGMzOEV5UUVibHgxRk1yWk94WC9rSDM2dWVEdFFadzgx?=
 =?utf-8?B?MkFqWC9hSkhFaWdCSm5nQXJoazBEeWIwNEVmSGsxaXk0aTlMZjhjSlZkazlD?=
 =?utf-8?B?OXkwblVBODVkd2JHWVRWaHJlRkQvSXlwZEUwT2RNV0tZZjc1WUdXaTkyTWVG?=
 =?utf-8?B?a1hDbXVjajVmMkpkWkxtd0xwOTVWZVlSZEJhU1JIQ2Q2blRwaU1uTWJlK1M1?=
 =?utf-8?B?QzNvNG8yWEp3Nk51UEpSVUNqYlZycksrRmZYOTdpUXp2NUhaUDE3ZUplS0Vp?=
 =?utf-8?B?S3NOanZqQXkvNXYyTUhiKzkxcEJUTWVFdzEzTXdhSnhtcnNwdis5VFVUaklO?=
 =?utf-8?B?akV3SWJUajZuaVBBUDQ2ZFd3YWdKMVVOakwvY3RVcVlYYzFENzAxdGVSUXBJ?=
 =?utf-8?B?YkN4UlQwdUE2WHpDbVdKR21QcXhFNkRESHpaN0ZLV0VuRHJ3ZWYzR0FCUmE0?=
 =?utf-8?B?Ym1udXRRcHJDRC92ZVhKeERpYjFFbnpQdk1ndEJIMUFwdU1tL2I3YTN5Z3g4?=
 =?utf-8?B?MTR6cVdNSXJKY0dTWmZLVVJuc1FXQTFpM25TdEZiOC9XWkI2amRBY3o3b0ZL?=
 =?utf-8?B?WlVaTXJYNTZvRitkbEZRTk9FRmlURjBrTmZhN3NSQkJOdGJOUnhsQVFCWEc2?=
 =?utf-8?B?ZjQzdVJqZVgrbTM1Sll5QVZGN0YrSS9DUEpwbUFPRC81VVRpSXlaMEx4eWpr?=
 =?utf-8?B?Nk5WMWNPbFdjajhydkVsUXBvb0UxNTU3NE5IaTFnaVBXMDgvc0dTNmN1RUJ4?=
 =?utf-8?B?cjhxN05TYks0Yml1aG90T2hORnlFSTQyNS83V0hxQnRhMTJTVjVORGZTM2tz?=
 =?utf-8?B?YTNJTkJ1UDFPc0FFSWRDTFljdVpzU1pkMmw4dWNtUno3NkxXMWs3NkdVSUR1?=
 =?utf-8?B?T2RLN3ZwRFpEeThCenI2T3BzQzZmK3RMcE8wTjI5aTROT3NqcFpWWlNUYVNI?=
 =?utf-8?B?cThCY25hMDIxVWFvQ1RiOHVEWVlUWlhZVTlTNWNHZFNCdlNUZFQzdGE5TXR5?=
 =?utf-8?B?dVoxaGZJQzI0bzJwNktKNzExbndKYXVVejR2VXc3QXZFWUZ4SUhRdXVQU2x0?=
 =?utf-8?B?U0NhQldCMVRXUDJSL251M0U3NmV5Rmo3alNiRUcyNHZhdlVnNkF2enVlV2lN?=
 =?utf-8?B?cWxQSzdtOXJ6bldrcCs4S3VWUlloQXBCWFNCMXp6Rnk3NWxXb050WTd6U25J?=
 =?utf-8?B?Z1h2MVRVTzFlcWd4NUpEMmNncFlJV2phdm50TXl5a2RTUDZyZlc3VDJqNTkw?=
 =?utf-8?B?ZFVUWXlDUm5VZ0s1WWJSbmZDOEdVYk83eVoraU1TazRiMjdiczVBdEdUclh5?=
 =?utf-8?B?TWozVkVTSFN2V00zblgybmZPdW5IeFV4ckN1S1U4S2JqUkFhZVdNNTZteVQw?=
 =?utf-8?B?b3JIRU5jekcyVVJzNFFLbFFLbWFmdnhPSTcwaEhQSERrU0l5TVBtVWEycGlX?=
 =?utf-8?B?dDJ2Z3BYaFdsczVtM0dEalhMQWpCRUJjNkZXZDl4S1g3cEVDS1lzcU9TTGJj?=
 =?utf-8?B?OWJNTm5jWWtIUmRyVjFZK21hMnRMdmZjcUZpUEtrNjhCMHhZamlNOXNQeWVs?=
 =?utf-8?B?Y2xjQm81ODMxcllwZWh4VjhyRzBvWkc1bTRtcy9meXorQ0p4a0N2NndVNVVZ?=
 =?utf-8?B?SzlkeHZFdU1oWFk4R1NmSTN3QU5mazNFTktOeXZaY1JpUWM5OWtlVk5tNm9F?=
 =?utf-8?B?REpHM2JnaGxTdTZVN1Y5a1ozVzZGR2ErMkxSa0Vkd09XQmdPQTI5RHRIdVVw?=
 =?utf-8?B?dVJTSGZnU0g2aW5tYy9yQ2I1b0ladTd5R214dUlMaDF6NmhMckVQcFJhdHpB?=
 =?utf-8?B?TThBSk4rSFNtTHZEUWtTUkc2V0xjc3VFL2VjaC84djZHNkdwLzRGeGwwS1pP?=
 =?utf-8?B?ZDNYMGxDSnVmNC9SdG5teU5Qd2M4SzY1NkV3WHFGNjA1bzlVUnQrWVdTMklQ?=
 =?utf-8?B?eDVLRlFTRnkvZHRpbUkvR3pzOXZ5UWdmZ093UVo5TlBWbmRydVpSZkF5UE5W?=
 =?utf-8?B?dE9YemF5ZXFsSmlRa0lGYzRhSk9IYlVwNzVwY283VzdCVG1FcFdVU2ViRWpL?=
 =?utf-8?B?UHJlZnltMkIzV25CcTJsN2RnOWVhRnczNmtvLy9aUDB6cFhTZ1ROeTlva1Nm?=
 =?utf-8?B?THJWZWtHSnJGeklibkxSUmdTYjA3VVVIajN6eVhvU3JydExkampIOFdTK1k0?=
 =?utf-8?Q?xJ+aYVmpTqxxX9w8RM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c0b6b98-a410-4ee3-6e2c-08de78aba0e5
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 22:32:46.9113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bM4/sQxjPB52/ThXvmvLY+fngpJmeVXGx3HZNAH0t8gCYF7c/lk9FcSRIi4Vz1tv+Im7Qfxna2tAiG17HaVLSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11942


On Tue, 13 Jan 2026 20:06:08 +0100, Marco Felsch wrote:
> Add overlay for Audio-Video module PEB-AV-02. Add support for panel
> display, capacitive touchscreen and backlight.
> 
> The pwm-backlight uses the GPIO based PWM implementation for now. Switch
> to the FlexIO PWM support once available.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: imx93-phyboard-segin: Add peb-av-02 overlay
      (no commit info)

Best regards,
--
Frank Li <Frank.Li@nxp.com>

