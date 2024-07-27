Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480BD54720
	for <linux-clk@vger.kernel.org>; Sat, 27 Jul 2024 10:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722077448; cv=none; b=AlwK1QWO2NTaBq+BUjcEpVSBMVTyBSoDjalfgkgkwO3blbfZjbgHAgyQjUR1K0vCYVn2EpI2HThPg2qgKV1PMSk2w4AtxOOpuLXP4agm4pC5zNoQqiA7CoAq39+2g12BWvvwzVheU8HmSohT89yAqSmJDFJmWo/oOS8CCIPMQAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722077448; c=relaxed/simple;
	bh=bgwrnEG4+KKkcqavt5c73pSKb8m7wjKG0GzrJJfQqdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kpa0tLrMnF8mIiUlO3ou40eKfZJYuYJFTmXUYpaiRpyXq4c4qKfSZK5EdNcY+LHcVK+R2AgAhu+pC2AS5giP0wAZ9f/lVgS9p5qvsjyEoA0JT19/aKWOJq8MSy0a+zOiVJJTLbtueWCj+5yAdy3TAK9UM6A2ulWnUd2EQ++Q0VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sMtsG19v; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sMtsG19v"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f03df8c8cdso20078431fa.1
        for <linux-clk@vger.kernel.org>; Sat, 27 Jul 2024 03:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722077445; x=1722682245; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fd+7g5fHC4ORBdyiR8TQfKxaZDxIN1H5zo/2q04zI6o=;
        b=sMtsG19vvsRqoTFD6ZFVm0VsUEJX+zkGcU2IpusZdKUJYRYysNjxX4k6pOf2dF73od
         yEmhtOx615FKc0JdriBMCnnx3cz0d7lh4ugtjxod/zE1FriLwjZHZ2QgZzDqkfhtLNKj
         efc03woU4/YWlC9auADVptiIhD8jEeXP8JlpTy3RZc8F+SLtRwuBXL/pDOfgrL43aEYz
         oesVnLrw8jK0AyPDDAGKTbtFuuGYk2yenbWaRUSwJYBUsDa8pGf04Vev0K3K8J8g+KVC
         Pwt9NTkrp/vovCUTOImw3eYm1pceZQQNTOYwlfu3LABgWW0lSMNFQNhuQYdOqmKidhxM
         zFBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722077445; x=1722682245;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fd+7g5fHC4ORBdyiR8TQfKxaZDxIN1H5zo/2q04zI6o=;
        b=KaQNW2DvMGrqeoUskVu0m03vhM7i41f3o5ulhVmIwdxqrQHVri1Y4E1fD/LRfsygRK
         KHXKWfCDqNMz604yNG+w/gOXXRoOIMxiuXVSpQok6jkNY/yNxsZ6WSVq4qlL7GUngInw
         aiQxaswwisY58fBVp8DD1QKUVxUsWHHzHRoDPg0+cGiTQ4b0XrARf+z/kI8C7JoW9skg
         oO9L69d3OnVbslzgygdFT/BnTMDsYzZkHgfxj3KkJKVjzEb/pvOYCaGAmy4P+emoecCe
         Gm6zEk7VaZdM20XL3+tuW5X1xVVcckyTeVielBYkLeMSzSxVyAAqTriOal5aMjSkAlxS
         sGvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNuBn9YLNV6kzalOyIWrB7R6KtkCooue6VhkF9ATIDGRAIl14lsodvayCsuN43E8LiwZQz6wr7+H85sar7U1xcpUM4Wrh6aKDI
X-Gm-Message-State: AOJu0Yy+QPXR8laevBjjRksXa7m7OhMhCrndICrroXIsuN1rrWteJwnS
	yHF7mvJ/nhZFQXHWIIyaRZPXrrWiIdI2CL2GnoTIKLxrlnDbAOXiVJnwj0G6J0w=
X-Google-Smtp-Source: AGHT+IGbFxS0CZBWTC+NU2o9/gkF52WeV0FeXTg6mfbsZPlhXM51iD5ux4nWAfhR7wpwSmMvyI1BpQ==
X-Received: by 2002:a2e:9784:0:b0:2ef:21a6:7c82 with SMTP id 38308e7fff4ca-2f12f0f45d0mr5019411fa.20.1722077445278;
        Sat, 27 Jul 2024 03:50:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f03d04d7aesm6689321fa.78.2024.07.27.03.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 03:50:44 -0700 (PDT)
Date: Sat, 27 Jul 2024 13:50:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Taniya Das <quic_tdas@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: qcom: gcc-sc8180x: Add GPLL9 support
Message-ID: <d7rqh2agblkiuectnkpac64rcz2qg6dv4kzfaoenb4boq47ku6@kk34x43mrdpy>
References: <20240725-gcc-sc8180x-fixes-v1-0-576a55fe4780@quicinc.com>
 <20240725-gcc-sc8180x-fixes-v1-3-576a55fe4780@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725-gcc-sc8180x-fixes-v1-3-576a55fe4780@quicinc.com>

On Thu, Jul 25, 2024 at 05:03:13PM GMT, Satya Priya Kakitapalli wrote:
> Add the missing GPLL9 pll and fix the gcc_parents_7 data to use
> the correct pll hw.
> 
> Fixes: 4433594bbe5d ("clk: qcom: gcc: Add global clock controller driver for SC8180x")
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---
>  drivers/clk/qcom/gcc-sc8180x.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
