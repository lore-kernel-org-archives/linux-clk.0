Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F631AA3C3
	for <linux-clk@vger.kernel.org>; Tue, 30 Jul 2024 22:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722377629; cv=none; b=RDb0FKBji1ZNxVHUky2nSy/oqslzUHFKulCxalOIhS9zoj7+rYp22LUN7myCoYYpG+c9oM3ixGl+FQJyn3mjpOhfNAyMmipNDFUY5fxlOOF5pcRDoIIYlVTJ5WSOM/l5XqzkaUux/kcgP8FZRjeSQFwT4tpF7YKL0GUByHKxyX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722377629; c=relaxed/simple;
	bh=seTDC/WMyGR+N//njC0hW8zhYniFJcu+7Yvl71N5Lf4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=jv2Sb3afXFW0MPjYl+01irggdRDrqahsYA1D5+cFwE4op6gAmapzS2rnVris0Bbvpg9Y1bkPWSbvqI2WrMj1xMnqJCGU+L3oOjbUmhNb34Ho+JagoZywwXS7+L/gtngWm+lutV1Jig9nBLh1PCTobWfdMFa0i71REUTizrOOFe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com; spf=none smtp.mailfrom=toblux.com; dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b=Uyy87Box; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toblux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="Uyy87Box"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5a167b9df7eso8196474a12.3
        for <linux-clk@vger.kernel.org>; Tue, 30 Jul 2024 15:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1722377627; x=1722982427; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6KPFchYV60jxiYsM1WLejLobqSkE3bZqlVL+pXLWsc=;
        b=Uyy87Box8ww8deKeqdoghCI1BE8+zeJ7BtoKlupuPa0yWUXwHZUccEXPugACdQA55l
         t+UsnaXu40mROTdIYdcQJUnA9JOA3jQlZnGNaqtb3ki4y8mGxRhbX5DHS6rJtm6i1a6z
         ojFb9DhsXEyHcT3E0tT0ZIv359fkOizhZ9ySobemDw4xS4SLq01GuKK2DcAdg7qeOW25
         VO7RIYYIWTuE/fcgQYWIC/MM8t7jrzo1NTRCGD+b5a5EFe0SKQ3THQfYOy9QzyiZFX9e
         CDXrMp2IYG4WmO6B7fbBQ5QVz272jvmxfBVIlUp71hfJMug0JCmDEnOw8JAGbzF2JglO
         PeIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722377627; x=1722982427;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G6KPFchYV60jxiYsM1WLejLobqSkE3bZqlVL+pXLWsc=;
        b=thEL3gqO8SUek9mlGwJkQqr9WSG1sgQqeCFT+O756TucQlQ5e4Pg6jC8zB0PJSrcB1
         +Jzhfzt1UyehB00hpJKay1XMDgup2Xl8M0lCidij5XhIaMEjd5AN4mgIE3sZuQaFIu54
         I3X1XTIu9T+i5CpZ6yzBUyjHk/gRP0/0r62/YQGICDOBYsfuotEssvXXEJajvsdzlnMr
         1VyMHwiVkjE10oDWztpMorKlWzjkseXhT9T6/zA9nc8bx7WmnqXbhek/AJUs0OmZi5Ob
         Og2bdbouJNTmNZkZ48lw77ueB3b1wPD6AJP3EwM97+s1lwV2beOruI2XcHMjV2Rw6lb8
         y+3w==
X-Forwarded-Encrypted: i=1; AJvYcCVer0KzTmD+NkkG+9W/uqJIcRU9KnUA3FMifIdCvNdwdliNnhWbmXoelXnxRqZsk2DlwIlmm3f6dvvuboxNcdPQJDvDIAoelzWH
X-Gm-Message-State: AOJu0Yx7DRxYjDM4mO1D8WiSgbH6/dCfhtay4S1z1zllb70koYEQO6yj
	cjhYUcuBBNCA3eqK0zoX/FpHEZgVv84Ozbsgu3oBIagpvxWiPbVxboHDGF289dM=
X-Google-Smtp-Source: AGHT+IFgdXEJaG1nk0KaMSYpcKvYIsAboDqtw4g8LJabhQ7XXLIhipbewucBVuWCPKJnNzq5M+se9g==
X-Received: by 2002:a50:8e50:0:b0:5a1:f680:5470 with SMTP id 4fb4d7f45d1cf-5b0205d613emr9144848a12.13.1722377626447;
        Tue, 30 Jul 2024 15:13:46 -0700 (PDT)
Received: from smtpclient.apple ([2001:a61:10b5:fc01:4198:a192:529f:265d])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ac6377e06fsm7876066a12.28.2024.07.30.15.13.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Jul 2024 15:13:45 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH] clk: hisilicon: Remove unnecessary local variable
From: Thorsten Blum <thorsten.blum@toblux.com>
In-Reply-To: <817eef56fa3dcd4238198c7a964adfef.sboyd@kernel.org>
Date: Wed, 31 Jul 2024 00:13:34 +0200
Cc: abel.vesa@linaro.org,
 angelogioacchino.delregno@collabora.com,
 christophe.jaillet@wanadoo.fr,
 dinguyen@kernel.org,
 erick.archer@gmx.com,
 mturquette@baylibre.com,
 robh@kernel.org,
 linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <2E69FE3D-5D1B-4952-959F-06603BA21D98@toblux.com>
References: <20240710201844.710365-2-thorsten.blum@toblux.com>
 <817eef56fa3dcd4238198c7a964adfef.sboyd@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
X-Mailer: Apple Mail (2.3774.600.62)

On 30. Jul 2024, at 01:23, Stephen Boyd <sboyd@kernel.org> wrote:
> Quoting Thorsten Blum (2024-07-10 13:18:45)
>> diff --git a/drivers/clk/hisilicon/clk-hi3559a.c =
b/drivers/clk/hisilicon/clk-hi3559a.c
>> index c79a94f6d9d2..30d5a6ba8fa5 100644
>> --- a/drivers/clk/hisilicon/clk-hi3559a.c
>> +++ b/drivers/clk/hisilicon/clk-hi3559a.c
>> @@ -407,7 +407,7 @@ static unsigned long clk_pll_recalc_rate(struct =
clk_hw *hw,
>>                unsigned long parent_rate)
>> {
>>        struct hi3559av100_clk_pll *clk =3D to_pll_clk(hw);
>> -       u64 frac_val, fbdiv_val, refdiv_val;
>> +       u64 frac_val, fbdiv_val;
>>        u32 postdiv1_val, postdiv2_val;
>>        u32 val;
>=20
> I see 'val' is u32 here.
>=20
>>        u64 tmp, rate;
>> @@ -435,13 +435,12 @@ static unsigned long clk_pll_recalc_rate(struct =
clk_hw *hw,
>>        val =3D readl_relaxed(clk->ctrl_reg2);
>>        val =3D val >> clk->refdiv_shift;
>>        val &=3D ((1 << clk->refdiv_width) - 1);
>> -       refdiv_val =3D val;
>>=20
>>        /* rate =3D 24000000 * (fbdiv + frac / (1<<24) ) / refdiv  */
>>        rate =3D 0;
>>        tmp =3D 24000000 * fbdiv_val + (24000000 * frac_val) / (1 << =
24);
>>        rate +=3D tmp;
>> -       do_div(rate, refdiv_val);
>> +       do_div(rate, val);
>=20
> So this can be div_u64() now?

Yes, it could be.

Is div_u64() preferred over do_div() when the remainder doesn't matter?

Thanks,
Thorsten=
