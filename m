Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B88D386C22
	for <linux-clk@vger.kernel.org>; Thu,  7 May 2026 08:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778143437; cv=pass; b=blhjOil4ceWZbxC6Am1qLAjHHqDcncVHVK48DkevkaRUfX4Tla4uJHSnbmKXl3VNQhYdwE40KZTx97rzib+wu7Nkjdh+b+SgbDcZxQl8Sh07rEyNyfqo/7xH+1XgDCWEtMIG/RM/SEaU6JkXYODxlWkOeerfse4aZwS833J7CzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778143437; c=relaxed/simple;
	bh=V7ma49FkYJcCWGCL389vm+sTxnEVG3lw3+caRpcBK4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qaHaxWQXQarMhoQQkxu9e/HnTQKEjit52rcUZIjVGvZEZK2ONqEQD731H/cvTRwMGXGO4aWtYqhBoqdNAVMwqsdKKhGGZTngcpyHIde0rk0R7WT5by/kc4SApRvqdiVFXHJneIuCpFc0v917ZNEDzxoHw8B/1Q4OsJPDiHT9JqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qnU3BZ+A; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qnU3BZ+A"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-67be41d5eeeso710600a12.1
        for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 01:43:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778143426; cv=none;
        d=google.com; s=arc-20240605;
        b=lUuXQCCWGypzf0zqlKDCxY0Cgcy/EuMLEa2V3uBEf1hGOhNzkM65QwlWBrxskJq8c5
         RS/eEYmWR/CzMuUoPNHCCbQz3ZZAzNKYgc+FyDoV1ZAQmyMtMc6ryXFjJYCYJmYWb7ka
         8AmImZ49nIPJs1vgqc6Za4I4xjgS53JpetgbMaOwVjnMInK/JXgIdjaFhToz8nQZSPat
         A5XyjHldzkvSpR9RQNGqNIQTT1J919N0XK/rx1Ps084BF0xf4apbLkohUkjbaJQfQ9qD
         nf0b/ST5QQoCE7sWblt69xsz/GNO06W5+Ki6xrmlqcKIWjgKX7VVbi8iaW9/6sLACJHi
         hIzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cPfGi80pkrEIBYkOE6vfVIEYDa38ruK3NtL9UiWIuzo=;
        fh=SPPxU4oy2Jw60COAcZ4xiwC01m5GsCatnFderrK3pOQ=;
        b=f7PS1YHpxLDgcp/FIt3WmaGkoZ3vmGCigdHbXV/Vtmm9zyEd+aPtYE/NARkzP0ZREh
         AiFdodJecnPwp8/T/nrxp/8/IfV/+vusSkZ5mT5t7uUwe70ecJl4rHX09Xz78S2KlMFq
         hM9w+60AHSPqzoS5lHV3UTnpXOzAlkxT+KOcTzrj1MjGKNWgz6g1UFfN9biU6zhkR12p
         Ph9eiUkUSXJAPP2jzGOkrKWwo8PT6Zczl4tpjQktcppMxtjQGcdGl70P+5EtWU3JHqHI
         g7AyRw16tcXIqu0KulAFNVW0Zc3Fj0b1Z6pc1q55O/m6VKLzIrl9avEwu1wSkymOQUeH
         5Ncw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778143426; x=1778748226; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPfGi80pkrEIBYkOE6vfVIEYDa38ruK3NtL9UiWIuzo=;
        b=qnU3BZ+AMX+fCls92OZ1QIqmpkgCoeLR8FZI5pZw/63xbzg/rFqfpn4Ax6wr4urz9u
         DQc0j6hDGLS/anviRyUln31c0i0IU/+LOl8sGHa0wOO/MZ1LZQyuJCui7vDW+sPCiyer
         maIch84YbySfjwkFo40QXbylPQYopknaN54/WwPFHvVKH/sPUBYYTbPp85oh9naofQZA
         pCN4zdUk+n2yT7X2v9p061a2AbHVN5QAdt/C31j7PAJfW2eLHYlIEcafSn4R65IYGPyV
         YdmesX/7Lw7vL/CowFX/llMZ2v+W9EYW2bO+6p1iDOI0Z1FzZ8ipNvopmS8Rpr5v2jTQ
         D2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778143426; x=1778748226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cPfGi80pkrEIBYkOE6vfVIEYDa38ruK3NtL9UiWIuzo=;
        b=aoAwCq0A2o/Ur/axbi0uHTj8ZB8gVQdV7RYihyOf6aS40qSMUE2ns9o8JZ2qKynNei
         IFyEJoRoNjWNL8/9+jUtWpsRJ7K6m6un8wlu2oz1ag8hCbJI3t+DyD6H4H/bHWjDx0qX
         dJRRx6X6gr6e6+ldYr5hsa15CFs5BWsAJtR6StN2ArbaOYV12wvt/R3ckcWtn20t5mw/
         McO/XrBPwoKKlqIXK7P+TBamQ9rNEcbPN3RWsrVAeDuXOQxsy/NWvgo25hcxTGgnu9ID
         PeuqpakIAwIE6lMBfGodlhegFIFXvKCYQiQOO4AemzGdQdk09VZwNtXO8Ik5o8SjCWPm
         EhkA==
X-Gm-Message-State: AOJu0YxcmLhin3GfPyUzSOvxArba9200Uhw6dSGJHF9emewk+QlxIZUl
	MT2YEVK/LXA+UTLrJ4T452A0OlNzg1CSXBjQv9N4W203arG4WCc+1Is2+ExN95a3gI7narNjgiu
	ZTDGQ1hX1kie9JAeGthEsjUG4FqAyx+4=
X-Gm-Gg: AeBDieuUKa8XhtLtqQzw3EV0Q/xpTA09tUOxL40+Vjy5C4rvTpowcoOfEgR6guvgu5N
	aH3mmse2amRIEP8hRXuZ4l6/BAKuQ0bGvhFMLCNXstecW3h8vjzcjLGjQ1r1849MXzye6fPNmuM
	hqkjwd41qgo2YJyUOb08me8mvK7ojNBDSJQEsqOrR6TrUz4PREzbDUZN2Cckohjo5EK1yQA6eB7
	6LbGX9E1uZORpb0qoBZkXeDBJMZERQk0QRwiag8DAF5I58wmMOEMaF1sl7Xgj1Jk5b829Jl3ree
	2g+Gs0Tiip7HQx+gk9uH6VifMp/RItK4/aw99Fhj28KcU5SIJCNB2iZ5Dng1TRKjw/t2ojD5X5I
	Pv2yvzaw+rTax5M0kgnnyaxlpOwAbJjDvsafXZpbKJLMItelftQxRH7MPVBctRucNdgXK
X-Received: by 2002:a05:6402:540c:b0:66e:43ef:2951 with SMTP id
 4fb4d7f45d1cf-67d638ae7d5mr3725735a12.4.1778143426001; Thu, 07 May 2026
 01:43:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506233833.178357-1-rosenp@gmail.com> <4c57b107-e1eb-4eef-ad77-021d9669900d@linaro.org>
In-Reply-To: <4c57b107-e1eb-4eef-ad77-021d9669900d@linaro.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 7 May 2026 01:43:33 -0700
X-Gm-Features: AVHnY4JM2dxCd6zuxzhCeNAz9P3fP-g5qTDGdrW5tuHIZgkThcJR8iARdOQf4HY
Message-ID: <CAKxU2N-kx+rOibE1uc=gAOSFPkMvv1w6nZ9nkPutY-Lq3zEQKA@mail.gmail.com>
Subject: Re: [PATCHv2 0/3] clk: samsung: use kzalloc_flex
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	"open list:SAMSUNG SOC CLOCK DRIVERS" <linux-samsung-soc@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 7, 2026 at 1:33=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro.=
org> wrote:
>
> Hi!
>
> On 5/7/26 2:38 AM, Rosen Penev wrote:
> > Switch three structs to flexible array members to combine allocations.
> >
>
> What's changed in v2?
Fixed compilation by adding back samsung_clk_alloc_reg_dump as it's
used elsewhere.
>
> Cheers,
> ta
> > Rosen Penev (3):
> >   v2: fix compilation and reword descriptions
> >   clk: samsung: use kzalloc_flex
> >   clk: samsung: cpu: use kzalloc_flex
> >   clk: samsung: pll: use kzalloc_flex
> >
> >  drivers/clk/samsung/clk-cpu.c | 34 +++++++++------------
> >  drivers/clk/samsung/clk-pll.c | 56 ++++++++++++++++-------------------
> >  drivers/clk/samsung/clk.c     | 11 +++----
> >  drivers/clk/samsung/clk.h     |  2 +-
> >  4 files changed, 47 insertions(+), 56 deletions(-)
> >
>
