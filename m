Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57FF3BE629
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 13:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779803981; cv=none; b=q/GYQEmk/kAzeAixCenqHEW5CtG3i/LHvjXdOIq/+LPHhE844fKFuv/LJIY9O14wXoS3xKSAxZwP4KhXLc88wRbWZfL7XTqCMquKyp29l8kujGl3P2DOsaZXN22t0LIzbyEDTExJ6R9cqSRCT5LlyaCov2zp29Tlpdpxa/8CoYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779803981; c=relaxed/simple;
	bh=DaLbFcI+lM/MrKE6a75OHPZHts0DYRg5QLcbLfyB5us=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To; b=nd8sn9wr18wnAsO27i5ycBRHzsEHwNWT4kasSU8dCzRMvDjq5S+Ugv7VA8qFupoAbBD7L9HpAu4oGusaLN5Qnq2H6DS/9UFI0tNdZjERZaqRvW/S6xZ8UZRxcAFf3lntL6tjPP5QtlUD28gEhX+NnozjZcfZodchugQYoc+2HtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com; dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b=RKmV4oXw; arc=none smtp.client-ip=121.127.44.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b="RKmV4oXw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com; h=To:
 From: Subject: Message-Id: Date: Content-Type: Content-Transfer-Encoding:
 Mime-Version; q=dns/txt; s=fe-953a8a3ca9; t=1779803973;
 bh=DaLbFcI+lM/MrKE6a75OHPZHts0DYRg5QLcbLfyB5us=;
 b=RKmV4oXw2p0BImdB+Fwro0TEXPq/xipz4HL0x8D8zQEJLKcr0CSf+KsfBft0Vr4tcHenjSk0R
 q8L3N/tj3aPU6GsU1MrWNXS4SYbewL7E7FmOtYnKEVPM9i+WI6SYzFKtidDFvnOG4T8Rl6Uwilp
 a2R4yAaEFS3WwtyYD7b7oc5rTQm4/Qbpscmc1e+SHHch3kS+NboHrSymnEvrEuQgalENMbNOU8f
 Ha3JgtDRJH0kebfNwxUlUaCKMB6x1EK+joEoluAsDee4Xt+qJwBfYXU7WdEdqwJeT2Cl8ID/2hg
 u3HFtZ3VKLnjF9D/SH8qSgOM+Wob7tDmQ+dCtFVoWfFw==
X-Forward-Email-ID: 6a15a74331a45b28bf87669e
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.8.15
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Tue, 26 May 2026 09:59:30 -0400
Message-Id: <DISNUOIOA8JK.2K904WSZH2X9T@ubuntu.com>
Subject: [RFC] Timekeeping for other planets
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: <linux-kernel@vger.kernel.org>, "John Stultz" <jstultz@google.com>,
 "Thomas Gleixner" <tglx@kernel.org>, "Stephen Boyd" <sboyd@kernel.org>,
 <linux-clk@vger.kernel.org>
X-Mailer: aerc 0.21.0

Hi all,

For a while I've thought about timekeeping on other planets. If humans
ever make it to other planets, there will likely be other systems for
keeping track of time, because the length of a day is not the same
across all planets. Mars, for example, has a longer day than Earth.
There are some proposed systems for timekeeping on Mars, the most
interesting one being the Darian calendar system[1], but there are
things like "Mars Sol Date" and Coordinated Mars Time (MTC).

So my internal, curious and enthusiastic personality lead me to try
making a C library that would try to handle time and date conversions
for other planets. But it actually gets quite difficult and confusing,
because (to save you the time and story) there ends up being "so what is
an Earth second and what is a Mars second"?

Now that I've made some kernel contributions (I still consider myself a
newbie), I think about how there may actually be good reasons for trying
to handle non-Earth times in the kernel, compared to the silly people
like me having their timekeeping systems in userspace. For example,
things like log timestamps. A machine that is running Linux on another
planet (I know, it's ambitious, but humor me), will report events in
terms of seconds. But, that's in terms of Earth seconds. For humans, it
would make sense to use a time system that applies to Mars for its own
calendars. So if someone is reading the logs and they see "one million
seconds", how would they know exactly when the message occurred? One
million Earth seconds does not equate to one million Mars seconds.

(I try not to think about the "how long is a second" thing..)

My point is, if humans adopt timekeeping systems for other planets,
there may (or may not?) be a good reason for the kernel to keep track
of time outside of Earth.

Now, I am being ambitious, very optimistic, and potentially delusional
for thinking that people would want to use other timekeeping systems in
other planets, and still have Linux be around in the far future, and
choose to have timekeeping in the kernel instead of in userspace. But,
I know I'm not the only person interested in this topic. There is NASA's
Mars24 Sunclock[2] which does track time in terms of hours, minutes and
seconds, but at the rate that it does on Mars.

So, the problem: There is currently no way to handle or provide
timekeeping on other planets, aside from conversions. But maybe that
should only stay in userspace. The users affected: well, as of writing,
astronomers and space enthusiasts, looking to track events and time
using other planetary timekeeping systems and calendars.

I admittedly don't know much about timekeeping in the kernel, but there
are functions for atomic time, which could actually get some use!

Anyways, I thought I'd share this idea and ask for opinions. I think
it's a fun idea.

[1]: https://en.wikipedia.org/wiki/Timekeeping_on_Mars
[2]: https://www.giss.nasa.gov/tools/mars24/

-Josh
