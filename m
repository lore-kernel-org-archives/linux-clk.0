Return-Path: <swarren@wwwdotorg.org>
Subject: Re: CLK_OF_DECLARE advice required
To: Phil Elwell <phil@raspberrypi.org>
References: <ae427c15-330f-6f8d-e2ac-62a8deacbdc5@raspberrypi.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
 linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Eric Anholt <eric@anholt.net>
From: Stephen Warren <swarren@wwwdotorg.org>
Message-ID: <8b65e551-e6dd-cf5c-1b22-e1f1a5996d73@wwwdotorg.org>
Date: Wed, 31 May 2017 09:27:07 -0600
MIME-Version: 1.0
In-Reply-To: <ae427c15-330f-6f8d-e2ac-62a8deacbdc5@raspberrypi.org>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 05/30/2017 06:23 AM, Phil Elwell wrote:
> Hi,
> 
> I've run into a problem using the fixed-factor clock on Raspberry Pi and I'd
> like some advice before I submit a patch.
> 
> Some context: the aim is to use a standard UART and some external circuitry
> as a MIDI interface. This would be straightforward except that Linux doesn't
> recognise the required 31.25KHz as a valid UART baud rate. Rhe workaround is
> to declare the UART clock such that the reported rate differs from the actual
> rate. If one sets the reported rate to be (actual*38400)/31250 then
> requesting a 38400 baud rate will result in an actual 31250 baud signal.

This sounds like the wrong approach. Forcing the port to use a different 
clock rate than the user requests would prevent anyone from using that 
port for its standard purpose; it'd turn what should be a runtime 
decision into a compile-time decision.

Are you sure there's no way to simply select the correct baud rate on 
the port? I see plenty of references to configuring custom baud rates 
under Linux when I search Google, e.g.:

> https://stackoverflow.com/questions/12646324/how-to-set-a-custom-baud-rate-on-linux
"How to set a custom baud rate on Linux?"

> https://sourceware.org/ml/libc-help/2009-06/msg00016.html
"Re: Terminal interface and non-standard baudrates"
