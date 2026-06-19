Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B7635838F
	for <linux-clk@vger.kernel.org>; Fri, 19 Jun 2026 08:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781856542; cv=none; b=T87hxRmTeUHc5PHEZPLJNz0VVnryGsdTyiBkxwBcdsmePZYDiA+YAfppZIYBlvog8iGlBPP6y1xNAhgWUjpNA2EFzsZo0w6/f9wJc80/aZs5xJSE22/RTReKti+oRwq+81BtZ85jzVm86kH4ja4KRM0jcI0NrTdcf7OjZ+G+fhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781856542; c=relaxed/simple;
	bh=Q8PmtqTflgVoZpw6WgtVxNsuet2v+T19+3e0QsGeEes=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=l4wxnpLJ/ljz8/VU9b+nnmLN1ti9U+ynaTvWmiSkO5IRiWz29drEcs16XhM+cA1FXk0OO6NH+dgjeljuU3TjaER4patu7ieVdEike9p09dxyqv9vGdZFOPdDDbR37m46/vGDU8ra0Sr4mDVxPco99EX80aF90O9iy05prLbiZt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=GlkfFiYS; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="GlkfFiYS"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-46066e640easo1112257f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 19 Jun 2026 01:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781856539; x=1782461339; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I3WNaVa6u6+Nzfb3NV3ypwCQ74H2NIZsFLsn4sFU7yo=;
        b=GlkfFiYSXy9uL2i9jTllv5WhkYSQs7xucxFgq/ah4ps9ZjZrk7zBTVKd61rJm4AC5b
         ox2EgPc11GPCxZ5EfSK/0sPxPnzlCREWNfp1Ynr72c2n0apZqoKMhkxEe/obVUGdDoCw
         tKGDKu5sI9x+PdFcQOP+8rTnrCVFsYCwKQNW0IqFmxK4JlCMGTWFyoli3LNblJMTVmg5
         2dTCljvTmicvRtJmgw4R13SMaRbntevBsKdkWVBH8Mg3PZ4Viq5FjIgRgsPScrBA3aod
         LD+BeLa2F/hL7KhgscpRquuUgelW+NDooSuPD63GS90+fKCxuGZ10NyprYMpZZpWmIfU
         4q3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781856539; x=1782461339;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I3WNaVa6u6+Nzfb3NV3ypwCQ74H2NIZsFLsn4sFU7yo=;
        b=cZC1v1gNqiWqh/TW5Esk9yjrB2noMyVsyVfyuISqZWo6JoIa3su+gpndkL4VXgoi1g
         w4X7/drykKfRY5tUy/L7wgZaf4BplUIbyLnZcYT6AqAF5mz/uG8EmsuREEmM0603mbUU
         X2LRTjLbm43gY7pxoy2q7ikDYPwGMsFwi7GtZ0hmGNSflWpeb5/K5c1pmTAsWOvf+1Ge
         MEBMiFM0TjuMJ0lKZJh46HNHt2DLxpWAwSfvnUCj1DZJSLxGCFIQlrh2NK47p3X+rUuh
         FUdV+ZZIGec6YAxI96l8QmdOQj6UK/UuLuWMiJjRpobmLbnW0NP/rhw+YDFkcu53/TRG
         iUbg==
X-Forwarded-Encrypted: i=1; AFNElJ/Rie+12DPMCCPcFgTFRzJkjNJLadoJSDW3AchAtttkvMnwofnedCJWTiMlUcenml5GQkaHXnqk5TU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmO7vWCrKxCex5lsiUZQUHSmQKLaUBy48iFtRLsC/CjVbPrQTN
	itdAD3s+KZmCUgjE1BVO1TIr/Gl621r7zMOCeYHhkTzcMhyEbA3rxGKtos+S1sVuKDU=
X-Gm-Gg: AfdE7cnbEU4Dfl4jlyXlEcLhPgVlccRZnoDTmlu+6nCdQwhqfeNIBRauLGxc766/NWg
	YutaB01UWDSSOuK+15imeuAQgf0xvQ2Dq+Sk3lA9r/1SRZ201ZsQfUmVhq/f6jv/klScc+56EGk
	Qko8eXKk+yLXpOZkOCOpVoKrkGKesrZiJyZy1/gs8iainT1nIlPkZ333v89/sCFvqECe99HcXE9
	KEfNOwjbc+ZdkzGJNcUbyL01nxPCDdHls9rMJESePXdzJIub1ZWQz0pUXl1ZIliOU+XPxwWdQ5S
	Ibix7BJ5oG1lVexuWYPlyHNT7VDL4fW+HP8XhW+D0ZNdhdvp0fEWA0uQEEiNxmnb49JVpSiLAGW
	oV4NTLhOieYo8Ga0RM9IZta++kdx0iwCkIr700YvyejwA3yQhA2hKWuorxD6740c2wVhGrlBlpV
	hAeC9K8XF2W6yA+UOc21Im7A==
X-Received: by 2002:a5d:5342:0:b0:461:946f:9bb4 with SMTP id ffacd0b85a97d-465097867ddmr3541283f8f.23.1781856538850;
        Fri, 19 Jun 2026 01:08:58 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:95ed:eac1:5731:4e21])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4650b67a33csm5299452f8f.17.2026.06.19.01.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 01:08:58 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Julian Braha <julianbraha@gmail.com>
Cc: jian.hu@amlogic.com,  Neil Armstrong <neil.armstrong@linaro.org>,
  Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Xianwei Zhao
 <xianwei.zhao@amlogic.com>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/2] clk: amlogic: Add A9 AO clock controller driver
In-Reply-To: <5af78bca-7c49-48b1-af8a-cfbe55ae26ba@gmail.com> (Julian Braha's
	message of "Fri, 19 Jun 2026 08:48:49 +0100")
References: <20260618-a9_aoclk-v4-0-569d0425e50c@amlogic.com>
	<20260618-a9_aoclk-v4-2-569d0425e50c@amlogic.com>
	<79b1a519-5723-4e0c-904c-b7fdf9564ee1@gmail.com>
	<1jbjd7c7ip.fsf@starbuckisacylon.baylibre.com>
	<5af78bca-7c49-48b1-af8a-cfbe55ae26ba@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 19 Jun 2026 10:08:56 +0200
Message-ID: <1jqzm3ar53.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On ven. 19 juin 2026 at 08:48, Julian Braha <julianbraha@gmail.com> wrote:

> Hi Jerome,
>
> On 6/19/26 08:29, Jerome Brunet wrote:
>> No, regmap clock are directly used so this is necessary.
>> Relying on other module dependencies is not enough
>
> What do you mean it's "not enough"?
>
> Functionally, any user of COMMON_CLK_MESON_DUALDIV can also use
> COMMON_CLK_MESON_REGMAP.

This driver directly use regmap clocks. This is a direct dependency,
required for the build and stated as such. If the module needs it, it
depends on it, simply.

Relying on indirect dependencies is incorrect and fragile.
If those dependencies ever change, the build breaks for no obvious reason.

>
> Unless you mean for documentation purposes?
>
> - Julian Braha

-- 
Jerome
