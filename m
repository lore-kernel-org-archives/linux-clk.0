Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013058.outbound.protection.outlook.com [52.101.72.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E7548EC71
	for <linux-clk@vger.kernel.org>; Thu, 10 Sep 2026 15:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789055253; cv=fail; b=r6RJ7KQOCztYF6hH9YDebD9oDsQTlxCs5BkpUhJTSAYRW6DJkM+jtS2ipJl59DOChyXOneB9HMeElGa5ONslBCZ+mgym0ImAkSZ8BjRKkwyI8Sa7hNsXmpjDfU/Ru2Uq45MdyB7y8LutY77I0MHHhXci18RQV2y+vfE0pr4O1ZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789055253; c=relaxed/simple;
	bh=kaXGDplEeDyiAIXVGCFflIjmMQRhQuiG4QQxoPKycns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VCRXzdjbynGUhEudVVOqAbOKqJ4Re8C/qHxO/UNcR5ijUZOskloq5puu2wcRsL2uA1ACpnHYFgM1z800VOn+nnxe5henYFqCc79xbgeVS8gL728zu30+db+3T0hTUwkCNIGa7iPddEEfemJDMge9rJ+4h1AkhjdKhUlqxMH3sNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wH4YjLf2; arc=fail smtp.client-ip=52.101.72.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wH4YjLf2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iagSojkr19CjVGISZhVpQFN3BsK9X7flI0Rlr2kexyh2iWH31qcH+7VbHC3RcDHzA9N7WNYre/QrPAAyKZ4TxVNuSThK4jJWz9PlfDTiXUMrcvF/KC765dU/g2t7R3hKGrGJMiKdg8XAdBAqvCcaYYIDGKzo9x0l9qsiwd7Zg+y1uGKdv9LsteUQVOns/KMNtG0ABnphuA062Y76tRAZDYWPverp3lsytVHzGyLbhN/ouK7o0pfjiJqz6JPuRMchEIA3u2BZEOvjWG8nL2UbS0ENuAYbb52JqR2gm/Z9L7I9/ROzdGXIlJ3R0BA1Y0vVgdov1wn6Ri3AUhvaM1YdoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BlgJmg8A3qAP3sHspgwQ3LTEL2mlVSBqmqFrm9aj0kU=;
 b=jkcNryAcTR2VUFiDEHhj0Q5/NxVjDzNbXCSwRnxHAA0PCmqq7DwmVFBIseFRdoksXHEjDoc7Z/HtvnZOtGPXP5cvW5Nw76fhLw/GHO6F0rUDPmj9tZGFS8LGEFI7LCI4b505WTZ4RcuHOL6qepKz0R3pdj8yMX3gubfyFPdzBtF5apuTg2Hz3LJhZChgB4GLODJhalAzW2RFvTpH/I484eX5ZlkXuBdn75dHVcDE42HxbpES2GEc76S94XHTAM+V1Yv5gmfqZXWK9D4McHeMG2VZ5FdKMxtj5UQWoGRVWk8Eeb7tXWjqHvOZrt6u+RLNzTTbh0zRbk/0nqME6ECnkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BlgJmg8A3qAP3sHspgwQ3LTEL2mlVSBqmqFrm9aj0kU=;
 b=wH4YjLf2HUSX+/YJf12UHCtr4ccu2hQ6IzZmvjngSZ+sy3fd8tvRDTIkxA9aCp9ZbGz/k7DsKqDCBixyhXCKEG9kCHSgz9I27srlTreI6HN0N2YuKJv5Ar2BwG3a+i9pMYOPuA25IUnFp+2ct2iU8hJtOyFWIhhyi7KsHkdhZ7UhFV8vAMdIBFTQYi2mGNjIMciJ+/9ZxNvqS+xiRIUY4xBTuTZE5rTP+EYsmvi2mi3VAwpxMuV+kdBOAcYXuqscByrpr1UY4Z5w1qvgFDUuiDKk6iuGX3P9blgOvNBZlaGw1AQfDHincWqxget7lnVc8T0I0HHwZ2TXZhudY+OxiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB11661.eurprd04.prod.outlook.com (2603:10a6:10:60f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 15:47:29 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 15:47:29 +0000
Date: Thu, 10 Sep 2026 10:47:20 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Linkai Gong <gonglinkai@kylinos.cn>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v2] clk: imx: composite-93: return timeout from gate
 enable
Message-ID: <aqLRCHFEbyUnSCEG@SMW015318>
References: <20260821085616.1129333-1-gonglinkai@kylinos.cn>
 <20260907022214.1076402-1-gonglinkai@kylinos.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907022214.1076402-1-gonglinkai@kylinos.cn>
X-ClientProxiedBy: PH7PR02CA0011.namprd02.prod.outlook.com
 (2603:10b6:510:33d::8) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB11661:EE_
X-MS-Office365-Filtering-Correlation-Id: 3790fb7f-2305-4b67-6e95-08df0f52d192
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|1800799024|366016|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Zkk0pY8uxnM63HS5KoTx/+qeXpOX8IDsBxsHg7pgeo3n4BYb4dATXXuSRrRiLgt3PJ+HgfE7Z26SNG6IhSNXMBgmBq+p8RQcRXioDUK6hJVyXntPYWldSQ3rL0bbvd3B5+ZILuaNpw26bz2cCiSoeRYkAX2CPbxyRL3lI1w6pOMvoXp2ZgmseAz1knkXrF2PU4gu6lYM0jpQ0Q70akcWgU7aXTtPUDrIkpCCm+qYKOz+NI93ak7m5lwzLB6NFFaauo0Rqrlu6h0tghR1inu79QKGU6sJMMp5+rWsfbWi+X9ob+oQrWfIoXJ6l5NvG4jNNvCJevacpPOMcaAcAls+V0nNZHmWm7bzsew8oomimhYYqQteCWuuhGAxaCIDTUFtIuD5LZMbG1j3s14cAw57wGc9DJ1blshpfR3WvYo2JzJcHUweXmzkjCYBxEqHXW6tZnz2s2eSDmEQrGTsT4Fzgjd/RorPJ3jbVWXD8nNh7q3fb74TOZNTnvkdSDBasVmhFHbgPIBSrZbwmdno9ZgC6+F1s2X8REjY18G9nZbNItIMh1/cgTdl2vXEtqVcuceYjKcL2+dR9y9vOpoy8yHGgr/0KhArw2yNV8UKIRMFpnpZdYR+PqSUo+x2C+lgiSsH4FEgyN8AT0mYSfPGVMEz5O7+nlTK8VSoYj28jCP9yGs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(1800799024)(366016)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vP4OMDaNzxloMxUr4DRJsJyX1m5rKkcdVXhAJpkD7nVXYxNrM8Yna+RrZQ/g?=
 =?us-ascii?Q?7kYk68a9mrFerG2/r2omMzAaXAhMKZudkAx9GApjQ3wYpThoB+2YWn5h1BYT?=
 =?us-ascii?Q?ou21ebseFa1tz6SWKF9Qhpw5sobqxA0WsnZ9lh8zJ/IUgcf2fTk7TlVo7eye?=
 =?us-ascii?Q?Ue8TqIXjv+hZZum0vgdrfBYfhhJmEmlVEp29mpeouXf3bVrHdjgmUcg6CVNw?=
 =?us-ascii?Q?hACBdotEpXiwytOftNRdycH6SjxvpeszwX18PR56AVYVYyB6GQk0Ul8/U3dN?=
 =?us-ascii?Q?JmjJDyko+bM7JxoLMsJ5g2tziQz0koA8ReMv3rZclcTPfBhoOg3aBC6C6WdA?=
 =?us-ascii?Q?qj5XwQjBCUoDQRm/aOvUSLZqqI4Rugi2+END1TbXc/LEJOG5J4PkBWkxsWzB?=
 =?us-ascii?Q?A1zVuSxYWEiMURO8w7Ax6fXarlbxI8D71ZQcg3Oo1lCjQmb+B5VFtaY1uOlU?=
 =?us-ascii?Q?CmWyBhn8OPSt7SKc6rSrrtclXB/vIfXXI94LELc3StRn3gBdnvu77jcwwMkO?=
 =?us-ascii?Q?AxPsu7Wy1uzJ+OoYk7XIKM3mEg3Zfljpq9+H9XQL5ca5zEGRJ+GRdcgM6kxk?=
 =?us-ascii?Q?eoEAcKlAYgf52RNuGFuMpLemEleDShaiMxeBj503s6eBBbcCwZ0Y8OAhSCuM?=
 =?us-ascii?Q?MRAUbaPQd/pEamip8PsPSEOzZ8FhoNrh0k70Ljz4kFkJMUn3vW3YNsJuX+hO?=
 =?us-ascii?Q?rM1+1lKZvmFsQc1PeoHcGn8zfq0ib2KkivKsdtVVXuUYZOlYn0oBnyWdJ0Zr?=
 =?us-ascii?Q?aIk7JUyjqMPGo5mnXfPpmaQCMd/TaSXWOQ9wJ0qx6gXQdVDOChQQ/4kDprqn?=
 =?us-ascii?Q?cF3glpbSN5kGHngjS9BLCnyLCAgInh3HEQmBTq8cz+mpAl60ZEJJWksFJq0s?=
 =?us-ascii?Q?Pbj7CpTy0WhvK8AtiVIClKBMAJQ3S7QjjL7f5bmtwRjMuRZZm3PMDFFKjpdB?=
 =?us-ascii?Q?L28oQ3ucu7Ukq0guAT0fdUO0mnrtqvKCHfNLmT6HYpMEzbIU2dqzgIni9DlX?=
 =?us-ascii?Q?4XmRyeIWo4STDR0XILm/kt5z2raDWL44H77W7sCXxAqtmtc2odKg0tBWAe5i?=
 =?us-ascii?Q?TIYMyBqBIsnIHDKeQuyvxIqiuOVJyodkPwHMet3Orz/zO2KU2Xe9sH+QwASu?=
 =?us-ascii?Q?NaHIrtxhgP2YAWuZn6Co79w2I8FLgn1O2LUJfr8M6tjWXQtlWmdb+4hoM+Am?=
 =?us-ascii?Q?ouyN16VO8IZtt3T8RLWHnyjzV8z7Wkj/mEVI6LHprYYXgRyu8egQW2jPVlop?=
 =?us-ascii?Q?RWMmEmh6AYwbOdGcnP+8Q5xXW5rbqkRzmB1B/x28Io0kknMLYo9ShgH2nF7D?=
 =?us-ascii?Q?kGtqkVm8fasTWjGAFKMffnMxqWt3V6DzWVvKakqqKq0LBKqqiRBG/MBPQgUZ?=
 =?us-ascii?Q?oqBy36+TYDlvs6D+DsqnRJAImhnywy34qiR+avQw9FdDEfOnHHOdUvmimKGB?=
 =?us-ascii?Q?jyl90OpW2rt5Ju8PyT8GKn/MItY95nRcvbujCwJ9sa9HWu5riCadJouVitQm?=
 =?us-ascii?Q?A6RFO775AfvK1rVGzSXMiZ9VAdF330P932FHQTLQTaG0Zh0v2sF52MzUdxFX?=
 =?us-ascii?Q?Z2NByfa8tNmaU8+eZM0uYptBvfffE+1Edc2LQQZHLgP66N0qqRJqdBo2KqXv?=
 =?us-ascii?Q?5fW63KbOmBQTCLYOgNiECXVNqNq3t4mSkxfkqQ+E1LV0s32jvDOixZ/6mFaR?=
 =?us-ascii?Q?oBctzCTm5AH7EuCBJ+cBGiwSLDt12vGstU4an2gQ92Kvs+XW6jd/zOZdJSRv?=
 =?us-ascii?Q?NZLjDld19BaKFMrNbzkV2dpV5Kysr8k8dOaq+pSP+4rfcmuiEtea?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3790fb7f-2305-4b67-6e95-08df0f52d192
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 15:47:29.1061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rO+1+SV3bs5thvHbzgYvMUHVYsF7cfJ+9u2Uqwf1DcQVUdfeVtYNMAPasOO+JqsSyXnoJU5STXUS8vSewmo3Kd03ROt+3BGC8Gx4Yrs0a3xzimntBE9Y9bZzWC2oQ3kV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11661

On Mon, Sep 07, 2026 at 10:22:14AM +0800, Linkai Gong wrote:
> [You don't often get email from gonglinkai@kylinos.cn. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> imx93_clk_composite_wait_ready() already reports a busy timeout, but
> imx93_clk_composite_gate_enable() ignores that and always returns 0.
> The clk framework then marks the clock enabled and lets consumers run
> while the CCM slice is still busy.
>
> Propagate the timeout so enable fails instead of looking successful.
>
> Fixes: 4a3de5aa7743 ("clk: imx: clk-composite-93: check slice busy")
> Signed-off-by: Linkai Gong <gonglinkai@kylinos.cn>
> ---
> v2:
> - Rewrite the commit message to explain why (Abel Vesa)

Don't post to v1's thread.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>  drivers/clk/imx/clk-composite-93.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clk/imx/clk-composite-93.c b/drivers/clk/imx/clk-composite-93.c
> index ef20ceb2d255..953f67d13978 100644
> --- a/drivers/clk/imx/clk-composite-93.c
> +++ b/drivers/clk/imx/clk-composite-93.c
> @@ -43,11 +43,12 @@ static int imx93_clk_composite_wait_ready(struct clk_hw *hw, void __iomem *reg)
>         return ret;
>  }
>
> -static void imx93_clk_composite_gate_endisable(struct clk_hw *hw, int enable)
> +static int imx93_clk_composite_gate_endisable(struct clk_hw *hw, int enable)
>  {
>         struct clk_gate *gate = to_clk_gate(hw);
>         unsigned long flags;
>         u32 reg;
> +       int ret;
>
>         if (gate->lock)
>                 spin_lock_irqsave(gate->lock, flags);
> @@ -61,17 +62,17 @@ static void imx93_clk_composite_gate_endisable(struct clk_hw *hw, int enable)
>
>         writel(reg, gate->reg);
>
> -       imx93_clk_composite_wait_ready(hw, gate->reg);
> +       ret = imx93_clk_composite_wait_ready(hw, gate->reg);
>
>         if (gate->lock)
>                 spin_unlock_irqrestore(gate->lock, flags);
> +
> +       return ret;
>  }
>
>  static int imx93_clk_composite_gate_enable(struct clk_hw *hw)
>  {
> -       imx93_clk_composite_gate_endisable(hw, 1);
> -
> -       return 0;
> +       return imx93_clk_composite_gate_endisable(hw, 1);
>  }
>
>  static void imx93_clk_composite_gate_disable(struct clk_hw *hw)
> --
> 2.25.1
>
