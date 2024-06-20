Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DB780604
	for <linux-clk@vger.kernel.org>; Thu, 20 Jun 2024 21:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718919551; cv=none; b=gQ/IJBMuF+Vzx97cgzhY78QpqIT8+WktAiL0YaOBgE0nyca/j0ELDcsm5ypFbTtDnr5ZZk/aY80R7SRRx3iM8Se6pHCtGn+0bU/6NL/DwNEIyEOc+CtQ2NY/gAZ8gOKau0Zl81HQ5ggp4STMMZPhk9XXhi3/awk6TPvJJgOSieQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718919551; c=relaxed/simple;
	bh=RXgx7JjhJq26kg8SSR6ByE5dIYJdkgNUTahrtOV+2D0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jTVm4tQ2DqtTRuq7XeVutFa5sgz9ugEjj6Bl3nmE/OZZWKICXx6vJte+1zkKSOtInU15xhAN1Ie9x0nrMI/oPUhf0E+ZEXLcNvnlFkHhm0tNARDPPRJP7YDtx6m3B54gkNa8J/GLlHQKFvdBFRK9aLGMswY6Q7rdk2rZAlh1F0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HN6nY52p; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HN6nY52p"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ebe40673e8so13792271fa.3
        for <linux-clk@vger.kernel.org>; Thu, 20 Jun 2024 14:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718919548; x=1719524348; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NoXCToDT0oayacNmh7qfNjnirLUvAMNFUEgGw4n22jE=;
        b=HN6nY52pqhFoks2OE6rUkHb/N4zYYNcejtlvUxUdvPTwfBNV6WdXdm15xEdigd4DSk
         ZoGIbL7ycvYP3NSzu0IR3QeeuWuD6qlO1g92GyTq8PtdStY7t72MU+ZSUUa496BObfl3
         +mnUqs3HkG1cklaUHw9lcBWLZ7j4KG9CkefIelEpDKzaI7OWw/zoO12Jjf3wlChnbZi1
         2Vnke9PmpfJRvpEXdATJZU6IpHslfwSiGDdOVfFTPYTua5z5SWmD0qrwoXLW5mULcphJ
         GK7PyGNT6LMfUtVSB1A+5xktOCr6x2Tb7LILIWf1PPeDHxaU7p5K0TLc5Gpkcwf/SNA6
         fZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718919548; x=1719524348;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NoXCToDT0oayacNmh7qfNjnirLUvAMNFUEgGw4n22jE=;
        b=tnEiLuWAc43g19Y0dDYmAWkhYZ8zfOvgQ6FrEhfzP7hhBUbNv2NmS0U0cG5e975XKg
         SLxbOUDzCdfX30YnSWsNxartbMQJIIS0ngSmh3kYSDDAb+8inRbmdJlPKreEPlr4oXU1
         d35GQM3LGbveLopb6nWl4lUGm5eaj9hHrQ1NbNc1TrrJoTWlYYRZihqkgzqh3deDz7Uh
         ZOVR9Ij+63YI9Pz2ITIToTcmYC+5CKhFUZrknuSM1ZLl6KlwUEEzrl4YW4Av5JZ+hqsA
         +fmiqWH+r0ueMwtBjailCiQm0Jd7Hhw/SOIRLG+V6LuaPRM0J/UwnyNK2qw+VcCeeBM6
         AlaQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0mkmd7155+XSgRWK6Puj0xueDbD6UBNmFDSb9+b6SUrBPKGwEyPDLj9Q3tAb8BfbdNNA/hyaupN9OzYbTtT3v8rpkDfhTJWiz
X-Gm-Message-State: AOJu0YzuFgjwtJJu/Fx3UYutQ7bdwukEFUx5Mnxqe2x8Re2J5/4e2rg+
	yLbQYNhTe15CyjBbXXq8zKgnCK9k42ACvSUz1bgknlk5pMsuptogcBlR/IiFkcU=
X-Google-Smtp-Source: AGHT+IEQRTJl/rOrzu9m6Wlj8kl3vPK9M2QWTZpjyBU8GvueUf8afsLIPCfkO5C14T15YrWusARHBg==
X-Received: by 2002:a2e:99ca:0:b0:2ec:301a:174c with SMTP id 38308e7fff4ca-2ec3cfe1735mr38322931fa.49.1718919548195;
        Thu, 20 Jun 2024 14:39:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec4d76f683sm313171fa.125.2024.06.20.14.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 14:39:07 -0700 (PDT)
Date: Fri, 21 Jun 2024 00:39:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: Remove QCOM_RPMCC symbol
Message-ID: <vwx5mqkd6b4cma43in2ho7jn242lqhd3g22ozohpa2ta6za272@vtsfoy474dqk>
References: <20240619-drop-qcom-rpmcc-v1-1-b487c95162ef@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619-drop-qcom-rpmcc-v1-1-b487c95162ef@quicinc.com>

On Wed, Jun 19, 2024 at 08:41:52AM GMT, Elliot Berman wrote:
> This symbol is selected by a couple drivers, but isn't used by anyone
> and hasn't been for years now. Drop it.
> 
> No functional change intended.
> 
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> ---
>  drivers/clk/qcom/Kconfig | 5 -----
>  1 file changed, 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
