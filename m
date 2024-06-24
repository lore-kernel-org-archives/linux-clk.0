Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A31136649
	for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 11:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719227405; cv=none; b=KrjqGAlpbpf2e0SOchRFdNfjXUBuMA2Fkbp7olfO8f5b8ijVb8AwnR2cJvGGFWm+QUOWhGQSnXJaMYzLgppT+EFCYttJxJdeswd+l6sxGe/EuSFK2gGIn7+RduELkwL4NQeCK7H/+ZD7zX66O1hQg7/DwXI+I2SHZYoJILFnkQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719227405; c=relaxed/simple;
	bh=AD1VtzVCE0TJ9OF4Gv0gbV96kcusmSBZgcLK8llfDL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O0BQBM/6pwFIr0rCP+hpbW56l6/vVFtcFfCUDBKBV5Mz5Hvogqzs89Sl3TXDTopge47dz4j+KvsZk4+SSEQhfY8hRdn6hlIkj9R9Dqp3Pv6o+Z1bc9gbmZcReaQjJNZBoNZ0+u0pZzd21ju4yMurb1j3j/pYJRn47gVyVhxwL/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bWwRp7rA; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bWwRp7rA"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52cdbc20faeso2791994e87.1
        for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 04:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719227402; x=1719832202; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T8tSU0GAEUZoLkEFf7w79CW05hil/2XBKzKpS6M/7QY=;
        b=bWwRp7rAcHoKohBA+S1fXNYPJHF1DWJB7afiffpwELVSB+5tqE3wqUEcYgWt1ldGUO
         yCA1A1rRtrghsdhtgPDjDCbht/lkrTGzbpRhwNw36NdipkbEtVILCg/BI3U97+1yfe+t
         xYt7NAWRSsRBdr9p6X1IJI1RXW/KocRlPiLjUCcYvkCerR7JK0FvdXM0sG8ntSvAn0Mk
         KWy83yoc76c0b2/cJq9/WJohXad5B8lfcGp9uUm114f8P+qeoSzKaaANuCD9PB2h6j5e
         +sGXlz5gufbRw2WXXCOhtCzpI4dUgJl+cDl6HxgWDxwMP1IkuMzgq/LBzlxpZCZ0GY38
         UDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719227402; x=1719832202;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8tSU0GAEUZoLkEFf7w79CW05hil/2XBKzKpS6M/7QY=;
        b=rtQIkS0qiKOeSZ2PFkaEga2yrcuKszuz6CwNt8ZMnRwhOxvesoUS0X7+IVLWjKzhcd
         diIzLvSmGWUdaCb9Yv4BKF2o7v+9FVhNUcNU9j/NNPP/Z2jH7zRHBxGFyYNAYYBXdDVu
         n5Bc75/PaeZYeAwVxfm0htc6szafXc34n+PmXHY4JrT65seAJb0wdR06ALQVrWeambLz
         MSG5oaoK61WlMU4SQfX8KivaBmKw+ABMdZYgn0RdSwV5bb4snglGiprP/JLILROx2voo
         YA4+iRs8Wxx+enToXNgQCy2Az4d+iJiTquXteC78EiEd7ZAQ2rNaVBPq6e9YW/OJYlmz
         m8bQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKF0qGT9O+UAizyTdshvS3zRgwckR6s+jXHVwc+ffaQeeSHwaeEYBUXIEJJtJ3BBfAUdKBtzqJB/q5zStjG2KvbrGZhBi2HVO3
X-Gm-Message-State: AOJu0YxloLrxGTFTFRlbe0rfEMwZh2Egutax0Zstq3ROj55ZSmek4tzk
	zLg4A9P/u6N1it+cjEjbK6Prx4dQVblM5WMrdQAMA6V/zEHd3mFtQri65ozDSBI=
X-Google-Smtp-Source: AGHT+IGzuF4UMykQ47sI9hyqTgZzQSukllIxeZ9vAheW6vdrszmQVfCDHhejrRkJQpptDHWPTfMrHw==
X-Received: by 2002:a19:6454:0:b0:52c:dae5:6511 with SMTP id 2adb3069b0e04-52ce18345a6mr2382105e87.23.1719227401721;
        Mon, 24 Jun 2024 04:10:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cdb4f3726sm826433e87.204.2024.06.24.04.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 04:10:01 -0700 (PDT)
Date: Mon, 24 Jun 2024 14:09:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: x1e80100: add soundwire controller
 resets
Message-ID: <pb25qgv6c2fb4vjby7yiqyorzqft7oyuucotw5267bshgvw3rg@4wry5qxoubhy>
References: <20240624-x1e-swr-reset-v1-0-da326d0733d4@linaro.org>
 <20240624-x1e-swr-reset-v1-3-da326d0733d4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624-x1e-swr-reset-v1-3-da326d0733d4@linaro.org>

On Mon, Jun 24, 2024 at 11:55:32AM GMT, Srinivas Kandagatla wrote:
> Soundwire controllers (WSA, WSA2, RX, TX) require reset lines to enable
> switching clock control from hardware to software.
> 
> Add them along with the reset control providers.
> 
> Without this reset we might hit fifo under/over run when we try to write to
> soundwire device registers.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)

I doesn't look like this was tested against the bindings.

-- 
With best wishes
Dmitry
