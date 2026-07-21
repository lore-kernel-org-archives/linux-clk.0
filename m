Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013040.outbound.protection.outlook.com [52.101.83.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D0D3BBFC7;
	Tue, 21 Jul 2026 08:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784623050; cv=fail; b=qYLUemklM7zSTT3lntG9wOR6wnv0hVbwTnlTUU25lNWoTFXwZpZcL/Kfu0/8XMs1n4C/4axCxRWzmQqc5ph0olxQVAIZWO0ulzyLvuTgNwT+fhCyHrcP952ZaOTjl8zd2HAmjfrg7bCriIWZY7Bp+7MtTvXonWFnmwn7qzDDknI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784623050; c=relaxed/simple;
	bh=H/TAk2D9RwCn7uBj+jw6IdS/CYOjt9KD+bKg/uoY+NQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=WxQhkaB/LXEdcFP4r+lus5hZIQI36HHrBSeUYR1/fJI1cUpxaXKewzBUe6+kFFcJHb8UVukQgzTU4kuhU9iQO5iyaQKIFXvU4PykoMfujK2K8TI2mVb66P1N8n2y9fgTUuyxHDKKrMfoUKB6tqH+l9Bv2dQxSSGKrRgP0pz+Qko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=UlRLJhG+; arc=fail smtp.client-ip=52.101.83.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UlRLJhG+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VG+cqtz+JMRyLt3QgWeZyhBzWs6lOd13qMoaC0XE3b1qyeJPJbTsnwTEWpT/gz37vZDnQ7UQPe+m/x5yzTWd3QgzVICcqbgAkiXvFEvUzcyAQWoRsA2oTAJaVOZcM9ZciFswpj3+EfW+NXlzH2Jn6e46t9v/0DmoqqkF5uVnzica6rl/kiH0JA65F/ZDm5QLvMZ3jkQhXqbw1F+5n6gNKKqc0OQ7c1f+aPB1VT7AOy9Onj+3dCt5MMhRlQqOSYrMAqgIiuwHSWUpOSlBDFtOOWNuSEHlswjgX7bUuFTU2Kuk4kzjbPE7HaWLG5cnLWc9B7G+Y4HcTNP/3bwSosX+rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mclfXq4X7FngkFtNYE6rNc8SKe176tMLQRlBSRzmYQ0=;
 b=XDq9SYUyUpCAKMM8Ywyv6NaiHg54PUVEiiOGC5AcDXb+LSf3mrKVvuPIorn/it30mH7aDfDOQIDjRQ+r06OE/nwgIsQTp9XzrZkob/a00/Z+r3YV6xgGlwwAJciZgIIW0NlgDXOXpO6oHEVHrVUevEDu0zm5sKngIdmA+RJ6DlYIWr+ZUrYV6DUZS0kvOtYogqAYLrc37YuimUTBTPU2G0hu3znv1I/felW4DSD87V3t6gpPTOTzW5UWr2GCXkhS9mgaZbYBAqyhjnzDK5byi5fkLcFoYtRCI/OmUZOwGpzPCSE/uD9NOKRa4Ij5bBzLz9S6nAu5u7z+e/dKSbh6sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mclfXq4X7FngkFtNYE6rNc8SKe176tMLQRlBSRzmYQ0=;
 b=UlRLJhG+flkjdbalsckyBpp5fHnFp2ufEMOkmrR0Cd8ly5syrGUfQLUC4J+jOlsxe462/QMxzNxiAz5mu6t7gd8/ZoIlLhiMxpXUqnk822/PzRQ/46bJrmq7gMPQX3BFqXIUlRfeSM6efSNBHAlveM7jHvJoGBO2/KiqD+OACheOI4LbVxWH0oG3bGOvXnJuEegYdZDP/ewltNWH3EoeTGO1czJFOzcCWWz5HIicjRoC2w41GbNw29EyoI7oqVifme6Z84kSMnX5zRZkizBPJaVDt7DgbGcMtK2x9Ql41leaJtKUFNckV5fiMBCSpULrQ+skC+59T7z7ZdF6zU58UQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by GV1PR04MB9150.eurprd04.prod.outlook.com (2603:10a6:150:25::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 08:37:23 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 08:37:23 +0000
From: guoniu.zhou@oss.nxp.com
Date: Tue, 21 Jul 2026 16:40:21 +0800
Subject: [PATCH v14 1/3] media: dt-bindings: Add CSI Pixel Formatter DT
 bindings
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-csi_formatter-v14-1-ca239fbb441f@oss.nxp.com>
References: <20260721-csi_formatter-v14-0-ca239fbb441f@oss.nxp.com>
In-Reply-To: <20260721-csi_formatter-v14-0-ca239fbb441f@oss.nxp.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <frank.li@nxp.com>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Guoniu Zhou <guoniu.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784623255; l=3999;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=1KxD4fu9BB5daIhnJsRaUVCtE6uczPiLVZmekvQD2LU=;
 b=h22kuzLq4vA4u39u4e4w7ZfW4+jN/aTEK4/pKmFqs4pNBGMI5ppmOkf0rq7++ex5fCT+dYcqw
 90EtyrCtLpVCSn6pko82+h+wrwlbS5qnphvdTfijoe1P3+rJNrbzIkq
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI1PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::14) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|GV1PR04MB9150:EE_
X-MS-Office365-Filtering-Correlation-Id: 418477af-b1ae-46fd-45b7-08dee703485b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|23010399003|19092799006|1800799024|366016|921020|56012099006|10067099003|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
 maY2pUActndwUc0bwWgjDK+s70Bw+WvpDM3yHgled8tTDlfy2Wk6pr9Gu968XeIC+Ezfzf8jAJJsGI98/UIgUrSqdneWxt8G9eYv7t0h+2a3Ym5NAiuYdJXLDUlg+lBZGLUWCgPyNYJ04n7hmFtXaRxgaz+EK2TwYSVFk0GE2MDJBYTfLPew2C7S1/ZVwqof2uC2kP5oNGOsnSfV1JCf9omcodSA5QhKta7D5rHGIwTRjO9xet2oxH0MQk4lIcxxEO6tcNNQky8YGG15wE6KfAzWU/TVVcuMYyHG5Ah8Y0DisBAm3JZIpMP8Xb3uHOIfsXeA9ipYtx/d8k5r/PSQL6PKW9RZxPkX0KrTdyiIeuVlIoODEuRR/r8JK2uY75DrMwZiuu6itXacyW1ctBZ57miUZCAcQ41Jj15/4kLx+jsa7nkjqfz+dNWgRCtppgMoG6DvPjwhPEFQtTkTdxqBZHIaesK0P77a3Mzl/CETw1bf1xvewxcskfRzQpAhiMZ88NFzdbnG4503x0HhbCm+EBRWBKJ941unEuBNP3gluOPy20fjhdyrdi8zSX6e7IwHdlBhYnwENtozyAnQ/fkaJP1ajIP1cST36oaU5KI97H3gTk+eMfOm5Ma6WRgWXwnWNZWt0NroA0Xb2iq3Ux6xLX3widKFhhlC5OtiwQTspso=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(19092799006)(1800799024)(366016)(921020)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?bzFIYWpnanRCdnRFcVFRU1FmMWYrSTl2Zk5Mbll1STFGVXBKbzYrYnM0WE9E?=
 =?utf-8?B?VllVQTcxbGxlbjdwQ1pKOStpS1BydGhDc3VBN1ZpZW50N0YvWkRYTjFHNFpS?=
 =?utf-8?B?NlZBRzM1WXdGZUZLM3NvWlNBUXE0SG43Q1JES3BLdExUUTNvWWd6amNYVGpv?=
 =?utf-8?B?a3pUOGFwVzRQTmxFNWtuTjdmcmF0ZmJUdUNsMXpmSkhxenpBcmx1dFMyMWZI?=
 =?utf-8?B?T2pUMHZQcWxmRExqUnZaN1lwSk14Y3cvRVJhTERCR1hGejdhRXY3aldmeENP?=
 =?utf-8?B?NEw4eDR5L2UyQTFKcUpHQzBYSHNlQ1dKNXJWdWtpV0lZa05TUkdaemcrUldx?=
 =?utf-8?B?Rys4WnhVMXp6SVpEVFBvNmJDdVBjV0xHcjVDeUg0blVJOWVwV2k4VlFGWU5j?=
 =?utf-8?B?eFZmekpzdnZPUnRlcURwNjUwbnc5WUE1ZllQZU1WY0JTRWlSMElOSTVVSVp4?=
 =?utf-8?B?b01WZXp0OUdnR2ZZSkZlL0pDWVlyaGlZeXlvNzNvTEZTbTg3ZlRCK1QvV0lN?=
 =?utf-8?B?YncrQ1pUUkNLMnNKZ2JaYWttRXByNjBNc0E5YUpMbnpvcGs5c3crbTJzWGlV?=
 =?utf-8?B?TVYzSjRya1RLNEV5RS9RcUxNdWx5SzBXU2l6dTI5Z3hkWUxpdHBiWlBQcWJq?=
 =?utf-8?B?bnVJUkdUQ1p5WkwwWVlyTi93MUxPYmdUVUlCMG0wTUh2Ykw1NGkyWVhqcUQw?=
 =?utf-8?B?QnA5LzVUWkxDclZmRFJzQ0xET2NlRmhlL1RtNDRpM1B3OFBGZzR3VXd1YWV3?=
 =?utf-8?B?SUlhaWFWWFR3YjIwMWR3a3NGWG1nS2ZLNnVWYmw1OEZMdjlDVWVSaWk2d29u?=
 =?utf-8?B?MkhoU0NtUjJibmxSSUxrT0dhUTZxc3ZucGxmNGxXMThXM3k5NmY1bEZBcStD?=
 =?utf-8?B?cm01ZXRSTDA0STU4YzlsNkVYQnNCdmRJMVlGUkZyZTh6UWllNWFiNW9ZVWM5?=
 =?utf-8?B?RXQ3TVNMcGtuRFZ4Uk5QSlQzQWRaZjdmWmdodDJjaU9pMGFCZlVXR2hhR1hY?=
 =?utf-8?B?N0V5MWVJMlpEM0haU2s3aVY1b2RPOGZ6T3A1aTJIdm9MV293aVJlWXdKS2ta?=
 =?utf-8?B?M21YZDRlcFd1QTQvYVJFSUpMUllxMXN3OHg3VkZlMFJ0dGM2c3RGYUlzN1Vt?=
 =?utf-8?B?QW1ja2FOMy94eWMyVWc3cUFNZC9EajJ2YjJYSW1UTHdaeTFpRnpKaGdIZHdY?=
 =?utf-8?B?MXVpSFdCSXlEdjdnUWljZkxpa0VoRzZUeGk3c3RmOVNTVGFGNThSemFWeFU0?=
 =?utf-8?B?NWowQklSWlF5b3Z3TkZ6OW1tWGlrUFR3akJWYVVFZE0rVmNnOGdlaFY1alFN?=
 =?utf-8?B?elZ6NUhKb2pRaVJidXZHQTZZaFJLRTdScUFVRXF6SWI2S2xOTVNwcjFvK3lC?=
 =?utf-8?B?MDN6MXBzY001dHQrUkJtQWRYZTZQeWlsTVhRWlN4ODhRY2V4V2NHOEh4ejk1?=
 =?utf-8?B?K2dDSCtZTkxlRDNZaHlVdmV4M216WlFoZC9EOUU1U25SYUdpS3ExNGJGZzhR?=
 =?utf-8?B?K2tTa1MyUXpLOXB1c0JIZFliQXhnRnc1R3dIWUZXUzAxTDF4Ym5iRE0yZXg1?=
 =?utf-8?B?empIbnlqaUh1NDk4V0dMcUxBMGxRR3YzazJobGxYUlVmaHIxWC8ySHR3VlhD?=
 =?utf-8?B?ZTFGK0t1blRmQzVEc1U4KzkxQktuOUlHMW5nc0l4YXVOaUNDa0U3UDZjY0Uv?=
 =?utf-8?B?Z1c3M2NZbFY3YXpoamEveXRsZzEwdjgyNjMzdnoxOFNDeElYeG5HRzZNcERY?=
 =?utf-8?B?a1UyT0owRUg3a3M5OTdUMUhzREZFaDlpcVpCcjZLQXJFYllLWFFHRE5sQ2pE?=
 =?utf-8?B?NUJTTUZyeVVMYmFQSTNra0s5TlZhMnpSM3h5QmJwRWtJOW5ITW1vR1ZxbUJ4?=
 =?utf-8?B?U2VuM2dCMDVqOUtwZGV6aHNuR1hCUkpBNndwc1RudnFPVXI1RVV1Y3N3Wmp6?=
 =?utf-8?B?bGhaNWJsNUQ0Rm9FVTArVGRSeFJmNitNSThMRWVDZ3JDbTBsUmN1UWtCWVNY?=
 =?utf-8?B?UDU3Yy96bHlQSnBKcmV2cTc3Zk1KTTk3bXhmK2hoNDZVVWtZdTlqeWhEUlZY?=
 =?utf-8?B?Vmx4TjZJZWdSaEpYQ0RIbGpYTEF0dVAvcVVya1RUaDZzYTRoZmxXeFUxR0Ru?=
 =?utf-8?B?TXdkbWk0MGR2ZGN6UG9FV1JMbGhJakw3cksrdEtzOExoSGhZU2pXK0llRW9j?=
 =?utf-8?B?YjBMaE5adzA1SVU4WWF6bFYxeG0xUVdoa1RLWFp5aEtXa0xQWlBpVmtrZ21W?=
 =?utf-8?B?eXZKUXlIWnkvZTJzTkNrSTVoY1NvUDM1TWNRMnYyWVFxY0J1RHVRdGpmNmZM?=
 =?utf-8?B?RVJ4ekZxd1NFMzJnRmlGTFlRbjFQOG5yd1J2ZE1tSVBVc3MzUUlyOWhaNWVn?=
 =?utf-8?Q?abH+BiL78wu1AmQKMVl+jgENTp8prLvTCPXg+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 418477af-b1ae-46fd-45b7-08dee703485b
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 08:37:22.2638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lVLDydJyHv8WLNFhEqqEpNv0M50B5SGatw6Wma0mjSgKAGGFEdJ75b8IVAMHrhXEys1SpHhij6gzm96X9kjYNkZxbiPs49zeZjl9tSiPvZ69gLjb1Fu3eVw8S+AikaMd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9150

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The i.MX95 CSI pixel formatting module uses packet info, pixel and
non-pixel data from the CSI-2 host controller and reformat them to
match Pixel Link(PL) definition.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes in v14:
- Add Rb tag from Laurent pinchart

Changes in v11:
- Add Rb tags from Frank Li and Krzysztof Kozlowski

Changes in v10:
- Drop syscon parent node from example
- Drop Reviewed-by tags from Frank and Krzysztof due to binding changes
- Add description for reg property
- Add space after formatter@20 before opening brace in example
- Enhance the port description with more detailed information
- Delete the blank line immediately following the endpoint in example

Changes in v9:
- Use direct node instead of syscon wrapper in example

Changes in v8:
- Use standard port reference instead of video-interfaces.yaml
- Add parent syscon node in example to show device integration
- Add required constraints for port@0 and port@1 in ports node

Changes in v7:
- Change compatible to imx95-csi-formatter as IP is i.MX95 specific per Marco's suggestion
  Link: https://lore.kernel.org/linux-media/20260511-csi_formatter-v6-0-01028e312e2b@oss.nxp.com/T/#mcd135b3de179b3cb69daa1fd6e0e8e27c85b3332
---
 .../bindings/media/fsl,imx95-csi-formatter.yaml    | 88 ++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml b/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml
new file mode 100644
index 000000000000..58c4e1cc056b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/fsl,imx95-csi-formatter.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: i.MX95 CSI Pixel Formatter
+
+maintainers:
+  - Guoniu Zhou <guoniu.zhou@nxp.com>
+
+description:
+  The CSI pixel formatting module found on i.MX95 uses packet info, pixel
+  and non-pixel data from the CSI-2 host controller and reformat them to
+  match Pixel Link(PL) definition.
+
+properties:
+  compatible:
+    const: fsl,imx95-csi-formatter
+
+  reg:
+    maxItems: 1
+    description: Register offset and size within the parent syscon
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Input port, connects to MIPI CSI-2 receiver output (IDI interface)
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Output port, connects to ISI input via Pixel Link (PL)
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/nxp,imx95-clock.h>
+
+    formatter@20 {
+        compatible = "fsl,imx95-csi-formatter";
+        reg = <0x20 0x100>;
+        clocks = <&cameramix_csr IMX95_CLK_CAMBLK_CSI2_FOR0>;
+        power-domains = <&scmi_devpd 3>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                endpoint {
+                    remote-endpoint = <&mipi_csi_0_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                endpoint {
+                    remote-endpoint = <&isi_in_2>;
+                };
+            };
+        };
+    };

-- 
2.34.1

