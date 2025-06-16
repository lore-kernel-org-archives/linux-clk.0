Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366C82868AA
	for <linux-clk@vger.kernel.org>; Mon, 16 Jun 2025 16:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750091278; cv=none; b=HF7zZLmqkVLe4P2RxuPM8wWYUGEi1f8R9wwACtZCEXyVsmwID73ytHZwvWJRRvM/bgtlFCgHNYUljXOH3nbZw4Sr57OyPN+cg2IlsrFndaFjMM+JLrOkEY5LwmnTBGbWS9CHJQLhm471OrHBDzcZ/ZdorkX7Q4MCzCUc5yN8VdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750091278; c=relaxed/simple;
	bh=y+IVtu+WNfcfhdvqMMjx7mRf57PCrubK/DS0Yxo11+M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CjQPt990PwcVX5FyVZBbsL6Vd0wEKNWTe5GhuVi7fyCYqHIWgOVc6JwMuswNs3GLnsHIyqIItNoH42WjysfyywgMzjh0sT5uj4T0ipAu5NVZLxtEMnjLOxmMfmn4hf9lcWVmajcjPTiEVmk6LrmGoNHok0ERVQk6Vf12zJlVbDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=N8tKoTQx; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="N8tKoTQx"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so3946795f8f.2
        for <linux-clk@vger.kernel.org>; Mon, 16 Jun 2025 09:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750091274; x=1750696074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g//RjhSoXItXHLLuz1FPQ8PBTL6LhGzURl5mDmu1U+s=;
        b=N8tKoTQxZRk0Op4GSzgx90r1v5+M8Wi9xiI3gB9HZg/36jS7MM3WI4WEib/BWH8B7J
         ffiQUlvHgOcZ9t0OH3UTG+F1oU/RC/7wLcKeQl4MmUWzKJx6crv6UvzzeXg18m9d2pDg
         QY73UTx5v/vRxicCGRGmXVtVBBWAm7YvdZ5gZ2bhSY1e3Vp6sD5jUU1clHbBuCctTzNC
         yiw19Wo4ljjH4PzyZXDZsVxRBmip+UD/3cVVhGeSL1a+9GMfqRv5jiburkJDA6Fr03Qm
         N2hiEBWayaW9wunAIjD7rXLN4JTDa9qAz4pfSLeHzh/cvTpotgDFchoVq88kdELdlNQ8
         SOJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750091274; x=1750696074;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g//RjhSoXItXHLLuz1FPQ8PBTL6LhGzURl5mDmu1U+s=;
        b=rjNblg4TVm3Nds7dEeG/BoImLVK+gaAHa9Y5GiqbpPCJejO1A+C+mXpVXkKy4m1KPi
         ErGRuq1N9nJGu2xsY9RpGLAjB1MYmg9ORAYFZtY0kK3CdYoJI0bfTFHjrSd0mxv1P2O5
         oeIE1dkrlnh3wmyi8RpcuDHzsP0HSHa/wJ9JHkKL4dd27PAc8c+k9L3e+JMhBMmDU2+i
         yUOMGymrwSrXcWeXyOOpgoTszMaGKR4Xp3js+kMOOWZk0UvR/dsf6L/0+2zx8cgogoGy
         D0YYYKUe9snTRPIjY59ucYhdi4/Ehf4fVaBQ2Vp2KdNfcYikx2LUv1nof94mGl8r3aeN
         hYgg==
X-Forwarded-Encrypted: i=1; AJvYcCUcjFPE0cSvYrjLP9//nyU0IYUzuVSJ3q3Zp0A3RTcza0T7mJ915JTp11ZtfVp5EE3QXCZqBCiZ3Fg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2F9mRrpkOtPAJDoUMwsj21xPaT3FXJ0w4NRAArNsUF1ZTKqPO
	owE2QecDWaYOd0VKHvzNjUmpnSgVHQAFQn6Ryk3yyruYNEVEaGH2hsDjBejYUhZuKnw=
X-Gm-Gg: ASbGncvlY55IRfnHvI9rMnP27bxi4nCp9TAOngS2d7zyIvlkRgfa0Fngcp6TemxIgfJ
	ZFhrCn5KIRHEhBEJXvanAeZ8762ht68fD7Jg4WS/PH8WgbIATpmfdZPgO0FVWWzpwUfpTswQOeq
	hoUE2kyR23P8Yidxm8F1rq4DEF46VJ1r/Q/pFqJvDbjbNWAxP2QpJB/Ix6mWE47nv6lfL8twhdv
	DmfdTXxJmvlHJJg+WBr8syLOoy7P0v1pyNkC6hsWLalGQMv2iZ/IEmxPJ5UXGTCUQ1k0UkR2tpB
	SVdcWONSRRsyGrg4/GJ67cEOnb7m+h43KzLsHj5iMf5d42mCm3CIKFN0oGC9kQ==
X-Google-Smtp-Source: AGHT+IErBlsaj2oMz4KGG0U/n1iHZhnbyvR7L71f4kcmN+NZni2stWVZL4S2bu1UJwMFwQlCqMCesg==
X-Received: by 2002:a05:6000:240e:b0:3a4:eec8:c9b3 with SMTP id ffacd0b85a97d-3a57237dc17mr8397766f8f.23.1750091274515;
        Mon, 16 Jun 2025 09:27:54 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1866:9357:88b6:f1b2])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568b089b5sm11356238f8f.48.2025.06.16.09.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 09:27:53 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>,  Chuan Liu
 <chuan.liu@amlogic.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  Kevin Hilman <khilman@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  Michael Turquette <mturquette@baylibre.com>,  Dmitry Rokosov
 <ddrokosov@sberdevices.ru>,  robh+dt <robh+dt@kernel.org>,  Rob Herring
 <robh@kernel.org>,  devicetree <devicetree@vger.kernel.org>,  linux-clk
 <linux-clk@vger.kernel.org>,  linux-amlogic
 <linux-amlogic@lists.infradead.org>,  linux-kernel
 <linux-kernel@vger.kernel.org>,  linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 4/6] clk: meson: t7: add support for the T7 SoC PLL
 clock
In-Reply-To: <4dd25114-212d-44d6-938a-63871750c292@amlogic.com> (Jian Hu's
	message of "Thu, 12 Jun 2025 21:02:00 +0800")
References: <20250509074825.1933254-1-jian.hu@amlogic.com>
	<20250509074825.1933254-5-jian.hu@amlogic.com>
	<1jtt5ny6gq.fsf@starbuckisacylon.baylibre.com>
	<4dd25114-212d-44d6-938a-63871750c292@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 16 Jun 2025 18:27:53 +0200
Message-ID: <1jh60fd52u.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu 12 Jun 2025 at 21:02, Jian Hu <jian.hu@amlogic.com> wrote:

>>> +
>>> +static struct clk_regmap t7_pcie_pll_od =3D {
>>> +     .data =3D &(struct clk_regmap_div_data){
>>> +             .offset =3D ANACTRL_PCIEPLL_CTRL0,
>>> +             .shift =3D 16,
>>> +             .width =3D 5,
>>> +             .flags =3D CLK_DIVIDER_ONE_BASED |
>>> +                      CLK_DIVIDER_ALLOW_ZERO,
>> What's the behaviour of the divider on zero then ?
>
>
> If there is no CLK_DIVDER_ALLOW_ZERO, there is a warning when registering
> t7_pcie_pll_od.
>
> like this:
>
> =C2=A0 ------------[ cut here ]------------
> =C2=A0 WARNING: CPU: 1 PID: 1 at drivers/clk/clk-divider.c:140
> divider_recalc_rate+0xfc/0x100
> =C2=A0 pcie_pll_od: Zero divisor and CLK_DIVIDER_ALLOW_ZERO not set
> =C2=A0 Modules linked in:
> =C2=A0CPU: 1 PID: 1 Comm: swapper/0 Not tainted
> 5.4.283-09976-ga803e94eed88-dirty #91
> =C2=A0 Hardware name: tm2_t962e2_ab311 (DT)
> =C2=A0Call trace:
> =C2=A0 [ffffffc020003750+=C2=A0 64][<ffffffc0100e3e3c>] dump_backtrace+0x=
0/0x1e4
> =C2=A0 [ffffffc020003790+=C2=A0 32][<ffffffc0100e4044>] show_stack+0x24/0=
x34
> =C2=A0 [ffffffc0200037b0+=C2=A0 96][<ffffffc01130a2e8>] dump_stack+0xbc/0=
x108
> =C2=A0[ffffffc020003810+ 144][<ffffffc01010c484>] __warn+0xf4/0x1b8
> =C2=A0 [ffffffc0200038a0+=C2=A0 64][<ffffffc01010c5f4>] warn_slowpath_fmt=
+0xac/0xc8
> =C2=A0[ffffffc0200038e0+=C2=A0 64][<ffffffc01061d364>] divider_recalc_rat=
e+0xfc/0x100
> =C2=A0[ffffffc020003920+=C2=A0 80][<ffffffc010624e84>]
> clk_regmap_div_recalc_rate+0x74/0x88
> =C2=A0 [ffffffc020003970+=C2=A0 96][<ffffffc010616a54>] __clk_register+0x=
62c/0xb78
>
> so add it to avoid the warning.

That does not really answer my question
