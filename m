Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7E51EE00E
	for <linux-clk@vger.kernel.org>; Fri, 18 Oct 2024 20:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729281994; cv=none; b=H4JTzTF1B6oNNunI7jhu9gOI/ZjjEGVPE5B5D9LqeL/trT2U+6HVDN8SMZg8g55z7bLwhKEhFBTektC/ddiuIN8YBzsvgeotqMHm+q0SHtochPN2WL+RM7Su4pOoa6iYq6iCxlEPRb8ATL/hsW6A3aZl+4NU+J/LJLqq6CvF0Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729281994; c=relaxed/simple;
	bh=/51xfUSYsUDnsKHUISmuqpPXDOu6WONAfwM4tgenvn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iPJNegyxvWYjQ41K711lOHUm6lB+Xk4WvOKJFCi8Q5R1ALG8csd8GRZT/Ap8ubNZCM3I7qIvDRl5FdVeLQdghrnJIWJUxAoCNiY1wwnneE8WFnJaIGILO79CmFYqNcbEMwidZxUrPKabemmKC8Rr7P+ffP6AS6a7kkpM9uCYPmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nywpOx8e; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nywpOx8e"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb584a8f81so30116401fa.3
        for <linux-clk@vger.kernel.org>; Fri, 18 Oct 2024 13:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729281990; x=1729886790; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3qqeaSgLM4urcEuCSV+5q6Je9Wo3+AKbBRfKiBnVfLY=;
        b=nywpOx8e4pbIc417fKxkCToqytuZdvTH4Qpg2rhfsdXfZ81/dgLdX256X3TZHNKQyA
         Nc6d2ElJAzjDUT42B1HEJnRtQPYTLPaNnse0wW1EpzKh6FdYeNZu0JLbQePN5pEsIt/c
         XZZpVi3eZzufQjGeoH9pkQTBiiO+zxnWGInIXWVa805r+9L27RMqNBxwtozMepc9UPCi
         y7zUjJ/En96L+nYNnnEntdoGdVgIJAkNVMOq3U7KwdULaz6jOyQmdwamv/kA88eWVTee
         GY/uEylxhOlym6G2urH3xVv3eqHhuFiPC4vPVO0AGg08NxaG/NzIzQDw4Hej8WN9cQdS
         eBmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729281990; x=1729886790;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3qqeaSgLM4urcEuCSV+5q6Je9Wo3+AKbBRfKiBnVfLY=;
        b=NFGGLGvnmOrxajSxUei/jNx1/wRPivPntIP9KHSd4Uok35e9kD0DH+XhpSt/R22H8R
         l6guDc5yNKtEMpLPCaWMlRqxmARdKdkZarsNx9Y+qzRC2t4TSun6Fxza9mgnG5E1qZfh
         1yw3KJfr7ip7IxlW8klezgdqFbQ5NSRg6odT8jF4oFQpPQlpjio+JkeImb/SQe78iQpK
         gCZvNjoiJMxRcbXP4fHkeow+nlx8PktBCH3SpPA5jlU1NP3wzdP/Rp7xpgpyGLX5HIBY
         mll01ULrHe+PSFEyEdNdOQi7Uhlo0IhaEBNG5mhSjl/J4a4wFwgcBFW4nTyrW1Gp2YCL
         c/4g==
X-Forwarded-Encrypted: i=1; AJvYcCUoUfnFFj3t6x1Mp9swct2NY/Wc+BE3F+Y6Ks4YYEGj0/OcV6KAflHRhnTBu4NzSRKstXquq3vhIp4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJrYv2yatCVUEbATu7F/GoalbAvLWU7h0u14DWDq/3mIGagBs0
	ItPpb8fZtb3PhRQfF1DsjM5+Mazk7moJ0kcvLqHEnlRnbIuujpcxiFVfyYn3u/g=
X-Google-Smtp-Source: AGHT+IEYyQy2Sr1B6koAkEX9lbp8dGLEG2De1kXaGvAZ20tI3Rvf2hBstWggqiGwZuP1BLYC4EzDUw==
X-Received: by 2002:a2e:be84:0:b0:2fa:bb65:801f with SMTP id 38308e7fff4ca-2fb82ea2494mr22593721fa.10.1729281990154;
        Fri, 18 Oct 2024 13:06:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb80a08906sm2878401fa.106.2024.10.18.13.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 13:06:28 -0700 (PDT)
Date: Fri, 18 Oct 2024 23:06:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Abhishek Sahu <absahu@codeaurora.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Stephen Boyd <sboyd@codeaurora.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 01/11] clk: qcom: Update the support for alpha mode
 configuration
Message-ID: <nzzijnfy4wy4ts46c55rokvgwsxc4kytro743xqoecyjpjosyu@hajjkkdw2xmg>
References: <20241019-qcs615-mm-clockcontroller-v1-0-4cfb96d779ae@quicinc.com>
 <20241019-qcs615-mm-clockcontroller-v1-1-4cfb96d779ae@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241019-qcs615-mm-clockcontroller-v1-1-4cfb96d779ae@quicinc.com>

On Sat, Oct 19, 2024 at 12:45:37AM +0530, Taniya Das wrote:
> The alpha_en_mask and alpha_mode_mask must be applied within the
> clk_alpha_pll_configure() function to ensure proper configuration of
> the alpha mode of the PLL.
> 
> Fixes: c45ae598fc16 ("clk: qcom: support for alpha mode configuration")
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
-- 
With best wishes
Dmitry
