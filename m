Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16B82E9753
	for <linux-clk@vger.kernel.org>; Sun, 19 Oct 2025 15:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760888580; cv=none; b=RIw0Xa5tMoSS303TlulJH79/BbVrRy0Rn6RZktHnMwkBkOkZpSBGQe+BHrBcZsxnYTAVL4gJfsrcib2IJM6sJ3vEVC5V+1RWliC2+aQDmz0n7eHBahhbkwImY5BRThqAPLatvhCoc/OY/uQ77bJRRzqeHeckC6hVJzoAqzmGAFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760888580; c=relaxed/simple;
	bh=6yMIQ9DguSJe6ic+F9Z3HJRxEhmXjyWbpn76vKv2rco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=haa+OXJz120ToEyV5cJBpYNz2e2m3r1ig6ypcyDIXE/g+GenShnwlP8YiWIpZu7e0KpXMPUwG0NDqW+cefaRM8/zvQVHzwkArq1b/5H+igZUVo0srH3/IQIVYB3MH9Tr1y8+MJbEJAA3VGrn0QL9qVVm2ZArcmDWwVghDOFt5YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nnqxyGK8; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nnqxyGK8"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4270a3464bcso1522681f8f.2
        for <linux-clk@vger.kernel.org>; Sun, 19 Oct 2025 08:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760888577; x=1761493377; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kfxazAlKuk9K4Vi4FslEUzQq3LUxlBfoLS51oq9+lJs=;
        b=nnqxyGK84PItv9NaV5gzOSwYKQS591BBIxrrDkEQBWmsn7L+MbEFfCYO8l5zqXBrp4
         JeUEKv7itnsr4SCxRu/rodUgAnRdJRpjuxlKu/36o+a2pmWd3xOunz0whKc/9lziji6l
         G3kqhNLWNSqhGmmSCk7GUzm8UwZ6atQWdKtbZ8CovXQU6BzQkqhN9BOONETOkD8SocYY
         kTtHq6+wc/bgsUq78dZA8eEUmtUKcSS2tpsOAPG0LVbS5SJkZhreYHLbOiE/jCtIaj3s
         6IlMhLaFj5S3cEmHssf6M1XIUidb43wVtyMeayUNLEzr1sfM6AuBE21Qk4JAA8KZ5E0Y
         d0ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760888577; x=1761493377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfxazAlKuk9K4Vi4FslEUzQq3LUxlBfoLS51oq9+lJs=;
        b=PFEbUEuq8me8WXtte5a06EJQYSU+SaIDmTOacu9MYrzVpDnGYOanvNLsGaAocBafY6
         BvGNHJmVpL4bpF/EBN3l2ISNOn73FhdtbeEIwLl3doSG6Rly47AJKdQ2DllJeveebUyi
         uTatTDqhxg0SGvYno32FFqXxd368mNsFeTYtUGhaOtvBtA+tfehHowb9ud88LgpGUoqG
         q7F1BNFd9xgjlHB0C4+JMv0d9qW+Tg18GQtgBCDoItRdIie/uLrP7wwFQltSIPeZXmKd
         G0qnHiWSn5eHgpy/OGmbJoqWZ+ILDA4Dg5afX3WQB9c88uAei29dmdk7eeaT83U0wYBW
         /AVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIlKbQvpDCBsOjT7LtWy+TnnXSPxZp/25UWsyz2JjFR3LkxYQpLy8nN5yBpgAguae6G9Z8NW2Rv3E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFHs9mibaZ67uu5XbNoaCVXWsVt2Yj6e/v7u2V/WQUXZg23NrX
	rR0bynpGT2zqqFAk+HNZHW/E22TpwmLasq42kcJ33BQbaaAMkW0DGZVtC9aT2n8HE4w=
X-Gm-Gg: ASbGnctbOvFoXfUl1txDFS2seq3VaLnVqNCCC2ChNlrvSoi7+lsFLxY0PhuFFJoOy2a
	82FYdeNmVKyb2RDNkhiJx7WLM32xR7SWWgOi7bomdWSHApnBJ/OfJRwAO+/W1btQ6HPewny2Cri
	+k+3IDG6/E4QDK7Aon6jneim/AP0LcPRdv+J9TzUxppMFcthIiGL9MrwI/QEu0xA+vcRgRzU4Fy
	s+Yt7U8oM+sn/+prKgR+XKCZisUmv8EnXbHkoFbB7tpCMP0nhJjeejp+HEgL+jiOsk1tFaG6a5M
	PhEttuGKc7L8X5WfDZCkHzKrcFVHm6EPhm819FgPfnoUOpAkK1M0W1Z5qFnTS6AHeZHX4KSK1fM
	JNy3g4cetUG9i82ptA55DnYrryHh7iu4Dmo0/q/EdqOWjVXBkWICUTfwvVF8MvCLuxi8qCT63my
	F5uJjBTyw=
X-Google-Smtp-Source: AGHT+IG3+v2qLeP7l5LT+E1PZqMLuNyjQnEbtNq2tykfvKNcCgkn92fmgyAHFJDyMK3vS/goyWG6gA==
X-Received: by 2002:a05:6000:200f:b0:428:3e7f:88c3 with SMTP id ffacd0b85a97d-4283e7f8a82mr2908536f8f.50.1760888576985;
        Sun, 19 Oct 2025 08:42:56 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a96asm10812576f8f.31.2025.10.19.08.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 08:42:55 -0700 (PDT)
Date: Sun, 19 Oct 2025 18:42:53 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] clk: qcom: gcc-x1e80100: Remove 85.71 MHz USB4
 master clock frequency
Message-ID: <tqwmgsr5ilw7ao4ayuzi6c23n3qkgqn4yqqr73s3f7b3ehqjr5@5kn4h5bife6o>
References: <20251010-topic-gcc_usb4_unused_freq-v1-0-4be5e77d2307@oss.qualcomm.com>
 <20251010-topic-gcc_usb4_unused_freq-v1-2-4be5e77d2307@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251010-topic-gcc_usb4_unused_freq-v1-2-4be5e77d2307@oss.qualcomm.com>

On 25-10-10 12:24:51, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The USB4 HPG says this frequency remains unused, remove it from the
> frequency table to avoid any misunderstandings.
> 
> The reason it's unused seems to be that the lower RPMh level required
> to support it (LOW_SVS) is not enough for other pieces of the pipeline
> which require SVS, which in turn is enough to support a faster, 175 MHz
> rate.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
