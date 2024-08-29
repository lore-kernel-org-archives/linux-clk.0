Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B013F22EF2
	for <linux-clk@vger.kernel.org>; Thu, 29 Aug 2024 09:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724922146; cv=none; b=V0vN3/vkHDTkti765NiJXySZxeSPlp5yVHCPgq9630OZWeBxQZ66PwHTTop5f9Q7WdBaXYgfTp4Wu5KUnuBuyAxDEUzan+attdWxo9qhRP97XWe68lCZBUwQw1ZEEkSau511c4bh+Dsd+MDdAngPw3cL4wO8W2hSz1jir6uSS2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724922146; c=relaxed/simple;
	bh=SJWHpbSUdECm28dnl4r/RzgBRh4JcSct6K0jvQuIYy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jVANXJe9JhdaIrbxjdn0S4v0bytWA5B0u+cmlBbaUCr+Vi+NEKXemiPfF78hNmtad5Lb86A0ffsjU/Q2txy9yKaoC3YOB6IrhoKfmKGqnKSApVISQnK4g1dhdMkHg2qlDvmBFIgn4eqvjw8trHygvVSfGyxyEai1/+hX52wSr44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IO9zLGNq; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IO9zLGNq"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5343d2af735so406931e87.1
        for <linux-clk@vger.kernel.org>; Thu, 29 Aug 2024 02:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724922143; x=1725526943; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5P5Ex+N4LZb6zHIhcHrVj3uRGPH7YOgGJO2m8XKmhGg=;
        b=IO9zLGNq6CFij6ASdq9vmHo7Pzx/CeeytKVj3y0V0WP2NTsGRv2SmNX5aSKlzz8ram
         R2f5fmP25DBJWnXcGjaUHQwDMlrhGkd//w3QsRchozam2XmJ3mQEiJYWBy2vS1AVLG23
         w3TQlBycqDY1T5dJsAsbLXLHKhBENRCiTf+idN7wZa54LajF3zOTG59oubS3CbyoH+Vj
         EtOezoPhJra/4lZ6G5ml/6BQGodX8+xgmpk+4kBxXqHhaGxex9fc8OqFBF0x4zF2fxiZ
         fhL+6NBciYNZvjjUGjS08bNz+MrHHAYrlj47DW0+UoCobssVQjuyHwP3a0yjkOdsJD2q
         mOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724922143; x=1725526943;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5P5Ex+N4LZb6zHIhcHrVj3uRGPH7YOgGJO2m8XKmhGg=;
        b=MaWesjA4w7mbZqfP8YignA0ZliJyhdjOYFbrTOdsU34662qJU02dh7UvjNocSYTksQ
         9mcahw0eK3EnQVH4C80DuDaGvT+lWmes9vCR6HfUEJYZ8zUodlTmn/SuHRd+cqZPO3ja
         /ihYzvf5PSfP44SG/PQFDAtawXN2mdPngdOfSG0yDNzX3Rx91jO2wqmnAI8+0b/k2Xel
         HBNqFiV9gHa9zQKZND09pQWozJDwmf+nYeWh42jBXx85OUodY0y0ols76AVaKAEHMzlE
         ZtQqQSRz4iV//iKb4Mg4891S+PYIwhiiLdKySqPlpjy8LTyQI5uIBd47G0RJLMUQRKKY
         9RgA==
X-Forwarded-Encrypted: i=1; AJvYcCUJZsJyR4u+12gDc/wxRvkOjcT5GYo4rvD8qzBYQ9u6HD058zRRgsVWyj5WhzYDl0NCcfwwJgIUT14=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6bqhOPZmIi89gkbdg+2Joi13KYIaGD8L6/7fgO9ZroEhqf9LQ
	et1YCy/pQRhkibSffSfPZx+i7+/blWwkuoRVSwJgB3rdrZl/bEtZj9U+13iFYLc=
X-Google-Smtp-Source: AGHT+IGcMcm2044/0WGDWFbJHRAvj/BsTuOR4L9ig5/T+UOYFsPZ/6eOLoDYbc614YSbGs4frHyR7g==
X-Received: by 2002:a05:6512:10ce:b0:533:4aa1:a517 with SMTP id 2adb3069b0e04-5353e5742admr1706621e87.36.1724922142243;
        Thu, 29 Aug 2024 02:02:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-535408278ffsm99157e87.121.2024.08.29.02.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 02:02:21 -0700 (PDT)
Date: Thu, 29 Aug 2024 12:02:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yan Zhen <yanzhen@vivo.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, andersson@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	opensoure.kernel@vivo.com
Subject: Re: [PATCH v2] clk: qcom: Fix error checking for
 devm_clk_hw_get_clk()
Message-ID: <cpcdztpwosze4l3uhf467vorfu7jqfciglmzr4r6xcre5eci6m@pqwaadsviapv>
References: <20240826061717.2016126-1-yanzhen@vivo.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826061717.2016126-1-yanzhen@vivo.com>

On Mon, Aug 26, 2024 at 02:17:17PM GMT, Yan Zhen wrote:
> The devm_clk_hw_get_clk() function returns error pointers.
> It never returns NULL.  Update the check accordingly.
> 
> 
> Signed-off-by: Yan Zhen <yanzhen@vivo.com>
> ---
> 
> Changes in v2:
> - Return PTR_ERR(icd[i].clk) instead of -ENOENT.
> 


Fixes: 8737ec830ee3 ("clk: qcom: common: Add interconnect clocks support")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
