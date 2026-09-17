Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB44F302146;
	Thu, 17 Sep 2026 05:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789621429; cv=none; b=azTfsLeJNorRr+6tr52BHskfleRXbAP/nDrm8M266oaVru5raDT0j4o+juGq+3kXZOa6oqkgU75ByWULXzaeZsitrp+Iow5G7TB2poWZkbqSQPMKwgjU9aCx1ODSgbKBKSNqZmf09xHeUpXjZt1SVtrrKjYCff9AcbSLOklbe70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789621429; c=relaxed/simple;
	bh=yNJsmQjHChqWKOGA+siCTSg8XNXkQEBNtIONunRNfns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KCeWEevSFp89tv8SIs41CEQLwRec1fOnDq4ZzPCueyFUoJ6fZgj/x4YaU4lFGU/PjG5W/RiTaghJXfvgFSMgca7/d6PzAICijGtkbvueewZCexSABVSVRE8Zg4z/eg8BWRhDMe8Jj1N0NZiQPiHU/9Sd3IOIROqV4fuUBiHlxlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S3MxpICF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S3MxpICF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 547731F000FF;
	Thu, 17 Sep 2026 05:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789621422;
	bh=lBig9i/ayJ1h6VvtcFLZfRuPKLDOV9hUaNacr0L+UrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S3MxpICFljcJbCYnAydDlp3dSxXg395h3CyI0/LaSxoGROok0gVtnPn3sLaY83w+s
	 sK9xgEJzB63dnhMRhCvLxqgBOlcj0ryKfjcW/KxL5kzKfKeEQSz+jYL7Xc4MK5Ocfu
	 fIOGuPsZUZz70ZxFiEcKvhpfMF9lNyruyN9+JVezxIKokeolvQbKdwE4PcgphuWQiH
	 PqQC3vO1AWcv0lVtDeXRQsuY6ePawU/C0u+D37zToBiKoNGrNWFs5F9PGGFvzOYFd5
	 YF16NOX+KKPuXH9zlZaxuslhJ3TVJ1ZMZmlqSGG+LqUX18HmJ4y+dCgLsmfBhPxsDF
	 5sApy1nGS1Ixw==
Date: Thu, 17 Sep 2026 07:03:20 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Bryan O'Donoghue <bod@kernel.org>, 
	Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Felipe Balbi <balbi@ti.com>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-phy@lists.infradead.org, 
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v17 2/5] phy: core: Add phy_get_by_of_node()
Message-ID: <rn7ednekhhqbvmqwg3ut5sdp7t4q3lwqfjzjsio272x53fodch@xavtzo6cwblm>
References: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-0-e2197a3e2551@linaro.org>
 <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-2-e2197a3e2551@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-2-e2197a3e2551@linaro.org>

On Sun, Sep 06, 2026 at 03:17:06PM +0100, Bryan O'Donoghue wrote:
> Add new function phy_get_by_of_node() allowing lookup of a phy by
> device_node. Separates existing logic in _of_phy_get() into an internal
> helper method _of_phy_get_with_args() to allow for reuse in new method.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/phy/phy-core.c  | 95 +++++++++++++++++++++++++++++++++++++------------
>  include/linux/phy/phy.h |  6 ++++
>  2 files changed, 78 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index 89addd732bff3..490a7cde6d40a 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -606,22 +606,51 @@ int phy_validate(struct phy *phy, enum phy_mode mode, int submode,
>  }
>  EXPORT_SYMBOL_GPL(phy_validate);
>  
> +/**
> + * _of_phy_get_with_args() - lookup and obtain a reference to a phy by of_phandle_args
> + * @args: of_phandle_args to the phy
> + *
> + * Returns the phy from the provider's of_xlate, -ENODEV if disabled,

Nit: Kernel-doc expects ':' after 'Returns'.

> + * -EPROBE_DEFER if the provider is not yet registered.
> + */
> +static struct phy *_of_phy_get_with_args(struct of_phandle_args *args)
> +{
> +	struct phy *phy;
> +	struct phy_provider *phy_provider;
> +
> +	lockdep_assert_held(&phy_provider_mutex);
> +
> +	phy_provider = of_phy_provider_lookup(args->np);
> +	if (IS_ERR(phy_provider) || !try_module_get(phy_provider->owner))
> +		return ERR_PTR(-EPROBE_DEFER);
> +
> +	if (!of_device_is_available(args->np)) {
> +		dev_warn(phy_provider->dev, "Requested PHY is disabled\n");
> +		phy = ERR_PTR(-ENODEV);
> +		goto out_put_module;
> +	}
> +
> +	phy = phy_provider->of_xlate(phy_provider->dev, args);
> +
> +out_put_module:
> +	module_put(phy_provider->owner);
> +
> +	return phy;
> +}
> +
>  /**
>   * _of_phy_get() - lookup and obtain a reference to a phy by phandle
>   * @np: device_node for which to get the phy
>   * @index: the index of the phy
>   *
> - * Returns the phy associated with the given phandle value,
> - * after getting a refcount to it or -ENODEV if there is no such phy or
> - * -EPROBE_DEFER if there is a phandle to the phy, but the device is
> - * not yet loaded. This function uses of_xlate call back function provided
> - * while registering the phy_provider to find the phy instance.
> + * Returns the phy associated with the given phandle value after getting
> + * a refcount to it; -ENODEV if there is no such phy or the phy is
> + * disabled; -EPROBE_DEFER if the phy provider is not yet available.
>   */
>  static struct phy *_of_phy_get(struct device_node *np, int index)
>  {
>  	int ret;
> -	struct phy_provider *phy_provider;
> -	struct phy *phy = NULL;
> +	struct phy *phy;
>  	struct of_phandle_args args;
>  
>  	lockdep_assert_held(&phy_provider_mutex);
> @@ -637,22 +666,7 @@ static struct phy *_of_phy_get(struct device_node *np, int index)
>  		goto out_put_node;
>  	}
>  
> -	phy_provider = of_phy_provider_lookup(args.np);
> -	if (IS_ERR(phy_provider) || !try_module_get(phy_provider->owner)) {
> -		phy = ERR_PTR(-EPROBE_DEFER);
> -		goto out_put_node;
> -	}
> -
> -	if (!of_device_is_available(args.np)) {
> -		dev_warn(phy_provider->dev, "Requested PHY is disabled\n");
> -		phy = ERR_PTR(-ENODEV);
> -		goto out_put_module;
> -	}
> -
> -	phy = phy_provider->of_xlate(phy_provider->dev, &args);
> -
> -out_put_module:
> -	module_put(phy_provider->owner);
> +	phy = _of_phy_get_with_args(&args);
>  
>  out_put_node:
>  	of_node_put(args.np);
> @@ -1001,6 +1015,41 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
>  }
>  EXPORT_SYMBOL_GPL(devm_of_phy_get_by_index);
>  
> +/**
> + * phy_get_by_of_node() - lookup and obtain a reference to a phy by device_node
> + * @np: node containing the phy
> + *
> + * Returns the phy associated with the device node or ERR_PTR.

Same comment.

> + */
> +struct phy *phy_get_by_of_node(struct device_node *np)
> +{
> +	struct of_phandle_args args = { .np = np, .args_count = 0 };
> +	struct phy *phy;
> +
> +	if (!np)
> +		return ERR_PTR(-EINVAL);

Is this check really needed? None of the other phy_get*() functions have this
check.

> +
> +	mutex_lock(&phy_provider_mutex);
> +
> +	phy = _of_phy_get_with_args(&args);
> +

Nit: Drop the newline.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
