Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA7F1DFE22
	for <linux-clk@vger.kernel.org>; Tue,  3 Dec 2024 09:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733217729; cv=none; b=JVIkflvEV6KgxKt9SyvRDKZKSRY4SZQYkZ5VPHriaz7hfWZbPemZpsCepZN9mhsXQgpvkLC6nNLZCJim4eEad1we3NrKOyhse9ZkOWCIBwvueg68w7eCr4o5n2VqAWJyBk72A7IeS1NInKp/UjCuLGiwlhi02GNLM+lOlTe46DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733217729; c=relaxed/simple;
	bh=tAUvidCL9cRweVfC/2kXnjRALxKyYX7dCB9chBszEZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CTGZbfV4Uhf2CqGxCSKDO/kS7vkUJDL7au3DR3cNgVv7SG94836s7JKd3kvdJR8oM51Z6F8mQQFCSFVYvGtP8KiX3yo/ehNbGvuaD+vVdKa/SLhSThTF8hq8jDp92of0PFEYxn3gMyQenCp5lcT0Pq+cM9zJdIGu1LUVqsyMAEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CCjRbDQc; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CCjRbDQc"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ef10b314e4so98970a91.0
        for <linux-clk@vger.kernel.org>; Tue, 03 Dec 2024 01:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733217727; x=1733822527; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3a7w9E16Z/EosAKMu1bm/FzpFNeifD2WnNFT8adcORE=;
        b=CCjRbDQcoziO+wAPOUf7S7UjOE0SnX0Tuq38lst5BXefPVG7wWaPYi9Qv/uhx9mZnz
         /S5dUZztY0EmJJftXsH2Re2TPZDIgNf2ZbVPsR66xsBW5HLnxW/EDsfisFb3pabojBU3
         dynrdGVYhXHdVMUB+CksquC91nGoFlDjzoBVpQ9DRmT0SMMk5b7rZLkD/gPtG3w1m5sM
         +o6RGdR90El7Oz+21CDwzl7QrqXI5SAygz09kj0mXsrRuOroApn5ecp940Hg5EF/tA3f
         I4Y+p8lqYLA0MHo9b1HahovhFNlP4yKhcuEH4qWZrSYG+KoBUbbINmJkWTKTz8JeHJFd
         Uu+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733217727; x=1733822527;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3a7w9E16Z/EosAKMu1bm/FzpFNeifD2WnNFT8adcORE=;
        b=CzOXEXwBUItTkOzQhAK0gb9a6TETHaywf4ECPdC+3r3RD7WQcPj4hmVDgpKXRbk8Bt
         ksI29oorM8xeM+nYybubDNVLaYyWhVVnoCGERtIm01PXLw2NBof867JdlhV/a+SuxXN1
         1Ryh2+6xTBdnKYjtWd4CLRvZDvar/ahfy35U6HIce9PNiMXpzz3bfatohlghZdzZ03Hc
         1PEYyFfvh9l616ZgpCPA9oSBz8bG2IuXPXOr8LOjbxLgakVIyQN7ScxRlqllDZp5I4PG
         4L4e13Kbjbm0r0p/ghVqf2SgMGLnvu2XbfGCdSmeazN34vsoPqxVy33Dyv35Jphr5zvZ
         k02A==
X-Forwarded-Encrypted: i=1; AJvYcCXZQJa8h7jK8AetfT6idgiWaDkdwJezBJy8UpAb4MF2/YqxbI7u+krOH/rKo/PthM07dJ11MQ47lMk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu/OD8fBYDptSlHMHFAJCCNyBryGWF6lSOmkB5To3Le0hK/jPV
	gw0Dg/SLOhWab6uiwYTZPTANnAPiB5ns0aFUxEJmmDxTCoYPSGm+p2Sv3ZA3kQ==
X-Gm-Gg: ASbGncuMjhk2jvZrmVoQ8G34ZB55nyx559nHYMJ/qTXnP6ZMzdaGD2Pkl6bjZMxVET1
	1AxbJnQABlQUfjoAGcQ3/fJPZbaVRcUBwc2R97YuVJ4dc8+WPhj6IGiUpNrKbu5PRnvnbQsKyCp
	6sGA9wOKMic1moDLmRpZNjy0cq67+w8ZfVYNqdk/JjTCWcv87lmeDj94ZSnXqWs26HJcuuWC/9+
	JOOp/qP+VYYJZeXlZsdZmaeXFFXV8EZMogn51Yd9qfDnzivwfVf+Ciy+qjw
X-Google-Smtp-Source: AGHT+IFMtDbNR1ZzC8JtoJ2Q1vFtRk/LtU82uZrGwY7TKzZ61sbiHL4d7qYEx6wuyZzyYv4Os2n5uw==
X-Received: by 2002:a17:90b:4a84:b0:2ea:59e3:2d2e with SMTP id 98e67ed59e1d1-2ef011f5fecmr2562312a91.10.1733217726913;
        Tue, 03 Dec 2024 01:22:06 -0800 (PST)
Received: from thinkpad ([120.60.48.217])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ee36170536sm9113500a91.28.2024.12.03.01.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 01:22:06 -0800 (PST)
Date: Tue, 3 Dec 2024 14:51:51 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Johan Hovold <johan@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev, Aishwarya TCV <aishwarya.tcv@arm.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	Sudeep Holla <sudeep.holla@arm.com>, linux-pm@vger.kernel.org
Subject: Re: [PATCH] Revert "clk: Fix invalid execution of clk_set_rate"
Message-ID: <20241203092151.izcsgzqep4imbcwe@thinkpad>
References: <20241202100621.29209-1-johan+linaro@kernel.org>
 <3fd004add188460bf2bdd1a718387c7f.sboyd@kernel.org>
 <Z07AXbQvvZwI8Ki6@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z07AXbQvvZwI8Ki6@hovoldconsulting.com>

On Tue, Dec 03, 2024 at 09:25:01AM +0100, Johan Hovold wrote:
> [ +CC: Viresh and Sudeep ]
> 
> On Mon, Dec 02, 2024 at 05:20:06PM -0800, Stephen Boyd wrote:
> > Quoting Johan Hovold (2024-12-02 02:06:21)
> > > This reverts commit 25f1c96a0e841013647d788d4598e364e5c2ebb7.
> > > 
> > > The offending commit results in errors like
> > > 
> > >         cpu cpu0: _opp_config_clk_single: failed to set clock rate: -22
> > > 
> > > spamming the logs on the Lenovo ThinkPad X13s and other Qualcomm
> > > machines when cpufreq tries to update the CPUFreq HW Engine clocks.
> > > 
> > > As mentioned in commit 4370232c727b ("cpufreq: qcom-hw: Add CPU clock
> > > provider support"):
> > > 
> > >         [T]he frequency supplied by the driver is the actual frequency
> > >         that comes out of the EPSS/OSM block after the DCVS operation.
> > >         This frequency is not same as what the CPUFreq framework has set
> > >         but it is the one that gets supplied to the CPUs after
> > >         throttling by LMh.
> > > 
> > > which seems to suggest that the driver relies on the previous behaviour
> > > of clk_set_rate().
> > 
> > I don't understand why a clk provider is needed there. Is anyone looking
> > into the real problem?
> 
> I mentioned this to Mani yesterday, but I'm not sure if he has had time
> to look into it yet. And I forgot to CC Viresh who was involved in
> implementing this. There is comment of his in the thread where this
> feature was added:
> 
> 	Most likely no one will ever do clk_set_rate() on this new
> 	clock, which is fine, though OPP core will likely do
> 	clk_get_rate() here.
> 
> which may suggest that some underlying assumption has changed. [1]
> 

I just looked into the issue this morning. The commit that triggered the errors
seem to be doing the right thing (although the commit message was a bit hard to
understand), but the problem is this check which gets triggered now:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/clk.c?h=v6.13-rc1#n2319

Since the qcom-cpufreq* clocks doesn't have parents now (they should've been
defined anyway) and there is no CLK_SET_RATE_PARENT flag set, the check returns
NULL for the 'top' clock. Then clk_core_set_rate_nolock() returns -EINVAL,
causing the reported error.

But I don't quite understand why clk_core_set_rate_nolock() fails if there is no
parent or CLK_SET_RATE_PARENT is not set. The API is supposed to set the rate of
the passed clock irrespective of the parent. Propagating the rate change to
parent is not strictly needed and doesn't make sense if the parent is a fixed
clock like XO.

Stephen, thoughts?

- Mani

-- 
மணிவண்ணன் சதாசிவம்
