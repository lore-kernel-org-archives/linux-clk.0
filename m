Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33835418352
	for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 10:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791800528; cv=none; b=SHkZsSWSXZLAbH8dylStMQfewU1HGyhaZV4NMIeEO8RfQ/N6pMDsy73SstBUQZcxT+XrYIEexVBa5VZK6DvdrkVvM9GTpe3AVckRRzC2cW2gAih2MB9YZCck/ceGPEAtBeW9xqsZC/5DR1VtZrSfnLmgxrAGGi2owwNjmPBQNJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791800528; c=relaxed/simple;
	bh=nbmzk645K2Au1Vo+vbmjqut/AfbSCiLc8qQw/5saqHM=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=WJwjpkBWYjbJTgXWElHq7SfjFI+edXWdORHv99jKwuujZB7LKHSgfdA+t6dzeBkrpCv/8MMkHae+/AKbgjYXfqdtfjoc0TyW73eFQzmExKPJeAivLnhSSHa0zWhn1UEcSVhjJyqSr5HQwff4P82X4nv4FyI2YR3X6obYa8N8E7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=BW57GVym; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="BW57GVym"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a020e65269so10212065e9.2
        for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 03:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791800513; x=1792405313; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J/fGl7AngFu8xJcaPBlF37wwBTAGepjU2CFhZRheH0Y=;
        b=BW57GVymKoBnEW3gNW1YAHOtJQxHCekiXGEUcaP9CRFTfw35EDNiyk8Xw6JAIctSVz
         2OffkoTf+io5p6ghVOEDNHSceyjOS6otJEqNXlaCrZadBEu7qTsWeWtgh2QniTOC2DRp
         aJbOJJRi7imLWqx6AtRkfxcbTURXp0Ph3SB1trP24VE+lrv4CrSiZU9k7QQd+6h+7wvl
         Mf6K6m9rumCJ1Ru4SWqyocBls03Oifd9ugAd7bsVWx931lb48xsvGiVr/Mhbz+ojccHS
         z4NhDGS/BA3De3skIIQdNIZ5i8gdjwmd5vjB8O86um+QGi1vwnTn3l0D+DWtkTjTMKTj
         h6wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791800513; x=1792405313;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J/fGl7AngFu8xJcaPBlF37wwBTAGepjU2CFhZRheH0Y=;
        b=0owt5KRmdD0LOTztHcAXfn+/A6jNOLuP5SXkKru7+jcPqwxvnLgSyj7oBdexaeRDR4
         VR94mePPI78Nh8tiVIIBNnnlA1GCgmr9PiP8/FVpdw7usargXEtKPUatd8HJQhxB4wnT
         o3tHxrAUcQoacl9U22Jae9sS2wlNRh5hNiJAEsGx7olMp0+cB/x0tRkO2I9upB5YpvTa
         HMzIym0/o4AsiBpxYNEKOi6RA5rsiwSNBo9nNR+WZ+G0zIxMmOY7Y3KBMhXrfSPQ6A8u
         jmj7dcqDhoiRw8LmOyoGqXSyxl7wnX+fwrmdVQ7TvRgrc7vbwY46JPElhnvVD7N2Krmo
         FlaA==
X-Forwarded-Encrypted: i=1; AKwUvBzl3Z8Tzf+TOIuW7X1kI6rZ94ciGKbdjE7k0GXZ6rQLHrUr2PgJZ3TlClgfw9Z1M5wvqB9sFocu1gU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwoaGpD39azxaRY6dOPzqNKp3ygUaTZ2BSKWwiOWB05Yu3gOxk
	ZQWGc6zmmOGyz5ugH6gHbNDFEPEuFPXy0v2Ehssvs6LkdDA0w0HlhnQoWt+Y4H6oYV0=
X-Gm-Gg: AYBFou0K9M5Mi92PuSUGgFeCpKe9w0L8g2Xlf1c0hGnw6Tj/asYFFPj1hvdYAyKGd12
	boIUY6+Wiy6lkLHtS1rqf3rm/9X2lCuetn+IxP5A/1AisNqrSQVYEy2tE/hIVlLH9MlHC7l6RuC
	8yPS6Hest6lkReuDKiogDF8hGKzhRhQ7y6xloNUMJ49X5YQG6+9cJwys66ZfQI25hfPTQ0v67a6
	INQOVb1Hwok6tIOxxJ46IWl2l5kg+rnCYtmEq8BUKhgk0nqgrMWFLlSWwmydn/CtH4viLEwJRkJ
	TOnB2Wsobs1bCYgFAkvi5gDzSSRjQ3omtT4pxKQgBNV1+ZnQpHQACWZAC3bglvc/I7gH91te7AU
	XbW5IyD9TMsEb5AXKDsCY3EkibCu9acKtJloyUYL91l4IYfmxxiXMJmVKb+ldmzWYo7N1iE6On7
	CJ1syB5MspAKRss1KwsMIQNKIrdO5eJcV2hnI50qgBKOJWg8C+4qlohDdS78/HlsF4fajjXGOXj
	jrXBQPFVMlKBT13kw==
X-Received: by 2002:a05:600c:3b08:b0:4a0:da23:e06d with SMTP id 5b1f17b1804b1-4a18e4a380bmr173177745e9.10.1791800512977;
        Mon, 12 Oct 2026 03:21:52 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18dd15659sm184807835e9.4.2026.10.12.03.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:21:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 00/15] Add basic clocks and resets for JHB100 SoC
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Brian Masney <bmasney@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
Date: Mon, 12 Oct 2026 12:21:47 +0200
Message-Id: <179180050741.66744.3459927533880490879.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=725; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=nbmzk645K2Au1Vo+vbmjqut/AfbSCiLc8qQw/5saqHM=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlntuwvSIosDtrlc1xK6mV2g+n6gmepGRNYf61rumds7
 tB3utKuo5SFQYyLQVZMkaWGu1r8naTWl1nTdW7DzGFlAhnCwMUpABPRymH4Z/RhEnNj7FvtSQbP
 mZs2dG3k5Q4K5X7qHdzINI+9vMr1LCPDW97JkxguTwtoivefJlDweaXjmrAbkR7PGc2V/qdefHC
 GAwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> The JHB100 SoC includes CRG (Clock and Reset Generator) for multiple
> subsystems:

Nothing really forces you to send them all together.

In the future, could you try to send one CRG driver at a time ?

It is fine to send big RFC to give context but after that, if you
can make you series smaller, it is generally a good idea to do so.

This helps us iterate on the series faster and then you can fold our
feedback in following series (instead of repeating the same comments
on multiple instances of the same thing) Thanks.

Also your series does not apply on clk-next or -rc1 and no pre-requisite
are mentioned in this cover letter. Consider using b4 to point out
your pre-requisite if any

-- 
Jerome

