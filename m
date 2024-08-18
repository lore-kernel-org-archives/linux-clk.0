Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A22199B8;
	Sun, 18 Aug 2024 13:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723988877; cv=none; b=V9neAvQtcbKVCl4h0MUqN6cbHf0RlFwYKm0GBf0Z2L8QGq9t+ADeadV7+rU2ccQJsmXSyK6M0fqI9wVjDxdbnKGJh/SPlBAZrmxGBhiK95MCiZ98mTbBuooaPI34K50Hln5ql83oULs5elrno3UhXTSd1PSieYnWILCQPByyVYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723988877; c=relaxed/simple;
	bh=DOrE88eK7FNtec8CjcuF9Kbf1J+Xv+uNq/yKCjxMpHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kPBD88hixDbs1cG8svKSLGLmpBKXHq+m7lyNR0yjTBCJqPvKUSdIqknIdb1SjEDsnvGH/Me/QnBVq8Kcix46lUmusARaieU9S6LRasLYOal2Ohn0LZc8XEuvC4Xh9IiAKmonyDwUXBU07cBeOHlKccaXZgK9Yc77/HjIm/RVo7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-530d0882370so3609042e87.3;
        Sun, 18 Aug 2024 06:47:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723988871; x=1724593671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DOrE88eK7FNtec8CjcuF9Kbf1J+Xv+uNq/yKCjxMpHc=;
        b=KcyYjaEtjlqRezbgeVbquoamy7B573gSo50mnXEPsrSmzUF/kOUNk0uVjS5P7dVmoN
         r/8+rcXKAMSWdWIr0k/BBiW1wGgb4qdYMPoqLkGUvKBXUnhsga24QwtZMrIGFJT4PzE3
         ikRcJuxuTjtEvjj9ps05EQKbUJM0MFNf8Fxe23kF6JsUz1+4XouWUHe/PAAPMfKQhUL2
         9XxA+KJ/i7m2/GaxkSHGoixBEsmN6LV9juC81KptKAZCN9P0iW1tbNo6/HOmYPWtimJr
         zHFe0MggX4c83slLNdBpHgH4TUOgLOj3D1/gDCwNghmGfr3Bg7dsuhoXuJF9f60AQdDt
         Gg2w==
X-Forwarded-Encrypted: i=1; AJvYcCVLHNoJGVSA4ig9XHO1iJRwIHATkj89TDGvCDkyG7gExsK+ZzdTrdmQImYr7uEvlexwFOkj8dtVsmS9sPxCs7Jm7MUe2jexMR6zoCYfXrXOoHLi8sUW86QOdqxF6nNN+Xls9zLq7w==
X-Gm-Message-State: AOJu0YxU0wCjypNXZfkwxGXI55hNxVSVNvQwBuyPS1BzM7d0/XporS6V
	YGRJD/J4F2PbcW6M+CGcD9obRzHgu0nW7vmnQw5qr4AD3PDUa17FFew3iE287T0=
X-Google-Smtp-Source: AGHT+IEXvuLolgVnW2+xVu3NIcRSNb2qAyITv7PGRVr4/J81LMj9gMYPGYAAnpWo7lOfhXXuq4Tlag==
X-Received: by 2002:a05:6512:33d5:b0:530:e228:276f with SMTP id 2adb3069b0e04-5331c6ba93dmr5965242e87.36.1723988870449;
        Sun, 18 Aug 2024 06:47:50 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5330d3ff68asm1213069e87.133.2024.08.18.06.47.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Aug 2024 06:47:50 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f025b94e07so39128411fa.0;
        Sun, 18 Aug 2024 06:47:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVvcZf0rlQ7GIdH0ZCu14QhRDuoqTh1afsWTYYUe+bfAzVoIwkwPG4dtHpxUKbCMBaVK9X+r0BURk6Ngo8UepxbK/AgZ1Tn5Mq6IC+OozocRTFdZW9hfPh7lvYv5EQOoJIuSCs8aw==
X-Received: by 2002:a2e:b8ca:0:b0:2ef:2dc7:a8f7 with SMTP id
 38308e7fff4ca-2f3be57e7acmr67887371fa.7.1723988869939; Sun, 18 Aug 2024
 06:47:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240817230503.158889-1-ryan@testtoast.com> <20240817230503.158889-22-ryan@testtoast.com>
In-Reply-To: <20240817230503.158889-22-ryan@testtoast.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 18 Aug 2024 21:47:38 +0800
X-Gmail-Original-Message-ID: <CAGb2v65gppDuoUDNhWbZj5vVj7jNiPkiZLPisXK_PKQnPAr=_w@mail.gmail.com>
Message-ID: <CAGb2v65gppDuoUDNhWbZj5vVj7jNiPkiZLPisXK_PKQnPAr=_w@mail.gmail.com>
Subject: Re: [PATCH v3 21/26] dt-bindings: allwinner: add H616 DE33 mixer binding
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
> The mixer configuration registers are significantly different to the DE3
> and DE2 revisions, being split into separate top and display blocks,
> therefore a fallback for the mixer compatible is not provided.
>
> Add a display engine mixer binding for the DE33.
>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
