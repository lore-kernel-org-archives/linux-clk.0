Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B93D3B19B2
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 20:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779826463; cv=pass; b=XbNvt6Cw5bm+HAo+C/BXWl+MUmeaqzCfIkX87bCCLdg1U8vs6042wSR7iJdOtjkcqLplqw7bD3XUiM9qRmiAjC3na0XXn49qbx3Ef/iM/uNaH98oBQlIpNaPGtuHbMdOn+76omcZfGcrL28V766KB/9R29xhLiuGkTDB0c4k5MI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779826463; c=relaxed/simple;
	bh=J4V7ZgMjFvrHEHMyj8qmM4bQ1yciY6SbTFCVAhWaYe4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IezaRaVe0Uk7zqqIvItmGF0wy4ycJDRqfCENIE9goaDGNm1Ik3puvq4kqP7q+IJnrRcXOh0GYfG7dFeHc+CAETzTMIEcLI/Wze6qTD7iqIEKzWFfnT+LQaA5Nbp6YmMZycedW28WP9qioft1W5vqXYFz560jap6h44yjuOZReZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GXMVIWRY; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GXMVIWRY"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-30246cfd41aso552778eec.1
        for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 13:14:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779826461; cv=none;
        d=google.com; s=arc-20240605;
        b=Yg8V/QPGORwnwO61YGvCEqM3LbYIb8wXFdf+M3MAd+YmFKVQyOFe+bKwv0ittWT8GP
         UIY27fjbQuVZ5pZFsLbwGqKlmXJoxKYGvETibYoYr4Ft3yUJyfftm1mOwI6ertnaBZ6M
         +QvRusRu/6l9oddQhqITUnmX6Z9wSmcdjMsieFwepjyWqQ9OEe3SvP9YiSvmWRnCjg0m
         pecn86RPalH4YFfS2X7ogxuKwKrpElKUa8v/pK3AUYtGWfcZAmxQ7LG4zc1slPqoopaO
         nj2B7UIzMkU7e3o6+Xu6pob3weHMvuF0K5QIZgHGZUFWbVJRqdDtPivPcvfLPuSEZ5ql
         Hgbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VZ3t+++vDT0mqn5QWBKe70lbtfqlZnfwF6ri5WiNYtw=;
        fh=UpLp2/luioFuwCiqO4sXuWG9//BuFW9SlvIkKk0Bvz0=;
        b=iThUdnRsIVQxcmXggTmkkHW6Eu+gd1gJCI8w/PGW96YlmkvYS0go5ViURPHbtkzTHQ
         xXoQsMwCe1o9aSmwyRNI42uVAG1T0cS0t3vO8W5wZinpZJRyQbkT032WAkZKXhYDwtGj
         Qs7M8oYR18QGZBwjkSEc5SaFia2YYOIReOXPUDpnOFKF6pUhIVh1ylQ84ZrxV6yQnFZ2
         vx3wpXMocxwlw0GIvJ9Lj102KSh+e7AocGBY1RxA1emYzVyb7TMxDaRaleuHujC/zDjm
         Zr0dT/lr6wTjzOUWFWmheFmE/Eq6kNaWxF+f+3vvsmUjMpicFPJ91A6UjGxnZN8oWpCJ
         8pFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779826461; x=1780431261; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZ3t+++vDT0mqn5QWBKe70lbtfqlZnfwF6ri5WiNYtw=;
        b=GXMVIWRY5okaQ5Ia/5gyPwL1ogaXCKdsdWs8Kiu+ZYuHofMy50rw6R5Pfp5A//jx6d
         N3ZXHu5P+PpoJdV37qbkH3O6Z8EXFD1ZuaViqQD/+7PdayyoVZkl+6B911qIhtt8gDPy
         F9FbuX7o8PZrwnUBUchv+NBJt/riMPZzrQdtswU6cId4YrqSQA7FXNg4XpGcdyaleh4c
         Pzv3I3f3bCb/D8EKkoZAC7TCSNWuvpBfHYN9ROlEOKJY2esQAjKyg5OjRVaGTIQdvvRG
         P3UpVt/oEERH6975DCCdU4zGXxaA/4jYduBRRD5xV3f+eatC9tRlDmoUrHhcKyVVrg/v
         560A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779826461; x=1780431261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VZ3t+++vDT0mqn5QWBKe70lbtfqlZnfwF6ri5WiNYtw=;
        b=iD1OKeLEHLu0Z17Pz1NGamQGkJ+ExnsPqQCY66Lk+3haShCo2W39zMBJF9jfbsV4oH
         ezw3EKegQrVERs9IGIaruoauqrG22wxMZuGnDHh8PiDSJscvsQRYYLTUu+WHNjj97c+Q
         J+bmZzkGDlY7OBuggv+B+j63V1FDH+oH0q+T6Fa0dZjXM0i9Ao6smNOr8cSXLI/j+Z7U
         3edqvdpClQ/VZumeHZbQ5LbR84s85qGKMrttiSjZ3PeHD72t5jYlj5xam8T/tgKnqKcB
         ERkXx82cR3rrkAPPwdGVTbkLBT9f+T0cZH47B8lS/gVWchLS+pvpSYb95/TqkxmCSq6q
         Hm7Q==
X-Forwarded-Encrypted: i=1; AFNElJ/s9kYOUOK3S1nQD1qZB+YnS9VC/nFKi7pyFpUajd4IgKkAWbTAhyBSumUIPIEAgI+r8727eZ3JmQs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVwBX8C0ACWffbZF8PdgT9xXPPVwnxDb9qMvBB2ixmUEq9zkWO
	E8Tc+79TKqQ5eroeM2yjAxo5MP/YwFWLF4sUGRL1JxpHY48L3KyMBQbgfB5t+OtNAnCYNoUdUSO
	6nfmXm+V6RyZ3kZtYYIqaWGFq4aDGKNdlCqmSwFI=
X-Gm-Gg: Acq92OE6XEZZJ2S5DQiOlaau7o0Wa4zPi0+HhwkJL3YNxjXJF8qAWnzMggLZAF7H4Gb
	8N0Pk84ZUNHOjOjk/3fbS9Hhfp4NjcbActgHVF5ELDpm6TkeFBQ3aJsrIvFcZpm+V3/T2pdLwyG
	qonSwHmbEr58PjvRpaDbEfIQqYJjI+HFBtJFhdtLOucrnTFgaHqBEVgjdlxMfK3l3FkKea3TI3b
	V0h7+GmEEhHU6dMaDT0lL6pOJ54itxL/IgMSNNtbRPW+dEFM5Byy0dB+3pUujXb/3WPsmB1Kf+F
	czKJ9Nc5KE3bdxQtiPctKBkFnpGdEA6tn6yf+bDuGQoW8yHXjn9eHFsithWXxJzn82sCTCX29BC
	fjIHxe1C8M/pkMG5Gx0auF62nivZ9os5o/Kj9Vv6AOkks/g==
X-Received: by 2002:a05:7022:ea21:b0:12d:de3f:d845 with SMTP id
 a92af1059eb24-1365fd7e885mr10177418c88.40.1779826460829; Tue, 26 May 2026
 13:14:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <DISNUOIOA8JK.2K904WSZH2X9T@ubuntu.com>
In-Reply-To: <DISNUOIOA8JK.2K904WSZH2X9T@ubuntu.com>
From: John Stultz <jstultz@google.com>
Date: Tue, 26 May 2026 13:14:08 -0700
X-Gm-Features: AVHnY4IGWC4JoNuY6D_CojKSx8AD2_1SmbgZiD_kYpYWC2sVJtmzEPcsNoZRvQ8
Message-ID: <CANDhNCq8W0tY4EMWo5987+CP_LJJ8f1FQrn8zGQvmLc0hTFCiA@mail.gmail.com>
Subject: Re: [RFC] Timekeeping for other planets
To: Joshua Peisach <jpeisach@ubuntu.com>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 6:59=E2=80=AFAM Joshua Peisach <jpeisach@ubuntu.com=
> wrote:
>
> For a while I've thought about timekeeping on other planets. If humans
> ever make it to other planets, there will likely be other systems for
> keeping track of time, because the length of a day is not the same
> across all planets. Mars, for example, has a longer day than Earth.
> There are some proposed systems for timekeeping on Mars, the most
> interesting one being the Darian calendar system[1], but there are
> things like "Mars Sol Date" and Coordinated Mars Time (MTC).
>
> So my internal, curious and enthusiastic personality lead me to try
> making a C library that would try to handle time and date conversions
> for other planets. But it actually gets quite difficult and confusing,
> because (to save you the time and story) there ends up being "so what is
> an Earth second and what is a Mars second"?
>
> Now that I've made some kernel contributions (I still consider myself a
> newbie), I think about how there may actually be good reasons for trying
> to handle non-Earth times in the kernel, compared to the silly people
> like me having their timekeeping systems in userspace. For example,
> things like log timestamps. A machine that is running Linux on another
> planet (I know, it's ambitious, but humor me), will report events in
> terms of seconds. But, that's in terms of Earth seconds. For humans, it
> would make sense to use a time system that applies to Mars for its own
> calendars. So if someone is reading the logs and they see "one million
> seconds", how would they know exactly when the message occurred? One
> million Earth seconds does not equate to one million Mars seconds.
>
> (I try not to think about the "how long is a second" thing..)
>
> My point is, if humans adopt timekeeping systems for other planets,
> there may (or may not?) be a good reason for the kernel to keep track
> of time outside of Earth.
>
> Now, I am being ambitious, very optimistic, and potentially delusional
> for thinking that people would want to use other timekeeping systems in
> other planets, and still have Linux be around in the far future, and
> choose to have timekeeping in the kernel instead of in userspace. But,
> I know I'm not the only person interested in this topic. There is NASA's
> Mars24 Sunclock[2] which does track time in terms of hours, minutes and
> seconds, but at the rate that it does on Mars.
>
> So, the problem: There is currently no way to handle or provide
> timekeeping on other planets, aside from conversions. But maybe that
> should only stay in userspace. The users affected: well, as of writing,
> astronomers and space enthusiasts, looking to track events and time
> using other planetary timekeeping systems and calendars.
>
> I admittedly don't know much about timekeeping in the kernel, but there
> are functions for atomic time, which could actually get some use!

Appreciate your interest!  When adding functionality to the kernel, we
do have to ask what is the benefit gained from moving logic into the
kernel if it could otherwise be done from userland.  Logic we add to
the kernel that has uABI visibility requires indefinite maintenance,
potentially introduces bugs, etc. So there has to be a clear benefit
to do so.

For the most part, timezone handling is already dealt with in
userland, so it seems like using CLOCK_TAI + similar userland handling
would be the a reasonable approach to what you want without having to
add more complexity to the kernel.

thanks
-john
