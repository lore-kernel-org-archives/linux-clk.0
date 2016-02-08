Return-Path: <sboyd@codeaurora.org>
Date: Mon, 8 Feb 2016 14:35:46 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] devm: add helper devm_add_action_or_reset()
Message-ID: <20160208223546.GA10791@codeaurora.org>
References: <1450873640-12489-1-git-send-email-sudipm.mukherjee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1450873640-12489-1-git-send-email-sudipm.mukherjee@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 12/23, Sudip Mukherjee wrote:
> Add a helper function devm_add_action_or_reset() which will internally
> call devm_add_action(). But if devm_add_action() fails then it will
> execute the action mentioned and return the error code.
> 
> Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
> ---

Greg, can I get your ack here to take this through clk-tree?

> 
> Next patch of the series will use this helper. And from a first glance
> more use of this helper will be there.
> 
>  include/linux/device.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/include/linux/device.h b/include/linux/device.h
> index f627ba2..f2455d0 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -682,6 +682,18 @@ void __iomem *devm_ioremap_resource(struct device *dev, struct resource *res);
>  int devm_add_action(struct device *dev, void (*action)(void *), void *data);
>  void devm_remove_action(struct device *dev, void (*action)(void *), void *data);
>  
> +static inline int devm_add_action_or_reset(struct device *dev,
> +					   void (*action)(void *), void *data)
> +{
> +	int ret;
> +
> +	ret = devm_add_action(dev, action, data);
> +	if (ret)
> +		action(data);
> +
> +	return ret;
> +}
> +
>  struct device_dma_parameters {
>  	/*
>  	 * a low level driver may set these to teach IOMMU code about

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
