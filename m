Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB962877F1
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 06:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752128009; cv=none; b=GJQkXpSOfS3S6XK73TxL5I6oYgS8M5Qf8K5OBFKxjF1QG7vj69ucLkpcIMoq5Y2g7+TgycHD2IdjgPHjjkCx/usGnXLHM/6wOOikzlqT2wb8AfyZO8goe9kdQWUQzQiBF55kSs8RhwcArs97C7PjL5k95PzbVSr1BIHZRjQ6Hk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752128009; c=relaxed/simple;
	bh=qIGl3ofMZN4YGC3+hkJsdrAC35OHZlbE6ayWuOboDj4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Agf6ObQo2g2Q/lMy6a1E/wagJ2v1wjFbhqokRXaO2DLKxAb4HO5GRjmGg9J4/dDoYKdoIRA5+OI7x9wi2v1fDOIdg2VOv8jajbAYORTuUC50fy2ny67PczeT4rLrtRyfe0H9GMlQVvJMlxidqNcTcPpAlyzFE+WTh8Pt9DERWxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tmqHRrGg; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tmqHRrGg"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4530921461aso3416765e9.0
        for <linux-clk@vger.kernel.org>; Wed, 09 Jul 2025 23:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752128005; x=1752732805; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qIGl3ofMZN4YGC3+hkJsdrAC35OHZlbE6ayWuOboDj4=;
        b=tmqHRrGgF119Ca7LrTG9ZjPOTC1QplpRbxALP32kclNpwJtAi30wUtPNbvlGDSa2s8
         4HivoM5G5GMbDrgZAJGs7FtuRtzphgEkEZ4h7BSbb2vVcL7ptZ/SH+q1xyZpbUK3iWs5
         0f0MxLd1V2v1tqPI6vrd+6NhDaDR1MQSH+psCcozHJLLs2iFCcbA7yB+n78rzuKSirhu
         gGBKPHrs3Kzv2r2KaGuBM2IyK/o22C2ktLLpEgAayainrtVVGNNoZPW1kSEgMk60Tk9M
         55iiBN7om6Vsvp0GA4IYqBPyJNyKgxCXQlBPrLSB7N9k4hl1ZpG23R49fhkdzFm9Ky11
         13nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752128005; x=1752732805;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qIGl3ofMZN4YGC3+hkJsdrAC35OHZlbE6ayWuOboDj4=;
        b=AOKu0rQGAPRObTx+6p6GnUpG0pEmCUGTTwXq+8ih+02biYam36xAtJAhIDO4Fb0Wfd
         cjFwv+rTymoW1M/ma8AutolodtK7TnrziSDfkgjohlVI92wvbTACelIt6HAhHeh2qzsS
         iyCnb2KG6veF9SmA1NNyGRn2M0jTungKwKVQL+/F95jE2/Dj6Q4ictyAQprkUHfrbzYX
         69E1+zZnqwYVTfjWygZPo3nG4Hppv4OOZCk0ycsX3NZJRxi6qizo3FzizupLF58C+yMX
         zhTIad1HgalPQT2qGqMqYwvrzxlD1tbXiAbYYiwW6demQiscSnMnpo842m9ONR5MxAkZ
         mIQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHvo1Iu74irn6kEdZEgXc3EBrfIAL+er9m+/vvLAGz4HMsgpj9l/ubmiioNyEUWxYw7WXtTZ/DuLI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVlcOa2kTnmg4O9O9twqanHtJMVo/l6oX1tV2ejpUPW6aY7qmx
	pDMdMRJpuVfEI7YyA7Gfz4EyVDlRmQVW7fog6Ow04ced/+775FYRS/fq1VGb1+C4GiM=
X-Gm-Gg: ASbGncv5xB6IOvZwg/4HNzi3+dyWZDwudjyfkET+9RrdQjVYB5lKoh5LhgEhRNeMnLy
	3zaKxf8iSbGuP07u7yqNDkQPhSSSaBb5MgAYE70CMydX63hIytJ0gRmgfpL0OsEjQdXVyQtEivq
	l0HKYpERdoA2bZU+78uvTIDZ7rdEDvACjRa9S9wbSsMuyeXlNzhQG2iuZrDxqAaI6xq8j7EG83E
	abIiwMF1H1LfjIO31A7O8RripI4Suwh4bGjBR3Lu6ahG++G+GB9WiANeHrJYdXxUjum3sZDhX3e
	6eoe9UhI1gf+X5wfRylp7c/Pe2ytJ3Mg8r9qqV1DLqAQp0+hWxpfl+ySvsVqIHdBVg==
X-Google-Smtp-Source: AGHT+IGiIzBae/Gufxz9lausYNLZM0rhTyqOuwPMyv4+f1cfDIVfKWfit+8EynHpXSbDAsUNoJUfhg==
X-Received: by 2002:a05:600c:3512:b0:453:78f:fa9f with SMTP id 5b1f17b1804b1-454d52fb600mr47227905e9.11.1752128004704;
        Wed, 09 Jul 2025 23:13:24 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8bd1741sm928783f8f.18.2025.07.09.23.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 23:13:24 -0700 (PDT)
Message-ID: <e653f4b90422ee9ac09c62292dfb7a2af1f897d0.camel@linaro.org>
Subject: Re: [PATCH v4 02/32] dt-bindings: clock: samsung,s2mps11: add
 s2mpg10
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sylwester
 Nawrocki	 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Alim Akhtar	 <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas	 <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Alexandre Belloni	 <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
	 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org
Date: Thu, 10 Jul 2025 07:13:22 +0100
In-Reply-To: <20250409-s2mpg10-v4-2-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
	 <20250409-s2mpg10-v4-2-d66d5f39b6bf@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+build1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-04-09 at 21:37 +0100, Andr=C3=A9 Draszik wrote:
> The Samsung S2MPG10 clock controller is similar to the existing clock
> controllers supported by this binding. Register offsets / layout are
> slightly different, so it needs its own compatible.
>=20
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Friendly ping - can this patch be merged please?

Cheers,
Andre'
