Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61152E40B
	for <linux-clk@vger.kernel.org>; Sun, 21 Sep 2025 12:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758457301; cv=none; b=D9uafZYsimxYdyLzNLIj86uuHpjZQlZbnBbNF8hpFYYH07oxWV0FoX7df13tVprGghLGUWXhSWEcv8rpd6haAntRk8XsWe9dwWmArVir7d9BsSpUhKnDM9/oEf+9XQW5luSg4iOrOslr6RG1NadPzQeKwzSMoBCWDwKN/Tmepr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758457301; c=relaxed/simple;
	bh=AnCf4qD3OM8C7k/Xsb2THRqEyN5SjDqXe1BNpn0BrHk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z8t2PbMrVlwG5oDVeNkuzjwg9vuw//Ds5kE4qUJKWrU7cYMdKVaz/GfGf8S4ddqDdD872vJmhKg+IJqvw8fjkKWRJofGFQVli7h+WW99lO2URDCO9A08mzVMIqtXUfSeeD6wiEGBmc2uBcQAjP8uY9ZMASc5L71VFtJB0TP+Zn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=eBL0SBqG; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="eBL0SBqG"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b554bb615dcso55497a12.1
        for <linux-clk@vger.kernel.org>; Sun, 21 Sep 2025 05:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1758457299; x=1759062099; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJSacj7AG4ILM3IhKBoSOgA0n/MoBkGpNIVRvcCoIHQ=;
        b=eBL0SBqG/jsM+ilKeEYK2zZOk5BqF14Vwj7iCbUFzPhV+xd7swbcJEjWyQf3mTTQvQ
         jmjcc1SF4ttkR41IW0EdtbKmn5dkU0ddiowh5QQysfa/C/PBLNp/Pkz5EOr7j1fps2fG
         mXEfUBIaupTB6LmSfIO+Gg+XqzbynU+EXiHSEPLfkyDE24BjEtQhhC4R+paKjM4o8jwW
         RAUTio8MU6RS2RcCgbBWeGKdsbuqdwydEe0mWOsI6BJxOa1o68NIKd54UV9pJXXAHZbm
         CGInQrvzJK7uW+bcgQtTVwdIFiOynzaveFV74qk8eCxcP0YkYUx4WnkYprZIDbILYy/l
         YlcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758457299; x=1759062099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tJSacj7AG4ILM3IhKBoSOgA0n/MoBkGpNIVRvcCoIHQ=;
        b=EVLgBr26zMxAIkt93WmWXFBFcYBX3YT2yfY+susayC6IXfRNH3yw+iIRG+f1VKle72
         jjwDRbTsZfzNJOobUKOorkocraT3sDfxC5qYKjbhc3WYSOAO4KaNd8F0FSFSH99ANlsb
         4ZHvn0ZMzLBSSBqujGU/NKkzUnRVbrwztoHGov7PX7GIVRKD7OqNnsbE/rbmQiEIYciW
         IEziOSgBLvK7cZ6s8Xw+KbNbKMkax6ugKAyMKWVmMSa6KhzFFkE71z7Y6/ESo3Iw9F0p
         D2zgIppUVzbm+m2mdU1R/O6Sgzuzy2sX84kX1urXTXM1GB9kv/fXvafRhaeAQfFBMfE7
         PqdA==
X-Forwarded-Encrypted: i=1; AJvYcCVRIkDVQ+Pn7FfAnylCcHQqC+G9pYx9FqdGFJjsKNiYBykPi/LyyiWMLrbSoF5PRy7NDpitb09pp+c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ+Np0it3/KAVBpszcGfh3EaNN2Tk9oKIpDTtCqn8yvQlTTkq5
	Lax11bDjdUiq+/iXjHM5L9lhBrTZsdZty+kj+E2mIWM/HMwz+PcSP0SprRySr4I2IgVd9xjz+Ce
	iaVRyI1dYmWLe7CP8qljHxweSgGY8AQk=
X-Gm-Gg: ASbGncteipRE4tMTMnev4NXlf+XeFVhdMG9DHR+N2vrEtRYTOmOf2riZebi/JE7BjRj
	yYz2jr/LNxeNorUoDRXDdQAG7Pjf67BYH517PtLijhsxQnAXqG+oGkABOrTSptcMt3ae0+dGwId
	DMwPHCQI3e/+2Q1+UJuhVQ7VVsoAFRpWA3NcjUb32NyNtXIM4Txm1MbdUqWH7mddLq8lCwK+2Yb
	bfpTGz8E5RnKLMv8yzs5rUxn8Jtzmfozhd+6hqI
X-Google-Smtp-Source: AGHT+IHxVUgYnrAwJ5OpwEe3a87VRT7ipKjcAWLyiv2qdzKscH5CGBdYdKav7D1rg7rvs2u3DavET/DGycZAJPZEzvc=
X-Received: by 2002:a17:902:ce0f:b0:26e:146e:7692 with SMTP id
 d9443c01a7336-26e146e795dmr86596405ad.17.1758457299072; Sun, 21 Sep 2025
 05:21:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com> <b88a947c-7074-4fed-8283-c278b573a7ca@sirena.org.uk>
In-Reply-To: <b88a947c-7074-4fed-8283-c278b573a7ca@sirena.org.uk>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 21 Sep 2025 14:21:28 +0200
X-Gm-Features: AS18NWBkK72iXzXS1RwqWQ8AGRSrCLxvKKstfcdk8Ru-9k8WuxA-Kr0_IG8ezi0
Message-ID: <CAFBinCBe3LhN+3beovFVuWPpe3pDF5P1wSt7nPjm=ykRAx4zzQ@mail.gmail.com>
Subject: Re: [PATCH 00/26] clk: amlogic: clock controllers clean-up and factorisation
To: Mark Brown <broonie@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Sun, Sep 21, 2025 at 1:25=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Jul 02, 2025 at 05:25:58PM +0200, Jerome Brunet wrote:
> > The work on this patchset started with the submission of the Amlogic t7
> > peripheral clock controller [1]. This controller is fairly similar to
> > existing controllers. Once again, it redefines the peripheral clock mac=
ro,
> > the probe function and composite clock helpers, even if it is almost th=
e
> > same as in other controllers. This code duplication trend has been goin=
g on
> > for too long and now is the time to properly address the problem.
>
> Friday's -next breaks the boot for me on the Libretch Alta.  The system
> doesn't show any output on the console unfortunately:
>
>    https://lava.sirena.org.uk/scheduler/job/1853204#L1606
>
> Unfortunately earlycon isn't turned on, I'll try to do so at tomorrow or
> Tuesday.
>
> A bisect points to the patch 4c4e17f27013 ("clk: amlogic: naming
> consistency alignment") which looks like it's a squash of several of the
> patches here.  Due to issues with the bootloader it could potentially be
> an adjacent commit but this looks suspiciously relevant.  Bisect log, my
> infrastructure does retry the boot a lot on these boards so even if the
> final error is a bootloader issue there will likely have been boots that
> start the kernel:
A few days ago Marek reported problems on an Odroid-N2 and provided a fix: =
[0]
It's not queued up for -next yet.

Please give Marek's patch a try


[0] https://lore.kernel.org/linux-amlogic/175834437006.4354.119335451740046=
16373@lazor/T/#m29128b0acec2db62d45971d94a1c38fedc8493a0
