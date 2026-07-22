Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D40F33970F
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 16:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784737732; cv=none; b=AHOTmTGRf35hO7Ji6vNUh5qG0ooq+LvjakQAaGofKri//XRktwZmOgai8CtJnxKJyIMFb1HqvQNZFQs8s7flGuhVHNPFCnnyIPzNWpAMHLrOVTbL9Z70UQMgNxsef81rKUAMNNfy/sYPECCzJBo6dSLZbmKYa8rWHxEXoYR+8u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784737732; c=relaxed/simple;
	bh=SgrI06VkRvOUZZO0DVjTQu+oEWa6QEs25v+7RLbBZmk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=g4qyPJ2tNVW0aRt5xcW2z+ETGNBKrKjAJmwzQ3HvtQgNQ5puo0AgZfqyA86nLugWFIht0n/BIp9ouTZydI97UiBLCWKcoulYbNvKvLpEtAcTDl0w45Jt7duGuzAVnSKq7id1t3+umdPSTO1Bt+uruaizkfHwnnmKyjA8hIJfyFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=UfuUQ8wh; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="UfuUQ8wh"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4720f3bf164so3599708f8f.1
        for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 09:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784737727; x=1785342527; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0VgoN131mpCFDGVLEaTpJh9JaIowTJ3l5BSSOdIVGp0=;
        b=UfuUQ8whqYe7NpyuoRx+Ng2DMxZFzskibozxrSTWyf9a//k45i+60ciBqta7WfG5P4
         AyalqTZ5A0ZSSJBYujhkQqwPZiB4LMpRc274Y+iqIuHV8eaHiWhMIcDChnqESG2+tNGd
         jKG6K2dorhfL/nshV94A4h8f4qHQkP22J4xt+Hbu1hy7dVukX6rSGOMpqrKZtCW+5/GA
         fGL8GSzmWm9zaccA5f9D3gv0UFofpAPyMLYrOLqkN7Uqi3MXzgeaIYbXoZEm1jaJSZbC
         Y0h/DWlYZNwvobOL6wz0yOU2qpB9NfoTkVEN5l6kluNnK5hb7CUcMHDMCaRwV0IuieL2
         dtwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784737727; x=1785342527;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0VgoN131mpCFDGVLEaTpJh9JaIowTJ3l5BSSOdIVGp0=;
        b=mHZVXUVNHm9y0uTjMHiaWkuHS9xu2Wv4CNEM52JPmLGW4bKuANV1nQdr7lfY6ha9Ak
         HbcsLBuSKnG1d8nzyGQXHp6nivyT9sEKf9Bln6TkHhRcuisI+t9CiDxUyUE8RvEYsO0l
         9bsrYDehtkhGuB+E9jxV8igtvIEIdycyIhVxcZ8xfVPW0tsJyKKV93bU5pLAvg80DTkt
         wM6TuOHahNCbQVGQe2f8lB8dI+xo6Cf6nVLIzaE9O86vfjisw04MVX6wmEi7trmVrpsk
         ZWNNQ2dVdw3yBgE6ly9ocNj2I9+KW4mVDarMvtYMiBCWsLxB3r0YXHJTrazHXZbqpX70
         a3QQ==
X-Forwarded-Encrypted: i=1; AHgh+RpDNLJGwX1DEyxQmm/b5T27N2yJKBNv1RXU5r9XOj/ZjStc47ToiiEJxL2SmcTG0Hmz6C8KkmvIVgg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkaHhbkWzOQUfZ0y0xvLaTpLG7cmm96FZYaTcc9QDD8lyezEaO
	X8ilyjrz0cZhPbuAZTY0VYuI5456o+aWVhAQBhEwJuMWpV5t10JuCGcWubYnPBSs9yc=
X-Gm-Gg: AR+sD13Ly4aD+5aeF7AKdESGLTajVZiCtrfGVFfMmrEFGTOiKICV3NcmSLr6IVDNnVk
	HT/1Qu+3bBatVnd4+tTvpk5pYqQS5EFSxfGwy9SXZYvdvXttml+O4M7Myp0J9UIa2C5iW9Tzq6K
	RpKDQ63eDnqIF35NKqvKPT8KbpwwnZntHYs2TBU/K2bfIFJ2jEWuilPpimj+C7NjOZkjeZb7ocS
	iDqtbVNAt/i+lfoJ34IBmARuje7KMlkfw7MeEufhD3JBuKOOaIlXoklWp8wGkt/+PtfcM/t0kms
	ZxWOd/Q+T9Q4VHKZ+xyoNxyASy1p+odEhXDolKwwnNMoGvkqDJyhqx9DgrUxWbzzOWL3sVH/qx+
	SK0e08n0wfBHRzmmWZiV91bfZtYmM5ygTLSSi97CcGlL7WO9jgAbvG9gUaWi/xIhKKHwjS3JivK
	V5
X-Received: by 2002:a05:6000:4383:b0:47f:8a78:e814 with SMTP id ffacd0b85a97d-47f8a78e864mr1966333f8f.9.1784737727656;
        Wed, 22 Jul 2026 09:28:47 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:3382:6663:1606:b6ac])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f85c6d277sm7563000f8f.32.2026.07.22.09.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 09:28:47 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Samuel
 Holland <samuel@sholland.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Maxime
 Ripard <mripard@kernel.org>,  linux-rtc@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev,  linux-kernel@vger.kernel.org,
  linux-clk@vger.kernel.org
Subject: Re: [PATCH v6 2/4] clk: sunxi-ng: div: add read-only operation support
In-Reply-To: <CAGb2v64HjXygw76zaNi9KaG-zfc+hZoeyp4EHyz68fcdK-AXNw@mail.gmail.com>
	(Chen-Yu Tsai's message of "Wed, 22 Jul 2026 23:40:07 +0800")
References: <20260722-a733-rtc-v6-0-631cca28cc9a@baylibre.com>
	<20260722-a733-rtc-v6-2-631cca28cc9a@baylibre.com>
	<CAGb2v64HjXygw76zaNi9KaG-zfc+hZoeyp4EHyz68fcdK-AXNw@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 22 Jul 2026 18:28:45 +0200
Message-ID: <1jse5bc7k2.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On mer. 22 juil. 2026 at 23:40, Chen-Yu Tsai <wens@kernel.org> wrote:

> On Wed, Jul 22, 2026 at 10:48=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.=
com> wrote:
>>
>> Add support for sunxi-ng read-only dividers. This will be
>> useful to the a733 oscillator detection logic.
>>
>> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  drivers/clk/sunxi-ng/ccu_div.c | 31 +++++++++++++++++++++++++++++--
>>  drivers/clk/sunxi-ng/ccu_div.h |  1 +
>
>>  drivers/clk/sunxi-ng/ccu_mux.c |  2 +-
>>  drivers/clk/sunxi-ng/ccu_mux.h |  4 ++++
>
> Left over stuff?
>

Argh indeed, that's no longer necessary=20

>
>>  4 files changed, 35 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_d=
iv.c
>> index 62d680ccb524..c385e0160f13 100644
>> --- a/drivers/clk/sunxi-ng/ccu_div.c
>> +++ b/drivers/clk/sunxi-ng/ccu_div.c
>> @@ -20,8 +20,22 @@ static int ccu_div_determine_rate_helper(struct ccu_m=
ux_internal *mux,
>>         if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
>>                 req->rate *=3D cd->fixed_post_div;
>>
>> -       ret =3D divider_determine_rate(&cd->common.hw, req, cd->div.tabl=
e,
>> -                                    cd->div.width, cd->div.flags);
>> +       if (cd->div.flags & CLK_DIVIDER_READ_ONLY) {
>> +               unsigned long val;
>> +               u32 reg;
>> +
>> +               reg =3D readl(cd->common.base + cd->common.reg);
>> +               val =3D reg >> cd->div.shift;
>> +               val &=3D (1 << cd->div.width) - 1;
>> +
>> +               ret =3D divider_ro_determine_rate(&cd->common.hw, req, c=
d->div.table,
>> +                                               cd->div.width, cd->div.f=
lags, val);
>> +
>> +       } else {
>> +               ret =3D divider_determine_rate(&cd->common.hw, req, cd->=
div.table,
>> +                                            cd->div.width, cd->div.flag=
s);
>> +       }
>> +
>>         if (ret)
>>                 return ret;
>>
>> @@ -143,3 +157,16 @@ const struct clk_ops ccu_div_ops =3D {
>>         .set_rate       =3D ccu_div_set_rate,
>>  };
>>  EXPORT_SYMBOL_NS_GPL(ccu_div_ops, "SUNXI_CCU");
>> +
>> +const struct clk_ops ccu_rodiv_ops =3D {
>> +       .disable        =3D ccu_div_disable,
>> +       .enable         =3D ccu_div_enable,
>> +       .is_enabled     =3D ccu_div_is_enabled,
>> +
>> +       .get_parent     =3D ccu_div_get_parent,
>> +       .set_parent     =3D ccu_div_set_parent,
>> +
>> +       .determine_rate =3D ccu_div_determine_rate,
>> +       .recalc_rate    =3D ccu_div_recalc_rate,
>> +};
>> +EXPORT_SYMBOL_NS_GPL(ccu_rodiv_ops, "SUNXI_CCU");
>> diff --git a/drivers/clk/sunxi-ng/ccu_div.h b/drivers/clk/sunxi-ng/ccu_d=
iv.h
>> index be00b3277e97..a30a92780a05 100644
>> --- a/drivers/clk/sunxi-ng/ccu_div.h
>> +++ b/drivers/clk/sunxi-ng/ccu_div.h
>> @@ -300,5 +300,6 @@ static inline struct ccu_div *hw_to_ccu_div(struct c=
lk_hw *hw)
>>  }
>>
>>  extern const struct clk_ops ccu_div_ops;
>> +extern const struct clk_ops ccu_rodiv_ops;
>>
>>  #endif /* _CCU_DIV_H_ */
>> diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_m=
ux.c
>> index 4503c9780c39..12bfc99c9172 100644
>> --- a/drivers/clk/sunxi-ng/ccu_mux.c
>> +++ b/drivers/clk/sunxi-ng/ccu_mux.c
>> @@ -67,7 +67,7 @@ unsigned long ccu_mux_helper_apply_prediv(struct ccu_c=
ommon *common,
>>         return parent_rate / ccu_mux_get_prediv(common, cm, parent_index=
);
>>  }
>>
>> -static unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *c=
ommon,
>> +unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
>>                                             struct ccu_mux_internal *cm,
>>                                             int parent_index,
>>                                             unsigned long parent_rate)
>> diff --git a/drivers/clk/sunxi-ng/ccu_mux.h b/drivers/clk/sunxi-ng/ccu_m=
ux.h
>> index c94a4bde5d01..272a2c36a8f2 100644
>> --- a/drivers/clk/sunxi-ng/ccu_mux.h
>> +++ b/drivers/clk/sunxi-ng/ccu_mux.h
>> @@ -134,6 +134,10 @@ unsigned long ccu_mux_helper_apply_prediv(struct cc=
u_common *common,
>>                                           struct ccu_mux_internal *cm,
>>                                           int parent_index,
>>                                           unsigned long parent_rate);
>> +unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
>> +                                           struct ccu_mux_internal *cm,
>> +                                           int parent_index,
>> +                                           unsigned long parent_rate);
>>  int ccu_mux_helper_determine_rate(struct ccu_common *common,
>>                                   struct ccu_mux_internal *cm,
>>                                   struct clk_rate_request *req,
>>
>> --
>> 2.47.3
>>

--=20
Jerome
