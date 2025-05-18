Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D454D211A19;
	Sun, 18 May 2025 16:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747586516; cv=none; b=Omb/EdS1KnZMjbk2DVDP4J6n+L1lakqpluzcNLVIYSL+u+jkFDlf75R1V6Q91fC0LF36D4dzeXvONV047i8CzMtkGJ3PPE2ybPpkJdGK2iniBlw355ywJFi3dVbMpr4iAGeeBlEBvNvFbpZS97hhyYl+l9+L8E5p5uTSbV2+emM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747586516; c=relaxed/simple;
	bh=aZDebBuIwhQGKIA5zH7FXUsKlBBCwxUk5Cqi9xBTjTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IYB6KOsBC1xWuf1kQli1PqfY+oP2TeDE+DSXQmdPX9IMhCrKNph+yWi2d/Se6F/Vt06ZcYiWVpbJXRE4zuWCMeoq+MVFZOCMWnbhzJkp9F5nhHA8ZPI9w8kXZ2N4nAFD+oJ9hDWjEC2QkYMMKfUVDHV2UujA/6Iv27GFIcZic5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7376e311086so4436154b3a.3;
        Sun, 18 May 2025 09:41:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747586511; x=1748191311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aZDebBuIwhQGKIA5zH7FXUsKlBBCwxUk5Cqi9xBTjTY=;
        b=bi4IBJTUJ/AoT8KEp4PFplo8YxKs4qXs/V4WiHjN5tK+gWWS/g8KmQYgkSzhUH2Nrd
         WDG/eiZgzxTBsdPbHn4Nkb6uMuqaPeqcnlSo1gqEd9vYR2s0pRWdgNBCzsuUxYQy8OvQ
         Luba5y4DdFQnml87oeGToQydzJN3YUAZMxFdLYWDD62vk+byi4nDmUO84EtS15DDyZj6
         4iqVmQhEfiB75JcxsFSSjpYqBRsGR7mm12YZ8iAf6gtJSEqHxCKsAeH8xeVod9Hykxj1
         AhyQ/jTRXLF8pX9mJjmiDf35CI3rI1dikbfjeGh1tbb05qEUdWpPQQ+VoViCapuK3P76
         bhjg==
X-Forwarded-Encrypted: i=1; AJvYcCXCM06a/6gE0VlLU0ZVvbzjIUvlNz8o16JrkNdTG/nFte/ugkEZQSs8JrGKS2tj5qrVUwnt8oTEavt6@vger.kernel.org, AJvYcCXm7UXj1GXoTOQsj+SBxUFdm+fdpMIolK5hDmaNQr6hgX2mrVfdVjXDyKFr9e4SRylbm+ibDTbYXnGN@vger.kernel.org
X-Gm-Message-State: AOJu0YxZzqKITVqKhYZ+TJqnosZjlJYj96g7OnUNKnr6bLsmvC4J+IGx
	kiDfGLV4j923LuYaMWtpsVF7ukkr1nqMcxwrrNKxka9ykuL2doFv5wmaV4BBEiH4ydE=
X-Gm-Gg: ASbGncv+gEKWTIPTYXGf/gvOPmgbye9zfu1H5+Hz+aODYh8Lxz1TCU7Cqyk+i+uzM8b
	cJosWGV/3L4CRNdSxAAOfxMfZ7U9+kviZncJqle02WNRgEbLqrTvQobvptoOMEM4R8or5Mquy9+
	LYOXKUe+1IOFxZE9bOC55ig5Ig/YKTw2Rduoj7nBHzk755Do0VwZBg2g4FYg6lrs2MSrDURPPP6
	Se31ksy3FsGabW5JjBYO3JhL50MQGmGWko/g3VSbrjyMf+gVwhdfl6R9pJ79LAdJVxXJVTN1grd
	JkaMoRrXRjXmOzHr2WfmX14eEX7ygXnRT1PcTMAuIep0wYPO4BFkjoB/OF1FBTwYrumX0unY6on
	HineuwRHMPflBC/c=
X-Google-Smtp-Source: AGHT+IEtejn5JKK4xkFSj0n7XLV/Tzot/6v67/gmcgFBpTriJ4gBiLTCQ10x/M3q9nW0sG0ez43AYw==
X-Received: by 2002:a05:6e02:1745:b0:3db:6c09:a60d with SMTP id e9e14a558f8ab-3db84334772mr115837305ab.19.1747586500649;
        Sun, 18 May 2025 09:41:40 -0700 (PDT)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com. [209.85.166.44])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3db843f7a60sm14946305ab.32.2025.05.18.09.41.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 May 2025 09:41:39 -0700 (PDT)
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-86135af1045so469666939f.1;
        Sun, 18 May 2025 09:41:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVkjjWnr3EmBRfUJNnlPvkPelGPtdFDFreNvlKYxhyUJiAP2Khfyw08Y3gKdqYtTGPnDVydyzlCQ2+g@vger.kernel.org, AJvYcCVtwH7cFqQlD20Oz07CvzNMzqgQyN7P9b0mBOCFS3Rg/ukYTZSfhhRQXeoYj7W7VPXrIUlKikNg8Szm@vger.kernel.org
X-Received: by 2002:a05:6602:6cce:b0:86a:93c:f5fb with SMTP id
 ca18e2360f4ac-86a231901efmr1346917139f.1.1747586498864; Sun, 18 May 2025
 09:41:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250516105101.11650-1-ryan@testtoast.com> <20250516105101.11650-4-ryan@testtoast.com>
In-Reply-To: <20250516105101.11650-4-ryan@testtoast.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 19 May 2025 00:41:05 +0800
X-Gmail-Original-Message-ID: <CAGb2v66nwNrL1bJjqeLaUKxntPbbL=amao=3fLQnVwKt6bFyFw@mail.gmail.com>
X-Gm-Features: AX0GCFvPNTkEIdX7vf-6v-hZnL1kJZY7vaEnvAF5rZAuePObHWHQncZKVmFJnYo
Message-ID: <CAGb2v66nwNrL1bJjqeLaUKxntPbbL=amao=3fLQnVwKt6bFyFw@mail.gmail.com>
Subject: Re: [PATCH v11 3/8] drm: sun4i: de2/de3: add generic blender register
 reference function
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
> The DE2 and DE3 engines have a blender register range within the
> mixer engine register map, whereas the DE33 separates this out into
> a separate display group.
>
> Prepare for this by adding a function to look the blender reference up,
> with a subsequent patch to add a conditional based on the DE type.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
