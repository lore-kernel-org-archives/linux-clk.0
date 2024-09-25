Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36391D5AD5
	for <linux-clk@vger.kernel.org>; Wed, 25 Sep 2024 21:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727299727; cv=none; b=q3Wof/PmXxPlsyNolFZIouriuKd6dN/g1Jl0LBwesD367u4Glu4xqYiouPaf6+HPPQfIjgWVEmGJrRchvYEjP9XgJXgbv9/JYUpnbKw74D6LI/tG2NHdC/HASQpRuKvhpagin6TJr3wH4MuIhfVwIq41iyfJa+FOVKtltVT5M5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727299727; c=relaxed/simple;
	bh=WucR+djirwpM6STmHdVUy4UR5ERz2gZtg/GRT0C4+GM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JYGvCwM6LwUOZSK5mjYaIwMTsI9XqsQ+QcTv6YE2PviP8VRYmyc40s1yJK6m2pXnFutIq3S0JM92OIT5tS5wdscaBf21OIIG7rV4m4Q8NaW/jFMFYU/cSMRc6H8EqGcGpgm9LpU0ZVzNlfzArLVyb6NddfbItsJ6eN91I+ldfMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M6P9byp+; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M6P9byp+"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f75de9a503so3198371fa.0
        for <linux-clk@vger.kernel.org>; Wed, 25 Sep 2024 14:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727299724; x=1727904524; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gwTr0ZjzKHD8edFYUSKF8PBtaT++xT7YsKjfFnre+JY=;
        b=M6P9byp+++VgGzj3JjemOtwY976DKBqxqAII/DgM4aNnkiS1sYNXCw+EUwxQTkvLAT
         GG7TQdk5sgipr9UPMLraayYGIG5oki9x9QDgJeuoWeh29mCugfrLacEm05apNh35PD1l
         vvfE0QgUQEOfNwNh28+LSn/BxBGuhIINM55223ygPTzZvEwy6QeM4uC55l4iJB5AGkcV
         xtTW+eH4E6Dvli43X0wilQ/PLPUDEBPkpguG86UC5pyIDb9Mnp/DyGG5jL7TQ6kFzVVZ
         GEPd/g+OQ8TG8j1w3asTDgbMMmHBxkK9QS0glr4yk76+TF3MFli6Oec8clg6+rUdwMaK
         5hgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727299724; x=1727904524;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gwTr0ZjzKHD8edFYUSKF8PBtaT++xT7YsKjfFnre+JY=;
        b=dsSCXMNkddMnCdKHpG+TMzp0JdxtOZ6N8f58ApvUx6Tdke+a7BruIQtAV7zYxwD86O
         rWSJsG48igrh82+gF9KBVA6+bbT4+NmTbj9RyO2vvDlaGgkBy40kmMI8zOkDZHU9hPwJ
         P5H9VGHunVSTiqdykesKD9wWaLHxnJTDKI/nrdpHNUc8QERvQvkocUukceng5lkI5duH
         rgNJzsLSfqOfMYgnRrHKDvUdogIlVXEI4NwOQnGo6T3OVXZn9Qq81GToCaD4DwlphSJg
         p5VyDXedsleFbk4qjGkN1Xzyr/BC35ZMi9Dq9Y+3c44JCGgILph21DgRouFCAwXeJyl0
         zpPg==
X-Forwarded-Encrypted: i=1; AJvYcCXuhkca6uyw2wyiFsLY+YCJTq6iR89xtQ3MP4xB3OjU3NAZMkIuXfJnf9zjKQsWcqae1A/2G86t4Ew=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoycjNpOeaJDj+J4K/w7uqk6ugbaDUrAe3dn0zpb3+vUSwewq+
	Lv73cwMLaak9iluAsvSIlUalxu8FN+brXqW0Xoj5vRLr54mU0Tu/ku+oVz6Ki28=
X-Google-Smtp-Source: AGHT+IFr4Ny4+GpZtXRbkLD1/XaxRB6oYcW6d6Gw9eijaSV1QXJ3oFhYYiPUQKPns6/AJEWKpEWAAA==
X-Received: by 2002:a05:651c:2117:b0:2f7:4f84:50a2 with SMTP id 38308e7fff4ca-2f91ca426ffmr26443491fa.31.1727299723711;
        Wed, 25 Sep 2024 14:28:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f8d283bfd0sm6173091fa.42.2024.09.25.14.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 14:28:42 -0700 (PDT)
Date: Thu, 26 Sep 2024 00:28:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abhishek Sahu <absahu@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2] clk: qcom: clk-alpha-pll: Fix pll post div mask when
 width is not set
Message-ID: <jlmnxzkferigmhh5akcr5uumrdychjxyy2flftx5u2sg2w62aa@566u2lqj5od2>
References: <20240925-fix-postdiv-mask-v2-1-b825048b828b@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240925-fix-postdiv-mask-v2-1-b825048b828b@mainlining.org>

On Wed, Sep 25, 2024 at 08:33:20PM GMT, Barnabás Czémán wrote:
> Many qcom clock drivers do not have .width set. In that case value of
> (p)->width - 1 will be negative which breaks clock tree. Fix this
> by checking if width is zero, and pass 3 to GENMASK if that's the case.
> 
> Fixes: 1c3541145cbf ("clk: qcom: support for 2 bit PLL post divider")
> Fixes: 2c4553e6c485 ("clk: qcom: clk-alpha-pll: Fix the pll post div mask")

I think one Fixes tag should be enough.

Nevertheless,

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
> Changes in v2:
> - Pass 3 to GENMASK instead of 0.
> - Add more Fixes tag for reference root cause.
> - Link to v1: https://lore.kernel.org/r/20240925-fix-postdiv-mask-v1-1-f70ba55f415e@mainlining.org
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

-- 
With best wishes
Dmitry
