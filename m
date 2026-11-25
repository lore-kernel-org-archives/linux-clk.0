Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621008;
	b=OAMlKeorIh4wmQ8dhf+E7G4g+7NuAHT8kIhdKVNZJaDZVUC4AG3+ClaDcAAx/y2hRBR9
	 CklIMeCKLXBnYHBkVYNnuRbHOO6WEsaiTtpmHSb+FvpXa0Gk1DXKY+t36lqGTDZfXJvtK
	 SFahGmzF5BHsH5OPs3P7yohsZUrYJ3IGFw4sJMvzP7qPg3Wkj4vKcXXEl2+dBss9gY2bq
	 q4wJLeRze0LRNYw2KdYX4t/LGnDRTB1UwEA8UEr6yhCHpViVboUU9Qw+thc4V3PvQqw2I
	 rmxgV0dST+9mYmT8QZ92ngb931gKk9+fNvId8Lc1xrmcFqxMdjE6zLN6GwcBjFlCleA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621008;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=E4gahwPKY0YwK67Ml2QTBETBsr9zPWMHQsnmRG4ecuk=;
	b=VHeflg3wmz4Xr+Jw/kXufGN6wqAcgxXnIvVlwp3DDCvgpvPF1L0StX0rbngIGF3n85hD
	 u/MNEmE2pdLMP5UIkIK+byQiLXTLJ/k8ztK212hnTupfQzjP4VfeZy9EsEcNAVTKcdQuz
	 mP4QoLdHLfmtW5cLsaNUKEUrsXjXSZsg7/QbPm7H8PPy2BOajdadkvlpRZoPfq94JgoxH
	 6HSgR7s0e1XshhWR7DKhAN70h6RKK0z/uFrM5aRsb7uZNSlOdDPn8WlK3RkjFaPjH3Ztt
	 PcBYUYmZp1ko2J1zwRkvcmNQEmpo8kc8xdecRMbDSVn5Tz4nrqbQ9SkzvfHqZNPbutw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iJsa1Ph6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28C9606A695;
	Wed, 25 Nov 2026 15:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iJsa1Ph6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA7A81F000D2;
	Wed, 25 Nov 2026 15:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795621008;
	bh=E4gahwPKY0YwK67Ml2QTBETBsr9zPWMHQsnmRG4ecuk=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=iJsa1Ph6Lye8Kxltg2vx087a/5J4RHKTfD6GWrcsAiXCLSCCDyc2Osclsbv2u4Gz6
	 gzPl5LIExg0ABFVCuLmjfPIfGu/cr18Twx8HJZ7aOBGG1O5uU05AHowHJMa8XL3hiB
	 Ljdyo+kuWwYcSweCv5J3YItc6gzVJjrrbdUheGDDn3zHz4USa6B3VRvmfAt+PtEQVa
	 LW3kjRPdh8Rem0j8tHFdBtAvDn7aEMW3SR76E61r/KB6s7IvIM6f1xkFiXiILA8DnA
	 v6imJSFC2MKJ0ydJqgl+xvVlFcBxiRBQB1NruNfOTFYzezfdr032SFjR+aQBxCSfdz
	 SCwEhzzppq+dA==
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 8/8] clk: clocking-wizard: Use separate
 notifier_block for each clock
From: Brian Masney <masneyb@kernel.org>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, git@amd.com, 
 shubhrajyoti.datta@gmail.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261124035613.1968260-9-shubhrajyoti.datta@amd.com>
References: <20261124035613.1968260-1-shubhrajyoti.datta@amd.com>
 <20261124035613.1968260-9-shubhrajyoti.datta@amd.com>
Date: Wed, 25 Nov 2026 10:36:33 -0500
Message-Id: <179562099317.458327.8068874764407758762.b4-review@b4>
X-Mailer: b4 0.17-dev-8145e
X-Developer-Signature: v=1; a=openpgp-sha256; l=2787; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=eaOLuiMerQksPgxnTMm1NlWOcHllakrAf02cjhklA2A=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLZGVoPy995/E0xrb3yToHo+oqub9WRSq65vhmLz0o3W
 iYmaqp0lLIwiHExyIopsizJNSqISF1le++OJgvMHFYmkCEMXJwCMBGFmYwMfdHXd960OcD/NPO4
 9pVHGkVxjO5GB2dwFm2o0Iy3i1vqzchwR4bl/3SRZ2nTHaIk+ZfoXtZ7/iZ1ybtZVd+FJII2sdx
 hBQA=
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Hi Shubhrajyoti,

> A struct notifier_block has a single 'next' pointer, so registering the
> same instance to two different notification chains corrupts the linked
> lists. Use a dedicated nb_axi for the s_axi_aclk notifier chain.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

Same as previous patch. Needs a Fixes and Cc stable.

> ---
> (no changes since v3)
> 
> Changes in v3:
> - New patch: split the shared notifier_block into per-clock callbacks
>   to avoid corrupting the notifier chains
> 
>  drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 42 +++++++++++++++++-----
>  1 file changed, 33 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> index 046efa5c77c9..f71e464e0fca 100644
> --- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> +++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> @@ -133,7 +133,8 @@ enum clk_wzrd_int_clks {
>  /**
>   * struct clk_wzrd - Clock wizard private data structure
>   *
> - * @nb:			Notifier block
> + * @nb:			Notifier block for clk_in1
> + * @nb_axi:		Notifier block for s_axi_aclk
>   * @base:		Memory base
>   * @clk_in1:		Handle to input clock 'clk_in1'
>   * @axi_clk:		Handle to input clock 's_axi_aclk'
> @@ -144,6 +145,7 @@ enum clk_wzrd_int_clks {
>   */
>  struct clk_wzrd {
>  	struct notifier_block nb;
> +	struct notifier_block nb_axi;
>  	void __iomem *base;
>  	struct clk *clk_in1;
>  	struct clk *axi_clk;
> @@ -191,6 +193,7 @@ struct versal_clk_data {
>  };
>  
>  #define to_clk_wzrd(_nb) container_of(_nb, struct clk_wzrd, nb)
> +#define to_clk_wzrd_axi(_nb) container_of(_nb, struct clk_wzrd, nb_axi)
>  
>  /* maximum frequencies for input/output clocks per speed grade */
>  static const unsigned long clk_wzrd_max_freq[] = {
> @@ -1160,6 +1163,30 @@ static struct clk_hw *clk_wzrd_register_divider(struct device *dev,
>  
>  static int clk_wzrd_clk_notifier(struct notifier_block *nb, unsigned long event,
>  				 void *data)
> +{
> +	unsigned long max;
> +	struct clk_notifier_data *ndata = data;
> +	struct clk_wzrd *clk_wzrd = to_clk_wzrd_axi(nb);
> +
> +	if (clk_wzrd->suspended)
> +		return NOTIFY_OK;
> +
> +	max = WZRD_ACLK_MAX_FREQ;
> +
> +	switch (event) {
> +	case PRE_RATE_CHANGE:
> +		if (ndata->new_rate > max)
> +			return NOTIFY_BAD;
> +		return NOTIFY_OK;
> +	case POST_RATE_CHANGE:
> +	case ABORT_RATE_CHANGE:
> +	default:
> +		return NOTIFY_DONE;
> +	}
> +}
> +
> +static int clk_wzrd_clk_notifier_in1(struct notifier_block *nb, unsigned long event,

After this change, clk_wzrd_clk_notifier() and
clk_wzrd_clk_notifier_in1() can be combined with a common helper.

Brian

-- 
Brian Masney <masneyb@kernel.org>
