Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6EF29C35A
	for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 21:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776981008; cv=none; b=Cg1GzLnHUP43q42mQCFw/loBT88zFtsAe2oWIGFQeRsH3b97+7fR3SqnJffSblEwzhil08zDlcnQO3p1nbDHPTC4AxQlmPpq0sT1J3NSHnoueUrJeC1aj/1BKsw8JXkyiHwcPbhshgHDeGw4I1hqPTZmvolTfjKMAZ1ki6upX00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776981008; c=relaxed/simple;
	bh=LSRVDpEOamzQs0THbHW6eRIUrSeuuslIY0FvfldgvzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cmrlx3Aay3YG+wOPnoiilgnd6ex9B8wc8J1eTOiekM8JnMF6YsFIv1diFFGgVLiUtdPJ9DH1gV/IHkQh6ImlbmMFfQB6LnykgQfZ6pU8sp3JnYZ1TSMzTrlVgbX9Vwamhf4uEZkvFRq19x0X7ivejic+6QHvGeBsmM4nEmmmX6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=StIJX/ZR; arc=none smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="StIJX/ZR"
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-6763cc8775cso7276851a12.0
        for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 14:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1776981005; x=1777585805; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G1fiSCPkq0DML3luJPuVMp7dn80QlXb/vZ8XRZ+msWc=;
        b=StIJX/ZR7fvJwhrl9dFq2gcEectBuiFug0ZZnskJYPE4ePVbgaHgb5Lp0jO+b3zuz7
         K/tQQJdKM3YnIhvitNKtMxCrAqk2XFD+vHZStc71IccJN+VzYTnpPdNEqjuBxeYDKRpB
         ZJbZmI0vRrCaspXhD+e+rknRRm3VY3mbH72s4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776981005; x=1777585805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G1fiSCPkq0DML3luJPuVMp7dn80QlXb/vZ8XRZ+msWc=;
        b=UQCRk/L01uJCP0RN5t4yHJieC681+6F477In2xtcU+IRIhvRu9Nami5DCaU31/UryQ
         cL2Mdc0259fsNDXeyHpIknaeX+rdHAaZvluW55mCHemaD2KboGFhdDpib9UHPpah4THp
         HS9TgKPIibNl2tDMMADKbbdPACxa1ikoG1AgtSpOxyOMrzqJoOIHlRZDCWqix8Zj8aWv
         j/VhgCVO2qEIdY8Gnx3Zzf7z+At8hs6LW84lwXijWaUG3qJyGGyrLjhFZ/i8GIsrRjSP
         fq6D6TVO7fF6BWOWeKDUi7Ja9aBJWPZi4WxxhnSot7foT2tWHi21M6nht9SOInN+kyOP
         0ipg==
X-Forwarded-Encrypted: i=1; AFNElJ8dcQg/Qmi1dWN4c+7+j1FWh0Y5twRKSLJQPhX6Ag0+nBlf1DqsRQjpw/kGf0y/fkRKQAjunVB6ycA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBu/QnQEJJP0NMnpxKepuhee5iKGh+BZ1JwWZFo6Pjwhob6LLG
	a/IXj13Ood9WnVFR75NHId05reGn1NBYCQZU72llAZOvXCGxcB/9+wD62RF2lbJh/CXEzJSV/fp
	fvFazAVyR
X-Gm-Gg: AeBDieuUtIaTr4B+xnvWcQLGQ6myUIxO67h9Rzh/ZVKYWvyD34/2FV26fl/Qbjy+b5g
	wbgjoVDK9udlN/iB0HLTjvd7ve2YuzkBDtuzLUBBW9lDI58yTy8+OYVJTTgGNQ3O8U93ftcWtwJ
	Vgu+zWLZ0DUN1EsGpqCUMJqeqp68n3lj3TyiRgfA5SyqOjRJ+qJy2Nv+M4z2sehOrZS7Eoau2l3
	QUbkSmD498waCJZSY1WFNia1GpZLxRPW3udVzbap8pthTuERG7fKMQzKMGXCs2dyqp2rpaBYnqe
	+vo+XHJ5pbtLorOaISunjzhW7JhqogUQsj4INlhofy6dAKgD2fiY0TVMdUfXJ8+X2ZSgPtKrdbb
	NkvWeKbsQ6hlw9KCW4om3iDeJ7Pj9RfBjzc4OhKZMOnlfnx/fr4VbhkY0+Pa17Pc/0bTNH06Osr
	LwAIPPbElXjwnzNxl1xxL6FRCpIxQyEyJjde4yNRsH4rIEnuCmXn1EVG7veDvRvBS9lp0hAcsFx
	fCSEYSfu6Y=
X-Received: by 2002:a17:906:c150:b0:b9c:617b:4a36 with SMTP id a640c23a62f3a-ba421debe01mr1314594066b.21.1776981005157;
        Thu, 23 Apr 2026 14:50:05 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bf00sm691607266b.33.2026.04.23.14.50.04
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 14:50:05 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43d734223e4so4922467f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 14:50:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/1rASvipdujcSBgXSJ+2l+Kbi+br1K5d7A34I8Xfkzm/gErU0PU+LRzC8e7uofzJSh9LAKpLArqh8=@vger.kernel.org
X-Received: by 2002:a05:6000:208a:b0:43e:531f:720c with SMTP id
 ffacd0b85a97d-43fe407383cmr43673395f8f.11.1776981004287; Thu, 23 Apr 2026
 14:50:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260423-manta-display-v1-0-196f80c5673a@timmermann.space> <20260423-manta-display-v1-2-196f80c5673a@timmermann.space>
In-Reply-To: <20260423-manta-display-v1-2-196f80c5673a@timmermann.space>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 23 Apr 2026 14:49:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VNvPtG_f1W942SKJfM4ptK8Wvd-nZs4geBCG3bO_A0BA@mail.gmail.com>
X-Gm-Features: AQROBzBZ12eQ8JPtoHklunZA7baGhpheKR11CnReOtZ62TdnznxZp2PUusIRrN4
Message-ID: <CAD=FV=VNvPtG_f1W942SKJfM4ptK8Wvd-nZs4geBCG3bO_A0BA@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm/panel-edp: Add support for Samsung LTL101DL02-002 panel
To: Lukas Timmermann <linux@timmermann.space>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Alexandre Marquet <tb@a-marquet.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Apr 23, 2026 at 2:15=E2=80=AFPM Lukas Timmermann <linux@timmermann.=
space> wrote:
>
> From: Alexandre Marquet <tb@a-marquet.fr>
>
> Add a panel entry for the Samsung LTL101DL02-002 panel, as found in
> Samsung Manta (Google Nexus 10).
>
> Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
> Signed-off-by: Lukas Timmermann <linux@timmermann.space>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)

Adding new panels like this is discouraged these days. Is there a
reason you can't use the generic "edp-panel" compatible? I know that
the exynos5 driver is pretty old, but a quick glance shows that it's
based on the same analogix-dp core that "rockchip,analogix-dp" is, and
that seems to have support for aux-bus...

-Doug
