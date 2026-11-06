Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793988034;
	b=vhcdK2u21H43cRh4Bbg0qqn8yF5xbJYZUAqIww7+txg4x812GrlVgdtrMVCdT5+ZPf3U
	 kHrAGk12diVVT1NOqS0oSvq2oI5kFmHWdN/9ArzQOXzxlABXA72ejuYbolIBqOYtCbMuS
	 KTZUZNXzTuSFsHFNjwjEM2I8dqAipKx4qgmVyve8J6pRbVi5LIurFbu3avvvAIefMLLIe
	 rXQ+tof7SZ26sxA+8/7MCkpNmGaDgDhAr9g38yXNPOhx/aFUnsIyzRZDHi7Hp0NKD+2/t
	 gaEQiwXAbmvbzjALaDzZJYjPYvXLZxfDGREFt4ThCK873LEQtv+SmEyfi3+0clUOh+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988034;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=NWh3cyZ5yf7zg/LkQ3FygSjfNpeZJYxZtQPW750sMhI=;
	b=hZWyhU6M6wX2ZHGeoalexgUAuj9V4gTV1HaRIXTpCQS0gKYssc+yDXKt0u+GLWztaNaz
	 NYNWfBNSoogIc6AfhgG7Akq0d03/3JhAVZwqpQbeGBhn+PwceEFkHei630sg2rnG9Uo0M
	 OrCWnUk9VqQq/rIUNU6FgGCk42CzteYkVo/aG/1TAGXWt+Paz+wpAXnyXx4MVID+caMv1
	 UERpTQwIaHJ83gWQPfIgRx4vCd8M0yKTm17AlBo+UEvAD2rJ4XPYkapaZhXTJ6Iwl//cH
	 ZaIAZTVxt//QXBdwdRnyRCSygCRR2JfwMizTNncc6Tp7XxhTHEtcsEoC7K7cog5dVGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="cbJP84q/";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B7E606A329
	for <linux-clk@vger.kernel.org>; Fri,  6 Nov 2026 18:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07B7E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cbJP84q/
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so8704505e9.3
        for <linux-clk@vger.kernel.org>; Fri, 06 Nov 2026 10:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793988032; x=1794592832; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NWh3cyZ5yf7zg/LkQ3FygSjfNpeZJYxZtQPW750sMhI=;
        b=cbJP84q/pNYWXBEDIQ8ioR33tDQoZDaiQg1DGJfeSRZkuEeWOvCuiT4QpwcAezuii4
         NnFwUW1Cq+tSGGfl5zy0Iq6SDvpxgrOGhRbY/5XxGTEX75Cby8Ms3Nf8MGEnvC0Wkzbs
         RdO5i04pnw7yGUPycp7BfDbjXP77ff2yz7iqKD6DW8m36ZITRENWc1OEP/r9RlX+q3uH
         3y/SGnrZ6Mbk/yDj57+dHn3kFkToOZ0YEw7M3jNW28rI/t7xhcp/6P/al9tAY7+eQKrZ
         ZR7CzcthPjGTBibs5nMtnEo6E0O7diq93UrvdZcg+T8YVlIZnpfDvyGzBEOlcW6TtToS
         E/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793988032; x=1794592832;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NWh3cyZ5yf7zg/LkQ3FygSjfNpeZJYxZtQPW750sMhI=;
        b=cv84yfJM+/tpsrEn2GvcFzl1+EfyFXy/CNxpmGVKMArGJbdUpYZ9iTykRdOWdHkEQv
         sR8aIVYML26CxzVdUEQlpnQH3OuXtsQYfGoOPQjtaKU+rYtewBbIhoChY6kw1a/R4bnU
         Zo2DhWuheK4+4EwgJN7vcNIyp5H5hJcxdzzr8Les4BqMJ2Ya9h1RgauwQNK1QA3xzOBi
         ZoDf0tMZKTDZvqw81ALbjoZrRbVBlHgUnfgPMYq8+8Y4Yj7IRpsmwNk9hdV/M9+th9Pf
         s8IY3zY/aaA+Nt2Ah6avR1Ha9F70KeMxSp7fuGewwONgPMKFHS5cZirvVNAAgZcO4nmw
         Y/2w==
X-Forwarded-Encrypted: i=1; AKwUvBw8X72zxJ5y+KRkaPBhsB8dI2UJuopFw5Xsxf4gbCboTzrvA/94zYA+jTFUpDAB/fZ0LKSroMf/LlQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fPtRqVsXU/iSrOL4ligv79bEq29pyLc7OkJ93wTzqnEcSUoTZ
	8g9w3iY5aLai3+au2kggR/mnvxJGc32EwY3YWnsTImLmlXqAdQMSEHLY
X-Gm-Gg: AYBFou1XCrWPkEV2HmHt+Rl3qTzTq7TRjw23jDjh9Wm+nZ3lPSzeSk+i/5TNo3AfqCv
	kD5ZmyLEa1FEhOhWDO273MOSv8SgmpWz8mL5AUh5bj9Qu2viKxHk9C+ibfozq5zb1SyZ5OXztfN
	xrnyFLDTc+8yXE7+DxcxATLTSahq1h/y1Jp/nf9XqWvPhI9+qZsofh48peUIaKFcsNQ3RJan2SY
	NN/sg/WxSGBf0BcaLbAruN7itunC92cGUJsbDq8HqHg/BUEqgRiFuJwdOwAkoJ0YdJylKanqtj9
	FM09Tq+eMWjPlC5NeCT/LjN8L4pgoP7D3JMZ55RUgY1n3DUHEwUnsv2P72dehXRSyZasd2gEcvj
	SuyUgJvSA0jkuhwF5nakqiKhCnK6VVeaIcMs/JVBHNrSnw9A3h0E3E4+2VRFyj5JJkmWc5XdBnl
	1Jk+UkPCxiH/opHjgbX6GhEwxim1i88daCxnI3+icm1yd8hyxSzoIgyJocyAqIseaZPKOPWz5oc
	VT+IrLPQBtt190h4lSkBDDW1cIlC5WGlTO5e0AfJxJLSY3e9eUwUKfgZ0BpYiO4J6lRRvO/Pqij
	ou4UEod7z3GnKx+FYFLNJF+TLFvzWU/A35MHJ/WOsngd2RL9lETHbdWrH1Ttsgjcpg==
X-Received: by 2002:a05:600d:82e1:b0:4a1:9663:7639 with SMTP id 5b1f17b1804b1-4b6e0cf4464mr63502005e9.34.1793988032173;
        Fri, 06 Nov 2026 10:00:32 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b795038782sm2465185e9.3.2026.11.06.10.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:00:31 -0800 (PST)
Date: Fri, 6 Nov 2026 18:00:29 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Brian Masney <masneyb@kernel.org>, Carlo Caione <ccaione@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Brian Norris
 <computersforpeace@gmail.com>, Brian Norris <briannorris@chromium.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Boyd
 <sboyd@codeaurora.org>
Subject: Re: [PATCH 1/2] clk: divider: Fix the divisor for rates above 4.29
 GHz
Message-ID: <20261106180029.05452269@pumpkin>
In-Reply-To: <179398031041.2573818.13317727784501684521.b4-reply@b4>
References: <20261102-upstream-clk-divider-large-rates-v1-0-eb17035bfad2@baylibre.com>
	<20261102-upstream-clk-divider-large-rates-v1-1-eb17035bfad2@baylibre.com>
	<179382912410.620422.14715602424648962218.b4-review@b4>
	<179398031041.2573818.13317727784501684521.b4-reply@b4>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 06 Nov 2026 16:51:50 +0100
Jerome Brunet <jbrunet@baylibre.com> wrote:

> On 2026-11-04 16:52:04-05:00, Brian Masney wrote:
> > > DIV_ROUND_UP_ULL() takes a 32-bit divisor, so on 64-bit platforms a
> > > requested rate above 4.29 GHz is truncated. A divider fed by a 5.94 GHz
> > > PLL then computes a divisor of 7, not 1, for 5.94 GHz.
> > > 
> > > Use DIV64_U64_ROUND_UP(), which takes a 64-bit divisor.
> > > 
> > > Fixes: 9556f9dad8f5 ("clk: divider: handle integer overflow when dividing large clock rates")
> > > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > > Signed-off-by: Carlo Caione <ccaione@baylibre.com>  
> > 
> > Reviewed-by: Brian Masney <masneyb@kernel.org>
> > 
> > Since this is a core change to the framework, I'd also like to see what
> > Jerome thinks before we merge this.  
> 
> I've had not problem with the change initially but then the AI told me that
> it brings back the overflow problem fixed by 9556f9dad8f5.
> 
> At first I thought it was crazy because it would mean parent_rate + rate is
> more than 18 billion GHz ... BUT, a common way to ask for the maximum rate a
> clock supports is clk_round_rate(clk, ULONG_MAX). This could trigger the overflow
> and there are instance of this in the kernel right now.
> 
> A way to make the calculation without the overflow could be:
> parent_rate / rate + (parent_rate % rate ? 1 : 0)
> 

You just want:
	parent_rate ? (parent_rate - 1) / rate + 1 : 0
it is even likely here that you can assume parent_rate in non-zero.

David

