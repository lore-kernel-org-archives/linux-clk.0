Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5646C3BF66B
	for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 16:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774283501; cv=none; b=D4vmHO8QeDVhLcaF5aH8kVF2wvAjQ3+FElYwXEDdoFphJsqzGAI7O6Mm2axq+2oyUbJNpyIQpRRj36/2nU19OfoQQFWm134TtcH1csP8mbsd6mz7fTnP8CJTyR4LgxOQ/sIZcbMVTiHg29dAOnNLZkkN3/5+w+oelsAY2AgcSDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774283501; c=relaxed/simple;
	bh=YequnmNaiUgu1X5AL6Y6SfyDxBw89iVjKvArcY/3kec=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=D/XW3i37fXrhPDr9LUyaKQYGZ5LsS7iMPTDM96Yr1qYDFgC5qcwiBvfjA3yCMwYfufKcxNS61Bsq684P6MQyXFhQmPq8AdjCRC/G8oS36WGCcQhsvSMyK/sFmbblGQZxDGuUC0yIlawBGvgR7GLqXZf/IRfOnhpbRCc4oo3+S/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R57vMpK6; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R57vMpK6"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso36710775e9.3
        for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 09:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774283497; x=1774888297; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YequnmNaiUgu1X5AL6Y6SfyDxBw89iVjKvArcY/3kec=;
        b=R57vMpK6FvpMXIPOpwNGKnZoODV0+EbqrYMiZoJa9JrWAixnFJLZ1CgNffQNuG6rHt
         HwYPn657FNzZeTyTGgRdyr4UaZHH0TecHiNm7R4GL3drwsMG4DD/F6rzZZdJkQop9DOX
         FBbqrjA1tG2GQ7lR8qgxf1eJAh5QFilnWR6qvrKqaTly8h/aAp3RoUjkm/OBk4Xi45zh
         MB8qGvGVMGkDlqtcAkEz6HN2btY30jpOVMv4lprBVGXRowFDrcwx+a7zcUkUnxZxV2Wv
         +cZPqyMX3BrJwvaRjLLkTAOUqCDXT551g7cgRlYjmoyF82xcE1OU4+k5MlJWKKk9P3c1
         EJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774283497; x=1774888297;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YequnmNaiUgu1X5AL6Y6SfyDxBw89iVjKvArcY/3kec=;
        b=B4BGctxTj/IidJSxg8mSPPhz+82RAqQ+ucN3IYIb5Z5917P3lzXf6bPAzzCmHyXkaB
         aeGk7zSJMeYyl7X3C0JOMl67rJg3QKAKVS/mnzFil7oJM0jkkO6Y3IsvEa6UGOtuUj7Q
         nPBjxNYrBSbt8C/DdLywmGWyPoqmcrJr1SJrW5tWhjuT96W/ww/Jhhkfm3ZR+kE879hf
         dw/MdpzpxVFgxCH50grGKVuR1pzvZld6X4I1h5WrnelKN8PZYc1ZEBn5lbbAEj6pESW/
         tgs0GLIKun2Wd3g7oAopI+1vcCqGE5u0Qh3FPTiFVk6BoCjxwQgdbo4dYZdxlxJLyMDf
         Tx3w==
X-Forwarded-Encrypted: i=1; AJvYcCWiY/jAg4vH9IHnEjCEW/3dsSNdHEKzr/FcjrEQrVUBxBeq9FLfJpF2GDElp574RLfcU7PCmMgPSMI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNPKwYCcEbkcUPGJMqO+NvGTrQQTTHLGI77CMsrfJGTbxFpq+H
	JePRQ77rejvkvk4cDnEtnXdFy/zHTirdxLr38driV9P3hK0qKuB0RQH6tY4kQq9sokU=
X-Gm-Gg: ATEYQzyxXBs6rZJuDF7A6mk1PbQlDX0LgvKYP9il7RdhUs9dJdatXr5e1tYmnf0h0ws
	EU/tmejpzlYR4gUfyop0Yb2ICoRWh6fQuohi2ZH5Psf9mClcjSsmKEUrl1Dp4nj/fuh0jjLvxsW
	3jKSKeFf8VIGllhFQLwdSEmlzzw27n5ecTGCRF41oUOsNsHluZxTbO3CKA1ohmm863ugV5kLP7V
	sKo4XbpiNViZSmHy3yJ9V1FuUFR4v6GUXmlHzCnRDxHkQwTdUnBe8nvaw0E7D+1h0ABoLJ4Xfr1
	kAvEgub8UlcXTUtv+jKKNqxxnbJkPr9Ht/tWATBIvUFaZJwrqAuqpMm8+YN64cAnWy2mnht53mu
	k+d+fdK6PYet3SvspS8dESjQQRp6eO/Dde7KB0tcsh/ADN7VYBbPrhew5Gq+9nb2KOuwXz6J399
	ujZaXdo+d0JldsozkInT4nZ8ODaAp4B12E0UScY56zCUj8PvZCE1Z6L9MdHr5xs/psx0fBljyxh
	xm03qx32xtL
X-Received: by 2002:a05:600c:a4a:b0:486:fe83:8621 with SMTP id 5b1f17b1804b1-486fee1ab20mr149439885e9.23.1774283496632;
        Mon, 23 Mar 2026 09:31:36 -0700 (PDT)
Received: from localhost ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48700377b71sm121384715e9.0.2026.03.23.09.31.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 09:31:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 16:31:35 +0000
Message-Id: <DHAB093OVD2G.3IO4C9P3ZI8HP@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "kernel test robot" <lkp@intel.com>
Cc: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, "Peter Griffin"
 <peter.griffin@linaro.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Sylwester Nawrocki"
 <s.nawrocki@samsung.com>, "Chanwoo Choi" <cw00.choi@samsung.com>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, "Sam Protsenko"
 <semen.protsenko@linaro.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Jassi Brar" <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 4/5] mailbox: exynos: Add support for Exynos850 mailbox
X-Mailer: aerc 0.21.0
References: <20260320-exynos850-ap2apm-mailbox-v1-4-983eb3f296fc@linaro.org>
 <202603222239.JTuBxs7K-lkp@intel.com>
In-Reply-To: <202603222239.JTuBxs7K-lkp@intel.com>

On Sun Mar 22, 2026 at 2:15 PM GMT, kernel test robot wrote:
> Hi Alexey,
> kernel test robot noticed the following build warnings:
[..]
>>> Warning: drivers/mailbox/exynos-mailbox.c:60 struct member 'irq_mask_va=
lue' not described in 'exynos_mbox_driver_data'
>>> Warning: drivers/mailbox/exynos-mailbox.c:60 struct member 'irq_mask_va=
lue' not described in 'exynos_mbox_driver_data'

Thanks, I'll correct it in the next version. The warning is a bit vague its=
elf
though, the problem is comment that describes the mentioned struct.

Thanks,
Alexey
