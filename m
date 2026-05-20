Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4E83630AE
	for <linux-clk@vger.kernel.org>; Wed, 20 May 2026 07:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779261859; cv=none; b=M/jJuicBz/40j+oOJIHCg6xtygjTjoReS1Ptk8XP98gF2tJOJhTsP1KrAzfYZ/Q/o1dalF1tahc1hpHqNM0BwYzHcU47jfsM+Mmu/Q+tV+pDUdQP3p3FmRhakygHazdVZV62gXM3PC4L6KmYh7dZt2ujtRbhfuZLKo0f1eKh9H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779261859; c=relaxed/simple;
	bh=LiJQwR7qa/406sDVkH8ncImAJWYszlpBwFuZAZgKn98=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SeOvU7E0WxTMGwVXJHDvck7wv2ffUxRhBCRnyR6ge9YR1yHQqza97lBDL/R7tjRQkqdTq+3IALfV8kHMqzZBS8FqA/Vf96nlBkUB9CD6qwFCZWO+2OD+wXrVVD8+NnNtoCvVcapYQAMCCWpptzJG6QF9c9A/5BpOD2nSaApV53c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=gh916ten; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="gh916ten"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4890d945eb4so29099155e9.0
        for <linux-clk@vger.kernel.org>; Wed, 20 May 2026 00:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779261855; x=1779866655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ohsf7Kwxw4dURrBVAg9+548r3Hkt++rO/LjKiVp3o1A=;
        b=gh916tenH5Lh9fLo/zUm4UgM7MV2D051M1xb5hIrK46JsksEBIJqNbJvPrImCrTgOd
         k957Eu9dcb/IUKbrw77958w8eu2cnNzDlxGKBacIeEsu2uxYUIExEvf/ouWME2CtFEyX
         2hOyXATK8fGHLVDPsXymdsyxpKvd9czw5wODCgYnFBiRJZ3xjgjjUqvI2/6A9Osi4rHi
         m41yRrFj4nem/cxgPWpZORwwQk5VsQ+V2WvIIYYbL/Hfxc4thX36FAdziihNeNpNTLv+
         EgfjxLstSi9kci8LR3pjRS/aXw1I2QhtHsPAqMvkWjuSHkQyB1Ge+9BttlEqDJs0D6XS
         f3Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779261855; x=1779866655;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ohsf7Kwxw4dURrBVAg9+548r3Hkt++rO/LjKiVp3o1A=;
        b=HSmM+/y4VytmfplpaZgDnNr6iqInHNuzCOLsRIgRNcgwtIGKZ6Bmec5C8QmHqKfx1u
         mZrUsGM2+GYa5dWtym7NZ/+Pr1m3sx+fa4zlAtoQU+is974Zb9LSzPYkBmlX5ALDhSjM
         i6RawNlzDq9fcyykOrrCSAbemLShSOH1He+8MvdTrcwS4zVL9vcwHAcn27crKCf7HJ+P
         Z4jVbF/bijLVGlbIWTKyQtXC24cbW95ysLwyz6nqu5tSBXfJB+mnmo43qY15coR3UMo0
         PeS2uqbbmeWOxZeAuDlWjFVBmoNQi8ihKAgDtCF1F9+eCNbciwtdHfFMm3z5aviR82Lj
         i+FA==
X-Forwarded-Encrypted: i=1; AFNElJ9HHUCWSgYKkYidXtIVzZoSa7Rw4uaGJAGcnQfoVGBdgWBGz9263/lsMf0xWf0RI1qjH5A9usWxhp4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVIH5EoY9PTji+W2MgWdXx1+l4rGGHxbhyj9t0AhCDhAZaACU8
	fiNUKV4P0jaZfRGIF+C0r9AP7Cn2tfocaAnVNhs4mszEs1bDdf1XJhqCsYJRPujaL1g=
X-Gm-Gg: Acq92OF/xxZRjdn+Eg+Qchf2RoSzFayHmnquklkqrFvkAjUov/UpsB+6EfNHRmkTrmu
	NGuLrT8sjt+YiUJdcOaE693Ep5kZjTPB1ZQTyMz71QYhRGkSs/Ak40UpjFyQK7EbRfO4oQWpnhM
	n1nLABUaY8WMrUK+BDmgFqaLtyXkm1XbFZrCY/I2PLgWLQGL1hllolIErqnYatH0vq+IDAw/MmE
	qeJTsqm1jM8jFA0aJETdVMTvMBlrT8mEk+EcDAqSqoeIjJo2eWz6S32STVyj0SJdnEoolpVUB6+
	tsVj1AbuaCxm+r9ILynvq74wykx6vPzP+d5vhCR4Bt1rBmBcTnagpjxV7w3qbiKhEf2PVIbYQFZ
	8LolA3w2aWc/5kf41uKY2IdPUCrC7DY24iynnVhpEDgBRYv9tAEYooGbolgLsonqW1iC1bFpPmU
	TK66h/ecp01ubwbkcUzIzOKw==
X-Received: by 2002:a05:600c:c0d0:b0:48a:761:5816 with SMTP id 5b1f17b1804b1-48fe53774b4mr270166855e9.8.1779261855105;
        Wed, 20 May 2026 00:24:15 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:fa19:c0c9:991f:186d])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49008c047absm86786415e9.0.2026.05.20.00.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 00:24:14 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>,  Michael
 Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Xianwei Zhao <xianwei.zhao@amlogic.com>,
  Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-kernel@vger.kernel.org,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 05/10] clk: amlogic: PLL l_detect signal supports
 active-high configuration
In-Reply-To: <d023303e-e785-4b60-85cd-c83cc3f890e4@amlogic.com> (Jian Hu's
	message of "Wed, 20 May 2026 11:25:35 +0800")
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
	<20260511-b4-a9_clk-v1-5-41cb4071b7c9@amlogic.com>
	<1jse7u6n3q.fsf@starbuckisacylon.baylibre.com>
	<d023303e-e785-4b60-85cd-c83cc3f890e4@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 20 May 2026 09:24:12 +0200
Message-ID: <1jwlwy5ysj.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On mer. 20 mai 2026 at 11:25, Jian Hu <jian.hu@amlogic.com> wrote:

> On 5/14/2026 11:13 PM, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On lun. 11 mai 2026 at 20:47, Jian Hu via B4 Relay <devnull+jian.hu.amlo=
gic.com@kernel.org> wrote:
>>
>>> From: Jian Hu <jian.hu@amlogic.com>
>>>
>>> l_detect controls the enable/disable of the PLL lock-detect module.
>>>
>>> For A9, the l_detect signal is active-high:
>>> 0 -> Disable lock-detect module;
>>> 1 -> Enable lock-detect module.
>>>
>>> Here, a flag CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH is added to handle cases
>>> like A9, where the signal is active-high.
>>>
>>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>>> ---
>>>   drivers/clk/meson/clk-pll.c | 9 +++++++--
>>>   drivers/clk/meson/clk-pll.h | 2 ++
>>>   2 files changed, 9 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
>>> index 1ea6579a760f..5a0bd75f85a9 100644
>>> --- a/drivers/clk/meson/clk-pll.c
>>> +++ b/drivers/clk/meson/clk-pll.c
>>> @@ -388,8 +388,13 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
>>>        }
>>>
>>>        if (MESON_PARM_APPLICABLE(&pll->l_detect)) {
>>> -             meson_parm_write(clk->map, &pll->l_detect, 1);
>>> -             meson_parm_write(clk->map, &pll->l_detect, 0);
>>> +             if (pll->flags & CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH) {
>>> +                     meson_parm_write(clk->map, &pll->l_detect, 0);
>>> +                     meson_parm_write(clk->map, &pll->l_detect, 1);
>>> +             } else {
>>> +                     meson_parm_write(clk->map, &pll->l_detect, 1);
>>> +                     meson_parm_write(clk->map, &pll->l_detect, 0);
>>> +             }
>> I'm not a fan of this code duplication.
>> Use the introduced CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH to compute the
>> first value, then flip the bit.
>
>
> Ok, I will update this in the next version.
>
> Here is the updated code:
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (MESON_PARM_APPLICABLE(&pll->l_detect)) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 meson_parm_write(clk->map, &pll->l_detect,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 !(pll->flags &
> CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH));
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 meson_parm_write(clk->map, &pll->l_detect,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 !!(pll->flags &
> CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH));

Please use a variable. Make it clean=20

> =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>
>>>        }
>>>
>>>        if (meson_clk_pll_wait_lock(hw))
>>> diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
>>> index 949157fb7bf5..97b7c70376a3 100644
>>> --- a/drivers/clk/meson/clk-pll.h
>>> +++ b/drivers/clk/meson/clk-pll.h
>>> @@ -29,6 +29,8 @@ struct pll_mult_range {
>>>
>>>   #define CLK_MESON_PLL_ROUND_CLOSEST  BIT(0)
>>>   #define CLK_MESON_PLL_NOINIT_ENABLED BIT(1)
>>> +/* l_detect signal is active-high */
>>> +#define CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH   BIT(2)
>>>
>>>   struct meson_clk_pll_data {
>>>        struct parm en;
>> --
>> Jerome
>
> Best regards,
>
> Jian

--=20
Jerome
