Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794538509;
	b=dPr74ypqVOQg+rw5TLhCSAUQVn2PTGF7moYJU6U78NAnwIqmh7/9UQW+oJmXd5/t8fFu
	 9IF0GdceibexOjur0VUbqSL/NSUMN3VkrhuNbwN+htm/sOHoHgxZk8IqP9GQlRNHFXbwJ
	 Q8rU7/UihLZ3WpmRxJFJHUwtwOcES9NYAn5FeioZR3LaU6S2ge0QecWVt+uMYn4g7ztRX
	 9jrBRTl9G01+ATTIld3OUWgk1TtkfctMVoo9eDL51mMsKh3iiieG55NLe9cGpdeRaXnk1
	 o7nki9kNgpFboVtN12gVb6wLR0oTX0x0v/kU6Mv7bjbjiormXnGtMTvBX2VbIVAk/Qg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794538509;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ww5MKM6poDK+IczcuuMJkcSdFtjq/phga8CrflKC7U4=;
	b=P9bUmbuPuflAfSb3mHzfhBPb0jey1VJJvv3I8zooFWATnPzZYpw9btSriFyAvnHS9Mhs
	 Cw1BjkSE3jOFaY9lDRTJ8+abn9GFCiMruguVOaSCEOmz/ddrd4ecI8tFL+ajW6Lw6UIzb
	 IzWMvHgeBEC0rsEcOqFvDdBaCccN3VILurFoFjcn5uEZDtw7AjkdzSwPmTZdF58s/q8vc
	 DA9ql53d1MYPoNlRn/MrgCY3PCJ2xCYIuAIBIJFp4lL10uViZeCfxhQZi1p451UFdbnbZ
	 6V5YliL3wG75MMSAZRg7Dbqa+9XUnfL5AriWbux1bLdX4hmcJim75GKgbPKEhuh8zMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cfMDacLG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAD9606A323
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 02:55:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AAD9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cfMDacLG
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-6767d92cde6so437794d50.0
        for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 18:55:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794538508; cv=none;
        d=google.com; s=arc-20260327;
        b=jVtah1WYJS+KW/VYkqjs90VRsKODz2mJBkBsT+iEcCihmMugAdCJbECH6mHnqgnU1n
         F1ojiyLw38gnr2+yDq3hKsyLBoIZCmdN5jztqBTVvu1ekC6UI13VO5KdRjrOfb4XcBTT
         eMY1gANAea10IsfdM2Y6e3rcKQmNO8Wvhyl/NaC1di7lI6NqUgXOHhcebSpVq+Q9QtcV
         afygr16VPgam8XD4bK5G0uRiJPf2+y34AVsFGn8/pHomFFau4er0LnGqkj5+YibGDjXe
         NxXZd/fqfeFDt5HDAxTOgi84QbA/1hsMoz9uznIgArhlgDnSZCbf0piIzl2JBCVX2T/i
         ELaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ww5MKM6poDK+IczcuuMJkcSdFtjq/phga8CrflKC7U4=;
        fh=FDXhtKxr+nUMu1sXjp0cUvJe56DndfRISkciZvZbCO0=;
        b=PS3FAfsySE7BEqk8Q/+RticGDZnqHFnADQRE1Qn8gsG5ACVDXnjIkWBqMAiTb4vDF9
         jx2v54I1AG/5MmsdMMDERixCrkveKtWrVMXYF87b7kce2NAn9CzlmyAEymkMhbkblMMX
         SugPbX82o/xztNI1LpGab7Or7PgbX3yzaX47zo3DMgZOacbuZq73LbwmTTzVyFlW9F7k
         V0eruS+WQM4VJYRUq8GrpZHQz+jpdfweWM9A0XKlX35pfqUC/+egDWobBOyXZTR1Tji3
         6yscAAE0EGDec9l56OwnXpC5njlD8d149ld0w6hsDiwAYlTH6UQ/qjvK56KwNciqE6N6
         xDwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794538508; x=1795143308; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ww5MKM6poDK+IczcuuMJkcSdFtjq/phga8CrflKC7U4=;
        b=cfMDacLG8z5L1KijJ6WpfqoVtMnSg7D8XZ5tsiDdz2CqKktuXLlbD7h94kpjdl1/7b
         C9aE2Mt+Vmjn0zOJ228wsa6m/1EYkj4AUAvK4/n1l2fZDAxmemJ4JmrlN72c7nlHGDua
         tkc/zZ81gRVblWv/lVLluemgBz6hCHNVaSc1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794538508; x=1795143308;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ww5MKM6poDK+IczcuuMJkcSdFtjq/phga8CrflKC7U4=;
        b=uvzqnhmttTzIO02n7um7+LPGa8pCQDnx40BY+DhBCV6MbJ2Hkpusa7AW+9HhPKXWp5
         Zge8NglQNmSsZg7ULN1A8u3xtJ9h52XLdxRZ/BR32Xvy11GglTe3f2ZXoCLlTMgFa6mH
         VCA3P9WTIvcfwGVvzb79BZaQE6LKK6ubIUQ4rTRsJw42udIRSfVFyjtTvTtmcfjsBhut
         9OcCaaDPHiHkiyjhzOmioMxdUwE7KZOKYgQzVG4JaHCaIxqn5/5LjBA2Sz0/89P0RxGP
         hBtZj85ZX0A65OItsHkg1GwTkO10SQxl/9tEbEHMm3iDDRZ3Q6ZYsXkJd1j7e0z9/qbs
         UmKg==
X-Forwarded-Encrypted: i=1; AL+hErFUe5G0mCZDI28BjzSc0Yut8q3k0+BPpRLeZ0uAK7gIAHXucDGmXYVfLCAKd8Y82U6FD3D3yhV9/mk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SV6gtpW4YkE9LqYic+qUulj7uHKqCZkbl0AjRLitSA65o0IEj
	IuSOrJmIncUwx4sCSFj8M4tylMxNQAP8HKCBcyhnj4K4Z9nZa8MUHQQ4KyUGKZCy7JqKGHiaoeG
	GiaXc+VuI5QIJmf415xmoWmstz3iMnVgUN1nM5VFF
X-Gm-Gg: AYBFou0eKsluK9p6hdJDG913yO2OZyd7T96HeKKFFUQFwvR333yJmj9+1ZJeB1wiNYe
	9rBMort1Sb2DC3kv91AImzNz2OXJQ+tBDuvM2ay7SJFcQFAUdpvD0O9VYtiy86AmEfMBVHMTLlC
	W2/03GRf7MFhCKRPyCznRvSn6xJCWAm8A6aBGLR0+Dn9ejUMDITdDflFIf9j+sZSPajWSWEYyBc
	PznruJFpHxqfulsrQl+X0NU7uQoA2yVVj0ZveoEWkDt0Xacr/Z0w+gH8gpFZozw2zq/JTcSMPJO
	z1DFqanhUR8p8ISyU4Kv7bQ+aNtZ2i2XzljcVs/lwH/swDXuVtRIXZe698KEftWZLe0lp+uZEtK
	5fs8oLUDlk6yzO1MDql/EpjWng+bGzFf5k+jQ4w==
X-Received: by 2002:a53:d5c2:0:b0:67c:7317:de93 with SMTP id
 956f58d0204a3-67d8976bb2cmr676238d50.91.1794538508154; Thu, 12 Nov 2026
 18:55:08 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261026144346.2.Ib692ddd35c1dbea1757d9b1db6c1c7e938fc4ea6@changeid>
 <20261028-rapid-daffodil-rat-0adc6a@quoll> <aulIoq2oVjJ3DVzL@google.com>
 <d4a430de-715a-4936-8adb-35ff57a52b5f@kernel.org> <avZkfg6WMlMzOxpn@google.com>
In-Reply-To: <avZkfg6WMlMzOxpn@google.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 13 Nov 2026 11:54:56 +0900
X-Gm-Features: AclHuK-84j9IBFkhrVUuvk8buFltZEjB8ro1aPwuBHaC_xvB0gZrSc9m2OIxmfE
Message-ID: <CAGXv+5G5z75HGP8nv_i_nwEeSd3qkvyL_h_MYzV_XPT9BpR4jg@mail.gmail.com>
Subject: Re: [PATCH 2/9] dt-bindings: soc: google: Add Google Tensor CPM binding
To: Brian Norris <briannorris@chromium.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Peter Griffin <peter.griffin@linaro.org>, devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>, 
	linux-arm-kernel@lists.infradead.org, 
	Mariano Marciello <mmarciello@google.com>, Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org, 
	=?UTF-8?Q?Jakub_G=C5=82owacki?= <jglow@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 11:48=E2=80=AFAM Brian Norris <briannorris@chromium=
.org> wrote:

[...]

> If I do keep these as literal firmware IDs: does that mean you'd prefer
> these not be in dt-bindings/? Many of them (especially the IRQ IDs
> you're pointing at) are not needed at all in the kernel side; they serve
> more as naming documentation than anything else. I can just inline them
> into the DTS. But I'd prefer having macro names for LPCM IDs and
> similar, as it vastly helps DTS readability.

I think Krzysztof said as much when we added macros for MediaTek pinctrl
numbers. They are just symbolic names for easier reference. OTOH a binding
is a contract between the device tree and the software implementation.
And if it's not a binding, then it doesn't belong in the bindings directory=
.

What MediaTek did was put the header files together with the .dts files.

Hope that helps.


ChenYu
