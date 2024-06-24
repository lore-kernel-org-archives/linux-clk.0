Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE001137769
	for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 11:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719227308; cv=none; b=htVUd8kNMtl+Z+BHbuobccDudaS6RMu5WTtAVoFqkb+zpE9yBU5rxseQpXlnceufCKxZnY2Q01H5EjVA4AVDQWMm1QCki1c1jaGPQ2GBmgGKeDuuXHnUDnH9A/kCKaX6qymCDbBbuLCK9zoQWEsYmyxfi0fh1D71xfhSRiDEufM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719227308; c=relaxed/simple;
	bh=nRT7ZGm58wGoEypzFl//fJhXIDLeznBnwPBvoMnL0IQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QafTvpIZghYX5dDsBHIpJbqGgnVD+CTMbawGPIxjkUjakfSdJfiiAGRsS2QTRDYTxstvIT9WTFzEBq2vXa5mEyFYHwFyZV80c11OnP+qnWGEjE2+Gpp7n93bks3lChYqzKtdix/zozbsa0SozaMORdngCwy+VLYAWfB2jl+Wbf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ko4Ls5uf; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ko4Ls5uf"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ec595d0acbso15814731fa.1
        for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 04:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719227305; x=1719832105; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wPvm4lJx3Y3Rkllox7KVCNLAkZq8ExREmWQiAi70uaI=;
        b=ko4Ls5ufG+2jfj+biz4ehTxoqX7PvEFoSNaKCx8ZN7bHx4Ig66vBuR9udTdo9uTFHX
         CM00h2CJae4jtg/SwK3NtAIlZXddVZK/Idb2NdNBuur5IPjIUQi73yrRfkYuFgaB1moz
         j+JMZI3b7oBXxOOmvP8Sf4SU1g9QjTCVaiZiPefati/8ctv0ElocpSRPb/nXU4RL28by
         7tAAOW4u6nXgCm1U8qlOaX+SV6egfBl695mPWwjeykPOS5QeQh7ZBkTtlLkZhYO6m3Na
         ziuuzan3Jz+Jj0KQVX8kKJ5YLZFqZDKrqtzUA3Bfel3WQ8amiqw4A0vvzjKinJ8iFMmm
         mQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719227305; x=1719832105;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wPvm4lJx3Y3Rkllox7KVCNLAkZq8ExREmWQiAi70uaI=;
        b=D78sGKuMKkxxxvlgGnQ2sSiNhn+pFNxcGGDUG5KFCrx9X6WiOkw6ix7kfuIY0DuUQd
         6oR4CCRhntFyDYI1KVldlZCWknQQtFr6ygCGp5yo0fmQIPlAZ1kPNSvNs3iVPAUmsj6J
         hbxUwtoToO1aGWk3ZWrFqvwtcDXxHDKQCIJxUM6j7Kwny/GRK6akIUHTLLPteGxGB7yi
         Ufufhoxc2C9Z8FuHOKkT0QSkJNhp/fHCNcfxY7bKCeW4C41qsqqon6mYAQV83EbPubw6
         MOvLeaC+WzkrtRiXbzNyekk+pS03ZnNrw7hPQELTFGqBVS44Bh+2Jbfv94oRc2QvbVBT
         n2Cw==
X-Forwarded-Encrypted: i=1; AJvYcCUSEL5sYtTjiqDkJC5Aki91ILNJG409B34CpG5QxvLUobPIx0NnjnvQIoS43sO7/PiC89R4hhpvi40EIa985wjvXrHDPjm+DT+v
X-Gm-Message-State: AOJu0Yzmx5gDgOUQkbOUqTf0eyNb0v7OQcU4FyPZJo/1Sx4zQOKXTdq9
	mxbfPMtMKNXyt0KCC6kmVgxU73Q6Ncw5hE0s15gaYenuExtKczxI7e5ueHuAPLfq3JfQMfddhlG
	Q6H0=
X-Google-Smtp-Source: AGHT+IFV8ttiZXZMs08z80WjYeaqP6Xm/Gjtumc4Wzne7zwY6tB6Xa1nJSC2UrM3dBloRJCTESbcig==
X-Received: by 2002:a2e:b0f5:0:b0:2ec:53fb:39c8 with SMTP id 38308e7fff4ca-2ec5b2fc2a4mr34842691fa.10.1719227304839;
        Mon, 24 Jun 2024 04:08:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec4d7090cfsm9639631fa.41.2024.06.24.04.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 04:08:24 -0700 (PDT)
Date: Mon, 24 Jun 2024 14:08:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: dts: qcom: x1e80100: Add soundwire controller
 resets
Message-ID: <p6ooqgfwld7stzevozs7huztputc7vpc7652wx6rvg4cly5mj5@fwrzeu6alhgq>
References: <20240624-x1e-swr-reset-v1-0-da326d0733d4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624-x1e-swr-reset-v1-0-da326d0733d4@linaro.org>

On Mon, Jun 24, 2024 at 11:55:29AM GMT, Srinivas Kandagatla wrote:
> Soundwire resets are missing in the existing dts, add resets for all the 4
> instances of Soundwire controllers (WSA, WSA2, RX, TX).
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Could you please point out the driver changes?

-- 
With best wishes
Dmitry
