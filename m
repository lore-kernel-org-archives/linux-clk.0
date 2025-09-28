Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FC41E8329
	for <linux-clk@vger.kernel.org>; Sun, 28 Sep 2025 20:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759092963; cv=none; b=YtGKpe/y5mIW915PECjF50UE5KNxKnPdWq8rX05PwitwcH/d5EHxZ0A2+Ggg1aOsHo+KLS/AZEyrNTUxsKWZaYR9VaTU8PWXdzFwbyFN1T6CrMgv5rZyHK/Jl/mQkJAoQ5MkgG9Qqn7DhFTJf+E5zx599d6RofegybhA7ZOfAe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759092963; c=relaxed/simple;
	bh=c6JNU7cxtn4GGl1RKmZ+N+dQYleaxUy2TWlL0Y8HPys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dhUDw0EaEgdXTz3a4jjO/4gpzH+QAdO4Ym/NBZXw/IJgiyQ0zbWYuiBEPofA/mmIkf9l0Z72hSGgApSaGTnAyn/Ofus4/I0oJwH6vB76f2BexL5UL5Ocr9XjBvZQ02D6W8upHR0RfmH3MwtBjesU4F6XH8h92EF5AvVYc+ft1dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=UsiuXEBp; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="UsiuXEBp"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-27a6c3f482dso30855085ad.1
        for <linux-clk@vger.kernel.org>; Sun, 28 Sep 2025 13:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1759092961; x=1759697761; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UiGIGqDPqEAG/fx/GyBcjXyYsr3F4pTYCf0xPL9HStc=;
        b=UsiuXEBpTnHMW5N7NOplrywx1l911vxXDeqAL3geeba6p9IC4s9wkTWPx9xrywv8xK
         +zAHP5WannZsT+PppriC9in0EOooSmdX28a6Q6VWdCp1yq33GlxvQa+rWr79J4vWDT+5
         WOO0diAo06ptXUj9YheOMR0hs+Hbj+PSrMsczFjrsq9W3XcH7onMYkqh4pFkS+mHuPhJ
         PjdUs+F3ADztkOjfpljlWlF5BMH9urucsZuEBQ3flahOvAzmiWfmE+H56ebxYxAZ1PdK
         O0EwbOXWA5Kg9eRHrv8dsDbKdAW8J9Zz11Ead/4darMkPFEsZeQ78eYTR83pFHMZROPH
         D6gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759092961; x=1759697761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UiGIGqDPqEAG/fx/GyBcjXyYsr3F4pTYCf0xPL9HStc=;
        b=L4rjflPMhbfzLGgi8AL4XqoI22WNPRdxEbVlQUtx75DF7cKDNrLhDGTXFY1YFz07n4
         Pdo55Zez2kVKQyhU2Zt0iKXO6nP7t5CrdUiIfxM1MOvpdHecguo42rNlNmPBd5fNLAUK
         mH6Jk6I+tTUtD/sk2EwVRGF7F7LX8Z+QRmdPOiLCqsi51ltbeQLl4plITn517MkpR+03
         HXOlsKNZ4q/M/MmrDNU+bd5n/44LPRzCHRC659TSgIUOqnTUMzbywZsrg/WEmZnTj1Zv
         kBuReLbMG+IFLBKvxxb+fjNX8q1Rd9Nt4PFTw5i+tJX28hKAxbJPo4rkC6Vyt9J0yN85
         v0ug==
X-Forwarded-Encrypted: i=1; AJvYcCVuNwtX7AnocIsx6kmJwM1xtrW4M0+zQ9dnTLGv1SudkoU7uX7/+4p1rcM0VPSTwvsoEn8+3mkZvCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsyjsAGPFKBxnJVA/s69xVdB5lXUstCGUoTKdhQH5JXtZD9Kr4
	USZtO5H8we92ZNQREz9ixe2JwGjrLsQD7gB8cfO6O5J9q9TRTyQ70hqf6MJFIEazMqTT1db2ZqE
	8UchiEIf4g0r0bjOdgqWZlS6J4rxRdJQ=
X-Gm-Gg: ASbGncttcaMLHnu30qGM3ivvREVLwzI4NuoetSCRsDfe7iBwAyMt3l/QWSBCRQDgqUw
	dkqaZWMaTwWtnfdLI7QXFqjoikF5Gn5SV30m3G7sRCEdHhILhwOeBD4knVlPpxi65G4FiPcQ3e3
	SA51/057zGdeWqn2yn33DEwkXwNO8UB3bnO70LEnJbI0Azs26/D4xkyhUEiM/TpH9W6evW4XXGD
	834mQwLaNRRuT+ZGFsDHELov5CR+o9p3LcFB0bDSAjKF5nAKiA=
X-Google-Smtp-Source: AGHT+IF7c1Vuxskwry28TIxl0fMtYzqbtx+tBLSfDt71UAkuiIb3LaxfXzXjmqXnRcWpmOVNDKsjmYs5K4EhIxamz+w=
X-Received: by 2002:a17:903:22cc:b0:248:ff5a:b768 with SMTP id
 d9443c01a7336-27ed4a29f9amr152736995ad.10.1759092961471; Sun, 28 Sep 2025
 13:56:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240929-fix_glitch_free-v1-0-22f9c36b7edf@amlogic.com>
 <20240929-fix_glitch_free-v1-2-22f9c36b7edf@amlogic.com> <CAFBinCBd5-s6vaBoJNerXavQiHgsv4Fm3v0svUX7geL=kJvVYg@mail.gmail.com>
 <20178015-4075-40e9-bbf4-20ae558c2bef@amlogic.com> <1jldyzrv2t.fsf@starbuckisacylon.baylibre.com>
 <e70e9aaa-f448-4f67-9149-cb5970c9bbd6@amlogic.com> <9834c7c5-9334-4c78-a2fe-588ff03cf935@amlogic.com>
In-Reply-To: <9834c7c5-9334-4c78-a2fe-588ff03cf935@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 28 Sep 2025 22:55:50 +0200
X-Gm-Features: AS18NWCJbZWjP8ynFS6Veu9yFpZpvyV0QmDxpZo6qHFoQpkPGQRYQgKjOrmkB50
Message-ID: <CAFBinCCoX5+6+KQAtbhKx9KdSZhXVxS=cz8DfMVhjPX1c0iSPw@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: meson: Fix glitch free mux related issues
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Sun, Sep 28, 2025 at 8:41=E2=80=AFAM Chuan Liu <chuan.liu@amlogic.com> w=
rote:
>
>
> On 9/28/2025 2:05 PM, Chuan Liu wrote:
> > Hi Jerome & Martin:
> >
> > Sorry for the imprecise description of the glitch-free mux earlier.
> >
> > Recently, while troubleshooting a CPU hang issue caused by glitches,
> > I realized there was a discrepancy from our previous understanding,
> > so I'd like to clarify it here.
[...]
> An example of the clock waveform is shown below:
>
>
>         __    __    __    __    __    __    __    __
> ori:  =E2=86=91  |__=E2=86=91  |__=E2=86=91  |__=E2=86=91  |__=E2=86=91  =
|__=E2=86=91  |__=E2=86=91  |__=E2=86=91  |__=E2=86=91
>                    ^
>                    1 * cycle original channel.
>         _   _   _   _   _   _   _   _   _   _   _   _
> new:  =E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=
=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91=
 |_=E2=86=91
>                                        ^
>                                        5 * cycles new channel.
>         __    __                        _   _   _   _
> out:  =E2=86=91  |__=E2=86=91  |______________________=E2=86=91 |_=E2=86=
=91 |_=E2=86=91 |_=E2=86=91 |_=E2=86=91
>               ^                        ^
>               start switching mux.     switch to new channel.
Thank you for the detailed report!
This is indeed problematic behavior. I guess the result is somewhat
random: depending on load (power draw), silicon lottery (quality),
temperature, voltage supply, ... - one may or may not see crashes
caused by this.

Based on the previous discussion on this topic, my suggestion is to
split the original patch:
- one to add CLK_SET_RATE_GATE where needed (I think the meson8b.c
driver already has this where needed) to actually enable the
glitch-free mux behavior
- another one with the CLK_OPS_PARENT_ENABLE change (meson8b.c would
also need to be updated) to prevent the glitch-free mux from
temporarily outputting an electrical low signal. Jerome also asked to
document the behavior so we don't forget why we set this flag

Both patches should get the proper "Fixes" tags.
I think it would also be great if you could include the waveform
example in at least the commit message as it helps understand the
problem.

Let's also give Jerome some time to comment before you send patches.


Best regards,
Martin
