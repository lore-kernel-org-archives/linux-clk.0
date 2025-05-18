Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFA1C147;
	Sun, 18 May 2025 16:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747586528; cv=none; b=iz2xqrI/fKcN1hd5gQhx6WFjrrpQoHXDNd/Hmzx9a/2M0Gxq4fIqcicMOYPru0khoNk/spfREm1ijruspO3Y2LETHhxpeCE7Il7rLVboPv7RvDb+IeJ9zli61IAq7wHu6lcDz9G+5brTo5iJnWltPKBckuWBWFH6VBNGsVZlTi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747586528; c=relaxed/simple;
	bh=wD0Py1Y+nYCa3T32gfjqbB8qmXGi889eEZKva2VRulI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GsU7KwcNi3p7aJJ3Yx5pLV0fW3XUxqypT98pXBbIfPX7Q8VZdPww9iodNrHgVLsYybbsp77asEBmwxyKSfeeX3atIq56/FxB6ZbTCsVnAtE04eJkPIoiBjlzaMqfGChUzRAGdf/v9QY36qy1twEzXkrpgW3S2LIiFtWZyzzWJJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3da7d0d7d58so28906815ab.0;
        Sun, 18 May 2025 09:42:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747586522; x=1748191322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wD0Py1Y+nYCa3T32gfjqbB8qmXGi889eEZKva2VRulI=;
        b=JJPBHuhrwTntp0XQjL1WRl1SzgRyJ4jHcAD60lo52EAMpuHGrxX+lTOgPQOyWh8aMT
         mD6HZLJt3OOzin5DhgnQpdfNK5O6/Dbr6K+uv9FV9uYQKLMg/0X2asIhwyxufBVxfe4T
         J8HSN03XkUQ73LLkeyGOdmERNFzwcRRm9rpNBlF8sFKDtiu6nbVrw0+/9D2ZswxuH37z
         bFjLjHnnNXuZcbS0PZDmaChMlnDLmqiUAoN4rJAsTndOaLRQczgoVp8XT9Wu5Hth9m4G
         1OU4a5lxDMNik56qe7d3cDTKbwIcx655Qtc4hI6qorivwV6juQJgnB/2pAiZKZUQJA8G
         ZUiA==
X-Forwarded-Encrypted: i=1; AJvYcCWqYnxUUpw8SIk2HH0hUTulMW3DLfP/gaCjYIGqwtWN117d2rCL0F0IfDsgmxGzqFtL6CZSnMga9yyQ@vger.kernel.org, AJvYcCXqu0+QV1UJ9d2+CcqZIQ9bhEbcwA+fLds6CWMUwQSYZvwazPMr9QcpmmEjGdlU+2R9mtlibNa5nJ7w@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/La2ZvnRED5e/xxiJEjZHjDqmhW1DYBWoorKoAyE5L7S1uTXH
	+DfCW9oOSwnyJ8b+4tjx/p70pOUQxXkF338LHFgZ4/3MvM/76eWYEJP/eqQlVaDPA88=
X-Gm-Gg: ASbGncuduxJg1IBkE6hKVMP1OrN00WIhdO9D50LMucO33QFCUm4VeenD+37tl3BqdDS
	njMaObK5zEqB3merFrqEtei/UhoLTin0wZuGhd/HjKOke8TqqVYWLVud4xPiLH5Gu6WqZ6bzDga
	+knKo9sGue6OnLm/zMVgIJnpH/UhcVW/cM+8xwaEnaoTmUw1wrqUl0fUomCK+XZt7fbXzLMkgkS
	4JvAUNTX/IsKJUhEo1Crf+V0Q49q/HTdn9Cjb/qXmJzRO28boN9vtjbT2YPqtOpgX6stl6B6rBS
	xWBA0RbhoZjx3TfqE6lFpB5HW7zY/rqNGvK8yKMeqVJQbIB5vENYNeP2yznRoPZ5zTnQKChydAZ
	FUn+L4htoj+bEaAQ=
X-Google-Smtp-Source: AGHT+IG4omiJ4EjRd5lhV6ue7F2CC8SXqw6HUieQpQVHg5Ls0JtEveJIugsA75+eiTWcterEBTcLtQ==
X-Received: by 2002:a05:6e02:1949:b0:3d8:1f87:9431 with SMTP id e9e14a558f8ab-3db857544f8mr98208225ab.12.1747586521620;
        Sun, 18 May 2025 09:42:01 -0700 (PDT)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com. [209.85.166.49])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc38ac21sm1358074173.17.2025.05.18.09.42.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 May 2025 09:42:01 -0700 (PDT)
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-85d9a87660fso426543639f.1;
        Sun, 18 May 2025 09:42:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVivb9+OY2r9Ga2gcmryLSRNeZWuxloYYY+d/8Poai11evD2uxRSPfQbMnyu87YMeBL6HlajNs3/HPR@vger.kernel.org, AJvYcCWIJpkVJ4pViuT9NzZDKx7KrsXlh+sxIS6kBB5PLO2FkOJPz7aGlfYUAmWM6NIL2c8LNqf9bFXJmNIM@vger.kernel.org
X-Received: by 2002:a05:6e02:2164:b0:3db:6fb2:4b95 with SMTP id
 e9e14a558f8ab-3db857a6f7fmr111584635ab.18.1747586521124; Sun, 18 May 2025
 09:42:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250516105101.11650-1-ryan@testtoast.com> <20250516105101.11650-5-ryan@testtoast.com>
In-Reply-To: <20250516105101.11650-5-ryan@testtoast.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 19 May 2025 00:41:43 +0800
X-Gmail-Original-Message-ID: <CAGb2v66+c9j-uFn-d59VkP6Fk1_af7i=0sWJxSTmp+3+A=+V1A@mail.gmail.com>
X-Gm-Features: AX0GCFvx955idocxBLHWdxaZkcNf0j8vEssSsAEhRIcCueVqPuT49DZqnymord0
Message-ID: <CAGb2v66+c9j-uFn-d59VkP6Fk1_af7i=0sWJxSTmp+3+A=+V1A@mail.gmail.com>
Subject: Re: [PATCH v11 4/8] drm: sun4i: de2/de3: use generic register
 reference function for layer configuration
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
> Use the new blender register lookup function where required in the layer
> commit and update code.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
