Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1434C13C9A3
	for <linux-clk@vger.kernel.org>; Fri, 20 Sep 2024 10:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726829334; cv=none; b=bOZ+tyslNLQeGermK4MhyMcMTXVmQvkyekl7BuvA+pzLBoXqgrKDMG/pLL52u7CzsP1IghxlVWnoWVo6HhHTxjK8fDxIKXVMO4mnGYCKyOUhxH/Bt/agfPA2KArRX2T1cHAugcBwzQLhqVdX8z2TUMqP7ljTFnY3zYGqxtwQFlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726829334; c=relaxed/simple;
	bh=dZ4/ujZpQbCpyXCntr1AGF7SI+Rv8E8hhQze7yJX3o8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=js2cV7wfFv5a6cgKw8Qqe9IS3vXQyWlyBCCvfoKmhI5TypDl6OqwfxEnlvQePBm8SpiBLQufA45RzLuLl5joCaBZFW6gFIpNtmMXjA4NlOJzR0zMacVeyTDwE/i7gS1x4xIluwkjuJqp5cEoRR/9sAWiKr9TUEpTQ5JVJMbZ+og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BkkfnsZ2; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BkkfnsZ2"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f75129b3a3so20179451fa.2
        for <linux-clk@vger.kernel.org>; Fri, 20 Sep 2024 03:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726829331; x=1727434131; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KEaKZbC2ikTC9wCBaKId7vvau6vAXgNDzN70KcRD24w=;
        b=BkkfnsZ2KEy7WtdvNGhmNnKZFOX7OorijKk6B/f3cBHS1WpdqxJ7nJz3B5vv07+R2o
         wiZSSXC2XnN6MdxX7oEdzfu81LvHAcXbeB+PVS0ss4LhzaoMgHHa4JlbnLoXnijx/vPE
         7tfp5lDbJ/FnEqERBZZk6/Ekb5Ofg9pAhesuxXnHVJUr/KaIsuYEeUaQm4t5XAe2GnEh
         +kZukPeY0Q0qqNp6Fl3js+Sy/MrI2kBYeWEP9tsobjDlFpsK7GScGt23R6a8N5FSV1L7
         M+cO8TR8vTpDw0qorqTk9a7TklESYHD+m+BoV66IxUOJSfE77MWd7LTwvRAxD81q8GDk
         EP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726829331; x=1727434131;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KEaKZbC2ikTC9wCBaKId7vvau6vAXgNDzN70KcRD24w=;
        b=BnX0D+QtIoH1SduZKpErwiw6nEZvNh6BHlGxy4h6VFBVvOi+nn2q/TiV7YCUfe0Mug
         oBMS9tt6rRem5vwcVbRZ3x2+tZnbJq7FangUaUyW4MePndOMM8CqOdh/h10wzr7Ym9w+
         JYr9zsMKgOyJ8Qg/EDC5oIoBc6Xr7tHMtXuM/BR2sUyfbSi3a+WtvK52Hp7p8rQO2Wht
         IkCuqYGMvMH+BqyY1qNtpUC5D8emi1+tKd4um4c8MYP8NIaf9hTYTFVX8qWJQGtzYEGu
         ZkTRhkZ/GIOa81maoByX98bQQOcNHCNTdaIbOO+1Z4khbQixrM4jLq4nQt2NHd5LxxGK
         biFw==
X-Forwarded-Encrypted: i=1; AJvYcCVISP8KYZFr7+zAhy+BipGSfbPluP+tlRWc5TwXWf+Z9qsSUia/NP27JtUcJZHKBQA09P8Xwo3D3pc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZh8vPeU1ZJ2Fxf6Q11l7oQB5HADbRhRFj8Z62iIzDEIGzj+tz
	rTVctJyB45PT3UXRe3jSz8SalqgGVWbp+BOV36+RdX+QXjySSsCFKeszJGsRllw=
X-Google-Smtp-Source: AGHT+IFvd7/6+jQCXzW+8cOE2HgQQSXqm7oa6E2UoDj0bBvS7WK9wGBNR3rLkjkZnrprPAtCOotFYw==
X-Received: by 2002:a2e:701:0:b0:2f7:7b34:285f with SMTP id 38308e7fff4ca-2f7cb2f926cmr10296501fa.20.1726829331003;
        Fri, 20 Sep 2024 03:48:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f79d2e1dd6sm18989041fa.11.2024.09.20.03.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 03:48:49 -0700 (PDT)
Date: Fri, 20 Sep 2024 13:48:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] clk: qcom: rpmhcc: Add support for QCS615 Clocks
Message-ID: <7xc6qxkonbioivbgn6nbs3kiewsnf6iemm5rxlblbp5bwo75do@zerort4eagf6>
References: <20240920-qcs615-clock-driver-v2-0-2f6de44eb2aa@quicinc.com>
 <20240920-qcs615-clock-driver-v2-2-2f6de44eb2aa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240920-qcs615-clock-driver-v2-2-2f6de44eb2aa@quicinc.com>

On Fri, Sep 20, 2024 at 04:08:16PM GMT, Taniya Das wrote:
> Add the RPMHCC clocks required for QCS615 SoC.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
