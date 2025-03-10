Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0739C1E1A33
	for <linux-clk@vger.kernel.org>; Mon, 10 Mar 2025 21:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741641349; cv=none; b=t6SKXThPyizfujAfFO93wPeoDU8n/zlwA09uZyX0cxZ1ULkTGQhKs9SWiGsK4prsNHR+LoAyMGrm9BKxqx7MH4njoCiiWIenRr1w1dmSlt1ABdKsvLjc7oXtL6DmoNfJ5PfYsys8E9QG4HUZpGfUps+HKzoeiSjMSo9la76/czo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741641349; c=relaxed/simple;
	bh=PqOVgE0V/OfFJoLKbJdR0nv4yrcRKzUDgpjl/uoMMsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qmDRtgtIPk2RFY36z/nsDsp0Du0psyoYVSbqzVkosIlk6lcTmasfQNmdscXMjgCfU3KgKSA3dj5saSzEQr8IC81hg49YZO/kNJbg71o1N5mj9vNQQcpEeypwqQ4sOj828TuJF7EYUp/UbbOr6VyUJsaChEHKd6CXozxOAIWoRik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZrZGVyhx; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZrZGVyhx"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30bfe08889fso1561161fa.0
        for <linux-clk@vger.kernel.org>; Mon, 10 Mar 2025 14:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741641345; x=1742246145; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2MvLqGAPwBaueNzkaD4MfMCpUMY9L6AflqhOMx8Pn7s=;
        b=ZrZGVyhx3dJ7bjqju+OYejv/2I3EARS6JPlSyYfdZ6gOHlZIS7ImZCDRKz8vxd5tgI
         PK/BO/LwmbomvviJSN2wNOoN1cGAWzsVYN4D6QRFgrvf0hproZPVpPEtvSaD4F7Tcr+0
         l8JRe7fsdOxYlJV/0vbsJ3SUBODMtAI4NcVa5QRFVW6VoaDGsMWqeGu6nfbrdFGkdM//
         hQG9bRboklAekkN3LLCrYumETxNZwyhSlb8nCuhKasZOsxM2x40HD4BiYh0+OP9HV+JW
         J9hOmX9JWUroKAoaCpPOw4sAFGosdBvReRVhRPSrEpaGRHQNLOz6XWM4OL/07mj49TaU
         dW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741641345; x=1742246145;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2MvLqGAPwBaueNzkaD4MfMCpUMY9L6AflqhOMx8Pn7s=;
        b=AG3cH2skVKeGoZfBPVwVUM9ro9Xn0xmn2gR80S/hewxQVRTbDwYt7uQpiNnHAxzntB
         Winy8sYiwVshxQnkIFXhk4LciIM6+iW4p1Y/bdEybGOhQKx+8gfx+dpfJNkS41fe1Scz
         RU36JLNqaS8IIlAsSUsFhQ9CAg8ETODzA7DDhbe/bqWpxybQSv6X78RMQBBcGGFIlV8J
         aBcgm7qlLVDdlXpEaSTKpqVf0aQLjitTPmphnHuiWqzWUDB5XxEbxOo1tevMr23Bu2gm
         hnjVgS9AqwyQxBYzOugHnE57VgZa7NYNHZFdt3xKVOBMpokLkth0RBxVP6oAdRWfTIEw
         U9qA==
X-Forwarded-Encrypted: i=1; AJvYcCWllVFiZZU7gjCvagZMiGa5ft6mfC+Knxk4ffAUp9FcurwcGUVv4k6/SGvjGryh6t9wJRpjpE520m0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9Vog7Sne94SJDc137a32MVW+NaW2dHKZWdR6I+WLkPxsIyNgV
	zzDA9Me4kOm/9jG9XlypTJGMUXpAGvZYRDzf5vcJ1sABCukq4mb+FBL94p4iUtU=
X-Gm-Gg: ASbGncsNeKPXpvaGIu7Io38CqS7dkRa8aJOee03UlMz7c283D6uE6VlIfzC+laVHrHk
	b9VNbrT6b8EDuGm653cNNaU+19SO7yxFIJyo+XpNLPWRjY0LC1Vo7Gub6d036M3Gzwx3c8PBIwe
	WnWycCWJGXsITxauK11YE6APY8EG3/OuJYwdigTsPBBxvhC9/UyxIMGnnHU02VgOEuMqYVDJjIy
	Rb0h6Zyr5nIPIltFRZZR7QMpCCBeVEBEqpHcQZ+hiN5e2JeBqDHlD4AaSwAByG7im9xbwa1aeW7
	vMkMNaOJACvQm3enwLuWU51w/K2pRMGyY5syeahbctX9577O/DaTR7hVawOZX+JAVBYhnJZ0OuW
	yr1ga8GoHrjH1Mo+9a19exLE=
X-Google-Smtp-Source: AGHT+IFEEGvRAmlkS7mP1u8TkcikCwjIGUcDohSXkLJe9GTEibzUbHy7zmjsIRAA7zWVdtf6JcAsyw==
X-Received: by 2002:a05:651c:2220:b0:30b:f23e:77f1 with SMTP id 38308e7fff4ca-30c2076a4f3mr1672051fa.11.1741641345081;
        Mon, 10 Mar 2025 14:15:45 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bf4c9c71bsm15116051fa.37.2025.03.10.14.15.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 14:15:43 -0700 (PDT)
Message-ID: <0a52b265-57ad-426a-b4ff-8a6bb5845636@linaro.org>
Date: Mon, 10 Mar 2025 23:15:37 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: x1e80100: Add CCI definitions
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-0-c2964504131c@linaro.org>
 <20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-3-c2964504131c@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-3-c2964504131c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bryan.

On 1/19/25 02:54, Bryan O'Donoghue wrote:
> Add in two CCI busses.
> 
> One bus has two CCI bus master pinouts:
> cci_i2c_scl0 = gpio102
> cci_i2c_sda0 = gpio101
> cci_i2c_scl1 = gpio104
> cci_i2c_sda1 = gpio103
> 
> The second bus has two CCI bus master pinouts:
> cci_i2c_scl2 = gpio106
> cci_i2c_sda2 = gpio105
> aon_cci_i2c_scl3 = gpio236
> aon_cci_i2c_sda3 = gpio235

Nitpick, please consider to swap SDA/SCL everywhere above, this will convert
the list of GPIO pads into a neat alphanumerically sorted list.

> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir
