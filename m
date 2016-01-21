Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-yk0-f179.google.com ([209.85.160.179]:35216 "EHLO
	mail-yk0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751103AbcAUULC (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 21 Jan 2016 15:11:02 -0500
Received: by mail-yk0-f179.google.com with SMTP id s126so36794254ykf.2
        for <linux-clk@vger.kernel.org>; Thu, 21 Jan 2016 12:11:01 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAAObsKC1v--mZwkiG-c7P2Bwi2-_txbeqaW4Vd5h-noAVNbhjA@mail.gmail.com>
References: <1415087559-19444-1-git-send-email-kever.yang@rock-chips.com>
	<48806799.thBSifdUp8@diego>
	<54647142.4080800@rock-chips.com>
	<CAD=FV=Vzec3Qm-kc6zZ4VxSREoZbzVkWbzp-noHYdcEVrLYYSw@mail.gmail.com>
	<CAAObsKChYN5nmcm5OWnAzNRGDi_QGSoKvN+0FizhjeT-3mmeXQ@mail.gmail.com>
	<CAD=FV=Wgu=xQ9PcVqfzcedXVU3Rh-HKbBVxHuqgV9OZJEYhYvg@mail.gmail.com>
	<CAAObsKC1v--mZwkiG-c7P2Bwi2-_txbeqaW4Vd5h-noAVNbhjA@mail.gmail.com>
Date: Thu, 21 Jan 2016 12:11:00 -0800
Message-ID: <CAD=FV=VB93wYigRJ8wa8YL6P+Q+-fRokPiCB-Fo1pC_zAdh2oA@mail.gmail.com>
Subject: Re: [PATCH 0/5] clk: rockchip: add full support for HDMI clock on rk3288
From: Doug Anderson <dianders@chromium.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Kever Yang <kever.yang@rock-chips.com>,
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
	Mike Turquette <mturquette@linaro.org>,
	Sonny Rao <sonnyrao@chromium.org>,
	Addy Ke <addy.ke@rock-chips.com>,
	Eddie Cai <cf@rock-chips.com>,
	ZhenFu Fang <fzf@rock-chips.com>,
	Yakir Yang <ykk@rock-chips.com>,
	=?UTF-8?B?5aea5pm65oOF?= <yzq@rock-chips.com>,
	=?UTF-8?B?5oi05YWL6ZyWIChKYWNrKQ==?= <dkl@rock-chips.com>,
	Tao Huang <huangtao@rock-chips.com>,
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi,

On Thu, Jan 21, 2016 at 1:03 AM, Tomeu Vizoso <tomeu@tomeuvizoso.net> wrote:
> So we have a mechanism for detecting a conflict in the clock
> hierarchy, and a mechanism to solve it, but we are missing a way for
> userspace to communicate policy regarding which clocks should be given
> priority when solving such a conflict?

Hrmmm, I guess it could be userspace that makes the decision.  It does
seem a little odd to force it to userspace in all cases, though.  For
a particular laptop that is designed with a specific panel connected
up eDP it seems less than ideal to push this into userspace.  If the
kernel could just work in the expected sane way (or at least work that
way by default) it would be ideal.

If the kernel doesn't try to do anything sane by default then you're
creating a requirement for everyone's userspace to somehow figure this
out.  Do you expect there to be UI here, or that this would be
something that would be figured out by the Linux distribution?
Certainly exposing UI on something like a laptop with a builtin panel
wouldn't make any sense to me, but it might make sense if you had an
eval board with different display connectors on it.  If there's no UI,
would the Linux distribution need to somehow identify which board we
were on and then have a big lookup table about how to configure
things?
