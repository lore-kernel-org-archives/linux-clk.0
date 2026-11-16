Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827987;
	b=UtZKbisquCT3xRMXg7eYx0KQ2ZWcMrMN+aDXO2bvrMeuBsihlBQwF/Qu6YX+eFWywkRj
	 4Eei4z4I14/voHozIOSwnVxI9szEx09X2Z5VgsqlnffBLfhuJOMNm+tWUWWwhZRHxNBo0
	 Kegzw4BjVblwOwmORwNs6Fnob2bCSy2o4Ii0S10DRrp6mfVFhyVpeVxsNpiDKGPZSxiHT
	 6R/SAkwf7lJ+rX73Z3BcVZyN+LGbqXAWdnxYLmUrAJdZdL5/31LeOp68JYiLx3XVGa0Ah
	 rvfx3Xi+RA2lk9wfRpkERUlJE8XDBqBBPHxe1/wiIEafZqCb69jOJ410Q+5SHzYVI7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827987;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=12toUiBvLkAi2L8mYkegaLZ2w5K3s+1X3UnVPi/V9L8=;
	b=jvOWKdC1IUmMDk9j1uLad1qSlTlzf3v2aoqeszrbsKkimu/PI1mGJCSgdDoVhbmImLOu
	 piGHPP+oNxCcBoNSY+YP3e8WYYr8Iu335ER0OOCIdVVgy2PKZzCwES87XDfnZi6PsvDJm
	 WGSNZfjnunADPhr52u2LjrpUic3RoN0ag7Z/BR9+607mT9kA7IBgprojiNgbuqIsCAVxX
	 iZ534UxBU6g2IhH83MCvgmeMwMpWE5nHb8ztdL77LMHUs0wFxSx5rKLPkZref2R4RDylA
	 5DlqhnwuOoT8HjLV9K4vERZwH035cSah6Uc73T524HxwVoRGwoezDWrDbJMpCseLwsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Dv1CJ8fC;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481B2606A781
	for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 11:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 481B2606A781
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Dv1CJ8fC
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-492f0a1b685so2358869f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 03:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794827985; x=1795432785; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=12toUiBvLkAi2L8mYkegaLZ2w5K3s+1X3UnVPi/V9L8=;
        b=Dv1CJ8fC+B7LC8Vv6C1iSSMs6MOo8POhWeVIp8ajDOulr1OPu9rz7gi3Qv8kIKnTuJ
         1QPd/r3TIhqTpU7zuqM5OWEx63Xes+8DfHcF42hwupjVyBsPWcKr0JF5Mhgp7iI+mUOO
         X0H/XaO4UvhDEWBR4XSjfXoDEDHVamTd8gVdWVoJuzIFEFZy+vddUCMPuzpCH0fH1+0Y
         Bmh7VM7qolz1t520igRTI8bzss2sRN5htXfEImLD039reM3eWNVWvda2BxzTzZrarsO+
         mSTcanTlL8zgnIB6jcTR5xZdMtLGDnLce7U2cq2+dlBvaff6Fr+CNGn0o5m/ICAtvEN9
         ygiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794827985; x=1795432785;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=12toUiBvLkAi2L8mYkegaLZ2w5K3s+1X3UnVPi/V9L8=;
        b=oiKk84ehjpWlfPmaisnYsptrbutgIAwwuyUsn991zFpPLd/qtvP6xD0lR2YpHMtE4V
         22MNmrhsvoi7KHq/QRty0foETgkCzUs9Wpsfc8CJ8nsLY+X6O9wwhJYgZGzoPXU8iISO
         T2G29FfEMZ2r8A5BWsC5q5N3/Vy/5dkcLzi7yOcrSd4xE/54phJmnit/NxfDQgyF9bw1
         /DpkHrYQsus94Xe2Sknudd8nun+71KQGSpwjngEj/HCRoB+o6OgXFXQ4rwybyVyIOffR
         5pE4jIOwEg4c79xPLYiNK63IOZJk20kVNhQ/StXALapRbIAZhovuYJi7GXlbvd3gsJds
         TwsQ==
X-Forwarded-Encrypted: i=1; AL+hErFvlEAIk+2nc5z1WcBchHfgxOq+bvNaISgOTgmysFxTG4KhZ2jBcAvdo1iHnnbAC3uWsikQsKJeeOw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8woT4CSsj/1EMa+9ypJFLaU9cQPObBt9Nv3+HGmQ+KCZBlZtv
	wsd5EANrHjYwEcFGEgbC2Dn2b0S/gOZb2t90UYIf+BOg74kfWnZLUUpBsak+DMRgWiU=
X-Gm-Gg: AZFdTZd3I6Y7IDBR5K8JIshfUJFfxwMWKjAvsmG1lYnnMf5THtzmMY2o8h8oIdvGoxu
	V/JbUwy2x6fVIVTZHVbxHpEterQ/mtsApgdU1NUmd3l1EZYGOcaxHQ51E5yUA2j2UOjTqrqHUVv
	IOiRUHKS1kK449Thpwxw+dXXuGTw6G4XTW91w1Pcn59KNX4fY0tU9zQ3aOh8drwUUYxWzMTKLEK
	CthVZPvE67fBKXs53cA2XmHVwmzvM2hMHff3ojsr//TbXl5R71o40w+RmI8eCoH5BZTJk9qLKpE
	sEoqMf64LAY9e2irm+UJY2z81MQNaBpk0YzHYFln+P2xsYjRHJUlNa9aesaTbfbk0vKCH6ysyug
	p1Tu0IwzS8PF+iifhEkukPV0kIsqLmIoDJ2ka8l18FkFOe2AfhFciRf9LWZU/GLsZFCfJZJo/XC
	Aq4FAI1wSrV+WK1LGivK1q75EZ9NYlCztSpCQkBSm4ZQltXfCUpm3/jwOFL4z/5qvYT9zI/sPH+
	ZyDflEHKGDUxynuOBp6q+JWuNg+RQ0i4ggcLmGyNMSHCQJW/V6XupfFGK5n3xOmqJO/K148lOQE
	yKeJUt1jfKaaUvYetALZ6/0WPhvLkatnqF+Yzt1mSrIjYTtg
X-Received: by 2002:a05:6000:1884:b0:498:42e3:3f6f with SMTP id ffacd0b85a97d-49c6d63fa5amr23999007f8f.5.1794827984759;
        Mon, 16 Nov 2026 03:19:44 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c7390fe82sm22622193f8f.17.2026.11.16.03.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:19:44 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Brian Masney <masneyb@kernel.org>, Carlo Caione <ccaione@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Brian Norris
 <computersforpeace@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Sascha
 Hauer
 <s.hauer@pengutronix.de>, Michael Turquette <mturquette@linaro.org>,
 Stephen Boyd <sboyd@codeaurora.org>, David Laight
 <david.laight.linux@gmail.com>, Sebastian Reichel
 <sebastian.reichel@collabora.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] clk: divider: Fix the divisor for rates above
 4.29 GHz
In-Reply-To: <avXhA9mJL0EIcm_0@x1g10>
References: <20261112-upstream-clk-divider-large-rates-v2-0-18f3bb888b0c@baylibre.com>
 <20261112-upstream-clk-divider-large-rates-v2-1-18f3bb888b0c@baylibre.com>
 <179449618653.1227210.1767827907767958978.b4-review@b4>
 <avXa2Z3R6Xogr6Sw@macbook.homenet.telecomitalia.it>
 <avXhA9mJL0EIcm_0@x1g10>
Date: Mon, 16 Nov 2026 12:19:43 +0100
Message-ID: <1jmrr92fcg.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On jeu. 12 nov. 2026 at 10:53, Brian Masney <masneyb@kernel.org> wrote:

> On Thu, Nov 12, 2026 at 04:29:55PM +0100, Carlo Caione wrote:
>> On Thu, Nov 12, 2026 at 10:09:46 +0100, Brian Masney wrote:
>> > Hi Carlo,
>> 
>> Hi Brian,
>> 
>> > >  static int _div_round_up(const struct clk_div_table *table,
>> > >  			 unsigned long parent_rate, unsigned long rate,
>> > >  			 unsigned long flags)
>> > >  {
>> > > -	int div = DIV_ROUND_UP_ULL((u64)parent_rate, rate);
>> > > +	int div = _get_div_round_up(parent_rate, rate);
>> > 
>> > _get_div_round_up() returns an unsigned long however it's downsized to
>> > an int here.
>> 
>> Right, but wasn't also DIV_ROUND_UP_ULL() previously returning a u64
>> that was stored in the same int?
>
> OK good point.
>
> Reviewed-by: Brian Masney <masneyb@kernel.org>
>
> Jerome: What do you think about this?
>
> Brian

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

I would welcome the other fix regarding div type here though, if you
don't mind Carlo. I don't we ever had a divider going max INT_MAX, but
still better to tie this up.
