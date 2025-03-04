Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5C01FBC89
	for <linux-clk@vger.kernel.org>; Tue,  4 Mar 2025 08:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741077476; cv=none; b=StVgltzZCSz8uYLRdz70VksBQbZDf19jIGvzo++l+LyANItin9OetMEmZe2Hr/2qt8ljXcKAqbi91MXc0dAcVBp+3HlbwqykIKsf1GyPJ4XpbEnhzfshBdJbxffNoRRrznzLxZdpt5TYY20hUCEzmiPgQD4vu9jnv5xHvQCqHzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741077476; c=relaxed/simple;
	bh=KH3nMYakHro6elhaWLocPclcTEHSIfo+DXjkmYQmSBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=agoaGS7sMuSPnntjYIwuoWpARbZ6RNcpdnfjlrw35s2EuO2wGFjeKhdhJBGkC8C6MC6IlvrGgy2Q3okUTHprmfw5gA64EWrf/mQj58kW0mPTtTupuFduKtC4AGRjsk/Y//SjAbQFbXcoc6ugz4pl7xDJJsSU2zHEdviCZDXiHe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lo1VmYry; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lo1VmYry"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30baf244a97so4144061fa.1
        for <linux-clk@vger.kernel.org>; Tue, 04 Mar 2025 00:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741077472; x=1741682272; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZVbEQw6RFiytzLhO8ZjD5z9kjTR3miKMHmSj3wWemVg=;
        b=lo1VmYryAiBxPVDFIZC5eSkNeqBI3deA4pp5EhTPCjr20kw90PmXx/I618ird/ga8f
         daZjZvXvOrqK+PgohZmmxDJ1YRWaPqUFF4ng3fO8hE6vdlTpxeA4lmykiQNBn2noVQ6b
         KJQJXjBG/e5HQUaEMkugy/42Lq3yTDfpfdUKnC+H0DuK6wwaw8imvybxzL7l38RuRl20
         4uiFO85T6BkwziKY8/Is8Oec4zeXy91ThjmtaknsrlSD2OdrObQ7yzXxSgf5SyaP8BYU
         X0eBcorAx+o1uSEQcbVG97kMBPSfxghxp+MWCXH9CdUQoGfBDCqtIj2sc0UnDCZBDc5v
         2SQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741077472; x=1741682272;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZVbEQw6RFiytzLhO8ZjD5z9kjTR3miKMHmSj3wWemVg=;
        b=jGPBbQG++t9PYX2d78cZk2rWFNsAdWwrXviFSSH8keLCroXqlon1ET6VtMmWSl4Ywy
         RDeu4zwadY94dGuGabTIM4BBN4D5ExWqxP+dPkoN7vW15rLJGNBhKwUZRFRKxNmZ6tPL
         pjiE0ffMaLGNXw/kKMEPS8UaHIuq66eg1eBkYoOmzF+BCg61q6bG6fJj9+5hSaqE2L6D
         rNCQ9j8KAJriXIhPgWQlji5u+tDiT1R0baxuMCRIrMmsJm/qfSoH6zhlHckA6+byGz/G
         DQ0erfHLzSbMIaN+n/wQ0ZVqFdo3ctFtK8cgbgOuZSmdXZfzvs3nm4VPuqxbJtxLrL/c
         AJBw==
X-Forwarded-Encrypted: i=1; AJvYcCWm52W4KkZE1Y6w7d+rTltpafy6988s8lBuJwtZS03CtcXfyD1XupNQusq5PNqHKmAAuH+Nz19FqRM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz20F8U2qlrvQVap1iLA+ndzy9Lg5Q3XJmV1Akk4ofVDvuWjHOC
	dYAJXCctsbNfq8DPxBtqvzqgwd07d48tw91aN+NFKnm55mGY3DlamIN/1eZyKio=
X-Gm-Gg: ASbGncv13SzNmLuiNMPvskr5lXXqG++ekRWoDyd4gkWrf87SsYQfgw1VrrDhXh2Czr4
	LhLLKMlNBnVzZQz644niNJJ+RBgYOsslVvSGEoLZvWdM18YKXutzD9w5T7jpAROnvOE1VkcOqap
	DLZh7+3aiANqqw40cxTlH7FGKG1VC0flvGhXEBl9QLMJCXiMuCn48yQuQiiB7fM3EVC9BfWiXdl
	x8grApXSvRSy+cw5cOk3610ar1XKxWWA7giFXKD7ybf0NNlk/0jkfgOh9yHiOCnp3X8xHg9u54B
	vmXqeUEOXW9ohbfN4wi0uKmxdDaOTwNIAAhaj4afMRErDfo81sZ5/swdG0dE6Rq0Xb2sp6W0axh
	Ux6ty8sjSWAYnrkFFq9OXW1c=
X-Google-Smtp-Source: AGHT+IHGTvkTD9fu2h/LbSP9/Yd5RUBp+SzgqOd1D6QzYUrOIsCFuwNCMHHcoRnNNIvYs952GekM0A==
X-Received: by 2002:a2e:bc87:0:b0:309:1c59:ec89 with SMTP id 38308e7fff4ca-30bcbb0c89amr3368341fa.7.1741077472196;
        Tue, 04 Mar 2025 00:37:52 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30ba4ac5f05sm10058081fa.22.2025.03.04.00.37.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 00:37:50 -0800 (PST)
Message-ID: <3210a484-b9c3-4399-bee1-9f5bbc90034c@linaro.org>
Date: Tue, 4 Mar 2025 10:37:48 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8550: Additionally manage MXC
 power domain in camcc
Content-Language: ru-RU
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
References: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
 <20250303225521.1780611-3-vladimir.zapolskiy@linaro.org>
 <dbxvzgqs5slrl5edqunal3wplg5jiszqv46dr4nzgowwlhkhxa@qwtfq7nfjwfo>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <dbxvzgqs5slrl5edqunal3wplg5jiszqv46dr4nzgowwlhkhxa@qwtfq7nfjwfo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/4/25 01:53, Dmitry Baryshkov wrote:
> On Tue, Mar 04, 2025 at 12:55:21AM +0200, Vladimir Zapolskiy wrote:
>> SM8550 Camera Clock Controller shall enable both MXC and MMCX power
>> domains.
> 
> Are those really required to access the registers of the cammcc? Or is
> one of those (MXC?) required to setup PLLs? Also, is this applicable
> only to sm8550 or to other similar clock controllers?

Due to the described problem I experience a fatal CPU stall on SM8550-QRD,
not on any SM8450 or SM8650 powered board for instance, however it does
not exclude an option that the problem has to be fixed for other clock
controllers, but it's Qualcomm to confirm any other touched platforms,
for instance x1e80100-camcc has it resolved right at the beginning.

To my understanding here 'required-opps' shall also be generalized, so
the done copy from x1e80100-camcc was improper, and the latter dt-binding
should be fixed.

--
Best wishes,
Vladimir
