Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583B224A06B
	for <linux-clk@vger.kernel.org>; Mon, 12 Jan 2026 14:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768228496; cv=none; b=dPYP2vxkviN4KNczN+NWbrLy6Z4Crp0XhIzk/uN314or5ecKoLEl6tL4zJB5KWXjM/gTx2Oy5oFpfrAesiJCjxPo3fkHng5EpptnbBMehdraKLgi2quF6VXGghgmyLiCUdMMNy6MKUipoRCXevaLSLf8oZWa/lS3Q5plMrYrEyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768228496; c=relaxed/simple;
	bh=I3IZav8x6KeIVwEYXoT0Fb7mxh2EWJMO+2D6AGLXtFI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W5cVALuLHbK4wUXMzn0SnoQAWrzQzIoz2DdFdwwRS5OJi/l3YeTkRVniypw+hp3ej0yzLzTopGesInB4HB92wUs2KCBquI9e9WAasO81n/Yi0+MVVq3ZHgTLzE/MC/MesKSQcnwaa8PIvvkU5N76os2+5cSDV596cAFfbUW5Dyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gkS5X7jr; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gkS5X7jr"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8bb6a27d407so629432485a.0
        for <linux-clk@vger.kernel.org>; Mon, 12 Jan 2026 06:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768228494; x=1768833294; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I3IZav8x6KeIVwEYXoT0Fb7mxh2EWJMO+2D6AGLXtFI=;
        b=gkS5X7jr+akI8rVuE9kjcKgLg4gfxOThBHc5TK0PoV8vwy7Fb7TTsu/ju/5018ieQl
         MoXs3/v2XO7ctbjnBjlFCuagSNnqdetcpOdTFmix3pZKca3vvojMXjKlMpYLnnYXP97s
         x+VtP9WII0GwVT/RjGXLiFUyftFuEy9EpQB4qCOZI7l4t3kcm/pil5HGv5l/k3SIyJz3
         6cSY+Zfwz2EIZE0686oOU2GgjYOTtr+6BoWDcSA7GTRpsx0Mtq9YSpePoMC75dsPeLOg
         0Qvv982vlxS+h+PkwicEQTiDM3cnLi3cxs9DJTayOgHzipepqSwkrMSmhEQmoQB5fWzl
         rSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768228494; x=1768833294;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I3IZav8x6KeIVwEYXoT0Fb7mxh2EWJMO+2D6AGLXtFI=;
        b=TmmI21cQg2pZCnVi5u1kRI5KRymil3GCm+jc3YVORYFr9AlyQwW2nZvzxtqpp7l1Oj
         /P01TdK99uWMgNDlwNGhGh0KxxrInqRaQanYXE3M00eJWyFXqm0/WjhWcRXZWUjUP1rT
         ayyO4EJQ0bjUzIjvO7MdQoPcUTBdU45+93zP+wkZdtucqO+8aYeIL+/aBmWi+6DrWOJw
         2GnDxPTFEOUJDJ8btGCanXXRAChtqdTbut3U+zClQS2yCuhJ9P9nU+C3FEhhRdZxLzw2
         L5szNpVzh6MP7FX/84lhU6xkobkgjxflYDyKpeSpifthqXOBAKkjRPZYnfHbg59jD9RW
         H/wQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfxkvKV9bNzE6t2v2pj376w1TG9vumvCnm+zBblu1kX8BPGtS9VWhJOze0JLTjZhtT8XxvIuLe4QI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmRSJfh2WOorbjuuDItc4M5W3kDMao1gHgw7lZNFgnwaPrZWJ0
	B875aaIhazKnhXTPpCRUx+RWTiTm3x20AWsLIAkeLoAO1eCxW9m3XH1oAKNN2qqx46w=
X-Gm-Gg: AY/fxX5ASlBAC893Na7KqhEtydmhT4ByXrvWcLmQBdsEjTlWKbsI403v3MuTNlRFAeP
	2OdgMXJvpOZi3ulhh70g/t/zci22ifKBp+bKZQiz3tIp2/A+N+vRDAnlJ+KTj8i9HUFXjlFcNf5
	2dVmDYB+2OWk/KIfj1jjf8tGkrDR9MYPWmf7V4bh3ZPWXLfAFhVWgTgr4IOpNeUsh8iJOdeHKMg
	l5XVt/RWzckfiUn4fZnz+hgVR1K/I9wD7RAm4Rt3WsimT+XzT3CWXaw0PY1MqoUXqoD9INOXE6y
	omwJnraO7J06x+czI9gL8E4tTG9e2t8iRPZd29+RuX2yZdV04yk45FW3sq5FqoSefbHGbNmPvlt
	pOiRngvjuVXO3xXG71y1eBcyHlNjsVZEG8dfK4DZmKNUmStlBDszat0/p8Yn10Rw9dibdmxQIEI
	sIgz+2WKD1qieKIptoAWGm5MvLl28=
X-Google-Smtp-Source: AGHT+IG04Y7YMmlOxxQtJZWLENiUI2pQKTZxZxtP13zxTopqbGg/cTPtEwR9TRQdWUjb986bpAHcBQ==
X-Received: by 2002:a05:620a:4611:b0:8b2:f182:6941 with SMTP id af79cd13be357-8c3893dc9cbmr2437032985a.57.1768228494337;
        Mon, 12 Jan 2026 06:34:54 -0800 (PST)
Received: from draszik.lan ([212.129.79.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4c964csm1519599785a.22.2026.01.12.06.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 06:34:54 -0800 (PST)
Message-ID: <f9141db956695fd9ae34f86eeb4f3f71a78d5646.camel@linaro.org>
Subject: Re: [PATCH v2 3/5] dt-bindings: samsung: exynos-sysreg: add gs101
 dpu compatible
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki	
 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	kernel-team@android.com, Will McVicker <willmcvicker@google.com>, Juan
 Yescas	 <jyescas@google.com>, Doug Anderson <dianders@google.com>
Date: Mon, 12 Jan 2026 14:35:31 +0000
In-Reply-To: <20260112-dpu-clocks-v2-3-bd00903fdeb9@linaro.org>
References: <20260112-dpu-clocks-v2-0-bd00903fdeb9@linaro.org>
	 <20260112-dpu-clocks-v2-3-bd00903fdeb9@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-01-12 at 14:16 +0000, Peter Griffin wrote:
> Add dedicated compatibles for gs101 dpu sysreg controllers to the
> documentation.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> =C2=A0.../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos=
-sysreg.yaml
> b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yam=
l
> index 5e1e155510b3b1137d95b87a1bade36c814eec4f..9c63dbcd4d77f930b916087b8=
008c7f9888a56f5 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg=
.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg=
.yaml

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
