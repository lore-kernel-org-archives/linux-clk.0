Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12B1189F52
	for <linux-clk@vger.kernel.org>; Wed, 13 Nov 2024 08:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731486983; cv=none; b=QZskUrQbS6OaEMLSpsJdAmHSlqsQKqoL7R8lZEfAIw6nQqho4eDimxySrgry7/9Vcz0KGTfasWwYrZ32IfEyuRKbNaRFm7j54cB+9TPHJLs8jzKQVCVur/KQ6wsnt0OoWZ/LEYE3CBRM9PKlkn48+IcJL47w37W/CrVy0udpPtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731486983; c=relaxed/simple;
	bh=OYPA6nWxJUsYUlpjbB6I1lZwViDm6ZxacBmzJ+ckWi0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=aB4f/38rjbWTaWEabsDlQ0/CFl1MMN7MdcNoKOc6rRhiuhDDfzvLBawv481I8b0HFnu3gafOTHklLiUp1KEEeCVb+uEOVy0rTmMj6VZlWX8dZxe3pQeypnzk2yeelLbGsMeiWVx7uAmdC5pyXl6kXllUqu6dStnqnhLmEMNpQhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=1y1cD02n; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="1y1cD02n"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53d9ff8f1e4so703715e87.2
        for <linux-clk@vger.kernel.org>; Wed, 13 Nov 2024 00:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731486978; x=1732091778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OYPA6nWxJUsYUlpjbB6I1lZwViDm6ZxacBmzJ+ckWi0=;
        b=1y1cD02nh+BBOjfGcis+7W6L6Dq3ijHRBxnJXvXyd74EvojDI2vWDzLbirhd7W63tX
         2QLntU7T/d4j/3qWZD/wwwjxiz7/s85M93cB8J/9SYdq0BFbgGni8CbrxbNlvVBGF98A
         bmkRPKeJFMgSGWbK5/ld5HknG1ryiLOHSWBxDz5tWz0XNfHXMMnmeecJRm9u3rtpR416
         wCe3r+7jASY9dd2aFhlj+gBCP9MOQT7HHESzgP8p06WABvMMNRmjWjuAVnHGizz+UaQG
         Ma5L7hsj4EZb4xLpdDP//jmhsvKb5GUVTMjkJ7x5tqMH0SWM+zVBk3B8STty/YP+K01k
         hfbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731486978; x=1732091778;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OYPA6nWxJUsYUlpjbB6I1lZwViDm6ZxacBmzJ+ckWi0=;
        b=At1ze6OIV3hiRFE3DoG5L6aZIxsNEngarLaJWuZvOBEL5eNNEXwbNRW+yp8okTvXEj
         OqQ36rN6ClKRwZD8ugiHxx+NBhGhqane6skx6R0h2mzkCMV2VhCQ7unTc9abLvkdlBFP
         RrV73Dw10CWRUDcYhHJKXg32Rj5ZCJzGnna9mZFawhT9GDpNqa750GETzs0BXPrLdazU
         8R8s6xSMd7PpLj+DpGZshoYRfQ2IacNni/6VhLA29isoj0GONQuZ+3l3/4t69KOHePGm
         NWlEw4fHmmzDiD70SQidtkJVZwzwMv5jfYKVbGw+n2GBZE6tm1Wl4of/zRhhY8Ujy9Q3
         J89A==
X-Forwarded-Encrypted: i=1; AJvYcCU1KkvFhH8wO+lL3f9cgoLUHTBCto7KTLWyYVVpuhiSYjJ+QBceXtC5ZzD+FU+N3eWfoM1oOxeUrzc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6dm75W0TmxdegjgIxo4o+/nW3w5FTane989p1XHbwujt+/Vvk
	Bg7waUSLuwlSKrLA39qi83xKeRiWt2w5xGI3Spb0hjbWC3kXFlexOrTnImldOMg=
X-Google-Smtp-Source: AGHT+IGWfeeUXb1J7tNUbkIyXcKwhdZi8cijjSk5i0m1HIdGPU3q+vOzGiu/Ie/Rwn7qF3wDur68cQ==
X-Received: by 2002:a05:6512:3b12:b0:53d:a321:db74 with SMTP id 2adb3069b0e04-53da321dc7cmr28537e87.50.1731486977586;
        Wed, 13 Nov 2024 00:36:17 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:1230:8bee:11e5:5035])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d478511dsm18535635e9.0.2024.11.13.00.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 00:36:17 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: neil.armstrong@linaro.org,  Michael Turquette <mturquette@baylibre.com>,
  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman <khilman@baylibre.com>,
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>,  Jian Hu
 <jian.hu@amlogic.com>,  Dmitry Rokosov <ddrokosov@sberdevices.ru>,  Yu Tu
 <yu.tu@amlogic.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: meson: Fix the determine rate error in
 clk_regmap_divider_ro_ops
In-Reply-To: <da391fec-738a-4044-a598-fee1137dfa5c@amlogic.com> (Chuan Liu's
	message of "Wed, 13 Nov 2024 14:55:50 +0800")
References: <20241112-fix_childclk_of_roclk_has_been_tampered_with-v2-1-64f8009cdf2a@amlogic.com>
	<35307d7a-a110-430d-9ba5-808a05450adb@linaro.org>
	<da391fec-738a-4044-a598-fee1137dfa5c@amlogic.com>
Date: Wed, 13 Nov 2024 09:36:16 +0100
Message-ID: <1j7c97v8cf.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed 13 Nov 2024 at 14:55, Chuan Liu <chuan.liu@amlogic.com> wrote:

 file changed, 20 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/drivers/clk/meson/clk-regmap.c
>>> b/drivers/clk/meson/clk-regmap.c
>>> index 07f7e441b916..edf65ca92c7a 100644
>>> --- a/drivers/clk/meson/clk-regmap.c
>>> +++ b/drivers/clk/meson/clk-regmap.c
>>> @@ -80,21 +80,6 @@ static int clk_regmap_div_determine_rate(struct
>>> clk_hw *hw,
>>> =C2=A0 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct clk_regmap *clk =3D to_clk_regmap=
(hw);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct clk_regmap_div_data *div =3D clk_=
get_regmap_div_data(clk);
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int val;
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>>> -
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 /* if read only, just return current value */
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 if (div->flags & CLK_DIVIDER_READ_ONLY) {
>>
>> You're breaking current code by no more checking this flag,
>> the new clk_regmap_div_ro_determine_rate() is fine, but you should call
>> it from here if CLK_DIVIDER_READ_ONLY is set.
>
> My idea is that the newly added clk_regmap_div_ro_determine_rate()

Whatever your idea is, what has been submitted is broken, as Neil
pointed out

> implements the functionality of handling CLK_DIVIDER_READ_ONLY in
> clk_regmap_div_determine_rate(). If we still keep the logic for
> handling CLK_DIVIDER_READ_ONLY here, it will make
> clk_regmap_div_determine_rate() ambiguous and easily confused.

That would just shift the problem from one function to other.
Please apply Neil's suggestion.

>
>>
>> Neil
>>
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ret =3D regmap_read(clk->map, div->offset, &val);
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if (ret)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> -
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 val >>=3D div->shift;
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 val &=3D clk_div_mask(div->width);
>>> -
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return divider_ro_determine_rate(hw, req, div->table,
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 div->width, div->flags,
>>> val);
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return divider_determine_rate(hw, req, d=
iv->table, div->width,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 div->fla=
gs);
>>> @@ -127,9 +112,28 @@ const struct clk_ops clk_regmap_divider_ops =3D {
>>> =C2=A0 };
>>> =C2=A0 EXPORT_SYMBOL_NS_GPL(clk_regmap_divider_ops, CLK_MESON);
>>>
>>> +static int clk_regmap_div_ro_determine_rate(struct clk_hw *hw,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 struct clk_rate_request *req)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct clk_regmap *clk =3D to_clk_regmap(hw);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct clk_regmap_div_data *div =3D clk_get_r=
egmap_div_data(clk);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int val;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D regmap_read(clk->map, div->offset, &v=
al);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 val >>=3D div->shift;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 val &=3D clk_div_mask(div->width);
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 return divider_ro_determine_rate(hw, req, div=
->table, div->width,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 div->flags, val);
>>> +}
>>> +
>>> =C2=A0 const struct clk_ops clk_regmap_divider_ro_ops =3D {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .recalc_rate =3D clk_regmap_div_recalc_r=
ate,
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 .determine_rate =3D clk_regmap_div_determine_=
rate,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 .determine_rate =3D clk_regmap_div_ro_determi=
ne_rate,
>>> =C2=A0 };
>>> =C2=A0 EXPORT_SYMBOL_NS_GPL(clk_regmap_divider_ro_ops, CLK_MESON);
>>>
>>>
>>> ---
>>> base-commit: 664988eb47dd2d6ae1d9e4188ec91832562f8f26
>>> change-id:
>>> 20241111-fix_childclk_of_roclk_has_been_tampered_with-61dbcc623746
>>>
>>> Best regards,
>>

--=20
Jerome
