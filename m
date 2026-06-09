Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010013.outbound.protection.outlook.com [52.101.84.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3EA2F2910
	for <linux-clk@vger.kernel.org>; Tue,  9 Jun 2026 08:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780993857; cv=fail; b=RJERFOfOxh85gewF/foENC+KG+yfjX4KXS7sgozbg9d8jwPEAwIBKF3IO+MqMnPGpXWGHSmyb6GapMj7/37paMi/1y9ZvHJIW/C+XByI2wTCpoDyU3CBpUtBD9skWbM8KRLgF328cHu/EZrM4IFPQXlIHRmx/NbVWzumIgcHjG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780993857; c=relaxed/simple;
	bh=Tl0XmvzIj3bNnoWXTOY6fB59I5waJnCfYynvTD7u4q4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SszqKsJmtbWPqGjxxYiugwE9/+lxMO/qQljuFboUus8tKjun27thBcDdlHhAGLoDqvStXLNmY8At/iaNsuaYEfCY0h51avWbd6rffXSibc5LdyzSWNg2P4pYbWJ2/7TbkV2MERnehefNUPtiO9vcXJqY0p2XuvPT15Ey5Mf21VQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=yEczv0Gz; arc=fail smtp.client-ip=52.101.84.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="yEczv0Gz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ApF7Gwz4evKEyeUAqXukz4oYdp31nuzE8Po3qN4W+toGNaM7J7OQOGsfXkHJeSkr936zPJe5D+ufk+H9wZnb54AZC9Nl6V6r957GlZkoY7HnrQyNkg2POgJtQ91MvCZXSloYJ99FmbxrApgWD2MmxCzI5yEIWcUApb+0qmUP8gOS23FqeSfTzTgOmkioFgODSCgFR1WbNYiyR6Fl5i42CX/L+gx39afQzFmDHwZxDY/h7I6YmAGhOQ/92WKd5AHrlZp7j90uOj4OY0ORMxyPNognZHmSYjDMvRsLz6gyHj1DVm9I9dWuQ4mnu5hcQIlM+YtbzEEorWwbA/xY6rQSPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3R0ahbIHG3t80occ2STzev2g5gbwSy/D+BGWspE8/4E=;
 b=UGzV6fTmxa2Oeen2fzyGL6fZ+BqQt3U62gFtYvg2JziQh1W27vz+NaQN3D39SORDqPOZP4pm5VC/6F3m3rCUzbPcberFX7NvlkEFwJSgTQnv0A5infT4L/vfwdGYvBXsykqN+ghKAU4Xjf4uAcD9DnBHDF5O+5SgaenHizxecnozpSAfUthGa4NwcdPOsscrvYt7WFZPCM00VS8p0Pqe6e8slmjvbzdVrJxVT7v99zaQ9w4oXP99Du7BC4hM3Z9K8B+h93fWOhYLqgVvXbqn3g8UgnDQj4fyU+6QDbEkho9oWs7zCBhEAYPILRwhyEPmuNhMXjyl15hXJHRkShoBFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3R0ahbIHG3t80occ2STzev2g5gbwSy/D+BGWspE8/4E=;
 b=yEczv0GzXjEsjwP7nDKXSzT9BtTGeMcjujQyQ0SUnPIZC+2EgfGXWLhH1j/Tc/6n2c7pSXA7D9yxkPuI3WRNiFO98atdaaifYlpHHVn5qPf8GO/ZsFqJ39Y6P3QfqzuMf+WnylFBd4vDuAcVlVysW2/EKUmhn2WB0eTVU2QxsItKLdxNwCMhSIApwyIwFUW5sBUZwWuFjrz8hn4FMED2qOwUz9PaguhPWh2LceLfvhCXSxuaHoNMm9fFfe1XSSdOxxM1I8k7afOJ6S/MHLC0sKGPzP9rf2lS8YRh8UEAxm/KPhRh3IaS+ZSPK8PiYf9/LKlWC8xoAbKr6m3RVvYUKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by VI2PR04MB10668.eurprd04.prod.outlook.com (2603:10a6:800:26d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Tue, 9 Jun 2026
 08:30:52 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.21.0092.010; Tue, 9 Jun 2026
 08:30:52 +0000
Date: Tue, 9 Jun 2026 16:33:54 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Jacky Bai <ping.bai@nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3] clk: imx: Add audio PLL debugfs for K-divider control
Message-ID: <aifP4qpH/oJhGd+I@shlinux89>
References: <20260604-imx8m_pll_debugfs-v3-1-4e331ebc85d7@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-imx8m_pll_debugfs-v3-1-4e331ebc85d7@nxp.com>
X-ClientProxiedBy: MA5P287CA0261.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::17) To MRWPR04MB12330.eurprd04.prod.outlook.com
 (2603:10a6:501:7f::23)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12330:EE_|VI2PR04MB10668:EE_
X-MS-Office365-Filtering-Correlation-Id: 1241fcb4-db6b-43bf-c301-08dec6016aa3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|7416014|52116014|376014|1800799024|38350700014|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NpW8QeLsQ3bhavpJ3ioDGe2uKeKV91sv2PXt07DlhJP3wlz6xGuzuEfTNf2I0otWiZWmekrHpNIX7YPtd6p+LioW2Wkg7eO3aprb7yarlWRgU3Mdhr7a+ER6oHMGb6SShDHtoz7cM3wHXiJXB08+bFUgaGauzf+TO0waE2/E5X0oum4Xd7xLF0upoSaDtUsyYQUfTij/kO040vmEyQfau/mB2IgSyHAP88AfwnRDTadUeMp70O4HQxc4C8PRLf8Z4FZB3+7knv2PZgmXnleDBor0jYV1Z53FEPRmvcUAC+N3/U5HppkqDCJKaGk3DykhTBQXFx7MbOgI7nZJ/syeJo8ehhFoK/HaBOFOMFaLdv/3AsH0Qgan+wvFYLaX9Nsy11lOV+O7gg5gYtvnhTnQ5/OjuCGKj4A/kwcnl7lQrGg9cowJYY5cidyfdbcZM2x5c4yTSy5fZu4Af8uZiMWbw0MwTVt7Sp3OJBE9v/B/+Iic0v0XSJ0riqswxZONosli5iUAlFMeMx4WENclIKv+9QebfIwjsieUZGzezFtFkJSxic4wGZsfommkaSlfBdEZAhIAGKq1QTTWyBV2LHyMyn07jcVKqNp44RhUZNtJD0RmYupDWvbm2H6PZ6m0fFpLHDYGcZGf5hutH/tspy2YoFKQDyqEFmbhaEioMJlsBLrcQXPh6WCxQL+P6fP7Lbb344uHqC26iJKuj0CrWYQVULuP3oYft8E36kU8EcvUP1ucWBvav4y672tyIiQ2xNAV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GtBmJVhIyw0OkzJN/9wROqwqwNn+5HfzemAkBiUuFVJcwjmAXktu0S3CxOke?=
 =?us-ascii?Q?FGv+Xwd36e6yY1cTpc2j2Jy69g4i+qX6QQkkeCBbAy67fO4VqyFvmYfp/qsA?=
 =?us-ascii?Q?/ncqO0+EFU36EFecy8ZpUEu0lM1onnLWF5u2VPkBaF8/cyZV0EcFVFJdtiE0?=
 =?us-ascii?Q?YKWc57wiXUzz8bNglvVtw4kRtK1byRakm5YTyCPCs8je+wo2eH2nduC/gLHR?=
 =?us-ascii?Q?1K9udKrKx2toBmB2bM3WVIRlED1B0dO0Xt1ZyGsjF50fuoKxk3UJfvCdxFAQ?=
 =?us-ascii?Q?Kcn326JlDkAtw2BxMMICul9H4JpeSjQWxrCda5JyR5KTQnj/gid3D52n36SS?=
 =?us-ascii?Q?ljJkcu4VKMz0x5VyV8/Mvk6DaokLNbZ/SRlXfWHm6+yaVetD1psGKpn5Kpx5?=
 =?us-ascii?Q?liNhPgmtlCI1I+WOutrX6Icjx9JiQAjffFndfPvKa92ed6jo30sqUgBgXbg+?=
 =?us-ascii?Q?o3DS2tRy7GLlofqwVWIqA9lTbyT3aU9osewCpS3hUvbDquv2ajXH2u1kQl3b?=
 =?us-ascii?Q?TsgjcMyQFvE9KEhL/gfri6PTlF6OHjd68Hrad/FOgrqkozN6w8CWxAVw7Q0m?=
 =?us-ascii?Q?gm1q9ldYzAHyTcmqbMs8lA7ohUGoNwrWRq3HiTq5Q4hINdz7/Uy8gli4BbOg?=
 =?us-ascii?Q?xI9Nq0c9XCHdLukCCcHQzskeDy4+SJ9OzM+5kaRoNGBoskNvV4V1pSr+27QT?=
 =?us-ascii?Q?JdtrL/DHqdJ4J4fZsCU3p4qJYHYDRrWYiSI/CFkFUB/s4qVja14xjH3DW2D5?=
 =?us-ascii?Q?VoMbK5BBIUioEZ/ViBBFGzbZcZr45py3kErIomXD2UIyud+GyNEPvFecWOGW?=
 =?us-ascii?Q?a1xj/rU6Xdm2sTXU+xAHtgEaLf9uKLSIWO3UGvVyXgo5wwWfwrj1rWBFZ/Nn?=
 =?us-ascii?Q?yUU0TOtSHo213xqbVvfllBiLN8TMwDbzHSEuqOo7HQps7fLzVmGpZBcaQ/fZ?=
 =?us-ascii?Q?KMf6y1zsgu0aWntYWX55fJc8cE3eN5oy5OB5FL5JO/BpvytzWeMF9TAD8uG5?=
 =?us-ascii?Q?esZvGCklQKT/1bE8WaBKJZ0EO8+/KMmX0WuY+VgdmP+MDdLQ2QNTnN9xP4ra?=
 =?us-ascii?Q?TPujPN9e8zJLbX++Dys0Xl/aRGa9IMKuYkwxgoix2vpubpOfKqivTatwy8IN?=
 =?us-ascii?Q?i3dOLSbxrCWMmJsH2lwajjcZhZTK+fMkGDDcMb8Amvhdc1i9dRp5oX1l1t3G?=
 =?us-ascii?Q?ybJVygyoRlq1r+HLw0BVAp70uq92odd99lYrUCg0AliWPaLGnauLwKICr9RP?=
 =?us-ascii?Q?ATBqDRJ8dtlxxpmPj9+y7GJe03jVFvB1iRUGFHjRAdhRw3Uv4LrDMJFxWlgG?=
 =?us-ascii?Q?h6RgfHcnCi+WxVrqH2v2JrJBeq0g32Aq4+s2kB9w7w53MDBapjGnCWmpzyrv?=
 =?us-ascii?Q?7UHM3ZpHGJdk0rGyxdqEmK3ObvwwO3eBTfi7g4xwH1GvopXM9279/TRMZ3+A?=
 =?us-ascii?Q?gLhoiGL44Lqo6h46MEUVvMXsgWkFdrrGu/xBxiKhRhlBDJKYkR94qreQW886?=
 =?us-ascii?Q?j/07WI/sx4RlDWpkChMF8fSTlT4ZsYzawb3ozF3th2RAz5m4wmz4+t1EQQUg?=
 =?us-ascii?Q?bWB+DBojjuapbl6D+8XOUg/TRWM26RKnHxC0/q8jp976QZ+Ba78hmULAVd06?=
 =?us-ascii?Q?E3Xd1tG2QEvd1PZhQC79d0/uAmtlnxDUM7NUAAcENLgGwGAYcEPy6yZLfrq8?=
 =?us-ascii?Q?/QwLwNVyFVA7JTOKwyLAp0t3EocKzgMqrGzS9H/w1j6xXdpWesYfFCqxY/ur?=
 =?us-ascii?Q?1kcOQdRXXQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1241fcb4-db6b-43bf-c301-08dec6016aa3
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12330.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 08:30:52.0773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6xmHSDeLsHfAGl+BzAAR1VAvagvtU4YXwLbIi4em9YOX3f4iNAVTe0wYRHru/4lDdJtdNk5nxkYNk3OTLfegNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10668

On Thu, Jun 04, 2026 at 09:48:01PM +0800, Jacky Bai wrote:
>Add debugfs support for runtime tuning of the audio PLL K divider,
>which enables fine-grained frequency adjustments for audio PLL.
>This is used for:
>  - Audio clock calibration and testing
>  - Debugging audio synchronization issues
>
>Two debug interfaces are exported to userspace:
>  - delta_k: It is used to adjust the K divider in PLL based on small
>    steps
>  - pll_parameter: It is used for get PLL's current M-divider,
>    P-divider, S-divider & K-divider setting in PLL register
>
>Signed-off-by: Jacky Bai <ping.bai@nxp.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
