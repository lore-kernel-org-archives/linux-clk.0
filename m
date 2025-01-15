Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8BD24A7C4
	for <linux-clk@vger.kernel.org>; Wed, 15 Jan 2025 15:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736956740; cv=none; b=jc9SmGWjprMipR8qscxprEVa3vTEu1ykSvDuc7guIWUjxfWhyCRdAOUcnyCVsYU30ZZHXmndjtkNl3AHexSwNLvzpASwRcKw6Dbgcfxm5w6jFxBJh3TmqtTiM2P4Ao5KotM8iqdiZPVdsTlMRBTHdn5Tl8nE7A3gt7vmaCbGPjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736956740; c=relaxed/simple;
	bh=BhBlpmdpqpQJlZf53eDSeyb/0YNdtDH4FARZameFDEs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eScIknPta1WhsFALF59rPgdYBFeRbNXv1+6jSIilbyWymAM7J4yZDNpgXDS/lkgj5s1aYzUdBi91RQwo8KXC69oQZwM6Vezd93A+kmEEKJJCGcUptiJn1JP2RP3KprropuZ29u22iAwe9icae2UMZk8wIWax4z85p6ZTx2YGkQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=056PCzIv; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="056PCzIv"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43623f0c574so49496335e9.2
        for <linux-clk@vger.kernel.org>; Wed, 15 Jan 2025 07:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736956736; x=1737561536; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kqI+5tYngrQZ8qcvDthiAqlsLEDhI5d+xlqNj7Uno+M=;
        b=056PCzIvhmA3HlFPD+N15PsKhuXw45qob3QSUJNEYVBqBTCigVtjtQLEZb6huO7ItZ
         AALvqqiOYhVFE38OKW7eFX9vbO3sL0RJAGkm/iOgp4uqHvgZQNOQSW3/0VuquFQIn6z4
         sN99ktlvJ2A6AXYvWbfeaHLtXK/5/vGXkouJmMi3iwLyAMGH6w1JBPm4h5qQSYVXuNlQ
         xEEBQoyaJ0zV9VDGVA6eY+mZqdyyN9zx9Qt/TaVX9MlwZUJHzAiVAG6YtFRFSyumFn3o
         mAl66ltSbAO//0AjSCfHjEjlkvYKtTGwbOst8kiErHswcJFU1Dtbo7U78D5ukcgJXb6I
         U72w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736956736; x=1737561536;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kqI+5tYngrQZ8qcvDthiAqlsLEDhI5d+xlqNj7Uno+M=;
        b=sVVlZkqPKtV7Ae4MW4pM0WZSLMxh+q1VcL9FwBVo/OKX0h2fccSIo+nKTXW0J70Zop
         nqYd+2tN5ySQr3tZA3mLwLdTPweoqrS3drTPleLvsE7vnojb+74QqM85X1bM6BBfcOdx
         f/OQCIUd6UHiYZgnWSygKeTH3Ft1meulCM61PuhY3m6LDWHiGwBF0NhEOd8ZqQz6LK17
         yZC7bQ90XCDVpBXq9esuY2zHAdujR+BiIj1Q1IHGkoSgfCJ0zDZbb6TAjnWYjUpswzj+
         2ttot64G4fRXzSTzCBFkBiRzweCBarkMcp6ukK+Z1YjNrxfyVegsILNOpEJ6chDkI6kl
         H7rw==
X-Forwarded-Encrypted: i=1; AJvYcCV+U9QCOJzNzny9VOJEw9ZPJ66tG1ZlhVOScI8RAPdxFYTTE6bhyii9cb+N+muox0Fdho/u3v6bSrg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCjTtpiqX4PDVtNCFq5VGV6KrZS07CSUQ278RzpdL1kR64AMVD
	Mb7DdHF1H0bSK5mapI4R//YEH17RjzlS52F8SumXyPAEDPnZEWslWaklWjLhNYk=
X-Gm-Gg: ASbGncsGxw0TWRC7Fu+XHVkJHIPjmyrigJX1rCX0OV9KqUJSfW5i13YIYz0WNGv/B+d
	IMnfS15pvvdhagmOe8AQiEhBXcuM4PJkcU6KHRv5IqYuw/LpqlaKNQ+ZQpPga1N3/PCyUR2qXIx
	4IjOYraTzTtuPU8Lssjp5/gcT8WSFvHObYEjNQAz/JR4N20ge/7vu4agUOvUhp1+ZB7hRQpRx5w
	b2p+4daiw8x8STU7d1ikHYxjr5QYyAVPKXv/70Ied4ZHaBSO0ki1d1V
X-Google-Smtp-Source: AGHT+IGTWZcoa8XD12jSxjfVWwFjPhENVFnb3eU7ZCXjNrolCccgNcWPAZKi2S5+z1LypovQRe1hYQ==
X-Received: by 2002:a05:600c:4f42:b0:434:a4a6:51f8 with SMTP id 5b1f17b1804b1-436e2555edcmr291354455e9.0.1736956736615;
        Wed, 15 Jan 2025 07:58:56 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:e7b8:6186:fc23:f678])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c16610a0sm33309815e9.1.2025.01.15.07.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 07:58:56 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] clk: amlogic: drop clk_regmap tables
In-Reply-To: <697b634770d789ef8ff0e05cec9465f5.sboyd@kernel.org> (Stephen
	Boyd's message of "Tue, 07 Jan 2025 13:28:50 -0800")
References: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com>
	<20241220-amlogic-clk-drop-clk-regmap-tables-v1-2-96dd657cbfbd@baylibre.com>
	<9f1d69ebe1ddce5dfc170e986c9213f2.sboyd@kernel.org>
	<1ja5cp8f87.fsf@starbuckisacylon.baylibre.com>
	<88fe909ab182d1f17f6ef18161c7f064.sboyd@kernel.org>
	<1jfrlwb69r.fsf@starbuckisacylon.baylibre.com>
	<ed20c67e7d1a91d7fd8b921f156f56fb.sboyd@kernel.org>
	<1jmsg2adgu.fsf@starbuckisacylon.baylibre.com>
	<697b634770d789ef8ff0e05cec9465f5.sboyd@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 15 Jan 2025 16:58:55 +0100
Message-ID: <1j4j205ark.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue 07 Jan 2025 at 13:28, Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Jerome Brunet (2025-01-07 06:46:41)
>> 
>> So, if it's OK, I'll resend this series with a temporary solution to
>> remove tables. Removing the table simplify the other clean-up I have
>> already line-up and avoid some unnecessary diffs. I'll circle back to
>> reworking the init_data afterward.
>> 
>
> Ok, sure. Let's see how it goes.


Hey Stephen,

While implementing a temporary solution I've been thinking about the
longer term one (I'd rather not end up stuck on a temporary one, so it
has been bothering me a bit)

I'll reformulate what I'm trying to acheive.

I'd like to register controller init hook to apply on all the clocks of
a particular type. The reason to do that is to drop the big clk_regmap
table that are a pain to maintain (in addition to be ugly). I hoped it
would also save a bit of memory.

The solutions we've been discussing so far feels like we are moving
around the problem, recreating the memory saved somewhere else,
perhaps in a more complicated way. I'd like to find something more
convinient to use, which does not scale the memory used with the number
of clock registered. The point is not a different hook for clk_hw after
all.

Here is an idea, how about list of hook identified by ops and controller ?

The node would look like this

struct clk_type_init_node {
       struct list_head	        entry;
       
       struct device_node	*of_node;
       struct device		*dev;
       const struct clk_ops	*ops;

       int (*init_hook)(struct clk_hw *hw);
};

The change would be minimal in core CCF, just searching the list for a
match in clk_register. On most platform the list would be empty so there
is virtually no penalty when it is not used.

From the controller, the usage would be very simple, just calling a
function before registering the clocks, something like:

int clk_type_register_dev_hook(struct device *dev,
                               const struct clk_ops *ops,
                               int (*init_hook)(struct clk_hw *hw))

or the 'of_node' equivalent.

I admit this is heavily inspired by how devres works :) but it does solve
the early clock controller problem and does not scale with the number of
clock registered.

Would you be ok with this approach ?

-- 
Jerome
