Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E123D994
	for <linux-clk@vger.kernel.org>; Sun, 19 Oct 2025 15:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760888554; cv=none; b=LXSBXOe5HTAvt2EJ1ADaoHRqw0D5ecMnFiWdBk8HtMmBvlqr1vi0zdlvWjeZoFJrRBU1k6hb7RGvHbR7kdMvbjvdhBvqtu2HQ4nJpA1ZOgxZo0BK0/NeYTZI0GuVOfvLr/y6fW97D2mT2PYVjbZJo7bGt4ZIbUD4/GCzBftZCzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760888554; c=relaxed/simple;
	bh=PmZlpEEY0Gy0JFWDFJ6XeXHuOCC0Mcbj7188SWxr2/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hc2d645Szz7YiQllEoS63qiyweV+5mH3jXih7w4TZoVAPfhMNWfPPu/Z+cZsY8CZlhVJJGlUjGylluyfdhcD1ptbQleZlyJ2xgMS1fzKYZtJajHYgp2ndxyOu9J79X1DiQHp2HkIDyaYFMB47cgZMtyYagbLpG5NRqIdWoLFCFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gKxaE94t; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gKxaE94t"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4711825a02bso20980195e9.2
        for <linux-clk@vger.kernel.org>; Sun, 19 Oct 2025 08:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760888551; x=1761493351; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zNWcI2BvDnMLdjyIaXsHEcSmjI5w2/HhMui0bLiWR/w=;
        b=gKxaE94thMAYvR6nKXNpK/F+Od/BuErYt+cdunM+jQlj9cPLNE98sgyQ6z+g4RF6rw
         XDsSllE3pULYq7o27ABIrwo1hn9kZ2RDWqwkZszblxFnft45ag87W/EY2u5asI0c0HOy
         fxZj13hSQ8qCsy/bh7ZPtNKe6o7EZD0XV7n7djZkZqpE6UiehZ4lHyaLJbIMSf/zZFXn
         7TkSQb3hGms1EYNcXaPY+0hnegpYRjAu3Rz09C+asOytXUdyW5c2Bj68Q7R1FiEEc0qR
         MqPAkvyfrfy3h+MX2PUO1FWowJUnf8hjnCF33WYmChMr6waUvpuUtrngHYEOVjJrzOqJ
         QgdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760888551; x=1761493351;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNWcI2BvDnMLdjyIaXsHEcSmjI5w2/HhMui0bLiWR/w=;
        b=Z/TpY24K0mUWkaxK8uAkr4R/7GYZcuydnbqxF098ZJmK03C7q+RYp6peQt/1m+15Cq
         lOl+Pra3URxSUxe0i+nwK+eO2zyHR8ujnXtun6bKMKi2RMXghMkV1WWcmUdpVs45LSIl
         /XkbKgpSgiRP/fLBo3rdCqsLus0yTnRIjFhrhfJX3aJk7NTyJrrKtbWZH2u0Pc15PXZx
         xyCVSpFPEQS63WrI94zjw4vGR/Ujyt7LHtNIZbfkRzSeJybu+w6n8axXeIshyOo4/3H2
         01KUUa0VXvdlPD1l6wwXQtqc3eYc+Rfv/lk5XLnAj3kOXtcGqEZkKB3q4nhrE2HMF2jo
         N4qw==
X-Forwarded-Encrypted: i=1; AJvYcCVr3xpK8d/m1KXwbxp6rmOAT3tOqmgBu3FWxNazqSW5PjIOT2+Z4EaPnRtXnpmL33oyO5wDjqRcops=@vger.kernel.org
X-Gm-Message-State: AOJu0YySxRVzyYAxPWPFvHrREbIQNf/R6EoCEzvfPA02K9VYj9lvHoI7
	z7lrsUwxs+iws9fL0VQF5gTbq0COv9xHjG5HHW1HHyjaT9DHHMZuTC2RsIQAgICHPio=
X-Gm-Gg: ASbGnctSqE0/FwfNHb5kO4CVFY/LrOKHR3z6jsQ+V5DX7B3zqi3T9jyE/wBd6iP+14d
	yKpdBe0KvUyMLmkAEE8Ik2U8Va8+t3nI4VqAY0IxDWM0RtbOsMBDvzvyvNI583ShkSlCXJkgGf9
	YzuXXP4m003NjO+aWOTvtYCzVWUxEC8sVGqapZb4kJPJPDwfZfU+z4vUPeH0Uuk/ec0EdXxNCCk
	Q+zacBiSgVCD7tgY/1QmH8EJ5PiCDkJ8RgTD8sV3JKj5n9q4T4BtAztA4wWQeoZtllSMrdfaNiz
	4902/WOFRF6hXzSBOQJ4LlhLE3RAPnwfIylMWWXAdEuYbLvde4cougByef8yK92dzi2BKRW8glx
	89PP/6qQOapJnTASOC4xs6GOMQIkyP7TsPW7wd1+ekTZMMA1cIlECbnfrW3mKnj+CPnqc/8+5Bm
	fjMtdOmoo=
X-Google-Smtp-Source: AGHT+IGzPw85B5IfdTjkeR5UNt/iOrG4M8XAIOYwmM21CaD/W7Y8OE6WzHu9ieZ+CkuQVu1UuLTtSw==
X-Received: by 2002:a05:600c:3149:b0:46e:4b8b:75f2 with SMTP id 5b1f17b1804b1-471178a7ea5mr64647255e9.16.1760888550742;
        Sun, 19 Oct 2025 08:42:30 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5a0ec2sm10658362f8f.3.2025.10.19.08.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 08:42:30 -0700 (PDT)
Date: Sun, 19 Oct 2025 18:42:16 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] clk: qcom: gcc-sc8280xp: Remove 85.71 MHz USB4
 master clock frequency
Message-ID: <pexifslihu4oayqkl3b3coulirpudkhud426ntuimwnn2mtb54@dkqiriczitfc>
References: <20251010-topic-gcc_usb4_unused_freq-v1-0-4be5e77d2307@oss.qualcomm.com>
 <20251010-topic-gcc_usb4_unused_freq-v1-1-4be5e77d2307@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251010-topic-gcc_usb4_unused_freq-v1-1-4be5e77d2307@oss.qualcomm.com>

On 25-10-10 12:24:50, Konrad Dybcio wrote:
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
