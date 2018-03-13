Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: rockchip: Restore the clock phase after the rate was changed
Date: Tue, 13 Mar 2018 14:54:56 +0100
Message-ID: <2637424.pcYNiY109b@diego>
In-Reply-To: <1520560263-123065-1-git-send-email-shawn.lin@rock-chips.com>
References: <1520560263-123065-1-git-send-email-shawn.lin@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
List-ID: <linux-clk.vger.kernel.org>

Am Freitag, 9. M=E4rz 2018, 02:51:03 CET schrieb Shawn Lin:
> There are many factors affecting the clock phase, including clock
> rate, temperature, logic voltage and silicon process, etc. But clock
> rate is the most significant one here, and the driver should be aware
> of the change of the clock rate. As mmc controller need a fixed phase
> after tuning was completed, at least before explicitly doing re-tune,
> so this patch try to restore the clock phase by monitoring the event
> of rate change.
>=20
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>

applied for 4.17


Thanks
Heiko
