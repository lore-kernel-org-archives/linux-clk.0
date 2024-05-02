Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAC4320E
	for <linux-clk@vger.kernel.org>; Thu,  2 May 2024 00:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714609222; cv=none; b=Gu5EuIF/QvZUBJZNY+PFGxoGKZWJhTddjeEcASLTlCHGH/Vo44F+Ogd6EkiJXSVNvCYVbgUq5gE4FE5trsd7+tPfIp3UQ0Ju1S4GIDjmccRzMxqQ3yKHs5BtiO76VR0J2i2MVncGedzecStJCYfkdrDMvJXz2CC6Avi6grYydKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714609222; c=relaxed/simple;
	bh=u41EwqRKzoIPMnwx3uJD5HnTN0ef2JtTmKQdCY/Erwc=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kyv76VG5x/6IU2yAR1TK1tuA87f1QZmL8U+umjDLqGpyVA+VJCh3hr1NOCwFp/Fna7yFz58bhliQR9fjwor1xfva1L3M9KCf6E72e7Dkt4yJfXE5rJlfxe01o3ZHbzDXtL7LgCUJF73f3bk8tR1wscG+pYdfgyZvnf8AelAlESc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bugOooDb; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bugOooDb"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-69b514d3cf4so80599686d6.0
        for <linux-clk@vger.kernel.org>; Wed, 01 May 2024 17:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714609219; x=1715214019; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u41EwqRKzoIPMnwx3uJD5HnTN0ef2JtTmKQdCY/Erwc=;
        b=bugOooDbNCoejEADieRSHfp+9g6wkP/WY5N81ay1vzvGoq9aDajmDDrc4ebJcA7tpO
         xqIBRAA74ziMGHE6IaKSd1sj/mPgs75ZJslJq9k3nI59loWl7hpzCBET6TrcqCndATp0
         Lbk1EQfNSufBOQlfVmf7Lb0BrTUMmJmp03A+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714609219; x=1715214019;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u41EwqRKzoIPMnwx3uJD5HnTN0ef2JtTmKQdCY/Erwc=;
        b=dcBsD1R0Tl0XfuMGVb3hT4xLS+6draHFInm7y0VAooxKJPd1uFxkJaACSeRIwKwY7Z
         bc8xiuX8qjoJ84kUV+iVLelDTwo4HIyPd+H9pg88y4xTqUgNR7JG+HkPcLRZDhMRHs47
         /ZKO9DnM86jq9/US6x+AwztlwWCf3C3dEgax+EcCXQTbJuUPtSxqhA7Rf5NTB/UVrksf
         9ELu2QoH1kBvR02TAMAenQYBWUQHe7LY1lHCaT9dKiTUWWi6UenH0APboOMLJQY6Nipj
         /7tOr4v6mrtYRGxJPRxe8DGjEWrlQNVB1FEuFbs4hTjXlELU6EdGGqtLgpI9WOe212NC
         gyHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUb/SsPWd1UcMsHI+72ePl03WUs2Xsfx68B6qON4/zLvLHuz/bf649BGNpwBbhjnz1Hhybiy9Xxpis6/D1Pd2dh9cyJOQOKuGwu
X-Gm-Message-State: AOJu0Yz4CwY++lyXl3RLp5BalNshojXvlaUTqRGgGRUhr/HX3gkmOyXN
	cTpMYT7uD5J/Xt/lseecKqzotDlTJxgDSI9jMe6+d46/QsOXTljmVvU+n62KBqXIOM1bm18fZt5
	i7yzWebbuJ5Q8mvBrMMhr0Pg5/HHznpWJicho
X-Google-Smtp-Source: AGHT+IEc1eTRsFE6XeEVTYHiMbtnza7LGG/rlt3ScVq6rOvZPlhWc3Y03+hhqJKXzOZ75M3+vGyimImWhMVDRjS2H9g=
X-Received: by 2002:ad4:5baa:0:b0:6a0:8511:98e0 with SMTP id
 10-20020ad45baa000000b006a0851198e0mr443958qvq.22.1714609219471; Wed, 01 May
 2024 17:20:19 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 May 2024 17:20:18 -0700
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAA8EJpqVGHqufKo1kV52RzQCNL5D92mmnCzUwKZn4o+5=wF9pQ@mail.gmail.com>
References: <20240327202740.3075378-1-swboyd@chromium.org> <CAD=FV=VLwa0AFsrXXxKGG+hcyW+h7u7-tyg3uoDB8M_XdPti_Q@mail.gmail.com>
 <CAE-0n51osUcpqqh6o9OhURLbRKjcWbRZT-5oHLi_mwfJsUngEw@mail.gmail.com> <CAA8EJpqVGHqufKo1kV52RzQCNL5D92mmnCzUwKZn4o+5=wF9pQ@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 1 May 2024 17:20:18 -0700
Message-ID: <CAE-0n52knCL3DP35jg8UhTJP6wxQ5Fueq9Qa796O9hKuEFPRQg@mail.gmail.com>
Subject: Re: [PATCH 0/2] Fix a black screen on sc7180 Trogdor devices
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Doug Anderson <dianders@chromium.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, patches@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>, 
	Laura Nao <laura.nao@collabora.com>
Content-Type: text/plain; charset="UTF-8"

Quoting Dmitry Baryshkov (2024-05-01 11:11:14)
> On Wed, 1 May 2024 at 03:17, Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Doug Anderson (2024-03-28 09:39:54)
> > >
> > > I spent a bunch of time discussing this offline with Stephen and I'll
> > > try to summarize. Hopefully this isn't too much nonsense...
> > >
> > > 1. We'll likely land the patches downstream in ChromeOS for now while
> > > we're figuring things out since we're seeing actual breakages. Whether
> > > to land upstream is a question. The first patch is a bit of a hack but
> > > unlikely to cause any real problems. The second patch seems correct
> > > but it also feels like it's going to cause stuck clocks for a pile of
> > > other SoCs because we're not adding hacks similar to the sc7180 hack
> > > for all the other SoCs. I guess we could hope we get lucky or play
> > > whack-a-mole? ...or we try to find a more generic solution... Dunno
> > > what others think.
> >
> > I think we should hope to get lucky or play whack-a-mole and merge
> > something like this series. If we have to we can similarly turn off RCGs
> > or branches during driver probe that are using shared parents like we
> > have on sc7180.
> >
> > Put simply, the shared RCG implementation is broken because it reports
> > the wrong parent for clk_ops::get_parent() and doesn't clear the force
> > enable bit. With the current code we're switching the parent to XO when
> > the clk is enabled the first time. That's an obvious bug that we should
> > fix regardless of implementing proper clk handoff. We haven't
> > implemented handoff in over a decade. Blocking this bug fix on
> > implementing handoff isn't practical.
>
> Yes, that needs to be fixed. My approach was to drop the XO parent and
> consider the clock to be off if it is fed by the XO.
>
> > Furthermore, we're relying on clk
> > consumers to clear that force enable bit by enabling the clk once. That
> > doesn't make any sense, although we could use that force enable bit to
> > consider the RCG as enabled for clk_disable_unused.
>
> That patch seems fine to me. Will it work if we take the force-enable
> bit into account when considering the clock to be on or off?

What is "that patch"?

It would work to consider the rcg clk as on or off. During rcg clk
registration if a branch child is found to be enabled we would go and
write the force enable bit in the parent rcg. And similarly we would
modify the rcg clk_ops to set that bit whenever the clk is enabled and
clear it whenever it is disabled. This avoids the feedback mechanism
from confusing us about the enable state of the rcg, at the cost of
writing the register.

It wouldn't fix the problem that we have on Trogdor though. That's
because the display GDSC is turned off when the rotator clk is enabled
and parented to the display PLL, which is also turned off. We have to
either turn off the rotator clk, or switch the parent to something that
is always on, XO, or keep the display GDSC on until the rotator clk can
be turned off. On other SoCs we may need to turn off even more clks
depending on which ones the display GDSC is controlling.

>
> >
> > An alternative approach to this series would be to force all shared RCGs
> > to be parented to XO at clk registration time, and continue to clear
> > that RCG force enable bit. That's sort of what Dmitry was going for
> > earlier. Doing this would break anything that's relying on the clks
> > staying enabled at some frequency through boot, but that isn't supported
> > anyway because clk handoff isn't implemented. It avoids the problem that
> > the first patch is for too because XO doesn't turn off causing a clk to
> > get stuck on. I can certainly craft this patch up if folks think that's
> > better.
>
> I think this approach makes sense too (and might be preferable to
> boot-time hacks).
> On most of the platforms we are already resetting the MDSS as soon as
> the mdss (root device) is being probed. Then the display is going to
> be broken until DPU collects all the coonectors and outpus and finally
> creates the DRM device.

Ok. I'm leaning towards this approach now because it seems like keeping
the clk at whatever it was set at boot isn't useful. If it becomes
useful at some point we can implement a better handoff mechanism. I have
some idea how to do that by using the 'clocks' DT property to find child
clks that haven't probed yet. I'll test out this alternate approach to
park shared clks at probe and send the patch.

>
> But I think we should fix the get_parent() too irrespectively of this.
>

Sure, but it becomes sorta moot if we force the parent to be XO.
