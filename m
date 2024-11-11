Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379DB14F126
	for <linux-clk@vger.kernel.org>; Mon, 11 Nov 2024 12:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731328872; cv=none; b=g0bRxvLycHlGt7c7FvdgAs8xZQoSAFrjPTxCARCenF7UtZPpYbzEklLXHmbDZv2NmNtFB8l4LdI6R+g5co4zzs/dH6+dcDmyAfEv8pCd0csIkghHSVRJmbgz9T1H880QOscYVSfglrAyJGXUHnRk5oigfJPz7tFZbBXiy7heJHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731328872; c=relaxed/simple;
	bh=oZtApR3Nvo8c5QYGJJ2/iy40iqXBsN8XPrQDDZjb0H0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IWBMHdn2DX/OKMQtTzI4jM5MYrWtHTcdUWMKs4k2MAw+epCS6aTDT/Hn4vOfbWcexXPQLgmYraXa3daqR41ZIBmumyVmtl7y8onFtUYNIP1Uk8ySboMX4U+eDZYy84U16KmJziELmsXSrwsh3FNaG6JqqC8kaP2mKX0RWQVlq28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eofYajba; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eofYajba"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fb5fa911aaso54839141fa.2
        for <linux-clk@vger.kernel.org>; Mon, 11 Nov 2024 04:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731328868; x=1731933668; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I4HfV0PqO8tzYHX6VGeaFbi66mw59nhOAbviLCfOiqI=;
        b=eofYajbacxO7Qc2Sefc5ff8v5uoVgpoZNxq27Ktw8YmcH8oMadqUJn0/6ocTUXIPEn
         nPEvgJvnpRJaooLJio91VyK0DQQLvoNezQJEIL7ZufctLtKcT+rZJ325eFThD5/Ag1wb
         tLqYsevvjOX3GGcV9gGnHR8qKXYHRm0WZ/3hytwc3UR4g3KIBeISFrSMGXfNnfgzp1iy
         jfaGqQPRUfr8hyjmu2g36Y78JVypEp+7pZHJxZSehouIY2orloHWX2rLbetpLUDinaJw
         hgeJu7Ld5Q7cx/Gkj90NlvGTZ7GuZFAC0nBCRm3DKWSsvAFvLjTukFSxhFP0d0LOvD3k
         RCYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731328868; x=1731933668;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I4HfV0PqO8tzYHX6VGeaFbi66mw59nhOAbviLCfOiqI=;
        b=QyEX37xnhC91dCVMX8xtmymkpz1soNI3n3RvwcT0LIiyeSascvl2BMGlXbjIa6ff36
         Zda0Sm00qjgcKi4ZGzqE/VBCDQB4zUSVfpEku0Y7e0j6tQq+UPCjie0g+Ca3mn6ntWpK
         nQzP4XFyLAVSH1pVpH+1ga4FhqQ8o431g1DvG9mahnTvIAsYYeO3Dq8F7Frjx9bagzTq
         x6jaYkOExwj5+K+6tN/KPLepJCQiIBjgosOOXjXmRTsUX6JVvAN+PVU3fnCNfEUZZldg
         utHjig6Z3jZfkXNtK+os3hbhD5nr02DesdpBTQU7GRRZp6uaN+XobCQ+VF1Ak6QVQZqL
         3OZg==
X-Forwarded-Encrypted: i=1; AJvYcCWujh+QnXNIw3lMCMhLEtJ6rwFdI4mwYjEbtTmRsCYUgFjKu5nCOTmPlzMlqwUgwEIK9KohvuZU60k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyT+fRjRuLpT1WsAVfou07nWVQ8DUu+Z2R6tCbscH7U2HLvzhle
	eTh8FYgRAZI3VjrxnkQe4245nomXUxwvQGSudu4NZRJXgxCLbCA8AkB65yFYeQA=
X-Google-Smtp-Source: AGHT+IFDMxq8JQgZ3yOqv+TOrWdr8ZF25uS3cMX5x65ZUfZh/LXbHYlIqPk6dU3NKQ7IV2xJigL9fQ==
X-Received: by 2002:a05:651c:1143:b0:2fb:8c9a:fe3f with SMTP id 38308e7fff4ca-2ff2020794bmr90292661fa.22.1731328868289;
        Mon, 11 Nov 2024 04:41:08 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff1790262fsm16754411fa.63.2024.11.11.04.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 04:41:07 -0800 (PST)
Date: Mon, 11 Nov 2024 14:41:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Varadarajan Narayanan <quic_varada@quicinc.com>, Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
	Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: remove unused data from gcc-ipq5424.c
Message-ID: <r2se3v53h7pnx527bgsswpkjhkqx2csrwlxpzai7l6lanbjjty@e4nljcvgors3>
References: <20241111103258.3336183-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111103258.3336183-1-arnd@kernel.org>

On Mon, Nov 11, 2024 at 11:32:51AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The newly added driver causes a warnings when enabling -Wunused-const-variables:
> 
> drivers/clk/qcom/gcc-ipq5424.c:1064:30: error: 'ftbl_gcc_q6_axi_clk_src' defined but not used [-Werror=unused-const-variable=]
>  1064 | static const struct freq_tbl ftbl_gcc_q6_axi_clk_src[] = {
>       |                              ^~~~~~~~~~~~~~~~~~~~~~~
> drivers/clk/qcom/gcc-ipq5424.c:957:30: error: 'ftbl_gcc_qpic_clk_src' defined but not used [-Werror=unused-const-variable=]
>   957 | static const struct freq_tbl ftbl_gcc_qpic_clk_src[] = {
>       |                              ^~~~~~~~~~~~~~~~~~~~~
> drivers/clk/qcom/gcc-ipq5424.c:497:30: error: 'ftbl_gcc_qupv3_2x_core_clk_src' defined but not used [-Werror=unused-const-variable=]
>   497 | static const struct freq_tbl ftbl_gcc_qupv3_2x_core_clk_src[] = {
>       |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> In order to hopefully enable this warning by default in the future,
> remove the data for now. If it gets used in the future, it can
> trivially get added back.
> 
> Fixes: 21b5d5a4a311 ("clk: qcom: add Global Clock controller (GCC) driver for IPQ5424 SoC")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/clk/qcom/gcc-ipq5424.c | 18 ------------------
>  1 file changed, 18 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
