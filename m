Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C7F40DFBC;
	Sat, 28 Mar 2026 11:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774697651; cv=none; b=leCM4cZtgyMwe/UIO92Gbc1nA7QHoF/MRInQ2FhRxG5uR7fqGGxelj85mS6udP9f6g6l4CxdLc6YuDD9czIKlvR0s9D3MHXKKzNbRZPypEIoHTTT/sjLS7WoDfulYfiN1cbZmNvCxJ/uP7HteayKyL8WESDQti885UwYav/dhRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774697651; c=relaxed/simple;
	bh=4RtiieTGCXul9AmLpWHwSKuiiCPuVcKqkh6ApT6tyLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZwzPh0Km5Nr8JP2HDD/XmQu/XP50aV1hayOxoN4pJ1Cp+MG+2v9XpvAQasLmzXi9DY+aQ/ucmUPQ8i7lwJ8K30ZkX1vQ+UwUG630+wJqjZNUPhZvRIXmJuJe4giA2LoqGke41YWzYFrZt63EA3WTvS5/f3mZXkGS3yKqfwLpqFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TkRotSTq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TkRotSTq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DA2FC4CEF7;
	Sat, 28 Mar 2026 11:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774697650;
	bh=4RtiieTGCXul9AmLpWHwSKuiiCPuVcKqkh6ApT6tyLM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TkRotSTq0UbYReiE4zwnWp8r3oBgfBJhHfAGg/bdy9wMT8W/jxx7n21I9CObYsj/Q
	 s5zyMRI0r0/aisSKk9yXX7T2DhGV+DOQUY1kRGw77tnCz4zCWt8RSQHvhZyd6qyo1a
	 tKqVfAwqf3aRJefI0nf6g3FRv8KyoaN0nILo0rj7sAK0Io4+KahVsJCyoBKFHfKefp
	 hLbGucgOGaNkNp79DNEm8z8M4h6ZR96jlzv+lj4CUJQKTerz1xjFa/EAcH9rHe7592
	 PRzm46/qPLAFfkFfdeMb5R9Q9Sl3JIX0dgX676FLzN+9IALH9SDSeC9F//ijSE6J6d
	 QOqVAq0PMvgbw==
Message-ID: <1c7946f6-4160-4427-9fb6-4d270f7e8fa8@kernel.org>
Date: Sat, 28 Mar 2026 11:34:06 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gdsc: Fix error path on registration of
 multiple pm subdomains
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20260328012619.832770-1-vladimir.zapolskiy@linaro.org>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20260328012619.832770-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/03/2026 01:26, Vladimir Zapolskiy wrote:
> Some pm subdomains may be left in added to a parent domain state, if
> gdsc_add_subdomain_list() function fails in the middle and bails from
> a GDSC power domain controller registration out.
> 
> Fixes: b489235b4dc0 ("clk: qcom: Support attaching GDSCs to multiple parents")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   drivers/clk/qcom/gdsc.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index 7deabf8400cf..95aa07120245 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -518,10 +518,20 @@ static int gdsc_add_subdomain_list(struct dev_pm_domain_list *pd_list,
>   
>   		ret = pm_genpd_add_subdomain(genpd, subdomain);
>   		if (ret)
> -			return ret;
> +			goto remove_added_subdomains;
>   	}
>   
>   	return 0;
> +
> +remove_added_subdomains:
> +	for (i--; i >= 0; i--) {
> +		struct device *dev = pd_list->pd_devs[i];
> +		struct generic_pm_domain *genpd = pd_to_genpd(dev->pm_domain);
> +
> +		pm_genpd_remove_subdomain(genpd, subdomain);
> +	}
> +
> +	return ret;
>   }
>   
>   static void gdsc_remove_subdomain_list(struct dev_pm_domain_list *pd_list,

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
