Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FA630AAC0
	for <linux-clk@vger.kernel.org>; Thu, 25 Dec 2025 08:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766650948; cv=none; b=r0XIctS2KtjO0V9QM41f4q7rleZJsLmiOd8PqXZYg/ez+LW/Dv02eLiXlOujGlHSvWrMS2c7je4Ohwc4HSuMOYoD08hmH0LbFDpsCAuNLywFF3vT/halIXBOTLEp5nLqmgda7sS87o1Qr6UNRNiipIIJG9S46IMRd8GQW3caQCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766650948; c=relaxed/simple;
	bh=GBIp9kX+hl2mkbN1urGov/Z/70FEgI+eflqjn/ioE4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=axDT4wF3fVSDEsyaK5q0bIUqbryjZLBuNupj0Pg82Xyjh/ew7hGRZR+aQeYgwQZySnYWXKaahj+SfOzBvyNSBEzeAad7c6l0N78MrXoYCxLXFdAlCdoJ9OnvkL3BUcL2/YRV82hbMa3xs+1bRkBi1Jh7q952ADDwtXFqeY4Y5HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tLXJclho; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tLXJclho"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D20BC2BCB1
	for <linux-clk@vger.kernel.org>; Thu, 25 Dec 2025 08:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766650948;
	bh=GBIp9kX+hl2mkbN1urGov/Z/70FEgI+eflqjn/ioE4Y=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=tLXJclhoGJ0ix5OyqI0QDTFogKnKbKmwfBj+4RTKf3PAqjGz4/FCZy266J8Qeme7Q
	 SkPtwPEsJqOAOoOwjCULpmYZItwKYuluhTvFlnMZ/6hNfq1d8q4hzTY9YjezQBeXTu
	 V6AzIHk1DMyaR8wgLGW3uKt1NTTvB4ZwFbXCy/bhOBzXaAWNAdUKf9xg1uGpcyV5CJ
	 xzZVvrumaa0bD6A1CvBonM86kw6BhmI3dCOyvTf0jyS3QIuzx4HKmqb4aZRYAZtNuU
	 alvAexP+G0QH+QJw28v9o0/GI1kqEMBPhClJ4fN/co/QaccRM+0u2vK2r5oe09JMuA
	 mm4+VKKK9Grcg==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-37a33b06028so56693261fa.2
        for <linux-clk@vger.kernel.org>; Thu, 25 Dec 2025 00:22:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWhJTt0qkDgSCrC2rRP0MCfdSuUJcGdZvcC+iqrV4MTxubwtQOisIHPThJdw38ZVooWj7DBPUGbBSI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd4rrADdNjLJ8cUa3BEq73w37akienUdlxka6SXFgmDUokCt5e
	vTQ68OqrvuWs1L7dWzeRVcu0+kVg+f88obmFxd/ri7KwIf/vr7hL/gkxS6MQv+sUD4LovE+acbR
	pGtPMiyLJhWnx9L3MNhkTSirKHKsXzKA=
X-Google-Smtp-Source: AGHT+IFppeSVdlVccV8ZLOVWMT/HmjByzAPqOV4k8UjgxAxDAQTT6kTjy5H+aCpOAkmg3adrDHLP6/5j+VdObqpd5IA=
X-Received: by 2002:a05:651c:544:b0:37b:95ee:f605 with SMTP id
 38308e7fff4ca-381215af948mr71834481fa.10.1766650946149; Thu, 25 Dec 2025
 00:22:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251115141347.13087-1-jernej.skrabec@gmail.com> <20251115141347.13087-2-jernej.skrabec@gmail.com>
In-Reply-To: <20251115141347.13087-2-jernej.skrabec@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 25 Dec 2025 16:22:11 +0800
X-Gmail-Original-Message-ID: <CAGb2v64h5E+hz-G4HEBesVgu4bkFfTi5vNEpU2BQFUYHKCqY8A@mail.gmail.com>
X-Gm-Features: AQt7F2p6GeAz5pE56ddcluDZYRCFD_O3UDD7G_yS9PvFCxlCXBqEjAn8ZBftz2A
Message-ID: <CAGb2v64h5E+hz-G4HEBesVgu4bkFfTi5vNEpU2BQFUYHKCqY8A@mail.gmail.com>
Subject: Re: [PATCH 1/7] drm/sun4i: Add support for DE33 CSC
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: samuel@sholland.org, mripard@kernel.org, maarten.lankhorst@linux.intel.com, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com, 
	sboyd@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 15, 2025 at 10:14=E2=80=AFPM Jernej Skrabec
<jernej.skrabec@gmail.com> wrote:
>
> DE33 has channel CSC units (for each plane separately) so pipeline can
> be configured to output in desired colorspace.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
