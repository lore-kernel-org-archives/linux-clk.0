Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BE2242D65
	for <linux-clk@vger.kernel.org>; Sun, 19 Oct 2025 15:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760888604; cv=none; b=PrrPHafAEgcMaMpYZA/Pe8Zj8OwO0bmU8OE//9QFtn3WkHatte0uvY8TbPsmSOHplI6eNaJ1S6xl1HRhUsxtRksUcGMxZUYglc/28g0ATNiuQ+kDHrpXUvE7VTHWvTuPQyKNCCOwbvtS/TSNm1UobjKRtDKCMg338bibNppwTco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760888604; c=relaxed/simple;
	bh=zOgFDFMH+2xwjTfGmnxCyniM7hXdqEvlv4hRW9M9HWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h8cUukbBeXPhuikdJ8ER/S9RDQGU1PoMry0WSeqNcT6kvcKn4d2PnC3CMkkGxmck+eaVOiyR49T6wsXzZH9aiLDnODeGXI9TwQJTnMu5S8Bx8KwcaIh05uw+rhjuABSmsnJi4rgGAoD/PwA1ne+npAq7/F2T95+0+LOgYFwaIQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pXn38SEP; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pXn38SEP"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4710683a644so31975275e9.0
        for <linux-clk@vger.kernel.org>; Sun, 19 Oct 2025 08:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760888601; x=1761493401; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EUr/HT5GdfdpAP+uGAqN8uEBQXKUdVxJBVCEqLCwkic=;
        b=pXn38SEPxeaImqEtFhztomjO0LuSkNW4TRqiS9Y+sS/I+Mf30jFdCxIuqpYhkxpxoc
         gNbGi4vpdbNP3hfKPa5MnkdXTCJ8+pKkACIDNJ1CIOowdPA9Qe2O6R3AKOuTemgYZJpe
         hj9Ko+5QeYkXy+XPEZu0qr3R8pmXtM7sts3ym3yIvCxKhFGVsiBwEZErDyMmq3q49X59
         WGIDomYG6hTX7nexZV4Nul2gO438STbNmVfca4Xw4b83b5BQp0q8n9Zc/8SZ1YKVepEy
         dLrSYbv4a2vyc0Cs97WJlDo0LtodHMSsC5rJkIiDXBHOBhZviziycp7itYlCuy2H75fR
         RCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760888601; x=1761493401;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EUr/HT5GdfdpAP+uGAqN8uEBQXKUdVxJBVCEqLCwkic=;
        b=BpKvwSNZJyrplzgxl1X8tPYnKCvo539ayx3VUf8PR4eRC73sW15dnmQtkpeun2E37n
         8BsofT80BPwzYz2mfJ+4W3+Z2MT6f9XqsnndUbETz/Vy0J/9P8KJWg83LJgK2hy2GwBQ
         AjBzTXgRpnbmK+Mhn2MDOpRmKTPbe2ywEkcB0WIYVbkn8yf879rANZZ4997gOLDYgdCt
         wduAQJjha14wAAZwhoWGLtH+H4wDeqSwNFkW8fKkxxHaoYqv5TcL1NkokCMC/MGcuk4N
         cWYaCO7q9URGGaueioI4hX9nP4Ui2eDq2yWWYfAuRGuXIE/yHi3EqHJmydO3EOIHF+O2
         I5IQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkk4jzHCM9Be3J/+QLWBXVmEG4qiYUhUSdmdAxLQd1VNBmDhgnEVW5ICOBKGLtWnc2SdSXsNU1K0E=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywac2kBT4MTEPTk5ZojdpK9FmeB4Cn6ugMNOUWgsDqicCPzWu++
	yV0+DxfMgn+cuD3mWZNh+cPlLVCJL1EK59e4+S71ZuFPYqhO7Q+BFz6eIXk4EAQZ8Q4=
X-Gm-Gg: ASbGnctkJrfcgG87bENKLe1fVnxMdZsBrc2u0bAe7ioD6FyHJ5tHDp8cCWoxXVSK5uQ
	0JQTlH3OyYdq0/1hJ0fSNlbAk/sboqhiV4B6ADvLRH7lgBAv7G4lf80aCSms+skQk0TfDSivfAk
	yiwleGa0T3vh/nrmsvDacntlC+/sVBxWCl/B4R6ljk4wGsMkJWHwTVbk/o6vTNULRwKXhb1dZqK
	wDyHR1sqJjnBewLr6DUODcHB4T8gHeBwB0KVRKBdT/Hnl7aHM3RozUN3GhhMhwT28a9DRUj59Oc
	Z/sLQO/0No5KaOifUvHzi6xIMQ+bi/vCoBVqM155AkOtsqIuk5We4olaZ/C174BZ8VYkRmDYrfy
	huCBTwmqu5z6zdJVtR2HYO5d9gazyQMXcm9gHbckbob9l6RY8jxE5O3xWQJUeSBoKzntG9Iu/KA
	x6c7pRavw=
X-Google-Smtp-Source: AGHT+IGJaFTKBG1axeoh5yYjZyMcN1++OBgdmC7QlvOy86QSdbXxx0ZA+KHhVZA7w26vZD2Y0J/nug==
X-Received: by 2002:a05:600c:c0d2:20b0:471:704:64f3 with SMTP id 5b1f17b1804b1-471098fe592mr88225155e9.2.1760888601212;
        Sun, 19 Oct 2025 08:43:21 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471144c900asm188000445e9.16.2025.10.19.08.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 08:43:20 -0700 (PDT)
Date: Sun, 19 Oct 2025 18:43:19 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] clk: qcom: gcc-glymur: Remove 85.71 MHz USB4 master
 clock frequency
Message-ID: <yr6vld475g7lkqjr53tnyllkdvm2zyclifwpm5ljlhg353dbsd@jy5yycwmf4nm>
References: <20251010-topic-gcc_usb4_unused_freq-v1-0-4be5e77d2307@oss.qualcomm.com>
 <20251010-topic-gcc_usb4_unused_freq-v1-3-4be5e77d2307@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251010-topic-gcc_usb4_unused_freq-v1-3-4be5e77d2307@oss.qualcomm.com>

On 25-10-10 12:24:52, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The USB4 HPG says this frequency remains unused, remove it from the
> frequency table to avoid any misunderstandings.
> 
> The reason it's unused seems to be that the lower RPMh level required
> to support it (LOW_SVS) is not enough for other pieces of the pipeline
> which require SVS, which in turn is enough to support a faster, 175-ish
> MHz rate.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
