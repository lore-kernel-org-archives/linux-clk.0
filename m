Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD7C3E0228
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 11:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776167068; cv=pass; b=fbsTgIG5Yjig7O4kNq5XciIu9QfthwioscRf73Fm4fkUtCw3TzhLwxJ16niojiCGpJHaLccEteHL6TB3+3oc1+wBA+sSp/BHgQtMixDs/I45k7LWy3AfEPZmIWCU8JZey+TJY14CjFZhwMJhYTeEK42kkV6M17M/Xexj9ppHc34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776167068; c=relaxed/simple;
	bh=2D+4ijjnwuc1tvEXWl4yl2BJD4fo5wLmMkmr6m/nUMM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vFaiZ/69BkB9Q1I6YkFH3Xj1hTWb+iAxDlspvmhzwBgEuIXWSGW5JlVdUPMvEXckHyw8zfi24bZnSmxy/3ckIbpt3v8ys6RZ+eWNL4Ta8/b6q0tHP4Lh5KWOIfnYf0pgp/EvDB999ruz7Eu1916TIGOvXXFd9AXfRTdrobG65NQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QijGMksl; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QijGMksl"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7a43424f861so50953557b3.1
        for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 04:44:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776167066; cv=none;
        d=google.com; s=arc-20240605;
        b=QIGSo/O+mTLF/EnaWJvaFXsX67PJTa8GF+ihbHGD3qkj41A6KbzXxefy2B+QMAilC/
         9U/teqMndF9R44hmHwZejsjdP4d6SqFSXAA94IwPzbCP8N0tHK88TwsIRiKdLIKTZylk
         Uf/BBCRYGmaCYrjUi/fDKeIBhm4gfziBooLFjKgzKpfjXyNIPZpsz829K3eM91p3ScFy
         kWVDnww1/knCOBvFUAa2xTy5y/nhzGIrGVYvkpBKT4BR8r5b2FbTs5heuIG9WahFisBG
         JUfGLgyQ4vt/hCkeI+ScNW4ohPpc9avwgdV6HpH/A776BMaUOS810/0R7GBWkIpWGZ1P
         vN9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zQ9r39RFYNLQtni9+zz7YlrKwdJf7Gv2tJLgwx8RCXk=;
        fh=Q4/DowAg/Fr2bRXtRq24kPzS/ZM/hNApt/kvqDAnTj8=;
        b=F9AsCDCU0JT4z8UCPvQZoOeRjeLKId87HtwFCjyQgZSp1gFmO6F2973g4pN5a6WRUK
         XCq8W+CWK4adIia/trWEESIifnxydy6xpbSukWQBk6WyroG1Irgbx92CgfXpxT/PoZ9I
         cIiV3ZOcwj07t45L/KOj8xiCOwCgzI4QNf5h4RiyEvKgn3btjF/1mHnL/eexfX+QBEVF
         1wganzf3WHBbfETmT/1UN6MMa93E6I8spksjGXjY6Qa5dMgfhEHaIw7PiRXptXDFPFUu
         5mI0p5Px6IobnoJ9h/YVN90E6FHlRoI+RK8tKkrn85U3HmTZMmVje7S0NpaOQfqofJTu
         KTCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776167066; x=1776771866; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zQ9r39RFYNLQtni9+zz7YlrKwdJf7Gv2tJLgwx8RCXk=;
        b=QijGMksl08PZzMO8zXWa1KVR9PyvFgeLvdz8hXRI2t83+X20rKtSZMwxAW3flobKQ4
         Hd3t9N7NqgIbPLOQzf0lpMOcrE8vGfWHQY2fjYhWGLx/2wB6Gkmr0xM1usdT7i3+xoj7
         ozsUidTOMaeKuHpYij/JScOEn8btS0Rg9OvjXW8A6qvyZBHIwLxTDRR7bjWQZJmwq5Qs
         oWg2MHjK/uM4blvYerg0uG7nFFgJr6RiMRUClSyOXmdnjFAhQxs649kA59rFwR6tWphy
         Dlc0fwz5tNZ3NMsY2WYHL6HUssjhUgUX2rstOsFKGi8wViVKDaIyqZix1AXvnxYU+YEJ
         Ov7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776167066; x=1776771866;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zQ9r39RFYNLQtni9+zz7YlrKwdJf7Gv2tJLgwx8RCXk=;
        b=K0u0ZiwSzDfmx2J2E++vZQiILQPJgktYhsnFuNhF51z/hmS5izsNhtLW15RccFeV+J
         +2zW8C198seBTYcMxn8pcd2FbJGEcLAA3THGAa/wTD7Z8Uf7+mz6AnfwOrTk8+W7ca2v
         +9gOkUGuUiae16hPpfp8zib1PXQyTEDToc0WrXYqN4zTZf94EVtS38h+EDBEkxU5JIq+
         pGoDVnErV9b8Kwqi5Cflj+RbYW/kOzvYIkL/EjncjJLu9o4sU0GwWNBMo8V+DD9SC+MK
         oEpNZ5i5DHnaUjRCpsBxxRbCGReypFTC28hegGXRimqeEvfPQIf9SMusQXrb8vfadA3v
         XqFA==
X-Forwarded-Encrypted: i=1; AFNElJ9ebAC6sQWlo1Pgn2XT9jdJLiQmuIDbhhfSCrpWmSkctdA981Zrs4ZvtKwdRSBVankBJK5aMhziiVg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPxY5C8xcSSLHcL39PbpPswuemTcqFnwTcWdez9J2i2HJ/NikG
	dsGLumJ4NhUrZ92ArULSyD7fKxccXDzuRnSTMGZo5Nm8y+ELImeKJ6JdZmXecvy1e11TNsTiqST
	7xIFJpSyH+JPndTbnQGG9rK4/TqqOVVw=
X-Gm-Gg: AeBDievs9IPm5xMcv4W99cP4UFBSkwoiKjWGymEcJSsn2K6rdPO0msleYK5YGNHyMWp
	eN/HWsV9dG6A7ERwez3k5Wie4dCX3PMTUtYYOeGd9/8Z1KyS5CtB/lYlWm0jGu6tcwyjfzHl/cX
	hYiXgmG7pzHoQRZT87L11su7GfiutaLqyfpi50+Fp+wvHLp98kjX+dTmCgSC13T4vy3z4pSSSGm
	Yst8/PpQ+xU1EZshWXBwBBSpPMrI4cPr3xu6i29H0SWLEpg2BWYqQK6K+E85HSF+JoYHB5ZhDfS
	AruXNMTUVg==
X-Received: by 2002:a53:ac86:0:b0:652:541e:9685 with SMTP id
 956f58d0204a3-652541ea003mr1312802d50.19.1776167066077; Tue, 14 Apr 2026
 04:44:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413143643.3002454-1-lgs201920130244@gmail.com> <ad0d5fIAkjblQcIt@redhat.com>
In-Reply-To: <ad0d5fIAkjblQcIt@redhat.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 14 Apr 2026 19:44:18 +0800
X-Gm-Features: AQROBzDRON2GSvR6gFet_WamV1u2nq3FGC-LPKOrKn-jHgvhjSChOhLjzs7CCmU
Message-ID: <CANUHTR8JCPLMAPfdjXX95tcPTqHWBy7k3GwOo7=BcjRxfMSavg@mail.gmail.com>
Subject: Re: [PATCH v3] clk: starfive: jh7110: fix memory leak in
 jh7110_reset_controller_register() error path
To: Brian Masney <bmasney@redhat.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Brian,

Thanks for reviewing.

On Tue, 14 Apr 2026 at 00:46, Brian Masney <bmasney@redhat.com> wrote:

> There's actually another leak in the error path for
> auxiliary_device_add(). I think this code should be
> converted to devm_kzalloc().
>
> There is no devm_kzalloc_obj() yet, however according to [1] that should
> be coming soon.
>
> [1] https://lore.kernel.org/lkml/20260330154108.GA3389518@killaraus.ideasonboard.com/
>
> Brian
>

I may be missing something, but I think the auxiliary_device_add() error
path is already handled here:

ret = auxiliary_device_add(adev);
if (ret) {
        auxiliary_device_uninit(adev);
        return ret;
}

The embedded auxiliary_device has:

adev->dev.release = jh7110_reset_adev_release;

and the release callback does:

static void jh7110_reset_adev_release(struct device *dev)
{
        struct auxiliary_device *adev = to_auxiliary_dev(dev);
        struct jh71x0_reset_adev *rdev = to_jh71x0_reset_adev(adev);

        kfree(rdev);
}

So my understanding was that after a successful auxiliary_device_init(),
the auxiliary_device_add() failure path should be cleaned up through
auxiliary_device_uninit(), which would eventually call the release
callback and free rdev.

The leak I was trying to fix is only the auxiliary_device_init() failure
path, where the function returns directly before that cleanup mechanism is
available.

Please let me know if I overlooked something.

Thanks,
Guangshuo
