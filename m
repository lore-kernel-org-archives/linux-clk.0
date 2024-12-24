Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129F51C27
	for <linux-clk@vger.kernel.org>; Tue, 24 Dec 2024 01:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735002079; cv=none; b=gpVum2Xk+mAv+8FiZzK5BvwSOBK3wS1O6wSnPblHfgaC5STePMNmuV2m4dnPnsxrhQKW0KEiJYE6BcdolwRGk+S26FUxyRDpesA2Y+E7RBtTFg7oi6Mrf7xP37mRylHUhrnec9o81QhJsC7OSP7iH+ZjwqrWHjtkVKjd2nTdgao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735002079; c=relaxed/simple;
	bh=VTjBZDdASugD3kswoxr2ITUXWzGkQEVuNdaujYNYdJ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HMYKiQSrqqEN19UhNN7EXL8t9K1RkB/ZueY7+KLyQ5F26qMp8H5WYNGkhAjgQk5TgG93zgyzqOgFosZ6OZq8xy/gM3LjlCo+CeO2f8MW3t6BzoRM6uRys6MLS2OEkZP+0XaoIObFUUhIUYHn+3bO4TEyLBOshOowcIyEJIh+vvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gGXs7UIc; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gGXs7UIc"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43618283d48so34811395e9.1
        for <linux-clk@vger.kernel.org>; Mon, 23 Dec 2024 17:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735002075; x=1735606875; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kp86hapJwh9BF1daX3h02Pa8dcZyvAyCiDhiANA3Zk4=;
        b=gGXs7UIcQQnNSONsqK7b/XO5mjKdmgCvH4kpXA0qxLl2AEoy2kSOC+6gy35SIXLWYK
         mPjVEXu+SroAFJqRRbhoJNq5U/x27yq+RCKkl0R3Zw/O0UmD9dh3Qy7cJJPh4MwapHPB
         UNhmB4guhPqK7A8vj5rmyCWyGtS0C0pS6xMwno0NmzPcSJUVuHRPd2YuNmrGB9h2JK9i
         yJsPUZVgLyZ0uyIU/nlRQm4JPtOK1fkbr1Y3H35oKx+dEDod7HnSEJ9yB/Xwmz9jdLvI
         LTBc+1KHrEddhlpLxhgtuLiDt0HGoJQqKfhAOJdTTvPOTFTGF98F+kxRHXYdxObs0gBr
         Vumw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735002075; x=1735606875;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kp86hapJwh9BF1daX3h02Pa8dcZyvAyCiDhiANA3Zk4=;
        b=LMooyxTWQX6weVVob4HxRI1Kew7VdEXTT0Uq0MGepxtDzwC8YP6l11O1obFi5iObFl
         MdTpU1nrm6zQ4PG/CFIyJvsXI9+H2pb3F/afdbePC4s8TxC4IdiLxYiLpZKeHiDblwQb
         4CjcRZV1rBVewmlGSIw4B6z2L1zobf82Zo8WtuJJQZ869ayu3CBcAfOEIa3udd20m54a
         coovOBy9R6t5JHK8Jz9Tv6rxj7TK6xDvppADYcODGOqwKxpPlblhu+jUt0oP57hfAnn1
         8cx4TT5O8dD46Hiis+Mj2TCRMRKOoT5Nese/ouOdHknZtNe0beFiXTjS+L6Wgi2JqQac
         TnDg==
X-Forwarded-Encrypted: i=1; AJvYcCVjK+71VR/1h5fqFz/8Ph7n7lEO5oJUHBPvnCarGpzRkADEgqxpT1mc87/Ej3MX3ZPOJaQitn6tx0s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8CreoompticVKuA53MYVxB2QaaEXK0NN2I7g+AYXOyVWUJQol
	V4G6z88znO2R4zE0/G0OKCQoR9aENcPi/jZgG2aSmNkwCMaZUkcdoYSXBx+hP18=
X-Gm-Gg: ASbGncsUvdmIMak8TN6Dut8Qta1zjLgmIfqN0nlPWl7eBpG8mGyxZo8w0Vry0PVl6vj
	U3rTfJD9MfomuwFvr2/MI7uy/CDTf/qAW5bQcrpspyrjkLhVm3B9DNoWsTDHkjdFvoT6WBiJMHG
	P2xIZwBK7wi2w0LDsVDrusKFeLoSOJH5hZPAfDcYzwoYXsiMt358yX+Iy1qTDCsBsfKEa4ilsdC
	Q76bPF3fkoPV8mExZB0W6l38g81Tn6dOmZB8GbD/+29L+kfyPbCpmomzIK70aG73oWk8A==
X-Google-Smtp-Source: AGHT+IFgDGmqmDPhyXR4nLgbVh7DgOs3lG+VS/8qN+gUc2mvLbY5Wmdth9OkKBZSOAeArY7B/KdHJw==
X-Received: by 2002:a05:6000:4022:b0:385:e879:45cc with SMTP id ffacd0b85a97d-38a221faa63mr12093565f8f.19.1735002075172;
        Mon, 23 Dec 2024 17:01:15 -0800 (PST)
Received: from [192.168.0.34] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c829235sm12506493f8f.15.2024.12.23.17.01.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Dec 2024 17:01:13 -0800 (PST)
Message-ID: <1de7bfd7-0bd0-4e14-b52a-ed6e3bb7a09c@linaro.org>
Date: Tue, 24 Dec 2024 01:01:11 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/5] media: qcom: camss: add support for SDM670 camss
To: Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20241218231729.270137-7-mailingradian@gmail.com>
 <20241218231729.270137-10-mailingradian@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241218231729.270137-10-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/12/2024 23:17, Richard Acayan wrote:
> +		.clock = { "soc_ahb", "cpas_ahb",
> +				"csiphy0", "csiphy0_timer" },

Broken indentation here and in several other places - please fix.

Also you should rebase on media-staging as a 3way merge is required ATM.

media-stage     git://linuxtv.org/media_stage.git (fetch)

Other than that, this looks good.

Once you've addressed the above add.

git am /tmp/\[PATCH\ v9\ 3_5\]\ media:\ qcom:\ camss:\ add\ support\ 
for\ SDM670\ camss\ -\ Richard\ Acayan\ \<mailingradian@gmail.com\>\ -\ 
2024-12-18\ 2317.eml -3
Applying: media: qcom: camss: add support for SDM670 camss
Using index info to reconstruct a base tree...
M       drivers/media/platform/qcom/camss/camss.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/media/platform/qcom/camss/camss.c

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
