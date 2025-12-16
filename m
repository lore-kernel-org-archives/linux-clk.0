Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013012.outbound.protection.outlook.com [40.107.159.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F821A256E;
	Tue, 16 Dec 2025 08:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765874619; cv=fail; b=pSQASEwIi2Kk7htNyDXypCpP8gRhK9/Ok3Q5Ma7Hqq3r5n6WAqhPEKool+lA6ilDpuVBoXU0/i0IYkJABO9Tl3Ybb5Jo/OiwT1U9cmTeuYiwjSRHAUxa3fg1uDRKn4A2zwTKUoLUIx4IMvkh3FfKQ0b4Kg8csqA+c5YO8/Lb4as=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765874619; c=relaxed/simple;
	bh=vdOGjyG/X/c/lgIVSWCUvoz0rmVoAGYJFiCoICmQ6kw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ar07o8uKZPuh4bcnU59xO54SLnN9avoUG59f7XfCaBRQvOIkJu7Dm0bYcG6Q39TzT/TX/gZtH1ihrgl7uOHSF1GN5C6+YpzwZwnink6/PoifNlpnsohZHdwhPWU1oVcZSr3dYW/wH+3hBdVLJet4ZjDqAoMvWp00xr9bb8MRTfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=g2gxTWkL; arc=fail smtp.client-ip=40.107.159.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="g2gxTWkL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dm/XWzkLuaLzOQfHYXj0GEnXyD4n3OxzFQvCZ1vgfGOLX1To1MojwU8fl2n9+OhJBRQq1nXxEbj9eWflNe4VzIZ7D7EPpKsHwNEPdui3yZR1VaGFAG4TlEXI1Wr7d3o1wcbxuHLU1FDwi5PJuwNk00C31nOHRWzW0ToZAOlQt9uGBifUBacQLTSB3eutzK4T8XZapCEn2webMBcvojypXS1ceBRDNfF3zvevZ2ZhHX2gN3L4yoSB6XeT+PCXxHRtQOQDI2pb6VFGtZtUTz3z6IjZCjRuOkIDNVL9SJh0hycWpvGbvNY6dHGVyz2/tIx9BUU8TqU3Spr/HD8fhXbo1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vdOGjyG/X/c/lgIVSWCUvoz0rmVoAGYJFiCoICmQ6kw=;
 b=Di6UUivUXii8FSmsGgYBZd+55B977SpOw1q3OedoCI8ycOeNV4l8Ghb/4xPlhztg7pLFY9lg8L+vwitRYx7tCdfMuxfb1rKTZJ70L+M00B1j1yAwQXN2sXvVhgmAIKBWOzJ94o5/Rx+l96TOTg+SMvLTWwnCySmrVGLg1y1xvvqfMdIAeeqfNYnuSbRS6drgq0/rcUZSIT5FGuXtBNlz4t9OcE5R8juPliIFwhCpsrDZWjIWhgrAq9EN+6St4I1wDDy2EvGvIE9xN3vK0sX0FHZPC6aW3Z2zXCrf9KhtguDzneDqDSm5ZfgMUe0JJHomFEqcgM0k8xfrz7wAy/JO3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vdOGjyG/X/c/lgIVSWCUvoz0rmVoAGYJFiCoICmQ6kw=;
 b=g2gxTWkLj3dQQDo1IRyTE58Xlgn0DkTZW5D0Cpj0U5DOfNR2Y53wAcELDE4hxgzf81WOySeo6EzUfqewwtGM0RF92QUpVMtrR+Eg8dYO0RGvJXAzXCzMykkG8WMzoTX33TqetXfsew6zCteQKiKlXhsMdCcT1mhBY9r/VuwxhSHx32gicAOeKpggTwUbo8+KHfMz2VmAG3Nac4uYGkhxtCPXMNOCART6YCI9IGkiemG1EhvwPW1dIed8JnaOajvUvWwVA8n9sl0HHp1WDVrZbSm2eWShxFY9v/VbRY/zmQnX6hjWkC+kXaRZ4Z2uLG0ki0ngJjBWFK3WdjK8Q+ddow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU4PR04MB11755.eurprd04.prod.outlook.com (2603:10a6:10:621::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 08:43:33 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 08:43:31 +0000
Date: Tue, 16 Dec 2025 16:44:42 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: David Gow <davidgow@google.com>,
	Johannes Berg <johannes@sipsolutions.net>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] clk: Disable KUNIT_UML_PCI
Message-ID: <aUEb+kYnmwV7j82I@shlinux89>
References: <20251128-clk-v1-1-2dd64cbb0c3d@nxp.com>
 <d3340d34175e0a18675d7460576c7fe7a2623e2e.camel@sipsolutions.net>
 <CABVgOSn7MPrwQBxL6fnP_1H0BctypdZtA7opzoYfFx5ULoAM=A@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABVgOSn7MPrwQBxL6fnP_1H0BctypdZtA7opzoYfFx5ULoAM=A@mail.gmail.com>
X-ClientProxiedBy: SG2PR06CA0204.apcprd06.prod.outlook.com (2603:1096:4:1::36)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU4PR04MB11755:EE_
X-MS-Office365-Filtering-Correlation-Id: 55345408-4f78-4638-24b0-08de3c7f30b7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Z9Upa6m54tOMv1VsusTK+27Zga6lfFvYlcQsTUxeytAXbcv5Ut6KUR28Z9RI?=
 =?us-ascii?Q?L9EmG85v67RwtXCgTTp30PXW1p4c+BMqcoKrWAsKoaYXojMAvAHRNTihFouw?=
 =?us-ascii?Q?IvExZltR+L231ZdWrMsl5CKpZUH8iSn3hvchaMRknVQhWz0lpFf4snJQ2FF4?=
 =?us-ascii?Q?Ge7uiwlxJCp9T0oUIv55/JFKPeJjRAnC8OfXVsu8HQzSR8TEVh9yh3IYviXf?=
 =?us-ascii?Q?XQfI/y4pZu0GhXjfNBXz6EQaWyd65uwbSOjgGw5UmKQj/wNcp+PgOXpdmi4D?=
 =?us-ascii?Q?c3J9204cEbJT2MiuyWZsV2rE+7jmVKbxqo8hT2Mgq3Ewr6gMT1FJy3+ejg4S?=
 =?us-ascii?Q?EbOcDjRtTBPaQ8qbf2tQmLeCEoqYmOCJB0bDS5bp0P0MyZwSK8Pvn4HIFRyv?=
 =?us-ascii?Q?e9k4O1AmGDFCZKzemdA5U4j2sCNKy/nA8iZUzemxzC9EyHEszE3krry45hNr?=
 =?us-ascii?Q?IjMuxZnvufk+zl1HWTpMG/aRURWZ/WBTUYtQ6elcOnx9zumah4J1Usb/IP4h?=
 =?us-ascii?Q?TyOZj1/3/nQkdcppEiMSg7crK4+eQyLeEq8QT19N/UnizimZ+m08JvnjHOBl?=
 =?us-ascii?Q?wIcem3RKFnWgSOvKntFw3H0j+M3NzsHuQHnj65AvU9vmGLHgLbyg8CPRtAfS?=
 =?us-ascii?Q?Io2xzPx6AvJSq7yqZZ4vr380AMDqtvQ9aj2ZF5MXE/wbm82K8x+JsHKY+lsa?=
 =?us-ascii?Q?Imnc8/WrzDaIu36SocpnDpDltUaCgYUgq1DfqvJzTBUjFreCKjo2u5EVQsp5?=
 =?us-ascii?Q?+AvH+yEfji9s9e25O4HXLOV1v5+ASXpTQGlDpg+sEc1n5ro3NgEflshzdIX9?=
 =?us-ascii?Q?qJnMnKGEKgTOeuf/6ZP71mwrNcLUSHylDb95f6hV8sQdlyd1rCSvxmrQzSCP?=
 =?us-ascii?Q?HeNS6qFEmseNsdIw4Jg7LKVms2bgCQbnbB4RWQAUOBkDkvIA3UZmtlH95djO?=
 =?us-ascii?Q?YiH/avYJO646Y4ruwPoMHbX0oqi4EJY9yAZCb7AMRAf2NeEe1QzCCp0/y1Nq?=
 =?us-ascii?Q?EyHoQk8vjHFXyXYRes1ZKrqxTGQDKEtDU10220WaDDMszxNFWgSFdeqk1xi8?=
 =?us-ascii?Q?8hhIMLtdf7RvH0hHPw1IzkLqtL9HOkS1TvxJcwYPiT2IH13UkAlsFAVf/8tN?=
 =?us-ascii?Q?u9yBqEvhjxDju58O9arIIpwIDBl0u9cekjlVoyBuHflVFGXS5FQBm4AcSAgr?=
 =?us-ascii?Q?1U4EySWJOwKNv1qXs48xJSK3sIn8yRjFvR8a3xIA690sm36V/Od3ww9VO/SD?=
 =?us-ascii?Q?EmEBLEaYz23YTsKAPbKMP6+s/1ig1HYXxvsJ8KHjjhMqhD8nNrEm9JVNQfqU?=
 =?us-ascii?Q?cyux6bfPlYfj4Ou35OqoZn1hs6Lk++eETZr++TT/QmLEupS2RdB6dIzO2czZ?=
 =?us-ascii?Q?9uxSNv7JIjFlB6BwbM7HfpUi9aoBHbUpRVQvQqmJWP39INCi2XJIhQLl4F+C?=
 =?us-ascii?Q?IfxhiREdVPk8N5CzjxH/uscA5KKRQRtVaYyGOFC65H9NJ9RoR/zAfCorykAy?=
 =?us-ascii?Q?rhsomYWXFhvaCA6VolPqQjfxeocp7BCRu4gJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XpAnaZsydmJxG+03uy6N5qnEl9BpjScb+OzGYsKf46wV2pBuk7+VDj5xMjdb?=
 =?us-ascii?Q?2lOoQNEVmuoaRBvrh8g4TSMafos7dAWPfbwm147d/gq6kT6ApU0gZqGf1vgi?=
 =?us-ascii?Q?mkSgFGVpC57whTBterQv0sKYLGiVx/p00/s6VlP9PMTrorfMa5IFfKk6hiHY?=
 =?us-ascii?Q?4WrVojtMOSEX0UNvFycRgob72MXKZEzMRpITKLUCnW3ZDjU2GWZW5M95kIlA?=
 =?us-ascii?Q?J5bGMx/XBQ2APPFvMMQcPVgWLHkuhFFbVvK+fRjDAbW2yb7DrEN4vka9Zmzl?=
 =?us-ascii?Q?N2eg1mhiYboJHl0XW0k6PHrY+MCQXNCbomRH08vzttgnslfYn2O7B3bbyxo3?=
 =?us-ascii?Q?/htdxxLz8N2ID5ytXoP8k6alQm1jy20MYRKYRddyf39nie6sic75ytyJLmxc?=
 =?us-ascii?Q?Al0fIj1mTL0NR+p2RpLmp1rtI9Hu+WQx97aunOjxdBIg8DG385kiV9QveZI8?=
 =?us-ascii?Q?XZGdsjxYodmHT/3s5y6mawS2dXNwOxm2Nz7fC/4tYpyZO8oFRLO4sOwiMn4i?=
 =?us-ascii?Q?HOpOOti51fwKdBzrbDfz6M/GPx+GI7v6FZjKRYqE3psr1uc6TvLlbvfspHzL?=
 =?us-ascii?Q?4C9c0Ym7bHAOu/0JkwmmrcW2EFL5vp3lbl7Rko9Zd6cGo2Rd8+3JhspswXby?=
 =?us-ascii?Q?fUyS7TSmUxG7SNb3Q0n0iYQuh1vHbnIzbtSXXaHuFjT2Ew32avDZucDGqk0P?=
 =?us-ascii?Q?rO8Qkj+iiHXREllRBwC8zIiWcvPmKBXNNdt7ZKc9Rv87tG/m8UxTnzHs4oMw?=
 =?us-ascii?Q?vXfv4sHevnM+ECWO8R0wgwPrJEE2+S9JfTZHr2DiYzdRrjXnCDRJ0Se+fMd2?=
 =?us-ascii?Q?jjNB04DWENHl894hOpmt9vQVpeYtVdCFtid9wX0LmbzgoIy9lkpxcYScbsI0?=
 =?us-ascii?Q?R0/3SQ1KShtP9NaZZJn1vp8h90PTpM3YmEGZBV/Pqz4PqNwlIPaSbtPYGt73?=
 =?us-ascii?Q?Xknz3iAZVZ68hbscTu7JGVW7Jo+fjBjY4ZxvfywjOW7Eo1YKUx2y3lJBnEGB?=
 =?us-ascii?Q?cN9YnwoMB6x+u8OGXp8YsC1KkO9CSXt5NIsvTkBS0XMd1HmRlhqx62sn98KA?=
 =?us-ascii?Q?QSGRcP8oB8df+boZiAYyAltPWoAFvJgYGeJDqlrYC7zngZWyp3LsJOZo8NH4?=
 =?us-ascii?Q?BDGx/1cQ7QuUliCuQRvNMPPUgixbfAN2WRV+XwgUZn3JmM1OLOcxa2MDxIeM?=
 =?us-ascii?Q?YZJIaMcoxfgPika1j9eGM1GoCTSqyoKyDVbwnO5nvFb4ZBaRJWJUqebkRSy7?=
 =?us-ascii?Q?zaCxOvHUHoDjRvZcsaTndhAVX9HnAnC3ZG7Bm9tZkig5LAV8hFMzixLtAwf8?=
 =?us-ascii?Q?FVMuABsccaJFLzArlq4Py3UWTXU3wWY1/HhzbGaFwWAgCOy+1ishwL4K4UY3?=
 =?us-ascii?Q?DhmOZMO2MySUQPL0ADZ3ORH0zqGOKG5Gg8x+Lfo145qPLbnDakxEuUh9NMp+?=
 =?us-ascii?Q?pt4B+KuxDNYmZ9tergxSZQMVpObAyoMIFdPkntyBGy9PZC8REeSYxaMJCF/I?=
 =?us-ascii?Q?eK6zbivnuQM0DWIKSKbvqqyw0yySmaFtt9tEHRCdC/cM0f3o0qSV7ijTiFvm?=
 =?us-ascii?Q?yj7VIJvEHT9ljIz+YgoueI9NGleXUpNO2ohyrNcs?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55345408-4f78-4638-24b0-08de3c7f30b7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 08:43:31.0784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j6s+jSC/mPOhAYGqh0WVlw9G6cE8fRCa0CyxiZ1tNp+C9hmowIax1lD1Gv+rnSOhqR46ff+ftN73bh8FiE3UnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11755

Hi David, Johannes

On Fri, Nov 28, 2025 at 04:46:39PM +0800, David Gow wrote:
>On Fri, 28 Nov 2025 at 15:44, Johannes Berg <johannes@sipsolutions.net> wrote:
>>
>> >
>> > commit 031cdd3bc3f3 ("kunit: Enable PCI on UML without triggering WARN()")
>> > causes clk gate test fail. Deselect KUNIT_UML_PCI to avoid the failure.
>>
>> While probably _true_ that this "caused" it, it also seems a bit
>> dishonest to blame it on that without giving any information as to why
>> the clk tests trigger some edge case or so?
>>
>> FTR, the warning only happens when you pass an address to ioread(),
>> iowrite() or similar that wasn't obtained from ioremap(). Which ought to
>> not be valid, and I'm pretty convinced that a unit test should never
>> even end up here.
>>
>> So no, I don't think this is a valid change, I think the clk unit tests
>> that end up doing readl() in the gate code for a non-existing device are
>> broken.
>
>Yeah, the correct solution here is definitely to rework the test to not do this.
>
>Unfortunately, I don't think there's a really pleasant way of faking
>these in KUnit tests, but a path forward might involve logic_iomem
>(possibly with some changes). Otherwise, reworking the test to put
>these writes behind a function which can be mocked would be nice.
>
>Ultimately, I don't have a problem with us disabling this in the
>meantime for clk tests -- ultimately it's up to clk folks what their
>test config is, and having tests which always fail isn't great -- but
>it'd be nice to eliminate the cast-a-random-pointer-to-iomem hacks in
>tests.

Sorry for late reply. Is it an acceptable short term fix for you if I drop the
fixes tag?

Thanks,
Peng

>
>Cheers,
>-- David


