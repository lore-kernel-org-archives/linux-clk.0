Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D514CA289
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 17:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784826273; cv=none; b=bIwNdyBrYWYPg2eZ106VJ0w0eFYKnFKY3wdvKpKttfN9/RFWe0kj/+J+ON9hazH5pv/JLpAn4HosNBGEJmNnED+NnhfCyEKKK+N4BWQdtvpkUNI4V/9o1n2TpGN1E4tPQP8WCdKodC4NgpcSu0KOnSCvzl7Vkl5lKPhdZt3lHkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784826273; c=relaxed/simple;
	bh=o9VVTo6S42mbOL5YNHeNddQl83IMRvNt9iVw7Ax1zcs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=i1tiV3C8w90LUN1/1W4MapNdP9FnZuGW9QOF+CZD4HQgRC0n7+c5/m/2s0j8Ob+R6PxX/l1Iv/+T8AtMyb1V7VhIkQGsv4ZeNAb8IiQj7m6uDazaMzPjbYUScozPxc4IeGoP5hEi7s8fs43JpWfotYF6SRJ6aBy6HVmpdn5gXqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=BGcn2pm9; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="BGcn2pm9"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so830448f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 10:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784826265; x=1785431065; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jhojDdHC94+BdjAE5gd50YRzJP7qSAXpLrLf8nMSLLo=;
        b=BGcn2pm9WvAug4PR8l3FANDWOZnBQ4XdbW21YipeI3nJ4ukRiQBaauWySLaXoEROPo
         KYl4XqRUVJoStP/ov8Y2R4cynD3Uei8U7U/JNr1wxh6PHKu9iPfp+JkqsyRtiimnKIID
         u94WFQQfdiv8izgm05vPzHzcdo4Vk9kdWiKwzBpidPHKXf02aR/YRfXhapIB5D6i9zKP
         WecHCnnam4b7nQqsbx9VwAiQrqFyK840l+UkKI084tMkH5P2Ps9pXnEzoplZF157Wy1F
         bGraUumSEdCftfBBfBiVnH6T0G4KawEtzV9NMJ1YpeeG0ryczMqalGAvviv62T3ZbI9e
         2ixA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784826265; x=1785431065;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jhojDdHC94+BdjAE5gd50YRzJP7qSAXpLrLf8nMSLLo=;
        b=Z/fI9AUKC/WMi3frZh86dqulEcIY/wA5W5VqqnyhI/OCKf2b6Gch70KnxrKgRyUWjD
         9znb8942J9EC5IFinP8e01Vqol4hJ1/6kqETd3G/3hdp/6KbCy6IKXTHJVLLyWohs6Zn
         ON3zKbpnqBn28wU0O6EGLvilr+ShsAZbEuNevalElBiUR+diM5xY8y7PEY5OpNSq6BKV
         GFnD1mx6vnXAhwd6Ng5ljtgTa4PxyjDtxnrV8/ZmbVfdzt8O8msPHryu4eAWhmefhgRx
         o35lrj8oKlrm6aahKuADg85YcR9DexUQaRshpbvqWz31ht+IIxQJvoOvDP5pyc+NeApC
         X6Tg==
X-Forwarded-Encrypted: i=1; AHgh+RrfigmHhJASJsWod0lGh+Zv9SnteSu6G8gMbZ7VrdyRFdJYv6TYn9mElOevVmFmNC+nSnaTIQ0OnL8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+vq2ZYAvMaYhlSEfGx/agn5VoO6tGfXjJp9uiyKRrbG0PmTWP
	IXxxzWVkiUjYxB1IUUoOk7UsRZceCWDpRkgGFc4OGc/FU2oo0zChwGs6bmgJ9Jkw6RQ=
X-Gm-Gg: AR+sD13/bGnZbv+3/hqTTB6GF8xFCIYJvTwbCt+L2c4grgXLcq0twTtRpDG2eXsw2T9
	h00fdwV9EIeSRGftnT8GtXL1grL75wSnqbVpc8Qfs2Sap/qolXX1s1K4nlEen0Vdge5neNINUqH
	7E1antp/xONOdaz/rQkNzgLZQg/uf2ZjT2oaxxvyJdMP6Cw6gJuPOXrYBWIHhgUbYKIWY8X3nT+
	qNQg2Ce2o17CvigiSmDgVcnmawMKmFTA0zlXHrssn1QHTpWWq3LY5bRF9NpS+h5bOPjDWC3K6vn
	X+RuhP/nkiyOXrFSCc6vcsbI9vgVtHHu5zxn++aSqsR912ZohQfQ7eizmrPaLOuFjePFgFTV/Yr
	7DdjPlWUD8x3ept3WoBUmiki/VBH8K64BfGt6tyvSZEYMTeuiMNxyH3U1TmiwWC17k/KPyKsund
	NC
X-Received: by 2002:a05:6000:230a:b0:47f:8aba:8a9a with SMTP id ffacd0b85a97d-47f8d71c7eamr5497660f8f.18.1784826265170;
        Thu, 23 Jul 2026 10:04:25 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:5f98:8c28:3e2c:1c72])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f85c67339sm17937986f8f.31.2026.07.23.10.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:04:22 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Andrew Lunn <andrew@lunn.ch>,  Gregory Clement
 <gregory.clement@bootlin.com>,  Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Bjorn
 Andersson <andersson@kernel.org>,  Geert Uytterhoeven
 <geert+renesas@glider.be>,  Heiko Stuebner <heiko@sntech.de>,  Prashant
 Gaikwad <pgaikwad@nvidia.com>,  Thierry Reding
 <thierry.reding@kernel.org>,  Jonathan Hunter <jonathanh@nvidia.com>,
  Tero Kristo <kristo@kernel.org>,  linux-arm-kernel@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-msm@vger.kernel.org,  linux-renesas-soc@vger.kernel.org,
  linux-rockchip@lists.infradead.org,  linux-tegra@vger.kernel.org,
  linux-omap@vger.kernel.org
Subject: Re: [PATCH] clk: clean-up simple provider misuse of the consumer API
In-Reply-To: <amImP6sFlv-sNhMh@redhat.com> (Brian Masney's message of "Thu, 23
	Jul 2026 10:33:35 -0400")
References: <20260723-clk-provider-simple-clean-v1-1-0c9668240467@baylibre.com>
	<amImP6sFlv-sNhMh@redhat.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 23 Jul 2026 19:04:08 +0200
Message-ID: <1j5x25d4dz.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On jeu. 23 juil. 2026 at 10:33, Brian Masney <bmasney@redhat.com> wrote:

> On Thu, Jul 23, 2026 at 03:20:59PM +0200, Jerome Brunet wrote:
>> Clock provider should not be using the consumer interface.
>> In other words, a provider should not be dealing with struct clk.
>> 
>> This change targets occurrences for which the provider uses the
>> consumer interface and corresponding clk_hw interface exist:
>> * __clk_get_name() -> clk_hw_get_name()
>> * __clk_is_enabled() -> clk_hw_is_enabled()
>> * clk_get_rate() -> clk_hw_get_rate()
>> 
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>> The change being very simple, I did not think it was necessary
>> to split it into multiple changes. If you prefer it to be split,
>> just let me know how.
>> ---
>>  drivers/clk/mvebu/clk-cpu.c            |  2 +-
>>  drivers/clk/qcom/clk-hfpll.c           |  4 ++--
>>  drivers/clk/qcom/clk-krait.c           |  2 +-
>>  drivers/clk/qcom/clk-rcg.c             |  4 ++--
>>  drivers/clk/qcom/clk-rcg2.c            |  2 +-
>>  drivers/clk/renesas/r9a06g032-clocks.c |  2 +-
>>  drivers/clk/rockchip/clk-pll.c         | 24 ++++++++++++------------
>>  drivers/clk/st/clkgen-pll.c            | 20 ++++++++++----------
>>  drivers/clk/tegra/clk-tegra210.c       |  2 +-
>>  drivers/clk/ti/clockdomain.c           |  2 +-
>>  10 files changed, 32 insertions(+), 32 deletions(-)
>
> This looks good to me however can you split this up by clk subsystem at
> the very least so that the various submaintainers can pick up these up?

Will do

>
> With that:
>
> Reviewed-by: Brian Masney <bmasney@redhat.com>

-- 
Jerome
