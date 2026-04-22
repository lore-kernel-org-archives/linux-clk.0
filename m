Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011042.outbound.protection.outlook.com [52.101.70.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124E63E95AB;
	Wed, 22 Apr 2026 13:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776866281; cv=fail; b=pTvbBK5Yo4MUhlTTSCvNdaCmffxDNFg8DTQALcTjhrSiLxBVA7RddH5vQ4Gt75hfUX5eGrTu2YQKsmpWYJYI3rOOouthK5ngXMdugVgkYOZoTJnSSgLG2StaKRxRik9/LngvW1KmJGIlIyUt6IRNbAGFql75S+XmytybhvjtvJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776866281; c=relaxed/simple;
	bh=YTFc3TTKBrgKylbigSMkkaFFSm/POOKM63eTryuiRyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DepUVgN7q0sg1vuZ+evbMDXUB7kdPIt/uU9cQS0uyDoorCNd+ATZVCBXL57gWsidGefmuM4lK1ED7tKQw88ixhGA8/n0U3wkEp4pM9cfFrWhSnj44qV+F3wSw2kfS9JFZpVyEsbTCDosKku73sitRLmnwWRdsbqf8fyMzfNT+is=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=aB6LR8DO; arc=fail smtp.client-ip=52.101.70.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="aB6LR8DO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fV2CTtnET8Ua79k1BLieNg/yvSRwC1PG/xA42WkhUA8L4+Z3OtqjIcXbzP8cvUuemEy8q0gToGsh7uKIvaf97srH8kLPIu9+988x6UnXrUy7F9D45Ii5i+W9MVS4zyjoY9wCEXVkys2W+2gxKr7ldkk7nNnh1j8/4QeZhkL5fpHaeI/w+GIgmyLCCDjpaaBFzXoH9hkehz6hoQTfzlTbQ2IJYNRvIShHMTS3+tHcag41Q+HecxxutQpW6K4qN6JNg3yYAxKvKfjmWsL+72cwcFNvLsuMAtHP5UTiZtfkgQ2K0nuTRI5eQayU+SbB3+x7MIWOB6KDAZbBcudQ1S7Cww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ExyXOiPwIkGGEkkluuwln2uSc0KtKyvoRBjqHTQ/zjI=;
 b=SWqHKQJxhtr/kg+5GGB6oFD2YaL6+mpHk2GECneZk20Z0q1oClTn9YquwINgoE+DoF5/7oCaAw5qC/zR0/DXPXE5ZbE/RluihJEzOWuZ643kCbEvhNEVAbjVhp1fZJ0Valc3q50d4Syka0/GOpKNqkZYs0pwBAfzaSWrtmQpTYRx1BqZgAFo/NVJJ5RBjpx/oub93zxXI7HLrF35epsMSBYrI1PG6ztZbsBOHdbJOGV51mUyR82hRbvs1V3an+mzyLV7An20EinLSrYxO7nKTR2nxgyYPhKNkSdSfV1xnSz2ODzY7VhQiTr6Z9URusSpEjMIN1tm/Vjj2hdXxyBi4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ExyXOiPwIkGGEkkluuwln2uSc0KtKyvoRBjqHTQ/zjI=;
 b=aB6LR8DO9ob/UB6MXa0u0+QKLzLcC4U69pUhtLrJH97+ofciLdv3RyCsATTEvcyO/Pnf3fvnBtrfmKK7lsksiAWZYjcLeJRiEOwOtBvFQMoR+24K4WVAVinB5Hio6gOPVi+F1SpTck3ucUBdIv0jShKVpNmadnwHBl0JOntL0IHJ17WW1b6ODL3NieaExt0qG4f9Yc4XOKIq7tgEhH5jeX2tghta2Dv58HvhZvD+ID0mlJHpHTHUSqdzEMN0gihRuXQKVAV5cJhBlhh2ujEj7/T57lUklxM3DuVilGO4WtsO7o5pSx2spNWRUlaNtC29kmM56ykwy3hImDSh5wyB5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by AS8PR04MB8039.eurprd04.prod.outlook.com (2603:10a6:20b:2a2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Wed, 22 Apr
 2026 13:57:56 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::21f6:947a:1f40:18af]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::21f6:947a:1f40:18af%6]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 13:57:56 +0000
Date: Wed, 22 Apr 2026 22:00:23 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH RFC 2/2] clk: scmi: Add support for two #clock-cells to
 pass rate rounding mode
Message-ID: <aejUd6L1AfbsflxR@shlinux89>
References: <20260306-scmi-clk-round-v1-0-61e2a5df9051@nxp.com>
 <20260306-scmi-clk-round-v1-2-61e2a5df9051@nxp.com>
 <20260422-huge-kiwi-of-tornado-4fce89@sudeepholla>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422-huge-kiwi-of-tornado-4fce89@sudeepholla>
X-ClientProxiedBy: MA5PR01CA0186.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::9) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|AS8PR04MB8039:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b9c4bdd-d390-4b17-c79c-08dea07727db
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|19092799006|1800799024|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	4h/0f2OLXyzPDpc3/Nn7UJSFrf6LmEcRlU+jqWUk2kRMOKA74Gd5P+IEgTMjjs8kWzZs/phy5W1hjBsYJ2RRq3Rk9REO/zaDQuczTjSyfG7ByPhq9h5yE33N1FXQkDx3nHonjFOIn1XW4SnpY1eLcpwXdjS6l3qb1FERalb/eWf2qRyhqnT8B9lZP5EJ1odJqrY+NjDOiS5eSXfroKSfyPbbPjfHuI5OSoZjHqvvKn16rmP1PDOsisjIsrHv0LhWanzQxubLrIZL0Z5ramokJThLdqpwoxd2PjQZKBoub+FUvpLHhJRrkVDXDJm9DeFkCQE2VSAC80fQ6QklZJaFYx3AxhFxR2ngHFnCsGGSAQtPxsOQ8fKn8vt19aEhOfEwl3Zr25ljITX4nEqGiCO2WcL/jwTxaR2PZVWM7mhIuX4u/AxbxBfMlx40G+1tpQu3j6ObdSqQK3aE/heG3PpEAt/FWLYjfQ7x+QS9IU4KPjagPDCktu8SvNz1RS3jvlprYAyronCGt6NilQ2uN0l0RUdFR93z71LMHkqESqoaADo9CV4hC9mpdviG7JovZ67vwum0cOpF5wKPBokuCdkZvFls7yYugAuUyAhg+MM/E5s0LhnBptBw6tsrGnM0Aq8psflVP67qjTsV63r2AG/lCZqqXDrn+wNOU18khYFurIAYwYI9sVQNbpT2R8YP5EM3boOZcjfuPKoGbGm+vX3NU+HuM17CfsIeBxPvXdsLD4Xry19z3xfcq0MCMpU+XPixDvGSnNqla002D7ap7+BFPwQhXs452+QJd/2PboYBqzE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(19092799006)(1800799024)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Hz/FtuzcjLErIouDLOAsNQI8Tlcdt7tl1YqU136wsR3cNf8wnPdAykBgMPUz?=
 =?us-ascii?Q?Wzzk3ijPBvknqsOl3AikYFT2JMf1p4vDEVxyVaIAhnHgTAzYjuhxCuhv5On+?=
 =?us-ascii?Q?eTPXru0pMt2FaEQaz0YHtD3Dgk+kmCccIDIXEbcwa14sC/77mQW8Er8PUOsH?=
 =?us-ascii?Q?k/AvqH8t+rUu6xL9I+AYKeyHBtZe5Vx274y9Fv1iTQDLhxo76xHLZVVDW/Yi?=
 =?us-ascii?Q?hmiXvnLs5cp8w20Lv2jakDNNH7qwIoSCSj/PbjpnWqAgbIZ20sW9VhO6vBmQ?=
 =?us-ascii?Q?cZil8MUJVMWsFH/s0Q79EVIaQuttFNIaJMDkg5JnoQ11uJPBq4vy9f22oQqv?=
 =?us-ascii?Q?UDMwzCrKIfVnlzPhqgZTL/m+gpjporQCx3Eb8sqTnkQshn+YnVLcap/0hsNd?=
 =?us-ascii?Q?JzECa8pByFKbLWBQ4+dH9YnF+a/Rw9ynBsX2KW6tVsMNLHjmeM0VC+QUtM3g?=
 =?us-ascii?Q?bG1kEefeWWzixSNCU6kt47YTIcLMnINfd4u07sNuiI4Pb4OKDHShJ06usXFv?=
 =?us-ascii?Q?udqC88/QdXBLCzh7aXAMLi3/K//ingz16iOzg6+OBJnymhCUtMXHpZYhYrIy?=
 =?us-ascii?Q?dXbs0euEYPmjPatEqpLFZJcIZn+EPQrUgJxe2evcTAbVL4nEgMW1NpFkT0Hc?=
 =?us-ascii?Q?HZhhk5Mi30yEHjtKvVGrR5s53aNlrX9Tslv0HsUT2EGxuG29uY/n65ZWxH0Y?=
 =?us-ascii?Q?NKEOxrRXdvEXa+ZxXdA4KW9wt9CtQj8WTRRjFJx7m0AXBADarWW161+clboP?=
 =?us-ascii?Q?NRWGcDGfiON2FMfLZT0+dfaXKsyHLaLubAnSq8oljSx1vFhR62Hy/rhyuc7i?=
 =?us-ascii?Q?LrQDkOyjqWN8XyVdLS3VTFL9LUOxGcnoY80CmyzT01LilkOmST0DRZF4GT1L?=
 =?us-ascii?Q?zKKrO2MEf/1XPWJyOM9Arm5BCJlXRJuN/DXD+5L7oWqkU7X2bG6IKiU630n9?=
 =?us-ascii?Q?ZDRekEZKc/m1deGiqkzk97KTfxf2bk4FX/TW8+Yo4cmZHWJ7isKMQEXbqyvP?=
 =?us-ascii?Q?cQmC73FNuy8uBC1XsRtrj5stZYP0J+TA2WedLg4O1S2UPLxDuHnlFEvB1v0j?=
 =?us-ascii?Q?C5kV9rUf+W3tckk6KQ4mzb1itQ+fbF95+liycQ6ardvSptAlgs8tlwJHIqsE?=
 =?us-ascii?Q?1noxTeRMn74dV75sfryBUHSTsZyhSIU1b8J1w0ci82u+kwURpLgew3+JyI/r?=
 =?us-ascii?Q?IYqBSNb0nJnV3qIF0+1TM9cLVmT/7lOPilDlGjM3Ml1a5ZU04l28NDH12RRk?=
 =?us-ascii?Q?833EYp1K3yK5Yjk9uPbLuWDqIF2jhrpRvi0rmjd1hIJ+OX+3yEepsWiUTYQp?=
 =?us-ascii?Q?sJbXQ10fpvySm5wkp2lBE0rWgX2jfk7IbFdhzmrQ3SSgQ81qGTgu38smWs2k?=
 =?us-ascii?Q?YhcZbhMlPIOAQ/LvIQ1RL7BatlP+1FqanOJw28+aJGwYE8Kr84nkOlYfoLpU?=
 =?us-ascii?Q?DmrHRgPzPtOwL5+mDq1u2jPeg9CEq7rPUDROMPb+HEWMv/LCkOlvVFFMJ2kw?=
 =?us-ascii?Q?3mlosyuTWMwxyqDi31C7HQh/3mkcoprgCAeby6hGaQdM3hVZABmpVu7lKvX/?=
 =?us-ascii?Q?gZAmaYVLd9KKfTB3zcush+DlvHMyw0gJHQAmOPWJ0XiPce0EAMcnOXWnOz4h?=
 =?us-ascii?Q?8lb/1xCGwC8MqTFgz356psK2A5Tvfdnm3KlpF9Zt5pKOKYu5UmQabVGkwJAF?=
 =?us-ascii?Q?OJydTc8vhfQfJoN2YbelYQ3Fv1UHQD08dG9DPCnGHGMw/dA9TiHpk+Dh0X9v?=
 =?us-ascii?Q?2leBliWo8Q=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b9c4bdd-d390-4b17-c79c-08dea07727db
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 13:57:56.7580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GvX4LFyumgO9uJZR1sJwB0o5VASHWmvgvQ1Z5gmgZEdrcyGZRWw2M8aE1WPzbEzB6ZGSE8qX+4E4EX/oOeTFwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8039

Hi Sudeep,

Thanks for giving a look.

On Wed, Apr 22, 2026 at 02:14:56PM +0100, Sudeep Holla wrote:
>On Fri, Mar 06, 2026 at 02:20:13PM +0800, Peng Fan (OSS) wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>> 
>> SCMI CLOCK_RATE_SET allows the caller to specify the rounding behaviour
>> when setting a clock rate. The previously added dt-bindings header
>> defines three modes:
>> 
>>   ROUND_DOWN / ROUND_UP / ROUND_AUTO
>> 
>> To enable device tree clients to select a rounding mode, extend the
>> SCMI clock provider to support "#clock-cells = <2>", where the second
>> cell encodes the desired rounding mode. The default remains
>> ROUND_DOWN for backwards compatibility with existing device trees.
>> 
>
>Where is the binding update documented ? It's not in 1/2.

This was missed in this patchset, I will fix in new version, if this
patchset does not have big design flaw.

>
>Also if it can be static in the device tree, why can't it be
>autonomously handled in the platform firmware ? I think I know the

Linux passes ROUND_DOWN, SCMI firmware uses round down for clk calculation.

>answer for this but I want to make sure it is a valid use-case and
>gets documented here as part of binding updates.

Per info from our video software team.
We have some video modes where the best pixel clock rate is slightly above the
nominal rate, and the default round down rule (CLOCK_ROUND_RULE_CEILING in SM
firmware) can cause the resulting clock rate to be much lower than expected.

disp1pix = 96200000 Hz (desired pixel clock rate)

The MIPI DPHY cannot hit the exact frequency of 288600000 Hz needed for this
pixel clock rate, so the next best DPHY PLL frequency is 289000000 Hz. This
corresponds to a pixel clock frequency of 96333333 Hz, which is slightly higher
than the nominal rate of 96200000 Hz the video mode specifies.

Setting the VIDEOPLL (disp1pix parent) to 289000000 Hz should divide down to
the adjusted disp1pix frequency of 96333333 Hz, but here is what happens in the
SM firmware:

quotient = 289000000 / (96200000 + 1) = 3.004 => 3 (notice that the SM always
receives the nominal clock rate, not the adjusted rate)

If the rounding rule is round down (CLOCK_ROUND_RULE_CEILING),
quotient = quotient + 1. Therefore, quotient becomes 4.

disp1pix = 289000000 / 4 = 72250000, which is nowhere close to the target of
96333333.

However, if we can use ROUND_AUTO the SM firmware would select a quotient of 3
in this case, and disp1pix would match our target: 289000000 / 3 = 96333333.

Thanks,
Peng

>
>-- 
>Regards,
>Sudeep
