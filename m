Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC15223A564
	for <linux-clk@vger.kernel.org>; Wed,  9 Sep 2026 15:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967193; cv=none; b=BR3Ms3CZnz5AMs11fyBnP2Nr6be9G4WmcqRtLwMPk/a42V2+HE3bSKabPLGu5PzEICZkfHQ6p4bZGVlKyDyrJ4cIDQ/pLl+pPALYOQYNhh1vZMTA8ImrI2j5YCz5+GoAYZ8Mq5vVZcfsmzep3ihPlnFYWUcHQbDDGiUFyefSikQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967193; c=relaxed/simple;
	bh=mQVTvUE5EMefp3N9PRRXFy1qIjow9eV0PSCua1TgAD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n+kOEsC2Y8BdNVQ2++Rvzs6FDeL/g/okI7HTxmfTgHtVxrXXFPfuXiw5uACK5Gcnh+4JqJvoon58SMN5PM2XZJOqTRR6ZeO//zjidoF1jcto4ydgD2V9UTFsdi0UNxg6mWcF4SqC7z5t4x6ISzt1+/RGf9F1n7Kk3+n/gNUXqcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-779d18ef706so4241638137.2
        for <linux-clk@vger.kernel.org>; Wed, 09 Sep 2026 08:19:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788967191; x=1789571991;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ck7KwbjNu626e6RdS1sR80rNpHN5osHYGNVSLeBH+E4=;
        b=n3CL8rU+k93+SPlRWggKfIUDLZ5EOuFtOwZbAXlGtGlwvz06TEHQmxDOEtDDNXiJ+3
         JET60Rheq92oofRfpTSFEqrF4ew0UGhQy+MgwHdaSMC+oYRuqkXQej6BSwny/t1RYVLE
         u1vFeCZnqA96walJOX+FGFmmRP8bkLNaffKUyPHB9pEi2qxZuP2Cj885DXrtkmdDObZa
         P9K0liKDAhKOO9E/ZeulS2iI84xMgPD1NQiuHgjUXFbboaGxXG91o1nV8uD7gwjhoGX7
         OIwSAsI59PStQoj7/2Ii1qChu8y8GCAjmTETuF580ntqTgc6EKjpzD7sFSescchZV6UP
         El1Q==
X-Forwarded-Encrypted: i=1; AKwUvBzdf4OiDjB0jVGgT/0sJ4T7Z6UXLIdU+RZWRuej9ps/VhRgRQzF4RpfixlWxba+O7/vOCxTEk1WSPU=@vger.kernel.org
X-Gm-Message-State: AFuF++kTAWyDHTUfpfp42wsf0SMhLAfb+fjUhel5kpcArdNwP3ULjwSB
	69mf2k449n5yekrXymGvs2H7n1RSS19QQFkdHRnYljWaLW1OQzGugZrTy1ZWlI2qx0o=
X-Gm-Gg: AYBFou0d3jAlH66UTKMFhdWQw7ACxtKAj5E/Jhq0t9chnJih3BLMCY75nyYDwJycVvv
	yUzI12RnSRkql3OGeY0C1VyY+x6fdgBLgc1fmgvGw42gKyGYBx3biA/d0KJlkdS0V+rUMqYCJTy
	Neebu+dd4MyM9CDe2+AqLK2vHL6g8OXVt88rJHeyVvOk7dxnOyZh8mjcfbq3333A29uf42frXuZ
	TBl01ClBOnYX4g+Suz8e+A3W53S3BR52WraFKb2Zlzcwo8k1FZu7HrwpP0KCO9ftWwQk4o1NOHH
	zP/bxxfBUIig5VB3SzI/U/4cn0gSGuKexeRmaAFnoXybzrAEFaL/cEbcAZyuwXFmhyU5bfKGBw5
	1SDcDBrGS+PmGvG4hHqcxwt4Kwn6E7WjXzeeNr+hr3RkzF35c0NVWNX/KmIYf9Eq3qUhZDeFEx6
	8d+Y+ZnuYtPFopNo1lSH0SaOfIKIOP3u5wnLiqo/8beEXjcW7jaee0hN2XGe2EvVPiX0d4PEEzV
	ykLdj88z0J6k44hUyE1dGATRC08xmi5rUk6
X-Received: by 2002:a05:6102:5126:b0:785:5a17:739b with SMTP id ada2fe7eead31-78a4a4944femr17703204137.0.1788967189812;
        Wed, 09 Sep 2026 08:19:49 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ee1c0cdsm12360517241.8.2026.09.09.08.19.49
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:19:49 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-783fffcfb96so4593788137.0
        for <linux-clk@vger.kernel.org>; Wed, 09 Sep 2026 08:19:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxUIsPybjefTr6mLxifQyQwKr7/3WleQu8mFCRu37bV8/kms+t3bKuzJaxSOtTkfmRsRCInVxk+dUM=@vger.kernel.org
X-Received: by 2002:a05:6102:6b09:b0:77b:28c1:210e with SMTP id
 ada2fe7eead31-78f67ba56cbmr4525156137.1.1788967188938; Wed, 09 Sep 2026
 08:19:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com> <20260908-subsys_initcall-v1-4-cbccf4cd4288@redhat.com>
In-Reply-To: <20260908-subsys_initcall-v1-4-cbccf4cd4288@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 17:19:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVhEuiukgHN3_KjQbOmeJo_+i6exDtJeidfm42S8sEx9g@mail.gmail.com>
X-Gm-Features: AcwNN1WrudhTWyzE-dMx-744iV6jE5_0S03_iG05gjwf1BiOXXU0ML55Tupw88U
Message-ID: <CAMuHMdVhEuiukgHN3_KjQbOmeJo_+i6exDtJeidfm42S8sEx9g@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: renesas: convert drivers over to use subsys_platform_driver()
To: Brian Masney <bmasney@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Brian,

On Tue, 8 Sept 2026 at 19:47, Brian Masney <bmasney@redhat.com> wrote:
> Reduce boilerplate code in the drivers and convert them over to use
> subsys_platform_driver().
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Assisted-by: Claude:claude-opus-4-8

Nice, thanks!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Works fine, and no change in generated code (besides renaming a few
functions), so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

As conflicts with renesas-clk are unlikely:
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
