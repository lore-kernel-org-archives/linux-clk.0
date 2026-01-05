Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFE327F754
	for <linux-clk@vger.kernel.org>; Mon,  5 Jan 2026 09:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767604478; cv=none; b=VtW8J0t+nK4/Erty4yU7d7+mRGRr2+EyoN/2mkmg5PYlpfd9L2DtY4C09pDRg+Ky6e8nuaqA2/TLjPEJu3ScXxfb0WPjKSY+4Edccskz1ogcrOs7q0Xwxbbg7ihclM5OfMbiPAz8vIlBI+nuP66zzqmnMt07zYrwHijXB9M3S9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767604478; c=relaxed/simple;
	bh=QW8t2JNOdvI2uXm6GTQqMR2BYg3t2UgJyOvON6wsQF4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bfa1lA92qgI5HiPPsJBjAHcXjB1Db1Kvt7pcM0EsmHAcokvPIT+aiou8lvtOiWTp9krsbVebgpoSQRxXawaOWXWbJf8Yvnz/nC7Pvu0t2pvfso2VuNpetKxJpnBl+wLWR9uE7LOsHJIPspcgMfulX/I9JPytqTkSxXt8Kk20uHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=VZYLsQzK; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="VZYLsQzK"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso6667195e9.1
        for <linux-clk@vger.kernel.org>; Mon, 05 Jan 2026 01:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1767604474; x=1768209274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=miCvpSGVqVVCNMF4tIx1RWrVqnyi6qhzDTvcjYnjzjQ=;
        b=VZYLsQzKlwtV8sZxzeBGSWcaPHwI32eqSX5m3z0HRr2q9Zesf3fC0AfIn0armQTm0/
         OUExTGNwloIss5vTKfN5z/xO5apTuUQDjrXnUY/yzq4NmLNxUkKhFBE2FQ97BTwZx9nn
         Sp4Rs/Vn8lPgBXcUX8yIUaXBbvWsicdyOo4W46ONheLgny//8TBaVd3TaIqqZQV3uoPD
         U6zgcbUk0lGISLFFOYBpntOT/ms694jK5Xy8A4MVQAllatRjwck7dQEHZe8hTM/LIaDo
         W/530rlzZUV6U/R9spb0JXNmN8HGoydQR+5u4aM6HvHeHSrriRRMN13R9kKpS+8tMpa6
         FdcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767604474; x=1768209274;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=miCvpSGVqVVCNMF4tIx1RWrVqnyi6qhzDTvcjYnjzjQ=;
        b=pue6ubJHZvafIJL/TBtXm87gTaHdZ79tuYNspUkNjz6Ww2OekfK8+iMrO7Sx9OJc/w
         BHHJfZm2VEPqX9Flrd9ndkcH8Kb7YFs1cn0TL2s8TEx9f1ABi8halrQtePTcQuFfuO8S
         AoQCcKfvyW2Y+AyviZtWZr4APj/Arl9LHrC1Pf3A9VUeailZJVz6HnsBCGXi4VP/v3Bk
         ZEKQKptDMZa9xuA3x4cMZMD1FYgHYSAhpKEniW0WbR1ka+mD9pYkVdkOQnVbUOqIDcLz
         aQvU7DRkIpBXEkkPi4Va9qZNbup/38GiJSw+RzdZmflSev2ozljAPs5ypBA5ZCNFfG3F
         C+2w==
X-Forwarded-Encrypted: i=1; AJvYcCXBeECjQHK4aKuPXg/Rkw7Jg2IIXX5p88N9ga8u9O3lj1H0jdy2S2lIebHPTo61iMHw+2bj34oORqc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVAhU4yei6V47SXSpex63kFcvRjbHur+6hSjDgWKzdtSwzViO6
	DEc2Pqzwbx2aTL8uIKwogv4uAWB0nxXdWilfJmfRNrlr2BEb6vY/h8tIpmfF7K85ONU=
X-Gm-Gg: AY/fxX6/KSflmyTlWVa9TuByDnmQsyfBGKN+e+6LV9d19UEooVbtvLqR5sooKZhduMJ
	npDcKibrTYtGUig1uekcQMlu9yQLxLkYqav4xv9zrWCoCRqbs6bE7nekp4z1Kka1+6CIodI6qMa
	GAEcG/6Gq3CDqEG252dOxtORd6jahLzw0YCpHGlwepta1GrOt+FNxjS9hghdWjecnVok76zWc7J
	tW+jJtz0O0dYABWkmXjl8CsMM7NYQR/XR42QKDO8H6tSHMtfd65A6Yesr+gKw1SxTHLF+kST1w4
	VahtIxygSo05nkYv3YlsUeHpnVpCsAjDQCZ9oUhOzAQXsp6rp61gAHmawvgIcbN5ZLyUJNCVDLY
	rS1XGhlXoRebic8wiVV14vina5HMdoU1SOOKkVoM3/EGZm6dnw1gqp5YE0c/bW4Dxs7hcWjEonL
	+dKwnfIg6a
X-Google-Smtp-Source: AGHT+IHg/Mv8ok8g3lfkv+f6Gs1iCHZthZ9+dvCaKIuCn41ycCh3KmnkNqkRkT2jAbCijygn0KRwvA==
X-Received: by 2002:a05:600c:4704:b0:46f:a2ba:581f with SMTP id 5b1f17b1804b1-47d6ba8900dmr100501615e9.16.1767604474097;
        Mon, 05 Jan 2026 01:14:34 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:b336:bcf:8603:f6e1])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47d6d143f6asm147207955e9.6.2026.01.05.01.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 01:14:33 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>,
  Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Xianwei Zhao <xianwei.zhao@amlogic.com>,
  Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-kernel@vger.kernel.org,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 5/8] clk: amlogic: Add A5 clock peripherals
 controller driver
In-Reply-To: <425ebeb4-8001-4493-882b-dfee87ed82c8@amlogic.com> (Chuan Liu's
	message of "Tue, 23 Dec 2025 20:27:39 +0800")
References: <20251028-a5-clk-v4-0-e62ca0aae243@amlogic.com>
	<20251028-a5-clk-v4-5-e62ca0aae243@amlogic.com>
	<1jpl857e2w.fsf@starbuckisacylon.baylibre.com>
	<425ebeb4-8001-4493-882b-dfee87ed82c8@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 05 Jan 2026 10:14:31 +0100
Message-ID: <1jldice808.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On mar. 23 d=C3=A9c. 2025 at 20:27, Chuan Liu <chuan.liu@amlogic.com> wrote:

>>> +
>>> +#define A5_COMP_SEL_WITH_TAB(_name, _reg, _shift, _mask, _pdata, _tabl=
e) \
>> No, adjust your main macro.
>>=20
>
> Do you mean to unify this into a single macro here? Like this:
>
> #define A5_COMP_SEL(_name, _reg, _shift, _mask, _pdata, _table) \
>    MESON_COMP_SEL(a5_, _name, _reg, _shift, _mask, _pdata, _table, 0, 0)
>

Yes, possibly

--=20
Jerome
