Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795559486;
	b=bK3C7sO/X2gMKWqBqQU1Tnx16Ae97Kt2YfVxfDyCmSaePWBbFUqsnYVIobdiZ+ku0RQk
	 YQVg/n0xYPQyteVK/KZoL4tIx9LjWtzAxQbhIviBXys/H2zAoFxDkUWC/vnISXeXgQS2L
	 8Z5P3wuUxAGHbRYG6HXYl1JxtOenNDi5u4oo7H3FI+FXaWvSEQuMHF5Qc/GCcBEn4eqlq
	 cXigg5l2779VNHgKwv4JbjKogkvq0WpgxgP5lZlh+Uq4V47xfyum9GPDCdf2beH63YAZ/
	 3xOU5F+nbEwtVOQYMcnDJIIY78Cp3HmsdKevsmNKz+THZBwzX62Q8487F1SkSbMJ7iw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795559486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=INRxzK7vSn4HoWNw09mGrnkGOVMtgkPRDzZLhk0h1pY=;
	b=oqfh1DsMp2OqpblSpWLWZ64ZB/66PkLyPHx7ysz1ou7On97AwJb9pO2JQSjat0fwlRSg
	 Q9bpAmUihNZe3cvym4b3opPjFRSBRUAI8IrqBB8UqZKVhUBts7pHjSRRmB7oAtPBu51GY
	 Yfx7IEo9go2Hux5mzPYaSINme8BZ9zA7iPw9FqwctCLYleIS9s/2C1dA5eExWBCBdam6M
	 aF659ryYhb2XHSJlWbJJ7VX0/K+tnzsoIIKKZHSqtdtmVAvDY+OoRJBzG9INYA9MnMaDs
	 dOjGKwij88KS9Z6Kd/Rqu2z7OuzsnId8VILAa1r/0XtzdWGEwvxNFQQHmZ7heze8eoQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Pq6hYJqL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50AC606A6A1
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 22:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A50AC606A6A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Pq6hYJqL
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4d427836e9so696107566b.1
        for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 14:31:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795559484; cv=none;
        d=google.com; s=arc-20260327;
        b=rkzq7OBHxoQ9QpflKYbVwHDV0LLujaEftimnZjh/HgPYqWwFrhDVRvbjaj8Aei/v6g
         fnQGXIo7Ep9mwTcADU9ciDROcvCcRVwPYtEuzO/GCx1EkI+PbnTi924CkbTy9LIKM4Dc
         3TA44USW9PlQ6SKbKe0w2kh+bOEwbvAqeqAd/QhSlXVpUsFkymfwFcAYrGpwWCWGEu/3
         y/jtjRsaDxixH7a+ZxPS15NhTZhhgu2NTGZtLwtZFWz2/12ubvucglpwleahaw2kZcao
         fPte3wFsQ+Bm1kKGvElSy8WeCIW8zj+zb/cD/mHXkozRXm/TsrEqRcf92zyjH62B+t++
         KUPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=INRxzK7vSn4HoWNw09mGrnkGOVMtgkPRDzZLhk0h1pY=;
        fh=KUVUnK9dd6KXLNWwyUhUEn1atNAL5Mrbe96eheYShaQ=;
        b=VHgQcAp0fOVP88sZbOHXySK8D84URd2bo6hjZ8iPo+4uwUZZH1kTf2mQkVOJZ1/KNz
         jSHkqOm8/Hl3fGdYf9SsAAzBrFluy1c9w8fL/CBrn4ULUTVOyhSNtk6pEgejng9GHoC3
         L+4mQmJ5K1r6+lUOXkXqJfaJalJmRVNe09ShTUheyHuMKNdEq7onru4uwCuUWkXKdWo+
         FYnTcs2oJdVkbFAFaTGE1vXmk0NFUgadeutRuVfbGenE6H4vs+jvJWGTg7tNkQHr7EYZ
         9qE4epe6OiKK3cFw3FVtixIrgiQJlJUuKOQqUBpqwdQiKPqFlC7jz0l0IUR64UeY/kgN
         CuzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795559484; x=1796164284; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=INRxzK7vSn4HoWNw09mGrnkGOVMtgkPRDzZLhk0h1pY=;
        b=Pq6hYJqLqfjmwjq6l8NZL/b72FkWDY7/prko4BQ8KEWZLjnZPHCUw44AYwkS+F8DRi
         EUeoUtNsUmpvMracnT4N+GgMdEmq/lLExWZTQz/1x2gGNuR3gColGwjZifwMrkotSzq1
         d6CELz6FR9caGvQ5SJQ8Y9tQVYlF1B8Q2XaCePiSHWZdneDCgaC0t5wk53jlieeZPq0K
         Xr/gKY4gRbr8NIvfHqVM+4o2vEDZGfOtkWKPxClj2k43yKXLUk1wVQj7s9WACrQQEpw0
         Q98XJp/kNzbRIEqZyr+UWynhvWGPSRNCMolaQERiuhRGVt3CSC7buBUx16Xoa3CNaJR4
         u73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795559484; x=1796164284;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=INRxzK7vSn4HoWNw09mGrnkGOVMtgkPRDzZLhk0h1pY=;
        b=FrlwXpwLENZR/mv/SqWNaSBVKNdQoRkD6KldbWheN+2RF/XgDTDgoTJ/e9Fw7CFpwM
         KllaCK3DDXKfE8tSdOLJQQXhpQ+vfeDkA1ImpFl1voCRpf50j4NH1AIUIWmOD5B7CAA7
         YyzCPiRxalHcArC/PzTazOHDhj4LXn/4hXLsyBdKSZJhqhA7rubpLNk/Rzs5TuKwvSw+
         j0TWvOHrcrgW7g912fhaASHRa+M/igCflStlXp+ogA1d/qcEpCPoe5nGr5C7S57Lj8qX
         iSzhvfoI6ZBa8acUvIojNhbude+9549aaj8g69FKT0pce185x4I78UBYIiUmEJqSMbxZ
         3soA==
X-Forwarded-Encrypted: i=1; AL+hErFwtCfdDnuyTDM9OWM1UgrFGsg6TItKwua6NkxBY501sP8XYPaOaa4w/0jxViVIfGSVlEqSJPNXqLM=@vger.kernel.org
X-Gm-Message-State: APuU4Z90VyojHG405KKDGQzklzFPS3q0UVwTnGA/l+rE9boTw5rzNQGf
	nmbGgWhvb+nIRyHz4XxvylZ95nUKlmrG4VZyQQjKFNxvjgUovqbfwDR9+pHlEvs+XEE7q5MdV7/
	v34HbC3A6UEVQVqThy+1zMkDpydI44U5C+qbLeHMZWw==
X-Gm-Gg: AZFdTZfiNLGbS3usDH72L9EzwYrLprSrGjT8m/75dqbo2o2W3PLeGGkzGR9GjwSEqeV
	JRusevjVo72rhMOD1V2VLq/VoLANJA8/JwZbd1SF8W7PVU6oPjoR4Z3iPiqipCm9nPave2fnD1y
	tIU2qqrnPL75iNBWOTNVyH8QD9rA3c8tcW1L1XyqJ649Nd6pYfwf5Py7/TSPTuGLQn881yP+/Pc
	S706fTabI1CHgbr9xSmWiU0aC2Vz4ZWgqqcx2j0SPmcsQz+1RFaRZUq2TUNhSFseyCJybemncIt
	z0Z2Zx3P3ApLMpCewGgtSMfjjfsaq7MZ0Uvm+vaMxy8NvLFTkpuwgliwUPQ84JIQPBPNAP7pRhX
	+9FJIfQkXBcf5uFT5nqGWwRNlBR4vNLkccWCfwrooJyJAiVTbnoahoQU00mvt+ODfvluf3CnbTs
	Vadoc7ayHQdnxTMOa7
X-Received: by 2002:a05:6402:15d4:b0:6b7:709f:85f with SMTP id
 4fb4d7f45d1cf-6ba37ec031amr9043918a12.36.1795559484024; Tue, 24 Nov 2026
 14:31:24 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261026144346.3.I7bc547c83b7bf677a62670099f481a91ac737073@changeid>
 <CADrjBPqnRrFeYT9J6NGxy+Xzy1PTZEz+BMs1_u2md7Ra6xPPDQ@mail.gmail.com> <awXf86suGgKeazZx@google.com>
In-Reply-To: <awXf86suGgKeazZx@google.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 24 Nov 2026 22:31:11 +0000
X-Gm-Features: Aa3M54olM1DKVBX3EQP9Zt-gD9WnHLwb_Lxu-JjOzcrrRgxAqJXxzL4OnVB7R18
Message-ID: <CADrjBPqG_TLwgOTzQ-o5pM7k1DzkeVxNkV2xDHsU4OBAyYOofQ@mail.gmail.com>
Subject: Re: [PATCH 3/9] soc: google: Add CPM over MailBox Array driver
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>, 
	linux-arm-kernel@lists.infradead.org, 
	Mariano Marciello <mmarciello@google.com>, Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org, 
	=?UTF-8?Q?Jakub_G=C5=82owacki?= <jglow@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Brian,

On Tue, 24 Nov 2026 at 19:05, Brian Norris <briannorris@chromium.org> wrote:
>
> On Tue, Nov 24, 2026 at 12:28:24PM +0000, Peter Griffin wrote:
> > Hi Brian,
> >
> > Thanks for your series; it's great to see more Laguna support being posted.
> >
> > On Mon, 26 Oct 2026 at 21:45, Brian Norris <briannorris@chromium.org> wrote:
> > >
> > > The Central Power Manager (CPM) is a co-processor on the Google Tensor
> > > SoCs, as used on Pixel phones. CPM supports power-management and a
> > > number of other features.
> > >
> > > The Application Processor communicates with CPM over a pair of mailbox
> > > channels (the "MailBox Array" (MBA)). CPM provides clock, power-domain,
> > > reset, interrupt services, and more.
> >
> > [..]
> >
> > +++ b/drivers/soc/google/Kconfig
> > @@ -0,0 +1,13 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +config GOOGLE_CPM_MBA
> > +       tristate "Google Tensor CPM MailBox Array Interface"
> > +       depends on ARCH_GOOGLE || COMPILE_TEST
> > +       depends on MAILBOX
> >
> > Should we also have "depends on OF"?
>
> Why, precisely? It's not actually a compilation dependency (I tested),
> although it's needed at runtime. It doesn't seem like this is
> consistently done simply for runtime dependencies, and instead work has
> generally been done to ensure everything builds fine and fails closed
> without CONFIG_OF.
>
> Anyway, it's a bit academic, since ARCH_GOOGLE (ARM64) selects OF.

I was thinking more if COMPILE_TEST=y && CONFIG_OF=n &&
CONFIG_WERROR=y is set. I'm not sure if 0-day performs such a build. I
guess since no 0-day failure has been reported in this thread, perhaps
it isn't required.

Peter
