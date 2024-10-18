Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D6717578
	for <linux-clk@vger.kernel.org>; Fri, 18 Oct 2024 12:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729253047; cv=none; b=p0uqRXcCVj8vVOuXvFiUPDBftGiCOFLl+rG/N21iRxdi+Wc0u77882Xy4juYYAEq9P7U5n8CNJZxVJb4QCKLQFhcGMF8qxxKoYuKETqkY1KdqsmrBKTjap9oQI/w/5Xp1sfUMKwr83Y2NWa70E/dZMsr7CYpuSDXHUAIvNt8KRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729253047; c=relaxed/simple;
	bh=G16VMFkYo1lJYiUjqoV5uhRSbc4X8d7pUahQxY3PU5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dAoR+fKQlHpAX/f7Sh9fjo7dEVHiKLgNRivsdCQGjqscSgZ/32/k1Gibnf63V1ajnFdbTHduCmjPICLGlidkpb8covRJwMYTUTzdlCCo2DHrSZ87f3tjdaiNIheBF5/om0MqnylSlH3HYSWZCuFe4EYYrN/THyJzVhIWHIi9NQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P863KZue; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P863KZue"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539f4d8ef84so2300201e87.0
        for <linux-clk@vger.kernel.org>; Fri, 18 Oct 2024 05:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729253044; x=1729857844; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bfCb0bhd7A40KUaBz9hRRbX867xrYglHoInu7Xbi7mI=;
        b=P863KZuerXkZdbLl5rJ/cHc3/qW1KoLQ/hNwp1zw22XA0Rqu26VhMQNshyHfcSvAO4
         WydpmmSZgTuAmoFauANM6hZ9/NfDXWp4tYmmF89zijPUfDcDabBaMkhqPpQ73HAUDskW
         AWMOI/TmCK192E/8P5XJ5qK5A2KzcTqPmAdLAhFQyRQrcJRSnvc+qjMDWgP/NVUcdhPz
         bZ8/fFZr5xwK8MdwUG6FY+24GNyalMs1Qod3C9QFpe1+v5MpMDrlCJoTmO4l/SV9LU90
         9kUWhYltEOfip8qPvfRvF7G3kLRoW4tPJvypVR6bPtjFHPprCMUqq+vDyeOF3KgFDh6J
         uxoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729253044; x=1729857844;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bfCb0bhd7A40KUaBz9hRRbX867xrYglHoInu7Xbi7mI=;
        b=VgPijZ8HHE/lG6n3FLQEGcrXD/9n0VxQLVsGp9acSt5w2hXVt0xz0Wt1Z81zfcMfIM
         Z3yxxgwqVMM8UfIxe8jT16ioYETmKUKNCtCnI0Pv/QFzqmpZmekOOtajgCxMrjlW1lp2
         fF+TEPwfgfCCKNlZ7o1TVAkWcqSQS/QkMctguCqPZnlub5VEoQjYMU/U9chtVHHHGdqf
         OBM+3aEq+aXWXYIbFAsYs5v2vWXoy0LmKfbZG9y/1dVOlNpKCo9lnlJyp1Sw5vIeo3vi
         OlUT64k/OP1fbq0eqLXKkMS+kf/MVpdl6dZvGkEF/ZQwYQbpqk8EKCug2Mpmz4OpZYG9
         jj7g==
X-Forwarded-Encrypted: i=1; AJvYcCWGK9eK1NQJM7HUGzF+/AtOp3KPe8xdaXAtpKQDIMTd1g1Gu5qknMZu0oMFuzXL1BatY0JdSzCGQsc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZxsamCS4mXM5leeYXzfBJiHPSCOnxrhXedQ+WNlqIF/N4Ce+4
	Ifdp6aCFzAVskxck+JG+hsprL3wCNJAtVw/hsR2UvmqP5cfowSCOGMEmS1qpwb0=
X-Google-Smtp-Source: AGHT+IF0p+EHb3y6Bb15TCfxTx2WBchcnW+np0ZaXW6dvAlcadVgamxMd0Nd/+bgKh+CYw0YxRaxNQ==
X-Received: by 2002:a05:6512:39cd:b0:535:699b:b076 with SMTP id 2adb3069b0e04-53a15467b88mr1514958e87.16.1729253044002;
        Fri, 18 Oct 2024 05:04:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a151b00fbsm203981e87.31.2024.10.18.05.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 05:04:03 -0700 (PDT)
Date: Fri, 18 Oct 2024 15:04:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Imran Shaik <quic_imrashai@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] clk: qcom: Add support for GPU Clock Controller on
 QCS8300
Message-ID: <l53g7hbjxg2fe2rezghearuf4bllem5ubn2pn6f4qf2nd3wthg@v2a7pd5zquns>
References: <20241018-qcs8300-mm-patches-v1-0-859095e0776c@quicinc.com>
 <20241018-qcs8300-mm-patches-v1-2-859095e0776c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018-qcs8300-mm-patches-v1-2-859095e0776c@quicinc.com>

On Fri, Oct 18, 2024 at 04:42:30PM +0530, Imran Shaik wrote:
> Add support to the QCS8300 GPU clock controller by extending
> the SA8775P GPU clock controller, which is mostly identical
> but QCS8300 has few additional clocks and minor differences.
> 
> Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
> ---
>  drivers/clk/qcom/gpucc-sa8775p.c | 47 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
