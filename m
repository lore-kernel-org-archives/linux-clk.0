Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C21B8634E
	for <linux-clk@vger.kernel.org>; Mon, 17 Mar 2025 05:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742189218; cv=none; b=I3ps0eH3qu6iJEbz/58WbJfGBt1KK2fWWgFIMGdbRelOZwIovRaw+rKNf8BQ5zp5aCCMRKkMExw0YznznVTTpFTnf2ALxOLWmQzP6/bIcrIfzWUCDesN2KryIOYK/Ac2TVWP9RvSgIEI5K6HY4oWT8bgWkY/UYM/MQ6HQqwKCVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742189218; c=relaxed/simple;
	bh=7DHN5cVmz+pDkRxVTmBkDg2nk5LJ8wBCI4oxq/FHDIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r11TfsNDnayXH8D/rKuavZZulFNBS3LtJqxT7ZDXXGKyp6ThzC7BRO3FMIpdYAYSsVhy0map4LQDFWROSn1O5uj6LUhKWdVFCwq2jeW5K19R+3jUUmZ9+5toFxNKYTsioXe19NxFtybiKK2YKav7hf7VNuvuoLHkH4skUgiYkrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gxfY+ljv; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gxfY+ljv"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so10503685e9.1
        for <linux-clk@vger.kernel.org>; Sun, 16 Mar 2025 22:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742189214; x=1742794014; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2uXXvocDuD+66rt+lg39ttZUegKOYcDjUjA+UXfDUD4=;
        b=gxfY+ljvKh2ZWe4Hejdd0d4G4ILLXtYmxB5l7H4i1HcJJGLcyeGNdt+kQ6Z/s/sKJv
         W5D/GRaI9jDVTpxtDXDMTyhuQ2fTE+0BR7PNcl6MLz0mUrRAgN5TShSgUMjZYdJ7d0En
         KHSD6qKrN332OyO/giWjsBovsGFAcwLErEE/WPDLihaFIAONbZHSXUkXw9Q/Pk0I3hW1
         HO6+FVQUgIGcRcXy3ir2t7A5oDWxpEBaMR4Y+sYFUf2pLpTQZ9tPLk/CPqpcn/uVHksl
         w9AGjHRxKNNRblaUSfVVSfulBGxSqvcGXe/gQg5ZOVtNfR+qVDi7n6QEq2YsrMuWVMRt
         vI+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742189214; x=1742794014;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2uXXvocDuD+66rt+lg39ttZUegKOYcDjUjA+UXfDUD4=;
        b=eRDAeQrxLUuJkR5/5vbvK8Jet2Mw4buQfqa3KQBDWayy4lZa/656wdmQnFCbbO3s0z
         JefEzqEOSb2btMP2WptBJTR7zHNc++Qw0ptWHCEqn3Hrdmp13Zmr/0d0MVStL4UgIaDw
         P8WIyjkwMFr4WW/FGZhAgUBJemBLrxB3GAJzRQcB6xacPxwg4LxwJzBGKK7F38kVm+yz
         mYssPClOX5GxdeZt9n+lyyV/ICTaX0sDtExG8qQTUCTxEOj+TCfpwv18mRR3nXn7HEmH
         stCrj2vqEjnxkgpj1+Zjn2mIsyRHNCIbr/sAihdDnYDDKwnXvpFAzVPVsmwcLupU4TLr
         WElw==
X-Gm-Message-State: AOJu0Yw2jc8AUyxzpD8BNQN5EdTkFW3N5VoKNy7TBAraHsTeWee+eCbr
	Q44S6PdObxsllZXUvwSbiK6aVvtfQftBrOTbMML2xLK2Aw3Xu1ysSlpPWyW9Gc8=
X-Gm-Gg: ASbGnctcU84bw6RScXKUK3OYP94AihUR+1vIW4H89uqiGY5w09cS49095RZv3xCyw3c
	CiOpIhhiG8NnFjpsIbe4LFmRq9wTI8EsFZhxmZ/zgRAmsf04EkrOpSaQKfWOfa8ENJzdhreFxWH
	7juQX+ecnCYdos40IoxZ+o4tphKKrP+GJnlVeydvTinq1czNRx5MyfHrGu4e8W8lI6ApfE5tcbV
	BshweW+CUHkOxqhfSGdP5POlXsLQdmijfoaRhZgrELIRjW+sTB+E/OB1HS8XdCOQQDorYWsfmLH
	JEIkDltR0Ek4iDK7AQ7c63lfJma6p8ogQore2qpbxupNSzQVlw==
X-Google-Smtp-Source: AGHT+IHlSqR/SRDikVnKXDQ6JSQA1h4tlec7oNPPwqTDiIJRTQIqJhGODEAwWWCxkkVC/qZiyiG4Lg==
X-Received: by 2002:a05:600c:4511:b0:43b:c857:e9c8 with SMTP id 5b1f17b1804b1-43d1ece1af3mr114703135e9.31.1742189214587;
        Sun, 16 Mar 2025 22:26:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d200facfcsm93932215e9.32.2025.03.16.22.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 22:26:54 -0700 (PDT)
Date: Mon, 17 Mar 2025 08:26:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: linux-clk@vger.kernel.org, linux-fpga@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Moritz Fischer <mdf@kernel.org>, Wu Hao <hao.wu@intel.com>,
	Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>
Subject: Re: [PATCH v2 6/6] clk: clk-axi-clkgen: fix coding style issues
Message-ID: <402a575c-5bfc-4dac-bac6-d7f4e7ee5462@stanley.mountain>
References: <20250313-dev-axi-clkgen-limits-v2-0-173ae2ad6311@analog.com>
 <20250313-dev-axi-clkgen-limits-v2-6-173ae2ad6311@analog.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250313-dev-axi-clkgen-limits-v2-6-173ae2ad6311@analog.com>

On Thu, Mar 13, 2025 at 03:14:48PM +0000, Nuno Sá wrote:
> @@ -224,8 +226,8 @@ static void axi_clkgen_calc_clk_params(unsigned int divider,
>  
>  		if (params->edge == 0 || frac_divider == 1)
>  			params->low--;
> -		if (((params->edge == 0) ^ (frac_divider == 1)) ||
                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

> -			(divider == 2 && frac_divider == 1))
> +		if ((params->edge == 0 ^ frac_divider == 1) ||
                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This works, but the code was a lot easier to read with parentheses.

regards,
dan carpenter

