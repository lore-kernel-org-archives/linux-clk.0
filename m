Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07A7212B1A
	for <linux-clk@vger.kernel.org>; Wed, 22 Jan 2025 15:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737560325; cv=none; b=fedfw3RS9Yp+bAbncOQXs+PVENUJkQUwcCkOlzgz6BzGEfQ1l25aWHs6CEASb7KO+3Xmpnm9ISoPPF3J3lbXUUAZBA6MKKQ0bLx+dIglzVUxG++XCjtO/kno17Eyf8NMI+kZGO9o53aQnfrZ6afskXNdhdf+YYkaySLxml4OtBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737560325; c=relaxed/simple;
	bh=xYKMPTuBDts6tsHI2iDmnq6xesXtDwIjCgZNrXOuqTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a9J9Jfx7hQug3sytY7NBoaz0zEWfAUkMVli1UoQ0YIghER0DzAVlY94/QxZCja1x3mnwsOHprAnrBhmAYqxstHBZSMRPMgHQAs6KuxfyRU7hZmLXPCBvQo7hhCaSOxurlWqQl0RYFm63HI250BQHoPJUwTmWS9HHHI4FIzu6F4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HsNU0d96; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HsNU0d96"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aaec61d0f65so1480928166b.1
        for <linux-clk@vger.kernel.org>; Wed, 22 Jan 2025 07:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737560322; x=1738165122; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bQ/UGr0IGpTF4zgyCNABJQGGulQl+wyvTdTpCyzBgc0=;
        b=HsNU0d96PQS+ZT4c9eN0c/wBr+SYlqRgsDow7XI3TVwQXJllZcr100P8FBOXNE3Hzh
         gKSm94nYCu3k7OXEIv/Rt5c+ZJcg/zRZijfoQfilfnU26vyKWEvmgwXTjs8g7lXfNXPI
         4MNShqvEbQcs7uv2Mt2g6/biURv5W0G1i0N9okzuczyRIzgY2UN6TPFaF7TV84mfbyeX
         fExCjV64evwDvsA/gPZR+8nrer7Ljtw+2bzoV02fjS0n+0vjR906BSAjQP4H+A92pTzf
         4BFGA4YlGMs0JUybjVp/iDc7UHuKJLFC2H/91AIdnblnP00OpktOVGuRx4nJOwFJsAa3
         pqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737560322; x=1738165122;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bQ/UGr0IGpTF4zgyCNABJQGGulQl+wyvTdTpCyzBgc0=;
        b=NSm1yX5sO5cS+yQqYY0mZuZ9lesGVG7TUxjCj9MRo9u9P+WM+waGGcFc4pSalSemXd
         1PW1HY/NvThYhsaDpZBA6kVFjXwsP9v8ZVfuFlIZyd5phJWsj7I5TqVXz/Mfr2XRm/CK
         RU7a89ZpMOB+yPPvJEINch3AiYwGFj8isOzM30rGP+AK0DE6ZdCZ+noQOoYxF6gIEJSw
         kv6CbAAKEYqf14gGNs48c6kMDskrNB4pyJKQ1WZQCkUsjOMYtIwqEUeX7cdRBUDfidw2
         3HMGDQPjU8zm++LMlrDFpdJoLKNfy5eW6wJjBYe+3k/fazPQ6jo6v5JhWP1TQE2B+f6I
         OEpg==
X-Forwarded-Encrypted: i=1; AJvYcCWlpvRWebY2BkYHdVpvOoaQ3kTy04jlof5i07y0AGYoskDQEcTyLQq3A279oZpBKi+X2jPdu/twxxU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKOxUL+SuCOUOyggaLEF+QHiIsTdDn0Ld4QOii6eVbwwXTAyqn
	6ItkFisvexHdI1st5WB/GSEJlV/JMvkC6rO89hD7LdisC3VsvghpZj0vOJm0ugD5+7uuh58qjU3
	/Kd6cpUgmYZZaSn7y2s6Q5x15YJL5nBex+v+Lfw==
X-Gm-Gg: ASbGnctNnny/LhzRQsKNaAOzadmyFT8PpTPFbJzXC4A+lXqLmeXbWcXDXV4HIay838b
	Haq8XiPe67CVbw1luK0P+cDe/5EeVpLFemkVS09gku2zL7NLxwMQ=
X-Google-Smtp-Source: AGHT+IETe7thCSCpbowi9b632hZFutI2WPKAcE0XCFKit3ktxcH+m2wBt0ggMcEmf46PQAkItYj8rzjojIKKysN3liI=
X-Received: by 2002:a17:907:980b:b0:ab3:61e1:9b06 with SMTP id
 a640c23a62f3a-ab38b0a2221mr2259438766b.5.1737560322096; Wed, 22 Jan 2025
 07:38:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113-support-pll-reconfigure-v1-0-1fae6bc1062d@quicinc.com>
In-Reply-To: <20250113-support-pll-reconfigure-v1-0-1fae6bc1062d@quicinc.com>
From: Stefan Schmidt <stefan.schmidt@linaro.org>
Date: Wed, 22 Jan 2025 16:38:31 +0100
X-Gm-Features: AbW1kvZRlPPxGJ_AeXkZFPES8Z8xuCbPMXteMeA5f4p_3jWBu1lE4xY8dVXg-1U
Message-ID: <CAEvtbuviH+bGNz1dEPKXTbBD582hu=us4aiFyo=zHqfRw7+YRQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add support to reconfigure PLL
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello Taniya,

On Mon, 13 Jan 2025 at 18:27, Taniya Das <quic_tdas@quicinc.com> wrote:
>
> During boot-up, there is a possibility that the PLL configuration might
> be missed even after invoking pll_configure() from the clock controller
> probe. This is often due to the PLL being connected to rail or rails
> that are in an OFF state and current clock controller also cannot vote
> on multiple rails. As a result, the PLL may be enabled with suboptimal
> settings, leading to functional issues.
>
> The PLL configuration, now part of clk_alpha_pll, can be reused to
> reconfigure the PLL to a known good state before scaling for frequency.
> The 'clk_alpha_pll_reconfigure()' can be updated to support more PLLs
> in future.
>
> The IRIS driver support added
> https://lore.kernel.org/all/20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com/
> observes the pll latch warning during boot up due to the dependency of
> the PLL not in good state, thus add config support for SM8550 Video
> clock controller PLLs.
>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
> Taniya Das (3):
>       clk: qcom: clk-alpha-pll: Integrate PLL configuration into PLL structure
>       clk: qcom: clk-alpha-pll: Add support to reconfigure PLL
>       clk: qcom: videocc-sm8550: Update the pll config for Video PLLs
>
>  drivers/clk/qcom/clk-alpha-pll.c  | 30 ++++++++++++++++++++++++++++++
>  drivers/clk/qcom/clk-alpha-pll.h  |  2 ++
>  drivers/clk/qcom/videocc-sm8550.c |  2 ++
>  3 files changed, 34 insertions(+)
> ---
> base-commit: 37136bf5c3a6f6b686d74f41837a6406bec6b7bc
> change-id: 20250113-support-pll-reconfigure-9a9cbb43a90b

I tested the full patchset on my X Elite Dell XPS and can confirm that
the Lucid PLL latch failed warning is gone when using the iris driver.

Tested-by: Stefan Schmidt <stefan.schmidt@linaro.org> # x1e80100 (Dell
XPS 13 9345)

regards
Stefan Schmidt
