Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F7F1CB50D
	for <linux-clk@vger.kernel.org>; Thu, 21 Nov 2024 21:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732226396; cv=none; b=ltssqBPQpRWmjSrAjPEvA0b+QITAvROxYdemk2vSDQCk/7n/A74fQhbmo3SYABgxHPb3QghYW0Cp/48fLNpP53PTkrxB7wxsofhLV++XBYWgN0o/i52CVoVXQg9aaR1WwPJSq7I8HlOMoQribo9Ugv5sk8EImziDRObLm5Zy+VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732226396; c=relaxed/simple;
	bh=Z9hBdIRlSlIOJt5RlJxNQ+/7oHtkA0DlqGr9R4P4wWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I7IscckicqRT5/ShoJOKyfyRkrAIcDk6vPteV6v8kBLbQ5sjDaLuB78npzZpyAgByb9DUFQzYfeqMgtHPUe0A+SERHcgkLMpaOy9i0SXG6FpUMdXvwOicSzwodtjPaQYj9vnxt1JEDyq0DJ6PJB0ljbJS4r4gO6aRUIzY3Q0voY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nG75BV9l; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nG75BV9l"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fb5111747cso16761081fa.2
        for <linux-clk@vger.kernel.org>; Thu, 21 Nov 2024 13:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732226393; x=1732831193; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nWJdS00cJ4rOlNcmR7aH9AGornPg9zKM2yab94TA0Ik=;
        b=nG75BV9ll6f8M9nCyA2rtIYkr6oTFQnnZQfsVFdZstFylyRqzsThIm4TIEWxp1OsOB
         ZnXj1b9FHHLdITKiswho7JrtFg+TNK/kYlq43Edh3krCavycojczVYIYpuVXuBtHbWSr
         3GlXbjnL0capucBiV3iRfLZDnQrVQNyjQSEAqps80F8LxAhd8GETSqNQdwys3fa+mfb/
         fLLMJnSnEE4aeUbpCfF5eB/VLQIXVTbggtF8UIN3+NaSMTamtS+UaMIbKmvO57P22CXg
         ly+MdoTbZo47Zc05Q6+Jg2qPZUHHfLXBmZcIxiXyFZwgWtpGkYtlq4aDKzSExxYqxqfD
         fmEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732226393; x=1732831193;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nWJdS00cJ4rOlNcmR7aH9AGornPg9zKM2yab94TA0Ik=;
        b=MV5MJFN3wslFHXpaZ3nbaB5EpC8Zl3pjjuLb7XnTSVq8sCKw5Ksvhh1JeI7TXYXxU2
         ZHq5GncYIt0Oq1/OKk7zDtI5MnYMwetTqHe9plSLEK5yCXdRGsofgJsco9uVY8u/HUc5
         Zi+eBA8AunCOvfo7TDs7L/IV71UUcq02+OG8YiD+oiZAv/Owqk01j4iThCvnrdqJZYmb
         DVykTpPzfkt8QujOfdsJ+zFPJ+54nSBuhNoAgoyszVvI1bnXqfG2xF8eCvvDdZZKQFKK
         JEVilm0hSkL50PCthmDf7hdCvw1FIRra0JDxsNIUgUAAQ/vHO0GlPrR2gJE/wOPybM3t
         Vmbg==
X-Forwarded-Encrypted: i=1; AJvYcCVkb14J41VqutTeU782zMXL/jLdFbImAu4B5M3I10NUM9LNDedxnSx4rOMOQ8mk4B5vro1IFTGs04A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5iyAZvKwUwR11+zQB8krUKGG5jtv9p16/16VwFY51Ak1Fqx6H
	CD5Kzjzny/LCP4/lS4b2xbw01AWQ/J1A6pm6eZBCPddoTBL3RD66Yrvl4KjkmQQ=
X-Gm-Gg: ASbGncsJ5clIIH1vGDyLOOx1p1KlLBlBIc5BMboUIyRXPLbHH2+6S5pKRRA7MeZEzX6
	m8nwpawkPOrcyecgNgXQ9TW4WllqB6ppaXlgDnLSehXtg3xws15XBJD3G1YzENJAw/kf4A1rW/f
	P8qtUifagLN8EDw01dfmr385tVNZZAzMtFdeRoFPNC7i+LNggRrs5j16a7p6fNiKUdzHq/fTu6R
	H5VqijaUKk84g48ozUer0zNUdbJnjHpi/871nRF9wAJqPaO+uaiFZ3TkpQPaWcAmiOxwOpfcF2D
	8U4AQzixqPZ8tPSqbSMV5wVb6YbwwQ==
X-Google-Smtp-Source: AGHT+IHBwuG5kencpPo4m09q691DHgtw2tL/t0BfxRPekGjk62eEZPhMHiR1SRxKJAeR+W+b3uNZ+A==
X-Received: by 2002:a05:651c:1148:b0:2ff:5f94:e649 with SMTP id 38308e7fff4ca-2ffa7125e84mr1424491fa.16.1732226392942;
        Thu, 21 Nov 2024 13:59:52 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffa538ea19sm652441fa.95.2024.11.21.13.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 13:59:51 -0800 (PST)
Date: Thu, 21 Nov 2024 23:59:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: common: Add support for power-domain
 attachment
Message-ID: <hfkvbshgbhz3dst44kbdxxy34phrqtysxbfchuvefars7ibrwt@jqjl4oca6g2k>
References: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-0-b7a2bd82ba37@linaro.org>
 <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-1-b7a2bd82ba37@linaro.org>
 <u6azgqlmncadcwiz42pk36q7rehwajnftvwfjh4aoawskdwkof@ao2imoy34k4y>
 <587de15d-06c8-4f12-8986-f60a80fe5ad8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <587de15d-06c8-4f12-8986-f60a80fe5ad8@linaro.org>

On Wed, Nov 20, 2024 at 04:49:04PM +0000, Bryan O'Donoghue wrote:
> On 19/11/2024 15:41, Bjorn Andersson wrote:
> audience what exactly you mean with "singleton" and "core logic".
> > 
> > > Use dev_pm_domain_attach_list() to automatically hook the list of given
> > > power-domains in the dtsi for the clock being registered in
> > > qcom_cc_really_probe().
> > > 
> > Do we need to power on/off all the associated power-domains every time
> > we access registers in the clock controller etc, or only in relation to
> > operating these GDSCs?
> 
> Its a good question.
> 
> No I don't believe these PDs are required for the regs themselves i.e. we
> can write and read - I checked the regs in the clock's probe with the GDSCs
> off
> 
>         /* Keep clocks always enabled */
>         qcom_branch_set_clk_en(regmap, 0x13a9c); /* CAM_CC_GDSC_CLK */
>         qcom_branch_set_clk_en(regmap, 0x13ab8); /* CAM_CC_SLEEP_CLK */
> 
> only inside the probe where we actually try to switch the clock on, do we
> need the PD.
> 
>         ret = qcom_cc_really_probe(&pdev->dev, &cam_cc_x1e80100_desc,
> regmap);
>
> Which means the registers themselves don't need the PD. The clock remains
> "stuck" unless the GDSC is on which to me means that the PLL isn't powered
> until the GDSC is switched on.
> 
> So no, the regs are fine but the PLL won't budge without juice from the PD.

Is it for the MMCX or for MXC domain? If my memory doesn't play tricks
on me (it can) I think that on sm8250 I had to keep MMCX up to access
registers. But it also well might be that I didn't run the fine-grained
test and the MMCX was really required to power up the PLLs rather than
registers.


-- 
With best wishes
Dmitry
