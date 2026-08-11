Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C644E443E4A
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 12:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786450187; cv=none; b=HUaweABfhHd4fbX4DRL0afd2q7S6qtd8f7ou2gcQxOGHOVui5BjJkzyLfVPG/7sZJUTH5N+EVnKBdV0G5XrBJICpLzPUhGpGED+z3aa3w9MH8Iooy664JzI2mCprQWr7q9sAmpOlitWYlPSP9wr0CSTQXpvwcJUl2Bt8AKUu3eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786450187; c=relaxed/simple;
	bh=jOz8/RKCdao82EWzssvpPQu6MldBuHaOzLydpj3dJ68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZomMg2o7OFfzj7eCIHyGLNHt9WraXvixtbOg5a2nyWQlFmubzFWZrZ4LDN/6/3QgjUGZE/F3J13/+Kuft2zB0zctWq05UJIB9hgJ9tL0ZKuNIwVLnlgaEkbgaDYYdw/0gMxdx30uM5g5m6Va71FSiNTPeSt2ohX2ojIwRUYMRJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5c38568d9e1so1212863e0c.3
        for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 05:09:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786450183; x=1787054983;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uoVTJmbd8yKwYcWWlgS08ZgHIJGke3bvkQlHT1fmSY4=;
        b=LSvbqYVrSK9VskoB0s4tXr9LObbTDQ0Jo34mQ+KphLphxwOCvm6IHwF37MCD75fGGs
         JKJjyo5h/O/hZWBivzhO1eePhbNB2FVb+UNANhmG1IzI+m3jRM0EEiGAQEmwFK3BAfm3
         oHrftAxXlCHh4hrv3TOG//yU1HWB7fqk3JhWOPKKHY8ZgSlLFxOik1zyekpE6V1kMtVa
         8cUlRG0sIFMDxao2zImHJFhOe0iLvx7hYVpfErZ2Y1ESPF6zEs2sTPHE0a5HTr7LRiuG
         KOEisqTPuTHQWKorq6dGDZwS4Pk4kwaom7tsHa6HQPB99feQ5HUo90YnFNZVIq1bxZ4K
         wW6A==
X-Forwarded-Encrypted: i=1; AHgh+RqCT3eH+RvnHs65z7joxaEGvwPdRyOkptJgCPJQZnW6ahsRIjtoNAdooldGKqv0w8I4CVoGZICwU80=@vger.kernel.org
X-Gm-Message-State: AOJu0YybcmCgQZZdmfCpqUOsjhXTpjuwwXRaZXb/xL0fr1/JyzI5XLhx
	adxtnZSPU0mImkT1O7x4xUh88lO0nyB7uCPcND2C7NKjpoPzlVjv1DrxVRtn7kWB
X-Gm-Gg: AR+sD105ChgnyLoW/oynOdIwEY/tR3ov4Wb3GHqsDkD9BrnwgNaed2dO5Hn1HAhrYRG
	SuEVAePQFFMJucLdUam1vnxzVI+9gts0fz6UvSy6/CxlxJ1M2Xa2d3Au5bxGeIpBADPc+EL2/9/
	MCInNLOzs3BJUyYje9qKNrt/RmWy5Gd+Nqe5DR+9FP3v8hyGL17FOGibrtjhmkzmXQGdV6LW1rg
	kl+ntSlJqKvdSomnclZPdYgd3zZGW8Asz2MsTa6fchVjENqZK5lXt8HwQQT+qGKDokb/ceCaJ/j
	yE4IZDahfNQtShhUJnLdJEpUr82k2U5rmEiw2QzYysUW7GGQ2W7rKVrHkpAv2qXEsHJ1XQMrxJD
	q9Dg8TJ0Vyw7jewI6OiL+Mty63jYAtr4FJbyoR0PuibRnN0HDg8BEboHU6s+GiC3c8e0lAmp0Cv
	AZ2al/tOT8HGCN372nED/0ukCIBBD1uLqHXUXwfnGIAlLwg5QxFpePjn1FpnltQHtHsCwzUXnUO
	GiCEv2Iu89ukVI4jxQm0EU/5Q==
X-Received: by 2002:a05:6102:14a5:b0:76a:fc18:29bc with SMTP id ada2fe7eead31-76b559806c5mr614582137.4.1786450182706;
        Tue, 11 Aug 2026 05:09:42 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-76b65bb5ddesm451838137.12.2026.08.11.05.09.35
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 05:09:37 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-966eabad303so607817241.1
        for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 05:09:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqcDwrRFQPHKrq1a+zujtFdbkn0BGz+mLaWoIWLNdF5ZYeG34piq/y9wfABc+MgDh98eGi4YBYwwSE=@vger.kernel.org
X-Received: by 2002:a05:6102:15a3:b0:738:cdc6:f59a with SMTP id
 ada2fe7eead31-76b573b9e9amr650405137.9.1786450174738; Tue, 11 Aug 2026
 05:09:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724-clk-provider-simple-clean-v2-0-56f306156d25@baylibre.com>
 <20260724-clk-provider-simple-clean-v2-3-56f306156d25@baylibre.com>
In-Reply-To: <20260724-clk-provider-simple-clean-v2-3-56f306156d25@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Aug 2026 14:09:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW15QrpUhbra1Jg1_8rQWf8CE5TQiE5SUAsqvz5YmEwpQ@mail.gmail.com>
X-Gm-Features: AUfX_mxAADqzKHeccKVpUAgUM-G2gOwUTpW15Dago95Bl-ey6AOZpFlGkzHgs7Y
Message-ID: <CAMuHMdW15QrpUhbra1Jg1_8rQWf8CE5TQiE5SUAsqvz5YmEwpQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] clk: renesas: clean-up simple provider misuse of
 the consumer API
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Bjorn Andersson <andersson@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Tero Kristo <kristo@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 24 Jul 2026 at 11:04, Jerome Brunet <jbrunet@baylibre.com> wrote:
> Clock provider should not be using the consumer interface.
> In other words, a provider should not be dealing with struct clk.
>
> This change targets occurrences for which the provider uses the
> consumer interface and corresponding clk_hw interface exist.
>
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
