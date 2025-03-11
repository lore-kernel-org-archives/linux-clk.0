Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E0D230BF5
	for <linux-clk@vger.kernel.org>; Tue, 11 Mar 2025 09:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741686895; cv=none; b=hAw38w8uZSIQfq/j0834NZukXXWVc9y95QjpOOnGkaBtfzOcORMLO3MPQ0Agp8CO+2JZ9wovQHkPP2ZF6g2dooqwrnWwhO65XstQjf47iezy/pmayji57OHpEsggQ4hytQLKQ1439EQy5DuIkYz3uTVsuMDedovt3nUQZoTpIvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741686895; c=relaxed/simple;
	bh=zIMXX8m/RgonXr24DzqiYSlGa7YPlTxmBQW7NDrORqQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VMIjF9GggqT7TEeOHCaXxgUx9WHsdCaxw9NpPBiSwAh5MBdbtXO/F50qU+A4AwITYtZcxEB4+aEQ520YFMw97l2rJLEGgza83dnNoKx1cmIZUC1S2vPe5RzX+b86Z5Md6UZ4c1SUbV8AVP4H8n6CLOSL/N6Pd852PZIROud6hZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VA6iOq6K; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VA6iOq6K"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e5b572e45cso9462702a12.0
        for <linux-clk@vger.kernel.org>; Tue, 11 Mar 2025 02:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741686891; x=1742291691; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jm03UvuT8W5Rpxcu5rSdy8m6+zk+AKlN8ozqhEmUZCQ=;
        b=VA6iOq6KkVUEuTEI6l544PWha2pWoSFgIjGk4FxPJk9JViKnSF6UTh9fYr+xPESYI4
         +TFbDpGQSsR7IKkOwHR0ZxTNMGNiFQslNRI0ec6/BQFO+j3KNu0gGJqD6L6d5vA2I2YK
         e3Ze+IpwqgXaf7Hej7TCkjjH6QGrz8n+41eTMgXmYTTtx/W26ihe2CZQEWFV6ZVJGKDg
         15M2bTSV72R0JR/IrEcCEaCVkSg8JOdpsW5ejtIOfCzEgYDYvFAk6P++27rCV+Xy/bKc
         1HguzxEGHSuWIIbaitULEWHqBau7B8jYrLi8mlRP+4vJma0PIsR3aFHNEEH/+ni5WsSs
         81Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741686891; x=1742291691;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jm03UvuT8W5Rpxcu5rSdy8m6+zk+AKlN8ozqhEmUZCQ=;
        b=jO+5aJztk3wGHoSDAtfo4h2+qhxrxTl9YhbpxhLhDibYziogJpB6p3PSPuRjhU2fho
         FrWX+khSOKOp7RFgqyz5X1GgpjL1P2wkDCtyNE2MGgwFPdKBH+f339i4BhRMnQHg+pwa
         n/z7j16RZvM8eXn2Whp0t+GZ2HPbmChqYHmqhUE9iopiKkBhdL66uXyGhV88c+skCSZH
         uzvl7Dv9oSVd1r/P3Rxnn0j7coFX59RmNwWPVc32mTAk+t92a+NbW7+am+UMooaHIBcn
         ahV0+p+aV3dTvyTfTXK2hysqed6bAy3x/VYT2YuxtXVsfCZ17yzrpUuUb3iZ0iTSlH2p
         nXTw==
X-Forwarded-Encrypted: i=1; AJvYcCV0tnrIONglH915zsZGOSaKH457QanmgrdJqQiDU8pvw2cVenkDUO8/SDaorB17NOZsPrF3FhwfpRc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4zucUBOvtl/Rr03KQW0dMrJowCFSB4oClSY5a7o6oy2fWlxTC
	BupyepTsyyxAtoAwFfyM+neAISUCuuAX5AusjQXOBXsn1BjAG/1Ss9un+ufwfs0=
X-Gm-Gg: ASbGncvkS1/0nkIjJt1ZiE60yGFGbTrfh7yHqkvlkEeXVb3CT5heHQk8X7WIVzb6gJL
	z38OxY7/xs1YBBqjo2pT7FUkgIqvC5INP8hvi2XCp7QlMnOW26uZYO4JKfGxKKEqdsU8NLi59c+
	93+3vBkvyGvafR8jEzw31MTwUzxYLieN8q6ijZ5hgE+Zo38Ec0jIK2QDYrEZvQgJ9COuqWh9HOq
	FUJ1lECQBxdY34pnDhTNabxt0mVOJDHP84H3w2XiGXspwlcBBZTz/xktUADJpiyJxj7DVgHzIiQ
	2TZaGv0SDqDmeCVDKH4VoEtrSwqydiY2MQd+MQ42ywWRiOfOnC/z8bS9i463wnJyW1fysw1PeXK
	vinvdSFYCkA==
X-Google-Smtp-Source: AGHT+IGKxxOWPNeiHoUYs+NA4pDEtcYz0NGKwKD5GEdsLIcqat9tyNzB39oWArbJ16F0FMw7l3A1xw==
X-Received: by 2002:a05:6402:43cd:b0:5e0:4276:c39e with SMTP id 4fb4d7f45d1cf-5e5e251190cmr21540775a12.30.1741686891372;
        Tue, 11 Mar 2025 02:54:51 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c7472128sm8062047a12.23.2025.03.11.02.54.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 02:54:51 -0700 (PDT)
Message-ID: <7a5518ad-b470-4c5b-99f0-9b4952d332ba@linaro.org>
Date: Tue, 11 Mar 2025 09:54:49 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] clk: qcom: videocc-sm8450: Move PLL & clk
 configuration to really probe
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250306-videocc-pll-multi-pd-voting-v2-0-0cd00612bc0e@quicinc.com>
 <kUTndZWoRvG2gR8cIApkGInFovnNrSc1iN3-UjzJs6kRXeDesVooOLe7ifOFUBsFkixyW_IJ35V8ng4ydqQvGQ==@protonmail.internalid>
 <20250306-videocc-pll-multi-pd-voting-v2-4-0cd00612bc0e@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250306-videocc-pll-multi-pd-voting-v2-4-0cd00612bc0e@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/03/2025 08:55, Jagadeesh Kona wrote:
> +
> +static struct qcom_clk_cfg video_cc_sm8450_clocks_cfg[] = {
> +	{ .offset = 0x80e4, .mask = BIT(0) }, /* VIDEO_CC_AHB_CLK */
> +	{ .offset = 0x8114, .mask = BIT(0) }, /* VIDEO_CC_XO_CLK */
> +	{ .offset = 0x8130, .mask = BIT(0) }, /* VIDEO_CC_SLEEP_CLK */
> +};

> 
> -	/* Keep some clocks always-on */
> -	qcom_branch_set_clk_en(regmap, 0x80e4); /* VIDEO_CC_AHB_CLK */
> -	qcom_branch_set_clk_en(regmap, 0x8130); /* VIDEO_CC_SLEEP_CLK */
> -	qcom_branch_set_clk_en(regmap, 0x8114); /* VIDEO_CC_XO_CLK */

Dmitry already said this but, this change feels like a loss of fidelity.

Please find a way to use the existing helper functions.

---
bod
