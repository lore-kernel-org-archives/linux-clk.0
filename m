Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F31F4E1C6F
	for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 12:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789648216; cv=none; b=I4JoZ64ry98whdoedWUTheIB3ovBI05p1kPeDi0kSm1W+IDw5hFkbgb0mMl2Q8qEGZ/aKu6AviruAV2aPSBcHJUEfkofmzvafH2QHg2KfGeH3BTpx+A8o+jEpgIfTsW/NXTiUhFKx6d16WIvndMnhtoRA/q6Ss0R67/W7R0HPSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789648216; c=relaxed/simple;
	bh=ji4HV5+85PYDxa0NnikFdI1KrRDAyRzLIScLGUCk55s=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=icOtqvFYOhNdDqgWS3oanTG5w3vP5Pu9vFj/O7qDedC0eKwB84ziXm9tcub04NO+PycmWyosjC8hEaVAq2MVdaGu4vYhusEuuea476wDREBL5QvRJzyxW079Xqiv15bizqBideKJqrUNhwnAD9P2kTx31xbBeQcvqOBu6FpCVlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pgo6/wH4; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pgo6/wH4"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso5843765e9.2
        for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 05:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789648192; x=1790252992; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gC/Ov+71qXFh+qBimBh+DCQrBkKyOWQ85VQeOxH4dWo=;
        b=pgo6/wH4p8Iy4hDBrBsNwC7Wf5dbv2rQwowqz9+adyxsd91AJF01kQKeWyKuHw+gs9
         MfJzhOD9eEZ2HTeLqhi1Z0eoXKujJfXYrUfYhnetWkAodO9GoPUXt7250eWwQ9dSHQQ9
         S+EoReNf8qYkPUsyM0XfUF7H1sOCqE/Omfh/J3ENYTSVByEYubMaz+qIDpciQGa74mcc
         eSDu15hcNNgV6S9viZ6prvUyouYuAL7iUOuMGgh7xkoyPb8Et7MPr4Dr37ocNvTW/WRq
         St/k1egfoMDrvNSwuE8aWahukXOoVVjBtvrYh5SFCgnk+bwA871SsNgLGXjcR2f5X4yB
         +Njw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789648192; x=1790252992;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gC/Ov+71qXFh+qBimBh+DCQrBkKyOWQ85VQeOxH4dWo=;
        b=sg7RpReXd0/Dj0Jj4RN8MgxjO0QyAkSfoSFcz0UvnRPmmLh4pDohjTAfFmD+MiyxL5
         LKgaiyvltvd4b30FJvWShMUEpyf2tRY+/aE3lOIHGcg6R8ZcKcdw4zAqdob5qQ4hzMDO
         8geTZZdh8hMeZZvIFOoQ+nvRGM6hjUgZeML1tL2LHb0RDrYwpXqvWx93T4l30wN8XpUJ
         aUVgiTV8jBg0Qy7vv7t91bYWJG0BDWf/6AR6bjhnbO+sAjtiKOLAGPPkGgmPbwdQEEZs
         DnfLU/upJx8zajEW0yE0iu8c1w6L0qm/8qmeRzIwQAO/p/iUiYTqbBmO8G1X2IeIfrBG
         ogHg==
X-Forwarded-Encrypted: i=1; AKwUvBwBmy4MfU6JAvnhXS1e851GaKBjRFkZ42sgnFsXeougVijLi2v0PWks72VigmB7HDKct0DJq1b/sto=@vger.kernel.org
X-Gm-Message-State: AFuF++kImTEOG2YBdpT5DcMiUHsnap495tchUL202KYNRmtforw2Mx+3
	7w/5TTQh8/5ORSocbkI7ALWaU223XCYrCxoqNmLSDRwcCuvzRUkiytUkHGvGp/hhiuE=
X-Gm-Gg: AYBFou09nvhSzplJIiWSPJ3JwXcFZW2W3Espl8WXewsd46iojfdVbdX0JRr6AG9QASI
	3u6Ha560I/m1gwuSr8uaVh8JVSmlz9yPX+MOqQOBf/y/08o2ypuzHd9E8Wi9AHt989pxubwZYFN
	IUPUDb/DGYuPQk6KshR8bBWWqLPA/NmDdv+SybnfrlkS6n1d8+zA7ojemOUO8zBx+4cPuWkR0ak
	2MrbLJMZnHdFA89xxeUbbHT+Y25h7fQL9cmavtuY1JdjbkQWu2pc4VXp1K5dIrzaICA0LMp+drT
	UgCn7byeB2tp8PMndwHnQb+CHRqd926CGfzk9vGLm5q1S4969MkZVox2K7DzlHOaOVDTXNkBko7
	YJ2jXaHXCagqacm24fpePN4usMoz4hx8CFAo2Ptcvf6RPjm9RQqFlvhRWQHesLdertcV8B98RKe
	N8umIA9P9hQou53CNTGyQZqsIHR6d6dAFaUXU+pPR78ZUsXj/UuZvMbwHHZ8udn26M4tJDnqrPG
	0hmOEYmEJii0EuZmA2WF9jsmgGwtu5YCq6cYjR03HD2YfRdhpgEDA==
X-Received: by 2002:a05:600c:19c6:b0:49e:645e:2616 with SMTP id 5b1f17b1804b1-49eac463955mr74481465e9.5.1789648191941;
        Thu, 17 Sep 2026 05:29:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:b5f0:971e:8fd2:f1c9? ([2a01:e0a:106d:1080:b5f0:971e:8fd2:f1c9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd2563ccsm89340375e9.13.2026.09.17.05.29.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 05:29:51 -0700 (PDT)
Message-ID: <a06040ea-4af1-4083-9b69-7f62be7c9bce@linaro.org>
Date: Thu, 17 Sep 2026 14:29:50 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v18 2/5] phy: core: Add phy_get_by_of_node()
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Felipe Balbi <balbi@ti.com>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-0-f85c9103177e@linaro.org>
 <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-2-f85c9103177e@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-2-f85c9103177e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/17/26 13:07, Bryan O'Donoghue wrote:
> Add new function phy_get_by_of_node() allowing lookup of a phy by
> device_node. Separates existing logic in _of_phy_get() into an internal
> helper method _of_phy_get_with_args() to allow for reuse in new method.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   drivers/phy/phy-core.c  | 95 +++++++++++++++++++++++++++++++++++++------------
>   include/linux/phy/phy.h |  6 ++++
>   2 files changed, 78 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index 89addd732bff3..490a7cde6d40a 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -606,22 +606,51 @@ int phy_validate(struct phy *phy, enum phy_mode mode, int submode,
>   }
>   EXPORT_SYMBOL_GPL(phy_validate);
>   
> +/**
> + * _of_phy_get_with_args() - lookup and obtain a reference to a phy by of_phandle_args
> + * @args: of_phandle_args to the phy
> + *
> + * Returns the phy from the provider's of_xlate, -ENODEV if disabled,
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
>   /**
>    * _of_phy_get() - lookup and obtain a reference to a phy by phandle
>    * @np: device_node for which to get the phy
>    * @index: the index of the phy
>    *
> - * Returns the phy associated with the given phandle value,
> - * after getting a refcount to it or -ENODEV if there is no such phy or
> - * -EPROBE_DEFER if there is a phandle to the phy, but the device is
> - * not yet loaded. This function uses of_xlate call back function provided
> - * while registering the phy_provider to find the phy instance.
> + * Returns the phy associated with the given phandle value after getting
> + * a refcount to it; -ENODEV if there is no such phy or the phy is
> + * disabled; -EPROBE_DEFER if the phy provider is not yet available.
>    */

Why changing the comment here ? You're not supposed to changes the _of_phy_get() behaviour.

>   static struct phy *_of_phy_get(struct device_node *np, int index)
>   {
>   	int ret;
> -	struct phy_provider *phy_provider;
> -	struct phy *phy = NULL;
> +	struct phy *phy;
>   	struct of_phandle_args args;
>   
>   	lockdep_assert_held(&phy_provider_mutex);
> @@ -637,22 +666,7 @@ static struct phy *_of_phy_get(struct device_node *np, int index)
>   		goto out_put_node;
>   	}
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
>   out_put_node:
>   	of_node_put(args.np);
> @@ -1001,6 +1015,41 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
>   }
>   EXPORT_SYMBOL_GPL(devm_of_phy_get_by_index);
>   
> +/**
> + * phy_get_by_of_node() - lookup and obtain a reference to a phy by device_node
> + * @np: node containing the phy
> + *
> + * Returns the phy associated with the device node or ERR_PTR.
> + */
> +struct phy *phy_get_by_of_node(struct device_node *np)
> +{
> +	struct of_phandle_args args = { .np = np, .args_count = 0 };
> +	struct phy *phy;
> +
> +	if (!np)
> +		return ERR_PTR(-EINVAL);
> +
> +	mutex_lock(&phy_provider_mutex);
> +
> +	phy = _of_phy_get_with_args(&args);
> +
> +	if (IS_ERR(phy))
> +		goto out_unlock;
> +
> +	if (!try_module_get(phy->ops->owner)) {
> +		phy = ERR_PTR(-EPROBE_DEFER);
> +		goto out_unlock;
> +	}
> +
> +	get_device(&phy->dev);
> +
> +out_unlock:
> +	mutex_unlock(&phy_provider_mutex);
> +
> +	return phy;
> +}
> +EXPORT_SYMBOL_GPL(phy_get_by_of_node);
> +
>   /**
>    * phy_create() - create a new phy
>    * @dev: device that is creating the new phy
> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> index ea47975e288ae..71c2e16397130 100644
> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -284,6 +284,7 @@ struct phy *devm_of_phy_optional_get(struct device *dev, struct device_node *np,
>   				     const char *con_id);
>   struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
>   				     int index);
> +struct phy *phy_get_by_of_node(struct device_node *np);
>   void of_phy_put(struct phy *phy);
>   void phy_put(struct device *dev, struct phy *phy);
>   void devm_phy_put(struct device *dev, struct phy *phy);
> @@ -493,6 +494,11 @@ static inline struct phy *devm_of_phy_get_by_index(struct device *dev,
>   	return ERR_PTR(-ENOSYS);
>   }
>   
> +static inline struct phy *phy_get_by_of_node(struct device_node *np)
> +{
> +	return ERR_PTR(-ENOSYS);
> +}
> +
>   static inline void of_phy_put(struct phy *phy)
>   {
>   }
> 

Apart that, looks good:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
