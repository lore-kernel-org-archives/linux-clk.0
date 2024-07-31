Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278692209F
	for <linux-clk@vger.kernel.org>; Wed, 31 Jul 2024 13:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722431254; cv=none; b=UCsfgiYf5Wa5TU9Y8lZrWMr+NHEEmhO60L+tvAuUC2bMDxRu4cpJIMpPq5yU2iBfQmjvltGgak6jkL+RDCRGE7+G1wJwDEdFa8Q9thi0oz800NapmnNJLiiETuRi06e7xzp8vCJDAGAA46PODNdpNlFuESy4v0pmPTBCZOGN/Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722431254; c=relaxed/simple;
	bh=IDvKEAauQ3f3+B7eefwbOL3BPtdB6ke35T+ErE2pzzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jIP42Vr2xDy6RFvUc8LQMXP0QJAJpcT3APLrDUcgKzYNJ6I/z/QwUkFc+S78bsOOo2IwvSGOvkjTpF6C1GHS++RJn6abIJXmkHehY/QFQaddUQDnhPm8hp7QkZkyc7l0vuVWGuOT45rPEPXBBQlQmfzirXBcRYB1a/CViHGLj8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RQFsD9Zt; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RQFsD9Zt"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52f04c29588so10161974e87.3
        for <linux-clk@vger.kernel.org>; Wed, 31 Jul 2024 06:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722431250; x=1723036050; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/FoiQbEYmhBENH3LXyd3ATBiDIVMApuyh6s4DrTOE6Q=;
        b=RQFsD9Zt1YvBrlmC14yzZ/QbltZbO0diqdOVPreqk6el0P+rrY2L9bctyFnpp2+Bf+
         U43AA5u+7jNIOFrXNy+aodjWR4nUV8U8zE29N/IweUOYg4xNcDhho2lhXljJdEgBWP67
         14wHITVrBCM91Vs0M4a7M7ov43iBg+XtG8GMkyT90Iz9j8f7ew+J85qkmMU4b1dAUNm6
         RtksoVie4tfXMdpLJzJrS/mwKqAgDgkYhWecFpc8MIhBOjnwskb1KBHHJ4iHGlWxBGuG
         8YjgzoX63qROVEDm5wB49fWO58D1M2lvQN+rw1HIFBbKJWju32y1qlX+t/2ocXGLXgDC
         MtSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722431250; x=1723036050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/FoiQbEYmhBENH3LXyd3ATBiDIVMApuyh6s4DrTOE6Q=;
        b=LW1pZamBpGvDRTae1ZM+JW9GTBwswf9SY7NTYd6lsumv+6VbIAdYgoXJLq1gFMlT6T
         bMSS02OmUZPfaJ5KmtgIfTDeRcss8R07Y05U9Xb0dk8gZkPwLElK+RjmTY6lQUe7Ha66
         YOt+WISSz9a4McE6jjqkeDKxZINFOuvmmvmqwY9191uVBN1lYqFxZBTpFIaUsQKijrxg
         3HSGEII8QDDqbQCFTBhzAPFS2BSKPY9H2aDnyVPesALkS7WUV/XnA9bPx7/DB4JrpxJR
         d06TJSNgx637OYHggQUrhe2zU8eZRWTLPxxeLxo2eFqNUwRUn/yx9KHa1ZjBPEF7mJn1
         Zxvg==
X-Forwarded-Encrypted: i=1; AJvYcCUBTRmjKxVofW+M1xGGTGj9ApLqRKt7xyrvjmEdrR/YCOQUeTngbV+mxUvELJaqWZU+VIkQ7+zV0t3rbbRzlbEri1yotgqR0Syh
X-Gm-Message-State: AOJu0YxOrLQ66qAQj8ZcR9dsPKo4uevcO1oFI0wIa3918fr3vcPKYfub
	PcfJYgd33yhVaa2bWiRWmZUlqvgQjtzn2xr83Kc9qNFy9c5l/k6oB5HI8G3z5bw=
X-Google-Smtp-Source: AGHT+IHFGuIslHNtb6tITJa8SbCZaWaHCKmfmiJMpdSGO3yjlULlpXbI2CAqFvwKxhAIv4SP8SdgkA==
X-Received: by 2002:a05:6512:2032:b0:52d:b150:b9b3 with SMTP id 2adb3069b0e04-5309b2809c5mr8147947e87.32.1722431250588;
        Wed, 31 Jul 2024 06:07:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-530aa08dab1sm649447e87.13.2024.07.31.06.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 06:07:30 -0700 (PDT)
Date: Wed, 31 Jul 2024 16:07:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH v2 2/7] clk: qcom: gcc-sc8180x: Add missing USB MP resets
Message-ID: <z4lbpgfjmkslylflolm6nxqye5gsgbzn5yn2lqvqlngyc6y5bt@s6uovsadcxe5>
References: <20240730-sc8180x-usb-mp-v2-0-a7dc4265b553@quicinc.com>
 <20240730-sc8180x-usb-mp-v2-2-a7dc4265b553@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730-sc8180x-usb-mp-v2-2-a7dc4265b553@quicinc.com>

On Tue, Jul 30, 2024 at 08:24:39PM GMT, Bjorn Andersson wrote:
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
> 
> The USB multiport controller needs a few additional resets, add these to
> the driver.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  drivers/clk/qcom/gcc-sc8180x.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
