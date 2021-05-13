Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EBC3C433B4
	for <linux-clk@archiver.kernel.org>; Thu, 13 May 2021 06:58:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 68C5C6143E
	for <linux-clk@archiver.kernel.org>; Thu, 13 May 2021 06:58:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230246AbhEMG7T (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 May 2021 02:59:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:52808 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231398AbhEMG7S (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 13 May 2021 02:59:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A13076143B;
        Thu, 13 May 2021 06:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620889089;
        bh=DmYcgbUmO4AO1uG5wfxSx7IpxcEiTSFryNADyisPpZs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Dxiux5ZP4zdEw1d+6Q6DJ+1OJonOgo6NcVcBds8rJ5Z9nVwuXA4SElLuXND67ihOY
         UOC+3K/73omeAC88vZ2QgT3E0a+FMc7Iqjtul1w3PyvgNmLBpgCFTnPE2naYmBueME
         WRumLBs0iOSVwECoaFBgswfEVpoLtxiuahkkH6mocJGirpjWArOAOZB0otTlDXjDFu
         65YkT/EHIBwu0+8KZmdceKoHJi5sgEak55bEYkC00aQC2Utrkge3acu/iGRkzmAUVH
         tSaQQdZzbBZl5Ci2RQ7u/oslVAg1cGf34s/FdB7nH9WsneFrEzLpi9U/m43RbrinW/
         5GvAIxBmBdqtA==
Date:   Thu, 13 May 2021 09:58:04 +0300
From:   Abel Vesa <abelvesa@kernel.org>
To:     Dong Aisheng <aisheng.dong@nxp.com>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        dongas86@gmail.com, kernel@pengutronix.de, shawnguo@kernel.org,
        linux-imx@nxp.com, abel.vesa@nxp.com, sboyd@kernel.org
Subject: Re: [PATCH 4/6] clk: imx: scu: add gpr clocks support
Message-ID: <YJzN/MLXf22E/OQd@ryzen.lan>
References: <20210423033334.3317992-1-aisheng.dong@nxp.com>
 <20210423033334.3317992-4-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210423033334.3317992-4-aisheng.dong@nxp.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21-04-23 11:33:32, Dong Aisheng wrote:
> SCU clock protocol supports a few clocks based on GPR controller
> registers including mux/divider/gate.
> And a general clock register API to support them all.

You mean "Add a generic", right ?

Otherwise, looks OK to me.

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

> 
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
>  drivers/clk/imx/clk-scu.c | 186 ++++++++++++++++++++++++++++++++++++++
>  drivers/clk/imx/clk-scu.h |  29 ++++++
>  2 files changed, 215 insertions(+)
> 
> diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
> index 1f5518b7ab39..cff0e1bd7030 100644
> --- a/drivers/clk/imx/clk-scu.c
> +++ b/drivers/clk/imx/clk-scu.c
> @@ -52,6 +52,22 @@ struct clk_scu {
>  	u32 rate;
>  };
>  
> +/*
> + * struct clk_gpr_scu - Description of one SCU GPR clock
> + * @hw: the common clk_hw
> + * @rsrc_id: resource ID of this SCU clock
> + * @gpr_id: GPR ID index to control the divider
> + */
> +struct clk_gpr_scu {
> +	struct clk_hw hw;
> +	u16 rsrc_id;
> +	u8 gpr_id;
> +	u8 flags;
> +	bool gate_invert;
> +};
> +
> +#define to_clk_gpr_scu(_hw) container_of(_hw, struct clk_gpr_scu, hw)
> +
>  /*
>   * struct imx_sc_msg_req_set_clock_rate - clock set rate protocol
>   * @hdr: SCU protocol header
> @@ -604,3 +620,173 @@ void imx_clk_scu_unregister(void)
>  		}
>  	}
>  }
> +
> +static unsigned long clk_gpr_div_scu_recalc_rate(struct clk_hw *hw,
> +						 unsigned long parent_rate)
> +{
> +	struct clk_gpr_scu *clk = to_clk_gpr_scu(hw);
> +	unsigned long rate = 0;
> +	u32 val;
> +	int err;
> +
> +	err = imx_sc_misc_get_control(ccm_ipc_handle, clk->rsrc_id,
> +				      clk->gpr_id, &val);
> +
> +	rate  = val ? parent_rate / 2 : parent_rate;
> +
> +	return err ? 0 : rate;
> +}
> +
> +static long clk_gpr_div_scu_round_rate(struct clk_hw *hw, unsigned long rate,
> +				   unsigned long *prate)
> +{
> +	if (rate < *prate)
> +		rate = *prate / 2;
> +	else
> +		rate = *prate;
> +
> +	return rate;
> +}
> +
> +static int clk_gpr_div_scu_set_rate(struct clk_hw *hw, unsigned long rate,
> +				    unsigned long parent_rate)
> +{
> +	struct clk_gpr_scu *clk = to_clk_gpr_scu(hw);
> +	uint32_t val;
> +	int err;
> +
> +	val = (rate < parent_rate) ? 1 : 0;
> +	err = imx_sc_misc_set_control(ccm_ipc_handle, clk->rsrc_id,
> +				      clk->gpr_id, val);
> +
> +	return err ? -EINVAL : 0;
> +}
> +
> +static const struct clk_ops clk_gpr_div_scu_ops = {
> +	.recalc_rate = clk_gpr_div_scu_recalc_rate,
> +	.round_rate = clk_gpr_div_scu_round_rate,
> +	.set_rate = clk_gpr_div_scu_set_rate,
> +};
> +
> +static u8 clk_gpr_mux_scu_get_parent(struct clk_hw *hw)
> +{
> +	struct clk_gpr_scu *clk = to_clk_gpr_scu(hw);
> +	u32 val = 0;
> +
> +	imx_sc_misc_get_control(ccm_ipc_handle, clk->rsrc_id,
> +				clk->gpr_id, &val);
> +
> +	return (u8)val;
> +}
> +
> +static int clk_gpr_mux_scu_set_parent(struct clk_hw *hw, u8 index)
> +{
> +	struct clk_gpr_scu *clk = to_clk_gpr_scu(hw);
> +
> +	return imx_sc_misc_set_control(ccm_ipc_handle, clk->rsrc_id,
> +				       clk->gpr_id, index);
> +}
> +
> +static const struct clk_ops clk_gpr_mux_scu_ops = {
> +	.get_parent = clk_gpr_mux_scu_get_parent,
> +	.set_parent = clk_gpr_mux_scu_set_parent,
> +};
> +
> +static int clk_gpr_gate_scu_prepare(struct clk_hw *hw)
> +{
> +	struct clk_gpr_scu *clk = to_clk_gpr_scu(hw);
> +
> +	return imx_sc_misc_set_control(ccm_ipc_handle, clk->rsrc_id,
> +				       clk->gpr_id, !clk->gate_invert);
> +}
> +
> +static void clk_gpr_gate_scu_unprepare(struct clk_hw *hw)
> +{
> +	struct clk_gpr_scu *clk = to_clk_gpr_scu(hw);
> +	int ret;
> +
> +	ret = imx_sc_misc_set_control(ccm_ipc_handle, clk->rsrc_id,
> +				      clk->gpr_id, clk->gate_invert);
> +	if (ret)
> +		pr_err("%s: clk unprepare failed %d\n", clk_hw_get_name(hw),
> +		       ret);
> +}
> +
> +static int clk_gpr_gate_scu_is_prepared(struct clk_hw *hw)
> +{
> +	struct clk_gpr_scu *clk = to_clk_gpr_scu(hw);
> +	int ret;
> +	u32 val;
> +
> +	ret = imx_sc_misc_get_control(ccm_ipc_handle, clk->rsrc_id,
> +				      clk->gpr_id, &val);
> +	if (ret)
> +		return ret;
> +
> +	return clk->gate_invert ? !val : val;
> +}
> +
> +static const struct clk_ops clk_gpr_gate_scu_ops = {
> +	.prepare = clk_gpr_gate_scu_prepare,
> +	.unprepare = clk_gpr_gate_scu_unprepare,
> +	.is_prepared = clk_gpr_gate_scu_is_prepared,
> +};
> +
> +struct clk_hw *__imx_clk_gpr_scu(const char *name, const char * const *parent_name,
> +				 int num_parents, u32 rsrc_id, u8 gpr_id, u8 flags,
> +				 bool invert)
> +{
> +	struct imx_scu_clk_node *clk_node;
> +	struct clk_gpr_scu *clk;
> +	struct clk_hw *hw;
> +	struct clk_init_data init;
> +	int ret;
> +
> +	if (rsrc_id >= IMX_SC_R_LAST || gpr_id >= IMX_SC_C_LAST)
> +		return ERR_PTR(-EINVAL);
> +
> +	clk_node = kzalloc(sizeof(*clk_node), GFP_KERNEL);
> +	if (!clk_node)
> +		return ERR_PTR(-ENOMEM);
> +
> +	clk = kzalloc(sizeof(*clk), GFP_KERNEL);
> +	if (!clk) {
> +		kfree(clk_node);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	clk->rsrc_id = rsrc_id;
> +	clk->gpr_id = gpr_id;
> +	clk->flags = flags;
> +	clk->gate_invert = invert;
> +
> +	if (flags & IMX_SCU_GPR_CLK_GATE)
> +		init.ops = &clk_gpr_gate_scu_ops;
> +
> +	if (flags & IMX_SCU_GPR_CLK_DIV)
> +		init.ops = &clk_gpr_div_scu_ops;
> +
> +	if (flags & IMX_SCU_GPR_CLK_MUX)
> +		init.ops = &clk_gpr_mux_scu_ops;
> +
> +	init.flags = 0;
> +	init.name = name;
> +	init.parent_names = parent_name;
> +	init.num_parents = num_parents;
> +
> +	clk->hw.init = &init;
> +
> +	hw = &clk->hw;
> +	ret = clk_hw_register(NULL, hw);
> +	if (ret) {
> +		kfree(clk);
> +		kfree(clk_node);
> +		hw = ERR_PTR(ret);
> +	} else {
> +		clk_node->hw = hw;
> +		clk_node->clk_type = gpr_id;
> +		list_add_tail(&clk_node->node, &imx_scu_clks[rsrc_id]);
> +	}
> +
> +	return hw;
> +}
> diff --git a/drivers/clk/imx/clk-scu.h b/drivers/clk/imx/clk-scu.h
> index a6c6d3103e94..8ebee0cb0fe6 100644
> --- a/drivers/clk/imx/clk-scu.h
> +++ b/drivers/clk/imx/clk-scu.h
> @@ -10,6 +10,10 @@
>  #include <linux/firmware/imx/sci.h>
>  #include <linux/of.h>
>  
> +#define IMX_SCU_GPR_CLK_GATE	BIT(0)
> +#define IMX_SCU_GPR_CLK_DIV	BIT(1)
> +#define IMX_SCU_GPR_CLK_MUX	BIT(2)
> +
>  extern struct list_head imx_scu_clks[];
>  extern const struct dev_pm_ops imx_clk_lpcg_scu_pm_ops;
>  
> @@ -31,6 +35,10 @@ struct clk_hw *__imx_clk_lpcg_scu(struct device *dev, const char *name,
>  				  void __iomem *reg, u8 bit_idx, bool hw_gate);
>  void imx_clk_lpcg_scu_unregister(struct clk_hw *hw);
>  
> +struct clk_hw *__imx_clk_gpr_scu(const char *name, const char * const *parent_name,
> +				 int num_parents, u32 rsrc_id, u8 gpr_id, u8 flags,
> +				 bool invert);
> +
>  static inline struct clk_hw *imx_clk_scu(const char *name, u32 rsrc_id,
>  					 u8 clk_type)
>  {
> @@ -58,4 +66,25 @@ static inline struct clk_hw *imx_clk_lpcg_scu(const char *name, const char *pare
>  	return __imx_clk_lpcg_scu(NULL, name, parent_name, flags, reg,
>  				  bit_idx, hw_gate);
>  }
> +
> +static inline struct clk_hw *imx_clk_gate_gpr_scu(const char *name, const char *parent_name,
> +						  u32 rsrc_id, u8 gpr_id, bool invert)
> +{
> +	return __imx_clk_gpr_scu(name, &parent_name, 1, rsrc_id, gpr_id,
> +				 IMX_SCU_GPR_CLK_GATE, invert);
> +}
> +
> +static inline struct clk_hw *imx_clk_divider_gpr_scu(const char *name, const char *parent_name,
> +						     u32 rsrc_id, u8 gpr_id)
> +{
> +	return __imx_clk_gpr_scu(name, &parent_name, 1, rsrc_id, gpr_id,
> +				 IMX_SCU_GPR_CLK_DIV, 0);
> +}
> +
> +static inline struct clk_hw *imx_clk_mux_gpr_scu(const char *name, const char * const *parent_names,
> +						 int num_parents, u32 rsrc_id, u8 gpr_id)
> +{
> +	return __imx_clk_gpr_scu(name, parent_names, num_parents, rsrc_id,
> +				 gpr_id, IMX_SCU_GPR_CLK_MUX, 0);
> +}
>  #endif
> -- 
> 2.25.1
> 
