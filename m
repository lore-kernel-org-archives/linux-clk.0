Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952F730B50A
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 17:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781546195; cv=none; b=gIEzTMfcCtYlzkmhhvcM+p0O6J99Pck8pzdQa+fs4qqmdw9gs/MEneBRuyV1dmUl+3iaEquYugk5IHh7TnG58jJhXQDNcNYUDgSpTRbQ29j6CxBtibOPys3q0kxvApRUTiydRN6H5MHB6cS7ehUFpBdedfkgZhCF8z5Bce0ZXRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781546195; c=relaxed/simple;
	bh=Oj4RKJnXYk35hVFXcx5pzzIrZMT/oGdZI6oDIaOmPDM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JyP7g0ERT6KxIrmTv0Y0CojBe1uKrGR9ELeYt0+uCW8tbeC76IvqsA7HcvEJImL73Vda2+U6hOYHejEu2a8HbmtgZz3mtM1X36IF4oonIdkmXKCS2J9pqW5QMLXq2DktPoO1T2KAStcfHWAOA/ScSr1G6JyHY0WJa1saESPKTRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=BJ0ygtbY; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="BJ0ygtbY"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45eee266c6cso3264888f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 10:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781546192; x=1782150992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V/fOCYr89rjpFF0YHfilwdeTnNExJ5rFE4DuxmsIniE=;
        b=BJ0ygtbYSD9luAiXbLuXcyp7YnuWVVfcEtIu4oKhRzbx5TqJauKI3MhsS/CL2ywxSI
         IZvlWcL12t3P57X3yK8xFj3+6BYNDjhs7p039hU2kZ11zM6exBAfwTguHyn3iBCFOhuR
         NalOqPQND0J1ALUvPMIAf0foMEM/V3RqPhR5vQwCpgRbeOnjxil0dxTlFewDhv1QAz5E
         35hUfmTLfSaPvBUH9//rK9xnOJ1uOBISZuNUkC7JVt3TVo1Q74Jtgb0+LYxo9sv+LLM/
         QjM7eGesV+oP7ewvaYx12AZruU8eRvf9s9zZh8OOqwJCOTVIm+qW+E8Uyd3cvmsBR/QX
         JdTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781546192; x=1782150992;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V/fOCYr89rjpFF0YHfilwdeTnNExJ5rFE4DuxmsIniE=;
        b=LDhv2CsPvZ00RFbV4oHju9akafWr+zrKBq+8cLUwmSPhMpTVRNoilAnehVOS7o02NE
         j1ZyhrtXYXguQZvdjkYrPMKOfpN/Mm9e67Tqav1SOFa1790LjqHIendvsxpple2TPlwM
         Z3ilBAgi55PevTcNJeCiALe9m0B+27WEYTXtWZaBSCtm7Hoz9p9xYocbHZR185oy65H7
         XYK44E1aYZsHfttIkIVAwVGTS5vntNT7mdnU603dRzt3x6EsXZFdlyHq20b6sF+/p50s
         wfYEiiRaQySBk13SCABjLDaiL3mcExye8PY9o2WV5D81qm0V1bohbaT4Bs25ZmrfFGT6
         i3VQ==
X-Forwarded-Encrypted: i=1; AFNElJ/5QaWI8li7ThMeM9cpshPf+avacrCwi1xiqfIIfGB6qz3gCP2ZjgSRQUlyAPjp8lRxIWC+LsB6lwk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyImUJOhJXVchhuwYnzAIFqie8/LhkcVHNKrCY9Rp2DCryb80zG
	/qQtgZ1KZDva/SNvIoMDBwINs6fTqkjxSCEyS6Zr04xqrrckuwnvrblfTBhBOIKuHNM=
X-Gm-Gg: Acq92OFNyAFwYIgO9dw8A5HP2rvTcK35IwSWSsl+elNecv9zG18Fo1cilOjjJMHt00+
	EYEwrHvOhVA+ACDgxlXqvoLSftusXJhkeHGLiEst4eggW+AaLoz57dmyHLhxCZqUvow36Eem02f
	ev4LbxOKi6dGKJf3RH9qt1FvEMtGJY2npJiGK3RAyj70mjzZYOKfmCF3Aa0bYz5AGta9RtTWI3a
	TqaHZ356jqPi0EQQdFr/x3eUusuMpAahVEW2TBzKUhzKCKlZ/cPmeVl4vz0sRo+DoqBGVsAOtnY
	09ikbdZ4sso2ShntD2Obw0V6hn2oIn/ynyfBpo1oenZvgcJAqj/O2Gv90QBVpEGfLjERW9tK55O
	1kgvNXkJ5d0vkCXVMA9iUU0qu7xNkjm8dI13WM+rZWtmxgsFJS3S1nxyMKlhcrSgjmY2HHhGjba
	qVNDcHLtOWycguQHY0HqpnJA==
X-Received: by 2002:a05:6000:288f:b0:43d:50c:6f33 with SMTP id ffacd0b85a97d-46077f2a62dmr16205392f8f.26.1781546192039;
        Mon, 15 Jun 2026 10:56:32 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:5176:ebe3:853b:8fb0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4606f2e6a8fsm36837329f8f.37.2026.06.15.10.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 10:56:31 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Jernej
 Skrabec <jernej.skrabec@gmail.com>,  Samuel Holland <samuel@sholland.org>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Maxime Ripard <mripard@kernel.org>,
  linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev,  linux-kernel@vger.kernel.org,
  linux-rtc@vger.kernel.org,  devicetree@vger.kernel.org,  =?utf-8?Q?Andr?=
 =?utf-8?Q?=C3=A9?= Przywara
 <andre.przywara@arm.com>
Subject: Re: [PATCH 7/7] clk: sunxi-ng: Add Allwinner A733 RTC CCU support
In-Reply-To: <CAGb2v64euL+QNXiJdTn0JygYLXg0WoguPSprKT4sKGZGVZbwug@mail.gmail.com>
	(Chen-Yu Tsai's message of "Sat, 28 Mar 2026 22:41:20 +0800")
References: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech>
	<20260121-a733-rtc-v1-7-d359437f23a7@pigmoral.tech>
	<CAGb2v64euL+QNXiJdTn0JygYLXg0WoguPSprKT4sKGZGVZbwug@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 15 Jun 2026 19:56:29 +0200
Message-ID: <1jv7bjd6wi.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On sam. 28 mars 2026 at 22:41, Chen-Yu Tsai <wens@kernel.org> wrote:

> On Wed, Jan 21, 2026 at 7:04=E2=80=AFPM Junhui Liu <junhui.liu@pigmoral.t=
ech> wrote:
>>
>> Add support for the internal CCU found in the RTC module of the Allwinner
>> A733 SoC. While the basic 16MHz (IOSC) and 32kHz logic remains compatible
>> with older SoCs like the sun6i, the A733 introduces several new features.
>>
>> The A733 RTC CCU supports choosing one of three external crystal
>> frequencies: 19.2MHz, 24MHz, and 26MHz. It features hardware detection
>> logic to automatically identify the frequency used on the board and
>> exports this DCXO signal as the "hosc" clock.
>>
>> Furthermore, the driver implements logic to derive a 32kHz reference
>> from the HOSC. This is achieved through a muxed clock path using fixed
>> pre-dividers to normalize the different crystal frequencies to ~32kHz.
>
> Have you tested whether the actually normalizes the frequency, i.e.
> selects a different divider based on the DCXO frequency? Otherwise
> we're just lying about the frequency.
>
>> This path reuses the same hardware mux registers as the HOSC clock.
>>
>> Additionally, this CCU provides several gate clocks for specific
>> peripherals, including SerDes, HDMI, and UFS. The driver is implemented
>> as an auxiliary driver to be bound to the sun6i-rtc driver.
>>
>> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>> ---

[...]

>> +};
>> +
>> +static const struct clk_parent_data hosc_parents[] =3D {
>> +       { .fw_name =3D "osc24M" },
>> +       { .fw_name =3D "osc19M" },
>> +       { .fw_name =3D "osc26M" },
>> +       { .fw_name =3D "osc24M" },
>> +};
>
> As mentioned in my reply to the binding, this is wrong. There is only
> one input.
>
> The most you can do is check the rate of the parent clock against the
> detected one, and _scream_ that the DT is wrong. And maybe override
> the reported frequency.
>
> If you want to do the latter, you could add a new fixed rate gated
> clock type to our library. You would fill in the rate before the
> clocks get registered. I probably wouldn't go that far. We want people
> to have correct hardware descriptions.
>
> Funnily enough Allwinner's BSP actually implements a fixed rate gate
> for the next 24M-to-32k divider clock.

What about implementing the register bellow as a read-only (and
non-cached) divider using the factors provided by Junhui ? That would be
an accurate description of the HW I think.

The oscillator gets set in DT and if the output reported past the
divider is not 32728Hz, you know you've got a problem (bad DT or HW gone
bad)

With a fixed-rate gate, you may actually end up lying about what
actually happen, if the HW does not behave as expected.

Do you prefer a fixed-rate gate still or should I try the RO divider
approach ?

>
>> +
>> +struct ccu_mux hosc_clk =3D {
>> +       .enable =3D DCXO_CTRL_DCXO_EN,
>> +       .mux    =3D _SUNXI_CCU_MUX(14, 2),
>> +       .common =3D {
>> +               .reg            =3D DCXO_CTRL_REG,
>> +               .hw.init        =3D CLK_HW_INIT_PARENTS_DATA("hosc",
>> +                                                          hosc_parents,
>> +                                                          &ccu_mux_ro_o=
ps,
>> +                                                          0),
>> +       },
>> +};
>
> So this is wrong.
>
>> +
>> +static const struct ccu_mux_fixed_prediv hosc_32k_predivs[] =3D {
>> +       { .index =3D 0, .div =3D 732 },
>
> Why is it 732 instead of 750?
>
>> +       { .index =3D 1, .div =3D 586 },
>> +       { .index =3D 2, .div =3D 793 },
>> +       { .index =3D 3, .div =3D 732 },
>> +};
>> +
>> +static struct ccu_mux hosc_32k_mux_clk =3D {
>> +       .enable         =3D DCXO_CTRL_DCXO_EN,
>
