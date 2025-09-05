Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476CA2BE7D6
	for <linux-clk@vger.kernel.org>; Fri,  5 Sep 2025 06:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757054209; cv=none; b=NToVvWI1ZLiegsQrPcvx3J7HgJK7bMlPRqq0eZO4MeP8Fy4wCWZmaOMD81fsk/NWwgRifz5pIb1X7NHo+q4BFeYj3NkGX5/FUjJIUtvnMw7g0fUMk8eg9sRn8aft0QFav0bzaz5ticpCjS3I1JE1hgy+HMAzqhhRQal9OK56cDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757054209; c=relaxed/simple;
	bh=wFJS1RHxYpPdjfElWjyoww5Tm6gmIS00MsIdtooweP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=liUN8T1wBFm7IDSyR4aqvRVg1vf8CvKx0WiEyy/qRmc2mmHHeVU1NdTh26g00kQ/S7PwputGDxvAwsH2AQgiBNQRN6b7bPtqvtPsXigh5FfpVxhDuulpEK69svfWDZDLSOTPethXS+NqZ5jf4mgwAa2Phnjri3SJhp7d4n1oI+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IzulrF9u; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IzulrF9u"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-333f901b2d2so17953871fa.2
        for <linux-clk@vger.kernel.org>; Thu, 04 Sep 2025 23:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757054206; x=1757659006; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wFJS1RHxYpPdjfElWjyoww5Tm6gmIS00MsIdtooweP0=;
        b=IzulrF9u/DSrT3zqQPUsDOY21AVLbnTTjCEcARRgy+OT8PlJcHAQS2yebbq6X5XqAI
         duf0IS7+JJA0PmNyMahxFhjyjto1zT3e/bruHK35GFkh4cfA2R3kdPC5QsbW3Vrvd55b
         7kjrMqfl55s/CSa4u6ru9TyGum0qbFn4WRis0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757054206; x=1757659006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wFJS1RHxYpPdjfElWjyoww5Tm6gmIS00MsIdtooweP0=;
        b=DnYBpo2JykRcKRs3XUdsIJGG1uZ6YdyAgNnGYyVEMPwuGx8S5Bkc1L3sW0b8SRFBNo
         XXwfeSHBzkV/7OUZcMZ6RRT92lDAupWFDubTzpm/vNgjuLSW4BmmlR4iH61xZwL8ls1E
         V+LFL41TX7IBJ4JuTas/KBcIZ7qCLYUG4abyrEsq2594IdIb9WJl2+RKygL9LT8/4XDn
         5v3DbXRr5h5GsiuJnuWWnmIGHEbM6ueBbLoLZfDYNfKoK4EKd3xwp9je7TNmdpEW7H76
         pZ8URNyO8L8K+kYfQkCWGrRiNpiuHzdxFiOU/cZC3xZ4AIDPMrrv389bYzafAm2qRQzR
         0n3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXLfPskD0D/ZcEKDWWu6BCpI54cCt8Tfn1oE8A99YspbQYNtnWtrR5noAS6M4GCOL5MV3jizBZlAbw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQIZDOUQl+I+udgUny7zcMpbMC8j7mwV41h75ltZ+EOlCHyK9D
	uolq/3BNdl2vDlZKHcv4zGMTLCoJda6eRCP4MJn11lrDfkmOSfjx5ft2xbuSK4ukyjDd+UvlTxm
	oeQ5YPLoCGlC+38bLJ7P9bLkyoWt7Mi8vegRDmFzQ
X-Gm-Gg: ASbGnct7U/XZG18Uw7VLqnAwveY52+d+Ih7l6VV7H7L1Wi4iCA241g1y5nKPwqtZVhl
	bV6Lg1STEqjK6V4a7PvkIyZJMD6uViGUs4wS9Akg13jabwocmtofL5S9hcF/+mo2+S0kf5+tDWZ
	LttZA1J8dPJCtnu6LKd1jOzogpGaULx3ozntSolP1nrwweCRmgDJgMC7eQOFr7d1BCnVV5i5EpC
	LuHf/P799ZXlgoKP5W3weHsv13Mg1nC1/GRHQ==
X-Google-Smtp-Source: AGHT+IEgVbxQy/DxXsDzvdrcOfC49jBWiMtOAGepTowcEVXECREwr9aIaRDx8B4CTbXxL/deN9wUH95NSxy3a5X8TKE=
X-Received: by 2002:a05:651c:20cd:10b0:337:d2e2:d467 with SMTP id
 38308e7fff4ca-337d2e2dcfbmr42859621fa.43.1757054206408; Thu, 04 Sep 2025
 23:36:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250829091913.131528-1-laura.nao@collabora.com> <20250829091913.131528-16-laura.nao@collabora.com>
In-Reply-To: <20250829091913.131528-16-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 5 Sep 2025 14:36:35 +0800
X-Gm-Features: Ac12FXwXWypau4EdANuUrgXmxAn5bymNrHkP7HBNlw9rFp2Nbb7jmA3VYZ8UsYk
Message-ID: <CAGXv+5GjZusKNCe+EshMktmyDcfjm6i5oD+h8LvObymvD9QXqg@mail.gmail.com>
Subject: Re: [PATCH v5 15/27] clk: mediatek: Add MT8196 ufssys clock support
To: Laura Nao <laura.nao@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, guangjie.song@mediatek.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 29, 2025 at 5:21=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> Add support for the MT8196 ufssys clock controller, which provides clock
> gate control for UFS.
>
> Co-developed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Assuming the previous reviews for the bits are correct, the removal
of CLK_OPS_PARENT_ENABLE IMO is the right thing to do.

However if the hardware ends up does having a requirement that _some_
clock be enabled before touching the registers, then I think the
MTK clock library needs to be refactored, so that a register access
clock can be tied to the regmap. That might also require some work
on the syscon API.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
