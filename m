Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FB922256F
	for <linux-clk@vger.kernel.org>; Mon, 18 Aug 2025 15:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755530188; cv=none; b=QUh/6UTNgFMEGjD/bOeUAzUHPV2Jzbw/cbHDpafQKS1rhGRRQbIx7J5neiJS2zyBpllUTlMuDSMuVatBKsx9OfcQN2YE7/e5WXpT9ey+JaruLCYnE0AFVzpVsh5VaUUqNgVhca+LyEtQ+GHWUdlIBGmuLwnAybkj5JUiI9yBgeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755530188; c=relaxed/simple;
	bh=5l8fao5tyyCXjqpBW/epFwUkG6rVSrLdqtcUPVUunrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rXK/VZreiKzFZ+Zc7wkeMu4cMV7DU2BqG1MPTEjm9yXPM0l5gmzeTteu8jAezysyts12tSVRu9sDehsfrGsw9eRJ1wMVUKV9gmjDbge/DIiuKU2msOcovMQqutAsseN7Jd6DDVwc4zZQp9MflH+oMdhsPpDtkHJUyZEf+zeaiKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DRWiZ4Hh; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DRWiZ4Hh"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-333f92f1911so31292771fa.3
        for <linux-clk@vger.kernel.org>; Mon, 18 Aug 2025 08:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755530184; x=1756134984; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5l8fao5tyyCXjqpBW/epFwUkG6rVSrLdqtcUPVUunrE=;
        b=DRWiZ4HhajMQipwt5VgmjcjbAgFaTzu5dOHCeOm8wgz+TuTymCz3Xvd/uvYowflnks
         lrPUb9WpvXqwR2eiUgXD5DaILJHL4ll0yk6n9E51imjvtNfsB6+jHcm9+7OZtJAtZgPY
         v2WS/ZTXfyu44y6w6+91J7nIHXoSwE9AIFXhyiUDxpghkjtNSil9+/471Z2jN+wHjS4W
         ZgRcyuG63jZ5CdapfpZhecMM7MLaqO3g1pupwEtO520OXuyVXOiKUTgTROGD/9Qmmr4Z
         bSfSz6+4OiGUSVq2oSXg2mgsM2DKZa0W0ImYEG/fiVKnJFiZ00+eOT6IC10/IYlEpyrA
         s+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755530184; x=1756134984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5l8fao5tyyCXjqpBW/epFwUkG6rVSrLdqtcUPVUunrE=;
        b=ug4A083gLYfaLE7a5zzzA6mGi/0bo0XzfsKTtAulo/WimMueMU+KOilpzfsTWZTFNK
         VAuTgvupRgAIlLsDVk6mCpj7+iOiGbkO3vEaR5bGh6CxcWgsfkSiN8eDRDKIXe54lWQg
         ozcOOzy8+AYibmvWGb4eW9NsmE05ZZB54TvZ75pQMxrYEiKP4RJK/YuJ0WWHXWJ5bLgL
         ZQlVqYg8vWkLhu2RVZ17D4tH840VH9NE2t7l9EKPnDnIHluzChsQsWH5t3kq574JOsoO
         6jItnb+4H+9EGZzDmlvKeRUKQZO1YJ6ZIYKhmhzKXXlRWgae18Q1cgikpdtFZDDre883
         yJFA==
X-Forwarded-Encrypted: i=1; AJvYcCX9b7SrPUQBYtvQ5OHKqAyj3iCvtWEmxnddTsqZYFbSZW3lmajm06EbU7BZsACrsAnHhIUiZH0fOkU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyj+rwkkNGsuZumLxblXm/n7g2f+g/Eysv5s8uWWfspMxN+sp1
	Z7b8C1xjX1lUPnOMM15tMmNeJrsjzi9QRGQmpVNb7La+EKMTVZVAzQDaefxbs6oRkSYFZ3ta9cU
	nFIZWMe66L9hyWkh/NjQA0W8qSvAjWUrlEbrWHi3HLQ==
X-Gm-Gg: ASbGncvR/1vISd5W1beP6xXFXEq9Gg7ffHNrPZdp9uHKJEr+l3yTeg0rUb52DiU3e/X
	xzUAOeqDEk71TI4yUxOFKxOJ8Xh/e/N9uQXqsip0w+wCB/jxUKqVHCCUtbTkSUOb6I0j3HZIdxA
	EskFPmQrWwT2xalhSkZKPYFNgoE/fG5vPLIvptuvB3BRIXpTGq5HAN8667ackE5q1+T/ryxdZx/
	GH1KCQ=
X-Google-Smtp-Source: AGHT+IGzqxCnqLVvPxKCko2DlB85KniY6TF5HHlMzLUiXgvNhvXoucfmnrbgjKUH/ALtayc9hnqKx6ybbX/dLc1uNDE=
X-Received: by 2002:a05:651c:198d:b0:332:4528:c0e0 with SMTP id
 38308e7fff4ca-3340996011cmr37441011fa.32.1755530183649; Mon, 18 Aug 2025
 08:16:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com> <20250801-mtk-dtb-warnings-v1-7-6ba4e432427b@collabora.com>
In-Reply-To: <20250801-mtk-dtb-warnings-v1-7-6ba4e432427b@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Aug 2025 17:16:12 +0200
X-Gm-Features: Ac12FXxjGtIqn77Wg-HXxURZEtSYdu71ByUfcWhpILl9XIWrUY16-cZaSQJoAaQ
Message-ID: <CACRpkdZpUhPERPFvNTwormrqz-H-5VUDaOrRQQ2ap+Oe6YN2Qg@mail.gmail.com>
Subject: Re: [PATCH 7/9] dt-bindings: pinctrl: mediatek: mt8183: Allow gpio-line-names
To: Julien Massot <julien.massot@collabora.com>
Cc: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Ikjoon Jang <ikjn@chromium.org>, 
	Enric Balletbo i Serra <eballetbo@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Weiyi Lu <weiyi.lu@mediatek.com>, Eugen Hristev <eugen.hristev@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Julien Massot <jmassot@collabora.com>, Sean Wang <sean.wang@kernel.org>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 1, 2025 at 1:18=E2=80=AFPM Julien Massot
<julien.massot@collabora.com> wrote:

> Add support for the 'gpio-line-names' property in the MT8183 pinctrl
> binding.
> This allows naming the GPIOs, which is already done in several
> device trees (e.g. mt8183-kukui-jacuzzi.dtsi, mt8183-kukui-kakadu.dtsi,
> mt8183-kukui-krane.dtsi), but was previously generating DT schema
> warnings.
>
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

This patch 7/9 applied to the pinctrl tree.

Yours,
Linus Walleij
