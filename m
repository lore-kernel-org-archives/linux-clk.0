Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="H+Tih2AC"
X-Greylist: delayed 329 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 14 Dec 2023 00:49:05 PST
Received: from mail-m12780.qiye.163.com (mail-m12780.qiye.163.com [115.236.127.80])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0C6910C;
	Thu, 14 Dec 2023 00:49:05 -0800 (PST)
DKIM-Signature: a=rsa-sha256;
	b=H+Tih2AC1swsa5LpolLueaHwjGrZcQgYvOihmSPLeeLcpCcwbsfl7MzZ+JSwRBd74tlMZ7Fpt9bioIds7vQaYmqF5oGzOxy94LNRn4LQ5dnuTLiF8MxZf8s/VdbY8o7UZ/2PD2I+OBdlnugqv89YfjOOTW9XmUoBtzSDWg3BL3I=;
	c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=WikvbsWmSBI7ys5pJkbGwLqwVnrtiIg2JwpTBdw98p0=;
	h=date:mime-version:subject:message-id:from;
Received: from [172.16.12.87] (unknown [58.22.7.114])
	by mail-m12744.qiye.163.com (Hmail) with ESMTPA id CEE8B10052F;
	Thu, 14 Dec 2023 16:42:35 +0800 (CST)
Message-ID: <090a7670-6997-4be3-99d7-24f67430a16c@rock-chips.com>
Date: Thu, 14 Dec 2023 16:42:32 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/7] clk: rockchip: rk3588: fix CLK_NR_CLKS usage
Content-Language: en-US
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Kever Yang <kever.yang@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, andy.yan@rock-chips.com,
 devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com, Elaine Zhang <zhangqing@rock-chips.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-clk@vger.kernel.org
References: <20231213185114.47565-1-sebastian.reichel@collabora.com>
 <20231213185114.47565-2-sebastian.reichel@collabora.com>
From: Tao Huang <huangtao@rock-chips.com>
In-Reply-To: <20231213185114.47565-2-sebastian.reichel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUNJSFZMTx8aShlIQkkfGBpVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlOQ1VJSVVMVUpKT1lXWRYaDxIVHRRZQVlPS0hVSk1PSU5JVUpLS1VKQl
	kG
X-HM-Tid: 0a8c677df184b217kuuucee8b10052f
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NSo6ITo*UTwzPzICCipNKRgC
	DyhPCjVVSlVKTEtJTk9ISE5NQk5LVTMWGhIXVRMOGhUcDxoUOwkUGBBWGBMSCwhVGBQWRVlXWRIL
	WUFZTkNVSUlVTFVKSk9ZV1kIAVlBTkhOSTcG

On 2023/12/14 上午2:46, Sebastian Reichel wrote:
> CLK_NR_CLKS is not part of the DT bindings and needs to be removed
> from it, just like it recently happened for other platforms. This
> takes care of it by introducing a new function identifying the
> maximum used clock ID at runtime.
>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/clk/rockchip/clk-rk3588.c |  5 ++++-
>  drivers/clk/rockchip/clk.c        | 17 +++++++++++++++++
>  drivers/clk/rockchip/clk.h        |  2 ++
>  3 files changed, 23 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk-rk3588.c
> index 6994165e0395..0b60ae78f9d8 100644
> --- a/drivers/clk/rockchip/clk-rk3588.c
> +++ b/drivers/clk/rockchip/clk-rk3588.c
> @@ -2458,15 +2458,18 @@ static struct rockchip_clk_branch rk3588_clk_branches[] __initdata = {
>  static void __init rk3588_clk_init(struct device_node *np)
>  {
>  	struct rockchip_clk_provider *ctx;
> +	unsigned long clk_nr_clks;
>  	void __iomem *reg_base;
>  
> +	clk_nr_clks = rockchip_clk_find_max_clk_id(rk3588_clk_branches,
> +					ARRAY_SIZE(rk3588_clk_branches)) + 1;
>  	reg_base = of_iomap(np, 0);
>  	if (!reg_base) {
>  		pr_err("%s: could not map cru region\n", __func__);
>  		return;
>  	}
>  
> -	ctx = rockchip_clk_init(np, reg_base, CLK_NR_CLKS);
> +	ctx = rockchip_clk_init(np, reg_base, clk_nr_clks);
>  	if (IS_ERR(ctx)) {
>  		pr_err("%s: rockchip clk init failed\n", __func__);
>  		iounmap(reg_base);
> diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
> index 4059d9365ae6..043458b7c579 100644
> --- a/drivers/clk/rockchip/clk.c
> +++ b/drivers/clk/rockchip/clk.c
> @@ -429,6 +429,23 @@ void rockchip_clk_register_plls(struct rockchip_clk_provider *ctx,
>  }
>  EXPORT_SYMBOL_GPL(rockchip_clk_register_plls);
>  
> +unsigned long rockchip_clk_find_max_clk_id(struct rockchip_clk_branch *list,
> +					   unsigned int nr_clk)
> +{
> +	unsigned int idx;
> +	unsigned long max;

smatch report warning: uninitialized symbol 'max'.
And make sure this function return correct number, for example, when nr_clk == 0.

> +
> +	for (idx = 0; idx < nr_clk; idx++, list++) {
> +		if (list->id > max)
> +			max = list->id;
> +		if (list->child && list->child->id > max)
> +			max = list->id;
> +	}
> +
> +	return max;
> +}
> +EXPORT_SYMBOL_GPL(rockchip_clk_find_max_clk_id);
> +
>  void rockchip_clk_register_branches(struct rockchip_clk_provider *ctx,
>  				    struct rockchip_clk_branch *list,
>  				    unsigned int nr_clk)
> diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
> index 758ebaf2236b..fd3b476dedda 100644
> --- a/drivers/clk/rockchip/clk.h
> +++ b/drivers/clk/rockchip/clk.h
> @@ -973,6 +973,8 @@ struct rockchip_clk_provider *rockchip_clk_init(struct device_node *np,
>  			void __iomem *base, unsigned long nr_clks);
>  void rockchip_clk_of_add_provider(struct device_node *np,
>  				struct rockchip_clk_provider *ctx);
> +unsigned long rockchip_clk_find_max_clk_id(struct rockchip_clk_branch *list,
> +					   unsigned int nr_clk);
>  void rockchip_clk_register_branches(struct rockchip_clk_provider *ctx,
>  				    struct rockchip_clk_branch *list,
>  				    unsigned int nr_clk);

