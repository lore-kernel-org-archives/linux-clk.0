Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3064219D892
	for <linux-clk@vger.kernel.org>; Sat,  9 Nov 2024 17:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731172931; cv=none; b=cSFd5N2hlvUzggZMXyNq6aU1nd4n8r4xfUn17whLpiCGfQVz29n9ATvr1uzpV/JZ+VbDfNVCbww86iIryatXUtNutL9jynOeiawvqtuWQykIMgr2N8qtmRVbkyB3EBrBxFZxWZQw0hAauxqW8KDd2yBOWGAUSfpkWRRbpvOJBeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731172931; c=relaxed/simple;
	bh=pgL8gsiXuEpe78oaOwjEtqdG8Xlsm054EJXb7d6pd7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cQtjDfFu93GGlGNx6awpJHvQgm72AfKm3rnJ6qbbtC7gURKjdbLYiCtQNe47TttqEXu2ElJMWpMQ76Ws9Iha/B+YszTRxsYM5kh/zNbPIfcp4ghAoN3FFBASAKEgtufpFHUeegkhirwjP8B334QzspsVZfcEfBS1QNhMfbFgngo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oM+ZguEX; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oM+ZguEX"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37d4c482844so2135960f8f.0
        for <linux-clk@vger.kernel.org>; Sat, 09 Nov 2024 09:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731172928; x=1731777728; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5H+n8hKwMU/rFaCD0qvnq17NXDKqhdH26m0nFiBdOLY=;
        b=oM+ZguEXfwzEOX3QoaBZ5AcZCNo3KI6oNA5P44mMKID10EwP9JZbM25g8mpw0Pge3m
         xmz4TT4ncIYvgiKY9m/YnaJXaVXEc1aRf6/OnZZ28agEBr4iWdXXCzek21ODu6mXvDWV
         bxTHhDfQHkuOUS1ejUnQpYvXxkEphxXk7IO5U81BKczVK2B43aRP3EeR+iQHhqnDMll+
         anMkN6tqyqtnHugdP+h9EGdk0tu6uoJc8kpBiOP+PjxkyR+OEvtyIAlvpiEofuL5xcFy
         +qj9REtU4d4J1NsHQfuMfTYNSg0eavkLLd2TcINy3UcFW+WXp0MoodbD0mkcIJOBBCFz
         Casg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731172928; x=1731777728;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5H+n8hKwMU/rFaCD0qvnq17NXDKqhdH26m0nFiBdOLY=;
        b=W/Tmzk8LYvCkLIC5J7EnPg8HJRzskP3Jw5SuCq15xbIVdKay1V/T2O4pv5oCcB05G1
         d5+6kTcPbE9myDbPSYMpXZQCtWC3paV7YZfXEh52KyNn7TB+NaUGd/p+o4Oz0Nn78t+h
         rx8x25MCiIOgao/OXRD0kDbkHQXSNb4evHofHQfSpFYCv6gOMQWliYJ3floNlqpEYZqV
         x/RCK04u3sBvQrh6kIBjcpTMuvElATHgZchPbMspt8PYQ/b07Jw/pVGv1axPx7Y01Oq8
         5MfgKsVj5JR2mgpfxJSspOhXRbz8S8nIFVKh7vtR50HrbBTYxluil7Yvcu7fAmUuzu08
         Q/+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVZKfbOB439Bh3zQ3b3ifYliHU4369bAMWiHSikZ08UhNTsczuFbfQKbzCDF0a/wRf7ITWll1M44J8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFouyDgfJoeK+kmM/e47gZdbB0tcJpVlYs6ghJqqFcX09Y6o39
	px3Dral7vIZ6Pas7n2gH/VIE9K50rEAbcjyikrt287zp1TMCXo6OH1A00nR61PA=
X-Google-Smtp-Source: AGHT+IE1RYOVGklIyE1IORLaNjLIY04lZliu8TKuSyMeu3g+/8dlg1C+LHnaQGhacvYdKXljs5Yrzg==
X-Received: by 2002:a05:6000:418a:b0:374:cd3e:7d98 with SMTP id ffacd0b85a97d-381f186d1a8mr4237152f8f.19.1731172928458;
        Sat, 09 Nov 2024 09:22:08 -0800 (PST)
Received: from [192.168.0.48] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed997320sm8285603f8f.47.2024.11.09.09.22.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Nov 2024 09:22:07 -0800 (PST)
Message-ID: <d4afdd01-3147-4cfc-820a-f6004637e6bf@linaro.org>
Date: Sat, 9 Nov 2024 17:22:06 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/11] clk: qcom: videocc-qcs615: Add QCS615 video
 clock controller driver
To: Taniya Das <quic_tdas@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com>
 <20241108-qcs615-mm-clockcontroller-v3-10-7d3b2d235fdf@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241108-qcs615-mm-clockcontroller-v3-10-7d3b2d235fdf@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/11/2024 04:09, Taniya Das wrote:
> +static struct gdsc vcodec0_gdsc = {
> +	.gdscr = 0x874,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0x6,
> +	.pd = {
> +		.name = "vcodec0_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
> +};
> +
> +static struct gdsc venus_gdsc = {
> +	.gdscr = 0x814,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0x6,
> +	.pd = {
> +		.name = "venus_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = POLL_CFG_GDSCR,
> +};
> +

This looks good to me, except; could you please check if venus gdsc 
should be the parent of vcodec0.

If so, please add it in, otherwise.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
