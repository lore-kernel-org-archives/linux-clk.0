Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491B543AB3
	for <linux-clk@vger.kernel.org>; Sun,  6 Oct 2024 21:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728248628; cv=none; b=u34+K0pqANKiEX6CA0AXvXEirLUOTTVRDxbAoxupstpCPC7g5ZuDrO5S7U+WLdyeg9xfhu0P4b6H1bOYyljCiNsWJh0qyJUmm2FMSe9bppqUlY0KzaWIOEhihOmQvscf9BIdFszHPOGXZLb/fzl7kbs2KlBekwpIx0QBgfG5Vgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728248628; c=relaxed/simple;
	bh=3H49pcBVPVHGqfhIW8jHEw+XYpXGnm889OB9D0Eo1Z8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HvIe79xu0fql3fSPd7BCfmIBAHTVygK+dzWeKwj2PNvoMpSDyhV2IKDuXwmOa2AfWxEEMrIGCL7fujpBFTGxNsmUET/Y2stkSk3w5VsrWBPmd115TLV26uJbNyamJfV0s20JPPbdOTWEDaivSOEKa/GmapvS4fWOGZvYi4zwKlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oijagKcS; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oijagKcS"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fada911953so45675831fa.0
        for <linux-clk@vger.kernel.org>; Sun, 06 Oct 2024 14:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728248623; x=1728853423; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2PmXTB9KbHRH15SWXd6BBgKFdgftbTaL4ejOb5/3Tps=;
        b=oijagKcSosOLvUdmlVO4fczXSTl1LZaYT2lKzWqrH3ZdKiyHpIQj4D4rPHVtXY9f8K
         ZME673oGaebxr4H30uwd0UwjMJNPFO2bSbYC3x6sBKO3eVFAzZW+Oq8Jkac534S/bdcY
         6jTZqBX/vlzjaRWJP0DIu456dvXn6fIe3xYw+7g5D7dz7KvX6M201uO9BENpEuXRWDRW
         6eN8BX6+TwcRasreHbIBkg4qkKTMu3LRHQtTtcB1qQMpr77sU1emQHIROWb8bX6PPiCW
         c0kp+OoOVLFCEZQcEXDG4MZ/MM11TW2ShM+WqFK/ZSumnCdFXKtVPtNRHx39qBvjrbH6
         fJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728248623; x=1728853423;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2PmXTB9KbHRH15SWXd6BBgKFdgftbTaL4ejOb5/3Tps=;
        b=L+GgLcq1b0bv3rBtdot6pn99/Yaqr6zZX7ldu/h3afFuu2+NrNpNuric8XsgQN7vqY
         WDdz1WuH9pM56/rRjS5ooFLjTRRa0yDmdU1UhgwPtvWQyXoqv5u9jU+5AvYtQJibEWZb
         7j4K8efFHDqBlFOaHuv0hqvwuolDIGD5a5AlajgIw2caysRrLK6glA9QCeAQGTndXIYG
         Lu8scIbAq24YfOjXAScyDhqaDri4xkhohyWRYj0osUCFzifZncPVeLLTsvS60qfPvVtT
         HReaDZTibWpn0cRPg93Q7ljliaEQeZ4XbSFqfWGEy1hZCYb1KcsJzFMjSl03ES1OkqZA
         7ArA==
X-Forwarded-Encrypted: i=1; AJvYcCWGgaT/YofKxoOJyeeSc/LNmU52CSKnZf0zYqmiuyShjOT/R1KUCtSIdXzOTtENnEMe3aQkzQesT7U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoTM+TQVDyGxqOTdCfEhAyvKgCy3lzFDe1IGCgtC6IGvI9uqd/
	SfXTIa/zYCTHCtY9uwjsml0plBw3/aGQZ+aiFccGneA1T5spuEXcJ4eQ33pK8xvihGqP8C8grbc
	R7Bd2RxRO
X-Google-Smtp-Source: AGHT+IE/TGvBqc3pWkxdu5goo+/KwS8+0cYK6C3rp4J81+RSj/7IrypUYpmkiCoDSLCQt/xpNC6sSQ==
X-Received: by 2002:a05:6512:31d1:b0:52e:fef4:2cab with SMTP id 2adb3069b0e04-539ac12cbf0mr2606684e87.2.1728248623406;
        Sun, 06 Oct 2024 14:03:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539afec80b8sm599524e87.73.2024.10.06.14.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 14:03:43 -0700 (PDT)
Date: Mon, 7 Oct 2024 00:03:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abhishek Sahu <absahu@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v3] clk: qcom: clk-alpha-pll: Fix pll post div mask when
 width is not set
Message-ID: <vkfy47q3glm2gehs3rmunerslvzrfyz4wa4egdb6k26ucim7iu@ad24jwkdybeg>
References: <20241006-fix-postdiv-mask-v3-1-160354980433@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241006-fix-postdiv-mask-v3-1-160354980433@mainlining.org>

On Sun, Oct 06, 2024 at 10:51:58PM GMT, Barnabás Czémán wrote:
> Many qcom clock drivers do not have .width set. In that case value of
> (p)->width - 1 will be negative which breaks clock tree. Fix this
> by checking if width is zero, and pass 3 to GENMASK if that's the case.
> 
> Fixes: 1c3541145cbf ("clk: qcom: support for 2 bit PLL post divider")
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
> Changes in v3:
> - Remove one of the fixes tag.
> - Link to v2: https://lore.kernel.org/r/20240925-fix-postdiv-mask-v2-1-b825048b828b@mainlining.org
> 
> Changes in v2:
> - Pass 3 to GENMASK instead of 0.
> - Add more Fixes tag for reference root cause.
> - Link to v1: https://lore.kernel.org/r/20240925-fix-postdiv-mask-v1-1-f70ba55f415e@mainlining.org
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
