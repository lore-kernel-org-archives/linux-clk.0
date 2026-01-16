Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9B82F3618
	for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 19:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768590404; cv=none; b=V48rI/Kz3W9inTW8D6rU5IaVBl+qsHIdpbEMdk7gVYbxvfZ+gebwIMZxldV80qusSFr9oFNcMG4r9Z1N/KmSrzRZfs9KQEBiPxNEusJ/LnIYzsFEYvZAHGSBTkc63iC40/0lvU2mbj8h5mThBKqfVZKW9kxBBc/X3GKCcpF55ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768590404; c=relaxed/simple;
	bh=nnEFCj8D60Q/Pd+jRhT3XAOSYc/qt6y9nDtXhDj9Hoo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EmrkESjA2KmkVP+U3vODjF1Bb+jcP+FMk12VwwVFXaNH6QKXLuqVcLRZR4Wu4/miJyTdfk+5kkCW/lMy5PApjaShiDT7UGY23AvxSBwdMbEhF0yPpGBstkj4cIloyDGnJ762Zw4NBmdUZQCse96dr823YOfhTPX2OoOVl5hqXX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dg0uFIyd; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dg0uFIyd"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47ee807a4c5so17667625e9.2
        for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 11:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768590401; x=1769195201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LgyQv7aXTbcxBIKDlhEjQlYxX38fSitJW3AjGTyENGM=;
        b=dg0uFIydHXYC0qIrtQaDLXe6ryJD3R3Ey6h7DwzCq/anPmK7wDHlMPIDsm1lAAWxRg
         zMErEajrqTu4uFJO+3S1ZKI4O0HqOCC7rlAHudnlKd9lkwiQTPyHp8dFeMwUTDBr2QPI
         dMUaU73WTfJXRyV74S0m3PNZxQKYgWmTAlwlDWmT7DP1HfB0jmQy6RQX7wRZzfdRDijk
         ThVTaIgzh8Zv1/jQKUsI8R1Dq9AM30o6i07u9whZimeTsrxqwdwiZvy+dTfZa/pVfpMm
         wBwiYMobvttPWAd03m8IHPxNKa2CJqXznVYuBXecssam5yMxCsNLti/PL+M8aGVon0kZ
         g20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768590401; x=1769195201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LgyQv7aXTbcxBIKDlhEjQlYxX38fSitJW3AjGTyENGM=;
        b=gL0v3FkjpG1zKCY3jBbIaENo0pPuu8T+KvxG/vZH9/iqd9ox0oZ1naaoF4LMEImhRk
         dksAunKKso3YumhWH0JWzULCx5urLclqb9n2kyf9/Q15Y9WbTVgY09L1VcckOE647+b2
         LkTf1yIpXEZQJ7X50+0wFJakVPnt+ttDjYmNdojzc6kE9P6P2kFdDnE0EX9EeJe8Yemk
         HaC/RnVVZgGBiHUEeD9OCoSUos/BzrYEwW9vcQW3DXOSwztnVS2d7eiJ7orzigKX0T/t
         n6Xo42Qik3OOj0oPIFI+69eeJz61XTgoNb12Q5ulE3Jo2ogT/BYQkRSodZz4JKHzkbG5
         8Y7g==
X-Forwarded-Encrypted: i=1; AJvYcCXWRFMcgQlENDQxaslIYL3VQTrrxA62ONycr+izq98EGyyzqaHnTm3dFAn/kVGwUQcXUgwljXGQhZE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSEqWYsh+lqcKZCr7tl+YQvKIl8tLueVfKYiSIlJbNozihzceq
	hV54Yy3vjCV8gVFEcHnr3NRTKfIIhnaoJXcWdm2S0dH7td3Rh0mV22Fn
X-Gm-Gg: AY/fxX4tSqSr5DUTXakP+CmTdVBP8/qsDKsKbSlOsyrHqjIdxkMLeuzRz95VI2llq97
	vmiAQwwJ45rUOwt3k8FhKZezNeVLc0tbl7wBvC91v39TeKqaVN+ycJu+hO57zLwXGn9DT8gFo+X
	dhgdZVT9UpE7boJwDp84rKbp9faCnAPmnBYvxi4NId1y/d2lQH86LPgWf+6hSaQuUL2yIn1CQOF
	0coWt5EhBhhpXq40NeC0qlrq7beyYRWK9COpqEJletEgVnJem61ehy1vM92tIPIl6hmYiE0ND+A
	JfXXkdCFCn3ItbjpknkEBeEbDbeKSn19zyFhkhHntEtwQPubq/liSWmFcBTe/V/20/jLoqY2Iiv
	P/wbLKxBGGBAsTudlQnJwiBUNJM4udW2/R0/4SeJp7HRby8E6+F3sb5SFcZGNvCNfFvCtRdUdHJ
	nIU00OOxmL8bUuMRUfgX/kd9Zhz2aYPLGrrwGspc1lyW+FoZ/jVqUceG0DZs5miM/7O8C4FcWyQ
	sS4tFg=
X-Received: by 2002:a05:6000:26c8:b0:432:86e1:bd38 with SMTP id ffacd0b85a97d-4356a0773a3mr5064731f8f.39.1768590400554;
        Fri, 16 Jan 2026 11:06:40 -0800 (PST)
Received: from localhost (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356996cefdsm6657811f8f.24.2026.01.16.11.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 11:06:39 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Jon Hunter <jonathanh@nvidia.com>,
	Linux PM <linux-pm@vger.kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-tegra@vger.kernel.org,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-clk@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Dmitry Osipenko <digetx@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v2] clk: tegra: Adjust callbacks in tegra_clock_pm
Date: Fri, 16 Jan 2026 20:06:37 +0100
Message-ID: <176859039010.168755.11485202766941795981.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <5956349.DvuYhMxLoT@rafael.j.wysocki>
References: <5088794.31r3eYUQgx@rafael.j.wysocki> <2d55ebec-1e42-4ddb-b0e2-529d3b2d7b85@nvidia.com> <CAJZ5v0i7Rbk5sWCo2Z1Y4j_ZFW7nCUr18H8i2JCM=aPpfZOQ4w@mail.gmail.com> <5956349.DvuYhMxLoT@rafael.j.wysocki>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Tue, 06 Jan 2026 13:19:47 +0100, Rafael J. Wysocki wrote:
> On Tuesday, January 6, 2026 1:07:15 PM CET Rafael J. Wysocki wrote:
> > Hi Jon,
> >
> > On Tue, Jan 6, 2026 at 11:36 AM Jon Hunter <jonathanh@nvidia.com> wrote:
> > >
> > > Hi Rafael,
> > >
> > > On 04/01/2026 11:53, Rafael J. Wysocki wrote:
> > > > From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > >
> > > > System suspend and resume callbacks run after the core has bumped
> > > > up the runtime PM usage counters of all devices, so these callbacks
> > > > need not worry about runtime PM reference counting.
> > > >
> > > > Accordingly, to eliminate useless overhead related to runtime PM
> > > > usage counter manipulation, set the suspend callback pointer in
> > > > tegra_clock_pm to pm_runtime_resume() and do not set the resume
> > > > callback in it at all.
> > > >
> > > > This will also facilitate a planned change of the pm_runtime_put()
> > > > return type to void in the future.
> > > >
> > > > Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > > ---
> > > >
> > > > This patch is requisite for converting pm_runtime_put() into a void
> > > > function.
> > > >
> > > > If you decide to pick it up, please let me know.
> > > >
> > > > Otherwise, an ACK or equivalent will be appreciated, but also the lack
> > > > of specific criticism will be eventually regarded as consent.
> > > >
> > > > ---
> > > >   drivers/clk/tegra/clk-device.c |    2 +-
> > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > --- a/drivers/clk/tegra/clk-device.c
> > > > +++ b/drivers/clk/tegra/clk-device.c
> > > > @@ -175,7 +175,7 @@ unreg_clk:
> > > >    * perspective since voltage is kept at a nominal level during suspend anyways.
> > > >    */
> > > >   static const struct dev_pm_ops tegra_clock_pm = {
> > > > -     SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_resume_and_get, pm_runtime_put)
> > > > +     SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_resume, NULL)
> > > >   };
> > > >
> > > >   static const struct of_device_id tegra_clock_match[] = {
> > >
> > >
> > > I gave this a quick test and this is causing a suspend regression on
> > > Tegra20 and Tegra30 that use this driver. Looking at the console log
> > > on Tegra20 I see the following errors ...
> > >
> > >   tegra-clock tegra_clk_sclk: PM: dpm_run_callback(): pm_runtime_resume returns 1
> >
> > Of course, it needs a wrapper.
> 
> [...]

Applied, thanks!

[1/1] clk: tegra: Adjust callbacks in tegra_clock_pm
      commit: 53bf300fd4a73146882889020504e8e87cc86c7d

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
