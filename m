Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AA12C190
	for <linux-clk@vger.kernel.org>; Tue,  7 Jan 2025 14:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736261210; cv=none; b=T1Xask/NZpxbkzy6YkH6imKDHNH1okb0ajtRrZD7s7RAjy7sVac8j9l2cUEnh9K+0nwPKFR4uQVFfC6du5lMtvB26HAmPXBlivaZRozNZA9aPPaH/t4CSJb1ujlauhnY0V5m4YjK1SDUuvDXnL1wVKZwZZvR5LsdFWdJvePVJME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736261210; c=relaxed/simple;
	bh=/szHnnX22AGYTFHRlgKZ0j4npFdO5GoG+zwGKzX8Fkg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=e8UJKkh1aUGSZ1yvdcddSs1CGRiJl6kS4fumfVEpkadfql/wlwyxAQ8FlA7ffGnVxsuEgU86h85zYDrFe/kCSUXEJX9kRx8n9G8WLaN/5iNWqzmNxGXm0sNrjxDjqQAGZ+8JEOcuqhYkAZg3r8R4G2um2lMJWHibLnsx5VFACz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=qhQFtkJz; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="qhQFtkJz"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-385e1fcb0e1so8556371f8f.2
        for <linux-clk@vger.kernel.org>; Tue, 07 Jan 2025 06:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736261202; x=1736866002; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P8ozCYiYiGuUqL3zEljw8rKehpkF96Epq59O7WR0Gnw=;
        b=qhQFtkJz36pcbqAluYjNc77TdGqdrS6725Um0nIMuxsK1tbM12os12BPQRFhCWew/T
         tyCFcw892AUEzCzmai0whMfev0ZPONtZi5Ez86aek78wtpuuyz0ffX14jRyZzR3Z5Gz2
         h58hsDC03LE/03c+vF1E9mFGaTt7ku91c+1MCuYOSXgAUxkwbHhz4d95r50DDqiNBLLH
         5WuY12ZZUl4Q0k8wwSpAPbNrFscfMB+cimn8B5Gpmh6Xl0K+1jaLN40OEowWW7NlgcGr
         RGYCbAc28+zVcbOq5rW6R0nk6v1aHYB8bjGeMDuST11jVKAyZqqylZSN3vBgUX0myoJm
         4Olw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736261202; x=1736866002;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P8ozCYiYiGuUqL3zEljw8rKehpkF96Epq59O7WR0Gnw=;
        b=eVxzWghJBDjnKe7DcKj7zteZ62yppx4aUtBJhXow+OYJq/UrdBgLvH3jqEGndRiKeJ
         +dr+/z2Al9JSlB+FW6xhn5fNRHBVjtx1NQAANx3hCyyXUqpjEJYVd80cn/FgZTcKZbr9
         F18bThPBdntlz/1qXcRyLwHpHzQzhC/fisuRtIdb8AGZJiskDclbAwu0VSdbdcZNi+f8
         k8NjAUP6c1H/MujXUQdW9ClqCpISmfqjRFb02MZ0DHcVMNle7QMlJFS1u1/u/EAQ894N
         7NNiURCiB4grvkaGV4/txlqV9aPul+RACVGmgVondi9wxMa0N2ditDOpqubg3MZ0JZz8
         CVGw==
X-Forwarded-Encrypted: i=1; AJvYcCUpctNGVVKEYMTT99SIxIfMWPcgTyLUiISGs2zv/yAZv02z5DqPBnWAiu1fbc7UpP5zle8cFf7dhPA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7QrXmpVzUnCWHdkqZXoIMOoKZJMWWom0suhsvSoxCVu00RBmZ
	Kh3N2jzlXXB0MiqbgKMC2QaL6SOMdSVXD9bG8yrmpYuq2g9Ct4r/YpMTWBMVyug=
X-Gm-Gg: ASbGncvemqHKdinYv7K0cAgildFZa820jsmFDXEcut95Co720XscZN+yjtIUHa0iwZN
	DeHzGbZnbN2wDv38juC/uXQPY4AZrHimPxtDlrC4zjGPknj6yBihkAfPDEFiG9Eu/jfyClMBN+J
	LSDNv6GFfgvuhIALDJ9Ay1BKK6tH8wsDdCvmMju7j3AzTIHPaBiOtjdybcrInqxoBFEIoREr0xp
	l+XvXmZdDVcEPXT3JlU0SzhQX7prH+vECa88Quyz34vDQyhFmL2hwUS
X-Google-Smtp-Source: AGHT+IHYnYuf79+TuNYGxdmun8sEw8I8CqkwmQhKmeo/6Hm3L1OAdm2lbtny8ghlT05plmgQdN9nhQ==
X-Received: by 2002:a05:6000:704:b0:385:fd24:3303 with SMTP id ffacd0b85a97d-38a221687cbmr52724901f8f.0.1736261202199;
        Tue, 07 Jan 2025 06:46:42 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:dcb0:c50a:35f6:d748])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8b874asm50554580f8f.109.2025.01.07.06.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 06:46:41 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] clk: amlogic: drop clk_regmap tables
In-Reply-To: <ed20c67e7d1a91d7fd8b921f156f56fb.sboyd@kernel.org> (Stephen
	Boyd's message of "Mon, 06 Jan 2025 13:09:06 -0800")
References: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com>
	<20241220-amlogic-clk-drop-clk-regmap-tables-v1-2-96dd657cbfbd@baylibre.com>
	<9f1d69ebe1ddce5dfc170e986c9213f2.sboyd@kernel.org>
	<1ja5cp8f87.fsf@starbuckisacylon.baylibre.com>
	<88fe909ab182d1f17f6ef18161c7f064.sboyd@kernel.org>
	<1jfrlwb69r.fsf@starbuckisacylon.baylibre.com>
	<ed20c67e7d1a91d7fd8b921f156f56fb.sboyd@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 07 Jan 2025 15:46:41 +0100
Message-ID: <1jmsg2adgu.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon 06 Jan 2025 at 13:09, Stephen Boyd <sboyd@kernel.org> wrote:

>> 
>> I admit early clocks is a low priority for me since I only have one
>> controller like this and I do not expect more.
>> 
>> If cleaning up this particular case is important, then I could add
>> another level of init:
>> * A callback passed along the init data of the clock to get the regmap.
>>   That callback would be called by the .init() ops, if set.
>>   That can encode any quirks without polluting the ops.
>> * It will grow the init data so the change won't save memory anymore.
>>   This was more a bonus so I don't really mind. Maintainability is more
>>   important.
>
> The struct clk_init_data _can_ be thrown away or reused, but it isn't
> always done that way.

Yeah, I was actually thinking about using struct clk_regmap for a
start. It is much simpler

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/meson/clk-regmap.h#n23

>
>> * If the callback is not set, then it goes through the default, as
>>   proposed here. This would avoid patching all the clk_regmap clock of
>>   every controller.
>> 
>> 
>> > Furthermore, the name of the regmap is
>> > also usually device/clk controller specific.
>> 
>> The name registered in regmap_config itself is device specific, not
>> controller specific, since it can come from something else in the
>> platform (syscon or even aux devs), that why I think an independent
>> namespace is desirable -- Same goes the generic solution Conor is
>> working on I think.
>
> Alright.
>
>> 
>> > The regmap assignment
>> > doesn't really fit with the clk_ops because it's not operating on the
>> > clk hardware like the other clk_ops all do.
>> 
>> I see what you mean and I agree. It does not operate on the hardware but
>> it does collect the resources it needs to operate the HW, and ideally
>> it should do just that - without controller quirks popping up there.
>> 
>> Anyway a callback passed in init data takes care of 'io vs syscon'
>> controller too, same as devres. I can go that route if this is what you
>> prefer. I thought devres was a more elegant solution but it is indeed
>> restricted to 'device enabled' controllers. 
>> 
>> The change will be a bit ugly in the syscon ones but I don't mind.
>> Is that fine for v2 ?

Just before discussing what seems to be a very generic solution, I'd
like to go ahead with a temporary solution to remove the clk_regmap
table in drivers/clk/meson, if you don't mind. Something simple.

As I have pointed in the cover letter, I have a significant number of
other clean-up on top of this. It's not necessarily complex but it is a
pain to rebase because of the amount of code involved ... and I have new
controller waiting. I'll circle back to the final solution afterward.

>> 
>
> Sure. I wonder if we should make it a 'const void *data' member of
> struct clk_init_data so it can be anything and then either take a flag
> day to pass that to the struct clk_ops::init() function or set the
> struct clk_hw::init member to NULL after the init function is called. If
> we're concerned about bloating clk_init_data then we could introduce
> another two registration APIs that take a data argument and then pass
> that to the init function.
>
>  int clk_hw_register_data(struct device *dev, struct clk_hw *hw, const void *data)
>  int of_clk_hw_register_data(struct device *dev, struct clk_hw *hw, const void *data)
>
> or we could wrap the init data in a container struct in the drivers and
> move the setting of struct clk_hw::init to NULL after calling the init
> function.
>
> 	struct clk_driver_init_data {
> 		void *data;
> 		int (*driver_init_function)(struct clk_hw *hw);
> 		int (*regmap_driver_init_function)(struct clk_regmap *rclk);
> 		etc...
>
> 		struct clk_init_data init;
> 	};
>
> Then the clk provider can use container_of(). If we did this we could
> even copy the contents of struct clk_hw::init into the driver specific
> wrapper that lives on the stack, repoint the struct clk_hw::init pointer
> to the stack copy, and then all the logic can live in the clk provider
> driver that registers the clk.
>
> This last option may be the best because it saves memory by not
> increasing the size of 'struct clk_init_data' and doesn't require a flag
> day to change the function signature of struct clk_ops::init(), even if
> there's only a handful of those right now. What do you think?

I think I see in which direction you want to go. The problem is that we
have been playing the 'container_of()' trick quite a lot. Embedding
something around init_data is not straight forward for me with the way
clocks are declared in drivers/clk/meson.

I'll have to separate the init_data out, which is desirable but it
brings another set of problems. One mess after the other :)

So, if it's OK, I'll resend this series with a temporary solution to
remove tables. Removing the table simplify the other clean-up I have
already line-up and avoid some unnecessary diffs. I'll circle back to
reworking the init_data afterward.

-- 
Jerome
