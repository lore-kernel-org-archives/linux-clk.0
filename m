Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794507175;
	b=M8+iYDhOQp7cqDeWJDWCV1dYtdhacYuVoqGXm7799y4f8M2ueCvNuZoIr9zYk4CGtD2p
	 UAyaw4m9PAHSkCZK2F06yuTd7NVGSAQjC7kgRKuurTL12y0/+LT1w5wr+5RfajT1TD0Gq
	 ZbIyCK0/bd7oUzxw6sYrjNI1WzDAeXxgKiWsYFPnz+SoO18RSbiu4WpJGN55MQpidObfJ
	 YWk/6SUqZwnOCwxFLbe+19E5E+cEiyKxEFmFoeNiZN+mrYbiS11kRKdH+ONMe/lUIiN8v
	 Yd5UtIf9BFZDwiW5ZD1ayBFwka4MkSPCMiifQPKo9m77it+28PbTPKSQGsrEFQQbW5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794507175;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=tvPvYGksmHTWeqyNsQWxBvyC/kcPNDGmR79WDiO9WKY=;
	b=Sg0GWe8j06gQvLVN7tBtIbZGe0IvNBcLv4ZBPoFyEpIXMYewGc1RX3a/vVJjvhKUgqr4
	 4LfKBZrJeN3+sHOXZKrh0Z/I/AGYTMudcp2s0Lvh+mViQABXCGvwBFOc8ph8l2v+SNqek
	 YM+kbNR8Mg5ID7mWhhtBV3K+8971eo8WxpNWKJI7Id1a3tLrxAPAY8BpnGG8kjmh65g9e
	 lfY87gcj9IVAWDYK6iFdqIEEwoQmy/dHMG7DSKw95mptU4s+WaHqAC1jT1o78IveX6jfA
	 lY7Uj5uq7a8ACL7iJ4pyfjcj52jP25qxDdzrAK/rljMJeS0s8lix10TeGkDDWg3wFPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LnA3trdc;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4909B606A323
	for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 18:12:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4909B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LnA3trdc
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e3b22e971so36162f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 10:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794507173; x=1795111973; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tvPvYGksmHTWeqyNsQWxBvyC/kcPNDGmR79WDiO9WKY=;
        b=LnA3trdcVWMwTnKTLbaOHOhAqd2KqrmCC1w9umS0vVBTxUNFAnMiZDPubBbugO2S0v
         4VnrccP83ARKl0BwyWLu7FEyQ8RDPoe9yzjHqlo5sYIYg2iXigBfYbvEobN89R83NqFs
         OvbbwXh0drfouYC0K+4L+euiT/09A1sDrNVCeFpFclI6f7Sj0G7WidM7EKN7Wm7XP8oz
         FajxuqViOs2dYpLd2gzh63PvShJ14pIw4TbmJ3TMDIxFvIXLa97aw1fQQQrdj+4bQa3s
         6Fg6pYv2E0fcO7xMtDOt+wIIsLMKiiPtXI3TeihSIIkZ4QqmA1MbSMro6WoWhdeJTX4n
         sUBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794507173; x=1795111973;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tvPvYGksmHTWeqyNsQWxBvyC/kcPNDGmR79WDiO9WKY=;
        b=LcuqWrOqlCIesG77Kv1MBWcmGMZ8Dyyp6tudd+0N+9uFRDbGVEWe6lZ5lPUE86l1cL
         rge/QBM2w+7m8oU3692yoq+mefGcd6oZfZQIv+bKeRYNiB+tB55k+pO2CHsntEbH6oI+
         60/8eJ3Y5Vt1cCldkV0R+RVyAazWPNFYfpSc0Xkce1ztP6IEg8MTVjDJc3u7Kc68A7az
         95MPVKzbM5eRmYfd6KvYqW/sdOQpP+3PfYMFpPKh8aOOwJyA3up8G+9wLyNwCRZmMWOk
         OXGwdkLwQN8c/tLStPNmpBL7VAcJUZQGoWCDi9M8to5eKGZQ8bmQw2bgE96c+iL6dkEI
         82ug==
X-Forwarded-Encrypted: i=1; AL+hErHhImf+BKa+nRzFcP2kiomQz2S2ME0oTPNXD7AFGI2N4V7+bRF627cOLx/izqqTosBZ+zw3+ELrd2M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xnheSouTMm0hXoaeInvvsDck16KTq2J3fSsAAarHErl8+8BYO
	41KNH68eaMaZTOXjXV/JYiMujQCDMcGB6AAwXSwu5YoK3rFrS5lFY4K6pr2i8b2pS6c=
X-Gm-Gg: AYBFou1sNDSSZGsftZ6ebIJ1cAnrM45UncOsC5GBDQ4EXooahIjFtRAIu84+7AheFeP
	nchQi2qVJMkVJdvbNpBKz1leLEX3QSTlqoNdAO7E3sWYS5N1UijXGY0ko6mx1pP40k/QBYEOyUt
	+lQ8r5nFGe04nl1TrBUHBpX+2F5Xpz7hJ1E3TxL8J20tL37AUSko/8ghxcAXyP+XL27CScw6Q6C
	STCvv9STdMUPWQu/eoRniOdqnJDCNuflNqf4qk9N3BqXrNuqoMziiyMq27irH1UlsYjF+xSz11y
	WoK9fbounwVVYL9WO3x1m0hZII8ndseNoFuUpi+Lq/FiptCJaixLNchb3UlYqNzQxuUtgnI7gFu
	0OSGdqnb7PmEKVqMhYEBgsSexqIghKGVdGN1EX6fUPE/qwfGZjur07g53Kg8oBO3PuN04hHH9dB
	hS/KsJ32ru2RaxQnhuQXOTcvwxm6cecqEyK3Txwxc8QTsZJOnkxKrZFZbPskuIIN/R1wPq4L8AP
	pnCAA89LZ0sxzOrMevH0WN/o11s8PXK5ZcN9NG6BQqJoW6Mt1EqOo1rQye0M/0EByY3ldzlUCKW
	Sq9+T6Z0901JzYIQt9A3rE/7vDP+qIaJN6r3konfJnLRxbNfam/BsKWKkROxaEJxUWjtSwCRivd
	qyV/hqzg=
X-Received: by 2002:a05:6000:22c1:b0:488:83f7:6352 with SMTP id ffacd0b85a97d-49c6fc9e5bemr472663f8f.4.1794507172668;
        Thu, 12 Nov 2026 10:12:52 -0800 (PST)
Received: from ?IPV6:2a0a:ef40:e16:1f01:b442:1e4f:d5a4:2a21? ([2a0a:ef40:e16:1f01:b442:1e4f:d5a4:2a21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60bb2a5dsm556563f8f.50.2026.11.12.10.12.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 10:12:51 -0800 (PST)
Message-ID: <bbce8927-1b9b-458c-827d-46f2bb795da0@linaro.org>
Date: Thu, 12 Nov 2026 18:12:50 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] clk: ti: fapll: remove ti_dt_clk_name helper
To: Brian Masney <masneyb@kernel.org>,
 Ettore Chimenti <ettore.chimenti@linaro.org>
Cc: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Tony Lindgren <tony@atomide.com>,
 Michael Turquette <mturquette@linaro.org>,
 Rouven Czerwinski <rouven.czerwinski@linaro.org>,
 linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261028-patch-ektor5-dm8168-clk-v2-0-dc6bf0fabae4@linaro.org>
 <20261028-patch-ektor5-dm8168-clk-v2-1-dc6bf0fabae4@linaro.org>
 <179444595968.1126566.13848954974182834412.b4-review@b4>
Content-Language: en-GB
From: Andrew Goodbody <andrew.goodbody@linaro.org>
In-Reply-To: <179444595968.1126566.13848954974182834412.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/2026 01:12, Brian Masney wrote:
>> The fapll driver uses multiple `clock-output-names`, so we cannot use the
>> DT helper in this driver because that would assign the first clock
>> output name as the parent name. This change do not affect other SoCs as
>> the only consumer is DM816x.
>>
>> Fixes: 9e56a7d4263c ("clk: ti: Update pll and clockdomain clocks to use ti_dt_clk_name()")
>> Signed-off-by: Rouven Czerwinski <rouven.czerwinski@linaro.org>
>> Tested-by: Andrew Goodbody <andrew.goodbody@linaro.org>
>> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
> 
> I see what you are doing here but can you give a more detailed commit
> message / argument here in favor of the change to make it easier on
> others that will evaluate this about whether or not it should be
> backported to a different kernel.
> 
> Brian
Maybe Rouven will step in here but the main thing is that fapll.c should 
never have been converted to use ti_dt_clk_name() as it does not work 
with the binding [1] and usage.

eg with the node

	main_fapll: main_fapll {
		#clock-cells = <1>;
		compatible = "ti,dm816-fapll-clock";
		reg = <0x400 0x40>;
		clocks = <&sys_clkin_ck &sys_clkin_ck>;
		clock-indices = <1>, <2>, <3>, <4>, <5>,
				<6>, <7>;
		clock-output-names = "main_pll_clk1",
				     "main_pll_clk2",
				     "main_pll_clk3",
				     "main_pll_clk4",
				     "main_pll_clk5",
				     "main_pll_clk6",
				     "main_pll_clk7";
	};

The use of ti_dt_clk_name() results in no attempt to register the clk 
main_fapll and duplicate attempts to register main_pll_clk1 of which the 
second fails leading to an early exit, the clk system is left not fully 
initialised and other problems follow with eg USB failing to init due to 
lack of clock.

Andrew

1. Documentation/devicetree/bindings/clock/ti/fapll.txt
