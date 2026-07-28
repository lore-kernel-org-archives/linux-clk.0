Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013005.outbound.protection.outlook.com [40.107.159.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD9E3D3CF5;
	Tue, 28 Jul 2026 15:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785251319; cv=fail; b=UEN/m1OhFgeO9YRfPR6cHn6HhOvUIbbOHd46NGDJT0NAmc3f+hYDobfOP/wpiOyTwLSMgFP2Ktf7eV5dRvS0PZFPsAsQTZQYPfHeC91ihuKEXc6z6omSeTiAsneWXLTqgt4bAXsFyn5YhQqhOvNdV9IAqZOMCLURpjMKHp1rUDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785251319; c=relaxed/simple;
	bh=oXnk+i8Coet925+nd/HJ4ce6Z4ULoO/QxRtGduxV43Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UxuSePcD4Sl123C6TjKSBPhNMjfwZIxL+b5P/1K1uF8NIeNE1SBK8rk3fHFSITLRbw274s0rYQlacMZvtep2h/WMKUvo/jH/nLqduEYQgs+tq6qOjJPyCR0acvYVHqAK161wfOadKyU9S0xDnYa0SLBXHW0dLB8Z5SSusfracec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Hjbc+BH+; arc=fail smtp.client-ip=40.107.159.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Hjbc+BH+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hXBYBQ8TfP2FgZSOngqLU0Jgc24aAPr/mxXoofEndCapFLIriCI6Yj5MAYPjZCo892B9vP8WMu3iJ/QthkUF6TUkgXevop8c5jJS2ie0mBDXcxNl1NT1QeB6kRLK8CsVMh1M5+y7x+OHAIrfx47RP7AsHyep8C7D30OSROrEWKwd+zjJb0jiWAuhjnN+VaD02O7eHsVS6YeGvByaKb9/pdxfLquWh8KBZHXS9mr5nzM8W9LIZAqxO5JPhhHhiyotgJsqKh8t3T/V8QyXZLkUeUvQCMOdxZV4ErhpXmasYrBI6hPTtOPu1RskBF54RTtn4uEx5QNVSRg14RxprlVQzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nzq2KG8ZteMRFe7Wb/ER6ccj/RBlhwy9Aahxfx9806s=;
 b=ZOpRiop+TXff//AiV357oSdNuqwWmBACcLlRNfE+sWZCVeLXb9H4Vz+Nn0x/HJv/0FgX7cW+Z1ny16kbDqhPNevhCYJZQKOrHSV61cE6AsGwJz8dCULRS4UQPO8kmgebeRHsuy5tEuljjMeUzw79aAI+jd89v7LuhxuwO97bepbcEV9Ogi5+miCNcnaLcw8eVjannOj8wsDg/JTOwKXesgCJ1gTINr/S4e4GhG3tvpLEIyPQxdG5Kvs3tSRcZWzzF0Nn5lPIakd5IYRFqRQam9kckePa2kDH7OPoeRdv7oPQ6G5dP4pkdCB+/YJqjUyJKHIuBsG4PHe0QR4zoNPxQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nzq2KG8ZteMRFe7Wb/ER6ccj/RBlhwy9Aahxfx9806s=;
 b=Hjbc+BH+0gDm1sa9u+leFqw5Y3SeDxf3SN+qgcdobgdJff0i/R7ftUrJyrcIfp9SNFsXNcqVlIcCuXwxOeqvrfHRWCraUKmF3QCgG++KSVea5g+UAMwTvyGCGy2vCgQUH1SZc/AbDJ1HLBFnzfuKLkuZbB4IQFLcO/hN0zXNR048wO0IRfl/LGom0xD4AdKE0y+GKnFqJ6Kz/bm7SCaG1d2V+rwj2DFWV4DgwbsVcu5cVcY9Hfsk44r4Dp+Vdl5D467bjs9D8XD2kLNdJ5da/3paWO63IHC6/30rLugeXTnC7btfC6yHKa6u5FyrqCF8y1wILO9kTK1hjczUg8LAhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB12640.eurprd04.prod.outlook.com (2603:10a6:800:345::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 15:08:32 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 15:08:32 +0000
From: Frank.Li@oss.nxp.com
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <frank.li@nxp.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	guoniu.zhou@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Guoniu Zhou <guoniu.zhou@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v16 0/3] media: nxp: Add CSI Pixel Formatter support
Date: Tue, 28 Jul 2026 11:08:23 -0400
Message-ID: <178525127627.3480677.16359772805058311582.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728-csi_formatter-v16-0-1065ba47530a@oss.nxp.com>
References: <20260728-csi_formatter-v16-0-1065ba47530a@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR20CA0006.namprd20.prod.outlook.com
 (2603:10b6:510:23c::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB12640:EE_
X-MS-Office365-Filtering-Correlation-Id: af7f078a-e329-4927-b04b-08deecba16a7
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|366016|23010399003|7416014|19092799006|1800799024|56012099006|11063799006|10067099003|6133799003|3023799007|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
 HGiHdaCakNzqyzwXNUJroZx4pJot8jYxHBQkuug44U9/qeO8B1bEfLeeGqLVemw7ojcjdD7FAuqSDc/JybriymdfSp/uzDwI+QFgLf+kPSP/nLJ/mZznle2Yf862EQUEWmsXR9P3Kym4JTgJ0eDNoFFZV2uokYmpnXVLv+1VLDcTpE2cndhytYtQ5FQOXu8EOuODHdb87IBgWWgyePq5TgejJRwkWiVxcaL3G5B68UmMwSlOJ4zP68iZeDACNU+o0hFXML/qYrBwG6KteH9uKQf7etQZ4ka9lLHBkyQEJwfVJqo1B9F7RauN+dg9Y9PGRdEqV8x61EK83ibq0ey0ckDU9SaXeD7rwtkmBGvn1KGq3+fgdSYGzH+TXvQNz3GD6PiSzGi77IzEi5RgOD7XWqnsksScqW3QM8ECMFyOu/fzzzk0nJqy9AcxlPVwRdGrKRo/3pdUhq3QMisdr2V6Yf9yQk38Og556maKSaoxIEC6AwrdlHFL8S2sUIFibGCqoAK9SEB5JG6NeuHenYfLSe0YaR2ohVZrrn+LidSxXPlinLt3wTOO1Iej+GA0keK3UHqCSbnfqiJg/JmRe8gog66o4/Fsf2A3PEOuwCvH0qlIh3j/unI/l/3WoF6xj8hPEnM1qs0Oc4kcwDRn1MkOonTdgmqg6qWMhHxHpnqSw2jPoAYBYuo8AxMgLahErJ1zkllwH35sJEnoVFp3+ZZchw==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(7416014)(19092799006)(1800799024)(56012099006)(11063799006)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?c3plOFNmNGVwb0RjUjcvSkliU1dMQ2RlVGxHQmxjakIyWTZFcXZ3eXBxdWhE?=
 =?utf-8?B?T0xvZmN2bCs4YVJ3anFWWDlHdlUxVjBpQ1lZSG8wOTZ3eE5IbnVyYXcxcXR1?=
 =?utf-8?B?WStkNEFNMjU5djMwT1c5NzFxMDQzOUlaQWJVSE45WUlVc2xObFdDUnBXTXFF?=
 =?utf-8?B?c2tneXg3Y1lMZm9MS1BxaGZkaEZBeTF5QTA2WnZlUWhJa3d2TndXdFVTZjN2?=
 =?utf-8?B?YmwrenppT1FaSTdXMGc5dHhmaFVXOEVvdnlKTEt6RDdUaVB3ZE8yRlNnSGV6?=
 =?utf-8?B?eE0yMVhqRGJoOHgwdWhpZG55cmtCbmtmcnRzcGlmMVpzK0dRNjZiQmphNlJN?=
 =?utf-8?B?OTMwTVduZFk1SEIxTDBoRGtLd0IvUGlIUkZ4NTJ0Q3hZbmRBTVdSdFA2NTRj?=
 =?utf-8?B?dUlrYVNlc3hNUnlPTTl5Mlc4Y2c2NEpYbllUSkh2MWkyblBpUGd3T2YyZ1ky?=
 =?utf-8?B?UUNCWXRIKzdUdEZCYWVySy8wekZEbXFxdGpHSjRRVjg1SXg4RmFJSktRcWgz?=
 =?utf-8?B?TG9nS0t5YnFZQ0loUGJBMmFjQUhPUXQ2SUJ5SGxKYnJwalJhK2pGV0xldzFq?=
 =?utf-8?B?aUdxQXpDcWJpZEtkZ0tVWmJucFdRa1JQRWdTYWNXcHBuclo0YWxyMEgwMlpT?=
 =?utf-8?B?dDNteTdnWE5zZVNHRFB2MW5MOHpmNjlncVZWQU9aSm1EWjRielFRcGhoM1cy?=
 =?utf-8?B?b2ZJKzA5amE4SC9ycVhjMThnWExQazk0aTY4cTJBSWFXZ3Z5bkZpNUdDdCtj?=
 =?utf-8?B?YUI0NmxidUsrbjMxLytsdERCUFNxS2RIeHV0eGVMY0EyMFk3MFlDWERrb3NP?=
 =?utf-8?B?MWlKK3dGbUVpNUl2NGxGREhhelc4N1NCUjNtNUUzUEpKVXdZdDJ5SitScVdO?=
 =?utf-8?B?dllvakFkMjZ0MjE4ZHFvUkVITUFZc2toL01xZm04QzJkRXQ2N2NYTEVtcHQ1?=
 =?utf-8?B?dVdnS2ozbW5KMWlKV3R2SzBNRiszTDltaFZjb0s0QVhrK21tOTRoalU4WDJ6?=
 =?utf-8?B?eFgzVHZPYlBjTzErOUNtVWVLbk9ObnZVSTEvSXQ0cVEva2xuekFLRHRsaWZ2?=
 =?utf-8?B?OVhmRkhySkQyNktyQmxIbnhKK05KWHcwcmNIMk9UY0hpM3phaXFLYUR2UEY5?=
 =?utf-8?B?MEtBMlZCYStpNXBoMFJSS3pyYnhDMTJRNEZhcmx6Uy9XUDJ4WXRIdXl3cFdt?=
 =?utf-8?B?L28rTlBmUGVVZDNWM2QxR2RMQXlHMFpPQjB6dU9oUXRHT1ZUa1lTZFdIT2t4?=
 =?utf-8?B?VXNtRm9wN1Z6L1ZDMUpzVUk2Y3YxejBuejVOUHZFQVMxVGlZejFmNG9YSjRO?=
 =?utf-8?B?ckVOUldzdVFVRHFoTjV3NmV2KzdYbzJHa3hiNDUzZzhqTFZJSjVDY3kvTFFJ?=
 =?utf-8?B?UWJSeXR6UERZNEM0bURXQk5mWWZJTUZJMm9pK2VJcDJvUllIM0lETS96bW9T?=
 =?utf-8?B?VWVtVDNhTTBIMFlqcCtjL2tZMmFONlJUa2hndHcrTkEva01GZjNvd1VLSFh6?=
 =?utf-8?B?YStJNVMvdkxhTitJby82d2s3b3FRODhNcG9XT2NvNk1Fa2h3bE1DeG1YUkJ5?=
 =?utf-8?B?TmRhUUpKeHozWkg3Tk0zZW00NjFTV1V2anhjV1pnRTd0NVU3Z0dOb0VGL2c3?=
 =?utf-8?B?UGlOaVRRcTk4QmluSUszTzdlQjJJYWZYOXhmSnIrZ0R6Q1VyOG1OalZkYnJT?=
 =?utf-8?B?L3FZLzFxUDFLRUl5Y04xVHNJeDU2M051eHVSZlpqZXI4Qllrd214cnQ4d3NM?=
 =?utf-8?B?ZTI1VmZEZWJJT1hTcExSZ0Y3SmVIZmNTajdPVFVITDlGMGVPREVxQ1JZR2FK?=
 =?utf-8?B?Y3Z5Tk9wbXdjcXQzWG1rNVR4OVYrYmQ5U2VyUGNYZkh2YnRUSkRndmw2MkxY?=
 =?utf-8?B?TXBlUWpKN0l2VGdRR0h5d3FrWU1FMVlXOXhZRXNGL2pQZXpvcEcxZzFqRnM3?=
 =?utf-8?B?ZXpDSjY4alV0N2NOMVZQaEdidnJ6YXpwcnBSODVwK2hLSk9LSXdydG12SEox?=
 =?utf-8?B?S3d2WUdVcU1GcXpSY0J5WXRER1dLWFpmcWNtZml1a0Q2YmY0MTdxZ1RLeC8x?=
 =?utf-8?B?S2VQK0pPeXRSczFZWWNEQ1B2VFZKVFlGdUcxRzkzbzVSWDdDRjEzdWRuRVFG?=
 =?utf-8?B?d1UrOTVXSEY4d0pycWdzRUdXVW9IYTNlTC9CdkdxWW1YRVpQU0c3MTdmSjJI?=
 =?utf-8?B?Vmx0SXl2SGVzM1Frb0VIVXQxUmNxVkVOVWhIejEvYlpWUFZIR3Fabkg3R2pU?=
 =?utf-8?B?WHJqdjJoRHdHemRrOFVYeVJQTHBNeS94eW9VT2YvNTNtWXNzRnVvdTJXY2xL?=
 =?utf-8?B?TWV3M0k0OSt2elZiYkFTdnFKRTNaaUpoRDQ1Zk9yUWhwTjMzTkVNbU9XMmxO?=
 =?utf-8?Q?ZKUTuLub2fhtaK6jaPBj1WidcqbpVeSQeMmgw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af7f078a-e329-4927-b04b-08deecba16a7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 15:08:32.2735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qghomww8Xkw3BhxucNXkSGL8Io3lfipezUBgnlDzUsv1X80mDoPvOXzwV9qpKdcnONvtZDjvqcRWNdA7WZcWYIUKeeUgUfiHJD0e5FOwlmN3ADmHyyYbAM613M8nP1Na
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12640

From: Frank Li <Frank.Li@nxp.com>


On Tue, 28 Jul 2026 14:14:13 +0800, guoniu.zhou@oss.nxp.com wrote:
> CSI Pixel Formatter is a module found on i.MX95. It could unpack the
> pixels received by the formatter and reformat them to meet the pixel
> link format requirement.
> 
> This patch series adds a new V4L2 driver for CSI Pixel Formatter.
> 
> Background
> ----------
> The Camera CSR binding was upstreamed during the pre-silicon phase when
> the hardware integration details were not fully finalized. At that time,
> the syscon binding focused on the CSR's primary role as a shared register
> provider for clock gating, QoS, and error handling across Camera domain IPs.
> 
> [...]

Applied, thanks!

[1/3] media: dt-bindings: Add CSI Pixel Formatter DT bindings
      commit: c0af539f5c2841f0756f8ae98808e1eafe4538af
[2/3] dt-bindings: clock: imx95-blk-ctl: Define formatter child node schema
      commit: c6cc72164123f777933b0d3453fa3e3ad283e223
[3/3] media: nxp: Add i.MX95 CSI pixel formatter v4l2 driver
      commit: cc29462f4d0723502feff17ff1758c690c5fce4d

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
