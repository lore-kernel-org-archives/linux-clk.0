Received: from mail-ed2-f9.google.com (mail-ed2-f9.google.com [74.125.228.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576ED258EF3
	for <linux-clk@vger.kernel.org>; Sat, 25 Jul 2026 08:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784968073; cv=none; b=E0bPXQMLIoQj9EQC9FKvs6lVVTGxHUSxtsDyTz2DzCVSUEoGqBQxDnwVHHnKWVg/fxlgCqs8/MOtPfM+Em9hCLIQK/pG4G9PCDB69/OuxTfZuZA5sWBVuti38WodERjwaA5llBpyz98vP7w2gai7fw7I/YroFXdV3qj1z2kK3P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784968073; c=relaxed/simple;
	bh=gPeXPPGLbFmRB2bRAKpa2gFojTcQTquw5RAY2mSvs50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qbL//B3BrZ4S8UO113WMm9FTK7IXzj11S3Knl3mxCvGDWQV4lEAKYWAkBeFPKWO0NvOC5mePQCRih5Qlm/WqCaHDWZlsrwxlxUBayGIDEo1iVfUEmpTQaYySQcC+3cZDj9hA1Czt4+h2kygLxwQ8KM24ySKaIbpV73Nj9YXhhG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qSUf1Xx1; arc=none smtp.client-ip=74.125.228.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qSUf1Xx1"
Received: by mail-ed2-f9.google.com with SMTP id 4fb4d7f45d1cf-69c290c7676so585231a12.0
        for <linux-clk@vger.kernel.org>; Sat, 25 Jul 2026 01:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784968070; x=1785572870; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gPeXPPGLbFmRB2bRAKpa2gFojTcQTquw5RAY2mSvs50=;
        b=qSUf1Xx1W9Ef3VCK6zgDNwL0D7ABWTJ/jcWR0mmIvlX6gM4VpDY6FBx37Sinb/d2H1
         RaY8hvLvR1x2LdYGVBAFjfmL/jBDIZDm5MtQvL+76Yqvk4EmMgEsHF5hBCUL3+FKBjp0
         OJw8O7A5MaQV3lLMtw2sJoSx96aSKK4pehMYFnU8vvy7Y/8JQu8Zt6Tt4GM5NkRMI9sh
         zHUjfSNDrFBnvYIqBqHbrguXE5fNwCCbg1fr5yOgigPrBnn7ht+eWivkHMRvOOkyODUi
         Uvy/WQZZ1HrKhnBHNmRNwriNiu8bCjbiD1MOP+yWzV0wuFo9BZiL9ms4g66WHPBuLC2i
         7DTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784968070; x=1785572870;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gPeXPPGLbFmRB2bRAKpa2gFojTcQTquw5RAY2mSvs50=;
        b=k0aciK0sODNPWlbD1apjPZqrXzj/gTeqllYlLFdpmVDYM9HzzmyUmO9WZwk2Q5jrB0
         aBisyKQGAm1+rcdTsq7OBEUIOs8+o6nLF8o4LaUzlteRCMSLABjadkWvrUas/Hol8rp3
         ceULL/2d+So2oeQ4fCOMEjjjKV7ZK6/7jfPWj9o9dULfn8QlnJc1UyPUmSOoihi9P0/D
         +K/Quex5xZ8jNAR+uRfuBwR36ey94irluhhqMw0G4QB/zso1TZW58EpoQr8tu465Wy7F
         aGjW7FDGSb9WRjrbXlJRM0F0UcFYCOPpSJ1tjdhOR9gAByfQmoQO8oTSu4wEA/0/FZap
         I2UQ==
X-Forwarded-Encrypted: i=1; AHgh+RpnfCNoukiDPCVUq8zJnR9RjwoaZsd5eCx/AjmQf5r7XsFV0ZD337dTYVTjdJ93V5/iTU4t0B1RZNs=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp2NIT6EQqBV5gVkninoZmjJn3TiUIZUxgE6Y5ptrrg9aw7HWX
	D5KQud2LqbFs6i0uLn3qYByMQmpq0fTFedSgSm6u7/0GcqrF8sB0a9Cw
X-Gm-Gg: AR+sD13hhgqrCk9KlQ17HNrUBITg1TGuOQtCYL0lnoo/aRbjmvkwQyZUEbgtu/HkLOO
	vDiA4nMbmOl4W67moJ6JSE65mT/eE2dItaZP7N9IbAjW8lLTG3suFKtKnx5y7adMScZ7UnhPVX3
	7hDQ56RGRO1if0BO1MMYaPM/EK3ylR9eC3IEk9L/VfeHtAq68deCCZmFxUb9z+dKjMrocJUqIWu
	YdxOuVIt9WvuxZg0kUly/o7A43dwdaCultmeMtghcFKHTvk40ud8eooIRp18d4RofCLxnjH5R8u
	MH1UzgubthJbbWh/SwzX3rcfZFdy7Qh7i3jJ4mVlOgHTDyIVPqY0rtxmBJ0/mqVkZQylTpkwKnK
	9azxkOLBO1VBMZWrFjg7fzu8ey9QT/H9YM3iJkmIC0Ab1GJ2N2ral
X-Received: by 2002:a17:907:1caa:b0:c15:ccd6:79c5 with SMTP id a640c23a62f3a-c1f1eecc34bmr64140366b.33.1784961423771;
        Fri, 24 Jul 2026 23:37:03 -0700 (PDT)
Received: from localhost ([2a0c:59c0:1::208f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ebc828sm440790366b.43.2026.07.24.23.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 23:37:03 -0700 (PDT)
From: Cody Kang <codykang.hk@gmail.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Haylen Chu <heylenay@4d2.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Cody Kang <codykang.hk@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 00/17] drm/spacemit: add SpacemiT K3 display support
Date: Sat, 25 Jul 2026 02:36:26 -0400
Message-ID: <20260725063628.3499-1-codykang.hk@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
References: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Apologies for the duplicate posting. The patches are identical in both=0D
threads, this series and a resend series, see [1].=0D
=0D
Please use the resend [1] for furthing review comments:=0D
[1] https://lore.kernel.org/r/20260725-k3-display-v1-0-6de34d80e86c@gmail.c=
om=0D
=0D
A delivery failure on gmail side appeared to have lost the cover letter=0D
and eight of the patches from this thread. For about two hours I can=0D
only find 9 (4, 6, 7, 11, 13, 14, 15, 16, 17) of the 17 emails in the lore=
=0D
link. So I decided to resend the series with a different mail server.=0D
=0D
Sorry for the noise.=0D
=0D
Thanks,=0D
Cody=0D
