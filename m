Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33042D4806
	for <linux-clk@vger.kernel.org>; Tue,  7 Oct 2025 08:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759826180; cv=none; b=kIdj8rQfLSmlGJDSBgwkOMbBMZ8Y8B3+oHyr/ntyOLWmc74qfOOmw6FmvD/jJkkw9kduY1Wiok0rjhm1/nFUQk/WpHHt2NJkjkgP6Ha6G3lh3FMOFXEXL6elh5cvRdkv+SFcNCJz96/kQqbmma0P1ETba1eCfA+zF63oLJA8Sew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759826180; c=relaxed/simple;
	bh=hclHZaPwvU+Or/kgDq9GYsNnRsFBBmjtWca90LyRtXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JoYEtocwkr4Tx7lmpNelKDZ2MKVJxovxvUVhK7Befo6QU4KWV0ahe8TpSZ1IY7U3qgfUTxroUgO0HQMsovAuiXV8+ASKuYtFSLPZr16QCE+KVOUDRnh/AgEfXLGCsTR9rK8Rz58J2vNZBfe0/ysXfflMZizG9PmyooaBUf/XT7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G3rSDdVb; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G3rSDdVb"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-46e33b260b9so56541025e9.2
        for <linux-clk@vger.kernel.org>; Tue, 07 Oct 2025 01:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759826177; x=1760430977; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P/Puk0DGClgU/d0N9KPCXsJda8f3CNcdxuN1BPXv0d4=;
        b=G3rSDdVbIEkxIEUR5jo4ejt9aPv88tOyhobo9qltV+JH7QORuUESnDPrQkwHOGVivI
         ev7JzUfrlXAZNcnXgRVoywyEzQPginE8TQrKiI9HHW1KXMQ7HygMUtZNBP3XkUyu2fQ8
         aH7WPDF+THlD0CO4ul6KVe2zLVHQ1cmR8x4E1ThgfOMMkAsXQhZb5a/PuoDbaeYeQESc
         7kS6Xd56WuS755Rd+d3izKqWKa6iLAbttfLvgkfeY79rqEm6hqf/eklKvJMYPfqsIXga
         feHu/HJ1TlRzm/bNrCQT0FmMHJrcY7n8dvLRvfDFvXcrfurCdOyEewiedTCac/7peusj
         jpsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759826177; x=1760430977;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P/Puk0DGClgU/d0N9KPCXsJda8f3CNcdxuN1BPXv0d4=;
        b=IXOMspKZPBMTx8E3j/FJnUw8kJ5MwC1q5g+hMetKpim/MZtdl/wQ7SmZaaqW+VtdnC
         X7egDj78DkEGnDoRhyZXq6afz9SPiXRts/2yRUtmC2umrFHrIUZ/i2wXI5cOrKhnRqMZ
         KnljCZ7FSqRLW7yYWVstcNaLAyRqg/YKW+Qby0OW6Li1H4qNxLX1663fLbBl1iCwaI8M
         JuIN+C3C7hpqWbCjE4yLCQEHbSna5lBfQekLcBIEtY/5LplgYZLTtQCXTmn4YYi11gd2
         O19CGMMfG4N9Us6bC1kvxk+IqzUsNCIdd/ZR0yxGtOfwavgEFrQeC3BOQlg1vcdEgrg3
         e5Yg==
X-Forwarded-Encrypted: i=1; AJvYcCX+G24BhZ09jHU+Ez5W1xJDspxcszcgKb8oIwDzxYTLeXN46UQ2zZl3ojV7DfRlqhrZkexy6uu7Xyw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzT+cfyUiIJMDVou8zP7boNrx7XpDxmQ65S0gUknADdYqUARSLk
	4L6KLwh1dnbGpG293Wt8PQTdaVTRDGoUhRTRTYAhVFScWlP4chPKGrmmxHEIt1e5y6o=
X-Gm-Gg: ASbGncvTxlJGhiyyebmjqi33Ck2miGYO00zrzX9bCN8VyTrM45qC1erFxGmLdAVV50c
	NdxixOZkuFEPhoYWzC/ucxok53TQyebkJuK/MIYpHVbEnUWfgSNKsaJ6/FJQWFtvF84ZLlaS+e5
	w6QRF3uIJhkbs5NLfOL80O3Yw9xmE9b4VZ8kvBHgbpmTNwd1N2RR7UfIZN9CM2yU5uvB1Zj4tym
	oVhnTX0zEsN0fqs9kdFCL8iA/RoxKPTLJEzfAStJcv4r72ZkyD64KZ3SerHjl9GB+2YtOVm45wY
	8R44LkU7pzB9VVlzQEKzFBUHimRTY2/grGTx0T9uGUgVKks7VkvsvE14tdTdxkDhp1PJ/VjuhQM
	wdkyAm6hvL4dS1X3kV71rXmnP8Gl156mNZ73eYHzEbWATcbg=
X-Google-Smtp-Source: AGHT+IGSw3Oke9DIjL+Gqc2rIqeM9+dXoWrNDqM+qZ8Vk9YiyMWaLjloD47BAFLjtVPGVOkVw7GP4w==
X-Received: by 2002:a05:600c:c4a8:b0:46e:4c7c:515c with SMTP id 5b1f17b1804b1-46e711549a1mr93067795e9.34.1759826176991;
        Tue, 07 Oct 2025 01:36:16 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e61a0241bsm284196215e9.11.2025.10.07.01.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 01:36:16 -0700 (PDT)
Date: Tue, 7 Oct 2025 11:36:14 +0300
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
Subject: Re: [PATCH v2 2/3] clk: qcom: gcc-x1e80100: Add missing USB4
 clocks/resets
Message-ID: <i4vpoy6bgkclazobrozspxmza3j7kyynbbs5lgdydtfxsk7daq@aqf435db4n2p>
References: <20251003-topic-hamoa_gcc_usb4-v2-0-61d27a14ee65@oss.qualcomm.com>
 <20251003-topic-hamoa_gcc_usb4-v2-2-61d27a14ee65@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251003-topic-hamoa_gcc_usb4-v2-2-61d27a14ee65@oss.qualcomm.com>

On 25-10-03 20:14:39, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Currently, some of the USB4 clocks/resets are described, but not all
> of the back-end muxes are present. Configuring them properly is
> necessary for proper operation of the hardware.
> 
> Add all the resets & muxes and wire up any unaccounted USB4 clock paths.
> 
> Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
