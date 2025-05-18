Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9651E4AB;
	Sun, 18 May 2025 16:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747586791; cv=none; b=NMpI0EpSU8CDBx08pXqWOboEITjS0H7NqHkZAVidNRmlQ1BnyM3mIFxa5qNUeP9VRdhSeXaiubzuNwbPL5ZBSxJ52v+VennYqcQyIh6AoBlCtrM4DQfiXcggLkv42v+DE7W1+RbFkiOX4bT/7zUnCxAZ/4hzPDudkfoUzVqzk48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747586791; c=relaxed/simple;
	bh=H8auBAsWmzOyx9AlQEKXQW3lYZT3R7zY1mzxA5CFuTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CK48DCEX1040NVjcYhCFT4FkX7OBz62P2Yn8QPASMJ4wW2/jsTA6s+crFxwWIlp0eCxOfxnPmRqUl8LHNpaDvIwt1got3z9/iwqpo8Vy4GhOQxXkrv6JCetkO0boFIpn0NEniIZVsbaUkhKEYOFs8bjs8mce4BSII0UjiKJf9Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3dc6f6530c5so1220305ab.3;
        Sun, 18 May 2025 09:46:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747586783; x=1748191583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H8auBAsWmzOyx9AlQEKXQW3lYZT3R7zY1mzxA5CFuTA=;
        b=e89vs1NI7QhuUPItVh6GKxfnQFw6/WqBjZ1XPUAXCWw6cQT5v8c2Nw9Db2QFODdize
         te0k0fidPyrT/YgDhJurUDYV7vpXvI7EFEX0ZJY8m6VvjDtSnWm9R25afmMbaSnmJy2S
         A16CyH8l5Jy8i43LMCHYmvicLCmEbi+S6cqxH+x30Ko2+KjJtFhCfVs3LZTKjHJfRZ7e
         XZkKqs686sgYTWIGf3t6eD6DsMPNeEXv12P7oTrAPFZjsZ/hGOxSyawLds9QKoTOZXUG
         Up9V7r/lZVqCCFVDU+0ZGW1Aq0Umwk1y9rae04pm8Lwsn4qj6Qo/Jl6SHDRhCuLY5KWs
         BM5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVf4QIss6HuJHX8bHNpikICFIbWPwCVWSWHqJVjf1DylLRTTpt5yq0CbTjS6z/b/SaDznfymIC1TjId@vger.kernel.org, AJvYcCVtZnv+ashveHghuzLK7Jyx0LslMZrMY9hL86tSlLDQW1Z0PQ53bX1H9ov1hSMcb8Gt0yxK7yFDdGQh@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6yrLACMe22igaEW8dqjX+bWah3MOkZVKbUfnByQnNPgmnQAR/
	aoPwUNw+0Siaww/Rv2taC5Mh4yGAIVIUuw01EW82pu32nHOSRqng1j7Cc+Mbu+Ze4CA=
X-Gm-Gg: ASbGncsLSqjai7iHFwMYUEG9GJTAhRnb3VdslfOpHoofO4oOhQ8UChZVdOSJOyBR/Do
	IXYpYtsFhT0mMCUxeC6vXIXqS0ahQ4VWjG/G7dr4nOa21uRdyNXOgLMm3mzxhIlBUTPhln35At7
	CdPbJoNjskAOknnlQVzAsGMdGbZnMRM19GNRpFYMKr/a1z7zObairy6OaHI1wNmEoBFUSZ2FG8r
	YQFHlhf4oItYLHbNEOAstD9EZN1dZAr9JRd5VhJRD8cj2MVsyG2hsOf862n1K4KIZ1M0/Q1eeJY
	BxQXvzxe7ERdn9v2AnXG5tbmlTdXBjQQoRxtb6Jz4ndTFu9xP7vo+S0lNTNGmZkEA5Gs6dpQWJv
	IWxsy0B4eQHKau9OVhlY=
X-Google-Smtp-Source: AGHT+IHcasK/uhTLB4zCTLROh1mHF1Wl8k5Es6mhIc74DG5NrNmMzO8vMh9tauyL7hmZwjSZjO5AeA==
X-Received: by 2002:a05:6e02:1a48:b0:3d3:d00c:3602 with SMTP id e9e14a558f8ab-3db842d2a2bmr105437495ab.10.1747586783601;
        Sun, 18 May 2025 09:46:23 -0700 (PDT)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com. [209.85.166.180])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc4b170asm1364434173.128.2025.05.18.09.46.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 May 2025 09:46:23 -0700 (PDT)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3db6ddcef4eso34891325ab.2;
        Sun, 18 May 2025 09:46:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUzhlk1QT+KtQl/m4ejeYLhXUx9jjWA2RudspzKzznv+Oq6q/gsRlFek9OaVcGe91tz+C77wBqGfE+N@vger.kernel.org, AJvYcCXXKPe0Hwf08xZfFly6JC1vcaI4MkJdo2g7aG2YJdl/1qHH73us5UhjNRsJkKJULvwiq5yYCC6sg/UD@vger.kernel.org
X-Received: by 2002:a05:6e02:3c02:b0:3d8:1dc7:ca7a with SMTP id
 e9e14a558f8ab-3db84296d9amr115461995ab.5.1747586782845; Sun, 18 May 2025
 09:46:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250516105101.11650-1-ryan@testtoast.com> <20250516105101.11650-8-ryan@testtoast.com>
In-Reply-To: <20250516105101.11650-8-ryan@testtoast.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 19 May 2025 00:46:08 +0800
X-Gmail-Original-Message-ID: <CAGb2v66Lw9bne9Zch4kyAbWx4Zz=VPh3EJAta0M6XxdaSi-d7w@mail.gmail.com>
X-Gm-Features: AX0GCFt32y8vwGnO09UOLDY6RStkxid4HewGHZjKOLQgFiYtO_lDbLwjct7FmIQ
Message-ID: <CAGb2v66Lw9bne9Zch4kyAbWx4Zz=VPh3EJAta0M6XxdaSi-d7w@mail.gmail.com>
Subject: Re: [PATCH v11 7/8] drm: sun4i: de33: vi_scaler: add Display Engine
 3.3 (DE33) support
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andre Przywara <andre.przywara@arm.com>, Chris Morgan <macroalpha82@gmail.com>, 
	Hironori KIKUCHI <kikuchan98@gmail.com>, Philippe Simons <simons.philippe@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 6:52=E2=80=AFPM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> The vi_scaler appears to be used in preference to the ui_scaler module
> for hardware video scaling in the DE33.
>
> Enable support for this scaler.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
