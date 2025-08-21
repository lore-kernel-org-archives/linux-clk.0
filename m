Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CA62DA742
	for <linux-clk@vger.kernel.org>; Thu, 21 Aug 2025 16:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755795053; cv=none; b=Rtpt0HJ98bGOh8mIJcvwF3htoeoXTUaG4r7Cl3F/xV9ZqVlIk1EVsothWhBgSSMqkWqjwJ4EOFgTRPuxPHe2Tyoiaf7cVrUeZXjx+YA6i2yMIXbgO7uDN4htJgYYkA8FcC1FlKuEpGgZ4nw8rDRf80NZpqZ0Wkf0tuLdXyaBBXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755795053; c=relaxed/simple;
	bh=MA5CoRznscTD/9JPv2I1fgD+UFpMWzRT7Bcr37nG6ws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lQXUqU+8wbPVRbi0ZNgvdivnhrbbjAzCcBi2SOlBcHL5C+4uYV+8TEIELb+FwgHIQDNdjeiVCBeUKqNxpRk1UzFeYxnrT2n/GQyRsMPHzkadSlCPYbPEcO0mgdQvbmOBSkpTR4PtlAnV3pQ7Z8+zDEglizAEMKsJLj+Bh6Y86/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wkWlqK7d; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wkWlqK7d"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3364f31784dso816131fa.2
        for <linux-clk@vger.kernel.org>; Thu, 21 Aug 2025 09:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755795049; x=1756399849; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MA5CoRznscTD/9JPv2I1fgD+UFpMWzRT7Bcr37nG6ws=;
        b=wkWlqK7dAOZ1y+MgUubgf3rcCYYAXyFlwlaf6n4BDE1E8OdI9GvbbFHWXkFl/JUFpg
         QKfV51wUQLLQmaYPN84dofbifww2acVr069Lix2t8jO531wrxko2uFTV43AqOPGFcPC2
         WI2CIbzgrmnkREqIIFNuu2TPj9+XqcicbgOur3++CAajgcp1uC8YwLk5Fwy7lmsjwGok
         75qkS0ue+edCqf8SETxtdazBQpUu9ZXtTajUIpPtPT6xsd1EBJvuWNjHjaa7OPUO71m5
         bNJnhuWZ4pei0ddwxz9G8ZSvM8adFkmUF72vyFqcPzooTr27LGesDsqJ0Z61m+Om3WsQ
         McEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755795049; x=1756399849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MA5CoRznscTD/9JPv2I1fgD+UFpMWzRT7Bcr37nG6ws=;
        b=EyV3qGFseradZ3LrSyUx+Ubh0NLQ6Gf11dmq4sirXUQkr/tYaPxDdCuolC4k0i9uQU
         dU4VSoUE7CWEwidBS91H6NuPn6LiDk+nmahSwfVwEpSGASMmAHPduXWVlygU1FM/nQqw
         Ic9UG8kT220Myi+e0R7S7/hl34yUim0nqN8+CfIj7UwgPoJEFhaK4syCGSPoxWP3KUw3
         el5P0xY1tSzHYUmFxBUhr5YAxzZ6ix8Ueu9nXp/DG4m8vWaTvoU6cb3kh7GVFK3RoUZ1
         Y42pws+R4kqiPhEnjotvBKTxRzqUBMEY6GiaZFb4AJe8YWC2C2Cw2N/q/eI3E0mqB2/U
         +8Pg==
X-Forwarded-Encrypted: i=1; AJvYcCUmbysfucevPfR2GFV9X+R6o327CKEB4tHkvxrq7EikOn3H8SY/fFt8z2Nk/82wZs1DDnjUTrQGoro=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNIXPuH4Ve35QMxgCZqt+4KhEvFMMf0AYNqAghH7ZlXeIKNJzQ
	R9gOgqJ0DHUepFYFEQAeGqjgvqB+Ty1qIWh3TsLZgkIfa674O5gdklD0hDqGIrNT/LXG+wU6Brx
	3SleIgUTS0JRb4DD0CU6KuwqkYZLYbXofqy+5Rt31YT9X/nj2mg2L
X-Gm-Gg: ASbGncu9rrehu4NtAJaOlp9Jsx1Dlmv+AHOsJudIew3KmVNnLL2QhWGiEAh5ZnUTBzb
	la3wY6x/2KgnxOl09m2GW/j050AABcJgSl/5P9278PB3A2nql2s0kNebl8Nh5t7VYXu8D8NH09k
	2q4aRYrjsmuBOMU0mx68IBZzU8RIR+qSaTavKFXG6uwZl0F4QdsIloSjZt40MA6hF22581XPWb9
	Jrq8e6nWuHmCcfDwg==
X-Google-Smtp-Source: AGHT+IHXxJmnZpxwlzV39CihpI1fip8jHsQ3wqrQIPStR8+WqibfCJ2j76EEt47pzZKFul7hhblBfkLJ4pGoe6B1jMM=
X-Received: by 2002:a05:651c:23c8:20b0:32a:78f7:9bef with SMTP id
 38308e7fff4ca-33549e3ad61mr6524161fa.8.1755795049223; Thu, 21 Aug 2025
 09:50:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250710002047.1573841-1-ksk4725@coasia.com> <CGME20250821124039epcas5p34b77813c9936b8b70c801e0e1b67891a@epcas5p3.samsung.com>
 <20250821123310.94089-1-ravi.patel@samsung.com> <20250821123310.94089-6-ravi.patel@samsung.com>
In-Reply-To: <20250821123310.94089-6-ravi.patel@samsung.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 21 Aug 2025 18:50:38 +0200
X-Gm-Features: Ac12FXwqIo6zLlw0fIpSEAb-CCiAQ7nCYe-8wPk85-SMsx3heqK_K_zSrsS4110
Message-ID: <CACRpkdbdpcPBC8mwazoXHy+HE+hH-XWDkfHV4Uz38YhZU7UH7w@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] pinctrl: samsung: Add ARTPEC-8 SoC specific configuration
To: Ravi Patel <ravi.patel@samsung.com>
Cc: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org, 
	s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tomasz.figa@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	arnd@arndb.de, ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com, 
	gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com, 
	smn1196@coasia.com, pankaj.dubey@samsung.com, shradha.t@samsung.com, 
	inbaraj.e@samsung.com, swathi.ks@samsung.com, hrishikesh.d@samsung.com, 
	dj76.yang@samsung.com, hypmean.kim@samsung.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@axis.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, soc@lists.linux.dev, 
	Priyadarsini G <priya.ganesh@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 2:40=E2=80=AFPM Ravi Patel <ravi.patel@samsung.com>=
 wrote:

> From: SeonGu Kang <ksk4725@coasia.com>
>
> Add Axis ARTPEC-8 SoC specific configuration data to enable pinctrl.
>
> Signed-off-by: SeonGu Kang <ksk4725@coasia.com>
> Signed-off-by: Priyadarsini G <priya.ganesh@samsung.com>
> Signed-off-by: Ravi Patel <ravi.patel@samsung.com>

Looks good to me.

I expect that Krzysztof will queue this and send
to me with a pull request once he's happy with it.

Yours,
Linus Walleij
