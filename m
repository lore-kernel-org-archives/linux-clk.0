Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACF03CF675
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 10:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779965613; cv=pass; b=HYQOkSeuznHQGl2F3aX2hI4n+AUKGYWlqbI9VmA9iexYNxyzpEaGkAQ35e4NqyrUTn9a+TLC+zWJRkpmwmRLseR90kZBQv2iDzxao4ZUU1FXYlvbM+YaKJs6CebgOVyZT4xcSUuzBtNWnMBbMZkxFNbr3HLjM5KGOShma8BY+qM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779965613; c=relaxed/simple;
	bh=C2MMTPABAqL5fNcNPCH5MBiBXN1fNpt/Y5x9yYSqznY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QP1IeIY+bxvO/tql05vegud1SJx8lEWs7Hgff9jPFoejbO6oNqlOUpQCCp/MUJ3gIZIXxAGBsS+o3GITG/gGr4NFDs1IaaTYjLceDOJA4VZ8/W4kdePD2Hq4dngCEMY364C+RDAwrDY2qUpoFqhTb5SmAfpUPkPo2WYrZfPb9kI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U4yD0LOU; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U4yD0LOU"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-67da63ae541so8968004a12.0
        for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 03:53:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779965608; cv=none;
        d=google.com; s=arc-20240605;
        b=Jf1c7rXEaOojUAJel46n1IdDbUD87pUOqh3U+Tbxx8ybXYNE1zA1IYvpqDT4NJ5s3r
         zBeRYJqyMKcoGDPKkswFk9hzcT9xRxKG0BiGMkSMgSiGTN0sUJP4W9Z1jQpwi+G+6+ex
         ZL7wnXA6iFCJtaJgJxsKV74JdlzZIzUcuLfQkeJu+fIcM+g4oRTCkK/DIm7UNzXZKbxs
         eDOKOrafwQWM+i0DO86E5AyZor6Es6XcwP4JEVzZC1w2jlVQ1Xjav9NfKreFfPnhZo1K
         GVocy3XXGkTtxPLrBnH3wgA2FispU8vP9pTN9V+Lh34VE1U1fTzjXhU0g+9nQCte+rlB
         kDoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C2MMTPABAqL5fNcNPCH5MBiBXN1fNpt/Y5x9yYSqznY=;
        fh=Q/ZATrYFw4AFp6HL8C4MK6gjiTspgMuXFBqma07tZyc=;
        b=IbuWOQY/mFbHKyE+m6wB564UmN+CwEXiKKLLfh08iuaEllx94sqmAvZO4boArKrpdc
         cgHYzaPbuNUd4eknGrf4Qw0Sd3qpt7NH20cexQVz8vHS4tkLFArDDBatFd81K1bx71Dw
         QhCaPp7UHCxEnbmLPHYbvLfA1/xdkZhnqJvWp6gBvqFM8D3FlXrMGT0joRPrAMIml98O
         QEIz9T35UzhJRR0QMymKLjmI7grZ6evDmr/BdCdBrRHIEx8A3J+mVnAYZ8WVybNQyB/z
         80A3/PQuq/GmovmtC4WQCXuMzsPQ0UxKdmNjMEe6U7o+rTKf8H0sCwmdLYpsuoJJLFWB
         K9rQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779965608; x=1780570408; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C2MMTPABAqL5fNcNPCH5MBiBXN1fNpt/Y5x9yYSqznY=;
        b=U4yD0LOUjB7wQKLRSPr1RO0Izma3y1ooS13O379GSHZw8RLHlUgRJM2Vgdorf+Yhra
         +SEk8WAzZD0yH10x8Op5kHbnBcfAaUSmG0Xm+yA4jaJEGUkrTHJcIqvDPktG6aC01R1/
         Gag1cLqlFshDIN7VfbU53f6KiBLgNvZoGXDPDMvaqJlDK7/VJYRuvgaaUf57mrVcA27s
         WWE8LMsg4wuu0VtJBRKRglrrbPQvA9TnDFGz41fjzAvS/s4d8TNPu4anE6zoK62XlXKh
         yW8SMFXYcgZafkA2V5hBllyM2jPrYpMntGFzL48tFHSbm7j3vl44l5AL956FxpmQLhHy
         MMAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779965608; x=1780570408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C2MMTPABAqL5fNcNPCH5MBiBXN1fNpt/Y5x9yYSqznY=;
        b=OIp3+VzzJ3V144EjrlR1exHYESO8qAeRMXmDS0Dza5CvdfOWmgLGizxcFhm/osnw1z
         qTm4Fzf0hbLM3c29dE6GltqRxsO49a1SOnTf76fwjyl3wCL5cgjS3H665qEAKnVaC5Or
         Y/f6okIi+i0u7RyVZYxQBhfgIODkOJdkb4pnTx09RTb7zWPBKGU4u2Xy7Hk+kEvalcwJ
         +ufKB9/cPmjyhz/tU68W1bYv7XiztUWWJ5AqseNOY+ImoJtNnC0JJC5mDX+CbuSs/cxw
         5H+t+qOKOzr5uQV3nD9W3wyZdTT+tDNBNQLP3VNPxzQWEkAfjoJ4amDsRnX5pl28S7w3
         +DHg==
X-Forwarded-Encrypted: i=1; AFNElJ9m5oUcvc1jNQ/09jnbsy25r9wtNEm9BkTRPtNJh3SVq2zfgtVlgX3m3S7qbjKgq74q1M7W9ZfEJeY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLOBmxmqEm0oqNbhWbxbhMfAmDuo3uF1wMiLLvW+rmO720jZaS
	0gMIRGeEMDtexCwBdTu2X5/B+j3pIUe6f8/ysH89jH6mbs57d0WpVNH9PbQIsAo9vJHCDTDpCGo
	LFuQ302syiKBqeeUAOWpIujOx+Vspoh+iImOWjMPIQQ==
X-Gm-Gg: Acq92OHToLoraYau6tFld1wwnZhCU0nY5ZQLWRymlpShC63Dl57ZWCYvJS0Yb492aT8
	33Nk+1oY+Mv7eRstf0CwqYIE9d3Q2zb27M89o5S6X037zzjGkp+LShlz7gIvacvyZoEhxpfZtD3
	7+ZwJ0RCmsXUyi8vIzJ6/EpVGp6uvcDiwzcNHwpUjBNXrf37COLzMDr3+6TnPMLrGbFUyVmB9Ak
	/qI6OaYzsL88MvTLRLVe0197pgiFawgGOFUx5vzv8ISmOEYgA6V7u8qUoTQ0QLPsAUNLzJPgEId
	PWhka+pK4pY/DotEmsD5sZiazmkiwAnxYEKaEqFzLjGNlgr24seS
X-Received: by 2002:a05:6402:3907:b0:687:f18:c37f with SMTP id
 4fb4d7f45d1cf-6889cc6c63emr14062696a12.22.1779965608447; Thu, 28 May 2026
 03:53:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <841cf835a24bb2f3acb99a97bb58e583220e03a2.1779963984.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <841cf835a24bb2f3acb99a97bb58e583220e03a2.1779963984.git.u.kleine-koenig@baylibre.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 28 May 2026 11:53:17 +0100
X-Gm-Features: AVHnY4IH3mvkMMS_g1hQ3ZJ8qesRqjWnH3mxTBj-F0Of2pKxAmtKM5oLFn6FugI
Message-ID: <CADrjBPrY+8Cn28+LaM5xqk9ymdAc4oAoGyDm3k2yM5ADszRoCg@mail.gmail.com>
Subject: Re: [PATCH v1] clk: Use named initializers for platform_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Brian Masney <bmasney@redhat.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 28 May 2026 at 11:34, Uwe Kleine-K=C3=B6nig (The Capable Hub)
<u.kleine-koenig@baylibre.com> wrote:
>
> Named initializers are better readable and more robust to changes of the
> struct definition. This robustness is relevant for a planned change to
> struct platform_device_id replacing .driver_data by an anonymous union.
>
> While touching these arrays unify spacing and usage of commas.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
