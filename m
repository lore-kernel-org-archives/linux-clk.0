Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D533BBC5;
	Thu, 16 Jan 2025 14:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737036191; cv=none; b=UrzZuY30DOsP2McaUmCMYHVOUYcZjEMczuyxzeXzyCrkeF03m4jSve2YdP6ZHxDj5QwaSh4sXlg22hvMdOxLRpqvskJUVfc0HqgX+X2obka9l1TIHQ+1blHr6V3AMfA0icYPcjI+d6sKJHyp2l+PFAGSpgopskq6d0piigeJlR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737036191; c=relaxed/simple;
	bh=jXH7ru4LdSjhMnJ/LbXjf50HqamAlIUd+3r1M9E9KAQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kZox6DFnR2LuyXbK+xnFh9gHYsvCZbB/F/vTio0sjf8t/2f+9YCgVjJ+oRzHHDmGearKF89rjqkncafM09F710SRzKaVCrlvJDn1d6ltgi9mY9YKyEDnxswACxT54Ml6VHBBtlSDrJzL3SeXKgRmzD6ZgBDUebB7RCxfoN+PEjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UUJT3pay; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UUJT3pay"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d3bdccba49so1652722a12.1;
        Thu, 16 Jan 2025 06:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737036188; x=1737640988; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ts0zOL1kfPYuS6zomJ9otxY90fzQ/wFMmbamI+iWdgk=;
        b=UUJT3paykD694bXhZmUagEAqsRkSvYzRPAVsjpFguXMClLj6EOJX37pottWYnin345
         cVXq6b2D/Nl/CQ58umWUf1LktgBL266joBfyd256v7lrWdpK21NHCIOna2HbBUU3Wlzv
         p00FOqUHB2LiqoYMVXhh7QnEixFxRbVaHaWsPmH1PQzxILsp2NLi+NlWoLWUSd09j+SU
         kQgo7IsHfG+1sfT3LKAnf+kt1RrhwW2bUxkR6eyVd/sH1Due54SOcwNnMyqB9GmS4hHa
         mP+DPXldYer6hI1aCOpwiElbp/4wL+KhPFhDFsnjy1yvPQGlnALZ4ikPuCrX2CBSzumu
         6Q6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737036188; x=1737640988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ts0zOL1kfPYuS6zomJ9otxY90fzQ/wFMmbamI+iWdgk=;
        b=dLSAgmSPUZhgBZqDNCu23mgEkhHQ0h31kYF+SvMGWuWNH5Jsv9Y89svnPa2so6NtQ6
         +se9kp7Owhdh6tENrqLH3P+tOehGskQvBgomzkDvDuKXCr4aFbX+dOkhD8GCoXcAHel9
         jcTQkyq1kVhnh2ELM3hgTBCz2+2io4WxxNaVQYHkyUe4h5grvew9AUYYbSPmZQHdSbbi
         mamtoQ6RDLvVCs5ul0vpG69/Ela1x8bsXE+NJZd17oEijeggYN987XJfmKnNaDwmSd+s
         Ing2E1ZxVPgmF4i2l1AT4Tk6FhYtP6p4mm4ClE6WbN1Sd+oJd04HT1ZQyi6bvE9IcwHt
         dEUw==
X-Forwarded-Encrypted: i=1; AJvYcCU2mi98RvNiO1JlLbT8cy7kp5BxtboWEX1SBaYyU7VMQF0VUW32zgRDeYRHlT5QvfD1k0nF1vdNksKhuTSu@vger.kernel.org, AJvYcCV6Ol4465mjww8Vxx45/uFJNRHjNZa0PCCAa50rLHxuByMQAclY4PIxzl8XJTFUyvLK/KcwmIp1sxjl@vger.kernel.org, AJvYcCWCWtYS6yQ2HrEr5zEjlKh/rWiBmAWta+9y/KwdNBzLwYqNbMmk3sVDLr2zkZzvqJD6xhRki+ZKuqOD@vger.kernel.org
X-Gm-Message-State: AOJu0YyAwT5VacBaLnbFboGUM6aHUCg0+xtW4AB6fMhoD4rayjCjO5T4
	twBbvoRIXxYhlgY5f/IynT8o07URI9jyVAZUcUIqUqbx4rl8oYHeGIrDcLMi5MBjxBTj4+qX2Mm
	bLdjwQVwkULoKSnTwnSY6USY5cQ0=
X-Gm-Gg: ASbGnctuvqHE9Y0xSHYptZkcWE8e8uruBF+gi6D7ttzEhplD5GASXfDeVFSqcAdjPXX
	+VgaeE9g9kwKx4rJpEaUbYu5ylvBhxFEnfUhoeR8=
X-Google-Smtp-Source: AGHT+IEFBH5rdDRzxNwKshRgTNAcDQcukVnz1qk9b2CQwOqVLB74sIBmizfzmVBpnEI/k3+EDMO9YL89iWmnCUbKvA4=
X-Received: by 2002:a05:6402:3483:b0:5db:67a7:e742 with SMTP id
 4fb4d7f45d1cf-5db67a7ec89mr597372a12.8.1737036187661; Thu, 16 Jan 2025
 06:03:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250115012628.1035928-1-pgwipeout@gmail.com> <2EEA8028-8E4A-4588-A480-E5FF0F7BE82E@gmail.com>
 <CAMdYzYo2W1hLgiH697AdRSUbhBU4rU2uB=N6EMWMD2-0R+VLBA@mail.gmail.com>
 <B1C9DA16-F285-4AD0-AE4E-AF1A5CA20932@gmail.com> <CAMdYzYrxX=RsSZja-3+zLZUSpyLoRz8Zm0w0hTfL3RQ9cjqgOw@mail.gmail.com>
 <3536B507-8658-4377-A1AC-2C5D9093BDEB@gmail.com>
In-Reply-To: <3536B507-8658-4377-A1AC-2C5D9093BDEB@gmail.com>
From: Peter Geis <pgwipeout@gmail.com>
Date: Thu, 16 Jan 2025 09:02:54 -0500
X-Gm-Features: AbW1kvZDgqM8jfgzDVevxYgT39_hbUcQ7lTpjdvs9pBBkN8iloIKzhGnQ2-7CDI
Message-ID: <CAMdYzYoCj9FsyHdTQAOV4DFpD7OdMDaJ0R=BBxXG-SLguy512Q@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/6] rockchip: add a functional usb3 phy driver for rk3328
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
	Michael Turquette <mturquette@baylibre.com>, kever.yang@rock-chips.com, 
	linux-phy@lists.infradead.org, wulf@rock-chips.com, zyw@rock-chips.com, 
	Dragan Simic <dsimic@manjaro.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, linux-clk@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Arnd Bergmann <arnd@arndb.de>, Jonas Karlman <jonas@kwiboo.se>, frank.wang@rock-chips.com, 
	Elaine Zhang <zhangqing@rock-chips.com>, Alex Bee <knaerzche@gmail.com>, 
	william.wu@rock-chips.com, Zhang Yubing <yubing.zhang@rock-chips.com>, 
	Johan Jonker <jbx6244@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	Trevor Woerner <twoerner@gmail.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, 
	Vinod Koul <vkoul@kernel.org>, FUKAUMI Naoki <naoki@radxa.com>, 
	Diederik de Haas <didi.debian@cknow.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 8:25=E2=80=AFAM Piotr Oniszczuk
<piotr.oniszczuk@gmail.com> wrote:
>
>
>
> > Wiadomo=C5=9B=C4=87 napisana przez Peter Geis <pgwipeout@gmail.com> w d=
niu 15 sty 2025, o godz. 14:15:
> >
> >>
> >>
> >> pls find:
> >>
> >> dtsi: https://gist.github.com/warpme/6af9e2778fb06bfb47b64f98fe79d678
> >> and dt: https://gist.github.com/warpme/79340c54c87b2b1e52f2a146461d8c9=
f
> >>
> >>
> >> and compiled .dtb
> >
> > It all looks good.
> > Do you have any CRU errors in the boot log?
> > Can you check for the presence of clk_ref_usb3otg in
> > /sys/kernel/debug/clk/clk_summary?
> >
> >>
>
> cru errors in dmesg - seems no any.
> here is my dmesg: https://gist.github.com/warpme/ecf38482cc88fb68471355d0=
11ecf974
>
> For clk_ref_usb3otg i=E2=80=99m getting following:
>
> root@myth-frontend-e67a8de4c815:~ # cat /sys/kernel/debug/clk/clk_summary=
 | grep usb3
>     clk_usb3otg_suspend              0       0        0        30770     =
  0          0     50000      N      deviceless                      no_con=
nection_id
>     clk_usb3otg_ref                  0       0        0        24000000  =
  0          0     50000      N      deviceless                      no_con=
nection_id
>     clk_ref_usb3otg                  0       0        0        24000000  =
  0          0     50000      Y      deviceless                      no_con=
nection_id
>                    pclk_usb3_grf     0       0        0        75000000  =
  0          0     50000      Y                     deviceless             =
         no_connection_id
>                    pclk_usb3phy_pipe 0       0        0        75000000  =
  0          0     50000      N                     deviceless             =
         no_connection_id
>                    pclk_usb3phy_otg  0       0        0        75000000  =
  0          0     50000      N                     deviceless             =
         no_connection_id
>           clk_ref_usb3otg_src        0       0        0        37500000  =
  0          0     50000      N            deviceless                      =
no_connection_id
>                    aclk_usb3otg      0       0        0        150000000 =
  0          0     50000      N                     deviceless             =
         no_connection_id
>

I'm at a loss here, I applied the patches to a clean 6.9 tree and even
built it as a module (thank you for the sentinel). I have no issues.
I'm wondering if it's your .config or something about your bootloader.

>
