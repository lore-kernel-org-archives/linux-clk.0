Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30025286431
	for <linux-clk@vger.kernel.org>; Mon, 19 May 2025 15:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670278; cv=none; b=kFfpX0smRBKoSJ6orgHLLN0Kgln4+dW/DR6bnRugu77G4B0pU1h0nf59nWLTh8+NJX3TBYePKrpJHM/Ywsb/rUAG70kLtyJo6Iq3JBV5WvGqvA4iylEf9Ms4p9karE+uRSpwvmPpxrwE+Np1y5wo+kc8O0bc42rvJJR20hXT4dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670278; c=relaxed/simple;
	bh=kDzZH/2//KqHjtRhP0MAmXrUXCabtr3kxzCKj86U3ws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SVLRnOfSmfcFqQrTBrNWICKEz+I9f1yxf0Xfn/9epZv9RFiLIc9VyXRK2YrFtq0CwHEM2eVjNKepOiwBIyeEc62y8FhvTtuSTl8WnFWl1on1t5AIx4enbd7H8k/0mAbqoVcoJdG+OcAflU5Zy/oy0bXS7iDlAprw3Dw9q1w96eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=OOA6fHnq; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="OOA6fHnq"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-72c14138668so1507005a34.2
        for <linux-clk@vger.kernel.org>; Mon, 19 May 2025 08:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747670274; x=1748275074; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PNI7NcwENluO3zokSTsjvdClRmMPUb+KHUbQq6ykMN4=;
        b=OOA6fHnqrd8XpwQtTyQdHYmaSZpFJumVIbFkClc705xSbXWIGCW+QbGlkICp9cyLml
         HVoxuLjaMzrqxhGyKk0Hjs2Dp3Nz2hH2mtD2ilAx+4oLfzCewT7oBaHGW0yhr+eESPqF
         YT1OUyeXC18C2xq6s3wIE4dNZWqWaM9132fBM8KaqGSl1HAPabZ7gQsamyG9G8a06NF5
         YBq3KW1tquKYGwoaNY/QfBBawFLbQUg+5ckpO5HL7m2gpJ/OKZy5tiBPyLWa+iwU4/Uz
         t2T9JecbqPwLdAekw468cBJBEZMMtnDRM+d14VmSZPyUlxVj91uc80sicwP3xAW+WWRp
         VvDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747670274; x=1748275074;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PNI7NcwENluO3zokSTsjvdClRmMPUb+KHUbQq6ykMN4=;
        b=FphbIaoq3XBfp6Kbcdm0SR3KcD4jC2ZaorUnm/rQlXGu8e9e/BKXVYLF3Ya4Imtwto
         vI0DpPI6bq7NPMEqSbOd/0w56WM3sNQG0kQoMriZoousPYkquwdXTi85oViiX4wJZxtz
         HGkcfqmz6I3adruFYwNSBWQAJ+lQnaBacHHH0+Xkd7O7UC4IE2QawphELSHDn+ISZ1+E
         szy7Gy1axolMrNBukJdOqKXK8nfXrku0I9x5qTifzTjfI7CU1W3VlBbKuMGmpX5nWf5O
         8awV/8QPCqMxc52SZvsZtjLyfMk8L5HoIOIGZJJTWmymdxawS51z+AUqB9Gtjg9FKsdk
         6jIA==
X-Forwarded-Encrypted: i=1; AJvYcCVEHD6k8RiVSDqAZ2FRt8j4g1VifKqfqrVYpgtHshBonQaUrH5sMet+QWV8858V+50sJU1LGrTwFBg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYFeaC/+W9+6SAfKAsJgQ2PoKP2quTeheMl5IdiEVv6aQXVu6O
	hOuw+WGkEzZ6h6Yu6yprq4BLpOoN4Xn25t2EZEJyMZ6sXdvNdzSPNptyxprknxG45sg=
X-Gm-Gg: ASbGncvLcTEg0AGkwD/DwoY0bShqBiEQlFpicmKlUk7YgyVuRhWhz5Yu/fxfy/rjMbB
	gr4qB+j2fbJn2+5WDvNzecklccVe69WvwrtpetfBlGMH2RlxpzDYjBvXYhc4wtqcSAtQa8Y4Nny
	T1ublZAn4PyBdCf6WTNJi3OoZQkVEg+Lpa7D2xFAkmjplik+wOIPS6ZpQy6GxPvUKiA5xyd7IXn
	nTgVm5n03WFbeJOnJ5ZHyCI8t/hu56ADEKPe3ZW7Q6p6ELkwhTWiGmazaTrgkavohngkMMRgyIc
	lv598wwieebRFZjuMqJLhiRXrhG+byBdwJ1mKqzLfjUyMQvQZZ7DQE+D/hanizgmn1PlcJbABLd
	mWZSJsF28/0WBo9Mk9Z4aKgpgcw==
X-Google-Smtp-Source: AGHT+IH8T8zg0xomQN28G1hezc6Z1gZDVp2eCOEmtHqiL0f9gIeNGI+bpJuOCxDdS9NlFECubITNsg==
X-Received: by 2002:a05:6830:61c4:b0:72b:a020:a2c0 with SMTP id 46e09a7af769-734f99582ddmr8068793a34.17.1747670274203;
        Mon, 19 May 2025 08:57:54 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:a628:91ca:eb5:d6f5? ([2600:8803:e7e4:1d00:a628:91ca:eb5:d6f5])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-734f6b5f5e7sm1463565a34.65.2025.05.19.08.57.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 08:57:53 -0700 (PDT)
Message-ID: <adc2d646-06fd-4a9a-bebe-99d2a6cfd2d5@baylibre.com>
Date: Mon, 19 May 2025 10:57:52 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/7] clk: clk-axi-clkgen: improvements and some fixes
To: nuno.sa@analog.com, linux-clk@vger.kernel.org,
 linux-fpga@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Moritz Fischer
 <mdf@kernel.org>, Wu Hao <hao.wu@intel.com>, Xu Yilun <yilun.xu@intel.com>,
 Tom Rix <trix@redhat.com>, Vinod Koul <vkoul@kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Trevor Gamblin <tgamblin@baylibre.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Mark Brown <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>,
 Xu Yilun <yilun.xu@linux.intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20250519-dev-axi-clkgen-limits-v6-0-bc4b3b61d1d4@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250519-dev-axi-clkgen-limits-v6-0-bc4b3b61d1d4@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/19/25 10:41 AM, Nuno Sá via B4 Relay wrote:
> This series starts with a small fix and then a bunch of small
> improvements. The main change though is to allow detecting of
> struct axi_clkgen_limits during probe().
> 
> ---
Reviewed-by: David Lechner <dlechner@baylibre.com>

