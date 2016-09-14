Return-Path: <sboyd@codeaurora.org>
Date: Wed, 14 Sep 2016 14:33:24 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Irina Tirdea <irina.tirdea@intel.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v3] clk: x86: Add Atom PMC platform clocks
Message-ID: <20160914213324.GF7243@codeaurora.org>
References: <1473427417-9166-1-git-send-email-irina.tirdea@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1473427417-9166-1-git-send-email-irina.tirdea@intel.com>
List-ID: <linux-clk.vger.kernel.org>

On 09/09, Irina Tirdea wrote:
> +
> +static const char **plt_clk_register_parents(struct platform_device *pdev,
> +					     struct clk_plt_data *data,
> +					     const struct pmc_clk *clks)
> +{
> +	const char **parent_names;
> +	int i, err;
> +
> +	data->nparents = 0;
> +	while (clks[data->nparents].name)
> +		data->nparents++;
> +
> +	data->parents = devm_kzalloc(&pdev->dev,
> +				     sizeof(*data->parents) * data->nparents,
> +				     GFP_KERNEL);

This could be devm_kcalloc()

---8<----
diff --git a/drivers/clk/x86/clk-byt-plt.c b/drivers/clk/x86/clk-byt-plt.c
index 9dbf4b04ae47..7bd6c0dded00 100644
--- a/drivers/clk/x86/clk-byt-plt.c
+++ b/drivers/clk/x86/clk-byt-plt.c
@@ -259,9 +259,8 @@ static const char **plt_clk_register_parents(struct platform_device *pdev,
 	while (clks[data->nparents].name)
 		data->nparents++;
 
-	data->parents = devm_kzalloc(&pdev->dev,
-				     sizeof(*data->parents) * data->nparents,
-				     GFP_KERNEL);
+	data->parents = devm_kcalloc(&pdev->dev, data->nparents,
+				     sizeof(*data->parents), GFP_KERNEL);
 	if (!data->parents) {
 		err = -ENOMEM;
 		goto err_out;

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
