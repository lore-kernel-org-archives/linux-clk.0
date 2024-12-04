Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F78E1922F5
	for <linux-clk@vger.kernel.org>; Wed,  4 Dec 2024 22:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733351558; cv=none; b=Z7fUmZRoN89bVtH91yZh5/zvSiNHw9rz5HwMFjLwyRg8AAXQp+OmrMoApGwHqb3RwMdSMJxDbcB/ieOQi04Tjk00ZInsu0nAW1LqKqGnSTozPsZTqSvB/ObMKTWtouqMTnueZftkLFp7de1lAPJSIzvYmH0D/jhtXFa1SObs3ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733351558; c=relaxed/simple;
	bh=vOa7LETYg7icjKW7lrEIWCbaGqar/4hAk8skymKe1nc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iT7kDCEV0jAgYoaUjPzhQs08U7EL6yA0RYB0hHKXhlzb9UV0he3H0cnsk6tOP+In3yAypQhI85n61jAZPfIM/mDV0oIZMn6fdU9bRtXrmLzqPAKStAdsO9kCpAV9Z/jd6ND6KkixUSXfXpua8X/Mcx0+8DvEg4jKO3Er1M1GstE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DeFL3Kh7; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DeFL3Kh7"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3001d009633so2071881fa.0
        for <linux-clk@vger.kernel.org>; Wed, 04 Dec 2024 14:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733351555; x=1733956355; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7lUKjEXOkSq/BvCViX3wWNqzFdxMzt0G+l0vc3wMpMM=;
        b=DeFL3Kh7enETMSi2GUQVozhxyMgbsZUaZRESVhxCsQKILPA03cwV5cjjC9eFqYmobW
         gUlyhpluCQkJU/r7ElO+G0vPabvuF54wPdo3JUClUIJeZlxthToUPvSRtxfO+qLJtnfm
         JiJ28JeyCbEbaW18s63aXck6PFQsQBQPrTNqMd9AUSJukOCO3hWmh3QFPmYhgpTKB6fI
         hcg3/hofC+1yjz26Pb99w/jderIZxb67GRMEf5EIK/YKakOXXIHuEEe/+uRl4xzi+LqT
         MW9PJuoAa1m3uvry3m2D47tnzvZsPRYFzg0cUySPNpH9VnhtifRCjsZWZHw5wIMcxvce
         kf5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733351555; x=1733956355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7lUKjEXOkSq/BvCViX3wWNqzFdxMzt0G+l0vc3wMpMM=;
        b=WSE5CsQt7pbQ5UcfhZFr8dToIDpUnS9uFU1eKZtZ192hv3idpIfgbgomIDZNSslW6f
         VoNz+xhDOe1OtGZCq6mkqTWDZZfe8i1dA4fcEIgOSWyg9QZNSNDlRMJgM95qPI9Bc9w8
         yM1jVUnJKcjkFCkikc5AizjCGfS4PL2RzEfKfbsUQ/xW9XkpGe2/Ag/UHtgyiqRFfE43
         +mK/1Vi3TIU+A0fW5huYov1mmzaqjvjWuN6d4aqkpnABZZt8raB5rIx/EVeh+Za2b105
         CsLsJITU7bNuDHSclxP9/WJSJ+v6PkVzxjssGkGpt2BeX3ZuB1jK52Wivd+CxniJO9/k
         ++qg==
X-Forwarded-Encrypted: i=1; AJvYcCW1IDTMmkvEhdKRy8XvzG2Luz6gSM4yGAq4qMsibzIgWzSm2ew6pla0yIQ1L1/tAQ3/6DAPtHcR9uI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yys37Fe+LNBRjt/+aKI1Rv0c8mHdJ065ixMmFOfphrbFygupdbb
	1IF0u9lUfRSWzUUm2jfQm6v9XBzk+q2LYKz4euqUoFzW4MC5DAb0df0BOnxERPs=
X-Gm-Gg: ASbGncubFev+c0+kM8eIuKS5KutxRjulH+V7CpzoJ17H2JdoemP+tY3gdRpGwHyxGpF
	JMOcYG2Z9Ide+lm4WbOwSvqfTqsyb0CU+sFfChIyqWfhFh7rZWG149nbLpQpH91lwNZZGBpxIjM
	k/la7f25ojz3r3UJfdvXOlKY2L6Zh2tbjYdXXfKKlbUXLTyyoY0+A07zQyR75peVNnttyqvF5UT
	FuoTMHB+rdVdPephsZxwWME1M7/eENq+gVr9YZEUa2OIfap/iLr0r9jMCxSabpxrtRRRPF82YPs
	0lDVjzz7ZRrOL0dHnPgVmBRNRGOVng==
X-Google-Smtp-Source: AGHT+IFNWhkJVAJckm6/eNAWU6WXd/hjHauSXtKnuiWCrx2cr6kF+AVPGV20Vj2333ehZHP0bITu8Q==
X-Received: by 2002:a2e:bd82:0:b0:300:1f05:5bcb with SMTP id 38308e7fff4ca-3001f055dc6mr2766501fa.16.1733351554688;
        Wed, 04 Dec 2024 14:32:34 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30020d85256sm51301fa.11.2024.12.04.14.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 14:32:34 -0800 (PST)
Date: Thu, 5 Dec 2024 00:32:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v3 3/8] clk: qcom: rpmh: Add support for SM8750 rpmh
 clocks
Message-ID: <a2ztbxi2sth6pws6vtw2t7tnrqfh3d3j4dhbphey4vckkkdjep@jrgtpu7uw57z>
References: <20241204-sm8750_master_clks-v3-0-1a8f31a53a86@quicinc.com>
 <20241204-sm8750_master_clks-v3-3-1a8f31a53a86@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204-sm8750_master_clks-v3-3-1a8f31a53a86@quicinc.com>

On Wed, Dec 04, 2024 at 11:37:15AM -0800, Melody Olvera wrote:
> From: Taniya Das <quic_tdas@quicinc.com>
> 
> Add the RPMH clocks present in SM8750 SoC.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
