Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1C717B43F
	for <linux-clk@vger.kernel.org>; Thu, 30 Oct 2025 08:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761813947; cv=none; b=TO967BOs1o+ZYDxCfKEeNMyFRDQlNDauo1LZENa3xMZsEyoesds2ig8yYEmm4BdyI3xxPEaV3HSbuapqxcaz8ShJXxz5QFGnog8hgxui7entLeC8uMwn/cvN5W0rFmJfiYlmN2JVJofAdTElEgZTgJevMKXR/d9WTNEnt0nOY38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761813947; c=relaxed/simple;
	bh=p0YTr8pZnV8XjIK8AhYjFdr23HFQm7ooT2DkcPG0BQY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rm8dYCEIcDWB+Pt8GUBXi5EivAU1h7DN14YGGL25qHFLYwDbaudM6yUivOfPHBmAmGriPJesvQwuwqq3qu9KWiJQiT07TlXbU+nWrAuUivbo8RHemmh7UTi3aQcaqHFSwcChF5cGFfK07YBfAqGfqgWvPSK2RXIjOPs8Vr9CZiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=seB9uSZn; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="seB9uSZn"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-475ca9237c2so4336675e9.3
        for <linux-clk@vger.kernel.org>; Thu, 30 Oct 2025 01:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761813943; x=1762418743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ZpYo4qCdvkOxQDRmJbeXBNTq2tyicbeHh7QBXTUQpc=;
        b=seB9uSZn0W1fLrwcEwtT5TIqucYVcbv3bZ7e0I4FBn9Ho8Bb/MiTIjK3M6c8OjhJF3
         VVuOIqQPADQ6AxES6lQy/wMUw76ZWHZ34CIAvC+ycmP4zODwsMUvwM6VUbxGVw3Kyeza
         9ReKE4k1vFPuNQWY5YVL9KLVu7MDLy70QX1yiVqKjGBgH8PudrOrEx3tEB7UzF6d50EU
         vPxJ1mF5o6x7+HGjWWwU5KqsyrvemSdrr4wwwPiRHiAbB3ds8Zd+BRxAshcTp4TejFHA
         cplNZKsp5jr0G7hbJ4of5hIidHEDs2Q6xgzFb0G24hEoTvrciFD/WtjsaxSEkF3yHJ/h
         A7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761813943; x=1762418743;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/ZpYo4qCdvkOxQDRmJbeXBNTq2tyicbeHh7QBXTUQpc=;
        b=pc8pxw1eUZdxaHXSNfIKKirUeDFKimwOV/dWbEOMBjZ74hTORI03cuooBDCmyeZvuh
         jC8jwfmdVSPYmPEnx3Th0IhjFZYT/taN7a4PGLmR8LHK4WwOJ7YN9vngeXmBbK1FdRZD
         WI25bphdRu2KMSZ7C18+SjcASt5+Zjn2r+9YhvjmDa07HPh1PngIyw8ULCUVDW4See3/
         AwHHHYI8zqxju4IPiH9kHVlgkAb9Uqiuz3gC4anLJqGOhp7JBghz1YQ+JfHY8hba8IC6
         PW+k1YNWXUlm1llC4y2h1HrorKGwEJprRVToJv0Bm8rfGpa10bkaY6bTP3pegOBWv8lE
         sHpw==
X-Forwarded-Encrypted: i=1; AJvYcCXzyac5YUTUGEih7lSVV3m133qXHRwnMdEkCs7w1/aKBveMCFRe8LKzmO1JJarzfcwWiVqMETqTdXY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe4UhYj7AVtRWZx2e5CfRFUZJvAUAd1CO88tSkS1CLLtMItFqV
	RJ/Uvo82O1JX4LLYaAMsKPHIpgU6Vq39qmKulfc1M0I4VG5+EL5yp4oOR7SA+/8m9+w=
X-Gm-Gg: ASbGnctBkZYTMQrx6lrLkTFP9HFnCLTEekT9R5EHSMLRDhNeTFCaTcFFXZMA3KbFaWA
	VyLEi/X04Qxe84Q2rQzKPu6ZJ7nNet5qp0D+BreV5sCZcuVE1vCjlGc5XsWV2p/MgiW65IYDhQ0
	0WMOGkdXaFp7OIHp07CNOu+hgwaXLJJVeLqTghY1TL5Xdsxqgomu1Nes7FdrK1IUcl4g4W2p+bW
	V1zx7FHu4F0HJgIMDx9whv9RHb/O+g0KlYCrr+bmbWkDHSmaflN1tQO1vDf1Fi5zxAK8EMczF5f
	qo63e6wnIjbHJeInCEGAlsdRv21VOatgkD2saOlTWcRidQu7wdZZHHlFXUZqLhcnxjOs2/Ne16W
	Df1tJUFEPiNfy6ROcz23VbCh9fG752T5wOMFylxep0hbYn2lova4bryIdxiygMa3kK+9ceh8WjA
	==
X-Google-Smtp-Source: AGHT+IFRqKns2v7+EvpR5bRe/kFdtX/HOMybFPiYMJcDt+PidpgK4dhZ2EOX0xqyN5JCUyI4UtPn5g==
X-Received: by 2002:a05:600c:608b:b0:475:de12:d3b2 with SMTP id 5b1f17b1804b1-4771e1f1dc2mr56796015e9.36.1761813943196;
        Thu, 30 Oct 2025 01:45:43 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:64bd:9043:d05:7012])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4771902fa8dsm61122685e9.8.2025.10.30.01.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 01:45:42 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: amlogic: Optimize PLL enable timing
In-Reply-To: <61c2738d-7291-4a45-aa73-f18528c81ba8@amlogic.com> (Chuan Liu's
	message of "Wed, 22 Oct 2025 22:07:43 +0800")
References: <20251022-optimize_pll_driver-v1-0-a275722fb6f4@amlogic.com>
	<20251022-optimize_pll_driver-v1-2-a275722fb6f4@amlogic.com>
	<1j347b403i.fsf@starbuckisacylon.baylibre.com>
	<61c2738d-7291-4a45-aa73-f18528c81ba8@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 30 Oct 2025 09:45:41 +0100
Message-ID: <1jsef0ydze.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed 22 Oct 2025 at 22:07, Chuan Liu <chuan.liu@amlogic.com> wrote:

> Hi Jerome,
>
>
> On 10/22/2025 8:01 PM, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>> On Wed 22 Oct 2025 at 14:58, Chuan Liu via B4 Relay
>> <devnull+chuan.liu.amlogic.com@kernel.org> wrote:
>>=20
>>> From: Chuan Liu <chuan.liu@amlogic.com>
>>>
>>> Amlogic PLL locking procedure shall follow this timing sequence:
>>> 1 Assert reset signal: Ensures PLL circuits enter known initial state.
>>> 2 Deassert lock-detect signal: Avoid lock signal false triggering.
>>> 3 Assert enable signal: Powers up PLL supply.
>>> 4 udelay(20): Wait for Bandgap and LDO to power up and stabilize.
>>> 5 Enable self-adaptation current module (Optional).
>>> 6 Deassert reset signal: Releases PLL to begin normal operation.
>>> 7 udelay(20): Wait for PLL loop stabilization.
>>> 8 Assert lock-detect signal: lock detection circuit starts to work.
>>> 9 Monitor lock status signal: Wait for PLL lock completion.
>>> 10 If the PLL fails to lock, it should be disabled, This makes the
>>> logic more complete, and also helps save unnecessary power consumption
>>> when the PLL is malfunctioning.
>> Is this applicable to all supported SoC ? from meson8 to s4 ?
>
> Yes.
>
>> What did you test ?
>
> We have tested this on the G12A and later SoCs without any issues.
> Internally, we have adopted this configuration sequence in our branch
> and verified it on a large number of SoCs.
>
> We haven't maintained the meson series for a while, so it hasn't been
> included in our recent validation. I also don't have any meson boards
> on hand. If you have one available, it would be appreciated if you
> could help verify this, Thanks.

It's very interresting that you ask the community to test and validate
chips sold by your compagny, chip that are still sold *today* and readility
available on most market places.

I'd be happy to forward you a few links if that helps.

>
> This PLL sequence adjustment for meson SoCs adds a 20us delay after
> enabling the PLL and after releasing its reset. The delay addresses
> rare PLL lock failures observed under low temperatures. As a result,
> it slightly increases enable time but improves stability.
>
>>=20
>>>
>>> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
>>> ---
>>>   drivers/clk/meson/clk-pll.c | 68 ++++++++++++++++++++++++++----------=
---------
>>>   1 file changed, 40 insertions(+), 28 deletions(-)
>>>
>>> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
>>> index b07e1eb19d12..26c83db487e8 100644
>>> --- a/drivers/clk/meson/clk-pll.c
>>> +++ b/drivers/clk/meson/clk-pll.c
>>> @@ -353,6 +353,23 @@ static int meson_clk_pcie_pll_enable(struct clk_hw=
 *hw)
>>>        return -EIO;
>>>   }
>>>
>>> +static void meson_clk_pll_disable(struct clk_hw *hw)
>>> +{
>>> +     struct clk_regmap *clk =3D to_clk_regmap(hw);
>>> +     struct meson_clk_pll_data *pll =3D meson_clk_pll_data(clk);
>>> +
>>> +     /* Put the pll is in reset */
>>> +     if (MESON_PARM_APPLICABLE(&pll->rst))
>>> +             meson_parm_write(clk->map, &pll->rst, 1);
>>> +
>>> +     /* Disable the pll */
>>> +     meson_parm_write(clk->map, &pll->en, 0);
>>> +
>>> +     /* Disable PLL internal self-adaption current module */
>>> +     if (MESON_PARM_APPLICABLE(&pll->current_en))
>>> +             meson_parm_write(clk->map, &pll->current_en, 0);
>>> +}
>> I don't get why you moved that code around and make the diff even harder
>> to read
>
> Sorry about the misaligned formatting. I moved meson_clk_pll_disable()
> earlier in the code because I added handling for PLL lock failures,
> which unintentionally broke the alignment.
>
> I'll split the PLL lock failure handling into a separate patch in the
> next version to make review easier.
>
>>=20
>>> +
>>>   static int meson_clk_pll_enable(struct clk_hw *hw)
>>>   {
>>>        struct clk_regmap *clk =3D to_clk_regmap(hw);
>>> @@ -366,53 +383,48 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
>>>        if (MESON_PARM_APPLICABLE(&pll->rst))
>>>                meson_parm_write(clk->map, &pll->rst, 1);
>>>
>>> +     /* Disable the PLL lock-detect module */
>>> +     if (MESON_PARM_APPLICABLE(&pll->l_detect))
>>> +             meson_parm_write(clk->map, &pll->l_detect, 1);
>>> +
>>>        /* Enable the pll */
>>>        meson_parm_write(clk->map, &pll->en, 1);
>>> -
>>> -     /* Take the pll out reset */
>>> -     if (MESON_PARM_APPLICABLE(&pll->rst))
>>> -             meson_parm_write(clk->map, &pll->rst, 0);
>>> +     /* Wait for Bandgap and LDO to power up and stabilize */
>>> +     udelay(20);
>>>
>>>        /*
>>>         * Compared with the previous SoCs, self-adaption current module
>>>         * is newly added for A1, keep the new power-on sequence to enab=
le the
>>>         * PLL. The sequence is:
>>> -      * 1. enable the pll, delay for 10us
>>> +      * 1. enable the pll, ensure a minimum delay of 10=CE=BCs
>>>         * 2. enable the pll self-adaption current module, delay for 40us
>>>         * 3. enable the lock detect module
>>>         */
>>>        if (MESON_PARM_APPLICABLE(&pll->current_en)) {
>>> -             udelay(10);
>>>                meson_parm_write(clk->map, &pll->current_en, 1);
>>> -             udelay(40);
>>> -     }
>>> -
>>> -     if (MESON_PARM_APPLICABLE(&pll->l_detect)) {
>>> -             meson_parm_write(clk->map, &pll->l_detect, 1);
>>> -             meson_parm_write(clk->map, &pll->l_detect, 0);
>>> +             udelay(20);
>>>        }
>>>
>>> -     if (meson_clk_pll_wait_lock(hw))
>>> -             return -EIO;
>>> +     /* Take the pll out reset */
>>> +     if (MESON_PARM_APPLICABLE(&pll->rst))
>>> +             meson_parm_write(clk->map, &pll->rst, 0);
>>>
>>> -     return 0;
>>> -}
>>> +     /* Wait for PLL loop stabilization */
>>> +     udelay(20);
>>>
>>> -static void meson_clk_pll_disable(struct clk_hw *hw)
>>> -{
>>> -     struct clk_regmap *clk =3D to_clk_regmap(hw);
>>> -     struct meson_clk_pll_data *pll =3D meson_clk_pll_data(clk);
>>> +     /* Enable the lock-detect module */
>>> +     if (MESON_PARM_APPLICABLE(&pll->l_detect))
>>> +             meson_parm_write(clk->map, &pll->l_detect, 0);
>>>
>>> -     /* Put the pll is in reset */
>>> -     if (MESON_PARM_APPLICABLE(&pll->rst))
>>> -             meson_parm_write(clk->map, &pll->rst, 1);
>>> +     if (meson_clk_pll_wait_lock(hw)) {
>>> +             /* disable PLL when PLL lock failed. */
>>> +             meson_clk_pll_disable(hw);
>>> +             pr_warn("%s: PLL lock failed!!!\n", clk_hw_get_name(hw));
>>>
>>> -     /* Disable the pll */
>>> -     meson_parm_write(clk->map, &pll->en, 0);
>>> +             return -EIO;
>>> +     }
>>>
>>> -     /* Disable PLL internal self-adaption current module */
>>> -     if (MESON_PARM_APPLICABLE(&pll->current_en))
>>> -             meson_parm_write(clk->map, &pll->current_en, 0);
>>> +     return 0;
>>>   }
>>>
>>>   static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long ra=
te,
>> --
>> Jerome

--=20
Jerome
