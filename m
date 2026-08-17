Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012001.outbound.protection.outlook.com [52.101.66.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389EA3E49EA;
	Mon, 17 Aug 2026 10:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786964321; cv=fail; b=nVKthOF3ub2xlz2AdTZxRTR8vsrTRSuyur9M0yd999DOdWovOi30b96i7sFLx4a737mLMlYArhIXvuliafNqRT+JcXkcHLBM3MpnvNfHbmvg0KYDYOQbM8d9+c7Dh+wfFeid1srbGsN+STN6/0Cm3lnOQGGQizci3ax6emHfSYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786964321; c=relaxed/simple;
	bh=d2bTA3vd2WxUZLZI1XCA5UdpX5shJY7JOKgX9lG/CLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jjeVA1/FGH3QitV+mUw7Wf1zKDVI6xNBd/G+9jby8C8WyOTKuYp3pUndUTShJLr7Pb9RWSkWACJTTHYGTZXFOozD6CAXZBe/aoPkyn/vZYCBmzEzAG46T7mCA3zJabgINsKG8uQvSKjDuZeAAIBWBdRqvC4/f80EsknQo0aiCUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dCxQRM11 reason="signature verification failed"; arc=fail smtp.client-ip=52.101.66.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dCxQRM11"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c9iPiaLVBxZYdtV8kzJTSIRhxiXJACECWWIcU7N5A3+le2OPFZBQ8uy50tJFUItXAELZXcTCg8u813Tjh7sIpTZWTo4EwWerX+iSOusXehNOGnoI+pIixR+gjVHMc1EwV4ag8Guk4JZR4tNpqQklVLetSq/yXM1rJNa2IvqdUhXmS1zvtauUQWQRwkDoZPnU09lzWZY9QuLTi0pTxLqUl0Dfsj8mwYWL4/qq9jrDIYiga/owmYExj3NekMEtV+r6S0GHdAhFxaqJAAz88QSsV7qNUWa6rzxNS+c0NqeQuPd5epBcCprUM3Rp1FNn6y01CeDi8JvenM/b5ky3tvGD4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2uPzW6FyN9VgjoiGvyrSd38vQSaNDQyR4PpxQ1zkTvo=;
 b=ichS07RZaN2OSL5Z/iIJRSACQWBBpGpSbkIAuLxWlvVhZnbaRXZFe430vinciAkuIa4Se+GNxtMIgajr1dBxFDC7NByt1vVKC2DemyDNERqbQArq/grUE9nahnFfEATc+T/N4XqQzUsT5KNMlW/hM29Vj2Np3MJQs60afb3mjwGNjQzo1SOBvfhq/ka/eGr6XJyivVwqb9KL9/EzNG20ClW0VzAyisZmdDTEitdVoCRqwqQUrlNpCP3EilJYOCvQhdr9Kah69ijKGjJrh50fJ5usYBSn9VIIv65tlOmeL8mTWgcGbDKZlh335prdxtwn0IANAGsQR+MFDInjWgSrhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2uPzW6FyN9VgjoiGvyrSd38vQSaNDQyR4PpxQ1zkTvo=;
 b=dCxQRM11PV8PSNtunR42bPWEJ0C2zpSn6HuppTyrUh2ie6L3TXg4AmALOfs3+kLqvmP3VqGiYmDXtTS7XycdL6lR6z3NGUwcv1yIlaqn5Lhu3UOWTL/AriXprkyI0Fbjz4Ti4Vlh/6tXBlDOWJlcP4D8MZExrn/u+dQiP0OzddFZrCMbcYvyxsJ9+4alfpiRFNhfjmACgxvrrsIAYPyfEhQrWIjsZ4a2LYFIXtSr1eGzPKC/vOFwytkmFgWoDNevEoTS0qYFosdG0yNJac/7iDgFGiXNdLFMwizUqN4dNkeASNjeI/79a+mtDfHJsyzH08uhHOsDEr6Xn0+oBAhPsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AM7PR04MB6949.eurprd04.prod.outlook.com (2603:10a6:20b:102::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 10:58:34 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 10:58:34 +0000
Date: Mon, 17 Aug 2026 19:02:32 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev,
	Brian Masney <bmasney@redhat.com>, Peng Fan <peng.fan@nxp.com>,
	robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v10 6/6] clk: scmi: Add i.MX95 OEM extension support for
 SCMI clock driver
Message-ID: <aoLqSA3XOMJnJL4o@shlinux89>
References: <20260612-clk-v10-v10-6-eb92484eda38@nxp.com>
 <20260612085812.AA15D1F000E9@smtp.kernel.org>
 <178672426822.5897.11563790103554525148@lazor>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <178672426822.5897.11563790103554525148@lazor>
X-ClientProxiedBy: SI2P153CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::8)
 To AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AM7PR04MB6949:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f40cc27-458a-4880-e471-08defc4e7b36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|1800799024|366016|23010399003|6133799003|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	gAyCcFVAyTgpoRJdet8FwTjbT0eXYWwmQ35PkQgE/ZE4LE//fX3OzJQ+A29I+rZF8Q0vtIiQPpqRIpViByk0hb+gl7iZhEk8G1h+6InrjhJADqK9QpA5SGdRcBVzR84zoDQPnlNQvSLoc/aFrvjK/NyKoxOqlFaLS+rEgNd88gNyKcfwtWqCqFf2TU4n6Rm09w8w9Tih21laEipKx7JJyg+Ekny5ElwvPUUOVoxMhhaXn9R9XeK8KZkcpegwUOz/D2AsYD0mIGeCsctM3TXR1z2HrnKjwnorJeOcHqqCEKlIPEwNf6blLFgQvy65gN2Fa34Z/r9Q4wbLMOJbYtR8TRYNaCLMrzgiS1VczE+jTW0wes4SdNtjFUbXkdzjK8ADD0TZpP7tz4+ryrqpCCBAi9Ijc34PlKCmCWe1UBxr9qvFIWHaKHymR586kjbACdiwJVq3V6ihIulgaB0SaRkdp4OjMqCBV10zoEia8AosrP0Zy5M8/VKDv6SCMZg5YZHShv/6JC//81qMFJ77g/ibhJmSa5iqqI/THrCYEAhgde2jnMX9od8kenKn6rLQKFRXRtlUDge9CdLzi3E7DM+j6cRS7hpMAbOLca6eqa6V1RM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(1800799024)(366016)(23010399003)(6133799003)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?2LXh+RngDAJm1iL+iEdYAEIqCCHp1TMLPuyt9VWgCRHC+r+fKSi3/WoXU2?=
 =?iso-8859-1?Q?PsEfCZ/Gx2LpOHHH/1bNcHylOBVRxBlf7KSqBhU99ZQyWvAs9FoRQ/wTba?=
 =?iso-8859-1?Q?p7nekmA094D7eAQ6Z7vv+gt67bRvBNg5JREyQ/B92uRPzaeYfDJuJgxLNf?=
 =?iso-8859-1?Q?2xVqkU4dBiTe+kAuYzZE7/lhDT2mGMlcUnfvBViGbuiPa/OMjsShC8O1fT?=
 =?iso-8859-1?Q?jtkl6rkIC3EYihtvAY+O3d/lLAfg2U/dRzKdhoDFQE5RMcLKM32MQFemI0?=
 =?iso-8859-1?Q?JWB8epmmNVanT9GHXkpJ3+VGncRsh2O0ZTl7H4IBxcDywJ/yQczPjItV3D?=
 =?iso-8859-1?Q?MGmo84e5GlXCdeMO4yHMdZ10ADfVmoIkz+AtM6BWYF35VXj5ni7l9jaH67?=
 =?iso-8859-1?Q?VWHtMIZBHe3eQeGeZbeUzK8pyW7hweI6E+tCG+OUDPI8uqRsie4PGN2I70?=
 =?iso-8859-1?Q?GXmM+VKp7GXpMSfWKKVgSeb/J6FY2RUQaGSeVWNVj1ZgTPaY43OmuLma+q?=
 =?iso-8859-1?Q?v48vAi9jOqgBST0czhhVmseFM8i6O8fbMmzbW4n4cYge5ICoyltpzZI5rB?=
 =?iso-8859-1?Q?cVwEd0kVkamG5fQGcz598/OXblDCOwImyByR/PWHPkSoW4Vd9G7MOeFdsF?=
 =?iso-8859-1?Q?+PtfoXStr7hp23o6mkUqB+AXufnpVjCnr3h2G9hdZstJi/oN5CCBzuGtWu?=
 =?iso-8859-1?Q?9L/f/PS7HNXnrjy3YKEWOwHRjhKepHYczYKgz5PjMUVZD65iC3SywTxHhb?=
 =?iso-8859-1?Q?pXKvgy4/cJEb9q8rM/eAZj1OhEHq/xRD2S7r2P0t6q5hQ72wDT/MPKVW+a?=
 =?iso-8859-1?Q?7Wyv5makJvmHI5c6NyZNY21ghjPrlVrC6sg+OfONwI4QQMFDVEkVBqDusY?=
 =?iso-8859-1?Q?hwTFVLk1jhNfIVfqANcN4ISoz5pmV2Zplgobw0bsW7uxG/CP/R03gGSgeN?=
 =?iso-8859-1?Q?cAwdd6inSzoaOW/icR/FIHeWEBQTv8lg66ZQb91KdVHpITu+F2jWy2dpu6?=
 =?iso-8859-1?Q?OdfCVzVmeyf4EuVLb/WQejWpjxonptfdmagdXfmyAKnccgdLBRqIHDvoNj?=
 =?iso-8859-1?Q?RzS2IpzAyScAGHu53Yv1dBfX05Q4QApNW4bS71BmOHRm4wyPQIIAn/7hVz?=
 =?iso-8859-1?Q?Rk0KUYVjwaaQ8fC+/czU7JlMzCvamuWqG1TuEoo1aWscqRhVvAyAJa1tbt?=
 =?iso-8859-1?Q?zqKlglZzrCv7Gmp+6jZcxpi8ekgP3eohzrZpeoFzuTNo0TQaiTmChDXYDG?=
 =?iso-8859-1?Q?6ECWn2FGUZVx1ERLGmc4LNfu7FT0oZDApN2qjIfpfAktSZ+WTE1AFlAgih?=
 =?iso-8859-1?Q?2hSm8xg0zhrToL/zMCujk84JHj6WlTpSsP6gAZU/IP6AUEbsL9e9MdDIGZ?=
 =?iso-8859-1?Q?ym+W1X5YanBcx4wVQSuQ0ljawMzsJqYvCGllN3OGAPQIH9/8+c0wu9kHk1?=
 =?iso-8859-1?Q?XWrS2M95CoidxB/vcCXrrP2QybXNixFgKNzI43qCac9TKjyo1tO2frfO2M?=
 =?iso-8859-1?Q?uh9984glttJcpTeCSIn6dBn2pKFE8b1TplAKobBG54wFLCqLlpJpAnfIU3?=
 =?iso-8859-1?Q?ghi2K2f3AqFB38kxHFDdkuMnTxIYYRJ5zh3ab1McRGjM5w4wiWfZwM2Q/S?=
 =?iso-8859-1?Q?xmTuEjb4zNrSLTmeQOVjkZpF50qlvgpurWoOnEAInAbvPWpiBGViqm5kbE?=
 =?iso-8859-1?Q?RR7GB6unh+cc600qS6bklj/wjXrMNDXSgEkQs78T8VctnmHXtBXFsGMw2V?=
 =?iso-8859-1?Q?EFP8si6LyuDui+zI4/dOuJQySgk5yZ3DAba6hWbEAHDR6xQQnPvCyFNTIe?=
 =?iso-8859-1?Q?42m1/S/zE7wcajo0HECAFx23+BhiBNN/lX1dGVO3dFlQKGNPDotP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f40cc27-458a-4880-e471-08defc4e7b36
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 10:58:34.1136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +yMZDDCYZwltcGnA4a3W4stpW60ixJlkWUmq0tN98pIZy+ba8nXzbNmyJsO5rum1u5Bs9iFXasOu0jZOl++3BgmUrWPx/vXhjwNhBaw9djLrokMR1dTAmW0c5A2L7bHn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6949

Hi Stephen,

On Fri, Aug 14, 2026 at 09:17:48AM -0700, Stephen Boyd wrote:
>+Brian and Peng
>
>It doesn't link for allmodconfig build

My bad.

I just posted v11 to address the allmodconfig build issue, very minor changes:
-obj-$(CONFIG_COMMON_CLK_SCMI)           += clk-scmi.o
+scmi-clk-y                             := clk-scmi.o clk-scmi-oem.o
+obj-$(CONFIG_COMMON_CLK_SCMI)           += scmi-clk.o

no more changes in v11.

Thanks,
Peng

>
>Quoting sashiko-bot@kernel.org (2026-06-12 01:58:12)
>> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
>> 
>> New issues:
>> - [High] The driver fails to link when compiled as a module (`CONFIG_COMMON_CLK_SCMI=m`) because `clk-scmi.c` and `clk-scmi-oem.c` are built as separate modules without exporting their shared symbols.
>> - [High] Incorrect unit conversion for spread spectrum percentage causes valid spread values to be truncated to 0.
>> 
>> Pre-existing issues:
>> - [High] Missing bounds check on SCMI firmware-provided parent clock index leads to heap out-of-bounds read and wild pointer dereference.
>> --
>> 
>> commit 02412e4d55042034939e6eece844d1bd4d62d5e9
>> Author: Peng Fan <peng.fan@nxp.com>
>> 
>> clk: scmi: Add i.MX95 OEM extension support for SCMI clock driver
>> 
>> Introduces clk-scmi-oem.c to support vendor-specific OEM extensions for the
>> SCMI clock driver. This enables querying OEM-specific features and setting
>> spread spectrum configurations.
>> 
>> > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
>> > index 6a726331b6c9e..c2ae700ec0f2a 100644
>> > --- a/drivers/clk/Makefile
>> > +++ b/drivers/clk/Makefile
>> > @@ -98,7 +98,7 @@ obj-$(CONFIG_COMMON_CLK_RP1)            += clk-rp1.o
>> >  obj-$(CONFIG_COMMON_CLK_RPMI)                += clk-rpmi.o
>> >  obj-$(CONFIG_COMMON_CLK_HI655X)              += clk-hi655x.o
>> >  obj-$(CONFIG_COMMON_CLK_S2MPS11)     += clk-s2mps11.o
>> > -obj-$(CONFIG_COMMON_CLK_SCMI)           += clk-scmi.o
>> > +obj-$(CONFIG_COMMON_CLK_SCMI)           += clk-scmi.o clk-scmi-oem.o
>> 
>> [Severity: High]
>> Will this fail to link when compiled as a module (CONFIG_COMMON_CLK_SCMI=m)?
>> 
>> It looks like Kbuild will treat clk-scmi.o and clk-scmi-oem.o as separate
>> kernel modules rather than linking them into a single composite module.
>> Since neither file exports their shared symbols (like scmi_proto_clk_ops
>> or scmi_clk_oem_init), won't this result in undefined reference errors?
>> 
>> Should this use a composite module definition instead?
>> 
>> scmi-clk-y := clk-scmi.o clk-scmi-oem.o
>> obj-$(CONFIG_COMMON_CLK_SCMI) += scmi-clk.o
>> 
>> [ ... ]
>> 
>> > diff --git a/drivers/clk/clk-scmi-oem.c b/drivers/clk/clk-scmi-oem.c
>> > new file mode 100644
>> > index 0000000000000..be11d359b4ec3
>> > --- /dev/null
>> > +++ b/drivers/clk/clk-scmi-oem.c
>> 
>> [ ... ]
>> 
>> > +static int
>> > +scmi_clk_imx_set_spread_spectrum(struct clk_hw *hw,
>> > +                              const struct clk_spread_spectrum *ss_conf)
>> > +{
>> > +     struct scmi_clk *clk = to_scmi_clk(hw);
>> > +     int ret;
>> > +     u32 val;
>> > +
>> > +     /*
>> > +      * extConfigValue[7:0]   - spread percentage (%)
>> > +      * extConfigValue[23:8]  - Modulation Frequency
>> > +      * extConfigValue[24]    - Enable/Disable
>> > +      * extConfigValue[31:25] - Reserved
>> > +      */
>> > +     val = FIELD_PREP(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK, ss_conf->spread_bp / 10000);
>> 
>> [Severity: High]
>> Does this integer division by 10000 inadvertently truncate valid spread
>> spectrum values to 0?
>> 
>> Since ss_conf->spread_bp is in basis points (where 100 basis points equals
>> 1%), and standard configurations usually range from 50 to 500 basis points
>> (0.5% to 5%), dividing by 10000 will always result in zero. Could this
>> divide by 100 instead to correctly convert basis points to a percentage?
>> 
>> [ ... ]
>> 
>> > diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
>> > index d88e78cc9a12e..2dd50c5b4ea8f 100644
>> > --- a/drivers/clk/clk-scmi.c
>> > +++ b/drivers/clk/clk-scmi.c
>> 
>> [ ... ]
>> 
>> > @@ -406,7 +419,7 @@ static int scmi_clocks_probe(struct scmi_device *sdev)
>> >                * to avoid sharing the devm_ allocated clk_ops between multiple
>> >                * SCMI clk driver instances.
>> >                */
>> > -             scmi_ops = scmi_clk_ops_select(sclk, transport_is_atomic,
>> > +             scmi_ops = scmi_clk_ops_select(sdev, sclk, transport_is_atomic,
>> >                                              atomic_threshold_us,
>> >                                              scmi_clk_ops_db,
>> >                                              ARRAY_SIZE(scmi_clk_ops_db));
>> 
>> [Severity: High]
>> This is a pre-existing issue, but is it possible for the SCMI firmware to
>> trigger an out-of-bounds read right after this ops setup?
>> 
>> Looking at scmi_clocks_probe(), it uses the parent index provided by the
>> SCMI firmware to directly access the dynamically allocated hws array:
>> 
>> drivers/clk/clk-scmi.c:scmi_clocks_probe() {
>>     ...
>>         for (int i = 0; i < sclk->info->num_parents; i++) {
>>                 sclk->parent_data[i].index = sclk->info->parents[i];
>>                 sclk->parent_data[i].hw = hws[sclk->info->parents[i]];
>>     ...
>> }
>> 
>> If the firmware provides an index greater than or equal to the total clock
>> count, won't this result in an out-of-bounds read on the heap, potentially
>> dereferencing a wild pointer? Should this index be verified against count
>> first?
>> 
>> -- 
>> Sashiko AI review · https://sashiko.dev/#/patchset/20260612-clk-v10-v10-0-eb92484eda38@nxp.com?part=6
>
>
