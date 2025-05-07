Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D318228AAE9
	for <linux-clk@vger.kernel.org>; Wed,  7 May 2025 18:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746644222; cv=none; b=EbSbWegxhXOW+A8qCnExLNg3HU7T/+ZMO7akJ2bFD2wf6FMsighrLLKgdb2BeyGNrxqzLysCBigXNtel7+1ln0jKaKKE6OoDzSWCB5yhRKQyvxHQLlG5NqA5jGIUuE+TtD/CPbmGSuHBuU7QxM4aHoAZzj/dFdMO6SYld6fP2cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746644222; c=relaxed/simple;
	bh=pe3tyzUnuTHHV9wY+pcDILJl9icjd/4bGQ8VCrn/BHA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XPxeHmeG7fpC3huzFL/g/UN0QNzNcFcEJMsuWHdlxkKJJngJSgmoSIIyXmbzFgU5UNVXHdE49wNHvhJvwLDnZjxvA4HH3hZ64T7xwhzF9462XH+ZzT0zIcpm2HhDCVzXoIbrTjt8nqpxup63lS74rtneUqbU8C9pT/5cbtuGn5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=byBmq9J0; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="byBmq9J0"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7369ce5d323so261024b3a.1
        for <linux-clk@vger.kernel.org>; Wed, 07 May 2025 11:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1746644220; x=1747249020; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0D7Z3FNBB3xDX5RO0FZQrmLI3qnCJ7UO3XkdhJ32m+0=;
        b=byBmq9J0BMzGUW2oBf42qoORUcDgUlFE3wFaB8cqTPOUaKk2DtgfSZnUduQX+NxQXi
         JaZJpaTqPH+ePjESJDw/tC7aI4xmkXxR4pykLReKqndmUo3INRJfyHHRLO7ccJo7ksRp
         OgUqzkXnTg/tov4QyM1nisO1uvMUQVf/SMeB76Vp0R94DHmRp5kmXtpFxtRaJxLZHOVB
         IFTCFduzGAuDaLpeNJwD0LnKc6bt8cfWE7DDQuS3F8FmaPiHrP2UDQ3dAPSH+zKbIG33
         te9rj1aksaleiDWPAKY2Bn5ITFoFY8tGTIGLhvLpaiyb9AatvtPioMCy496dKXbVOfif
         jaHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746644220; x=1747249020;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0D7Z3FNBB3xDX5RO0FZQrmLI3qnCJ7UO3XkdhJ32m+0=;
        b=JXHBi8yIr38Mca38Gb17lMZ7G7R0/FL+hiMoycITEWIjZK7Rldu66iQzzaxkuOG5Vu
         IGAxE3Y7In5paeo6jbtYwGnPHQ9RCiZr8TFBHOt9oAix7zFLjE3hi695zFgcr1jAIDlZ
         IhMHWzeV5f/MdFwsBFNrowO4DTZQzYgnMvSby1QLCzaMjH4dQmxJim3n4nufW6QhkiQl
         81a/Q0ctewYMPx2DYgwMcoBA7Tk5ip4WpVVipl0zA9LSVJ9BCuiHdVKvWJxIzzoAWMOO
         /NHKuAknA1M0jIL6++HWU4kgo9YyeBZInzG13YmOMYcrXAQBgkFX3G7noiLqunIrB8A8
         wVgA==
X-Forwarded-Encrypted: i=1; AJvYcCVbtG6gNw4NG7gxy0U7Pq8unGPmXvZOJATc93b2H7od8kQzFSE9nrNmvOCamC66ns+efG1DGptWc1Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNBxpwc11uGWgsDoZ8KJTn8ldpd4HcfaL8sfQpLZ2WWXYjQMsv
	jB76RK6o5jRBGqfSNa1XWkKwRu4Y8ZlzajhmPp5oae+Kwjg3Yiek3CNwe6iBLIFs6GSrRSQfRg/
	r
X-Gm-Gg: ASbGnctDHPEftAexMyoMfjlvR60smw7ktgfRyOU841BK6DZXnhpTq6DmI5VIVHdRldW
	saUMG1jELxH0gznwGetLyB5xj2I0XmchBzauHHFTeMUnjK6Ys8Zn0Q9s6aTpcpDmM2X/pdVJC7L
	ozuV+c1NvjfMYtgwAmgjSrpxXD6f4w5BjB3kxHGY5CIL7/5juoOLsfBkiyoLltkr5Wfjy3XNsPl
	itr8A6EdrHyR9qGRzGoGqhx6IrvaQZT3Jv5s9oDq5rgH199slqEsMgat/qX+Id7xmXhpagPsITj
	4VMUyw6ZC3vX1YaZzltRHfQujfEnjBaYXx8Cf6rWo+0sV8Q=
X-Google-Smtp-Source: AGHT+IEdnDHavMVVsk2ZTJfyzX7ew+kWTOFVAkNqTxlCa/8qxYi15T/lhuGRhufPsi1FCD90sh72qQ==
X-Received: by 2002:a05:6a00:e0b:b0:736:32d2:aa93 with SMTP id d2e1a72fcca58-740a9a91092mr595573b3a.20.1746644220028;
        Wed, 07 May 2025 11:57:00 -0700 (PDT)
Received: from x1 (97-120-122-6.ptld.qwest.net. [97.120.122.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590a2735sm12068773b3a.176.2025.05.07.11.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 11:56:59 -0700 (PDT)
Date: Wed, 7 May 2025 11:56:57 -0700
From: Drew Fustini <drew@pdp7.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, Fu Wei <wefu@redhat.com>,
	Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Subject: [GIT PULL] clk: thead: Updates for v6.16
Message-ID: <aBus+Yc7kf/H2HE5@x1>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git@github.com:pdp7/linux.git tags/thead-clk-for-v6.16

for you to fetch changes up to 50d4b157fa96bfeb4f383d7dad80f8bdef0d1d2a:

  clk: thead: Add clock support for VO subsystem in T-HEAD TH1520 SoC (2025-05-07 10:09:28 -0700)

----------------------------------------------------------------
T-HEAD clock changes for v6.16

Add clock support for the Video Output (VO) subsystem in the T-HEAD
TH1520 SoC. This includes the device tree bindings for the VO clock
controller as well as extending the TH1520 clk driver to provide
clock functionality for the VO subsystem.

Signed-off-by: Drew Fustini <drew@pdp7.com>

----------------------------------------------------------------
Michal Wilczynski (2):
      dt-bindings: clock: thead: Add TH1520 VO clock controller
      clk: thead: Add clock support for VO subsystem in T-HEAD TH1520 SoC

 .../bindings/clock/thead,th1520-clk-ap.yaml        |  17 +-
 drivers/clk/thead/clk-th1520-ap.c                  | 196 ++++++++++++++++++---
 include/dt-bindings/clock/thead,th1520-clk-ap.h    |  34 ++++
 3 files changed, 216 insertions(+), 31 deletions(-)
