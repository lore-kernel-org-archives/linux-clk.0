Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5211733121F
	for <linux-clk@vger.kernel.org>; Fri, 19 Jun 2026 07:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781854822; cv=none; b=ICjWZPWP90EZHncfcp2B9hDqaRhNIFoICX6m3kzY3lkHPzmbKMjUEMSi7WIPSdQ+C9sIxLnpHD65BBaES48Ag18GQwUaf88f1Oh+ufgO5Hb7QKkD5G59AmOC4Yoz1ESMjB2pMoFccwCRXesgkIziHWxRXx2gh793NTxtRlgGnss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781854822; c=relaxed/simple;
	bh=c7x/XpbPG2XGf2qegF/oPNBop5Y2r8FRIEy56lES51s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hFeTKt+fya0fZUhregjFRIpAo/fAjFMULB9qQ5ylskmFvKJzUnNjTBrZcUpyl5rwvHqNEJdqBvwc+PlHWGSmB7OMQlTdX2rgQYkrHoHlX+Rb6TdjabBdheaE2Cbvtqm2SeeUXQNMIirhYP0WL6zBCCttWS4Gz7e9SiNBq/LY/3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=DKbSzz21; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="DKbSzz21"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so21703265e9.1
        for <linux-clk@vger.kernel.org>; Fri, 19 Jun 2026 00:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781854818; x=1782459618; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q4qbPpfXKjwWf+Dt6pjhae0Fsogba7Qsk/94yaXvhXg=;
        b=DKbSzz21mf+YRZYjAVYXGu7m8hF203gYsitXs5ovBe/koNOUCEsKABDglTSiWOxG95
         1XJZwM+h+nxNujVI017vPg8BLmPyLpL9iSK0bqQJX90NShcZ8SFV6zcjkxfVTH9pCNvC
         07qcr0f0q2uS+E8bx6CuUhyFCAowoWrJ0UxEjaP3Y6crJ6Qzfdbvt3vUWR50fUudzWmT
         Fc+KdSS4XYPTMcvrCV2sVb7nFAd0jUaDIS4i6ywx08Dz8k7OhvmpIPgPnSfQTyMPrynW
         GG55yERqkAex+vpRA2F+UP/VAmT9XZfZSS2Qfiy9pvrpoTQGUNuLaNz5EKVgQ4T2uiQj
         J5vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781854818; x=1782459618;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q4qbPpfXKjwWf+Dt6pjhae0Fsogba7Qsk/94yaXvhXg=;
        b=XhUXOFAmgQKg9tUuYojo6xbwl9/0n+NPH4Xu2fGpF8ahp0FC4mZGWcQxjIj76iDLwL
         2x9eMOwYV3AVhFsXRz5tLZPWfQY3km09xqcQPi0vlAYCg8oGSFHuP/JP6ZSuJtU1vvqw
         IA7/RnF2zqnkDmf66a1pqWy+RhpiEHhr0YOEaOGXrIjSc1cWMsWn5W8hdlYXljcZoBkP
         e7an7AXR7SFkbgfLUZpN8ydf5f9hA6kNRrJg+CukkzsozaVtmKGgoTUXRY3e7pY65y1i
         DNwQLZumUAH9u44NsTJYX0iFr+MVGoAZd0pmPjzhVZMz6d/3D4hlHSpK3Qp8z70YvfeO
         lU6A==
X-Forwarded-Encrypted: i=1; AFNElJ/xfAEDP8GmRZQrTLwOJ1qICcAk0AfMEyhH4XBNvFYIZPFEm3qocJYTPDlNT8pHVUAPmbyynwkQpXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGmRYprmm9OOWThdIfQhQzfpigB1hp3WAl6CPo1O5taxvoRDR8
	AJepig8AFKXTPxtDfWkouF6I5MHjC/MI28eNy1CmomCXjjaM97nZqu18CwnJFHEBmMo=
X-Gm-Gg: AfdE7cmS5j6l97bZxQQIA3r5rvLuAJ7vzwYTNnHATJiVXOGJfQ+RSBoPSWbD32Z3ljY
	gzg+rh4twAVNhb0TO/DnMBusXgoLiBlxFQUKcuz/TBL4mOQXr2AuO0U0tkXMoGSB+aobSzmrrsk
	zLoxIv6+GrBROHtrxEkzSxIW3yXi+AHj06IwprSyGBEcZGtSRXffgrsNMNH5/rd7KEGC8ly4J3Q
	diuZCdsu5MkIRaxvokOqJYJ2CQ7puGBt5wvODkSWsqn80nTVAFEAfRzzUAGgPVea9bekuueJEm5
	r/1IDL04IaoorX8TddGZRPGzQfgh5gAX55GdpeiKYBD/Yd+Ttq8Q7Ko0WiC7YTsrQVFce/tXzt2
	DukfEBL36CH8Fg16o/34PtfeWwRpLDnHnxqEVqQ2xTjVTLP6+p2rhym4YXhDct/4k3RcEJIc2k3
	qt7oizgajAWlmbT73F29G41w==
X-Received: by 2002:a05:600d:4448:20b0:489:32b:ac0b with SMTP id 5b1f17b1804b1-49240a09f71mr22313395e9.6.1781854817768;
        Fri, 19 Jun 2026 00:40:17 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:95ed:eac1:5731:4e21])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4650bc422c0sm5324812f8f.26.2026.06.19.00.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 00:40:17 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Xianwei Zhao <xianwei.zhao@amlogic.com>,
  Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  jian.hu@amlogic.com,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  Conor Dooley
 <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 0/2] clk: amlogic: Add A9 AO clock controller
In-Reply-To: <20260618-a9_aoclk-v4-0-569d0425e50c@amlogic.com> (Jian Hu via's
	message of "Thu, 18 Jun 2026 17:49:10 +0800")
References: <20260618-a9_aoclk-v4-0-569d0425e50c@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 19 Jun 2026 09:40:15 +0200
Message-ID: <1jwlvvasgw.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On jeu. 18 juin 2026 at 17:49, Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org> wrote:

> This series adds Amlogic A9 AO clock support, including dt-binding and AO clock driver.
>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>

A part from the 2 minor problems found by sashiko, This looks good.

> ---
> Changes in v4:
> - Drop CLK_IS_CRITICAL for ao_xtal_in clock.
> - Drop CLK_HW_INIT* and revert to explicit clock declarations.
> - Link to v3: https://lore.kernel.org/r/20260610-a9_aoclk-v3-0-b7592d6c31e2@amlogic.com
>
> Changes in v3:
> - Move COMPILE_TEST after 'depends on ARM64' reported by sashiko-bot.
> - Rename i2c3 to i3c reported by sashiko-bot.
> - Reword the comment describing ao_xtal_in's flags.
> - Use struct clk_init_data to describe ao_xtal_in's hw.init.
> - Link to v2: https://lore.kernel.org/r/20260603-a9_aoclk-v2-0-f47ea616ee78@amlogic.com
>
> Changes in v2:
> - Split the A9 clock driver and send the AO clock separately.
> - Rename aobus to soc.
> - Use CLK_HW_INIT_FW_NAME to describe clk_init_data.
> - Use CLK_HW_INIT_PARENTS_DATA to describe clk_init_data.
> - Use a9_ao prefix for MESON_COMP_SEL.
> - Correct duandiv name.
> - Fix pwm b reg.
> - Link to v1: https://lore.kernel.org/all/20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com/
>
> ---
> Jian Hu (2):
>       dt-bindings: clock: Add Amlogic A9 AO clock controller
>       clk: amlogic: Add A9 AO clock controller driver
>
>  .../bindings/clock/amlogic,a9-aoclkc.yaml          |  76 ++++
>  drivers/clk/meson/Kconfig                          |  13 +
>  drivers/clk/meson/Makefile                         |   1 +
>  drivers/clk/meson/a9-aoclk.c                       | 488 +++++++++++++++++++++
>  include/dt-bindings/clock/amlogic,a9-aoclkc.h      |  76 ++++
>  5 files changed, 654 insertions(+)
> ---
> base-commit: ca89c88bcf69daca829044c638a8163d5ce47af0
> change-id: 20260603-a9_aoclk-bbf531badc63
>
> Best regards,

-- 
Jerome
