Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F22530C625
	for <linux-clk@vger.kernel.org>; Mon,  9 Feb 2026 21:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770673901; cv=pass; b=teBMRHAJYOZH0WFXisULwdZJVUXf4trAMqrawm3eHsOICEWidZ7x/V/blLWWR3I7RWCg/v9aObvv62rdCEc4R37f5Aonq8A8PwkenAZ7CIYjgzDthu3on019m12jh3nksMYI/gBvTU9Jyb8Eg2OaQuJ42NY3wri4HyqJIjQz/SE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770673901; c=relaxed/simple;
	bh=2VewdTH/a8Z+NvKzA/QEa4w6GhyGSwY/rOP4kQab/KM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V8pR0JrPXvoKMlyq/LMGCt0Z2k9GaluGkCXrJROFdoewI6mr/GIB+yDzklTjV4g0f/iHdN4dfXGR0/GvbeWNs9T4klVp9OC1Thw9ZyggBwtxk/b3cwe329RcVl7HAVMBJyxpTcm4yz8PvVI3vU13iP9bV8L1ClCjvFnmDwp6yyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=FN5hYilV; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="FN5hYilV"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a79ded11a2so872045ad.3
        for <linux-clk@vger.kernel.org>; Mon, 09 Feb 2026 13:51:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770673899; cv=none;
        d=google.com; s=arc-20240605;
        b=Hwq+Ex2DuIZRY51hwlIFphazxtBvBPleUn1zR0pBbgP4gBi0Wp+oylOpGVgcPRrVjs
         KV1e8I3oL5ir5hHZD/bRUzXE33HUugr2cQGisIg7IMqO0G2wt6xvi3nMtq9IiC+0BNqm
         jrgggXQ3+H8KLqVr77LZPpqKvNUd2BiXHOpYxekn/4p2ruaCnSJuxlWLIQhtVzrrRqQO
         oTgobfHjT9Lb484CNXd+zlEJdpAFdl00TqvaSbHWq2t9C7I4hizch7CIdTqiL3q3T/pB
         xZc93Ay6gdpS7yKuihC/7QYG497d5WuMZiPIfIfGA7v9GeED3MWtFkRg3xs+C6sTgoxC
         FRLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LNSmgkK/Xeb7EzbHB5/P9zJvOA3viMToQ8rWOpp8IyY=;
        fh=vBTEum3TRq10Nq4AAOnDK1N7bIGtG4BCiSNTDw0brSg=;
        b=MNBtgGhtlPtp/QLd64UcNcq8MNf8r4h1SB2LHBSIa1XUoDSJ5yLAMdyfydAoo08WMu
         YFJFvozspeQlcBQxmyweRdNnk/14t++TKJw7lCfhe22A1OmrsIAfF7dA2vsftbIlJjU9
         oCLz96ilBdQVMHKtxB6m5CqR8vy0sL5C5NrTOEgQJoPdgrBmz2/z9VZgct2yZzujfQz4
         p6n+3D3fkholDqBUQmovBrzJiTHvsEO+lufD6iD9iSxf7VZTQYhYKkKEhyw/5XHhF28W
         J3GhMIYoU8hUoq9ONy6QAxDxBdxoMgME4VHCBpYaV0KE3cy5qpvmCZKL90m4lXBzdYTO
         IUWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1770673899; x=1771278699; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LNSmgkK/Xeb7EzbHB5/P9zJvOA3viMToQ8rWOpp8IyY=;
        b=FN5hYilVI5tUrbOwnb1WCTzvPYF7pI/p3juqbaZTNEbLcpmB7pdxF9I6OQdLokEvfs
         Wd9hNb/UQ3Ytho4cZy/3R3RHkZIgvX3GmMJS8UCBGLacRAX90mGeFg95yBdmQSMKHPtF
         0RemVYohGVgYkvkDuKzdNI3SAIx18mYOC/YfjJPLKAsWGQlzYopfV+Fm/F2j7fsuoSXb
         GzGxexE16GZcyLoZbbGZse+uz46Z420x1gjegorYy0Y8+VucxlyglrJrn0mB5m6K69tS
         yuUvk87qqr/J1RweBa/mSN9Oybop/8CcTQY6DZp/H3JgzCrroPKlejzD5bOZKK7ZxyxI
         c98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770673899; x=1771278699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LNSmgkK/Xeb7EzbHB5/P9zJvOA3viMToQ8rWOpp8IyY=;
        b=AP968skpzMfpQ2TAFOnbhIICc32xYChjf7zD/Mlc1nxUnSilfnF9NWzOEZKapkXhfL
         M4HOxQcX+gokLTNe5QVpfS5NCQnxJqjk7rIS1PLxDCuUHdRH+ybo8RkMNfitthTzgJ7E
         4fawYKR4lhAhaycvyibo3xDAKKbaxtsghx+ypsBKu92mR4IixRYAy6qrw7VOSwjwoNdv
         +bet56DxEJo62I6ix2YV2jT0CID/O37ygO6OEuN8NW5VqcQZCvCdn4zoFdoOMRvt37Dh
         BEmMXGRsEYeDdPRU6145utifCejbg/yMAgGw8F7HwMfGGwPRR77Bk+jpxF+zPRAPRgc1
         w7AQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBgGP/JJ+ekF8d+MAb7HX2Zwh/XQAbUJ2f2T0+Gzk8vyt/VOCmT5batJ3bpzAVYv0D/5j+18RULwk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq3pfMAh4wSdWmpzju2NRIdf7ttTH2RafpPzDYQf46AE8CnRaX
	10ZxU3NAOpwZ4ED6zYypVz//vDgQSkkLjsNStbN+F5v0bAeMkVkj5iBywHHJQZyz1g6SKCxrZe4
	5tLSBJG7cOfdSJPvxgfN5Ev3srQL2oYo=
X-Gm-Gg: AZuq6aImz08BdS9c3YrVctqaWh/LSqNtwvqwPxohuXl3C+mK3TH7qOBiJzyX0PxjNEE
	DJoUUfg7KVGvxFF+Hh3XbpqkWsEbcIMDsgMz16QFZg7iC4AlkFeiHE0kjOLiuSoCB37N1R6lmY8
	e7DiOQrVThMReU32D63OuhCaAXMv2Tj0NGl4+KJzjnuEueMobsUnqyHpgiC+1ZMRKpKi3ffHDy/
	cpmUAoW4csrrqWFOi48pc+2O362P4RqmblhpRInc8OzU1dQ+QnVVD7nJy0+mQx86zvc8d3syIOt
	0eJuEmhYRaN3Jwq2fPNmpMRPksXM
X-Received: by 2002:a17:902:ce91:b0:2a3:1d78:7505 with SMTP id
 d9443c01a7336-2a951924f55mr125670905ad.56.1770673899458; Mon, 09 Feb 2026
 13:51:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209-a9_clock_driver-v1-0-a9198dc03d2a@amlogic.com> <20260209-a9_clock_driver-v1-6-a9198dc03d2a@amlogic.com>
In-Reply-To: <20260209-a9_clock_driver-v1-6-a9198dc03d2a@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 9 Feb 2026 22:51:28 +0100
X-Gm-Features: AZwV_Qg1HJR4QgLW0r7lzrQg8qpKm_1pOVerBt-Qr4quSkD9eqYUhMC2xIzMLWk
Message-ID: <CAFBinCBXFxefUkNj3sqUdnTz7vf72jV_FkCP6gd2veTtLHWnBg@mail.gmail.com>
Subject: Re: [PATCH 06/13] clk: amlogic: Add noglitch clock driver
To: chuan.liu@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chuan Liu,

On Mon, Feb 9, 2026 at 6:49=E2=80=AFAM Chuan Liu via B4 Relay
<devnull+chuan.liu.amlogic.com@kernel.org> wrote:
[...]
> + * To prevent glitches from propagating to clk_out and affecting the nor=
mal
> + * operation of glitch-sensitive modules, the no-glitch clock must be co=
nfigured
> + * following the specified sequence:
> + *   - When the clock gate is disabled: configure it as a normal composi=
te clock
> + *     (any glitches generated will be blocked by the gate and will not
> + *     propagate to clk_out).
This part is easy and makes sense.

> + *   - When the clock gate is enabled: configure it according to the fol=
lowing
> + *     sequence to suppress glitches:
> + *       - Configure and enable the idle composite clock path of the
> + *         noglitch_mux with the target frequency/parent clock.
> + *       - Switch the noglitch_mux to the channel prepared in the previo=
us step.
> + *       - Disable the clock of the original noglitch_mux channel.
> + */
From a previous discussion it seems that in reality things need to be
handled more carefully as you previously mentioned that
CLK_SET_RATE_GATE is not good enough (the description above is what
CLK_SET_RATE_GATE already achieves).
For the more careful handling Jerome suggested using the clock
protection logic: [0]
You wanted to try it out at some point: [1]
Is the verdict that Jerome's suggestion did not work? Can you please
share some details as to why it doesn't work.


Best regards,
Martin


[0] https://lore.kernel.org/linux-amlogic/1j1pnp5sg7.fsf@starbuckisacylon.b=
aylibre.com/
[1] https://lore.kernel.org/linux-amlogic/1639bb9d-9cb7-409f-bbf8-bfe4a5d1b=
8bc@amlogic.com/
