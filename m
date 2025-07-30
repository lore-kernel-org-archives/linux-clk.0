Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF582E0B60
	for <linux-clk@vger.kernel.org>; Wed, 30 Jul 2025 18:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753900205; cv=none; b=EIh+yAKzG3AGNO83FiT+E5lUrj51qV6m6EanKWhCA3qfTV/ygPiD/0U8U/OXAce79assVCMuVqlrq5+nULFOaOQaPHAZK2ZGrXdLfX98LaG6ymVFW50d6N/fihLP2hdRrRE2o//QGn5D1SwuFy0ApDDn4kzjWbGrM49EtdYQ2is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753900205; c=relaxed/simple;
	bh=+IlnsvCqZpWI1irANdU7vC/52xTZuuB1B7d87Am81c4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OOgjclZauDJwdbvAyIT5OnxWjBo3gYEupC+VdK5oonOjuPiggh++HvYspVXxShqXfDRf+bfmClscnfZTwP8uKKqqLDcpGbOc3OlHnrhR1NVb/1HIflSe066bp1BTL5gcW8RnjejrHnfeG5SMuYBLXA3JoU1n9TlmPx0t9eWRmNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OUHEnhZN; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OUHEnhZN"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso1790a12.1
        for <linux-clk@vger.kernel.org>; Wed, 30 Jul 2025 11:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753900202; x=1754505002; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7NIbM6q1x218b7Li1UvxruEIMKkwKF1Zyv43mPS1uqY=;
        b=OUHEnhZN94w5azEkzVDqwNxQbrmR0zEibAM/XasVXnXVjGL0j7E7BmSRNc+bAz7S4Q
         53OPHMTJ8fiBPfeF/8akZnLWWqMP0oSwW/rPr6lwyix61oSq2QbHVphJihJovHmqTBDy
         SLaEN/tShBtJW/9eexd+z/Ov+KVtC7ty5Btf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753900202; x=1754505002;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7NIbM6q1x218b7Li1UvxruEIMKkwKF1Zyv43mPS1uqY=;
        b=Zn2EFB8CE8HBp9ikhz+0e+jw4FawNb2iITT9hlUTMvgcmDjq5rvKajoGex1vJclCHr
         99qXdKlMtnavLC3vajWJkhyzzriMbb8zmelxJOxMnbmmgafbaHmGysDCiQgFOc4V+JeM
         iKkmPKONUghEZdG+qx8QCVIYb7laQcWj3NfNU8dIklbkt42sFhGgq89EuB7QV9YKlg1G
         eP1Kd5+JMOD/W3VTiQWSQ8PUQVYA/2kol7gCfiRAutuv3ZdbR+XnZpu/aHGaaZud3fQf
         Ko5e2A0R9xtUO+9xSczawESUIhdmdDBCN+dsl6FnFKhCAXmVlaYnH1XjJIPiWpT651T0
         fvzQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4L9XZdaOf7lrEU6PpH328sGjweZT7SLsTe2ioR4QJoV9HJhGhiNVfTnuFAwAJAMWb7zzlxgjeLS0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+iv4tloz0r9giQw33iHYsCYvjayu1QfdmM5AjiNI6j+KJ0o9I
	pom4DqpmE4nzumgVTKZ9vVe+P7ZH1m8Gh+eUGRPV4stxEwLw1NdVKJ8hSCosWLgH2U/R0AKOqLu
	37BV5ABjVSeM4uuno9RF0gTylRDuUxQXZYnjeUHEA
X-Gm-Gg: ASbGncvfS27SpJUYrK6jlTEwXrewaGKY89mbqWGINPFKPkJoJ//z3xyJhGEMnpVV8zj
	CjdHHKQ8DidCekAN9Lz0Ss0fQ8nN90RWUtXuhHZCL2G5Kqwt6wJiihAgU3bUghznyPs3Fkhvmt/
	te0arnyNzlpy+jsLpsL2eIyahdFlmbmfRWX3kIbnOx8GpiwAOyLJztcfh587YhguN2afe660uDx
	rJk+KY=
X-Google-Smtp-Source: AGHT+IFbbK/ul5EAl+qpurW8QCD6MUFcOByL7/YGvDuMq5A8bS06QIOt2f3QRAN6xuePrLmBIsEPhHn7xYqFra8YQrM=
X-Received: by 2002:a05:6402:d50:b0:607:d206:7657 with SMTP id
 4fb4d7f45d1cf-615a5f03c3amr15582a12.2.1753900202156; Wed, 30 Jul 2025
 11:30:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250728-ddrperfm-upstream-v5-0-03f1be8ad396@foss.st.com> <20250728-ddrperfm-upstream-v5-6-03f1be8ad396@foss.st.com>
In-Reply-To: <20250728-ddrperfm-upstream-v5-6-03f1be8ad396@foss.st.com>
From: Julius Werner <jwerner@chromium.org>
Date: Wed, 30 Jul 2025 11:29:49 -0700
X-Gm-Features: Ac12FXzJRbNK4O4rQzoS61E9llbPlM-a0El1zXFqw746Wesi6zAN_YlMACvZJkI
Message-ID: <CAODwPW8ZXfMdFL2=6ht+BvQq5_LQkwHhQJT5j9DcseEx9naXxg@mail.gmail.com>
Subject: Re: [PATCH v5 06/20] dt-bindings: memory: introduce DDR4
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Gatien Chevallier <gatien.chevallier@foss.st.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Gabriel Fernandez <gabriel.fernandez@foss.st.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Le Goffic <legoffic.clement@gmail.com>, 
	Julius Werner <jwerner@chromium.org>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> +title: DDR3 SDRAM compliant to JEDEC JESD79-4D

Should this say DDR4?

> +examples:
> +  - |
> +    ddr {
> +        compatible = "ddr4-ff,f", "jedec,ddr4";

This is not a valid example for the way you're defining it now anymore.
