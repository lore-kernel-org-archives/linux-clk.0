Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2077.outbound.protection.outlook.com [40.107.21.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1DF2AD0C;
	Mon,  6 Jan 2025 08:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736150581; cv=fail; b=uEmCxIRZf97H6gvRm7esPsiT4aWnZ396LNuaO2HMN9QjLh+SwqN0SoNY2vBqQIQZPlm62tcTV8mfmtbsImOYo7nN2Ybc/ItuRkrdVO9cpJskTWsOn3Zt/U/U8oq14i3pKP+/G7v1V9LiOoDU13dNjsmLb7nhOZ/IGUy0SkFAFXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736150581; c=relaxed/simple;
	bh=ujvQzu64wWmtXrgY+zGeXZMlwXWJYcbiJ7C6TkS3szM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SWqHckGhrZnRciD7OPcIwdpz9H5RoQHeXiy+2z3H2wfedkSj6JSoWUGcxbUAYaHnn11GIQg2NpAU99A2gHbDXd89Kuf8yZOdmCHlIHWy8FX4i5r0sqsFCo+2DjgqNo24wPZmc6FJ9eKC/RRuRWz+0R/LwVBh266h98S11prfhTs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bwHMq3/Z; arc=fail smtp.client-ip=40.107.21.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bwHMq3/Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gh11dENbAAj8YEg5YBR6TCEQx+0mS1ZSU9tztZ7w0Jl1npx/Ifnqe3Ispp6pTkpWuB/1V2dFbeCY0jkg8CHkhmeA4C/Y9kjuTZUhEDe8sHBg+BIYrwsszNcT7dltRq0rEjst9BHiKO9A3udYWj/OLt05aCDp/5ystL6bc1Vc49wJKb90IeqH4JlW4ZAgQpjX9J29izn5d//oNFN3hIDRjgXir0H483WVHhped732qnW8BEZtetvaZBeTcMxwnA4mFALbpTSuHO+LW2xpOvTkpfEHY30i7NN5Rjzhh1cESzxrpb1LOU8BAEXJo1pekaeC6S8/PoZOsA6qQ/Xj/8/Kww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ujvQzu64wWmtXrgY+zGeXZMlwXWJYcbiJ7C6TkS3szM=;
 b=X5F6+EH0F/tEVb27hKHFzLgFA2cODiFCtTV5UvxJfsDt+9Gzdx6v0KWpw9iFeI1+aeDJxd3AV7xdxvz4ncnMzlRwm5XMayEfeVynCCBrJXis1z1j5b+MVanutEdmwRPoebJHFHdam76Atc0aglEIyZCr9/dCFmlMbl2d2iapCdicd6J2Y8xWlfJYRtiFsWHhZ6lBkOgL8Mz1vCGxcB9gz/YbwxTCnWEbQQ/nBOgAwtSxy7tT+Vb4SukQgL1GcDTqgIyWXOPsHUlTJlU4qDCjmrpzW+IAqqPYXvYXZjaAnP5Lp7UEWDMsO/JfjxUNWQOB6ceAOYqnLfyHWuHKWMn4BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujvQzu64wWmtXrgY+zGeXZMlwXWJYcbiJ7C6TkS3szM=;
 b=bwHMq3/ZzFGOy7z60QEn0jU/4vI+rvwqu7ldpb0IXocRxDSqZiU8m4CHWy+ElMr6UEBRpaXDre9YVq3QYuDt5xYgrb9C4isvxBN2bFkc2u3AMGQlIVmALl8p/l9qBUvX0BmOAjDNQT67gtqZufIX0OalCnsx18Cww6w8VWGjPLHJ3mI2iLYqj0P1YZplBQPIG44bKYY5vgmLFDv/gL8yIYmuw85Kl7jDKqNRSFP5+5EGC0zqhbTRZSm0lgmPFXIMbMKQO+Eq1lly8yWhTSiKr0x3UnNvhkcjnKB2PqZ/gC7LUa1rsOX5bgJdexhO3gf5h9Z7/3dkHmTy8WqYNQizxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI2PR04MB10220.eurprd04.prod.outlook.com (2603:10a6:800:229::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 08:02:52 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 08:02:52 +0000
Date: Mon, 6 Jan 2025 17:08:51 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Abel Vesa <abel.vesa@linaro.org>, Marek Vasut <marex@denx.de>,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] clk: imx8mp: inform CCF of maximum frequency of
 clocks
Message-ID: <20250106090851.GD19598@localhost.localdomain>
References: <20241219-imx8m-clk-v1-0-cfaffa087da6@pengutronix.de>
 <20241219-imx8m-clk-v1-6-cfaffa087da6@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-imx8m-clk-v1-6-cfaffa087da6@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR02CA0038.apcprd02.prod.outlook.com
 (2603:1096:4:196::22) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI2PR04MB10220:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b714a32-5ce3-4598-1244-08dd2e28851c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zz8CV4WXA9ykdu7HI9vcZ0pG+IXQm28Gq697NKg85CivNtCdl89reCZ6S+DM?=
 =?us-ascii?Q?TkhNAo5LP+bPVXDU7OgNj0Yu6XbdabIUzlCq43m+BUf90XZESGGXOBE7UBVa?=
 =?us-ascii?Q?K3sqTU7cd97devaWZZw3yJCOVFRe6wQ8HoGpvkXJ9XYNQ7wWj9xJpmR59hz4?=
 =?us-ascii?Q?9WFBVYzcvMOMYai3C4X7GyRhYksTCmdLCXIFvtL4h2iu0fjTC67vglhuwpYA?=
 =?us-ascii?Q?DwbCxcSK+SIMmVovfbF0Ki8MSoRQpZEiUkTXvxSf9uQnQ3VAPzy66mGVYj8E?=
 =?us-ascii?Q?IkdEMMHPuebnv4Ghb2/0oVRBR8iWWsPc0jbSdt+zjgqmT1zUzDmTCrzuLOkS?=
 =?us-ascii?Q?ReHOY6FpAvqUXe+sxx78g/XKWmQP/rl1whjZk4/kHMJIr7NfqKXypArwCRMT?=
 =?us-ascii?Q?CN+KmueULyt0dl8QbkrDwlNqIXV5Eb3qXWkfijYocnfag/xyaUpHOGC++OGo?=
 =?us-ascii?Q?XhMvLYuhkaRr1XzWDC2mTP2HGLp3FvMfwSpxtxNHol7JZJuFyFs/olnUvQwM?=
 =?us-ascii?Q?6gnDO6CiPIsc18mshjzaF/KhAf/id0fRqQbMG9QZCh8MK7/80JXVlfY9oIO8?=
 =?us-ascii?Q?zP78s0ZQLxI1NKeZTrdsSjgZ99+rR7QRuqXhsB68V9rOYhye0ALeoiknesbM?=
 =?us-ascii?Q?97ppHVJbNpq0wOtC/afyXP9r/3taPwunG7xcrZUjCeCX6N8hSMPzePPv2vme?=
 =?us-ascii?Q?0ZZO7hq77ttT7TB34q+zHAQDWdIhNtf2dZ2jIw4W7TXDPemkZ5OHAMA006Ey?=
 =?us-ascii?Q?gHsf1njlH8+etLqShZfZW5zbnch3bzGC0Qw7cc+HbMI2kyboQKPmRNzAlhcA?=
 =?us-ascii?Q?MwT6WccuM2hQQxvYr+ai0nTaTzA3+4N2bAOfVK2oW1wELJD3EoFAFW55tueA?=
 =?us-ascii?Q?xAyLZ4RueKlQpFy3tb5VPshtVAXCClp0EzXgecsLShXrOiiwUv4kxr+afFmn?=
 =?us-ascii?Q?mkFaDBqrY+TpC+A82izTVFhV0UfNjkAWKthQ6UtPfn972lFZYy/Nlch5jY0k?=
 =?us-ascii?Q?ox6+ZVE9URsYVGIeMC8YepZXqcNvn313J1Hirube1zgz/Htpqs9TB0uMHnq5?=
 =?us-ascii?Q?mZ4TrRIZzkE6MkfZBuRAsL7otkDjEirOJlmnTrRr+d3aiC0Lxl8yqb1XjFo9?=
 =?us-ascii?Q?rjvElPwXmvnAXdhc+W/JTZQtF/5wxF6GMhW/jy9tRCre+5etOJQzqz+/5Ufb?=
 =?us-ascii?Q?ffsTZuJH+c+sfzBvg6ojnKuM6eHerdAPLowWBpQtM73Ftfuezjr9AnGKfthd?=
 =?us-ascii?Q?a7KPOXYbc/wj/EBCBxcwSTEXbP1mKAHY9/6PzALps7cKCREhZb4q31Z7y19Q?=
 =?us-ascii?Q?9xEM6/JS+172GSw2hIjMoqKYPUTu3PiQlBDgJ6cWKgXL7Np5bZXC5R41ji+p?=
 =?us-ascii?Q?k+gS0GbmTIynS405GYIgIQZyoZVzPSEliBjzOu93UmifxczllLKpyWs+hl8+?=
 =?us-ascii?Q?w4F5RATSjUyuxnMdHzRLHxE/h2rosem8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xEDcJJ/kM00kONX0X0prromcuY1ddTgXjQveEto4/iBNogFKzoYJPrV4Q7EG?=
 =?us-ascii?Q?7nwz1ifYt/SP+oPDKRser2tRNXW+Eyy7xRiXR0G6OJFNDHqG4cup0v4D27Pp?=
 =?us-ascii?Q?bQs1rHxAxBQZkDuXeMJpa9xnXB6yJaXq16fAOSqyTylfyyxYSIN0BW6omCT4?=
 =?us-ascii?Q?8+mE+a9IRnEtN7pEb1n+rjnTTj2DA46ctVYFNS7IUJn26PTAKvhpGWOBkiES?=
 =?us-ascii?Q?UK8bYonF5yH3xZy1yNfqz/aWBHikZMicqMh3Jr0QA7hLchzPTjsIXOGiVV1m?=
 =?us-ascii?Q?ycbCd/yNfVcsmyufLYHOUpjpVf8BbbjGSwPjayuGk0Y3tPxc7WSVaH4yjeZh?=
 =?us-ascii?Q?TjE2ZycZ3UHoSGBwxuKtTzwlrW/5D47hAnz3lF45W9xa+JaG0asvXA5Ph5V2?=
 =?us-ascii?Q?A1bvHQ+F+FsaBaCiE5b8TC4I1odCAE7qLCLpvLvN/8fCvXMhVcsYlNWt6VxS?=
 =?us-ascii?Q?GVFk3u9Z3IJoFXAiqg97Jczf0KARI2wXEXx8trFwsTo0Ws/M9dTRafUYKZaZ?=
 =?us-ascii?Q?O5rBbdi5U7ZvcrWL1l+7SphdhXuSL2YHSminocJTi9pcn3Nk1XEBdZN7OL66?=
 =?us-ascii?Q?9RvlGH2vYb3KsaciE5y9QWdbOWF3RLbBwZKiS1G1JJ+xIs8Hk0DHZElvTZco?=
 =?us-ascii?Q?I5mT9xl5liIiA/ubIGlF1Vuysb4WI9Pwfc63g7acIOHMNxxj+7/30JarRlKi?=
 =?us-ascii?Q?m9ozmyfNQCPKr31FX1z/f9gk3qKj5Pn6LsjJ70YCOOKvpo+0opDnZMofQO5+?=
 =?us-ascii?Q?RUdVA8SPLNNiDq0nk7FS0v/O9CvOZh+TDLQlr3kYes6vJ3zdYcyXnh0ciQgD?=
 =?us-ascii?Q?sKovzpJUhWLpy8UHOeEMS1evcsveNA3eJi7AvkcFF+bVhDMeVGWjRt7D5oBo?=
 =?us-ascii?Q?0h0w0oU7yyRIEEHEcPE3Scm0jRtT/ILeYqIyGxeHhxESUTOPZUPqlZaCqjj4?=
 =?us-ascii?Q?JSsj2PdwuIF52Tq1M/oBRGToWz618HvhKPf/s8m/jw+7fRhZoqdICYdiUhob?=
 =?us-ascii?Q?y9h9XE/eKn722bcdQt84VaHsQZRjHfbWcwCrgibwf8dClLg7QnoF5kcaTm1l?=
 =?us-ascii?Q?79XN89aI6GRcnrdfxFv+8Ml99+Htagw/f8E027Lhf3dsHVBB4R9Qf0FrDOZV?=
 =?us-ascii?Q?EKn7fA+fCqYJ5rkLtMOAEEGQax4yuylsog0ATpRx9sgdFq+kQBq6GTf5kPO1?=
 =?us-ascii?Q?hsW3Wp3atX1Oc5BRU2lcGkpj/ie1oxlJGDglh5RBovbpYdoDVFsNZxNAiYZY?=
 =?us-ascii?Q?PiRiedjKquHu3K0Lhtso8MSRUQXZzEILTmsbG2SAwQQyl7KgQ7kJ9EQeo7BS?=
 =?us-ascii?Q?TxB0hU/S48k7Z1R1ZvwZ01Bps3pDWxIA5qpcSjl5uhxfeIBU2+/9ZVo99ybq?=
 =?us-ascii?Q?zvx/CzOaudbtZ9eDxg5p8IjuDJ82HKxChPbpjzGIcLsCejGpPVU6qlK3w1pn?=
 =?us-ascii?Q?UI8Wt54WcTAem0jDIWAJLnvDhNFRVX5DLXfgy76OzzFuTCcUx5fS2NOkBjmY?=
 =?us-ascii?Q?nkzc0dT50dz7NABNZttIUHJpIrvt3yZkRZeMqtXhKSRcURoRDonXPR2SUVS2?=
 =?us-ascii?Q?/Una+n+xrAgDNW5rxx1Lr35V+glMSZUH/y/PCf50?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b714a32-5ce3-4598-1244-08dd2e28851c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 08:02:52.4656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2a3IA4wpTeHCOdLsspIGyzDBQJZ9SA1R4I0L69kE/LJ2tSVHxODBLYEbSxfF64rw1tjIKlIv9lIdu7uvf6rNQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10220

On Thu, Dec 19, 2024 at 08:27:37AM +0100, Ahmad Fatoum wrote:
>The IMX8MPCEC datasheet lists maximum frequencies allowed for different
>modules. Some of these limits are universal, but some depend on
>whether the SoC is operating in nominal or in overdrive mode.
>
>The imx8mp.dtsi currently assumes overdrive mode and configures some
>clocks in accordance with this. Boards wishing to make use of nominal
>mode will need to override some of the clock rates manually.
>
>As operating the clocks outside of their allowed range can lead to
>difficult to debug issues, it makes sense to register the maximum rates
>allowed in the driver, so the CCF can take them into account.
>
>Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
