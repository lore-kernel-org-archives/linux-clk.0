Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7201DA21
	for <linux-clk@vger.kernel.org>; Sun, 20 Oct 2024 15:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729438771; cv=none; b=aea8JEGJ2w7KcgY8T7YzWCfOxCaJlxAwMUD9JoW9uvfKt4NDpakzuiU7BcZB4Frf4f2Nk9O1SBAKUHRW7E7dA0S1eJ/4WRHGjqWH7ZRa1/BYxzeYTStBW5XXeGDW2fRxRhmFdIQBNlP7ODGrJwVoX1eK92nhqDVAGngYnC77u+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729438771; c=relaxed/simple;
	bh=oh7rhB/4cQ0vZjQlOAp+6Sk98Va72mmT7J7DoldCnOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R/XSxFYGL6zdA0/E5BBW7LKZ+iK4XszRKrFWFedKQUUNwlmcFy9eHZwBtOvAr/5Lq0TvUYibmwSxsPftRebszoNOjZbS8ulIfkcg9Q2AJ5L9/kX6x77ljyNYRFPAHXX0YYyRvBH6jPdnfyKCuMV/VxCCI8m6JLONGtUH42FQF/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=pNDq0dJt; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="pNDq0dJt"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37d6a2aa748so2379503f8f.1
        for <linux-clk@vger.kernel.org>; Sun, 20 Oct 2024 08:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1729438768; x=1730043568; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QTfu8x6uKuXBMf4pSuPyv5OmBQv74/q8muUU6L+EfSI=;
        b=pNDq0dJttm2wBMhxxivVYK7j8VdMu6iMAD7tVQcy+rC9eWjNMxafIvYBdkJOQMC0JU
         vEPyg9D7KqWqUNR9O/RI6Dm/lIgrQDaRj1ugElsxyiFHXPjzjbnSVn+PpM/EpcUxQBD0
         UBT7mKQnfAQpVZEh5sErNKu45Ezr1KzapW3YwIM+6sC6dzsXkNsQZH7zWcknbouKpCFG
         VRSa/d/oPQGwxXFL7X/kjiONFPwFCrjDc5jgsVlmzOtuMfWxs2RtUbRf5YThUQVP6n4O
         hTQbVYTCINlMgmED+Qmx4AncXwl43pd+YxGHO3h4+EdmckpKFqX4QpeaQENRxfZG5CUk
         w53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729438768; x=1730043568;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QTfu8x6uKuXBMf4pSuPyv5OmBQv74/q8muUU6L+EfSI=;
        b=W+Wqh5TiL15InO93+HF4baMkXjj1ta93EnBGiOEd3LLufsLXt7tji2rrxjobRQiL/K
         sWdWr01yGKOhFHvVj91JB/q7LbP1F5i9MR7f4tGlV2Z/tBicjxZKZQ+10GpUkgB3Qjzx
         k/TdrGj1cTF28xv4KnkSpu3gS75YFAbN3fMwwxTeTx8qzYQrdo+C2SHF3k2ZyRB3T7kt
         c9oMb9ARHJfK5QnQqjUaroNpkDASZOjAVkbP7w6T+EkQYg+R9fL8Vd4X4D22LipUXA+V
         RfSyKr+shHpdOot82h7fguiUCSmsAhAyxjjQS3s3JxRYCJuGYkMxEQG2ASFU0J+0L4TB
         a6AQ==
X-Gm-Message-State: AOJu0YyJod8FkIH7qUD9loNFvDOA1Sya4OvxDIX5Iwy87XIUK4CI9ynK
	D/knKDDTYOIOTE/Wj0n1eJRY3QK+3MwXNQy0oqKkB9gGVLWRGSfZWenNeYB8jMo=
X-Google-Smtp-Source: AGHT+IHFx3PRdDtbVUn5kPKTsjG6UXE2U6eeJtsRm5EYGJmiBxmhBHsDIkmuWmrT497fYr4RM75eAA==
X-Received: by 2002:a5d:4e49:0:b0:37d:3301:9891 with SMTP id ffacd0b85a97d-37ea2164d8bmr5663873f8f.17.1729438768085;
        Sun, 20 Oct 2024 08:39:28 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f5c2fa7sm26897165e9.34.2024.10.20.08.39.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Oct 2024 08:39:27 -0700 (PDT)
Message-ID: <0143a3bf-a912-4ea6-b57c-5b7af79fe5ed@tuxon.dev>
Date: Sun, 20 Oct 2024 18:39:26 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] clk: lan966x: add support for lan969x SoC clock
 driver
Content-Language: en-US
To: Daniel Machon <daniel.machon@microchip.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kavyasree Kotagiri
 <kavyasree.kotagiri@microchip.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240916-lan969x-clock-v1-0-0e150336074d@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240916-lan969x-clock-v1-0-0e150336074d@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 16.09.2024 12:49, Daniel Machon wrote:
> Daniel Machon (4):
>       dt-bindings: clock: add support for lan969x
>       clk: lan966x: make clk_names const char * const
>       clk: lan966x: prepare driver for lan969x support
>       clk: lan966x: add support for lan969x SoC clock driver

Applied to clk-microchip, thanks!
