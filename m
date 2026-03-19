Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08AC2E06EF
	for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 05:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773899458; cv=none; b=l3i++8TvOMPohOWz3xvtAeElRiDzs9eOs247ZUH4Qy1ix21XGS966rl8FRRstFzRzzMduPfsmhG0fKC+RR4pgOsCkyCyIA1MLOwBstfuDzg0AsaTvEcJMTlZo1aCxrcmMaM0RW7kvpfYa8mwvgcIiUXb+rjg5R8KycbNEh2vlf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773899458; c=relaxed/simple;
	bh=MawAzpxE219MvSlVaJ+0R5jtOtD1/dpHGN0floVbngk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ghTmBliIYziL4tu7ApofXGUgKNGsbuUp8jARx4MhF1xN0GcTclb13O9AkoKYTel48w32thsBFoX+atHVD0ivkMe5UIF9i3Bh0woX4jYF1pbm1YJMud3wiA8mgnlDriAh6v7pg3VQLgT+lfagKjVY6GW52dAaFcJgZ7eDuu968YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AHZGmw4K; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AHZGmw4K"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6618bc129acso1022784a12.2
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 22:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773899456; x=1774504256; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FU3dYOZ5IUxYIeKpkZZZr4uovnrxVzn2MOOjX+dDH/M=;
        b=AHZGmw4KmLX86laRxFKsxIV/TZxJB8B+eXvjU5u9jPJCN7WGm2OfwV04/pO4P8fmbq
         xcITO5vILH2D4gSZHgmYaAmbjSMKF624jwAZfNtTh2bJqIywG9geKUfu8EhIJYTUqAuh
         Kfcwb/ODBSG/RpVh/Jy5bbCGPEil6XBigExHs/Wb3Jgn8Vw0Pk13B4M7pPBq5pD6zvY2
         wVRj6USWm7vaxOeoBuM9yL6fV2EAhVLTKyXwelyNFbRVeP+zfTWS+MGawOuU9pijGc5s
         MQLidUzXhMCPKm7kYOK04c+7ixQapNH6WASCETsf1mPXzT7sNKEEbbvSMRT9w26sTPWz
         fffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773899456; x=1774504256;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FU3dYOZ5IUxYIeKpkZZZr4uovnrxVzn2MOOjX+dDH/M=;
        b=CNVpmZlHe3bODhavEI7ReV6PE6FoYBcySka5fhXuh5SlE9ahxvfrcjWDn5Fbp0g8K6
         zPRwDjZ2Q2LCvdS2zThluTIFpoHqiiw/BnmK2nyQvS8CZcjyymPgF33UhFqpppCOcAJT
         ndipLtGI2LvLksE0zc0Jq60N9RQRGEmqM+KMfVzO5tx5vlXQpSICYQEeXLkYK8HYQ1GE
         xRsC1K4KDwhMWU1iSwJvFGgkmw9M3/sPd/6Bn8JhJdDDDbBZnKrALqwUWwYYbMH/FjsN
         9yFJWNdq+V7PihxkfFiCRREYL8Ucqg4TIiXjVsuUT5BOFOzKTfrDq322g27vzd+x/r4y
         kXqg==
X-Forwarded-Encrypted: i=1; AJvYcCX6jL4Ct32CGRxCKkvrtxXz6OU40Nx/wWo+CGFeiwf1SQ6sUtZW1wDIqoooD1KzWwMblBmYBP+rKzo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPonUAjYjrRcnUDA5M79BsK0oldvGJTFCMZVcOYO3KLAzNVCbj
	ytgirEpnTQJc6EkeQkG9HATTDthCuzyK8xxn4FMmLgvTwrnZh/lu3c75
X-Gm-Gg: ATEYQzyLxaJGDTzL/gS/aYhahNoVIBldu5zGph+RoWPV51Wa2l3JYCnjFGgLW+qa/A1
	AhzKD6fkgMApzWyL48OsgAITbEtrSUOOC2dv0fsXgKpTu+4Jo5hJHDyZr/ir4omoeBJJrC5Td10
	oR45DlJapgpECHyjULr8dDmoVvVphMhhfrGLoIkObrZDF5niIGkGKe8UYr0WObfs+5Z+AVzLw7F
	HQDec3mA1XTiwhFnBpx4wdhSxwYCHtiYIUxeyPriwlS7eGI/hJFD7rHDOIRFvcDJM9zWZTqf9z8
	kyIj9ECzdv5DvgIaRdhKtGvqFF09jjZ0GlkjLbJgi+aRGiNMcXKvVoeKmUiTpsZW2cJ8QHwKLtb
	uzPKNX5By6/6u3xzeXBYd8PJRCoHk/rG+SVumFyFOkKrOznvcixUjvdbFt7mFRqUd9zhGchVpFI
	+DCmkTwJp8gSdkA4xvQ0H05ZkTYvALErhyPY5AAQ==
X-Received: by 2002:a05:6402:1ed5:b0:667:6eeb:9aa8 with SMTP id 4fb4d7f45d1cf-667b2c03461mr4405868a12.15.1773899455763;
        Wed, 18 Mar 2026 22:50:55 -0700 (PDT)
Received: from [10.52.58.58] ([193.118.55.72])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667b129e69asm2889513a12.22.2026.03.18.22.50.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 22:50:55 -0700 (PDT)
Message-ID: <7c7034a7-686a-42c2-bdba-6f31b5179f7c@gmail.com>
Date: Thu, 19 Mar 2026 06:50:52 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: Add clock guard DT description
To: Rob Herring <robh@kernel.org>, Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <20260318-feature-clock-guard-v1-0-6137cb4084b7@bruker.com>
 <20260318-feature-clock-guard-v1-2-6137cb4084b7@bruker.com>
 <20260318225510.GA639444-robh@kernel.org>
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <20260318225510.GA639444-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.03.2026 23:55, Rob Herring wrote:
> On Wed, Mar 18, 2026 at 05:43:40PM +0000, Vyacheslav Yurkov wrote:
>> Describe device tree binding for virtual clock controller guard.
> No idea what this means. Please explain how I would identify this h/w.
>
> We generally don't do bindings for virtual devices and we don't do
> single clock bindings (other than some we are stuck with).
>

I described a use case in my cover letter (PATCH 0). Perhaps our 
approach to tackle the issue is not correct in the first place. The term 
"virtual clock controller guard" is something we named it, but it's 
literally just a clock provider which combines several other clocks and 
input GPIO signals in order for the consumers to check whether they are 
allowed to probe already or have to wait until the input clocks are enabled.

So in essence it's like a helper driver to simplify consumers probe 
procedure. Does it make sense? If you don't do bindings for virtual HW, 
how else would you approach this?
