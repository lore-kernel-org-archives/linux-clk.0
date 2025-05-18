Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F331F36D;
	Sun, 18 May 2025 16:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747586457; cv=none; b=mgA9l+BRVFgzGTBjjymU/QxRfNRzOcL1rddwaeWbvn2Pj/XecrraxSnZbCi9rt9L7H5ribuyNdtYA/afKaQxMEgUzXlkN45Eo13VotPDP5+AJRdWEK8aRAUs7Dvf2uGvbfkUQVXNn8vCQ63iZi9K8WRobWy1jna45dshEkRrcjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747586457; c=relaxed/simple;
	bh=/hg4XOiM8dzAP+sj3OctfJb8nVC7grXLEYczEbyGvks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k+RACWLNj7RLBs9kdDtl6nEN4KqRUPODvRa2Mkx8WCm0JTRUTdZSZiwValjCuAzTce1qVf330lPofbwVR3D0PzIW5HLmGLfUv8RvqG4wTwmYiir7RYeXs3E0M9v1fiB5scVV9vjpYwos0rLVYDrgqRVclXR27Q/UtxFyT0VptHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-328b943ae7bso11537911fa.3;
        Sun, 18 May 2025 09:40:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747586451; x=1748191251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/hg4XOiM8dzAP+sj3OctfJb8nVC7grXLEYczEbyGvks=;
        b=a/1uYkLp6VIpZWotfOX8iHYxviRSIAMODpE4B5/+0SiBUnD7LJm8BnxGbpBryI/Yo6
         jWz0GK0w4Dd81ZVMfUywIaTsqV4ZJdDHulUpkWdcdubbhx9HTHVpa6kDAU1yOXnAcQX7
         QclRTtYfVIafWSdArvajCgKRmjzXVhPfr00Dc72HzBSJpOoM6oTyJw0sHxWgf6GXA6kY
         2vJmHElK7Nykx0YBoh6SapY7TLrGrTMVLPmCzJDIuzWxy3qulib15lAvB4yLqXT82TD8
         Sk4hA6pQRdg3a4hfRORHOxP0FvGEq1Kkra71noYjUqtXyHF0S6T2OMYkFp9kRweRLqhi
         DfIQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2LRp83NAfCyRp1T5kTpuPZgjiGNTNmrKA1zW22waj/0AtQip2FoQn1IFPTH1alwNMufpN/OPiK9/P@vger.kernel.org, AJvYcCXnaP9+XxWimu0qvTP6M3r66rI90fg+sIMd4uunyQ2W3Mn6CGaLShzURd6WXTFCStlSLuDSqgJ84p8g@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhg+Lp6Jd2Rw1TJ/oByT9BOgGBHN3HBV9CWkZFQFBNxGe8jWvq
	zp1YiAzmsoJnvsGn2dg4GgWUPnfvATzkv+4d7BmpRiK0XNQUZ877FcHDotyXgtyO7SE=
X-Gm-Gg: ASbGncu2mPZYA5v16A0XFjjkTobFXGlDOfVz6abIDrALwwsREetrmAcoT9q+jfhoTEj
	8Wwziy1T2ieAXliE/GYfFx/AbstoTe2dA1qR8NuRVb2YesCnKD/9NhqPeeMGdsBGJeK/UfL5SDn
	JZLEQvj2/2eIBE0PmPaUktCA5w8bDq9djjId3d5+nQhw+x20tEgo1w8owbF5wgHjWwaVFI83Ofy
	rKgrb7ZHJyMrPieX1iNO8z6cGChO/Xv8kuGZMZ9/7FO40vQIN/IsWtfMNv93Bp/8AZO2Y1HNzOk
	ZjkOCE9Alb9oOpQsTF9f+MvwMVXfWLHz4XjvP8J/FJHUVA6MhQ/K2dlp/SD5dQkaTlD84xkdEPF
	Finue8UK4
X-Google-Smtp-Source: AGHT+IE+Up/r0CIj8kjfOieccYIYS09s7jmUWUjKFLmYvxpj0U5h3tjwWcv7VtLIg6rzATyBJAPtcA==
X-Received: by 2002:a05:651c:2229:b0:31e:9d54:62ec with SMTP id 38308e7fff4ca-328077c40abmr31127401fa.31.1747586450644;
        Sun, 18 May 2025 09:40:50 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084dd1f5sm15340811fa.56.2025.05.18.09.40.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 May 2025 09:40:50 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-328b943ae7bso11537531fa.3;
        Sun, 18 May 2025 09:40:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU405Il8uRI7XzAM+jIqwdh8EI6JEcBhEHE5AAWTnQapDUnMRrTdS/idGCu4G5Ef3QVdXT3zhyNcbmC@vger.kernel.org, AJvYcCVAsH5oSDAWLI7BdZlcIgSYgS+pO/6PDzeucWS/f2jlh3AUqBs/SVq3QOmc5/jXaGNzNbPQfxn4KY2d@vger.kernel.org
X-Received: by 2002:a2e:b8d2:0:b0:307:e368:6bd6 with SMTP id
 38308e7fff4ca-328077cc6eemr39628791fa.32.1747586449458; Sun, 18 May 2025
 09:40:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250516105101.11650-1-ryan@testtoast.com> <20250516105101.11650-3-ryan@testtoast.com>
In-Reply-To: <20250516105101.11650-3-ryan@testtoast.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 19 May 2025 00:40:36 +0800
X-Gmail-Original-Message-ID: <CAGb2v67jfZx4gxhBh9cc5SRknzwc0jX_148v2p0HAV5+adL9aQ@mail.gmail.com>
X-Gm-Features: AX0GCFtGZP94oDImPioaa5-NKNR-5OiIQ3Lm0O3X3TZCX6x7PwMx49wsoQ0m4fQ
Message-ID: <CAGb2v67jfZx4gxhBh9cc5SRknzwc0jX_148v2p0HAV5+adL9aQ@mail.gmail.com>
Subject: Re: [PATCH v11 2/8] drm: sun4i: de2/de3: refactor mixer initialisation
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

On Fri, May 16, 2025 at 6:51=E2=80=AFPM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> Now that the DE variant can be selected by enum, take the oppportunity
> to factor out some common initialisation code to a separate function.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
