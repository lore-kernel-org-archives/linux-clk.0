Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010013.outbound.protection.outlook.com [52.101.69.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FAC3DAAC8;
	Fri,  4 Sep 2026 04:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788496163; cv=fail; b=VXQoeeP75H9r9TUBDNF/hyRx85KfwoF0qKD1auqsg/4X2ce9+seq5oktWLITqnqyI4RozBXjiW/EYCMR6cGG3Yr/Sjue8LWYyA8Q2PPTraaG0nz5aqR8w3pghdBMlJrDTWf3zXQrilmoalSy6pprt0jd4Yua0EopDx/n28NC3Vo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788496163; c=relaxed/simple;
	bh=eGEQ3cdF/t9JqfFi+2sX6p2PysVV3giE2aufYHB5voI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=osGE7Wu0muEpRO+qkAo1aYh3L5HGVbnAAczN+hIKdMZb0CFEVrsWjwU5LIAbYl2fVyhlVp2p2UH0FpDVOXwupZ4hY2Lptp7mld98hDNZTj8Fp1WDewQeeIwIdqGpda84BPGjqlqAIoj+HOI/O1o1PiYqPFEgYxa59vdCrNeFE64=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=WveOMeVu; arc=fail smtp.client-ip=52.101.69.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="WveOMeVu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uzD5/DHoLFytQnbrdHekeE6do558su7yiZg2gXosaJbV3zdUXf2kFMhyAIOg/UFDjpRRzPTcvtzFPtMFtf2fLECQu1qyVedq003NMX3Fv34/22g/w8Iymx7srofx9G8ufh/8n4GagbRl+JZJfP2stqVLjQf4dAn5TiIbbCaCuRx6+Nd7ND3BM0vkoA9Gx40Y//v1JEQtmKtLn7KEw85IXtFbIloVeVDdaaD+ZqDs9eaQ16HHxLgA9aSKLzLJSlGZosxQzXZWy09j9CwyJVP8R9c4FSRcotJS3mj3S/1x0PpHa1v6IvMCj0gdFDHim0dHjUvaU5/cXI1/Bj/F+ZdBZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eGEQ3cdF/t9JqfFi+2sX6p2PysVV3giE2aufYHB5voI=;
 b=V6TM2e3XM1uUByO+hAb5KjY09h6BlhQf1BM35YN1PlefBKTPSljDeV01aPOIn9Wzif9oNhAiI2xRRAtvvYclsYn/SHqp6CBV76iajHn94arTzeqeCrlS/8KbFf+ZOQvNMdq7sl0JvNdWJW2ISpOY97ZWnrNsFwpJOJIhR4LVK6SKrgj2T7tCd7Zzj5E/aTIImXr4szPz2E8i2OXF9DN7DBIr+UvGGAq92jVq9nFepbRV7oEA5x1O+lLzZngdLAruIylp92S+DxFn5IiVuDt6idvFn8UWI9EUdrQx375S03EHrnQPhgPa7yszZo7WeTBxRyqF/e9u8nHzpLbFgT6EZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eGEQ3cdF/t9JqfFi+2sX6p2PysVV3giE2aufYHB5voI=;
 b=WveOMeVuKEsQhgknfGzIHVpjA5f0d5bA5F+VSTclu7nwyue2oh8qqM2Bwa6grpOrwJTNFTZlf6c1vAs3ghZNoxDJ8DbUz+MELsLaYD8+mBR0vnj5Y2dho2xPG19QJjt7LlkTDAPMRhH6fzxFtxa9jY1bG9yFRtdfZOlOcqQAImr2yozoMerwsKj791yHNJjjMl7dEz+cTC+78ps7V+c4CEJMsukEWqL1SM9HC0paO3HanvPcIEdyu+POqMzLnA6IoS8Wq6gTb+IX4IRTErX/v9R5hvVBCaTUdsQVxdSdt7K4/hpvLGFUfCaAwa+EQJnalJSUQ0kfBdB4aFKbVhknPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV1PR04MB10894.eurprd04.prod.outlook.com (2603:10a6:150:20e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 04:29:17 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0382.007; Fri, 4 Sep 2026
 04:29:17 +0000
Date: Fri, 4 Sep 2026 12:33:26 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Sashiko <sashiko-bot@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH v13 1/4] clk: scmi: fix SSC spread conversion
Message-ID: <appKFmDv1EPvQsNi@shlinux89>
References: <20260903153836.373267-1-dario.binacchi@amarulasolutions.com>
 <20260903153836.373267-2-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903153836.373267-2-dario.binacchi@amarulasolutions.com>
X-ClientProxiedBy: SI2PR01CA0009.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::18) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV1PR04MB10894:EE_
X-MS-Office365-Filtering-Correlation-Id: 74f37013-491c-4601-486d-08df0a3d14be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|366016|1800799024|23010399003|10067099003|6133799003|56012099006|22082099003|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	l+VGjnBhFIF70iJ3G5w+dIF0/x0a7Z1laY0R8dIbC9M5UstRYOm9AA3MuEEP6/YoAhXZOiimvwVB/I+rnehMZNKLbZ+s9MV/Fl6oFxprbUOZg4dXgLbqPWMDGtknCpqhEIUs7OhR546fXBQ1mDG5Vp8YdsKeRAr/ewqgqOAUIIiottOV2SCO4xOHnATk/e/F/X+vvC8jrtxu0icyJouDxvzYQM48EytJcjmqqviV+9gvbx4HeebtXJe2MwoBkj1ONMf/0aw1Db85nitP3duVPWiTaNSoptd7hDnpOBWkSt2+nikffj8KPX20CbejE881P1+yHrNKpBOqq8BjHPGkoCalXMxA6sPVAty169pfDmOaz5xIrfNbkHFFFOe/6nAdLIYjppGXo5V6vryA4Y79y5aWoXZAkSCPe1KwKC+jMCr3P1U+Zh70VK2ukgMwkKlbWtl/x+uqWpG+FG26K8X2vAsqzI3XKYLbvSegNfEZTk/KpusNdFiJMviqvJPxb4xioYWWwAwkQHwUlGEFidgWpeXjQ4PX0Hs8drP2Z6Bv+TiU6Q8xDWRS1fQpUcW8/+XLD9MpiMUvaQs/uvi+qG9MxTKD9CrdJTsSP7Ndhmz8W32rILXuDj8dOy3g3Zppt07xfygb+Rc3SNTL7IxuHm5nrKYlsfYrp0WLw9Ukd83MlI4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(366016)(1800799024)(23010399003)(10067099003)(6133799003)(56012099006)(22082099003)(18002099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?evuA7xaIhvee6kpBQJtSmKDkrzKf/If93zP9AiF4mDeOc1rT3hSmQO3WO4Qf?=
 =?us-ascii?Q?KLJujIVUahjKHf5dwjYttw7fQbLVjJ9q8+xrVZ2RLYaAZEo+bsbNhV3ZtJmo?=
 =?us-ascii?Q?RfJpMWXqW1qw5MEN/2FxhvfReOJQXh5G+aoSkMDFUy+k/NFpFwat2J5yjcez?=
 =?us-ascii?Q?XQAWn8JrC8ephu8Ihl1nZNQ68R78JCbsJ/niSdVc8y+FrE28lZnQdEcAaFkK?=
 =?us-ascii?Q?fdC6TPpPj6YmxHV7ZDfsWNnVo/adBbYkoVyPWficfPdQzpsP+6X9voBimJN7?=
 =?us-ascii?Q?R5NrdJg+93gZkyWZt1+88zydogVU+8m/tU9e4bFVpCLhpfvirkrP7UcR1Ugb?=
 =?us-ascii?Q?9jdM6NBJZ/dEpIEy2xf1IumLyTev5Mfd0CTlv+u2TPO43FeQLY/mCljxKsPV?=
 =?us-ascii?Q?Yn9Jia76jKsTfikjWe4193VLbTeB3g6X7jm2ebPoqxT9YkWVj1WwBX9XmKAe?=
 =?us-ascii?Q?xPVs97/pedmNZNngS+LdhYKmPCBI2cNNciE2NNUeyUGUrGXSreJvzoU3hc/C?=
 =?us-ascii?Q?gSrYxCj9B49gCNAK6eT2Zn22X63VWxlTmwI7zxjkTFwmuBFRIRAzmJhAYbkU?=
 =?us-ascii?Q?fhPNG5kUMnGhRMIlA+fy+TAGqIh3aaBwYSN2Q0kOnt0hHJTXYYtXKTdI30x1?=
 =?us-ascii?Q?wqHOpdJW9dHHEw62k8IPXobnz37DjY2iHES9hUfUMQjl8Hy5bVlEnoMjwTtn?=
 =?us-ascii?Q?6sfcm6gdUe/jW1vSuZmH1GwzFxOEiDWJZoC4AiI+rSN7GbtioiaNulKNCpL8?=
 =?us-ascii?Q?p1tvxGwrq2PRMD1Py0P35DRO3a8sQQwK2FoFawtB0PKBM5GqT6KNJY1Br0M0?=
 =?us-ascii?Q?KS6szg1WMZ4QPYTgbw8f6jrjHtD0So4RjpNDEsmhNLzZW/jtmmjsS0/ZLzRa?=
 =?us-ascii?Q?ElGT/eHX4JcSw4IX8oWCzb83IFZkh54kv9hr8TzJ5J9R96whK4uzlr56v1R2?=
 =?us-ascii?Q?ZrVrY7sGNwmgQPGVzFTumqGfvnbBO0zSPRlBdooybusVadUIcMh5g998DHk+?=
 =?us-ascii?Q?91pQslSPr5k5hXV7VhtufG9tmav5A3vSeG9sehUJWf8TXHMTOTRy1qf163/J?=
 =?us-ascii?Q?Hi3eaawQoqxgLMn5vN2aKAIOqvJXSOmj3hhzlRJfhPCwfgEuTfCe3w8T6l2r?=
 =?us-ascii?Q?d+ulC3woh2YuA0xnSpkfRLa6XVq1oEHQ8pkS10kiX25RlXKE9le4DStesprf?=
 =?us-ascii?Q?ooi3n7x0XahItidvNnzFhvi+0VQW0bwUQPxJ0cu1MMjmT14oaMHy3f7DEVhb?=
 =?us-ascii?Q?2JtvrIq8w8hG+3xWF8mq4TBD7aML5DsiyUX0K3CTxYRoT1cHV/eBLtOoc691?=
 =?us-ascii?Q?/BuUgP9At2v+xk/tTfLvqeldJD7YHygXLJlOtVTR7YU5KIh1lqru+t3pZgdg?=
 =?us-ascii?Q?exn5CRfpny0+nGb+3x2+J3yD+2S7sb9T3IjhbVsOhQVPdbrJMh1iFXsAp/yH?=
 =?us-ascii?Q?fEBaWpbiNoEf5N4FKWmD4o1uyXz3eaJ63rdCgJUoTlEdBDS8LBCnHx4aky1W?=
 =?us-ascii?Q?OW4jCT7Lw1//i/wiFm4ygUuqzHuB36+1G2kkOXXzEUTF4fQCW6KsKK8JYbIm?=
 =?us-ascii?Q?cdiCTYR4k9BJfrgJXctcpqfMKQF4yfkt9X4dDq4Ws4nbIUI+ew7u344A1FfY?=
 =?us-ascii?Q?JXjNrH8oAyKh0fwtdVlGhN892FZIBwxMDjBpADtfd+qAg6cLznMLC/vkOcJs?=
 =?us-ascii?Q?HRIHwdP46PcxkoJ5WATJx/yLtpBMrfGhAb8Fi/QsHqzeQFTstJnQEFGIDzgd?=
 =?us-ascii?Q?nznnDqlGE3dC+/16GzvdrHyu0uzWJDyH8yLmwc6p0aexcrmwCl5P?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74f37013-491c-4601-486d-08df0a3d14be
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 04:29:17.1044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M3f5JPRsHmvMA/20+ZCIHmg7F3AWbSAwt3Tmhcig7PrM6D63xL5loAXxNBGABtqP9mSdDHutHGvjuqlrg0tQUjKGLCoDcB1UcytVtL8X2RoLSGh7o8orNvc/11ye2nmN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10894

On Thu, Sep 03, 2026 at 05:32:13PM +0200, Dario Binacchi wrote:
>The spread_bp field of struct clk_spread_spectrum holds the modulation
>depth in permyriad (1/100 of a percent), as documented in
>clk-provider.h and in the assigned-clock-sscs binding, while the i.MX
>SCMI OEM extension expects a value in tenths of a percent, as pointed
>out by Peng Fan.
>
>The conversion divides spread_bp by 10000 instead of 10, as reported by
>Sashiko, so any valid configuration is truncated to 0 and the hardware
>is silently programmed with no spread at all.
>
>Divide by 10 and fix the comment accordingly.
>
>Fixes: 77369b1e6a37 ("clk: scmi: Add i.MX95 OEM extension support for SCMI clock driver")
>Reported-by: Sashiko <sashiko-bot@kernel.org>
>Closes: https://lore.kernel.org/r/20260901155657.6A5981F00A3A@smtp.kernel.org
>Reported-by: Peng Fan <peng.fan@nxp.com>
>Closes: https://lore.kernel.org/r/ZR6PR04MB375776A27E98F140534E8F7FE488B62@ZR6PR04MB375776.eurprd04.prod.outlook.com
>Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
