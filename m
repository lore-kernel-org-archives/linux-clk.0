Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE883D9DB4
	for <linux-clk@vger.kernel.org>; Fri,  9 Oct 2026 09:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791536433; cv=none; b=YtpBIUxTPs2DoxTl9TO2RkrCVQ40gfuqf8JHo6MVnR6iyP+F5Tk2bRuVW1RzIUrKUe/Vz26McPm3kBdQc6C3XGgbt2f2agK2msWIGN3QWWwRhDqbN5mMs0mPthbkEUgJqSWO2J0W5YBMIlXgklfKeq+R8Ec0HgTlsGWTxS4dt4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791536433; c=relaxed/simple;
	bh=dVqIXO/9c7iSDHVJkYbnjKppuyWuIM2GIVXBblovHYo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OnuziP9McWly4gtyNBWNyGlPkZaDEoGy39fnmo6isNg7//+WApe0hb+qIM5TRA9UFvBqZWm5yaZZOBkgtQqIYLqtHy283a/goNWkQcMuqPUuM5wYeJMROc6Q7ayU5uPrLSyY+njYAl2w3lJeDj7sSuAh3rnJwDlFgMEfWo7sG08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=aaKatAm+; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="aaKatAm+"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso55416805e9.2
        for <linux-clk@vger.kernel.org>; Fri, 09 Oct 2026 02:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791536425; x=1792141225; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9cU6FQ2Ny19xqbH7FtIbST4Npto/KKrlVjyPkUdH56U=;
        b=aaKatAm+kbhwsK3GTz320Grqqtco+pb/A6sxu3n9kAfzNk61nySQEBEAfoF+eJwFqk
         iMXVs4sCHi2YgFjLZtLaxOpya6Y3rolCoatJGrYzAFRwsE0YZHFt3UgFejMUWwPkd9yh
         mXRvedspeE0x3W6+4qjmBMOGWGp2cFIw5DDo+7RoniWDUl2qqK89w1oFiqz752j7SfEV
         7w3v/lxEcMLtFjVKAX7/CgU5+MdNv6P6zz9YHdXifkzaKlv7XOFxE+gn6Ei5floaXB2B
         EGeHJadoH26Z8JtiV7AvN78Ke4C+j5G7hJTKJu/mSO8dBf23PLJwsXtCQ3q9ANOLKfda
         9q8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791536425; x=1792141225;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9cU6FQ2Ny19xqbH7FtIbST4Npto/KKrlVjyPkUdH56U=;
        b=kXZ4ZwnsQ6LyISMhYCzROR1+Y76dC3+VaK5ZtSRZ5iTKQ66C/DqAM9ZcV8w2HJLi2J
         TELrXt+QzwhXa9AJuotNYdad2cobOU1rBTkoyaygp7F+sO5AAEMb4NbjOGZvyUizBHwN
         lqwanEe0YF1bQZJhiaSnKHeZRay0xiDDGfrBdNjqdxGZG1RsFbmPNS8disHPuUESs6xT
         wSuoZenM37/zVam9euc01lI6xIGuTKk6K8RrzY/bREdw/6O+nhzcSENqJGZbXgl3ez6D
         c99fMprbP22gBtOFoHjM7/Zy7h2Pz7u53FtpIBB+/6Qc+YS9Enbex1oDCCe2qATLIccF
         wQow==
X-Forwarded-Encrypted: i=1; AKwUvBxadQXMFokxzAfWvjpenQURBIsT5OR7DlP9Ktq6c+IfdFQHGVgt0XLjWW2qp4C+1ohbmhycn4BNfgs=@vger.kernel.org
X-Gm-Message-State: AFuF++lH/rLlld2zlHfwnX7WnPq3CpNLycFB9nUR5bA8dU6yrS4rpT41
	7H+0RR13rXdtGm70zxLGPN1Brw7yMfD54VbNbRVnz1gOj8OCpqh2csU9fUwRjHv6XbA=
X-Gm-Gg: AYBFou0kLSeVZOoI5ZGa9YxyoLRS6Oktek9U+LU4s5J4xkK6BhQ3oMcflqp0kbZfyLx
	foDjswq6HMy7ay0QHcUWK8klViX2rR33WO/AOvqRyuhw86C42KUVqBsg6AjHZChJY1CuMcU9Tzv
	BT6OF4J8CVytmAdogNiriKbRHlVCePnobnAaAijhJ6ksceUFrxfdsm52UmvXU8NhMjBaVviOtDr
	NnpR/g4A/RP0iP7M64Y0dacDQ66Ya13Boqpe/0fKm1CLCGOjulaRf1uVjX7CiUMYN6LL/FS0vse
	CJpasjatEFSKuLtwdzDzF9ti6sxz0LmI90OCr0aR9kauvorm2XqoxT97/UGjYLLYQMpZ55WG4Cv
	e8fm+jx/hhZINCy5gzpscMMdx+gDOmNa8xgIsxlKC/u8VQonlbHxL8ufF6aAFPL1lIz6fjb4TZa
	KfmKdw3T3eR5zl3APtb8uGCeEOZteh5O+SbTwKZCqKSdesxHxvgO9Xvf1gpFQ5nO8aBKVLvHCF7
	PKpicVZBrBwWWXU6g==
X-Received: by 2002:a05:600c:620b:b0:49c:fc6c:be19 with SMTP id 5b1f17b1804b1-4a18e4d12e7mr19730845e9.31.1791536423436;
        Fri, 09 Oct 2026 02:00:23 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2caf4sm49180425e9.10.2026.10.09.02.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 02:00:22 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>, Jian Hu via B4 Relay
 <devnull+jian.hu.amlogic.com@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Brian Masney
 <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Jerome Brunet
 <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 0/3] clk: meson: Refactor PLL pre-divider as a
 divider clock
In-Reply-To: <7bd6015c-3b93-4ce9-bde9-506a727525d8@amlogic.com>
References: <20260923-meson_refactor_n-v1-0-3a8ce27121a2@amlogic.com>
 <1j1paj9elx.fsf@starbuckisacylon.baylibre.com>
 <7bd6015c-3b93-4ce9-bde9-506a727525d8@amlogic.com>
Date: Fri, 09 Oct 2026 11:00:21 +0200
Message-ID: <1jik3bp7tm.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On ven. 09 oct. 2026 at 14:35, Jian Hu <jian.hu@amlogic.com> wrote:

> Hi Jerome,
>
>
> Thanks for your review.
>
>
> On 9/24/2026 5:35 PM, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On mer. 23 sept. 2026 at 19:14, Jian Hu via B4 Relay <devnull+jian.hu.am=
logic.com@kernel.org> wrote:
>>
>>> This series refactors the Meson PLL framework to remove the dedicated
>>> PLL pre-divider (N) parameter from the PLL implementation and model it
>>> as a separate divider clock.
>>>
>>> Currently, the Meson PLL framework models the PLL pre-divider using a
>>> dedicated n field in struct meson_clk_pll_data. This makes the
>>> pre-divider part of the PLL-specific implementation, although the
>>> Common Clock Framework already provides a generic divider clock.
>>>
>>> This series separates the pre-divider from the PLL and makes the PLL
>>> DCO take the pre-divider clock as its parent. This allows the
>>> pre-divider to be modeled using the standard CCF divider implementation
>>> and simplifies the PLL framework.
>>>
>>> The series currently covers T7 as an RFC to get feedback on the
>>> framework design before applying the same approach to other SoCs.
>>>
>>> Series:
>>> clk: meson: pll: Remove the dedicated n parameter
>>> dt-bindings: clock: amlogic: Add T7 pre-divider clock IDs
>>> clk: meson: t7: Model PLL pre-divider as a divider clock
>>>
>>> The other Meson SoCs will be converted separately after the T7 PLL
>>> framework refactoring has been reviewed and the overall approach is
>>> agreed upon.
>>>
>>> Any feedback on the proposed clock hierarchy and the separation of the
>>> PLL pre-divider from the PLL itself would be appreciated.
>> So if I summarize this RFC, you have simply taken the divider out of the
>> PLL, no futher addaptation. right ?
>>
>> I'm happy with it on the general principle and fine with the change as
>> long as you test it on as much platform as you can, clearly flagging
>> those you have just compiled tested.
>>
>> A change like this would likely need to land early in the cycle give as
>> much time as possible for testing.
>>
>> However there a couple of thing I'm concerned about:
>>
>> * You've drop the table support: are you sure this is not needed anymore
>>    ? don't you want to be able to restrict mutlipliers to specific values
>>    sometimes ? If not, then OK.
>>
>> * the determine_rate() make no call to round the parent rate: Since the
>>    parent will be the divier, how do you progate the rate change so N
>>    moves and the best parent rate is found ? For sure this fractional
>>    multiplier clock will need CLK_SET_RATE_PARENT to adjust the
>>    pre-divider.
>>
>> * Goes with the point above, but I'm not seeing anything that favors
>>    lower N for lower jitter, Or mention of a minimum input rate (which
>>    could be a property) ?
>>    Those are constraints I think I have understood from your explanation
>>    here [1] but maybe you've got new information to share ?
>>
>> This is overall going in the right direction but determine_rate() and
>> constraints need work.
>>
>> Note: you are more likely to get test feedback if you add g12 (sm1) as an
>> example. Those are still the most widely used amlogic platforms with
>> mainline.
>>
>> [1]: https://lore.kernel.org/linux-clk/c9c4945f-cdfc-4382-b8ca-71b69d91d=
eb4@amlogic.com/
>
>
> Yes, your summary is correct: the RFC simply takes the pre-divider out=20
> of the PLL.
>
>
> 1) Keeping the table support
>
> Agreed, removing it was premature. Some tables cannot be expressed as
> a multiplier range:
>
> - pinned (m, n) pairs, e.g. axg PCIe GP0 (m=3D200, n=3D3) and meson8m2
>  =C2=A0 GP0 (m=3D182, n=3D3)
> - a pinned m, e.g. g12a PCIe PLL (m=3D150)
> - sparse tables, e.g. meson8b HDMI PLL
>
> The per-platform conversions will turn the tables with contiguous m
> and n =3D 1 into range, and keep the tables for the rest, so
> the framework will support both.
>
>
> 2) N is fixed per PLL
>
> The main new information: the pre-divider is not meant to be selected
> dynamically. Per the hardware design, each PLL has a single fixed N
> value, defined together with the rest of the PLL: N =3D 1 for most PLLs,
> and N =3D 3 for a few special cases on older SoCs (the axg PCIe PLL and
> the meson8m2 GP0 PLL). The PLL input frequency constraints are
> respected by this fixed value.

Ok, but this is not we have done so far. I don't think fixing the
predivier would break any use case, but if it does we may have to
re-visit this.

>
> Keeping N at 1 minimizes PLL jitter and yields the best performance.
>
> So this is less about dropping the constraints than about the fact
> that there is nothing to choose at runtime: no N search in
> determine_rate(), and no PFD input frequency constraint to enforce,
> since the PLL input frequency is a constant for each PLL.
>
> 3) No CLK_SET_RATE_PARENT on the DCO
>
> With N fixed, the pre-divider rate never changes, so the DCO does not
> set CLK_SET_RATE_PARENT on purpose: the flag would claim that the
> parent rate may change to satisfy the child, which is not the case
> here. determine_rate() never touches best_parent_rate so the flag
> would be a no operation today.
>
>
> 4) Implementation methods for pre-divider clock
>
> While testing the RFC I found that with the single-entry pre-divider
> table ({val =3D 1, div =3D 1}), the pre-divider register can never actual=
ly
> be programmed.
>
> The pre-divider field resets to 0, which is not a valid setting.
>
> During registration, recalc_rate() reports the parent rate for the
> zero register value. With N =3D 1 the reported rate is the parent rate,
> and the single-entry table also rounds every rate request back to the
> parent rate, so clk_set_rate() always bails out early (rounded rate =3D=3D
> current rate) and clk_regmap_div_set_rate() is never called. The
> register keeps its invalid reset value.

I see, you should have had a warning like that then ?

''' Zero divisor and CLK_DIVIDER_ALLOW_ZERO not set  '''

But from what I understand, your divider may have zero written in its
register but it will not output the parent rate unmodified, correct ?
In such case CLK_DIVIDER_ALLOW_ZERO is not correct.

Can you clarify the meaning of invalid ? If the just no oscillation I
guess we could add a 'CLK_DIVIDER_INVALID_ZERO' that returns 0 from
recalc_rate().

If your multiplier you'll probably have to handle this is
determine_rate() with something like

if (req->best_parend_rate =3D=3D 0 ||
    (req->rate / req->best_parent_rate) > YOUR_MAX_MULT) {
    clk_hw_round_rate(parent, req->rate / YOUR_MAX_MULT)
}

Then you update req->best_parent_rate with the value you get and CCF
will update the divider when the rate is applied.

If you then add your single entry table and CLK_SET_RATE_PARENT, it
should work as you expect AFAIU.

>
> v2 programs the fixed N at registration time, with a new
> init_val field in clk_regmap_div_data, applied from .init() once the
> regmap is available.

I don't like driver setting regs without a clear instruction from the
consumer or the framework, it is a splipery slope where people just tend
shove their use cases..

>
> Or do you have any other good ideas?
>
> The patch is available[1], Please help to review it.
>
>
> 5) Testing and rollout
>
> So far this has been boot tested on T7. For v2 I will
> convert the SoCs one by one, starting with g12a and sm1 which
> have the most mainline users, then the remaining platforms.
>

Please add the RFT tag. Please test GXL as well, you should have no
problem getting your hands on one, those are still easily available.

For Meson8, maybe Martin will be able to help us out ?

>
> [1]
>
> --- a/drivers/clk/meson/clk-regmap.c
> +++ b/drivers/clk/meson/clk-regmap.c
> @@ -163,10 +163,28 @@ static int clk_regmap_div_set_rate(struct clk_hw=20
> *hw, unsigned long rate,
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clk_div_mask(div->width) <=
<=20
> div->shift, val);
>  =C2=A0};
>
> +static int clk_regmap_div_init(struct clk_hw *hw)
> +{
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct clk_regmap *clk =3D to_clk_regmap(hw);
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct clk_regmap_div_data *div =3D clk_get_r=
egmap_div_data(clk);
> +
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D clk_regmap_init(hw);
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;
> +
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (div->init_val)
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_update_bit=
s(clk->map, div->offset,
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clk_div_mask(div->width) <=
< div->shift,
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 div->init_val << div->shif=
t);
> +
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> +}
> +
>  =C2=A0/* Would prefer clk_regmap_div_ro_ops but clashes with qcom */
>
>  =C2=A0const struct clk_ops clk_regmap_divider_ops =3D {
> -=C2=A0 =C2=A0 =C2=A0 =C2=A0.init =3D clk_regmap_init,
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0.init =3D clk_regmap_div_init,
>
>>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>>> ---
>>> Jian Hu (3):
>>>        clk: meson: pll: Remove the dedicated n parameter
>>>        dt-bindings: clock: amlogic: Add T7 pre-divider clock IDs
>>>        clk: meson: t7: Model PLL pre-divider as a divider clock
>>>
>>>   drivers/clk/meson/clk-pll.c                     | 178 +++++----------=
--------
>>>   drivers/clk/meson/clk-pll.h                     |  13 --
>>>   drivers/clk/meson/t7-pll.c                      | 183 +++++++++++++++=
+++------
>>>   include/dt-bindings/clock/amlogic,t7-pll-clkc.h |   6 +
>>>   4 files changed, 181 insertions(+), 199 deletions(-)
>>> ---
>>> base-commit: 43e1705ecab981c66baee89041e6f728c0436f19
>>> change-id: 20260923-meson_refactor_n-e7f25904e536
>>>
>>> Best regards,
>>> --
>>> Jian Hu <jian.hu@amlogic.com>
>>>
>>>
>>>
>>> _______________________________________________
>>> linux-amlogic mailing list
>>> linux-amlogic@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
>> --
>> Jerome
>
> --
>
> Jian
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

--=20
Jerome
