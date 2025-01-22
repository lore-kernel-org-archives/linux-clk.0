Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079C61CD1E4
	for <linux-clk@vger.kernel.org>; Wed, 22 Jan 2025 22:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737586796; cv=none; b=Bj3eaR/SXxoyJGREZUz4JgM0Oo2uWUwXnU2sDUZdyxUpUC7j457Gf5OSN/6jJbLbyjkPBD0I4AbAaPp1EyuaIZYjTEFc91rc/+mZWAOpFwrK6SNv7ykKeeono1+DNr1V9uXs0s4TvZfQu+PSPq0QatltFYcIPvud4CIuriaCpm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737586796; c=relaxed/simple;
	bh=Gw6aO18MI81yiBJ4Yam0mKSRn4pYcWrOAMDieD3514E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RRP57nNmmdot9xD12E+zdwblm6nTJU2dRtSAymPvN2yDWPPMsKDTME/r3D9r98HU4iooFEqE7F6xdaqIZ+45i9JhtIOVqUbUb82lJEmpz/3rXTD1VQ82rNMjSXgtSLf9R5tBLqVgV2VwTQ7mPHvZ3ydbE1i9Iv6G+1Kqb/gCS2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R7BdtyTl; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R7BdtyTl"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-540254357c8so282096e87.1
        for <linux-clk@vger.kernel.org>; Wed, 22 Jan 2025 14:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737586792; x=1738191592; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nPtAqf7h4WbDjoQxKkUsSup+gLFR5DpH6tAiQ8agGsA=;
        b=R7BdtyTlQWtz25PdRouIDkpJu34anogINNd7e05+6tky5xGAj6/wYg8GBzvl1Ijz/k
         T6dWC7iLAOZgWlF2V0L3icbaLeNwtrTDRrO9rYHg9IsSHf2ic7Y6PSL/uORfTjJdIyy8
         5ftmHSPlPeVIeRoyUSoXCnN/sjeFmfzOOZJpJbNSn5s73vCkrKRCjqfwbTqPwezAg4Mw
         +dhhPQmkm60FgwuqhAyR8UCvHTTFJDl4O0wwjNdLILsy/EtMbH7b6/jFWfM7HVbm1Uy8
         2/RjEEJ2/PpdG2j7J1SRY/07HpqKJ1v/UugNP62ujz+ImDkwEmi6J1cTZGkbB3wk6gmF
         IOzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737586792; x=1738191592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPtAqf7h4WbDjoQxKkUsSup+gLFR5DpH6tAiQ8agGsA=;
        b=C9fTxduOchcor2XkM/2lRZB1AVMS/wbOrSB28gUvNAC9LKKaqAb25mTLpgw2039HQA
         P9itvU1CLrhCyUo9fB18fgnqzsTpsAJie95QU2DJ6Hy6MxVA272Jl8k6JctVZ5jHwgot
         gR8FJpNJvf+LcCKjg0G6fSMaHHan5P1AQUuOAEiIZQMa0FJd/3VXcd+uXKtURy5LRgO0
         bV5VICpPr/J0iLtbE52Uk7KdWyRNPn3StxjzMo8rywOsYoaYIhn7/ojw/4L3RWijcsX0
         Nex8B+SPUrC859rWzFWTaRnxqx4aXbo2H3AUQbya10kgm/mm/ITxVPrQ/8TnSwIf+KD6
         naOA==
X-Forwarded-Encrypted: i=1; AJvYcCXh9O0mVBhQ9ygJe5C55Sukp1UFPx4bml2tScby/yryUFCObJ0/WPVJulstV98ANrN92/5dH94DXwU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmo+pfZpdwMe1A2ge2Ex5HHAavbs7ffsyxN4YkHxuM2Aqdjw3T
	lieoj6oB7LkRn/1zM9RIoxt8MJZrFDgxh9KiisTMOp8VnX5U1k8wv3FCg3mGxds=
X-Gm-Gg: ASbGncvLKmvgLqiyO5/JyKd0qK/4hcKB3rGV7yQidlxFIEui8q3w5h5Y8KzESDS0eDD
	wRSl8IZdLFujuWfAIC5xkW9W/wgw09RJmOD+OyPIAkav04zx8G3VxKcvW4CqsM6vLSVFyxpDpBr
	nEtyd34UFjGdlr7acX0dJ5E8skCAp80n6282WTsgNXBsbWYEu+yxDhdo9+D598Z68GkdaZiFB8J
	zu00x5YcfQgDD7rmVG+q8LMptMk2Fcr8gOgEngHEMDVyLPUkaVBCEXxu1oEpzJkt0BG/0MJjRFK
	LCn9u5rRYTs6IqDr7StKyIc/Cn5ESa54Nxs82ksSEcsBpRlAzQ==
X-Google-Smtp-Source: AGHT+IFnKUjYvAFf5DAYAn9dE3QKH4so4aqvmh/myx238vmXYZ/YV9GFfYVpxi9d0GEQJnHVZM7HIw==
X-Received: by 2002:ac2:5a59:0:b0:53f:8c46:42bc with SMTP id 2adb3069b0e04-5439c21f314mr6198692e87.2.1737586792081;
        Wed, 22 Jan 2025 14:59:52 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af732d2sm2375845e87.176.2025.01.22.14.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 14:59:50 -0800 (PST)
Date: Thu, 23 Jan 2025 00:59:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jordan Crouse <jorcrous@amazon.com>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: qcom: camcc-sm8250: Use clk_rcg2_shared_ops for
 some RCGs
Message-ID: <hafo5mhkxcfmfq33it4dyp3ufzep4aqyf23vj373raivrrnmwp@xrotohpyjvt6>
References: <20250122222612.32351-1-jorcrous@amazon.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122222612.32351-1-jorcrous@amazon.com>

On Wed, Jan 22, 2025 at 10:26:12PM +0000, Jordan Crouse wrote:
> Update some RCGs on the sm8250 camera clock controller to use
> clk_rcg2_shared_ops. The shared_ops ensure the RCGs get parked
> to the XO during clock disable to prevent the clocks from locking up
> when the GDSC is enabled. These mirror similar fixes for other controllers
> such as commit e5c359f70e4b ("clk: qcom: camcc: Update the clock ops for
> the SC7180").
> 
> Signed-off-by: Jordan Crouse <jorcrous@amazon.com>
> ---
> 
> (no changes since v1)

Well, it should be "updated commit message to refer relevant commit".
Anyway,

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
>  drivers/clk/qcom/camcc-sm8250.c | 56 ++++++++++++++++-----------------
>  1 file changed, 28 insertions(+), 28 deletions(-)
> 
-- 
With best wishes
Dmitry
