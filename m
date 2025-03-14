Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C301EEA5D
	for <linux-clk@vger.kernel.org>; Fri, 14 Mar 2025 15:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741966727; cv=none; b=RcpNBYyNKoBztb8howNrtV8j90oDjzx8V9MfkxapXokxzGzOKEbOdudHkw1m3IqhHGB3C5l6zT0bgXjMz22nqsaScpLZjlnGf9UMzwcnXHjGJZkRRwMhzDsRtuzEBehTrl7Qw0yXWFj9hdcKhKje3wqYpl/yZhefyXrxJ40ZHks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741966727; c=relaxed/simple;
	bh=J57tj/cDWLId170pjei4tUE61GDP7cC4qMW3K1X4H2A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iTHUXrEt4+9Pz/yjdUnby89LVpj5SsMRMQMF0EofhuBaEC9O6VY/7fzKYp9V6997pquZXyyy8rTnwwR9MymPnG1klpYsCz8VAJlAzgcw+Dbje1KyFaGZTQMJdILQ3QrcX4l1sbc+yOogZiZRR+6kaUMpXQcE6M4IAAdM+Ua08u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=j6fPh/pF; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="j6fPh/pF"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso15286875e9.0
        for <linux-clk@vger.kernel.org>; Fri, 14 Mar 2025 08:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1741966722; x=1742571522; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LeEMYqbmicsul3qU4d5IDEMo6LV7yC33fMjpXDjlS2s=;
        b=j6fPh/pFE9XYaegmiOY/BSUooeFN7vMEm9LRGTzXv63CjIb2G3fk5eTfciBpeNcvGI
         Hgp/yN1yvVDho6zQGK5wIdnblxilOgDb61yARfz4KtdyWOmxoYUzEYoKXzDQaoLUErw6
         zVtKC9vKo0GdTQjmrVDbGT/zULZm5N8BB0gVVb8RFXusTI2UI6We56DLlXwykjyh8yz3
         qIufRYYb8pg+VxU6Jj8+5tMWR00Sgdk+y7dzk0luybxC4wy2NeXDHVmjF47OyN7WymyQ
         vlKdCeyMma3t2l7v9BtADLii6T5L+BI6Ep1pEkT0N2qwkB0ex0mn9F27tvWJhGs/XyFo
         ad1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741966722; x=1742571522;
        h=mime-version:message-id:date:user-agent:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LeEMYqbmicsul3qU4d5IDEMo6LV7yC33fMjpXDjlS2s=;
        b=gQBsrHJNITvW12rq4fzx58Ha2Y52R1RlUL3mmbB8Re01XXEn7ASXvkKN1YGjXBcF9s
         z7+utQyUJ4oh+tVBSH2M+52y7eaFLcImiUv6b+k0cyzS0bB/YhR0VrRLesqCGdlYj+77
         6sfbecYrwQd5fVFqosSAATrCfjDInxzjvTvKlymzj1dzVj7zCjc74o7NpAC519PCXMDF
         GaLIDEjAWPSbN4zJ2Oll7+4SOOIDq7329OFfsUnITvuiML0/me/OHgGy5czX9yBMa6BK
         0rAKaz7/4wm7xViTaWWNp9jA5sOQKZmeV6zxkF/rsBs3FWZSIg2vG8Hf0cbBV8WZiTpw
         erbw==
X-Forwarded-Encrypted: i=1; AJvYcCXQh5uwRvuE1QMi0tpU6hPLiY+sOhaOLCK0W5+KgPMkPfNegNYF+cxrCHHJqa6dL1iNhr4K7NBEO/8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7mVIlHYl3pkUDmwj0L6mJb1CyPndoiipHeJ4q5GbtkJ99o2n6
	GWmb4U7JOiyW3wl+8fp3XKVR3CBy+hlp9teandern2P9s/SrEiYvaflGO8/IGGk=
X-Gm-Gg: ASbGncvVoXxyrVXyK/ZL0oJxj35yQ5MRAPPjDLkayxHc5syqMLJpWfKEOgX3Gg7pIks
	qz0wgNtAychzKSEejQ0rQD1nrgdIR0puJM5RkXa51sZXYm8+gBXpskmJq4W+LjFGm3hS0B+X7jf
	bViflYl4WjmyBHUiSfQHNUwZD15n3YSYQdgbbdOo1uY1arEhpAmxvAR6201Xh5IW4sog8GvM/eG
	7g21L5XPyYpzQEWmfD4zY8G9tsI4p+oF0OcE7/gG9fRRYYvqmXtYrhT/1P6ev5i3xSbJ35EG1XT
	jw6v66hNpK4kAQfyOkpW+PbqqTGjcuEdr0efZmCJMVShvmuAAfW4Xnk=
X-Google-Smtp-Source: AGHT+IGnOW2YjUm1Rmj4hdNqilcrYnIrbU1aqNglsvX+Xgv5Pf5f5UvgVexK6+9yLyoYvtOwNplwUA==
X-Received: by 2002:a05:600c:4f87:b0:43b:c6a7:ac60 with SMTP id 5b1f17b1804b1-43d1f235e45mr39117645e9.10.1741966721718;
        Fri, 14 Mar 2025 08:38:41 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:6eea:2dc0:eafb:9b35])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d1ffc3e72sm20529385e9.18.2025.03.14.08.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 08:38:41 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: 'Stephen Boyd' <sboyd@kernel.org>
Cc: 'Neil Armstrong' <neil.armstrong@linaro.org>, 'Kevin Hilman'
 <khilman@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>
Subject: [GIT PULL]: clk: meson: amlogic clock updates for v6.15
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Fri, 14 Mar 2025 16:38:39 +0100
Message-ID: <1jr02z39mo.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Hi Stephen,

Here are the Amlogic clock changes for v6.15.
Nothing out of ordinary this time around, just a few fixups.

Please pull.
Cheers

Jerome

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.15-1

for you to fetch changes up to b3c221e752c4e46fd86d6e15153fa8c38bc3f250:

  clk: amlogic: a1: fix a typo (2025-03-14 16:20:23 +0100)

----------------------------------------------------------------
Amlogic clock changes for v6.15

* fix mmc A clock gate definition on g12 SoCs
* proprely set cpu cluster A on g12b
* fix 32k clock definition on gxbb
* correct documentation typo on a1

----------------------------------------------------------------
Jerome Brunet (4):
      clk: amlogic: g12a: fix mmc A peripheral clock
      clk: amlogic: g12b: fix cluster A parent data
      clk: amlogic: gxbb: drop incorrect flag on 32k clock
      clk: amlogic: gxbb: drop non existing 32k clock parent

Jian Hu (1):
      clk: amlogic: a1: fix a typo

 drivers/clk/meson/a1-pll.c |  2 +-
 drivers/clk/meson/g12a.c   | 38 +++++++++++++++++++++++++-------------
 drivers/clk/meson/gxbb.c   | 14 +++++++-------
 3 files changed, 33 insertions(+), 21 deletions(-)

