Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0600A1A727A
	for <linux-clk@vger.kernel.org>; Thu,  5 Sep 2024 20:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725569628; cv=none; b=auYoAQHWnM6sdqSedgTgRjObEh4bPeWjqGseVdluc0C6Ps3EoyFsYEU2MgxENSzVWqWlgxUYlMfxySpWF1cIs1O3FG/7LtpKZ3AIqhsAIf3YiaVnlKCun4fu/l9ww+228QQzzSkEzX33ezR/Ov8Nvnh2hXte1xFGCJGis0Zk7uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725569628; c=relaxed/simple;
	bh=okpSZJ457TOGrWQFhXOsHpza1OncvzJlnkagzXGr9sc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bK8qJ1nWxZm1BPtdM9Fs1JQA1w16zthg9sa7xVXhqJZRCzUTZcCTlj8cuu289XP8/YR/+v8cCwkv8NE4d0BQJYIhkNWGXdDfJNH54Q65nfEAB+4aMAflkoZLTNsyL7J9z2V/yac+kzHi9nEiguUUOyRB1jbnvpEJ4BapS4bC5EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BjNVh2mr; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BjNVh2mr"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53652c3bffdso160593e87.1
        for <linux-clk@vger.kernel.org>; Thu, 05 Sep 2024 13:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725569625; x=1726174425; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nsgr1R8IvjXIPpmmwD+8IYKOWPeLr0RTzjyAwlJwjxI=;
        b=BjNVh2mrTM4kWiFl9gRX6+hdIguxhEvLYiuJjo+e7nw+BtYtpF2dHdHAVHA8GoVqee
         MbJQz1brO6A/hzZ7+evFBKX7zReY6dcO0TzxKQRtOlezMe8xe+6dt+r2xZ3PgVO9ohwR
         Fi9wZvl2WksybE4E05cxoaa4zNNLqsb2CSHP2nD1sCBUH6zkqGVe0iUSONMmk45FxC0r
         PeeSQsjzNdozzU138fpckLWnXxYLDvP59wYWbwMzzf3Xw5WefwjlsWiwxKy0lbPOFqAY
         203YG/xkODmJuuqYxNV1V2Xg2/6l2oMis6oOB99rO9kU/3Gabe3q6bVVv6mIf19g6iTF
         voIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725569625; x=1726174425;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nsgr1R8IvjXIPpmmwD+8IYKOWPeLr0RTzjyAwlJwjxI=;
        b=IkDWrFkIani0mvp4sSiD2wkPwN9UvH+xiP72UhyBl+2Bm55+11ZDVUOsYFpgYIVORP
         +QMqvm3xougWfAsfm5sq8PLHFvGC7XguJhlsZfmTYs1sT51ArON5ac+z2PZzSo+4yWYw
         9mv+3WjtsPorfdY7cV6ywI3TXnmtOW5XW8HcA5YHTX0JiSBjHNhgoQhNjA7WzpToibdq
         T6lUaXyqnixSwVT8MZMN18nh4/VRZP9lDHbrMZ22Mm1pW3UzLUtC5w92DU4nln9KjP+d
         Jl/mxvo/TABRiMJxvCbxuNJw4hUnTcU773Vh2RRSdN+br8pB8PMLrqCctFRLglQsHJB+
         D/fA==
X-Forwarded-Encrypted: i=1; AJvYcCV6qUZRRc8xbUdCIsadkRddfoMNOfauJImJfhpLzliS9qEgMg4I+3oFtD8h+FUSqvOyJUv87P8nf6Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLIo96avYam2hd4j8YpHHQzffX6K2YgKs+57/8Sd9ZLmoReIPk
	/AMxGG9axYxTvjT3VwV8/G9yJIQZlpxHo7U5wyqvomBtc2aCgk10it81OJ8kZUM=
X-Google-Smtp-Source: AGHT+IEO4KLXvOMoYHGx7cz+dmpyOoozAeB+4C+XIlp9W2jhjsnqyJ3FcfgbBB1A5mVd/UC9qlSOvw==
X-Received: by 2002:a2e:b8c7:0:b0:2f0:198e:cf8b with SMTP id 38308e7fff4ca-2f751f3ca74mr1464501fa.4.1725569624887;
        Thu, 05 Sep 2024 13:53:44 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f7504801fcsm660731fa.121.2024.09.05.13.53.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Sep 2024 13:53:44 -0700 (PDT)
Message-ID: <1d04e38d-23fd-4646-acee-0d306efaa756@linaro.org>
Date: Thu, 5 Sep 2024 23:53:43 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] Add SDM670 camera subsystem
Content-Language: en-US
To: Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Loic Poulain <loic.poulain@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-media@vger.kernel.org
References: <20240904020448.52035-9-mailingradian@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240904020448.52035-9-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/4/24 05:04, Richard Acayan wrote:
> This adds support for the camera subsystem on the Snapdragon 670.
> 
> As of next-20240902, camss seems to be a bit broken, but the same series
> works on stable (although it is much less reliable now that the CCI clock
> frequency is not being assigned).
> 

Second that, please elaborate on "a bit broken" camss.

Regarding the CCI clock frequency, it's a supply clock and it is kind of
unconnected to the CAMSS driver, here I would expect that some particular
clock frequency setting either works always or does not work at all without
anything in the middle.

--
Best wishes,
Vladimir
