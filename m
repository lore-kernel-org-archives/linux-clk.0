Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E63643CE77
	for <linux-clk@vger.kernel.org>; Wed, 29 Jul 2026 09:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785316005; cv=none; b=CbN7649VwL912AoVVPV+8BcbCQRxIwFSXRFG55b5NzjZF8HKaajt9rq195g8CJYRFVe3iFyz+NIvWKK6INKb41BxNThShSturoC2bKCkAIbOPAYcSRjqmLSrx++fO++LWclcl+xQbYn4xqRds88cOc7YOG1ye0FruogXVUXTCVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785316005; c=relaxed/simple;
	bh=Tj2A7G3xOugsZdpTkzC7PSnEnC2yGvZhcunhbg8M3xc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U6/ABLCHs33oqPArqqA6mq515lVOUXYNRkdq/ENcLWOUMbOwTqxz6OsmgojFST2ASXhybXKjUVzAqQXNuIz7pTYx5T7HuWmKj6p1cV0CSioSmKZeJNRoq8D7J6s12o6LqFchLO8fJghvKcx6HcHVcy1a7LCldEweUK/D15fjPgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GBbSHl+p; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GBbSHl+p"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-69fc2261f2bso1017812a12.3
        for <linux-clk@vger.kernel.org>; Wed, 29 Jul 2026 02:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785316002; x=1785920802; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ErTA5SmPrm2LDng6tlFDy5jDtcI+zchVNjeWFoCdYk=;
        b=GBbSHl+pS9ZsQi4PCOgA5QMbzkHSkkrmDAzFVu4Ilqa4uS01z1LrCc109Kb/9gAgue
         sloX7ZrnFL5oo7BYjIqjeek9KeY0wRlDm+cQy7yRzovRoKZkomdNgG0nVmH6CDL7fQjG
         mTjc8vbUJ75Ps4B3vAn4WPP5MUBvya8Em0CBzenH+g5AJte0gNdUgCkSbJ4pbB7gQuw6
         gD116gQe3HSvhbBSgW1vDz6ErWMRr7+wsub367V1ifTc2cGIUi3GAxRYMi7/rkyf65O3
         U+GB7431TytddnqnGuK52Ey1dWl+XamypOuinjxS2efQKFw5qYiiDmsEUoWNoqoY12rE
         Awrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785316002; x=1785920802;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ErTA5SmPrm2LDng6tlFDy5jDtcI+zchVNjeWFoCdYk=;
        b=Co33bys9XRI+WEep3cUsl4qnEXvPlHsnfdCywz0ay5pIiOjyY96nwEdWUf/+Re7rO7
         sSK7Ae1rhnhRUuq11RtkC2f9W/iMKsZ0IWuRLx208MmuRBYhQ39MXovtA5GJItr57Edf
         udFmeQdA+jmE0W+gFFPBF5NfOeNL6s9fnAxB4CxatZ1spwvd2WyRZe8KOsC3v3q7+3ec
         EzyxIv9toYU8OcNZipE/JjcW4hrCz8Ue890dATbiul8f1yEOty5gu35T/9exO41wUuhJ
         QqWLV+I2Mr0YMxqaXGKNn1EhNwqkGeNewd43zLyYv1nTqvCCIgi7lq3AwuKJmZhzAvck
         jv1Q==
X-Forwarded-Encrypted: i=1; AHgh+RpMlLdRTLSSsMQB6wqro0sMnWJ1PT+hP77lrf/t5l7CDt335bbNBFKgNFMwZZEDGpryQyXHq+ZPsWE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC6vLHlGT3MwKdxkSodHA15OJoovWvtcXc4/HKsMj8PIzI3Y0R
	k8eLjdht4I9iuERl9aHd0y2mxcuMCCSNL9e64bsk6FRtBxrx7zdj0vOzU/6W/xCpBNk=
X-Gm-Gg: AR+sD11Sk+dFCobLcRGer9JFaJTc/U81gaOefbLlD7juoG3TfGJBvIfVYFy2ph0HKSh
	RnQsN7HI/siRKx4Zk1vAwa21vh9ja8ShtxtqCrXWMrVMJX+x4PZH9xGbzXKsDMvvQ75Jv1fytEo
	FUAuBiKEcj0JhYAgSt4MjzioXDeSa1CpVmKyXqHtAfwCuFWdBb3Wsddw2R+tIJiBNMNNMRVz3oX
	y3myiRJOhs9+AUwl37aB/eiQRyBuekqnsmZitd6JWI/wGUWQy5PR/mzYGAvxGx9fJpXwD2P0NMa
	KO+5s34zAHqlKX5va+8xlYXesaGdWN1Azi+12t+F8yHLd8x++YDTvYujYrb5NUeeFR4tPVObafI
	GWk4enHTU3uGNFkM4tcDB5YT+Fsz8+e8VzawIlIKqiiw5cQjqFOVPkSQnmzCWsk4P5N4uYg7e5n
	NuuyKJHRfaTW6UJUY0nTV/IZi6pmwR/64OsGTz49TeJhddVIUxkQQF/Ywu9dgUxIju1pXJYA==
X-Received: by 2002:a17:906:f599:b0:c16:12ff:dc8b with SMTP id a640c23a62f3a-c1f72216e04mr326056966b.54.1785316002175;
        Wed, 29 Jul 2026 02:06:42 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.24.32])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f83ce1649sm86953066b.21.2026.07.29.02.06.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 02:06:40 -0700 (PDT)
Message-ID: <53d0bd5e-60c0-40ce-83e0-c123d191a72b@linaro.org>
Date: Wed, 29 Jul 2026 10:06:39 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 5/5] dt-bindings: media: qcom,x1e80100-camss: Make
 vdd-csiphy supplies optional
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org>
 <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-5-ae811e2f0799@linaro.org>
 <20260729-uptight-proficient-whippet-1a4aa8@quoll>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260729-uptight-proficient-whippet-1a4aa8@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/07/2026 07:25, Krzysztof Kozlowski wrote:
> On Tue, Jul 28, 2026 at 10:35:36AM +0100, Bryan O'Donoghue wrote:
>> Moving the csiphy to peer nodes means making the current supplies optional.
> 
> There is no move here, thus this change is incomplete.
> 
> Best regards,
> Krzysztof
> 

Hmm, I've obviously missed a comment from you.

Sorry about that.

---
bod
