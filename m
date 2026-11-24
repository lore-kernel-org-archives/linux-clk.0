Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795560306;
	b=AKIudd7I0+p+Nbp6BD+NUL+gLGZg8fwqtbLQtmMbUf/4qzaHI4B/Sf+3ofjTBVZ1LJcq
	 33uuDegD6PA2LBE+83EP7CnafunS/2gViiJGC3lTxlQF99AKfLEHJPV8yjkvTnngiWJSh
	 WzYMrLD7P31YtL34H6FQOfsdNGproSkPYS9VEKrPLuWIX2IxReEi9TWC4S7WXTYANKXmX
	 mQ0XwwQxye+Sh8pMKsQrJawEA0S6jGq6r6abD7ESD7vZ3JxHlxjfQNheluWxmNScDyMRe
	 V3It9INdetnJL25ldIeYhsFfJ6X/uZp6q7vXMLs6t/MyZ4AAg15QUfeE3Gf2KPVAcTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560306;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Content-Type;
	bh=yCYYd3oBds+jZ9JWJhUL/nmmfvT7+2Bt1ZWaOHjOA+E=;
	b=lX6AUFp2QWLvs2sXiqLiGWaEuPqHdxcMDdrpPOgkBerpzW02PxU21P0kbKmG/O80Y4kR
	 QU/1NYk0XO5oBdN433GaUtl2m5vLVZLxbRirlASMz7xcEgeArX0I9zaZ/K94WLifPXy5Z
	 uuGhvXY4iKr+LN8lcA8iT9lrAWGScoOhkSDsjm1BXKF9rJ/pVES9WvVEub+Q3ur3z34Ul
	 JeBFI1XnQ/3ecaIjKFCsqE42UU3vk6q6xkQ1G5+j+tf/CdCuLUq5w+AKK/UEPtv9h89LK
	 q1pH+fIV4CrDqLlymJECBGB4uEQ5NGRChh498vlzy0k27W+BTb3dmywUBy6eh00jjkg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zd9w4ev3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45F2606A334
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 22:45:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B45F2606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zd9w4ev3
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-92116a3ef3cso68004996d6.0
        for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 14:45:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795560304; cv=none;
        d=google.com; s=arc-20260327;
        b=dS87cBeHK1olFUHHAyAMKAUCJeVuiYEOU0c07mYJeYV8ndACstbXHq6nn3OHSi8U9Y
         tpavMhCChfo76HEsrkWK59GZI0gXykzkqoIF1FoLS0Ty3fWLf3PI0rg3JqDPXUkKKWOG
         OrXDRkgKLCaMObCV/QnXbFWBFxDIfWCzAgbTAvWejvyqr9KJFvm1BW/SJZCUBTEFZ2CF
         6G57+Bya7rzQ33jb+zBhXMSx4sZ7BLaGrnrqlGMIrQuTfH6OU7xiaclOPvuBJ19Q/NBD
         UbCq5HVvutZCKFV99zvNhMXiejDgqLwGkCKUsROQdT2viyLs5s2drFkm656DDthMSlG2
         1JmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=yCYYd3oBds+jZ9JWJhUL/nmmfvT7+2Bt1ZWaOHjOA+E=;
        fh=6JzKrI1Ax5pt4bn7Ri2oa9yD426DHuPAip0SgLvfXmg=;
        b=AWmJi3ga/Gwp8nKpjiZR9YLwgtrSMEsJkeCbMeaNMOFN7mkMX8iUBszBuhBl9vVnpY
         SSKSYiNMNJUCH79gG+EELvzYkSbHUgR/R/bo9GrEDYXpimeaFpEa7C7OaNNaUTuO7a8S
         MOQcVPfac5YB+SeRujkWnaHgBTbNnkRgCJfFcv+I3z+LmYmqJZdBczTXSZxUUjvfsDLx
         J5UjjX1OiB0ChLXe8vUBzKYUWdREVaQLQtF4CPWEemCoqMk2zHYPaeiHjWY5u4rZAlro
         gmksFgSrON/GqjJ7SrW5KIEHg3b07HvT1wegbdO9UxjC7yf/fdHRhXLwwSsk3kmWDapZ
         o+7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795560304; x=1796165104; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yCYYd3oBds+jZ9JWJhUL/nmmfvT7+2Bt1ZWaOHjOA+E=;
        b=Zd9w4ev305jpWD1jjllsqxQexHNUqy/j86+yEk40ABsXBT5PLgxGS368zNXtdrLWaV
         oGMsXEijpTlMkHUUP8UFJu+W9SQdPz+tPN0K4WAtY21rVgM8ZF2bMzAT3YZ+E7DPAZMo
         7qbl4Y0ErUvTtOlcPrUdNdcJePaqNSkxzmqdXRSmGtjB6W3vNYOhPH229Qlay2kxnmpT
         XKd2ERNn+CgX1JIiUXBJKMK2RjFgVBThZY9DZcYAcAj5oI0jQQ22SdFAGvX6wtylFPDt
         QstfiwuA2MgNkMzCTNc9JKxD4feui+NcGs8Fe/4LGnJSBuBH205zH8y1goo4XwpcZgRV
         tybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560304; x=1796165104;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yCYYd3oBds+jZ9JWJhUL/nmmfvT7+2Bt1ZWaOHjOA+E=;
        b=q1HuvmccmbSi4j9LmByqjFXtFyHKJQWDx4bY6QgnHOIKibGyfCfkLlFb/uY+tQgwKt
         Y201Blg8MKdVj+YGVonGYXS7uaz8Rm7TqQEQTSqSsj40sG6vD2hwP9nfbxrO6NQrHFoE
         Ci0BoDylHDm18Xc81JOIgX9P2qSiRNwyXTRA8J6mpXuDF1tpwqDnTX0C5j3wGWFLAKu6
         gxIzCsdmGBfh5VJPJZ3zy3VeItwdsD374UJLB4PC830/eo6Op00U4IUzrJ+15UlUjReD
         BVR0UKTI4FCqscit4rdjzqYyCNplMIto+Qbhapa16rPOhFkvt5PN9zGk12WZW4AKhfBp
         uhMw==
X-Forwarded-Encrypted: i=1; AL+hErE7AE+LXFAE223okBb1s9+Yvji2CefuUKpOof9IGLiXBdicY/960qaXd8ydQmdUVx/houQ82MaXtJ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kR+X3qFczuI2LLNoUOFApTEJn/q48cAsyAv8KIcNjOF1qc+7c
	Hf1xEJfkXIzUFZHss80eUiF8G26Z5gRXfsQDm6IVkOqnZbYE7Sg3W46+qthuaT0rDUuQakXOE17
	h5A0N2IaK7vX/ZnvlExSr9vyKhQFbqlg=
X-Gm-Gg: AZFdTZcstfC1QFUxj9dMiMqca5IXo3X86yB0bVuuH+hGmWMG0RaQrFmQH/NrWBllzVL
	nE7Cb7eodGfW+w97gbJfb5OGBfrFDAfu+F+392jpVtBuqI5MuH6V8YCZgNgtvsiqfkFzJuKQfcm
	1VONuS+pEaAoEjqLrdjp3Z2S8104Qol5fPhG1X8lFvVvJXFSuSzPu+WqMJLrCJe5W11+PyHPZhA
	xlsLVy3y+JOfEl+aKpK8XOBBjw8JwsgcIJ9nMWt+dgYjBTydkHThLfatxAwpKUGIMLF6Dk+6NSt
	I304NgcsemOoIn7f7R0ttpjZr63PmKx3G8x9MEh5Adgh3Re6DBz2pVOd6Ay1AWHkGzwCWslKhIG
	ccVG78+0gheA2/f4h45Lzn4GjxMsEdQ6cXUCwM+k1BThHKz7lWiFxL8hQ67UL8uQj0T2WEkK0yo
	5EkyXQ
X-Received: by 2002:a05:6214:4e81:b0:90c:c1eb:ae42 with SMTP id
 6a1803df08f44-92134aef54emr233395366d6.13.1795560304578; Tue, 24 Nov 2026
 14:45:04 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121215918.183705-1-ansuelsmth@gmail.com>
In-Reply-To: <20261121215918.183705-1-ansuelsmth@gmail.com>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Tue, 24 Nov 2026 23:44:52 +0100
X-Gm-Features: Aa3M54o1KZCLfwpBkP_IpydVafBmrB1P_TpJmIirIZDyXM40wgltYTAemrvh87o
Message-ID: <CA+_ehUzoCPcBV4B-OvNUheQokcWjaPmGJuYxenqj2b9Q_B_ndQ@mail.gmail.com>
Subject: Re: [PATCH v8 0/2] clk: en7523: full clk_hw + set_rate for en7581
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Il giorno sab 21 nov 2026 alle ore 22:59 Christian Marangi
<ansuelsmth@gmail.com> ha scritto:
>
> This simple patch convert the en7523 clk for EN7581
> to full clk and adds the .set_rate OPs.
>
> Needed mostly to configure MDC clk rate.
>
> This will be also implemented by AN7583 since they share the
> same exact implementation.
>
> Changes v8:
> - Handle corner case with div by zero in en7581_find_best_rate
>
> Changes v7:
> - Address some formal improvement from Brain
> - Back again to register clock returning error
> - Actually round rate on determine rate
>
> Changes v6:
> - Rework to use div_table entirely
> - Switch determine_rate to calculate best rate
>
> Changes v5:
> - Handle requesting 0 rate
>
> Changes v4:
> - Fix regression where base_bits is 0
> - Handle divider_get_val returning -EINVAL
>
> Changes v3:
> - Rework to clock divisor API
> - Return error instead of -EINVAL
> - Use dev_err where possible
> - Use devm_kzalloc_obj
> - Revert to not fail on clk registration failure
>
> Changes v2:
> - Fix recalc_rate return value on error
>
> Christian Marangi (2):
>   clk: en7523: convert to full clk_hw implementation for en7581
>   clk: en7523: add support for .set_rate for en7581
>
>  drivers/clk/clk-en7523.c | 444 +++++++++++++++++++++++++++++++++------
>  1 file changed, 381 insertions(+), 63 deletions(-)
>

Hi Brian,

sashiko seems happy now... Any chance we can pick this (or 7583) series?

It's currently blocking 7589 development.
