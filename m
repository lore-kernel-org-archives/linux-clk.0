Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795699985;
	b=cX6hdsOTTLYNLfe95YFLiGInt5Dly6yo88C1XBstp8YdzLi1+UhUm+mXKl0RNcOxStKr
	 fVf3/k1ouolOsQkstflLlNsdnzZh1kotTqaI9SsZhEeMaAuEl0p5BzqhCR0o5L2ESzJq4
	 5/zbVmTGCMQPeshWhHUUDELWCSf8Y8xOIDGp+keeVp9sMclxPbACMLiRRAkmTDVuHBhaa
	 ipa75sbFTaCb4Ktztnl47sEjEEF6G3Pg2ZHXHfFgCsrmUxbYJlbu1c7uIas4NPhG+o+KS
	 NJblRY/50NN8FpmtKeCVzMz5/juUqM6CgpYNarxQcFzpphap4qBhcfwd1IEwEBPgbPw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=uxMVOoteAdKkdMTpKXTn3p7AUX/VbAmvTF8kfIv0P3c=;
	b=bbE9G2/ZYpxMDLCGrTIgdwFxweGclZDP7twzT77+nCb1gBO+uT2c1PoAPeHqSttn7wE8
	 gb1Jq6tKH4MYy9YSX3KQ+2arTTtL0tb3G0gRi/WQe9QrOifUfBB0/Lsb2ZPJf1B/EyomV
	 MzEnnTxmlGWK1/i8CzJ+Bz7mqQyESgo+1maVLSmDbKSZy2IFYizJGJDQp2HKVUTRcnokp
	 0XlmijQp0ntJ8Q7ZfbVKi152x3fwSgQnkT8nbq7giDtYXXPfvTBXQTSrH2NsgF961w5KH
	 8oU5uLFar9+m2PWcreNJujXxmgNB7u0vqGQk6DADAsNl4hezN8NdbNH09AbHB2x2G5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EVjIP0+y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.179
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F001606A31C
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 13:33:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F001606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EVjIP0+y
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-949664ee41cso706219685a.3
        for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 05:33:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795699984; cv=none;
        d=google.com; s=arc-20260327;
        b=bZE3H9jXcIntVlHpaypgruML0ljMA/6XLPIUbcgzu3MjWXX15HTXjhoSTqnCX81zm5
         OXmJviJc6LST4mpE2B2NHnb74YgO6ZLX99Ai9kjM4mAhRbK/9cos1OtmO/Cw+tDAnpS8
         mf3wQij9IkJS6m128IJINkgovGgOg6F+pr3f35S5kt795TtswV4bdhtpmL/aModdCGoR
         D6Gzjp/l/EjM1gHh9NhwXpLjcWTNfvlcf/zqq2xuLekT7KujYvxiFEsOd0g+Hi6GGEwH
         7pvJ5jzhSo5ZeM1ay1LPnejbiRQfLhb3nyfIYU5ywll94q08yUDM9/WsjytS3ZiLHyy4
         KgaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uxMVOoteAdKkdMTpKXTn3p7AUX/VbAmvTF8kfIv0P3c=;
        fh=xgrIuMgOAyNXyyWR8lN/eJyClqCpQtC4gsPzaVgrLCI=;
        b=op6qdYVEid3gPJVko8iYo2QRsrg+iiodvTt5m0dpCP+pq+s7dsuf1uig+WJ6IsXc8O
         RKq9tOvc1+aMklvF6rI9sDbXCUFhnIaxOn1oLgAC1FCc2ZyxPzkY0VFvNmG7mCgyiE8r
         AY5kt1WWGIl3zb6+0XvDSqy3zVoL/oPwOJv15rLo3d6OcmlydQ0AOCNH26EAlncLv6j/
         dYBeluH4enq8mFQFtLE65UxzCyt/i7vTZwM/IrprEq/MDo7rKtPc+RlRKL+F4r70TYFF
         qM4+S+DpUmvk9fpapS065xeHKNIOnhWMfEJbSAeISbi8uPVW0VGYiNGfemjA7TRLo5LQ
         AVog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795699984; x=1796304784; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uxMVOoteAdKkdMTpKXTn3p7AUX/VbAmvTF8kfIv0P3c=;
        b=EVjIP0+y61KBKgF/ViTjIrw/AMZy4lCeCmifulp1Dk5INX85m4u027sxenWwZ7bi/n
         4lvUmeNuPQcDP6fCgak+KTsHLcKHoQoGBSzJ2yg+MTUzy+q7Ld3O6RZNS7n7F/wKNlVK
         lgScGjExe6q2oAx+7pNB1xfjNdWEqTEXkKhHeCDAJngkABVyu1Faz/t6kzR0AdBbbJJf
         iI/25b+KBRKm3bqfA9roTZaNHs29OepfnBOgFo9uL8GYE4gp3ZwPYALdVTITJOpLUkoc
         Bsp6E+mpADVOcGu3ng5wZjdjnJLCX/JwOjH0BgXXEDQK+DcZM1tx8ap0ERiAnMdplzZf
         ssWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699984; x=1796304784;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uxMVOoteAdKkdMTpKXTn3p7AUX/VbAmvTF8kfIv0P3c=;
        b=hquH8lS96+f6GHiP+k7yOz856h57dn5nb81MfQL+9AaXft5sfnCX6eVDIaHjiIShOa
         KNaf9B2XlSaYY+aOEjUJrjCNjPijT9O9l034MWagQhKGmWeqEhQDbj527KFUffI45V8G
         4VPDYnxUgEZY2nGiTxLG3HhdRi20KeFE+lBT0haFPbv3eptg2hgj15A/3FQhHY98JN9Z
         zUlowRgu+rUuXh2d7h0GTS/pl27NooNkM/VUTrEWbwvCYK8w/BhVKBgPtHhtr+7Nnx1C
         Fp1Q3VAonHQ3CJ3GDmaJ7wymu+k4oZQ+aG22jcEvykJFXIA9eTkJ4tx3wFrxfSao4S1e
         rGaA==
X-Forwarded-Encrypted: i=1; AL+hErErfeXaoVtwPRyTcfKCJtim5Phx7RPPNqwpiPbQFkUGxrgS2jf3QvNxCnt7SnPnPpBE0nOYqeGehtE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FDkKQ1uz9rJ2bRDGdK2Z02Wotk4gusgp+KNW/00AC93dL5ZjM
	Z0ztVwDO9WwxNqD3HcNedH/bzWBJKfoot6Sn4vqbD5XkZ4Y0Bml5ehM/EbBcVPHWg8dwcSbO20v
	y9QMFrbPEgMjEcYBwSbZLlpuRWH/CTjg=
X-Gm-Gg: AZFdTZeXdllUrhQI616sOXOogHrT92SoOzWWtThxkZ5dpiMH47R4b3ehueBOKvL0BvK
	kLgN3jODAgP+UhbdHW8D7b+Y8mB5o8pOhIcz/wNV51RQ3nl/vVfMM+lJClup6uN4kMBJ7NoQZHZ
	6uQjdox3cdB/lUrOgJAZZd3H6DYEpIgG2tRMt9t4rfehhy5cRrHqcml31YUF+qnyxzFHiV0ewSy
	IXaFUTSNYD+oNt1EuxmApUajGaIWSBKYsJ49IMchnBNTGXJ5mgLjV8sY2yADQ1jvN+DzQ5n4Gud
	WDsV75lvZStc6XlWGJZwej6Zrzkct6mNNjjEYqKuB7B5b/iXj2wbTx1wtlLj/OGkVD/f542WXYn
	BPqpaRvWQllUeTQbhIck7jhKjq3e4N+LH1KLhlKAbI6iEbxKgQSqn4ihutgcvAagmHm8iN0CegC
	g=
X-Received: by 2002:a05:620a:f0f:b0:949:57b4:388b with SMTP id
 af79cd13be357-949bab0eb6cmr4001700485a.41.1795699984091; Thu, 26 Nov 2026
 05:33:04 -0800 (PST)
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
From: Akari Tsuyukusa <akkun11.open@gmail.com>
Date: Thu, 26 Nov 2026 22:33:16 +0900
X-Gm-Features: Aa3M54qjjDisuRhSq5dw0ZTix4ZhcjQ6ZVqggl6dEANkCNo2yjka_biV4TPpkKs
Message-ID: <CAKr_iV7eXh5LjQS=66mfGFA5TAX6Ke_cu58eR89G9+vjCuDw3Q@mail.gmail.com>
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

Hi Guangshuo,

On Thu, Nov 26, 2026 at 5:31=E2=80=AFPM Guangshuo Li
<liguangshuo@mail.sdu.edu.cn> wrote:
>
> Pair apmixedsys clock registration with removal on four MediaTek SoCs.
>
> Guangshuo Li (4):
>   clk: mediatek: mt8167: Unregister apmixedsys clocks on unbind
>   clk: mediatek: mt8183: Unregister apmixedsys clocks on unbind
>   clk: mediatek: mt8365: Unregister apmixedsys clocks on unbind
>   clk: mediatek: mt8516: Unregister apmixedsys clocks on unbind
>
> base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5

As ChenYu mentioned, my previous series fixed these issues.
However, due to my insufficient verification,
some regressions were introduced, so I'm preparing a followup series.
During the correction process, sadly I found and fixing several bugs
in MediaTek CCF, so please wait a few more days...

Best regards,
Akari
