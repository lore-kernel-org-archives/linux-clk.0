Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795150971;
	b=cyJQNw4UXLDo8KNSnErWtW5kaOZqnwI7NI0vdnmkIUrveS4Lewd3l5H+ledcd4h4S2bg
	 QHhmFxUAldQ6CQnVVo409ftrwudDqQdXLrW0lRCWUslO4+cbKK69bkfxZz0bW/g+y+dX0
	 NxENwx3IlSMMpIi6ybpSCYa9VGjsvH6zSPQhxa0R5w/nTZBS4XZ+V0XgcXHz8EMjhMWZo
	 rkcsJgA3iHutOyXqZaNoGe5mScQKzfZFxR9fF6Fv6m9Maoavsz7asUvsAUb9cm51LCJb0
	 FrZK7fjSsSpSYsK2M0SAsUIp7Q4GmUbKylNiJEyaVNYkZQmHdw+/M78/ZcJ9gRDspAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795150971;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UR5Yzs/oFvUpg1Sblo1/aojO43HzfrnhOihYQJjm9Rs=;
	b=NmfaUBS2ryzgcf0ipGPjNO7PXpQ4PBGFl9/AXlD5DVmt6fXpVrrCSxiWUu4LOKPsrhv5
	 U7mBZ31eRwXJ9r5R7t8UmswJOssaNNZ5qRFGYw1hGZ1bJAqV18cxihYpyBoY36DekO1Li
	 /VT/9NGD2u/cN61vBC9dGZvQDufmOAFtu86XwV6E9Lxv4q5HZZrt0To/bhif+uEI7xUb/
	 hI6WQ0K5z1W1oadEywZKLNy3Zl9TeMY4B6QOow+jaMCAIU4ND12hY16lcWQExYPrnOY67
	 AmRNBWwCT8XESp0Ttm0N+Z4tTMdmPjSlphIEF0R3JLKV9Ln6cBF8xC0SbLvD1X7ilSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FO+VJ7CK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31253606A331
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 05:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FO+VJ7CK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B53921F000D3
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 05:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795150970;
	bh=UR5Yzs/oFvUpg1Sblo1/aojO43HzfrnhOihYQJjm9Rs=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=FO+VJ7CKnrtrNobYSBza6XeHT02s8nna+qPJtIOMEiXcaaagVJDNTlw7htFigim50
	 9jMcYRhtlu4/VAU6qyU/cllxszBGbN11HqQ6DrB+Dg4b+vFf0ZImpR2QvVOgDJFZrW
	 G+vliQjLafirSXm6CoTofJEX/EwtvJH2203ec1c40VjEmpCYSNqlDbUaMpfr9ajaBb
	 JemZ/Fm2iSUMTVCFb+PijP2HwJL0ERaPqPqkhoh4phPOJUNLQX2jfy2QfbvuNn+ed9
	 kikSIPEBafpOqL2gdy1Qi9gVWd7qI0kQ63F8VzAdrfPL/wvwHm6zDGhkg7i8HJqm4I
	 37OPVulaSnhQw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c10dc41270so425457e87.2
        for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 21:02:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGhRHCj/zNsvIQO+lNP0r4yKaPIFSFNdSsVb9DD0MUK7vrz0ebwae9IwDO4U1ElBf3Qzw157oB1w6Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1lbUovAEdBniADIpbR/egrItk0X/3Cd0agmIrf8FDGnzlV4sf
	T1uFpv43KPLA17wcsCEHCjyZeW4XqHgyhnLlYKYUtcmsNYxmJq3aQipizdltsMl8MoJOIaatDwa
	zfy+W90vjyN3VMysy4gHNGWDYMcx2vOo=
X-Received: by 2002:a05:6512:3a89:b0:5c1:5975:66da with SMTP id
 2adb3069b0e04-5c1bc686852mr492882e87.2.1795150969118; Thu, 19 Nov 2026
 21:02:49 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021-submit-sun50i-h616-apb2-clock-v1-v1-0-7b857ad1198d@gmail.com>
 <20261021-submit-sun50i-h616-apb2-clock-v1-v1-1-7b857ad1198d@gmail.com>
In-Reply-To: <20261021-submit-sun50i-h616-apb2-clock-v1-v1-1-7b857ad1198d@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 20 Nov 2026 13:02:37 +0800
X-Gmail-Original-Message-ID: <CAGb2v642E3bDZ60_3oA7CN=hOVGn757RwfVaZWXvRSuWoo5kag@mail.gmail.com>
X-Gm-Features: Aa3M54qNcqF7z40wKma44B-tprBWYu7aZzF6KOEzN8MUiDG2dextbs8dFAlCz5Y
Message-ID: <CAGb2v642E3bDZ60_3oA7CN=hOVGn757RwfVaZWXvRSuWoo5kag@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: sun50i-h616: export the APB2 clock
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 8:09=E2=80=AFAM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> UARTs use APB2 as their baud clock. Expose its existing clock ID so devic=
e

And how did you discover this? How did you differentiate this from it just
using a combined clock from the UART bus gate, which is also driven from
APB2?

I'm not adding this simply because you want / need a baud clk that you
can set the rate on. That's the wrong way to go about this. You should
just add CLK_SET_RATE_PARENT to the bus gates. And making the bus clocks
variable is a whole different discussion.


ChenYu

> trees can describe it separately from the per-port bus gate. Keep the
> existing clock numbering.
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  include/dt-bindings/clock/sun50i-h616-ccu.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/dt-bindings/clock/sun50i-h616-ccu.h b/include/dt-bin=
dings/clock/sun50i-h616-ccu.h
> index 6889405f9fec..e3318772c92d 100644
> --- a/include/dt-bindings/clock/sun50i-h616-ccu.h
> +++ b/include/dt-bindings/clock/sun50i-h616-ccu.h
> @@ -11,6 +11,7 @@
>  #define CLK_CPUX               21
>
>  #define CLK_APB1               26
> +#define CLK_APB2               27
>
>  #define CLK_DE                 29
>  #define CLK_BUS_DE             30
>
> --
> 2.53.0
>
>
