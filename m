Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FEC4C77A7
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 13:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778677950; cv=none; b=sfnRc2C9VEV1vO2AG6nRw5j/SxtBvV5+qVJk7qVUXWKoG2Kdjmz8n/sysbKgExz8GFvve1lHvfThyOJVTKAJpsr9kM3U3BCLusqjTTk8kkxtJKAVYk2yiNLyHAMluaZdfJKx3iMJVM5htof9CtsJVCU6p9qIVeVFZswNqGsL2CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778677950; c=relaxed/simple;
	bh=OUQHmjb7UkllJEpUp8KQM62kjPUwPzi6de+ciaj5zDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CGB6fVcqAoM3UqIBeg5QCxR/39F9fGad9YhRXXiHUA8HPFy+ucXQKas7Dlqd99yAkEsRC+zGNvgB3Bqc4tBX8kelSZDQzpv6g69rGgkk1Tl4glHu7ojIRIt1VeKyOlLK7EHKEFFvQZ9F7VtEm9y7vQdTTy4T9yg1vDWL+KuIjwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-956948531a1so1802526241.2
        for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 06:12:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778677948; x=1779282748;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GE5Sc3I5fhZDV/Yx4xguTp5z/tXd0Rx77uBwtmUCg9g=;
        b=nNWRwm0r+AEOZCgHsa9k2zZsdESlbR9UiaZrC4U48+czt19AqbNsT5Fh0umUIITUk+
         zut+ai0M41yjPDtuLXADJbuVJz06IncTHLuF0WoWH0lDChdgGbqMZ0/TG+Jp4E9aO4A2
         3VQ3Z8wwFC/ipTUglWvYu3hJWcmEwX+h9eyL7/vgDmgTJ+C0MdpPHSpdCDncc3iWMr4f
         fmwG+aZLFjFm+uppcYtlAu8dX+J4myE6dEOnSJXSUl45qtG7m1rf85uyf4q3nY9l7EUJ
         UO9yndsnbcbCm6DL77nRXaeobQKuEAQkvvUGT73/HqjCnMnWNgnDvvqe5hJ1kioSASUq
         Hl1Q==
X-Forwarded-Encrypted: i=1; AFNElJ+Wkh9fxUe81z+62FaH7yGoNTeQWmHx25JoljkWvoyNNtQCbsVPbr46Dth5YRoZFiavEVwhz9B6vgk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsY9rqG4RrKwS0meEjrImjFB2QhUdIHV9Vi2xfSObU2SpHKvaW
	9U4LufUkmRHCD5+ALR320H1DC8W/zdl+84JkGMqfg+mAPqQIgBwqDnq4zjrUrEC9
X-Gm-Gg: Acq92OF+2cogIseM2MoY4RyK0LsculfsV9sPDVQHf2t32KFqrSCgssNAuhCgqaE08XN
	ZD4Hk5GHFYx21USUoI/6cPitjDt+hDaWu/h79K3W7xXqlyOkGZiJnCaER6zRi9mgHXebF0wUZf2
	fT7hQZcErNbl9xsk9UiEyXkxQFvpc4GHmsjw9sZmAB2bkKFzzOOvwex8ugU2eQb88PlxlLbDtx6
	JM39qQ8w8eEQclhDm6ESlnODskvx9nJ/QXmx8hJDsdiNTUJV8bE8LmBMQx1VbtYvzzJTnXnEY5+
	FnWXU7mh/V2jb/RpdLHPbE66vkSdaS67S/bmaXSRHjvFLF/EE9j4R3Hzh+rKIVxLI8Ye1z6rZ5/
	WfNunlM+06R5UxYYLOc1jMF1gR4P/38rF8NCwroIeit/8quaC3w/W/uk+iIuyis8fUePWH1ARSl
	p8KzBFWV+trOORJ6NbWSYiVccyT9KIiAZJD0WF5GszOES06wOdvkys+8wxJ9q7LHTV
X-Received: by 2002:a05:6102:3046:b0:634:d42d:15e2 with SMTP id ada2fe7eead31-63774761ed4mr1111646137.26.1778677947689;
        Wed, 13 May 2026 06:12:27 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6313fdbf5c4sm10936050137.0.2026.05.13.06.12.26
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 06:12:27 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-57524e53749so2068848e0c.2
        for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 06:12:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8L6FvSHcVOMTttL1saz4PDNQlbfdSIi2qPHWWFl8vxZ7RJ+Y14m36qpW5I5QP9J0Macb25QYmDye8=@vger.kernel.org
X-Received: by 2002:a05:6122:6992:b0:575:352f:eac0 with SMTP id
 71dfb90a1353d-575e6fb88e4mr1415729e0c.7.1778677946052; Wed, 13 May 2026
 06:12:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260502185557.93061-1-marek.vasut+renesas@mailbox.org> <20260502185557.93061-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260502185557.93061-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 May 2026 15:12:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUGGEXa+S7DZABv6_VjzgKaFR_dgEt6HMsoLWE3vtpduw@mail.gmail.com>
X-Gm-Features: AVHnY4I1ueP8c0lbfl8GeS1mAQp1h1WSM6acug8SaPsOhckX1RLhaKldCR-pmEE
Message-ID: <CAMuHMdUGGEXa+S7DZABv6_VjzgKaFR_dgEt6HMsoLWE3vtpduw@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: clock: renesas,cpg-clocks: Document
 ZT/ZTR trace clock on R-Mobile APE6
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 2 May 2026 at 20:56, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Document ZT trace bus and ZTR trace clock on the R-Mobile APE6.
> These clock supply the coresight tracing modules, PTM, TPIU,
> ETB and replicator. Without these clock, the coresight tracing
> can not be operated. While this does change the ABI, it does so
> by extending the existing clock-output-names, therefore if an
> old software is used with new DT, the coresight tracing parts
> will likely fail to probe, otherwise if new software is used
> with an old DT, there is no impact.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue for v7.2 in a branch shared by clock and DTS.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
