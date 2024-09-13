Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0501DA0FD
	for <linux-clk@vger.kernel.org>; Fri, 13 Sep 2024 12:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726231202; cv=none; b=Qh8E6wo+pjae616nDlJcYbCzWJY2g7PJLesNyr4wCdH1YbZl/yjYqmVjLv0HniaeYtRqXXI0WCflp4Q52qymFBI4gajIYk8Yf12f6RVxckXqOlJF4YATCcRSFrYh6HiGFdGTF/fn8AlmbMu+j70r+gJcxbdQYKJR4TdptQCLSpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726231202; c=relaxed/simple;
	bh=hztMeMM1qCriyo1fCCjrjQS1iGtiCvXmTAMGzfOehHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nKEKkBgIzqHmr3dQp+N4hNUylONPmZuzI5KFXg7559aRfCAQr8uRHa/mI5uwY9VBBXB2C5BKKU7rfbicezCxB8hhu+BqVkSb4Mn8zFeiwYKkNQ2XPjBx0hA7K1BxL/cBYtJv8StBOXjHrUTLQTj+C8k+7AaRLZyAqoiCc1n2bgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U4sC6Zm5; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U4sC6Zm5"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5366fd6fdf1so2849466e87.0
        for <linux-clk@vger.kernel.org>; Fri, 13 Sep 2024 05:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726231199; x=1726835999; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a/eh4g1pBfcVaclixyeWzAYTvF5fM6tbBPcl9T1n1mk=;
        b=U4sC6Zm5PqiPHtLb1C2yNYgdATpjD4wL6T/f4ni1f0OrXngLJkna8gWkxXnQ5JeEgc
         9SHUCZs1IxGz0zoX5Uh139e7ofgz6B+lkjis6MtBUkU31PF8tru3h1FKDorU4+rfovdR
         hDBN24X4qOk4Lq3CDJkF0msWZQTvp29hZici2dXLgkzZaVc/4Vm0vjw+tCyAQgM+YLw/
         +WgNwafrEEnf2DSY4zqIQw8I85bNTlql5FRYJgAJyHfmf4rY6r9lJuAU01Uwlz5X3QP1
         4dnhj5U9w3NLmZqQb1F5w8DJ4Dwwdv7smaKY3csEfT/zEQCS9xUD2RnYMq+R7KRvHrMM
         St4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726231199; x=1726835999;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a/eh4g1pBfcVaclixyeWzAYTvF5fM6tbBPcl9T1n1mk=;
        b=Leos784JeA1gZ+pIZDEgEPf6v6km6Wbh97M6sF8VfepmS3VlejKYcTZVHT9259ehfv
         /pfCVXUb0gXYjeBF3m/fKG5XM8zwHwSq5MZ5dR+65ft06ES943rfB+zxcODqOLISigBu
         0SGIQGHGuwuom/sBtbkUrBQ20i8/a0AKLeg6DmYpIhxTR8eQsUBCny+EmqSw0KmgwtCR
         j0ulcL4KEHvVzutp1upgZl8h/E+WEyS4KTXixDZszcMOA4KPJWTGG+1b2ve3PuHCdwYO
         ZeQVlwPaS+sfM5Wc41jfJzYrMN8DkM413tpibhw+1SWunUtRdKEuMYX5Ux8OaC3sjKpm
         EVEw==
X-Forwarded-Encrypted: i=1; AJvYcCVSYtbNsEoj6XJeshF5lxaoMAICQU0qY6I+duBVMKC6gVcSC56bx3DD8fVWDJmZzysHunlxBKW1tRs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5+oj6h4SLo7GIUuDTy+nUCXuhJpJQEjWN4J9DiUTRJ9jg+L6O
	UxjuGG+5Ou/Cf3ONLSurtArPBqMBKFwotv0hPpKsoCCsxLaEYJNZQfJfgyD/nlM=
X-Google-Smtp-Source: AGHT+IGF8/okjNEJNbENv2WyVE+pN5ByLnMfk4sOuuiGymoDntbqVYCR2vaw8GBVD7i51Vqu3U49Sg==
X-Received: by 2002:a05:6512:3e07:b0:533:4522:7409 with SMTP id 2adb3069b0e04-53678ff3285mr3614089e87.53.1726231198189;
        Fri, 13 Sep 2024 05:39:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f903bdfsm2232338e87.210.2024.09.13.05.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 05:39:57 -0700 (PDT)
Date: Fri, 13 Sep 2024 15:39:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sricharan R <quic_srichara@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	ulf.hansson@linaro.org, linus.walleij@linaro.org, catalin.marinas@arm.com, 
	p.zabel@pengutronix.de, geert+renesas@glider.be, neil.armstrong@linaro.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, quic_varada@quicinc.com
Subject: Re: [PATCH 4/8] pinctrl: qcom: Introduce IPQ5424 TLMM driver
Message-ID: <rp6hhamsqwtneyfrf6lwrchd4p35blaqzgiq66wfkn66xofbar@7dgexti4qs4u>
References: <20240913121250.2995351-1-quic_srichara@quicinc.com>
 <20240913121250.2995351-5-quic_srichara@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913121250.2995351-5-quic_srichara@quicinc.com>

On Fri, Sep 13, 2024 at 05:42:46PM GMT, Sricharan R wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> The IPQ5424 SoC comes with a TLMM block, like all other Qualcomm
> platforms, so add a driver for it.
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>

The order of trailers is strange. It lists you as an author, but then
Varadarajan's SoB comes first and yours (authors) comes afterwards. If
it was a joing effort, please use Co-developed-by tag in addition to SoB.

> ---
>  drivers/pinctrl/qcom/Kconfig.msm       |   9 +
>  drivers/pinctrl/qcom/Makefile          |   1 +
>  drivers/pinctrl/qcom/pinctrl-ipq5424.c | 792 +++++++++++++++++++++++++
>  3 files changed, 802 insertions(+)
>  create mode 100644 drivers/pinctrl/qcom/pinctrl-ipq5424.c

The rest LGTM

-- 
With best wishes
Dmitry
