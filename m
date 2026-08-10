Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73280435A87
	for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 18:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385201; cv=none; b=BF2rPSg1YqSJ50Fr7hDHugdcuDfShxb7WndLi9HgivnyuHJ1nAqDdjFloOLd2K5HVyylHkw35Lw70Ku8BRd0T8H+ZRI53kmDYLfB+gMnJrpdvihHwg8T34GbivXsyFMmWK4OlrclrwQaKx5yZStf7MWTP3YP59thjdUuziRh7DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385201; c=relaxed/simple;
	bh=hgcymRn06CEzZYivG2OYevh3C3pdHTxTa6lD6AY+ufg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JMHs/jPvQx2yiUgJPA2jy43Jfvo4KTuzwbQu/eaHAAu94/YFva1tkeVGTVJcP2klw7JoCFn3jcSOHpCk25mr+sx3GsxC6IucQdyCnhGL6QhH8iXfhaKLdmI+HbKVzxnXk4zU6aW0uhwClR2yy4k0XIRZX+b42KWwLWBYGQqmX0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kh5VROtZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kh5VROtZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69F661F00A3A
	for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 18:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786385199;
	bh=hgcymRn06CEzZYivG2OYevh3C3pdHTxTa6lD6AY+ufg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kh5VROtZSFG4V4setKEx58r+aXrbRhkM81FNJEhyhDuJ/kqBlm2afkySKxEryEAjI
	 kjgF9+Rzmf5899CrwmI6A6BinooXbmJ8xOLd9j5nNWR8EJGqVS7CIYJ65g3JccUAhK
	 YSmjSLQ6tdF2Y+sk8wXbvIY3/urHkouBnvsSMyt8ImL79tDL9CVLuRuUTvRzGEJe4b
	 GVn6NHwdDrRcbH48z1LRvff7doLUQD+emJgzW7U8p93t1gHIChWUJWPOGYztkhp7Qq
	 zPpEsDdJX8prSupqD4Jhu/aXxeLWDPU8oTBtvhBCbxYXte6I3F09YVBQlzRk6BCsFo
	 sHjiQQvHJfAkQ==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aec6360133so1787430e87.1
        for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 11:06:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqxofZ7YT795Iep5fKrotfgyZcquHBrXF/o1tjmOWk+NdR1i+wjC+MKhWnqkJ4meTLamXo7knfmETU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTjlGHzJjfp1V+sVVBzwjxbnS3ejAFfKj8tfBXTJhmENCI4b/X
	jdPVDSyNx9ExPHBItsFJoPrzp1Mnn/TW3zjoHPHTGqMCAKq9OkevPr4EvBxDjNhlfLb9LYYTde3
	/uMVNoQGNSlA5EAq7dSvpJn0kIMMF4/o=
X-Received: by 2002:a05:6512:baa:b0:5b2:f437:2a88 with SMTP id
 2adb3069b0e04-5b2f4cc7be5mr5978880e87.36.1786385197772; Mon, 10 Aug 2026
 11:06:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
In-Reply-To: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 10 Aug 2026 20:06:24 +0200
X-Gmail-Original-Message-ID: <CAD++jL=kW+K6noeaO9=zktgveVbYmbZsWUWo3r-V0S7V90FDLw@mail.gmail.com>
X-Gm-Features: AUfX_mymdEhf6vtyoDczgdrTd_h0sSGCYBoPOdLs8lQcTMbtLbfi04PfIu1dDG4
Message-ID: <CAD++jL=kW+K6noeaO9=zktgveVbYmbZsWUWo3r-V0S7V90FDLw@mail.gmail.com>
Subject: Re: [PATCH 00/15] Add initial support for Qualcomm Kuno SoC
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Georgi Djakov <djakov@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>, 
	Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 9, 2026 at 9:27=E2=80=AFAM Hardeep Sharma
<hardeep.sharma@oss.qualcomm.com> wrote:

> This series adds initial support for the Qualcomm Kuno SoC and the Kuno
> IDP reference board.
>
> Kuno is a 32-bit ARM (Cortex-A7) Qualcomm platform. This series brings up
> the essential SoC infrastructure required to boot to a serial console:

Is there some special reason why you are not posting this patch series
to the most relevant mailing list i.e. linux-arm-kernel?

Yours,
Linus Walleij
