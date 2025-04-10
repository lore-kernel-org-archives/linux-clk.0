Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB464283C82
	for <linux-clk@vger.kernel.org>; Thu, 10 Apr 2025 12:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744288361; cv=none; b=qCj+OMG1lyYM1LG+HIE6RcFE8LRzYOKuK2xL/iPpuFL8XypBH97K5T7uIds8EvfzBUV8SefZfmOKFpCi8CtI7bW+dxbz1wcaQxpwqYtbZ+Q9VGryOHiWQMlyGDgzGMpy0qpm7s/LJom1FXrNwvk3bW0a5fzAcJI8UqBWYeiV8O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744288361; c=relaxed/simple;
	bh=vaduyXSktTjHWIM6mMUVuzB/JU/7o9Vgbb4ojf5mTUE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=LMbhJ2WjPQ4k4k2W1G3XO/7RdR1q2IpKaaCOvAco9wgeK0lrG330rU7MdggwKgiPvxOOLftad9OmsQRYdApjQsxLxzNr9Xf82VRTyNA8UteVfArRyOjiH7+nWfluJaKx913L/MtR1BMliuU1Rjc47gH4qGDacNONEpCAqYRQILI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=wAcr0Kz7; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="wAcr0Kz7"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3f556b90790so211319b6e.0
        for <linux-clk@vger.kernel.org>; Thu, 10 Apr 2025 05:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744288359; x=1744893159; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GvSNTACO1SZCY31F0gRrZZq+wvkmlB8UFBxIZ9DVjtE=;
        b=wAcr0Kz7P6zFsFwt5BfIPOsSF+2tNShxV8aRC1lu6GJ4Og3+aB0bcFOUrzv/M3dhKv
         FIebYKdLbbqWlwVw8ZejZFvl15rw2avJp2inoI7GNJAGz+iGp9Y++3ZWu3yqGmpB0Itk
         FPYHH7KjpeZ3jx0R+tVjcTJushdG4J4JpDy0yUEGNvMS/JAZQabieAIVeKExMqqt3WkO
         nVO3vw2anuWnBVpq591W/UqcgkpGisHHFiRi5prN9Gk8PbeNpCkjvuNgcisQKMYT7uH2
         /FYTnyTIMLfyipjnKmdZM2sGCjyJKEK+ParzF+zONIfNGoDuDVJCri61PuOZv+SQRF9z
         QZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744288359; x=1744893159;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GvSNTACO1SZCY31F0gRrZZq+wvkmlB8UFBxIZ9DVjtE=;
        b=IoTHPrWVx1PKDBEcLiCYXS+fCIPLllUISmt+Owk5Skm41dtSLWAkqFJi+gfpLbUo1B
         wSwywfZMD0PH4w6lhAGhTtGz3hJHl9+cFVZF97aeQyl9oWlnralXaFsx3vDvx2lZPXB7
         ++YtwLNtsSm1UR/QwMruc7kYblEOp/Fr0rP6TAS4WvcKjalQv4tMgTeqRk4C7oVVGFU8
         VAwt+KcbNMT6/O5DcqCkx6AZu8CrVsKI3W8EiSc85hRD37fkm3sNKlqEvtXCLRm2/4fj
         rfNh6WhCK9WhRR6XzwRzzACjjj63+SXVtqR1uIuG9K9X1HMMCeaXhCU2UcFq/HlZGuSB
         9iPg==
X-Forwarded-Encrypted: i=1; AJvYcCVk/QKJQV/nQXb2J+ub7PgQ7HTVC4utZFGpSAyuvrW9WZLJ7aT0MGNq9PT1VrbEXT/cy+tcxNRInUQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVbfogTXm3MX4x/slJdpFRHHSXpwDtOL6sJ/eqpbU66vvZS+DD
	FayBUlAbTagjqu8OYC3Y2FWy1QRguWmHJ9+tNHiSGsqT7t0CoLDwmID8KlCOSC4=
X-Gm-Gg: ASbGncstYUdWWwf9pimJEjij6JSMilHgQHBA56A3fZV5Io19sAhznzqtMHeSBhcZE51
	f9EHrDf1ZV2jOJBpejdWxgFdGZO29gVs5IP5rUn/fGYfveVKvYT5Xv3IkQi5c4dHoyk/0pkAHDQ
	P5CNB2DvjDAO/G77vSHpwpEo0mp1aZIkUb2WthmLpRFXoQurvGOK6uLd8GCZWgcToehAmX1Bh+k
	XIxccrdd/BQtaJGECAA2KZT+qdkfcvKtqnOIPXmEVBfyrBI2sliJLM2ClYjxds4GB7TGpBQ5y8X
	cQFX/RpWK3aDQYQcA7Bbzrxv8MjCqVXFHCeGTzGF9dcHm0Yk8iOP5fWcnLrEM8ZDj2aedbRM1g2
	aIQM6
X-Google-Smtp-Source: AGHT+IEJuAZEVXhBtSWrNjlEQvBiq7KT4K1Km9MSzZyjIkHUjkvVril1VSVFFBGM/J31v9xCTSVpWA==
X-Received: by 2002:a05:6808:7004:b0:3f7:f7b7:88b with SMTP id 5614622812f47-4007bcdc348mr1582330b6e.21.1744288358751;
        Thu, 10 Apr 2025 05:32:38 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6045f5b28basm505694eaf.36.2025.04.10.05.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 05:32:38 -0700 (PDT)
Message-ID: <0ed3ce4c-9be0-485b-a1ea-6a34931179db@riscstar.com>
Date: Thu, 10 Apr 2025 07:32:36 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] clk: spacemit: Add clock support for SpacemiT K1
 SoC
From: Alex Elder <elder@riscstar.com>
To: Inochi Amaoto <inochiama@gmail.com>, Yixun Lan <dlan@gentoo.org>
Cc: Haylen Chu <heylenay@4d2.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Haylen Chu <heylenay@outlook.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
 Inochi Amaoto <inochiama@outlook.com>, Chen Wang <unicornxdotw@foxmail.com>,
 Jisheng Zhang <jszhang@kernel.org>,
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
References: <20250401172434.6774-1-heylenay@4d2.org>
 <20250401172434.6774-4-heylenay@4d2.org>
 <8fe0aaaa-b8e9-45dd-b792-c32be49cca1a@riscstar.com>
 <20250410003756-GYA19359@gentoo>
 <dm4lwnplwcxj3t3qx3a3bdxtziowjfoqdy4vrd3ahmzkhejrov@fa5rujatatew>
 <z27ri5eue43ti6b2te2cbxiow66mtgbnyudoo5cs4quabgbx5r@uipzoxvfoysi>
 <a8e5adca-8eff-4bbb-a7fa-ce4489b63fa5@riscstar.com>
 <sl752im2sn5sz6yzc23ctprh3rwryuhgtggsaauxixn3b267ag@6sf5fahu6b5i>
 <20250410015549-GYA19471@gentoo>
 <f7cun6vh6lv7q2qdgba4a55wjv3v2pldl22xnrqxnurj3jlyk7@mvafnye3wv7m>
 <cb13c955-3994-4950-9c28-37703f749b0e@riscstar.com>
Content-Language: en-US
In-Reply-To: <cb13c955-3994-4950-9c28-37703f749b0e@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/10/25 7:30 AM, Alex Elder wrote:
> 
> I'd like to see that be the only thing there, and have
> various SpacemiT modules define default values that
> depend on ARCH_SPACEMIT (or _K1) in their Kconfig
> file.  Like:
> 
>      config SPACEMIT_K1_CCU
>          tristate "Support for SpacemiT K1 SoC"
>          depends on ARCH_SPACEMIT || COMPILE_TEST
>          default m if ARCH_SPACEMIT
> 
> I *think* Haylen said that's what he's going to do.  You
> could make it "default ARCH_SPACEMIT" too, though that
> builds it in to the kernel.

Nope, I just reread what he said, and I'm mistaken.  Go
with what's preferred by the clock maintainers.

					-Alex
