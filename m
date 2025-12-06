Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867662DE1E6
	for <linux-clk@vger.kernel.org>; Sat,  6 Dec 2025 14:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765031432; cv=none; b=FnAO76yVHstFj84j7FUlgzLinH1rwg7uxZaaS5x1+TCeMURT1ar1nKDXrtGnxgLVHUe101RvnhtmPsVAl0lUSjAKGIhg7jgh1bKB8OuqkFttAB8wmYehNzMb7E6FXLliAv9Mez23dt6614tU100QVuJMI4pIrTMs8p7dteUGi6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765031432; c=relaxed/simple;
	bh=l0QdzEMpjtA2/9IVjcKZIBYxDyHt1Sm00OZ68uWx2lg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EdUMde6lU9Hd5lez2wTuWyFrIHpu/6vS8VNHvdxaHGXYzijqegJm7eSu4sGMAL1dNSkuhrHfR0CBqTlI0h2TOBgvrNC48K0ngLMHU0jeQwYmN4IuEJ1FSSaww+Q2JMzg54fEp94U8HK5H1WM+jUSUDjKIzup8mTIwYXWwaJLpn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=dW6W8SpZ; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="dW6W8SpZ"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b735b89501fso361115166b.0
        for <linux-clk@vger.kernel.org>; Sat, 06 Dec 2025 06:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1765031429; x=1765636229; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1w0KMkfLhKs+JVHdq2yV/tGhRmGdiZgXf5K4c1ouFD8=;
        b=dW6W8SpZ7vBQOb7vricIcw7Hg0ooBDTneJysHDV5b09828yDffKrZ1vR+9TN6KQtvI
         s45vTd7aQSDuoVnD8xDgdLRDBk+/PhemUkMyzcSjvT2J1WKBb1jaVIh5dV7Ud3o6GBmc
         D5du6n3KLwstkuMw8l3JZ1Y65Iqp/ToMZ+HTdpri0RuWJxcnJcbusVSGUWmjRlLW1yc+
         Wqp0yhaNcuKPgPoBFFD3UsfU9HbtMzDnaEgqZ/QO6Z3KYXIH9JGSusTethMmrmLaqlyH
         hkiJO38cw8wXk4/lQc8xBtdvgb+qpLrc4By1Cknh4FYQXoWjzbUwe9G1erpgUPE+LjBR
         8R2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765031429; x=1765636229;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1w0KMkfLhKs+JVHdq2yV/tGhRmGdiZgXf5K4c1ouFD8=;
        b=YKxXCdft6+9mcTC+iz8Nyu8MguZuxZ1qkT154U/Hu0t6cJyJm7cLJPhDUuYQzUgHop
         XaaoXhCVR5xS3K21kjGk5At33Kiem7iNKa2DHZ0w0kpGz2upf89PuIfKysE1nCiao+PL
         FCpC9vlJ6CiYZ9CPrnlX2cEz6IWWtPbrhTDNxqBQIU2hUuA5+/AgVwrAoZfJTckWTYUJ
         snreT7HLQx5sLBQqN6n7MVD+chxBqlzCqTXMeYaDPedxt2C+/JRAT+HQNpJMeQ4X4TqZ
         gDYgvh5utFMzwcXfGKc/vmoo8qEVhkWCla42PsdvIY5daChYtnrMpGa4/SIcF1Y31LSd
         arLg==
X-Gm-Message-State: AOJu0YwXTGYFQqwyUUaDOzLT96s39nC8IwFchVnUOBh+6H5oaDrrSwBT
	eg8UhqCvoVBrcUC0aZb6XH5r7oUYR0QZppKhyfMyy72SZr/DvGiT0eEjMdHAxnemWd4=
X-Gm-Gg: ASbGncvgOP2DkfsYu80EdTfHe0f+Tf1QZWDB00JKoq5hV+PNA3SyX93TdR0Y9aSW4u6
	HQs2Cgsr9rtPT9OQij6A/znpFzGWzI59lnD0xVuEgu9orfpVojqK4K0jLnFgffmSBXeAJk0+6uD
	t1mlo+QPBzOstpnL/Vr/aQZncIDVI3QY/A3hlgpXWfE4dhmDJOHNGN1UpIYZFcfT6Wx90smGgsq
	bMGBZ6mbN2ICVLtwcU9ON65WrwakuAfyUqDpDMQ24P4xTRBVGGN6rlf0r2xbCwcXVso36u5PGrd
	F6OorPN421dO2tfbh+aFBOf4hjOVNbQHxNbIEcFtSaJF8ZPDUgobWm1AlfUEQ/rKi6xIN+Gtan7
	pRLL/1evQ6HT6yZNfel7Fivk6hpmRZOkFUNweUDcDV8U6uVeUmwO+DoCIcpgd/hO8J7gcOdXra6
	nv94ChZNgzWQdjhjod2+8=
X-Google-Smtp-Source: AGHT+IF9jPn5FGYCVY2xBzPy2dddl7nPJsPRd9/4uL1nBGgTZHnCYN09n2MsBmA0SI+/klqfy4ySiA==
X-Received: by 2002:a17:907:1c98:b0:b72:58b6:b263 with SMTP id a640c23a62f3a-b7a24846c8amr266929266b.60.1765031428792;
        Sat, 06 Dec 2025 06:30:28 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f445967fsm633762866b.10.2025.12.06.06.30.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 06:30:28 -0800 (PST)
Message-ID: <0ce7cb31-b8ed-483d-9260-59da9841049c@tuxon.dev>
Date: Sat, 6 Dec 2025 16:30:27 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] clk: microchip: core: remove duplicate
 determine_rate on pic32_sclk_ops
To: Brian Masney <bmasney@redhat.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Conor Dooley <conor@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
References: <20251205-clk-microchip-fixes-v3-0-a02190705e47@redhat.com>
 <20251205-clk-microchip-fixes-v3-1-a02190705e47@redhat.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20251205-clk-microchip-fixes-v3-1-a02190705e47@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/5/25 21:46, Brian Masney wrote:
> pic32_sclk_ops previously had a sclk_round_rate() member, and this was
> recently converted over to sclk_determine_rate() with the help of a
> Coccinelle semantic patch. pic32_sclk_ops now has two conflicting
> determine_rate ops members.
> 
> Prior to the conversion, pic32_sclk_ops already had a determine_rate
> member that points to __clk_mux_determine_rate(). When both the
> round_rate() and determine_rate() ops are defined, the clk core only
> uses the determine_rate() op. Let's go ahead and drop the recently
> converted sclk_determine_rate() to match the previous functionality
> prior to the conversion.
> 
> Fixes: e9f039c08cdc ("clk: microchip: core: convert from round_rate() to determine_rate()")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202511222115.uvHrP95A-lkp@intel.com/
> Signed-off-by: Brian Masney <bmasney@redhat.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
