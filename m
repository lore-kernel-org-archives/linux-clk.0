Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779667;
	b=Jl4YdJSsLMj8atwoKCWpMBPbEHrqhx661+QrdPzdzbQMDHi2TBngRhLahgrGS2KhkIYg
	 N0ZqUvsbMAKQBWRucTYhg3cqRlBDnOBBEYDy7zErsFJeJ8YQzqJZkWBFapLDvNNxtG8iS
	 fynZGA71ViOQ5riV/lO/XsedHexL6ru7aDTekM9M4UbipBJNrLFAa6qEWJzaEjb5k/Kmh
	 d0X6GNk76ylyLF5hwzAl/UsOQD4xJ0lIzD546jOn1RW9U5wlayxW8gOz9d/6qalmnRwBI
	 HF1PILAUiilyjN3x6q1/A/4Iox7Vgkw9oonF26EIaPtuhALZxj2rVbiJhcrqtXHLJOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=sspZMan8fZ1WKgEVFRKxVskK0Kuw/s541urtuJ+3PO4=;
	b=xllozsqa19dFPPYRCTvGhM+Pt6UccdTv0PxpkLyeBVNC2aOqOknFejuNFG1JeCC0VpN/
	 HIVyCciLu/Rs9sJ4lJnM+U3FUfxyNiZ0MhMQK4fLY5jEDRqVDmx3v2KzbyEOLP/cF3iz1
	 9H+OUmVeHatgTY+hLx8cCohqd9VSuoLyYRGcin/LILyuK8AY6pUQFtMRuO/I14NzJMQ20
	 l+j/Q/WM4uBcTw0Gxo2bQ3ixCvjXuseKk7IRstlIscsLbS7TjjVQiKzZndTItAsKFj+jr
	 0iW2a/9W0IuEpaV1L7AAR0um+QagxfvkyFmjwDNms1necu/MNYYvGzhziSTsgP/t97A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=z4pBFq4D;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E473F606A330
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 11:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E473F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=z4pBFq4D
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4ac08f4a0b2so5678932f8f.3
        for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 03:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795779665; x=1796384465; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sspZMan8fZ1WKgEVFRKxVskK0Kuw/s541urtuJ+3PO4=;
        b=z4pBFq4DGHKRE2CBAC7ty61dVHmbS2uoKy5+23PG0TJDFwxOfoFOlm9eP3TDnJHqRI
         ccu4+SlDcaPkkLcFHu0crmlJqfq1PbjWdliPwcS/No2cyEeDk7S5WIO8zm6zml+VZtob
         R+9t8aP9NWgE3e+nTwdEN2XbTaDxbGG83deHMMoPTi9Pa+J0jSdfbEuNFUxBDZpqiMzM
         a7JN2wZgcLi3Zrt8TmRf7MyzgK9cr3lqYtJsm9Qgt0RzqnkUu9yMhmSXhoi+I5raFcHq
         D9iv7tBT1jRXDeeNzzaQuvblcCvhQ5B6dgXG6Ji51CvS5oOvKljcIef5m9itZK27aaiC
         LSMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779665; x=1796384465;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sspZMan8fZ1WKgEVFRKxVskK0Kuw/s541urtuJ+3PO4=;
        b=yST9OUfsEV45CsL8G79+esskPZmylnLQjyPLokRlgBiX5jMKj3KNUFsOyS6tE+Rt/L
         ClpqghEPYPkxuCDygbx9ca7h2iCl/uNgk95ogmvSScf2/AzxeTReuJU6cuvb8Yyrt4Te
         eAs38oPzpQfuEdNVuVN+an3EK5DIjj4HwnOTatYzPOL0s+lOXjeksKGAIZMbGgM14YaW
         7i+UDbOzRKZehUEh9AoCF/K+SMcYXqZ17vFngspI+9gO7f3IzXq8nnQNFoZXUlYG73Xn
         Nw3ooUwBJhY/Q7THeoOcmELXliYr2xPFFmdvC/zwNi3m/mgm+aqMp8t6s6c8gl7U6XvP
         b9lg==
X-Forwarded-Encrypted: i=1; AL+hErGZuj28cwmBJbxlajlnG0L4LIU1d64LpC9yKLYvakiSvFOXZEtAJ+ch7tK/lfOLgRhFqBg0X/8EX78=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DdvmuAaABa0PQrfXZe9Lsecdpl1naWeeJvS5etwlZnbyFMJWr
	m2pBt9Yit4CPcbIn76GEoZwClff/GTwkjo1+bdVJjkGuLcFpT7euO0TDokobjCDCMSY=
X-Gm-Gg: AZFdTZeUn85KL6QSU8TG0Cg0ty7vFkNENzeU9i57ipRsXpIeB2UfFtOaeOk+nWSe+s9
	KtBs9uGOs3IWivcdlV+9hDVVp5B0fiUUhS5mbV7GYWXg4dYDO1WHNfUgQl2GYDQbLkzEeKfaDAW
	t75kAHy52xHHGxIsjhfSY7SOAWNYteQDBuSEkbuX5MqUPrHRzXGZKLsEbZCJmaGX5eBABJ8WUo9
	N3RYYMFir7Kee+yjDuXaW8mYIYXFXmljyWkGHFVvH4ALEG8HSfqU+ivoL0paRvrd9DFCfhnPCTV
	lUE2bmm3LOvt/bezyrH6AmvhA+mhXai9ANY6BE1jWFV+S5JtfQ0vlQb0H0WBRdjQ66DRDPZpzzx
	3+f4pY4MbN9fFs1MxNjCFYynG9yD7KTfYjVMIWjhWze1XcjLequ4AIxu9/q1mOI6Vb0dSragzcf
	NumHfx3UqxAW23Z3pRHXQu62IVzPLbxJpSOQdwdgo4lbfP5FuHOzCXgJzzln751lonNjV1Z7o3Z
	XlZgPqXLlNSF19axsD3S1/QFlohrUiXS+04CE1Wfo8Rm6HFJkEaAzpwadFkrOmD6TNc5uXk77/6
	THM7klKluJBjv5IAEPHib6+daO145geRVmyK8b/+
X-Received: by 2002:a05:6000:4617:b0:48d:f464:6989 with SMTP id ffacd0b85a97d-4abb18cbe2cmr47257937f8f.27.1795779665260;
        Fri, 27 Nov 2026 03:41:05 -0800 (PST)
Received: from [192.168.0.167] ([109.79.27.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm47672583f8f.2.2026.11.27.03.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 03:41:04 -0800 (PST)
Message-ID: <fe014b6a-964f-47dc-b16f-301762b4534a@linaro.org>
Date: Fri, 27 Nov 2026 11:41:03 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: gcc-qdu1000: Add sentinel to GPLL0 even
 post divider table
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Taniya Das <taniya.das@oss.qualcomm.com>,
 Melody Olvera <melody.olvera@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20261125213433.1438537-1-vladimir.zapolskiy@linaro.org>
 <20261125213433.1438537-3-vladimir.zapolskiy@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261125213433.1438537-3-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/11/2026 21:34, Vladimir Zapolskiy wrote:
> The GPLL0 even output post divider table is not terminated by an empty
> entry, the table is passed to divider_determine_rate(), and the generic
> clock divider helpers iterate over a table until they find an entry with
> a zero divider, thus they may read past the end of the array.
> 
> Add the missing sentinel to the table to fix the issue.
> 
> Fixes: 1c9efb0bc040 ("clk: qcom: Add QDU1000 and QRU1000 GCC support")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
