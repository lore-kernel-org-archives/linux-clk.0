Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0382D2C027C
	for <linux-clk@vger.kernel.org>; Thu,  9 Oct 2025 07:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759996767; cv=none; b=ENuejx8TeFVsKRhwjJu7fxsdJy3jCBKI2PvS658yMbN3yc7WA91yFtKltQyyTmQvXFcn7iJCbRY2xdezbnpeuLRwR0n1kWtjMcDVTI3vp70/iYfKF2vQ4vyzbUSDSS4BSCk8r+YU7/7wCFEQ8ZRStpNNbpLDl39eUbh8UgQnjBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759996767; c=relaxed/simple;
	bh=r+EYS8LJHH5JzPOJqQR2JJIXOzlbTKM/eKWn1ocsvTc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dLSu+BR85LYH/AyAJT/aNLeXCW9Jw67BA7pQVbcKH/SZfdcAKP/dV73twJ3ZAtQfPsTOfuusW9HHRCOE6wkI1YwBEFz0Mh0LcIAlBe+bbz+pTWI6DF/YhzzLl+cVBcPYAbswjEQXaokxoIf/APqAobIr5aBf3LGeGw9Y7UQnGCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=sVVYuFPc; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="sVVYuFPc"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3fa528f127fso518400f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 09 Oct 2025 00:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1759996763; x=1760601563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=utVwjhO8Z9nfTT7T332+x9pXtf82IVN0SHJivYwFQFM=;
        b=sVVYuFPculI/UNQcEflmywDrpyCbr8lR1xv5hBdmnW5WdOWjiY26tYe5wDDO4lN0qO
         95TQDUEpgOH/wDss3vfVlT7ZhXWxzmXU1rJ4WU457wtdc0PIux0+MljPtDCXlzvq/KBy
         hVpS8orG4uPjQ86ZDFn1wPmGgk+GgLJEyQNcHw3L9u/2ThmmVHMnqIqVfTFWjKTCYeNO
         ucrfeuFrluMR0rXg1uJnq4ssXXzwK52f2hYzZRYUlXMqUyr8O0b70xYKvZiAteCD/dMu
         X5NMdr+HSF0dE+HbP37L2rh++2QMraOwr23n/F23tnKBOwYCNQkgj/FoG32LuXybCHe6
         c56w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759996763; x=1760601563;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=utVwjhO8Z9nfTT7T332+x9pXtf82IVN0SHJivYwFQFM=;
        b=epVye1C/ukyBFDTfFYfBep9KnpdQuD5h1tTKx2Qv98welHXwOod5iByWwca8IyuY9F
         HHY/9JUgIKBh0TkeBk+VhDICs8JXOQgpi9/L30Vx/yX6lzFtVE4H8FejR2GPtiqGy5Ry
         SVPdv4+CocVw+miSWPU02YW61CBPo3NTLllbRI2Q1RQQRnRxcE9jNTHwhftfIrsACn57
         jFC1Jfp/Sys1kzr5QjJWECpJ+y1GKi3v3vAmdQ8OCuSzHbSves/64vjCq0BL+VEcGcnS
         Zwyrj1i8CZJtiNMD9ehBpylTJE+f+uEh2v++xlKNT+m/WpI83L/OBk+ucaze6f/P9khS
         NObQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGMp2U2m54BB3HBzEHNHWwKM14j8oHPD322SOYQ6rW6tq4dZYb9LPV9qrJwLU32xcnnoiarrr1Q58=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxno75IohbuS2a4ptil2EqkfTsmv/1YMRQa8icHYb5/88061Jj3
	zLn2oS+n1nD2QPjj1wzNFfO/KhUeerBncnujBankxYYlp/iV/uwgbkibW1iyG1AqptE=
X-Gm-Gg: ASbGncvZPp6Ce7ZJ1ThmOb0wcquv7iuB7GqL4xmxgtWSVhpfT1mmnrB2/ZScODNedKY
	RzQwEC/Dfqmz2Y9IhcZYAt1sqgDIZTAhAilrj+7ZGLY4tpj+UpmRuZU+aWKpa3WnmB3r6OFkfbi
	RV0CqgHUrp8bSqk0UDzLdX9trX/oCc7ajAoMi+jDJMTS65K9DJFawkcBN81a5S/aJVGffvw6AJz
	FK9rgHZv+KxPj4fZLH/zBf7ZtmL3JJc/KdvRmZOT4iV17J7BlIucDwgcn9sLKCI1mK4UCNUsB1a
	uLK0TgZ6GBdRQ2N/YqqUO7tX6Ani35y51DND6rB42BhIJ35u4n9ErJUcyMMNV7xVi9Dq2R5ekCY
	DVLAMpZffMxYy8qySmvIuoVUfHCMX1n+Qz0/vrbZQNTUhPOJpuHasAG2R
X-Google-Smtp-Source: AGHT+IG5pvNgDMJPTKAtRd4veVO0FFUkU2pJXXO+YNn1lCJbx4D7Y9oh8jCMqxVVxc+i8Y4GbC2AVA==
X-Received: by 2002:a05:6000:2c02:b0:401:ae97:a1ab with SMTP id ffacd0b85a97d-42666aa67f9mr4871037f8f.10.1759996763143;
        Thu, 09 Oct 2025 00:59:23 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1753:6135:be55:f8ab])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4255d8ab8fdsm32990864f8f.15.2025.10.09.00.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 00:59:22 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>,
  Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-kernel@vger.kernel.org,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  Xianwei Zhao
 <xianwei.zhao@amlogic.com>
Subject: Re: [PATCH 00/19] clk: amlogic: Add PLLs and peripheral clocks for
 A4 and A5 SoCs
In-Reply-To: <b8105d25-112c-4406-9f3a-8fbbd0754b26@amlogic.com> (Chuan Liu's
	message of "Thu, 9 Oct 2025 11:09:25 +0800")
References: <20250930-a4_a5_add_clock_driver-v1-0-a9acf7951589@amlogic.com>
	<1jv7kz3w1p.fsf@starbuckisacylon.baylibre.com>
	<b8105d25-112c-4406-9f3a-8fbbd0754b26@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 09 Oct 2025 09:59:22 +0200
Message-ID: <1jh5w84iat.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu 09 Oct 2025 at 11:09, Chuan Liu <chuan.liu@amlogic.com> wrote:

> Hi Jerome,
>
> =C2=A0 =C2=A0 Thanks for your review, because the national day holidays d=
id not
> timely feedback.
>
>
> On 10/1/2025 3:45 PM, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On Tue 30 Sep 2025 at 17:37, Chuan Liu via B4 Relay
>> <devnull+chuan.liu.amlogic.com@kernel.org> wrote:
>>
>>> This patch series includes changes related to the PLL and peripheral
>>> clocks for both the A4 and A5 SoCs.
>>>
>>> The patches for A5 were previously submitted up to V3 by Xianwei.
>>> https://lore.kernel.org/all/20250103-a5-clk-v3-0-a207ce83b9e9@amlogic.c=
om/
>>> After friendly coordination, I=E2=80=99ve taken over and continued the
>>> submission as part of this series. The dt-bindings patch retains Rob's
>>> original "Reviewed-by" tag, and I hope this hasn=E2=80=99t caused any
>>> additional confusion.
>> ... and yet you restart the versioning of the series making it harder
>> for people to follow that
>
>
> Sorry for the inconvenience caused. The main changes compared to the
> previous version by Xianwei are in the driver part.
>
> The dt-bindings part only has minor modifications in [PATCH 14/19].
>
> The driver part has relatively larger changes because it needs to be
> based on the code base you previously submitted.

I'm not seeing a justification for the mess introduced and I'm not
looking for one to be honest

>
>>> Both A4 and A5 belong to the Audio series. Judging by their names, one
>>> might assume that A5 is an upgrade to A4, but in fact, A5 was released
>>> a year earlier than A4.
>>>
>>> Since there are differences in the PLLs and peripheral clocks between
>>> the A4 and A5 SoCs (especially the PLL), and taking into account factors
>>> such as memory footprint and maintainability, this series does not
>>> attempt to merge the two into a shared driver as was done for
>>> G12A/G12B/SM1.
>> ... and we end up with 19 patches series while it could be splitted into
>> manageable series, for each controller of each SoC
>
>
> I'm not sure if I understood you correctly.
>
> Do you mean that I should split this series of 19 patches into multiple
> patch series and send them separately? For example:
> serie 1: A4 SCMI clock controller (dt-bindings)
> serie 2: A4 PLL clock controller (dt-bindings, driver, dts)
> serie 3: A4 peripherals clock controller (dt-bindings, driver, dts)
> ... A5 similarly?

Things that do not actually depends on each other or which are not
merged through the same tree should not be sent together. There is
nothing new here. Same basic reminders on each submission.

>
>
>>> This patch series includes all related dt-bindings, driver, and dts
>>> changes for the PLLs and peripheral clocks. Following our past conventi=
on
>>> for clock-related submissions, the dts changes are placed at the end
>>> and submitted separately. If this ordering makes it harder for
>>> maintainers to review or pick patches, please feel free to point it out.
>>>
>>> Co-developed-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
>>> ---
>>> Chuan Liu (19):
>>>        dt-bindings: clock: Add Amlogic A4 SCMI clock controller
>>>        dt-bindings: clock: Add Amlogic A4 PLL clock controller
>>>        dt-bindings: clock: Add Amlogic A4 peripherals clock controller
>>>        clk: amlogic: Optimize PLL enable timing
>>>        clk: amlogic: Correct l_detect bit control
>>>        clk: amlogic: Fix out-of-range PLL frequency setting
>>>        clk: amlogic: Add A4 PLL clock controller driver
>>>        clk: amlogic: Add A4 clock peripherals controller driver
>>>        arm64: dts: amlogic: A4: Add scmi-clk node
>>>        arm64: dts: amlogic: A4: Add PLL controller node
>>>        arm64: dts: amlogic: A4: Add peripherals clock controller node
>>>        dt-bindings: clock: Add Amlogic A5 SCMI clock controller support
>>>        dt-bindings: clock: Add Amlogic A5 PLL clock controller
>>>        dt-bindings: clock: Add Amlogic A5 peripherals clock controller
>>>        clk: amlogic: Add A5 PLL clock controller driver
>>>        clk: amlogic: Add A5 clock peripherals controller driver
>>>        arm64: dts: amlogic: A5: Add scmi-clk node
>>>        arm64: dts: amlogic: A5: Add PLL controller node
>>>        arm64: dts: amlogic: A5: Add peripheral clock controller node
>>>
>>>   .../clock/amlogic,a4-peripherals-clkc.yaml         | 122 +++
>>>   .../bindings/clock/amlogic,a4-pll-clkc.yaml        |  61 ++
>>>   .../clock/amlogic,a5-peripherals-clkc.yaml         | 134 ++++
>>>   .../bindings/clock/amlogic,a5-pll-clkc.yaml        |  63 ++
>>>   arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |  80 ++
>>>   arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        |  87 ++
>>>   drivers/clk/meson/Kconfig                          |  53 ++
>>>   drivers/clk/meson/Makefile                         |   4 +
>>>   drivers/clk/meson/a1-pll.c                         |   1 +
>>>   drivers/clk/meson/a4-peripherals.c                 | 764 ++++++++++++=
++++++
>>>   drivers/clk/meson/a4-pll.c                         | 242 ++++++
>>>   drivers/clk/meson/a5-peripherals.c                 | 883 ++++++++++++=
+++++++++
>>>   drivers/clk/meson/a5-pll.c                         | 476 +++++++++++
>>>   drivers/clk/meson/clk-pll.c                        |  76 +-
>>>   drivers/clk/meson/clk-pll.h                        |   2 +
>>>   .../clock/amlogic,a4-peripherals-clkc.h            | 129 +++
>>>   include/dt-bindings/clock/amlogic,a4-pll-clkc.h    |  15 +
>>>   include/dt-bindings/clock/amlogic,a4-scmi-clkc.h   |  42 +
>>>   .../clock/amlogic,a5-peripherals-clkc.h            | 132 +++
>>>   include/dt-bindings/clock/amlogic,a5-pll-clkc.h    |  24 +
>>>   include/dt-bindings/clock/amlogic,a5-scmi-clkc.h   |  44 +
>>>   21 files changed, 3406 insertions(+), 28 deletions(-)
>>> ---
>>> base-commit: 01f3a6d1d59b8e25a6de243b0d73075cf0415eaf
>>> change-id: 20250928-a4_a5_add_clock_driver-2b7c9d695633
>>>
>>> Best regards,
>> --
>> Jerome

--=20
Jerome
