Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E074F4D1B
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 14:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789740642; cv=none; b=kLR0nClTCc7R+bectBd4HVwo//a8dhnoP9xYQnEpTM/qocjRjQtkOGBEOT5RVYOWfK8W64DOguRbbmFUsA0DoUWjHemDiBfAk5qoMOpPcxgV5HfTSdAMzO+aCOQVpYx5HvyfsXLdedvHp214iCmnthr9opbDl7fpChGFP8ficek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789740642; c=relaxed/simple;
	bh=QhI6LeFxTm/qovlqSwdUWnrMKxHe3UnMO0Nc81h2kn0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Bw7fLHZNRvKokuWk45G1N+oqQQym9VVwHxjBQpCIXVtEvEYUOH/qxBJ8zrYgOklimKIR2OBBdeHO8N/5TsZVAD0v0HWbut2hDBIExoS9bVm/TO7rWLCq1y0OCiJ6C+h63WZdRsi18HqZNRXPasfwtbT3p7N3Z1cgGQeqO9VhDlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pZ87H3Zd; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pZ87H3Zd"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f633cd78so448941f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 07:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789740638; x=1790345438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ag22kdu60S2tiS+0TDNZ2UzgJJwu6JX3v9tYF3dxCv8=;
        b=pZ87H3ZdPgw7UYe+qXZu87isLGTgA75IHR4JFc2BxZ/O91Hn0IRBbxJ+75uIHy0oom
         WiwHE+XwakLudO478ayvrbcH4E8lo1B/CMsxwX4auwlnj088/GFs01HzdRqT1d87JkFo
         kfaq1H7WD/QcbkDCX4vBf0uVOY1xxrYJXqbYclX7b14FjBMqyOB0T2bBdhaanDOdwOyh
         mhOVQ+lgyEFw2Ny+KUDk9RSqakXxqDRH9hKFM1+CntMefv2/3YvkeuObmvNDZNmTbGmU
         6GM8Veyk7jN6qOe7RtkBHeCKnU5t2yvXRNhmX/zBvqAkL+FViY8GNWQLtYDac3qx3NOE
         Ro7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789740638; x=1790345438;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ag22kdu60S2tiS+0TDNZ2UzgJJwu6JX3v9tYF3dxCv8=;
        b=gsHDFzY7uhkTZ1S7Pi6kUKfNPYIUswCBc+zuq8RIl7V28xeqge9ayk7m54LjBp3JRM
         BSBP/8gK/9iZekw5LXKMvIzMmwJjJTu6+Mcstkp0hhxLwrI2jY5BDMGjakMIJberfy5+
         v+ZEZLX8uVBDJg0eqad9otXkA7nTTvk9BsXEvVlsNuWVBFxjXS2+//hTfBPwZfs8E7eU
         k4TMMAIhR4up7NTX+Di3fbgw1No3ecRbAaOW2/1jRMAD7Y0JP//rJ5I66s5LvPXTWRyF
         5+x5HRinnCqbRtHinSSLo9AqH7aIUjtFrvXG9135Rv3jVZLFLqB/ltBbdBpA6uubslB8
         4ZJg==
X-Forwarded-Encrypted: i=1; AKwUvBwqnmDP1psxnziy7LV1vwaAdYVChtzkARSrpJ94kGAOIdrzuiBqk5T7i74IUHgWi7M2L8CgKlS3n/0=@vger.kernel.org
X-Gm-Message-State: AFuF++mb70bcUooQ6VnagOBYo4BpXRxEba5CoHAgthnJHgU3qv86+385
	lqmRMbSGsrw0EkLrrKopOXFjZe0qD9b39+LNQEpq1zJ2L6ncoEHbrzPih5ZXwlmtgEk=
X-Gm-Gg: AYBFou3a9vYl5q7bTDyZKnCp1S1Q5MepFFwuK1HT8nrhfv1k0xFxAnYGeylwsTACRYw
	djK3si1tkdlzF8SE2rk5N57Qirgb0KhgaIGElHFsfi0mJLQnlPLOC7ZMFRnTp46kvxcjEWm/SVJ
	zIdAeyQrNZtNd66Hjkxbr8P2x8yHY8oDZ+eE5ZqD5cDpd+XO0ocrGI5XJvBRBbZJ3akSO5ZdejM
	IASTcSXfD1jwLZWWN8BbRcHrha7yp0dh99fUCoZUN6CeR8dPivRkfm0cwbij6ZhgG+ewWtCfPJt
	3brMWftjv7e9l5aelKRsZMX9ndoU3vkZSu4OIulFxMBbnL3UwidOV78rxvZuDM/js5lvN/Neyax
	j6vgZ7Ul7sqaePcfG2+yroT7MDRIND3Cb4aPkQubqL1omAowAT8c3FgcRtjTseVnpe1wYe0Bsso
	27dDiW17MdN99vfnDn61dik/gMzzxo15BCV+cRO0C27HfxPKpGpexwzKdjjSRgTHBvMP57osvpm
	w9Wzj5A80aimcPb92XKTgigXszkfjRpBX44MLop2eYDmyxrZnQjcw==
X-Received: by 2002:a05:6000:2c06:b0:486:f767:8be0 with SMTP id ffacd0b85a97d-4871e216279mr3726790f8f.12.1789740637955;
        Fri, 18 Sep 2026 07:10:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:c55f:cb91:1ca5:54dc? ([2a01:e0a:106d:1080:c55f:cb91:1ca5:54dc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872008118dsm5045419f8f.30.2026.09.18.07.10.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 07:10:37 -0700 (PDT)
Message-ID: <cc4074ff-8d49-4452-89e9-870e5514d969@linaro.org>
Date: Fri, 18 Sep 2026 16:10:36 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v20 3/6] phy: core: Add devm_phy_get_by_of_node()
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
 Krzysztof Kozlowski <krzk@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
References: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-0-dc244e124e71@linaro.org>
 <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-3-dc244e124e71@linaro.org>
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
In-Reply-To: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-3-dc244e124e71@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/26 15:56, Bryan O'Donoghue wrote:
> Add a devm variant of phy_get_by_of_node() to allow for the familiar
> pattern of having devres automatically release resources on the driver's
> exit path.
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   drivers/phy/phy-core.c  | 34 ++++++++++++++++++++++++++++++++++
>   include/linux/phy/phy.h |  7 +++++++
>   2 files changed, 41 insertions(+)
> 
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index 42c27a2b45159..f0d2b50d1c76b 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -1048,6 +1048,40 @@ struct phy *phy_get_by_of_node(struct device_node *np)
>   }
>   EXPORT_SYMBOL_GPL(phy_get_by_of_node);
>   
> +/**
> + * devm_phy_get_by_of_node() - devm managed lookup and obtain phy reference by device node
> + * @dev: device requesting the PHY
> + * @np: device_node of the PHY provider
> + *
> + * Returns: phy associated with the device_node or ERR_PTR. devres manages
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
> +
> +	return phy;
> +}
> +EXPORT_SYMBOL_GPL(devm_phy_get_by_of_node);
> +
>   /**
>    * phy_create() - create a new phy
>    * @dev: device that is creating the new phy
> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> index 71c2e16397130..14b924a88411f 100644
> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -285,6 +285,7 @@ struct phy *devm_of_phy_optional_get(struct device *dev, struct device_node *np,
>   struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
>   				     int index);
>   struct phy *phy_get_by_of_node(struct device_node *np);
> +struct phy *devm_phy_get_by_of_node(struct device *dev, struct device_node *np);
>   void of_phy_put(struct phy *phy);
>   void phy_put(struct device *dev, struct phy *phy);
>   void devm_phy_put(struct device *dev, struct phy *phy);
> @@ -499,6 +500,12 @@ static inline struct phy *phy_get_by_of_node(struct device_node *np)
>   	return ERR_PTR(-ENOSYS);
>   }
>   
> +static inline struct phy *devm_phy_get_by_of_node(struct device *dev,
> +						  struct device_node *np)
> +{
> +	return ERR_PTR(-ENOSYS);
> +}
> +
>   static inline void of_phy_put(struct phy *phy)
>   {
>   }
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
