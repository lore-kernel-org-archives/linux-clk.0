Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CA22E11BF
	for <linux-clk@vger.kernel.org>; Tue,  7 Oct 2025 08:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759826056; cv=none; b=egiUPCKuzZBlSKKH17WYKogX7sX2mz/GmordG+e8ZGmyA4s1xnLa1GgPcmJZMOPwua3lhDcSivGhUusgoAdmiWMiNERof/KoducOxKQd52I65/zPY193/Qa1Da0m0zccWAi/pCgAjyPANTDFAA/3XzBrtQ8KFyKF31dKkcnOZQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759826056; c=relaxed/simple;
	bh=hnCPQFDJioFXFqwrcNntVGijjFsq5IgSQsQaRCg8dks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iucp3nH87lgSNy5ONXHWhoktEQBC+ic97agLHin1fwfWINYNqonUvQ6WzZEAF6kh0SEmD3EH7PUIydtsK4KQZvYQKlRqag2I0jf6rr0iJxnhavxyAzsudJM1hafjTf/Hh6yVYcLwGxwT3QdybOjCO18yhB0ZCVBd/sSGD7goRVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gznl10my; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gznl10my"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4257aafab98so1707352f8f.3
        for <linux-clk@vger.kernel.org>; Tue, 07 Oct 2025 01:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759826052; x=1760430852; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QiLtkw4r+z3ELHzrkww79sYrVN4+kJqV9+CE0aX/r8k=;
        b=Gznl10myooEzq6wPdYbpIgHXK0odaCTNYIKa/UILeJNvFcbdqfxcisLhmRfcfKuOv1
         AByn817tiHfMfr7iGn0vpMzfQqycJ+JHUtPUdgBOqmlPVtUGSnLdZhkZ7aRd7+g0M1CG
         8qb98PRYsvMNbEA6JUM6REunxggElAQUVfjbzqJbiIt3xwmhQWVZexZ9VmXjlLLJFQs/
         fEmAhV+39s5ItYWp4K3G8G2rR5nnpBMgkFtVR179MiCSnu8nZmRn2I/3/PXuhZi2FfVf
         8KefWav68CwdkLTRlteoSRXQaHghVBtbYGpA6mORLMeIis6EsXMZ4Imeyz5Qs/rxeOhH
         tXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759826052; x=1760430852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QiLtkw4r+z3ELHzrkww79sYrVN4+kJqV9+CE0aX/r8k=;
        b=k+1NUvRIxs6gFsk8Vn5S/3nMeUrhtDaHKgW6446PqzRJfnkaZ9E+w8fK9oTEehoajn
         W9TprMh1aJstTfv029/It7hQPge0QSVqpd0+KL4OrAdWuJFfAivwDsaWqik/eKLrzaI3
         IoxOOe6yoRRPRnLglB/n9ewwvY++noo51lHiqV2jGGp2DmBPEGINBiFCfzi6BfPIPDS9
         4m16wpYZ+WqutVecCmi1P7EBnS8RmUqIGWrsiB0uoI6C5Onx6Wa7RzjZcp7rMZ1c3iSH
         OqRbzGNIvjDMFT9Kci9pTUKOepjiG43ey41bbMsBPMmnhHSm8pRSYyAbr06nbuoS8zYm
         7KQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUw8WTJ4uqpQ83aH2HtTxNAJE99ivE2r3eNJK9M65Qwnbaz3BRMJJXlzJSMUcFGhm+WR0xUHn/2hyk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/cQUO5ihKmCgyfCymOZDA7vh4TSVvb8Fu/kzRkV/xtnqRlJet
	q1jKLO7rLXff5Y9D20ugKgDaz1nim5pVqU+yD/Esm5HIT93LQlU7vlS99uz17R9A+vg=
X-Gm-Gg: ASbGncuYFYRT8++j2iQWN2dW6CGEjUcBfZDdrklVicDSaidaNRJP8z2v8D8cI7NyhJt
	ByVxL8PZ/tyCHofW6c+HWT8hwcPMAiN4457MuZqZwQBAoe8MbnXl1mQ0fqIhex/okOA7NgWHldd
	E/VGza5I0kR1eLGWDjj2D6SaEPuIAGu3N6dihqvf7E3dZY2UhwlvOfOQez2o/rbPrXsXMsQxrt/
	8KD2jJNoIVL/37IbFziW8C/80p9MqG0zTnP3npb9/maRGDve5WSFoEjYWJE1C2rWke791QXdA4f
	hKoWItoCdI3sVJjPnMFXL5qhAGU4MkYiXRDRssq9H0R+68uCsx88vRLSkUf6rCUlYckx7wMi6L9
	Ng0wgeI0hwHCHuSA6X+P2zftow/739S+caNHA5Zi9MwCVOT8=
X-Google-Smtp-Source: AGHT+IHzRBYvsifqIJW6l/DvFTb1GpI73cPAH1fs6Lrdh2C0kde6p/0HuIOkdP0J3Z8Xj3L4jdedOg==
X-Received: by 2002:a05:6000:2210:b0:3ee:114f:f89f with SMTP id ffacd0b85a97d-4256714faf6mr10470825f8f.15.1759826052003;
        Tue, 07 Oct 2025 01:34:12 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e960asm24204750f8f.37.2025.10.07.01.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 01:34:11 -0700 (PDT)
Date: Tue, 7 Oct 2025 11:34:09 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, Wesley Cheng <wesley.cheng@oss.qualcomm.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Bryan O'Donoghue <bod@kernel.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: x1e80100: Extend the gcc input
 clock list
Message-ID: <dz4rjtwdl6gqhn6g5prqvnifrgortzgjpwatbpf3n7kn22tniz@yjteyofk2gtr>
References: <20251003-topic-hamoa_gcc_usb4-v2-0-61d27a14ee65@oss.qualcomm.com>
 <20251003-topic-hamoa_gcc_usb4-v2-3-61d27a14ee65@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251003-topic-hamoa_gcc_usb4-v2-3-61d27a14ee65@oss.qualcomm.com>

On 25-10-03 20:14:40, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> With the recent dt-bindings update, the missing USB4 clocks have been
> added.
> 
> Extend the existing list to make sure the DT contains the expected
> amount of 'clocks' entries.
> 
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
