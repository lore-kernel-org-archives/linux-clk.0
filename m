Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333FD153831
	for <linux-clk@vger.kernel.org>; Mon, 22 Apr 2024 16:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713805073; cv=none; b=KFBDJRhf0x/OZEgfMO8rtW2GfSDTEvTMN4uD1s0Ev3gGL7pClBhzoOQ4VIDJq/e3pC0kxBjAbRi6KBZpampANPfX2c0QxZCUcEXDnNa0BI4co1jFccunX91qTHUuHjj5YM6zcnwcMuk23RpkpMb6Gu1nOjUpOPgequd8qhx+RsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713805073; c=relaxed/simple;
	bh=Ptp2ftOZAGscOLVcZ1Evx+agdRuYHjLibG7LykakzGk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GfFbpxIlpQ48fiHjoV7wWSL3604ScOjdJloIlaGX7IG8NPvuj+cEB6Vd65+hfm68QB2lJE6FWd19vVHkoLMMd4ihLbmk5V7lEOEQyS9iI9ytk0p5KOAarUgMi7KcJuJ2yEd4OMkFt0SPuds0Z15Se28G7tKTAN79+V1cgHiVN/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cXFHNh7S; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cXFHNh7S"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-34b1e35155aso1186033f8f.3
        for <linux-clk@vger.kernel.org>; Mon, 22 Apr 2024 09:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713805070; x=1714409870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XFejkMe0OVlEaHFS27AO4JIPaFi1PczIDcBY/+c6L4w=;
        b=cXFHNh7SikVSS7Q+R+Bg0ZL+ccO4WcBLsmjuZd8zgoBczvlriEP+jDRqbjfmVLvbR9
         dgLHm/Jxuq1sGUZsNyKIcfDAzwDpQJQaJYxXPTWIi4yQAF52CKDCvsv18ULFhV/y6LAj
         GSgQl7yzWNgU1VdbgWxWLMxWD1eEXYXas6uIPXjD2mkVcikqgchVFSbH/EsrQhNWaxTe
         BJBdhkitIm/bPYIZML5PXJBU2tjP/5dLi4ghrLqWU5VnNFvzK4hiXHHAKI0pAX8lFUn9
         +uuemcEPUMgXwVTfvoU6vniAfQi6cdp87WNItPkd+et34VBGSJu415D5e0Pxu2N3DvTL
         mC5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713805070; x=1714409870;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XFejkMe0OVlEaHFS27AO4JIPaFi1PczIDcBY/+c6L4w=;
        b=buqE1sfBhmaeASyPFffowCXgRoGcS/MrzyUB27jYpc3pqRUTcKuVg9+3nkNQPDPgcV
         DQf7z6ZJ5HKJNyePiUNJ/ULq8z2gCtXVIkBo16okJRb8nhUTIX7TgaUFNvVqK0nmkfdh
         yNLdcFVkT0ANpJlHXBWK9LAMAkwwB7JymFfn1yBvdW04kFwqq6c48qM9WWVtGz9N2y9Q
         ZsmaVA2VZeEsxkMNUxTr5tZq4SffNJoxmTGBESVU60zCMzKsPSNijtS7/c/PBw0D76uY
         ZqaCn+h3REpZU5XFg1u+rty1ChVlGrEmImSJsfdMZwdDPL1PMFDo3OqFy6RXEZC362nI
         ggyA==
X-Forwarded-Encrypted: i=1; AJvYcCVzcoxqYm6l6amyLAC8dy9lsPZUmrK8CmgHBMd+YTOoJR2+DmAJbuEtY6IXCQkiHuJM2Fe7GlRlXbAXBsnAgzqaagxlCguW8P3V
X-Gm-Message-State: AOJu0YwXqZqheqdKr3zD7ZuA0C+nLCojaCIIPcpRLsHObd3F47/kYsfF
	EGGyRE17gd6UItD2kMsaEKy57zKzxeCaklG3dR7mZA+XFJ7EJOV3NMVM8wfbn7A=
X-Google-Smtp-Source: AGHT+IFPgoNY7jL28vA9FqUBo9t0jArnUgL+gophkF/W85BBll+VXJnnlKToYJDSJz0chYDGNDGGmw==
X-Received: by 2002:a5d:4082:0:b0:34a:2c89:8517 with SMTP id o2-20020a5d4082000000b0034a2c898517mr7612659wrp.10.1713805070257;
        Mon, 22 Apr 2024 09:57:50 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id y7-20020a5d6207000000b00346f9071405sm12509330wru.21.2024.04.22.09.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 09:57:49 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 "Lukas F. Hartmann" <lukas@mntre.com>
In-Reply-To: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-0-99ecdfdc87fc@linaro.org>
References: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-0-99ecdfdc87fc@linaro.org>
Subject: Re: (subset) [PATCH v12 0/7] drm/meson: add support for MIPI DSI
 Display
Message-Id: <171380506905.4152979.12753297685732463141.b4-ty@linaro.org>
Date: Mon, 22 Apr 2024 18:57:49 +0200
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

On Wed, 03 Apr 2024 09:46:31 +0200, Neil Armstrong wrote:
> The Amlogic G12A, G12B & SM1 SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a),
> with a custom glue managing the IP resets, clock and data input similar to the DW-HDMI
> glue on the same Amlogic SoCs.
> 
> This is a follow-up of v5 now the DRM patches are applied, the clk & DT changes
> remains for a full DSI support on G12A & SM1 platforms.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[4/7] drm/meson: gate px_clk when setting rate
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/5c9837374ecf55a1fa3b7622d365a0456960270f

-- 
Neil

