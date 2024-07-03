Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F20616DEAC
	for <linux-clk@vger.kernel.org>; Wed,  3 Jul 2024 12:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720011018; cv=none; b=qqwpFOOaIBKTxe1CA0hEyFyP5hQW94ryZz1RcycpDGKLtvRzdeB/D9HgznlUwsyVrJkcPI8gJZluH0HuA1TKZZ/CNIaoNLYS8HZhfjV1ryAszn7GLL5oIhcC0yw4R1+JO4TXWPLmUo+ly4fhOZUZVIhVfT9GHjBaRUBhfWVI/rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720011018; c=relaxed/simple;
	bh=Ay2o4WtDijauKlhrR6+yTpXR47/mNk6cJuyin80HfuI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bCtUkhbBhQnPuUMTlhUnHkc42ay4f2O4Eq+bgCz33Upaz+caX1PwpKVdC6QhBPnOO8J1HdpqRKqqqps2Pu1vjH3I85Epo5AJ/yc7yt8vj42ak3hv8fV1wxqwmm8jWpKdrFybS0LHGkPFd5ElzCFICNnF6+imNpokBE8rq9A8mDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FtTaelz4; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FtTaelz4"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e036eabc97dso4166977276.3
        for <linux-clk@vger.kernel.org>; Wed, 03 Jul 2024 05:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720011015; x=1720615815; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ay2o4WtDijauKlhrR6+yTpXR47/mNk6cJuyin80HfuI=;
        b=FtTaelz4YRB+f5hz7MIj/9z4epvBEFucKwjJTikZ6npevnUBcMv1E0CxmUTxUoZTO/
         ansuLhPpS5zrNSFcwlEImOFCUQ2ubEViDgS/xHJeNlYyFYx3izv8/0J76C/UuIayQYFy
         ebJ5Ir5D8+dmAAnFG6LPauiVMFppsfrV5eoKaYfvk60XFGnMIYSU4gf7q1dSzCwZwxAA
         wCFuZcQb/bi7AKBJvvbkGfapcxUUfiIAJTI9clWvcJ+n38b+ktktOnSugKSYIpWbUSAb
         XYOUMNqsig5gN53jyJ6Q/+usQjmpBdPehsHVnKNRCbG8JBFH/9yoY+BPo9dIUTGLOP9+
         yh+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720011015; x=1720615815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ay2o4WtDijauKlhrR6+yTpXR47/mNk6cJuyin80HfuI=;
        b=lGNwPz3jYpbH77UM9zhSoElDsd8yHL6eEgsnjNElXTJJJpEns802Ot6HaW+5uFE6cw
         CyJTLgCcCVKaS77cHfFCGuTAul6G5NxNMLGcMnRZHKj5IbNqxkcI22UEyZZ+J5bdvd/G
         Oveckx6P9jplPABC/Tmb8LqJXlNLs/+qeSm3qqbsLxGeDcgL6JPgy9R4JOdgXGy7zxWS
         Troj9+d2rumS7Q+5qu+bqBGQtcmc2IBz6ulgemUlhEDn9Nb7J4fTOfZYDKFO36O6yz3j
         8MXzp5i50ZIi8aSE9MRoquBbAGfewFIOvZk8Gx0kLAEcch+6ka8z54SQ37KVL8+wDpnv
         Z3gg==
X-Forwarded-Encrypted: i=1; AJvYcCUjtrrTOy8bORFOtBwQAZaLeXPGHY+hPDaW3nk9O/HZIPCs/aGOW+T1Xlnhd5PEJBnOJHOhmMhuKCnwQ8R9PxmZfEPS9j3RXVo2
X-Gm-Message-State: AOJu0YywtyDcyk7EPFR/nGHcUUh3c5+4oE50Fb9sWtICaRfONBk+EtqN
	OKXh6szztWJdBvs0QAKGfOTrSWE6iFijBG3bVj1Ym9GVIi6E64RrpgeILYm5dgtcsN6CWex6Lp9
	QJxtgoD+jh5DmKV3YlSJP1c8gTSnIc2n3BXrJ1w==
X-Google-Smtp-Source: AGHT+IFV7ffdIp7JTsaJwTFxWYFq9NuhbSHtLDocDtRDoyzt9ojWdD5kwz70sA2j6Gk3nNxPEzRj0IyN26XVuILWwJY=
X-Received: by 2002:a5b:f09:0:b0:e02:c70d:d292 with SMTP id
 3f1490d57ef6-e036eb6e1b9mr12602914276.33.1720011015300; Wed, 03 Jul 2024
 05:50:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240630090104.565779-1-tmaimon77@gmail.com>
In-Reply-To: <20240630090104.565779-1-tmaimon77@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 3 Jul 2024 14:50:03 +0200
Message-ID: <CACRpkdajqsFdqdJHx8EshL1Caew_7RZdun2poY2HceptozNg7g@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: pinctrl: npcm8xx: add missing pin group
 and mux function
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	tali.perry1@gmail.com, joel@jms.id.au, venture@google.com, yuenn@google.com, 
	benjaminfair@google.com, openbmc@lists.ozlabs.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 30, 2024 at 11:01=E2=80=AFAM Tomer Maimon <tmaimon77@gmail.com>=
 wrote:

> Add the following missing pin group and mux function:
> smb6b, smb6c, smb6d, smb7b, smb7c, smb7d, bu4, bu4b, bu5, bu5b, bu6,
> gpo187.
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
> V1 -> V2: clean tabs.

Patch applied!

Yours,
Linus Walleij
