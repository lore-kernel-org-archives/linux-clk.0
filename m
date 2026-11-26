Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681875;
	b=0czw701ppVrJLA4MKX+g1hoYLJ6ePMRnMNh2pLG4NWcMRixu+CEZyfKCZXaGHtXzYY++
	 TbDvGOYsWQG9P8wHk2tNsURGM3RcVpdWfAy95vn33ZvWvaa5o9vfCvV6Am7ncoRvQHS+m
	 Ppi/3r9EnVaFqcqI6hpLGhdbzjg67NFYB4+dUOz36EnCu9OzDEAMU7XM5DnYGH/NEJJ5M
	 badzQ9ssYwiF9+ZT8yC+HWkbTeypd8OlMR6pyiIZg7orrXUGnI7ojJpzdtLG4gHIZqJHE
	 woFkxdR3GRrdeq15Y1Flixyq1Upk/Wosp6mx8JjN4whY/DrslL99AWhzhlsqkAqmv/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681875;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=EOFVyGyYJqU+rNVdExuIa/A4KCVvlE3VjOnDJf/GLKc=;
	b=gm10rKU8BK5rPJfJeh6PhHcCs2UapeXqnwU5mDakqt7339mBNPB3W8WnalysvRzaF1/H
	 kT3SIRp7XQYHqv1gj+EKCczQ9xF8vHFB/Z9NA0tyRR8dFc4cTCP/+n2kxb+ubEgxXifqa
	 MHYxFGfUzKKpV5c7v/oVGX3wIRvWImHAjHfVbmF+ESRHRCAeQ0G0QMOom+pP8SoQibdfV
	 0qvvCYtgIPZ9NXh50Wf+BgkYj2KkPilDBNw2ybNzldiDS56BxjTVU87gMtf8Lz7oDE1bu
	 uaM9x1qvc67NRHNh3u4joDWhQ/RETYZBTP7SJbyjUbhj/0Cz1qjxHMmUlmcdIYSqhxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kos7nORo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051DE606A31C
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 08:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kos7nORo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B491C1F000D8
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 08:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795681874;
	bh=EOFVyGyYJqU+rNVdExuIa/A4KCVvlE3VjOnDJf/GLKc=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=Kos7nORo2W5ieReE58LGqeTwKL9Ui9j7e+fXVsWObncWqZQF/zyQDNDtPMsu7kZot
	 4JaTUQlT2vA+9rauHVdYM37L4AzzMcxwvzgiVZ6Lr/1CXh3ts5xvvE1v/Yx7Dh6sRD
	 MWm3iPQ4OHwDJ2eDJBIwch+4m+e+FKW69UNVzbIm3bRIMm2S1SoMMP8oSXsXTDSFtR
	 EXH2PWF4G5zXtRYrMSVl4bOPodP88IS7GnWnYPcev2FO+oDKdWn1sXiLBC+A8bhvoZ
	 0jmGgK6flR/THCtKPLIkUq2ugs8dIEMgnyQ8e7wWI9e/ZhStZKd+nxTTiIrV/rSZa6
	 LsAW2PBDn8KsQ==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ae85e3685cso45651421fa.2
        for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 00:31:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEMYXtsfVlUb6aSJVmvTnYT7WqAqGDf9QGEsbx8KLVSU7CkEDEpTqVUkTEblasN0kLxBSCb8bmgDhg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nanFVXHc2D3DfN+Aqvte6+ZinK37ShZl7sVdJwcUPnEtKbgBp
	vyTWVKS19ZI7npGuzzaAMDzze+sWdqVuc7mL0sMvA9IGK9RQzK4lNwqufiV79GHzEqHJrh+v6YA
	QvHKyeLbMalYm+ecnL1j/0BfWJ9fV8A0=
X-Received: by 2002:a05:6512:2255:b0:5c1:ace3:131a with SMTP id
 2adb3069b0e04-5c1bc8661damr5652240e87.48.1795681873045; Thu, 26 Nov 2026
 00:31:13 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261126-a35bb25eb5-u14-0@mail.sdu.edu.cn>
In-Reply-To: <20261126-a35bb25eb5-u14-0@mail.sdu.edu.cn>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 26 Nov 2026 16:30:58 +0800
X-Gmail-Original-Message-ID: <CAGb2v65-HypXGomrmDzq6fK2sbF5NwCXmGDgfKsJ_UhBu18YLw@mail.gmail.com>
X-Gm-Features: Aa3M54o43cu-6A0TaGG1ukqNIvNBVoMGzQ0_0epz3dGZK25t85Du9OaBaHJIHPA
Message-ID: <CAGb2v65-HypXGomrmDzq6fK2sbF5NwCXmGDgfKsJ_UhBu18YLw@mail.gmail.com>
Subject: Re: [PATCH 0/4] clk: mediatek: Unregister apmixedsys clocks on unbind
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: angelogioacchino.delregno@collabora.com, sboyd@kernel.org, 
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, matthias.bgg@gmail.com, 
	wenst@chromium.org, drinkcat@chromium.org, weiyi.lu@mediatek.com, 
	msp@baylibre.com, fparent@baylibre.com, linux-clk@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 4:27=E2=80=AFPM Guangshuo Li
<liguangshuo@mail.sdu.edu.cn> wrote:
>
> Pair apmixedsys clock registration with removal on four MediaTek SoCs.

You are checking the wrong tree.

This series is mostly obsoleted by the following commits:

c9c2fd1a53a4 clk: mediatek: mt8516-apmixedsys: Switch to common
probe/remove helpers
68d1fa487766 clk: mediatek: mt8183: Switch to common probe/remove helpers
9421b0b085c0 clk: mediatek: mt8167-apmixedsys: Switch to common
probe/remove helpers

> Guangshuo Li (4):
>   clk: mediatek: mt8167: Unregister apmixedsys clocks on unbind
>   clk: mediatek: mt8183: Unregister apmixedsys clocks on unbind
>   clk: mediatek: mt8365: Unregister apmixedsys clocks on unbind

This is the only one that applies. But we probably want to convert it to
the common helpers as well.


ChenYu

>   clk: mediatek: mt8516: Unregister apmixedsys clocks on unbind
>
> base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5
>
