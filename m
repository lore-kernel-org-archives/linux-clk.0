Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C7134F47E
	for <linux-clk@vger.kernel.org>; Sat, 28 Mar 2026 02:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774666737; cv=none; b=ruL0iTWgOzHlzkcecUlEOSk028aPU950OMrdkQVYwuNTlKtwIApMi+U6zTLeivlk7t7GXoOvlfl79fmtJFn+TD7H21hvRSetm8cshi6ZpSSszYqlxsKnsH+2uViEyZdz//9b8cAHiO0Y+ztCxYL/P332IUXgqxbiIVW11K6BgVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774666737; c=relaxed/simple;
	bh=olwM+iFW1baLC0frxkhwsk/23pWJgNDyvNMv4ihorwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IOjaeHFNXREQGk7NBmnYNiu0u8MevjWcpZeEAot/YfaWG9eiEJd+qv/WZ2Q8dvbQj5McCBNSUGwI8yEIAQ2DxuWXVhZ6szBoFGzKUz68Gdg15fUNZfF09iTYVTT3bUXIsnWIrzq7RvvZfO1WgiSP6mSyfJnvXL6pW533bx/2fLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eWJwcpPN; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eWJwcpPN"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43ccda008cdso290098f8f.0
        for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 19:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774666735; x=1775271535; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aItUBK61tk6fxXXaFLwlpx4OpsBWZ3pyf1T32wUZFWY=;
        b=eWJwcpPNWfOLODHUnlNpHde+OXK1Qx0BoC1oMkvd28TCJhqbFUYAbH/b1IuiqC8ANu
         cV+9HqKZVwZwCzMzDC6L34cY++7p0ZK1wqk+rX6uYLM4EtVpAB9Bnfybnx4MxGIx4SwX
         xeHBTyCUxkzsMlJWy9xdSP8JmgQ0GRdtj9VJIT3evGaNkKeTixS66DOuGVB56ztk6Rl4
         JJ8lWZOgNxpV/Js8NhikTxYGZWY5dlAZqrjH238Gg5jI21Wvg7ovFNEbDvkB5ayWG3Zy
         zPwUoznKlw7WQGn9JK0zaSTPxl+Ly/C/YnLVi/1xkTf9m3nUqA8HGwii1giekuWYMcgN
         p5hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774666735; x=1775271535;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aItUBK61tk6fxXXaFLwlpx4OpsBWZ3pyf1T32wUZFWY=;
        b=CBKoZn/Y4JTnuKM001NinyVy65DnLjI7WsRlHAAgMtC9K2gwtmNYjmz5avV/Y0DILK
         WXua3OKWMfEx4Til9mU4Z1ivxZclaKwTKm9KFdmiKSMHudJqU7dqdDbLVfSzhlLAG5vo
         CazrSaJOnVYPZwy1wieEFqB/88HUPcUhK7ifLNfow2krhjlnLqGzO82RHS9li23T8x3h
         yA+86uB1/8eFy3J5trr7KQ7gALx0/1o6L8YiKv+1BwtVxsmk+pxR7fE3cXa5ApovtQyo
         wBCbJZ77VhVZ4qXkc8mVGer23o6CSblOJQN0KVxXaDg4oaJPlu1dBO7vWX32GryMQ6PF
         sy6g==
X-Forwarded-Encrypted: i=1; AJvYcCWdi4MbWRiZBQzIRQI21h6UL5Zpgn2hebXJr2aRN9D0hZu76IfYyXt8mdGscM1TQgCP+WNlIsLJ6ms=@vger.kernel.org
X-Gm-Message-State: AOJu0YytPO4DsuKWO3J3LQtsONznp4aQfGLzbMB3F4+CHAWmmnmoJeFn
	ZpZXfSVKNI1fHphkRE+92dvzmQ+GkF61weMWOFivIHOH3EEa8ntH1xd4
X-Gm-Gg: ATEYQzyYVhMmg+LrGIv24yWsHzptBkQoidcVDm0fYpTYQmIw7hm9MD0fELqlerrhHgA
	y5vAOFhaBYqkBTE8DczbDzPvXQaL8EXJR/QPNl3WM1pU59Tb5yfQYd1yDpeEy79GmKIPEXkTRbr
	Nh9Bb1hGI0SLLBOjhkdP630TVabzDf/lPboLpLIyEeUyomEhi+jQcxCD2RwwaYLy17MvaPJ+9n/
	Krr+QDQboZHvUw9yP9twxnxuQ6G7MBZDu905kouzlVlxJ64IsPZtqDIYJATuQ3X5AYZblR2kqlw
	K6FW3xyz6aUEjEuBQZdRr5d5leLcVYAO3H0kS+vl0G7YKLz28wcqnjVPC3221T0SRJQN6CuSdd7
	F5Wvs0SakrlRpECO3tuPVipyAVxxZuO5Ar/4ZYvo+YMDm4MU5UVUomr2xPYFH3k+fobePekNz0t
	3o5QQ+4G6Uax3iPhUD4V3+IYgG4+FcylIBjiWsKtAYo6aFvURW
X-Received: by 2002:a05:6000:240d:b0:439:bb46:7457 with SMTP id ffacd0b85a97d-43b97a4b813mr13247505f8f.16.1774666734587;
        Fri, 27 Mar 2026 19:58:54 -0700 (PDT)
Received: from [10.34.37.37] ([185.25.49.104])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf245e4f5sm2316659f8f.19.2026.03.27.19.58.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 19:58:53 -0700 (PDT)
Message-ID: <8129d377-8a63-4589-820b-930a2b43a2f7@gmail.com>
Date: Sat, 28 Mar 2026 03:58:47 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: Add clock guard DT description
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <20260318-feature-clock-guard-v1-0-6137cb4084b7@bruker.com>
 <20260318-feature-clock-guard-v1-2-6137cb4084b7@bruker.com>
 <20260318225510.GA639444-robh@kernel.org>
 <7c7034a7-686a-42c2-bdba-6f31b5179f7c@gmail.com>
 <20260319-yearly-wrongful-883f7fd86a69@spud>
 <b45d9845-2d56-4fdd-a3ac-b0e0e27ba573@gmail.com>
 <20260323-sanctuary-semantic-432089feb1c7@spud>
 <d097826c-3db5-4902-acee-ffcff7436d4e@gmail.com>
 <8e7d0c53-aa23-4514-81a5-335a76bb0c45@kernel.org>
 <4d575f17-5cd5-495c-99a9-176b3393d54d@gmail.com>
 <20260326-nursery-outer-55799f675e14@spud>
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <20260326-nursery-outer-55799f675e14@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26.03.2026 19:32, Conor Dooley wrote:

>> I was not sure how to provide a diagram in the mailing list, so I posted in
>> on Github https://github.com/OSS-Keepers/clock-controller-guard/issues/1
>>
>> It is a driver which models dependencies for other drivers. These are soft
>> or "indirect" dependencies, because we cannot access the FPGA unless the
>> FPGA_PLL_locked, and GPIO is telling us we are good to go.
>>
>> Conor, I think this should answer your question as well.
> 
> Not really, but it gets part of the way there. I want to know what this
> provider actually is. I now know it is a PLL, not an off-chip
> oscillator, but I know nothing about the interface that you have to it
> (or if you have one at all). What compatible string/kernel driver does
> it use?
> 
> Because SoC-FPGAs can route GPIOs from the SoC part to the FPGA fabric
> and use them as if interacting with something off-chip, I'm not sure if
> we are dealing with an separate FPGA or a SoC-FPGA. Which is it?
> Effectively I want to understand why you cannot just read the lock bit
> from the PLL directly. In my experience with *SoC*-FPGAs, things like
> PLLs that must lock for the fabric to be usable have a register
> interface from which the lock bit can be read, that is of course not
> clocked by the PLL output clock and therefore accessible before the
> PLL has locked.
> 
> I think more info is needed here to guide you on where such a "helper
> driver" should be located and what the dt represetation should be.

I really appreciate your feedback on this. Here's an attempt to provide 
a better exlanation.

We have various use cases. Most of the time it's a PLL in the FPGA but 
it can also be some signal from a custom FPGA IP used to indicate if 
some preconditions are met and the IP is ready to be used (some kind of 
inverted reset but exposed by the IP). For a PLL we typically get the 
signal connected either to a GPIO IP block (altr,pio-1.0) OR to a bit in 
a custom IP register.
In addition, some of the IPs in our design do not have a proper split 
between registers and IP core, which means that if an external clock 
and/or PLL lock is missing and we access the registers we won’t ever get 
an answer and thus stall the CPU.

We are using a SoC-FPGA and use some GPIO IP within the FPGA 
(altr,pio-1.0 for example).

The PLL itself doesn't have any registers but the signal indicating that 
it is locked is available and routed to such a GPIO.

The point is that we will have several IPs/drivers that will depend on 
the same preconditions (clk, gpios being high or low) and we want to use 
this clk_guard driver as an aggregator for those pre-conditions. Define 
once, reuse a lot.

Slava
