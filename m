Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC26215F5A
	for <linux-clk@vger.kernel.org>; Thu, 12 Dec 2024 15:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734016231; cv=none; b=d80fWk5fs271IFiI3s8iji0U22iv3QosL/X4RbIEkTwc3X1PLvpaKBVK6R7QBFYkThZ5P+jCQXQ3zX56h/RX/59J/cI2+lHqBAZhscNt2dJQ11q3QyeT6QQCWc6jcM8+QcuxHr6dzWX0lLakmJ8gVufKi96otmIPJNZ86WWPxjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734016231; c=relaxed/simple;
	bh=PVMqYhRnm+wlo36tmUvToJZQuhqtTu5OAs/h41zHOy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZR2tYXW0KSNzkH42jDpmMTqIA0ReGgHhp7SS6/jvKypD2MkQjx+7G5mBsevtPdeBxSt5dYva/eylWBgCrswux0w/VNV59OS/cUVS+qggK2rlNZgtbD0nREaAORTdb/CpzKb+6kUHDXys34YLRZ+DeFkPY/qOOz0IRfnbRoR7Fbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ibgVMhkL; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ibgVMhkL"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54019dfd6f1so100448e87.0
        for <linux-clk@vger.kernel.org>; Thu, 12 Dec 2024 07:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734016228; x=1734621028; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J4SFfVxcg8kxQKbemWXTRZwVNSWaAt8ZevWakc+qwDM=;
        b=ibgVMhkL6Otf7ODVkhwzJ/CLnP9eR+Zuu68Kkh7XIkOviVjLNPvmq6ExbrhFjbue5K
         zM1lrUw5Efyy0FgRDy0enc6nSPkfreLXck+Uf4Sg8QUtYP85u2aOjyPz5X6MJ+/9UV7i
         CYTkw0j6Coru8o/Q/ND3wCef6rF/OcvxITDD5S2dtNgXSCr77ELzFrnpqNIQJGNImggm
         lWLUfIRBFeddbvSocnd1e8UruTc72PJDxN90b2fNT7PrwBKXoWPrvFkCT7XxLo3lOnmY
         mLZAHi8wBLLC681gdWFGzISH+pTK9xIvhWy6tvETPCou4yS8GS2oafDR87+Q4HaeSAuk
         QH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734016228; x=1734621028;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J4SFfVxcg8kxQKbemWXTRZwVNSWaAt8ZevWakc+qwDM=;
        b=CV3JdTMksXSbqHgKAb4G4k41BM2A+RWA78CGQ5Q7tKVxum2y3tnqCxHxehLUuTe2l2
         b7CMTTpKcQxhFDG8wmdR4JW/3hcGKuKCRi/Rd8caOiAwm21NQl36JcGj60Vir8oleTeu
         UrSrXtjSL+Zai2nEtSki/vIi5vQ9eYjrc8R0pMXKE4dKncGXSlsNzAlN3wkuYRUbN+Pr
         UtHZzpr7r7W5jLxrI1Jtk4Aoa7aLFVsOHxYJQFq/3mX4HV5sBGFh82IKGU1z05/4IA+W
         0qoMMPGq6nA7feXjfx55/GH7eRTTDRGvTY6Lc+zj0llhE2KN7MAwzLOeOidAzrrZG/ze
         EZZA==
X-Forwarded-Encrypted: i=1; AJvYcCU8l9/nm6FWMjFv7cu+XRkdfNJ06s7YFY/lr3ubtE3JDfBhA26qcSwLUjbbcoh7BM20km8PunZS6VA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiEan8p1z8j/ko3hAG01buSCkLEb4RX3DAwA8YB9CrW9545Sgj
	iAad2r2LeerA2ZDN8ZajOudWMQsNHq5CNAnuj3BFozcZDzXIwwOqcxxhKk0ZkUM=
X-Gm-Gg: ASbGncsAPaVSfYG+oWfUey5lQDTqrdVoc3Xwd+Nzf6nKJcZz4BbUOZA/zTr8lafLH6p
	qiK68oP2WhFdF2+aJy2zi808ET1VRGIOGBzGAOtKdgBCvJDik+hhC2lE6yRVwCz/eaIPWBHy3N6
	M6Fno34ALFzbJ/8EGV+x8QUNTUy5jBgrj0TJjt/nekIdZRhMs8r8NooX5BAKPo0xyOPBmTsS2u0
	uv21DCbVjvo/2xsHheZLRb200Q9qg2/4KUbk4iKNfsYzKnAtxhlBh8GtRifSk2QGad44jHSD9a5
	3Cv0YjO6VMbVUYqBQUR59YA65gkJzuYjLt4=
X-Google-Smtp-Source: AGHT+IGoT95idUMEO9RITO/ZyilZmUskXfV3dbvT0qvNs7YP/Wmf43CG98sgGDEwsXtCh7HB0MnesQ==
X-Received: by 2002:a05:6512:3a96:b0:540:1d6c:f1b1 with SMTP id 2adb3069b0e04-54034101c2emr104792e87.2.1734016227943;
        Thu, 12 Dec 2024 07:10:27 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e34a49561sm2002136e87.83.2024.12.12.07.10.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 07:10:26 -0800 (PST)
Message-ID: <09dd1971-74f5-45df-9ecc-e5c2253f416f@linaro.org>
Date: Thu, 12 Dec 2024 17:10:24 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] clk: qcom: gdsc: Capture pm_genpd_add_subdomain
 result code
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v8-0-5d93cef910a4@linaro.org>
 <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v8-1-5d93cef910a4@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v8-1-5d93cef910a4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/24 18:54, Bryan O'Donoghue wrote:
> Adding a new clause to this if/else I noticed the existing usage of
> pm_genpd_add_subdomain() wasn't capturing and returning the result code.
> 
> pm_genpd_add_subdomain() returns an int and can fail. Capture that result
> code and throw it up the call stack if something goes wrong.
> 
> Fixes: 1b771839de05 ("clk: qcom: gdsc: enable optional power domain support")
> Cc: stable@vger.kernel.org
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   drivers/clk/qcom/gdsc.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index fa5fe4c2a2ee7786c2e8858f3e41301f639e5d59..4fc6f957d0b846cc90e50ef243f23a7a27e66899 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -555,9 +555,11 @@ int gdsc_register(struct gdsc_desc *desc,
>   		if (!scs[i])
>   			continue;
>   		if (scs[i]->parent)
> -			pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->pd);
> +			ret = pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->pd);
>   		else if (!IS_ERR_OR_NULL(dev->pm_domain))
> -			pm_genpd_add_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
> +			ret = pm_genpd_add_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
> +		if (ret)
> +			return ret;

This is wrong, on the error path you shall rollback the registered subdomains
in the reverse order.

>   	}
>   
>   	return of_genpd_add_provider_onecell(dev->of_node, data);
> 

--
Best wishes,
Vladimir
