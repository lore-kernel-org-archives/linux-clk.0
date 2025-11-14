Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FE0304BBC
	for <linux-clk@vger.kernel.org>; Fri, 14 Nov 2025 13:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763126525; cv=none; b=S/1zxliDAiOQjfjQrYJ3HGyRSefWncUxEciyeudfMq9Ch5RX/xFJMeDhcUVurBvpLp3gjd9dMqTGpd9tCQdSJ9gUl/agmIfpPMsfpH3/s0qjnqb853h03U22adEPsHM+4YWCDVAMd/IzhYy1W8Zm27zU2THuLwVYbrKb0xJn/i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763126525; c=relaxed/simple;
	bh=PIhVxornY+xeHydrfUvm8sKztzt4GgYtkzvZxgJ8W40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mwW+FBZb0F5iEJOfq+uMlmS3+8gTaxylt3c+k3KI4t9Qux+q1vf+UbEDLWvMD7ESVc3n7ed+asp36yEz1K1xRoaBvbcehAWX0Bd4wtIkrk28Id0n42gjR0O72Izs/5coyijfD/7wG+YabLOqf4qPiGdwuxRzaGd8v8JPYjo1Tqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JLxJBecV; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JLxJBecV"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-37b9728a353so18753071fa.0
        for <linux-clk@vger.kernel.org>; Fri, 14 Nov 2025 05:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763126522; x=1763731322; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TrtX8x6xiGPlcF3REo6XTaulSDVNKE90sjqlhnGudPU=;
        b=JLxJBecVTt7ci4MySHtaJCX2RuSWm+47+kgQXd3+q5iCTC6xRsKVeS4VMO2C6iKoUi
         7wC7myl8516ZyD8NfP4qhC6InalfcMWDXVAnbtLDFNwJ6ARwpQfEZIrsLX12cgIT1uql
         lrk6TGIK/1QEbP5uaOpQ8lOu/DJZfSzIb3aiGlYvsoBl6Z+b0tkjB3xpz6kbj1SreGpl
         da9piGtvNIXkCcYmoDu2sNWR9609OQO1ta0KvjdQNYb4U1AiIS2D9tvNsn+Wv5udjE9n
         tKW1+Vcx+V8JDmWgyb2Y2iuVQPq4hnOZ7a48Uw3v7Cx5fOHYIAEu4dBdezJxsOSPM0Es
         tZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763126522; x=1763731322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TrtX8x6xiGPlcF3REo6XTaulSDVNKE90sjqlhnGudPU=;
        b=m1OUReRnWzvQgy75pgrxagmvgL1r3A4T02LQ5siXRDqTHnCDQ0jMrYIrD+7D2VmXLx
         9Edfd6Tyb9e6EB6GUP1iVPeXeW6L3Qk1RFlfFi23SxIikibQjOS2Y3brdHUkyBeUzHYA
         MGWHEIxjVN4r3DxacuMnFNJs093An4CF/phXEMkRzdnSLNJfo3XoVIo2T3vI7AjEARuB
         PEM0vEP43mqy756+wrIEUDjMV5GbNV+AtOyGn0tabneGYYJJvTDzA9eCkHCvwxJJWOof
         oYPfGzAcOkGBlIGJKNPmxYtpauWzXXgT+v9/0ZvIZnbqUeTtQuR6azHPyHVRiUEFS1Pn
         tT5w==
X-Forwarded-Encrypted: i=1; AJvYcCV3GrvXkMVGlReKFiPUoPZwa2IPfDydP1MNo29nwhDGmF6QpR3aNoipZEUrLiENYRHSudrNlO6OY60=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDqTBO+97YzQI2ThwezbIB6e5SP5+96vvGgDz6VJd8RVfjb9xK
	3nOuCW6SUqSfFL+oglNF73puZeoweayUylzvnV8caCJbZ1MvOX4F9JTP
X-Gm-Gg: ASbGncuQsqaDMbjokw7F5GM1Y50ApMI2ngCvs+9NnYCpdmp9/KOvidoIgAWPGePZYKr
	1sYEIiajzeWsJyyW55TclFfPDPWKXOmOrYWzTzfU+ohP6MRnM7nw5XNRPZ8NcEe6Xhv+GCFl+yI
	aIYPBVtMQVYbo9DCdRipkQ3Zkejqu3yUxw+Gr0Bi/knHWPG8O3jT7c6oraZVQUTEoy4Waf3PAbZ
	uLlq881Pi5wnOY3+5TckUrFTtEClZweUwKTMGkkW2eKfz9WG6AlfLV8/3v1z0xubj2TEW2cO/fg
	VvIvgN3fEzzdYneWiGcEhI0UcDHoaB+a4v35N5g8M/StpQm4uie9Yf/vfrxIq7Kg542qf/F/B9U
	EJe1d9TA3ugqoWkSyIUlaeqsKTvEzpBTDRQIB49+eRfvbnD1En101QNdLunHXD8EI4PG0rTm4fQ
	Edz65klOu635ssP+j4dmNGdVmVzqOmre55uTjZfjZfj9A/vt8ApLgxkdOq9Q==
X-Google-Smtp-Source: AGHT+IFJvPwRc3iSb2WexT7/Nxb76MqMei5zXQUBPxVbaOVwZ0mTUJAzGoCKPRFSwFTVf5iDU0WZyw==
X-Received: by 2002:a05:651c:418f:b0:378:e3f9:2d26 with SMTP id 38308e7fff4ca-37babd80ac1mr5793261fa.39.1763126521767;
        Fri, 14 Nov 2025 05:22:01 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37b9ce080a6sm10220141fa.4.2025.11.14.05.22.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 05:22:01 -0800 (PST)
Message-ID: <2334e57c-a384-4a1e-9708-19d14b8f082c@gmail.com>
Date: Fri, 14 Nov 2025 15:22:00 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/16] power: supply: bd71828: Support wider register
 addresses
To: Andreas Kemnade <andreas@kemnade.info>,
 Matti Vaittinen <matti.vaittinen@linux.dev>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <cover.1763022807.git.mazziesaccount@gmail.com>
 <6248200397d3582fe926938736da66d6bbf9535d.1763022807.git.mazziesaccount@gmail.com>
 <20251114121509.629d171b@kemnade.info>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20251114121509.629d171b@kemnade.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks Andreas,

On 14/11/2025 13:15, Andreas Kemnade wrote:
> On Thu, 13 Nov 2025 10:55:39 +0200
> Matti Vaittinen <matti.vaittinen@linux.dev> wrote:
> 
>> As a side note, we can reduce the "wasted space / member / instance" from
>> 3 bytes to 1 byte, by using u16 instead of the unsigned int if needed. I
>> rather use unsigned int to be initially prepared for devices with 32 bit
>> registers if there is no need to count bytes.
> 
> Well, this is totally internal to the module, so no ABI/API changes, so
> there is no advantage of using 32bit now I think. We can switch any time.

The only advantage is to avoid the churn if 32bit ICs are to be added.

> But we have 32bit stuff in the regmap cache anyways, so that is not above
> the general level of wasting space.

Exactly. And, I am not sure if sparing ~hundred bytes is worth the 
hassle - even if it is hassle internal to the driver. But yeah, we can 
squeeze a few bytes if it is seen beneficial. That's why I mentioned it 
here :)

Yours,
	-- Matti

---
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
