Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011039.outbound.protection.outlook.com [52.101.65.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E423B635C;
	Fri, 11 Sep 2026 21:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789160988; cv=fail; b=aX6xt9yK7iIngeLYDdqb5Kb8esrCq+UQMbsKnZSC/igQMtMXHVcAe9NGSoOt7vTMZPGbzQO1irhbIarTmNSS0GALnN4IMOEAXJ2EM77u4h11MoD7hblHdy+PiMYLwCD84YAPlIevZZ2VZkZm5Uy//4nFgZagMkGD3XMl2sICVVE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789160988; c=relaxed/simple;
	bh=4oIO8u/CXUN+sFy9VqDnA7SBcF6+DZKzknyoR2JrLxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EbCc92bhdx8RhFOcF5vLa39NTiyO5W7vN1SFTdHbly1H7hlUEMW6LM3P0DNmjYpV7geOWFmqCYxTNsQbpPaRT8pwL2YAaFdsWChOENXdnXJcaBSYpbOQW0KmYG8y9zNCofISch8ymj83PjEovcv1ywa+GyUaSfJD5Du7Tr11T5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XEKyvV2b; arc=fail smtp.client-ip=52.101.65.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XEKyvV2b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YgFriERYVLvc05lNvNBgqzut/xOy37iBeqgCEuQ5JpjnAFCiv3Uk0qAJffBFqUevYi4CqifZB6UDJYXcik2mGjJ5AVJeiEFacjeq7UEkzOXcQumu3jZdRNhDwSQyFw14iKOgAYQzq1Mi/gdr7qPYQHyO7rKTQEQ0CZg4wXL5vMK2pDuZ5085fyBGAaT5YWa9BjesjGoDvRDr8ymRSrlztPEts6sM3jOWxLDQqGhsRfWPhCb+BcUxKN7eGWaDYqaNpbPnK+KecSFaTmh9NBnSx0wEcIEyV/H3++YJfI+P4LkMcYqsNOJ8R1ernJpvfo6UucI3Sq2ODbLDY3/Ypg3Cjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VfLkcYfM7u5aEuWbCbfkAYsUun/5v0qdzreRhQJ17W4=;
 b=nRHayyRjbk9kEVQ6tgreB9o8YlqPaHOyWPy3q7kxCLwPhIU2zlFurN/qwarwGt2J603OWD5wkHS9PXgZXBpgZaOE6OwlNz6f7rwHyx/WtM1mSoPAeYmP/qF7ARWQ52aRldPKhIo7ezyLNGIhSW69qYmvyAZMMFvH9/dRnSi6eudh92zAq/zAPM2LIBOo9Pea+LhjNGOlAWXlgTBvmTPoCN5wZfyDsdOwXgU/ut5fQUmr2hS9ZNP2d8d7jsE7dELI6KXel8Mvi21QgPPPIkoOcfxeKLle6mgWZVx9+aFnms920KKxE9KiClIeXLoHGYzPBs5gfQTVG3fNnoqeFp0ehw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VfLkcYfM7u5aEuWbCbfkAYsUun/5v0qdzreRhQJ17W4=;
 b=XEKyvV2bX0GlCGh2/3TsNVVrMEr2JFtw+wOU2nPjo16R0z6Gge2rg3V0Ft0hagG9HfQ4XPlmiO4jgB1hPYLh4vdmD914RgziOnFSi6YSH54bBuYXEurU1rbT3d7eYz92W2wNTmObL+dUYMiyUd1auFJRrcMi1a9jsfHHVqbPr+TbMBs2xQ6/8QFZhpQu8HnqPVkXAUuCxvALGn1N3vTQHKa6l66o8+8i15jqIJuLqOZcCMauWNx1mrDuGKNC9yYj2b82Lk7aE3vLli9A3oeE0ZN/9qxATTtrmmU0vMipZZnkxIrcXLxhl/lM42SMGR/Uc3pOsFPuQLFxuk5o8fNXzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB7617.eurprd04.prod.outlook.com (2603:10a6:20b:286::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 21:09:41 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 21:09:41 +0000
Date: Fri, 11 Sep 2026 17:09:29 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Felipe Balbi <balbi@ti.com>, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v16 3/5] phy: core: Add devm_phy_get_by_of_node()
Message-ID: <aqRuCfmgPqa5h0y4@lizhi-Precision-Tower-5810>
References: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v16-0-f7bd68b5369f@linaro.org>
 <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v16-3-f7bd68b5369f@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v16-3-f7bd68b5369f@linaro.org>
X-ClientProxiedBy: PH7P220CA0157.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB7617:EE_
X-MS-Office365-Filtering-Correlation-Id: 984bdb43-be3e-4649-1827-08df1048fee9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|1800799024|366016|23010399003|4143699003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	eiSVYMYoKl6jAJ36gHfnbCHShzahgUA7XfiQhvyRnil339Mf0m/ld6CLE1PqUdH0WM/hqF8vZ33si4AqDe5Dn5iQ/EnPONPN4OXKRGB8Qo5xJR4lwQfPRPubF0uZst1X/6d51uoHHi7VFDebhHhPkGkPJbtTFbdKYvHsj0M2RqwPHYJUsH8b1JbzTd7fUMpCLGNksffenvJwgn3/AmctBQuWxdwjMFEQ3elpbmbxGn10JwNi5qlLzpHyL0dE7FWvA2fpMsrBXOMKHHU6AqxOlDvLK9vK3lPti82iM25huatxbtdaqvRwgzkCqSlFgsMsLO8nw3UzOrllZV7bOm+J5CMd0bZ+d+vARr706VHas3vSd1yFR55UnhsM71M/BpuGq9Iokv6b1HroUzOkkeE9B9QuAc+vkL0NJyJPzmMNH/JqU9/d5agFvKwBcefpC0ogP3dLwFW1/WRhKvdww/UCWRjveEy47YBEREgAJ2SPo1q4mHIhnqJW32Tl98RTQL7sPgA3c0pPThQNWgTDq2K4fFFLwOELLh+EkdL6oYJeVn7KXqA8o/HqiDDmU/cC7zGL2AZlRRfN9GzAz7m3gX6JE5wcwL9+EtltUhb3EViiouKGnH7sxafzraMBmWb9/HpjF1G7/+Ghf7mc2GG8UnwO2W9/NClxak9b76aGhNXbIGM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(1800799024)(366016)(23010399003)(4143699003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B4Z01PYrcR5Q99tuSy7lQnim8RFg7MVnLMbcjQXb4UT52fXXwBjiRWBLrQbq?=
 =?us-ascii?Q?+4qOoLQhSIuUfBV6uz6pNI890zymA1SsNLelMR3PLkGYwD45NZUl4w9SF6Rb?=
 =?us-ascii?Q?cBgBYL1OwTVXbul1y5ZAVT/1HQH/F9h8urf6neHCBRRmgK0UyEG22qDXzCEI?=
 =?us-ascii?Q?6VgxpO8grbbvxt8LFreZGSZii0fO/O/d1nmjEX0/cz3qNBNKUF4urdYvqTEO?=
 =?us-ascii?Q?IAD2pWQkVVZzE3XkD6zMqAeWfHXsCkwhgnwPswOJhB2luCtuM858to51Lb5J?=
 =?us-ascii?Q?5iiQVHt1shH7Sh/ebU+xDs439iqY/Vqz5QwPIr6cn3CT9nqJJAtaSdwfndix?=
 =?us-ascii?Q?2OrZI6tl2buivwDud6FYGzrfC6CplbmzI+PY1w++yJammhAPOU4O0Ui2Ah5A?=
 =?us-ascii?Q?riarQJSQG2w9fLb/WdYzRk06Pihni/YDmz/7Z5HXI0KRuFNhGK6kKx2n1j/i?=
 =?us-ascii?Q?wM4SM1NiW6a39JkbVWxuSC40ZgGcR05Q2TIdNA/w7UGoyiaJvetVY7yIKKMk?=
 =?us-ascii?Q?6644CFT4mz1O19GZ+4UaB2cTOmizz1jTzfQWsAvacVdQv2MM45az/ENghZl+?=
 =?us-ascii?Q?K6EzyyQmRWPb/r6VQAUNbRmT3WQra3/G0iKaVprr28LlTu/S0Q6oRNY3oNIo?=
 =?us-ascii?Q?c7WsSX9eIUFAu+9Mii6+aA6NLlHi0dBLMeFPfHLMZiDn/foR8sJ6rUm6ETSm?=
 =?us-ascii?Q?bALvrFoppGdD+En6UGIJGefV1+da4LS1H4LWgTgecQQSclJt6gH3j/YIYeQR?=
 =?us-ascii?Q?5DVEPeelz36nbRvlPpSmle6s9MmJcex5qy7sb906CqE47agT7JX50LfLVagx?=
 =?us-ascii?Q?x81KkeH3ZznBNGWIEXOtzkwpOTDmI7qk9x3+aTWlDt6IrHOEJPCaoUYqjEzE?=
 =?us-ascii?Q?gRrKIfsnT241jUaSZr1UvReaLL0FSAhkyxHJYzLFjLU1VoVf8mXjkzpnukhY?=
 =?us-ascii?Q?VyTwkxAYQIEfDshDglViNRhozChpyZvNkN9DyR4yAaPMfz1RedCrZoYpgdrE?=
 =?us-ascii?Q?h/swjUxnw1rK8WIYZNtbVidBSDyXBY7MhG/L6UiLVr/EUAasH3cIw8smc/Zw?=
 =?us-ascii?Q?8viFS2xEsuyVZ+uNvjdVRj6nZr29I/Mbscy+aYMIAvUOrzfNbIhvr+eAkwXR?=
 =?us-ascii?Q?Qv2I0tMU081twcaCMgEzJ+Tz4NvIxOCyc7uZGX7RL29J8c8ihwqe5RhaZlB0?=
 =?us-ascii?Q?ZofIdZR8KdqRvRwh86bqIRY9FX1+rYPiC5T4HjvpfCM3/ds6VNWAN3ZdL9s5?=
 =?us-ascii?Q?dQABJEEPwNl2yMlGYuRBgRsr95t4zPOOKQUvuWYU9fAyMkWQNkNOWJRw+ipc?=
 =?us-ascii?Q?zJPUDHgcNwionc3diKxUU7i8ArwdV2x3PqthGUUdyQ2ylecTgOAZrYauUCfH?=
 =?us-ascii?Q?98vpYQqL/NikXbaBLMlwhP79MQTNkeX6917RnxTALIW6Tmq+qiwx5AOFVMrZ?=
 =?us-ascii?Q?V3Y1BhxQ/0HuDkeLYwlCphmhzBCOLb1uDGF0jn1AYajHU8MoaLXxUTirLlq6?=
 =?us-ascii?Q?khxEhiDsKC9gyuYtP7l9k4T5bMrJ4wL295y0fCrreM7cZa15Jq0yU0uqWTDY?=
 =?us-ascii?Q?aZex/30DPyQxgk8F41Fdf6uw6FyBc913IdcRaIZy3u+GMllfELjWoxrWQLHV?=
 =?us-ascii?Q?xrX7rVRITAjvFU4ZpM3yt4iXhuoDAnTeFIumtvzP8xH1ORKmV+A6nw3VaqhU?=
 =?us-ascii?Q?trjPqHoF3DxMtL9uhn0RjMMOfQkgGGEy+AJsr0idvSnOhaaVcXJjgrkLRUsj?=
 =?us-ascii?Q?kXTwtp1ndVgEf3XdNLfzbdsDbIZRyIzc1fXyQwcXJzTELomrQ8OM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 984bdb43-be3e-4649-1827-08df1048fee9
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 21:09:41.2335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gVO2nVGwhqMUqZlndwF5QUt5Tuou9Rv2neVOIRtdKVcTn9M3HslCVNSOnqEyZ2RoBTFQLcGL//W2w8wf6MdNL+6avG4iRnqIE4e+nXK2I+1y43iyTdoFSp3Oet8ukpd5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7617

On Sun, Sep 06, 2026 at 12:52:04PM +0100, Bryan O'Donoghue wrote:
> Add a devm variant of phy_get_by_of_node() to allow for the familiar
> pattern of having devres automatically release resources on the driver's
> exit path.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/phy/phy-core.c  | 34 ++++++++++++++++++++++++++++++++++
>  include/linux/phy/phy.h |  7 +++++++
>  2 files changed, 41 insertions(+)
>
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index 490a7cde6d40a..2e3581ecb42ee 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -1050,6 +1050,40 @@ struct phy *phy_get_by_of_node(struct device_node *np)
>  }
>  EXPORT_SYMBOL_GPL(phy_get_by_of_node);
>
> +/**
> + * devm_phy_get_by_of_node() - devm managed lookup and obtain phy reference by device node
> + * @dev: device requesting the PHY
> + * @np: device_node of the PHY provider
> + *
> + * Returns phy associated with the device_node or ERR_PTR. devres manages
> + * releasing resources.
> + */
> +struct phy *devm_phy_get_by_of_node(struct device *dev, struct device_node *np)
> +{
> +	struct phy **ptr, *phy;
> +	struct device_link *link;
> +
> +	ptr = devres_alloc(devm_phy_release, sizeof(*ptr), GFP_KERNEL);
> +	if (!ptr)
> +		return ERR_PTR(-ENOMEM);

Relate patches use devm_add_action_or_reset() instead manaully alloc
devres_alloc().

> +
> +	phy = phy_get_by_of_node(np);
> +	if (IS_ERR(phy)) {
> +		devres_free(ptr);
> +		return phy;
> +	}
> +
> +	*ptr = phy;
> +	devres_add(dev, ptr);
> +	link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
> +	if (!link)
> +		dev_dbg(dev, "failed to create device link to %s\n",
> +			dev_name(phy->dev.parent));

Is it okay to print dbg message()? suppose return NULL or some error?

Frank

> +
> +	return phy;
> +}
> +EXPORT_SYMBOL_GPL(devm_phy_get_by_of_node);
> +
>  /**
>   * phy_create() - create a new phy
>   * @dev: device that is creating the new phy
> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> index 71c2e16397130..14b924a88411f 100644
> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -285,6 +285,7 @@ struct phy *devm_of_phy_optional_get(struct device *dev, struct device_node *np,
>  struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
>  				     int index);
>  struct phy *phy_get_by_of_node(struct device_node *np);
> +struct phy *devm_phy_get_by_of_node(struct device *dev, struct device_node *np);
>  void of_phy_put(struct phy *phy);
>  void phy_put(struct device *dev, struct phy *phy);
>  void devm_phy_put(struct device *dev, struct phy *phy);
> @@ -499,6 +500,12 @@ static inline struct phy *phy_get_by_of_node(struct device_node *np)
>  	return ERR_PTR(-ENOSYS);
>  }
>
> +static inline struct phy *devm_phy_get_by_of_node(struct device *dev,
> +						  struct device_node *np)
> +{
> +	return ERR_PTR(-ENOSYS);
> +}
> +
>  static inline void of_phy_put(struct phy *phy)
>  {
>  }
>
> --
> 2.55.0
>
