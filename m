Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF978F48
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 13:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773235431; cv=none; b=eq9bZZsf7jFtoPRPMoYolNfUTSgnUNQ1GhHr+SnwZV6hVk6/GQi5KsjeJltpVXC9xCfX6QeXz4hE8IachIFwC/+asUbzCe2SuWjn4yDHRytxa0ia+V99pivCGltpWq3960ESg0np+KkB7vZ68as9UVxMhi7UHyfHKzuWcK87SOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773235431; c=relaxed/simple;
	bh=bQRlE5OR+3/41N9B/xBGXfMeOTv3hgeQ2WrY6jcTpBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fwy09Fr+F0Wzd7hfDvg+QWQ9UObDV1Rr7nYlMJSGKJLdgRafTci0ExMQ2EyHP4/WozQZQ7JIeK2couYo7xg9SHqHkdGi5UDe3A9NWnkdWwm2UMz8XyueuRp/saF7xH+YlnyuI5lz63HPpvyOETb+LebkZaGiIc1X6xzWwk4Oxog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56739adfa1aso10530707e0c.0
        for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 06:23:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773235429; x=1773840229;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=34DR94e/1PAvLLEaib58vFA4GW0m5SGe6jvxchEhMek=;
        b=uPQ0u8E//HEBP8n9kZ4NfqvZYBzIgEANTRX07yIolWPsP9GGBtag0gFobZgPP4ffEA
         U8gXy1fIwXmlOM1hxQwbm8mfnKJom5xNvhrNCjQQJlBtAZBwhG5LJ24ccdSqzj+qsW8r
         NAPYa7WUMGNXvCpgPG1jGwaEvnWd+I//FL3vbxMfMtWXHCsDpLYvtwzhrSYrFyvVHuqD
         96r3YsdbDKIh7q02MhNY4j+smJhbysm2XJLMI9sboCDgG9I+sLxLGt9G2mxIzyOOAPOs
         hw1OxW7B90Fk7asPLkKXV+TZidibf3RZEot23t1LaKPQoCdwc+OOvw7I2JiXco4LkSkV
         f9gg==
X-Forwarded-Encrypted: i=1; AJvYcCV63+EbLoggAQc4xE3e0yUHOtEMiOQ9wB7QJBILkf8K4ENxCNF4K6Cl8xxzZCulUgM/P+Mi7mghsqU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdhx7H+YT0QpKDeW6/KR/1mfB1srrcgX754l0m1qd2TQ12Z5/m
	59Pj8t1PsgokO4FKHzTs7SwaDWosBSnqkFFIKXNrXdQPt/AkJqSD755DmXrTbR8YbHg=
X-Gm-Gg: ATEYQzzxSt3KHRvEnPH2oiDc6MvadR3w+5TbVlj7Mrtk0Pk5QLipBvj0u6jW21niRdh
	By8lb1yDHzNWg6t+jl3grmgBhwezUUE0Y7cKzySRsLLvHxysAAEFdtPJ9eyLmCyZLmuqkYXZ5cK
	f8GpIdMYAtgp7snzL6Eoz+wInsYRIlt2OK8m+8hrW/AmQHswS6SoIIQ7PC+XcaQeMvOBwE82PO6
	k23q++80u2kgwzcwN1hJ6gbkEqJvJQYoQ/KPZYqWlnSHRHNuH/y46e4QTePRsejJ1BlAnfYjnub
	AtXXETW+2NWcxqkSYR90DMuqwSxAQenC7BxBwHiGCiZWM0WyIiNZTbnjeZtwO55LJ1CbF7iIAVN
	DmJM7WGwFPk/8xIkcl6oi+YeNh6DQvY3uaX6Ocb1WCHS+Na5yGgrCxNlOGJ2CfHOGUu4PyHNBe4
	dfPILTwVqRPdbNJrN+By4PMXbLEq7KfpnM150s9qBI7o5v71WGL2L+Bf7O86uloIsU
X-Received: by 2002:a05:6102:41a7:b0:5ff:a4e0:1944 with SMTP id ada2fe7eead31-601debc1da1mr949348137.1.1773235429433;
        Wed, 11 Mar 2026 06:23:49 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94ecf9f94e4sm573850241.0.2026.03.11.06.23.49
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 06:23:49 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56ae58f3fc6so6637061e0c.3
        for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 06:23:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU3V+pR/1kIliofZLvmIPqeRb5OP6G3KbbsDWeUkuUnshfuaQhvlDT0eBUsKPZlcPJsQDhVoGS4Qbw=@vger.kernel.org
X-Received: by 2002:a05:6122:1d05:b0:55b:7494:177b with SMTP id
 71dfb90a1353d-56b4752d806mr922396e0c.10.1773234967338; Wed, 11 Mar 2026
 06:16:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de> <20260310-b4-is_err_or_null-v1-36-bd63b656022d@avm.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-36-bd63b656022d@avm.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Mar 2026 14:15:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXQ8Q4jvkgFRJYhghz2BZRDC-9Mk6DbXxuaOc6C9DFHZQ@mail.gmail.com>
X-Gm-Features: AaiRm52J84H77ROK64ZWWtJfaiCpnFeKyoSRmPbi-NC8CN6Ju1TJEFxJU9gZQQ8
Message-ID: <CAMuHMdXQ8Q4jvkgFRJYhghz2BZRDC-9Mk6DbXxuaOc6C9DFHZQ@mail.gmail.com>
Subject: Re: [PATCH 36/61] arch/sh: Prefer IS_ERR_OR_NULL over manual NULL check
To: Philipp Hahn <phahn-oss@avm.de>
Cc: amd-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com, 
	bpf@vger.kernel.org, ceph-devel@vger.kernel.org, cocci@inria.fr, 
	dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	gfs2@lists.linux.dev, intel-gfx@lists.freedesktop.org, 
	intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	linux-cifs@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-nfs@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org, ntfs3@lists.linux.dev, 
	samba-technical@lists.samba.org, sched-ext@lists.linux.dev, 
	target-devel@vger.kernel.org, tipc-discussion@lists.sourceforge.net, 
	v9fs@lists.linux.dev, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Mar 2026 at 12:56, Philipp Hahn <phahn-oss@avm.de> wrote:
> Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
> check.
>
> Change generated with coccinelle.
>
> To: Yoshinori Sato <ysato@users.sourceforge.jp>
> To: Rich Felker <dalias@libc.org>
> To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Cc: linux-sh@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Philipp Hahn <phahn-oss@avm.de>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
