Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD51154BFE
	for <linux-clk@vger.kernel.org>; Wed, 10 Apr 2024 08:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712739295; cv=none; b=qJQEL5S6xjcnJXfbKWAAp9mXP1/S/wtfipSn33IGneFW8nme2NiPEJuEnUHAYjJjQvD0bPG4I0+ukz4qCO7UaAK437EX6TB6avMqCTCKYNTq0h1E/GDGCn6mA/nT807lEYVvxKv9EAfuGBij3EdYcrWtFn3enrWSjUCSgQZbhqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712739295; c=relaxed/simple;
	bh=wJaJdM0IjpmDjrg+jItYXS4bp3qcKVPTJ6OW+2XHdMI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PMhJwUDRRM9bDz0PkD4lT3amEyh9FpUmfOZ95+9+B/Ic9s5iZskXX47ljOMze/pa3PT776DLZeUrbg2+EL/TpOr6IF+pVsoCjRCCFIwS4l8c5d/foJRQPRZZU7yEU+vESDFKS2gmQlnTkF4Zg7jb+kIXnGZCr9qoRjkd79I4CHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nYi+BMF0; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nYi+BMF0"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-41745acb8f4so1952035e9.0
        for <linux-clk@vger.kernel.org>; Wed, 10 Apr 2024 01:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712739292; x=1713344092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D2AsZ1QIiCmfybXFGVW0zxiOuEp+rgs+ouNgKbZDKFg=;
        b=nYi+BMF0GUnmF6U6SsE09J+it7sd0mLDB2BjPalrmebndXZFnNJFf9uaGZvtT+ZVb4
         Cgfz1U4wbya50w9bKhrOuibKuRhLN52n2EwEuVsAQlCXJxvWsO+a/GBgxQwpGi/MLrnu
         PdCXmCBGVHrd+5ALE+x4aYQ2WulxJNRElSZfcqv443KpyN95aSWHpYlqMnqSQ3StRlXg
         WObui3xOsFi4/EfiXRZviECGqhHuAJcI4HZsby8R+pspwy7Xr8/l412f/TEM7hNKB4pP
         IVWxH+85rxQg+5qzM/BvFyw+RUlTRKDptseCRZ82PPzEaid524pKcZxvIxUzSvPbcBer
         La7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712739292; x=1713344092;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D2AsZ1QIiCmfybXFGVW0zxiOuEp+rgs+ouNgKbZDKFg=;
        b=hesM00SqfsQqeWrzFXnLDqYDU+z0YrcoTb1CpZ7/pUGH0Yck+mQrIFpQunHIKaeG4A
         bUnJ+6Z0mIxvqRn6AdGvuCPh6Njg6yGsII2Tf0lChQX0xI6S8hQoCNvrZ2bmxE8McCp8
         DXTDc5Fshg/tmWgZrNxJW+M7dNbdK4wyb9RWUsv0SEFCDdtct3iTr4p6KUMX/ziwYu4g
         vMrXYgSRN+i/f7346z2ceBcvHTGoIgET/XC4zPVh034WZhNsbLNAR/Mb2245lpg2b+7R
         0BzOf0+w/wgAV9N6N4PbaZJUjwKNBXW9SOR4izg2i4M/yH28PYMF9JmUCeXER+ZFxo61
         mUdw==
X-Forwarded-Encrypted: i=1; AJvYcCXRCpWWOMNCuOkwF75/oSVUZhcfOzsS+8IpkIRJFo7Op9VA64DcJfvLhUUJqIK0QoQGZeCUFsgEjQBklBKD3tA5or2R5GnQ7/Ge
X-Gm-Message-State: AOJu0YxKxosx8adNpxRRCWgsY1kLm8cWVUK257Je8tz25kqhJi2eqmcu
	Nbm9jrzYwBlUoB2+JscDa5J5m30FC3U8tjnNAOzJwhV0simPe+KInhbc6D09G9k=
X-Google-Smtp-Source: AGHT+IEJgQ9v9FGTkOkguC9zTMYpllaqcg3VK+wytjhD6ErKqeWqI+TOXQq+JItqSKG5kCWe34nSYg==
X-Received: by 2002:a05:600c:a4b:b0:414:726:87d9 with SMTP id c11-20020a05600c0a4b00b00414072687d9mr1961567wmq.12.1712739291342;
        Wed, 10 Apr 2024 01:54:51 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id j1-20020a05600c1c0100b00417be508e44sm408832wms.34.2024.04.10.01.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 01:54:50 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Nicolas Belin <nbelin@baylibre.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 "Lukas F. Hartmann" <lukas@mntre.com>
In-Reply-To: <20240325-amlogic-v6-4-upstream-dsi-ccf-vim3-v11-0-04f55de44604@linaro.org>
References: <20240325-amlogic-v6-4-upstream-dsi-ccf-vim3-v11-0-04f55de44604@linaro.org>
Subject: Re: [PATCH v11 0/7] drm/meson: add support for MIPI DSI Display
Message-Id: <171273929022.3191460.6988833554592946386.b4-ty@linaro.org>
Date: Wed, 10 Apr 2024 10:54:50 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4

Hi,

On Mon, 25 Mar 2024 12:09:46 +0100, Neil Armstrong wrote:
> The Amlogic G12A, G12B & SM1 SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a),
> with a custom glue managing the IP resets, clock and data input similar to the DW-HDMI
> glue on the same Amlogic SoCs.
> 
> This is a follow-up of v5  now the DRM patches are applied, the clk & DT changes
> remains for a full DSI support on G12A & SM1 platforms.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.10/arm64-dt)

[1/7] dt-bindings: arm: amlogic: Document the MNT Reform 2 CM4 adapter with a BPI-CM4 Module
      https://git.kernel.org/amlogic/c/ef5a84d716042871599ff7c8ff571a6390b99718
[2/7] clk: meson: add vclk driver
      (no commit info)
[3/7] clk: meson: g12a: make VCLK2 and ENCL clock path configurable by CCF
      (no commit info)
[4/7] drm/meson: gate px_clk when setting rate
      (no commit info)
[5/7] arm64: meson: g12-common: add the MIPI DSI nodes
      https://git.kernel.org/amlogic/c/6f1c2a12ed1138c3e680935718672d361afee372
[6/7] arm64: meson: khadas-vim3l: add TS050 DSI panel overlay
      https://git.kernel.org/amlogic/c/2a885bad5ba4d553758d3f1689000cee8e6dae87
[7/7] arm64: dts: amlogic: meson-g12b-bananapi-cm4: add support for MNT Reform2 with CM4 adaper
      https://git.kernel.org/amlogic/c/fde2d69c1626bebb3a8851909c912e582db1ca95

These changes has been applied on the intermediate git tree [1].

The v6.10/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

