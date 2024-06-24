Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D7317BB6
	for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 05:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719207348; cv=none; b=HGRNtcsKbAoCfKQP53JCXvLjpIbQdDdIw8PnfpMQBM1ibL59vCpkjgYdAbvhs+ef1BVicClLq4uhLRJZLACv3+jVvOGKGXhxLPgQ7/RTnjcwB74uqxjuG4M79LiTIwW0DklN9XytEoKm2UFTCCk10I+Jgij/+2xtNuGF4qTpFpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719207348; c=relaxed/simple;
	bh=tL4uu5xG9IpLZLy0hCoGBu/tiFpjMNGK6FbGRFIu9pY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F339yReJSKuWSOjHjiPjCX9DdxK+sw3TarcqBnE7yB2SymsYp02vv7wgJifvDU9Q6R0fSIFFgHZJIsAo0RL8fgdgXB3jRwkngGPEiq2JoIzvb2KNOw3efYd9l8or82Xbq1GwUPB5MIfALQLjt2BBHJNh5UP6xWO1Vgw6H0lraEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VoKOy9wz; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VoKOy9wz"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52cdcd26d61so1983639e87.2
        for <linux-clk@vger.kernel.org>; Sun, 23 Jun 2024 22:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719207344; x=1719812144; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uXt831VOucXeBGOMZLVEq9KmUHZ7mdnZ3c6OLXF1pJQ=;
        b=VoKOy9wzNbuO7AXMdpbBpiz298vg4heTuEtBX7OGxAKL2wLQWHILDRd3FcxX+Wk/Qi
         4UNwgxPIy6XDgiV/e3pxWv8rrxwcMi9cWZrM7wgIYhbowZqxCeWGd3/CYoKrJsXWAOwZ
         XkovlNEUOBVQ1Bv+GU5tobB8tV0fWRDz03NTimIO7H4Sl7bPaDtnQO3UEz5sY93TOTNr
         pftcHPInvcst+wAmtehzNDhwd4wM81RCtfvNH3PspJeHyLBt/E/Yl5N54wjx349uVyvo
         qAckLNQdUP+8kj2xo2c/gH/PDOE468bWVY3VFuMCCDXsuOFAKJMR41j0hMG5skqWfvBs
         iykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719207344; x=1719812144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uXt831VOucXeBGOMZLVEq9KmUHZ7mdnZ3c6OLXF1pJQ=;
        b=q8kZQtSXybnfYOTDUwy7upgKTkht+fAJIHcmJwnU0G7p6dXkoyOH/QVWp6mVKYqQN7
         qSv8YI0oV0PmyS6Ozf6nrpW/qj1PLNae5NDa1NC8A7tG/kFNdwojug5SDsCR31IeavWX
         zYT4+d3X54YVg3mb/84BLwefoA9/MVsM1XU/E0LaRc7n4WAJHFu0CDkPFFP5Of2d+kI0
         InuMttLS01yq8aHw0FgvuC24BbYjuxuSarQ18lje1D0+9haYw3eaezJ7WGy44OgpatGS
         wCSDUNQz1xt5pig7bCCUN2JE9g9YS9Z45Mpd9K7Y1kumf8BdCdUlvtXqJbxabga1s62L
         TDlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxocW+hMpfVtc4j0jl/P7SfE6PAw+FRTseoEP9A1Po+7hPo1CDvNv4IPGLfQU0QfRT1R8Ya8pNyCKbVxrT4A04/XIb8RdYxkJC
X-Gm-Message-State: AOJu0YziN3LhYmY7BdEmjq40foKBC5qCIqR/OEW4e8zOR2ikcjcNpA1M
	Iuhw3/qOd7SkP7xZH0mWESJ9m6owTwP9me7hGaSXnUUNLgwYmW6++AmoNXIBAsM=
X-Google-Smtp-Source: AGHT+IEtOtRS1h75iYfHFpZGCy3R5aFkLtRU38+6nWkEn2DerH/6c2kvfaOl1tHVW4jANaOgesxImA==
X-Received: by 2002:a19:e043:0:b0:52c:e121:c927 with SMTP id 2adb3069b0e04-52ce18647f7mr1944648e87.62.1719207343703;
        Sun, 23 Jun 2024 22:35:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd63bd790sm899580e87.93.2024.06.23.22.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 22:35:43 -0700 (PDT)
Date: Mon, 24 Jun 2024 08:35:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	angelogioacchino.delregno@collabora.com, andersson@kernel.org, konrad.dybcio@linaro.org, 
	mturquette@baylibre.com, sboyd@kernel.org, ulf.hansson@linaro.org, quic_sibis@quicinc.com, 
	abel.vesa@linaro.org, otto.pflueger@abscue.de, quic_rohiagar@quicinc.com, 
	luca@z3ntu.xyz, quic_ipkumar@quicinc.com, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 5/7] clk: qcom: gcc-ipq9574: Add CPR clock definition
Message-ID: <cso2vpnfn4pzppil4ojmqzlus4uxnozejfe6rpobxbyy6k7gbe@4yify6sgcujh>
References: <20240624050254.2942959-1-quic_varada@quicinc.com>
 <20240624050254.2942959-6-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624050254.2942959-6-quic_varada@quicinc.com>

On Mon, Jun 24, 2024 at 10:32:52AM GMT, Varadarajan Narayanan wrote:
> Add the CPR clock definition needed for enabling access to
> CPR register space.
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v2: Add rbcpr_clk_src to gcc_ipq9574_hws for registration.
> ---
>  drivers/clk/qcom/gcc-ipq9574.c | 39 ++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
