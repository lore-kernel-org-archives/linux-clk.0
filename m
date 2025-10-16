Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768F2303A18
	for <linux-clk@vger.kernel.org>; Thu, 16 Oct 2025 08:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760603025; cv=none; b=B86FvuNssmiMUCepUcVCYZx42IKaoeGGbzV0iWAqKN8pxom6OqcxgeoCg01TsSnnStGQUvHgfKPkizAK1Yv6rFHYGzI10Lwhf+Ed4qPyq5lShEXp+4wlxjCNbnDy84QNCxo2dW9uHHE1ezs0Rik30vMAJ3DKfFamSNL9elMKsYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760603025; c=relaxed/simple;
	bh=zbBU1GRxOkLD2pr5cIJcjpIKGOaE5sykVLD2xdcq+os=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YPo/KeYAoP5ttcTgORHRkVh5eCs9eOIObWTzqJgYagTpjhGkgXUn//L1w7LihZwEnNE//sbrhu+JKWCoy8DCVNwWM9rft/ch4pX9KbbdAO2RypxuWz6tuG169C+UNl4v7XJlxUPGuiJ/2EKW0wJ6Mxmfa1ma6QMJEG5rY51dLms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pUqcMiOp; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pUqcMiOp"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-639fb035066so739027a12.0
        for <linux-clk@vger.kernel.org>; Thu, 16 Oct 2025 01:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760603021; x=1761207821; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zbBU1GRxOkLD2pr5cIJcjpIKGOaE5sykVLD2xdcq+os=;
        b=pUqcMiOpen1dP2tO/C1PaT5vDhHChyax9i750TmMzYSo6zLf5D3o4RvAdLhGXwcXwf
         vnp4AiFfpumaIyXxfEp2SNr0fD7MWKma8BU3EenDAz2h3FaYLIWBBprjiOGFJfZt3np9
         QEA5gUIvsrpdYyVfZX6fAzHtSeKhQXFD1gZWVZ9OgsGFNYu/qU2RP1QmzpeMKTdbVw2W
         nuWvtiPl4efZKHmHvF6vIFP1q/dogIMugjtqubsh6+xG8oU2rlGj8ZuXvVdV9yMtZ+Fz
         m3iyfs+Pl3Ynfo6BDizDs1RriVQiJ4ZzU6TGZatnZxRkfXgegBpZTJvTinxXtgrWAhbZ
         Mnzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760603021; x=1761207821;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zbBU1GRxOkLD2pr5cIJcjpIKGOaE5sykVLD2xdcq+os=;
        b=iq1as2MLFkNOw1jY31OOFfuAR2ZQS5xm+hUrP+t9MTtUD3eql2kbHZxZdZNHVFGsv2
         wIDj3d8C+ixKRysT/q/i5sblwYjPe/CARbiIGQuj0wgjwXoXQYPjeybW1OpQmODG/84K
         0lXMSV8CXrfRvjv+3tQfIbKcBp3oyXBnOKpGH9pZggh2ad71OMAt39bb9R3xKb3j8aSf
         K4nXIDD8CI6HdZrH3ZnGK5+p3ms68zsxmwcd4MqjnXGzH4jYVGJZglQw5OG0douYUoa7
         PIGEtMIoZMgf+PwTs1Q1sECFeMTAwrrW+YGCRboaAV/IjnJTxpZ+MGbbBibWQx7jjy8N
         1aAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUk6K27rb8v7JJpjtW8MZtckLArrQ6LM4IXvEo0npr8LMXrDYWn12vvObCvhj4a8oi4RrWeVL7/gZU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmmf6sd0YYH1bnfQy5hHc8XI7/bcD2GPkGkNu4Kmq65M4rAfDa
	DtHXuLwEWE/RrErPdRyIAtJ9F6ZqOJw3eqsCYgm1tggcNT/0iC40HO/0hOKwZkHglH4=
X-Gm-Gg: ASbGncuZsc+Az2Avl80JhZWOmsyOoj7y9nAXvaNe63bRZpp6uRIt8mLDt6aDxnXsexi
	zDzET59jAPD/YI1WmSALdKS3T460KJqXVGO7pFx95zBWrMN29TymjDAB2yA0t2/PM1o9wRl75KF
	0kKSEX8fh/yhVjpwJfZbliGGCgRuiMtcJp5+hMoGpwvCl/9fsw0LbUapORjMFtZXiKhl1JbAIwe
	bp8rCTjNWRHeT2yMx5QtfP1WkdgG62ZznhyJagxUEvuQhiA7hF8fC0sCkLI807i15aQShpDdOeN
	am/J5/eT3CwEHDiOcjPnvlhv9+aKG+96TEiaIJ/mvaWIwsbrzL5SQZlFr91w/xy8xYJnDtf3pCJ
	5BmPA+6029DlZ9vQxRsjRSv+ohZtOzkZgTHJ5fB6xc6psK/7MYwR7cZz6n5cwICYpFq2MxhLNvb
	6EZrk/9es=
X-Google-Smtp-Source: AGHT+IHxUnUcoHUcFtyP0SeT8nrAVOhELQzl+mJmkJlg9L09uwKru3NwHd6GyQw68Ab0pvVWTAq0+w==
X-Received: by 2002:a05:6402:26d2:b0:63b:f909:df50 with SMTP id 4fb4d7f45d1cf-63bf909e210mr4148941a12.14.1760603020784;
        Thu, 16 Oct 2025 01:23:40 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a52b7144esm15099610a12.23.2025.10.16.01.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 01:23:40 -0700 (PDT)
Message-ID: <17643995510406a50157a808ee4191488f24f97f.camel@linaro.org>
Subject: Re: [PATCH 5/9] arm64: dts: exynos: gs101: fix sysreg_apm reg
 property
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar	 <alim.akhtar@samsung.com>, Tudor
 Ambarus <tudor.ambarus@linaro.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Sam Protsenko	
 <semen.protsenko@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, Krzysztof Kozlowski	
 <krzk@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Krzysztof
 Kozlowski	 <krzysztof.kozlowski@linaro.org>, kernel-team@android.com
Date: Thu, 16 Oct 2025 09:23:39 +0100
In-Reply-To: <20251013-automatic-clocks-v1-5-72851ee00300@linaro.org>
References: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
	 <20251013-automatic-clocks-v1-5-72851ee00300@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-10-13 at 21:51 +0100, Peter Griffin wrote:
> Both the start address and size are incorrect for the apm_sysreg DT
> node. Update to match the TRM (rather than how it was defined downstream)=
.
>=20
> Fixes: ea89fdf24fd9 ("arm64: dts: exynos: google: Add initial Google gs10=
1 SoC support")
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> =C2=A0arch/arm64/boot/dts/exynos/google/gs101.dtsi | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
