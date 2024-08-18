Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A530079CC;
	Sun, 18 Aug 2024 13:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723988890; cv=none; b=OPCl04Q6LLzAPQqW8Ufvei5QaJ8np/BBiNC01C6IoVe3dhXaPHgs22XzoDDF/33CQdqYxNdFpwSpizVbSqq/v1siUu0Uwz4z2FCVxdGwCL0HGHRCHDMA5D/PNfGiw3r7HaoQurGs40az8/Bl2Uy7OhMhj7iysPYIEvzK97gPykk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723988890; c=relaxed/simple;
	bh=086ANeHmrRDjdN2Mwc5Rp1d2iaH69nmzevA2WRPm9Xg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aKgau1qU60WY2N5zV14mO6iMoVihb1D91f7dvVKB3BPOEDIDiI852MYKdjFM9ANcd5TKJ9zJHXJX8Sf+Lob7j9L4wloyijgq6cfV2+3NP1h8wDgRSS7XqhpOcKcVwnt130Ag6a3vTExnqBOZjUHBAdP6HGLS28/0lOjQlPtTMmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f16767830dso38409421fa.0;
        Sun, 18 Aug 2024 06:48:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723988885; x=1724593685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=086ANeHmrRDjdN2Mwc5Rp1d2iaH69nmzevA2WRPm9Xg=;
        b=SrbfNXw6+bLPsoEsY+Gw/5xm+9V7O0gUIiFCE4LVE4UajA00roqt0VHn5V0TAuicPR
         LVW1s669yr2iqlbd+Oo/ib9PFv8rAE/Wd+QeahT5Z3Ba6xTib3z2HG4HJIRXx3RTBLVU
         SPUqeaAp8JjIyYbxGPZ9JNVKqJaWiOOQocjAtdlLko3BAQYE7paA42Ixl9DGkD7q26Zp
         B3jkmbNHWNGqmTZrEz+QKpe7WXj62W1QQMM7gcLCJq94/55Yf47W3/gvwh78BCdn6euK
         4TRKjQS1VtocoJ7At5z4yOmRjBWG0eNUh2TFCTRuSzvLonkA6pYHWXQu3mlVgnhdkGrj
         uFQg==
X-Forwarded-Encrypted: i=1; AJvYcCXI91sWzGcxOVzvmjM+lRFNhSmsZo/pJLEk/z53VXZ8uaIkqOZiwWsluL1tD9CNU0cCAij+WqL4vmm2N6hCJi1UR5PYIQB94eMS7JGkjJk/W2ODTG1HgjP+6QyoNsrD8jlKxnvBoQ==
X-Gm-Message-State: AOJu0YygjFJ8T6JlcgaV+aYFtqQhdJqs5HUpLP/1fX4+Fh5JUy/AIb8d
	BJnl/hWhuOXWV9VHlifB7TgJt6LuyLmkQHX1R07WFamXD2Yi5otMfc2oAHyhlwo=
X-Google-Smtp-Source: AGHT+IF2WijBACwDGULXrcYA2PT/B8p1RhTpyxJlr0DdhlWLjQa/acqWBufyvP50ara6sldm9HH/fw==
X-Received: by 2002:a05:6512:3da9:b0:52c:d904:d26e with SMTP id 2adb3069b0e04-5331c6a3f7bmr5524430e87.21.1723988884837;
        Sun, 18 Aug 2024 06:48:04 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5330d3b8f0fsm1248358e87.94.2024.08.18.06.48.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Aug 2024 06:48:04 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ef32fea28dso40578151fa.2;
        Sun, 18 Aug 2024 06:48:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUhceS4cXBHZHCs5rTgz4Unuics5RHgVnQ1H3vaeLUP0NqGIr91x0JitUI2dFGPyYW28NUi1TxY2k1P8Gn3hsak78se622LbWvN85Y0s86ujW02jE/vi/bQBnmdmKRjZqaWLYPpCg==
X-Received: by 2002:a05:651c:2209:b0:2f3:bfcc:245f with SMTP id
 38308e7fff4ca-2f3bfcc27dfmr53848211fa.32.1723988884396; Sun, 18 Aug 2024
 06:48:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240817230503.158889-1-ryan@testtoast.com> <20240817230503.158889-21-ryan@testtoast.com>
In-Reply-To: <20240817230503.158889-21-ryan@testtoast.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 18 Aug 2024 21:47:52 +0800
X-Gmail-Original-Message-ID: <CAGb2v66d18WWQTu4YGsL8=qsRELKx675f+s8S1ezLj3eLmSmUg@mail.gmail.com>
Message-ID: <CAGb2v66d18WWQTu4YGsL8=qsRELKx675f+s8S1ezLj3eLmSmUg@mail.gmail.com>
Subject: Re: [PATCH v3 20/26] dt-bindings: allwinner: add H616 DE33 clock binding
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andre Przywara <andre.przywara@arm.com>, Chris Morgan <macroalpha82@gmail.com>, 
	John Watts <contact@jookia.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 18, 2024 at 7:08=E2=80=AFAM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> The Allwinner H616 and variants have a new display engine revision
> (DE33).
>
> Add a clock binding for the DE33.
>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
