Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F40533A9EB
	for <linux-clk@vger.kernel.org>; Fri, 29 May 2026 13:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780062711; cv=none; b=W8+7JJwcLps7we+G3OYktf8n7c06JotqroUTlpALUQBg6B1EWD3iFaOFl/r1zDxu3yBmdunT+T/577FL0nqqQas7QAqwB4A0LjVgyUisuspo5/t1FdwTz3uJnmgFRVlYMR7itxo/q1DvtJqdOi6sbcHyc+y7dhTdEHnWdq01f9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780062711; c=relaxed/simple;
	bh=G2tkJbu/R13+hoX5JnfM2WwZtQTEofsYLJF43SozZRo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OGijiYZ4zIgBxONBaSNeHqkJgmyU5p8Om/6Hk7hu1Rp+Nu7nDSJt8CAi6eLNV5KswyMcQNVUDjpmeCUpKhypcbx7ni12yhe9JscX6or8wVtTzlZxRsw+S4l/L9H+h+/AKrJdFpa1o/Iff1ifLjx4N1y5bNTpzfxss12mZJkl69c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=X5AG7qGy; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="X5AG7qGy"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso90203245e9.1
        for <linux-clk@vger.kernel.org>; Fri, 29 May 2026 06:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780062707; x=1780667507; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aYIwFhBI2N6gKbEPX+JrvkgFgN0qr5qebRCw1iE5Tt0=;
        b=X5AG7qGyTthPo9SiZHFEMNh3WiNnrnv64OksKb0323uCQDg42yJNPfObc5NvfpkXIW
         pAU0plmFVBVoRinkxvBgC+3pvtYkiwBB+18YfAl5xUGNRPqRZHVxJ3M9R1YR2zYuu5wn
         SJWxGEVgqQXE6RvGjKSwHISJwdC2ojbKQ/IAi6INh9AQbmnus8uSZjJXtJ3nIEMnYedP
         PaSHlATd8B/lkuyFEK/6u8y+IYnZC6xKTabb6b/hfjURGX+DKg3eJGlXUHyQoV/JFByF
         Fi4brp1/P0gctRhXD3aPp86FIqyGOXbqEaKS6DbFbu5oed1X2ve5yBbi2WESNUdlFNc2
         F59w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780062707; x=1780667507;
        h=mime-version:message-id:date:user-agent:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aYIwFhBI2N6gKbEPX+JrvkgFgN0qr5qebRCw1iE5Tt0=;
        b=TuhvEfd/lcRk7AjCymUYXjyB85zIbFRoKN3KAv5NMZm1yfILrSci3jhMtEXVlI3fqp
         tHnigUawigs+fm5n0Ghy4pmLMJB8+uvFaEzPkqnaFx2K9zvG6AEP652STPw/Qen4j9eu
         iHJKENkQRHmbtlEG2pxyj8SIVQJtZD6OBfOrU1OOfRK6B5Nm9tWn9aogpT41/9C2WDOj
         WBB50kYYT3M9ZGDGBuYkBpsNVsZDAQzCZLmMmQ+MePi4FX1XnNelzaYMOILEb/LSogCU
         oZhofEyER2kpsU3Fglnz2xYng6WdarDupUCVoJuNS9GGJd5N2HQqRXZ0JZCQGU21J1ki
         6imA==
X-Gm-Message-State: AOJu0YwtV1DeglBmBt/KNEuBYeqzdds0PM1Ie8ivHqRbHTldId0q1QRn
	+I56epekDTMzSbLNdTyh4IRNIQKTCp0PqfMRDD+WMOqK9A6zYC2Hw3+pS60SinUmWnnSPjMhv02
	xm2/6
X-Gm-Gg: Acq92OHnuyDyYdc2yDz5yyvsXPLJJHUtq32iwzAG9hd8EZv1ImvzG8C5HgRd5as7jHr
	oQBHa9ekV+N2ErwL6wrngUyPwct4Zpu0IUSaej+Gr5LIDsCNvGTTfHQ78UZJWBXmOEfsI2nzvru
	DrkbWEDuKKK1EsyOHMMa09ufgH/dOUwej8V/LmqCWxftTmPyXrfeOSAk/YLbVV/EQRKPXAnZjI4
	SxJG5paJfWH5MYqpj1HpTroLwSvy5R/bLZDsEovdzUq8XPVwfUao/PAgxpHSqpPkFRxIbfgAluq
	oyWx2VZpyLO0JnmvmjIAT910hl61wDnjGZwQCtLYHO6BRR/xa40DLWj9KQ96pUJzMPcD2t7jMO9
	9JkWvrsyDYu2g5CvFvip4ZjwurOF6pkIboQNpIzVgrLh1F8AHdI6l/uSYtAsDzlrnaRoRXv9cHu
	jB9WqDAnJogXPLrD/vNWUM1ntMkBIIuNWi
X-Received: by 2002:a05:600c:4a11:b0:489:e696:8362 with SMTP id 5b1f17b1804b1-4909c08b0bfmr32628635e9.13.1780062707516;
        Fri, 29 May 2026 06:51:47 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:79fe:7869:93f0:a6ea])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4909d68b853sm43813175e9.3.2026.05.29.06.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 06:51:46 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk <linux-clk@vger.kernel.org>, linux-amlogic
 <linux-amlogic@lists.infradead.org>
Subject: [GIT PULL] clk: meson: Amlogic clock changes for v7.2
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 29 May 2026 15:51:45 +0200
Message-ID: <1j1peu5nny.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Hi Stephen,

Here are the Amlogic clock changes for v7.2.
There is just a couple of minor DT bindings fixups. Nothing major.

Please Pull.

Cheers
Jerome

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://github.com/BayLibre/clk-meson.git tags/clk-meson-v7.2-1

for you to fetch changes up to ca89c88bcf69daca829044c638a8163d5ce47af0:

  dt-bindings: clock: amlogic: t7: Add missing mpll3 parent clock (2026-04-28 10:42:47 +0200)

----------------------------------------------------------------
Amlogic clock changes for v7.2

* Minor DT bindings fixes for the T7 clock controllers

----------------------------------------------------------------
Jian Hu (2):
      dt-bindings: clock: amlogic: Fix redundant hyphen in "amlogic,t7-gp1--pll" string.
      dt-bindings: clock: amlogic: t7: Add missing mpll3 parent clock

 .../bindings/clock/amlogic,t7-peripherals-clkc.yaml          | 12 ++++++++----
 .../devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml       |  2 +-
 2 files changed, 9 insertions(+), 5 deletions(-)
