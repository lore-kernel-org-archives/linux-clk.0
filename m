Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795477121;
	b=hXkKL3C3B4N0SnRYO411sDo3nS0ICojR+ru6CtrZK+7VXfB9bRvfb/nWQOedBJtAB7eb
	 78Y3TczR89jA942ZlFtJbAwxbcINcIlB9VH/0E0EhZ7pzX5Ly8whTmA/4chMZEsX2b/V5
	 5udN7p5/XJawLtX7ZfI4pUOUJO+vemqfABbjhQjPWZRfq3R6G+uiiTFZvKEKpoXKmycHj
	 DCUX6ucoKr0hyOoP4b4ypaCG7TkX8QNa2H/KILzgJv3DYe/urEuiViG52cfZJ2a21690m
	 ZVzBKOJc19wINZ2boDXP1Am4yWbXmBiYQhs24gFSlMfvlvq3oS52e4jAPMy3+C9Dj1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Einr74sQAkzSbj9sKOtqtREzhhtG9m3Nk6hF0w3+ejI=;
	b=MXdTwjcLP1uW8vy9zWofigOXr5TVKesA9BkRSZ8uV2uFFwVtdyRx3skkdO01ZVWGRYNm
	 0//o7CwwL3BVhhkiOJUwuW9Vm/QT3Ki9PSxitqrpX4puhzUyscyalMyiLXHLpiZ4CDFz9
	 tVzRPkU9/B150MLcmwS7SBhADkCggoYF6ql1j0IbDCoW4QKeqzLFz9Hf9Jlb85HN1kd0H
	 ALiZvr3PrtpypwvoJ34XXrsyooOI2aMeJwHluieDH3qGIntJ1rL8iQgpZWVwnodSd5s/j
	 TA9n4E4+1wOrZuHhMQBb9Lnt7Ab4UTCDDhAIcAws+XLtWRsBRUYKWiOi/1brtWiWHqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K2kDb4oF;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F12A606A31E
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 23:38:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F12A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K2kDb4oF
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4a357b1c649so2287288f8f.3
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 15:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795477120; x=1796081920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Einr74sQAkzSbj9sKOtqtREzhhtG9m3Nk6hF0w3+ejI=;
        b=K2kDb4oFcl8uIzhkHqPyyooFU/ORVtCA8gIAQaZ0+/ogLwMZqenSGdt13Q/0FBxG40
         meG9gVtdg+T2gIVESWdJjgBQ5MccPS0J6oFCkR1KHI2xuQiAUeeMy97WrkzlPFIEqh6T
         il0U4uJZiRFADtxUja2zf8M9w08HB9JKaCunP8NEwA/xJ1MQBNcmZXyahieC0Wy2zO7e
         SkbBSdM25sm1TltETJvwMOoYeUi8MFqdJtfHjo9uQSubhZjjnuHC/29gL8mv8Cjx+x0Z
         Hzp+u6geGHGaTZpcyi2nXG1wd9R/59aavLsI+61hxoecXcHCsN776K3m6ZDJZ0si1gJG
         a8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795477120; x=1796081920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Einr74sQAkzSbj9sKOtqtREzhhtG9m3Nk6hF0w3+ejI=;
        b=eEBmlP0aHVePj/KJEuTUw6Jv1P0/O1mPOa3HFHuGmGzf1D/RSMrDxv4nvpZOUAg2x3
         uIFt0uCaBeWuwCnK1lqFV89TzqboKjYkzMa8HJRnOrWzfFsP0O4KtmP75p9Xv4MLKFaP
         hpSFkwosZa5KYB+uqa1X4cYzqcaU9s5EY6TJOyOjHUJvHRQKzWC8Z/K9Aifm5gsPv4Z7
         eqNCRP1bRwvgL8ZCUw08QiRg3YaTpymyAaSS5Pi6atzgTrZyhD5W7bimSv0TAsNFS/Zi
         bkN+soAPTu/FmIO0NAlCf0a7aZJRXpj869UhEDw9ixB1gItWyvoaGlp/WDUVmXwCJG/X
         Njag==
X-Forwarded-Encrypted: i=1; AL+hErH/NzYUnX5LHizhg4ikKN8zqEt1mx32+z0jxlnt9wcIqsz0Vw6NTtaOxGovGwDdyvcdhsZbNpPzHTw=@vger.kernel.org
X-Gm-Message-State: APuU4Z95x7g6LGAb7FRB8gIEF6iF+XbFlKwKnbAgdA1Kw8sElPKgQ71Z
	SSJ5u/lEmlHIgnr44HPH6xYMQhxjWWWKLDWFg0nhRw5TZZE4vtNGBTJx
X-Gm-Gg: AZFdTZexcfZNmdTRhJYWzgCHP65Bbz2VQq7d+qcmC7ma8O3zMirJMC+U9YRfpP5nL0Z
	qRiNd6TfUkZeOnZKWBNGp2w8qOL0LEWQFKZtNZZHLiFtzbH5PblhgcZ8BZkjkH8at0hF1eXBnEj
	bRI/UnsV1FJydiOYSh/2pYI7UYwuEDQpKDwdJWBLO9j2qBjq5aLyI0vEXRvA1nA/Fj921fX4uHy
	8OulNXjDS4aoZrJkuCO85iw4q01xKXhXaV3rcnZmUmq8cXd00tE8E+5xV0GI4zsTVvGBWlj228/
	xA3IUPrMWQDS/zPFH9ohA5ujfOJYCTAyZHVxiKdgd3HziYXhqsPSYIpz7NiqOSRB4gsEeYsHJIO
	NZkEewtiWLECO8rkMTGWcyHwfAmTm4SUAxdlDIvxCM+rLP9ejflg4JZfiAa1vHmoPWyMMTnv7jV
	bLOeoN9UgXfFv9wwxEFCPLYVtWkg5gPpzx/0d8dCVFF/jxcKflFj19Qrb4WA0wRsEgHNgK+zXBA
	ZOxwnppCQvcmD+rOFEj3L0fsEtKrvgcfqZLm5hUVMFtORPenVrOpbRDQ4Y3j+OMuoWTGmdjTgEQ
	cfz70O79y5ivcib+VuLnSFqvHRTkIHwoKZMsesF9NPzvJmdBtShauJ+uXRU1cU6RqNcEqBjFsg=
	=
X-Received: by 2002:a05:6000:2902:b0:4a4:f208:6a46 with SMTP id ffacd0b85a97d-4b58a524c2fmr5339919f8f.13.1795477119458;
        Mon, 23 Nov 2026 15:38:39 -0800 (PST)
Received: from localhost-live.home.vlan10 (053da883.dynamic.tele-ag.de. [5.61.168.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe48sm22701252f8f.23.2026.11.23.15.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:38:38 -0800 (PST)
From: Joshua Covington <joshuacov@gmail.com>
To: masneyb@kernel.org
Cc: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	andrea.porta@suse.com,
	linux-clk@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: rp1: allow the clock provider to be probed again
Date: Mon, 23 Nov 2026 23:38:27 +0000
Message-ID: <20261123233827.61587-1-joshuacov@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <179545567027.246915.947299820828330388.b4-review@b4>
References: <179545567027.246915.947299820828330388.b4-review@b4>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Brian,

On Mon, Nov 23, 2026 at 12:41:10PM -0500, Brian Masney wrote:
> There's presumably other drivers that will have the same issue as well.
> Rather than having drivers all try to fix this themselves, let's see if
> we can fix this in the core for everyone. Can you try this completely
> untested patch? If that works, then you can take it over. It will need a
> kunit test.

Thanks a lot, it works. I tested it on my Raspberry Pi CM5 (currently
6.18.64 with the Raspberry Pi downstream patches) with your patch
instead of the clk-rp1 change. Unbinding and binding the RP1 PCI device
again, which oopsed in __clk_register() before, now brings all RP1
peripherals back without any warning.

I also wrote three KUnit tests for the following:

- registering, unregistering and registering the same clk_hw again;
- hw->init being restored when registration fails (-EEXIST on a
  duplicate name);
- a parent referenced through clk_parent_data.hw being an orphan after
  it has been unregistered, and reparented once it is registered again.

They pass on the CM5 and on QEMU x86_64 with KASAN. Without your patch,
the first two oops on the NULL init data, and the third reports a
slab-use-after-free in __clk_register().

I noticed two things while reading it:

- clk_unregister() now writes to the clk_hw. So far it only touched it
  through ops->terminate, so a driver that frees its clk_hw before
  unregistering it may now write to freed memory.

- hw->init is also restored when the clk_init_data was on the stack of
  the registering function, so after unregistering it can point to a
  dead stack frame. That only matters for a driver that registers the
  clk_hw again without setting hw->init first, as the updated comment
  in clk-provider.h says.

On the CM5, clk-rp1 also keeps a cached rate per clock that survives a
rebind, so I added a small clk-rp1 patch that resets it on probe.

I'll rebase on clk-next and send a series with your change, the tests
and the clk-rp1 patch. How would you like to be credited for the core
change? If you add your Signed-off-by, I'll keep you as the author;
otherwise I'll use Suggested-by.

Thanks,
Joshua
