Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B6421D5BF
	for <linux-clk@vger.kernel.org>; Thu,  5 Dec 2024 16:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733417585; cv=none; b=nVsWYyUH3qBYYVU6QWWBbfqv1qNE3qG/ZuyjmPXWIXcZwVuuzylbEgX2VD2u43/igMFKF6Prjv0WgOzGY4PNs/rH2NRlXd6iOeLScXXr/TqoqH6mS2J74GamNONeiIZcO3biFuXQTgEPHz0EElu/7LY35bAhCYa6ruCBa36oia0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733417585; c=relaxed/simple;
	bh=OyMQfIrxSzriwv8hX5lVDVFWmfDKiMyaBU/TmxWr4wI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WIV0TCma5IYvmghVyujZrRzO5MKgHg6pKTL7YJr+UL8tZ2NJ+thv+4PqtqBE+Mes8/dsU9CiwthFH8oxvL+Ha+lEUtQr7Goi8U170sxAbloNgCfoE5mxspL4kE6YhTLM0MIP0HEPb+SfQbasRY4Toa6Y63JhCvF/337zegatd+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MZDd5XrT; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MZDd5XrT"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2155e9dcbe7so10625395ad.3
        for <linux-clk@vger.kernel.org>; Thu, 05 Dec 2024 08:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733417581; x=1734022381; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3M40H5CkYQDVeDAAfwHVgOu/JLVGUmGE+3t86nRTx/0=;
        b=MZDd5XrTrGVDGM/UG+y1/B74BshLnyb5UJbR9ZVE1MeRqQsgZ1O6qey7ZS0EzbbAhn
         r4MsZhyKaE2+Z9Q7lHXrS1Xleeqh+SdrrGRslFudik+zEyOqjIhY3/6SgSo3H+Eouzg1
         fmfTuqTvhdrg6RXqVC0jQ58PopqV6kHa0Msk1VJbhIVLGqfYExg8FN7DLV839w3+61u5
         7uFLtN5PU+scn6tUdBFbNBABnqplKNLanODem2KQWJzpDP8wfCkrlSOdpK0Ev8kYKP6s
         9lptjXeB9l20YL+RFKJRSmBpFPFpUMtaPXyKMQC88TS6cT/YaEHTRW7V6lUNWULhKSrV
         OWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733417581; x=1734022381;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3M40H5CkYQDVeDAAfwHVgOu/JLVGUmGE+3t86nRTx/0=;
        b=wHnTZENba0SFsfYZsySym9DmZWvOUhlhnnTD6Bsp9JgKMEh75bUkwjId4gxuEFiLwA
         ypzU4a0aZO1iUtvzRIOq9aUOmftHuZREtKZozVYNj9U9N9LgcQvbdfpLz/OLdLCiu1lt
         pMCgcZElplMUrPBnwpLqdu18xoWpAm7VwuM79d9c/Ktoe/jknXZECewNy/Rj0LsUDDk9
         Sw8d88JD5p8hNP43G6splUhTnrKSJ81obHm88MwEaNNXgmwVPusbNjVdeWRi2GcKsVtR
         2wSd8yTinH0gB9eMR1mSIEi1XOQgctqyTSOXwNfio9RZAz39Bs/pHNyjf5VrxEwW4iF9
         +hTA==
X-Forwarded-Encrypted: i=1; AJvYcCUZ4WEsdSAaDVOTh7fij3lvHBpiXZ/XUqSwJVKrfH2SCXdJPG9ZrQti5M5tGCh/IZWli65sF+1+aWU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzD8IvcODDLPkZvourok8zP9BqbxdSWf/7YGoPBXXzqqAe7DvCA
	4MSdOwV27WF16B97P3JpuT5GOFWU7Xz59rwxqVKw42NWFCn1+z/hTUv/uDBZ8Q==
X-Gm-Gg: ASbGncuxNesiIXa3VKfFJgsSNBzLjMxzoIJwNb7Mvz48VjUSnEVrzo/QnXRFT8AwE1W
	BBKRvPzk6SQTmu6SjAcviHy7bJNezZ9pEoNT1qDI3C5z50DHvHpC2YEfNp27qxEJZa6rDvr/o+R
	EDskR9r3YAZBp8rlN/CKwSLWQr3DiCmsETAII6PTeIfcD4/a/VhBbu4nUBIhCy3yniUGUQsJ1AH
	2VgxhnDK7nce/J3BoZRKUsqUxB/QhHZ2qM+gmw2+cBi5QXts6uTKyVEpEP4SA==
X-Google-Smtp-Source: AGHT+IFYO3XDZ6IIHPLOsjky3D00Q3xsDrNzgdjwZkcMxnvdQlHnJg11TlcIOJ2l2C46xAjuD8l7Zw==
X-Received: by 2002:a17:902:e810:b0:215:734f:ffe5 with SMTP id d9443c01a7336-215bd128365mr145479605ad.32.1733417581263;
        Thu, 05 Dec 2024 08:53:01 -0800 (PST)
Received: from thinkpad ([120.60.133.114])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8f0921asm14725025ad.178.2024.12.05.08.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 08:53:00 -0800 (PST)
Date: Thu, 5 Dec 2024 22:22:51 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev, Aishwarya TCV <aishwarya.tcv@arm.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	Sudeep Holla <sudeep.holla@arm.com>, linux-pm@vger.kernel.org
Subject: Re: [PATCH] Revert "clk: Fix invalid execution of clk_set_rate"
Message-ID: <20241205165251.fbf3ty6jgdqt4r3x@thinkpad>
References: <20241202100621.29209-1-johan+linaro@kernel.org>
 <3fd004add188460bf2bdd1a718387c7f.sboyd@kernel.org>
 <Z07AXbQvvZwI8Ki6@hovoldconsulting.com>
 <20241203092151.izcsgzqep4imbcwe@thinkpad>
 <afa086b0b30ab5b810178f92fac96837.sboyd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afa086b0b30ab5b810178f92fac96837.sboyd@kernel.org>

On Tue, Dec 03, 2024 at 11:30:07AM -0800, Stephen Boyd wrote:
> Quoting Manivannan Sadhasivam (2024-12-03 01:21:51)
> > On Tue, Dec 03, 2024 at 09:25:01AM +0100, Johan Hovold wrote:
> > > [ +CC: Viresh and Sudeep ]
> > > 
> > > On Mon, Dec 02, 2024 at 05:20:06PM -0800, Stephen Boyd wrote:
> > > > Quoting Johan Hovold (2024-12-02 02:06:21)
> > > > > This reverts commit 25f1c96a0e841013647d788d4598e364e5c2ebb7.
> > > > > 
> > > > > The offending commit results in errors like
> > > > > 
> > > > >         cpu cpu0: _opp_config_clk_single: failed to set clock rate: -22
> > > > > 
> > > > > spamming the logs on the Lenovo ThinkPad X13s and other Qualcomm
> > > > > machines when cpufreq tries to update the CPUFreq HW Engine clocks.
> > > > > 
> > > > > As mentioned in commit 4370232c727b ("cpufreq: qcom-hw: Add CPU clock
> > > > > provider support"):
> > > > > 
> > > > >         [T]he frequency supplied by the driver is the actual frequency
> > > > >         that comes out of the EPSS/OSM block after the DCVS operation.
> > > > >         This frequency is not same as what the CPUFreq framework has set
> > > > >         but it is the one that gets supplied to the CPUs after
> > > > >         throttling by LMh.
> > > > > 
> > > > > which seems to suggest that the driver relies on the previous behaviour
> > > > > of clk_set_rate().
> > > > 
> > > > I don't understand why a clk provider is needed there. Is anyone looking
> > > > into the real problem?
> > > 
> > > I mentioned this to Mani yesterday, but I'm not sure if he has had time
> > > to look into it yet. And I forgot to CC Viresh who was involved in
> > > implementing this. There is comment of his in the thread where this
> > > feature was added:
> > > 
> > >       Most likely no one will ever do clk_set_rate() on this new
> > >       clock, which is fine, though OPP core will likely do
> > >       clk_get_rate() here.
> > > 
> > > which may suggest that some underlying assumption has changed. [1]
> > > 
> 
> Yikes.
> 
> > 
> > I just looked into the issue this morning. The commit that triggered the errors
> > seem to be doing the right thing (although the commit message was a bit hard to
> > understand), but the problem is this check which gets triggered now:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/clk.c?h=v6.13-rc1#n2319
> > 
> > Since the qcom-cpufreq* clocks doesn't have parents now (they should've been
> > defined anyway) and there is no CLK_SET_RATE_PARENT flag set, the check returns
> > NULL for the 'top' clock. Then clk_core_set_rate_nolock() returns -EINVAL,
> > causing the reported error.
> > 
> > But I don't quite understand why clk_core_set_rate_nolock() fails if there is no
> > parent or CLK_SET_RATE_PARENT is not set. The API is supposed to set the rate of
> > the passed clock irrespective of the parent. Propagating the rate change to
> > parent is not strictly needed and doesn't make sense if the parent is a fixed
> > clock like XO.
> 
> The recalc_rate clk_op is telling the framework that the clk is at a
> different rate than is requested by the clk consumer _and_ than what the
> framework thinks the clk is currently running at. The clk_set_rate()
> call is going to attempt to satisfy that request, and because there
> isn't a determine_rate/round_rate clk_op it assumes the clk can't change
> rate so it looks to see if there's a parent that can be changed to
> satisfy the rate. There isn't a parent either, so the clk_set_rate()
> call fails because the rate can't be achieved on this clk.
> 
> It may work to have a determine_rate clk_op that is like the recalc_rate
> one that says "this rate you requested is going to turn into whatever
> the hardware is running at" by simply returning the rate that the clk is
> running at.

Sounds reasonable to me. Fix submitted incorporating your suggestion, thanks!

- Mani

-- 
மணிவண்ணன் சதாசிவம்
