Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11679343216
	for <linux-clk@vger.kernel.org>; Sun,  8 Feb 2026 22:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770589704; cv=pass; b=t9TcgZtgVdT6+wOWSt6kevu+5b7edECDVUopD8EDTIbhFmfy+VzPExxZdDIBoqQ0nqCZXP0Tea6M1mxbaMKS70Q37bKRcL17czr3saMbao+gK3frAiCleaF7EE9IOf/Ay4Gr0i21WaRF4jY5OgMAilXzsmE9Kh//M6RWXDVgrVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770589704; c=relaxed/simple;
	bh=1gictA2z8mxa3FAaIPiCoFxaAIxZYRwRZHyPQFpbO9c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KflFvkD6tVpKa/PoxGCyjswJYJfw/ipvDj4apOo8Ao7Zy1p1eS/in4IEhYHy4pJKvGRlT9qHSsO8ctxjMSkRK+XLD1GsyqWsI4VWP6tSZweazWqvJS5PhetofKkpveGrYz/oX2fFFDynlFKn/n333IFR7ziuPfQHvrCn4Fpb4Ds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hiY2rx6Q; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hiY2rx6Q"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-385bdc72422so34143081fa.1
        for <linux-clk@vger.kernel.org>; Sun, 08 Feb 2026 14:28:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770589702; cv=none;
        d=google.com; s=arc-20240605;
        b=dgkQQ52PEn/xk9cLx5yrxcUxa/IfV2m9nI7igkqg02SKJElDavLmC/Jw+D9QUTdZru
         VqrWLOPER0hHj3XAZfge7WmQ8vNJWBtgNb3yf3TwwPaCQH6hGPNhuo0LdQQr9fxMYlN8
         0Lb/4djRUW5Tf4nKRi13++N7vB1RoswzZsi9kH1HfUYFLHFvCaAYy3WV141yykwW3TEN
         iDul3bxeHXXLYN44B+PMynzqaa+vhWAZ4sbtswcbzA00bI/59OpApBrrnPltlRWz0LsU
         hsjB6Gm1tXQnOPGUF2Eh90sb7xanUCnikcwpRPAPfqOJ61pSrO4deCp2boPvi/W+dAKk
         cGPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1gictA2z8mxa3FAaIPiCoFxaAIxZYRwRZHyPQFpbO9c=;
        fh=cn7wRScEC4KdP2SZYAEe2JLy7AvsFfFi0tw088StMhI=;
        b=HmRMnkp4JSBlmEJq1ijngTgnYIHMLWzLtoipOiqKclDjCinq2Q+5mfLXslT8yuvJBL
         OGeWbjTR1jIOaTmTVMm17cFdqclh3CkcZtzZnNtI5DhJFKz3hNRiETB7a9+n3GBT69pD
         ZCBzKyLYtgXippx4ZJtVXBWQPRA+v9o4l6LwP+8a3vTLHcLR4GA9bqN/v4bwWGjpRq0g
         VtoQK2VIJEdamWXUio91BVmfkXLdeFOofmVc6wpXWosvqtgqCIjG/ZTNVFopOReJMKjn
         jS3311HGwgFt3W4NvoV+iHqq3QCTWjki+eYQfh2GOUknB2T+P0XQS3FxQ/Wc6kO6m8hO
         csoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770589702; x=1771194502; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1gictA2z8mxa3FAaIPiCoFxaAIxZYRwRZHyPQFpbO9c=;
        b=hiY2rx6QsT99GGqdZN3YN7lm8pyGsIJMnvVDJ/7+IbcF6lz30HpPUJKpHx6ylprgQU
         e+VDpJEjh1vTWHQO+MJz5UMAwkJs+UlIKrzh6dVehBWOTZ6piya/vTSLEQqlVTopBeTf
         52fy8oXbzIqRnJbd74aM+yf6VGTBywTU0XJBjZRJS9O5M2Mp9+nqKmdum3DYonGzqQYN
         qevq2xTVI7htz4w7ya78gwPAMWTDvO81WptqaE3B/EGPsHXxHs32vfb6/sOewo+b3weE
         ewOy92LN4KTX69Q3lWB0IxwM7pDFsrSvdQCqK9IkjK2x9xFt3DA6DjOFFa6gs60loz9g
         6bRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770589702; x=1771194502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1gictA2z8mxa3FAaIPiCoFxaAIxZYRwRZHyPQFpbO9c=;
        b=Y/QtAICaK82k2glfS7YaCd8/DxnV69umNF0b8ly5AV3qSSzNoF8aejyqd6VpHRb7Xu
         LrO0dW+nIeRCW1kTHq1noxgVjE9CygE2QCRUJk0jiTLs8/9wygBIW61MsulWhxajUOqI
         X8Ium8ERfN2XSNGTmqla80rHgGwwXr7BjoZnAv6L0qier8V/NW5wd2XeOlfqJkQ0oOpY
         F323ArhwIHn2S0NlZpe5bAHGMMmSsqdi7AB9cnbXHG8kv7mSLVAafxxanHiN/Y3rk9JT
         /peCrdmKTTVGzScl7KyCCkKysK7kVdM5UV52hRBmoLaBVL0joPTHPVEUX+dGfX87sUPY
         si2w==
X-Forwarded-Encrypted: i=1; AJvYcCUT68f3tetDqC2hKpjz4jrk6WoJ7Sr1p6NWk9Xz3u0sQugxF3wXgtWzUkbrEfqmYqdQqgSpeizueWc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRG8reH8cY2lznIPco+f8GdnIF7y9lojlX+rFfjHp+0IaLhXRZ
	DMek+POYaTmZ6HXzfwJP104Cbt57Ecst2oWynIXQbTx52VrYNzQK+1DAsDQ2dl0a/Z+mIcGwINQ
	lp9AZ3DWmJ0miEFJL974Xt1nmdNlEg9xfqQ==
X-Gm-Gg: AZuq6aJ2zMTYBIaaSdQJPRMif7zT0+O0vxkZ55JvZxYrB8L5gzv2PJ6BgA2YvuG/Ava
	O3fVMpgcmUIDyaQMbQC1cOxd6u3W8pyhgDlkLmJXktzuh3dRC8IU8fzpT7dvLQFGrK57odUe7aJ
	JXon8+sPHrf3/tOLIn6N3FdblUm9FC7ZnJ2bbAY7kNVIkOynisYcYg3X/D2MsvtOwojyvUa1aVC
	XTE8PHM/S5d5j0zJmO8ndPKPoR3s5JEBEE5Tnj31kR18m14S9vBbIRo8jK5TZtmJhKOWhrPTtmV
	aJnihM/CiNeAtwa7gkv67lyQAvY=
X-Received: by 2002:a2e:a99e:0:b0:37c:c84a:99b9 with SMTP id
 38308e7fff4ca-386b51021c8mr30790411fa.24.1770589702112; Sun, 08 Feb 2026
 14:28:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260207130256.2832815-1-festevam@gmail.com> <3a2f5dad-84de-4afd-baaf-42f7d68cba7b@kwiboo.se>
In-Reply-To: <3a2f5dad-84de-4afd-baaf-42f7d68cba7b@kwiboo.se>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 8 Feb 2026 19:28:11 -0300
X-Gm-Features: AZwV_Qg6wsoSm7cqb4mIkth99O4iiDNLzMYIcaRuYUhewzGI5MxNyrD6qDZWrzE
Message-ID: <CAOMZO5BCbcENT3oDF94XVOxbze7O2A-0Aje0+zy1wj+Dm_3k7Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: rockchip: Add RV1103B CRU support
To: Jonas Karlman <jonas@kwiboo.se>
Cc: sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, Fabio Estevam <festevam@nabladev.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonas,

On Sun, Feb 8, 2026 at 7:22=E2=80=AFPM Jonas Karlman <jonas@kwiboo.se> wrot=
e:

> This should probably also include the reset indices or will that be a
> separate series to extend this clock and reset dt-binding?

The current RV1103B devicetree I'm using is a minimal one to provide
minimal boot support in both U-Boot and Linux.

The current supported devices do not need the reset dt-bindings. When
more peripherals are added, the reset dt-bindings will be added.

> Below is the indices decoded and renumbered from vendor kernel, along
> with some macros that can possible be used with the reset driver part.
>
> Generated by a small script I used with resets for e.g. rk3528.

Thanks a lot for sharing the reset indices. I appreciate it.

Will use them when extending support for the RV1103 B.

Thanks
