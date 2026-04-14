Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1F53D34AC
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 11:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776167513; cv=pass; b=tDulhNF3H2YCSgJS+oEURCHtawpYnA9s5qoipKP6mYdpGAyVQ43kwADuZ3z6oseBVRzMAVxVGzO/okpIMcWFol59Mqswqs0Oo22dga3MqWjNFIsezh92SbhyTQlFuqB3doG08V1KqUmvp3/OODFLImoEqK2bvIajA6OBITeU2wc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776167513; c=relaxed/simple;
	bh=MSQdTqohWprHSSGxPUw63cRNJJ4jH1n4U88mAvfhB0Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=srXne3fg0zLgDTQwO9S8zd2wtHDZwpjeXIU1HmZuqr9hhtzlVPRsq/lIXdRG5w7BbOH+4fKQePYg4eAXOZi+ItPZ/KGwN7yJ6N+KgLSZfbMdPBHi6UNp4HKLYgGAuJe6inMEuEeZY8pYw0CI0jLgKkI2luyEyFq9TCki70cbP0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tdwna6hw; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tdwna6hw"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-64eb84d1e37so4128644d50.2
        for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 04:51:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776167511; cv=none;
        d=google.com; s=arc-20240605;
        b=SvWi3RwC+d9IIW8bdh53kUuEivLaOI/52GsCf3fKNWwtDQgk3c7r2R+aNolVfCgjZN
         lwM4MNLGBHr06ZSe1xR9GJ06fzMLmsy4J0ZOtQREtdk9/IweG9r/kq5EJPE0W1hNOcff
         KQC/RVzDOPJLo3SbUoWr4d7tuAEqXtedaSakywxSznw/Do34OzYTdJUpegcOKYXZw2mz
         2OJybL2iQHEF36Bz8ogmpDPNqvr0+AaAyjPdpgz6+ux/C3rM3UdPwIVx5xWBlr0Oq6CA
         fSB2LE8c5h1ooXb4JxG1NvGru6h/HmimcB20I6pUJe578sQQM22wMUimh7hXldr7FuVl
         UcTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nsoXP8uz7XDMohejorwTrPXwgpEvvkD5CIJw+jNU9jE=;
        fh=ijMJDLdlIPPYY+u3A7eLay4eOOJVLUHOMDzzfq8B/OY=;
        b=Yi6B1KJRpkjEQN5mwgJWlH9hY4Fg5wmFER/KXDP66FL1e4CpG7tl//rMXYpiVN5H8v
         4+UQCCab/yXGSMdyLGoVxK8FiiMZleb7SOfQCMw4aUewQVYHVmD9GjjN0o+0gaugt98+
         Zt0dntfeEQjfR4+586tc3VfdfCqDzd2ugLOrtw+WXn8YM4E5N/GBEKbOlvgLEjCBIJ2B
         jnjWNAA7yW9d8o7rVVHh6Gpic7QQiwuqyVUBh5GhmIFaim28/7T1CoULTweV8E3O621i
         m27P8rLHCvUdXyJf44q+8hOXH4pi4ikH6NRSiFGBJys5SXZyOFcx4lFnlye+AgDuTBi2
         ajCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776167511; x=1776772311; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nsoXP8uz7XDMohejorwTrPXwgpEvvkD5CIJw+jNU9jE=;
        b=Tdwna6hwYAIB8yoLcNRMbiiVtVJiErO5uglUlLXPyiUNW+lGyjuzeT2AIUl0AGATGh
         v8enquRi6EoviLglLBQO8Zcvcm0Spv+kFQNHYuYe7tOJHZa5KUmZ5Cmy2/RLbXZ/Nk97
         6o/MbSVIKIU+v02JsWO1F8tHGnzj8RP376KRWTSV9xUBj0scFAxXKzh10kxtU13Puhz2
         2aFnpqIM7U8DQWeiEX8Fiv9U1IMv+twmlW4zTpppI+S28PyBUkSG7TKN9ojQ5KRu0Qjm
         T+I7YMcVigs6DPmOC43xrHv0aiEJEWPxCMFBvQyRZVgg9E8HokCIMxcp+wbTe35NcAFy
         tBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776167511; x=1776772311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nsoXP8uz7XDMohejorwTrPXwgpEvvkD5CIJw+jNU9jE=;
        b=ScptSxY9DZjSJM1x+J82lQfRngI63mf+BjrTnkYE+Xx1GZcfysh4mP96MaOvhiKvrA
         zBEWj7xbGekgNKn6GgOMpxkGR0Trts+c2MuhQdwGMloRAmdHEfo5dvyCK4QCqnIG7jnE
         q53gp9wB+PJe7+O0pFASHPSS3y706sExQQ+zqObcs2xihKwJ7eOiD5tkMPKz1TRqxGME
         qwOoZkjI3sglgn9xhngcKSEAFBXp4WGCfdnQwMZ0W9uqo8Vczw5/OgmAvjbMK2IdMslP
         n23qel5oVPAbkccruWpHgla93tnYB+INtRplsJj6SJ+o9xsbxDpnXK+MSAQ+NcjwERoy
         v+BA==
X-Forwarded-Encrypted: i=1; AFNElJ9UDewHwja7uJ8Vx7EsIAtsOaBMEU6kxLmyu3t5JamAmZSZmnwFqo3dricu2fOUkedy9g1Fx1z+3+0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSmFUMhXr7L2U9Ef4NF4LAkrirYQ1Ei6NloePliPhM+7EzFKmi
	6IbBUVh4Y/r7FoBVKz7uk7j4/QpXien3d1k0rKlarWWC4da9TM4IWHJBqJEYF6mL/+vZdr7K0EB
	cjM7lO12+8F4FpX7VfNAYHvmxrvAOJhk=
X-Gm-Gg: AeBDieun3icXC0On+nOAccHm5gldxpdmVMf0JVaqIu8GE2QAk0LKy6sgdLdIOT6UE1s
	Rv+r3kqEd7iAYp13DcSoK/FZyU2A3RPI5UyuxKDKF9AaL/kWLTe9tiE4ZEnarI/dr1kIaDw2WIX
	VUWpLpPoPxud7nAHs45X6/qSJotmZDhrpxGPa5Ou0gOPk/nm8Z33sw2W6gLDgLH3Nc1IGS0KN3C
	Akf73TSXH9RZbQqT+HrD8bu6++rgs7eWdtrBmr2FU89teOR7EU7b+lV1qiE7qQRw/iGiql1GP3k
	MIIbOzba8MUNY0yXg6vP
X-Received: by 2002:a05:690e:12c9:b0:651:d0a5:ce2 with SMTP id
 956f58d0204a3-651d0a52b0emr5661070d50.60.1776167511068; Tue, 14 Apr 2026
 04:51:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260412124247.2494971-1-lgs201920130244@gmail.com> <DHRVDETB559R.1J1MUGSZ0VVEX@bootlin.com>
In-Reply-To: <DHRVDETB559R.1J1MUGSZ0VVEX@bootlin.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 14 Apr 2026 19:51:42 +0800
X-Gm-Features: AQROBzCY4aPdRp-vnBolaOekj7WjGOydLpVV0P-0ovLpEH5T-_12fQUc1CoHGng
Message-ID: <CANUHTR-+Dn0uSn8ian_COzX-8=BajnkopK9iUiFNcvurh=CkLg@mail.gmail.com>
Subject: Re: [PATCH v2] clk: eyeq: fix memory leak in eqc_auxdev_create()
 error path
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Th=C3=A9o,

Thank you for the review, and sorry for the confusion here.

On Mon, 13 Apr 2026 at 16:04, Th=C3=A9o Lebrun <theo.lebrun@bootlin.com> wr=
ote:
>

> Subject is:
>
> > Subject: [PATCH v2] clk: eyeq: fix memory leak in eqc_auxdev_create()
> >          error path
>
> I cannot find a public V1?
> https://lore.kernel.org/lkml/?q=3Ds%3Aeyeq+f%3AGuangshuo

This was my mistake: I did not send a public V1 and sent this directly as V=
2.

> I have a guess this is LLM generated?
> Are you missing the Assisted-by trailer?
> https://docs.kernel.org/process/coding-assistants.html#attribution

This issue was found by a static analysis tool I developed.

That said, the changelog was clearly too brief and did not explain the
actual situation well enough, which likely caused the confusion.

> The patch could be in theory useful.
> In practice however, it's a different story.
>
>  - Comit message says "Since the release callback is only expected to
>    handle cleanup after successful initialization, adev should be freed
>    explicitly in this path".
>
>    Two things are wrong here:
>
>    1. the driver cannot be removed so there is no "release
>       callback" (guessing you mean driver remove?).
>
>    2. this text seems to imply eqc_auxdev_create() makes probe fail,
>       which it doesn't. It only generates a warning and keeps probing.
>
>  - This driver cannot be built as module (will always be probed at boot)
>    and cannot be removed. So the "leak" we are talking about is
>    2 * sizeof(struct auxiliary_device)
>
>    But in no sensible case it can occur. The platforms that use this
>    driver probably cannot boot if our auxiliary drivers aren't present.
>    So if eqc_auxdev_create() fails then the warning is here to be nice
>    but you probably will fail booting afterwards.
>
>    My guess is: you might succeed booting without the reset driver but
>    if you fail the pinctrl one then you won't have a UART. Anyway in no
>    world do you have a sensible EyeQ kernel config that leads to
>    clk-eyeq probing but not its auxdevs.
>
>  - If you fix this then there are other resources cleanup to "fix".
>
>     - ioremap() in eqc_probe()
>     - kzalloc of cells in eqc_probe()
>     - probably others
>
>    But, same as above, "fixing" those will only be useful in kernels
>    that will panic in a few milliseconds.
>
What I intended to express with:

"Since the release callback is only expected to handle cleanup after
successful initialization, adev should be freed explicitly in this
path"

was more specifically this:

eqc_auxdev_release() is the callback that eventually frees adev, but
this path is only reachable after auxiliary_device_init() has
succeeded. For example, when auxiliary_device_add() fails,
auxiliary_device_uninit() can lead to that release path. By contrast,
if auxiliary_device_init() itself fails, the function returns
directly, and adev is not explicitly freed in that path.

So the point I meant to describe was only the missing explicit free in
the auxiliary_device_init() failure path.

Sorry again for the misunderstanding caused by the previous changelog.

Thanks,
Guangshuo
