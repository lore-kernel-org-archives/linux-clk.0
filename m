Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CDE18EA2;
	Sun, 18 Aug 2024 13:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723988530; cv=none; b=KVFTpubGpuXBMCs8teSDP7WlLsAeWGIdgF/9vfl5YDyXZtnGXeIeKzsN30rhF4V+MlpQ8ITMfWdxfWTXJXdkfQ365nvtQV0WK0i7Kxs5HkOzzOd8qc+HDlgfNDvM+BKJx7pxxlCgtl9R2/v3NIOzLe+kvedzJpUIcBRi2ZB4UwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723988530; c=relaxed/simple;
	bh=whPaRlGmH+NJXjZNAC8fa7shH0Iu+3/wkcGkkBavjHg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o28IGEGbkdbByqer+d601XPSzDKwncbAK6BCvdApjYdMwg3cM0cGOnwgkHxUdToOXRmaSvMy+uuuF2s+dE7iAyfmoLeNyGnmmmLdf+vrOx7Hya7ozfF4QqfX7uFX1btlTIS4oCFLhr4PWJZHXfe1Ybw0MzkWvo6dsE+l8QiEE+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-824d911b6c4so132327139f.2;
        Sun, 18 Aug 2024 06:42:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723988524; x=1724593324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=whPaRlGmH+NJXjZNAC8fa7shH0Iu+3/wkcGkkBavjHg=;
        b=WMmkjaYhurgmDEDGTIDYiL4UbGtS2eqSLjvQiyWafUhOCQ8NSIJJi/jphWKZOzyXBg
         YPLYJvNIMHqXhk/rzYMCCwtRol2Qx+3o11ooFlsV8Hw/zkLkxwN7AcEa+xASqgVesutW
         BV6BPiFdFEFONYx/uNbHvuHeXoeu902UNYZezNA9gz563uwwyBSlZMWAi5zVmBW+EHUc
         FHlu4ffNzbP2pTl4litdsS/ZowRQeux5sVGbG5RyF5PJGLVitV3Bz+5MBJSgEqtaMPI9
         7TT/MRTI5FSjHn7S1gZt1b85jOwzhbF9RIXbpJtVmRcLJHp7U3r2U4SK5uqzEimYQKjx
         WbQQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3Q8IgRp9EQJ+T/5KPwnWpjGVWVwaohFzJC4dhfv3gaqmyartn4tIo11iDAUo0SRL7ZPzN8fZ8/0In0wxYQ6eq5U7nukLe6ohigyukBlA7rkvpQUJb8T4crv1LxpvZ7R/opiLgnA==
X-Gm-Message-State: AOJu0YxlKSSXHncQ6tF7ioS4LP5fHLKurwwiwltfIcXxFob3Lr9xMJoC
	2j68PoZLhdyYsDZTabO83Qaxjj8MA/SXHHdDz+piavsavxpboumyU6ZlALz6Tbo=
X-Google-Smtp-Source: AGHT+IEeWwEkTa+L5uMG/uor4eEods3wa/vUybVEFt7bQFHUAGxEIPMSaQpDNC8zyac+aDj8y1Fenw==
X-Received: by 2002:a05:6602:15d3:b0:7fa:a253:a1cc with SMTP id ca18e2360f4ac-824f263255fmr985764139f.3.1723988523697;
        Sun, 18 Aug 2024 06:42:03 -0700 (PDT)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com. [209.85.166.42])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-824e990d591sm255167839f.13.2024.08.18.06.42.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Aug 2024 06:42:02 -0700 (PDT)
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-81f9339e541so135386639f.3;
        Sun, 18 Aug 2024 06:42:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXsUGeP/XuTCzeJf7zNq4/FCcCMyUhIkIAnFcuhjWBHeY2QAYHaKwZuAp1yCDLniYRv4V+67YZbyG0TIcpSh0pDnXmrbIUsK4pzi+y0TPlrsY5hYCfRRlmxFDiViVIaM0pH+AqglQ==
X-Received: by 2002:a05:6602:2d94:b0:824:d6ed:e479 with SMTP id
 ca18e2360f4ac-824f266b92emr827432839f.7.1723988521614; Sun, 18 Aug 2024
 06:42:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240817230503.158889-1-ryan@testtoast.com> <20240817230503.158889-5-ryan@testtoast.com>
In-Reply-To: <20240817230503.158889-5-ryan@testtoast.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 18 Aug 2024 21:41:48 +0800
X-Gmail-Original-Message-ID: <CAGb2v67OCPz4O38Lgduu1pasjE56dCuGbzYNL_RtjqsnTJZqCA@mail.gmail.com>
Message-ID: <CAGb2v67OCPz4O38Lgduu1pasjE56dCuGbzYNL_RtjqsnTJZqCA@mail.gmail.com>
Subject: Re: [PATCH v3 04/26] drm: sun4i: de2: Initialize layer fields earlier
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
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 18, 2024 at 7:06=E2=80=AFAM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> drm_universal_plane_init() can already call some callbacks, like
> format_mod_supported, during initialization. Because of that, fields
> should be initialized beforehand.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Co-developed-by: Ryan Walklin <ryan@testtoast.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
