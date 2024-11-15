Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8011D5CEA
	for <linux-clk@vger.kernel.org>; Fri, 15 Nov 2024 15:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731684753; cv=none; b=dZReOvHCF+bKP175dkV7UPKhPTf7gDDQMDSeRUE+auebruH0Y4N2cKddJpXaA24a4ec/QgmBfJRvMd41RqpgKkjePMdF2JTTQ7WbqoZYyWdrMzRgMEBsYDSGhdGqgM58ApBgr5aELZGtQ4JHVWBpFaEjwNzf8lCH1/qWLtNuI8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731684753; c=relaxed/simple;
	bh=0CFhd8gfYGRHeZj0ByvFZpXsFu0N3YQu237d8fhG4ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=amzgDx2cCC+kiM9QT7g1zsyVegawnfTnX+E/eG38DW8E948f0gwDchNRDHaR+PvKvzahtDxpAqV9TCqFtQ+A4YKbaQ2aqC0L55uGhfZkW/bzIDiElUlC8j6h4dCK4QlrMAnkPBOYAYlCeuFWXL67frwOkoUOrgPyMe4Xy8Yekao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=REjxyaZK; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="REjxyaZK"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2fb587d0436so19272141fa.2
        for <linux-clk@vger.kernel.org>; Fri, 15 Nov 2024 07:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731684750; x=1732289550; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BkWrPNuDCUOgiYdmMeZjioo9w/PMDYBkhAbCp9A1kgY=;
        b=REjxyaZKBXgOI3oeiOMv6CDC+LPiDlF9MsVsQGdr6/nMo1tvEnFG/aXb7EhfCnzP/B
         gBBOPXS+kwjJVlIWbZ1p9w8FTIKnLcIVXuvlFkePjO4/wFPQbhV9SfmZT+Sv8pQJjBEL
         Cw6cSZ75LMEkYJ6YRZiEf93SIW1tf1OQj6wbCWBF5QaUoRVHFn8sa8hicdmi5bv/GmZx
         yqVArvqqO4dOy+hWtA8Xh7NB9aiDARXTvO6O9KkMxdvZgfX+UTeZx5K4oO5Uw3G5A9r/
         YeBZe1p3S6R6Y1IoCN9ESRzfb2IhvTEsyJuY92ZoB6MMw9T2jUe/JuA4VFBOzlkMAO17
         +QVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731684750; x=1732289550;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BkWrPNuDCUOgiYdmMeZjioo9w/PMDYBkhAbCp9A1kgY=;
        b=KrDt5Gm/s5uC3ElzFY8IuZDx7cJbNBLrq/vz3pRcpgUlJY1igL3NAalat0/KBjmxrS
         sfjoVXU/1B3SXU1C5xwaanyYdF8g3YTlZPK8EXBowJmPgxzlzjwfYvq7Owd832twjW+j
         4QNVb2Yj5V8r8Tu+vtdYZO8TouvtzGtEv0wQD0qLoRRS4AURDW/Igl4Dw6Md7bj9K40F
         Eb7gN2cPcV+J6RbbLQVtfI+/tp3cslfh9iEnhmlFQISbfGmvixPT+MgjM4xuxlClGwlj
         ak6Q8yGI3pQnSIqxdpU1HBmgYyaSSMznrLL69n87G3Z2DbvBFLXET3ehksrAhCrUtkYw
         UkRA==
X-Forwarded-Encrypted: i=1; AJvYcCW2z2Lx85y1RQ0k6PldAmWu6oTg7iTY8v6j1QYC02o+KcvoCbTtr0p4tBnw/MT3Rb0dmIwlwdltrK0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq5hTZjyv3i3jS90b0dhl8k7RVAN3Jp3oab4XvWz72DDVVa+cN
	ao02+w0+tLro/hWas7wD6jQ/EsC6Rb288SVB8gjgKbw6LJm3sTQPDCQziLsWb6Sfa4VM1O3x4vb
	B
X-Google-Smtp-Source: AGHT+IGwLJ7C85eX9ZxZjDgyQVwDz8bkc8hUQciSKzJsl8DWhYz3jPoa/azEUS8h57Jj8O3ZjWfgxg==
X-Received: by 2002:a05:651c:1144:b0:2fb:3e01:b2bd with SMTP id 38308e7fff4ca-2ff606a8b78mr21256531fa.21.1731684749655;
        Fri, 15 Nov 2024 07:32:29 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff59896e30sm5836551fa.115.2024.11.15.07.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 07:32:28 -0800 (PST)
Date: Fri, 15 Nov 2024 17:32:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Trilok Soni <quic_tsoni@quicinc.com>, 
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/7] clk: qcom: clk-alpha-pll: Add support for
 controlling Taycan PLLs
Message-ID: <iupphuswrncjbkopirlodb4d45qvvu65cl4vyyqqmuv3zouq2a@cnvooym4ouh2>
References: <20241112002807.2804021-1-quic_molvera@quicinc.com>
 <20241112002807.2804021-4-quic_molvera@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112002807.2804021-4-quic_molvera@quicinc.com>

On Mon, Nov 11, 2024 at 04:28:03PM -0800, Melody Olvera wrote:
> From: Taniya Das <quic_tdas@quicinc.com>
> 
> Add clock ops for Taycan PLL, add the register offsets for supporting
> the PLL.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 14 ++++++++++++++
>  drivers/clk/qcom/clk-alpha-pll.h |  7 +++++++
>  2 files changed, 21 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
