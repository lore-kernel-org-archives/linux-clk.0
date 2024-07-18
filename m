Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A15E41C7F
	for <linux-clk@vger.kernel.org>; Thu, 18 Jul 2024 07:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721286358; cv=none; b=f6wRuy+MGkL7MUDBeSN1urM4oQXQc70l1nG2Y2XgiS8ANrEqBCh/dE+pvCNdSTqKCWn6KndGyJurNL8FcFN0Wq7B+mcVQR1pjQUkjHZR3arVWNkR5d4z7TBLaoyN7t4z/dVesqXYiJ1G7UTYvAlXw8YA17dakgevGWPI96vGeZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721286358; c=relaxed/simple;
	bh=ONlCOr94Vlebt+Tj8R0yQblOSnVNxli5b/oS4OkJ2Rc=;
	h=From:To:Cc:Subject:In-Reply-To:Message-ID:References:Date:
	 MIME-Version:Content-Type; b=lOKyc0RwyuwqlUL8FRraUzjZXI+rVwqfoyUM1tc2UCj7ukwBc9+kM0ytYbZ1efI4Zwy7Mh+sa2sqFf2P108UVaf3UO2uekEXuCfA/zuox+qyrP25+55WssZ2ezeUPlC1Zde382mpCAcwAMQYlzKdxZTkW3DH2RJyIqMxMVUxE/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=o0qdFaQH; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="o0qdFaQH"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42726d6eca5so3291475e9.1
        for <linux-clk@vger.kernel.org>; Thu, 18 Jul 2024 00:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721286354; x=1721891154; darn=vger.kernel.org;
        h=mime-version:date:references:message-id:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dfv35sh3gYQtuyIGmcm2dQB4xPWrXbKxJ/DGyIqTwEg=;
        b=o0qdFaQH/OYYxPAS1K9dRl+VCrf6PG8sE5zhGeq3uvZlPeoaMhn0OEESOz7uEt58MG
         ykLc3SfJSqnrxpcoDaqGwvGxZqtEBNNDHLE29Vhk1na5t9+s5IMltaeUci4U7BSwXpeJ
         I6AFkx2CdHY7f+fNjHCdrpfPzIbQNDg2r4yxA7/9Xu4UHpNMMxOWulLlVi4EmlUxNwpo
         tggGtab7V4nmM8/pXrudfzPBK9HbGvHptXp302XEnpZpunw281HggJJs1oxmUEKRVC5T
         NigE4dLE58HFcOJ4N40JbYBQNidnCwsPLn5ytC+DOxDcllWY1hCj81CYc1RAD0Ldc710
         n4cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721286354; x=1721891154;
        h=mime-version:date:references:message-id:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dfv35sh3gYQtuyIGmcm2dQB4xPWrXbKxJ/DGyIqTwEg=;
        b=uiya+EEmSCtFATUpKbpx2sa811G4DBDYNm5tODsRzdcC7fuYpMz/jyNBMGJs7x9ksM
         cbxiIubb8+4xCoV5OXYXMDLK+KQ8gBRIbdhb1OdYrmz85+rXpsjIB66l2uGD6LnEkQH9
         HXdFfBX+yP6uYVj+LP+JwoP6HlzPDbZOslcb8srxVWjcqgRPP2zUQDyFSQumP0wp2vJR
         xoIBtOKpcUcUBDy/+WfGF8lhE1dCoAdp1EuI05tz509GOxDT7gRp5Tn5oCXmwACaGsTw
         NihShK3uogXkDj/+Gg1WPC3tIEa4wdbW25dbJ6tmAvfAxyBaElqVqfKmkL66bJCF6U2T
         MMXA==
X-Forwarded-Encrypted: i=1; AJvYcCVx5xUjXWG4Bze+tu33HoeuT07whEesIynjhIstXG8pvqVSMTD7cp1jWbRb6dU5XU7DHXKb1/8I69Un4gT+VjeuGMxb3VtDArRc
X-Gm-Message-State: AOJu0YwtMsknmrT8pkhQvH1rHHoH0vzjzSL1mzoybPgGfxoryxQuqOt3
	a6XXa+/EBwBQ9ImqW3kXxtpbewU3FHpOVNk7hcbjX4JRTPNqON2xj87FY6H33HI=
X-Google-Smtp-Source: AGHT+IFTOfM/mQUajELxmAa5WkTAStnDIYPtSa8XPZN2j5zMvI+mGY2wGnKvPVh2ONzOHqDJuGcDdQ==
X-Received: by 2002:a05:600c:1c9b:b0:426:66fb:fcd6 with SMTP id 5b1f17b1804b1-427c2c99bf0mr21833815e9.3.1721286354188;
        Thu, 18 Jul 2024 00:05:54 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8d37:f44a:c212:e320])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427c77efba3sm23784375e9.28.2024.07.18.00.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 00:05:53 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Philipp Zabel
 <p.zabel@pengutronix.de>,  Jan Dakinevich
 <jan.dakinevich@salutedevices.com>,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org
Subject: Re: [PATCH 7/8] reset: amlogic: add auxiliary reset driver support
In-Reply-To: <7db2d8ae07a9ef1a226dfd08a3f88f8a.sboyd@kernel.org> (Stephen
	Boyd's message of "Mon, 15 Jul 2024 12:30:21 -0700")
Message-ID: <1jzfqho5pp.fsf@starbuckisacylon.baylibre.com>
References: <20240710162526.2341399-1-jbrunet@baylibre.com>
	<20240710162526.2341399-8-jbrunet@baylibre.com>
	<88d1dbd92e922ad002367d8dac67d0eb.sboyd@kernel.org>
	<1jv81cgv4z.fsf@starbuckisacylon.baylibre.com>
	<7db2d8ae07a9ef1a226dfd08a3f88f8a.sboyd@kernel.org>
Date: Thu, 18 Jul 2024 09:05:52 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon 15 Jul 2024 at 12:30, Stephen Boyd <sboyd@kernel.org> wrote:

>> >> +int devm_meson_rst_aux_register(struct device *dev,
>> >> +                               struct regmap *map,
>> >> +                               const char *adev_name);
>> >> +#else
>> >> +static inline int devm_meson_rst_aux_register(struct device *dev,
>> >> +                                             struct regmap *map,
>> >> +                                             const char *adev_name)
>> >> +{
>> >> +       return -EOPNOTSUPP;
>> >
>> > Shouldn't this be 'return 0' so that the clk driver doesn't have to care
>> > about the config?
>> 
>> I don't think the system (in general) would be able function without the reset
>> driver, so the question is rather phylosophical.
>> 
>> Let's say it could, if this returns 0, consumers of the reset controller
>> will defer indefinitely ... which is always a bit more difficult to sort
>> out.
>> 
>> If it returns an error, the problem is pretty obvious, helping people
>> solve it quickly.
>> 
>> Also the actual device we trying to register provides clocks and reset.
>> It is not like the reset is an optional part we don't care about.
>> 
>> On this instance it starts from clock, but it could have been the other
>> way around. Both are equally important.
>> 
>> I'd prefer if it returns an error when the registration can't even start.
>> 
>
> Ok. Fair enough.

Actually, thinking about it more I changed my mind and I tend to agree
on 'return 0' which I'll use in the next version.

The initial request was to de-couple clk and reset. I was planning on
having clk 'imply' reset to have a weak dependency. That does not make
sense if an error is returned above. I would have to use 'depends on' and
don't like it in that case, sooo weak dependency it is.

It remains fairly easy to change later on if necessary

-- 
Jerome
