Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBCD56448
	for <linux-clk@vger.kernel.org>; Thu, 21 Mar 2024 10:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711016927; cv=none; b=crECoiR0dl7ONR+7aMjS/jyRjozY+GEDJNr734wMtzmB3RKlqeCiMuUVtA1yAZZxmAmLP/SvJCTbhmxIb8KlbSg4Xroq9rcKyif372GujBfBjmEENw4J+GG1NO0VeHFrOsmQJoEtlaQPFIkTdqpojJhBf8/6q6aSVnM5te7YAIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711016927; c=relaxed/simple;
	bh=sBumMZut2B1H9SXaoSyAfz8Dv0/kDq0UpwwUBEyPe0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ek+0hyVvqWwBWoaautg+x6ZLF7n8nKbgfQmVMGx0q5KIOFH0MXeZuoYs9fta+fGowPNLMdFebHPickRwCEBbq9vC/g5usjEw1WPaRse4j//pbRtwSIUaTeOp7Rb2PdzGgzYz1lK9l2YO+AycWOtNeSERW15YZINPPild+icF7Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J8mTdNpT; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J8mTdNpT"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dc236729a2bso717292276.0
        for <linux-clk@vger.kernel.org>; Thu, 21 Mar 2024 03:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711016924; x=1711621724; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AKR4ns3MqNzj8KEDAsBBcau/lp94Er5oC4NBIHHopRs=;
        b=J8mTdNpTmNmgmLAbJhotmM/l9hg2Vxglq65OpP7TMZUM9Y7n3jVDwANjpqI+tcbN60
         XwCtEOb6aB4YACKbQe3J7FO5aCKkNpn3AAUNfCDXJuMXQ2D6ATRRW8k0YudUFZ2qtyDK
         rpwP+AAn80+AD6JxVCKSE9gee8YMH8G/kUJa6OduvuO9LkdYW2U/HFa+ThgSX/2+mh95
         vExkj+yu2DV6kAYlAUKjSQNhlzLiwr6W2qDqwIbKSPFDfGWIHYIYu4xWZiPkkQzkHtuX
         7AMrVKIs6+TH3KLd79nv79mDZV4ekVKrCn0Q5uVuaG3u68zE5dZaN2pUJOW8UoW4HZYk
         ga4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711016924; x=1711621724;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AKR4ns3MqNzj8KEDAsBBcau/lp94Er5oC4NBIHHopRs=;
        b=nWKgHPSZswnrpiUaepBd9VWHNZfxJ5jUdhdEoGcoudUA3F5+jliDGFBO48wOBPcgz4
         NUcD9yNBRqp5sbJK9187g4R5elAMO+IkMD6s2+uNi6A2DsNQqk+4orrz1s2QpGRv8067
         YMu2nsOmlom8jB3ite+pqYUJhBEnpGefHtK2jQipzTYmvMPhSOYA5Z9WgBofzdGOgHLF
         AbBLbnPoGTMElYJo5apfydS7VVp3A83lJATxN7dnetxsmDmOAX0S8al++GamZPcNcv63
         l4BrhGWunM+PNVy3ofG70H8CJBaqoDxv8sBlUcuOv3ojOyRn+3UcnXQ7i+SnGwmVgI+s
         TOiw==
X-Forwarded-Encrypted: i=1; AJvYcCVheK75rOi2BJqU1l7bCM8lqS/mP4IK8c+5I62wqrlEASWdsmvdoZZpA1f8kSxkkipEwcQSyEh8SmtTV9W74w6Z4vqdeN+3VWw6
X-Gm-Message-State: AOJu0YxQHh19bc9l3hLr+NNPFlSqhJO7ohFDOXp83NI+8ctfv5qeUU31
	odkOi8p6vS2tAMaYShkLb2r8r52R98DzAK1hLEtp3oJ2eyukGPzAnJDpvhveco+bZ7vhy+P9w34
	+m501dX4C0+MGLvSQW84r8eRV9YmVfWDBw9qC1A==
X-Google-Smtp-Source: AGHT+IETG/rfT4UCPwIL6SU4sfhZXcsh/0wacPA3Q09Ay/MZih0yDzYnOhnGRPnhcgYWqmzQjimC/j+kn1f7J6rQhK4=
X-Received: by 2002:a25:7483:0:b0:dc2:48af:bf17 with SMTP id
 p125-20020a257483000000b00dc248afbf17mr19150907ybc.62.1711016924700; Thu, 21
 Mar 2024 03:28:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240321-alpha-pll-kerneldoc-v1-1-0d76926b72c3@gmail.com>
In-Reply-To: <20240321-alpha-pll-kerneldoc-v1-1-0d76926b72c3@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 21 Mar 2024 12:28:33 +0200
Message-ID: <CAA8EJpojZonVnOLdmrVU2NQzJ4G0KOjVvJ2f4yCQ5Zhs1yu4UQ@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: clk-alpha-pll: fix kerneldoc of struct clk_alpha_pll
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Mar 2024 at 10:59, Gabor Juhos <j4g8y7@gmail.com> wrote:
>
> Add missing descriptions of the 'num_vco' and 'flags' members to
> clk_alpha_pll structure's documentation. Also reorder the member
> description entries to match the order of the declarations.
>
> Eliminates the following warnings:
>   drivers/clk/qcom/clk-alpha-pll.h:72: info: Scanning doc for struct clk_alpha_pll
>   drivers/clk/qcom/clk-alpha-pll.h:91: warning: Function parameter or struct member 'num_vco' not described in 'clk_alpha_pll'
>   drivers/clk/qcom/clk-alpha-pll.h:91: warning: Function parameter or struct member 'flags' not described in 'clk_alpha_pll'
>
> No functional changes.
>
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
> Based on v6.8.
> ---
>  drivers/clk/qcom/clk-alpha-pll.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
